@interface PPConnectionsPredictionStore
+ (id)defaultStore;
- (PPConnectionsPredictionStore)init;
- (PPConnectionsPredictionStore)initWithParameters:(id)a3 pasteboardSource:(id)a4 calendarSource:(id)a5 duetSource:(id)a6 namedEntitySource:(id)a7 fiaSource:(id)a8 metricsTracker:(id)a9;
- (id)cutoffNamedEntityTime;
- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8;
- (void)_asyncFillLocationData:(NSObject *)a3 group:(void *)a4 source:(uint64_t)a5 consumer:(void *)a6 criteria:(void *)a7 earliestDate:(void *)a8 latestDate:(uint64_t)a9 limit:(void *)a10 explanationSet:;
@end

@implementation PPConnectionsPredictionStore

void __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = pp_connections_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3[1] count];
    int v13 = 134217984;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: %tu items total.", (uint8_t *)&v13, 0xCu);
  }

  [v3[1] sortUsingComparator:&__block_literal_global_8803];
  if (a1[5] == 2) {
    [v3[1] sortUsingComparator:&__block_literal_global_27];
  }
  id v6 = v3[1];
  unint64_t v7 = a1[6];
  unint64_t v8 = [v6 count];
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);
  uint64_t v11 = *(void *)(a1[4] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = pp_connections_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = pp_connections_signpost_handle();
  uint64_t v5 = v4;
  unint64_t v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    unint64_t v7 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);
  }
  unint64_t v8 = [*(id *)(a1 + 32) locationItemsWithCriteria:*(void *)(a1 + 40) earliest:*(void *)(a1 + 48) latest:*(void *)(a1 + 56) limit:*(void *)(a1 + 80) consumer:*(void *)(a1 + 88) explanationSet:*(void *)(a1 + 64)];
  unint64_t v9 = pp_connections_log_handle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) identifier];
      uint64_t v12 = [v8 count];
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: %@: %tu items", buf, 0x16u);
    }
    int v13 = *(void **)(a1 + 72);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke_19;
    v23[3] = &unk_1E65D6BA0;
    v24 = v8;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 88);
    id v25 = v14;
    uint64_t v26 = v15;
    [v13 runWithLockAcquired:v23];
    v16 = pp_connections_signpost_handle();
    v17 = v16;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v18 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v17, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);
    }
    v19 = v24;
  }
  else
  {
    if (v10)
    {
      v20 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: %@: returned nil", buf, 0xCu);
    }
    v21 = pp_connections_signpost_handle();
    v19 = v21;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v22 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);
    }
  }
}

- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  context = (void *)MEMORY[0x1CB79D060]();
  uint64_t v15 = pp_connections_log_handle();
  double v16 = (double)a7 / 1000000000.0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v47 = a5;
    LOWORD(v48) = 2048;
    *(double *)((char *)&v48 + 2) = (double)a7 / 1000000000.0;
    _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: c:%tu cr:%@ l:%tu t:%f", buf, 0x2Au);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F93B70]);
  v18 = objc_opt_new();
  v19 = (void *)[v17 initWithGuardedData:v18];

  v20 = dispatch_group_create();
  duetSource = self->_duetSource;
  v22 = (void *)MEMORY[0x1E4F1C9C8];
  [(PPConnectionsParameters *)self->_parameters userActivityExpirySeconds];
  v24 = [v22 dateWithTimeIntervalSinceNow:-v23];
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, duetSource, a3, v13, v24, 0, a5, v14);

  calendarSource = self->_calendarSource;
  uint64_t v26 = (void *)MEMORY[0x1E4F1C9C8];
  [(PPConnectionsParameters *)self->_parameters calendarEventLocationLookaheadTimeSeconds];
  v27 = objc_msgSend(v26, "dateWithTimeIntervalSinceNow:");
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, calendarSource, a3, v13, 0, v27, a5, v14);

  namedEntitySource = self->_namedEntitySource;
  __int16 v29 = -[PPConnectionsPredictionStore cutoffNamedEntityTime]((id *)&self->super.isa);
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, namedEntitySource, a3, v13, v29, 0, a5, v14);

  fiaSource = self->_fiaSource;
  uint64_t v31 = -[PPConnectionsPredictionStore cutoffNamedEntityTime]((id *)&self->super.isa);
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, fiaSource, a3, v13, v31, 0, a5, v14);

  pasteboardSource = self->_pasteboardSource;
  v33 = (void *)MEMORY[0x1E4F1C9C8];
  [(PPConnectionsParameters *)self->_parameters pasteboardItemExpirySeconds];
  v35 = [v33 dateWithTimeIntervalSinceNow:-v34];
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, pasteboardSource, a3, v13, v35, 0, a5, v14);

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v47 = (unint64_t)__Block_byref_object_copy__8792;
  *(void *)&long long v48 = __Block_byref_object_dispose__8793;
  *((void *)&v48 + 1) = 0;
  if ([MEMORY[0x1E4F93B18] waitForGroup:v20 timeoutSeconds:v16] == 1)
  {
    v36 = pp_connections_log_handle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore recentLocationsForConsumer timed out before all sources responded.", v44, 2u);
    }
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke;
  v43[3] = &unk_1E65D6BF0;
  v43[4] = buf;
  v43[5] = a3;
  v43[6] = a5;
  [v19 runWithLockAcquired:v43];
  v37 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_30);
  v38 = objc_msgSend(v37, "_pas_componentsJoinedByString:", @", ");

  v39 = pp_connections_log_handle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v44 = 138412290;
    v45 = v38;
    _os_log_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: returning items from: %@", v44, 0xCu);
  }

  id v40 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v40;
}

