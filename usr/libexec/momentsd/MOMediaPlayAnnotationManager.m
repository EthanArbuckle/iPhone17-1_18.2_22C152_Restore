@interface MOMediaPlayAnnotationManager
+ (id)renderTypeFrom:(unint64_t)a3 isFirstPartyApp:(BOOL)a4;
- (MOMediaPlayAnnotationManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_annotateEvents:(id)a3 isFirstParty:(BOOL)a4;
- (id)_createBundlesFromEvents:(id)a3;
- (id)_getBaseEvents:(id)a3;
- (id)_getEventBasedOnTime:(id)a3 category:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6;
- (id)_getEventsBasedOnTypes:(id)a3 isFirstPartyApp:(unsigned __int8)a4;
- (id)_groupBaseEvents:(id)a3 category:(unint64_t)a4;
- (id)_groupBaseEventsByDay:(id)a3 category:(unint64_t)a4;
- (id)_groupEventsByApps:(id)a3;
- (id)_sortEventGroupsBasedOnRepetions:(id)a3;
- (id)getMediaOnRepeatLabelHeaderFromMediaType:(unint64_t)a3;
- (unsigned)_isFirstPartyApp:(id)a3;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
@end

@implementation MOMediaPlayAnnotationManager

- (MOMediaPlayAnnotationManager)initWithUniverse:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MOMediaPlayAnnotationManager;
  v3 = [(MOAnnotationManager *)&v8 initWithUniverse:a3];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("MOConversationAnnotationManager", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MOMediaPlayAnnotationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOMediaPlayAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
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

id __86__MOMediaPlayAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnnotationWithEvents:*(void *)(a1 + 40) withPatternEvents:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  v7 = (void (**)(id, void *, void))a5;
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = [(MOMediaPlayAnnotationManager *)self _createBundlesFromEvents:v8];

  [v9 addObjectsFromArray:v10];
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    id v13 = "-[MOMediaPlayAnnotationManager _performAnnotationWithEvents:withPatternEvents:handler:]";
    __int16 v14 = 2048;
    id v15 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s, annotated media played bundle count, %lu", (uint8_t *)&v12, 0x16u);
  }

  v7[2](v7, v9, 0);
}

- (id)_createBundlesFromEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    dispatch_queue_t v5 = objc_opt_new();
    id v22 = v4;
    v6 = [(MOMediaPlayAnnotationManager *)self _groupBaseEventsByDay:v4 category:4];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v6 allKeys];
    id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v35;
      uint64_t v23 = *(void *)v35;
      v24 = v6;
      do
      {
        id v10 = 0;
        id v25 = v8;
        do
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * (void)v10)];
          int v12 = v11;
          if (v11 && [v11 count])
          {
            v29 = [(MOMediaPlayAnnotationManager *)self _getEventsBasedOnTypes:v12 isFirstPartyApp:1];
            id v13 = -[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:](self, "_annotateEvents:isFirstParty:");
            if (v13) {
              [v5 addObject:v13];
            }
            v28 = [(MOMediaPlayAnnotationManager *)self _getEventsBasedOnTypes:v12 isFirstPartyApp:0];
            __int16 v14 = -[MOMediaPlayAnnotationManager _groupEventsByApps:](self, "_groupEventsByApps:");
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v27 = v14;
            id v15 = [v14 allValues];
            id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v31;
              do
              {
                v19 = 0;
                v20 = v13;
                do
                {
                  if (*(void *)v31 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v13 = [(MOMediaPlayAnnotationManager *)self _annotateEvents:*(void *)(*((void *)&v30 + 1) + 8 * (void)v19) isFirstParty:0];

                  if (v13) {
                    [v5 addObject:v13];
                  }
                  v19 = (char *)v19 + 1;
                  v20 = v13;
                }
                while (v17 != v19);
                id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v17);
            }

            uint64_t v9 = v23;
            v6 = v24;
            id v8 = v25;
          }

          id v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v8);
    }

    id v4 = v22;
  }
  else
  {
    dispatch_queue_t v5 = 0;
  }

  return v5;
}

