@interface FCNewsletterManager
- (BOOL)canOptIntoIssues;
- (BOOL)canSubscribe;
- (BOOL)canSubscribeToNewsletter:(int64_t)a3;
- (BOOL)canUnsubscribe;
- (BOOL)enabled;
- (BOOL)includeBundleSubscribedVector;
- (BOOL)includeSportsVector;
- (BOOL)includeUserVector;
- (BOOL)isEligibleForIssues;
- (BOOL)isOptedIntoIssues;
- (BOOL)isSignedIntoEmailAccount;
- (BOOL)isSubscribed;
- (BOOL)shouldSubmitPersonalizationVector;
- (FCAppleAccount)appleAccount;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCCKPrivateDatabase)database;
- (FCCommandQueue)endpointCommandQueue;
- (FCNewsAppConfigurationManager)appConfig;
- (FCNewsletterEndpointConnection)endpointConnection;
- (FCNewsletterManager)initWithEndpointConnection:(id)a3 endpointCommandQueue:(id)a4 appleAccount:(id)a5 appConfig:(id)a6 userInfo:(id)a7 bundleSubscriptionManager:(id)a8 privateDataContext:(id)a9;
- (FCUserInfo)userInfo;
- (NFPromise)getWebTokenPromise;
- (NFPromise)updateSubscriptionPromise;
- (NSArray)cachedNewsletters;
- (NSDate)cacheExpiration;
- (NSDate)webTokenExpiration;
- (NSHashTable)observers;
- (NSString)activeiTunesAccountName;
- (NSString)cachedVector;
- (NSString)cachedWebToken;
- (double)cacheTimeout;
- (id)forceSubscriptionThen:(id)a3;
- (id)forceUpdateSubscription;
- (id)getWebToken;
- (id)updateSubscription;
- (int64_t)activeNewsletter;
- (int64_t)includeOptions;
- (int64_t)includeOptionsForNewsletter:(int64_t)a3;
- (int64_t)issueOptinStatus;
- (int64_t)subscription;
- (int64_t)subscriptionStatusForNewsletter:(int64_t)a3;
- (int64_t)updatedIncludeOptionsWithNewsletter:(int64_t)a3 includeOptions:(int64_t)a4;
- (void)activityObservingApplicationDidBecomeActive;
- (void)addObserver:(id)a3;
- (void)appleAccountChanged;
- (void)deletePersonalizationVector;
- (void)notifyObservers;
- (void)notifyObserversWithPreviousSubscription:(int64_t)a3;
- (void)optIntoSports;
- (void)optOutOfIssues;
- (void)optOutOfSports;
- (void)removeObserver:(id)a3;
- (void)resetCaches;
- (void)saveToCloudKitSubscribedChannels:(id)a3;
- (void)setActiveiTunesAccountName:(id)a3;
- (void)setCacheExpiration:(id)a3;
- (void)setCachedNewsletters:(id)a3;
- (void)setCachedVector:(id)a3;
- (void)setCachedWebToken:(id)a3;
- (void)setGetWebTokenPromise:(id)a3;
- (void)setIncludeOptions:(int64_t)a3;
- (void)setSubscription:(int64_t)a3;
- (void)setUpdateSubscriptionPromise:(id)a3;
- (void)setWebTokenExpiration:(id)a3;
- (void)submitPersonalizationVector:(id)a3 subscribedBundleChannelIDs:(id)a4;
- (void)subscribeFromPrivacyModalCTA;
- (void)subscribeFromPrivacyModalCTAWithCompletion:(id)a3;
- (void)subscribeTo:(int64_t)a3;
- (void)subscribeTo:(int64_t)a3 completion:(id)a4;
- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4;
- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4 completion:(id)a5;
- (void)unsubscribe;
- (void)updateCacheWithNewsletterString:(id)a3 includeArray:(id)a4 newsletters:(id)a5;
@end

@implementation FCNewsletterManager

- (BOOL)isOptedIntoIssues
{
  return ((unint64_t)[(FCNewsletterManager *)self includeOptions] >> 1) & 1;
}

- (int64_t)includeOptions
{
  return self->_includeOptions;
}

- (BOOL)isSubscribed
{
  return (self->_subscription & 0xFFFFFFFFFFFFFFFELL) == 2;
}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v11 = v9;
  if (a2)
  {
    [*(id *)(a1 + 32) updateCacheWithNewsletterString:a2 includeArray:a3 newsletters:a4];
    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (objc_msgSend(v9, "fc_hasErrorCode:", 32)) {
      [*(id *)(a1 + 32) resetCaches];
    }
    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
}

- (void)activityObservingApplicationDidBecomeActive
{
  id v2 = [(FCNewsletterManager *)self updateSubscription];
}

