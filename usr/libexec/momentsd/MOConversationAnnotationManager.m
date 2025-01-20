@interface MOConversationAnnotationManager
- (BOOL)_callLikeInteraction:(id)a3;
- (BOOL)_messageInteraction:(id)a3;
- (MOConfigurationManager)configurationManager;
- (MOConversationAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_actionForBundle:(id)a3 type:(unint64_t)a4;
- (id)_annotateEvents:(id)a3 significantContact:(id)a4 type:(unint64_t)a5;
- (id)_findEventsWithBurstyInteractionsFromEvents:(id)a3;
- (id)_findEventsWithLongDailyCall:(id)a3;
- (id)_findEventsWithOutgoingMessageBurstFromEvents:(id)a3;
- (id)_findEventsWithPatternEvents:(id)a3;
- (id)_getBaseEvents:(id)a3;
- (id)_getContextEvents:(id)a3;
- (id)_getWorkVisitEventsDuringCall:(id)a3 withCall:(id)a4;
- (unint64_t)_outgoingMessageBurstCount:(id)a3 bundleIdPrefix:(id)a4;
- (void)_buildMappingFromBaseEvents:(id)a3 toContextEvents:(id)a4;
- (void)_buildMappingFromBaseEvents:(id)a3 toPatternEvents:(id)a4;
- (void)_calculateEventStats:(id)a3;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MOConversationAnnotationManager

- (MOConversationAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MOConversationAnnotationManager;
  v5 = [(MOAnnotationManager *)&v25 initWithUniverse:v4];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MOConversationAnnotationManager", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v4 getService:v10];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v11;

    v13 = (NSSet *)[objc_alloc((Class)NSSet) initWithObjects:&off_1002F7448, &off_1002F7460, &off_1002F7478, &off_1002F7490, &off_1002F74A8, &off_1002F74C0, &off_1002F74D8, &off_1002F74F0, 0];
    callLikeInteractionMechanisms = v5->_callLikeInteractionMechanisms;
    v5->_callLikeInteractionMechanisms = v13;

    v15 = (NSSet *)[objc_alloc((Class)NSSet) initWithObjects:&off_1002F7508, &off_1002F7520, &off_1002F7538, 0];
    messageInteractionMechanisms = v5->_messageInteractionMechanisms;
    v5->_messageInteractionMechanisms = v15;

    uint64_t v17 = objc_opt_new();
    stats = v5->_stats;
    v5->_stats = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    eventToPatternEventMap = v5->_eventToPatternEventMap;
    v5->_eventToPatternEventMap = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    eventToContextEventMap = v5->_eventToContextEventMap;
    v5->_eventToContextEventMap = (NSMutableDictionary *)v21;

    v23 = v5;
  }

  return v5;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MOConversationAnnotationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __89__MOConversationAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
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

id __89__MOConversationAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnnotationWithEvents:*(void *)(a1 + 40) withPatternEvents:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MOConversationAnnotationManager *)self _getBaseEvents:v8];
  if ([v11 count])
  {
    id v59 = v10;
    if (![v9 count])
    {

      id v9 = 0;
    }
    [(MOConversationAnnotationManager *)self _calculateEventStats:v11];
    id v60 = v9;
    [(MOConversationAnnotationManager *)self _buildMappingFromBaseEvents:v11 toPatternEvents:v9];
    id v61 = v8;
    v57 = [(MOConversationAnnotationManager *)self _getContextEvents:v8];
    -[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:](self, "_buildMappingFromBaseEvents:toContextEvents:", v11);
    id v12 = [(MOConversationAnnotationManager *)self _findEventsWithPatternEvents:v11];
    id v13 = [(MOConversationAnnotationManager *)self _findEventsWithBurstyInteractionsFromEvents:v11];
    v53 = [(MOConversationAnnotationManager *)self _findEventsWithLongDailyCall:v11];
    v58 = v11;
    v55 = [(MOConversationAnnotationManager *)self _findEventsWithOutgoingMessageBurstFromEvents:v11];
    v63 = objc_opt_new();
    id v14 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = v12;
    id v15 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
    if (v15)
    {
      id v16 = v15;
      id v17 = 0;
      uint64_t v18 = *(void *)v77;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v77 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (([v14 containsObject:v20] & 1) == 0)
          {
            [v14 addObject:v20];
            v90 = v20;
            uint64_t v21 = +[NSArray arrayWithObjects:&v90 count:1];
            v22 = [v20 interactionScoredContact];
            uint64_t v23 = [(MOConversationAnnotationManager *)self _annotateEvents:v21 significantContact:v22 type:6];

            if (v23)
            {
              [v63 addObject:v23];
              id v17 = (void *)v23;
            }
            else
            {
              id v17 = 0;
            }
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
      }
      while (v16);
    }
    else
    {
      id v17 = 0;
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v24 = v13;
    id v25 = [v24 countByEnumeratingWithState:&v72 objects:v89 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v73;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v73 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
          if (([v14 containsObject:v29] & 1) == 0)
          {
            [v14 addObject:v29];
            v88 = v29;
            v30 = +[NSArray arrayWithObjects:&v88 count:1];
            v31 = [v29 interactionScoredContact];
            uint64_t v32 = [(MOConversationAnnotationManager *)self _annotateEvents:v30 significantContact:v31 type:5];

            if (v32)
            {
              [v63 addObject:v32];
              id v17 = (void *)v32;
            }
            else
            {
              id v17 = 0;
            }
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v72 objects:v89 count:16];
      }
      while (v26);
    }
    v56 = v24;

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v33 = v53;
    id v34 = [v33 countByEnumeratingWithState:&v68 objects:v87 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v69;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v69 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v68 + 1) + 8 * (void)k);
          if (([v14 containsObject:v38] & 1) == 0)
          {
            [v14 addObject:v38];
            v86 = v38;
            v39 = +[NSArray arrayWithObjects:&v86 count:1];
            v40 = [v38 interactionScoredContact];
            uint64_t v41 = [(MOConversationAnnotationManager *)self _annotateEvents:v39 significantContact:v40 type:4];

            if (v41)
            {
              [v63 addObject:v41];
              id v17 = (void *)v41;
            }
            else
            {
              id v17 = 0;
            }
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v68 objects:v87 count:16];
      }
      while (v35);
    }
    v54 = v33;

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v42 = v55;
    id v43 = [v42 countByEnumeratingWithState:&v64 objects:v85 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v65;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v65 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v64 + 1) + 8 * (void)m);
          if ((objc_msgSend(v14, "containsObject:", v47, v54) & 1) == 0)
          {
            [v14 addObject:v47];
            v84 = v47;
            v48 = +[NSArray arrayWithObjects:&v84 count:1];
            v49 = [v47 interactionScoredContact];
            uint64_t v50 = [(MOConversationAnnotationManager *)self _annotateEvents:v48 significantContact:v49 type:7];

            if (v50)
            {
              [v63 addObject:v50];
              id v17 = (void *)v50;
            }
            else
            {
              id v17 = 0;
            }
          }
        }
        id v44 = [v42 countByEnumeratingWithState:&v64 objects:v85 count:16];
      }
      while (v44);
    }

    v51 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      id v52 = [v63 count];
      *(_DWORD *)buf = 136315394;
      v81 = "-[MOConversationAnnotationManager _performAnnotationWithEvents:withPatternEvents:handler:]";
      __int16 v82 = 2048;
      id v83 = v52;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s, annotated bundle count, %lu", buf, 0x16u);
    }

    id v10 = v59;
    (*((void (**)(id, void *, void))v59 + 2))(v59, v63, 0);

    id v9 = v60;
    id v8 = v61;
    uint64_t v11 = v58;
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (id)_getBaseEvents:(id)a3
{
  id v3 = a3;
  id v16 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 10];
  id v17 = v3;
  id v4 = [v3 filteredArrayUsingPredicate:];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v23 = "-[MOConversationAnnotationManager _getBaseEvents:]";
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s, filtered event, %@", buf, 0x16u);
        }

        uint64_t v11 = [v9 interactions];
        [v11 enumerateObjectsUsingBlock:&__block_literal_global_39];
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v17 count];
    id v14 = [v4 count];
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[MOConversationAnnotationManager _getBaseEvents:]";
    __int16 v24 = 2048;
    id v25 = v13;
    __int16 v26 = 2048;
    id v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s, event count, %lu, filtered events count, %lu", buf, 0x20u);
  }

  return v4;
}