- (id)_groupBaseEventsByDay:(id)a3 category:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v5 count])
  {
    long long v32 = v6;
    id v7 = +[NSCalendar currentCalendar];
    id v8 = [v5 getDurationOfMOEventArray];
    uint64_t v9 = [v8 startDate];
    uint64_t v10 = [v7 components:28 fromDate:v9];

    long long v31 = (void *)v10;
    v11 = [v7 dateFromComponents:v10];
    int v12 = [v7 dateByAddingUnit:16 value:1 toDate:v11 options:0];
    id v13 = objc_alloc_init((Class)NSDateFormatter);
    [v13 setCalendar:v7];
    long long v33 = v13;
    [v13 setDateFormat:@"yyyy-MM-dd"];
    __int16 v14 = [v8 endDate];
    id v15 = [v11 compare:v14];

    if (v15 == (id)-1)
    {
      *(void *)&long long v16 = 136315650;
      long long v30 = v16;
      do
      {
        v20 = -[MOMediaPlayAnnotationManager _getEventBasedOnTime:category:startTime:endTime:](self, "_getEventBasedOnTime:category:startTime:endTime:", v5, a4, v11, v12, v30);
        v21 = v20;
        if (v20 && [v20 count])
        {
          id v22 = [v21 firstObject];
          uint64_t v23 = [v22 startDate];
          v24 = [v33 stringFromDate:v23];

          if (v24)
          {
            [v32 setObject:v21 forKey:v24];
            id v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v26 = [v21 count];
              *(_DWORD *)buf = v30;
              long long v36 = "-[MOMediaPlayAnnotationManager _groupBaseEventsByDay:category:]";
              __int16 v37 = 2112;
              v38 = v24;
              __int16 v39 = 2048;
              id v40 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s, bundle annotation with day, %@, event count, %lu", buf, 0x20u);
            }
          }
        }
        uint64_t v18 = [v7 dateByAddingUnit:16 value:1 toDate:v11 options:0];

        id v17 = [v7 dateByAddingUnit:16 value:1 toDate:v12 options:0];

        v27 = [v8 endDate];
        id v28 = [v18 compare:v27];

        v11 = v18;
        int v12 = v17;
      }
      while (v28 == (id)-1);
    }
    else
    {
      id v17 = v12;
      uint64_t v18 = v11;
    }
    id v6 = v32;
    id v19 = v32;
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "annotated media events are empty.", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

- (id)_getEventBasedOnTime:(id)a3 category:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v21 = (id)objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v17 = [v16 startDate:v21];
        if (([v17 isAfterDate:v9] & 1) == 0) {
          goto LABEL_11;
        }
        uint64_t v18 = [v16 startDate];
        if (([v18 isBeforeDate:v10] & 1) == 0)
        {

LABEL_11:
          continue;
        }
        id v19 = [v16 category];

        if (v19 == (id)a4) {
          [v21 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  return v21;
}

- (id)_sortEventGroupsBasedOnRepetions:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke;
    v7[3] = &unk_1002CAA58;
    id v8 = (id)objc_opt_new();
    id v4 = v8;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
    id v5 = [v4 keysSortedByValueUsingComparator:&__block_literal_global_5];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_2;
  v13[3] = &unk_1002CAA30;
  v13[4] = &v14;
  [v6 enumerateObjectsUsingBlock:v13];
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = +[MOMediaPlaySession redactString:v5];
    uint64_t v9 = v15[3];
    *(_DWORD *)buf = 136315650;
    id v19 = "-[MOMediaPlayAnnotationManager _sortEventGroupsBasedOnRepetions:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s, media title, %@, repetition count, %lu", buf, 0x20u);
  }
  id v10 = *(void **)(a1 + 32);
  id v11 = objc_alloc((Class)NSNumber);
  id v12 = [v11 initWithUnsignedLong:v15[3]];
  [v10 setObject:v12 forKey:v5];

  _Block_object_dispose(&v14, 8);
}

void __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaRepetitions];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 unsignedLongValue];
}

