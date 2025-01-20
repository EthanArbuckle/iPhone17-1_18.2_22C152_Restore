@interface TICoreAnalyticsEventController
+ (void)registerScheduledEventsActivity;
- (TICoreAnalyticsEventController)init;
- (id)adjustValue:(id)a3 forFieldSpec:(id)a4;
- (id)adjustValues:(id)a3 forFieldSpec:(id)a4;
- (void)dispatchEventWithDescriptor:(id)a3 andSpec:(id)a4 withProvider:(id)a5 andContext:(id)a6 andMetrics:(id)a7 completionHandler:(id)a8;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 eventSpec:(id)a6 completionHandler:(id)a7;
- (void)dispatchEventsFromRegistry:(id)a3 withProvider:(id)a4 andContext:(id)a5 andMetrics:(id)a6 completionHandler:(id)a7;
- (void)dispatchScheduledEventsWithCompletionHandler:(id)a3;
- (void)queueScheduledEventsWithCompletionHandler:(id)a3;
@end

@implementation TICoreAnalyticsEventController

- (void).cxx_destruct
{
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 eventSpec:(id)a6 completionHandler:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = IXADefaultLogFacility();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [NSString stringWithFormat:@"%s Dispatching event: %@", "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]", v11];
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  v18 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v18 registerEventSpec:v13];

  v19 = [MEMORY[0x1E4FAE260] sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__TICoreAnalyticsEventController_dispatchEventWithName_payload_testingParameters_eventSpec_completionHandler___block_invoke;
  v22[3] = &unk_1E6E2BD98;
  id v23 = v11;
  id v24 = v12;
  id v20 = v12;
  id v21 = v11;
  [v19 dispatchEventWithName:v21 payload:v15 testingParameters:v14 allowSparsePayload:0 withCompletionHandler:v22];
}

uint64_t __110__TICoreAnalyticsEventController_dispatchEventWithName_payload_testingParameters_eventSpec_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 count];
  v4 = IXADefaultLogFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    v6 = [NSString stringWithFormat:@"%s Event dispatch failed: %@", "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]_block_invoke", *(void *)(a1 + 32)];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    v6 = [NSString stringWithFormat:@"%s Event dispatched: %@", "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]_block_invoke", *(void *)(a1 + 32)];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
  }
  _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

LABEL_7:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)adjustValue:(id)a3 forFieldSpec:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4FAE268] isNumber:v5]
    && [v6 isMemberOfClass:objc_opt_class()])
  {
    id v7 = v6;
    v8 = (void *)MEMORY[0x1E4FAE268];
    v9 = [v7 significantDigits];
    uint64_t v10 = [v8 roundNumber:v5 toSignificantDigits:v9];

    if ([v7 isInteger] && objc_msgSend(MEMORY[0x1E4FAE268], "isFloat:", v10))
    {
      id v11 = [MEMORY[0x1E4FAE268] toInteger:v10];
      [v11 doubleValue];
      double v13 = v12;
      [v10 doubleValue];
      if (v13 == v14)
      {
        id v11 = v11;

        uint64_t v10 = v11;
      }
    }
    else
    {
      if (([v7 isInteger] & 1) != 0
        || ![MEMORY[0x1E4FAE268] isInteger:v10])
      {
        goto LABEL_11;
      }
      [MEMORY[0x1E4FAE268] toFloat:v10];
      v10 = id v11 = v10;
    }

LABEL_11:
    id v5 = v10;
  }

  return v5;
}

- (id)adjustValues:(id)a3 forFieldSpec:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__TICoreAnalyticsEventController_adjustValues_forFieldSpec___block_invoke;
  v15[3] = &unk_1E6E2AB10;
  id v10 = v9;
  id v16 = v10;
  v17 = self;
  id v18 = v6;
  id v11 = v6;
  [v8 enumerateObjectsUsingBlock:v15];

  double v12 = v18;
  id v13 = v10;

  return v13;
}

void __60__TICoreAnalyticsEventController_adjustValues_forFieldSpec___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 40) adjustValue:a2 forFieldSpec:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

