@interface MOEventBundler
+ (id)predicatesOfDesiredExperiences;
+ (id)propertyNameDictionary;
- (MOEventBundler)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableDictionary)eventBundleDict;
- (id)calculateEventBundlesFromEvents:(id)a3;
- (id)predicateForBasicFilteringOfEvents;
- (id)pruneEventBundles:(id)a3;
- (id)returnCurrentEventBundles;
@end

@implementation MOEventBundler

- (MOEventBundler)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundler initWithStartDate:endDate:](v16);
    }

    v17 = +[NSAssertionHandler currentHandler];
    v18 = v17;
    CFStringRef v19 = @"Invalid parameter not satisfying: startDate";
    SEL v20 = a2;
    v21 = self;
    uint64_t v22 = 67;
    goto LABEL_12;
  }
  if (!v9)
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundler initWithStartDate:endDate:](v23);
    }

    v17 = +[NSAssertionHandler currentHandler];
    v18 = v17;
    CFStringRef v19 = @"Invalid parameter not satisfying: endDate";
    SEL v20 = a2;
    v21 = self;
    uint64_t v22 = 68;
LABEL_12:
    [v17 handleFailureInMethod:v20 object:v21 file:@"MOEventBundler.m" lineNumber:v22 description:v19];

    v15 = 0;
    goto LABEL_13;
  }
  v25.receiver = self;
  v25.super_class = (Class)MOEventBundler;
  v11 = [(MOEventBundler *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    uint64_t v13 = objc_opt_new();
    eventBundleDict = v12->_eventBundleDict;
    v12->_eventBundleDict = (NSMutableDictionary *)v13;
  }
  self = v12;
  v15 = self;
LABEL_13:

  return v15;
}

- (id)returnCurrentEventBundles
{
  return self->_eventBundleDict;
}

- (id)calculateEventBundlesFromEvents:(id)a3
{
  id v5 = a3;
  v6 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v59 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched events count, %lu", buf, 0xCu);
  }

  v7 = objc_opt_new();
  if (v5 && [v5 count])
  {
    v56 = [(MOEventBundler *)self predicateForBasicFilteringOfEvents];
    [v5 filterUsingPredicate:];
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 count];
      *(_DWORD *)buf = 134217984;
      id v59 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Basic pruning is done. Number of events post pruning, %lu", buf, 0xCu);
    }

    v10 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v11 = 0;
      uint64_t v12 = 1;
      while (1)
      {
        uint64_t v13 = [v5 objectAtIndexedSubscript:v11];
        if ([v13 category] != (id)7
          && [v13 category] != (id)6
          && [v13 category] != (id)12
          && [v13 provider] != (id)5
          && [v13 category] != (id)9
          && [v13 category] != (id)10
          && ([v13 isHomeWorkVisit] & 1) == 0
          && [v13 category] != (id)3
          && [v13 category] != (id)4
          && (unint64_t)[v5 count] > v11 + 1)
        {
          break;
        }
LABEL_39:

        ++v11;
        ++v12;
        if ((unint64_t)[v5 count] <= v11) {
          goto LABEL_40;
        }
      }
      uint64_t v14 = v12;
      while (1)
      {
        v15 = [v5 objectAtIndexedSubscript:v14];
        if ([v15 category] == (id)7) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)6) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)12) {
          goto LABEL_38;
        }
        if ([v15 provider] == (id)5) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)9) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)10) {
          goto LABEL_38;
        }
        if ([v15 isHomeWorkVisit]) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)3) {
          goto LABEL_38;
        }
        if ([v15 category] == (id)4) {
          goto LABEL_38;
        }
        uint64_t v16 = [v13 startDate];
        if (!v16) {
          goto LABEL_38;
        }
        v55 = (void *)v16;
        v53 = [v13 endDate];
        if (!v53) {
          goto LABEL_37;
        }
        v47 = [v15 startDate];
        if (!v47) {
          goto LABEL_36;
        }
        v50 = [v15 endDate];

        if (v50) {
          break;
        }
