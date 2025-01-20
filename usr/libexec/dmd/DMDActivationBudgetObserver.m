@interface DMDActivationBudgetObserver
- (BOOL)_budgetDays:(id)a3 duration:(id)a4 calendar:(id)a5 schedule:(id)a6;
- (BOOL)_extractComponentsFromBudgetPredicate:(id)a3;
- (BOOL)_extractComponentsFromCompositeBudgetPredicate:(id)a3;
- (BOOL)_registerPredicateObserver;
- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 budgetPredicate:(id)a5;
- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 compositeBudgetPredicate:(id)a5;
- (NSMutableArray)expiredNotificationTimes;
- (NSNumber)remainingTime;
- (NSSet)notificationTimes;
- (NSString)calendarIdentifier;
- (USBudget)usageBudget;
- (USUsageMonitor)usageMonitor;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)invalidate;
- (void)setCalendarIdentifier:(id)a3;
- (void)setExpiredNotificationTimes:(id)a3;
- (void)setNotificationTimes:(id)a3;
- (void)setRemainingTime:(id)a3;
- (void)setUsageBudget:(id)a3;
- (void)setUsageMonitor:(id)a3;
@end

@implementation DMDActivationBudgetObserver

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 budgetPredicate:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationBudgetObserver;
  v9 = [(DMDActivationPredicateObserver *)&v16 initWithDelegate:a3 uniqueIdentifier:a4 predicate:v8];
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_opt_new();
  usageMonitor = v9->_usageMonitor;
  v9->_usageMonitor = (USUsageMonitor *)v10;

  uint64_t v12 = objc_opt_new();
  expiredNotificationTimes = v9->_expiredNotificationTimes;
  v9->_expiredNotificationTimes = (NSMutableArray *)v12;

  if (![(DMDActivationBudgetObserver *)v9 _extractComponentsFromBudgetPredicate:v8])goto LABEL_5; {
  if ([(DMDActivationBudgetObserver *)v9 _registerPredicateObserver])
  }
LABEL_4:
    v14 = v9;
  else {
LABEL_5:
  }
    v14 = 0;

  return v14;
}

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 compositeBudgetPredicate:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMDActivationBudgetObserver;
  v9 = [(DMDActivationPredicateObserver *)&v16 initWithDelegate:a3 uniqueIdentifier:a4 predicate:v8];
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_opt_new();
  usageMonitor = v9->_usageMonitor;
  v9->_usageMonitor = (USUsageMonitor *)v10;

  uint64_t v12 = objc_opt_new();
  expiredNotificationTimes = v9->_expiredNotificationTimes;
  v9->_expiredNotificationTimes = (NSMutableArray *)v12;

  if (![(DMDActivationBudgetObserver *)v9 _extractComponentsFromCompositeBudgetPredicate:v8])goto LABEL_5; {
  if ([(DMDActivationBudgetObserver *)v9 _registerPredicateObserver])
  }