- (id)updateSubscription
{
  if (![(FCNewsletterManager *)self enabled])
  {
    v8 = self->_updateSubscriptionPromise;
    goto LABEL_5;
  }
  v3 = self;
  objc_sync_enter(v3);
  [(NSDate *)v3->_cacheExpiration timeIntervalSinceNow];
  if (v4 < 0.0)
  {
    v5 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v6 = [v5 dateByAddingTimeInterval:60.0];
    cacheExpiration = v3->_cacheExpiration;
    v3->_cacheExpiration = (NSDate *)v6;

    objc_sync_exit(v3);
    v8 = [(FCNewsletterManager *)v3 forceUpdateSubscription];
LABEL_5:
    id v9 = v8;
    goto LABEL_7;
  }
  id v9 = v3->_updateSubscriptionPromise;
  objc_sync_exit(v3);

LABEL_7:
  return v9;
}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_3(uint64_t a1)
{
  id v2 = [FCGetNewsletterSubscriptionOperation alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_4;
  v6[3] = &unk_1E5B5B510;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  v5 = [(FCGetNewsletterSubscriptionOperation *)v2 initWithEndpointConnection:v4 completion:v6];
  [(FCGetNewsletterSubscriptionOperation *)v5 performOperation];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNewsletterManager *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)appleAccountChanged
{
  uint64_t v3 = [(FCAppleAccount *)self->_appleAccount iTunesAccountName];
  id v4 = v3;
  if (v3 != self->_activeiTunesAccountName && !-[NSString isEqualToString:](v3, "isEqualToString:"))
  {
    id v5 = FCNewsletterLog;
    if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Newsletter Manager: account changed, resetting caches", v7, 2u);
    }
    [(FCNewsletterManager *)self resetCaches];
  }
  id v6 = [(FCNewsletterManager *)self forceUpdateSubscription];
}

- (id)forceUpdateSubscription
{
  if ([(FCNewsletterManager *)self enabled])
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    id v4 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_2;
    v9[3] = &unk_1E5B4EEF0;
    v9[4] = v3;
    uint64_t v5 = [v4 initWithResolver:v9];
    updateSubscriptionPromise = v3->_updateSubscriptionPromise;
    v3->_updateSubscriptionPromise = (NFPromise *)v5;

    id v7 = v3->_updateSubscriptionPromise;
    objc_sync_exit(v3);
  }
  else
  {
    v9[5] = MEMORY[0x1E4F143A8];
    v9[6] = 3221225472;
    v9[7] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke;
    v9[8] = &unk_1E5B4E758;
    v9[9] = self;
    id v7 = self->_updateSubscriptionPromise;
  }
  return v7;
}

- (FCNewsletterManager)initWithEndpointConnection:(id)a3 endpointCommandQueue:(id)a4 appleAccount:(id)a5 appConfig:(id)a6 userInfo:(id)a7 bundleSubscriptionManager:(id)a8 privateDataContext:(id)a9
{
  id v16 = a3;
  id v56 = a4;
  id v17 = a5;
  id v55 = a6;
  id v54 = a7;
  id v53 = a8;
  id v18 = a9;
  v58.receiver = self;
  v58.super_class = (Class)FCNewsletterManager;
  v19 = [(FCNewsletterManager *)&v58 init];
  v20 = v19;
  if (v19)
  {
    v51 = v17;
    id v52 = v16;
    objc_storeStrong((id *)&v19->_endpointConnection, a3);
    objc_storeStrong((id *)&v20->_endpointCommandQueue, a4);
    objc_storeStrong((id *)&v20->_appleAccount, a5);
    objc_storeStrong((id *)&v20->_appConfig, a6);
    objc_storeStrong((id *)&v20->_userInfo, a7);
    objc_storeStrong((id *)&v20->_bundleSubscriptionManager, a8);
    v21 = [v18 internalPrivateDataContext];
    uint64_t v22 = [v21 privateDatabase];
    database = v20->_database;
    v20->_database = (FCCKPrivateDatabase *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v20->_observers;
    v20->_observers = (NSHashTable *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F81BF0]) initWithValue:v20];
    updateSubscriptionPromise = v20->_updateSubscriptionPromise;
    v20->_updateSubscriptionPromise = (NFPromise *)v26;

    v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v29 = [v28 objectForKey:FCNewsletterManagerSubscriptionKey];

    v30 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v31 = [v30 integerForKey:FCNewsletterManagerIncludeKey];

    v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v33 = [v32 objectForKey:FCNewsletterManagerNewslettersKey];

    id v57 = 0;
    v34 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v33 error:&v57];
    id v50 = v57;
    v35 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v36 = [v35 objectForKey:FCNewsletterManagerCacheAgeKey];

    v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v38 = [v37 objectForKey:FCNewsletterManagerCachedVectorKey];

    cachedWebToken = v20->_cachedWebToken;
    v20->_cachedWebToken = 0;

    uint64_t v40 = [MEMORY[0x1E4F1C9C8] distantPast];
    webTokenExpiration = v20->_webTokenExpiration;
    v20->_webTokenExpiration = (NSDate *)v40;

    if (v29)
    {
      id v42 = v29;
      if ([v42 isEqualToString:@"NONE"])
      {
        uint64_t v43 = 1;
      }
      else if ([v42 isEqualToString:@"NEWSLETTER"])
      {
        uint64_t v43 = 2;
      }
      else if ([v42 isEqualToString:@"PERSONALIZED_NEWSLETTER"])
      {
        uint64_t v43 = 3;
      }
      else
      {
        uint64_t v43 = 0;
      }
    }
    else
    {
      uint64_t v43 = 0;
    }
    v20->_subscription = v43;
    v20->_includeOptions = v31;
    if (v34)
    {
      v44 = v34;
    }
    else
    {
      v44 = [MEMORY[0x1E4F1C978] array];
    }
    cachedNewsletters = v20->_cachedNewsletters;
    v20->_cachedNewsletters = v44;
    id v17 = v51;

    if (v36)
    {
      [(FCNewsletterManager *)v20 cacheTimeout];
      objc_msgSend(v36, "dateByAddingTimeInterval:");
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v46 = };
    cacheExpiration = v20->_cacheExpiration;
    v20->_cacheExpiration = (NSDate *)v46;

    if (v38) {
      objc_storeStrong((id *)&v20->_cachedVector, v38);
    }
    v48 = [(FCAppleAccount *)v20->_appleAccount iTunesAccountName];
    [(FCNewsletterManager *)v20 setActiveiTunesAccountName:v48];

    [v51 addObserver:v20];
    id v16 = v52;
  }

  return v20;
}