void __50__MOConversationAnnotationManager__getBaseEvents___block_invoke(id a1, MOInteraction *a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __50__MOConversationAnnotationManager__getBaseEvents___block_invoke_cold_1((uint64_t)v5, a3, v6);
  }
}

- (id)_getContextEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"category", &off_1002F92F0];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)_getWorkVisitEventsDuringCall:(id)a3 withCall:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"placeUserType", 2];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  id v9 = [v5 endDate];
  id v10 = +[NSPredicate predicateWithFormat:@"%K <= %@", @"startDate", v9];
  v18[0] = v10;
  uint64_t v11 = [v5 startDate];

  id v12 = +[NSPredicate predicateWithFormat:@"%K => %@", @"endDate", v11];
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  id v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];

  id v15 = [v8 filteredArrayUsingPredicate:v14];
  id v16 = [v15 mutableCopy];

  return v16;
}

- (BOOL)_callLikeInteraction:(id)a3
{
  callLikeInteractionMechanisms = self->_callLikeInteractionMechanisms;
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 mechanism]);
  LOBYTE(callLikeInteractionMechanisms) = [(NSSet *)callLikeInteractionMechanisms containsObject:v4];

  return (char)callLikeInteractionMechanisms;
}

- (BOOL)_messageInteraction:(id)a3
{
  messageInteractionMechanisms = self->_messageInteractionMechanisms;
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 mechanism]);
  LOBYTE(messageInteractionMechanisms) = [(NSSet *)messageInteractionMechanisms containsObject:v4];

  return (char)messageInteractionMechanisms;
}

- (id)_findEventsWithBurstyInteractionsFromEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(MOConversationAnnotationManager *)self configurationManager];
  signed int v6 = [v5 getIntegerSettingForKey:@"kMOConversationAnnotationManagerMinimumInteractionCount" withFallback:10];

  id v22 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v7)
  {
    id v9 = v7;
    unint64_t v10 = v6;
    uint64_t v11 = *(void *)v25;
    *(void *)&long long v8 = 136315650;
    long long v21 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        stats = self->_stats;
        id v15 = [v13 eventIdentifier:v21];
        id v16 = [(NSMutableDictionary *)stats objectForKeyedSubscript:v15];
        id v17 = [v16 objectForKey:@"maxBurstLength"];
        unint64_t v18 = [v17 unsignedIntValue];

        if (v18 >= v10)
        {
          long long v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v29 = "-[MOConversationAnnotationManager _findEventsWithBurstyInteractionsFromEvents:]";
            __int16 v30 = 2112;
            v31 = v13;
            __int16 v32 = 2048;
            unint64_t v33 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s, found event, %@, maxBurstLength, %lu", buf, 0x20u);
          }

          [v22 addObject:v13];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v9);
  }

  return v22;
}

- (id)_findEventsWithOutgoingMessageBurstFromEvents:(id)a3
{
  id v4 = a3;
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 136315650;
    long long v18 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        stats = self->_stats;
        id v12 = [v10 eventIdentifier:v18];
        id v13 = [(NSMutableDictionary *)stats objectForKeyedSubscript:v12];
        id v14 = [v13 objectForKey:@"outgoingMessageBurstCount"];
        unsigned int v15 = [v14 unsignedIntValue];

        if (v15)
        {
          id v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            long long v26 = "-[MOConversationAnnotationManager _findEventsWithOutgoingMessageBurstFromEvents:]";
            __int16 v27 = 2112;
            v28 = v10;
            __int16 v29 = 2048;
            uint64_t v30 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s, found event, %@, outgoingMessageBurstCount, %lu", buf, 0x20u);
          }

          [v20 addObject:v10];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v7);
  }

  return v20;
}

- (id)_findEventsWithLongDailyCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MOConversationAnnotationManager *)self configurationManager];
  [v5 getDoubleSettingForKey:@"kMOConversationAnnotationManagerMinimumDurationDailyCall" withFallback:300.0];
  double v7 = v6;

  long long v26 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v29;
    *(void *)&long long v9 = 136315650;
    long long v25 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        stats = self->_stats;
        unsigned int v15 = [v13 eventIdentifier:v25];
        id v16 = [(NSMutableDictionary *)stats objectForKey:v15];
        id v17 = [v16 objectForKey:@"aggregatedCallDuration"];
        [v17 doubleValue];
        double v19 = v18;

        if (v19 > v7)
        {
          id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            id v34 = "-[MOConversationAnnotationManager _findEventsWithLongDailyCall:]";
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            __int16 v37 = 2048;
            double v38 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s, found event, %@, daily call duration, %.1f", buf, 0x20u);
          }

          [v26 addObject:v13];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v10);
  }

  long long v21 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:0];
  __int16 v32 = v21;
  long long v22 = +[NSArray arrayWithObjects:&v32 count:1];
  long long v23 = [v26 sortedArrayUsingDescriptors:v22];

  return v23;
}

- (id)_findEventsWithPatternEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(MOConversationAnnotationManager *)self configurationManager];
  signed int v6 = [v5 getIntegerSettingForKey:@"kMOConversationAnnotationManagerMinimumPatternEventCount" withFallback:2];

  id v23 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v7)
  {
    id v9 = v7;
    unint64_t v10 = v6;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v8 = 136315650;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        eventToPatternEventMap = self->_eventToPatternEventMap;
        unsigned int v15 = [v13 eventIdentifier:v22];
        id v16 = [(NSMutableDictionary *)eventToPatternEventMap objectForKey:v15];

        if ((unint64_t)[v16 count] >= v10)
        {
          id v17 = objc_opt_new();
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = __64__MOConversationAnnotationManager__findEventsWithPatternEvents___block_invoke;
          v25[3] = &unk_1002D0CC0;
          id v18 = v17;
          id v26 = v18;
          [v16 enumerateObjectsUsingBlock:v25];
          if (v10 == 1) {
            goto LABEL_14;
          }
          if ([v18 containsObject:&off_1002F7568]
            && (([v18 containsObject:&off_1002F7580] & 1) != 0
             || [v18 containsObject:&off_1002F7598]))
          {
            double v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = [v16 count];
              *(_DWORD *)buf = v22;
              __int16 v32 = "-[MOConversationAnnotationManager _findEventsWithPatternEvents:]";
              __int16 v33 = 2112;
              id v34 = v13;
              __int16 v35 = 2048;
              id v36 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s, found event, %@, pattern event count, %lu", buf, 0x20u);
            }

LABEL_14:
            [v23 addObject:v13];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v9);
  }

  return v23;
}

void __64__MOConversationAnnotationManager__findEventsWithPatternEvents___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 patterns];
  id v3 = [v4 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
  [v2 addObject:v3];
}

