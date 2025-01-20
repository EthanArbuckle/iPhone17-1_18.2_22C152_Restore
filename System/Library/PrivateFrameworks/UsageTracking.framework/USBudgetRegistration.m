@interface USBudgetRegistration
+ (USBudgetRegistration)sharedRegistration;
- (BOOL)_fetchAllBudgetedApplications:(id *)a3 webDomains:(id *)a4 error:(id *)a5;
- (BOOL)addBudgetForActivity:(id)a3 withSchedule:(id)a4 events:(id)a5 forClient:(id)a6 withExtension:(id)a7 isPrivateClient:(BOOL)a8 error:(id *)a9;
- (BOOL)removeBudgetsForActivities:(id)a3 withClient:(id)a4 error:(id *)a5;
- (NSOperationQueue)notificationPostingQueue;
- (NSPersistentContainer)container;
- (USBudgetRegistration)init;
- (USBudgetRegistration)initWithPersistentContainer:(id)a3;
- (id)_areCategoriesBudgetedWithPredicate:(id)a3 error:(id *)a4;
- (id)_getDeviceActivityContextForClientIdentifier:(id)a3;
- (id)areCategoriesBudgeted:(id *)a3;
- (id)fetchActivitiesForClient:(id)a3 error:(id *)a4;
- (id)fetchAllBudgetedApplicationsAndReturnError:(id *)a3;
- (id)fetchAllBudgetedWebDomainsAndReturnError:(id *)a3;
- (id)fetchEventsForActivity:(id)a3 withClient:(id)a4 error:(id *)a5;
- (id)fetchScheduleForActivity:(id)a3 withClient:(id)a4 error:(id *)a5;
- (id)isCategoryBudgeted:(id)a3 error:(id *)a4;
- (void)_fetchBudgetsAndEventsMatchingBudgetedUsagePredicate:(id)a3 completionHandler:(id)a4;
- (void)_fetchBudgetsWithPredicate:(id)a3 completionHandler:(id)a4;
- (void)_removeBudgetsWithPredicate:(id)a3 completionHandler:(id)a4;
- (void)addBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 completionHandler:(id)a7;
- (void)clearPostedNotificationTimesWithCalendarIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchAllBudgetsWithCompletionHandler:(id)a3;
- (void)fetchAllDeviceActivityBudgetsWithCompletionHandler:(id)a3;
- (void)fetchAllRegisteredBudgetsAndEventsWithCompletionHandler:(id)a3;
- (void)fetchBudgetForDeviceActivityWithURI:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchBudgetForDeviceActivityWithURI:(id)a3 completionHandler:(id)a4;
- (void)fetchBudgetsAndEventsForApplications:(id)a3 completionHandler:(id)a4;
- (void)fetchBudgetsAndEventsForCategories:(id)a3 completionHandler:(id)a4;
- (void)fetchBudgetsAndEventsForWebDomains:(id)a3 completionHandler:(id)a4;
- (void)fetchBudgetsAndEventsWithPostedNotificationsWithCompletionHandler:(id)a3;
- (void)fetchBudgetsWithIdentifier:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchBudgetsWithIdentifiers:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchBudgetsWithIdentifiers:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)removeAllBudgetsWithCompletionHandler:(id)a3;
- (void)removeBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeDeviceActivityBudgetsNotMatchingClients:(id)a3 completionHandler:(id)a4;
@end

@implementation USBudgetRegistration

+ (USBudgetRegistration)sharedRegistration
{
  if (qword_100096198 != -1) {
    dispatch_once(&qword_100096198, &stru_100089D70);
  }
  v2 = (void *)qword_100096190;
  return (USBudgetRegistration *)v2;
}

- (USBudgetRegistration)initWithPersistentContainer:(id)a3
{
  v4 = (NSPersistentContainer *)a3;
  v13.receiver = self;
  v13.super_class = (Class)USBudgetRegistration;
  v5 = [(USBudgetRegistration *)&v13 init];
  container = v5->_container;
  v5->_container = v4;
  v7 = v4;

  uint64_t v8 = objc_opt_new();
  notificationPostingQueue = v5->_notificationPostingQueue;
  v5->_notificationPostingQueue = (NSOperationQueue *)v8;

  [(NSOperationQueue *)v5->_notificationPostingQueue setName:@"USBudgetRegistration.notificationPostingQueue"];
  v10 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:0 capacity:0];
  addContextsByXPCConnection = v5->_addContextsByXPCConnection;
  v5->_addContextsByXPCConnection = v10;

  return v5;
}

