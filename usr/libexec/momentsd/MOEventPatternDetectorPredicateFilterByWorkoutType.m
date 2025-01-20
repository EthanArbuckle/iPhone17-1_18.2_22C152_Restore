@interface MOEventPatternDetectorPredicateFilterByWorkoutType
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterByWorkoutType)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOEventPatternDetectorPredicateFilterByWorkoutType

- (MOEventPatternDetectorPredicateFilterByWorkoutType)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterByWorkoutType;
  v2 = [(MOEventPatternDetectorPredicateFilterByWorkoutType *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %lu AND %K != %@", @"category", 2, @"provider", 1, @"workoutType", @"HKWorkoutActivityTypeCooldown"];
  objc_super v6 = [v3 filteredArrayUsingPredicate:v5];
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v30 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu workout events", buf, 0xCu);
  }

  if ([v6 count])
  {
    v20 = v5;
    id v21 = v3;
    [v6 valueForKeyPath:@"@distinctUnionOfObjects.workoutType"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          v12 = v4;
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = +[NSPredicate predicateWithFormat:@"%K = %@", @"workoutType", *(void *)(*((void *)&v23 + 1) + 8 * i)];
          v14 = [v6 filteredArrayUsingPredicate:v13];
          id v15 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
          id v27 = v15;
          v16 = +[NSArray arrayWithObjects:&v27 count:1];
          v17 = [v14 sortedArrayUsingDescriptors:v16];

          v4 = v12;
          [v12 addObject:v17];
        }
        id v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }
    id v18 = v4;

    v5 = v20;
    id v3 = v21;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end