LABEL_38:

        if ((unint64_t)[v5 count] <= ++v14) {
          goto LABEL_39;
        }
      }
      v54 = [v13 startDate];
      v55 = [v54 dateByAddingTimeInterval:-0.0];

      v51 = [v13 endDate];
      v53 = [v51 dateByAddingTimeInterval:0.0];

      v48 = [v15 startDate];
      v52 = [v48 dateByAddingTimeInterval:-0.0];

      v45 = [v15 endDate];
      v49 = [v45 dateByAddingTimeInterval:0.0];

      id v46 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v55 endDate:v53];
      id v41 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v52 endDate:v49];
      v44 = [v46 intersectionWithDateInterval:x0];
      v42 = [v44 endDate];
      v39 = [v44 startDate];
      [v42 timeIntervalSinceDate:v39];
      double v18 = v17;

      if (v18 > 0.0)
      {
        v43 = +[NSNumber numberWithInt:v11];
        v57[0] = v43;
        v40 = +[NSNumber numberWithInt:v14];
        v57[1] = v40;
        v38 = +[NSArray arrayWithObjects:v57 count:2];
        [v10 addObject:v38];
      }
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
LABEL_40:
    if ([v5 count])
    {
      CFStringRef v19 = -[MOGraph initWithNumVertices:edges:]([MOGraph alloc], "initWithNumVertices:edges:", [v5 count], v10);
      SEL v20 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v10 count];
        *(_DWORD *)buf = 134217984;
        id v59 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Correlation graph is built with number of edges, %lu", buf, 0xCu);
      }

      uint64_t v22 = [(MOGraph *)v19 calculateConnectedComponentWithGraphTraversal:1];
      id v23 = [v22 count];
      if (v23 != [v5 count])
      {
        v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[MOEventBundler calculateEventBundlesFromEvents:](v24);
        }

        objc_super v25 = +[NSAssertionHandler currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"MOEventBundler.m" lineNumber:136 description:@"The events and membership arrays have to be of the same size. (in %s:%d)", "-[MOEventBundler calculateEventBundlesFromEvents:]", 136];
      }
      if ([v5 count])
      {
        unint64_t v26 = 0;
        do
        {
          v27 = [v22 objectAtIndexedSubscript:v26];
          v28 = [v7 objectForKey:v27];

          if (!v28)
          {
            v29 = objc_opt_new();
            [v7 setObject:v29 forKeyedSubscript:v27];
          }
          v30 = [v7 objectForKeyedSubscript:v27];
          v31 = [v5 objectAtIndexedSubscript:v26];
          [v30 addObject:v31];

          ++v26;
        }
        while ((unint64_t)[v5 count] > v26);
      }
      v32 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [v7 count];
        *(_DWORD *)buf = 134217984;
        id v59 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Graph partitioning is performed (before semantic pruning). Number of correlated bundles: %lu", buf, 0xCu);
      }

      id v34 = v7;
    }
    else
    {
      id v36 = v7;
    }
  }
  else
  {
    id v35 = v7;
  }

  return v7;
}

