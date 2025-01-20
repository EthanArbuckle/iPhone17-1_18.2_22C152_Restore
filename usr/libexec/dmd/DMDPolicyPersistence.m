@interface DMDPolicyPersistence
- (BOOL)_loadPersistentStoreIfNeeded:(id *)a3;
- (BOOL)_upsertPolicy:(int64_t)a3 forType:(id)a4 identifier:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 policyToUpdate:(id)a9 managedObjectContext:(id)a10;
- (BOOL)alarms;
- (BOOL)isInLegacyDowntimeWithPolicies:(id)a3 priorities:(id)a4;
- (BOOL)isInManagedSettingsDowntime;
- (BOOL)isPersistentContainerLoaded;
- (DMDPolicyPersistence)init;
- (DMDPolicyPersistence)initWithPersistentStoreDescriptions:(id)a3;
- (MOEffectiveSettingsStore)effectiveSettingsStore;
- (NSArray)distributedNotificationNames;
- (NSArray)managedSettingsGroups;
- (NSArray)notifyMatchingNotifications;
- (NSCache)bundleIdentifierPolicyCache;
- (NSCache)categoryIdentifierPolicyCache;
- (NSCache)effectivePolicyCache;
- (NSCache)websiteURLsPolicyCache;
- (NSManagedObjectContext)internalContext;
- (NSManagedObjectContext)registrationContext;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)emergencyModeQueue;
- (id)_effectiveCategoryPoliciesForCategoryShieldPolicy:(id)a3 type:(id)a4 excludedIdentifiersKey:(id)a5;
- (id)_effectivePoliciesForTypes:(id)a3 outError:(id *)a4;
- (id)_effectivePolicyForManagedSettingsIdentifier:(id)a3 type:(id)a4 excludedIdentifiers:(id)a5;
- (id)_effectivePolicyForType:(id)a3 outError:(id *)a4;
- (id)_fetchCategoriesForBundleIdentifiers:(id)a3 withError:(id *)a4;
- (id)_fetchCategoriesIfNeededForWebsiteURLs:(id)a3 withError:(id *)a4;
- (id)_fetchParentBundleIdentifiersForBundleIdentifiers:(id)a3;
- (id)_recalculateEffectivePolicyForType:(id)a3 outError:(id *)a4;
- (void)_appendPolicyForBundleIdentifiers:(id)a3 toPolicies:(id)a4 categories:(id)a5 parentBundleIdentifiers:(id)a6 policiesByType:(id)a7;
- (void)_appendPolicyForCategoryIdentifiers:(id)a3 toPolicies:(id)a4 policiesByType:(id)a5;
- (void)_appendPolicyForWebsiteURLs:(id)a3 toPolicies:(id)a4 categories:(id)a5 policiesByType:(id)a6;
- (void)_clearPolicyCachesForTypes:(id)a3;
- (void)_enableEmergencyModeUntilDate:(id)a3 referenceDate:(id)a4 withCompletionHandler:(id)a5;
- (void)_handleChangesToPolicyTypes:(id)a3;
- (void)_notifyClientsRegisteredForPolicyTypes:(id)a3;
- (void)_performBackgroundTask:(id)a3;
- (void)_performBackgroundTaskAndWait:(id)a3;
- (void)_performRegistrationBackgroundTask:(id)a3;
- (void)_recalculateEffectivePolicyForTypes:(id)a3;
- (void)_removeOrphanedPoliciesFromFetchRequest:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5;
- (void)addRegistration:(id)a3 replyHandler:(id)a4;
- (void)disableEmergencyModeWithCompletionHandler:(id)a3;
- (void)emergencyModeStatusWithCompletionHandler:(id)a3;
- (void)enableEmergencyModeForDuration:(double)a3 withCompletionHandler:(id)a4;
- (void)enableEmergencyModeWithCompletionHandler:(id)a3;
- (void)handleAlarmWithIdentifier:(id)a3;
- (void)handleDistributedNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)handleManagedEffectiveSettingsChangeInGroup:(id)a3;
- (void)handleNotifyMatchingNotificationWithName:(id)a3;
- (void)removeEffectivePolicyFromOrganizationIdentifier:(id)a3 declarationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForCategoryIdentifiers:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForTypes:(id)a3 replyHandler:(id)a4;
- (void)requestPoliciesForWebsiteURLs:(id)a3 replyHandler:(id)a4;
- (void)setEffectivePolicy:(int64_t)a3 forType:(id)a4 identifiers:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 completionHandler:(id)a9;
- (void)setInternalContext:(id)a3;
- (void)setIsPersistentContainerLoaded:(BOOL)a3;
- (void)setRegistrationContext:(id)a3;
@end

@implementation DMDPolicyPersistence

- (void)emergencyModeStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(DMDPolicyPersistence *)self emergencyModeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B50;
  block[3] = &unk_1000CB4E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)addRegistration:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000061E4;
  v9[3] = &unk_1000CBB50;
  v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performRegistrationBackgroundTask:v9];
}

- (void)_performRegistrationBackgroundTask:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unsigned int v5 = [(DMDPolicyPersistence *)self _loadPersistentStoreIfNeeded:&v11];
  id v6 = v11;
  if (v5)
  {
    [(DMDPolicyPersistence *)self registrationContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006F74;
    v8[3] = &unk_1000CB3B8;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v4;
    id v7 = v9;
    [v7 performBlock:v8];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (NSManagedObjectContext)registrationContext
{
  return self->_registrationContext;
}

- (void)requestPoliciesForTypes:(id)a3 replyHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006924;
  v8[3] = &unk_1000CBB50;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v8];
}