- (void)_asyncFillLocationData:(NSObject *)a3 group:(void *)a4 source:(uint64_t)a5 consumer:(void *)a6 criteria:(void *)a7 earliestDate:(void *)a8 latestDate:(uint64_t)a9 limit:(void *)a10 explanationSet:
{
  id v17 = a2;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  if (a1)
  {
    double v23 = *(NSObject **)(a1 + 64);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke;
    v24[3] = &unk_1E65D6BC8;
    id v25 = v18;
    id v26 = v19;
    id v27 = v20;
    id v28 = v21;
    uint64_t v31 = a9;
    uint64_t v32 = a5;
    id v29 = v22;
    id v30 = v17;
    dispatch_group_async(a3, v23, v24);
  }
}

- (id)cutoffNamedEntityTime
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F1C9C8];
    [a1[1] namedEntitySourceLookBackSeconds];
    a1 = [v2 dateWithTimeIntervalSinceNow:-v3];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    uint64_t v34 = *MEMORY[0x1E4F8A0A0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        unint64_t v9 = [v8 originatingBundleID];
        BOOL v10 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
        int v11 = [v10 containsObject:v9];

        if (v11)
        {
          uint64_t v12 = pp_connections_log_handle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [*(id *)(a1 + 40) identifier];
            *(_DWORD *)buf = 138412290;
            v41 = v13;
            id v14 = v12;
            uint64_t v15 = "PPConnectionsPredictionStore: rejecting location from %@ due to user settings.";
            goto LABEL_14;
          }
          goto LABEL_18;
        }
        uint64_t v16 = *(void *)(a1 + 48);
        if (v16 == 4 || v16 == 2)
        {
          id v17 = [v8 originatingBundleID];
          int v18 = [v17 isEqualToString:v34];

          if (v18)
          {
            uint64_t v12 = pp_connections_log_handle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [*(id *)(a1 + 40) identifier];
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              id v14 = v12;
              uint64_t v15 = "PPConnectionsPredictionStore: rejecting location from %@ since its from Maps and Maps is the consumer.";
LABEL_14:
              _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
            }
LABEL_18:

            goto LABEL_19;
          }
        }
        uint64_t v19 = [v8 value];
        if (v19)
        {
          id v20 = (void *)v19;
          id v21 = (void *)v3[2];
          id v22 = [v8 value];
          LOBYTE(v21) = [v21 containsObject:v22];

          if ((v21 & 1) == 0)
          {
            id v27 = v3;
            uint64_t v32 = pp_connections_log_handle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [*(id *)(a1 + 40) identifier];
              *(_DWORD *)buf = 138412290;
              v41 = v30;
              uint64_t v31 = "PPConnectionsPredictionStore: using location from %@";
              goto LABEL_30;
            }
LABEL_31:

            double v3 = v27;
            [(id)v27[1] addObject:v8];
            goto LABEL_32;
          }
        }
        uint64_t v12 = [v8 value];
        if (v12) {
          goto LABEL_18;
        }
        uint64_t v23 = [v8 mapItemURL];
        if (v23)
        {
          v24 = (void *)v23;
          id v25 = (void *)v3[2];
          id v26 = [v8 mapItemURL];
          [v26 absoluteString];
          v28 = id v27 = v3;
          LOBYTE(v25) = [v25 containsObject:v28];

          double v3 = v27;
          if ((v25 & 1) == 0)
          {
            uint64_t v32 = pp_connections_log_handle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [*(id *)(a1 + 40) identifier];
              *(_DWORD *)buf = 138412290;
              v41 = v30;
              uint64_t v31 = "PPConnectionsPredictionStore: using location with mapItemURL from %@";
LABEL_30:
              _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
            }
            goto LABEL_31;
          }
        }