- (id)pruneEventBundles:(id)a3
{
  id v3 = a3;
  v52 = +[MOEventBundler predicatesOfDesiredExperiences];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = [v3 allKeys];
  id v54 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v54)
  {
    int v61 = 0;
    uint64_t v53 = *(void *)v84;
    id v51 = v3;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v84 != v53) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v7 = [v3 objectForKeyedSubscript:v5];
        id v8 = [v7 count];

        if (v8)
        {
          v55 = v6;
          v56 = i;
          id v9 = [v3 objectForKeyedSubscript:v5];
          v10 = [v9 allObjects];
          id v11 = [v10 mutableCopy];

          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v79 objects:v96 count:16];
          id v60 = v12;
          if (v13)
          {
            id v14 = v13;
            int v15 = 0;
            uint64_t v16 = *(void *)v80;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v80 != v16) {
                  objc_enumerationMutation(v12);
                }
                double v18 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
                CFStringRef v19 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  SEL v20 = [v18 eventIdentifier];
                  *(_DWORD *)buf = 138412802;
                  id v91 = v5;
                  __int16 v92 = 1024;
                  int v93 = v15 + j + 1;
                  id v12 = v60;
                  __int16 v94 = 2112;
                  v95 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "post graph partitioning bundle %@ with subevent %d:\n %@", buf, 0x1Cu);
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v79 objects:v96 count:16];
              v15 += (int)j;
            }
            while (v14);
          }

          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v21 = v52;
          id v63 = [v21 countByEnumeratingWithState:&v75 objects:v89 count:16];
          if (v63)
          {
            uint64_t v62 = *(void *)v76;
            id v57 = v21;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v76 != v62) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v65 = v22;
                uint64_t v23 = *(void *)(*((void *)&v75 + 1) + 8 * v22);
                v24 = [v21 objectForKeyedSubscript:v23];
                v66 = objc_opt_new();
                long long v71 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                objc_super v25 = v24;
                id v26 = [(MOEventBundle *)v25 countByEnumeratingWithState:&v71 objects:v88 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v72;
                  while (2)
                  {
                    for (k = 0; k != v27; k = (char *)k + 1)
                    {
                      if (*(void *)v72 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      id v30 = [v12 filteredArrayUsingPredicate:*(void *)(*((void *)&v71 + 1) + 8 * (void)k)];
                      if (![v30 count])
                      {
                        v31 = v66;
                        [v66 removeAllObjects];
                        v32 = v25;
                        goto LABEL_42;
                      }
                      [v66 addObjectsFromArray:v30];
                    }
                    id v27 = [(MOEventBundle *)v25 countByEnumeratingWithState:&v71 objects:v88 count:16];
                    if (v27) {
                      continue;
                    }
                    break;
                  }
                }

                v31 = v66;
                v32 = [[MOEventBundle alloc] initWithEventSet:v66 filtered:1];
                [(MOEventBundle *)v32 setBundleType:v23];
                eventBundleDict = self->_eventBundleDict;
                id v34 = +[NSNumber numberWithInt:++v61];
                [(NSMutableDictionary *)eventBundleDict setObject:v32 forKeyedSubscript:v34];

                id v35 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  id v36 = [(MOEventBundle *)v32 bundleType];
                  *(_DWORD *)buf = 138412290;
                  id v91 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Created post semantic pruning bundle of type: %@ including:", buf, 0xCu);
                }
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                id v30 = v66;
                id v37 = [v30 countByEnumeratingWithState:&v67 objects:v87 count:16];
                if (v37)
                {
                  id v38 = v37;
                  id v59 = v25;
                  int v39 = 0;
                  uint64_t v40 = *(void *)v68;
                  do
                  {
                    for (m = 0; m != v38; m = (char *)m + 1)
                    {
                      if (*(void *)v68 != v40) {
                        objc_enumerationMutation(v30);
                      }
                      v42 = *(void **)(*((void *)&v67 + 1) + 8 * (void)m);
                      v43 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      {
                        v44 = [(MOEventBundle *)v32 bundleType];
                        v45 = [v42 eventIdentifier];
                        *(_DWORD *)buf = 138412802;
                        id v91 = v44;
                        __int16 v92 = 1024;
                        int v93 = v39 + m + 1;
                        __int16 v94 = 2112;
                        v95 = v45;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "post semantic pruning bundle %@, with subevent %d:\n %@", buf, 0x1Cu);
                      }
                    }
                    id v38 = [v30 countByEnumeratingWithState:&v67 objects:v87 count:16];
                    v39 += (int)m;
                  }
                  while (v38);
                  objc_super v25 = v59;
                  id v12 = v60;
                  id v21 = v57;
                  v31 = v66;
                }
LABEL_42:

                uint64_t v22 = v65 + 1;
              }
              while ((id)(v65 + 1) != v63);
              id v63 = [v21 countByEnumeratingWithState:&v75 objects:v89 count:16];
            }
            while (v63);
          }

          id v3 = v51;
          v6 = v55;
          i = v56;
        }
      }
      id v54 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v54);
  }

  id v46 = _mo_log_facility_get_os_log(&MOLogFacilityBundling);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    id v47 = [(NSMutableDictionary *)self->_eventBundleDict count];
    *(_DWORD *)buf = 134217984;
    id v91 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Bundles created after semantic pruning. Number of correlated bundles: %lu", buf, 0xCu);
  }

  v48 = self->_eventBundleDict;
  return v48;
}

- (id)predicateForBasicFilteringOfEvents
{
  return +[NSPredicate predicateWithBlock:&__block_literal_global_3];
}

BOOL __52__MOEventBundler_predicateForBasicFilteringOfEvents__block_invoke(id a1, MOEvent *a2, NSDictionary *a3)
{
  return [(MOEvent *)a2 category] != 0;
}