- (void)_performBackgroundTask:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unsigned int v5 = [(DMDPolicyPersistence *)self _loadPersistentStoreIfNeeded:&v11];
  id v6 = v11;
  if (v5)
  {
    [(DMDPolicyPersistence *)self internalContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006F8C;
    v8[3] = &unk_1000CB3B8;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v4;
    id v7 = v9;
    [v7 performBlock:v8];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (BOOL)_loadPersistentStoreIfNeeded:(id *)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000620E0;
  v16 = sub_1000620F0;
  id v17 = 0;
  id v5 = [(DMDPolicyPersistence *)self persistentContainer];
  objc_sync_enter(v5);
  if (![(DMDPolicyPersistence *)self isPersistentContainerLoaded])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000620F8;
    v9[3] = &unk_1000CBB28;
    id v11 = &v12;
    void v9[4] = self;
    id v10 = v5;
    [v10 loadPersistentStoresWithCompletionHandler:v9];
  }
  BOOL v6 = [(DMDPolicyPersistence *)self isPersistentContainerLoaded];
  objc_sync_exit(v5);

  if (a3) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0) {
    *a3 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)isPersistentContainerLoaded
{
  return self->_isPersistentContainerLoaded;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (MOEffectiveSettingsStore)effectiveSettingsStore
{
  return self->_effectiveSettingsStore;
}

- (NSManagedObjectContext)internalContext
{
  return self->_internalContext;
}

- (id)_effectiveCategoryPoliciesForCategoryShieldPolicy:(id)a3 type:(id)a4 excludedIdentifiersKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = [v8 policy];
  if (v12 == (id)2)
  {
    v23 = [v8 excludedContent];
    uint64_t v14 = [v23 valueForKey:v10];

    if (v14)
    {
      v15 = +[NSSet setWithArray:v14];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v16 = +[DMFEffectivePolicy downtimeCategoryIdentifiers];
      id v24 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        v31 = v14;
        id v32 = v10;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v16);
            }
            v28 = [(DMDPolicyPersistence *)self _effectivePolicyForManagedSettingsIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i) type:v9 excludedIdentifiers:v15];
            [v11 addObject:v28];
          }
          id v25 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v25);
        goto LABEL_20;
      }
LABEL_21:
    }
  }
  else
  {
    if (v12 != (id)1) {
      goto LABEL_23;
    }
    v13 = [v8 excludedContent];
    uint64_t v14 = [v13 valueForKey:v10];

    if (v14)
    {
      v15 = +[NSSet setWithArray:v14];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v16 = [v8 specificCategories];
      id v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v17)
      {
        id v18 = v17;
        v31 = v14;
        id v32 = v10;
        id v30 = v8;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) identifier];
            v22 = [(DMDPolicyPersistence *)self _effectivePolicyForManagedSettingsIdentifier:v21 type:v9 excludedIdentifiers:v15];
            [v11 addObject:v22];
          }
          id v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v18);
        id v8 = v30;
LABEL_20:
        uint64_t v14 = v31;
        id v10 = v32;
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }

LABEL_23:

  return v11;
}

- (OS_dispatch_queue)emergencyModeQueue
{
  return self->_emergencyModeQueue;
}

- (DMDPolicyPersistence)init
{
  v3 = +[NSFileManager dmd_userEffectivePoliciesDatabaseURL];
  id v4 = objc_opt_new();
  [v4 setURL:v3];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  BOOL v6 = [(DMDPolicyPersistence *)self initWithPersistentStoreDescriptions:v5];

  return v6;
}

- (DMDPolicyPersistence)initWithPersistentStoreDescriptions:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DMDPolicyPersistence;
  id v5 = [(DMDPolicyPersistence *)&v37 init];
  if (v5)
  {
    BOOL v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 URLForResource:@"DMDEffectivePolicies" withExtension:@"momd"];

    id v32 = (void *)v7;
    id v8 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v7];
    id v9 = (NSPersistentContainer *)[objc_alloc((Class)NSPersistentContainer) initWithName:@"EffectivePolicies" managedObjectModel:v8];
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = v9;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = [v4 copy];
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v16 setShouldAddStoreAsynchronously:0];
          [v16 setOption:NSFileProtectionNone forKey:NSPersistentStoreFileProtectionKey];
        }
        id v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    [(NSPersistentContainer *)v5->_persistentContainer setPersistentStoreDescriptions:v11];
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.dmd.policy.emergency-mode", v18);
    emergencyModeQueue = v5->_emergencyModeQueue;
    v5->_emergencyModeQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = objc_opt_new();
    effectiveSettingsStore = v5->_effectiveSettingsStore;
    v5->_effectiveSettingsStore = (MOEffectiveSettingsStore *)v21;

    v23 = (NSCache *)objc_alloc_init((Class)NSCache);
    effectivePolicyCache = v5->_effectivePolicyCache;
    v5->_effectivePolicyCache = v23;

    id v25 = (NSCache *)objc_alloc_init((Class)NSCache);
    bundleIdentifierPolicyCache = v5->_bundleIdentifierPolicyCache;
    v5->_bundleIdentifierPolicyCache = v25;

    v27 = (NSCache *)objc_alloc_init((Class)NSCache);
    categoryIdentifierPolicyCache = v5->_categoryIdentifierPolicyCache;
    v5->_categoryIdentifierPolicyCache = v27;

    v29 = (NSCache *)objc_alloc_init((Class)NSCache);
    websiteURLsPolicyCache = v5->_websiteURLsPolicyCache;
    v5->_websiteURLsPolicyCache = v29;
  }
  return v5;
}

- (void)_performBackgroundTaskAndWait:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unsigned int v5 = [(DMDPolicyPersistence *)self _loadPersistentStoreIfNeeded:&v11];
  id v6 = v11;
  if (v5)
  {
    [(DMDPolicyPersistence *)self internalContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000624EC;
    v8[3] = &unk_1000CB3B8;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v4;
    id v7 = v9;
    [v7 performBlockAndWait:v8];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
  }
}

