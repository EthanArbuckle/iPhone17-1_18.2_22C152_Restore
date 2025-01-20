@interface HDSHSleepApneaRescindedNotificationManager
- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3;
- (BOOL)_isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:(id)a3;
- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4;
- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 queueOverride:(id)a5;
- (id)_categoryIdentifierFromRescindedReason:(id)a3;
- (id)_rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:(id)a3;
- (id)_rescindedRequirementIdentifiers;
- (id)unitTesting_postNotificationHandler;
- (void)_queue_checkFeatureStatus;
- (void)_queue_sendNotificationRequestIfNeededWithFeatureStatus:(id)a3;
- (void)_showRescindedNotificationWithTitleAndBodyKeys:(id)a3 rescindedReason:(id)a4;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setUnitTesting_postNotificationHandler:(id)a3;
@end

@implementation HDSHSleepApneaRescindedNotificationManager

- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4 queueOverride:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSHSleepApneaRescindedNotificationManager;
  v11 = [(HDSHSleepApneaRescindedNotificationManager *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_featureStatusProvider, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F43218]) initWithCategory:100 domainName:@"com.apple.health.Sleep.SleepApneaRescindedNotification" profile:v8];
    localKeyValueDomain = v12->_localKeyValueDomain;
    v12->_localKeyValueDomain = (HDKeyValueDomain *)v13;

    objc_storeStrong((id *)&v12->_queue, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    [WeakRetained registerProfileReadyObserver:v12 queue:v12->_queue];
  }
  return v12;
}

- (HDSHSleepApneaRescindedNotificationManager)initWithProfile:(id)a3 featureStatusProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = HKCreateSerialDispatchQueue();
  id v9 = [(HDSHSleepApneaRescindedNotificationManager *)self initWithProfile:v7 featureStatusProvider:v6 queueOverride:v8];

  return v9;
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  featureStatusProvider = self->_featureStatusProvider;
  queue = self->_queue;
  [(HKFeatureStatusProviding *)featureStatusProvider registerObserver:self queue:queue];
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    *(_DWORD *)id v9 = 138543618;
    *(void *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 2112;
    *(void *)&v9[14] = v5;
    id v8 = *(id *)&v9[4];
    _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature status changed to: %@", v9, 0x16u);
  }
  -[HDSHSleepApneaRescindedNotificationManager _queue_sendNotificationRequestIfNeededWithFeatureStatus:](self, "_queue_sendNotificationRequestIfNeededWithFeatureStatus:", v5, *(_OWORD *)v9, *(void *)&v9[16], v10);
}

- (void)_queue_checkFeatureStatus
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  featureStatusProvider = self->_featureStatusProvider;
  id v10 = 0;
  v4 = [(HKFeatureStatusProviding *)featureStatusProvider featureStatusWithError:&v10];
  id v5 = v10;
  if (v4)
  {
    [(HDSHSleepApneaRescindedNotificationManager *)self _queue_sendNotificationRequestIfNeededWithFeatureStatus:v4];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      id v9 = v8;
      _os_log_impl(&dword_226DD9000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature status is nil with error: %@", buf, 0x16u);
    }
  }
}

