@interface PDPaymentOffersManager
- (PDPaymentOffersManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5;
- (id)_endpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4;
- (id)paymentOfferCatalog;
- (id)paymentRewardsBalanceWithIdentifier:(id)a3;
- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3;
- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4;
- (id)pushNotificationTopics;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addPaymentOffersManagerFetchRequest:(id)a3;
- (void)_executeFetchRequest:(id)a3 completion:(id)a4;
- (void)_executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:(id)a3;
- (void)_managerFetch_paymentOffersCatalogWithRequest:(id)a3 completion:(id)a4;
- (void)_updateCatalogAfterPassChangeEvent;
- (void)_updateCatalogFetchScheduledTaskIfNecessary;
- (void)_updatePaymentOffersCatalogFromPush:(BOOL)a3 completion:(id)a4;
- (void)_updatePushTopics;
- (void)_updateRewardsBalanceFetchScheduledTaskIfNecessary:(id)a3;
- (void)dealloc;
- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)noteAccountDeleted;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerObserver:(id)a3;
- (void)removePaymentOffersCatalog;
- (void)unregisterObserver:(id)a3;
- (void)updatePaymentOffersCatalogWithCompletion:(id)a3;
- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
@end

@implementation PDPaymentOffersManager

- (PDPaymentOffersManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PDPaymentOffersManager;
  v12 = [(PDPaymentOffersManager *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v13->_paymentWebServiceCoordinator, a4);
    [(PDPaymentWebServiceCoordinator *)v13->_paymentWebServiceCoordinator registerObserver:v13];
    objc_storeStrong((id *)&v13->_databaseManager, a5);
    v13->_lockPushTopics._os_unfair_lock_opaque = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.passd.PDPaymentOffersManager.work", v14);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.PDPaymentOffersManager.reply", v14);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v17;

    [(PDPushNotificationManager *)v13->_pushNotificationManager registerConsumer:v13];
    [(PDPaymentOffersManager *)v13 _updatePushTopics];
    uint64_t v19 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v19;

    v13->_lockObservers._os_unfair_lock_opaque = 0;
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchRequests = v13->_fetchRequests;
    v13->_fetchRequests = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentRequests = v13->_currentRequests;
    v13->_currentRequests = v23;

    v13->_fetchRequestLock._os_unfair_lock_opaque = 0;
    PDScheduledActivityClientRegister();
  }
  return v13;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDPaymentOffersManager;
  [(PDPaymentOffersManager *)&v3 dealloc];
}

- (id)paymentOfferCatalog
{
  return [(PDDatabaseManager *)self->_databaseManager paymentOfferCatalog];
}

- (void)removePaymentOffersCatalog
{
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
}

- (void)_updatePaymentOffersCatalogFromPush:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [[PDPaymentOffersManagerCatalogFetchRequest alloc] initWithFromPush:v4 completion:v6];

  [(PDPaymentOffersManager *)self _addPaymentOffersManagerFetchRequest:v7];
}

- (void)_managerFetch_paymentOffersCatalogWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    workQueue = self->_workQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1004935E4;
    v8[3] = &unk_10072FDC8;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(workQueue, v8);
  }
}

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100493CC4;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100493E90;
    v12[3] = &unk_100730578;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(workQueue, v12);
  }
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100494038;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)_addPaymentOffersManagerFetchRequest:(id)a3
{
  BOOL v4 = a3;
  id v5 = [v4 requestIdentifier];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Payment Offers manager request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_fetchRequestLock);
  [(NSMutableDictionary *)self->_fetchRequests objectForKey:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "coalesceWithRequest:", v4, (void)v14))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v19 = v4;
            __int16 v20 = 2112;
            v21 = v12;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Payment offers manager request coalesced %@ onto existing request %@", buf, 0x16u);
          }

          id v6 = v4;
          id v13 = v7;
          goto LABEL_20;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v13 = v7;
    if (!v7)
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
      [(NSMutableDictionary *)self->_fetchRequests setObject:v13 forKey:v5];
    }
    -[NSObject addObject:](v13, "addObject:", v4, (void)v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Payment offers manager request queued %@", buf, 0xCu);
    }
    id v7 = v4;
