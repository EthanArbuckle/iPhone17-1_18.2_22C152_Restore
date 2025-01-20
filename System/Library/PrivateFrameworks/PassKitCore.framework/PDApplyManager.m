@interface PDApplyManager
- (PDApplyManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 accountManager:(id)a6 databaseRecreated:(BOOL)a7;
- (PDApplyNotificationController)notificationController;
- (id)_queue_featureApplicationWithIdentifier:(id)a3;
- (id)pushNotificationTopics;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_applicationsAreInDirtyStateWithCompletion:(id)a3;
- (void)_applicationsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4;
- (void)_authenticateApplyContext:(id)a3 completion:(id)a4;
- (void)_concludeIDVSessionIfNeededForFeatureApplication:(id)a3;
- (void)_handleApplyResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_paymentWebServiceContextChanged;
- (void)_postApplicationsChangedNotification;
- (void)_processAddedApplications:(id)a3;
- (void)_processChangedApplications:(id)a3;
- (void)_processDeletedApplications:(id)a3;
- (void)_queue_deleteApplications;
- (void)_queue_deleteApplicationsForAccountIdentifier:(id)a3;
- (void)_queue_mergeApplications:(id)a3 featureFailures:(id)a4;
- (void)_queue_mergeApplications:(id)a3 forAccountIdentifier:(id)a4;
- (void)_queue_performNextApplicationsUpdate;
- (void)_queue_updateApplicationsForAccountIdentifier:(id)a3 withCompletionBlocks:(id)a4 completion:(id)a5;
- (void)_queue_updateApplicationsWithRequests:(id)a3 completion:(id)a4;
- (void)_silentlyShareClaimForApplication:(id)a3 completion:(id)a4;
- (void)_updateApplicationWithIdentifier:(id)a3 completionBlocks:(id)a4;
- (void)_updateApplicationsFromPush:(BOOL)a3 completion:(id)a4;
- (void)_updateCachedAccountApplications;
- (void)_updatePushTopics;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)applicationIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)applicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)applicationWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)applicationsForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (void)applicationsForAccountIdentifierAreInDirtyState:(id)a3 completion:(id)a4;
- (void)applicationsWithCompletion:(id)a3;
- (void)applyPushNotificationToken:(id)a3;
- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5;
- (void)databaseRestored;
- (void)dealloc;
- (void)deleteApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteApplicationsWithCompletion:(id)a3;
- (void)deleteLocalApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertOrReplaceApplication:(id)a3 completion:(id)a4;
- (void)mergeApplications:(id)a3 completion:(id)a4;
- (void)mergeApplications:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)noteAccountDeletionWithCompletion:(id)a3;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)queuePerformNextApplicationUpdateWithIdentifier:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)submitApplyRequest:(id)a3 completion:(id)a4;
- (void)submitDeleteRequest:(id)a3 completion:(id)a4;
- (void)submitDocumentRequest:(id)a3 completion:(id)a4;
- (void)submitTermsRequest:(id)a3 completion:(id)a4;
- (void)submitVerificationRequest:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateApplicationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateApplicationsWithCompletion:(id)a3;
@end

@implementation PDApplyManager

