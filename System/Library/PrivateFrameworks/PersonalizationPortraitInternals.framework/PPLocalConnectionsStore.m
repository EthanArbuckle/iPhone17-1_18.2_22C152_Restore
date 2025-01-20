@interface PPLocalConnectionsStore
+ (id)defaultStore;
- (PPLocalConnectionsStore)init;
- (PPLocalConnectionsStore)initWithPredictionStore:(id)a3 donationStore:(id)a4;
- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4;
- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8;
- (void)processFeedback:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPLocalConnectionsStore

- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v9 = [(PPConnectionsPredictionStore *)self->_predictionStore recentLocationsForConsumer:a3 criteria:a4 limit:a5 explanationSet:a6 timeout:a7 error:a8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = *MEMORY[0x1E4F8A0F0];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 originatingBundleID];
        int v17 = [v16 isEqualToString:v13];

        if (v17)
        {
          identifierToSourceBundleMap = self->_identifierToSourceBundleMap;
          v19 = [v15 originatingBundleID];
          v20 = [v15 identifier];
          [(NSCache *)identifierToSourceBundleMap setObject:v19 forKey:v20];

          nameToIdentifierMap = self->_nameToIdentifierMap;
          v22 = [v15 identifier];
          v23 = [v15 name];
          [(NSCache *)nameToIdentifierMap setObject:v22 forKey:v23];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
  return v9;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_14858);
  if (!defaultStore_instance_14859)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_14859;
    defaultStore_instance_14859 = v2;

    if (!defaultStore_instance_14859)
    {
      v4 = pp_connections_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalConnectionsStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }
    }
  }
  id v5 = (id)defaultStore_instance_14859;
  pthread_mutex_unlock(&defaultStore_lock_14858);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameToIdentifierMap, 0);
  objc_storeStrong((id *)&self->_identifierToSourceBundleMap, 0);
  objc_storeStrong((id *)&self->_donationStore, 0);
  objc_storeStrong((id *)&self->_predictionStore, 0);
}

- (void)processFeedback:(id)a3
{
  id v8 = a3;
  v3 = [v8 feedbackItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    +[PPFeedbackStorage logFeedback:v8 domain:5 domainStatus:2 inBackground:1];
    id v5 = [v8 feedbackItems];
    v6 = [v8 clientBundleId];
    v7 = [v8 clientIdentifier];
    +[PPFeedbackUtils recordUserEventsFromFeedback:v8 matchingFeedbackItems:v5 clientBundleId:v6 clientIdentifier:v7 domain:5];
  }
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35 = (void (**)(id, uint64_t, void))a4;
  v7 = pp_connections_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v47 = 138739971;
    id v48 = v6;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPConnections: registerFeedback: %{sensitive}@", v47, 0xCu);
  }

  id v8 = v6;
  if (self)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v34 = v8;
    id obj = [v8 feedbackItems];
    uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (!v9) {
      goto LABEL_39;
    }
    uint64_t v10 = *(void *)v38;
    uint64_t v11 = *MEMORY[0x1E4F8A0F0];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        nameToIdentifierMap = self->_nameToIdentifierMap;
        v15 = [v13 itemString];
        v16 = [(NSCache *)nameToIdentifierMap objectForKey:v15];

        if (v16
          || ([v13 itemString],
              long long v26 = objc_claimAutoreleasedReturnValue(),
              BOOL v27 = [v26 length] == 36,
              v26,
              v27)
          && ([v13 itemString], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          int v17 = [(NSCache *)self->_identifierToSourceBundleMap objectForKey:v16];
          int v18 = [v17 hasPrefix:v11];

          if (!v18) {
            goto LABEL_37;
          }
          uint64_t v41 = 0;
          v42 = &v41;
          uint64_t v43 = 0x2050000000;
          v19 = (void *)getAFAnalyticsClass_softClass;
          uint64_t v44 = getAFAnalyticsClass_softClass;
          if (!getAFAnalyticsClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v50 = __getAFAnalyticsClass_block_invoke;
            v51 = &unk_1E65DC058;
            v52 = &v41;
            __getAFAnalyticsClass_block_invoke((uint64_t)&buf);
            v19 = (void *)v42[3];
          }
          id v20 = v19;
          _Block_object_dispose(&v41, 8);
          v21 = [v20 sharedAnalytics];
          if (v21)
          {
            v45 = @"identifier";
            v46 = v16;
            v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            v23 = pp_connections_log_handle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: reporting %@ DisplayedInMaps to Siri", (uint8_t *)&buf, 0xCu);
            }

            [v21 logEventWithType:6201 context:v22];
            int v24 = [v13 itemFeedbackType];
            if ((v24 - 3) < 3)
            {
              long long v28 = pp_connections_log_handle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: %@ was rejected or offered", (uint8_t *)&buf, 0xCu);
              }
            }
            else if ((v24 - 1) >= 2)
            {
              if (!v24)
              {
                v29 = pp_default_log_handle();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v30 = [v34 clientIdentifier];
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v30;
                  _os_log_fault_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_FAULT, "PPConnections: registerFeedback: received feedback of unknown type from %@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
            else
            {
              long long v25 = pp_connections_log_handle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: reporting %@ SelectedInMaps to Siri", (uint8_t *)&buf, 0xCu);
              }

              [v21 logEventWithType:6202 context:v22];
            }
          }
          else
          {
            v22 = pp_default_log_handle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, "PPConnections: registerFeedback: failed to soft link AFAnalytics", (uint8_t *)&buf, 2u);
            }
          }
        }
        else
        {
          v21 = pp_default_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: skipping immediate processing of feedback due to lack of identifier.", (uint8_t *)&buf, 2u);
          }
          v16 = 0;
        }

LABEL_37:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (!v9)
      {
LABEL_39:

        id v8 = v34;
        break;
      }
    }
  }
  v31 = v8;

  v32 = objc_opt_new();
  v33 = +[PPInternalFeedback fromBaseFeedback:v31 storeType:2];
  [v32 storePendingFeedback:v33 storeType:6 error:0];

  if (v35) {
    v35[2](v35, 1, 0);
  }
}

- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4
{
  return [(PPConnectionsDonationStore *)self->_donationStore recentLocationDonationsSinceDate:a3 error:a4];
}

- (PPLocalConnectionsStore)init
{
  v3 = +[PPConnectionsPredictionStore defaultStore];
  uint64_t v4 = +[PPConnectionsDonationStore defaultStore];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = pp_connections_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalConnectionsStore -init failed to get prediction or donation store.", v10, 2u);
    }

    id v8 = 0;
  }
  else
  {
    self = [(PPLocalConnectionsStore *)self initWithPredictionStore:v3 donationStore:v4];
    id v8 = self;
  }

  return v8;
}

- (PPLocalConnectionsStore)initWithPredictionStore:(id)a3 donationStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPLocalConnectionsStore;
  uint64_t v9 = [(PPLocalConnectionsStore *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictionStore, a3);
    objc_storeStrong((id *)&v10->_donationStore, a4);
    uint64_t v11 = objc_opt_new();
    identifierToSourceBundleMap = v10->_identifierToSourceBundleMap;
    v10->_identifierToSourceBundleMap = (NSCache *)v11;

    [(NSCache *)v10->_identifierToSourceBundleMap setCountLimit:3];
    uint64_t v13 = objc_opt_new();
    nameToIdentifierMap = v10->_nameToIdentifierMap;
    v10->_nameToIdentifierMap = (NSCache *)v13;

    [(NSCache *)v10->_nameToIdentifierMap setCountLimit:3];
  }

  return v10;
}

@end