@interface APOdmlAssetManagerCoordinator
+ (id)sharedAssetManagerCoordinator;
- (APOdmlAssetManagerCoordinator)init;
- (APOdmlUnfairLock)refreshTrialLock;
- (BOOL)respondToRefreshNotification;
- (NSMutableDictionary)assetManagers;
- (NSObject)refreshClientNotificationObserver;
- (NSOperationQueue)refreshClientQueue;
- (TRIClient)trialClient;
- (id)assetManagerForPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4;
- (void)initializeAssetManagersforPlacementTypes:(id)a3;
- (void)refreshTrialClientForPlacementTypes:(id)a3;
- (void)setRefreshClientNotificationObserver:(id)a3;
- (void)setRefreshClientQueue:(id)a3;
- (void)setRespondToRefreshNotification:(BOOL)a3;
- (void)setTrialClient:(id)a3;
- (void)setUpdateHandlerForNamespace:(id)a3;
@end

@implementation APOdmlAssetManagerCoordinator

+ (id)sharedAssetManagerCoordinator
{
  if (qword_1EB9F9808 != -1) {
    dispatch_once(&qword_1EB9F9808, &unk_1F14FE718);
  }
  v2 = (void *)qword_1EB9F9820;

  return v2;
}

- (void)initializeAssetManagersforPlacementTypes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, v23, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        v11 = [APOdmlAssetManagersForPlacement alloc];
        uint64_t v14 = objc_msgSend_unsignedIntegerValue(v10, v12, v13);
        v16 = objc_msgSend_initWithPlacementType_trialClient_(v11, v15, v14, self->_trialClient);
        objc_msgSend_setObject_forKey_(self->_assetManagers, v17, (uint64_t)v16, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v18, (uint64_t)&v19, v23, 16);
    }
    while (v7);
  }
}

- (id)assetManagerForPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_trialClient(self, a2, a3);

  if (!v7)
  {
    v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, a3);
    v22[0] = v10;
    v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v22, 1);
    objc_msgSend_refreshTrialClientForPlacementTypes_(self, v13, (uint64_t)v12);
  }
  uint64_t v14 = objc_msgSend_assetManagers(self, v8, v9);
  v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v15, a3);
  v18 = objc_msgSend_objectForKey_(v14, v17, (uint64_t)v16);
  long long v20 = objc_msgSend_assetManagerForType_(v18, v19, a4);

  return v20;
}

- (NSMutableDictionary)assetManagers
{
  return self->_assetManagers;
}

- (APOdmlAssetManagerCoordinator)init
{
  v35.receiver = self;
  v35.super_class = (Class)APOdmlAssetManagerCoordinator;
  v2 = [(APOdmlAssetManagerCoordinator *)&v35 init];
  if (v2)
  {
    v3 = [APOdmlUnfairLock alloc];
    uint64_t v5 = objc_msgSend_initWithOptions_(v3, v4, 1);
    refreshTrialLock = v2->_refreshTrialLock;
    v2->_refreshTrialLock = (APOdmlUnfairLock *)v5;

    uint64_t v8 = objc_msgSend_clientWithIdentifier_(MEMORY[0x1E4FB0098], v7, 238);
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v8;

    objc_msgSend_setUpdateHandlerForNamespace_(v2, v10, @"AD_PLATFORMS_ODML");
    objc_msgSend_setUpdateHandlerForNamespace_(v2, v11, @"SEARCH_ADS_COUNTERFACTUAL");
    v2->_respondToRefreshNotification = 1;
    uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13);
    assetManagers = v2->_assetManagers;
    v2->_assetManagers = (NSMutableDictionary *)v14;

    v16 = (void *)MEMORY[0x1E4F1C978];
    v18 = objc_msgSend_numberWithInt_(NSNumber, v17, 0);
    long long v20 = objc_msgSend_arrayWithObjects_(v16, v19, (uint64_t)v18, 0);
    objc_msgSend_initializeAssetManagersforPlacementTypes_(v2, v21, (uint64_t)v20);

    long long v22 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    refreshClientQueue = v2->_refreshClientQueue;
    v2->_refreshClientQueue = v22;

    v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28C40], v24, v25);
    v27 = v2->_refreshClientQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1BBC4A480;
    v33[3] = &unk_1E624A578;
    v28 = v2;
    v34 = v28;
    uint64_t v30 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v26, v29, @"kAPODMLDeviceKnowledgeManagerRanNotification", 0, v27, v33);
    refreshClientNotificationObserver = v28->_refreshClientNotificationObserver;
    v28->_refreshClientNotificationObserver = v30;
  }
  return v2;
}

- (void)setUpdateHandlerForNamespace:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = objc_msgSend_trialClient(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1BBC4A5F8;
  v10[3] = &unk_1E624A5A0;
  objc_copyWeak(&v11, &location);
  id v9 = (id)objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_(v7, v8, (uint64_t)v4, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)refreshTrialClientForPlacementTypes:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_refreshTrialLock(self, v5, v6);
  objc_msgSend_lock(v7, v8, v9);

  id v11 = objc_msgSend_clientWithIdentifier_(MEMORY[0x1E4FB0098], v10, 238);
  objc_msgSend_setTrialClient_(self, v12, (uint64_t)v11);

  objc_msgSend_setUpdateHandlerForNamespace_(self, v13, @"AD_PLATFORMS_ODML");
  objc_msgSend_setUpdateHandlerForNamespace_(self, v14, @"SEARCH_ADS_COUNTERFACTUAL");
  objc_msgSend_initializeAssetManagersforPlacementTypes_(self, v15, (uint64_t)v4);

  objc_msgSend_refreshTrialLock(self, v16, v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v20, v18, v19);
}

- (BOOL)respondToRefreshNotification
{
  return self->_respondToRefreshNotification;
}

- (void)setRespondToRefreshNotification:(BOOL)a3
{
  self->_respondToRefreshNotification = a3;
}

- (void)setTrialClient:(id)a3
{
}

- (NSOperationQueue)refreshClientQueue
{
  return self->_refreshClientQueue;
}

- (void)setRefreshClientQueue:(id)a3
{
}

- (NSObject)refreshClientNotificationObserver
{
  return self->_refreshClientNotificationObserver;
}

- (void)setRefreshClientNotificationObserver:(id)a3
{
}

- (APOdmlUnfairLock)refreshTrialLock
{
  return self->_refreshTrialLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTrialLock, 0);
  objc_storeStrong((id *)&self->_assetManagers, 0);
  objc_storeStrong((id *)&self->_refreshClientNotificationObserver, 0);
  objc_storeStrong((id *)&self->_refreshClientQueue, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end