- (void)applicationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000ABD8;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (PDApplyManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 accountManager:(id)a6 databaseRecreated:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v89.receiver = self;
  v89.super_class = (Class)PDApplyManager;
  v17 = [(PDApplyManager *)&v89 init];
  v18 = v17;
  if (v17)
  {
    v78 = v15;
    id v79 = v14;
    id v80 = v13;
    v17->_databaseWillRestore = a7;
    v17->_lockPushTopics._os_unfair_lock_opaque = 0;
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.apply.manager", v19);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v20;

    v76 = v19;
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.passd.apply.reply", v19);
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v18->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a5);
    objc_storeStrong((id *)&v18->_accountManager, a6);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a4);
    [(PDPaymentWebServiceCoordinator *)v18->_paymentWebServiceCoordinator registerObserver:v18];
    uint64_t v24 = [(PDPaymentWebServiceCoordinator *)v18->_paymentWebServiceCoordinator applyServicePushTopics];
    pushNotificationTopics = v18->_pushNotificationTopics;
    v18->_pushNotificationTopics = (NSSet *)v24;

    [(PDPushNotificationManager *)v18->_pushNotificationManager registerConsumer:v18];
    v26 = [(PDPaymentWebServiceCoordinator *)v18->_paymentWebServiceCoordinator sharedWebServiceContext];
    v27 = [v26 regions];

    id v28 = objc_alloc_init((Class)NSMutableDictionary);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v29 = v27;
    id v30 = [v29 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v86;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v86 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v85 + 1) + 8 * i);
          v35 = [v29 objectForKey:v34];
          v36 = v35;
          if (v18->_hasApplications) {
            unsigned __int8 v37 = 1;
          }
          else {
            unsigned __int8 v37 = [v35 hasApplications];
          }
          v18->_hasApplications = v37;
          v38 = [v36 applyServiceURL];
          if (v38) {
            [v28 setObject:v38 forKey:v34];
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v31);
    }
    v77 = v16;
    v74 = v29;

    v75 = v28;
    v39 = (NSDictionary *)[v28 copy];
    applyServiceURLs = v18->_applyServiceURLs;
    v18->_applyServiceURLs = v39;

    v73 = v18;
    v41 = [(PDDatabaseManager *)v18->_databaseManager accounts];
    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v43 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v44 = v41;
    id v45 = [v44 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v82;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v82 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v81 + 1) + 8 * (void)j);
          v50 = [v49 accountIdentifier];
          v51 = [v49 applyServiceURL];
          if (v51) {
            [(NSMutableDictionary *)v42 setObject:v51 forKey:v50];
          }
          v52 = [v49 additionalPushTopics];
          v53 = [v52 applications];

          if (v53) {
            [(NSMutableDictionary *)v43 setObject:v53 forKey:v50];
          }
        }
        id v46 = [v44 countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v46);
    }

    accountApplyServiceURLs = v73->_accountApplyServiceURLs;
    v73->_accountApplyServiceURLs = v42;
    v55 = v42;

    accountPushNotificationTopics = v73->_accountPushNotificationTopics;
    v73->_accountPushNotificationTopics = v43;
    v57 = v43;

    id v15 = v78;
    v58 = [v78 featureApplications];
    v59 = [v58 allObjects];

    v60 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v59];
    applications = v73->_applications;
    v73->_applications = v60;

    [(PDApplyManager *)v73 _updateCachedAccountApplications];
    v62 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingAccountApplicationsUpdateBlocks = v73->_pendingAccountApplicationsUpdateBlocks;
    v73->_pendingAccountApplicationsUpdateBlocks = v62;

    v64 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingApplicationsUpdateBlocks = v73->_pendingApplicationsUpdateBlocks;
    v73->_pendingApplicationsUpdateBlocks = v64;

    v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    applicationsBeingUpdated = v73->_applicationsBeingUpdated;
    v73->_applicationsBeingUpdated = v66;

    v68 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingApplicationUpdateBlocks = v73->_pendingApplicationUpdateBlocks;
    v73->_pendingApplicationUpdateBlocks = v68;

    uint64_t v70 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v73->_observers;
    v73->_observers = (NSHashTable *)v70;

    v73->_lockObservers._os_unfair_lock_opaque = 0;
    [v77 registerObserver:v73];

    id v16 = v77;
    v18 = v73;

    id v14 = v79;
    id v13 = v80;
  }

  return v18;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  [(PDAccountManager *)self->_accountManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDApplyManager;
  [(PDApplyManager *)&v3 dealloc];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100309AA0;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (void)databaseRestored
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100309C10;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_queue_mergeApplications:(id)a3 featureFailures:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  id v35 = objc_alloc_init((Class)NSMutableArray);
  id v38 = objc_alloc_init((Class)NSMutableArray);
  id v37 = objc_alloc_init((Class)NSMutableArray);
  id v42 = objc_alloc_init((Class)NSMutableArray);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v36 = self;
  obj = self->_applications;
  id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v48;
    id v39 = v6;
    do
    {
      v11 = 0;
      id v40 = v9;
      do
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v11);
        id v13 = objc_msgSend(v6, "errorForFeature:", objc_msgSend(v12, "feature", v35));
        if (v13)
        {
          [v42 addObject:v12];
          goto LABEL_25;
        }
        if (![v7 count]) {
          goto LABEL_22;
        }
        uint64_t v14 = 0;
        while (1)
        {
          id v15 = [v7 objectAtIndex:v14];
          id v16 = [v12 applicationIdentifier];
          v17 = [v15 applicationIdentifier];
          id v18 = v16;
          id v19 = v17;
          if (v18 == v19) {
            break;
          }
          dispatch_queue_t v20 = v19;
          if (v18 && v19)
          {
            unsigned __int8 v21 = [v18 isEqualToString:v19];

            if (v21) {
              goto LABEL_19;
            }
          }
          else
          {
          }
          if (++v14 >= (unint64_t)[v7 count]) {
            goto LABEL_22;
          }
        }

LABEL_19:
        if (v15)
        {
          [v7 removeObjectAtIndex:v14];
          if ([v15 applicationState] != (id)15)
          {
            [v42 addObject:v15];
            id v9 = v40;
            if ((PKEqualObjects() & 1) == 0)
            {
              v52[0] = v12;
              v52[1] = v15;
              dispatch_queue_t v22 = +[NSArray arrayWithObjects:v52 count:2];
              [v37 addObject:v22];
            }
            id v6 = v39;
            goto LABEL_24;
          }
          [v38 addObject:v12];
        }
        else
        {
LABEL_22:
          [v38 addObject:v12];
          id v15 = 0;
        }
        id v6 = v39;
        id v9 = v40;
LABEL_24:

LABEL_25:
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      id v9 = v23;
    }
    while (v23);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = v7;
  id v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
  v26 = v35;
  if (v25)
  {
    id v27 = v25;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v24);
        }
        id v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v30, "applicationState", v35) != (id)15)
        {
          [v26 addObject:v30];
          [v42 addObject:v30];
        }
      }
      id v27 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v27);
  }

  id v31 = objc_alloc((Class)NSMutableArray);
  uint64_t v32 = [(PDDatabaseManager *)v36->_databaseManager setFeatureApplications:v42];
  v33 = (NSMutableArray *)[v31 initWithArray:v32];
  applications = v36->_applications;
  v36->_applications = v33;

  [(PDApplyManager *)v36 _updateCachedAccountApplications];
  [(PDApplyManager *)v36 _processAddedApplications:v26];
  [(PDApplyManager *)v36 _processDeletedApplications:v38];
  [(PDApplyManager *)v36 _processChangedApplications:v37];
  if ([v26 count] || objc_msgSend(v38, "count") || objc_msgSend(v37, "count")) {
    [(PDApplyManager *)v36 _postApplicationsChangedNotification];
  }
}