- (id)_effectivePoliciesForTypes:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v6, "count")];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v18 = 0;
        uint64_t v14 = [(DMDPolicyPersistence *)self _effectivePolicyForType:v13 outError:&v18];
        id v15 = v18;
        [v7 setObject:v14 forKeyedSubscript:v13];

        if (v15)
        {

          if (a4)
          {
            id v15 = v15;
            id v16 = 0;
            *a4 = v15;
          }
          else
          {
            id v16 = 0;
          }
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = [v7 copy];
  id v15 = 0;
LABEL_13:

  return v16;
}

- (id)_effectivePolicyForType:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [(DMDPolicyPersistence *)self effectivePolicyCache];
  id v8 = [v7 objectForKey:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(DMDPolicyPersistence *)self _recalculateEffectivePolicyForType:v6 outError:a4];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)_recalculateEffectivePolicyForType:(id)a3 outError:(id *)a4
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000620E0;
  v29 = sub_1000620F0;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_1000620E0;
  v23 = sub_1000620F0;
  id v24 = 0;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10006298C;
  uint64_t v14 = &unk_1000CBB78;
  id v17 = &v19;
  id v6 = a3;
  id v15 = v6;
  id v16 = self;
  id v18 = &v25;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:&v11];
  if (v20[5])
  {
    id v7 = DMFPolicyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [[v20[5] verboseDescription:v11, v12, v13, v14];
      sub_100086F78((uint64_t)v6, v8, buf, v7);
    }

    if (a4) {
      *a4 = (id) v20[5];
    }
  }
  id v9 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

- (BOOL)isInLegacyDowntimeWithPolicies:(id)a3 priorities:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = +[DMFEffectivePolicy downtimeCategoryIdentifiers];
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        id v14 = [v12 integerValue];
        id v15 = [v13 integerValue];
        id v16 = (id)DMFHighestPolicyPriority;

        if (v14) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = v15 == v16;
        }
        if (!v17)
        {
          BOOL v18 = 0;
          goto LABEL_14;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (BOOL)isInManagedSettingsDowntime
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(DMDPolicyPersistence *)self effectiveSettingsStore];
    id v4 = [v3 screenTime];
    id v5 = [v4 categoryShieldPolicies];

    if (v5)
    {
      id v6 = +[MOCategory all];
      id v7 = [v5 objectForKeyedSubscript:v6];

      if (v7) {
        unsigned int v8 = [MOScreenTimeShieldPolicyNone isEqualToString:v7] ^ 1;
      }
      else {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)_effectivePolicyForManagedSettingsIdentifier:(id)a3 type:(id)a4 excludedIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setType:v8];

  [v10 setIdentifier:v9];
  [v10 setOrganizationIdentifier:@"com.apple.ManagedSettings"];
  [v10 setDeclarationIdentifier:@"com.apple.ManagedSettings.declaration-identifier"];
  [v10 setPolicy:5];
  [v10 setPriority:DMFLowestPolicyPriority];
  [v10 setExcludedIdentifiers:v7];

  return v10;
}

- (void)requestPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006364C;
  v9[3] = &unk_1000CBB50;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v9];
}

