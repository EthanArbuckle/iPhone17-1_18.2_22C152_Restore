@interface MOEvergreenAnnotationManager
+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3;
+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3;
+ (void)replacePromptIndicesOfEvergreen:(id)a3 isTah:(BOOL)a4;
- (MOEvergreenAnnotationManager)initWithUniverse:(id)a3;
- (NSDate)referenceDate;
- (OS_dispatch_queue)queue;
- (id)shuffledIndexesWithSize:(unint64_t)a3;
- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6;
- (void)_performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6;
- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5;
- (void)performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6;
@end

@implementation MOEvergreenAnnotationManager

- (MOEvergreenAnnotationManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v18.receiver = self;
  v18.super_class = (Class)MOEvergreenAnnotationManager;
  v6 = [(MOEvergreenAnnotationManager *)&v18 init];
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

    id v13 = objc_alloc_init((Class)NSDateComponents);
    [v13 setHour:3];
    [v13 setDay:1];
    [v13 setMonth:1];
    [v13 setYear:2023];
    v14 = +[NSCalendar currentCalendar];
    uint64_t v15 = [v14 dateFromComponents:v13];
    referenceDate = v6->_referenceDate;
    v6->_referenceDate = (NSDate *)v15;
  }
  return v6;
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(MOEvergreenAnnotationManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __86__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke;
  v15[3] = &unk_1002C9A78;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __86__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_handler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSDateInterval);
  v3 = [*(id *)(a1 + 32) firstObject];
  v4 = [v3 startDate];
  id v5 = [*(id *)(a1 + 32) lastObject];
  v6 = [v5 endDate];
  id v7 = [v2 initWithStartDate:v4 endDate:v6];

  [*(id *)(a1 + 40) _performAnnotationWithEvents:*(void *)(a1 + 32) withPatternEvents:*(void *)(a1 + 48) dateInterval:v7 handler:*(void *)(a1 + 56)];
}

- (void)performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MOEvergreenAnnotationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __99__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_dateInterval_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

id __99__MOEvergreenAnnotationManager_performAnnotationWithEvents_withPatternEvents_dateInterval_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnnotationWithEvents:*(void *)(a1 + 40) withPatternEvents:*(void *)(a1 + 48) dateInterval:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

- (void)_performAnnotationWithEvents:(id)a3 withPatternEvents:(id)a4 dateInterval:(id)a5 handler:(id)a6
{
  id v7 = a6;
  id v8 = +[NSDate date];
  [v8 timeIntervalSinceReferenceDate];
  unint64_t v10 = (unint64_t)(v9 / 86400.0);

  id v11 = +[NSDate date];
  id v13 = [v11 dateByAddingTimeInterval:-3600.0];

  id v12 = [v13 dateByAddingTimeInterval:3600.0];
  [(MOEvergreenAnnotationManager *)self _performAnnotationWithSeed:v10 startDate:v13 endDate:v12 handler:v7];
}

- (void)performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MOEvergreenAnnotationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __84__MOEvergreenAnnotationManager_performAnnotationWithSeed_startDate_endDate_handler___block_invoke;
  block[3] = &unk_1002CABE8;
  id v20 = v12;
  unint64_t v21 = a3;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

