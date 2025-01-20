@interface MOTimeContextAnnotationManager
- (MODefaultsManager)defaultsManager;
- (MOTimeContextAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (double)overlapsIndexOfBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)getBaseEvents:(id)a3;
- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5;
- (id)groupBaseEvents:(id)a3;
- (id)intervalsFromEvents:(id)a3 boundaryInterval:(id)a4;
- (id)timespanFromEvents:(id)a3 boundaryInterval:(id)a4;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
- (void)addPeopleDensityContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5;
- (void)addSocialContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5;
- (void)addTimeOverlapsScoreForEventBundle:(id)a3 baseEvents:(id)a4 contextEvents:(id)a5;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MOTimeContextAnnotationManager

- (MOTimeContextAnnotationManager)initWithUniverse:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MOTimeContextAnnotationManager;
  v3 = [(MOAnnotationManager *)&v11 initWithUniverse:a3];
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

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(MOTimeContextAnnotationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
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

void __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2;
  v4[3] = &unk_1002CA140;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _performAnnotationWithEvents:v2 withPatternEvents:v3 handler:v4];
}

uint64_t __88__MOTimeContextAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = a3;
  id v11 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v89 = v11;
  id v12 = +[NSArray arrayWithObjects:&v89 count:1];
  uint64_t v13 = [v10 sortedArrayUsingDescriptors:v12];

  v71 = (void *)v13;
  id v14 = [(MOTimeContextAnnotationManager *)self getBaseEvents:v13];
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  id v66 = v11;
  v70 = self;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    id v18 = [v14 count];
    [v14 firstObject];
    v20 = v19 = v9;
    v21 = [v20 startDate];
    [v14 lastObject];
    v23 = v22 = v14;
    v24 = [v23 endDate];
    *(_DWORD *)buf = 138413058;
    v82 = v17;
    __int16 v83 = 2048;
    id v84 = v18;
    __int16 v85 = 2112;
    id v86 = v21;
    __int16 v87 = 2112;
    v88 = v24;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TimeContext(%@): Base Events, %lu, startDate, %@, endDate, %@", buf, 0x2Au);

    id v14 = v22;
    self = v70;

    id v9 = v19;
    id v11 = v66;
  }
  if ([v14 count])
  {
    v65 = v9;
    v25 = [(MOTimeContextAnnotationManager *)self groupBaseEvents:v14];
    v26 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      id v29 = [v14 count];
      id v30 = [v25 count];
      *(_DWORD *)buf = 138412802;
      v82 = v28;
      __int16 v83 = 2048;
      id v84 = v29;
      __int16 v85 = 2048;
      id v86 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "TimeContext(%@): Grouping the base events, events, %lu, groups, %lu", buf, 0x20u);
    }
    v64 = v14;

    v68 = objc_opt_new();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v25;
    id v72 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v72)
    {
      uint64_t v69 = *(void *)v76;
      do
      {
        for (i = 0; i != v72; i = (char *)i + 1)
        {
          if (*(void *)v76 != v69) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          id v79 = v11;
          v33 = +[NSArray arrayWithObjects:&v79 count:1];
          v73 = v32;
          v34 = [v32 sortedArrayUsingDescriptors:v33];

          v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            id v38 = [v34 count];
            v39 = [v34 firstObject];
            v40 = [v39 startDate];
            [v34 lastObject];
            v42 = id v41 = v8;
            v43 = [v42 endDate];
            *(_DWORD *)buf = 138413058;
            v82 = v37;
            __int16 v83 = 2048;
            id v84 = v38;
            __int16 v85 = 2112;
            id v86 = v40;
            __int16 v87 = 2112;
            v88 = v43;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "TimeContext(%@): Base Events, %lu, first.date, %@, last.date, %@", buf, 0x2Au);

            self = v70;
            id v8 = v41;
            id v11 = v66;
          }
          v44 = [(MOTimeContextAnnotationManager *)self getContextEventsForBaseEvents:v34 events:v71 withPatternEvents:v8];
          v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = (objc_class *)objc_opt_class();
            v47 = NSStringFromClass(v46);
            id v48 = [v44 count];
            *(_DWORD *)buf = 138412546;
            v82 = v47;
            __int16 v83 = 2048;
            id v84 = v48;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "TimeContext(%@): Context Events, %lu", buf, 0x16u);
          }
          v49 = [(MOTimeContextAnnotationManager *)self annotateBaseEvents:v34 contextEvents:v44];
          v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v51 = (objc_class *)objc_opt_class();
            v52 = NSStringFromClass(v51);
            *(_DWORD *)buf = 138412546;
            v82 = v52;
            __int16 v83 = 2112;
            id v84 = v49;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "TimeContext(%@): EventBundle, %@", buf, 0x16u);
          }
          v53 = [(MOTimeContextAnnotationManager *)self buildPromptDescriptionForEventBundle:v49];
          [v49 setPromptLanguage:v53];

          v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            v57 = [v49 promptLanguage];
            v58 = [v57 mask];
            *(_DWORD *)buf = 138412546;
            v82 = v56;
            __int16 v83 = 2112;
            id v84 = v58;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "TimeContext(%@): Prompt Lang., %@", buf, 0x16u);

            self = v70;
          }

          [(MOTimeContextAnnotationManager *)self addTimeOverlapsScoreForEventBundle:v49 baseEvents:v73 contextEvents:v44];
          [(MOTimeContextAnnotationManager *)self addSocialContextForEventBundle:v49 sortedBaseEvents:v34 contextEvents:v44];
          [(MOTimeContextAnnotationManager *)self addPeopleDensityContextForEventBundle:v49 sortedBaseEvents:v34 contextEvents:v44];
          if (v49) {
            [v68 addObject:v49];
          }
        }
        id v72 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
      }
      while (v72);
    }

    v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v60 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v60);
      id v62 = [v68 count];
      *(_DWORD *)buf = 138412546;
      v82 = v61;
      __int16 v83 = 2048;
      id v84 = v62;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "TimeContext(%@): Event Bundles, %lu", buf, 0x16u);
    }
    id v63 = [v68 copy];
    id v9 = v65;
    v65[2](v65, v63, 0);

    id v14 = v64;
  }
  else
  {
    v9[2](v9, &__NSArray0__struct, 0);
  }
}