LABEL_19:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v29 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      uint64_t v5 = v29;
    }
    while (v29);
  }
LABEL_32:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_metricsTracker, 0);
  objc_storeStrong((id *)&self->_fiaSource, 0);
  objc_storeStrong((id *)&self->_namedEntitySource, 0);
  objc_storeStrong((id *)&self->_duetSource, 0);
  objc_storeStrong((id *)&self->_calendarSource, 0);
  objc_storeStrong((id *)&self->_pasteboardSource, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 source];
}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 source];
  if ([v6 isEqualToString:@"foundinapps"])
  {
    uint64_t v7 = [v5 source];
    char v8 = [v7 isEqualToString:@"namedentity"];

    if (v8)
    {
      uint64_t v9 = -1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  BOOL v10 = [v5 source];
  if ([v10 isEqualToString:@"foundinapps"])
  {
    int v11 = [v4 source];
    unsigned int v12 = [v11 isEqualToString:@"namedentity"];

    uint64_t v9 = v12;
  }
  else
  {

    uint64_t v9 = 0;
  }
LABEL_8:

  return v9;
}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 source];
  char v6 = [v5 isEqualToString:@"pasteboard"];

  if (v6)
  {
    uint64_t v7 = -1;
  }
  else
  {
    char v8 = [v4 source];
    unsigned int v9 = [v8 isEqualToString:@"pasteboard"];

    uint64_t v7 = v9;
  }

  return v7;
}

- (PPConnectionsPredictionStore)initWithParameters:(id)a3 pasteboardSource:(id)a4 calendarSource:(id)a5 duetSource:(id)a6 namedEntitySource:(id)a7 fiaSource:(id)a8 metricsTracker:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v16 = a8;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PPConnectionsPredictionStore;
  int v18 = [(PPConnectionsPredictionStore *)&v28 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_parameters, a3);
    objc_storeStrong((id *)&v19->_pasteboardSource, a4);
    objc_storeStrong((id *)&v19->_calendarSource, a5);
    objc_storeStrong((id *)&v19->_duetSource, a6);
    objc_storeStrong((id *)&v19->_namedEntitySource, a7);
    objc_storeStrong((id *)&v19->_fiaSource, a8);
    objc_storeStrong((id *)&v19->_metricsTracker, a9);
    uint64_t v20 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPConnectionsPredictionStore.prediction" qosClass:25];
    predictionQueue = v19->_predictionQueue;
    v19->_predictionQueue = (OS_dispatch_queue *)v20;
  }
  return v19;
}

- (PPConnectionsPredictionStore)init
{
  double v3 = +[PPConnectionsParameters sharedInstance];
  id v4 = +[PPConnectionsPasteboardSource sharedInstance];
  id v5 = +[PPConnectionsCalendarSource sharedInstance];
  char v6 = +[PPConnectionsDuetSource sharedInstance];
  uint64_t v7 = +[PPConnectionsNamedEntitySource sharedInstance];
  char v8 = +[PPConnectionsFoundInAppsSource sharedInstance];
  uint64_t v9 = +[PPConnectionsMetricsTracker sharedInstance];
  BOOL v10 = (void *)v9;
  int v11 = 0;
  if (v3 && v4 && v5 && v6 && v7 && v8 && v9)
  {
    self = [(PPConnectionsPredictionStore *)self initWithParameters:v3 pasteboardSource:v4 calendarSource:v5 duetSource:v6 namedEntitySource:v7 fiaSource:v8 metricsTracker:v9];
    int v11 = self;
  }

  return v11;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock_8836);
  if (!defaultStore_instance_8837)
  {
    uint64_t v2 = objc_opt_new();
    double v3 = (void *)defaultStore_instance_8837;
    defaultStore_instance_8837 = v2;

    if (!defaultStore_instance_8837)
    {
      id v4 = pp_connections_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPConnectionsPredictionStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }
    }
  }
  id v5 = (id)defaultStore_instance_8837;
  pthread_mutex_unlock(&defaultStore_lock_8836);
  return v5;
}

@end