- (void)resetCaches
{
  obj = self;
  objc_sync_enter(obj);
  obj->_subscription = 0;
  obj->_includeOptions = 0;
  uint64_t v2 = [MEMORY[0x1E4F1C978] array];
  cachedNewsletters = obj->_cachedNewsletters;
  obj->_cachedNewsletters = (NSArray *)v2;

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  cacheExpiration = obj->_cacheExpiration;
  obj->_cacheExpiration = (NSDate *)v4;

  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = v6;
  unint64_t v8 = obj->_subscription - 1;
  if (v8 > 2) {
    id v9 = @"UNKNOWN";
  }
  else {
    id v9 = off_1E5B5B5A0[v8];
  }
  [v6 setObject:v9 forKey:FCNewsletterManagerSubscriptionKey];

  v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v10 setInteger:obj->_includeOptions forKey:FCNewsletterManagerIncludeKey];

  id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:obj->_cachedNewsletters];
  v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v12 setObject:v11 forKey:FCNewsletterManagerNewslettersKey];

  v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 setObject:obj->_cacheExpiration forKey:FCNewsletterManagerCacheAgeKey];

  objc_sync_exit(obj);
}

- (BOOL)enabled
{
  uint64_t v2 = [(FCNewsAppConfigurationManager *)self->_appConfig possiblyUnfetchedAppConfiguration];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"news.onboarding.version.latest_completed"];

  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 integerForKey:@"news.onboarding.version.debug_latest_completed"];

  uint64_t v7 = v6 >= 0 ? v6 : v4;
  if (v7 >= 1) {
    BOOL v8 = [v2 newsletterSubscriptionType] != 0;
  }
  else {
LABEL_7:
  }
    BOOL v8 = 0;

  return v8;
}

- (void)setActiveiTunesAccountName:(id)a3
{
}

- (double)cacheTimeout
{
  uint64_t v3 = [(FCNewsAppConfigurationManager *)self->_appConfig possiblyUnfetchedAppConfiguration];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 86400.0;
  }
  uint64_t v5 = [(FCNewsAppConfigurationManager *)self->_appConfig possiblyUnfetchedAppConfiguration];
  [v5 newsletterSubscriptionStatusCacheTimeout];
  double v7 = v6;

  return v7;
}

void __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FCNewsletterManager_forceUpdateSubscription__block_invoke_3;
  block[3] = &unk_1E5B4E150;
  block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (int64_t)activeNewsletter
{
  if (![(FCNewsletterManager *)self enabled]) {
    return 0;
  }
  uint64_t v3 = [(FCNewsAppConfigurationManager *)self->_appConfig appConfiguration];
  int64_t v4 = [v3 newsletterSubscriptionType];

  return v4;
}

- (BOOL)canSubscribe
{
  int64_t v3 = [(FCNewsletterManager *)self activeNewsletter];
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0;
  }
  return [(FCNewsletterManager *)self canSubscribeToNewsletter:v3];
}

- (BOOL)canUnsubscribe
{
  return [(FCNewsletterManager *)self canSubscribeToNewsletter:1];
}

- (BOOL)includeUserVector
{
  return [(FCNewsletterManager *)self includeOptions] & 1;
}

- (BOOL)includeBundleSubscribedVector
{
  return ((unint64_t)[(FCNewsletterManager *)self includeOptions] >> 1) & 1;
}

- (BOOL)includeSportsVector
{
  return ((unint64_t)[(FCNewsletterManager *)self includeOptions] >> 2) & 1;
}

- (int64_t)subscriptionStatusForNewsletter:(int64_t)a3
{
  if (!a3) {
    return 0;
  }
  int64_t result = [(FCNewsletterManager *)self activeNewsletter];
  if (!result) {
    return result;
  }
  if ([(FCAppleAccount *)self->_appleAccount isUserSignedInToiCloud]
    && [(FCAppleAccount *)self->_appleAccount isPrimaryAccountEmailAddress])
  {
    if (!self->_subscription) {
      return 6;
    }
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = 4;
  }
  if (a3 == 2 && self->_subscription == 3) {
    return 5;
  }
  int64_t v7 = [(FCNewsletterManager *)self activeNewsletter];
  if (a3 != 1 && v7 != a3) {
    return 3;
  }
  if (self->_subscription == a3) {
    return 2;
  }
  return v6;
}

- (BOOL)canSubscribeToNewsletter:(int64_t)a3
{
  return (unint64_t)([(FCNewsletterManager *)self subscriptionStatusForNewsletter:a3]- 1) < 2;
}