- (id)groupBaseEvents:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1, (void)v15);
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }

    id v11 = [v4 copy];
  }
  else
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      __int16 v23 = 2048;
      id v24 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TimeContext(%@): No grouping is applied, %lu", buf, 0x16u);
    }
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)getBaseEvents:(id)a3
{
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MOTimeContextAnnotationManager getBaseEvents:]();
  }

  id v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"MOTimeContextAnnotationManager.m" lineNumber:124 description:@"Use the derived class (in %s:%d)", "-[MOTimeContextAnnotationManager getBaseEvents:]", 124];

  return 0;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MOTimeContextAnnotationManager getContextEventsForBaseEvents:events:withPatternEvents:]();
  }

  uint64_t v8 = +[NSAssertionHandler currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"MOTimeContextAnnotationManager.m" lineNumber:130 description:@"Use the derived class (in %s:%d)", "-[MOTimeContextAnnotationManager getContextEventsForBaseEvents:events:withPatternEvents:]", 130];

  return 0;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MOTimeContextAnnotationManager annotateBaseEvents:contextEvents:]();
  }

  id v7 = +[NSAssertionHandler currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"MOTimeContextAnnotationManager.m" lineNumber:136 description:@"Use the derived class (in %s:%d)", "-[MOTimeContextAnnotationManager annotateBaseEvents:contextEvents:]", 136];

  return 0;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MOTimeContextAnnotationManager buildPromptDescriptionForEventBundle:]();
  }

  id v6 = +[NSAssertionHandler currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"MOTimeContextAnnotationManager.m" lineNumber:142 description:@"Use the derived class (in %s:%d)", "-[MOTimeContextAnnotationManager buildPromptDescriptionForEventBundle:]", 142];

  return 0;
}

- (void)addTimeOverlapsScoreForEventBundle:(id)a3 baseEvents:(id)a4 contextEvents:(id)a5
{
  id v8 = a3;
  [(MOTimeContextAnnotationManager *)self overlapsIndexOfBaseEvents:a4 contextEvents:a5];
  double v10 = v9;
  id v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    int v15 = 138412802;
    long long v16 = v13;
    __int16 v17 = 2048;
    double v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TimeContext(%@): overlaps score, %f, bundle, %@", (uint8_t *)&v15, 0x20u);
  }
  id v14 = +[NSNumber numberWithDouble:v10];
  [v8 addMetaDataForRankForKey:@"TimeCorrelationScore" value:v14];
}

