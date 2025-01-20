@interface VSUserAccountRegistry
- (BOOL)_isValidForDeleteQueryForCurrentTask;
- (BOOL)_isValidForUpdateQueryForCurrentTask:(id)a3;
- (BOOL)currentUpdateSessionIsForced;
- (BOOL)saveContext:(id)a3 withError:(id *)a4;
- (BOOL)shouldAllowUserAccountUpdate:(id)a3;
- (BOOL)storesLoaded;
- (NSDate)lastUpdateTime;
- (NSOperationQueue)privateQueue;
- (OS_dispatch_source)timer;
- (VSPreferences)preferences;
- (VSPrivacyFacade)privacyFacade;
- (VSRemoteNotifier)remoteNotifier;
- (VSUserAccountPersistentContainer)container;
- (VSUserAccountRegistry)init;
- (VSUserAccountRegistry)initWithDelegate:(id)a3;
- (VSUserAccountRegistryDelegate)delegate;
- (VSUserAccountUpdateManager)updateManager;
- (WLKSettingsStore)sharedSettingsStore;
- (id)_predicateForFetchingAllResults;
- (id)_predicateForFetchingZeroResults;
- (id)_predicateForIsSignedOut:(BOOL)a3;
- (id)_predicateForQueryRequestWithOptions:(int64_t)a3;
- (id)_predicateForUserAccountFromCurrentDevice;
- (id)_predicateForUserAccountFromDeviceID:(id)a3;
- (id)_predicateForUserAccountFromSourceID:(id)a3;
- (id)_predicateForUserAccountWithDeviceIdentifier:(id)a3 sourceIdentifier:(id)a4 sourceType:(id)a5;
- (id)_predicateForUserAccountWithNonnullBillingCycleEndDate;
- (id)_predicateForUserAccountWithNonnullUpdateURL;
- (id)_predicateForUserAccountWithSourceType:(id)a3;
- (id)_securityTaskForCurrentConnection;
- (id)_sortForUserAccountBillingCycleEndDateASC:(BOOL)a3;
- (id)_sortForUserAccountModifiedTimeASC:(BOOL)a3;
- (id)_updateRequestForAccount:(id)a3;
- (id)_userAccountForPersistentUserAccount:(id)a3 context:(id)a4;
- (id)createSaveContext;
- (id)prepareUserAccountsToVend:(id)a3 withSecurityTask:(id)a4;
- (os_unfair_lock_s)loadingStoresLock;
- (void)_deduplicatePersistentUserAccounts:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_deletePersistentUserAccount:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)_deleteUserAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_forceRefreshAccount:(id)a3;
- (void)_getMaxUpdateFrequencyNumberWithCompletionHandler:(id)a3;
- (void)_insertUserAccount:(id)a3 completion:(id)a4;
- (void)_loadStoresAndMigrateIfRequiredWithCompletion:(id)a3;
- (void)_persistentAccountsForUserAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_populatePersistentUserAccount:(id)a3 withUserAccount:(id)a4 context:(id)a5;
- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7;
- (void)_queryUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_queryUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7;
- (void)_removeNonConnectedSignedOutUserAccounts;
- (void)_setUpdateRequestManagerWithRequests:(id)a3;
- (void)_setupObservers;
- (void)_subscriptionsForMigrationWithCompletion:(id)a3;
- (void)_update;
- (void)deleteUserAccount:(id)a3 completion:(id)a4;
- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4;
- (void)forceUpdateUserAccountsWithCompletion:(id)a3;
- (void)insertUserAccount:(id)a3 completion:(id)a4;
- (void)queryUserAccountsWithOptions:(int64_t)a3 completion:(id)a4;
- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7;
- (void)queryUserAccountsWithPredicate:(id)a3 completion:(id)a4;
- (void)registerSubscription:(id)a3;
- (void)removeSubscriptions:(id)a3;
- (void)resetTimer;
- (void)setContainer:(id)a3;
- (void)setCurrentUpdateSessionIsForced:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastUpdateTime:(id)a3;
- (void)setLoadingStoresLock:(os_unfair_lock_s)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivacyFacade:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setSharedSettingsStore:(id)a3;
- (void)setStoresLoaded:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setUpdateManager:(id)a3;
- (void)updateManager:(id)a3 updateRequestDidFinish:(id)a4;
- (void)updateManagerDidFinish:(id)a3;
- (void)updateUserAccount:(id)a3 completion:(id)a4;
@end

@implementation VSUserAccountRegistry

- (VSUserAccountRegistry)init
{
  return [(VSUserAccountRegistry *)self initWithDelegate:0];
}