LABEL_20:

    id v7 = v13;
  }
  os_unfair_lock_unlock(&self->_fetchRequestLock);
  [(PDPaymentOffersManager *)self _executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:v5];
}

- (void)_executeNextPaymentOffersManagerFetchIfPossibleForRequestIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchRequestLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_currentRequests objectForKey:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    os_unfair_lock_unlock(&self->_fetchRequestLock);
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_fetchRequests objectForKey:v4];
    uint64_t v8 = [v7 firstObject];
    if (v8)
    {
      id v9 = (void *)v8;
      [v7 removeObjectAtIndex:0];
      currentRequests = self->_currentRequests;
      id v11 = v9;
      [(NSMutableDictionary *)currentRequests setObject:v11 forKey:v4];

      os_unfair_lock_unlock(&self->_fetchRequestLock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1004944D0;
      v12[3] = &unk_10072E198;
      v12[4] = self;
      id v13 = v4;
      [(PDPaymentOffersManager *)self _executeFetchRequest:v11 completion:v12];
    }
    else
    {

      os_unfair_lock_unlock(&self->_fetchRequestLock);
    }
  }
}

- (void)_executeFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004946E8;
  v13[3] = &unk_10072FDC8;
  v13[4] = self;
  id v7 = a4;
  id v14 = v7;
  uint64_t v8 = objc_retainBlock(v13);
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Payment offers manager request started %@", buf, 0xCu);
  }

  if (![v6 requestType])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100494790;
    v10[3] = &unk_100754668;
    id v11 = v6;
    v12 = v8;
    [(PDPaymentOffersManager *)self _managerFetch_paymentOffersCatalogWithRequest:v11 completion:v10];
  }
}

- (void)_updatePushTopics
{
  id v6 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentOffersServicePushTopics];
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v3 = [(NSSet *)self->_pushTopics copy];
  id v4 = (NSSet *)[v6 copy];
  pushTopics = self->_pushTopics;
  self->_pushTopics = v4;

  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((PKEqualObjects() & 1) == 0) {
    [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
  }
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v4 = self->_pushTopics;
  os_unfair_lock_unlock(p_lockPushTopics);
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Payment Offers push topics: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NSSet *)v4 copy];
  return v6;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = (PDPaymentOffersManagerPushPayload *)a3;
  id v7 = (PDPaymentOffersManagerPushPayload *)a4;
  int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Payment Offers Received push for push topic: %@. userInfo: %@", (uint8_t *)&v12, 0x16u);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned int v9 = [(NSSet *)self->_pushTopics containsObject:v6];
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if (v9)
  {
    uint64_t v10 = [[PDPaymentOffersManagerPushPayload alloc] initWithDictionary:v7];
    BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        int v12 = 138412290;
        id v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Payment Offers push payload defined: %@", (uint8_t *)&v12, 0xCu);
      }

      if ((id)[(PDPaymentOffersManagerPushPayload *)v10 endpoint] == (id)1) {
        [(PDPaymentOffersManager *)self _updatePaymentOffersCatalogFromPush:1 completion:&stru_1007546A8];
      }
    }
    else
    {
      if (v11)
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: Payment Offers push payload is not defined properly %@", (uint8_t *)&v12, 0xCu);
      }
    }
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
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100494D60;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (void)passAdded:(id)a3
{
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a3;
    id v7 = [v6 organizationName];
    int v8 = [v6 primaryAccountIdentifier];
    id v9 = [v6 uniqueID];

    int v10 = 138413058;
    id v11 = a3;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    long long v15 = v8;
    __int16 v16 = 2112;
    long long v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDPaymentOffersManager passAdded: %@, %@, %@, %@", (uint8_t *)&v10, 0x2Au);
  }
  [(PDPaymentOffersManager *)self _updateCatalogAfterPassChangeEvent];
}