+ (id)propertyNameDictionary
{
  double v18 = +[NSString stringWithFormat:@"%@", @"provider"];
  double v17 = +[NSString stringWithFormat:@"%@", @"category"];
  uint64_t v16 = +[NSString stringWithFormat:@"%@", @"workoutType"];
  int v15 = +[NSString stringWithFormat:@"%@", @"placeName"];
  id v14 = +[NSString stringWithFormat:@"%@", @"startDate"];
  v2 = +[NSString stringWithFormat:@"%@", @"endDate"];
  id v3 = +[NSString stringWithFormat:@"%@", @"creationDate"];
  v4 = +[NSString stringWithFormat:@"%@", @"expirationDate"];
  id v5 = +[NSString stringWithFormat:@"%@", @"mediaRepetitions"];
  v6 = +[NSString stringWithFormat:@"%@", @"interactionContactScore"];
  id v13 = +[NSString stringWithFormat:@"%@.%@", @"extendedAttributes", @"photoMomentInferences"];
  id v12 = +[NSString stringWithFormat:@"%@.%@", @"extendedAttributes", @"photoMomentHolidays"];
  id v11 = +[NSString stringWithFormat:@"%@.%@", @"extendedAttributes", @"photoMomentPublicEvents"];
  v7 = +[NSString stringWithFormat:@"%@.%@", @"extendedAttributes", @"photoMomentPersons"];
  id v8 = +[NSString stringWithFormat:@"%@", @"suggestedEventCategory"];
  v19[0] = @"strProvider";
  v19[1] = @"strCategory";
  v20[0] = v18;
  v20[1] = v17;
  v19[2] = @"strWorkoutType";
  v19[3] = @"strPlaceName";
  v20[2] = v16;
  v20[3] = v15;
  v19[4] = @"strStartDate";
  v19[5] = @"strEndDate";
  v20[4] = v14;
  v20[5] = v2;
  v19[6] = @"strCreationDate";
  v19[7] = @"strExpirationDate";
  v20[6] = v3;
  v20[7] = v4;
  v19[8] = @"strMediaRepetitions";
  v19[9] = @"strInteractionContactScore";
  v20[8] = v5;
  v20[9] = v6;
  v19[10] = @"strPhotoMomentInferences";
  v19[11] = @"strPhotoMomentHolidays";
  v20[10] = v13;
  v20[11] = v12;
  v19[12] = @"strPhotoMomentPublicEvents";
  v19[13] = @"strPhotoMomentPersons";
  v20[12] = v11;
  v20[13] = v7;
  v19[14] = @"strSuggestedEventCategory";
  v20[14] = v8;
  id v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:15];

  return v10;
}