- (void)_appendPolicyForBundleIdentifiers:(id)a3 toPolicies:(id)a4 categories:(id)a5 parentBundleIdentifiers:(id)a6 policiesByType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v67 = a6;
  id v15 = a7;
  v66 = [v15 objectForKeyedSubscript:DMFEffectivePolicyTypeApplication];
  v65 = [v15 objectForKeyedSubscript:DMFEffectivePolicyTypeApplicationCategory];
  v64 = [v15 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory];
  v59 = v15;
  v63 = [v15 objectForKeyedSubscript:DMFEffectivePolicyTypeWeb];
  v60 = +[DMFEffectivePolicy unblockableCategoryIdentifiers];
  id v16 = +[DMFEffectivePolicy unblockableBundleIdentifiers];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v85;
    uint64_t v69 = *(void *)v85;
    v71 = self;
    v72 = v13;
    v61 = v16;
    id v62 = v17;
    do
    {
      uint64_t v21 = 0;
      id v68 = v19;
      do
      {
        if (*(void *)v85 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v78 = v21;
        uint64_t v22 = *(void *)(*((void *)&v84 + 1) + 8 * v21);
        long long v23 = [v14 objectForKeyedSubscript:v22];
        v77 = v23;
        if (v23)
        {
          long long v24 = v23;
          log = [v23 identifier];
          v76 = [v24 webDomains];
          uint64_t v25 = [v24 equivalentBundleIdentifiers];
          uint64_t v26 = +[NSMutableSet setWithObject:v22];
          if ([v25 count]) {
            [v26 addObjectsFromArray:v25];
          }
          v75 = v26;
          v74 = v25;
          if ([v16 containsObject:v22])
          {
            uint64_t v27 = DMFPolicyLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v89 = v22;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ is unblockable", buf, 0xCu);
            }

            v28 = [(DMDPolicyPersistence *)self bundleIdentifierPolicyCache];
            [v28 setObject:&off_1000D3638 forKey:v22];

            [v13 setObject:&off_1000D3638 forKeyedSubscript:v22];
          }
          else if (log && objc_msgSend(v60, "containsObject:"))
          {
            v29 = DMFPolicyLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v89 = v22;
              __int16 v90 = 2114;
              v91 = log;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ with associated category %{public}@ is unblockable", buf, 0x16u);
            }

            id v30 = [(DMDPolicyPersistence *)self bundleIdentifierPolicyCache];
            [v30 setObject:&off_1000D3638 forKey:v22];

            [v13 setObject:&off_1000D3638 forKeyedSubscript:v22];
            uint64_t v20 = v69;
          }
          else
          {
            v31 = objc_opt_new();
            v73 = [v67 objectForKeyedSubscript:v22];
            if ([v73 count])
            {
              id v32 = DMFPolicyLog();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                long long v33 = [v73 allObjects];
                long long v34 = [v33 componentsJoinedByString:@","];
                *(_DWORD *)buf = 138543618;
                uint64_t v89 = v22;
                __int16 v90 = 2114;
                v91 = v34;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has parent applications %{public}@", buf, 0x16u);
              }
              long long v82 = 0u;
              long long v83 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              id v35 = v73;
              id v36 = [v35 countByEnumeratingWithState:&v80 objects:v98 count:16];
              if (v36)
              {
                id v37 = v36;
                uint64_t v38 = *(void *)v81;
                do
                {
                  for (i = 0; i != v37; i = (char *)i + 1)
                  {
                    if (*(void *)v81 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    long long v40 = *(NSObject **)(*((void *)&v80 + 1) + 8 * i);
                    v41 = [v14 objectForKeyedSubscript:v40];
                    v42 = v41;
                    if (v41)
                    {
                      v43 = [v41 identifier];
                      [v31 addObject:v43];
                    }
                    else
                    {
                      v43 = DMFPolicyLog();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        uint64_t v89 = v22;
                        __int16 v90 = 2114;
                        v91 = v40;
                        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Requested application %{public}@ failed to categorize parent application %{public}@", buf, 0x16u);
                      }
                    }
                  }
                  id v37 = [v35 countByEnumeratingWithState:&v80 objects:v98 count:16];
                }
                while (v37);
              }

              uint64_t v20 = v69;
            }
            if (log)
            {
              [v31 arrayByAddingObject:];
              id v44 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v44 = v31;
            }
            id v45 = v44;
            v46 = [v75 allObjects];
            v47 = v45;
            uint64_t v48 = +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:v66 appCategoryPolicy:v65 bundleIdentifiers:v46 categoryPolicy:v64 categoryIdentifiers:v45 webPolicy:v63 webCategoryPolicy:0 webDomains:v76];

            v70 = (void *)v48;
            id v49 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:v48];
            v50 = [(DMDPolicyPersistence *)v71 bundleIdentifierPolicyCache];
            v51 = +[NSNumber numberWithInteger:v49];
            [v50 setObject:v51 forKey:v22];

            v52 = +[NSNumber numberWithInteger:v49];
            [v72 setObject:v52 forKeyedSubscript:v22];

            v53 = DMFPolicyLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              v54 = DMFPolicyUnlocalizedDisplayName();
              v55 = [v47 componentsJoinedByString:@","];
              v56 = [v76 componentsJoinedByString:@","];
              v57 = [v75 allObjects];
              v58 = [v57 componentsJoinedByString:@","];
              *(_DWORD *)buf = 138544386;
              uint64_t v89 = v22;
              __int16 v90 = 2114;
              v91 = v54;
              __int16 v92 = 2114;
              v93 = v55;
              __int16 v94 = 2114;
              v95 = v56;
              __int16 v96 = 2114;
              v97 = v58;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Requested application %{public}@ has policy %{public}@, associated categories:%{public}@ associated sites:%{public}@ equivalent bundle identifiers:%{public}@", buf, 0x34u);

              uint64_t v20 = v69;
            }

            id v16 = v61;
            id v17 = v62;
            id v19 = v68;
            uint64_t v25 = v74;
            self = v71;
            id v13 = v72;
          }
        }
        else
        {
          log = DMFPolicyLog();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v89 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Requested application %{public}@ is missing categorization", buf, 0xCu);
          }
        }

        uint64_t v21 = v78 + 1;
      }
      while ((id)(v78 + 1) != v19);
      id v19 = [v17 countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v19);
  }
}

- (id)_fetchParentBundleIdentifiersForBundleIdentifiers:(id)a3
{
  id v3 = a3;
  uint64_t v22 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v25 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v6 = objc_alloc((Class)LSApplicationRecord);
        id v32 = 0;
        id v7 = [v6 initWithBundleIdentifier:v5 allowPlaceholder:1 error:&v32];
        id v8 = v32;
        id v9 = v8;
        if (v7)
        {
          id v26 = v8;
          id v10 = objc_opt_new();
          id v27 = v7;
          uint64_t v11 = [v7 appClipMetadata];
          id v12 = [v11 parentApplicationIdentifiers];

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v28 objects:v41 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v29;
            do
            {
              id v17 = 0;
              do
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v17);
                if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
                {
                  id v19 = DMFPolicyLog();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    uint64_t v38 = v5;
                    __int16 v39 = 2114;
                    long long v40 = v18;
                    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed looking up parent bundle identifier for app clip: %{public}@ with parent application identifier %{public}@", buf, 0x16u);
                  }
                }
                id v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              id v15 = [v13 countByEnumeratingWithState:&v28 objects:v41 count:16];
            }
            while (v15);
          }

          if ([v10 count]) {
            [v22 setObject:v10 forKeyedSubscript:v5];
          }

          id v9 = v26;
          id v7 = v27;
        }
        else
        {
          id v10 = DMFPolicyLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v38 = v5;
            __int16 v39 = 2114;
            long long v40 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No application record for bundle identifier: %{public}@ with error: %{public}@", buf, 0x16u);
          }
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v25);
  }

  id v20 = [v22 copy];

  return v20;
}

- (void)requestCommunicationPoliciesForBundleIdentifiers:(id)a3 replyHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000648E0;
  v8[3] = &unk_1000CBB50;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v8];
}

- (void)requestPoliciesForCategoryIdentifiers:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100064DB0;
  v9[3] = &unk_1000CBB50;
  uint64_t v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v9];
}