- (VSUserAccountRegistry)initWithDelegate:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VSUserAccountRegistry;
  v5 = [(VSUserAccountRegistry *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (VSPreferences *)objc_alloc_init((Class)VSPreferences);
    preferences = v6->_preferences;
    v6->_preferences = v7;

    v9 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v9;

    v11 = v6->_privateQueue;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [(NSOperationQueue *)v11 setName:v13];

    [(NSOperationQueue *)v6->_privateQueue setMaxConcurrentOperationCount:1];
    id v14 = objc_alloc((Class)VSRemoteNotifier);
    v15 = (VSRemoteNotifier *)[v14 initWithNotificationName:VSUserAccountsDidChangeNotification];
    remoteNotifier = v6->_remoteNotifier;
    v6->_remoteNotifier = v15;

    id v17 = objc_alloc((Class)VSPrivacyFacade);
    id v18 = objc_alloc_init((Class)VSPrivacyVoucherLockbox);
    v19 = (VSPrivacyFacade *)[v17 initWithVoucherLockbox:v18];
    privacyFacade = v6->_privacyFacade;
    v6->_privacyFacade = v19;

    v21 = (VSUserAccountPersistentContainer *)[objc_alloc((Class)VSUserAccountPersistentContainer) initInMemory:0];
    container = v6->_container;
    v6->_container = v21;

    v6->_loadingStoresLock._os_unfair_lock_opaque = 0;
    uint64_t v23 = +[NSDate distantPast];
    lastUpdateTime = v6->_lastUpdateTime;
    v6->_lastUpdateTime = (NSDate *)v23;

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100002CE0;
    v26[3] = &unk_1000144C8;
    v27 = v6;
    [(VSUserAccountRegistry *)v27 _loadStoresAndMigrateIfRequiredWithCompletion:v26];
  }
  return v6;
}

- (void)_setupObservers
{
  id v3 = WLKSettingsDidChangeNotification;
  objc_initWeak(&location, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002EF0;
  v7[3] = &unk_1000144F0;
  objc_copyWeak(&v8, &location);
  id v6 = [v4 addObserverForName:v3 object:0 queue:v5 usingBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_loadStoresAndMigrateIfRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(VSUserAccountRegistry *)self privateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003024;
  v7[3] = &unk_1000145B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)_subscriptionsForMigrationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, BOOL, void))a3;
  v5 = [(VSUserAccountRegistry *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will invoke migration delegate method.", buf, 2u);
    }

    id v7 = objc_alloc_init((Class)VSWaitGroup);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    *(void *)buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100003400;
    v21 = sub_100003410;
    id v22 = 0;
    [v7 enter];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100003CC8;
    v13[3] = &unk_1000145E0;
    v15 = &v23;
    v16 = buf;
    id v8 = v7;
    id v14 = v8;
    [v5 userAccountRegistry:self willPerformMigrationIfRequiredWithBlock:v13];
    if ([v8 waitWithMilliseconds:2000])
    {
      BOOL v9 = *((unsigned char *)v24 + 24) != 0;
      uint64_t v10 = *((void *)v18 + 5);
    }
    else
    {
      v12 = VSErrorLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_10000C57C();
      }

      BOOL v9 = 0;
      uint64_t v10 = 0;
    }
    v4[2](v4, v9, v10);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v11 = VSErrorLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10000C53C();
    }

    v4[2](v4, 0, 0);
  }
}

- (void)queryUserAccountsWithOptions:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  id v8 = [(VSUserAccountRegistry *)self _predicateForQueryRequestWithOptions:a3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003EA8;
  v11[3] = &unk_100014630;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(VSUserAccountRegistry *)self queryUserAccountsWithPredicate:v8 completion:v11];
}

- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [(VSUserAccountRegistry *)self _predicateForQueryRequestWithOptions:a3];
  id v17 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithDeviceIdentifier:v13 sourceIdentifier:v15 sourceType:v14];

  v25[0] = v16;
  v25[1] = v17;
  id v18 = +[NSArray arrayWithObjects:v25 count:2];
  uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

  [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100004154;
  v22[3] = &unk_100014630;
  v22[4] = self;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v12;
  id v20 = v12;
  id v21 = v23;
  [(VSUserAccountRegistry *)self queryUserAccountsWithPredicate:v19 completion:v22];
}

