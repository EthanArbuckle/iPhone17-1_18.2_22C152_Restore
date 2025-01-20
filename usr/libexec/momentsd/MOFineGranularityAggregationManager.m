@interface MOFineGranularityAggregationManager
- (MOFineGranularityAggregationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (void)aggregateBundles:(id)a3 withParameters:(id)a4 handler:(id)a5;
@end

@implementation MOFineGranularityAggregationManager

- (MOFineGranularityAggregationManager)initWithUniverse:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MOFineGranularityAggregationManager;
  v3 = [(MOAggregationManager *)&v11 initWithUniverse:a3];
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    v6 = (const char *)[v5 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 count] == 0;
  v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation: No eventBundle to be proccessed", (uint8_t *)&buf, 2u);
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    if (v13)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation: input eventBundles count, %lu", (uint8_t *)&buf, 0xCu);
    }

    v14 = objc_opt_new();
    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__15;
    v56 = __Block_byref_object_dispose__15;
    id v57 = 0;
    v16 = [MOTimeContextAggregationManager alloc];
    v17 = [(MOAggregationManager *)self fUniverse];
    v30 = [(MOAggregationManager *)v16 initWithUniverse:v17];

    v18 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LODWORD(v48) = 134217984;
      *(void *)((char *)&v48 + 4) = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FineGranularityAggregation: Time context input eventBundles count, %lu", (uint8_t *)&v48, 0xCu);
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke;
    v45[3] = &unk_1002C9D68;
    p_long long buf = &buf;
    v19 = v15;
    v46 = v19;
    [(MOTimeContextAggregationManager *)v30 aggregateBundles:v8 withParameters:v9 granularity:1 handler:v45];
    dispatch_group_enter(v19);
    *(void *)&long long v48 = 0;
    *((void *)&v48 + 1) = &v48;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__15;
    v51 = __Block_byref_object_dispose__15;
    id v52 = 0;
    v20 = [MOMediaAggregationManager alloc];
    v21 = [(MOAggregationManager *)self fUniverse];
    v22 = [(MOAggregationManager *)v20 initWithUniverse:v21];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_94;
    v42[3] = &unk_1002C9D68;
    v44 = &v48;
    v23 = v19;
    v43 = v23;
    [(MOMediaAggregationManager *)v22 aggregateBundles:v8 withParameters:v9 granularity:1 handler:v42];
    dispatch_group_enter(v23);
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__15;
    v40[4] = __Block_byref_object_dispose__15;
    id v41 = 0;
    v24 = [MOContactAggregationManager alloc];
    v25 = [(MOAggregationManager *)self fUniverse];
    v26 = [(MOContactAggregationManager *)v24 initWithUniverse:v25];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_96;
    v37[3] = &unk_1002C9D68;
    v39 = v40;
    v27 = v23;
    v38 = v27;
    [(MOContactAggregationManager *)v26 aggregateBundles:v8 withParameters:v9 granularity:1 handler:v37];
    v28 = [(MOFineGranularityAggregationManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_97;
    block[3] = &unk_1002C9D90;
    v34 = &buf;
    id v32 = v14;
    v35 = &v48;
    v36 = v40;
    id v33 = v10;
    id v29 = v14;
    dispatch_group_notify(v27, v28, block);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&buf, 8);
  }
}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "FineGranularityAggregation for time context: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "FineGranularityAggregation: output media eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "FineGranularityAggregation for contact: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__MOFineGranularityAggregationManager_aggregateBundles_withParameters_handler___block_invoke_97(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end