+ (id)predicatesOfDesiredExperiences
{
  v2 = +[MOEventBundler propertyNameDictionary];
  v208 = objc_opt_new();
  uint64_t v3 = _HKWorkoutActivityNameForActivityType();
  v4 = [v2 objectForKeyedSubscript:@"strProvider"];
  id v5 = +[NSPredicate predicateWithFormat:@"%K == %i", v4, 1];
  v245[0] = v5;
  v6 = [v2 objectForKeyedSubscript:@"strCategory"];
  v7 = +[NSPredicate predicateWithFormat:@"%K == %i", v6, 2];
  v245[1] = v7;
  id v8 = [v2 objectForKeyedSubscript:@"strWorkoutType"];
  v201 = (void *)v3;
  id v9 = +[NSPredicate predicateWithFormat:@"%K == %@", v8, v3];
  v245[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v245 count:3];
  v207 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  uint64_t v11 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8CC0];
  id v12 = [v2 objectForKeyedSubscript:@"strProvider"];
  id v13 = +[NSPredicate predicateWithFormat:@"%K == %i", v12, 2];
  v244[0] = v13;
  id v14 = [v2 objectForKeyedSubscript:@"strCategory"];
  int v15 = +[NSPredicate predicateWithFormat:@"%K == %i", v14, 5];
  v244[1] = v15;
  uint64_t v16 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v200 = (void *)v11;
  double v17 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v16, v11];
  v244[2] = v17;
  double v18 = +[NSArray arrayWithObjects:v244 count:3];
  uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

  v243[0] = v207;
  v243[1] = v19;
  v199 = (void *)v19;
  SEL v20 = +[NSArray arrayWithObjects:v243 count:2];
  [v208 setObject:v20 forKeyedSubscript:@"HikingPlusPhotos"];

  uint64_t v21 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8CD8];
  uint64_t v22 = [v2 objectForKeyedSubscript:@"strProvider"];
  uint64_t v23 = +[NSPredicate predicateWithFormat:@"%K == %i", v22, 2];
  v242[0] = v23;
  v24 = [v2 objectForKeyedSubscript:@"strCategory"];
  objc_super v25 = +[NSPredicate predicateWithFormat:@"%K == %i", v24, 5];
  v242[1] = v25;
  id v26 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v198 = (void *)v21;
  id v27 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v26, v21];
  v242[2] = v27;
  uint64_t v28 = +[NSArray arrayWithObjects:v242 count:3];
  uint64_t v29 = +[NSCompoundPredicate andPredicateWithSubpredicates:v28];

  v197 = (void *)v29;
  uint64_t v241 = v29;
  id v30 = +[NSArray arrayWithObjects:&v241 count:1];
  [v208 setObject:v30 forKeyedSubscript:@"WeddingPhotos"];

  uint64_t v31 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8CF0];
  v32 = [v2 objectForKeyedSubscript:@"strProvider"];
  id v33 = +[NSPredicate predicateWithFormat:@"%K == %i", v32, 2];
  v240[0] = v33;
  id v34 = [v2 objectForKeyedSubscript:@"strCategory"];
  id v35 = +[NSPredicate predicateWithFormat:@"%K == %i", v34, 5];
  v240[1] = v35;
  id v36 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v196 = (void *)v31;
  id v37 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v36, v31];
  v240[2] = v37;
  id v38 = +[NSArray arrayWithObjects:v240 count:3];
  uint64_t v39 = +[NSCompoundPredicate andPredicateWithSubpredicates:v38];

  v195 = (void *)v39;
  uint64_t v239 = v39;
  uint64_t v40 = +[NSArray arrayWithObjects:&v239 count:1];
  [v208 setObject:v40 forKeyedSubscript:@"AnniversaryPhotos"];

  uint64_t v41 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D08];
  v42 = [v2 objectForKeyedSubscript:@"strProvider"];
  v43 = +[NSPredicate predicateWithFormat:@"%K == %i", v42, 2];
  v238[0] = v43;
  v44 = [v2 objectForKeyedSubscript:@"strCategory"];
  v45 = +[NSPredicate predicateWithFormat:@"%K == %i", v44, 5];
  v238[1] = v45;
  id v46 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v194 = (void *)v41;
  id v47 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v46, v41];
  v238[2] = v47;
  v48 = +[NSArray arrayWithObjects:v238 count:3];
  uint64_t v49 = +[NSCompoundPredicate andPredicateWithSubpredicates:v48];

  v193 = (void *)v49;
  uint64_t v237 = v49;
  v50 = +[NSArray arrayWithObjects:&v237 count:1];
  [v208 setObject:v50 forKeyedSubscript:@"BirthdayPhotos"];

  id v51 = [v2 objectForKeyedSubscript:@"strProvider"];
  v52 = +[NSPredicate predicateWithFormat:@"%K == %i", v51, 4];
  v236[0] = v52;
  uint64_t v53 = [v2 objectForKeyedSubscript:@"strCategory"];
  id v54 = +[NSPredicate predicateWithFormat:@"%K == %i", v53, 1];
  v236[1] = v54;
  v55 = [v2 objectForKeyedSubscript:@"strPlaceName"];
  v56 = +[NSPredicate predicateWithFormat:@"%K.length > 0", v55];
  v236[2] = v56;
  id v57 = +[NSArray arrayWithObjects:v236 count:3];
  v206 = +[NSCompoundPredicate andPredicateWithSubpredicates:v57];

  uint64_t v58 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D20];
  id v59 = [v2 objectForKeyedSubscript:@"strProvider"];
  id v60 = +[NSPredicate predicateWithFormat:@"%K == %i", v59, 2];
  v235[0] = v60;
  int v61 = [v2 objectForKeyedSubscript:@"strCategory"];
  uint64_t v62 = +[NSPredicate predicateWithFormat:@"%K == %i", v61, 5];
  v235[1] = v62;
  id v63 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v192 = (void *)v58;
  v64 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v63, v58];
  v235[2] = v64;
  uint64_t v65 = +[NSArray arrayWithObjects:v235 count:3];
  uint64_t v66 = +[NSCompoundPredicate andPredicateWithSubpredicates:v65];

  v234[0] = v206;
  v191 = (void *)v66;
  v234[1] = v66;
  long long v67 = +[NSArray arrayWithObjects:v234 count:2];
  [v208 setObject:v67 forKeyedSubscript:@"VisitPlusConcert"];

  long long v68 = [v2 objectForKeyedSubscript:@"strProvider"];
  long long v69 = +[NSPredicate predicateWithFormat:@"%K == %i", v68, 4];
  v233[0] = v69;
  long long v70 = [v2 objectForKeyedSubscript:@"strCategory"];
  long long v71 = +[NSPredicate predicateWithFormat:@"%K == %i", v70, 1];
  v233[1] = v71;
  long long v72 = [v2 objectForKeyedSubscript:@"strPlaceName"];
  long long v73 = +[NSPredicate predicateWithFormat:@"%K.length > 0", v72];
  v233[2] = v73;
  long long v74 = +[NSArray arrayWithObjects:v233 count:3];
  v205 = +[NSCompoundPredicate andPredicateWithSubpredicates:v74];

  uint64_t v75 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D38];
  long long v76 = [v2 objectForKeyedSubscript:@"strProvider"];
  long long v77 = +[NSPredicate predicateWithFormat:@"%K == %i", v76, 2];
  v232[0] = v77;
  long long v78 = [v2 objectForKeyedSubscript:@"strCategory"];
  long long v79 = +[NSPredicate predicateWithFormat:@"%K == %i", v78, 5];
  v232[1] = v79;
  long long v80 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v190 = (void *)v75;
  long long v81 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v80, v75];
  v232[2] = v81;
  long long v82 = +[NSArray arrayWithObjects:v232 count:3];
  uint64_t v83 = +[NSCompoundPredicate andPredicateWithSubpredicates:v82];

  v231[0] = v205;
  v189 = (void *)v83;
  v231[1] = v83;
  long long v84 = +[NSArray arrayWithObjects:v231 count:2];
  [v208 setObject:v84 forKeyedSubscript:@"VisitPlusAmusementPark"];

  long long v85 = objc_opt_new();
  for (uint64_t i = 0; i != 248; i += 8)
  {
    v87 = _HKWorkoutActivityNameForActivityType();
    [v85 addObject:v87];
  }
  v88 = [v2 objectForKeyedSubscript:@"strProvider"];
  v89 = +[NSPredicate predicateWithFormat:@"%K == %i", v88, 1];
  v230[0] = v89;
  v90 = [v2 objectForKeyedSubscript:@"strCategory"];
  id v91 = +[NSPredicate predicateWithFormat:@"%K == %i", v90, 2];
  v230[1] = v91;
  __int16 v92 = [v2 objectForKeyedSubscript:@"strWorkoutType"];
  int v93 = +[NSPredicate predicateWithFormat:@"%K IN %@", v92, v85];
  v230[2] = v93;
  __int16 v94 = +[NSArray arrayWithObjects:v230 count:3];
  v188 = +[NSCompoundPredicate andPredicateWithSubpredicates:v94];

  v229 = v188;
  v95 = +[NSArray arrayWithObjects:&v229 count:1];
  [v208 setObject:v95 forKeyedSubscript:@"CardioActivity"];

  v96 = [v2 objectForKeyedSubscript:@"strProvider"];
  v97 = +[NSPredicate predicateWithFormat:@"%K == %i", v96, 1];
  v228[0] = v97;
  v98 = [v2 objectForKeyedSubscript:@"strCategory"];
  v99 = +[NSPredicate predicateWithFormat:@"%K == %i", v98, 2];
  v228[1] = v99;
  v100 = +[NSArray arrayWithObjects:v228 count:2];
  v204 = +[NSCompoundPredicate andPredicateWithSubpredicates:v100];

  v187 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D50];
  v202 = [v2 objectForKeyedSubscript:@"strProvider"];
  v101 = +[NSPredicate predicateWithFormat:@"%K == %i", v202, 2];
  v227[0] = v101;
  v102 = [v2 objectForKeyedSubscript:@"strCategory"];
  v103 = +[NSPredicate predicateWithFormat:@"%K == %i", v102, 5];
  v227[1] = v103;
  v104 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v105 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v104, v187];
  v227[2] = v105;
  v106 = +[NSArray arrayWithObjects:v227 count:3];
  v186 = +[NSCompoundPredicate andPredicateWithSubpredicates:v106];

  v226[0] = v204;
  v226[1] = v186;
  v107 = +[NSArray arrayWithObjects:v226 count:2];
  [v208 setObject:v107 forKeyedSubscript:@"ActiveBabyParent"];

  v185 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D68];
  v108 = [v2 objectForKeyedSubscript:@"strProvider"];
  v109 = +[NSPredicate predicateWithFormat:@"%K == %i", v108, 2];
  v225[0] = v109;
  v110 = [v2 objectForKeyedSubscript:@"strCategory"];
  v111 = +[NSPredicate predicateWithFormat:@"%K == %i", v110, 5];
  v225[1] = v111;
  v112 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v113 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v112, v185];
  v225[2] = v113;
  v114 = +[NSArray arrayWithObjects:v225 count:3];
  v184 = +[NSCompoundPredicate andPredicateWithSubpredicates:v114];

  v224 = v184;
  v115 = +[NSArray arrayWithObjects:&v224 count:1];
  [v208 setObject:v115 forKeyedSubscript:@"BabyParent"];

  v116 = [v2 objectForKeyedSubscript:@"strProvider"];
  v117 = +[NSPredicate predicateWithFormat:@"%K == %i", v116, 1];
  v223[0] = v117;
  v118 = [v2 objectForKeyedSubscript:@"strCategory"];
  v119 = +[NSPredicate predicateWithFormat:@"%K == %i", v118, 2];
  v223[1] = v119;
  v120 = +[NSArray arrayWithObjects:v223 count:2];
  v203 = +[NSCompoundPredicate andPredicateWithSubpredicates:v120];

  v183 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D80];
  v182 = [v2 objectForKeyedSubscript:@"strProvider"];
  v121 = +[NSPredicate predicateWithFormat:@"%K == %i", v182, 2];
  v222[0] = v121;
  v122 = [v2 objectForKeyedSubscript:@"strCategory"];
  v123 = +[NSPredicate predicateWithFormat:@"%K == %i", v122, 5];
  v222[1] = v123;
  v124 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v125 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v124, v183];
  v222[2] = v125;
  v126 = +[NSArray arrayWithObjects:v222 count:3];
  v181 = +[NSCompoundPredicate andPredicateWithSubpredicates:v126];

  v221[0] = v203;
  v221[1] = v181;
  v127 = +[NSArray arrayWithObjects:v221 count:2];
  [v208 setObject:v127 forKeyedSubscript:@"ActivePetParent"];

  v180 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:&off_1002F8D98];
  v128 = [v2 objectForKeyedSubscript:@"strProvider"];
  v129 = +[NSPredicate predicateWithFormat:@"%K == %i", v128, 2];
  v220[0] = v129;
  v130 = [v2 objectForKeyedSubscript:@"strCategory"];
  v131 = +[NSPredicate predicateWithFormat:@"%K == %i", v130, 5];
  v220[1] = v131;
  v132 = [v2 objectForKeyedSubscript:@"strPhotoMomentInferences"];
  v133 = +[NSPredicate predicateWithFormat:@"ANY %K IN %@", v132, v180];
  v220[2] = v133;
  v134 = +[NSArray arrayWithObjects:v220 count:3];
  v179 = +[NSCompoundPredicate andPredicateWithSubpredicates:v134];

  v219 = v179;
  v135 = +[NSArray arrayWithObjects:&v219 count:1];
  [v208 setObject:v135 forKeyedSubscript:@"PetParent"];

  v136 = [v2 objectForKeyedSubscript:@"strProvider"];
  v137 = +[NSPredicate predicateWithFormat:@"%K == %i", v136, 3];
  v218[0] = v137;
  v138 = [v2 objectForKeyedSubscript:@"strCategory"];
  v139 = +[NSPredicate predicateWithFormat:@"%K == %i", v138, 3];
  v218[1] = v139;
  v140 = [v2 objectForKeyedSubscript:@"strMediaRepetitions"];
  v141 = +[NSPredicate predicateWithFormat:@"%K > %@", v140, &off_1002F4850];
  v218[2] = v141;
  v142 = +[NSArray arrayWithObjects:v218 count:3];
  v178 = +[NSCompoundPredicate andPredicateWithSubpredicates:v142];

  v217 = v178;
  v143 = +[NSArray arrayWithObjects:&v217 count:1];
  [v208 setObject:v143 forKeyedSubscript:@"MediaOnRepeat"];

  v144 = [v2 objectForKeyedSubscript:@"strProvider"];
  v145 = +[NSPredicate predicateWithFormat:@"%K == %i", v144, 3];
  v216[0] = v145;
  v146 = [v2 objectForKeyedSubscript:@"strCategory"];
  v147 = +[NSPredicate predicateWithFormat:@"%K == %i", v146, 8];
  v216[1] = v147;
  v148 = +[NSArray arrayWithObjects:v216 count:2];
  v177 = +[NSCompoundPredicate andPredicateWithSubpredicates:v148];

  v215 = v177;
  v149 = +[NSArray arrayWithObjects:&v215 count:1];
  [v208 setObject:v149 forKeyedSubscript:@"TravelEvent"];

  v150 = [v2 objectForKeyedSubscript:@"strProvider"];
  v151 = +[NSPredicate predicateWithFormat:@"%K == %i", v150, 3];
  v214[0] = v151;
  v152 = [v2 objectForKeyedSubscript:@"strCategory"];
  v153 = +[NSPredicate predicateWithFormat:@"%K == %i", v152, 11];
  v214[1] = v153;
  v154 = [v2 objectForKeyedSubscript:@"strSuggestedEventCategory"];
  v155 = +[NSPredicate predicateWithFormat:@"%K == %i", v154, 9];
  v214[2] = v155;
  v156 = +[NSArray arrayWithObjects:v214 count:3];
  v176 = +[NSCompoundPredicate andPredicateWithSubpredicates:v156];

  v213 = v176;
  v157 = +[NSArray arrayWithObjects:&v213 count:1];
  [v208 setObject:v157 forKeyedSubscript:@"StructuredEventMovie"];

  v175 = +[NSPredicate predicateWithFormat:@"SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i OR SELF.suggestedEventCategory = %i", 1, 3, 4, 5];
  v158 = [v2 objectForKeyedSubscript:@"strProvider"];
  v159 = +[NSPredicate predicateWithFormat:@"%K == %i", v158, 3];
  v212[0] = v159;
  v160 = [v2 objectForKeyedSubscript:@"strCategory"];
  v161 = +[NSPredicate predicateWithFormat:@"%K == %i", v160, 11];
  v212[1] = v161;
  v212[2] = v175;
  v162 = +[NSArray arrayWithObjects:v212 count:3];
  v174 = +[NSCompoundPredicate andPredicateWithSubpredicates:v162];

  v211 = v174;
  v163 = +[NSArray arrayWithObjects:&v211 count:1];
  [v208 setObject:v163 forKeyedSubscript:@"StructuredEventTransportation"];

  v164 = [v2 objectForKeyedSubscript:@"strProvider"];
  v165 = +[NSPredicate predicateWithFormat:@"%K == %i", v164, 3];
  v210[0] = v165;
  v166 = [v2 objectForKeyedSubscript:@"strCategory"];
  v167 = +[NSPredicate predicateWithFormat:@"%K == %i", v166, 10];
  v210[1] = v167;
  v168 = [v2 objectForKeyedSubscript:@"strInteractionContactScore"];
  v169 = +[NSPredicate predicateWithFormat:@"%K > %@", v168, &off_1002F96F0];
  v210[2] = v169;
  v170 = +[NSArray arrayWithObjects:v210 count:3];
  v171 = +[NSCompoundPredicate andPredicateWithSubpredicates:v170];

  v209 = v171;
  v172 = +[NSArray arrayWithObjects:&v209 count:1];
  [v208 setObject:v172 forKeyedSubscript:@"SignificantContactInteraction"];

  return v208;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSMutableDictionary)eventBundleDict
{
  return self->_eventBundleDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleDict, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithStartDate:(os_log_t)log endDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v1, 2u);
}

- (void)initWithStartDate:(os_log_t)log endDate:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v1, 2u);
}

- (void)calculateEventBundlesFromEvents:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOEventBundler calculateEventBundlesFromEvents:]";
  __int16 v3 = 1024;
  int v4 = 136;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The events and membership arrays have to be of the same size. (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end