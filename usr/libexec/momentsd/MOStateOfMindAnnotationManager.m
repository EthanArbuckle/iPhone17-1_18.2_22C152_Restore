@interface MOStateOfMindAnnotationManager
- (MOConfigurationManager)configurationManager;
- (MOStateOfMindAnnotationManager)initWithUniverse:(id)a3;
- (id)_getEventsOnDay:(id)a3 startTime:(id)a4 endTime:(id)a5;
- (id)_getTimeSpanOfMOEventArray:(id)a3;
- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4;
- (id)buildPromptDescriptionForEventBundle:(id)a3;
- (id)getBaseEvents:(id)a3;
- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5;
- (id)groupBaseEvents:(id)a3;
- (void)setConfigurationManager:(id)a3;
@end

@implementation MOStateOfMindAnnotationManager

- (MOStateOfMindAnnotationManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOStateOfMindAnnotationManager;
  v5 = [(MOTimeContextAnnotationManager *)&v11 initWithUniverse:v4];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 getService:v7];
    configurationManager = v5->_configurationManager;
    v5->_configurationManager = (MOConfigurationManager *)v8;
  }
  return v5;
}

- (id)getBaseEvents:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"category", 24];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)groupBaseEvents:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_opt_new();
    id v36 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v45 = v36;
    v6 = +[NSArray arrayWithObjects:&v45 count:1];
    id v37 = v4;
    v7 = [v4 sortedArrayUsingDescriptors:v6];

    v34 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 2];
    uint64_t v8 = [v7 filteredArrayUsingPredicate:];
    v32 = +[NSPredicate predicateWithFormat:@"stateOfMindEvent.reflectiveInterval = %d", 1];
    v30 = [v7 filteredArrayUsingPredicate:];
    v9 = +[NSCalendar currentCalendar];
    v35 = v7;
    v10 = [(MOStateOfMindAnnotationManager *)self _getTimeSpanOfMOEventArray:v7];
    objc_super v11 = [v10 startDate];
    uint64_t v12 = [v9 components:28 fromDate:v11];

    v31 = (void *)v12;
    v13 = [v9 dateFromComponents:v12];
    v39 = v9;
    v14 = [v9 dateByAddingUnit:16 value:1 toDate:v13 options:0];
    v38 = v10;
    v15 = [v10 endDate];
    LODWORD(v9) = [v13 isOnOrBefore:v15];

    if (v9)
    {
      do
      {
        v16 = [(MOStateOfMindAnnotationManager *)self _getEventsOnDay:v8 startTime:v13 endTime:v14];
        if ([v16 count])
        {
          id v17 = [v16 copy];
          [v5 addObject:v17];
        }
        v18 = [v39 dateByAddingUnit:16 value:1 toDate:v13 options:0];

        v19 = [v39 dateByAddingUnit:16 value:1 toDate:v14 options:0];

        v20 = [v38 endDate];
        unsigned __int8 v21 = [v18 isOnOrBefore:v20];

        v14 = v19;
        v13 = v18;
      }
      while ((v21 & 1) != 0);
    }
    else
    {
      v18 = v13;
      v19 = v14;
    }
    v33 = (void *)v8;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v30;
    id v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", *(void *)(*((void *)&v40 + 1) + 8 * i), 0);
          id v28 = [v27 copy];
          [v5 addObject:v28];
        }
        id v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }

    id v4 = v37;
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_getTimeSpanOfMOEventArray:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  v5 = [v4 startDate];
  v6 = [v3 lastObject];

  v7 = [v6 endDate];
  id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v7];

  return v8;
}

- (id)_getEventsOnDay:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 startDate];
        if ([v16 isOnOrAfter:v8])
        {
          id v17 = [v15 startDate];
          unsigned int v18 = [v17 isBeforeDate:v9];

          if (v18) {
            [v20 addObject:v15];
          }
        }
        else
        {
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v20;
}