- (void)dispatchEventWithDescriptor:(id)a3 andSpec:(id)a4 withProvider:(id)a5 andContext:(id)a6 andMetrics:(id)a7 completionHandler:(id)a8
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(void))a8;
  v62 = objc_opt_new();
  v75 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v17 = [v12 fieldDescriptors];
  id v66 = v13;
  uint64_t v70 = [v17 countByEnumeratingWithState:&v84 objects:v90 count:16];
  id v60 = v12;
  id v61 = v15;
  v68 = v14;
  v59 = v16;
  if (v70)
  {
    obuint64_t j = v17;
    int v18 = 0;
    char v19 = 0;
    uint64_t v67 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v85 != v67) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        v22 = [v21 inactiveValue];
        BOOL v73 = v22 != 0;

        id v23 = [v21 fieldName];
        uint64_t v71 = [v13 fieldSpecWithName:v23];
        id v24 = [v21 metricType];
        int v25 = [v24 isEqualToString:@"bucketedWordLength"];

        v26 = [v21 metricName];
        if (v25)
        {
          uint64_t v27 = [v68 valuesByBucketedWordLengthForMetricWithName:v26 withContext:v15];

          v28 = [v21 inactiveValue];

          if (v28)
          {
            v64 = v27;
            v65 = v23;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v29 = v27;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v80 objects:v89 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v81;
              do
              {
                for (uint64_t j = 0; j != v31; ++j)
                {
                  if (*(void *)v81 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  v34 = *(void **)(*((void *)&v80 + 1) + 8 * j);
                  v35 = [v21 inactiveValue];
                  LODWORD(v34) = [v34 isEqual:v35];

                  v18 |= v34 ^ 1;
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v80 objects:v89 count:16];
              }
              while (v31);
            }

            id v23 = v65;
            id v13 = v66;
            id v15 = v61;
            uint64_t v27 = v64;
          }
          v36 = (void *)v71;
          v37 = [(TICoreAnalyticsEventController *)self adjustValues:v27 forFieldSpec:v71];
          [v75 setObject:v37 forKey:v23];
          BOOL v38 = v73;
        }
        else
        {
          v39 = v23;
          uint64_t v27 = [v68 valueForMetricWithName:v26 withContext:v15];

          v40 = [v21 inactiveValue];
          if (v40)
          {
            v41 = [v21 inactiveValue];
            int v42 = [v27 isEqual:v41] ^ 1;
          }
          else
          {
            int v42 = 0;
          }
          BOOL v38 = v73;

          v18 |= v42;
          v36 = (void *)v71;
          v37 = [(TICoreAnalyticsEventController *)self adjustValue:v27 forFieldSpec:v71];
          id v23 = v39;
          [v62 setObject:v37 forKey:v39];
          id v13 = v66;
        }
        v19 |= v38;
      }
      uint64_t v70 = [obj countByEnumeratingWithState:&v84 objects:v90 count:16];
    }
    while (v70);

    char v43 = v18 | ~v19;
    v44 = v59;
    id v12 = v60;
    v45 = v68;
    if ((v43 & 1) == 0)
    {
      if (v59) {
        v59[2](v59);
      }
      goto LABEL_46;
    }
  }
  else
  {
  }
  if ([v12 includeTestingParameters])
  {
    v74 = [v15 testingParameters];
  }
  else
  {
    v74 = 0;
  }
  v46 = [v12 eventName];
  if ([v75 count])
  {
    uint64_t v72 = *MEMORY[0x1E4FAEFF8];
    if (*MEMORY[0x1E4FAEFF8])
    {
      uint64_t v47 = 0;
      do
      {
        v48 = v46;
        v49 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v62];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v50 = [v75 allKeys];
        uint64_t v51 = [v50 countByEnumeratingWithState:&v76 objects:v88 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v52; ++k)
            {
              if (*(void *)v77 != v53) {
                objc_enumerationMutation(v50);
              }
              uint64_t v55 = *(void *)(*((void *)&v76 + 1) + 8 * k);
              v56 = [v75 objectForKey:v55];
              v57 = [v56 objectAtIndexedSubscript:v47];
              [v49 setObject:v57 forKey:v55];
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v76 objects:v88 count:16];
          }
          while (v52);
        }

        v46 = v48;
        id v13 = v66;
        [(TICoreAnalyticsEventController *)self dispatchEventWithName:v48 payload:v49 testingParameters:v74 eventSpec:v66 completionHandler:0];

        ++v47;
      }
      while (v47 != v72);
    }
  }
  else
  {
    [(TICoreAnalyticsEventController *)self dispatchEventWithName:v46 payload:v62 testingParameters:v74 eventSpec:v13 completionHandler:0];
  }
  v44 = v59;
  if (v59)
  {
    v58 = [MEMORY[0x1E4FAE260] sharedInstance];
    [v58 queueCompletionHandler:v59];
  }
  id v12 = v60;
  id v15 = v61;
  v45 = v68;