- (void)_queue_mergeApplications:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  id v32 = objc_alloc_init((Class)NSMutableArray);
  id v37 = objc_alloc_init((Class)NSMutableArray);
  id v34 = objc_alloc_init((Class)NSMutableArray);
  id v35 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v31 = self;
  v33 = v6;
  id obj = [(NSMutableDictionary *)self->_accountApplications objectForKeyedSubscript:v6];
  id v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v11);
        if (![v7 count]) {
          goto LABEL_20;
        }
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = [v7 objectAtIndex:v13];
          id v15 = [v12 applicationIdentifier];
          id v16 = [v14 applicationIdentifier];
          id v17 = v15;
          id v18 = v16;
          if (v17 == v18) {
            break;
          }
          id v19 = v18;
          if (v17 && v18)
          {
            unsigned __int8 v20 = [v17 isEqualToString:v18];

            if (v20) {
              goto LABEL_17;
            }
          }
          else
          {
          }
          if (++v13 >= (unint64_t)[v7 count]) {
            goto LABEL_20;
          }
        }

LABEL_17:
        if (v14)
        {
          [v7 removeObjectAtIndex:v13];
          if ([v14 applicationState] == (id)15)
          {
            [v37 addObject:v12];
          }
          else
          {
            [v35 addObject:v14];
            if ((PKEqualObjects() & 1) == 0)
            {
              v47[0] = v12;
              v47[1] = v14;
              unsigned __int8 v21 = +[NSArray arrayWithObjects:v47 count:2];
              [v34 addObject:v21];
            }
          }
        }
        else
        {
LABEL_20:
          [v37 addObject:v12];
          uint64_t v14 = 0;
        }

        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v22 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      id v9 = v22;
    }
    while (v22);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v7;
  id v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v28 applicationState] != (id)15)
        {
          [v32 addObject:v28];
          [v35 addObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v25);
  }

  id v29 = [(PDDatabaseManager *)v31->_databaseManager setFeatureApplications:v35 forAccountIdentifier:v33];
  id v30 = [v29 mutableCopy];

  [(NSMutableDictionary *)v31->_accountApplications setObject:v30 forKeyedSubscript:v33];
  [(PDApplyManager *)v31 _processAddedApplications:v32];
  [(PDApplyManager *)v31 _processDeletedApplications:v37];
  [(PDApplyManager *)v31 _processChangedApplications:v34];
}