- (void)_appendPolicyForCategoryIdentifiers:(id)a3 toPolicies:(id)a4 policiesByType:(id)a5
{
  id v8 = a3;
  id v36 = a4;
  id v9 = a5;
  long long v34 = [v9 objectForKeyedSubscript:DMFEffectivePolicyTypeApplicationCategory];
  long long v33 = [v9 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory];
  long long v30 = v9;
  id v32 = [v9 objectForKeyedSubscript:DMFEffectivePolicyTypeWebCategory];
  id v10 = +[DMFEffectivePolicy unblockableCategoryIdentifiers];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v38;
    uint64_t v31 = *(void *)v38;
    do
    {
      id v15 = 0;
      id v35 = v13;
      do
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v15);
        if ([v10 containsObject:v16])
        {
          id v17 = DMFPolicyLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v42 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requested category %{public}@ is unblockable", buf, 0xCu);
          }

          id v18 = [(DMDPolicyPersistence *)self categoryIdentifierPolicyCache];
          [v18 setObject:&off_1000D3638 forKey:v16];

          [v36 setObject:&off_1000D3638 forKeyedSubscript:v16];
        }
        else
        {
          id v19 = v10;
          id v20 = v11;
          uint64_t v21 = [v11 allObjects];
          uint64_t v22 = +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:0 appCategoryPolicy:v34 bundleIdentifiers:0 categoryPolicy:v33 categoryIdentifiers:v21 webPolicy:0 webCategoryPolicy:v32 webDomains:0];

          id v23 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:v22];
          uint64_t v24 = self;
          id v25 = [(DMDPolicyPersistence *)self categoryIdentifierPolicyCache];
          id v26 = +[NSNumber numberWithInteger:v23];
          [v25 setObject:v26 forKey:v16];

          id v27 = +[NSNumber numberWithInteger:v23];
          [v36 setObject:v27 forKeyedSubscript:v16];

          long long v28 = DMFPolicyLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            long long v29 = DMFPolicyUnlocalizedDisplayName();
            *(_DWORD *)buf = 138543618;
            uint64_t v42 = v16;
            __int16 v43 = 2114;
            id v44 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Requested category %{public}@ has policy %{public}@", buf, 0x16u);
          }
          self = v24;
          id v11 = v20;
          id v10 = v19;
          uint64_t v14 = v31;
          id v13 = v35;
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v13);
  }
}

- (void)requestPoliciesForWebsiteURLs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100065674;
  v9[3] = &unk_1000CBB50;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v9];
}

- (void)_appendPolicyForWebsiteURLs:(id)a3 toPolicies:(id)a4 categories:(id)a5 policiesByType:(id)a6
{
  id v9 = a3;
  id v62 = a4;
  id v10 = a5;
  id v11 = a6;
  v56 = [v11 objectForKeyedSubscript:DMFEffectivePolicyTypeApplication];
  v55 = [v11 objectForKeyedSubscript:DMFEffectivePolicyTypeCategory];
  v54 = [v11 objectForKeyedSubscript:DMFEffectivePolicyTypeWeb];
  v47 = v11;
  v53 = [v11 objectForKeyedSubscript:DMFEffectivePolicyTypeWebCategory];
  v57 = +[DMFEffectivePolicy unblockableBundleIdentifiers];
  uint64_t v48 = +[DMFEffectivePolicy unblockableCategoryIdentifiers];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v9;
  id v63 = [obj countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v63)
  {
    uint64_t v61 = *(void *)v70;
    id v12 = CATOperationQueue_ptr;
    id v52 = v10;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v70 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        id v15 = v10;
        uint64_t v16 = [v10 objectForKeyedSubscript:v14];
        id v17 = [v16 identifier];
        id v18 = [v16 bundleIdentifier];
        id v19 = [v16 webDomains];
        id v68 = [v16 equivalentBundleIdentifiers];
        id v20 = [v14 host];
        if (v20)
        {
          v64 = v20;
          uint64_t v21 = [v12[229] setWithObject:v20];
          if ([v19 count]) {
            [v21 addObjectsFromArray:v19];
          }
          uint64_t v22 = objc_opt_new();
          id v23 = v22;
          if (v18) {
            [v22 addObject:v18];
          }
          id v67 = v18;
          uint64_t v24 = v23;
          if ([v68 count]) {
            [v23 addObjectsFromArray:v68];
          }
          v65 = v19;
          v66 = v21;
          if (v67 && objc_msgSend(v57, "containsObject:"))
          {
            id v25 = v17;
            id v26 = DMFPolicyLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v74 = v67;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Requested website with associated bundle identifier %{public}@ is unblockable", buf, 0xCu);
            }

            id v27 = [(DMDPolicyPersistence *)self websiteURLsPolicyCache];
            long long v28 = v27;
            goto LABEL_23;
          }
          if (v17)
          {
            if ([v48 containsObject:v17])
            {
              long long v29 = DMFPolicyLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v74 = v17;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requested website with associated category %{public}@ is unblockable", buf, 0xCu);
              }

              id v27 = [(DMDPolicyPersistence *)self websiteURLsPolicyCache];
              long long v28 = v27;
              id v25 = v17;
LABEL_23:
              [v27 setObject:&off_1000D3638 forKey:v14];

              [v62 setObject:&off_1000D3638 forKeyedSubscript:v14];
              id v12 = CATOperationQueue_ptr;
              id v17 = v25;
              id v10 = v15;
              long long v30 = v23;
LABEL_32:
              id v20 = v64;
              id v18 = v67;

              id v19 = v65;
              goto LABEL_33;
            }
            v59 = v17;
            long long v83 = v17;
            long long v33 = +[NSArray arrayWithObjects:&v83 count:1];
          }
          else
          {
            v59 = 0;
            long long v33 = 0;
          }
          long long v30 = v24;
          long long v34 = [v24 allObjects];
          id v35 = [v66 allObjects];
          id v36 = +[DMFPrioritizedPolicy prioritizedPoliciesForAppPolicy:v56 appCategoryPolicy:0 bundleIdentifiers:v34 categoryPolicy:v55 categoryIdentifiers:v33 webPolicy:v54 webCategoryPolicy:v53 webDomains:v35];

          id v37 = +[DMFPrioritizedPolicy arbitratePolicyForPrioritizedPolicies:v36];
          long long v38 = [(DMDPolicyPersistence *)self websiteURLsPolicyCache];
          long long v39 = +[NSNumber numberWithInteger:v37];
          [v38 setObject:v39 forKey:v14];

          long long v40 = +[NSNumber numberWithInteger:v37];
          [v62 setObject:v40 forKeyedSubscript:v14];

          v41 = DMFPolicyLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            DMFPolicyUnlocalizedDisplayName();
            uint64_t v42 = v51 = v36;
            [v33 componentsJoinedByString:@","];
            __int16 v43 = v50 = v33;
            id v49 = [v66 allObjects];
            id v44 = [v49 componentsJoinedByString:@","];
            id v45 = [v30 allObjects];
            v46 = [v45 componentsJoinedByString:@","];
            *(_DWORD *)buf = 138544386;
            v74 = v14;
            __int16 v75 = 2114;
            v76 = v42;
            __int16 v77 = 2114;
            uint64_t v78 = v43;
            __int16 v79 = 2114;
            long long v80 = v44;
            __int16 v81 = 2114;
            long long v82 = v46;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Requested website %{public}@ has policy %{public}@, associated categories:%{public}@ associated sites:%{public}@ equivalent bundle identifiers:%{public}@", buf, 0x34u);

            long long v33 = v50;
            id v36 = v51;
          }

          id v10 = v52;
          id v17 = v59;
          id v12 = CATOperationQueue_ptr;
          goto LABEL_32;
        }
        uint64_t v31 = v12;
        id v32 = DMFPolicyLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10008713C(v84, &v85, v32);
        }

        [v62 setObject:&off_1000D3638 forKeyedSubscript:v14];
        id v12 = v31;
        id v10 = v15;