- (BOOL)isEligibleForIssues
{
  int64_t v3 = [(FCNewsAppConfigurationManager *)self->_appConfig appConfiguration];
  int v4 = [v3 issuesNewsletterOptinEnabled];

  if (!v4
    || ![(FCAppleAccount *)self->_appleAccount isUserSignedInToiCloud]
    || ![(FCAppleAccount *)self->_appleAccount isPrimaryAccountEmailAddress])
  {
    return 0;
  }
  uint64_t v5 = [(FCBundleSubscriptionManagerType *)self->_bundleSubscriptionManager cachedSubscription];
  int64_t v6 = objc_getAssociatedObject((id)v5, (const void *)(v5 + 1));
  uint64_t v7 = [v6 unsignedIntegerValue];
  char v8 = v7;
  id v9 = objc_getAssociatedObject((id)v5, (const void *)~v7);
  BOOL v10 = (([v9 unsignedIntegerValue] + 1) ^ (v8 + 1)) & 1;

  return v10;
}

- (BOOL)isSignedIntoEmailAccount
{
  BOOL v3 = [(FCAppleAccount *)self->_appleAccount isUserSignedInToiCloud];
  if (v3)
  {
    appleAccount = self->_appleAccount;
    LOBYTE(v3) = [(FCAppleAccount *)appleAccount isPrimaryAccountEmailAddress];
  }
  return v3;
}

- (int64_t)issueOptinStatus
{
  BOOL v3 = [(FCNewsAppConfigurationManager *)self->_appConfig appConfiguration];
  int v4 = [v3 issuesNewsletterOptinEnabled];

  if (!v4) {
    return 3;
  }
  if (![(FCNewsletterManager *)self isSignedIntoEmailAccount]) {
    return 4;
  }
  uint64_t v5 = [(FCBundleSubscriptionManagerType *)self->_bundleSubscriptionManager cachedSubscription];
  int64_t v6 = objc_getAssociatedObject((id)v5, (const void *)(v5 + 1));
  uint64_t v7 = [v6 unsignedIntegerValue];
  char v8 = v7;
  id v9 = objc_getAssociatedObject((id)v5, (const void *)~v7);
  char v10 = ([v9 unsignedIntegerValue] + 1) ^ (v8 + 1);

  if ((v10 & 1) == 0) {
    return 6;
  }
  if (!self->_subscription) {
    return 0;
  }
  if (([(FCNewsletterManager *)self includeOptions] & 2) != 0) {
    return 2;
  }
  return 1;
}

- (BOOL)canOptIntoIssues
{
  return [(FCNewsletterManager *)self issueOptinStatus] == 1;
}