- (USBudgetRegistration)init
{
  v4 = +[USUsageTrackingBundle usageTrackingBundle];
  v5 = [v4 URLForResource:@"UsageTracking" withExtension:@"momd"];

  id v6 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v5];
  id v7 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"UsageTracking" managedObjectModel:v6];
  uint64_t v8 = +[NSFileManager defaultManager];
  id v25 = 0;
  v9 = [v8 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v25];
  id v10 = v25;
  if (!v9)
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"USBudgetRegistration.m", 143, @"Failed to find Application Support directory, %@", v10 object file lineNumber description];
  }
  MainBundle = CFBundleGetMainBundle();
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  objc_super v13 = objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFDictionaryGetValue(InfoDictionary, kCFBundleExecutableKey), 1);

  id v24 = v10;
  unsigned __int8 v14 = [v8 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v15 = v24;

  if ((v14 & 1) == 0)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"USBudgetRegistration.m", 149, @"Failed to create %@: %@", v13, v15 object file lineNumber description];
  }
  v16 = [v13 URLByAppendingPathComponent:@"UsageTracking" isDirectory:0];
  v17 = [v16 URLByAppendingPathExtension:@"sqlite"];

  id v18 = [objc_alloc((Class)NSPersistentStoreDescription) initWithURL:v17];
  id v26 = v18;
  v19 = +[NSArray arrayWithObjects:&v26 count:1];
  [v7 setPersistentStoreDescriptions:v19];

  [v7 loadPersistentStoresWithCompletionHandler:&stru_100089DB0];
  v20 = [(USBudgetRegistration *)self initWithPersistentContainer:v7];

  return v20;
}

- (void)addBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, id))a7;
  v37 = v15;
  if (v15)
  {
    v17 = v14;
    id v18 = v12;
    id v19 = v15;
    id v36 = 0;
  }
  else
  {
    v20 = +[NSXPCConnection currentConnection];
    id v19 = [v20 valueForEntitlement:@"application-identifier"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = 0;
    }
    else
    {

      sub_100007388(1, @"NoApplicationIdentifierError", 0, v22, v23, v24, v25, v26, @"application-identifier");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = 0;
    }
    id v27 = v21;
    v28 = v27;
    if (!v19)
    {
      v16[2](v16, v27);
      goto LABEL_11;
    }
    id v36 = v27;
    v17 = v14;
    id v18 = v12;
  }
  v29 = +[NSXPCConnection currentConnection];
  v30 = self->_addContextsByXPCConnection;
  objc_sync_enter(v30);
  id v31 = [(NSMapTable *)self->_addContextsByXPCConnection objectForKey:v29];
  if (!v31)
  {
    v32 = [(USBudgetRegistration *)self container];
    id v31 = [v32 newBackgroundContext];

    [(NSMapTable *)self->_addContextsByXPCConnection setObject:v31 forKey:v29];
  }
  objc_sync_exit(v30);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100005B80;
  v38[3] = &unk_100089E00;
  id v39 = v18;
  id v40 = v19;
  id v41 = v13;
  id v42 = v17;
  id v43 = v31;
  v44 = self;
  v45 = v16;
  id v33 = v31;
  id v12 = v18;
  id v14 = v17;
  id v34 = v33;
  id v35 = v19;
  [v34 performBlock:v38];

  v28 = v36;
LABEL_11:
}

- (BOOL)addBudgetForActivity:(id)a3 withSchedule:(id)a4 events:(id)a5 forClient:(id)a6 withExtension:(id)a7 isPrivateClient:(BOOL)a8 error:(id *)a9
{
  id v48 = a3;
  id v49 = a4;
  id v50 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15) {
    goto LABEL_27;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  v17 = +[NSXPCConnection currentConnection];
  id v18 = v17;
  if (v17)
  {
    [v17 auditToken];
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
  }

  id v66 = 0;
  *(_OWORD *)buf = v62;
  long long v71 = v63;
  id v19 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v66];
  id v20 = v66;
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006A3F4();
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v19 containingBundleRecord];
    id v22 = [v21 applicationIdentifier];
    uint64_t v23 = [v21 bundleIdentifier];
  }
  else
  {
    id v22 = [v19 applicationIdentifier];
    uint64_t v23 = [v19 bundleIdentifier];
  }
  id v24 = v23;
  if (v24)
  {
    unsigned __int8 v25 = +[USDeviceActivityAuthorization isAuthorized:v24];

    if (v25)
    {

      if (v22)
      {
LABEL_25:
        id v22 = v22;
        id v15 = v22;
        goto LABEL_26;
      }
LABEL_14:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get application identifier for bundle record %{public}@, falling back to the kSecEntitlementApplicationIdentifier.", buf, 0xCu);
      }
      uint64_t v26 = +[NSXPCConnection currentConnection];
      id v22 = [v26 valueForEntitlement:@"application-identifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        if (a9)
        {
          sub_100007388(1, @"NoApplicationIdentifierError", 0, v27, v28, v29, v30, v31, @"application-identifier");
          id v22 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v22 = 0;
        }
      }
      goto LABEL_25;
    }
  }
  BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v32) {
    sub_10006A464(v32, v33, v34, v35, v36, v37, v38, v39);
  }
  if (a9)
  {
    sub_100007388(2, @"NotAuthorizedError", @"SeeFamilyControls", v35, v36, v37, v38, v39, v47);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v15 = 0;
LABEL_26:

  if (!v15)
  {
    BOOL v45 = 0;
    goto LABEL_33;
  }
LABEL_27:
  id v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  *(void *)&long long v62 = 0;
  *((void *)&v62 + 1) = &v62;
  *(void *)&long long v63 = 0x3032000000;
  *((void *)&v63 + 1) = sub_100007B08;
  v64 = sub_100007B18;
  id v65 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&long long v71 = 0x3032000000;
  *((void *)&v71 + 1) = sub_100007B08;
  v72 = sub_100007B18;
  id v73 = 0;
  id v40 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v15];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100007B20;
  v51[3] = &unk_100089E50;
  id v41 = v15;
  id v52 = v41;
  v58 = &v62;
  BOOL v61 = a8;
  id v53 = v48;
  v59 = &v66;
  id v54 = v49;
  id v55 = v50;
  id v56 = v16;
  id v42 = v40;
  id v57 = v42;
  v60 = buf;
  [v42 performBlockAndWait:v51];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v43 = +[NSNotificationCenter defaultCenter];
    [v43 postNotificationName:@"DeviceActivityBudgetWasAddedOrUpdated" object:self userInfo:*(void *)(*(void *)&buf[8] + 40)];
  }
  int v44 = *((unsigned __int8 *)v67 + 24);
  if (a9 && !*((unsigned char *)v67 + 24))
  {
    *a9 = *(id *)(*((void *)&v62 + 1) + 40);
    int v44 = *((unsigned __int8 *)v67 + 24);
  }
  BOOL v45 = v44 != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v66, 8);
