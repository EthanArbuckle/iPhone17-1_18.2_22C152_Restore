@interface PDCloudStoreTransactionSourceController
- (PDCloudStoreTransactionSourceController)initWithDatabaseManager:(id)a3 accountManager:(id)a4 peerPaymentWebServiceCoordinator:(id)a5 cloudStoreNotificationCoordinator:(id)a6;
- (void)_hasScheduledActivityWithCompletion:(id)a3;
- (void)_queue_allRelevantTransactionSourceIdentifiersWithCompletion:(id)a3;
- (void)_queue_backgroundRecordChangeSyncWithCompletion:(id)a3;
- (void)_queue_filterRelevantTransactionSourceIdentifiersThatCanSyncWithCloudKit:(id)a3 completion:(id)a4;
- (void)_queue_performDailyTransactionSyncFromDate:(id)a3 returnRecords:(BOOL)a4 formReport:(BOOL)a5 completion:(id)a6;
- (void)_queue_relevantTransactionSourceIdentifiersToSyncForPaymentApplication:(id)a3 onPaymentPass:(id)a4 completion:(id)a5;
- (void)_scheduleActivityWithIdentifier:(id)a3;
- (void)_updateScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4;
- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4 groupNameSuffix:(id)a5 ignoreExistingRecordHash:(BOOL)a6 completion:(id)a7;
- (void)passDidDisappear:(id)a3;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3;
- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PDCloudStoreTransactionSourceController

- (PDCloudStoreTransactionSourceController)initWithDatabaseManager:(id)a3 accountManager:(id)a4 peerPaymentWebServiceCoordinator:(id)a5 cloudStoreNotificationCoordinator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PDCloudStoreTransactionSourceController;
  v15 = [(PDCloudStoreTransactionSourceController *)&v22 init];
  if (v15)
  {
    v15->_isInternalBuild = os_variant_has_internal_ui();
    objc_storeStrong((id *)&v15->_databaseManager, a3);
    objc_storeStrong((id *)&v15->_accountManager, a4);
    [(PDAccountManager *)v15->_accountManager registerObserver:v15];
    objc_storeStrong((id *)&v15->_peerPaymentWebServiceCoordinator, a5);
    [(PDPeerPaymentWebServiceCoordinator *)v15->_peerPaymentWebServiceCoordinator registerObserver:v15];
    objc_storeStrong((id *)&v15->_cloudStoreNotificationCoordinator, a6);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.CloudStoreTransactionSourceController.work", v16);
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passd.CloudStoreTransactionSourceController.reply", v16);
    replyQueue = v15->_replyQueue;
    v15->_replyQueue = (OS_dispatch_queue *)v19;

    PDScheduledActivityClientRegister();
    [(PDCloudStoreTransactionSourceController *)v15 _updateScheduledActivityIfNeccessary];
  }
  return v15;
}

- (void)_updateScheduledActivityIfNeccessary
{
  unsigned __int8 v3 = [(PDDatabaseManager *)self->_databaseManager hasAnyAccount];
  unsigned __int8 v4 = [(PDDatabaseManager *)self->_databaseManager hasPeerPaymentAccount];
  if (v3 & 1) != 0 || (v4)
  {
    if ((PDScheduledActivityExists() & 1) == 0) {
      [(PDCloudStoreTransactionSourceController *)self _scheduleActivityWithIdentifier:@"CloudStoreTransactionSourceSync"];
    }
    if (PKIsWatch() && (PDScheduledActivityExists() & 1) == 0) {
      [(PDCloudStoreTransactionSourceController *)self _scheduleActivityWithIdentifier:@"CloudStoreTransactionSourceBGRecordChanges"];
    }
    if (self->_isInternalBuild && (PDScheduledActivityExists() & 1) == 0)
    {
      [(PDCloudStoreTransactionSourceController *)self _scheduleActivityWithIdentifier:@"CloudStoreTransactionSourceChangeEventPurge"];
    }
  }
  else
  {
    PDScheduledActivityRemove();
    PDScheduledActivityRemove();
    PDScheduledActivityRemove();
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling CloudStoreTransactionSourceSync since there are no accounts on device", v6, 2u);
    }
  }
}

- (void)_scheduleActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKRandomIntegerInRange();
  uint64_t v5 = PKRandomIntegerInRange();
  v6 = +[NSDate date];
  v7 = [v6 dateByAddingTimeInterval:(double)v5 * 60.0 + (double)v4 * 3600.0];

  v8 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v7];
  [v8 setRepeating:0];
  [v8 setRequireNetworkConnectivity:1];
  [v8 setRequireScreenSleep:1];
  [v8 setRequireMainsPower:1];
  PDScheduledActivityRegister();
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v3;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduled %{public}@ with start time %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4
{
}

- (void)didAddPaymentApplication:(id)a3 forPaymentPass:(id)a4 groupNameSuffix:(id)a5 ignoreExistingRecordHash:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10012361C;
  v21[3] = &unk_100738B18;
  id v22 = v12;
  id v23 = v13;
  BOOL v27 = a6;
  v24 = self;
  id v25 = v14;
  id v26 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(workQueue, v21);
}