- (id)getContextEventsForBaseEvents:(id)a3 events:(id)a4 withPatternEvents:(id)a5
{
  id v7 = a3;
  id v40 = a4;
  id v8 = a5;
  id v46 = (id)objc_opt_new();
  long long v43 = v8;
  if ([v8 count])
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v39 = v7;
    id obj = v7;
    id v44 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v56;
      CFStringRef v9 = @"kEventPatternType";
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = v10;
          v48 = *(void **)(*((void *)&v55 + 1) + 8 * v10);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v50 = v43;
          id v11 = [v50 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v52;
            uint64_t v47 = *(void *)v52;
            do
            {
              v14 = 0;
              id v49 = v12;
              do
              {
                if (*(void *)v52 != v13) {
                  objc_enumerationMutation(v50);
                }
                v15 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v14);
                v16 = [v15 patterns:v39];
                id v17 = [v16 objectForKeyedSubscript:v9];
                if ([v17 intValue])
                {
                }
                else
                {
                  unsigned int v18 = [v48 eventIdentifier];
                  [v18 UUIDString];
                  id v20 = v19 = v9;
                  long long v21 = [v15 patterns];
                  long long v22 = [v21 objectForKeyedSubscript:@"kEventPatternAnomalousEventIdentifier"];
                  unsigned int v23 = [v20 isEqualToString:v22];

                  CFStringRef v9 = v19;
                  uint64_t v13 = v47;

                  id v12 = v49;
                  if (v23) {
                    [v46 addObject:v15];
                  }
                }
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v50 countByEnumeratingWithState:&v51 objects:v67 count:16];
            }
            while (v12);
          }

          uint64_t v10 = v45 + 1;
        }
        while ((id)(v45 + 1) != v44);
        id v44 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v44);
    }

    id v7 = v39;
  }
  long long v24 = [v7 lastObject:v39];
  uint64_t v25 = [v24 startDate];
  v26 = [v7 lastObject];
  v27 = [v26 endDate];
  id v28 = +[MOContextAnnotationUtilities predicateOfSocialContextEventWithStartDate:v25 endData:v27];

  v29 = [v40 filteredArrayUsingPredicate:v28];
  v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    id v33 = [v29 count];
    v34 = [v7 lastObject];
    v35 = [v34 startDate];
    id v36 = [v7 lastObject];
    id v37 = [v36 endDate];
    *(_DWORD *)buf = 138413058;
    v60 = v32;
    __int16 v61 = 2048;
    id v62 = v33;
    __int16 v63 = 2112;
    v64 = v35;
    __int16 v65 = 2112;
    v66 = v37;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@: filtered social context event count, %lu, startDate, %@, endDate, %@", buf, 0x2Au);
  }
  if ([v29 count]) {
    [v46 addObjectsFromArray:v29];
  }

  return v46;
}