LABEL_33:

  return v45;
}

- (id)_getDeviceActivityContextForClientIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(USBudgetRegistration *)self container];
  id v6 = [v5 newBackgroundContext];

  [v6 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [v6 setTransactionAuthor:v4];

  return v6;
}

- (void)removeBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  if (v8)
  {
    id v10 = v8;
    id v11 = 0;
LABEL_7:
    if (v22) {
      +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K IN %@)", @"clientIdentifier", v10, @"identifier", v22];
    }
    else {
    id v19 = +[NSPredicate predicateWithFormat:@"%K == %@", @"clientIdentifier", v10, v20, v21];
    }
    [(USBudgetRegistration *)self _removeBudgetsWithPredicate:v19 completionHandler:v9];

    goto LABEL_11;
  }
  id v12 = +[NSXPCConnection currentConnection];
  id v10 = [v12 valueForEntitlement:@"application-identifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
  }
  else
  {

    sub_100007388(1, @"NoApplicationIdentifierError", 0, v14, v15, v16, v17, v18, @"application-identifier");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
  }
  id v11 = v13;
  if (v10) {
    goto LABEL_7;
  }
  v9[2](v9, v11);
LABEL_11:
}

- (BOOL)removeBudgetsForActivities:(id)a3 withClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    goto LABEL_27;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = +[NSXPCConnection currentConnection];
  id v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }

  id v52 = 0;
  *(_OWORD *)buf = v48;
  long long v57 = v49;
  id v12 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v52];
  id v13 = v52;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006A3F4();
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 containingBundleRecord];
    id v15 = [v14 applicationIdentifier];
    uint64_t v16 = [v14 bundleIdentifier];
  }
  else
  {
    id v15 = [v12 applicationIdentifier];
    uint64_t v16 = [v12 bundleIdentifier];
  }
  id v17 = v16;
  if (v17)
  {
    unsigned __int8 v18 = +[USDeviceActivityAuthorization isAuthorized:v17];

    if (v18)
    {

      if (v15)
      {
LABEL_25:
        id v15 = v15;
        id v9 = v15;
        goto LABEL_26;
      }
LABEL_14:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get application identifier for bundle record %{public}@, falling back to the kSecEntitlementApplicationIdentifier.", buf, 0xCu);
      }
      id v19 = +[NSXPCConnection currentConnection];
      id v15 = [v19 valueForEntitlement:@"application-identifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        if (a5)
        {
          sub_100007388(1, @"NoApplicationIdentifierError", 0, v20, v21, v22, v23, v24, @"application-identifier");
          id v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
      }
      goto LABEL_25;
    }
  }
  BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v25) {
    sub_10006A464(v25, v26, v27, v28, v29, v30, v31, v32);
  }
  if (a5)
  {
    sub_100007388(2, @"NotAuthorizedError", @"SeeFamilyControls", v28, v29, v30, v31, v32, v40);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v9 = 0;
LABEL_26:

  if (!v9)
  {
    BOOL v38 = 0;
    goto LABEL_33;
  }
LABEL_27:
  id v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  *(void *)&long long v48 = 0;
  *((void *)&v48 + 1) = &v48;
  *(void *)&long long v49 = 0x3032000000;
  *((void *)&v49 + 1) = sub_100007B08;
  id v50 = sub_100007B18;
  id v51 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&long long v57 = 0x3032000000;
  *((void *)&v57 + 1) = sub_100007B08;
  v58 = sub_100007B18;
  id v59 = 0;
  uint64_t v33 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v9];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100009570;
  v41[3] = &unk_100089E78;
  id v42 = v8;
  id v34 = v9;
  id v43 = v34;
  BOOL v45 = &v48;
  id v35 = v33;
  id v44 = v35;
  v46 = &v52;
  uint64_t v47 = buf;
  [v35 performBlockAndWait:v41];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v36 = +[NSNotificationCenter defaultCenter];
    [v36 postNotificationName:@"DeviceActivityBudgetsWereRemoved" object:self userInfo:*(void *)(*(void *)&buf[8] + 40)];
  }
  int v37 = *((unsigned __int8 *)v53 + 24);
  if (a5 && !*((unsigned char *)v53 + 24))
  {
    *a5 = *(id *)(*((void *)&v48 + 1) + 40);
    int v37 = *((unsigned __int8 *)v53 + 24);
  }
  BOOL v38 = v37 != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v52, 8);