LABEL_46:
}

- (void)dispatchEventsFromRegistry:(id)a3 withProvider:(id)a4 andContext:(id)a5 andMetrics:(id)a6 completionHandler:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v28 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  v17 = v12;
  if (v12 && v14)
  {
    id v26 = v15;
    [v12 allEventDescriptors];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v23 = [v22 eventName];
          id v24 = [v17 eventSpecWithName:v23];

          [(TICoreAnalyticsEventController *)self dispatchEventWithDescriptor:v22 andSpec:v24 withProvider:v28 andContext:v13 andMetrics:v14 completionHandler:0];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }
    id v16 = v26;
    if (v26)
    {
      int v25 = [MEMORY[0x1E4FAE260] sharedInstance];
      [v25 queueCompletionHandler:v26];
    }
  }
  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

- (void)dispatchScheduledEventsWithCompletionHandler:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  id v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Dispatching scheduled events.", "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = v6;
    _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(TIPreferencesAnalyzer);
  [(TIPreferencesAnalyzer *)v7 analyzeRegisteredPreferences];
  id v8 = +[TIEventDescriptorRegistry registry];
  v9 = +[TIMetricDescriptorRegistry registry];
  id v10 = [MEMORY[0x1E4FAE4F0] sharedUserModelDataStore];
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v13 = [v12 BOOLForKey:@"ignoreLastMigrationDate"];
  v36 = v12;
  int v35 = [v12 BOOLForKey:@"typingSessionNotificationsEnabled"];
  if ([v10 isValid])
  {
    uint64_t v34 = [v10 transientLastMigrationDate];
    id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v11 sinceDate:-((double)(int)*MEMORY[0x1E4FAEFE8] * (double)(unint64_t)*MEMORY[0x1E4FAEF78])];
    id v15 = v14;
    if ((v13 & 1) == 0 && [v14 compare:v34] == -1)
    {
      id v28 = IXADefaultLogFacility();
      int v25 = 1;
      obuint64_t j = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduled events cannot be dispatched because insufficient data has been collected since last database migration.", "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = v29;
        _os_log_impl(&dword_1E3F0E000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    else
    {
      long long v32 = v7;
      v33 = v4;
      long long v31 = v15;
      [v10 getAllKnownInputModesSinceDate:v15];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v40)
      {
        uint64_t v38 = *(void *)v49;
        v39 = v10;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v49 != v38) {
              objc_enumerationMutation(obj);
            }
            v17 = v11;
            uint64_t v18 = +[TIKBUserModel userModelWithInputMode:*(void *)(*((void *)&v48 + 1) + 8 * i) userModelDataStore:v10 metricDescriptorRegistry:v9 fromDate:v11];
            uint64_t v19 = [v18 kbContexts];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v45 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  [(TICoreAnalyticsEventController *)self dispatchEventsFromRegistry:v8 withProvider:v18 andContext:*(void *)(*((void *)&v44 + 1) + 8 * j) andMetrics:v9 completionHandler:0];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v21);
            }

            id v10 = v39;
            id v11 = v17;
          }
          uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v40);
      }
      id v24 = [MEMORY[0x1E4FAE260] sharedInstance];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __79__TICoreAnalyticsEventController_dispatchScheduledEventsWithCompletionHandler___block_invoke;
      v41[3] = &unk_1E6E2AAE8;
      v4 = v33;
      int v42 = v33;
      char v43 = v35;
      [v24 queueCompletionHandler:v41];

      int v25 = 0;
      id v15 = v31;
      id v7 = v32;
    }
    id v26 = v34;
  }
  else
  {
    id v26 = IXADefaultLogFacility();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduled events cannot be dispatched because an error occurred while opening the database.", "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = v30;
      _os_log_error_impl(&dword_1E3F0E000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    int v25 = 1;
  }

  if (v4 && v25)
  {
    if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
    }
    if (TI_IS_INTERNAL_INSTALL::is_internal_install && v35)
    {
      uint64_t v27 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v27 postNotificationName:@"com.apple.keyboard.inputAnalytics.scheduledEventsDidComplete" object:0 userInfo:0 deliverImmediately:1];
    }
    v4[2](v4);
  }
}