- (id)_annotateEvents:(id)a3 significantContact:(id)a4 type:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 contact];
  unint64_t v10 = [v9 localizedFullName];

  if (v10)
  {
    id v245 = v8;
    uint64_t v11 = [MOEventBundle alloc];
    id v12 = +[NSUUID UUID];
    id v13 = +[NSDate date];
    id v14 = [(MOEventBundle *)v11 initWithBundleIdentifier:v12 creationDate:v13];

    [(MOEventBundle *)v14 setEvents:v7];
    [(MOEventBundle *)v14 setPropertiesBasedOnEvents];
    v251 = v14;
    [(MOEventBundle *)v14 setInterfaceType:4];
    unint64_t v247 = a5;
    if (a5 == 7) {
      [(MOEventBundle *)v14 setIncludedInSummaryBundleOnly:1];
    }
    v256 = +[NSMutableArray arrayWithArray:v7];
    long long v293 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    long long v296 = 0u;
    id v246 = v7;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v293 objects:v315 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v294;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v294 != v17) {
            objc_enumerationMutation(obj);
          }
          double v19 = *(void **)(*((void *)&v293 + 1) + 8 * i);
          eventToPatternEventMap = self->_eventToPatternEventMap;
          long long v21 = [v19 eventIdentifier];
          long long v22 = [(NSMutableDictionary *)eventToPatternEventMap objectForKey:v21];

          id v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            long long v30 = [v19 eventIdentifier];
            id v31 = [v22 count];
            *(_DWORD *)buf = 136315650;
            v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            __int16 v299 = 2112;
            unint64_t v300 = (unint64_t)v30;
            __int16 v301 = 2048;
            unint64_t v302 = (unint64_t)v31;
            _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, pattern event count, %lu", buf, 0x20u);
          }
          if ([v22 count])
          {
            long long v24 = [v22 allObjects];
            [v256 addObjectsFromArray:v24];
          }
          eventToContextEventMap = self->_eventToContextEventMap;
          id v26 = [v19 eventIdentifier];
          long long v27 = [(NSMutableDictionary *)eventToContextEventMap objectForKey:v26];

          long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            __int16 v32 = [v19 eventIdentifier];
            id v33 = [v27 count];
            *(_DWORD *)buf = 136315650;
            v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            __int16 v299 = 2112;
            unint64_t v300 = (unint64_t)v32;
            __int16 v301 = 2048;
            unint64_t v302 = (unint64_t)v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, context event count, %lu", buf, 0x20u);
          }
          if ([v27 count])
          {
            long long v29 = [v27 allObjects];
            [v256 addObjectsFromArray:v29];
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v293 objects:v315 count:16];
      }
      while (v16);
    }

    [(MOEventBundle *)v251 setEvents:v256];
    id v34 = [(MOConversationAnnotationManager *)self _actionForBundle:v251 type:v247];
    [(MOEventBundle *)v251 setAction:v34];

    __int16 v35 = [(MOEventBundle *)v251 startDate];
    id v36 = [(MOAnnotationManager *)self timeZoneManager];
    __int16 v37 = +[MOTime timeForDate:v35 timeZoneManager:v36];
    [(MOEventBundle *)v251 setTime:v37];

    double v38 = [obj firstObject];
    v39 = [v38 interactionContacts];
    v40 = +[NSSortDescriptor sortDescriptorWithKey:@"score" ascending:0];
    v314 = v40;
    uint64_t v41 = +[NSArray arrayWithObjects:&v314 count:1];
    id v42 = [v39 sortedArrayUsingDescriptors:v41];

    id v249 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v42 count]];
    v250 = v42;
    if ([v42 count])
    {
      unint64_t v43 = 0;
      do
      {
        if (v43)
        {
          if (v43 >= 4) {
            unint64_t v44 = v43 + 296;
          }
          else {
            unint64_t v44 = v43 + 199;
          }
        }
        else
        {
          unint64_t v44 = 100;
        }
        uint64_t v45 = [v42 objectAtIndexedSubscript:v43];
        [v45 score];
        double v47 = v46;

        v48 = [v42 objectAtIndexedSubscript:v43];
        v49 = [v48 contact];
        uint64_t v50 = [v49 localizedFullName];

        v51 = [v42 objectAtIndexedSubscript:v43];
        id v52 = [v51 contact];
        v53 = [v52 identifier];
        v54 = +[MOContactUtilities cNContactIdentifierFromPPContactIdentifier:v53];

        if (v54)
        {
          v55 = [[MOPerson alloc] initWithLocalIdentifier:0 name:v50 contactIdentifier:v54 family:0 priorityScore:(double)v44 significanceScore:v47];
          if (v55)
          {
            v56 = [obj firstObject];
            v57 = [v56 eventIdentifier];
            [(MOPerson *)v55 setSourceEventIdentifier:v57];

            [(MOPerson *)v55 setSourceEventAccessType:3];
            v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
            {
              id v59 = [(MOEventBundle *)v251 bundleIdentifier];
              *(_DWORD *)buf = 136315650;
              v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
              __int16 v299 = 2112;
              unint64_t v300 = (unint64_t)v55;
              __int16 v301 = 2112;
              unint64_t v302 = (unint64_t)v59;
              _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%s, person, %@, bundle identifier, %@", buf, 0x20u);
            }
            [v249 addObject:v55];
          }
        }
        else
        {
          _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v55 = (MOPerson *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v55->super, OS_LOG_TYPE_ERROR)) {
            -[MOConversationAnnotationManager _annotateEvents:significantContact:type:](&v291, v292, &v55->super);
          }
        }
        id v42 = v250;

        ++v43;
      }
      while (v43 < (unint64_t)[v250 count]);
    }
    [(MOEventBundle *)v251 setPersons:v249];
    [(MOEventBundle *)v251 setBundleSuperType:3];
    [(MOEventBundle *)v251 setBundleSubType:301];
    id v60 = objc_opt_new();
    id v61 = [(MOEventBundle *)v251 persons];
    id v62 = [v61 count];

    if (v62 == (id)1) {
      v63 = &__kCFBooleanFalse;
    }
    else {
      v63 = &__kCFBooleanTrue;
    }
    [v60 setObject:v63 forKey:@"isGroupConversation"];
    stats = self->_stats;
    long long v65 = [obj firstObject];
    long long v66 = [v65 eventIdentifier];
    long long v67 = [(NSMutableDictionary *)stats objectForKeyedSubscript:v66];
    long long v68 = [v67 objectForKey:@"callCount"];
    [v68 doubleValue];
    unint64_t v70 = (unint64_t)v69;

    long long v71 = self->_stats;
    long long v72 = [obj firstObject];
    long long v73 = [v72 eventIdentifier];
    long long v74 = [(NSMutableDictionary *)v71 objectForKeyedSubscript:v73];
    long long v75 = [v74 objectForKey:@"messageCount"];
    [v75 doubleValue];
    unint64_t v77 = (unint64_t)v76;

    if (v77) {
      BOOL v78 = v70 == 0;
    }
    else {
      BOOL v78 = 1;
    }
    if (v78) {
      long long v79 = &__kCFBooleanFalse;
    }
    else {
      long long v79 = &__kCFBooleanTrue;
    }
    [v60 setObject:v79 forKey:@"multipleInteractionTypes"];
    [v60 setObject:&off_1002F96A0 forKey:@"key"];
    v248 = v60;
    [v60 setObject:&off_1002F96A0 forKey:@""];
    long long v289 = 0u;
    long long v290 = 0u;
    long long v287 = 0u;
    long long v288 = 0u;
    id v252 = [(MOEventBundle *)v251 events];
    id v255 = [v252 countByEnumeratingWithState:&v287 objects:v313 count:16];
    int v80 = 0;
    int v81 = 0;
    if (v255)
    {
      uint64_t v254 = *(void *)v288;
      do
      {
        for (id j = 0; j != v255; id j = v102 + 1)
        {
          if (*(void *)v288 != v254) {
            objc_enumerationMutation(v252);
          }
          int v258 = v81;
          v257 = (char *)j;
          id v83 = *(void **)(*((void *)&v287 + 1) + 8 * (void)j);
          v84 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            v105 = [v83 eventIdentifier];
            v106 = [v83 significantContactEvent];
            v107 = [v106 contactClassificationMap];
            id v108 = [v107 count];
            *(_DWORD *)buf = 136315650;
            v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
            __int16 v299 = 2112;
            unint64_t v300 = (unint64_t)v105;
            __int16 v301 = 2048;
            unint64_t v302 = (unint64_t)v108;
            _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%s, event identifier, %@, contactClassificationMap size, %lu", buf, 0x20u);
          }
          long long v285 = 0u;
          long long v286 = 0u;
          long long v283 = 0u;
          long long v284 = 0u;
          v85 = [v83 significantContactEvent];
          v86 = [v85 contactClassificationMap];

          id v87 = [v86 countByEnumeratingWithState:&v283 objects:v312 count:16];
          if (v87)
          {
            id v88 = v87;
            uint64_t v89 = *(void *)v284;
            v260 = v83;
            do
            {
              for (k = 0; k != v88; k = (char *)k + 1)
              {
                if (*(void *)v284 != v89) {
                  objc_enumerationMutation(v86);
                }
                v91 = *(void **)(*((void *)&v283 + 1) + 8 * (void)k);
                v92 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                {
                  v268 = [v91 contact];
                  v261 = [v268 identifier];
                  v265 = [v91 contact];
                  v264 = [v265 localizedFullName];
                  v93 = [v264 mask];
                  v262 = [v83 significantContactEvent];
                  v94 = [v262 contactClassificationMap];
                  id v95 = [v94 objectForKey:v91];
                  *(_DWORD *)buf = 136315906;
                  v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
                  __int16 v299 = 2112;
                  unint64_t v300 = (unint64_t)v261;
                  __int16 v301 = 2112;
                  unint64_t v302 = (unint64_t)v93;
                  __int16 v303 = 2112;
                  id v304 = v95;
                  _os_log_debug_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "%s, contactID, %@, name, %@, classification, %@", buf, 0x2Au);

                  id v83 = v260;
                }
              }
              id v88 = [v86 countByEnumeratingWithState:&v283 objects:v312 count:16];
            }
            while (v88);
          }

          long long v281 = 0u;
          long long v282 = 0u;
          long long v279 = 0u;
          long long v280 = 0u;
          v96 = [v83 significantContactEvent];
          v97 = [v96 contactClassificationMap];
          v98 = [v97 allValues];

          id v99 = [v98 countByEnumeratingWithState:&v279 objects:v311 count:16];
          if (v99)
          {
            id v100 = v99;
            uint64_t v101 = *(void *)v280;
            int v81 = v258;
            v102 = v257;
            do
            {
              for (m = 0; m != v100; m = (char *)m + 1)
              {
                if (*(void *)v280 != v101) {
                  objc_enumerationMutation(v98);
                }
                v104 = *(void **)(*((void *)&v279 + 1) + 8 * (void)m);
                if (([v104 unsignedIntValue] & 8) != 0
                  || ([v104 unsignedIntValue] & 0x100000) != 0)
                {
                  int v81 = 1;
                }
                v80 |= ([v104 unsignedIntValue] & 0x200000) >> 21;
              }
              id v100 = [v98 countByEnumeratingWithState:&v279 objects:v311 count:16];
            }
            while (v100);
          }
          else
          {
            int v81 = v258;
            v102 = v257;
          }
        }
        id v255 = [v252 countByEnumeratingWithState:&v287 objects:v313 count:16];
      }
      while (v255);
    }

    v109 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
    {
      CFStringRef v110 = @"NO";
      if (v81) {
        CFStringRef v111 = @"YES";
      }
      else {
        CFStringRef v111 = @"NO";
      }
      *(_DWORD *)buf = 136315650;
      v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
      __int16 v299 = 2112;
      if (v80) {
        CFStringRef v110 = @"YES";
      }
      unint64_t v300 = (unint64_t)v111;
      __int16 v301 = 2112;
      unint64_t v302 = (unint64_t)v110;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "%s, bundleHasFamilyOrFriendContact, %@, bundleHasCoworkerContact, %@", buf, 0x20u);
    }

    v112 = v251;
    v113 = v248;
    if ((v80 | v81))
    {
      if (v80) {
        CFStringRef v114 = @"isCoworkerContact";
      }
      else {
        CFStringRef v114 = @"isFamilyContact";
      }
      [v248 setObject:&off_1002F9930 forKey:v114];
    }
    if ((v247 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      v115 = self->_stats;
      v116 = [obj firstObject];
      v117 = [v116 eventIdentifier];
      v118 = [(NSMutableDictionary *)v115 objectForKeyedSubscript:v117];
      v119 = [v118 objectForKey:@"longestCallDuration"];
      [v119 doubleValue];
      double v121 = v120;

      v122 = +[NSNumber numberWithDouble:v121];
      [v248 setObject:v122 forKey:@"callDuration"];

      v123 = self->_stats;
      v124 = [obj firstObject];
      v125 = [v124 eventIdentifier];
      v126 = [(NSMutableDictionary *)v123 objectForKeyedSubscript:v125];
      v127 = [v126 objectForKey:@"aggregatedCallDuration"];
      [v127 doubleValue];
      double v129 = v128;

      v130 = +[NSNumber numberWithDouble:v129];
      [v248 setObject:v130 forKey:@"dailyAggregateCallDuration"];

      v131 = self->_stats;
      v132 = [obj firstObject];
      v133 = [v132 eventIdentifier];
      v134 = [(NSMutableDictionary *)v131 objectForKeyedSubscript:v133];
      v135 = [v134 objectForKey:@"callAtWork"];
      [v135 doubleValue];
      unint64_t v137 = (unint64_t)v136;

      v138 = self->_stats;
      v139 = [obj firstObject];
      v140 = [v139 eventIdentifier];
      v141 = [(NSMutableDictionary *)v138 objectForKeyedSubscript:v140];
      v142 = [v141 objectForKey:@"callCountForDailyAggregate"];
      [v142 doubleValue];
      double v144 = v143;

      if (v137 && v137 == (unint64_t)v144) {
        v145 = &__kCFBooleanTrue;
      }
      else {
        v145 = &__kCFBooleanFalse;
      }
      v113 = v248;
      [v248 setObject:v145 forKey:@"contactLocationWork"];
      v112 = v251;
      goto LABEL_99;
    }
    if (v247 == 5)
    {
      v148 = self->_stats;
      v149 = [obj firstObject];
      v150 = [v149 eventIdentifier];
      v151 = [(NSMutableDictionary *)v148 objectForKeyedSubscript:v150];
      v152 = [v151 objectForKey:@"maxBurstLength"];
      [v152 doubleValue];
      unint64_t v154 = (unint64_t)v153;

      v112 = v251;
      v113 = v248;

      v155 = +[NSNumber numberWithUnsignedInteger:v154];
      v156 = kMOEventBundleMetaDataForRankKeywordBurstyInteractionCount;
    }
    else
    {
      if (v247 != 7)
      {
LABEL_99:
        v164 = [(MOEventBundle *)v112 metaDataForRank];

        if (v164)
        {
          v165 = [(MOEventBundle *)v112 metaDataForRank];
          [v113 addEntriesFromDictionary:v165];
        }
        v166 = +[NSNumber numberWithUnsignedInteger:v247];
        [v113 setObject:v166 forKey:@"SigConType"];

        [(MOEventBundle *)v112 setMetaDataForRank:v113];
        v167 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
        {
          v168 = [(MOEventBundle *)v112 events];
          id v169 = [v168 count];
          *(_DWORD *)buf = 136315906;
          v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
          __int16 v299 = 2112;
          unint64_t v300 = (unint64_t)v112;
          __int16 v301 = 2048;
          unint64_t v302 = v247;
          __int16 v303 = 2048;
          id v304 = v169;
          _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "%s, bundle, %@, type, %lu, event count, %lu", buf, 0x2Au);
        }
        long long v277 = 0u;
        long long v278 = 0u;
        long long v275 = 0u;
        long long v276 = 0u;
        v170 = [(MOEventBundle *)v112 metaDataForRank];
        id v171 = [v170 countByEnumeratingWithState:&v275 objects:v310 count:16];
        if (v171)
        {
          id v172 = v171;
          uint64_t v173 = *(void *)v276;
          v263 = v170;
          do
          {
            for (n = 0; n != v172; n = (char *)n + 1)
            {
              if (*(void *)v276 != v173) {
                objc_enumerationMutation(v170);
              }
              v175 = *(void **)(*((void *)&v275 + 1) + 8 * (void)n);
              v176 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
              {
                v177 = [(MOEventBundle *)v251 bundleIdentifier];
                v269 = [(MOEventBundle *)v251 events];
                v266 = [v269 firstObject];
                v178 = [v266 eventIdentifier];
                v179 = [(MOEventBundle *)v251 metaDataForRank];
                id v180 = [v179 objectForKey:v175];
                *(_DWORD *)buf = 136316162;
                v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
                __int16 v299 = 2112;
                unint64_t v300 = (unint64_t)v177;
                __int16 v301 = 2112;
                unint64_t v302 = (unint64_t)v178;
                __int16 v303 = 2112;
                id v304 = v175;
                __int16 v305 = 2112;
                unint64_t v306 = (unint64_t)v180;
                _os_log_debug_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEBUG, "%s, bundleID, %@, eventID, %@, metaDataForRank key, %@, metaDataForRank value, %@", buf, 0x34u);

                v170 = v263;
              }
            }
            id v172 = [v170 countByEnumeratingWithState:&v275 objects:v310 count:16];
          }
          while (v172);
        }

        [(MOEventBundle *)v251 setIsAggregatedAndSuppressed:1];
        v181 = [(MOConversationAnnotationManager *)self configurationManager];
        signed int v182 = [v181 getIntegerSettingForKey:@"kMOConversationAnnotationManagerBundlingFilterNumPatternEvents" withFallback:0];

        v183 = [(MOConversationAnnotationManager *)self configurationManager];
        [v183 getFloatSettingForKey:@"kMOConversationAnnotationManagerBundlingFilterMinContactScoreForCalls" withFallback:0.0];
        float v185 = v184;

        v186 = [(MOConversationAnnotationManager *)self configurationManager];
        LODWORD(v187) = 1157840896;
        [v186 getFloatSettingForKey:@"kMOConversationAnnotationManagerBundlingFilterMinimumDurationForCalls" withFallback:v187];
        float v189 = v188;

        v190 = [(MOConversationAnnotationManager *)self configurationManager];
        LODWORD(v191) = 1058642330;
        [v190 getFloatSettingForKey:@"kMOConversationAnnotationManagerBundlingFilterMaximumContactScoreForBurstyTexts" withFallback:v191];
        float v193 = v192;

        v194 = [(MOConversationAnnotationManager *)self configurationManager];
        LODWORD(v195) = 10.0;
        [v194 getFloatSettingForKey:@"kMOConversationAnnotationManagerMinimumInteractionCount" withFallback:v195];
        float v197 = v196;

        v198 = [(MOConversationAnnotationManager *)self configurationManager];
        LODWORD(v199) = 6.0;
        [v198 getFloatSettingForKey:@"kMOConversationAnnotationManagerBundlingFilterMaximumBaselineValueForFrequencyAnomaly" withFallback:v199];
        float v201 = v200;

        v202 = [(MOConversationAnnotationManager *)self configurationManager];
        LODWORD(v203) = *(_DWORD *)"U0B@";
        [v202 getFloatSettingForKey:@"PD_SCF_TukeyFactorForExponentialDistributionOutlier" withFallback:v203];
        float v205 = v204;

        v206 = self->_stats;
        v207 = [obj firstObject];
        v208 = [v207 eventIdentifier];
        v209 = [(NSMutableDictionary *)v206 objectForKeyedSubscript:v208];
        v210 = [v209 objectForKey:@"longestCallDuration"];
        [v210 doubleValue];
        double v212 = v211;

        v213 = self->_stats;
        v214 = [obj firstObject];
        v215 = [v214 eventIdentifier];
        v216 = [(NSMutableDictionary *)v213 objectForKeyedSubscript:v215];
        v217 = [v216 objectForKey:@"maxBurstLength"];
        [v217 doubleValue];
        unint64_t v219 = (unint64_t)v218;

        v220 = [obj firstObject];
        v221 = [v220 interactionContactScore];
        [v221 doubleValue];
        double v223 = v222;

        v270 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %lu", @"category", 10, @"provider", 5];
        v224 = [v256 filteredArrayUsingPredicate:];
        if ((unint64_t)[v224 count] > v182
          || v212 > v189 && v223 > v185
          || (double)v219 > v197 && v223 < v193)
        {
          [(MOEventBundle *)v251 setIsAggregatedAndSuppressed:0];
        }
        *(void *)v267 = v219;
        long long v273 = 0u;
        long long v274 = 0u;
        long long v271 = 0u;
        long long v272 = 0u;
        id v225 = v224;
        id v226 = [v225 countByEnumeratingWithState:&v271 objects:v309 count:16];
        if (v226)
        {
          id v227 = v226;
          double v228 = v201;
          double v229 = v205;
          uint64_t v230 = *(void *)v272;
          do
          {
            for (ii = 0; ii != v227; ii = (char *)ii + 1)
            {
              if (*(void *)v272 != v230) {
                objc_enumerationMutation(v225);
              }
              v232 = *(void **)(*((void *)&v271 + 1) + 8 * (void)ii);
              v233 = [v232 patterns];
              v234 = [v233 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
              unsigned int v235 = [v234 intValue];

              if (v235 == 2)
              {
                v237 = [v232 patterns];
                v238 = [v237 objectForKeyedSubscript:@"kEventPatternThresholdValue"];
                [v238 doubleValue];
                double v240 = v239;

                double v236 = v240 / v229;
                if (v240 / v229 > v228) {
                  -[MOEventBundle setIsAggregatedAndSuppressed:](v251, "setIsAggregatedAndSuppressed:", 1, v236);
                }
              }
            }
            id v227 = [v225 countByEnumeratingWithState:&v271 objects:v309 count:16];
          }
          while (v227);
        }

        v241 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
        {
          unint64_t v242 = [(MOEventBundle *)v251 isAggregatedAndSuppressed];
          id v243 = [v225 count];
          *(_DWORD *)buf = 136316418;
          v298 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
          __int16 v299 = 2048;
          unint64_t v300 = v242;
          __int16 v301 = 2048;
          unint64_t v302 = (unint64_t)v243;
          __int16 v303 = 2048;
          id v304 = *(id *)v267;
          __int16 v305 = 2048;
          unint64_t v306 = (unint64_t)v223;
          __int16 v307 = 2048;
          unint64_t v308 = (unint64_t)v212;
          _os_log_impl((void *)&_mh_execute_header, v241, OS_LOG_TYPE_INFO, "%s, isAggregatedAndSuppressed, %lu, num. patterns, %lu, burstyInteractionCount, %lu, contactScore, %lu, call duration, %lu", buf, 0x3Eu);
        }

        v146 = v251;
        v147 = v146;
        id v8 = v245;
        id v7 = v246;
        goto LABEL_131;
      }
      v157 = self->_stats;
      v158 = [obj firstObject];
      v159 = [v158 eventIdentifier];
      v160 = [(NSMutableDictionary *)v157 objectForKeyedSubscript:v159];
      v161 = [v160 objectForKey:@"outgoingMessageBurstCount"];
      [v161 doubleValue];
      unint64_t v163 = (unint64_t)v162;

      v112 = v251;
      v113 = v248;

      v155 = +[NSNumber numberWithUnsignedInteger:v163];
      v156 = kMOEventBundleMetaDataForRankKeywordBurstyOutgoingInteractionCount;
    }
    [v113 setObject:v155 forKey:*v156];

    goto LABEL_99;
  }
  v146 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
    -[MOConversationAnnotationManager _annotateEvents:significantContact:type:](v7, (uint64_t)v8, v146);
  }
  v147 = 0;