LABEL_33:

  return v38;
}

- (void)removeAllBudgetsWithCompletionHandler:(id)a3
{
}

- (void)_removeBudgetsWithPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(USBudgetRegistration *)self container];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009A4C;
  v11[3] = &unk_100089EA0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)fetchBudgetsWithIdentifier:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(USBudgetRegistration *)self container];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009E74;
  v15[3] = &unk_100089EC8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBackgroundTask:v15];
}

- (void)fetchBudgetsWithIdentifiers:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, id))a5;
  if (v8)
  {
    id v10 = v8;
    id v11 = 0;
LABEL_7:
    if (v22) {
      +[NSPredicate predicateWithFormat:@"(%K == %@) && (%K IN %@)", @"clientIdentifier", v10, @"identifier", v22];
    }
    else {
    id v19 = +[NSPredicate predicateWithFormat:@"%K == %@", @"clientIdentifier", v10, v20, v21];
    }
    [(USBudgetRegistration *)self _fetchBudgetsWithPredicate:v19 completionHandler:v9];

    goto LABEL_11;
  }
  id v12 = +[NSXPCConnection currentConnection];
  id v10 = [v12 valueForEntitlement:@"application-identifier"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = 0;
  }
  else
  {

    sub_100007388(1, @"NoApplicationIdentifierError", 0, v14, v15, v16, v17, v18, @"application-identifier");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0;
  }
  id v11 = v13;
  if (v10) {
    goto LABEL_7;
  }
  v9[2](v9, 0, v11);
LABEL_11:
}

- (void)fetchAllBudgetsWithCompletionHandler:(id)a3
{
}

- (void)fetchBudgetsWithIdentifiers:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10000AA6C;
  uint64_t v18 = &unk_100089EF0;
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  id v20 = v8;
  id v11 = v8;
  id v12 = v19;
  [v10 enumerateObjectsUsingBlock:&v15];

  id v13 = objc_alloc((Class)NSCompoundPredicate);
  id v14 = objc_msgSend(v13, "initWithType:subpredicates:", 2, v12, v15, v16, v17, v18);
  [(USBudgetRegistration *)self _fetchBudgetsWithPredicate:v14 completionHandler:v9];
}

- (void)_fetchBudgetsWithPredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(USBudgetRegistration *)self container];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000ABF8;
  v11[3] = &unk_100089F18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)clearPostedNotificationTimesWithCalendarIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(USBudgetRegistration *)self container];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AE10;
  v11[3] = &unk_100089F18;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)fetchAllRegisteredBudgetsAndEventsWithCompletionHandler:(id)a3
{
}

- (id)fetchAllBudgetedApplicationsAndReturnError:(id *)a3
{
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = sub_100007B08;
  id v44 = sub_100007B18;
  id v45 = 0;
  id v38 = 0;
  id obj = 0;
  unsigned int v4 = [(USBudgetRegistration *)self _fetchAllBudgetedApplications:&obj webDomains:&v38 error:a3];
  objc_storeStrong(&v45, obj);
  id v5 = v38;
  if (v4)
  {
    uint64_t v6 = v41[5];
    id v7 = objc_alloc((Class)NSConditionLock);
    uint64_t v8 = 1;
    if (v6) {
      uint64_t v8 = 2;
    }
    if (v5) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = v6 != 0;
    }
    id v10 = [v7 initWithCondition:v9];
    id v11 = +[CTCategories sharedCategories];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_100007B08;
    uint64_t v36 = sub_100007B18;
    id v37 = 0;
    if (v41[5])
    {
      id v12 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10006A848((uint64_t)v47, (uint64_t)[(id)v41[5] count]);
      }

      id v13 = [(id)v41[5] array];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000B44C;
      v28[3] = &unk_100089F68;
      id v29 = v10;
      uint64_t v30 = &v40;
      uint64_t v31 = &v32;
      [v11 categoriesForBundleIDs:v13 completionHandler:v28];
    }
    if (v5)
    {
      id v14 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10006A808((uint64_t)v46, (uint64_t)[v5 count]);
      }

      uint64_t v15 = [v5 array];
      uint64_t v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      uint64_t v23 = sub_10000B5D8;
      uint64_t v24 = &unk_100089F68;
      id v25 = v10;
      uint64_t v26 = &v40;
      uint64_t v27 = &v32;
      [v11 categoriesForDomainNames:v15 completionHandler:&v21];
    }
    objc_msgSend(v10, "lockWhenCondition:", 0, v21, v22, v23, v24);
    [v10 unlock];
    uint64_t v16 = (void *)v33[5];
    if (!v16)
    {
      _Block_object_dispose(&v32, 8);

      id v19 = (void *)v41[5];
      if (v19) {
        id v20 = v19;
      }
      else {
        id v20 = (id)objc_opt_new();
      }
      uint64_t v17 = v20;
      goto LABEL_20;
    }
    if (a3) {
      *a3 = v16;
    }
    _Block_object_dispose(&v32, 8);
  }
  uint64_t v17 = 0;
