@interface MOEventPatternDetectorPredicateFilterWorkouts
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterWorkouts)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOEventPatternDetectorPredicateFilterWorkouts

- (MOEventPatternDetectorPredicateFilterWorkouts)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorPredicateFilterWorkouts;
  v2 = [(MOEventPatternDetectorPredicateFilterWorkouts *)&v6 init];
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
    id v15 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu workout events", buf, 0xCu);
  }

  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v13 = v8;
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v10 = [v6 sortedArrayUsingDescriptors:v9];

  if ([v6 count])
  {
    [v4 addObject:v10];
    id v11 = v4;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end