LABEL_131:

  return v147;
}

- (unint64_t)_outgoingMessageBurstCount:(id)a3 bundleIdPrefix:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  id v7 = [(MOConversationAnnotationManager *)self configurationManager];
  [v7 getDoubleSettingForKey:@"kMOConversationAnnotationManagerMaximumOutgoingInteractionInterval" withFallback:600.0];
  double v9 = v8;

  unint64_t v10 = [(MOConversationAnnotationManager *)self configurationManager];
  unint64_t v29 = (int)[v10 getIntegerSettingForKey:@"kMOConversationAnnotationManagerMinimumOutgoingInteractionCount" withFallback:5];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    unint64_t v30 = 0;
    uint64_t v15 = *(void *)v33;
    unint64_t v16 = 1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([(MOConversationAnnotationManager *)self _messageInteraction:v18])
        {
          double v19 = [v18 bundleId];
          unsigned int v20 = [v19 hasPrefix:v31];

          if (v20)
          {
            if (v14)
            {
              long long v21 = [v18 startDate];
              [v21 timeIntervalSinceDate:v14];
              double v23 = v22;

              uint64_t v24 = 1;
              if (v23 < v9) {
                uint64_t v24 = v16 + 1;
              }
              uint64_t v25 = v16 >= v29 && v23 >= v9;
              v30 += v25;
              unint64_t v16 = v24;
            }
            uint64_t v26 = [v18 endDate];

            id v14 = (void *)v26;
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
    unint64_t v30 = 0;
    unint64_t v16 = 1;
  }

  if (v16 < v29) {
    unint64_t v27 = v30;
  }
  else {
    unint64_t v27 = v30 + 1;
  }

  return v27;
}

