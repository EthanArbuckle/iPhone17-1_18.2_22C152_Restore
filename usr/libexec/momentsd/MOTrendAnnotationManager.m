@interface MOTrendAnnotationManager
- (MOTrendAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MOTrendAnnotationManager

- (MOTrendAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MOTrendAnnotationManager;
  v6 = [(MOTrendAnnotationManager *)&v27 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MOTrendAnnotationManager", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_universe, a3);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = [v5 getService:v11];
    configurationManager = v6->_configurationManager;
    v6->_configurationManager = (MOConfigurationManager *)v12;

    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Constructing trend bundlers", buf, 2u);
    }

    v15 = objc_opt_new();
    v16 = objc_opt_new();
    v17 = objc_opt_new();
    v18 = objc_opt_new();
    [v16 setPredicate:v17];
    [v16 setAnnotator:v18];
    [v16 setTrendDetectorName:@"workoutTypeDurationTrendRoutine"];
    [v15 addObject:v16];
    v19 = objc_opt_new();
    v20 = objc_opt_new();
    [v19 setPredicate:v20];
    [v19 setAnnotator:v18];
    CFStringRef v30 = @"maximumFeatureCountForFrequencyTrend";
    LODWORD(v21) = 8.0;
    [(MOConfigurationManagerBase *)v6->_configurationManager getFloatSettingForKey:@"kMOTrendAnnotationManagerBundlingFilterMaximumFeatureCountForFrequencyTrend" withFallback:v21];
    v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v31 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v19 configure:v23];

    [v19 setTrendDetectorName:@"contactTypeDurationTrend"];
    [v15 addObject:v19];
    objc_storeStrong((id *)&v6->_bundlers, v15);
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = [v15 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Done constructing trend bundlers [%i constructed]", buf, 8u);
    }
  }
  return v6;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if ([(NSArray *)self->_bundlers count])
  {
    v11 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_bundlers count]];
    if ([(NSArray *)self->_bundlers count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = +[NSNull null];
        [v11 addObject:v13];

        ++v12;
      }
      while (v12 < [(NSArray *)self->_bundlers count]);
    }
    size_t v14 = [(NSArray *)self->_bundlers count];
    v15 = [(MOTrendAnnotationManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __82__MOTrendAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
    block[3] = &unk_1002C95F0;
    block[4] = self;
    block[5] = v9;
    block[6] = v8;
    id v16 = v11;
    id v29 = v16;
    dispatch_apply(v14, v15, block);

    v17 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v22);
          if (v23 && objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v22), "count", (void)v24)) {
            [v17 addObjectsFromArray:v23];
          }
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v20);
    }

    v10[2](v10, v17, 0);
  }
}

void __82__MOTrendAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a2];
  v4 = [v5 processPatternEvents:*(void *)(a1 + 40) withEvents:*(void *)(a1 + 48)];
  if (v4) {
    [*(id *)(a1 + 56) setObject:v4 atIndexedSubscript:a2];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_bundlers, 0);

  objc_storeStrong((id *)&self->_universe, 0);
}

@end