- (void)updateUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VSUserAccountRegistry *)self shouldAllowUserAccountUpdate:v6])
  {
    id v8 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
    id v9 = [(VSUserAccountRegistry *)self privateQueue];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100004738;
    v38[3] = &unk_100014680;
    id v10 = &v39;
    id v11 = v8;
    id v39 = v11;
    id v12 = (id *)v40;
    id v13 = v6;
    v40[0] = v13;
    [v9 addOperationWithBlock:v38];

    if ([(VSUserAccountRegistry *)self _isValidForUpdateQueryForCurrentTask:v13])
    {
      id v14 = VSDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "user account update permitted: %@", buf, 0xCu);
      }

      id v15 = [v13 accountProviderIdentifier];
      if ([v15 length])
      {
        v16 = VSDefaultLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "user account indicates an account provider identifier.", buf, 2u);
        }

        id v17 = [(VSUserAccountRegistry *)self privacyFacade];
        id v18 = +[NSXPCConnection currentConnection];
        uint64_t v19 = v18;
        if (v18) {
          [v18 auditToken];
        }
        else {
          memset(v37, 0, sizeof(v37));
        }
        unsigned __int8 v24 = [v17 isAccessGrantedForAuditToken:v37, &v39];

        if (v24)
        {
          unsigned __int8 v25 = 1;
        }
        else
        {
          char v26 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
          unsigned __int8 v25 = [v26 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService];
        }
        v27 = +[VSAccountStore sharedAccountStore];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100004880;
        v31[3] = &unk_100014720;
        id v15 = v15;
        id v32 = v15;
        unsigned __int8 v36 = v25;
        id v33 = v13;
        v34 = self;
        id v35 = v7;
        [v27 fetchAccountsWithCompletionHandler:v31];

        id v10 = v28;
      }
      else
      {
        [(VSUserAccountRegistry *)self insertUserAccount:v13 completion:v7];
      }
    }
    else
    {
      id v15 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
      id v21 = [v15 signingIdentifier];
      id v22 = VSErrorLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_10000C5BC();
      }

      if (v7)
      {
        v29 = VSPublicError();
        id v30 = v7;
        id v23 = v29;
        VSPerformCompletionHandler();
      }
    }

    goto LABEL_26;
  }
  id v20 = VSErrorLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    sub_10000C624();
  }

  if (v7)
  {
    VSPublicError();
    v40[1] = _NSConcreteStackBlock;
    v40[2] = 3221225472;
    v40[3] = sub_100004724;
    v40[4] = &unk_100014658;
    id v10 = &v42;
    id v12 = &v41;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    id v42 = v7;
    id v11 = v41;
    VSPerformCompletionHandler();
LABEL_26:
  }
}

- (void)deleteUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  id v9 = [(VSUserAccountRegistry *)self privateQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004F64;
  v17[3] = &unk_100014680;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  [v9 addOperationWithBlock:v17];

  if ([(VSUserAccountRegistry *)self _isValidForDeleteQueryForCurrentTask])
  {
    id v12 = [(VSUserAccountRegistry *)self createSaveContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000050D8;
    v14[3] = &unk_1000146F8;
    id v13 = (id *)v15;
    v15[0] = v7;
    [(VSUserAccountRegistry *)self _deleteUserAccount:v11 context:v12 completion:v14];
  }
  else
  {
    v15[1] = _NSConcreteStackBlock;
    v15[2] = 3221225472;
    v15[3] = sub_100005070;
    v15[4] = &unk_1000146A8;
    id v13 = &v16;
    id v16 = v7;
    VSPerformCompletionHandler();
  }
}

- (void)forceUpdateUserAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  unsigned int v6 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountServiceForceUpdate];

  if (v6)
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Forcefully updating user accounts", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v8 = [(VSUserAccountRegistry *)self privateQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000053F8;
    v11[3] = &unk_100014748;
    objc_copyWeak(&v13, buf);
    id v12 = v4;
    [v8 addOperationWithBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000C790();
    }

    id v10 = v4;
    VSPerformCompletionHandler();
  }
}

- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VSUserAccountRegistry *)self _isValidForUpdateQueryForCurrentTask:v6])
  {
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forcefully updating user account", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v9 = [(VSUserAccountRegistry *)self privateQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000056C4;
    v12[3] = &unk_100014770;
    objc_copyWeak(&v15, buf);
    id v13 = v6;
    id v14 = v7;
    [v9 addOperationWithBlock:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
  else
  {
    id v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000C7C4();
    }

    id v11 = v7;
    VSPerformCompletionHandler();
  }
}

- (void)queryUserAccountsWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VSUserAccountRegistry *)self createSaveContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000586C;
  v10[3] = &unk_100014798;
  id v11 = v6;
  id v9 = v6;
  [(VSUserAccountRegistry *)self _queryUserAccountsWithPredicate:v7 context:v8 completion:v10];
}

- (void)insertUserAccount:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000059CC;
  v7[3] = &unk_1000146F8;
  id v8 = a4;
  id v6 = v8;
  [(VSUserAccountRegistry *)self _insertUserAccount:a3 completion:v7];
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[VSUserAccountRegistry fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005C1C;
  v8[3] = &unk_100014798;
  id v9 = v5;
  id v7 = v5;
  [(VSUserAccountRegistry *)self queryUserAccountsWithOptions:0 completion:v8];
}