LABEL_20:

  _Block_object_dispose(&v40, 8);
  return v17;
}

- (void)fetchBudgetsAndEventsForApplications:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10006A888(v6);
  }
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_100007B08;
  id v52 = sub_100007B18;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_100007B08;
  v46 = sub_100007B18;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_100007B08;
  uint64_t v40 = sub_100007B18;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100007B08;
  uint64_t v34 = sub_100007B18;
  id v35 = 0;
  BOOL v9 = +[CTCategories sharedCategories];
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_10000BBFC;
  uint64_t v22 = &unk_100089FB8;
  id v25 = &v48;
  uint64_t v26 = &v42;
  id v10 = v6;
  id v23 = v10;
  uint64_t v27 = &v36;
  uint64_t v28 = &v30;
  id v11 = v8;
  id v24 = v11;
  uint64_t v29 = 1;
  [v9 categoriesForBundleIDs:v10 completionHandler:&v19];

  [v11 lockWhenCondition:1];
  [v11 unlock];
  if (v31[5])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    if (v43[5]) {
      id v12 = (id)v43[5];
    }
    else {
      id v12 = v10;
    }
    id v13 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedApplications", @"bundleIdentifier", v12, v19, v20, v21, v22, v23];
    if (v49[5])
    {
      uint64_t v14 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedCategories", @"categoryIdentifier", v49[5]];
      uint64_t v15 = (void *)v14;
      if (v37[5])
      {
        uint64_t v16 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedWebDomains", @"webDomain", v37[5]];
        v54[0] = v13;
        v54[1] = v15;
        v54[2] = v16;
        uint64_t v17 = +[NSArray arrayWithObjects:v54 count:3];
      }
      else
      {
        v55[0] = v13;
        v55[1] = v14;
        uint64_t v17 = +[NSArray arrayWithObjects:v55 count:2];
      }
      id v18 = [objc_alloc((Class)NSCompoundPredicate) initWithType:2 subpredicates:v17];

      id v13 = v18;
    }
    [(USBudgetRegistration *)self _fetchBudgetsAndEventsMatchingBudgetedUsagePredicate:v13 completionHandler:v7];
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
}

- (id)fetchAllBudgetedWebDomainsAndReturnError:(id *)a3
{
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_100007B08;
  uint64_t v48 = sub_100007B18;
  id v49 = 0;
  id v42 = 0;
  id v43 = 0;
  unsigned int v4 = [(USBudgetRegistration *)self _fetchAllBudgetedApplications:&v43 webDomains:&v42 error:a3];
  id v5 = v43;
  objc_storeStrong(&v49, v42);
  if (v4)
  {
    uint64_t v6 = v45[5];
    id v7 = objc_alloc((Class)NSConditionLock);
    uint64_t v8 = 1;
    if (v6) {
      uint64_t v8 = 2;
    }
    if (v5) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = v6 != 0;
    }
    id v10 = [v7 initWithCondition:v9];
    id v11 = +[CTCategories sharedCategories];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = sub_100007B08;
    v40[4] = sub_100007B18;
    id v41 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = sub_100007B08;
    uint64_t v38 = sub_100007B18;
    id v39 = 0;
    if (v45[5])
    {
      id v12 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10006A940((uint64_t)v51, (uint64_t)[(id)v45[5] count]);
      }

      id v13 = [(id)v45[5] array];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10000C454;
      v29[3] = &unk_10008A008;
      id v30 = v10;
      uint64_t v31 = v40;
      uint64_t v32 = &v44;
      uint64_t v33 = &v34;
      [v11 categoriesForDomainNames:v13 completionHandler:v29];
    }
    if (v5)
    {
      id v14 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10006A900((uint64_t)v50, (uint64_t)[v5 count]);
      }

      uint64_t v15 = [v5 array];
      uint64_t v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      id v23 = sub_10000C6F4;
      id v24 = &unk_10008A008;
      id v25 = v10;
      uint64_t v26 = v40;
      uint64_t v27 = &v44;
      uint64_t v28 = &v34;
      [v11 categoriesForBundleIDs:v15 completionHandler:&v21];
    }
    objc_msgSend(v10, "lockWhenCondition:", 0, v21, v22, v23, v24);
    [v10 unlock];
    uint64_t v16 = (void *)v35[5];
    if (!v16)
    {
      _Block_object_dispose(&v34, 8);

      _Block_object_dispose(v40, 8);
      id v19 = (void *)v45[5];
      if (v19) {
        id v20 = v19;
      }
      else {
        id v20 = (id)objc_opt_new();
      }
      uint64_t v17 = v20;
      goto LABEL_20;
    }
    if (a3) {
      *a3 = v16;
    }
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(v40, 8);
  }
  uint64_t v17 = 0;
LABEL_20:
  _Block_object_dispose(&v44, 8);

  return v17;
}

