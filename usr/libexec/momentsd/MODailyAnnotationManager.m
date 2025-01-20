@interface MODailyAnnotationManager
- (MODailyAnnotationManager)initWithUniverse:(id)a3;
- (MODefaultsManager)defaultsManager;
- (OS_dispatch_queue)queue;
- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4;
- (id)getBaseEvents:(id)a3;
- (id)groupedEvents:(id)a3 keyFunc:(id)a4;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MODailyAnnotationManager

- (MODailyAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v14.receiver = self;
  v14.super_class = (Class)MODailyAnnotationManager;
  v6 = [(MOAnnotationManager *)&v14 initWithUniverse:v5];
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(MODailyAnnotationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __82__MODailyAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
  v15[3] = &unk_1002C9A78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

id __82__MODailyAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnnotationWithEvents:*(void *)(a1 + 40) withPatternEvents:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  v7 = (void (**)(id, id, void))a5;
  id v8 = [(MODailyAnnotationManager *)self getBaseEvents:a3];
  id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v20 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "DailyAnnotation: Base Events, %lu", buf, 0xCu);
  }

  if ([v8 count])
  {
    id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v18 = v10;
    dispatch_queue_t v11 = +[NSArray arrayWithObjects:&v18 count:1];
    uint64_t v12 = [v8 sortedArrayUsingDescriptors:v11];

    id v13 = [(MODailyAnnotationManager *)self groupedEvents:v12 keyFunc:&__block_literal_global_32];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2;
    v16[3] = &unk_1002CFB88;
    v16[4] = self;
    id v17 = (id)objc_opt_new();
    id v14 = v17;
    [v13 enumerateKeysAndObjectsUsingBlock:v16];
    id v15 = [v14 copy];
    v7[2](v7, v15, 0);

    id v8 = (void *)v12;
  }
  else
  {
    v7[2](v7, &__NSArray0__struct, 0);
  }
}

id __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke(id a1, MOEvent *a2)
{
  v2 = [(MOEvent *)a2 endDate];
  v3 = [v2 startOfDayWithBoundaryOfADay:10800.0];

  return v3;
}

void __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 duration:86400.0];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 startDate];
    id v10 = [v7 endDate];
    *(_DWORD *)buf = 138412802;
    v28 = v9;
    __int16 v29 = 2112;
    v30 = v10;
    __int16 v31 = 2048;
    id v32 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "DailyAnnotation: Date, %@ - %@, Events, %lu", buf, 0x20u);
  }
  dispatch_queue_t v11 = [*(id *)(a1 + 32) annotateBaseEvents:v6 dateInterval:v7];
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "DailyAnnotation: Bundle, %@", buf, 0xCu);
    }
  }
  else
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2_cold_1(v13);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = v6;
    id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      id v20 = v6;
      id v21 = v5;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "DailyAnnotation: Event, %@", buf, 0xCu);
          }
        }
        id v15 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
      id v6 = v20;
      id v5 = v21;
      dispatch_queue_t v11 = 0;
    }
  }
}

- (id)groupedEvents:(id)a3 keyFunc:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v14 = v6[2](v6, v13);
        id v15 = [v7 objectForKey:v14];
        if (!v15) {
          id v15 = objc_opt_new();
        }
        [v15 addObject:v13];
        [v7 setObject:v15 forKey:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = [v7 copy];

  return v16;
}

- (id)getBaseEvents:(id)a3
{
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MODailyAnnotationManager getBaseEvents:]();
  }

  id v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"MODailyAnnotationManager.m" lineNumber:126 description:@"Use the derived class (in %s:%d)", @"-[MODailyAnnotationManager getBaseEvents:]", 126];

  return 0;
}

- (id)annotateBaseEvents:(id)a3 dateInterval:(id)a4
{
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MODailyAnnotationManager annotateBaseEvents:dateInterval:]();
  }

  id v7 = +[NSAssertionHandler currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"MODailyAnnotationManager.m" lineNumber:132 description:@"Use the derived class (in %s:%d)", "-[MODailyAnnotationManager annotateBaseEvents:dateInterval:]", 132];

  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

void __83__MODailyAnnotationManager__performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DailyAnnotation: no bundle is created", v1, 2u);
}

- (void)getBaseEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 126;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Use the derived class (in %s:%d)", v1, 0x12u);
}

- (void)annotateBaseEvents:dateInterval:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 132;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Use the derived class (in %s:%d)", v1, 0x12u);
}

@end