- (int64_t)updatedIncludeOptionsWithNewsletter:(int64_t)a3 includeOptions:(int64_t)a4
{
  int64_t v4 = a4 & 4;
  int64_t v5 = a4 | 1;
  if (a3 != 3) {
    int64_t v5 = a4;
  }
  if (a3 != 2) {
    int64_t v4 = v5;
  }
  if ((unint64_t)a3 >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v7 = [(FCNewsletterManager *)self enabled];
  if (!a3 || !v7) {
    return;
  }
  int64_t v8 = [(FCNewsletterManager *)self updatedIncludeOptionsWithNewsletter:a3 includeOptions:a4];
  id v9 = (void *)FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      char v10 = @"UNKNOWN";
    }
    else {
      char v10 = off_1E5B5B5A0[a3 - 1];
    }
    id v11 = (objc_class *)MEMORY[0x1E4F1CA48];
    v12 = v9;
    id v13 = objc_alloc_init(v11);
    v14 = v13;
    if (v8)
    {
      [v13 addObject:@"ARTICLES"];
      if ((v8 & 2) == 0)
      {
LABEL_9:
        if ((v8 & 4) == 0)
        {
LABEL_11:
          v15 = (void *)[v14 copy];

          id v16 = [v15 componentsJoinedByString:@"|"];
          int v26 = 138412546;
          v27 = v10;
          __int16 v28 = 2112;
          v29 = v16;
          _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Subscribing to newsletter [%@] options [%@]", (uint8_t *)&v26, 0x16u);

          goto LABEL_12;
        }
LABEL_10:
        [v14 addObject:@"SPORTS"];
        goto LABEL_11;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_9;
    }
    [v14 addObject:@"NEWSPLUS_CHANNELS"];
    if ((v8 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_12:
  id v17 = self;
  objc_sync_enter(v17);
  int64_t subscription = v17->_subscription;
  int64_t includeOptions = v17->_includeOptions;
  v17->_int64_t subscription = a3;
  v17->_int64_t includeOptions = v8;
  if (subscription != a3 || v8 != includeOptions) {
    -[FCNewsletterManager notifyObserversWithPreviousSubscription:](v17, "notifyObserversWithPreviousSubscription:");
  }
  objc_sync_exit(v17);

  v20 = [FCNewsletterSubscribeCommand alloc];
  if ((unint64_t)a3 > 3) {
    v21 = @"UNKNOWN";
  }
  else {
    v21 = off_1E5B5B5A0[a3 - 1];
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = v22;
  if (v8) {
    [v22 addObject:@"ARTICLES"];
  }
  if ((v8 & 2) != 0) {
    [v23 addObject:@"NEWSPLUS_CHANNELS"];
  }
  if ((v8 & 4) != 0) {
    [v23 addObject:@"SPORTS"];
  }
  uint64_t v24 = (void *)[v23 copy];

  v25 = [(FCNewsletterSubscribeCommand *)v20 initWithNewsletter:v21 includeArray:v24];
  [(FCCommandQueue *)v17->_endpointCommandQueue addCommand:v25];
}

- (void)subscribeTo:(int64_t)a3 includeOptions:(int64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v9 = [(FCNewsletterManager *)self enabled];
  if (a3 && v9)
  {
    char v10 = [(FCNewsletterManager *)self updatedIncludeOptionsWithNewsletter:a3 includeOptions:a4];
    id v11 = (void *)FCNewsletterLog;
    if (!os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    if ((unint64_t)a3 > 3) {
      v12 = @"UNKNOWN";
    }
    else {
      v12 = off_1E5B5B5A0[a3 - 1];
    }
    id v13 = (objc_class *)MEMORY[0x1E4F1CA48];
    v14 = v11;
    id v15 = objc_alloc_init(v13);
    id v16 = v15;
    if (v10)
    {
      [v15 addObject:@"ARTICLES"];
      if ((v10 & 2) == 0)
      {
LABEL_9:
        if ((v10 & 4) == 0)
        {
LABEL_11:
          id v17 = (void *)[v16 copy];

          id v18 = [v17 componentsJoinedByString:@"|"];
          *(_DWORD *)buf = 138412546;
          __int16 v28 = v12;
          __int16 v29 = 2112;
          uint64_t v30 = v18;
          _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Subscribing to newsletter [%@] options [%@]", buf, 0x16u);

LABEL_12:
          v19 = [(FCNewsletterManager *)self endpointConnection];
          if ((unint64_t)a3 > 3) {
            v20 = @"UNKNOWN";
          }
          else {
            v20 = off_1E5B5B5A0[a3 - 1];
          }
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v22 = v21;
          if (v10)
          {
            [v21 addObject:@"ARTICLES"];
            if ((v10 & 2) == 0)
            {
LABEL_17:
              if ((v10 & 4) == 0)
              {
LABEL_19:
                v23 = (void *)[v22 copy];

                uint64_t v24 = dispatch_get_global_queue(-2, 0);
                v25[0] = MEMORY[0x1E4F143A8];
                v25[1] = 3221225472;
                v25[2] = __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_40;
                v25[3] = &unk_1E5B5B4C0;
                v25[4] = self;
                id v26 = v8;
                [v19 newsletterSubscribeTo:v20 includeArray:v23 callbackQueue:v24 completion:v25];

                goto LABEL_20;
              }
LABEL_18:
              [v22 addObject:@"SPORTS"];
              goto LABEL_19;
            }
          }
          else if ((v10 & 2) == 0)
          {
            goto LABEL_17;
          }
          [v22 addObject:@"NEWSPLUS_CHANNELS"];
          if ((v10 & 4) == 0) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
LABEL_10:
        [v16 addObject:@"SPORTS"];
        goto LABEL_11;
      }
    }
    else if ((v10 & 2) == 0)
    {
      goto LABEL_9;
    }
    [v16 addObject:@"NEWSPLUS_CHANNELS"];
    if ((v10 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_20:
}

void __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_40(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v9)
  {
    [*(id *)(a1 + 32) updateCacheWithNewsletterString:v9 includeArray:v10 newsletters:v11];
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 2;
  }
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_2;
    block[3] = &unk_1E5B50BE8;
    id v17 = v14;
    uint64_t v18 = v13;
    id v16 = v12;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__FCNewsletterManager_subscribeTo_includeOptions_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (int64_t)includeOptionsForNewsletter:(int64_t)a3
{
  if (a3 != 3) {
    return 0;
  }
  if ([(FCNewsletterManager *)self canOptIntoIssues]
    || [(FCNewsletterManager *)self isOptedIntoIssues])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 1;
  }
  int64_t v6 = [(FCNewsletterManager *)self userInfo];
  uint64_t v7 = [v6 sportsOnboardingState];

  if (v7 == 1) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

- (void)subscribeTo:(int64_t)a3
{
  int64_t v5 = -[FCNewsletterManager includeOptionsForNewsletter:](self, "includeOptionsForNewsletter:");
  [(FCNewsletterManager *)self subscribeTo:a3 includeOptions:v5];
}

- (void)subscribeTo:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(FCNewsletterManager *)self subscribeTo:a3 includeOptions:[(FCNewsletterManager *)self includeOptionsForNewsletter:a3] completion:v6];
}

- (void)subscribeFromPrivacyModalCTA
{
  BOOL v3 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: subscribeFromPrivacyModalCTA", v4, 2u);
  }
  [(FCNewsletterManager *)self subscribeTo:[(FCNewsletterManager *)self activeNewsletter]];
}

- (void)subscribeFromPrivacyModalCTAWithCompletion:(id)a3
{
  id v4 = a3;
  [(FCNewsletterManager *)self subscribeTo:[(FCNewsletterManager *)self activeNewsletter] completion:v4];
}

- (void)unsubscribe
{
  BOOL v3 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: unsubscribe", v5, 2u);
  }
  if ([(FCNewsletterManager *)self isSubscribed])
  {
    [(FCNewsletterManager *)self subscribeTo:1];
  }
  else
  {
    id v4 = FCNewsletterLog;
    if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already unsubscribed. Skipping operation.", buf, 2u);
    }
  }
}

- (void)optOutOfIssues
{
  char v3 = [(FCNewsletterManager *)self includeOptions];
  id v4 = FCNewsletterLog;
  BOOL v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 2) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting out of Issues...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__FCNewsletterManager_optOutOfIssues__block_invoke_46;
    v7[3] = &unk_1E5B4C018;
    v7[4] = self;
    id v6 = [(FCNewsletterManager *)self forceSubscriptionThen:v7];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted out of Issues. Skipping update.", buf, 2u);
  }
}

uint64_t __37__FCNewsletterManager_optOutOfIssues__block_invoke_46(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) includeOptions] & 0xFFFFFFFFFFFFFFFDLL;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 subscription];
  return [v3 subscribeTo:v4 includeOptions:v2];
}

