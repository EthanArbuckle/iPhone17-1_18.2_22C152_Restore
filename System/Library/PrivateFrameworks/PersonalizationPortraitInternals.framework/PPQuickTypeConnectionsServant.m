@interface PPQuickTypeConnectionsServant
- (PPQuickTypeConnectionsServant)init;
- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5;
@end

@implementation PPQuickTypeConnectionsServant

- (void).cxx_destruct
{
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[PPSettings sharedInstance];
  char v11 = [v10 isAppConnectionsLocationsEnabled];

  if (v11)
  {
    uint64_t v12 = +[PPConnectionsMetricsTracker consumerStringForConsumerType:1];
    uint64_t v13 = +[PPConnectionsMetricsTracker triggerFromCriteria:v8];
    v50 = self;
    metricsTracker = self->_metricsTracker;
    v15 = [v8 bundleIdentifier];
    v51 = (void *)v12;
    v53 = (void *)v13;
    [(PPConnectionsMetricsTracker *)metricsTracker trackOpportunityForConsumer:v12 trigger:v13 targetApp:v15];

    id v16 = v8;
    id v52 = v9;
    BOOL v17 = +[PPConnectionsUtils isValidLinguisticQuery:v16];
    v18 = +[PPConnectionsUtils supportedLocationSemanticTypes];
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v16, "semanticTag"));
    if ([v18 containsObject:v19]
      && +[PPConnectionsUtils isClientAuthorizedForSemanticTriggers:v16])
    {
    }
    else
    {

      if (!v17)
      {
        v26 = (void *)v12;
        if ([v16 semanticTag])
        {
          v27 = +[PPConnectionsUtils supportedLocationSemanticTypes];
          v28 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v16, "semanticTag"));
          char v29 = [v27 containsObject:v28];

          v30 = v52;
          if ((v29 & 1) == 0) {
            [v52 push:3];
          }
          if (!+[PPConnectionsUtils isClientAuthorizedForSemanticTriggers:](PPConnectionsUtils, "isClientAuthorizedForSemanticTriggers:", v16))[v52 push:4]; {
          v31 = 0;
          }
        }
        else
        {
          v31 = 0;
          v30 = v52;
        }
LABEL_35:

        v39 = objc_opt_new();
        if (v31)
        {
          v40 = [v31 label];
          v41 = [v31 value];
          objc_msgSend(v31, "setShouldAggregate:", +[PPConnectionsUtils shouldAggregateLabel:withValue:query:](PPConnectionsUtils, "shouldAggregateLabel:withValue:query:", v40, v41, v16));

          uint64_t v42 = [v31 quickTypeItem];
          if (!v42)
          {
            [v52 push:2];
            id v21 = 0;
            goto LABEL_40;
          }
          v43 = (void *)v42;
          [v39 addObject:v42];
          v44 = v50->_metricsTracker;
          v45 = [v31 source];
          v46 = [v31 originatingBundleID];
          v47 = [v16 bundleIdentifier];
          [(PPConnectionsMetricsTracker *)v44 trackConversionGoalForConsumer:v26 source:v45 trigger:v53 originatingApp:v46 targetApp:v47 converted:0];
        }
        id v21 = v39;
LABEL_40:

        goto LABEL_41;
      }
    }
    id v49 = v9;
    if (v17) {
      uint64_t v22 = 40000000;
    }
    else {
      uint64_t v22 = 90000000;
    }
    v23 = +[PPLocalConnectionsStore defaultStore];
    id v24 = v16;
    if ([v24 semanticTag])
    {
      uint64_t v25 = +[PPConnectionsUtils locationFieldFromSemanticTag:](PPConnectionsUtils, "locationFieldFromSemanticTag:", [v24 semanticTag]);
    }
    else if ([v24 type] == 3 {
           && ([v24 subtype] == 6 || objc_msgSend(v24, "subtype") == 7)
    }
           && ([v24 fields] & 4) != 0)
    {
      uint64_t v25 = 1;
    }
    else if ([v24 type] == 3 {
           && ([v24 subtype] == 6 || objc_msgSend(v24, "subtype") == 7))
    }
    {
      uint64_t v25 = ((int)([v24 fields] << 31) >> 31) & 0xA;
    }
    else
    {
      uint64_t v25 = 0;
    }
    id v32 = objc_alloc(MEMORY[0x1E4F89DB8]);
    v33 = [v24 bundleIdentifier];
    v34 = (void *)[v32 initWithLocationField:v25 bundleIdentifier:v33];

    v35 = +[PPConnectionsParameters sharedInstance];
    unint64_t v36 = [v35 quickTypePredictionLimit];

    if (v36 <= a4) {
      unint64_t v37 = a4;
    }
    else {
      unint64_t v37 = v36;
    }
    v30 = v52;
    v38 = [v23 recentLocationsForConsumer:1 criteria:v34 limit:v37 explanationSet:v52 timeout:v22 error:0];
    v31 = [v38 firstObject];

    v26 = v51;
    id v9 = v49;
    goto LABEL_35;
  }
  v20 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, "PPQuickTypeConnectionsServant: Ignoring prediction request because Found Locations in Other Apps settings is off", buf, 2u);
  }

  id v21 = 0;
LABEL_41:

  return v21;
}

- (PPQuickTypeConnectionsServant)init
{
  v9.receiver = self;
  v9.super_class = (Class)PPQuickTypeConnectionsServant;
  v2 = [(PPQuickTypeConnectionsServant *)&v9 init];
  if (v2)
  {
    v3 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeConnectionsServant initializing", v8, 2u);
    }

    uint64_t v4 = +[PPConnectionsMetricsTracker sharedInstance];
    metricsTracker = v2->_metricsTracker;
    v2->_metricsTracker = (PPConnectionsMetricsTracker *)v4;

    v6 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPQuickTypeConnectionsServant initialization complete", v8, 2u);
    }
  }
  return v2;
}

@end