- (double)overlapsIndexOfBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if ([v7 count])
    {
      id v8 = objc_alloc((Class)NSDateInterval);
      double v9 = [v6 firstObject];
      double v10 = [v9 startDate];
      id v11 = [v6 lastObject];
      id v12 = [v11 endDate];
      id v13 = [v8 initWithStartDate:v10 endDate:v12];

      id v14 = [(MOTimeContextAnnotationManager *)self timespanFromEvents:v6 boundaryInterval:0];
      v54 = v13;
      int v15 = [(MOTimeContextAnnotationManager *)self timespanFromEvents:v7 boundaryInterval:v13];
      uint64_t v16 = [v6 arrayByAddingObjectsFromArray:v7];
      v51 = [(MOTimeContextAnnotationManager *)self timespanFromEvents:v16 boundaryInterval:0];
      v56 = v14;
      __int16 v17 = [v14 objectEnumerator];
      v55 = v15;
      double v18 = [v15 objectEnumerator];
      __int16 v19 = [v17 nextObject];
      uint64_t v20 = [v18 nextObject];
      v21 = (void *)v20;
      double v22 = 0.0;
      v53 = (void *)v16;
      if (v19 && v20)
      {
        double v23 = 0.0;
        do
        {
          id v24 = [v19 intersectionWithDateInterval:v21];
          v25 = v24;
          if (v24)
          {
            [v24 duration];
            double v23 = v23 + v26;
          }
          v27 = [v19 endDate];
          v28 = [v21 endDate];
          unsigned int v29 = [v27 isBeforeDate:v28];

          if (v29)
          {
            uint64_t v30 = [v17 nextObject];
            v31 = v19;
            __int16 v19 = (void *)v30;
          }
          else
          {
            uint64_t v32 = [v18 nextObject];
            v31 = v21;
            v21 = (void *)v32;
          }
        }
        while (v19 && v21);
      }
      else
      {
        double v23 = 0.0;
      }
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v34 = v51;
      id v35 = [v34 countByEnumeratingWithState:&v57 objects:v81 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v58;
        double v22 = 0.0;
        do
        {
          id v38 = 0;
          do
          {
            if (*(void *)v58 != v37) {
              objc_enumerationMutation(v34);
            }
            [*(id *)(*((void *)&v57 + 1) + 8 * (void)v38) duration];
            double v22 = v22 + v39;
            id v38 = (char *)v38 + 1;
          }
          while (v36 != v38);
          id v36 = [v34 countByEnumeratingWithState:&v57 objects:v81 count:16];
        }
        while (v36);
      }

      if (v22 <= 0.0) {
        double v33 = 0.0;
      }
      else {
        double v33 = v23 / v22;
      }
      v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v42);
        id v48 = [v6 count];
        v50 = [v6 firstObject];
        v43 = [v50 startDate];
        v49 = [v6 lastObject];
        v44 = [v49 endDate];
        id v47 = [v7 count];
        id v46 = [v56 count];
        id v45 = [v55 count];
        *(_DWORD *)buf = 138414594;
        id v62 = v52;
        __int16 v63 = 2048;
        id v64 = v48;
        __int16 v65 = 2112;
        id v66 = v43;
        __int16 v67 = 2112;
        v68 = v44;
        __int16 v69 = 2048;
        id v70 = v47;
        __int16 v71 = 2048;
        id v72 = v46;
        __int16 v73 = 2048;
        id v74 = v45;
        __int16 v75 = 2048;
        double v76 = v23;
        __int16 v77 = 2048;
        double v78 = v22;
        __int16 v79 = 2048;
        double v80 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "TimeContext(%@): base events, %lu, startDate, %@, endDate, %@, context events, %lu, base events intervals, %lu, context events intervals, %lu, intersection, %f, total duration, %f, overlaps score, %f", buf, 0x66u);
      }
    }
    else
    {
      double v33 = 1.0;
    }
  }
  else
  {
    double v33 = -1.0;
  }

  return v33;
}