- (id)forceSubscriptionThen:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__FCNewsletterManager_forceSubscriptionThen___block_invoke;
  v12[3] = &unk_1E5B4E758;
  v12[4] = self;
  BOOL v5 = [MEMORY[0x1E4F81BF0] firstly:v12];
  id v6 = zalgoIfMain();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__FCNewsletterManager_forceSubscriptionThen___block_invoke_2;
  v10[3] = &unk_1E5B5B4E8;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v5 thenOn:v6 then:v10];

  return v8;
}

uint64_t __45__FCNewsletterManager_forceSubscriptionThen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceUpdateSubscription];
}

uint64_t __45__FCNewsletterManager_forceSubscriptionThen___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = FCNewsletterLog;
  if (os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Updated subscription state.", buf, 2u);
  }
  int v5 = [*(id *)(a1 + 32) isSubscribed];
  id v6 = FCNewsletterLog;
  BOOL v7 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: user is subscribed. Continuing...", v10, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: user is not subscribed. Skipping update.", v9, 2u);
  }

  return 0;
}

- (void)optIntoSports
{
  char v3 = [(FCNewsletterManager *)self includeOptions];
  id v4 = FCNewsletterLog;
  BOOL v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 4) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted into sports. Skipping subscription.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting into sports...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__FCNewsletterManager_optIntoSports__block_invoke_51;
    v7[3] = &unk_1E5B4C018;
    v7[4] = self;
    id v6 = [(FCNewsletterManager *)self forceSubscriptionThen:v7];
  }
}

uint64_t __36__FCNewsletterManager_optIntoSports__block_invoke_51(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) includeOptions] | 4;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 subscription];
  return [v3 subscribeTo:v4 includeOptions:v2];
}

- (void)optOutOfSports
{
  char v3 = [(FCNewsletterManager *)self includeOptions];
  uint64_t v4 = FCNewsletterLog;
  BOOL v5 = os_log_type_enabled((os_log_t)FCNewsletterLog, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 4) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Opting out from sports...", buf, 2u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__FCNewsletterManager_optOutOfSports__block_invoke_54;
    v7[3] = &unk_1E5B4C018;
    v7[4] = self;
    id v6 = [(FCNewsletterManager *)self forceSubscriptionThen:v7];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "FCNewsletterManager: Already opted out from sports. Skipping unsubscribing.", buf, 2u);
  }
}

uint64_t __37__FCNewsletterManager_optOutOfSports__block_invoke_54(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) includeOptions] & 0xFFFFFFFFFFFFFFFBLL;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 subscription];
  return [v3 subscribeTo:v4 includeOptions:v2];
}

id __41__FCNewsletterManager_updateSubscription__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

id __41__FCNewsletterManager_updateSubscription__block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

id __46__FCNewsletterManager_forceUpdateSubscription__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

- (id)getWebToken
{
  if ([(FCNewsletterManager *)self enabled])
  {
    char v3 = [(FCNewsletterManager *)self webTokenExpiration];
    [v3 timeIntervalSinceNow];
    double v5 = v4;

    if (v5 < 0.0)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] now];
      BOOL v7 = [v6 dateByAddingTimeInterval:60.0];
      [(FCNewsletterManager *)self setWebTokenExpiration:v7];

      id v8 = objc_alloc(MEMORY[0x1E4F81BF0]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __34__FCNewsletterManager_getWebToken__block_invoke_3;
      v13[3] = &unk_1E5B4EEF0;
      v13[4] = self;
      id v9 = (NFPromise *)[v8 initWithResolver:v13];
      getWebTokenPromise = self->_getWebTokenPromise;
      self->_getWebTokenPromise = v9;
    }
    else
    {
      v13[5] = MEMORY[0x1E4F143A8];
      v13[6] = 3221225472;
      v13[7] = __34__FCNewsletterManager_getWebToken__block_invoke_2;
      v13[8] = &unk_1E5B4E758;
      v13[9] = self;
    }
  }
  else
  {
    v13[10] = MEMORY[0x1E4F143A8];
    v13[11] = 3221225472;
    v13[12] = __34__FCNewsletterManager_getWebToken__block_invoke;
    v13[13] = &unk_1E5B4E758;
    v13[14] = self;
  }
  id v11 = self->_getWebTokenPromise;
  return v11;
}

id __34__FCNewsletterManager_getWebToken__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

id __34__FCNewsletterManager_getWebToken__block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

void __34__FCNewsletterManager_getWebToken__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [FCGetWebTokenOperation alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__FCNewsletterManager_getWebToken__block_invoke_4;
  v13[3] = &unk_1E5B5B538;
  v13[4] = v8;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  id v12 = [(FCGetWebTokenOperation *)v7 initWithEndpointConnection:v9 completion:v13];
  [(FCGetWebTokenOperation *)v12 performOperation];
}

