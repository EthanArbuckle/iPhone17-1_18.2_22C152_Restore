@interface MOUserData
+ ($E278B6834D55977C8D8083A775B4AB36)event;
+ (id)BOOLeanKeys;
+ (id)bucketedKeys;
+ (id)integerKeys;
+ (id)supportedMetricKeys;
- (BOOL)submitMetricsWithError:(id *)a3;
- (MOEventManager)eventManager;
- (MOUserData)initWithEventManager:(id)a3;
- (MOUserData)initWithLoggingEnabled:(BOOL)a3;
- (NSNumber)age;
- (NSNumber)gender;
- (NSNumber)stateIHA;
- (OS_dispatch_queue)queue;
- (void)_fetchUserDataWithCompletionHandler:(id)a3;
- (void)setAge:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setGender:(id)a3;
- (void)setStateIHA:(id)a3;
- (void)setValues;
- (void)submitUserDataWithCompletionHandler:(id)a3;
@end

@implementation MOUserData

- (MOUserData)initWithEventManager:(id)a3
{
  id v5 = a3;
  v6 = [(MOUserData *)self initWithLoggingEnabled:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventManager, a3);
    stateIHA = v7->_stateIHA;
    v7->_stateIHA = (NSNumber *)&__kCFBooleanFalse;

    age = v7->_age;
    v7->_age = (NSNumber *)&off_1002F5648;

    gender = v7->_gender;
    v7->_gender = (NSNumber *)&off_1002F5648;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.momentsd.MOUserData", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (MOUserData)initWithLoggingEnabled:(BOOL)a3
{
  v38.receiver = self;
  v38.super_class = (Class)MOUserData;
  v3 = [(MOMetric *)&v38 initWithLoggingEnabled:a3];
  if (v3)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v4 = [(id)objc_opt_class() BOOLeanKeys];
    id v5 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v35;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v8);
          v10 = [(MOMetric *)v3 metrics];
          [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v6);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v11 = [(id)objc_opt_class() integerKeys];
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v15);
          v17 = [(MOMetric *)v3 metrics];
          [v17 setObject:&off_1002F5648 forKeyedSubscript:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v13);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = [objc_opt_class() bucketedKeys];
    id v19 = [v18 countByEnumeratingWithState:&v26 objects:v39 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v22);
          v24 = [(MOMetric *)v3 metrics];
          [v24 setObject:&off_1002F5648 forKeyedSubscript:v23];

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v26 objects:v39 count:16];
      }
      while (v20);
    }
  }
  return v3;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:@"IHA_state", 0];
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:@"age", 0];
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:@"ageBucketed", @"gender", 0];
}

+ (id)supportedMetricKeys
{
  v2 = [(id)objc_opt_class() integerKeys];
  v3 = +[NSMutableSet setWithSet:v2];

  v4 = [(id)objc_opt_class() BOOLeanKeys];
  id v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  id v6 = [(id)objc_opt_class() bucketedKeys];
  uint64_t v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  return v3;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)MOAnalyticsEventDemographics;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  [(MOUserData *)self setValues];
  v6.receiver = self;
  v6.super_class = (Class)MOUserData;
  return [(MOMetric *)&v6 submitMetricsWithError:a3];
}

- (void)submitUserDataWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOUserData submitUserDataWithCompletionHandler:]();
    }

    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOUserData.m" lineNumber:92 description:@"Invalid parameter not satisfying: completion (in %s:%d)", "-[MOUserData submitUserDataWithCompletionHandler:]", 92];
  }
  v8 = [(MOUserData *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke;
  block[3] = &unk_1002CCDC0;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

void __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1002CCD98;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _fetchUserDataWithCompletionHandler:v2];
}