id __84__MOEvergreenAnnotationManager_performAnnotationWithSeed_startDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performAnnotationWithSeed:*(void *)(a1 + 64) startDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_performAnnotationWithSeed:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 handler:(id)a6
{
  id v37 = a4;
  id v36 = a5;
  v31 = (void (**)(id, id, void))a6;
  v58[0] = @"WISDOM";
  v58[1] = @"GRATITUDE";
  v59[0] = &off_1002F6218;
  v59[1] = &off_1002F6230;
  v58[2] = @"KINDNESS";
  v58[3] = @"PURPOSE";
  v59[2] = &off_1002F6248;
  v59[3] = &off_1002F6260;
  v58[4] = @"RESILIENCE";
  v58[5] = @"CREATIVITY";
  v59[4] = &off_1002F6278;
  v59[5] = &off_1002F6290;
  id v8 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:6];
  v35 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v8;
  id v38 = [obj countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v38)
  {
    uint64_t v33 = *(void *)v41;
    unint64_t v9 = 5 * a3;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v12 = [obj objectForKey:v11];
        unint64_t v13 = [v12 unsignedIntValue];

        id v14 = [(MOEvergreenAnnotationManager *)self shuffledIndexesWithSize:v13];
        id v15 = objc_opt_new();
        uint64_t v16 = 0;
        uint64_t v17 = 5;
        do
        {
          id v18 = [v14 objectAtIndex:(v9 % v13 + v16) % v13];
          [v15 addObject:v18];

          ++v16;
          --v17;
        }
        while (v17);
        id v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v46 = "-[MOEvergreenAnnotationManager _performAnnotationWithSeed:startDate:endDate:handler:]";
          __int16 v47 = 2112;
          uint64_t v48 = v11;
          __int16 v49 = 2048;
          unint64_t v50 = v13;
          __int16 v51 = 2048;
          unint64_t v52 = v9 % v13;
          __int16 v53 = 2112;
          v54 = v15;
          __int16 v55 = 2048;
          unint64_t v56 = a3;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s, Evergreen Context, build a bundle, type, %@, promptCount, %lu, first index, %lu, indexes, %@, seed, %lu", buf, 0x3Eu);
        }

        id v20 = [MOResource alloc];
        id v21 = [v15 copy];
        id v22 = [(MOResource *)v20 initWithEvergreenTypeName:v11 promptIndexes:v21];

        id v23 = [MOEventBundle alloc];
        v24 = +[NSUUID UUID];
        v25 = +[NSDate date];
        v26 = [(MOEventBundle *)v23 initWithBundleIdentifier:v24 creationDate:v25];

        [(MOEventBundle *)v26 setInterfaceType:11];
        [(MOEventBundle *)v26 setBundleSuperType:7];
        unint64_t v27 = [(MOResource *)v22 evergreenType] - 1;
        if (v27 <= 5) {
          [(MOEventBundle *)v26 setBundleSubType:qword_1002BB1D8[v27]];
        }
        v44 = v22;
        v28 = +[NSArray arrayWithObjects:&v44 count:1];
        [(MOEventBundle *)v26 setResources:v28];

        [(MOEventBundle *)v26 setPromptLanguage:v11];
        [(MOEventBundle *)v26 setStartDate:v37];
        [(MOEventBundle *)v26 setEndDate:v36];
        v29 = [v36 dateByAddingTimeInterval:*(double *)&kMOEvergreenExpirationInterval];
        [(MOEventBundle *)v26 setExpirationDate:v29];

        [v35 addObject:v26];
      }
      id v38 = [obj countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v38);
  }

  id v30 = [v35 copy];
  v31[2](v31, v30, 0);
}