- (void)_queue_sendNotificationRequestIfNeededWithFeatureStatus:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [v5 requirementsEvaluationByContext];

  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F09600]];

  if (![(HDSHSleepApneaRescindedNotificationManager *)self _isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:v7])
  {
    localKeyValueDomain = self->_localKeyValueDomain;
    id v39 = 0;
    v12 = [(HDKeyValueDomain *)localKeyValueDomain dateForKey:@"HDSHSleepApneaRescindedNotificationDateShownKey" error:&v39];
    id v13 = v39;
    if (v13)
    {
      _HKInitializeLogging();
      id v14 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v14;
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v41 = v16;
        __int16 v42 = 2112;
        id v43 = v13;
        id v17 = v16;
        _os_log_impl(&dword_226DD9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not fetch notification last shown date with error: %@", buf, 0x16u);

LABEL_19:
      }
LABEL_20:

      goto LABEL_21;
    }
    if ([(HDSHSleepApneaRescindedNotificationManager *)self _isFeatureRescindedWithRequirementsEvaluation:v7])
    {
      _HKInitializeLogging();
      v18 = (os_log_t *)MEMORY[0x263F09958];
      v19 = (void *)*MEMORY[0x263F09958];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v41 = v21;
        __int16 v42 = 2112;
        id v43 = v12;
        id v22 = v21;
        _os_log_impl(&dword_226DD9000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep apnea notifications are rescinded. Notification was last shown: %@", buf, 0x16u);
      }
      if (v12) {
        goto LABEL_20;
      }
      v23 = [v7 highestPriorityUnsatisfiedRequirement];
      uint64_t v15 = [(HDSHSleepApneaRescindedNotificationManager *)self _rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:v23];

      v24 = [v7 highestPriorityUnsatisfiedRequirement];
      [(HDSHSleepApneaRescindedNotificationManager *)self _showRescindedNotificationWithTitleAndBodyKeys:v15 rescindedReason:v24];

      v25 = self->_localKeyValueDomain;
      v26 = [MEMORY[0x263EFF910] now];
      id v38 = 0;
      [(HDKeyValueDomain *)v25 setDate:v26 forKey:@"HDSHSleepApneaRescindedNotificationDateShownKey" error:&v38];
      v27 = v38;

      if (v27)
      {
        _HKInitializeLogging();
        os_log_t v28 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v28;
          v30 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v41 = v30;
          __int16 v42 = 2112;
          id v43 = 0;
          id v31 = v30;
          _os_log_impl(&dword_226DD9000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error writing last shown date for notification: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (!v12) {
        goto LABEL_20;
      }
      [(HDSHSleepApneaRescindedNotificationManager *)self _showRescindedNotificationWithTitleAndBodyKeys:&unk_26DAF2630 rescindedReason:0];
      v32 = self->_localKeyValueDomain;
      v33 = [MEMORY[0x263EFFA08] setWithObject:@"HDSHSleepApneaRescindedNotificationDateShownKey"];
      id v37 = 0;
      [(HDKeyValueDomain *)v32 removeValuesForKeys:v33 error:&v37];
      uint64_t v15 = v37;

      if (!v15) {
        goto LABEL_19;
      }
      _HKInitializeLogging();
      v34 = (void *)*MEMORY[0x263F09958];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      v27 = v34;
      v35 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v41 = v35;
      __int16 v42 = 2112;
      id v43 = 0;
      id v36 = v35;
      _os_log_impl(&dword_226DD9000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error resetting last shown date for notification: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)buf = 138543362;
    id v41 = (id)objc_opt_class();
    id v10 = v41;
    _os_log_impl(&dword_226DD9000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep apnea notifications are unavailable for non-rescinded reasons.", buf, 0xCu);
  }
LABEL_21:
}

- (id)_rescindedNotificationTitleAndBodyKeysWithHighestPriorityUnsatisfiedRequirementIdentifier:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26DAF2648];
  if ([v3 isEqualToString:*MEMORY[0x263F09670]])
  {
    id v5 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_REMOTELY_DISABLED";
    id v6 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_REMOTELY_DISABLED";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F09708]])
  {
    id v5 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_SEED_EXPIRED";
    id v6 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_SEED_EXPIRED";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F09650]])
  {
    id v5 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_UNSUPPORTED_REGION";
    id v6 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_UNSUPPORTED_REGION";
  }
  else
  {
    if (![v3 isEqualToString:*MEMORY[0x263F09648]]) {
      goto LABEL_10;
    }
    id v5 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_BODY_WATCH_UNSUPPORTED_REGION";
    id v6 = @"SLEEP_APNEA_RESCINDED_NOTIFICATION_TITLE_WATCH_UNSUPPORTED_REGION";
  }
  [v4 setObject:v6 atIndexedSubscript:0];
  [v4 setObject:v5 atIndexedSubscript:1];
LABEL_10:
  id v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v7;
}

- (void)_showRescindedNotificationWithTitleAndBodyKeys:(id)a3 rescindedReason:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F1DEF0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  id v10 = NSString;
  v11 = [v8 objectAtIndexedSubscript:0];
  v12 = [v10 localizedUserNotificationStringForKey:v11 arguments:0];
  [v9 setTitle:v12];

  id v13 = NSString;
  id v14 = [v8 objectAtIndexedSubscript:1];

  uint64_t v15 = [v13 localizedUserNotificationStringForKey:v14 arguments:0];
  [v9 setBody:v15];

  v16 = [MEMORY[0x263F1DF00] soundWithAlertType:25];
  [v9 setSound:v16];

  if (v6)
  {
    id v17 = [(HDSHSleepApneaRescindedNotificationManager *)self _categoryIdentifierFromRescindedReason:v6];
    [v9 setCategoryIdentifier:v17];
  }
  else
  {
    [v9 setCategoryIdentifier:*MEMORY[0x263F75F18]];
  }
  v18 = [MEMORY[0x263EFF9A0] dictionary];
  [v18 setObject:&unk_26DAF2678 forKeyedSubscript:*MEMORY[0x263F0ADA8]];
  [v9 setUserInfo:v18];
  v19 = [MEMORY[0x263EFF910] date];
  [v9 setDate:v19];
  v20 = [MEMORY[0x263EFF8F0] currentCalendar];
  v21 = objc_msgSend(v20, "hk_dateByAddingDays:toDate:", 1, v19);
  [v9 setExpirationDate:v21];

  id v22 = [MEMORY[0x263F1DF48] requestWithIdentifier:*MEMORY[0x263F75F40] content:v9 trigger:0];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke;
  v24[3] = &unk_2647E7228;
  v24[4] = self;
  id v25 = v22;
  id v23 = v22;
  dispatch_async(MEMORY[0x263EF83A0], v24);
}

void __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "unitTesting_postNotificationHandler");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "unitTesting_postNotificationHandler");
    id v9 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
    v9[2](v9, *(void *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    id v3 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v5 = v12;
      _os_log_impl(&dword_226DD9000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] About to show rescinded notification for sleep apnea notifications.", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v7 = [WeakRetained notificationManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke_336;
    v10[3] = &unk_2647E7200;
    uint64_t v8 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    [v7 postNotificationWithRequest:v8 completion:v10];
  }
}