int64_t __65__MOMediaPlayAnnotationManager__sortEventGroupsBasedOnRepetions___block_invoke_145(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

- (id)_getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 3];
  v15[0] = v4;
  id v5 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 4];
  v15[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v15 count:2];
  id v7 = +[NSCompoundPredicate orPredicateWithSubpredicates:v6];

  id v8 = [v3 filteredArrayUsingPredicate:v7];

  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[MOMediaPlayAnnotationManager _getBaseEvents:]";
    __int16 v13 = 2048;
    id v14 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s, filtered event count, %lu", buf, 0x16u);
  }

  [v8 enumerateObjectsUsingBlock:&__block_literal_global_157];

  return v8;
}

void __47__MOMediaPlayAnnotationManager__getBaseEvents___block_invoke(id a1, MOEvent *a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    id v8 = "-[MOMediaPlayAnnotationManager _getBaseEvents:]_block_invoke";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s, idx, %lu, filtered event, %@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_groupBaseEvents:(id)a3 category:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v11 category] == (id)a4)
        {
          id v12 = [v11 mediaTitle];
          if ([v12 length])
          {
            __int16 v13 = [v6 objectForKey:v12];

            if (!v13)
            {
              id v14 = objc_opt_new();
              [v6 setObject:v14 forKey:v12];
            }
            id v15 = [v6 objectForKey:v12];
            [v15 addObject:v11];
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v8);
  }

  uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v6 count];
    *(_DWORD *)buf = 136315650;
    v41 = "-[MOMediaPlayAnnotationManager _groupBaseEvents:category:]";
    __int16 v42 = 2048;
    unint64_t v43 = a4;
    __int16 v44 = 2048;
    id v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s, category, %lu, event group count, %lu", buf, 0x20u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          long long v26 = +[MOMediaPlaySession redactString:v23];
          v27 = [v18 objectForKeyedSubscript:v23];
          id v28 = [v27 count];
          *(_DWORD *)buf = 136315650;
          v41 = "-[MOMediaPlayAnnotationManager _groupBaseEvents:category:]";
          __int16 v42 = 2112;
          unint64_t v43 = (unint64_t)v26;
          __int16 v44 = 2048;
          id v45 = v28;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s, media title, %@, event count, %lu", buf, 0x20u);
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }

  return v18;
}

+ (id)renderTypeFrom:(unint64_t)a3 isFirstPartyApp:(BOOL)a4
{
  id v4 = MOMediaPlayMetaDataKeyPlayerMediaTypeSong;
  id v5 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastEpisode;
  if (a3 != 2) {
    id v5 = MOMediaPlayMetaDataKeyPlayerMediaTypeUnknown;
  }
  if (a3 != 1) {
    id v4 = v5;
  }
  if (!a4) {
    id v4 = MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMedia;
  }
  return *v4;
}