- (void)passDidDisappear:(id)a3
{
  uint64_t v4 = [a3 paymentPass];
  uint64_t v5 = [v4 associatedAccountServiceAccountIdentifier];
  id v6 = [v5 length];

  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100123ED4;
    block[3] = &unk_10072E1E8;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123FA0;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001242B8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124388;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001244B0;
  v8[3] = &unk_10072E198;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012484C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001248C8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124944;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDCloudStoreTransactionSourceController starting activity: %{public}@", buf, 0xCu);
  }

  id v9 = (__CFString *)v6;
  id v10 = v9;
  if (v9 == @"CloudStoreTransactionSourceSync")
  {
LABEL_6:
    if (self->_performingBackgroundSync)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      id v12 = "A cloud store transaction background sync activity is already running";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_10;
    }
    self->_performingBackgroundSync = 1;
    id v13 = +[NSDate date];
    id v14 = [v13 dateByAddingTimeInterval:-604800.0];

    id v15 = PDCloudStoreTransactionSourceControllerLastSync();
    if (v15)
    {
      v16 = v15;
      if ([v15 compare:v14] != (id)-1)
      {
LABEL_24:
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100124D18;
        v29[3] = &unk_100734270;
        v29[4] = self;
        [(PDCloudStoreTransactionSourceController *)self _queue_performDailyTransactionSyncFromDate:v16 returnRecords:0 formReport:1 completion:v29];

        goto LABEL_25;
      }
      id v17 = v14;

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v31 = v17;
        __int16 v32 = 2114;
        id v33 = v17;
        id v18 = "Last transaction record sync date defined is older than %{public}@. Setting last sync date as %{public}@";
        id v19 = v8;
        uint32_t v20 = 22;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      id v24 = v14;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v24;
        id v18 = "No transaction record last sync date defined. Setting last sync date as %{public}@";
        id v19 = v8;
        uint32_t v20 = 12;
        goto LABEL_22;
      }
    }

    v16 = v14;
    goto LABEL_24;
  }
  if (v9)
  {
    unsigned int v11 = [(__CFString *)v9 isEqualToString:@"CloudStoreTransactionSourceSync"];

    if (v11) {
      goto LABEL_6;
    }
    v21 = v10;
    if (v21 == @"CloudStoreTransactionSourceBGRecordChanges"
      || (id v22 = v21,
          unsigned int v23 = [(__CFString *)v21 isEqualToString:@"CloudStoreTransactionSourceBGRecordChanges"], v22, v23))
    {
      if (!self->_performingBackgroundRecordChangesSync)
      {
        self->_performingBackgroundRecordChangesSync = 1;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100125088;
        v28[3] = &unk_10072F6E8;
        v28[4] = self;
        [(PDCloudStoreTransactionSourceController *)self _queue_backgroundRecordChangeSyncWithCompletion:v28];
        goto LABEL_25;
      }
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      id v12 = "A cloud store background record changes sync is already running";
      goto LABEL_9;
    }
    id v25 = v22;
    if (v25 == @"CloudStoreTransactionSourceChangeEventPurge"
      || (id v26 = v25,
          unsigned int v27 = [(__CFString *)v25 isEqualToString:@"CloudStoreTransactionSourceChangeEventPurge"], v26, v27))
    {
      [(PDDatabaseManager *)self->_databaseManager purgeOldCloudStoreContainerChangeEventEntires];
      [(PDCloudStoreTransactionSourceController *)self _updateScheduledActivityIfNeccessary];
    }
  }
LABEL_25:
}

- (void)_queue_performDailyTransactionSyncFromDate:(id)a3 returnRecords:(BOOL)a4 formReport:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Running daily transaction sync task from date %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    id v13 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreNotificationCoordinator applePayContainer];
    id v14 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    id v31 = sub_1000208BC;
    __int16 v32 = sub_100020F50;
    id v33 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10012541C;
    v26[3] = &unk_100730D50;
    v26[4] = self;
    v26[5] = &buf;
    [v14 addOperation:v26];
    id v15 = +[NSNull null];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001256D0;
    v19[3] = &unk_100738BE0;
    v19[4] = self;
    p_long long buf = &buf;
    id v16 = v13;
    id v20 = v16;
    id v21 = v10;
    BOOL v24 = a4;
    BOOL v25 = a5;
    id v22 = v11;
    id v17 = [v14 evaluateWithInput:v15 completion:v19];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001253FC;
    block[3] = &unk_10072F788;
    id v28 = v11;
    dispatch_async(replyQueue, block);
    id v16 = v28;
  }
}