- (id)shuffledIndexesWithSize:(unint64_t)a3
{
  if (a3)
  {
    v4 = objc_opt_new();
    uint64_t v5 = 0;
    do
    {
      v6 = +[NSNumber numberWithUnsignedInt:v5];
      [v4 addObject:v6];

      ++v5;
    }
    while (a3 != v5);
    unint64_t v7 = a3 - 1;
    if (a3 != 1)
    {
      uint64_t v8 = 0;
      uint32_t v9 = a3 - 1;
      do
      {
        [v4 exchangeObjectAtIndex:v8 withObjectAtIndex:v8 + 1 + arc4random_uniform(v9--)];
        ++v8;
      }
      while (v7 != v8);
    }
    id v10 = [v4 copy];
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

+ (void)replacePromptIndicesOfEvergreen:(id)a3 isTah:(BOOL)a4
{
  BOOL v45 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v47;
    uint64_t v42 = *(void *)v47;
    do
    {
      unint64_t v7 = 0;
      id v43 = v5;
      do
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v7);
        uint32_t v9 = [v8 resources];
        id v10 = [v9 objectAtIndexedSubscript:0];

        id v11 = [v10 evergreenType];
        if (v11 == (id)5)
        {
          if (v45)
          {
            v52[0] = &off_1002F6278;
            v52[1] = &off_1002F6308;
            v24 = [v10 promptIndexes];
            v25 = [v24 objectAtIndexedSubscript:2];
            v52[2] = v25;
            v26 = [v10 promptIndexes];
            unint64_t v27 = [v26 objectAtIndexedSubscript:3];
            v52[3] = v27;
            v28 = [v10 promptIndexes];
            v29 = [v28 objectAtIndexedSubscript:4];
            v52[4] = v29;
            id v30 = v52;
          }
          else
          {
            v51[0] = &off_1002F6320;
            v51[1] = &off_1002F6248;
            v24 = [v10 promptIndexes];
            v25 = [v24 objectAtIndexedSubscript:2];
            v51[2] = v25;
            v26 = [v10 promptIndexes];
            unint64_t v27 = [v26 objectAtIndexedSubscript:3];
            v51[3] = v27;
            v28 = [v10 promptIndexes];
            v29 = [v28 objectAtIndexedSubscript:4];
            v51[4] = v29;
            id v30 = v51;
          }
          v31 = +[NSArray arrayWithObjects:v30 count:5];

          id v38 = [MOResource alloc];
          uint64_t v33 = [v8 promptLanguage];
          id v34 = [v31 copy];
          v35 = [(MOResource *)v38 initWithEvergreenTypeName:v33 promptIndexes:v34];
          uint64_t v36 = 708;
          goto LABEL_21;
        }
        if (v11 == (id)4)
        {
          if (v45)
          {
            v54[0] = &off_1002F6260;
            long long v41 = [v10 promptIndexes];
            long long v40 = [v41 objectAtIndexedSubscript:1];
            v54[1] = v40;
            uint64_t v17 = [v10 promptIndexes];
            id v18 = [v17 objectAtIndexedSubscript:2];
            v54[2] = v18;
            id v19 = [v10 promptIndexes];
            id v20 = [v19 objectAtIndexedSubscript:3];
            v54[3] = v20;
            id v21 = [v10 promptIndexes];
            id v22 = [v21 objectAtIndexedSubscript:4];
            v54[4] = v22;
            id v23 = v54;
          }
          else
          {
            v53[0] = &off_1002F6290;
            long long v41 = [v10 promptIndexes];
            long long v40 = [v41 objectAtIndexedSubscript:1];
            v53[1] = v40;
            uint64_t v17 = [v10 promptIndexes];
            id v18 = [v17 objectAtIndexedSubscript:2];
            v53[2] = v18;
            id v19 = [v10 promptIndexes];
            id v20 = [v19 objectAtIndexedSubscript:3];
            v53[3] = v20;
            id v21 = [v10 promptIndexes];
            id v22 = [v21 objectAtIndexedSubscript:4];
            v53[4] = v22;
            id v23 = v53;
          }
          v31 = +[NSArray arrayWithObjects:v23 count:5];

          v32 = [MOResource alloc];
          uint64_t v33 = [v8 promptLanguage];
          id v34 = [v31 copy];
          v35 = [(MOResource *)v32 initWithEvergreenTypeName:v33 promptIndexes:v34];
          uint64_t v36 = 709;
LABEL_21:
          uint64_t v6 = v42;
          id v5 = v43;
          goto LABEL_22;
        }
        if (v11 != (id)2) {
          goto LABEL_23;
        }
        if (v45)
        {
          v56[0] = &off_1002F6230;
          v56[1] = &off_1002F6218;
          v56[2] = &off_1002F62A8;
          id v12 = [v10 promptIndexes];
          unint64_t v13 = [v12 objectAtIndexedSubscript:3];
          v56[3] = v13;
          id v14 = [v10 promptIndexes];
          id v15 = [v14 objectAtIndexedSubscript:4];
          v56[4] = v15;
          uint64_t v16 = v56;
        }
        else
        {
          v55[0] = &off_1002F62C0;
          v55[1] = &off_1002F62D8;
          v55[2] = &off_1002F62F0;
          id v12 = [v10 promptIndexes];
          unint64_t v13 = [v12 objectAtIndexedSubscript:3];
          v55[3] = v13;
          id v14 = [v10 promptIndexes];
          id v15 = [v14 objectAtIndexedSubscript:4];
          v55[4] = v15;
          uint64_t v16 = v55;
        }
        v31 = +[NSArray arrayWithObjects:v16 count:5];

        id v37 = [MOResource alloc];
        uint64_t v33 = [v8 promptLanguage];
        id v34 = [v31 copy];
        v35 = [(MOResource *)v37 initWithEvergreenTypeName:v33 promptIndexes:v34];
        uint64_t v36 = 707;
LABEL_22:

        [v8 setBundleSubType:v36];
        id v10 = v35;
LABEL_23:
        unint64_t v50 = v10;
        v39 = +[NSArray arrayWithObjects:&v50 count:1];
        [v8 setResources:v39];

        unint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v5);
  }
}

+ (id)evergreenTypeStringFromEvergreenType:(unint64_t)a3
{
  if (a3 - 1 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *off_1002CF8F0[a3 - 1];
  }
  return v4;
}

+ (unint64_t)evergreenTypeFromEvergreenTypeString:(id)a3
{
  id v3 = a3;
  if ([@"WISDOM" isEqualToString:v3])
  {
    unint64_t v4 = 1;
  }
  else if ([@"PURPOSE" isEqualToString:v3])
  {
    unint64_t v4 = 4;
  }
  else if ([@"KINDNESS" isEqualToString:v3])
  {
    unint64_t v4 = 3;
  }
  else if ([@"GRATITUDE" isEqualToString:v3])
  {
    unint64_t v4 = 2;
  }
  else if ([@"CREATIVITY" isEqualToString:v3])
  {
    unint64_t v4 = 6;
  }
  else if ([@"RESILIENCE" isEqualToString:v3])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->fUniverse, 0);
}

@end