- (void)registerSubscription:(id)a3
{
  id v7 = a3;
  id v4 = +[NSValueTransformer valueTransformerForName:VSSubscriptionValueTransformerName];
  id v5 = [v4 transformedValue:v7];

  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"The [subscriptionTransformer transformedValue:subscription] parameter must not be nil."];
  }
  id v6 = [v4 transformedValue:v7];
  [(VSUserAccountRegistry *)self updateUserAccount:v6 completion:0];
}

- (void)removeSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = VSSubscriptionValueTransformerName;
    NSExceptionName v21 = NSInvalidArgumentException;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v12 = +[NSValueTransformer valueTransformerForName:](NSValueTransformer, "valueTransformerForName:", v9, v21);
        id v13 = [v12 transformedValue:v11];

        if (!v13) {
          +[NSException raise:v21 format:@"The [subscriptionTransformer transformedValue:subscription] parameter must not be nil."];
        }
        id v14 = [v12 transformedValue:v11];
        [v5 addObject:v14];
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
        [v20 setSignedOut:1];
        [(VSUserAccountRegistry *)self updateUserAccount:v20 completion:0];
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
}

- (BOOL)saveContext:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if ([v5 hasChanges]) {
    unsigned __int8 v6 = [v5 save:a4];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (id)createSaveContext
{
  v2 = [(VSUserAccountRegistry *)self container];
  id v3 = [v2 newBackgroundContext];

  [v3 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [v3 setAutomaticallyMergesChangesFromParent:1];

  return v3;
}

- (BOOL)shouldAllowUserAccountUpdate:(id)a3
{
  id v3 = a3;
  id v4 = +[VSDevice currentDevice];
  id v5 = [v4 serialNumber];

  unsigned __int8 v6 = [v3 deviceIdentifier];

  if (!v6) {
    [v3 setDeviceIdentifier:v5];
  }
  id v7 = [v3 deviceIdentifier];
  [v3 setFromCurrentDevice:[v7 isEqual:v5]];

  uint64_t v8 = [v3 deviceIdentifier];
  LOBYTE(v7) = v8 != 0;

  return (char)v7;
}

- (id)_updateRequestForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(VSUserAccountRegistry *)self currentUpdateSessionIsForced];
  unsigned __int8 v6 = [v4 updateURL];

  if (v6
    && ([v4 subscriptionBillingCycleEndDate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        +[NSDate now],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = objc_msgSend(v7, "vs_isAfter:", v8) | v5,
        v8,
        v7,
        v9 == 1))
  {
    id v10 = [objc_alloc((Class)VSUserAccountUpdateRequest) initWithUserAccount:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_setUpdateRequestManagerWithRequests:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)VSUserAccountUpdateManager) initWithUserAccountUpdateRequests:v4];

  [v5 setDelegate:self];
  [v5 updateUserAccounts];
  [(VSUserAccountRegistry *)self setUpdateManager:v5];
}

- (void)_forceRefreshAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(VSUserAccountRegistry *)self privateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006990;
  v7[3] = &unk_100014680;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)_update
{
  id v3 = [(VSUserAccountRegistry *)self privateQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006BC4;
  v4[3] = &unk_100014810;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)resetTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006F78;
  v2[3] = &unk_1000148B0;
  v2[4] = self;
  [(VSUserAccountRegistry *)self _getMaxUpdateFrequencyNumberWithCompletionHandler:v2];
}

- (void)_getMaxUpdateFrequencyNumberWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSBag vs_defaultBag];
  id v5 = [v4 integerForKey:VSAMSBagKeyMaximumUserAccountUpdateFrequency];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007858;
  v7[3] = &unk_1000148D8;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

- (void)_removeNonConnectedSignedOutUserAccounts
{
  id v3 = [(VSUserAccountRegistry *)self privateQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000078F4;
  v4[3] = &unk_100014810;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)_insertUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  if ([(VSUserAccountRegistry *)self shouldAllowUserAccountUpdate:v6])
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100003400;
    v29[4] = sub_100003410;
    id v30 = 0;
    unsigned int v9 = [(VSUserAccountRegistry *)self createSaveContext];
    id v10 = objc_alloc_init((Class)VSWaitGroup);
    [v10 enter];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100008098;
    v24[3] = &unk_100014978;
    v24[4] = self;
    id v11 = v9;
    id v25 = v11;
    long long v28 = v29;
    id v12 = v10;
    id v26 = v12;
    id v13 = v6;
    id v27 = v13;
    [(VSUserAccountRegistry *)self _persistentAccountsForUserAccount:v13 context:v11 completion:v24];
    [v12 wait];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008390;
    v17[3] = &unk_1000149A0;
    long long v23 = v29;
    id v14 = v11;
    id v18 = v14;
    id v19 = self;
    id v20 = v13;
    id v21 = v8;
    id v22 = v7;
    [v14 performBlock:v17];

    _Block_object_dispose(v29, 8);
  }
  else
  {
    id v15 = VSErrorLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000C954();
    }

    id v16 = VSPublicError();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
}