- (void)_queue_backgroundRecordChangeSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Running background record change sync", buf, 2u);
  }

  id v6 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreNotificationCoordinator applePayContainer];
  id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  *(void *)long long buf = 0;
  unsigned int v23 = buf;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = sub_1000208BC;
  id v26 = sub_100020F50;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_1000208BC;
  v20[4] = sub_100020F50;
  id v21 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100125CE4;
  v19[3] = &unk_100730D50;
  v19[4] = self;
  void v19[5] = buf;
  [v7 addOperation:v19];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100125F98;
  v15[3] = &unk_100738C58;
  v15[4] = self;
  id v17 = buf;
  id v8 = v6;
  id v16 = v8;
  id v18 = v20;
  [v7 addOperation:v15];
  id v9 = +[NSNull null];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012639C;
  v12[3] = &unk_100738C80;
  v12[4] = self;
  id v14 = v20;
  id v10 = v4;
  id v13 = v10;
  id v11 = [v7 evaluateWithInput:v9 completion:v12];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_queue_allRelevantTransactionSourceIdentifiersWithCompletion:(id)a3
{
  id v14 = a3;
  id v16 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v4 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1000208BC;
  v29[4] = sub_100020F50;
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "devicePrimaryPaymentApplication", v14);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100126850;
        v21[3] = &unk_100738AA0;
        void v21[4] = self;
        id v10 = v9;
        id v22 = v10;
        unsigned int v23 = v8;
        uint64_t v24 = v29;
        [v16 addOperation:v21];
      }
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100126B30;
  v20[3] = &unk_100730D50;
  v20[4] = self;
  void v20[5] = v29;
  [v16 addOperation:v20];
  id v11 = +[NSNull null];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100126EA0;
  v17[3] = &unk_100738C80;
  v17[4] = self;
  id v19 = v29;
  id v12 = v14;
  id v18 = v12;
  id v13 = [v16 evaluateWithInput:v11 completion:v17];

  _Block_object_dispose(v29, 8);
}

- (void)_queue_relevantTransactionSourceIdentifiersToSyncForPaymentApplication:(id)a3 onPaymentPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      uint64_t v32 = [v8 transactionSourceIdentifier];
      id v12 = [v9 associatedAccountServiceAccountIdentifier];
      id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3032000000;
      v64[3] = sub_1000208BC;
      v64[4] = sub_100020F50;
      id v65 = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = sub_1000208BC;
      v62[4] = sub_100020F50;
      id v63 = 0;
      id v15 = [v9 uniqueID];
      id v16 = [v9 organizationName];
      id v31 = +[NSString stringWithFormat:@"Payment Pass: %@, %@", v15, v16];

      [v14 safelySetObject:v31 forKey:v32];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1001275C8;
      v57[3] = &unk_100738D70;
      id v17 = v12;
      id v58 = v17;
      v59 = self;
      v61 = v62;
      id v18 = v9;
      id v60 = v18;
      [v13 addOperation:v57];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100127BFC;
      v54[3] = &unk_100731CB8;
      id v19 = v18;
      id v55 = v19;
      v56 = self;
      [v13 addOperation:v54];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100127E04;
      v50[3] = &unk_100733E60;
      id v20 = v19;
      id v51 = v20;
      v52 = self;
      id v21 = v14;
      id v53 = v21;
      [v13 addOperation:v50];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100128038;
      v46[3] = &unk_100733E60;
      id v22 = v17;
      id v47 = v22;
      v48 = self;
      id v23 = v21;
      id v49 = v23;
      [v13 addOperation:v46];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10012843C;
      v41[3] = &unk_100738E10;
      id v24 = v22;
      v45 = v62;
      id v42 = v24;
      v43 = self;
      id v25 = v23;
      id v44 = v25;
      [v13 addOperation:v41];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100128818;
      v37[3] = &unk_100730730;
      id v26 = v25;
      id v38 = v26;
      v39 = self;
      v40 = v64;
      [v13 addOperation:v37];
      long long v27 = +[NSNull null];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100128B14;
      v33[3] = &unk_100738E60;
      v33[4] = self;
      id v34 = v20;
      v36 = v64;
      id v35 = v11;
      id v28 = [v13 evaluateWithInput:v27 completion:v33];

      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v64, 8);

      v29 = (void *)v32;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001275AC;
      block[3] = &unk_10072F788;
      id v67 = v10;
      dispatch_async(replyQueue, block);
      v29 = v67;
    }
  }
}

- (void)_queue_filterRelevantTransactionSourceIdentifiersThatCanSyncWithCloudKit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v9 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreNotificationCoordinator applePayContainer];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1000208BC;
  v23[4] = sub_100020F50;
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100128F9C;
  v18[3] = &unk_100738ED8;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  id v21 = self;
  id v22 = v23;
  [v6 enumerateKeysAndObjectsUsingBlock:v18];
  id v12 = +[NSNull null];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100129344;
  v15[3] = &unk_100738F00;
  v15[4] = self;
  id v13 = v7;
  id v16 = v13;
  id v17 = v23;
  id v14 = [v10 evaluateWithInput:v12 completion:v15];

  _Block_object_dispose(v23, 8);
}

- (void)_hasScheduledActivityWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001294D4;
  block[3] = &unk_10072F788;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end