- (void)mergeApplications:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030A630;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)mergeApplications:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10030A7CC;
  v15[3] = &unk_100730578;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)insertOrReplaceApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030A944;
    block[3] = &unk_10072E9D8;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)deleteLocalApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030ACE0;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)noteAccountDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10030B0B8;
  v22[3] = &unk_10072E5C0;
  v22[4] = self;
  [v5 addOperation:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_accountApplications;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v10);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10030B1B8;
        v17[3] = &unk_100731CB8;
        v17[4] = self;
        v17[5] = v11;
        [v5 addOperation:v17];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  id v12 = +[NSNull null];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10030B2C4;
  v15[3] = &unk_100734688;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v5 evaluateWithInput:v12 completion:v15];
}

- (void)deleteApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030B374;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)deleteApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030B4E8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_queue_deleteApplications
{
  id v3 = [(NSMutableArray *)self->_applications copy];
  [(PDDatabaseManager *)self->_databaseManager deleteAllFeatureApplications];
  [(NSMutableArray *)self->_applications removeAllObjects];
  [(PDApplyManager *)self _postApplicationsChangedNotification];
  [(PDApplyManager *)self _processDeletedApplications:v3];
}

- (void)_queue_deleteApplicationsForAccountIdentifier:(id)a3
{
  accountApplications = self->_accountApplications;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)accountApplications objectForKeyedSubscript:v5];
  id v7 = [v6 copy];

  [(PDDatabaseManager *)self->_databaseManager deleteFeatureApplicationsWithAccountIdentifier:v5];
  [(NSMutableDictionary *)self->_accountApplications removeObjectForKey:v5];

  [(PDApplyManager *)self _processDeletedApplications:v7];
}

- (void)_processAddedApplications:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10030B734;
  v5[3] = &unk_100748790;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(PDApplyManager *)self _accessObserversWithHandler:v5];
}

- (void)_processChangedApplications:(id)a3
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10030BB64;
  v23[3] = &unk_100748790;
  id v4 = a3;
  id v24 = v4;
  id v25 = self;
  [(PDApplyManager *)self _accessObserversWithHandler:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 count] == (id)2)
        {
          uint64_t v11 = [v10 objectAtIndexedSubscript:0];
          id v12 = [v10 objectAtIndexedSubscript:1];
          if ([v11 applicationState] == (id)5
            && [v11 applicationStateReason] == (id)8
            && [v12 applicationState] == (id)4)
          {
            id v13 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Silently share claim because application went from pending - manual idv review to open", buf, 2u);
            }

            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_10030BCD8;
            v15[3] = &unk_100736AF8;
            void v15[4] = self;
            id v14 = v12;
            id v16 = v14;
            id v17 = v11;
            [(PDApplyManager *)self _silentlyShareClaimForApplication:v14 completion:v15];
          }
          else if ([v12 feature] == (id)5 {
                 && ([v12 applicationState] == (id)5 && objc_msgSend(v11, "applicationState") != (id)5
          }
                  || [v12 applicationState] != (id)5 && objc_msgSend(v11, "applicationState") == (id)5))
          {
            PKSavingsSetHasDismissedPendingApplicationMessage();
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)_processDeletedApplications:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10030BF98;
  v14[3] = &unk_100748790;
  id v4 = a3;
  id v15 = v4;
  id v16 = self;
  [(PDApplyManager *)self _accessObserversWithHandler:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "feature", (void)v10) == (id)5) {
          PKSavingsSetHasDismissedPendingApplicationMessage();
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_postApplicationsChangedNotification
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting PKApplyServiceApplicationsChangedDistributedNotification", v4, 2u);
  }

  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 postNotificationName:PKApplyServiceApplicationsChangedDistributedNotification object:0];
}

- (void)_applicationsAreInDirtyStateWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030C1F8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_applicationsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030C4B8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)applicationsForAccountIdentifierAreInDirtyState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030C79C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)applicationIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030CA58;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)applicationsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030CCB8;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)applicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030CE60;
    block[3] = &unk_10072E9D8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)applicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030D114;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)updateApplicationsWithCompletion:(id)a3
{
}

- (void)_updateApplicationsFromPush:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030D370;
  block[3] = &unk_10073A378;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)updateApplicationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030D524;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_queue_performNextApplicationsUpdate
{
  if (!self->_isUpdatingApplications)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v3 = [(NSMutableArray *)self->_pendingApplicationsUpdateBlocks copy];
    if ([v3 count]) {
      *((unsigned char *)v16 + 24) = 1;
    }
    id v4 = [(NSMutableDictionary *)self->_pendingAccountApplicationsUpdateBlocks copy];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10030D930;
    v14[3] = &unk_1007487E0;
    void v14[4] = &v15;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
    if (*((unsigned char *)v16 + 24))
    {
      id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      if ([v3 count])
      {
        [(NSMutableArray *)self->_pendingApplicationsUpdateBlocks removeAllObjects];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10030D96C;
        v12[3] = &unk_100731CB8;
        v12[4] = self;
        id v13 = v3;
        [v5 addOperation:v12];
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10030DA84;
      v10[3] = &unk_100733C18;
      v10[4] = self;
      id v6 = v5;
      id v11 = v6;
      [v4 enumerateKeysAndObjectsUsingBlock:v10];
      id v7 = +[NSNull null];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10030DC9C;
      v9[3] = &unk_100739590;
      v9[4] = self;
      id v8 = [v6 evaluateWithInput:v7 completion:v9];
    }
    _Block_object_dispose(&v15, 8);
  }
}

- (void)_queue_updateApplicationsWithRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating applications", buf, 2u);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10030DFF4;
  v37[3] = &unk_10073D058;
  v37[4] = self;
  id v9 = v6;
  id v38 = v9;
  id v10 = v7;
  id v39 = v10;
  id v11 = objc_retainBlock(v37);
  id v12 = [(NSMutableArray *)self->_applications count];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  *(void *)buf = 0;
  id v30 = buf;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100020B5C;
  v33 = sub_1000210A0;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100020B5C;
  v27[4] = sub_1000210A0;
  id v28 = 0;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  workQueue = self->_workQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10030E1F4;
  v18[3] = &unk_1007488F8;
  id v19 = v9;
  long long v20 = self;
  id v23 = v35;
  id v24 = v27;
  id v21 = v13;
  id v22 = v11;
  id v25 = buf;
  BOOL v26 = v12 != 0;
  id v15 = v13;
  id v16 = v11;
  id v17 = v9;
  dispatch_async(workQueue, v18);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v35, 8);
}

