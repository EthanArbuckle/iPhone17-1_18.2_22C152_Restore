@interface MOTopicManager
+ (id)endOfDayBefore:(id)a3;
+ (id)startOfDayBefore:(id)a3;
- (MOEventStore)momentStore;
- (MOTopicManager)initWithTopicStore:(id)a3 momentStore:(id)a4;
- (MOTopicManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (PPTopicStore)topicStore;
- (id)createEventFromTopicQuery:(id)a3;
- (id)rehydratedScoredTopicsEvent:(id)a3;
- (id)rehydratedScoredTopicsEvents:(id)a3;
- (void)fetchAndSaveScoredTopicsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5;
- (void)waitForQueueEmpty;
@end

@implementation MOTopicManager

- (MOTopicManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PPTopicStore);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 getService:v7];

  v9 = [(MOTopicManager *)self initWithTopicStore:v5 momentStore:v8];
  return v9;
}

- (MOTopicManager)initWithTopicStore:(id)a3 momentStore:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOTopicManager initWithTopicStore:momentStore:](v15);
    }

    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MOTopicManager.m" lineNumber:55 description:@"Invalid parameter not satisfying: momentStore"];

    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v18.receiver = self;
  v18.super_class = (Class)MOTopicManager;
  v10 = [(MOTopicManager *)&v18 init];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MOTopicManager", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_topicStore, a3);
    objc_storeStrong((id *)&v10->_momentStore, a4);
  }
  self = v10;
  v14 = self;
LABEL_10:

  return v14;
}

+ (id)startOfDayBefore:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCalendar currentCalendar];
  id v5 = [objc_alloc((Class)NSDate) initWithTimeInterval:v3 sinceDate:-86400.0];

  v6 = [v4 startOfDayForDate:v5];

  return v6;
}

+ (id)endOfDayBefore:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSDate);
  id v5 = +[NSCalendar currentCalendar];
  v6 = [v5 startOfDayForDate:v3];

  id v7 = [v4 initWithTimeInterval:v6 sinceDate:-1.0];

  return v7;
}

- (id)createEventFromTopicQuery:(id)a3
{
  id v3 = a3;
  id v4 = [MOEvent alloc];
  id v5 = +[NSUUID UUID];
  v6 = [v3 fromDate];
  id v7 = [v3 toDate];
  id v8 = +[NSDate date];
  id v9 = [(MOEvent *)v4 initWithEventIdentifier:v5 startDate:v6 endDate:v7 creationDate:v8 provider:3 category:7];

  v10 = [v3 toDate];

  v11 = [v10 dateByAddingTimeInterval:2419200.0];
  [(MOEvent *)v9 setExpirationDate:v11];

  return v9;
}

- (void)fetchAndSaveScoredTopicsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MOTopicManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke;
  v15[3] = &unk_1002C9A78;
  id v16 = v8;
  id v17 = v9;
  objc_super v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fetchAndSaveScoredTopicsBetweenStartDate:%@ EndDate:%@", buf, 0x16u);
  }

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v5 = [*(id *)(a1 + 48) momentStore];
  v6 = *(void **)(a1 + 32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_113;
  v28[3] = &unk_1002C9A00;
  id v29 = v6;
  id v30 = *(id *)(a1 + 40);
  v31 = &v32;
  [v5 fetchEventsWithStartDateAfter:v29 Category:7 CompletionHandler:v28];

  if (*((unsigned char *)v33 + 24))
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Previous browsed topic MOEvent with matching dates found, skipping fetch.", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, &__NSDictionary0__struct);
    }
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No previous browsed topic MOEvent with matching dates found, querying Portrait topics store now.", buf, 2u);
    }

    id v10 = objc_opt_new();
    [v10 setFromDate:*(void *)(a1 + 32)];
    [v10 setToDate:*(void *)(a1 + 40)];
    [v10 setScoringDate:*(void *)(a1 + 40)];
    [v10 setDecayRate:0.000001];
    [v10 setScoreWithBiases:0];
    v11 = +[NSSet setWithArray:kTopicSourceBundleIds];
    [v10 setMatchingSourceBundleIds:v11];

    id v12 = [*(id *)(a1 + 48) topicStore];
    id v27 = 0;
    id v13 = [v12 scoresForTopicMapping:@"moments-topics" query:v10 error:&v27];
    id v14 = v27;

    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v13 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Found %lu scored topics!", buf, 0xCu);
    }

    id v17 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_cold_1((uint64_t)v13, v17);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    id v39 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_117;
    v24[3] = &unk_1002C9A28;
    uint64_t v18 = *(void *)(a1 + 48);
    v26 = buf;
    v24[4] = v18;
    id v19 = v10;
    id v25 = v19;
    [v13 enumerateKeysAndObjectsUsingBlock:v24];
    v20 = [*(id *)(a1 + 48) momentStore];
    uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_119;
    v22[3] = &unk_1002C9A50;
    id v23 = *(id *)(a1 + 56);
    [v20 storeEvent:v21 CompletionHandler:v22];

    _Block_object_dispose(buf, 8);
  }

  _Block_object_dispose(&v32, 8);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_113(void *a1, void *a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 startDate:v12];
        if ([v9 isEqualToDate:a1[4]])
        {
          id v10 = [v8 endDate];
          unsigned int v11 = [v10 isEqualToDate:a1[5]];

          if (v11)
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
LABEL_12:
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_117(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  [a3 doubleValue];
  if (v6 >= 0.55)
  {
    uint64_t v7 = [*(id *)(a1 + 32) createEventFromTopicQuery:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found event above scoring threshold!", v11, 2u);
    }
  }
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_119_cold_1((uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saved browsed topics as event into database", v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (id)rehydratedScoredTopicsEvent:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "rehydratedScoredTopicsEvent:%@", buf, 0xCu);
  }

  id v6 = objc_opt_new();
  uint64_t v7 = [v4 startDate];
  [v6 setFromDate:v7];

  uint64_t v8 = [v4 endDate];
  [v6 setToDate:v8];

  uint64_t v9 = [v4 endDate];
  [v6 setScoringDate:v9];

  [v6 setDecayRate:0.000001];
  [v6 setScoreWithBiases:0];
  id v10 = objc_opt_new();
  unsigned int v11 = [(MOTopicManager *)self topicStore];
  id v21 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke;
  v19[3] = &unk_1002C9AA0;
  id v12 = v10;
  id v20 = v12;
  [v11 iterScoresForTopicMapping:@"moments-topics" query:v6 error:&v21 block:v19];
  id v13 = v21;

  if ([v12 count])
  {
    id v14 = [v4 copy];
    [v14 setScoredTopics:v12];
    long long v15 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "event enriched:%@", buf, 0xCu);
    }
  }
  else
  {
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "No topics scores higher than threshold is found, therefore deleting this event.", buf, 2u);
    }

    long long v15 = [(MOTopicManager *)self momentStore];
    id v22 = v4;
    id v17 = +[NSArray arrayWithObjects:&v22 count:1];
    [v15 removeEvents:v17 CompletionHandler:&__block_literal_global_1];

    id v14 = 0;
  }

  return v14;
}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [v5 doubleValue];
  if (v6 >= 0.55) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_124(id a1, NSError *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(&MOLogFacilityPortraitTopics);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_124_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deleting topic event in database succeeded!", v6, 2u);
  }
}

- (id)rehydratedScoredTopicsEvents:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __47__MOTopicManager_rehydratedScoredTopicsEvents___block_invoke;
  v5[3] = &unk_1002C9B08;
  v5[4] = self;
  id v3 = [a3 _pas_mappedArrayWithTransform:v5];

  return v3;
}

id __47__MOTopicManager_rehydratedScoredTopicsEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rehydratedScoredTopicsEvent:a2];
}

- (void)waitForQueueEmpty
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PPTopicStore)topicStore
{
  return self->_topicStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithTopicStore:(os_log_t)log momentStore:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: momentStore", v1, 2u);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Scored topics: %@", (uint8_t *)&v2, 0xCu);
}

void __75__MOTopicManager_fetchAndSaveScoredTopicsBetweenStartDate_EndDate_handler___block_invoke_119_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Saving browsed topics as event into database failed, error %@", (uint8_t *)&v2, 0xCu);
}

void __46__MOTopicManager_rehydratedScoredTopicsEvent___block_invoke_124_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Deleting topic event in database failed, error %@", (uint8_t *)&v2, 0xCu);
}

@end