- (id)_annotateEvents:(id)a3 isFirstParty:(BOOL)a4
{
  BOOL v108 = a4;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"endDate" ascending:0];
    v173 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v173 count:1];
    id v8 = v5;
    uint64_t v9 = (void *)v7;
    v96 = v8;
    unint64_t v10 = [v8 sortedArrayUsingDescriptors:v7];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v155 objects:v172 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v156;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v156 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v155 + 1) + 8 * i);
          id v17 = [v16 mediaEvent];
          id v18 = [v17 mediaTitle];

          if (v18) {
            [v11 addObject:v16];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v155 objects:v172 count:16];
      }
      while (v13);
    }

    if ([v11 count])
    {
      id v19 = [MOEventBundle alloc];
      id v20 = [objc_alloc((Class)NSSet) initWithArray:v11];
      uint64_t v21 = [(MOEventBundle *)v19 initWithEventSet:v20 filtered:0];

      [(MOEventBundle *)v21 setInterfaceType:5];
      [(MOEventBundle *)v21 setBundleSuperType:4];
      [(MOEventBundle *)v21 setBundleSubType:406];
      __int16 v22 = [(MOEventBundle *)v21 endDate];
      uint64_t v23 = [(MOAnnotationManager *)self timeZoneManager];
      long long v24 = +[MOTime timeForDate:v22 timeZoneManager:v23];
      [(MOEventBundle *)v21 setTime:v24];

      long long v25 = [v11 firstObject];
      long long v26 = [v11 firstObject];
      id v27 = [v26 category];

      if (v27 == (id)4)
      {
        id v28 = [[MOAction alloc] initWithActionName:@"played_media_sessions" actionType:1 actionSubtype:6];
        [(MOEventBundle *)v21 setAction:v28];

        v29 = [obj firstObject];
        long long v30 = [v29 eventIdentifier];
        long long v31 = [(MOEventBundle *)v21 action];
        [v31 setSourceEventIdentifier:v30];

        long long v32 = [v25 mediaAlbum];

        long long v33 = [(MOEventBundle *)v21 action];
        long long v34 = [v33 actionName];
        v106 = v25;
        if (v32)
        {
          long long v35 = [v25 mediaAlbum];
          long long v36 = [(MOEventBundle *)v21 resources];
          long long v37 = [v36 firstObject];
          long long v38 = [v37 name];
          __int16 v39 = +[NSString stringWithFormat:@"%@: %@ - %@", v34, v35, v38];
          [(MOEventBundle *)v21 setPromptLanguage:v39];
        }
        else
        {
          long long v35 = [(MOEventBundle *)v21 resources];
          long long v36 = [v35 firstObject];
          long long v37 = [v36 name];
          long long v38 = +[NSString stringWithFormat:@"%@: %@", v34, v37];
          [(MOEventBundle *)v21 setPromptLanguage:v38];
        }

        id v107 = objc_alloc_init((Class)NSMutableArray);
        long long v151 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        v95 = v21;
        id v97 = [(MOEventBundle *)v21 events];
        long long v25 = v106;
        id v109 = [v97 countByEnumeratingWithState:&v151 objects:v171 count:16];
        if (v109)
        {
          uint64_t v104 = *(void *)v152;
          id v105 = v11;
          do
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v152 != v104) {
                objc_enumerationMutation(v97);
              }
              __int16 v42 = *(void **)(*((void *)&v151 + 1) + 8 * v41);
              unint64_t v43 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                v85 = (MOEventBundle *)[v96 count];
                v86 = [v42 mediaEvent];
                v87 = [v86 mediaTitle];
                v88 = +[MOMediaPlaySession redactString:v87];
                v89 = [v42 startDate];
                v90 = [v42 endDate];
                *(_DWORD *)buf = 136316162;
                v162 = "-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:]";
                __int16 v163 = 2048;
                v164 = v85;
                __int16 v165 = 2112;
                id v166 = v88;
                __int16 v167 = 2112;
                v168 = v89;
                __int16 v169 = 2112;
                v170 = v90;
                _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%s, media annotation event count, %lu, media title, %@, start, %@, end, %@", buf, 0x34u);
              }
              __int16 v44 = [v42 mediaEvent];
              id v45 = [v44 mediaType];
              v46 = [v42 mediaEvent];
              v47 = [v46 mediaPlayerBundleId];
              v48 = +[MOMediaPlaySession getMOPlaySessionMediaType:v45 bundleId:v47];
              unsigned int v49 = [v48 unsignedIntValue];

              v159[0] = @"MOMediaPlayMetaDataKeyPlayerTitle";
              v50 = [v42 mediaEvent];
              uint64_t v51 = [v50 mediaTitle];
              if (v51)
              {
                v126 = [v42 mediaEvent];
                v122 = [v126 mediaTitle];
                CFStringRef v52 = v122;
              }
              else
              {
                CFStringRef v52 = &stru_1002D2AC8;
              }
              v160[0] = v52;
              v159[1] = @"MOMediaPlayMetaDataKeyPlayerArtist";
              v53 = [v42 mediaEvent];
              uint64_t v54 = [v53 mediaArtist];
              if (v54)
              {
                v125 = [v42 mediaEvent];
                v120 = [v125 mediaArtist];
                CFStringRef v55 = v120;
              }
              else
              {
                CFStringRef v55 = &stru_1002D2AC8;
              }
              v160[1] = v55;
              v159[2] = @"MOMediaPlayMetaDataKeyPlayerTrackID";
              v56 = [v42 mediaEvent];
              uint64_t v57 = [v56 mediaProductId];
              if (v57)
              {
                v124 = [v42 mediaEvent];
                v118 = [v124 mediaProductId];
                CFStringRef v58 = v118;
              }
              else
              {
                CFStringRef v58 = &stru_1002D2AC8;
              }
              v160[2] = v58;
              v159[3] = @"MOMediaPlayMetaDataKeyPlayerAlbumName";
              v143 = [v42 mediaEvent];
              v142 = [v143 mediaAlbum];
              if (v142)
              {
                v123 = [v42 mediaEvent];
                v116 = [v123 mediaAlbum];
                CFStringRef v59 = v116;
              }
              else
              {
                CFStringRef v59 = &stru_1002D2AC8;
              }
              v160[3] = v59;
              v159[4] = @"MOMediaPlayMetaDataKeyPlayerBundleID";
              v141 = [v42 mediaEvent];
              v140 = [v141 mediaPlayerBundleId];
              v148 = (void *)v51;
              v146 = (void *)v54;
              v144 = (void *)v57;
              if (v140)
              {
                v121 = [v42 mediaEvent];
                v115 = [v121 mediaPlayerBundleId];
                CFStringRef v60 = v115;
              }
              else
              {
                CFStringRef v60 = &stru_1002D2AC8;
              }
              v160[4] = v60;
              v159[5] = @"MOMediaPlayMetaDataKeyPlayerDuration";
              v139 = [v42 mediaEvent];
              v138 = [v139 mediaPlaySessions];
              v137 = [v138 firstObject];
              uint64_t v61 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v137 duration]);
              v160[5] = v61;
              v159[6] = @"MOMediaPlayMetaDataKeyPlayerSumPlaytime";
              v135 = [v42 mediaEvent];
              v134 = [v135 mediaSumTimePlayed];
              v160[6] = v134;
              v159[7] = @"media_type";
              uint64_t v62 = +[NSNumber numberWithUnsignedInteger:v49];
              v160[7] = v62;
              v159[8] = @"MOMediaPlayMetaDataKeyPlayerFirstPartyRatio";
              v132 = [v42 mediaEvent];
              v63 = [v132 mediaFirstPartyTimePlayedRatio];
              v145 = v56;
              if (v63)
              {
                v119 = [v42 mediaEvent];
                v114 = [v119 mediaFirstPartyTimePlayedRatio];
                v64 = v114;
              }
              else
              {
                v64 = &off_1002F49B8;
              }
              v160[8] = v64;
              v159[9] = @"MOMediaPlayMetaDataKeyPlayerMediaTypeKey";
              uint64_t v65 = +[MOMediaPlayAnnotationManager renderTypeFrom:v49 isFirstPartyApp:v108];
              v160[9] = v65;
              v159[10] = @"media_album";
              v129 = [v42 mediaEvent];
              v66 = [v129 mediaAlbum];
              uint64_t v150 = v41;
              v149 = v50;
              v147 = v53;
              v136 = (void *)v61;
              v133 = (void *)v62;
              v130 = (void *)v65;
              if (!v66) {
                goto LABEL_49;
              }
              v117 = [v42 mediaEvent];
              v127 = [v117 mediaTitle];
              if (!v127)
              {
                v127 = 0;
LABEL_49:
                int v68 = 0;
                int v69 = 0;
                goto LABEL_51;
              }
              v103 = [v42 mediaEvent];
              v67 = [v103 mediaAlbum];
              v101 = [v42 mediaEvent];
              [v101 mediaTitle];
              v100 = v102 = v67;
              if (objc_msgSend(v67, "rangeOfString:") == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v99 = [v42 mediaEvent];
                [v99 mediaAlbum];
                int v68 = 1;
                int v69 = 1;
                v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
                CFStringRef v70 = v98;
                goto LABEL_52;
              }
              int v69 = 0;
              int v68 = 1;