- (void)_queue_updateApplicationsForAccountIdentifier:(id)a3 withCompletionBlocks:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating applications for account %@", (uint8_t *)&buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10030F368;
  v29[3] = &unk_10073E3A0;
  v29[4] = self;
  id v12 = v8;
  id v30 = v12;
  id v13 = v9;
  id v31 = v13;
  id v14 = v10;
  id v32 = v14;
  id v15 = objc_retainBlock(v29);
  id v16 = [(NSMutableDictionary *)self->_accountApplyServiceURLs objectForKey:v12];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100020B5C;
  char v36 = sub_1000210A0;
  id v37 = 0;
  id v17 = objc_alloc_init((Class)NSMutableArray);
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10030F558;
  v23[3] = &unk_1007364C0;
  void v23[4] = self;
  id v24 = v16;
  id v25 = v12;
  id v26 = v17;
  id v27 = v15;
  p_long long buf = &buf;
  id v19 = v15;
  id v20 = v17;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(workQueue, v23);

  _Block_object_dispose(&buf, 8);
}

- (void)updateApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10030FDD0;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)queuePerformNextApplicationUpdateWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = [(NSMutableDictionary *)self->_pendingApplicationUpdateBlocks objectForKey:v6];
  id v5 = [(NSMutableDictionary *)self->_applicationsBeingUpdated objectForKey:v6];
  if (v5)
  {
  }
  else if ([v4 count])
  {
    [(NSMutableDictionary *)self->_pendingApplicationUpdateBlocks removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_applicationsBeingUpdated setObject:&__kCFBooleanTrue forKey:v6];
    [(PDApplyManager *)self _updateApplicationWithIdentifier:v6 completionBlocks:v4];
  }
}

- (void)_updateApplicationWithIdentifier:(id)a3 completionBlocks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating application with identifier %{public}@", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003100D8;
  v17[3] = &unk_100736AF8;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v19 = v7;
  id v10 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10031036C;
  v13[3] = &unk_100748A38;
  id v14 = v9;
  id v15 = self;
  id v16 = objc_retainBlock(v17);
  id v11 = v16;
  id v12 = v9;
  [(PDApplyManager *)self applicationWithIdentifier:v12 completion:v13];
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching Augmented Product", buf, 2u);
  }

  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10031088C;
  v16[3] = &unk_100730578;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(workQueue, v16);
}

- (void)_paymentWebServiceContextChanged
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Payment Web Service context changed in PDApplyManager", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100310BCC;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_updatePushTopics
{
  id obj = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator applyServicePushTopics];
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v3 = [(NSSet *)self->_pushNotificationTopics copy];
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  if (accountPushNotificationTopics)
  {
    id v5 = [(NSMutableDictionary *)accountPushNotificationTopics allValues];
    uint64_t v6 = [obj setByAddingObjectsFromArray:v5];

    id v7 = (void *)v6;
  }
  else
  {
    id v7 = obj;
  }
  id obja = v7;
  objc_storeStrong((id *)&self->_pushNotificationTopics, v7);
  char v8 = PKEqualObjects();
  os_unfair_lock_unlock(&self->_lockPushTopics);

  if ((v8 & 1) == 0) {
    [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
  }
}

- (id)_queue_featureApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = self->_applications;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v41 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      id v11 = [v10 applicationIdentifier];
      id v12 = v4;
      id v13 = v12;
      if (v11 == v12) {
        break;
      }
      if (v4 && v11)
      {
        unsigned __int8 v14 = [v11 isEqualToString:v12];

        if (v14) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }

LABEL_16:
    id v15 = v10;

    if (v15) {
      goto LABEL_42;
    }
  }
  else
  {
LABEL_14:
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(NSMutableDictionary *)self->_accountApplications allValues];
  id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v37;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v18 = v17;
        id v19 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v33;
LABEL_24:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
            id v24 = [v23 applicationIdentifier];
            id v25 = v4;
            id v26 = v25;
            if (v24 == v25) {
              break;
            }
            if (v4 && v24)
            {
              unsigned __int8 v27 = [v24 isEqualToString:v25];

              if (v27) {
                goto LABEL_37;
              }
            }
            else
            {
            }
            if (v20 == (id)++v22)
            {
              id v20 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v20) {
                goto LABEL_24;
              }
              goto LABEL_35;
            }
          }

LABEL_37:
          id v15 = v23;

          if (v15) {
            goto LABEL_41;
          }
        }
        else
        {
LABEL_35:
        }
      }
      id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v31);
  }
  id v15 = 0;