void __79__TICoreAnalyticsEventController_dispatchScheduledEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = IXADefaultLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduled events dispatched.", "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]_block_invoke");
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
    }
    if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        v4 = [MEMORY[0x1E4F28C40] defaultCenter];
        [v4 postNotificationName:@"com.apple.keyboard.inputAnalytics.scheduledEventsDidComplete" object:0 userInfo:0 deliverImmediately:1];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)queueScheduledEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __76__TICoreAnalyticsEventController_queueScheduledEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchScheduledEventsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (TICoreAnalyticsEventController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TICoreAnalyticsEventController;
  v2 = [(TICoreAnalyticsEventController *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.keyboard.analytics.scheduledEventsWorkerQueue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (void)registerScheduledEventsActivity
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = IXADefaultLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [NSString stringWithFormat:@"%s Preparing for %@ activity", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]", kScheduledEventsActivity];
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  dispatch_queue_t v4 = (const char *)[(id)kScheduledEventsActivity UTF8String];
  xpc_activity_register(v4, (xpc_object_t)*MEMORY[0x1E4F14158], &__block_literal_global_6073);
}

void __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    BOOL v16 = 0;
    BOOL v16 = xpc_activity_set_state(v2, 4);
    uint64_t v7 = IXADefaultLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [NSString stringWithFormat:@"%s Running activity %@, extended=%d", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity, *(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
      *(_DWORD *)id v12 = 138412290;
      char v13 = v8;
      _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_INFO, "%@", v12, 0xCu);
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.keyboard.analytics.scheduledEventsQueue", v9);

    id v11 = v2;
    TIDispatchAsync();

    _Block_object_dispose(&buf, 8);
  }
  else if (!state)
  {
    dispatch_queue_t v4 = IXADefaultLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [NSString stringWithFormat:@"%s Checking in activity %@", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);
    }
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F14170], *MEMORY[0x1E4F141D8]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14340], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_activity_set_criteria(v2, v6);
  }
}

void __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_54(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    v2 = IXADefaultLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [NSString stringWithFormat:@"%s xpc activity should be defered, defering %@", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = v3;
      _os_log_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v5 = (void *)MEMORY[0x1E4E7C3D0]();
    xpc_object_t v6 = objc_opt_new();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_59;
    uint64_t v15 = &unk_1E6E2DE00;
    v2 = v4;
    BOOL v16 = v2;
    [v6 queueScheduledEventsWithCompletionHandler:&v12];

    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v2, v7))
    {
      id v8 = IXADefaultLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduled sync task timed out", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke_2");
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v9;
        _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      dispatch_queue_t v10 = IXADefaultLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [NSString stringWithFormat:@"%s Done running activity %@, extended=%d", "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v12, v13, v14, v15];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v11;
        _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
  }
}

intptr_t __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_59(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end