LABEL_4:
    v14 = v9;
  else {
LABEL_5:
  }
    v14 = 0;

  return v14;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v5 = [(DMDActivationBudgetObserver *)self usageBudget];
  v6 = [v5 identifier];

  [(DMDActivationBudgetObserver *)self setRemainingTime:0];
  v7 = [(DMDActivationBudgetObserver *)self expiredNotificationTimes];
  [v7 removeAllObjects];

  id v8 = [(DMDActivationBudgetObserver *)self usageMonitor];
  v56 = v6;
  v9 = +[NSArray arrayWithObjects:&v56 count:1];
  id v44 = 0;
  uint64_t v10 = [v8 checkStatusOfBudgets:v9 error:&v44];
  id v11 = v44;

  if (v10)
  {
    v39 = a3;
    uint64_t v12 = [v10 objectForKeyedSubscript:v6];
    v13 = v12;
    v14 = &__kCFBooleanFalse;
    if (v12)
    {
      id v37 = v11;
      v38 = v10;
      [v12 doubleValue];
      if (v15 <= 0.0) {
        v14 = &__kCFBooleanTrue;
      }
      [(DMDActivationBudgetObserver *)self setRemainingTime:v13];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      objc_super v16 = [(DMDActivationBudgetObserver *)self notificationTimes];
      id v17 = [v16 countByEnumeratingWithState:&v40 objects:v55 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v41;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v41 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            [v21 doubleValue];
            double v23 = v22;
            [v13 doubleValue];
            if (v23 >= v24)
            {
              v25 = [(DMDActivationBudgetObserver *)self expiredNotificationTimes];
              [v25 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v40 objects:v55 count:16];
        }
        while (v18);
      }

      id v11 = v37;
      uint64_t v10 = v38;
    }
    -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", [v14 BOOLValue]);
    v26 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(DMDActivationPredicateObserver *)self predicateType];
      v28 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      v29 = [(DMDActivationBudgetObserver *)self expiredNotificationTimes];
      *(_DWORD *)buf = 138544386;
      v46 = v27;
      __int16 v47 = 2114;
      v48 = v28;
      __int16 v49 = 2114;
      v50 = v6;
      __int16 v51 = 2114;
      v52 = v29;
      __int16 v53 = 2114;
      v54 = v13;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded checking status of Usage Tracking monitor with budget identifier %{public}@, expired notification times: %{public}@, remaining time: %{public}@ seconds", buf, 0x34u);
    }
    a3 = v39;
  }
  else
  {
    v13 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v34 = [(DMDActivationPredicateObserver *)self predicateType];
      v35 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      v36 = [v11 debugDescription];
      *(_DWORD *)buf = 138544130;
      v46 = v34;
      __int16 v47 = 2114;
      v48 = v35;
      __int16 v49 = 2114;
      v50 = v6;
      __int16 v51 = 2114;
      v52 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed checking status of Usage Tracking monitor with budget identifier: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    v14 = 0;
  }

  if (a3 && v11) {
    *a3 = v11;
  }
  v30 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(DMDActivationPredicateObserver *)self predicateType];
    v32 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    *(_DWORD *)buf = 138544130;
    v46 = v31;
    __int16 v47 = 2114;
    v48 = v32;
    __int16 v49 = 2114;
    v50 = v14;
    __int16 v51 = 2114;
    v52 = v6;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %{public}@ for Usage Tracking monitor with identifier: %{public}@", buf, 0x2Au);
  }
  return v14;
}

- (void)invalidate
{
  v3 = [(DMDActivationBudgetObserver *)self usageBudget];
  v4 = [v3 identifier];

  v5 = [(DMDActivationBudgetObserver *)self usageMonitor];
  id v11 = v4;
  v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D680;
  v9[3] = &unk_1000C9B78;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  [v5 stopMonitoringBudgets:v6 completionHandler:v9];

  v8.receiver = self;
  v8.super_class = (Class)DMDActivationBudgetObserver;
  [(DMDActivationPredicateObserver *)&v8 invalidate];
}

- (id)metadata
{
  v3 = objc_opt_new();
  v4 = [(DMDActivationBudgetObserver *)self expiredNotificationTimes];
  v5 = [v4 sortedArrayUsingSelector:"compare:"];

  if ([v5 count]) {
    [v3 setObject:v5 forKeyedSubscript:DMFDeclarationStatePredicatePayloadStatusExpiredNotificationTimesKey];
  }
  v8.receiver = self;
  v8.super_class = (Class)DMDActivationBudgetObserver;
  v6 = [(DMDActivationPredicateObserver *)&v8 metadata];
  if ([v3 count]) {
    [v6 setObject:v3 forKeyedSubscript:DMFDeclarationStatePredicatePayloadStatusKey];
  }

  return v6;
}