- (void)passRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 organizationName];
    id v7 = [v4 primaryAccountIdentifier];
    int v8 = [v4 uniqueID];
    int v10 = 138413058;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v7;
    __int16 v16 = 2112;
    long long v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDPaymentOffersManager passRemoved: %@, %@, %@, %@", (uint8_t *)&v10, 0x2Au);
  }
  [(PDPaymentOffersManager *)self _updateCatalogAfterPassChangeEvent];
  if (![(PDDatabaseManager *)self->_databaseManager hasSecureElementPassesOfType:1])
  {
    PKSharedCacheSetBoolForKey();
    PKSharedCacheSetBoolForKey();
    id v9 = [v4 uniqueID];
    PKSetHasSeenPaymentOfferInstallmentPartnerExplanationScreen();
  }
}

- (void)_updateCatalogAfterPassChangeEvent
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager paymentOfferCatalog];
  id v4 = [v3 lastUpdated];

  if (v4
    && (+[NSDate date],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 timeIntervalSinceDate:v4],
        double v7 = v6,
        v5,
        v7 <= 120.0))
  {
    [(PDPaymentOffersManager *)self _updateCatalogFetchScheduledTaskIfNecessary];
  }
  else
  {
    int v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPaymentOffersManager updating catalog now because of a pass change", v9, 2u);
    }

    [(PDPaymentOffersManager *)self _updatePaymentOffersCatalogFromPush:0 completion:&stru_1007546C8];
  }
}

- (void)noteAccountDeleted
{
  [(PDDatabaseManager *)self->_databaseManager removePaymentOfferCatalog];
  PKSharedCacheSetBoolForKey();
  PKSharedCacheSetBoolForKey();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPaymentOffersManager scheduled activity fired %@", (uint8_t *)&v16, 0xCu);
  }

  id v9 = (__CFString *)v6;
  int v10 = v9;
  if (v9 == @"PaymentOffersFetchCatalog") {
    goto LABEL_6;
  }
  if (v9)
  {
    unsigned int v11 = [(__CFString *)v9 isEqualToString:@"PaymentOffersFetchCatalog"];

    if (v11)
    {
LABEL_6:
      [(PDPaymentOffersManager *)self updatePaymentOffersCatalogWithCompletion:&stru_1007546E8];
      goto LABEL_7;
    }
    __int16 v12 = v10;
    if (v12 == @"PaymentOffersFetchRewardsBalance"
      || (id v13 = v12,
          unsigned int v14 = [(__CFString *)v12 isEqualToString:@"PaymentOffersFetchRewardsBalance"], v13, v14))
    {
      long long v15 = [v7 reason];
      if (v15)
      {
        [(PDPaymentOffersManager *)self updatePaymentRewardsBalancesWithPassUniqueIdentifier:v15 completion:&stru_100754708];
        [(PDPaymentOffersManager *)self updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:v15 limit:5 completion:&stru_100754728];
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed updating payment rewards balance and redemptions following scheduled task, no pass identifier", (uint8_t *)&v16, 2u);
        }
      }
    }
  }
LABEL_7:
}

