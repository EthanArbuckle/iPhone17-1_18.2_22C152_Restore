@interface SDScreenTimeMonitor
- (BOOL)isCacheReady;
- (NSArray)restrictedActivityTypes;
- (SDScreenTimeMonitor)initWithPoliciesChangedHandler:(id)a3;
- (id)_bundleIDForActivity:(id)a3;
- (id)policiesChangedHandler;
- (int64_t)cachedPolicyForActivityType:(id)a3;
- (int64_t)cachedPolicyForBundleID:(id)a3;
- (void)_handlePolicyChange;
- (void)_handleUpdateForPoliciesByBundleIdentifier:(id)a3;
- (void)_retrieveMissingPolicies;
- (void)_retrievePoliciesForBundleIdentifiers:(id)a3;
- (void)_updateBundleIdentifierMappings;
- (void)invalidate;
- (void)requestPoliciesForActivities:(id)a3;
- (void)setCacheReady:(BOOL)a3;
- (void)setRestrictedActivityTypes:(id)a3;
- (void)updateWithActivities:(id)a3;
@end

@implementation SDScreenTimeMonitor

- (SDScreenTimeMonitor)initWithPoliciesChangedHandler:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SDScreenTimeMonitor;
  v5 = [(SDScreenTimeMonitor *)&v25 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    bundleIdentifierByActivityType = v5->_bundleIdentifierByActivityType;
    v5->_bundleIdentifierByActivityType = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    policiesByBundleIdentifier = v5->_policiesByBundleIdentifier;
    v5->_policiesByBundleIdentifier = (NSMutableDictionary *)v8;

    id location = 0;
    objc_initWeak(&location, v5);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.sharing.screenTimeUpdateQueue", v10);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

    id v13 = objc_alloc((Class)DMFApplicationPolicyMonitor);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100101158;
    v22 = &unk_1008CA3B0;
    objc_copyWeak(&v23, &location);
    v14 = (DMFApplicationPolicyMonitor *)[v13 initWithPolicyChangeHandler:&v19];
    screenTimeMonitor = v5->_screenTimeMonitor;
    v5->_screenTimeMonitor = v14;

    id v16 = [v4 copy:v19, v20, v21, v22];
    id policiesChangedHandler = v5->_policiesChangedHandler;
    v5->_id policiesChangedHandler = v16;

    atomic_store(0, (unsigned __int8 *)&v5->_isCacheReady);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_handlePolicyChange
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010120C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)invalidate
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001012D8;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (BOOL)isCacheReady
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCacheReady);
  return v2 & 1;
}

- (void)setCacheReady:(BOOL)a3
{
}

- (int64_t)cachedPolicyForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([(SDScreenTimeMonitor *)self isCacheReady])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100101440;
    block[3] = &unk_1008CD678;
    v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(workQueue, block);
  }
  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)updateWithActivities:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100101538;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)requestPoliciesForActivities:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001016D0;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (int64_t)cachedPolicyForActivityType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if ([(SDScreenTimeMonitor *)self isCacheReady])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001019E0;
    block[3] = &unk_1008CD6A0;
    block[4] = self;
    id v9 = v4;
    v10 = &v11;
    dispatch_sync(workQueue, block);
  }
  int64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_bundleIDForActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  v5 = UIActivityTypeMessage;
  if (v4 == v5)
  {

    goto LABEL_6;
  }
  int64_t v6 = v5;
  if ((v4 == 0) == (v5 != 0))
  {

    goto LABEL_8;
  }
  unsigned __int8 v7 = [(NSString *)v4 isEqual:v5];

  if (v7)
  {
LABEL_6:
    id v8 = @"com.apple.MobileSMS";
    goto LABEL_30;
  }
