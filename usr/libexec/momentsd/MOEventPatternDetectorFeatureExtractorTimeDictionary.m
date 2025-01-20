@interface MOEventPatternDetectorFeatureExtractorTimeDictionary
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorTimeDictionary)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorTimeDictionary

- (MOEventPatternDetectorFeatureExtractorTimeDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorTimeDictionary;
  v2 = [(MOEventPatternDetectorFeatureExtractorTimeDictionary *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastWindowEnd = -1.0;
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  id v58 = (id)objc_opt_new();
  id v66 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v3;
  id v59 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v80;
    v4 = NSAssertionHandler_ptr;
    CFStringRef v5 = @"eventIdentifier";
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v80 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v6;
        v7 = *(void **)(*((void *)&v79 + 1) + 8 * v6);
        v8 = +[NSMutableArray array];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v64 = v7;
        id v69 = [v64 countByEnumeratingWithState:&v75 objects:v87 count:16];
        v71 = v8;
        if (v69)
        {
          uint64_t v67 = *(void *)v76;
          do
          {
            for (i = 0; i != v69; i = (char *)i + 1)
            {
              if (*(void *)v76 != v67) {
                objc_enumerationMutation(v64);
              }
              v10 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              v11 = [v10 startDate];
              v12 = [v66 components:96 fromDate:v11];

              v13 = v4[32];
              float v14 = (float)(uint64_t)[v12 hour];
              v72 = v12;
              *(float *)&double v15 = (float)((float)(uint64_t)[v12 minute] / 60.0) + v14;
              v16 = [v13 numberWithFloat:v15];
              v17 = v4[32];
              v18 = [v10 startDate];
              *(float *)&double v19 = (float)(uint64_t)[v66 component:0x2000 fromDate:v18];
              v20 = [v17 numberWithFloat:v19];

              v21 = v4[32];
              v22 = +[NSCalendar currentCalendar];
              v23 = [v10 startDate];
              *(float *)&double v24 = (float)(uint64_t)[v22 component:512 fromDate:v23];
              v25 = [v21 numberWithFloat:v24];

              v85[0] = v5;
              v26 = [v10 eventIdentifier];
              v27 = [v26 UUIDString];
              v86[0] = v27;
              v85[1] = @"startDate";
              v28 = [v10 startDate];
              v86[1] = v28;
              v85[2] = @"endDate";
              v29 = [v10 endDate];
              v86[2] = v29;
              v86[3] = v16;
              v85[3] = @"hrFromMidnight";
              v85[4] = @"weekOfYear";
              v85[5] = @"weekday";
              v86[4] = v20;
              v86[5] = v25;
              v30 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:6];

              if ([v10 category] == (id)2)
              {
                v31 = [v10 workoutType];

                v8 = v71;
                if (v31)
                {
                  id v32 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v30];
                  v33 = [v10 workoutType];
                  [v32 setObject:v33 forKeyedSubscript:@"workoutType"];

                  id v34 = [v32 copy];
                  v30 = v34;
                }
                v4 = NSAssertionHandler_ptr;
                CFStringRef v5 = @"eventIdentifier";
              }
              else
              {
                v4 = NSAssertionHandler_ptr;
                CFStringRef v5 = @"eventIdentifier";
                v8 = v71;
              }
              [v8 addObject:v30];
            }
            id v69 = [v64 countByEnumeratingWithState:&v75 objects:v87 count:16];
          }
          while (v69);
        }

        v35 = +[NSPredicate predicateWithFormat:@"(hrFromMidnight >= %f) AND (hrFromMidnight < %f)", 0, self->_lastWindowEnd + -24.0];
        v36 = [v8 filteredArrayUsingPredicate:v35];

        CFStringRef v37 = @"hrFromMidnight";
        CFStringRef v38 = v5;
        CFStringRef v39 = @"weekOfYear";
        if ([v36 count])
        {
          unint64_t v40 = 0;
          do
          {
            v41 = [v36 objectAtIndex:v40];
            v42 = [v41 valueForKey:v37];

            v43 = v4[32];
            [v42 floatValue];
            *(float *)&double v45 = v44 + 24.0;
            v63 = [v43 numberWithFloat:v45];

            v83[0] = v38;
            v74 = [v36 objectAtIndex:v40];
            v73 = [v74 valueForKey:v38];
            v84[0] = v73;
            v83[1] = @"startDate";
            v70 = [v36 objectAtIndex:v40];
            v68 = [v70 valueForKey:@"startDate"];
            v84[1] = v68;
            v83[2] = @"endDate";
            id v65 = [v36 objectAtIndex:v40];
            v62 = [v65 valueForKey:@"endDate"];
            v84[2] = v62;
            v83[3] = @"workoutType";
            v61 = [v36 objectAtIndex:v40];
            v46 = [v61 valueForKey:@"workoutType"];
            v84[3] = v46;
            v84[4] = v63;
            v83[4] = v37;
            v83[5] = v39;
            v47 = [v36 objectAtIndex:v40];
            v48 = [v47 valueForKey:v39];
            v84[5] = v48;
            v83[6] = @"weekday";
            v49 = [v36 objectAtIndex:v40];
            [v49 valueForKey:@"weekday"];
            v51 = CFStringRef v50 = v39;
            v84[6] = v51;
            +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:7];
            v53 = CFStringRef v52 = v37;
            [v71 addObject:v53];

            CFStringRef v37 = v52;
            CFStringRef v39 = v50;

            v4 = NSAssertionHandler_ptr;
            CFStringRef v38 = @"eventIdentifier";

            ++v40;
          }
          while ((unint64_t)[v36 count] > v40);
        }
        [v58 addObject:v71];

        uint64_t v6 = v60 + 1;
        CFStringRef v5 = v38;
      }
      while ((id)(v60 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v59);
  }

  return v58;
}

- (BOOL)configure:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 objectForKey:@"LastWindowEnd"];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"LastWindowEnd"];
    [v6 doubleValue];
    self->_lastWindowEnd = v7;
  }
  else
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MOEventPatternDetectorFeatureExtractorTimeDictionary configure:](@"LastWindowEnd", v8);
    }
  }
  return 1;
}

- (void)configure:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Configuration property not set for routine detection: %@", (uint8_t *)&v2, 0xCu);
}

@end