LABEL_51:
              CFStringRef v70 = &stru_1002D2AC8;
LABEL_52:
              v160[10] = v70;
              v159[11] = @"MOMediaPlayMetaDataKeyPlayerBgColor";
              v71 = [v42 mediaEvent];
              v72 = [v71 mediaPlaySessions];
              v73 = [v72 firstObject];
              v74 = [v73 bgColor];
              if (v74)
              {
                v113 = [v42 mediaEvent];
                v112 = [v113 mediaPlaySessions];
                v111 = [v112 firstObject];
                v110 = [v111 bgColor];
                CFStringRef v75 = v110;
              }
              else
              {
                CFStringRef v75 = &stru_1002D2AC8;
              }
              v160[11] = v75;
              v76 = +[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:12];
              id v131 = [v76 mutableCopy];

              if (v74)
              {
              }
              if (v69)
              {
              }
              id v11 = v105;
              if (v68)
              {
              }
              if (v66)
              {
              }
              long long v25 = v106;
              if (v63)
              {
              }
              if (v140)
              {
              }
              if (v142)
              {
              }
              if (v144)
              {
              }
              if (v146)
              {
              }
              if (v148)
              {
              }
              v77 = [v42 startDate];

              if (v77)
              {
                v78 = [v42 startDate];
                [v78 timeIntervalSinceReferenceDate];
                v79 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                [v131 setObject:v79 forKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerStartDate"];
              }
              v80 = [MOResource alloc];
              v81 = [v42 mediaEvent];
              v82 = [v81 mediaTitle];
              v83 = [(MOResource *)v80 initWithName:v82 type:3 dict:v131 value:0.0];

              v84 = [v42 eventIdentifier];
              [(MOResource *)v83 setSourceEventIdentifier:v84];

              [v107 addObject:v83];
              uint64_t v41 = v150 + 1;
            }
            while (v109 != (id)(v150 + 1));
            id v109 = [v97 countByEnumeratingWithState:&v151 objects:v171 count:16];
          }
          while (v109);
        }

        uint64_t v21 = v95;
        [(MOEventBundle *)v95 setResources:v107];
        v91 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        id v5 = v96;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          v92 = [v96 firstObject];
          id v93 = [v92 category];
          *(_DWORD *)buf = 136315650;
          v162 = "-[MOMediaPlayAnnotationManager _annotateEvents:isFirstParty:]";
          __int16 v163 = 2112;
          v164 = v95;
          __int16 v165 = 2048;
          id v166 = v93;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, %lu", buf, 0x20u);
        }
        id v40 = v95;
      }
      else
      {
        id v40 = 0;
        id v5 = v96;
      }
    }
    else
    {
      id v40 = 0;
      id v5 = v96;
    }
  }
  else
  {
    id v40 = 0;
  }

  return v40;
}

- (id)_groupEventsByApps:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 mediaEvent:v17];
        id v12 = [v11 mediaPlayerBundleId];

        if (v12)
        {
          id v13 = [v4 objectForKey:v12];

          if (v13)
          {
            uint64_t v14 = [v4 objectForKey:v12];
          }
          else
          {
            uint64_t v14 = objc_opt_new();
          }
          id v15 = v14;
          [v14 addObject:v10];
          [v4 setObject:v15 forKey:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_getEventsBasedOnTypes:(id)a3 isFirstPartyApp:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[MOMediaPlayAnnotationManager _isFirstPartyApp:](self, "_isFirstPartyApp:", v13, (void)v15) == v4) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (unsigned)_isFirstPartyApp:(id)a3
{
  id v3 = [a3 mediaEvent];
  int v4 = [v3 mediaPlayerBundleId];

  unsigned __int8 v5 = v4 && ([v4 hasPrefix:@"com.apple."] & 1) != 0;
  return v5;
}

- (id)getMediaOnRepeatLabelHeaderFromMediaType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"media_on_repeat";
  }
  else {
    return *(&off_1002CAAF8 + a3 - 1);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end