- (BOOL)_extractComponentsFromBudgetPredicate:(id)a3
{
  id v4 = a3;
  v5 = [v4 payloadCalendarIdentifier];
  [(DMDActivationBudgetObserver *)self setCalendarIdentifier:v5];

  v6 = [(DMDActivationBudgetObserver *)self calendarIdentifier];
  id v7 = [(DMDActivationPredicateObserver *)self calendarForIdentifier:v6];

  objc_super v8 = [v4 payloadMonitor];
  if (v8)
  {
    v9 = [v4 payloadIdentifiersVersion2];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v4 payloadIdentifiers];
    }
    uint64_t v12 = v11;

    if (![v12 count])
    {
      id v18 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10007EB78();
      }
      BOOL v13 = 0;
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = objc_opt_new();
    v50 = objc_opt_new();
    if ([v8 isEqualToString:@"Apps"])
    {
      uint64_t v16 = +[NSSet setWithArray:v12];
      id v17 = (void *)v14;
      uint64_t v14 = v16;
    }
    else if ([v8 isEqualToString:@"Categories"])
    {
      uint64_t v19 = +[NSSet setWithArray:v12];
      id v17 = (void *)v15;
      uint64_t v15 = v19;
    }
    else
    {
      if (![v8 isEqualToString:@"WebSites"])
      {
LABEL_19:
        __int16 v49 = (void *)v15;
        uint64_t v21 = [v4 payloadNotificationTimes];
        id v44 = v8;
        __int16 v47 = v12;
        v48 = v14;
        v46 = (void *)v21;
        if (v21)
        {
          uint64_t v22 = +[NSSet setWithArray:v21];
        }
        else
        {
          uint64_t v22 = objc_opt_new();
        }
        double v23 = (void *)v22;
        [(DMDActivationBudgetObserver *)self setNotificationTimes:v22];

        double v24 = objc_opt_new();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v45 = v4;
        v25 = [v4 payloadTimeBudget];
        id v26 = [v25 countByEnumeratingWithState:&v51 objects:v69 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v52;
          while (2)
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v52 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v31 = [v30 payloadDays];
              v32 = [v30 payloadSeconds];
              unsigned __int8 v33 = [(DMDActivationBudgetObserver *)self _budgetDays:v31 duration:v32 calendar:v7 schedule:v24];

              if ((v33 & 1) == 0)
              {
                long long v42 = DMFConfigurationEngineLog();
                id v18 = v48;
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  sub_10007EC14();
                }

                BOOL v13 = 0;
                objc_super v8 = v44;
                id v4 = v45;
                goto LABEL_37;
              }
            }
            id v27 = [v25 countByEnumeratingWithState:&v51 objects:v69 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        id v34 = objc_alloc((Class)USBudget);
        v35 = [v7 calendarIdentifier];
        v36 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
        id v37 = [v34 initWithCategories:v49 applications:v48 webDomains:v50 schedule:v24 calendarIdentifier:v35 identifier:v36];
        [(DMDActivationBudgetObserver *)self setUsageBudget:v37];

        v25 = DMFConfigurationEngineLog();
        BOOL v13 = 1;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v38 = [(DMDActivationPredicateObserver *)self predicateType];
          v39 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
          long long v40 = [(DMDActivationBudgetObserver *)self calendarIdentifier];
          long long v41 = [(DMDActivationBudgetObserver *)self notificationTimes];
          *(_DWORD *)buf = 138544898;
          v56 = v38;
          __int16 v57 = 2114;
          v58 = v39;
          __int16 v59 = 2114;
          v60 = v40;
          __int16 v61 = 2114;
          objc_super v8 = v44;
          v62 = v44;
          __int16 v63 = 2114;
          v64 = v47;
          __int16 v65 = 2114;
          v66 = v41;
          __int16 v67 = 2114;
          v68 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, budget type: %{public}@, budgeted identifiers: %{public}@, notification times: %{public}@, budget schedule: %{public}@", buf, 0x48u);
        }
        else
        {
          objc_super v8 = v44;
        }
        id v4 = v45;
        id v18 = v48;
LABEL_37:

        uint64_t v12 = v47;
        goto LABEL_38;
      }
      uint64_t v20 = +[NSSet setWithArray:v12];
      id v17 = v50;
      v50 = (void *)v20;
    }

    goto LABEL_19;
  }
  uint64_t v12 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10007EADC();
  }
  BOOL v13 = 0;
LABEL_39:

  return v13;
}