void __34__FCNewsletterManager_getWebToken__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 length])
  {
    [*(id *)(a1 + 32) setCachedWebToken:v10];
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    BOOL v7 = [v6 dateByAddingTimeInterval:300.0];
    [*(id *)(a1 + 32) setWebTokenExpiration:v7];

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = (void *)[v10 copy];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateCacheWithNewsletterString:(id)a3 includeArray:(id)a4 newsletters:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = v10;
  uint64_t v13 = v11;
  objc_sync_enter(v11);
  int64_t subscription = v13->_subscription;
  v45 = v13;
  if (v8)
  {
    id v14 = v8;
    if ([v14 isEqualToString:@"NONE"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqualToString:@"NEWSLETTER"])
    {
      uint64_t v15 = 2;
    }
    else if ([v14 isEqualToString:@"PERSONALIZED_NEWSLETTER"])
    {
      uint64_t v15 = 3;
    }
    else
    {
      uint64_t v15 = 0;
    }

    v45->_int64_t subscription = v15;
  }
  if (v9)
  {
    id v16 = v9;
    id v17 = [MEMORY[0x1E4F1CA98] null];

    if (v17 == v16)
    {
      uint64_t v19 = 0;
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v16;
      uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      id v39 = v16;
      id v40 = a5;
      v41 = v12;
      id v42 = v9;
      id v43 = v8;
      uint64_t v19 = 0;
      if (v18)
      {
        uint64_t v20 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            unsigned int v23 = objc_msgSend(v22, "isEqualToString:", @"ARTICLES", v39, v40, v41, v42, v43);
            int v24 = [v22 isEqualToString:@"NEWSPLUS_CHANNELS"];
            int v25 = [v22 isEqualToString:@"SPORTS"];
            uint64_t v26 = v19 | v23;
            if (v24) {
              v26 |= 2uLL;
            }
            if (v25) {
              uint64_t v19 = v26 | 4;
            }
            else {
              uint64_t v19 = v26;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v18);
      }

      id v9 = v42;
      id v8 = v43;
      a5 = v40;
      id v12 = v41;
      id v16 = v39;
    }

    v45->_int64_t includeOptions = v19;
  }
  if (v12) {
    objc_storeStrong((id *)&v45->_cachedNewsletters, a5);
  }
  if (v45->_subscription)
  {
    v27 = [MEMORY[0x1E4F1C9C8] now];
    [(FCNewsletterManager *)v45 cacheTimeout];
    uint64_t v28 = objc_msgSend(v27, "dateByAddingTimeInterval:");
    cacheExpiration = v45->_cacheExpiration;
    v45->_cacheExpiration = (NSDate *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v31 = v30;
    unint64_t v32 = v45->_subscription - 1;
    if (v32 > 2) {
      v33 = @"UNKNOWN";
    }
    else {
      v33 = off_1E5B5B5A0[v32];
    }
    objc_msgSend(v30, "setObject:forKey:", v33, FCNewsletterManagerSubscriptionKey, v39, v40, v41, v42, v43);

    v34 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v34 setInteger:v45->_includeOptions forKey:FCNewsletterManagerIncludeKey];

    v35 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v45->_cachedNewsletters];
    v36 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v36 setObject:v35 forKey:FCNewsletterManagerNewslettersKey];

    v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v38 = [MEMORY[0x1E4F1C9C8] now];
    [v37 setObject:v38 forKey:FCNewsletterManagerCacheAgeKey];

    if (v45->_subscription != subscription) {
      [(FCNewsletterManager *)v45 notifyObserversWithPreviousSubscription:subscription];
    }
  }
  objc_sync_exit(v45);
}

- (BOOL)shouldSubmitPersonalizationVector
{
  BOOL v3 = [(FCNewsletterManager *)self enabled];
  if (v3) {
    LOBYTE(v3) = [(FCNewsletterManager *)self subscription] == 3
  }
              || [(FCNewsletterManager *)self subscription] == 2
              && [(FCNewsletterManager *)self isOptedIntoIssues];
  return v3;
}

- (void)submitPersonalizationVector:(id)a3 subscribedBundleChannelIDs:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v14 && [(FCNewsletterManager *)self shouldSubmitPersonalizationVector])
  {
    BOOL v7 = [v14 data];
    id v8 = [v7 base64EncodedStringWithOptions:0];

    if (([v8 isEqualToString:&stru_1EF8299B8] & 1) == 0)
    {
      id v9 = [(FCNewsletterManager *)self cachedVector];
      char v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        [(FCNewsletterManager *)self setCachedVector:v8];
        id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v11 setObject:v8 forKey:FCNewsletterManagerCachedVectorKey];

        id v12 = [[FCSubmitNewsletterPersonalizationVectorCommand alloc] initWithPersonalizationVector:v8];
        [(FCCommandQueue *)self->_endpointCommandQueue addCommand:v12];
      }
    }
    if ([(FCNewsletterManager *)self isOptedIntoIssues])
    {
      uint64_t v13 = [v6 allObjects];
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [(FCNewsletterManager *)self saveToCloudKitSubscribedChannels:v13];
  }
}

