@interface PDPayLaterMerchantProcessor
- (BOOL)_canUpdateMapsDataForPayLaterFinancingPlan:(id)a3 configurations:(id *)a4;
- (PDPayLaterMerchantProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 databaseManager:(id)a4;
- (id)_mapsBrandAndMerchantForFinancingPlan:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_lookupMapsBrandAndMerchantForFinancingPlan:(id)a3 completion:(id)a4;
- (void)_scheduleActivityWithIdentifier:(id)a3;
- (void)_updateScheduledActivityIfNeccessary;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processFinancingPlans:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:(double)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDPayLaterMerchantProcessor

- (PDPayLaterMerchantProcessor)initWithMapsBrandAndMerchantUpdater:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDPayLaterMerchantProcessor;
  v9 = [(PDPayLaterMerchantProcessor *)&v19 init];
  v10 = v9;
  if (v9)
  {
    *(void *)&v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v11 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_mapsBrandAndMerchantUpdater, a3);
    objc_storeStrong((id *)&v10->_databaseManager, a4);
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    processingFinancingPlanIdentifiers = v10->_processingFinancingPlanIdentifiers;
    v10->_processingFinancingPlanIdentifiers = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.PDPayLaterMerchantProcessor.work", v15);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v16;

    PDScheduledActivityClientRegister();
    [(PDPayLaterMerchantProcessor *)v10 _updateScheduledActivityIfNeccessary];
  }

  return v10;
}

- (void)processFinancingPlans:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v17 = v4;
    id v18 = objc_alloc_init((Class)NSMutableArray);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "planIdentifier", v17);
          if (v10)
          {
            uint64_t v11 = [v9 merchant];
            uint64_t v12 = [v11 mapsMerchant];
            uint64_t v13 = [v11 mapsBrand];
            if (([v11 requiresMerchantReprocessing] & 1) != 0 || !(v12 | v13))
            {
              os_unfair_lock_lock(&self->_lock);
              if ([(NSMutableSet *)self->_processingFinancingPlanIdentifiers containsObject:v10])
              {
                os_unfair_lock_unlock(&self->_lock);
              }
              else
              {
                [(NSMutableSet *)self->_processingFinancingPlanIdentifiers addObject:v10];
                os_unfair_lock_unlock(&self->_lock);
                v20[0] = _NSConcreteStackBlock;
                v20[1] = 3221225472;
                v20[2] = sub_1002DFF60;
                v20[3] = &unk_10072E198;
                v20[4] = self;
                id v21 = v10;
                [(PDPayLaterMerchantProcessor *)self _lookupMapsBrandAndMerchantForFinancingPlan:v9 completion:v20];
              }
            }
            else
            {
              v14 = [(PDPayLaterMerchantProcessor *)self _mapsBrandAndMerchantForFinancingPlan:v9];
              [v18 addObjectsFromArray:v14];
            }
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    if ([v18 count])
    {
      mapsBrandAndMerchantUpdater = self->_mapsBrandAndMerchantUpdater;
      id v16 = [v18 copy];
      [(PDMapsBrandAndMerchantUpdater *)mapsBrandAndMerchantUpdater updateMapsDataForConfigurations:v16];
    }
    id v4 = v17;
  }
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:(double)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E0058;
  block[3] = &unk_10072FFE8;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDPayLaterMerchantProcessor starting activity: %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = (__CFString *)v6;
  id v10 = v9;
  if (v9 == @"PayLaterMerchantReprocessing"
    || v9
    && (unsigned int v11 = [(__CFString *)v9 isEqualToString:@"PayLaterMerchantReprocessing"], v10, v11))
  {
    [(PDPayLaterMerchantProcessor *)self reprocessPayLaterFinancingPlansForMerchantCleanupWithWindow:0 completion:2419200.0];
    [(PDPayLaterMerchantProcessor *)self _updateScheduledActivityIfNeccessary];
  }
}

- (void)_updateScheduledActivityIfNeccessary
{
  if ([(PDDatabaseManager *)self->_databaseManager hasAnyAccountWithType:2])
  {
    if ((PDScheduledActivityExists() & 1) == 0)
    {
      [(PDPayLaterMerchantProcessor *)self _scheduleActivityWithIdentifier:@"PayLaterMerchantReprocessing"];
    }
  }
  else
  {
    PDScheduledActivityRemove();
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not scheduling PayLaterMerchantReprocessing since there are no pay later account on device", v4, 2u);
    }
  }
}

- (void)_scheduleActivityWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKRandomIntegerInRange();
  uint64_t v5 = PKRandomIntegerInRange();
  id v6 = +[NSDate date];
  id v7 = [v6 dateByAddingTimeInterval:(double)v5 * 60.0 + (double)v4 * 3600.0];

  id v8 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v7];
  [v8 setRepeating:0];
  [v8 setRequireNetworkConnectivity:1];
  [v8 setRequireScreenSleep:1];
  [v8 setRequireMainsPower:1];
  PDScheduledActivityRegister();
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduled %@ with start time %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_lookupMapsBrandAndMerchantForFinancingPlan:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)PKPayLaterMerchantLookupSource) initWithFinancingPlan:v6];
  id v9 = [objc_alloc((Class)PKMerchantLookupRequest) initWithSource:v8];
  int v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 planIdentifier];
    *(_DWORD *)buf = 138412290;
    objc_super v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Looking up maps data for financing plan id %@", buf, 0xCu);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002E079C;
  v14[3] = &unk_100747378;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  [v9 startLookupWithCompletion:v14];
}

- (id)_mapsBrandAndMerchantForFinancingPlan:(id)a3
{
  id v8 = 0;
  unsigned int v3 = [(PDPayLaterMerchantProcessor *)self _canUpdateMapsDataForPayLaterFinancingPlan:a3 configurations:&v8];
  id v4 = v8;
  uint64_t v5 = v4;
  id v6 = 0;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)_canUpdateMapsDataForPayLaterFinancingPlan:(id)a3 configurations:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v14 = 0;
  unsigned __int8 v7 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForPayLaterFinancingPlan:v5 outConfiguration:&v14];
  id v8 = v14;
  [v6 safelyAddObject:v8];

  id v13 = 0;
  unsigned __int8 v9 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForPayLaterFinancingPlan:v5 outConfiguration:&v13];

  id v10 = v13;
  [v6 safelyAddObject:v10];

  char v11 = PKIsPhone();
  if (a4) {
    *a4 = [v6 copy];
  }

  return v11 & (v7 | v9);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    id v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_observersLock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        char v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
          char v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_processingFinancingPlanIdentifiers, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_mapsBrandAndMerchantUpdater, 0);
}

@end