- (id)timespanFromEvents:(id)a3 boundaryInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v36 = v7;
    id v37 = v6;
    id v8 = [(MOTimeContextAnnotationManager *)self intervalsFromEvents:v6 boundaryInterval:v7];
    id v34 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
    v44 = v34;
    double v9 = +[NSArray arrayWithObjects:&v44 count:1];
    id v35 = v8;
    double v10 = [v8 sortedArrayUsingDescriptors:v9];

    id v38 = objc_opt_new();
    id v11 = [v10 firstObject];
    id v12 = [v11 startDate];

    id v13 = [v10 firstObject];
    id v14 = [v13 endDate];

    int v15 = [v12 dateByAddingTimeInterval:300.0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          double v22 = [v21 startDate];
          unsigned int v23 = [v22 isAfterDate:v15];

          if (v23)
          {
            if ([v12 isBeforeDate:v14])
            {
              id v24 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v12 endDate:v14];
              [v38 addObject:v24];
            }
            uint64_t v25 = [v21 startDate];

            id v12 = (void *)v25;
          }
          else
          {
            double v26 = [v21 endDate];
            unsigned int v27 = [v26 isAfterDate:v15];

            if (!v27) {
              continue;
            }
          }
          uint64_t v28 = [v21 endDate];

          unsigned int v29 = [v21 endDate];
          uint64_t v30 = [v29 dateByAddingTimeInterval:300.0];

          id v14 = (void *)v28;
          int v15 = (void *)v30;
        }
        id v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v18);
    }

    if (v12 && v14 && [v12 isBeforeDate:v14])
    {
      id v31 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v12 endDate:v14];
      [v38 addObject:v31];
    }
    id v32 = [v38 copy];

    id v7 = v36;
    id v6 = v37;
  }
  else
  {
    id v32 = &__NSArray0__struct;
  }

  return v32;
}

- (id)intervalsFromEvents:(id)a3 boundaryInterval:(id)a4
{
  id v7 = a3;
  id v56 = a4;
  v55 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v62;
    uint64_t v51 = *(void *)v62;
    id v52 = v8;
    do
    {
      uint64_t v12 = 0;
      id v53 = v10;
      do
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v54 = v12;
        id v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
        id v14 = [v13 startDate];

        if (!v14)
        {
          int v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v67 = v13;
            __int16 v68 = 2080;
            __int16 v69 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
            __int16 v70 = 1024;
            int v71 = 245;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Event.startDate is nil, event, %@ (in %s:%d)", buf, 0x1Cu);
          }

          id v16 = +[NSAssertionHandler currentHandler];
          [v16 handleFailureInMethod:a2, self, @"MOTimeContextAnnotationManager.m", 245, @"Event.startDate is nil, event, %@ (in %s:%d)", v13, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 245 object file lineNumber description];
        }
        id v17 = [v13 endDate];

        if (!v17)
        {
          id v18 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v67 = v13;
            __int16 v68 = 2080;
            __int16 v69 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
            __int16 v70 = 1024;
            int v71 = 246;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Event.endDate is nil, event, %@ (in %s:%d)", buf, 0x1Cu);
          }

          uint64_t v19 = +[NSAssertionHandler currentHandler];
          [v19 handleFailureInMethod:a2, self, @"MOTimeContextAnnotationManager.m", 246, @"Event.endDate is nil, event, %@ (in %s:%d)", v13, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 246 object file lineNumber description];
        }
        uint64_t v20 = [v13 startDate];
        if (v20)
        {
          v21 = (void *)v20;
          double v22 = [v13 endDate];

          if (v22)
          {
            if ([v13 category] == (id)6)
            {
              long long v59 = 0u;
              long long v60 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              unsigned int v23 = [v13 mediaPlaySessions];
              id v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v58;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(void *)v58 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    uint64_t v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                    unsigned int v29 = [v28 startDate];

                    if (!v29)
                    {
                      uint64_t v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        __int16 v67 = v28;
                        __int16 v68 = 2080;
                        __int16 v69 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
                        __int16 v70 = 1024;
                        int v71 = 252;
                        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "mediaPlaySession.startDate is nil, mediaPlaySession, %@ (in %s:%d)", buf, 0x1Cu);
                      }

                      id v31 = +[NSAssertionHandler currentHandler];
                      [v31 handleFailureInMethod:a2, self, @"MOTimeContextAnnotationManager.m", 252, @"mediaPlaySession.startDate is nil, mediaPlaySession, %@ (in %s:%d)", v28, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 252 object file lineNumber description];
                    }
                    id v32 = [v28 endDate];

                    if (!v32)
                    {
                      double v33 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412802;
                        __int16 v67 = v28;
                        __int16 v68 = 2080;
                        __int16 v69 = "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]";
                        __int16 v70 = 1024;
                        int v71 = 253;
                        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "mediaPlaySession.endDate is nil, mediaPlaySession, %@ (in %s:%d)", buf, 0x1Cu);
                      }

                      id v34 = +[NSAssertionHandler currentHandler];
                      [v34 handleFailureInMethod:a2, self, @"MOTimeContextAnnotationManager.m", 253, @"mediaPlaySession.endDate is nil, mediaPlaySession, %@ (in %s:%d)", v28, "-[MOTimeContextAnnotationManager intervalsFromEvents:boundaryInterval:]", 253 object file lineNumber description];
                    }
                    uint64_t v35 = [v28 startDate];
                    if (v35)
                    {
                      id v36 = (void *)v35;
                      id v37 = [v28 endDate];

                      if (v37)
                      {
                        id v38 = objc_alloc((Class)NSDateInterval);
                        long long v39 = [v28 startDate];
                        long long v40 = [v28 endDate];
                        id v41 = [v38 initWithStartDate:v39 endDate:v40];

                        if (!v56 || [v56 intersectsDateInterval:v41]) {
                          [v55 addObject:v41];
                        }
                      }
                    }
                  }
                  id v25 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
                }
                while (v25);
                id v8 = v52;
                id v10 = v53;
                uint64_t v11 = v51;
              }
            }
            else
            {
              long long v42 = [v13 startDate];
              v43 = [v13 endDate];
              unsigned int v44 = [v42 isBeforeDate:v43];

              if (v44)
              {
                id v45 = objc_alloc((Class)NSDateInterval);
                id v46 = [v13 startDate];
                id v47 = [v13 endDate];
                unsigned int v23 = [v45 initWithStartDate:v46 endDate:v47];

                [v55 addObject:v23];
              }
              else
              {
                unsigned int v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  id v48 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412546;
                  __int16 v67 = v48;
                  __int16 v68 = 2112;
                  __int16 v69 = (const char *)v13;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@, discard event with wrong start/end date, event, %@ ", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v12 = v54 + 1;
      }
      while ((id)(v54 + 1) != v10);
      id v10 = [v8 countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v10);
  }

  id v49 = [v55 copy];

  return v49;
}