- (void)fetchBudgetsAndEventsForWebDomains:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10006A980(v6);
  }
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_100007B08;
  id v52 = sub_100007B18;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_100007B08;
  uint64_t v46 = sub_100007B18;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_100007B08;
  uint64_t v40 = sub_100007B18;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_100007B08;
  uint64_t v34 = sub_100007B18;
  id v35 = 0;
  BOOL v9 = +[CTCategories sharedCategories];
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_10000CE18;
  uint64_t v22 = &unk_10008A058;
  id v25 = &v48;
  uint64_t v26 = &v42;
  uint64_t v27 = &v36;
  id v10 = v6;
  id v23 = v10;
  uint64_t v28 = &v30;
  id v11 = v8;
  id v24 = v11;
  uint64_t v29 = 1;
  [v9 categoriesForDomainNames:v10 completionHandler:&v19];

  [v11 lockWhenCondition:1];
  [v11 unlock];
  if (v31[5])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    if (v37[5]) {
      id v12 = (id)v37[5];
    }
    else {
      id v12 = v10;
    }
    id v13 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedWebDomains", @"webDomain", v12, v19, v20, v21, v22, v23];
    if (v49[5])
    {
      uint64_t v14 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedCategories", @"categoryIdentifier", v49[5]];
      uint64_t v15 = (void *)v14;
      if (v43[5])
      {
        uint64_t v16 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedApplications", @"bundleIdentifier", v43[5]];
        v54[0] = v13;
        v54[1] = v15;
        v54[2] = v16;
        uint64_t v17 = +[NSArray arrayWithObjects:v54 count:3];
      }
      else
      {
        v55[0] = v13;
        v55[1] = v14;
        uint64_t v17 = +[NSArray arrayWithObjects:v55 count:2];
      }
      id v18 = [objc_alloc((Class)NSCompoundPredicate) initWithType:2 subpredicates:v17];

      id v13 = v18;
    }
    [(USBudgetRegistration *)self _fetchBudgetsAndEventsMatchingBudgetedUsagePredicate:v13 completionHandler:v7];
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
}

- (id)isCategoryBudgeted:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"categoryIdentifier", a3];
  id v7 = [(USBudgetRegistration *)self _areCategoriesBudgetedWithPredicate:v6 error:a4];

  return v7;
}

- (id)areCategoriesBudgeted:(id *)a3
{
  return [(USBudgetRegistration *)self _areCategoriesBudgetedWithPredicate:0 error:a3];
}

- (void)fetchBudgetsAndEventsForCategories:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSPredicate predicateWithFormat:@"ANY %K.%K IN %@", @"budgetedCategories", @"categoryIdentifier", a3];
  [(USBudgetRegistration *)self _fetchBudgetsAndEventsMatchingBudgetedUsagePredicate:v7 completionHandler:v6];
}

