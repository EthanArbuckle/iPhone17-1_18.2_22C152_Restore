@interface DMDActivationPredicateObserverManager
- (BOOL)alarms;
- (DMDActivationPredicateObserverManager)init;
- (DMDActivationPredicateObserverManagerDelegate)delegate;
- (NSArray)notifyMatchingNotifications;
- (NSMutableDictionary)activationPredicateObserversByIdentifier;
- (id)_predicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4;
- (id)_subPredicateObserversForCompoundSubPredicates:(id)a3 withUniqueIdentifier:(id)a4;
- (id)activationPredicateObserverForIdentifier:(id)a3;
- (id)addActivationPredicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4;
- (void)_reportChangeToObserver:(id)a3;
- (void)_updateAllActivationPredicateObserverRegistrations;
- (void)handleAlarmWithIdentifier:(id)a3;
- (void)handleNotifyMatchingNotificationWithName:(id)a3;
- (void)removeActivationPredicateObserverWithUniqueIdentifier:(id)a3;
- (void)setActivationPredicateObserversByIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DMDActivationPredicateObserverManager

- (DMDActivationPredicateObserverManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMDActivationPredicateObserverManager;
  v2 = [(DMDActivationPredicateObserverManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activationPredicateObserversByIdentifier = v2->_activationPredicateObserversByIdentifier;
    v2->_activationPredicateObserversByIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)addActivationPredicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  objc_sync_enter(v8);
  v9 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    v10 = [(DMDActivationPredicateObserverManager *)self _predicateObserverForPredicate:v6 withUniqueIdentifier:v7];
    if (v10)
    {
      v11 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
      [v11 setObject:v10 forKeyedSubscript:v7];
    }
  }
  objc_sync_exit(v8);

  return v10;
}

- (void)removeActivationPredicateObserverWithUniqueIdentifier:(id)a3
{
  id v8 = a3;
  v4 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  objc_sync_enter(v4);
  v5 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v8];

  [v6 invalidate];
  id v7 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  [v7 setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v4);
}

- (id)activationPredicateObserverForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  objc_sync_enter(v5);
  id v6 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)_reportChangeToObserver:(id)a3
{
  id v4 = a3;
  v5 = [(DMDActivationPredicateObserverManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000128A4;
    block[3] = &unk_1000C9C08;
    id v7 = v5;
    id v8 = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateAllActivationPredicateObserverRegistrations
{
  id obj = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  objc_sync_enter(obj);
  uint64_t v3 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserversByIdentifier];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_1000C9C48];

  objc_sync_exit(obj);
}

- (id)_predicateObserverForPredicate:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [[DMDActivationBudgetObserver alloc] initWithDelegate:self uniqueIdentifier:v7 budgetPredicate:v6];
LABEL_16:
    v10 = v8;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [[DMDActivationBudgetObserver alloc] initWithDelegate:self uniqueIdentifier:v7 compositeBudgetPredicate:v6];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [[DMDActivationCurfewObserver alloc] initWithDelegate:self uniqueIdentifier:v7 curfewPredicate:v6];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [[DMDActivationOneTimeObserver alloc] initWithDelegate:self uniqueIdentifier:v7 oneTimePredicate:v6];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [[DMDActivationiCloudAccountObserver alloc] initWithDelegate:self uniqueIdentifier:v7 iCloudAccountPredicate:v6];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = DMDActivationPredicateTrue;
LABEL_15:
    id v8 = (DMDActivationBudgetObserver *)[[v9 alloc] initWithDelegate:self uniqueIdentifier:v7 predicate:v6];
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = DMDActivationPredicateFalse;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v13 = [v12 payloadPredicate];
    v14 = [(DMDActivationPredicateObserverManager *)self _predicateObserverForPredicate:v13 withUniqueIdentifier:v7];

    if (v14)
    {
      v15 = [[DMDActivationPredicateNot alloc] initWithDelegate:self uniqueIdentifier:v7 subPredicateObserver:v14 predicate:v12];
LABEL_30:
      v10 = v15;
LABEL_32:

      goto LABEL_17;
    }
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v16 = [v12 payloadPredicates];
    v14 = [(DMDActivationPredicateObserverManager *)self _subPredicateObserversForCompoundSubPredicates:v16 withUniqueIdentifier:v7];

    id v17 = [v14 count];
    v18 = [v12 payloadPredicates];
    id v19 = [v18 count];

    if (v17 != v19) {
      goto LABEL_31;
    }
    v20 = DMDActivationPredicateAll;
LABEL_29:
    v15 = (DMDActivationPredicateNot *)[[v20 alloc] initWithDelegate:self uniqueIdentifier:v7 subPredicateObservers:v14 predicate:v12];
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v21 = [v12 payloadPredicates];
    v14 = [(DMDActivationPredicateObserverManager *)self _subPredicateObserversForCompoundSubPredicates:v21 withUniqueIdentifier:v7];

    id v22 = [v14 count];
    v23 = [v12 payloadPredicates];
    id v24 = [v23 count];

    if (v22 != v24) {
      goto LABEL_31;
    }
    v20 = DMDActivationPredicateAny;
    goto LABEL_29;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (id)_subPredicateObserversForCompoundSubPredicates:(id)a3 withUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = 1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = +[NSString stringWithFormat:@"%@-%ld", v7, (char *)i + v11];
        v15 = [(DMDActivationPredicateObserverManager *)self _predicateObserverForPredicate:v13 withUniqueIdentifier:v14];
        if (v15) {
          [v19 addObject:v15];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      v11 += (uint64_t)i;
    }
    while (v9);
  }

  id v16 = [v19 copy];

  return v16;
}

- (BOOL)alarms
{
  return 1;
}

- (NSArray)notifyMatchingNotifications
{
  v4[0] = @"com.apple.dmd.budget.didChange";
  v4[1] = @"SignificantTimeChangeNotification";
  v4[2] = DMFiCloudAccountDidChangeDarwinNotification;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

- (void)handleAlarmWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling alarm with identifier: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(DMDActivationPredicateObserverManager *)self activationPredicateObserverForIdentifier:v4];
  id v7 = v6;
  if (v6)
  {
    [v6 updateObserverRegistration];
    id v8 = self;
    id v9 = v7;
  }
  else
  {
    [(DMDActivationPredicateObserverManager *)self _updateAllActivationPredicateObserverRegistrations];
    id v8 = self;
    id v9 = 0;
  }
  [(DMDActivationPredicateObserverManager *)v8 _reportChangeToObserver:v9];
}

- (void)handleNotifyMatchingNotificationWithName:(id)a3
{
  id v4 = a3;
  v5 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling notify matching notification with name: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (([v4 isEqualToString:@"com.apple.dmd.budget.didChange"] & 1) != 0
    || ([v4 isEqualToString:@"SignificantTimeChangeNotification"] & 1) != 0
    || [v4 isEqualToString:DMFiCloudAccountDidChangeDarwinNotification])
  {
    [(DMDActivationPredicateObserverManager *)self _updateAllActivationPredicateObserverRegistrations];
    [(DMDActivationPredicateObserverManager *)self _reportChangeToObserver:0];
  }
}

- (DMDActivationPredicateObserverManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DMDActivationPredicateObserverManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)activationPredicateObserversByIdentifier
{
  return self->_activationPredicateObserversByIdentifier;
}

- (void)setActivationPredicateObserversByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPredicateObserversByIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end