void __109__HDSHSleepApneaRescindedNotificationManager__showRescindedNotificationWithTitleAndBodyKeys_rescindedReason___block_invoke_336(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x263F09958];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2112;
      id v10 = v3;
      id v6 = v8;
      _os_log_impl(&dword_226DD9000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error posting rescinded notification: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)_isFeatureRescindedWithRequirementsEvaluation:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSHSleepApneaRescindedNotificationManager *)self _rescindedRequirementIdentifiers];
  id v6 = [v4 unsatisfiedRequirementIdentifiers];
  int v7 = [v6 componentsJoinedByString:@", "];

  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2112;
    v24 = v7;
    id v10 = v22;
    _os_log_impl(&dword_226DD9000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for rescinded reasons: %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        if ([v5 containsObject:*(void *)(*((void *)&v16 + 1) + 8 * i)])
        {
          LOBYTE(v12) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v12;
}

- (BOOL)_isFeatureUnavailableForNonRescindedReasonWithRequirementsEvaluation:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSHSleepApneaRescindedNotificationManager *)self _rescindedRequirementIdentifiers];
  id v6 = [v4 unsatisfiedRequirementIdentifiers];
  int v7 = [v6 componentsJoinedByString:@", "];

  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    *(_DWORD *)buf = 138543618;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2112;
    v24 = v7;
    id v10 = v22;
    _os_log_impl(&dword_226DD9000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking feature status for non-rescinded reasons: %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = objc_msgSend(v4, "unsatisfiedRequirementIdentifiers", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        if (![v5 containsObject:*(void *)(*((void *)&v16 + 1) + 8 * i)])
        {
          LOBYTE(v12) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v12;
}

- (id)_rescindedRequirementIdentifiers
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263F09708];
  v8[0] = *MEMORY[0x263F09670];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x263F09648];
  v8[2] = *MEMORY[0x263F09650];
  v8[3] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  id v6 = [v2 setWithArray:v5];

  return v6;
}

- (id)_categoryIdentifierFromRescindedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F09670]])
  {
    uint64_t v4 = (id *)MEMORY[0x263F75F30];
LABEL_9:
    id v5 = (__CFString *)*v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F09708]])
  {
    uint64_t v4 = (id *)MEMORY[0x263F75F38];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F09650]])
  {
    uint64_t v4 = (id *)MEMORY[0x263F75F28];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F09648]])
  {
    uint64_t v4 = (id *)MEMORY[0x263F75F20];
    goto LABEL_9;
  }
  id v5 = &stru_26DAF0A40;
LABEL_10:

  return v5;
}

- (id)unitTesting_postNotificationHandler
{
  return self->_unitTesting_postNotificationHandler;
}

- (void)setUnitTesting_postNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end