- (id)_areCategoriesBudgetedWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100007B08;
  uint64_t v27 = sub_100007B18;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100007B08;
  uint64_t v21 = sub_100007B18;
  id v22 = 0;
  id v7 = [(USBudgetRegistration *)self container];
  id v8 = [v7 newBackgroundContext];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D514;
  v13[3] = &unk_10008A080;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = &v17;
  uint64_t v16 = &v23;
  [v8 performBlockAndWait:v13];

  id v10 = (void *)v24[5];
  if (a4 && !v10)
  {
    *a4 = (id) v18[5];
    id v10 = (void *)v24[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (BOOL)_fetchAllBudgetedApplications:(id *)a3 webDomains:(id *)a4 error:(id *)a5
{
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100007B08;
  uint64_t v30 = sub_100007B18;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100007B08;
  id v24 = sub_100007B18;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100007B08;
  id v18 = sub_100007B18;
  id v19 = 0;
  id v8 = [(USBudgetRegistration *)self container];
  id v9 = [v8 newBackgroundContext];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DA14;
  v13[3] = &unk_10008A0A8;
  void v13[4] = &v14;
  v13[5] = &v32;
  v13[6] = &v26;
  v13[7] = &v20;
  [v9 performBlockAndWait:v13];

  if (*((unsigned char *)v33 + 24))
  {
    *a3 = (id) v27[5];
    id v10 = (id *)(v21 + 5);
LABEL_5:
    *a4 = *v10;
    goto LABEL_6;
  }
  if (a5)
  {
    id v10 = (id *)(v15 + 5);
    a4 = a5;
    goto LABEL_5;
  }
LABEL_6:
  char v11 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v11;
}

- (void)fetchBudgetsAndEventsWithPostedNotificationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(USBudgetRegistration *)self container];
  id v6 = [v5 newBackgroundContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DE7C;
  v9[3] = &unk_10008A0D0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

- (void)_fetchBudgetsAndEventsMatchingBudgetedUsagePredicate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(USBudgetRegistration *)self container];
  id v9 = [v8 newBackgroundContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000E238;
  v13[3] = &unk_10008A0F8;
  id v15 = v9;
  id v16 = v7;
  id v14 = v6;
  id v10 = v9;
  id v11 = v7;
  id v12 = v6;
  [v10 performBlockAndWait:v13];
}

- (id)fetchActivitiesForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6) {
    goto LABEL_27;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = +[NSXPCConnection currentConnection];
  id v8 = v7;
  if (v7)
  {
    [v7 auditToken];
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }

  id v44 = 0;
  *(_OWORD *)buf = v40;
  long long v46 = v41;
  id v9 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v44];
  id v10 = v44;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006A3F4();
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v9 containingBundleRecord];
    id v12 = [v11 applicationIdentifier];
    id v13 = [v11 bundleIdentifier];
  }
  else
  {
    id v12 = [v9 applicationIdentifier];
    id v13 = [v9 bundleIdentifier];
  }
  id v14 = v13;
  if (v14)
  {
    unsigned __int8 v15 = +[USDeviceActivityAuthorization isAuthorized:v14];

    if (v15)
    {

      if (v12)
      {
LABEL_25:
        id v12 = v12;
        id v6 = v12;
        goto LABEL_26;
      }
LABEL_14:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get application identifier for bundle record %{public}@, falling back to the kSecEntitlementApplicationIdentifier.", buf, 0xCu);
      }
      id v16 = +[NSXPCConnection currentConnection];
      id v12 = [v16 valueForEntitlement:@"application-identifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        if (a4)
        {
          sub_100007388(1, @"NoApplicationIdentifierError", 0, v17, v18, v19, v20, v21, @"application-identifier");
          id v12 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v12 = 0;
        }
      }
      goto LABEL_25;
    }
  }
  BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v22) {
    sub_10006A464(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  if (a4)
  {
    sub_100007388(2, @"NotAuthorizedError", @"SeeFamilyControls", v25, v26, v27, v28, v29, v35);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v6 = 0;
LABEL_26:

  if (!v6)
  {
    id v33 = 0;
    goto LABEL_31;
  }
LABEL_27:
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = &v40;
  *(void *)&long long v41 = 0x3032000000;
  *((void *)&v41 + 1) = sub_100007B08;
  uint64_t v42 = sub_100007B18;
  id v43 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&long long v46 = 0x3032000000;
  *((void *)&v46 + 1) = sub_100007B08;
  id v47 = sub_100007B18;
  id v48 = 0;
  uint64_t v30 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v6];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000EA30;
  v36[3] = &unk_10008A080;
  id v31 = v6;
  id v37 = v31;
  uint64_t v38 = buf;
  id v39 = &v40;
  [v30 performBlockAndWait:v36];
  uint64_t v32 = *(void **)(*((void *)&v40 + 1) + 40);
  if (a4 && !v32)
  {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v32 = *(void **)(*((void *)&v40 + 1) + 40);
  }
  id v33 = v32;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v40, 8);

LABEL_31:
  return v33;
}

- (id)fetchScheduleForActivity:(id)a3 withClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    goto LABEL_27;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = +[NSXPCConnection currentConnection];
  id v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }

  id v48 = 0;
  *(_OWORD *)buf = v44;
  long long v50 = v45;
  id v12 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v48];
  id v13 = v48;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006A3F4();
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v12 containingBundleRecord];
    id v15 = [v14 applicationIdentifier];
    id v16 = [v14 bundleIdentifier];
  }
  else
  {
    id v15 = [v12 applicationIdentifier];
    id v16 = [v12 bundleIdentifier];
  }
  id v17 = v16;
  if (v17)
  {
    unsigned __int8 v18 = +[USDeviceActivityAuthorization isAuthorized:v17];

    if (v18)
    {

      if (v15)
      {
LABEL_25:
        id v15 = v15;
        id v9 = v15;
        goto LABEL_26;
      }
LABEL_14:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get application identifier for bundle record %{public}@, falling back to the kSecEntitlementApplicationIdentifier.", buf, 0xCu);
      }
      uint64_t v19 = +[NSXPCConnection currentConnection];
      id v15 = [v19 valueForEntitlement:@"application-identifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        if (a5)
        {
          sub_100007388(1, @"NoApplicationIdentifierError", 0, v20, v21, v22, v23, v24, @"application-identifier");
          id v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
      }
      goto LABEL_25;
    }
  }
  BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v25) {
    sub_10006A464(v25, v26, v27, v28, v29, v30, v31, v32);
  }
  if (a5)
  {
    sub_100007388(2, @"NotAuthorizedError", @"SeeFamilyControls", v28, v29, v30, v31, v32, v38);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v9 = 0;
LABEL_26:

  if (!v9)
  {
    id v36 = 0;
    goto LABEL_31;
  }
LABEL_27:
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = &v44;
  *(void *)&long long v45 = 0x3032000000;
  *((void *)&v45 + 1) = sub_100007B08;
  long long v46 = sub_100007B18;
  id v47 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&long long v50 = 0x3032000000;
  *((void *)&v50 + 1) = sub_100007B08;
  id v51 = sub_100007B18;
  id v52 = 0;
  id v33 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v9];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000F014;
  v39[3] = &unk_10008A120;
  id v34 = v9;
  id v40 = v34;
  id v41 = v8;
  uint64_t v42 = buf;
  id v43 = &v44;
  [v33 performBlockAndWait:v39];
  uint64_t v35 = *(void **)(*((void *)&v44 + 1) + 40);
  if (a5 && !v35)
  {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v35 = *(void **)(*((void *)&v44 + 1) + 40);
  }
  id v36 = v35;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v44, 8);