LABEL_33:
      }
      id v63 = [obj countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v63);
  }
}

- (id)_fetchCategoriesForBundleIdentifiers:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1000620E0;
  long long v33 = sub_1000620F0;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1000620E0;
  id v27 = sub_1000620F0;
  id v28 = 0;
  id v7 = +[CTCategories sharedCategories];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1000664CC;
  id v18 = &unk_1000CBBA0;
  id v20 = &v29;
  uint64_t v21 = &v23;
  id v8 = v6;
  id v19 = v8;
  uint64_t v22 = 1;
  [v7 categoriesForBundleIDs:v5 completionHandler:&v15];

  id v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0, v15, v16, v17, v18);
  unsigned __int8 v10 = [v8 lockWhenCondition:1 beforeDate:v9];

  if (v10)
  {
    [v8 unlock];
    if (a4)
    {
      id v11 = (void *)v30[5];
      if (v11) {
        *a4 = v11;
      }
    }
    id v12 = (id)v24[5];
  }
  else
  {
    id v13 = DMFPolicyLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000871B4();
    }

    if (a4)
    {
      DMFErrorWithCodeAndUserInfo();
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

- (id)_fetchCategoriesIfNeededForWebsiteURLs:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  id v7 = +[CTCategories sharedCategories];
  if (v7)
  {
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = sub_1000620E0;
    long long v33 = sub_1000620F0;
    id v34 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = sub_1000620E0;
    id v27 = sub_1000620F0;
    id v28 = 0;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_100066804;
    id v18 = &unk_1000CBBA0;
    id v20 = &v29;
    uint64_t v21 = &v23;
    id v8 = v6;
    id v19 = v8;
    uint64_t v22 = 1;
    [v7 categoriesForDomainURLs:v5 completionHandler:&v15];
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0, v15, v16, v17, v18);
    unsigned __int8 v10 = [v8 lockWhenCondition:1 beforeDate:v9];

    if (v10)
    {
      [v8 unlock];
      if (a4)
      {
        id v11 = (void *)v30[5];
        if (v11) {
          *a4 = v11;
        }
      }
      id v12 = (id)v24[5];
    }
    else
    {
      id v13 = DMFPolicyLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000871B4();
      }

      if (a4)
      {
        DMFErrorWithCodeAndUserInfo();
        id v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = 0;
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v12 = &__NSDictionary0__struct;
  }

  return v12;
}

- (void)setEffectivePolicy:(int64_t)a3 forType:(id)a4 identifiers:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000669F8;
  v21[3] = &unk_1000CBBC8;
  id v22 = a5;
  id v23 = a7;
  id v24 = a8;
  uint64_t v25 = self;
  id v26 = v15;
  id v27 = a9;
  int64_t v28 = a3;
  unint64_t v29 = a6;
  id v16 = v15;
  id v17 = v24;
  id v18 = v23;
  id v19 = v22;
  id v20 = v27;
  [(DMDPolicyPersistence *)self _performBackgroundTask:v21];
}