LABEL_41:

LABEL_42:
  return v15;
}

- (void)_updateCachedAccountApplications
{
  id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_accountApplyServiceURLs;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = -[PDDatabaseManager featureApplicationsWithAccountIdentifier:](self->_databaseManager, "featureApplicationsWithAccountIdentifier:", v9, (void)v14);
        id v11 = [v10 allObjects];

        id v12 = [v11 mutableCopy];
        [(NSMutableDictionary *)v3 setObject:v12 forKey:v9];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  accountApplications = self->_accountApplications;
  self->_accountApplications = v3;
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100311718;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_authenticateApplyContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Apply request requires authentication", buf, 2u);
  }

  uint64_t v8 = [v5 authenticationCrediential];
  if (v8)
  {
    id v10 = v5;
    id v11 = v6;
    PKPersistentBAACertificateAndKey();

    id v9 = v10;
  }
  else
  {
    id v9 = +[NSError errorWithDomain:PKApplyErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);
  }
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100311EE8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100312110;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100312338;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031279C;
  block[3] = &unk_1007315D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)_handleApplyResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100312CE4;
  v15[3] = &unk_100730C10;
  id v16 = v8;
  long long v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)_silentlyShareClaimForApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100313060;
  block[3] = &unk_1007315D8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

- (void)_concludeIDVSessionIfNeededForFeatureApplication:(id)a3
{
  id v3 = a3;
  if ((char *)[v3 applicationState] - 6 <= (char *)9)
  {
    id v4 = [v3 coreIDVServiceProviderName];
    if ([v4 length])
    {
      +[DIVerificationSession concludeVerification:v4];
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error: No service provider name. Could not conlude coreIDV verification", v6, 2u);
      }
    }
  }
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003144F8;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003146BC;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003147F0;
  v9[3] = &unk_10072E198;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(workQueue, v9);
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  pushNotificationTopics = self->_pushNotificationTopics;
  if (pushNotificationTopics) {
    id v5 = [(NSSet *)pushNotificationTopics copy];
  }
  else {
    id v5 = 0;
  }
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  if (accountPushNotificationTopics)
  {
    id v7 = [(NSMutableDictionary *)accountPushNotificationTopics allValues];
    uint64_t v8 = [v5 setByAddingObjectsFromArray:v7];

    id v5 = (id)v8;
  }
  if (![v5 count])
  {
    uint64_t v9 = +[NSSet setWithObject:@"com.apple.apply.service"];

    id v5 = (id)v9;
  }
  os_unfair_lock_unlock(p_lockPushTopics);
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Apply push topics: %@", (uint8_t *)&v13, 0xCu);
  }

  id v11 = [v5 copy];
  return v11;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received push for push topic: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100020B5C;
  id v26 = sub_1000210A0;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_lockPushTopics);
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100314D74;
  v19[3] = &unk_100748BE8;
  id v10 = v6;
  id v20 = v10;
  p_long long buf = &buf;
  [(NSMutableDictionary *)accountPushNotificationTopics enumerateKeysAndObjectsUsingBlock:v19];
  os_unfair_lock_unlock(&self->_lockPushTopics);

  if ([*(id *)(*((void *)&buf + 1) + 40) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v11 = *(id *)(*((void *)&buf + 1) + 40);
    id v12 = (char *)[v11 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          -[PDApplyManager updateApplicationsForAccountWithIdentifier:completion:](self, "updateApplicationsForAccountWithIdentifier:completion:");
        }
        id v12 = (char *)[v11 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [(PDApplyManager *)self _updateApplicationsFromPush:1 completion:&stru_100748C08];
  }
  _Block_object_dispose(&buf, 8);
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (PDApplyNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_accountPushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_pushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingApplicationUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_applicationsBeingUpdated, 0);
  objc_storeStrong((id *)&self->_pendingAccountApplicationsUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_pendingApplicationsUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_lastApplicationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_accountApplyServiceURLs, 0);
  objc_storeStrong((id *)&self->_applyServiceURLs, 0);
  objc_storeStrong((id *)&self->_accountApplications, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
}

@end