- (void)saveToCloudKitSubscribedChannels:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v6 = (void *)[v5 initWithZoneName:@"UserPrivacyExporter" ownerName:*MEMORY[0x1E4F19C08]];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:v6];
  id v8 = objc_alloc_init(FCCKPrivateSaveRecordZonesOperation);
  v18[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(FCCKPrivateSaveRecordZonesOperation *)v8 setRecordZonesToSave:v9];

  char v10 = [(FCNewsletterManager *)self database];
  [(FCCKPrivateDatabaseOperation *)v8 setDatabase:v10];

  [(FCOperation *)v8 setQualityOfService:17];
  [(FCCKPrivateDatabaseOperation *)v8 setSkipPreflight:1];
  [(FCCKPrivateSaveRecordZonesOperation *)v8 setCanBypassEncryptionRequirement:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke;
  v14[3] = &unk_1E5B5B580;
  id v15 = v6;
  id v16 = v4;
  id v17 = self;
  id v11 = v4;
  id v12 = v6;
  [(FCCKPrivateSaveRecordZonesOperation *)v8 setSaveRecordZonesCompletionBlock:v14];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v13 addOperation:v8];
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2;
    v14[3] = &unk_1E5B4C018;
    id v15 = v4;
    __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2((uint64_t)v14);
    id v6 = v15;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"static_user_privacy_exporter_record" zoneID:*(void *)(a1 + 32)];
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"UserPrivacyExporter" recordID:v6];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v7 encryptedValuesByKey];
    [v9 setObject:v8 forKeyedSubscript:@"subscribedChannelTagIDs"];

    char v10 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v16[0] = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(FCCKPrivateSaveRecordsOperation *)v10 setRecordsToSave:v11];

    id v12 = [*(id *)(a1 + 48) database];
    [(FCCKPrivateDatabaseOperation *)v10 setDatabase:v12];

    [(FCOperation *)v10 setQualityOfService:17];
    [(FCCKPrivateSaveRecordsOperation *)v10 setSavePolicy:1];
    [(FCCKPrivateDatabaseOperation *)v10 setSkipPreflight:1];
    [(FCCKPrivateSaveRecordsOperation *)v10 setCanBypassEncryptionRequirement:1];
    [(FCCKPrivateSaveRecordsOperation *)v10 setSaveRecordsCompletionBlock:&__block_literal_global_78_1];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v13 addOperation:v10];
  }
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "failed to save subscribed channels to CK with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_75(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_79;
    v5[3] = &unk_1E5B4C018;
    id v6 = v3;
    __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_79((uint64_t)v5);
  }
}

void __56__FCNewsletterManager_saveToCloudKitSubscribedChannels___block_invoke_2_79(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "failed to save subscribed channels to CK with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deletePersonalizationVector
{
  [MEMORY[0x1E4F29060] isMainThread];
  if ([(FCNewsletterManager *)self enabled])
  {
    [(FCNewsletterManager *)self setCachedVector:0];
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 removeObjectForKey:FCNewsletterManagerCachedVectorKey];

    int v4 = objc_alloc_init(FCDeleteNewsletterPersonalizationVectorCommand);
    [(FCCommandQueue *)self->_endpointCommandQueue addCommand:v4];
    [(FCNewsletterManager *)self saveToCloudKitSubscribedChannels:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNewsletterManager *)self observers];
  [v5 removeObject:v4];
}

- (void)notifyObservers
{
}

- (void)notifyObserversWithPreviousSubscription:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(FCNewsletterManager *)self observers];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) newsletterSubscriptionChangedFromSubscription:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(int64_t)a3
{
  self->_int64_t subscription = a3;
}

- (void)setIncludeOptions:(int64_t)a3
{
  self->_int64_t includeOptions = a3;
}

- (NSArray)cachedNewsletters
{
  return self->_cachedNewsletters;
}

- (void)setCachedNewsletters:(id)a3
{
}

- (FCNewsletterEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (FCCommandQueue)endpointCommandQueue
{
  return self->_endpointCommandQueue;
}

- (FCAppleAccount)appleAccount
{
  return self->_appleAccount;
}

- (FCNewsAppConfigurationManager)appConfig
{
  return self->_appConfig;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)activeiTunesAccountName
{
  return self->_activeiTunesAccountName;
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (NSDate)cacheExpiration
{
  return self->_cacheExpiration;
}

- (void)setCacheExpiration:(id)a3
{
}

- (NFPromise)updateSubscriptionPromise
{
  return self->_updateSubscriptionPromise;
}

- (void)setUpdateSubscriptionPromise:(id)a3
{
}

- (NFPromise)getWebTokenPromise
{
  return self->_getWebTokenPromise;
}

- (void)setGetWebTokenPromise:(id)a3
{
}

- (NSString)cachedVector
{
  return self->_cachedVector;
}

- (void)setCachedVector:(id)a3
{
}

- (NSString)cachedWebToken
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCachedWebToken:(id)a3
{
}

- (NSDate)webTokenExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setWebTokenExpiration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webTokenExpiration, 0);
  objc_storeStrong((id *)&self->_cachedWebToken, 0);
  objc_storeStrong((id *)&self->_cachedVector, 0);
  objc_storeStrong((id *)&self->_getWebTokenPromise, 0);
  objc_storeStrong((id *)&self->_updateSubscriptionPromise, 0);
  objc_storeStrong((id *)&self->_cacheExpiration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_activeiTunesAccountName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_appConfig, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_endpointCommandQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_cachedNewsletters, 0);
}

@end