LABEL_8:
  id v9 = [v3 activityType];
  v10 = UIActivityTypeMail;
  if (v9 == v10)
  {

    goto LABEL_13;
  }
  uint64_t v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_15;
  }
  unsigned __int8 v12 = [(NSString *)v9 isEqual:v10];

  if (v12)
  {
LABEL_13:
    id v8 = @"com.apple.mobilemail";
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v13 = [v3 activityType];
  uint64_t v14 = UIActivityTypeSharePlay;
  if (v13 == v14)
  {

    goto LABEL_20;
  }
  v15 = v14;
  if ((v13 == 0) != (v14 != 0))
  {
    unsigned __int8 v16 = [(NSString *)v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_22;
    }
LABEL_20:
    id v8 = @"com.apple.telephonyutilities.callservicesd";
    goto LABEL_30;
  }

LABEL_22:
  v17 = [v3 applicationExtension];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v3 containingAppBundleIdentifier];
    }
    else
    {
      v18 = share_sheet_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_10010251C((uint64_t)v3);
      }

      v19 = [v17 _plugIn];
      uint64_t v20 = [v19 identifier];
      v21 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:v20];

      v22 = [v21 containingBundle];
      id v8 = [v22 bundleIdentifier];
    }
  }
  else
  {
    id v8 = 0;
  }

LABEL_30:

  return v8;
}

- (void)_updateBundleIdentifierMappings
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_activities;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        bundleIdentifierByActivityType = self->_bundleIdentifierByActivityType;
        v10 = [v8 activityType:v14];
        uint64_t v11 = [(NSMutableDictionary *)bundleIdentifierByActivityType objectForKeyedSubscript:v10];

        if (!v11)
        {
          uint64_t v11 = [(SDScreenTimeMonitor *)self _bundleIDForActivity:v8];
          if (!v11) {
            continue;
          }
        }
        unsigned __int8 v12 = self->_bundleIdentifierByActivityType;
        uint64_t v13 = [v8 activityType];
        [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_retrieveMissingPolicies
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = objc_opt_new();
  bundleIdentifierByActivityType = self->_bundleIdentifierByActivityType;
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_100101F7C;
  id v9 = &unk_1008CD6C8;
  v10 = self;
  id v5 = v3;
  id v11 = v5;
  [(NSMutableDictionary *)bundleIdentifierByActivityType enumerateKeysAndObjectsUsingBlock:&v6];
  if (objc_msgSend(v5, "count", v6, v7, v8, v9, v10)) {
    [(SDScreenTimeMonitor *)self _retrievePoliciesForBundleIdentifiers:v5];
  }
}

- (void)_handleUpdateForPoliciesByBundleIdentifier:(id)a3
{
  [(NSMutableDictionary *)self->_policiesByBundleIdentifier addEntriesFromDictionary:a3];
  id v4 = +[NSMutableArray arrayWithCapacity:[(NSMutableDictionary *)self->_policiesByBundleIdentifier count]];
  policiesByBundleIdentifier = self->_policiesByBundleIdentifier;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  unsigned __int8 v12 = sub_10010211C;
  uint64_t v13 = &unk_1008CD6F0;
  long long v14 = self;
  id v6 = v4;
  id v15 = v6;
  [(NSMutableDictionary *)policiesByBundleIdentifier enumerateKeysAndObjectsUsingBlock:&v10];
  -[SDScreenTimeMonitor setRestrictedActivityTypes:](self, "setRestrictedActivityTypes:", v6, v10, v11, v12, v13, v14);
  [(SDScreenTimeMonitor *)self setCacheReady:1];
  uint64_t v7 = [(SDScreenTimeMonitor *)self policiesChangedHandler];

  if (v7)
  {
    id v8 = [(SDScreenTimeMonitor *)self policiesChangedHandler];
    id v9 = [v6 copy];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (void)_retrievePoliciesForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  screenTimeMonitor = self->_screenTimeMonitor;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001022A8;
  v7[3] = &unk_1008CD718;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  objc_copyWeak(&v10, &location);
  [(DMFApplicationPolicyMonitor *)screenTimeMonitor requestPoliciesForBundleIdentifiers:v6 completionHandler:v7];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (id)policiesChangedHandler
{
  return self->_policiesChangedHandler;
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong(&self->_policiesChangedHandler, 0);
  objc_storeStrong((id *)&self->_policiesByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierByActivityType, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_screenTimeMonitor, 0);
}

@end