- (void)_persistentAccountsForUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 deviceIdentifier];
  id v12 = [v10 sourceIdentifier];
  id v13 = [v10 sourceType];

  id v14 = +[NSNumber numberWithInteger:v13];
  id v15 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithDeviceIdentifier:v11 sourceIdentifier:v12 sourceType:v14];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008804;
  v18[3] = &unk_1000149C8;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [(VSUserAccountRegistry *)self _queryPersistentUserAccountsWithPredicate:v15 context:v17 completion:v18];
}

- (void)_deduplicatePersistentUserAccounts:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ((unint64_t)[v8 count] < 2)
  {
    long long v23 = [v8 firstObject];
    v10[2](v10, v23, 0);
  }
  else
  {
    id v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found %lu duplicate persistent user accounts that match the user account to insert.", (uint8_t *)&buf, 0xCu);
    }

    id v12 = [(VSUserAccountRegistry *)self _sortForUserAccountModifiedTimeASC:1];
    v38 = v12;
    id v13 = +[NSArray arrayWithObjects:&v38 count:1];
    id v14 = [v8 sortedArrayUsingDescriptors:v13];

    id v15 = [v14 mutableCopy];
    id v16 = [v15 lastObject];
    BOOL v17 = v16 == 0;

    if (v17) {
      +[NSException raise:NSInvalidArgumentException format:@"The [accountsToRemove lastObject] parameter must not be nil."];
    }
    uint64_t v18 = [v15 lastObject];
    [v15 removeLastObject];
    long long v24 = (void *)v18;
    id v25 = v14;
    id v26 = v10;
    id v27 = v8;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_100003400;
    unsigned __int8 v36 = sub_100003410;
    id v37 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = v15;
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v29;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v19);
          }
          -[VSUserAccountRegistry _deletePersistentUserAccount:withContext:completion:](self, "_deletePersistentUserAccount:withContext:completion:", v24, v25, v26, v27, _NSConcreteStackBlock, 3221225472, sub_100008CD0, &unk_1000149F0, *(void *)(*((void *)&v28 + 1) + 8 * (void)v22), &buf, (void)v28);
          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }

    id v10 = v26;
    id v8 = v27;
    v26[2](v26, v24, *(void *)(*((void *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_deleteUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 sourceIdentifier];
  id v12 = [v10 deviceIdentifier];
  id v13 = [v10 sourceType];

  id v14 = +[NSNumber numberWithInteger:v13];
  id v15 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithDeviceIdentifier:v12 sourceIdentifier:v11 sourceType:v14];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008F04;
  v18[3] = &unk_100014A18;
  id v19 = v8;
  id v20 = v9;
  void v18[4] = self;
  id v16 = v8;
  id v17 = v9;
  [(VSUserAccountRegistry *)self _queryPersistentUserAccountsWithPredicate:v15 context:v16 completion:v18];
}

- (void)_deletePersistentUserAccount:(id)a3 withContext:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009120;
  v11[3] = &unk_100014A40;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [v9 performBlock:v11];
}

- (void)_queryUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_queryUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000093E0;
  v14[3] = &unk_100014A18;
  id v15 = a6;
  id v16 = a7;
  void v14[4] = self;
  id v12 = v15;
  id v13 = v16;
  [(VSUserAccountRegistry *)self _queryPersistentUserAccountsWithPredicate:a3 sorts:a4 fetchLimit:a5 context:v12 completion:v14];
}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000096A0;
  v21[3] = &unk_100014A90;
  id v25 = v14;
  id v26 = a7;
  id v22 = v15;
  id v23 = v12;
  id v24 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v26;
  id v20 = v15;
  [(VSUserAccountRegistry *)self _loadStoresAndMigrateIfRequiredWithCompletion:v21];
}

- (void)_populatePersistentUserAccount:(id)a3 withUserAccount:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[VSDevice currentDevice];
  id v11 = [v10 deviceType];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009BFC;
  v14[3] = &unk_100014AB8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v11;
  id v12 = v8;
  id v13 = v7;
  [v9 performBlockAndWait:v14];
}