- (void)addSocialContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5
{
  id v52 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 firstObject];
  id v10 = [v9 startDate];

  uint64_t v51 = v7;
  uint64_t v11 = [v7 lastObject];
  uint64_t v12 = [v11 endDate];

  id v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (objc_class *)objc_opt_class();
    int v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412802;
    long long v64 = v15;
    __int16 v65 = 2112;
    double v66 = *(double *)&v10;
    __int16 v67 = 2112;
    double v68 = *(double *)&v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TimeContext(%@): bundle startDate, %@, endDate, %@", buf, 0x20u);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v59 objects:v79 count:16];
  if (v17)
  {
    id v18 = v17;
    unint64_t v19 = 0;
    uint64_t v20 = *(void *)v60;
    double v21 = 0.0;
    double v22 = 0.0;
    id v54 = v16;
    v55 = v10;
    uint64_t v53 = *(void *)v60;
    do
    {
      unsigned int v23 = 0;
      id v57 = v18;
      do
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v16);
        }
        id v24 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v23);
        if ([v24 category] == (id)15)
        {
          id v25 = [v24 startDate];
          if ([v25 isAfterDate:v10])
          {
            id v26 = [v24 startDate];
          }
          else
          {
            id v26 = v10;
          }
          id v27 = v26;

          uint64_t v28 = [v24 endDate];
          if ([v28 isBeforeDate:v12])
          {
            id v29 = [v24 endDate];
          }
          else
          {
            id v29 = v12;
          }
          uint64_t v30 = v29;

          [v30 timeIntervalSinceDate:v27];
          double v32 = v31;
          double v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          long long v58 = v27;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = (objc_class *)objc_opt_class();
            uint64_t v35 = NSStringFromClass(v34);
            id v36 = [v24 eventIdentifier];
            id v37 = [v24 startDate];
            id v38 = [v24 endDate];
            [v24 pCount];
            unint64_t v56 = v19;
            v40 = long long v39 = v12;
            *(_DWORD *)buf = 138414082;
            long long v64 = v35;
            __int16 v65 = 2112;
            double v66 = *(double *)&v36;
            __int16 v67 = 2112;
            double v68 = *(double *)&v37;
            __int16 v69 = 2112;
            unint64_t v70 = (unint64_t)v38;
            __int16 v71 = 2112;
            id v72 = v40;
            __int16 v73 = 2112;
            id v74 = v58;
            __int16 v75 = 2112;
            double v76 = v30;
            __int16 v77 = 2048;
            double v78 = v32;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "TimeContext(%@): social context event identifier, %@, startDate, %@, endDate, %@, p count, %@, overlap startDate, %@, endDate %@, overlap interval, %.1f", buf, 0x52u);

            uint64_t v12 = v39;
            unint64_t v19 = v56;

            uint64_t v20 = v53;
            id v10 = v55;

            id v16 = v54;
          }

          id v41 = [v24 pCount];
          double v22 = v22 + (double)[v41 unsignedIntValue] * v32;

          long long v42 = [v24 pCount];
          unsigned int v43 = [v42 unsignedIntValue];

          if (v19 <= v43) {
            unint64_t v19 = v43;
          }
          double v21 = v21 + v32;

          id v18 = v57;
        }
        unsigned int v23 = (char *)v23 + 1;
      }
      while (v18 != v23);
      id v18 = [v16 countByEnumeratingWithState:&v59 objects:v79 count:16];
    }
    while (v18);
  }
  else
  {
    unint64_t v19 = 0;
    double v21 = 0.0;
    double v22 = 0.0;
  }

  if (v21 <= 0.0) {
    double v44 = 0.0;
  }
  else {
    double v44 = v22 / v21;
  }
  id v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    id v46 = (objc_class *)objc_opt_class();
    id v47 = NSStringFromClass(v46);
    *(_DWORD *)buf = 138413058;
    long long v64 = v47;
    __int16 v65 = 2048;
    double v66 = v22;
    __int16 v67 = 2048;
    double v68 = v44;
    __int16 v69 = 2048;
    unint64_t v70 = v19;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "TimeContext(%@): pCountWeightedSum, %.1f, pCountWeightedAverage, %.1f, pCountMax, %lu", buf, 0x2Au);
  }
  id v48 = +[NSNumber numberWithDouble:v22];
  [v52 addMetaDataForRankForKey:@"PeopleCountWeightedSum" value:v48];

  id v49 = +[NSNumber numberWithDouble:v44];
  [v52 addMetaDataForRankForKey:@"PeopleCountWeightedAverage" value:v49];

  v50 = +[NSNumber numberWithUnsignedInteger:v19];
  [v52 addMetaDataForRankForKey:@"PeopleCountMax" value:v50];
}