- (id)annotateBaseEvents:(id)a3 contextEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [MOEventBundle alloc];
    CFStringRef v9 = +[NSUUID UUID];
    uint64_t v10 = +[NSDate date];
    id v11 = [(MOEventBundle *)v8 initWithBundleIdentifier:v9 creationDate:v10];

    [(MOEventBundle *)v11 setInterfaceType:14];
    [(MOEventBundle *)v11 setBundleSuperType:8];
    id v12 = [v6 lastObject];
    uint64_t v13 = +[NSCalendar currentCalendar];
    v14 = [v12 stateOfMindEvent];
    [v14 reflectiveInterval];
    double v16 = v15;

    if (v16 == 2.0)
    {
      [(MOEventBundle *)v11 setBundleSubType:801];
      id v17 = [v6 lastObject];
      unsigned int v18 = [v17 startDate];
      CFStringRef v19 = [v13 components:28 fromDate:v18];

      id v20 = [v13 dateFromComponents:v19];
      [(MOEventBundle *)v11 setStartDate:v20];
      long long v21 = [v13 dateByAddingUnit:16 value:1 toDate:v20 options:0];
      [(MOEventBundle *)v11 setEndDate:v21];
    }
    else
    {
      [(MOEventBundle *)v11 setBundleSubType:802];
      long long v22 = [v6 lastObject];
      unsigned int v23 = [v22 startDate];
      [(MOEventBundle *)v11 setStartDate:v23];

      CFStringRef v19 = [(MOEventBundle *)v11 startDate];
      id v20 = [v13 dateByAddingUnit:64 value:1 toDate:v19 options:0];
      [(MOEventBundle *)v11 setEndDate:v20];
    }

    long long v24 = [v12 stateOfMindEvent];
    [v24 valenceClassification];
    double v26 = v25;

    v101 = v13;
    if (v26 == 4.0)
    {
      uint64_t v27 = 1;
    }
    else
    {
      id v28 = [v12 stateOfMindEvent];
      [v28 valenceClassification];
      double v30 = v29;

      if (v30 == 7.0)
      {
        uint64_t v27 = 4;
      }
      else
      {
        v31 = [v12 stateOfMindEvent];
        [v31 valenceClassification];
        double v33 = v32;

        if (v33 == 6.0)
        {
          uint64_t v27 = 3;
        }
        else
        {
          v34 = [v12 stateOfMindEvent];
          [v34 valenceClassification];
          double v36 = v35;

          if (v36 == 5.0)
          {
            uint64_t v27 = 2;
          }
          else
          {
            id v37 = [v12 stateOfMindEvent];
            [v37 valenceClassification];
            double v39 = v38;

            if (v39 == 1.0)
            {
              uint64_t v27 = 7;
            }
            else
            {
              id v40 = [v12 stateOfMindEvent];
              [v40 valenceClassification];
              double v42 = v41;

              if (v42 == 2.0)
              {
                uint64_t v27 = 6;
              }
              else
              {
                long long v43 = [v12 stateOfMindEvent];
                [v43 valenceClassification];
                double v45 = v44;

                if (v45 == 3.0) {
                  uint64_t v27 = 5;
                }
                else {
                  uint64_t v27 = 0;
                }
              }
            }
          }
        }
      }
    }
    id v46 = [v6 lastObject];
    uint64_t v47 = [v46 appBundle];
    v48 = +[MOContextAnnotationUtilities bundleNameFromBundleId:v47];

    v103 = objc_opt_new();
    id v49 = [v6 lastObject];
    LODWORD(v46) = [v49 fromFirstParty];

    if (!v46 && v48) {
      [v103 setObject:v48 forKeyedSubscript:@"MediaActionMetaDataAppName"];
    }
    id v50 = [[MOAction alloc] initWithActionName:@"stateOfMind" actionType:12 actionSubtype:v27 actionMetaData:v103];
    [(MOEventBundle *)v11 setAction:v50];

    long long v51 = [v12 eventIdentifier];
    long long v52 = [(MOEventBundle *)v11 action];
    [v52 setSourceEventIdentifier:v51];

    long long v53 = [v6 lastObject];
    long long v54 = [v53 startDate];
    long long v55 = [(MOAnnotationManager *)self timeZoneManager];
    long long v56 = +[MOTime timeForDate:v54 timeZoneManager:v55];
    [(MOEventBundle *)v11 setTime:v56];

    long long v57 = objc_opt_new();
    [v57 addObjectsFromArray:v6];
    v98 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"provider", 5];
    long long v58 = [v7 filteredArrayUsingPredicate:];
    if ([v58 count]) {
      [v57 addObjectsFromArray:v58];
    }
    v99 = v57;
    id v59 = [v57 copy];
    [(MOEventBundle *)v11 setEvents:v59];

    [(MOEventBundle *)v11 setPropertiesBasedOnEvents];
    v60 = [(MOEventBundle *)v11 resources];
    if (v60)
    {
      __int16 v61 = [(MOEventBundle *)v11 resources];
      id v94 = [v61 mutableCopy];
    }
    else
    {
      id v94 = (id)objc_opt_new();
    }

    id v62 = [v6 lastObject];
    unsigned int v63 = [v62 fromFirstParty];

    if (!v63 && v48) {
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindLoggedIn3pApp" value:&__kCFBooleanTrue];
    }
    v97 = v58;
    if ([v48 isEqual:@"Journal"]) {
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindLoggedInJournalApp" value:&__kCFBooleanTrue];
    }
    v64 = objc_opt_new();
    __int16 v65 = [(MOEventBundle *)v11 startDate];
    [v65 timeIntervalSince1970];
    v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v64 setObject:v66 forKey:@"MOStateOfMindMetaDataKeyStartDate"];

    v67 = [(MOEventBundle *)v11 endDate];
    [v67 timeIntervalSince1970];
    v68 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v64 setObject:v68 forKey:@"MOStateOfMindMetaDataKeyEndDate"];

    v69 = [v6 lastObject];
    v70 = [v69 stateOfMindEvent];
    v71 = [v70 labels];

    if ([v71 count])
    {
      [v64 setObject:v71 forKey:@"MOStateOfMindMetaDataKeyLabel"];
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindLabels" value:v71];
    }
    v96 = v71;
    v100 = v48;
    v72 = [v6 lastObject];
    v73 = [v72 stateOfMindEvent];
    v74 = [v73 domains];

    if ([v74 count])
    {
      [v64 setObject:v74 forKey:@"MOStateOfMindMetaDataKeyDomain"];
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindDomains" value:v74];
    }
    v95 = v74;
    id v102 = v7;
    v75 = [v6 lastObject];
    v76 = [v75 stateOfMindEvent];
    [v76 reflectiveInterval];
    v77 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    if (v77)
    {
      [v64 setObject:v77 forKey:@"MOStateOfMindMetaDataKeyReflectiveInterval"];
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindReflectiveInterval" value:v77];
    }
    v78 = [v6 lastObject];
    v79 = [v78 stateOfMindEvent];
    [v79 valence];
    v80 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    if (v80)
    {
      [v64 setObject:v80 forKey:@"MOStateOfMindMetaDataKeyValence"];
      v81 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v80, 0);
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindValence" value:v81];
    }
    v82 = [v6 lastObject];
    v83 = [v82 stateOfMindEvent];
    [v83 valenceClassification];
    v84 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    if (v84)
    {
      [v64 setObject:v84 forKey:@"MOStateOfMindMetaDataKeyValenceClassification"];
      v85 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v80, 0);
      [(MOEventBundle *)v11 addMetaDataForRankForKey:@"StateOfMindValenceClassification" value:v85];
    }
    v86 = [v6 lastObject];
    v87 = [v86 identifierFromProvider];

    if (v87)
    {
      v88 = [v6 lastObject];
      v89 = [v88 identifierFromProvider];
      [v64 setObject:v89 forKey:@"MOStateOfMindMetaDataKeyStateOfMindID"];
    }
    v90 = [[MOResource alloc] initWithName:@"StateOfMind" type:16 dict:v64 value:0.0];
    v91 = [v12 eventIdentifier];
    [(MOResource *)v90 setSourceEventIdentifier:v91];

    [(MOResource *)v90 setSourceEventAccessType:8];
    [(MOResource *)v90 setPriorityScore:100.0];
    v92 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "StateOfMind: Primary MOResource created for state of mind bundle", buf, 2u);
    }

    [v94 addObject:v90];
    [(MOEventBundle *)v11 setResources:v94];

    id v7 = v102;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)buildPromptDescriptionForEventBundle:(id)a3
{
  return 0;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end