- (id)_userAccountForPersistentUserAccount:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  id v6 = [v5 sourceIdentifier];
  id v7 = [v5 sourceType];
  id v8 = +[VSDevice currentDevice];
  id v9 = [v8 serialNumber];

  id v10 = [v5 deviceIdentifier];
  id v11 = [v10 isEqual:v9];
  id v12 = objc_alloc((Class)VSUserAccount);
  id v13 = [v5 accountType];
  id v14 = [v5 updateURL];
  id v15 = [v12 initWithAccountType:v13 updateURL:v14 sourceType:v7 sourceIdentifier:v6];

  [v15 setRequiresSystemTrust:[v5 requiresSystemTrust]];
  id v16 = [v5 providerID];
  id v17 = [v16 copy];
  [v15 setAccountProviderIdentifier:v17];

  id v18 = [v5 accountIdentifier];
  [v15 setIdentifier:v18];

  [v15 setSignedOut:[v5 signedOut]];
  id v19 = [v5 tierIdentifiers];
  [v15 setTierIdentifiers:v19];

  id v20 = [v5 billingIdentifier];
  id v21 = [v20 copy];
  [v15 setBillingIdentifier:v21];

  id v22 = [v5 authenticationData];
  id v23 = [v22 copy];
  [v15 setAuthenticationData:v23];

  [v15 setDeviceCategory:+[VSUserAccount deviceCategoryFromDeviceType:](VSUserAccount, "deviceCategoryFromDeviceType:", [v5 deviceType])];
  [v15 setFromCurrentDevice:v11];
  [v15 setKeychainItemHash:[v5 keychainItemHash]];
  id v24 = [v5 modified];
  [v15 setModified:v24];

  id v25 = [v5 created];
  [v15 setCreated:v25];

  [v15 setIsDeveloperCreated:[v5 developer]];
  id v26 = [v5 appleSubscription];
  [v15 setAppleSubscription:v26];

  id v27 = [v5 deviceIdentifier];
  [v15 setDeviceIdentifier:v27];

  long long v28 = [v5 deviceName];

  if (v28 || !v11)
  {
    long long v29 = [v5 deviceName];
    [v15 setDeviceName:v29];
  }
  else
  {
    long long v29 = +[VSDevice currentDevice];
    long long v30 = [v29 name];
    [v15 setDeviceName:v30];
  }
  long long v31 = [v5 billingCycleEndDate];
  [v15 setSubscriptionBillingCycleEndDate:v31];

  id v32 = [v15 accountProviderIdentifier];
  if (![v15 sourceType] && objc_msgSend(v32, "length"))
  {
    if (!v32) {
      +[NSException raise:NSInvalidArgumentException format:@"The accountProviderIdentifierOrNil parameter must not be nil."];
    }
    id v33 = v32;
    uint64_t v34 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithDeviceIdentifier:0 sourceIdentifier:v33 sourceType:&off_100014FE8];
    id v35 = objc_alloc_init((Class)VSSemaphore);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000A320;
    v41[3] = &unk_100014BC0;
    id v42 = v33;
    id v43 = v15;
    id v44 = v35;
    id v36 = v35;
    id v37 = v33;
    [(VSUserAccountRegistry *)self _queryPersistentUserAccountsWithPredicate:v34 context:v40 completion:v41];
    [v36 wait];
  }

  return v15;
}

- (id)_securityTaskForCurrentConnection
{
  v2 = +[NSXPCConnection currentConnection];

  if (!v2) {
    +[NSException raise:NSInternalInconsistencyException format:@"Attempted to get security task from non-XPC thread."];
  }

  return +[VSSecurityTask securityTaskForCurrentConnection];
}

- (BOOL)_isValidForDeleteQueryForCurrentTask
{
  v2 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  unsigned __int8 v3 = [v2 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountServiceDelete];

  return v3;
}

- (BOOL)_isValidForUpdateQueryForCurrentTask:(id)a3
{
  id v4 = a3;
  id v5 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  if ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService])goto LABEL_2; {
  if (([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameUserAccountService] & 1) == 0
  }
    && ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSmootSubscriptionService] & 1) == 0)
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000CEDC();
    }
    goto LABEL_30;
  }
  unsigned int v7 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceReadWriteWebSources];
  id v8 = [v4 sourceType];
  if (!v7)
  {
    if (v8 == (id)2)
    {
      id v9 = VSErrorLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000CD60();
      }
    }
    else
    {
      id v10 = [v5 signingIdentifier];
      id v9 = v10;
      if (v10)
      {
        id v9 = v10;
        id v11 = [v4 sourceType];
        id v12 = [v4 sourceIdentifier];
        unsigned __int8 v13 = [v12 isEqualToString:v9];

        if (v11)
        {
          id v14 = VSErrorLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10000CE64(v4);
          }
        }
        if ((v13 & 1) == 0)
        {
          id v15 = VSErrorLogObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10000CDC8(v4);
          }
        }
        if (v11) {
          BOOL v6 = 0;
        }
        else {
          BOOL v6 = v13;
        }

        goto LABEL_31;
      }
      id v16 = VSErrorLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000CD94();
      }
    }