- (BOOL)_extractComponentsFromCompositeBudgetPredicate:(id)a3
{
  id v4 = a3;
  v5 = [v4 payloadCalendarIdentifier];
  [(DMDActivationBudgetObserver *)self setCalendarIdentifier:v5];

  v6 = [(DMDActivationBudgetObserver *)self calendarIdentifier];
  id v7 = [(DMDActivationPredicateObserver *)self calendarForIdentifier:v6];

  objc_super v8 = [v4 payloadMonitors];
  v9 = [v8 payloadApps];

  id v10 = [v4 payloadMonitors];
  id v11 = [v10 payloadCategoriesVersion2];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [v4 payloadMonitors];
    id v13 = [v14 payloadCategories];
  }
  uint64_t v15 = [v4 payloadMonitors];
  uint64_t v16 = [v15 payloadWebSites];

  if (v9 || v13 || v16)
  {
    if (v9)
    {
      uint64_t v19 = +[NSSet setWithArray:v9];
    }
    else
    {
      uint64_t v19 = objc_opt_new();
    }
    uint64_t v20 = v19;
    if (v13)
    {
      uint64_t v21 = +[NSSet setWithArray:v13];
    }
    else
    {
      uint64_t v21 = objc_opt_new();
    }
    __int16 v49 = (void *)v21;
    if (v16)
    {
      uint64_t v22 = +[NSSet setWithArray:v16];
    }
    else
    {
      uint64_t v22 = objc_opt_new();
    }
    v56 = (void *)v22;
    uint64_t v23 = [v4 payloadNotificationTimes];
    long long v54 = (void *)v23;
    v55 = v9;
    v50 = v20;
    long long v51 = v16;
    if (v23)
    {
      uint64_t v24 = +[NSSet setWithArray:v23];
    }
    else
    {
      uint64_t v24 = objc_opt_new();
    }
    v25 = (void *)v24;
    id v52 = v13;
    [(DMDActivationBudgetObserver *)self setNotificationTimes:v24];

    id v26 = objc_opt_new();
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v53 = v4;
    id v27 = [v4 payloadTimeBudget];
    id v28 = [v27 countByEnumeratingWithState:&v57 objects:v77 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v58;
      while (2)
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          unsigned __int8 v33 = [v32 payloadDays];
          id v34 = [v32 payloadSeconds];
          unsigned __int8 v35 = [(DMDActivationBudgetObserver *)self _budgetDays:v33 duration:v34 calendar:v7 schedule:v26];

          if ((v35 & 1) == 0)
          {
            v46 = DMFConfigurationEngineLog();
            id v17 = v50;
            id v44 = v56;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              sub_10007EC14();
            }

            BOOL v18 = 0;
            id v13 = v52;
            id v4 = v53;
            uint64_t v16 = v51;
            id v45 = v49;
            goto LABEL_36;
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v57 objects:v77 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    id v36 = objc_alloc((Class)USBudget);
    id v37 = [v7 calendarIdentifier];
    v38 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    id v39 = [v36 initWithCategories:v49 applications:v50 webDomains:v56 schedule:v26 calendarIdentifier:v37 identifier:v38];
    [(DMDActivationBudgetObserver *)self setUsageBudget:v39];

    id v27 = DMFConfigurationEngineLog();
    BOOL v18 = 1;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v48 = [(DMDActivationPredicateObserver *)self predicateType];
      uint64_t v40 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
      long long v41 = [(DMDActivationBudgetObserver *)self calendarIdentifier];
      long long v42 = [(DMDActivationBudgetObserver *)self notificationTimes];
      *(_DWORD *)buf = 138545154;
      v62 = v48;
      __int16 v63 = 2114;
      uint64_t v64 = v40;
      long long v43 = (void *)v40;
      __int16 v65 = 2114;
      v66 = v41;
      __int16 v67 = 2114;
      v68 = v50;
      __int16 v69 = 2114;
      v70 = v49;
      __int16 v71 = 2114;
      id v44 = v56;
      v72 = v56;
      __int16 v73 = 2114;
      v74 = v42;
      __int16 v75 = 2114;
      v76 = v26;
      BOOL v18 = 1;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Predicate type: %{public}@ with unique identifier: %{public}@ extracted calendar identifier: %{public}@, budgeted application identifiers: %{public}@, budgeted category identifiers: %{public}@, budgeted website identifiers: %{public}@, notification times: %{public}@, budget schedule: %{public}@", buf, 0x52u);

      id v45 = v49;
      id v13 = v52;
      id v4 = v53;
      id v17 = v50;
      uint64_t v16 = v51;
    }
    else
    {
      id v45 = v49;
      id v13 = v52;
      id v4 = v53;
      id v17 = v50;
      uint64_t v16 = v51;
      id v44 = v56;
    }
LABEL_36:

    v9 = v55;
  }
  else
  {
    id v17 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10007EB78();
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_budgetDays:(id)a3 duration:(id)a4 calendar:(id)a5 schedule:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (char *)[a5 maximumRangeOfUnit:512];
  uint64_t v14 = v13;
  if (![v9 count])
  {
    uint64_t v15 = objc_opt_new();
    if (v12 < &v12[v14])
    {
      uint64_t v16 = v14;
      id v17 = v12;
      do
      {
        BOOL v18 = +[NSNumber numberWithUnsignedInteger:v17];
        [v15 addObject:v18];

        ++v17;
        --v16;
      }
      while (v16);
    }
    id v19 = [v15 copy];

    id v9 = v19;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v9;
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v21)
  {
    BOOL v30 = 1;
    goto LABEL_25;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v34;
  unint64_t v24 = (unint64_t)&v12[v14 - 1];
  while (2)
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v34 != v23) {
        objc_enumerationMutation(v20);
      }
      id v26 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v27 = (char *)[v26 unsignedIntegerValue];
      if (v27 < v12 || (unint64_t)v27 > v24)
      {
        v31 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_10007ECB0();
        }
        goto LABEL_24;
      }
      id v29 = [v11 objectForKeyedSubscript:v26];

      if (v29)
      {
        v31 = DMFConfigurationEngineLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_10007ED78();
        }