- (BOOL)_upsertPolicy:(int64_t)a3 forType:(id)a4 identifier:(id)a5 priority:(unint64_t)a6 organizationIdentifier:(id)a7 declarationIdentifier:(id)a8 policyToUpdate:(id)a9 managedObjectContext:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = (DMDEffectivePolicy *)a9;
  id v20 = a10;
  if (v19)
  {
    BOOL v21 = [(DMDEffectivePolicy *)v19 policy] != (id)a3;
    [(DMDEffectivePolicy *)v19 setPolicy:a3];
    id v22 = DMFPolicyLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543874;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v15;
      __int16 v28 = 2114;
      id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updating existing policy %{public}@ of type %{public}@ identifier %{public}@", (uint8_t *)&v24, 0x20u);
    }
  }
  else
  {
    id v19 = [[DMDEffectivePolicy alloc] initWithContext:v20];
    [(DMDEffectivePolicy *)v19 setType:v15];
    [(DMDEffectivePolicy *)v19 setIdentifier:v16];
    [(DMDEffectivePolicy *)v19 setOrganizationIdentifier:v17];
    [(DMDEffectivePolicy *)v19 setDeclarationIdentifier:v18];
    [(DMDEffectivePolicy *)v19 setPriority:a6];
    [(DMDEffectivePolicy *)v19 setPolicy:a3];
    id v22 = DMFPolicyLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Adding new policy %{public}@ of type %{public}@", (uint8_t *)&v24, 0x16u);
    }
    BOOL v21 = 1;
  }

  return v21;
}

- (void)removeEffectivePolicyFromOrganizationIdentifier:(id)a3 declarationIdentifier:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100067298;
  v11[3] = &unk_1000CBBF0;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = a5;
  id v8 = v13;
  id v9 = v12;
  id v10 = v15;
  [(DMDPolicyPersistence *)self _performBackgroundTask:v11];
}

- (void)removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000677C0;
  v9[3] = &unk_1000CBB50;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performBackgroundTask:v9];
}

- (void)removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100067964;
  v9[3] = &unk_1000CBB50;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [(DMDPolicyPersistence *)self _performBackgroundTask:v9];
}

- (void)_removeOrphanedPoliciesFromFetchRequest:(id)a3 managedObjectContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v45 = 0;
  id v10 = [a3 execute:&v45];
  id v11 = v45;
  if (v10)
  {
    if ([v10 count])
    {
      id v35 = self;
      long long v38 = v9;
      long long v39 = v11;
      id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v10 count]];
      id v13 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v10 count]];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v37 = v10;
      id v14 = v10;
      id v15 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v42;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v20 = [v19 type:v35];
            [v13 addObject:v20];

            BOOL v21 = [v19 declarationIdentifier];
            [v12 addObject:v21];
            [v8 deleteObject:v19];
            id v22 = DMFPolicyLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v19 organizationIdentifier];
              *(_DWORD *)buf = 138543618;
              v47 = v21;
              __int16 v48 = 2114;
              id v49 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removing orphaned policy %{public}@ in organization %{public}@", buf, 0x16u);
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
        }
        while (v16);
      }

      if ([v8 hasChanges])
      {
        id v40 = v39;
        unsigned int v24 = [v8 save:&v40];
        id v11 = v40;

        if (!v24)
        {
          uint64_t v25 = DMFPolicyLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = [v13 allObjects];
            id v32 = [v31 componentsJoinedByString:@","];
            long long v33 = [v12 componentsJoinedByString:@","];
            id v34 = [v11 verboseDescription];
            *(_DWORD *)buf = 138543874;
            v47 = v32;
            __int16 v48 = 2114;
            id v49 = v33;
            __int16 v50 = 2114;
            v51 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not remove orphaned policies types %{public}@ for declarations %{public}@: %{public}@", buf, 0x20u);
          }
          id v26 = 0;
          id v10 = v37;
          id v9 = v38;
LABEL_27:

          ((void (**)(id, id))v9)[2](v9, v26);
          goto LABEL_28;
        }
      }
      else
      {
        id v11 = v39;
      }
      if (objc_msgSend(v14, "count", v35)) {
        [v36 _handleChangesToPolicyTypes:v13];
      }
      uint64_t v25 = DMFPolicyLog();
      id v10 = v37;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = [v13 allObjects];
        id v29 = [v28 componentsJoinedByString:@","];
        long long v30 = [v12 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138543618;
        v47 = v29;
        __int16 v48 = 2114;
        id v49 = v30;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully removed orphaned policy types %{public}@ for declarations %{public}@", buf, 0x16u);
      }
      id v26 = v12;
      id v9 = v38;
      goto LABEL_27;
    }
    ((void (**)(id, void *))v9)[2](v9, &__NSArray0__struct);
  }
  else
  {
    id v27 = DMFPolicyLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000872F0(v11);
    }

    v9[2](v9, 0);
  }
LABEL_28:
}

- (void)_handleChangesToPolicyTypes:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100068098;
  v4[3] = &unk_1000CBC40;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(DMDPolicyPersistence *)v5 _performBackgroundTaskAndWait:v4];
}

- (void)_recalculateEffectivePolicyForTypes:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100068174;
  v5[3] = &unk_1000CBC40;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v5];
}

- (void)_clearPolicyCachesForTypes:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006839C;
  v5[3] = &unk_1000CBC40;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(DMDPolicyPersistence *)self _performBackgroundTaskAndWait:v5];
}

- (void)_notifyClientsRegisteredForPolicyTypes:(id)a3
{
  id v3 = a3;
  id v4 = +[DMDPolicyRegistration fetchRequest];
  id v35 = 0;
  id v5 = [v4 execute:&v35];
  id v6 = v35;
  id v7 = v6;
  if (v5)
  {
    id v25 = v6;
    id v26 = v4;
    id v8 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v15 = [v14 policyTypes:v25, v26];
          unsigned int v16 = [v15 intersectsSet:v3];

          if (v16)
          {
            uint64_t v17 = [v14 identifier];
            [v8 addObject:v17];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v11);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
          unsigned int v24 = DMFPolicyLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Posting notification for registration %{public}@", buf, 0xCu);
          }

          notify_post((const char *)[v23 UTF8String]);
        }
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v20);
    }

    id v7 = v25;
    id v4 = v26;
  }
  else
  {
    id v18 = DMFPolicyLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100087410(v7);
    }
  }
}