LABEL_30:
    BOOL v6 = 0;
LABEL_31:

    goto LABEL_32;
  }
  if (v8 != (id)1)
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000CCE8(v4);
    }
    goto LABEL_30;
  }
LABEL_2:
  BOOL v6 = 1;
LABEL_32:

  return v6;
}

- (id)prepareUserAccountsToVend:(id)a3 withSecurityTask:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    uint64_t v12 = VSEntitlementNameInternalUserAccountService;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isFromCurrentDevice", (void)v16) & 1) == 0) {
          [v14 setAuthenticationData:0];
        }
        if (([v6 shouldAllowAccessForBooleanEntitlement:v12] & 1) == 0) {
          [v14 setDeviceName:0];
        }
        [v7 addObject:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_sortForUserAccountModifiedTimeASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:@"modified" ascending:a3];
}

- (id)_sortForUserAccountBillingCycleEndDateASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:@"billingCycleEndDate" ascending:a3];
}

- (id)_predicateForFetchingZeroResults
{
  return +[NSPredicate predicateWithValue:0];
}

- (id)_predicateForFetchingAllResults
{
  return +[NSPredicate predicateWithValue:1];
}

- (id)_predicateForIsSignedOut:(BOOL)a3
{
  unsigned __int8 v3 = +[NSNumber numberWithBool:a3];
  id v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"%K = %d", @"signedOut", [v3 intValue]);

  return v4;
}

- (id)_predicateForUserAccountFromDeviceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", @"deviceIdentifier", a3];
}

- (id)_predicateForUserAccountFromCurrentDevice
{
  unsigned __int8 v3 = +[VSDevice currentDevice];
  id v4 = [v3 serialNumber];
  id v5 = [(VSUserAccountRegistry *)self _predicateForUserAccountFromDeviceID:v4];

  return v5;
}

- (id)_predicateForUserAccountFromSourceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", @"sourceIdentifier", a3];
}

- (id)_predicateForUserAccountWithSourceType:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"%K = %d", @"sourceType", [a3 integerValue]);
}

- (id)_predicateForUserAccountWithNonnullUpdateURL
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL", @"updateURL"];
}

- (id)_predicateForUserAccountWithNonnullBillingCycleEndDate
{
  return +[NSPredicate predicateWithFormat:@"%K != NULL", @"billingCycleEndDate"];
}

- (id)_predicateForUserAccountWithDeviceIdentifier:(id)a3 sourceIdentifier:(id)a4 sourceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if (v9)
  {
    uint64_t v12 = [(VSUserAccountRegistry *)self _predicateForUserAccountFromSourceID:v9];
    [v11 addObject:v12];
  }
  if (v10)
  {
    unsigned __int8 v13 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithSourceType:v10];
    [v11 addObject:v13];
  }
  if (v8)
  {
    id v14 = [(VSUserAccountRegistry *)self _predicateForUserAccountFromDeviceID:v8];
    [v11 addObject:v14];
  }
  id v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

  return v15;
}

- (id)_predicateForQueryRequestWithOptions:(int64_t)a3
{
  char v3 = a3;
  id v5 = [(VSUserAccountRegistry *)self _securityTaskForCurrentConnection];
  unsigned __int8 v6 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountService];
  if ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceFetchFromAllSources])unsigned int v7 = 1; {
  else
  }
    unsigned int v7 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService];
  if (([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameUserAccountService] & 1) != 0
    || ((v7 | [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSmootSubscriptionService]) & 1) != 0)
  {
    id v8 = [(VSUserAccountRegistry *)self _predicateForFetchingZeroResults];
    long long v31 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithSourceType:&off_100014FE8];

    id v9 = [(VSUserAccountRegistry *)self _predicateForFetchingZeroResults];
    long long v30 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithSourceType:&off_100015000];

    LODWORD(v9) = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceReadWriteWebSources];
    id v10 = [(VSUserAccountRegistry *)self _predicateForFetchingZeroResults];
    if (v9)
    {
      uint64_t v11 = [(VSUserAccountRegistry *)self _predicateForUserAccountWithSourceType:&off_100015018];

      id v10 = (void *)v11;
    }
    uint64_t v12 = [v5 signingIdentifier];
    if (v12) {
      char v13 = v7;
    }
    else {
      char v13 = 1;
    }
    id v14 = [(VSUserAccountRegistry *)self _predicateForFetchingAllResults];
    if ((v13 & 1) == 0)
    {
      uint64_t v15 = [(VSUserAccountRegistry *)self _predicateForUserAccountFromSourceID:v12];

      id v14 = (void *)v15;
    }
    long long v16 = [(VSUserAccountRegistry *)self _predicateForFetchingAllResults];
    if ((v3 & 1) == 0)
    {
      uint64_t v17 = [(VSUserAccountRegistry *)self _predicateForUserAccountFromCurrentDevice];

      long long v16 = (void *)v17;
    }
    long long v18 = [(VSUserAccountRegistry *)self _predicateForFetchingAllResults];
    long long v29 = (void *)v12;
    if ((v6 & 1) == 0)
    {
      uint64_t v19 = [(VSUserAccountRegistry *)self _predicateForIsSignedOut:0];

      long long v18 = (void *)v19;
    }
    v36[0] = v14;
    v36[1] = v16;
    v36[2] = v18;
    id v20 = +[NSArray arrayWithObjects:v36 count:3];
    id v21 = +[NSCompoundPredicate andPredicateWithSubpredicates:v20];

    v35[0] = v31;
    v35[1] = v30;
    v35[2] = v10;
    id v22 = +[NSArray arrayWithObjects:v35 count:3];
    id v23 = +[NSCompoundPredicate orPredicateWithSubpredicates:v22];

    v34[0] = v21;
    v34[1] = v23;
    id v24 = +[NSArray arrayWithObjects:v34 count:2];
    id v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

    id v26 = VSDefaultLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "VSUserAccountRegistry Using Predicate: %@", buf, 0xCu);
    }
  }
  else
  {
    id v27 = VSDefaultLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "VSUserAccountRegistry - No Internal or Minimum Entitlement, Returning Predicate NO", buf, 2u);
    }

    id v25 = [(VSUserAccountRegistry *)self _predicateForFetchingZeroResults];
  }

  return v25;
}