void __50__MOUserData_submitUserDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setValues];
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Submitting age/biologicalSex to CoreAnalytics gated by IHA.", buf, 2u);
  }

  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)MOUserData;
  id v11 = 0;
  [super submitMetricsWithError:&v11];
  id v9 = v11;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchUserDataWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOUserData _fetchUserDataWithCompletionHandler:]();
    }

    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOUserData.m" lineNumber:107 description:@"Invalid parameter not satisfying: completion (in %s:%d)", "-[MOUserData _fetchUserDataWithCompletionHandler:]", 107];
  }
  if (self->_eventManager
    && objc_opt_class()
    && (+[MCProfileConnection sharedConnection],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isHealthDataSubmissionAllowed],
        v8,
        v9))
  {
    objc_super v10 = [(MOUserData *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke;
    block[3] = &unk_1002CCDC0;
    block[4] = self;
    id v14 = v5;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no IHA permission", buf, 2u);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStateIHA:&__kCFBooleanTrue];
  v2 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex for CoreAnalytics, with IHA permission.", buf, 2u);
  }

  *(void *)buf = 0;
  v61 = buf;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__16;
  v64 = __Block_byref_object_dispose__16;
  id v65 = 0;
  uint64_t v57 = 0;
  v58[0] = &v57;
  v58[1] = 0x3032000000;
  v58[2] = __Block_byref_object_copy__16;
  v58[3] = __Block_byref_object_dispose__16;
  id v59 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [*(id *)(a1 + 32) eventManager];
  id v5 = [v4 getHealthKitManager];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_115;
  v53[3] = &unk_1002CCDE8;
  id v6 = v3;
  v54 = v6;
  v55 = buf;
  v56 = &v57;
  [v5 fetchUserBiologicalSexWithHandler:v53];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOUserData.m", 128, "-[MOUserData _fetchUserDataWithCompletionHandler:]_block_invoke_2");
  id v52 = 0;
  BOOL v8 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v6, &v52, v7);
  id v9 = v52;
  id v10 = v52;
  if (!v8)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  if (*(void *)(v58[0] + 40))
  {
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5((uint64_t)v58, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  if (v10)
  {
    id v19 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_4();
    }

    objc_storeStrong((id *)(v58[0] + 40), v9);
  }
  id v20 = (void *)*((void *)v61 + 5);
  if (v20)
  {
    uint64_t v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 biologicalSex]);
    [*(id *)(a1 + 32) setGender:v21];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__16;
  v50 = __Block_byref_object_dispose__16;
  id v51 = 0;
  uint64_t v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = __Block_byref_object_copy__16;
  v44[3] = __Block_byref_object_dispose__16;
  id v45 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_126;
  v39[3] = &unk_1002CCE10;
  v22 = dispatch_semaphore_create(0);
  v40 = v22;
  v41 = &v46;
  v42 = &v43;
  [v5 fetchUserAgeWithHandler:v39];
  uint64_t v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Analytics/MOUserData.m", 157, "-[MOUserData _fetchUserDataWithCompletionHandler:]_block_invoke_2");
  id v38 = 0;
  BOOL v24 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v22, &v38, v23);
  id v25 = v38;
  id v26 = v38;
  if (!v24)
  {
    long long v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  if (*(void *)(v44[0] + 40))
  {
    long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2((uint64_t)v44, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  if (v26)
  {
    long long v35 = _mo_log_facility_get_os_log(&MOLogFacilityUserData);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(v44[0] + 40), v25);
  }
  long long v36 = (void *)v47[5];
  if (v36)
  {
    id v37 = [v36 copy];
    [*(id *)(a1 + 32) setAge:v37];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_115(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_126(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setValues
{
  stateIHA = self->_stateIHA;
  v4 = [(MOMetric *)self metrics];
  [v4 setObject:stateIHA forKeyedSubscript:@"IHA_state"];

  age = self->_age;
  uint64_t v6 = [(MOMetric *)self metrics];
  [v6 setObject:age forKeyedSubscript:@"age"];

  id v7 = [(MOMetric *)self metrics];
  id v8 = [v7 objectForKeyedSubscript:@"age"];
  id v9 = +[MOMetric binForNumber:v8 bins:&off_1002F8EB8];
  id v10 = [(MOMetric *)self metrics];
  [v10 setObject:v9 forKeyedSubscript:@"ageBucketed"];

  gender = self->_gender;
  id v12 = [(MOMetric *)self metrics];
  [v12 setObject:gender forKeyedSubscript:@"gender"];
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)gender
{
  return self->_gender;
}

- (void)setGender:(id)a3
{
}

- (NSNumber)stateIHA
{
  return self->_stateIHA;
}

- (void)setStateIHA:(id)a3
{
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_stateIHA, 0);
  objc_storeStrong((id *)&self->_gender, 0);

  objc_storeStrong((id *)&self->_age, 0);
}

- (void)submitUserDataWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 92;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v1, 0x12u);
}

- (void)_fetchUserDataWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 107;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v1, 0x12u);
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching age from health kit, %@", v2, v3, v4, v5, v6);
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Semaphore wait failed with context: %@", v2, v3, v4, v5, v6);
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching gender from health kit, %@", v2, v3, v4, v5, v6);
}

void __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end