LABEL_24:

        BOOL v30 = 0;
        goto LABEL_25;
      }
      [v11 setObject:v10 forKeyedSubscript:v26];
    }
    id v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    BOOL v30 = 1;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_25:

  return v30;
}

- (BOOL)_registerPredicateObserver
{
  v3 = [(DMDActivationBudgetObserver *)self usageBudget];
  id v4 = [v3 identifier];

  v5 = [(DMDActivationBudgetObserver *)self usageMonitor];
  v6 = [(DMDActivationBudgetObserver *)self usageBudget];
  id v26 = v6;
  id v7 = +[NSArray arrayWithObjects:&v26 count:1];
  objc_super v8 = [(DMDActivationBudgetObserver *)self notificationTimes];
  id v17 = 0;
  unsigned __int8 v9 = [v5 startMonitoringBudgets:v7 darwinNotificationName:@"com.apple.dmd.budget.didChange" notificationTimes:v8 error:&v17];
  id v10 = v17;

  id v11 = DMFConfigurationEngineLog();
  uint64_t v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    uint64_t v13 = [(DMDActivationPredicateObserver *)self predicateType];
    uint64_t v14 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    uint64_t v16 = [v10 debugDescription];
    *(_DWORD *)buf = 138544130;
    id v19 = v13;
    __int16 v20 = 2114;
    id v21 = v14;
    __int16 v22 = 2114;
    uint64_t v23 = v4;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Predicate type: %{public}@ with unique identifier: %{public}@ failed starting usage monitor with budget identifier: %{public}@, error: %{public}@", buf, 0x2Au);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(DMDActivationPredicateObserver *)self predicateType];
    uint64_t v14 = [(DMDActivationPredicateObserver *)self uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    id v19 = v13;
    __int16 v20 = 2114;
    id v21 = v14;
    __int16 v22 = 2114;
    uint64_t v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ succeeded starting usage monitor with budget identifier: %{public}@", buf, 0x20u);
LABEL_4:
  }
LABEL_6:

  return v9;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSSet)notificationTimes
{
  return self->_notificationTimes;
}

- (void)setNotificationTimes:(id)a3
{
}

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(id)a3
{
}

- (NSMutableArray)expiredNotificationTimes
{
  return self->_expiredNotificationTimes;
}

- (void)setExpiredNotificationTimes:(id)a3
{
}

- (USBudget)usageBudget
{
  return self->_usageBudget;
}

- (void)setUsageBudget:(id)a3
{
}

- (USUsageMonitor)usageMonitor
{
  return self->_usageMonitor;
}

- (void)setUsageMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageMonitor, 0);
  objc_storeStrong((id *)&self->_usageBudget, 0);
  objc_storeStrong((id *)&self->_expiredNotificationTimes, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_notificationTimes, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end