- (void)_calculateEventStats:(id)a3
{
  id v4 = a3;
  id v5 = [(MOConversationAnnotationManager *)self configurationManager];
  [v5 getDoubleSettingForKey:@"kMOConversationAnnotationManagerMaximumInteractionInterval" withFallback:300.0];
  double v7 = v6;

  double v8 = [(MOConversationAnnotationManager *)self configurationManager];
  signed int v9 = [v8 getIntegerSettingForKey:@"kMOConversationAnnotationManagerMinimumDurationSingleCall" withFallback:300];

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v4;
  id v88 = [obj countByEnumeratingWithState:&v109 objects:v141 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v110;
    double v11 = (double)(unint64_t)v9;
    *(void *)&long long v10 = 136318210;
    long long v84 = v10;
    v104 = self;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v110 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v89 = *(void **)(*((void *)&v109 + 1) + 8 * v12);
        uint64_t v90 = v12;
        id v13 = [v89 interactions:v84];
        id v14 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
        v140 = v14;
        uint64_t v15 = +[NSArray arrayWithObjects:&v140 count:1];
        unint64_t v16 = [v13 sortedArrayUsingDescriptors:v15];

        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v97 = v16;
        id v17 = [v97 countByEnumeratingWithState:&v105 objects:v139 count:16];
        if (!v17)
        {
          double v19 = 0.0;
          v92 = 0;
          v93 = 0;
          id v20 = 0;
          id v99 = 0;
          unint64_t v21 = 0;
          uint64_t v94 = 0;
          uint64_t v22 = 0;
          double v23 = 0;
          double v25 = 0.0;
          double v26 = 0.0;
          goto LABEL_70;
        }
        id v18 = v17;
        double v19 = 0.0;
        v92 = 0;
        v93 = 0;
        id v20 = 0;
        id v99 = 0;
        id v100 = 0;
        unint64_t v21 = 0;
        unint64_t v98 = 0;
        uint64_t v94 = 0;
        uint64_t v22 = 0;
        double v23 = 0;
        uint64_t v24 = *(void *)v106;
        double v25 = 0.0;
        double v26 = 0.0;
        do
        {
          unint64_t v27 = 0;
          id v95 = v18;
          do
          {
            if (*(void *)v106 != v24) {
              objc_enumerationMutation(v97);
            }
            long long v28 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v27);
            if ([(MOConversationAnnotationManager *)self _callLikeInteraction:v28]
              || [(MOConversationAnnotationManager *)self _messageInteraction:v28])
            {
              uint64_t v29 = [v28 startDate];
              if (!v29)
              {
                self = v104;
                goto LABEL_64;
              }
              unint64_t v30 = (void *)v29;
              id v31 = v23;
              double v32 = v19;
              long long v33 = [v28 endDate];

              if (!v33)
              {
                double v19 = v32;
                double v23 = v31;
                self = v104;
                id v18 = v95;
                goto LABEL_64;
              }
              uint64_t v102 = v22;
              long long v34 = v99;
              if (v99)
              {
                long long v35 = [v28 startDate];
                id v36 = [v99 endDate];
                [v35 timeIntervalSinceDate:v36];
                double v38 = v37;

                if (([(MOConversationAnnotationManager *)v104 _callLikeInteraction:v99]
                   || [v99 direction] == (id)1 && !objc_msgSend(v28, "direction")
                   || ![v99 direction] && objc_msgSend(v28, "direction") == (id)1)
                  && v38 < v7)
                {
                  ++v98;
                  id v39 = v28;

                  long long v34 = v39;
                }
                double v19 = v32;
                if (v38 <= v7)
                {
                  id v99 = v34;
                }
                else
                {

                  unint64_t v98 = 0;
                  id v99 = 0;
                }
                goto LABEL_41;
              }
              if (v20)
              {
                v40 = [v28 startDate];
                uint64_t v41 = [v20 endDate];
                [v40 timeIntervalSinceDate:v41];
                double v38 = v42;

                if ([(MOConversationAnnotationManager *)v104 _callLikeInteraction:v20]
                  || [v20 direction] == (id)1 && !objc_msgSend(v28, "direction"))
                {
                  double v19 = v32;
                  if (v38 >= v7) {
                    goto LABEL_35;
                  }
                }
                else
                {
                  double v19 = v32;
                  if ([v20 direction])
                  {
LABEL_35:
                    id v99 = 0;
                    goto LABEL_41;
                  }
                  if ([v28 direction] != (id)1 || v38 >= v7)
                  {
                    id v99 = 0;
                    goto LABEL_41;
                  }
                }
                unint64_t v98 = 2;
                id v99 = v28;
                goto LABEL_41;
              }
              id v99 = 0;
              double v38 = 0.0;
              double v19 = v32;
LABEL_41:
              unint64_t v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                v57 = [v28 startDate];
                [v28 endDate];
                unint64_t v58 = v21;
                id v59 = v20;
                id v60 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136316418;
                CFStringRef v114 = "-[MOConversationAnnotationManager _calculateEventStats:]";
                __int16 v115 = 2048;
                v116 = v100;
                __int16 v117 = 2112;
                v118 = v57;
                __int16 v119 = 2112;
                double v120 = v60;
                __int16 v121 = 2048;
                double v122 = v38;
                __int16 v123 = 2048;
                unint64_t v124 = v98;
                _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%s, idx, %lu, startDate, %@, endDate, %@, interaction interval, %.1f, burstLength, %lu", buf, 0x3Eu);

                id v20 = v59;
                unint64_t v21 = v58;

                double v19 = v32;
              }

              if (v21 <= v98) {
                unint64_t v44 = v98;
              }
              else {
                unint64_t v44 = v21;
              }
              self = v104;
              uint64_t v45 = v20;
              if ([(MOConversationAnnotationManager *)v104 _callLikeInteraction:v28])
              {
                uint64_t v46 = [v28 startDate];
                if (v46
                  && (double v47 = (void *)v46,
                      [v28 endDate],
                      v48 = objc_claimAutoreleasedReturnValue(),
                      v48,
                      v47,
                      v48))
                {
                  v49 = [v28 endDate];
                  uint64_t v50 = [v28 startDate];
                  [v49 timeIntervalSinceDate:v50];
                  double v52 = v51;

                  self = v104;
                  if (v52 > v25)
                  {
                    id v53 = v28;

                    v92 = v53;
                    double v25 = v52;
                  }
                  double v26 = v26 + v52;
                  ++v93;
                  v54 = [(MOConversationAnnotationManager *)v104 _getWorkVisitEventsDuringCall:obj withCall:v28];
                  if ([v54 count]) {
                    *(void *)&double v19 = *(void *)&v32 + 1;
                  }
                  else {
                    double v19 = v32;
                  }
                  if (v52 <= v11) {
                    double v23 = v31;
                  }
                  else {
                    double v23 = v31 + 1;
                  }
                }
                else
                {
                  double v23 = v31;
                  self = v104;
                }
              }
              else
              {
                double v23 = v31;
                if ([(MOConversationAnnotationManager *)v104 _messageInteraction:v28])
                {
                  ++v102;
                  id v55 = [v28 direction];
                  uint64_t v56 = v94;
                  if (v55 == (id)1) {
                    uint64_t v56 = v94 + 1;
                  }
                  uint64_t v94 = v56;
                }
              }
              id v18 = v95;
              id v20 = v28;

              ++v100;
              unint64_t v21 = v44;
              uint64_t v22 = v102;
            }
LABEL_64:
            unint64_t v27 = (char *)v27 + 1;
          }
          while (v18 != v27);
          id v61 = [v97 countByEnumeratingWithState:&v105 objects:v139 count:16];
          id v18 = v61;
        }
        while (v61);