- (void)_updateCatalogFetchScheduledTaskIfNecessary
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10049575C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_updateRewardsBalanceFetchScheduledTaskIfNecessary:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100495B30;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100495F24;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_endpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PDDatabaseManager *)self->_databaseManager passEndpointMetadataForPassUniqueID:v6 type:a4];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [[PDPassEndpointMetadata alloc] initWithType:a4 passUniqueID:v6];
  }
  int v10 = v9;

  return v10;
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10049611C;
    v12[3] = &unk_100730578;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(workQueue, v12);
  }
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10049654C;
    v28[3] = &unk_10073CF90;
    v28[4] = self;
    id v9 = v7;
    id v29 = v9;
    id v10 = objc_retainBlock(v28);
    unsigned int v11 = (void (**)(void, void))v10;
    if (v6)
    {
      __int16 v12 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
      id v13 = [v12 secureElementPass];

      if (v13)
      {
        id v14 = [v13 primaryAccountIdentifier];
        if (v14)
        {
          id v15 = [(PDDatabaseManager *)self->_databaseManager anyEligiblePaymentOfferRewardsCriteriaForPass:v13];
          int v16 = v15;
          if (v15
            && ([v15 identifier],
                id v17 = objc_claimAutoreleasedReturnValue(),
                v17,
                v17))
          {
            workQueue = self->_workQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100496760;
            block[3] = &unk_1007547A0;
            block[4] = self;
            id v22 = v13;
            objc_super v26 = v11;
            id v23 = v14;
            id v24 = v16;
            id v25 = v6;
            id v27 = v9;
            dispatch_async(workQueue, block);
          }
          else
          {
            __int16 v20 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v6;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Payment Pass %@ is not eligible for rewards balance update", buf, 0xCu);
            }

            [(PDDatabaseManager *)self->_databaseManager deletePaymentRewardsBalancesForPassUniqueIdentifier:v6];
            ((void (**)(void, const __CFString *))v11)[2](v11, @"There is no payment offers rewards criteria for pass");
          }
        }
        else
        {
          ((void (**)(void, const __CFString *))v11)[2](v11, @"Pass has no fpanIdentifier to get rewards balance");
        }
      }
      else
      {
        ((void (**)(void, const __CFString *))v11)[2](v11, @"Pass with passUniqueIdentifier not found");
      }
    }
    else
    {
      ((void (*)(void *, const __CFString *))v10[2])(v10, @"No passUniqueIdentifier was provided for update rewards balance");
    }
  }
  else
  {
    uint64_t v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No completion was provided for update rewards balance", buf, 2u);
    }
  }
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100497000;
    v31[3] = &unk_10073CF90;
    v31[4] = self;
    id v11 = v9;
    id v32 = v11;
    __int16 v12 = objc_retainBlock(v31);
    id v13 = (void (**)(void, void))v12;
    if (v8)
    {
      id v14 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
      id v15 = [v14 secureElementPass];

      if (v15)
      {
        int v16 = [v15 primaryAccountIdentifier];
        if (v16)
        {
          id v17 = [(PDDatabaseManager *)self->_databaseManager anyEligiblePaymentOfferRewardsCriteriaForPass:v15];
          v18 = v17;
          if (v17
            && ([v17 identifier],
                uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                v19,
                v19))
          {
            workQueue = self->_workQueue;
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_100497214;
            v23[3] = &unk_100754818;
            v23[4] = self;
            id v24 = v15;
            v28 = v13;
            id v25 = v16;
            id v26 = v18;
            int64_t v30 = a4;
            id v29 = v11;
            id v27 = v8;
            dispatch_async(workQueue, v23);
          }
          else
          {
            id v22 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v8;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Payment Pass %@ is not eligible for rewards redemptions update", buf, 0xCu);
            }

            ((void (**)(void, const __CFString *))v13)[2](v13, @"There is no payment offers rewards criteria for pass");
          }
        }
        else
        {
          ((void (**)(void, const __CFString *))v13)[2](v13, @"Pass has no fpanIdentifier to get rewards redemptions");
        }
      }
      else
      {
        ((void (**)(void, const __CFString *))v13)[2](v13, @"Pass with passUniqueIdentifier not found");
      }
    }
    else
    {
      ((void (*)(void *, const __CFString *))v12[2])(v12, @"No passUniqueIdentifier was provided for update rewards redemptions");
    }
  }
  else
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No completion was provided for update rewards redemptions", buf, 2u);
    }
  }
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager paymentRewardsBalanceWithIdentifier:a3];
}

- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager paymentRewardsBalancesForPassUniqueIdentifier:a3];
}

- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4
{
  return [(PDDatabaseManager *)self->_databaseManager paymentRewardsRedemptionsForPassUniqueIdentifier:a3 limit:a4];
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(PDDatabaseManager *)self->_databaseManager insertOrUpdatePaymentRewardsRedemption:v7 withPassUniqueIdentifier:v6];
  if ([v7 hasOriginalTransactionDetails]
    && [v7 isInGoodStanding])
  {
    [(PDPaymentOffersManager *)self _updateRewardsBalanceFetchScheduledTaskIfNecessary:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequests, 0);
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
}

@end