LABEL_31:
  return v36;
}

- (id)fetchEventsForActivity:(id)a3 withClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    goto LABEL_27;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = +[NSXPCConnection currentConnection];
  id v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }

  id v48 = 0;
  *(_OWORD *)buf = v44;
  long long v50 = v45;
  id v12 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v48];
  id v13 = v48;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006A3F4();
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v12 containingBundleRecord];
    id v15 = [v14 applicationIdentifier];
    id v16 = [v14 bundleIdentifier];
  }
  else
  {
    id v15 = [v12 applicationIdentifier];
    id v16 = [v12 bundleIdentifier];
  }
  id v17 = v16;
  if (v17)
  {
    unsigned __int8 v18 = +[USDeviceActivityAuthorization isAuthorized:v17];

    if (v18)
    {

      if (v15)
      {
LABEL_25:
        id v15 = v15;
        id v9 = v15;
        goto LABEL_26;
      }
LABEL_14:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not get application identifier for bundle record %{public}@, falling back to the kSecEntitlementApplicationIdentifier.", buf, 0xCu);
      }
      uint64_t v19 = +[NSXPCConnection currentConnection];
      id v15 = [v19 valueForEntitlement:@"application-identifier"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        if (a5)
        {
          sub_100007388(1, @"NoApplicationIdentifierError", 0, v20, v21, v22, v23, v24, @"application-identifier");
          id v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
      }
      goto LABEL_25;
    }
  }
  BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v25) {
    sub_10006A464(v25, v26, v27, v28, v29, v30, v31, v32);
  }
  if (a5)
  {
    sub_100007388(2, @"NotAuthorizedError", @"SeeFamilyControls", v28, v29, v30, v31, v32, v38);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v9 = 0;
LABEL_26:

  if (!v9)
  {
    id v36 = 0;
    goto LABEL_31;
  }
LABEL_27:
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = &v44;
  *(void *)&long long v45 = 0x3032000000;
  *((void *)&v45 + 1) = sub_100007B08;
  long long v46 = sub_100007B18;
  id v47 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&long long v50 = 0x3032000000;
  *((void *)&v50 + 1) = sub_100007B08;
  id v51 = sub_100007B18;
  id v52 = 0;
  id v33 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v9];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000F69C;
  v39[3] = &unk_10008A120;
  id v34 = v9;
  id v40 = v34;
  id v41 = v8;
  uint64_t v42 = buf;
  id v43 = &v44;
  [v33 performBlockAndWait:v39];
  uint64_t v35 = *(void **)(*((void *)&v44 + 1) + 40);
  if (a5 && !v35)
  {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v35 = *(void **)(*((void *)&v44 + 1) + 40);
  }
  id v36 = v35;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v44, 8);

LABEL_31:
  return v36;
}

- (void)fetchBudgetForDeviceActivityWithURI:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100007B08;
  BOOL v25 = sub_100007B18;
  id v26 = 0;
  id v8 = [(USBudgetRegistration *)self container];
  id v9 = [v8 newBackgroundContext];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10001010C;
  id v16 = &unk_10008A148;
  id v10 = v8;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  uint64_t v20 = &v21;
  [v12 performBlockAndWait:&v13];
  -[USBudgetRegistration fetchBudgetForDeviceActivityWithURI:clientIdentifier:completionHandler:](self, "fetchBudgetForDeviceActivityWithURI:clientIdentifier:completionHandler:", v11, v22[5], v7, v13, v14, v15, v16);

  _Block_object_dispose(&v21, 8);
}

- (void)fetchBudgetForDeviceActivityWithURI:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (__CFString *)a4;
  id v11 = [(USBudgetRegistration *)self container];
  if (v10) {
    CFStringRef v12 = v10;
  }
  else {
    CFStringRef v12 = @"com.apple.UsageTrackingAgent";
  }
  id v13 = [(USBudgetRegistration *)self _getDeviceActivityContextForClientIdentifier:v12];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010314;
  v18[3] = &unk_10008A170;
  id v19 = v11;
  id v20 = v8;
  id v21 = v13;
  id v22 = v9;
  id v14 = v9;
  id v15 = v13;
  id v16 = v8;
  id v17 = v11;
  [v15 performBlockAndWait:v18];
}

- (void)fetchAllDeviceActivityBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(USBudgetRegistration *)self container];
  id v6 = [v5 newBackgroundContext];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010514;
  v9[3] = &unk_10008A0D0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

- (void)removeDeviceActivityBudgetsNotMatchingClients:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(USBudgetRegistration *)self container];
  id v9 = [v8 newBackgroundContext];

  [v9 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010784;
  v13[3] = &unk_10008A1C0;
  id v14 = v6;
  id v15 = v9;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 16, 1);
}

- (NSOperationQueue)notificationPostingQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPostingQueue, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_addContextsByXPCConnection, 0);
}

@end