- (void)addPeopleDensityContextForEventBundle:(id)a3 sortedBaseEvents:(id)a4 contextEvents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 firstObject];
  uint64_t v11 = [v10 startDate];

  uint64_t v12 = [v8 lastObject];
  id v13 = [v12 endDate];

  id v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  __int16 v69 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138412802;
    double v78 = v16;
    __int16 v79 = 2112;
    double v80 = *(double *)&v11;
    __int16 v81 = 2112;
    double v82 = *(double *)&v69;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "TimeContext(%@): bundle startDate, %@, endDate, %@", buf, 0x20u);

    id v13 = v69;
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v17 = v9;
  id v18 = [v17 countByEnumeratingWithState:&v73 objects:v93 count:16];
  if (v18)
  {
    id v19 = v18;
    id v66 = v8;
    id v67 = v7;
    uint64_t v20 = *(void *)v74;
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    uint64_t v70 = *(void *)v74;
    id v71 = v17;
    double v68 = v11;
    do
    {
      id v25 = 0;
      id v72 = v19;
      do
      {
        if (*(void *)v74 != v20) {
          objc_enumerationMutation(v17);
        }
        id v26 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v25);
        if (objc_msgSend(v26, "category", v66, v67) == (id)23)
        {
          id v27 = [v26 startDate];
          if ([v27 isAfterDate:v11])
          {
            id v28 = [v26 startDate];
          }
          else
          {
            id v28 = v11;
          }
          id v29 = v28;

          uint64_t v30 = [v26 endDate];
          if ([v30 isBeforeDate:v13])
          {
            id v31 = [v26 endDate];
          }
          else
          {
            id v31 = v13;
          }
          double v32 = v31;

          [v32 timeIntervalSinceDate:v29];
          double v34 = v33;
          uint64_t v35 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            id v36 = (objc_class *)objc_opt_class();
            id v37 = NSStringFromClass(v36);
            id v38 = [v26 eventIdentifier];
            long long v39 = [v26 startDate];
            long long v40 = [v26 endDate];
            id v41 = [v26 densityScore];
            *(_DWORD *)buf = 138414082;
            double v78 = v37;
            __int16 v79 = 2112;
            double v80 = *(double *)&v38;
            __int16 v81 = 2112;
            double v82 = *(double *)&v39;
            __int16 v83 = 2112;
            double v84 = *(double *)&v40;
            __int16 v85 = 2112;
            double v86 = *(double *)&v41;
            __int16 v87 = 2112;
            double v88 = *(double *)&v29;
            __int16 v89 = 2112;
            v90 = v32;
            __int16 v91 = 2048;
            double v92 = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "TimeContext(%@): people density event identifier, %@, startDate, %@, endDate, %@, p count, %@, overlap startDate, %@, endDate %@, overlap interval, %.1f", buf, 0x52u);

            id v13 = v69;
            uint64_t v11 = v68;
          }
          long long v42 = [v26 densityScore];
          [v42 doubleValue];
          double v24 = v24 + v43 * v34;

          double v44 = [v26 endDate];
          id v45 = [v26 startDate];
          [v44 timeIntervalSinceDate:v45];
          double v47 = v46;

          id v48 = [v26 densityScanDuration];
          [v48 doubleValue];
          double v50 = v49 / v47;

          uint64_t v51 = [v26 densityScore];
          [v51 doubleValue];
          double v23 = v23 + v50 * v52 * v34;

          uint64_t v53 = [v26 densityScore];
          [v53 doubleValue];
          double v55 = v54;

          if (v21 < v55) {
            double v21 = v55;
          }
          double v22 = v22 + v34;

          uint64_t v20 = v70;
          id v17 = v71;
          id v19 = v72;
        }
        id v25 = (char *)v25 + 1;
      }
      while (v19 != v25);
      id v19 = [v17 countByEnumeratingWithState:&v73 objects:v93 count:16];
    }
    while (v19);

    if (v22 > 0.0) {
      double v56 = v24 / v22;
    }
    else {
      double v56 = 0.0;
    }
    if (v22 > 0.0) {
      double v57 = v23 / v22;
    }
    else {
      double v57 = 0.0;
    }
    id v8 = v66;
    id v7 = v67;
  }
  else
  {

    double v24 = 0.0;
    double v23 = 0.0;
    double v21 = 0.0;
    double v56 = 0.0;
    double v57 = 0.0;
  }
  long long v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    long long v59 = (objc_class *)objc_opt_class();
    long long v60 = NSStringFromClass(v59);
    *(_DWORD *)buf = 138413570;
    double v78 = v60;
    __int16 v79 = 2048;
    double v80 = v24;
    __int16 v81 = 2048;
    double v82 = v56;
    __int16 v83 = 2048;
    double v84 = v21;
    __int16 v85 = 2048;
    double v86 = v23;
    __int16 v87 = 2048;
    double v88 = v57;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "TimeContext(%@): peopleDensityWeightedSum, %.1f, peopleDensityWeightedAverage, %.1f, peopleDensityMax, %.1f, peopleDensityWeightedConfidenceSum, %.1f, peopleDensityWeightedConfidenceAverage, %.3f", buf, 0x3Eu);
  }
  long long v61 = +[NSNumber numberWithDouble:v24];
  [v7 addMetaDataForRankForKey:@"PeopleDensityWeightedSum" value:v61];

  long long v62 = +[NSNumber numberWithDouble:v56];
  [v7 addMetaDataForRankForKey:@"PeopleDensityWeightedAverage" value:v62];

  long long v63 = +[NSNumber numberWithDouble:v21];
  [v7 addMetaDataForRankForKey:@"PeopleDensityMax" value:v63];

  long long v64 = +[NSNumber numberWithDouble:v23];
  [v7 addMetaDataForRankForKey:@"PeopleDensityWeightedConfidenceSum" value:v64];

  __int16 v65 = +[NSNumber numberWithDouble:v57];
  [v7 addMetaDataForRankForKey:@"PeopleDensityWeightedConfidenceAverage" value:v65];
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
}

- (void)getBaseEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)getContextEventsForBaseEvents:events:withPatternEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)annotateBaseEvents:contextEvents:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)buildPromptDescriptionForEventBundle:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "Use the derived class (in %s:%d)", v2, v3, v4, v5, v6);
}

@end