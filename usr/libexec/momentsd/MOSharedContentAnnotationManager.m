@interface MOSharedContentAnnotationManager
- (MOSharedContentAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)annotateBaseEvents:(id)a3;
- (id)getBaseEvents:(id)a3;
- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4;
- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4;
@end

@implementation MOSharedContentAnnotationManager

- (MOSharedContentAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v14.receiver = self;
  v14.super_class = (Class)MOSharedContentAnnotationManager;
  v6 = [(MOSharedContentAnnotationManager *)&v14 init];
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

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 9];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOSharedContentAnnotationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2;
  v3[3] = &unk_1002CA140;
  id v4 = *(id *)(a1 + 48);
  [v1 _performAnnotationWithEvents:v2 handler:v3];
}

uint64_t __72__MOSharedContentAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(MOSharedContentAnnotationManager *)self getBaseEvents:a3];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:](v7);
  }

  if ([v7 count])
  {
    id v9 = [(MOSharedContentAnnotationManager *)self annotateBaseEvents:v7];
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11) {
        -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:](v9);
      }
    }
    else if (v11)
    {
      -[MOSharedContentAnnotationManager _performAnnotationWithEvents:handler:](v10);
    }

    v6[2](v6, v9, 0);
  }
  else
  {
    v6[2](v6, &__NSArray0__struct, 0);
  }
}

- (id)annotateBaseEvents:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v41 = (id)objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v38 = v3;
    id obj = v3;
    id v43 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (!v43) {
      goto LABEL_21;
    }
    uint64_t v42 = *(void *)v46;
    while (1)
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v6 = [v5 itemURL];
        id v7 = [v6 absoluteString];

        if (([v7 hasPrefix:@"https://apple.news"] & 1) != 0
          || ([v7 hasPrefix:@"https://music.apple.com"] & 1) != 0
          || ([v7 hasPrefix:@"https://tv.apple.com"] & 1) != 0
          || ([v7 hasPrefix:@"https://podcasts.apple.com"] & 1) != 0)
        {
          goto LABEL_13;
        }
        id v8 = [v5 itemAttributionsCount];
        if ((int)[(MOEventBundle *)v8 intValue] >= 2)
        {
          id v9 = [v5 itemShareDirection];

          if (v9 != (id)1) {
            goto LABEL_19;
          }
LABEL_13:
          v44 = v7;
          id v10 = [MOEventBundle alloc];
          BOOL v11 = +[NSUUID UUID];
          id v12 = +[NSDate date];
          id v8 = [(MOEventBundle *)v10 initWithBundleIdentifier:v11 creationDate:v12];

          [(MOEventBundle *)v8 setInterfaceType:6];
          id v13 = objc_opt_new();
          [v13 addObject:v5];
          [(MOEventBundle *)v8 setEvents:v13];
          objc_super v14 = [[MOAction alloc] initWithActionName:@"Items shared and received today" actionType:1 actionSubtype:3];
          [(MOEventBundle *)v8 setAction:v14];

          v15 = [v5 eventIdentifier];
          v16 = [(MOEventBundle *)v8 action];
          [v16 setSourceEventIdentifier:v15];

          v17 = objc_opt_new();
          v57[0] = @"sharedContentURL";
          v18 = [v5 itemURL];
          v19 = [v18 absoluteString];
          v57[1] = @"sharedContentStartDate";
          v58[0] = v19;
          v20 = [v5 startDate];
          [v20 timeIntervalSinceReferenceDate];
          v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v58[1] = v21;
          v22 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];

          v23 = [[MOResource alloc] initWithName:@"Shared Content" type:4 dict:v22 value:0.0];
          v24 = [v5 eventIdentifier];
          [(MOResource *)v23 setSourceEventIdentifier:v24];

          [v17 addObject:v23];
          id v25 = [v17 copy];
          [(MOEventBundle *)v8 setResources:v25];

          v26 = [v5 startDate];
          [(MOEventBundle *)v8 setStartDate:v26];

          v27 = [v5 startDate];
          v28 = [v27 dateByAddingTimeInterval:3600.0];
          [(MOEventBundle *)v8 setEndDate:v28];

          v29 = objc_opt_new();
          v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 itemShareDirection]);
          [v29 setObject:v30 forKey:@"ItemShareDirection"];

          v31 = [v5 itemAttributionsCount];

          if (v31)
          {
            v32 = [v5 itemAttributionsCount];
            [v29 setObject:v32 forKey:@"ItemAttributionsCount"];
          }
          [(MOEventBundle *)v8 setMetaDataForRank:v29];
          v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v5 identifierFromProvider];
            v34 = [(MOEventBundle *)v8 startDate];
            uint64_t v35 = [(MOEventBundle *)v8 endDate];
            *(_DWORD *)buf = 136315906;
            v50 = "-[MOSharedContentAnnotationManager annotateBaseEvents:]";
            __int16 v51 = 2112;
            v52 = v39;
            __int16 v53 = 2112;
            v54 = v34;
            __int16 v55 = 2112;
            uint64_t v56 = v35;
            v36 = (void *)v35;
            _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s, #swy: annotated share content bundle with identifierFromProvider, %@,startdata,%@,enddate,%@", buf, 0x2Au);
          }
          [v41 addObject:v8];

          id v7 = v44;
        }

LABEL_19:
      }
      id v43 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
      if (!v43)
      {
LABEL_21:

        id v3 = v38;
        goto LABEL_23;
      }
    }
  }
  id v41 = 0;
LABEL_23:

  return v41;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)_performAnnotationWithEvents:(os_log_t)log handler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#swy, no bundle is created", v1, 2u);
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#swy, Bundles count, %lu", v3, v4, v5, v6, 0);
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:.cold.3(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_11((void *)&_mh_execute_header, v1, v2, "#swy, Base Events, %lu", v3, v4, v5, v6, 0);
}

@end