- (void)updateManager:(id)a3 updateRequestDidFinish:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [v5 userAccount];
  unsigned int v7 = [v5 updatedUserAccount];
  if ([(VSUserAccountRegistry *)self shouldAllowUserAccountUpdate:v7])
  {
    id v8 = [v5 updateError];

    if (v8)
    {
      id v9 = VSErrorLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000CF78(v5);
      }
    }
    else
    {
      if (!v7) {
        goto LABEL_8;
      }
      id v10 = [v7 sourceType];
      if (v10 == [v6 sourceType]
        && ([v7 sourceIdentifier],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            [v6 sourceIdentifier],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            unsigned int v13 = [v11 isEqual:v12],
            v12,
            v11,
            v13))
      {
        id v14 = VSDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v22 = v5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updated user account allowed for insert: %@", buf, 0xCu);
        }

        uint64_t v15 = [v6 updateURL];
        long long v16 = [v15 absoluteString];
        [v7 setModifierIdentifier:v16];

        uint64_t v17 = VSDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = [v7 modifierIdentifier];
          *(_DWORD *)long long buf = 138412290;
          id v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Modifier identifier: %@", buf, 0xCu);
        }
        [v7 setModifierType:VSMetricAccountUpdateValueModifierTypeJS];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10000B7AC;
        v19[3] = &unk_1000144C8;
        id v20 = v7;
        [(VSUserAccountRegistry *)self _insertUserAccount:v20 completion:v19];
        id v9 = v20;
      }
      else
      {
        id v9 = VSErrorLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000CF10();
        }
      }
    }
  }
  else
  {
    id v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000C954();
    }
  }

LABEL_8:
}

- (void)updateManagerDidFinish:(id)a3
{
  id v4 = a3;
  [(VSUserAccountRegistry *)self setUpdateManager:0];
  [(VSUserAccountRegistry *)self setCurrentUpdateSessionIsForced:0];
  [(VSUserAccountRegistry *)self resetTimer];
  id v5 = [(VSUserAccountRegistry *)self delegate];
  [v5 userAccountRegistry:self didFinishUpdatingUserAccountsWithManager:v4];
}

- (VSUserAccountRegistryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSUserAccountRegistryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSUserAccountPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)currentUpdateSessionIsForced
{
  return self->_currentUpdateSessionIsForced;
}

- (void)setCurrentUpdateSessionIsForced:(BOOL)a3
{
  self->_currentUpdateSessionIsForced = a3;
}

- (VSUserAccountUpdateManager)updateManager
{
  return self->_updateManager;
}

- (void)setUpdateManager:(id)a3
{
}

- (WLKSettingsStore)sharedSettingsStore
{
  return self->_sharedSettingsStore;
}

- (void)setSharedSettingsStore:(id)a3
{
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void)setPrivacyFacade:(id)a3
{
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)storesLoaded
{
  return self->_storesLoaded;
}

- (void)setStoresLoaded:(BOOL)a3
{
  self->_storesLoaded = a3;
}

- (os_unfair_lock_s)loadingStoresLock
{
  return self->_loadingStoresLock;
}

- (void)setLoadingStoresLock:(os_unfair_lock_s)a3
{
  self->_loadingStoresLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_sharedSettingsStore, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end