LABEL_70:
        v103 = v20;

        unint64_t v62 = [(MOConversationAnnotationManager *)self _outgoingMessageBurstCount:v97 bundleIdPrefix:@"net.whatsapp.WhatsApp"];
        uint64_t v101 = [(MOConversationAnnotationManager *)self _getWorkVisitEventsDuringCall:obj withCall:v92];
        BOOL v63 = [v101 count] != 0;
        long long v64 = objc_opt_new();
        long long v65 = +[NSNumber numberWithUnsignedInteger:v23];
        [v64 setObject:v65 forKey:@"callCount"];

        long long v66 = +[NSNumber numberWithDouble:v26];
        [v64 setObject:v66 forKey:@"aggregatedCallDuration"];

        long long v67 = +[NSNumber numberWithDouble:v25];
        [v64 setObject:v67 forKey:@"longestCallDuration"];

        long long v68 = +[NSNumber numberWithUnsignedInteger:v22];
        [v64 setObject:v68 forKey:@"messageCount"];

        double v69 = +[NSNumber numberWithUnsignedInteger:v94];
        [v64 setObject:v69 forKey:@"outgoingMessageCount"];

        unint64_t v70 = +[NSNumber numberWithUnsignedInteger:v21];
        [v64 setObject:v70 forKey:@"maxBurstLength"];

        long long v71 = +[NSNumber numberWithUnsignedInteger:*(void *)&v19];
        [v64 setObject:v71 forKey:@"callAtWork"];

        long long v72 = +[NSNumber numberWithUnsignedInteger:v93];
        [v64 setObject:v72 forKey:@"callCountForDailyAggregate"];

        BOOL v96 = v63;
        long long v73 = +[NSNumber numberWithUnsignedInteger:v63];
        [v64 setObject:v73 forKey:@"longCallAtWork"];

        unint64_t v74 = v62;
        long long v75 = +[NSNumber numberWithUnsignedInteger:v62];
        [v64 setObject:v75 forKey:@"outgoingMessageBurstCount"];

        double v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          unint64_t v77 = [v89 eventIdentifier];
          v86 = [v89 interactionScoredContact];
          v85 = [v86 contact];
          BOOL v78 = [v85 localizedFullName];
          uint64_t v79 = [v78 mask];
          double v80 = v19;
          int v81 = (void *)v79;
          *(_DWORD *)buf = v84;
          CFStringRef v114 = "-[MOConversationAnnotationManager _calculateEventStats:]";
          __int16 v115 = 2112;
          v116 = v77;
          __int16 v117 = 2048;
          v118 = v23;
          __int16 v119 = 2048;
          double v120 = v93;
          __int16 v121 = 2048;
          double v122 = v80;
          __int16 v123 = 2048;
          unint64_t v124 = v96;
          __int16 v125 = 2048;
          double v126 = v26;
          __int16 v127 = 2048;
          double v128 = v25;
          __int16 v129 = 2048;
          uint64_t v130 = v22;
          __int16 v131 = 2048;
          uint64_t v132 = v94;
          __int16 v133 = 2048;
          unint64_t v134 = v74;
          __int16 v135 = 2048;
          unint64_t v136 = v21;
          __int16 v137 = 2112;
          uint64_t v138 = v79;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%s, event ID, %@, call count, %lu, call count for daily agg., %lu, call at work, %lu, long call at work, %lu, aggregated call duration, %.1f, longest call duration, %.1f, message count, %lu, outgoing message count, %lu, outgoing message burst count, %lu, max burst length, %lu, contact, %@", buf, 0x84u);
        }
        self = v104;
        stats = v104->_stats;
        id v83 = [v89 eventIdentifier];
        [(NSMutableDictionary *)stats setObject:v64 forKey:v83];

        uint64_t v12 = v90 + 1;
      }
      while ((id)(v90 + 1) != v88);
      id v88 = [obj countByEnumeratingWithState:&v109 objects:v141 count:16];
    }
    while (v88);
  }
}