- (void)enableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDPolicyPersistence *)self emergencyModeQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000688FC;
  v7[3] = &unk_1000CA828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)enableEmergencyModeForDuration:(double)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(DMDPolicyPersistence *)self emergencyModeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068A60;
  block[3] = &unk_1000CBC68;
  double v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)_enableEmergencyModeUntilDate:(id)a3 referenceDate:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  double v11 = [(DMDPolicyPersistence *)self emergencyModeQueue];
  dispatch_assert_queue_V2(v11);

  if (!v8 || [v9 compare:v8] != (id)-1)
  {
    uint64_t v12 = DMFEmergencyModeLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100087494();
    }
LABEL_5:

    uint64_t v13 = DMFErrorWithCodeAndUserInfo();
    xpc_object_t v14 = (xpc_object_t)v13;
    goto LABEL_6;
  }
  [v8 timeIntervalSince1970];
  int64_t v16 = (uint64_t)(v15 * 1000000000.0);
  if (v16 <= 0)
  {
    uint64_t v12 = DMFEmergencyModeLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100087500();
    }
    goto LABEL_5;
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v14, (const char *)[@"ShouldWake" UTF8String], 0);
  xpc_dictionary_set_date(v14, (const char *)[@"Date" UTF8String], v16);
  [@"com.apple.alarm" UTF8String];
  [@"com.apple.dmd.emergency-mode.alarm" UTF8String];
  xpc_set_event();
  notify_post((const char *)[DMFEmergencyModeChangedNotification UTF8String]);
  uint64_t v17 = DMFEmergencyModeLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enabling Emergency Mode until: %{public}@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v13 = 0;
LABEL_6:
  v10[2](v10, v13);
}

- (void)disableEmergencyModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDPolicyPersistence *)self emergencyModeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068DD0;
  block[3] = &unk_1000CB4E0;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  return (NSArray *)&off_1000D2F60;
}

- (NSArray)distributedNotificationNames
{
  v4[0] = CTCategoriesDidChangeNotification;
  v4[1] = @"com.apple.LaunchServices.applicationRegistered";
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (NSArray)managedSettingsGroups
{
  v4[0] = MOEffectiveSettingsGroupAccount;
  v4[1] = MOEffectiveSettingsGroupScreenTime;
  void v4[2] = MOEffectiveSettingsGroupShield;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = DMFPolicyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling alarm with identifier: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  if ([v3 isEqualToString:@"com.apple.dmd.emergency-mode.alarm"]) {
    notify_post((const char *)[DMFEmergencyModeChangedNotification UTF8String]);
  }
}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4 = a3;
  int v5 = DMFPolicyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling notify matching notification with name: %{public}@", buf, 0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000691C0;
    v6[3] = &unk_1000CBC90;
    v6[4] = self;
    [(DMDPolicyPersistence *)self _performBackgroundTask:v6];
  }
}

- (void)handleDistributedNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DMFPolicyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling distributed notification with name: %{public}@", buf, 0xCu);
  }

  if ([v6 isEqualToString:CTCategoriesDidChangeNotification])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000693F0;
    v12[3] = &unk_1000CBC90;
    v12[4] = self;
    [(DMDPolicyPersistence *)self _performBackgroundTask:v12];
  }
  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
  {
    id v9 = [v7 objectForKeyedSubscript:@"isPlaceholder"];
    id v10 = v9;
    if (v9 && ([v9 BOOLValue] & 1) == 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100069458;
      v11[3] = &unk_1000CBC90;
      void v11[4] = self;
      [(DMDPolicyPersistence *)self _performBackgroundTask:v11];
    }
  }
}

- (void)handleManagedEffectiveSettingsChangeInGroup:(id)a3
{
  id v4 = a3;
  int v5 = DMFPolicyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling managed settings group change: %{public}@", buf, 0xCu);
  }

  if ([v4 isEqualToString:MOEffectiveSettingsGroupShield])
  {
    id v6 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    id v7 = sub_1000696A0;
LABEL_10:
    v6[2] = v7;
    v6[3] = &unk_1000CBC90;
    v6[4] = self;
    -[DMDPolicyPersistence _performBackgroundTask:](self, "_performBackgroundTask:");
    goto LABEL_11;
  }
  if ([v4 isEqualToString:MOEffectiveSettingsGroupAccount])
  {
    id v6 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    id v7 = sub_100069780;
    goto LABEL_10;
  }
  if (_os_feature_enabled_impl()
    && [v4 isEqualToString:MOEffectiveSettingsGroupScreenTime])
  {
    id v6 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v7 = sub_1000697E8;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setIsPersistentContainerLoaded:(BOOL)a3
{
  self->_isPersistentContainerLoaded = a3;
}

- (void)setInternalContext:(id)a3
{
}

- (void)setRegistrationContext:(id)a3
{
}

- (NSCache)effectivePolicyCache
{
  return self->_effectivePolicyCache;
}

- (NSCache)bundleIdentifierPolicyCache
{
  return self->_bundleIdentifierPolicyCache;
}

- (NSCache)categoryIdentifierPolicyCache
{
  return self->_categoryIdentifierPolicyCache;
}

- (NSCache)websiteURLsPolicyCache
{
  return self->_websiteURLsPolicyCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteURLsPolicyCache, 0);
  objc_storeStrong((id *)&self->_categoryIdentifierPolicyCache, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierPolicyCache, 0);
  objc_storeStrong((id *)&self->_effectivePolicyCache, 0);
  objc_storeStrong((id *)&self->_emergencyModeQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_registrationContext, 0);
  objc_storeStrong((id *)&self->_internalContext, 0);

  objc_storeStrong((id *)&self->_effectiveSettingsStore, 0);
}

@end