- (void)_buildMappingFromBaseEvents:(id)a3 toPatternEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v14 = [v13 eventIdentifier];
        uint64_t v15 = [v13 eventIdentifier];
        unint64_t v16 = [v15 UUIDString];
        [v7 setObject:v14 forKey:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v10);
  }
  id v36 = v8;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v6;
  id v17 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      id v20 = 0;
      id v37 = v18;
      do
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(obj);
        }
        unint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v20);
        uint64_t v22 = [v21 patterns];
        double v23 = [v22 objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];

        uint64_t v24 = [v7 objectForKey:v23];

        if (v24)
        {
          double v25 = [v21 patterns];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke;
          v40[3] = &unk_1002D0CE8;
          v40[4] = v21;
          [v25 enumerateKeysAndObjectsUsingBlock:v40];

          double v26 = [v21 patterns];
          unint64_t v27 = [v26 objectForKeyedSubscript:@"kEventPatternType"];
          unsigned int v28 = [v27 intValue];

          if (!v28 && v23 != 0)
          {
            unint64_t v30 = [v7 objectForKey:v23];
            id v31 = [(NSMutableDictionary *)self->_eventToPatternEventMap objectForKey:v30];

            if (!v31)
            {
              eventToPatternEventMap = self->_eventToPatternEventMap;
              long long v33 = objc_opt_new();
              [(NSMutableDictionary *)eventToPatternEventMap setObject:v33 forKey:v30];
            }
            long long v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v50 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]";
              __int16 v51 = 2112;
              double v52 = v21;
              __int16 v53 = 2112;
              v54 = v23;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s, pattern event, %@, base event identifier, %@", buf, 0x20u);
            }

            long long v35 = [(NSMutableDictionary *)self->_eventToPatternEventMap objectForKey:v30];
            [v35 addObject:v21];

            id v18 = v37;
          }
        }

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v18);
  }

  [(NSMutableDictionary *)self->_eventToPatternEventMap enumerateKeysAndObjectsUsingBlock:&__block_literal_global_282];
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [*(id *)(a1 + 32) eventIdentifier];
    int v9 = 136315906;
    id v10 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, pattern event identifier, %@, key, %@, value, %@", (uint8_t *)&v9, 0x2Au);
  }
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toPatternEvents___block_invoke_279(id a1, NSUUID *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toPatternEvents:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2048;
    NSUInteger v13 = [(NSSet *)v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, event identifier, %@, pattern event count, %lu", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_buildMappingFromBaseEvents:(id)a3 toContextEvents:(id)a4
{
  id v5 = a3;
  id v87 = a4;
  v85 = objc_opt_new();
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
  if (v6)
  {
    id v7 = v6;
    id v89 = *(id *)v113;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(id *)v113 != v89) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        __int16 v10 = objc_opt_new();
        __int16 v11 = [v9 interactions];
        __int16 v12 = [v11 firstObject];
        NSUInteger v13 = [v12 sender];
        id v14 = [v13 personId];

        if (v14)
        {
          __int16 v15 = [v9 interactions];
          id v16 = [v15 firstObject];
          id v17 = [v16 sender];
          id v18 = [v17 personId];
          [v10 addObject:v18];
        }
        uint64_t v19 = [v9 interactions];
        id v20 = [v19 firstObject];
        unint64_t v21 = [v20 recipients];
        id v22 = [v21 count];

        if (v22)
        {
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          double v23 = [v9 interactions];
          uint64_t v24 = [v23 firstObject];
          double v25 = [v24 recipients];

          id v26 = [v25 countByEnumeratingWithState:&v108 objects:v128 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v109;
            do
            {
              for (id j = 0; j != v27; id j = (char *)j + 1)
              {
                if (*(void *)v109 != v28) {
                  objc_enumerationMutation(v25);
                }
                unint64_t v30 = *(void **)(*((void *)&v108 + 1) + 8 * (void)j);
                id v31 = [v30 personId];

                if (v31)
                {
                  double v32 = [v30 personId];
                  [v10 addObject:v32];
                }
              }
              id v27 = [v25 countByEnumeratingWithState:&v108 objects:v128 count:16];
            }
            while (v27);
          }
        }
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v33 = v10;
        id v34 = [v33 countByEnumeratingWithState:&v104 objects:v127 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v105;
          do
          {
            for (k = 0; k != v35; k = (char *)k + 1)
            {
              if (*(void *)v105 != v36) {
                objc_enumerationMutation(v33);
              }
              if (v33)
              {
                uint64_t v38 = *(void *)(*((void *)&v104 + 1) + 8 * (void)k);
                id v39 = [v85 objectForKey:v38];

                if (!v39)
                {
                  v40 = objc_opt_new();
                  [v85 setObject:v40 forKey:v38];
                }
                long long v41 = [v85 objectForKey:v38];
                [v41 addObject:v9];
              }
            }
            id v35 = [v33 countByEnumeratingWithState:&v104 objects:v127 count:16];
          }
          while (v35);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
    }
    while (v7);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v77 = v87;
  long long v42 = self;
  id v80 = [v77 countByEnumeratingWithState:&v100 objects:v126 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v101;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v101 != v79) {
          objc_enumerationMutation(v77);
        }
        uint64_t v81 = v43;
        long long v44 = *(void **)(*((void *)&v100 + 1) + 8 * v43);
        long long v45 = objc_opt_new();
        if ([v44 category] == (id)9)
        {
          long long v46 = [v44 itemSenders];
          id v47 = [v46 count];

          if (v47)
          {
            long long v48 = [v44 itemSenders];
            [v45 addObjectsFromArray:v48];
          }
        }
        v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          id v50 = [v45 count];
          *(_DWORD *)buf = 136315650;
          __int16 v117 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
          __int16 v118 = 2112;
          __int16 v119 = v44;
          __int16 v120 = 2048;
          id v121 = v50;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s, contextEvent, %@, contactIdentifier count, %lu", buf, 0x20u);
        }

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v82 = v45;
        id v84 = [v82 countByEnumeratingWithState:&v96 objects:v125 count:16];
        if (v84)
        {
          uint64_t v83 = *(void *)v97;
          do
          {
            uint64_t v51 = 0;
            do
            {
              if (*(void *)v97 != v83) {
                objc_enumerationMutation(v82);
              }
              uint64_t v86 = v51;
              double v52 = *(void **)(*((void *)&v96 + 1) + 8 * v51);
              __int16 v53 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                long long v75 = [v85 objectForKey:v52];
                id v76 = [v75 count];
                *(_DWORD *)buf = 136315650;
                __int16 v117 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
                __int16 v118 = 2112;
                __int16 v119 = v52;
                __int16 v120 = 2048;
                id v121 = v76;
                _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%s, contactIdentifier, %@, base event count, %lu", buf, 0x20u);
              }
              long long v94 = 0u;
              long long v95 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              id v88 = v52;
              id v90 = [v85 objectForKey:v52];
              id v54 = [v90 countByEnumeratingWithState:&v92 objects:v124 count:16];
              if (v54)
              {
                id v55 = v54;
                uint64_t v56 = *(void *)v93;
                do
                {
                  for (m = 0; m != v55; m = (char *)m + 1)
                  {
                    if (*(void *)v93 != v56) {
                      objc_enumerationMutation(v90);
                    }
                    unint64_t v58 = *(void **)(*((void *)&v92 + 1) + 8 * (void)m);
                    id v59 = [v58 startDate];
                    id v60 = [v59 startOfDay];
                    id v61 = [v44 startDate];
                    unint64_t v62 = [v61 startOfDay];
                    unsigned int v63 = [v60 isEqualToDate:v62];

                    if (v63)
                    {
                      long long v64 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315906;
                        __int16 v117 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]";
                        __int16 v118 = 2112;
                        __int16 v119 = v88;
                        __int16 v120 = 2112;
                        id v121 = v58;
                        __int16 v122 = 2112;
                        __int16 v123 = v44;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%s, contactIdentifier, %@, matching base event, %@, context event, %@", buf, 0x2Au);
                      }

                      long long v65 = self;
                      eventToContextEventMap = self->_eventToContextEventMap;
                      long long v67 = [v58 eventIdentifier];
                      long long v68 = [(NSMutableDictionary *)eventToContextEventMap objectForKey:v67];

                      if (!v68)
                      {
                        double v69 = self->_eventToContextEventMap;
                        unint64_t v70 = objc_opt_new();
                        long long v71 = [v58 eventIdentifier];
                        [(NSMutableDictionary *)v69 setObject:v70 forKey:v71];

                        long long v65 = self;
                      }
                      long long v72 = v65->_eventToContextEventMap;
                      long long v73 = [v58 eventIdentifier];
                      unint64_t v74 = [(NSMutableDictionary *)v72 objectForKey:v73];
                      [v74 addObject:v44];
                    }
                  }
                  id v55 = [v90 countByEnumeratingWithState:&v92 objects:v124 count:16];
                }
                while (v55);
              }

              uint64_t v51 = v86 + 1;
              long long v42 = self;
            }
            while ((id)(v86 + 1) != v84);
            id v84 = [v82 countByEnumeratingWithState:&v96 objects:v125 count:16];
          }
          while (v84);
        }

        uint64_t v43 = v81 + 1;
      }
      while ((id)(v81 + 1) != v80);
      id v80 = [v77 countByEnumeratingWithState:&v100 objects:v126 count:16];
    }
    while (v80);
  }

  [(NSMutableDictionary *)v42->_eventToContextEventMap enumerateKeysAndObjectsUsingBlock:&__block_literal_global_284];
}

void __79__MOConversationAnnotationManager__buildMappingFromBaseEvents_toContextEvents___block_invoke(id a1, NSUUID *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    int v9 = "-[MOConversationAnnotationManager _buildMappingFromBaseEvents:toContextEvents:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2048;
    NSUInteger v13 = [(NSSet *)v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, event identifier, %@, context event count, %lu", (uint8_t *)&v8, 0x20u);
  }
}

- (id)_actionForBundle:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[MOConversationAnnotationManager _actionForBundle:type:](a4, v6);
      }

      goto LABEL_5;
    case 4uLL:
      CFStringRef v7 = @"call";
      goto LABEL_28;
    case 5uLL:
    case 7uLL:
      CFStringRef v7 = @"chat";
      goto LABEL_28;
    case 6uLL:
      id v31 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = [v5 events];
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (!v8) {
        goto LABEL_24;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v34;
      break;
    default:
LABEL_5:
      CFStringRef v7 = 0;
      goto LABEL_28;
  }
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(obj);
      }
      __int16 v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      NSUInteger v13 = [v12 patterns];
      id v14 = [v13 objectForKeyedSubscript:@"kEventPatternType"];
      if ([v14 intValue])
      {
      }
      else
      {
        __int16 v15 = [v12 patterns];
        id v16 = [v15 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
        unsigned int v17 = [v16 intValue];

        if (v17 == 2)
        {
          id v18 = v31;
          uint64_t v19 = &off_1002F7598;
LABEL_21:
          [v18 addObject:v19];
          continue;
        }
      }
      id v20 = [v12 patterns];
      unint64_t v21 = [v20 objectForKeyedSubscript:@"kEventPatternType"];
      if ([v21 intValue])
      {

        continue;
      }
      id v22 = [v12 patterns];
      double v23 = [v22 objectForKeyedSubscript:@"kEventPatternAnomalyFeatureType"];
      unsigned int v24 = [v23 intValue];

      if (v24 == 1)
      {
        id v18 = v31;
        uint64_t v19 = &off_1002F7580;
        goto LABEL_21;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  }
  while (v9);
LABEL_24:

  if ([v31 containsObject:&off_1002F7580]) {
    CFStringRef v7 = @"call";
  }
  else {
    CFStringRef v7 = @"chat";
  }

LABEL_28:
  double v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v38 = "-[MOConversationAnnotationManager _actionForBundle:type:]";
    __int16 v39 = 2112;
    id v40 = v5;
    __int16 v41 = 2112;
    CFStringRef v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s, bundle, %@, action name, %@", buf, 0x20u);
  }

  if (v7)
  {
    id v26 = [[MOAction alloc] initWithActionName:v7 actionType:1 actionSubtype:4];
    id v27 = [v5 events];
    uint64_t v28 = [v27 firstObject];
    uint64_t v29 = [v28 eventIdentifier];
    [(MOAction *)v26 setSourceEventIdentifier:v29];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_eventToContextEventMap, 0);
  objc_storeStrong((id *)&self->_eventToPatternEventMap, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_messageInteractionMechanisms, 0);

  objc_storeStrong((id *)&self->_callLikeInteractionMechanisms, 0);
}

void __50__MOConversationAnnotationManager__getBaseEvents___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  id v4 = "-[MOConversationAnnotationManager _getBaseEvents:]_block_invoke";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, idx, %lu, interaction, %@", (uint8_t *)&v3, 0x20u);
}

- (void)_annotateEvents:(void *)a1 significantContact:(uint64_t)a2 type:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [a1 firstObject];
  int v6 = 136315650;
  __int16 v7 = "-[MOConversationAnnotationManager _annotateEvents:significantContact:type:]";
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s, no contact name, event, %@, contact, %@", (uint8_t *)&v6, 0x20u);
}

- (void)_annotateEvents:(uint8_t *)buf significantContact:(unsigned char *)a2 type:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "contact identifier is nil, not creating the MOPerson!", buf, 2u);
}

- (void)_actionForBundle:(uint64_t)a1 type:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[MOConversationAnnotationManager _actionForBundle:type:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s, deprecated annotation type, %lu", (uint8_t *)&v2, 0x16u);
}

@end