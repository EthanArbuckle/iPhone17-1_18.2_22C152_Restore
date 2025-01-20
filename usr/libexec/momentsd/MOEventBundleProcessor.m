@interface MOEventBundleProcessor
+ (BOOL)_validResource:(id)a3 bundle:(id)a4 denyList:(id)a5 sourceAppBundleIds:(id)a6 removedAppBundleIds:(id)a7 lftaStatusDict:(id)a8;
+ (BOOL)constructLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5;
+ (id)_filterAndAnnotateResults:(id)a3 denyList:(id)a4;
+ (id)_getBundleIdSet:(id)a3;
+ (id)_learningFromAppDenyList;
+ (id)approvedForLearnFromThisApp:(id)a3;
+ (id)onboardingDatesBySourceTypeWithStandardSuite:(BOOL)a3;
+ (id)readLearnedFromTheAppStatusTable;
+ (id)trimmedFrom:(id)a3 with:(id)a4 respectOnboardingDate:(BOOL)a5 shouldUseStandardSuite:(BOOL)a6;
+ (void)_stripMediaActions:(id)a3;
+ (void)persistLearnedFromTheAppStatusTable:(id)a3;
+ (void)updateLearnedFromTheAppDictionary:(id)a3;
+ (void)updateLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5;
@end

@implementation MOEventBundleProcessor

+ (id)approvedForLearnFromThisApp:(id)a3
{
  id v3 = a3;
  v4 = +[MOEventBundleProcessor _learningFromAppDenyList];
  if (v4)
  {
    v5 = +[MOEventBundleProcessor _filterAndAnnotateResults:v3 denyList:v4];
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleProcessor(LearnFromThisApp) approvedForLearnFromThisApp:]();
    }

    v7 = +[NSSet set];
    v5 = +[MOEventBundleProcessor _filterAndAnnotateResults:v3 denyList:v7];
  }

  return v5;
}

+ (id)_learningFromAppDenyList
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.suggestions"];
  id v3 = [v2 objectForKey:@"SiriCanLearnFromAppBlacklist"];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSSet) initWithArray:v3];
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleProcessor(LearnFromThisApp) _learningFromAppDenyList]();
    }

    id v4 = 0;
  }

  return v4;
}

+ (BOOL)_validResource:(id)a3 bundle:(id)a4 denyList:(id)a5 sourceAppBundleIds:(id)a6 removedAppBundleIds:(id)a7 lftaStatusDict:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v13 sourceAppBundleIds];
  if (!v19)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v41 = [v14 bundleIdentifier];
      v42 = [v41 UUIDString];
      *(_DWORD *)buf = 138412290;
      v53 = v42;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource no source app tagging, bundleId=%@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  [v16 unionSet:v19];
  v20 = [v19 mutableCopy];
  [v20 intersectSet:v15];
  if (!v20 || ![v20 count])
  {
    id v51 = v17;
    id v26 = objc_alloc_init((Class)NSDateFormatter);
    v48 = +[NSCalendar currentCalendar];
    [v26 setCalendar:];
    [v26 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    v27 = [v13 getDictionary];
    v28 = [v27 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

    v29 = [v18 objectForKeyedSubscript:v28];

    if (!v29)
    {
      BOOL v40 = 1;
      goto LABEL_19;
    }
    id v45 = v16;
    id v47 = v15;
    [v18 objectForKeyedSubscript:v28];
    v31 = id v30 = v14;
    v32 = [v31 objectForKeyedSubscript:@"active_time"];

    v33 = [v13 getDictionary];
    v34 = [v33 objectForKey:@"MOMediaPlayMetaDataKeyPlayerStartDate"];
    [v34 doubleValue];
    double v36 = v35;

    id v14 = v30;
    if (v32 && v36 != 0.0)
    {
      v37 = [v26 dateFromString:v32];
      id v38 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v36];
      v39 = v38;
      if (v37 && [v38 compare:v37] == (id)-1)
      {
        log = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v53 = v39;
          __int16 v54 = 2112;
          v55 = v37;
          __int16 v56 = 2112;
          id v57 = v13;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "media resource removed due to LFTA switch active time, resource start date, %@, switch active time, %@, resource, %@", buf, 0x20u);
        }

        BOOL v40 = 0;
        goto LABEL_14;
      }
    }
    BOOL v40 = 1;
LABEL_14:
    id v16 = v45;
    id v15 = v47;
LABEL_19:

    id v17 = v51;
    goto LABEL_20;
  }
  v21 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [v20 description];
    [v14 bundleIdentifier];
    id v46 = v15;
    v23 = id v50 = v14;
    [v23 UUIDString];
    v25 = id v24 = v17;
    *(_DWORD *)buf = 138412546;
    v53 = v22;
    __int16 v54 = 2112;
    v55 = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, dropping resource due to LFTA being off for %@, bundleId=%@", buf, 0x16u);

    id v17 = v24;
    id v14 = v50;
    id v15 = v46;
  }
  [v17 unionSet:v20];
LABEL_17:
  BOOL v40 = 0;
LABEL_20:

  return v40;
}

+ (void)_stripMediaActions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [v3 actions];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v10 actionType] != (id)6) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  [v3 setActions:v4];
  v11 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v12 = [v3 backgroundActions];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        if ([v17 actionType] != (id)6) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  [v3 setBackgroundActions:v4];
  [v3 setConcurrentMediaAction:0];
}

+ (id)_getBundleIdSet:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  id v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v7 = [v6 resources];
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              if ([v12 type] == (id)3)
              {
                id v14 = [v12 getDictionary];
                uint64_t v15 = [v14 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

                uint64_t v16 = [v4 setByAddingObject:v15];

                id v4 = (void *)v16;
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  return v4;
}

+ (id)_filterAndAnnotateResults:(id)a3 denyList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v41 = objc_opt_new();
  BOOL v40 = objc_opt_new();
  double v36 = objc_opt_new();
  v34 = +[MOEventBundleProcessor readLearnedFromTheAppStatusTable];
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v34];
  v33 = +[MOEventBundleProcessor _getBundleIdSet:v5];
  id v8 = v6;
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:denyList:statusDict:](MOEventBundleProcessor, "updateLearnedFromTheAppDictionary:denyList:statusDict:");
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  id v38 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v47;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v11 = objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v12 = [v10 resources];
        id v13 = [v12 countByEnumeratingWithState:&v42 objects:v56 count:16];
        if (v13)
        {
          id v14 = v13;
          v39 = i;
          char v15 = 0;
          uint64_t v16 = *(void *)v43;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v43 != v16) {
                objc_enumerationMutation(v12);
              }
              long long v18 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              if ([v18 type] == (id)3)
              {
                unsigned int v19 = !+[MOEventBundleProcessor _validResource:v18 bundle:v10 denyList:v8 sourceAppBundleIds:v41 removedAppBundleIds:v40 lftaStatusDict:v7];
                v15 |= v19;
                if (v19) {
                  continue;
                }
              }
              [v11 addObject:v18];
            }
            id v14 = [v12 countByEnumeratingWithState:&v42 objects:v56 count:16];
          }
          while (v14);

          [v10 setResources:v11];
          i = v39;
          if (v15) {
            +[MOEventBundleProcessor _stripMediaActions:v10];
          }
        }
        else
        {

          [v10 setResources:v11];
        }
        id v20 = [v10 resources];
        id v21 = [v20 count];

        if (v21)
        {
          [v36 addObject:v10];
        }
        else
        {
          long long v22 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            long long v23 = [v10 bundleIdentifier];
            long long v24 = [v23 UUIDString];
            *(_DWORD *)buf = 138412290;
            id v51 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "approvedForLearnFromThisApp, dropping bundle due to no renderable resource. bundleId=%@", buf, 0xCu);
          }
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v38);
  }

  long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v36 count];
    long long v27 = [v41 description];
    long long v28 = [v40 description];
    *(_DWORD *)buf = 134218498;
    id v51 = v26;
    __int16 v52 = 2112;
    v53 = v27;
    __int16 v54 = 2112;
    v55 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "approvedForLearnFromThisApp, allowedBundles.count=%lu, sourceAppBundleIds=%@, removedAppBundleIds=%@", buf, 0x20u);
  }
  v29 = [MOEventBundleProcessorResult alloc];
  id v30 = [v36 copy];
  id v31 = [(MOEventBundleProcessorResult *)v29 init:v30 sourceAppBundleIds:v41 removedAppBundleIds:v40];

  return v31;
}

+ (void)updateLearnedFromTheAppDictionary:(id)a3
{
  id v3 = a3;
  id v6 = +[MOEventBundleProcessor _learningFromAppDenyList];
  id v4 = +[MOEventBundleProcessor readLearnedFromTheAppStatusTable];
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];
  +[MOEventBundleProcessor updateLearnedFromTheAppDictionary:v3 denyList:v6 statusDict:v5];
}

+ (void)updateLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7 = a5;
  if (+[MOEventBundleProcessor constructLearnedFromTheAppDictionary:a3 denyList:a4 statusDict:v7])
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "LFTA status changed, need to update the status table, %@", (uint8_t *)&v9, 0xCu);
    }

    +[MOEventBundleProcessor persistLearnedFromTheAppStatusTable:v7];
  }
}

+ (BOOL)constructLearnedFromTheAppDictionary:(id)a3 denyList:(id)a4 statusDict:(id)a5
{
  id v7 = a3;
  id v47 = a4;
  id v8 = a5;
  long long v49 = objc_opt_new();
  id v9 = objc_alloc_init((Class)NSDateFormatter);
  id v10 = +[NSCalendar currentCalendar];
  [v9 setCalendar:v10];
  long long v44 = v9;
  [v9 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
  BOOL v13 = v12 != 0;
  id obj = v11;
  id v48 = v12;
  if (!v12) {
    goto LABEL_33;
  }
  long long v43 = v10;
  char v14 = 0;
  uint64_t v46 = *(void *)v55;
  do
  {
    char v15 = 0;
    do
    {
      if (*(void *)v55 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v15);
      unsigned int v18 = [v47 containsObject:v16];
      unsigned int v19 = [v8 objectForKeyedSubscript:v16];

      if (v18)
      {
        if (v19)
        {
          id v20 = [v8 objectForKeyedSubscript:v16];
          id v21 = [v20 objectForKey:@"status"];
          if (v21)
          {
            long long v22 = [v8 objectForKeyedSubscript:v16];
            long long v23 = [v22 objectForKey:@"status"];
            unsigned __int8 v24 = [v23 isEqualToString:MOLearnedFromTheAppStatusOn];
          }
          else
          {
            unsigned __int8 v24 = 0;
          }

          v14 |= v24;
        }
        else
        {
          char v14 = 1;
        }
        id v31 = objc_alloc_init((Class)NSMutableDictionary);
        [v31 setObject:MOLearnedFromTheAppStatusOff forKey:@"status"];
      }
      else
      {
        if (v19)
        {
          long long v25 = [v8 objectForKeyedSubscript:v16];
          uint64_t v26 = [v25 objectForKey:@"status"];
          if (v26)
          {
            long long v27 = (void *)v26;
            long long v28 = [v8 objectForKeyedSubscript:v16];
            v29 = [v28 objectForKey:@"status"];
            unsigned int v30 = [v29 isEqualToString:MOLearnedFromTheAppStatusOn];

            if (v30)
            {
              id v31 = [v8 objectForKeyedSubscript:v16];
              goto LABEL_22;
            }
          }
          else
          {
          }
          id v31 = objc_alloc_init((Class)NSMutableDictionary);
          [v31 setObject:MOLearnedFromTheAppStatusOn forKey:@"status"];
          v32 = objc_opt_new();
          v33 = [v44 stringFromDate:v32];
          [v31 setObject:v33 forKey:@"active_time"];
        }
        else
        {
          id v31 = objc_alloc_init((Class)NSMutableDictionary);
          [v31 setObject:MOLearnedFromTheAppStatusOn forKey:@"status"];
          v32 = objc_opt_new();
          v33 = [v32 dateByAddingTimeInterval:-2419200.0];
          v34 = [v44 stringFromDate:v33];
          [v31 setObject:v34 forKey:@"active_time"];
        }
        char v14 = 1;
      }
LABEL_22:
      [v49 setObject:v31 forKey:v16];

      char v15 = (char *)v15 + 1;
    }
    while (v48 != v15);
    id v48 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  }
  while (v48);

  if (v14)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v11 = [v49 allKeys];
    id v35 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v11);
          }
          uint64_t v39 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          v41 = [v49 objectForKeyedSubscript:v39];
          [v8 setObject:v41 forKey:v39];
        }
        id v36 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v36);
    }
    id v10 = v43;
    BOOL v13 = 1;
LABEL_33:
  }
  else
  {
    BOOL v13 = 0;
    id v10 = v43;
  }

  return v13;
}

+ (id)readLearnedFromTheAppStatusTable
{
  id v2 = +[MOPersistenceUtilities userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    id v4 = [v3 URLByAppendingPathComponent:@"learnedFromTheApp.plist"];

    id v5 = +[NSFileManager defaultManager];
    id v6 = [v4 path];
    unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v21 = @"learnedFromTheApp.plist";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
      }

      id v19 = 0;
      id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v4 error:&v19];
      id v11 = v19;
      if (v11)
      {
        id v12 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable];
        }

        uint64_t v18 = 0;
        [v5 removeItemAtURL:v4 error:&v18];
        if (v18)
        {
          BOOL v13 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable]();
          }
        }
        id v14 = objc_alloc_init((Class)NSDictionary);
      }
      else
      {
        id v14 = v10;
      }
      id v16 = v14;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
      }

      id v16 = objc_alloc_init((Class)NSDictionary);
    }
  }
  else
  {
    char v15 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleProcessor(LearnFromThisApp) readLearnedFromTheAppStatusTable]();
    }

    id v16 = objc_alloc_init((Class)NSDictionary);
  }

  return v16;
}

+ (void)persistLearnedFromTheAppStatusTable:(id)a3
{
  id v3 = a3;
  id v4 = +[MOPersistenceUtilities userCacheDirectoryPath];
  if (v4)
  {
    id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
    id v6 = [v5 URLByAppendingPathComponent:@"learnedFromTheApp.plist"];

    if (v6)
    {
      id v13 = 0;
      unsigned __int8 v7 = [v3 writeToURL:v6 error:&v13];
      id v8 = v13;
      BOOL v9 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
      id v10 = v9;
      if (v8 || (v7 & 1) == 0)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:]((uint64_t)v8, v10);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "LFTA status were successfully written to plist.", v12, 2u);
      }

      goto LABEL_15;
    }
  }
  else
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:]();
    }
  }
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[MOEventBundleProcessor(LearnFromThisApp) persistLearnedFromTheAppStatusTable:]();
  }
LABEL_15:
}

+ (id)onboardingDatesBySourceTypeWithStandardSuite:(BOOL)a3
{
  if (a3) {
    id v3 = [[MODefaultsManager alloc] initWithSuiteName:@"com.apple.momentsd"];
  }
  else {
    id v3 = objc_alloc_init(MODefaultsManager);
  }
  id v4 = v3;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = +[MOEventBundleSourceTypes all];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [(MODefaultsManager *)v4 onboardingDateFor:v11];
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [(MODefaultsManager *)v4 onboardingDateForJournalingSuggestions];
  [v5 setObject:v13 forKeyedSubscript:@"OnboardingDate"];

  return v5;
}

+ (id)trimmedFrom:(id)a3 with:(id)a4 respectOnboardingDate:(BOOL)a5 shouldUseStandardSuite:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 description];
    *(_DWORD *)buf = 138412802;
    v371 = v12;
    __int16 v372 = 1024;
    *(_DWORD *)v373 = v7;
    *(_WORD *)&v373[4] = 1024;
    *(_DWORD *)&v373[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "trimmedFrom, allowedSourceTypes=%@, respectOnboardingDate=%d, shouldUseStandardSuite=%d", buf, 0x18u);
  }
  v288 = objc_opt_new();
  id v13 = +[MOEventBundleSourceTypes all];
  id v14 = [v13 mutableCopy];

  [v14 minusSet:v10];
  id v297 = v14;
  if (v7)
  {
    v318 = +[MOEventBundleProcessor onboardingDatesBySourceTypeWithStandardSuite:v6];
    long long v15 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = [v318 description];
      *(_DWORD *)buf = 138412290;
      v371 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "trimmedFrom, onboardingDates=%@", buf, 0xCu);
    }
  }
  else
  {
    v318 = 0;
  }
  long long v369 = 0u;
  long long v368 = 0u;
  long long v367 = 0u;
  long long v366 = 0u;
  id obj = v9;
  id v292 = [obj countByEnumeratingWithState:&v366 objects:v399 count:16];
  if (v292)
  {
    if (v318) {
      BOOL v17 = v7;
    }
    else {
      BOOL v17 = 0;
    }
    BOOL v290 = v17;
    uint64_t v296 = *(void *)v367;
    v283 = &v386;
    id v313 = v10;
    BOOL v317 = v7;
    do
    {
      id v18 = 0;
      id v19 = v292;
      do
      {
        if (*(void *)v367 != v296) {
          objc_enumerationMutation(obj);
        }
        v298 = (char *)v18;
        v310 = *(void **)(*((void *)&v366 + 1) + 8 * (void)v18);
        id v20 = [v310 copy:v283];
        id v21 = objc_alloc((Class)NSSet);
        v314 = v20;
        long long v22 = [v20 primarySourceTypes];
        id v23 = [v21 initWithArray:v22];

        unsigned __int8 v24 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = [v310 bundleIdentifier];
          uint64_t v26 = [v25 UUIDString];
          id v27 = [v310 interfaceType];
          long long v28 = [v23 description];
          *(_DWORD *)buf = 138412802;
          v371 = v26;
          __int16 v372 = 2048;
          *(void *)v373 = v27;
          *(_WORD *)&v373[8] = 2112;
          id v374 = v28;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "trimmedFrom, processing candidate bundleID=%@, interfaceType=%lu, primaryTypes=%@", buf, 0x20u);
        }
        v308 = v23;
        if ([v23 intersectsSet:v297])
        {
          v29 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          unsigned int v30 = v314;
          v320 = v29;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = [v23 description];
            *(_DWORD *)buf = 138412290;
            v371 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event disallowed, primaryTypes=%@", buf, 0xCu);
          }
          v32 = v298;
          goto LABEL_290;
        }
        unsigned int v30 = v314;
        if (v290)
        {
          v320 = objc_opt_new();
          long long v362 = 0u;
          long long v363 = 0u;
          long long v364 = 0u;
          long long v365 = 0u;
          id v321 = [v314 events];
          id v33 = [v321 countByEnumeratingWithState:&v362 objects:v398 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v363;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v363 != v35) {
                  objc_enumerationMutation(v321);
                }
                uint64_t v37 = *(void **)(*((void *)&v362 + 1) + 8 * i);
                id v38 = [v37 bundleSourceType];
                uint64_t v39 = [v318 objectForKeyedSubscript:];
                BOOL v40 = [v37 startDate];
                v309 = (void *)v39;
                unsigned int v41 = [v40 isAfterDate:v39];

                if (v41)
                {
                  long long v42 = [v37 eventIdentifier];

                  if (v42)
                  {
                    long long v43 = [v37 eventIdentifier];
                    [v320 addObject:v43];
                  }
                }
                long long v44 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v46 = [v37 eventIdentifier];
                  id v47 = [v46 UUIDString];
                  *(_DWORD *)buf = 138412802;
                  v371 = v38;
                  __int16 v372 = 2112;
                  *(void *)v373 = v47;
                  *(_WORD *)&v373[8] = 1024;
                  LODWORD(v374) = v41;
                  _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "trimmedFrom, event onboarding date check, sourceType=%@, id=%@, valid=%d", buf, 0x1Cu);
                }
                long long v45 = v38;
                if ([v308 containsObject:v38]
                  && ([v10 containsObject:v38] & v41 & 1) == 0)
                {
                  v64 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  v319 = v64;
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    v65 = [v310 bundleIdentifier];
                    v66 = [v65 UUIDString];
                    *(_DWORD *)buf = 138412290;
                    v371 = v66;
                    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, primary event before onboarding date, bundleID=%@", buf, 0xCu);
                  }
                  id v19 = v292;
                  v32 = v298;
                  unsigned int v30 = v314;
                  goto LABEL_289;
                }
              }
              id v34 = [v321 countByEnumeratingWithState:&v362 objects:v398 count:16];
            }
            while (v34);
          }

          id v19 = v292;
          unsigned int v30 = v314;
        }
        else
        {
          v320 = 0;
        }
        id v321 = (id)objc_opt_new();
        id v48 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          v70 = [v30 action];
          v71 = [v314 actions];
          *(_DWORD *)buf = 138412546;
          v371 = v70;
          __int16 v372 = 2112;
          *(void *)v373 = v71;
          _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "trimmedFrom, action=%@, actions=%@", buf, 0x16u);

          unsigned int v30 = v314;
        }

        long long v49 = [v30 action];
        v309 = [v49 bundleSourceType];
        v295 = v49;
        if (v49)
        {
          if (([v10 containsObject:v309] & 1) == 0)
          {
            v67 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            v319 = v67;
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              v68 = [v30 bundleIdentifier];
              v69 = [v68 UUIDString];
              *(_DWORD *)buf = 138412290;
              v371 = v69;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "trimmedFrom, primary action not allowed, dropping bundle, bundleID=%@", buf, 0xCu);

              unsigned int v30 = v314;
            }
            goto LABEL_57;
          }
          if (v7)
          {
            uint64_t v50 = [v49 sourceEventIdentifier];
            if (v50)
            {
              long long v51 = (void *)v50;
              long long v52 = [v295 sourceEventIdentifier];
              unsigned __int8 v53 = [v320 containsObject:v52];

              unsigned int v30 = v314;
              if ((v53 & 1) == 0)
              {
                v72 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                v319 = v72;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                {
                  v73 = [v314 bundleIdentifier];
                  v74 = [v73 UUIDString];
                  long long v45 = v295;
                  v75 = [v295 sourceEventIdentifier];
                  v76 = [v75 UUIDString];
                  *(_DWORD *)buf = 138412546;
                  v371 = v74;
                  __int16 v372 = 2112;
                  *(void *)v373 = v76;
                  _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "trimmedFrom, primary action past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

                  unsigned int v30 = v314;
                  v32 = v298;
                  goto LABEL_289;
                }
LABEL_57:
                v32 = v298;
                long long v45 = v295;
                goto LABEL_289;
              }
            }
          }
        }
        long long v54 = [v30 concurrentMediaAction];

        if (!v54) {
          goto LABEL_67;
        }
        unsigned int v55 = [v10 containsObject:MOEventBundleSourceTypeMedia[0]];
        if (v55)
        {
          if (!v7) {
            goto LABEL_63;
          }
          [v30 concurrentMediaAction];
          v57 = long long v56 = v30;
          uint64_t v58 = [v57 sourceEventIdentifier];
          if (!v58)
          {

LABEL_63:
            int v63 = 1;
            goto LABEL_64;
          }
          v59 = (void *)v58;
          v60 = [v56 concurrentMediaAction];
          v61 = [v60 sourceEventIdentifier];
          unsigned __int8 v62 = [v320 containsObject:v61];

          if (v62) {
            goto LABEL_63;
          }
          int v63 = 0;
          unsigned int v30 = v314;
        }
        else
        {
          int v63 = 1;
        }
        [v30 setConcurrentMediaAction:0];
LABEL_64:
        v77 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          v78 = [v314 bundleIdentifier];
          v79 = [v78 UUIDString];
          *(_DWORD *)buf = 138413058;
          v371 = v79;
          __int16 v372 = 1024;
          *(_DWORD *)v373 = v55;
          *(_WORD *)&v373[4] = 1024;
          *(_DWORD *)&v373[6] = v63;
          LOWORD(v374) = 1024;
          *(_DWORD *)((char *)&v374 + 2) = v7;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "trimmedFrom, checking concurrent media action, bundleID=%@, validConcurrentMediaAction=%d, hasValidConcurrentMediaDate=%d, respectOnboardingDate=%d", buf, 0x1Eu);
        }
        unsigned int v30 = v314;
LABEL_67:
        v319 = objc_opt_new();
        long long v358 = 0u;
        long long v359 = 0u;
        long long v360 = 0u;
        long long v361 = 0u;
        v80 = [v30 actions];
        id v81 = [v80 countByEnumeratingWithState:&v358 objects:v397 count:16];
        if (!v81) {
          goto LABEL_83;
        }
        id v82 = v81;
        uint64_t v83 = *(void *)v359;
        do
        {
          for (j = 0; j != v82; j = (char *)j + 1)
          {
            if (*(void *)v359 != v83) {
              objc_enumerationMutation(v80);
            }
            v85 = *(void **)(*((void *)&v358 + 1) + 8 * (void)j);
            v86 = [v85 bundleSourceType];
            unsigned int v87 = [v10 containsObject:v86];
            if (v7)
            {
              if (v87)
              {
                v88 = [v85 sourceEventIdentifier];
                unsigned __int8 v89 = [v320 containsObject:v88];

                if (v89)
                {
LABEL_80:
                  v92 = [v85 copy];
                  [v319 addObject:v92];
                  goto LABEL_81;
                }
              }
            }
            else if (v87)
            {
              goto LABEL_80;
            }
            v90 = [v85 sourceEventIdentifier];

            if (v90)
            {
              v91 = [v85 sourceEventIdentifier];
              [v321 addObject:v91];
            }
            v92 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              v93 = [v85 description];
              *(_DWORD *)buf = 138412546;
              v371 = v93;
              __int16 v372 = 2112;
              *(void *)v373 = v86;
              _os_log_debug_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "trimmedFrom, action not allowed, action=%@, sourceType=%@", buf, 0x16u);
            }
LABEL_81:
          }
          id v82 = [v80 countByEnumeratingWithState:&v358 objects:v397 count:16];
        }
        while (v82);
LABEL_83:

        [v314 setActions:v319];
        v294 = objc_opt_new();
        long long v354 = 0u;
        long long v355 = 0u;
        long long v356 = 0u;
        long long v357 = 0u;
        v94 = [v314 backgroundActions];
        id v95 = [v94 countByEnumeratingWithState:&v354 objects:v396 count:16];
        if (!v95) {
          goto LABEL_99;
        }
        id v96 = v95;
        uint64_t v97 = *(void *)v355;
        while (2)
        {
          uint64_t v98 = 0;
          while (2)
          {
            if (*(void *)v355 != v97) {
              objc_enumerationMutation(v94);
            }
            v99 = *(void **)(*((void *)&v354 + 1) + 8 * v98);
            v100 = [v99 bundleSourceType];
            unsigned int v101 = [v10 containsObject:v100];
            if (!v7)
            {
              if (!v101) {
                goto LABEL_91;
              }
LABEL_96:
              v106 = [v99 copy];
              [v319 addObject:v106];
              goto LABEL_97;
            }
            if (v101)
            {
              v102 = [v99 sourceEventIdentifier];
              unsigned __int8 v103 = [v320 containsObject:v102];

              if (v103) {
                goto LABEL_96;
              }
            }
LABEL_91:
            v104 = [v99 sourceEventIdentifier];

            if (v104)
            {
              v105 = [v99 sourceEventIdentifier];
              [v321 addObject:v105];
            }
            v106 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
            {
              v107 = [v99 description];
              *(_DWORD *)buf = 138412546;
              v371 = v107;
              __int16 v372 = 2112;
              *(void *)v373 = v100;
              _os_log_debug_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "trimmedFrom, background action not allowed, action=%@, sourceType=%@", buf, 0x16u);
            }
LABEL_97:

            if (v96 != (id)++v98) {
              continue;
            }
            break;
          }
          id v96 = [v94 countByEnumeratingWithState:&v354 objects:v396 count:16];
          if (v96) {
            continue;
          }
          break;
        }
LABEL_99:

        unsigned int v30 = v314;
        [v314 setBackgroundActions:v294];
        v108 = [v314 place];
        v293 = MOEventBundleSourceTypeVisitLocation[0];
        v289 = v108;
        if (!v108) {
          goto LABEL_104;
        }
        if (([v10 containsObject:v293] & 1) == 0)
        {
          v155 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
          v315 = v155;
          if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
          {
            v156 = [v314 bundleIdentifier];
            v157 = [v156 UUIDString];
            *(_DWORD *)buf = 138412290;
            v371 = v157;
            _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "trimmedFrom, primary place not allowed, dropping bundle, bundleID=%@", buf, 0xCu);
            goto LABEL_152;
          }
LABEL_153:
          id v19 = v292;
          v32 = v298;
          long long v45 = v295;
          goto LABEL_288;
        }
        if (v7)
        {
          uint64_t v109 = [v108 sourceEventIdentifier];
          if (v109)
          {
            v110 = (void *)v109;
            v111 = [v108 sourceEventIdentifier];
            unsigned __int8 v112 = [v320 containsObject:v111];

            unsigned int v30 = v314;
            if ((v112 & 1) == 0)
            {
              v231 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              v315 = v231;
              if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
              {
                v156 = [v314 bundleIdentifier];
                v157 = [v156 UUIDString];
                v232 = [v108 sourceEventIdentifier];
                v233 = [v232 UUIDString];
                *(_DWORD *)buf = 138412546;
                v371 = v157;
                __int16 v372 = 2112;
                *(void *)v373 = v233;
                _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_INFO, "trimmedFrom, primary place past onboarding date, dropping bundle, bundleID=%@, sourceID=%@", buf, 0x16u);

LABEL_152:
                unsigned int v30 = v314;
              }
              goto LABEL_153;
            }
          }
        }
LABEL_104:
        v315 = objc_opt_new();
        long long v350 = 0u;
        long long v351 = 0u;
        long long v352 = 0u;
        long long v353 = 0u;
        v113 = [v30 places];
        id v114 = [v113 countByEnumeratingWithState:&v350 objects:v395 count:16];
        if (!v114) {
          goto LABEL_120;
        }
        id v115 = v114;
        uint64_t v116 = *(void *)v351;
        while (2)
        {
          uint64_t v117 = 0;
          while (2)
          {
            if (*(void *)v351 != v116) {
              objc_enumerationMutation(v113);
            }
            v118 = *(void **)(*((void *)&v350 + 1) + 8 * v117);
            v119 = MOEventBundleSourceTypeVisitLocation[0];
            unsigned int v120 = [v10 containsObject:v119];
            if (!v7)
            {
              if (!v120) {
                goto LABEL_112;
              }
LABEL_117:
              v125 = [v118 copy];
              [v315 addObject:v125];
              goto LABEL_118;
            }
            if (v120)
            {
              v121 = [v118 sourceEventIdentifier];
              unsigned __int8 v122 = [v320 containsObject:v121];

              if (v122) {
                goto LABEL_117;
              }
            }
LABEL_112:
            v123 = [v118 sourceEventIdentifier];

            if (v123)
            {
              v124 = [v118 sourceEventIdentifier];
              [v321 addObject:v124];
            }
            v125 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              v126 = [v118 description];
              *(_DWORD *)buf = 138412546;
              v371 = v126;
              __int16 v372 = 2112;
              *(void *)v373 = v119;
              _os_log_debug_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEBUG, "trimmedFrom, place not allowed, action=%@, sourceType=%@", buf, 0x16u);
            }
LABEL_118:

            if (v115 != (id)++v117) {
              continue;
            }
            break;
          }
          id v115 = [v113 countByEnumeratingWithState:&v350 objects:v395 count:16];
          if (v115) {
            continue;
          }
          break;
        }
LABEL_120:

        v127 = v314;
        [v314 setPlaces:v315];
        unsigned __int8 v128 = [v10 containsObject:MOEventBundleSourceTypeContact[0]];
        if (!v7) {
          goto LABEL_145;
        }
        unsigned __int8 v306 = v128;
        v316 = objc_opt_new();
        long long v346 = 0u;
        long long v347 = 0u;
        long long v348 = 0u;
        long long v349 = 0u;
        id v311 = [v314 persons];
        id v129 = [v311 countByEnumeratingWithState:&v346 objects:v394 count:16];
        if (!v129) {
          goto LABEL_142;
        }
        id v130 = v129;
        uint64_t v131 = *(void *)v347;
        while (2)
        {
          v132 = 0;
          while (2)
          {
            if (*(void *)v347 != v131) {
              objc_enumerationMutation(v311);
            }
            v133 = *(void **)(*((void *)&v346 + 1) + 8 * (void)v132);
            v134 = [v318 objectForKeyedSubscript:MOEventBundleSourceTypePhoto[0]];
            v135 = [v133 sourceEventIdentifier];
            if ([v320 containsObject:v135])
            {

              goto LABEL_128;
            }
            if ([v133 sourceEventAccessType] != (id)4)
            {

              goto LABEL_133;
            }
            v138 = [v310 startDate];
            unsigned int v139 = [v138 isAfterDate:v134];

            if (v139)
            {
LABEL_128:
              id v136 = [v133 copy];
              [v316 addObject:v136];
              int v137 = 1;
              goto LABEL_135;
            }
LABEL_133:
            v140 = [v133 sourceEventIdentifier];

            if (v140)
            {
              id v136 = [v133 sourceEventIdentifier];
              [v321 addObject:v136];
              int v137 = 0;
LABEL_135:
            }
            else
            {
              int v137 = 0;
            }
            v141 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            {
              v142 = [v310 bundleIdentifier];
              v143 = [v142 UUIDString];
              v144 = [v133 sourceEventIdentifier];
              v145 = [v144 UUIDString];
              *(_DWORD *)buf = 138412802;
              v371 = v143;
              __int16 v372 = 2112;
              *(void *)v373 = v145;
              *(_WORD *)&v373[8] = 1024;
              LODWORD(v374) = v137;
              _os_log_debug_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEBUG, "trimmedFrom, checking person date, bundleID=%@, personID=%@, validDate=%d", buf, 0x1Cu);

              id v10 = v313;
            }

            v132 = (char *)v132 + 1;
            BOOL v7 = v317;
            if (v130 != v132) {
              continue;
            }
            break;
          }
          id v146 = [v311 countByEnumeratingWithState:&v346 objects:v394 count:16];
          id v130 = v146;
          if (v146) {
            continue;
          }
          break;
        }
LABEL_142:

        [v314 setPersons:v316];
        if ([v308 containsObject:MOEventBundleSourceTypeContact[0]])
        {
          v147 = [v314 persons];
          id v148 = [v147 count];

          if (!v148)
          {
            v226 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
            {
              v227 = [v310 bundleIdentifier];
              v228 = [v227 UUIDString];
              *(_DWORD *)buf = 138412290;
              v371 = v228;
              _os_log_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_DEFAULT, "trimmedFrom, dropping, no allowable persons, bundleID=%@", buf, 0xCu);
            }
            id v19 = v292;
            goto LABEL_227;
          }
        }

        v127 = v314;
        unsigned __int8 v128 = v306;
LABEL_145:
        if ((v128 & 1) == 0) {
          [v127 setPersons:0];
        }
        v149 = [v127 place];
        v150 = [v149 sourceEventIdentifier];
        unsigned int v151 = [v321 containsObject:v150];

        if (!v151)
        {
          v316 = objc_opt_new();
          long long v342 = 0u;
          long long v343 = 0u;
          long long v344 = 0u;
          long long v345 = 0u;
          v158 = [v127 places];
          id v159 = [v158 countByEnumeratingWithState:&v342 objects:v393 count:16];
          if (v159)
          {
            id v160 = v159;
            uint64_t v161 = *(void *)v343;
            do
            {
              for (k = 0; k != v160; k = (char *)k + 1)
              {
                if (*(void *)v343 != v161) {
                  objc_enumerationMutation(v158);
                }
                v163 = *(void **)(*((void *)&v342 + 1) + 8 * (void)k);
                v164 = [v163 sourceEventIdentifier];
                unsigned __int8 v165 = [v321 containsObject:v164];

                if (v165)
                {
                  v166 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
                  {
                    v167 = [v314 bundleIdentifier];
                    v168 = [v167 UUIDString];
                    v169 = [v163 sourceEventIdentifier];
                    v170 = [v169 UUIDString];
                    *(_DWORD *)buf = 138412546;
                    v371 = v168;
                    __int16 v372 = 2112;
                    *(void *)v373 = v170;
                    _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_INFO, "trimmedFrom, dropping place in final consistency pass, bundleID=%@, placeID=%@", buf, 0x16u);
                  }
                }
                else
                {
                  [v316 addObject:v163];
                }
              }
              id v160 = [v158 countByEnumeratingWithState:&v342 objects:v393 count:16];
            }
            while (v160);
          }

          [v314 setPlaces:v316];
          v171 = [v314 action];
          v172 = [v171 sourceEventIdentifier];
          unsigned int v173 = [v321 containsObject:v172];

          if (v173)
          {
            v174 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            id v19 = v292;
            if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
            {
              v175 = [v314 bundleIdentifier];
              v176 = [v175 UUIDString];
              *(_DWORD *)buf = 138412290;
              v371 = v176;
              _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_INFO, "trimmedFrom, primary action on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);
            }
            id v10 = v313;
            v32 = v298;
            long long v45 = v295;
            goto LABEL_286;
          }
          v307 = objc_opt_new();
          long long v338 = 0u;
          long long v339 = 0u;
          long long v340 = 0u;
          long long v341 = 0u;
          v177 = [v314 actions];
          id v178 = [v177 countByEnumeratingWithState:&v338 objects:v392 count:16];
          if (v178)
          {
            id v179 = v178;
            uint64_t v180 = *(void *)v339;
            do
            {
              for (m = 0; m != v179; m = (char *)m + 1)
              {
                if (*(void *)v339 != v180) {
                  objc_enumerationMutation(v177);
                }
                v182 = *(void **)(*((void *)&v338 + 1) + 8 * (void)m);
                v183 = [v182 sourceEventIdentifier];
                unsigned __int8 v184 = [v321 containsObject:v183];

                if (v184)
                {
                  v185 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                  {
                    v186 = [v314 bundleIdentifier];
                    v187 = [v186 UUIDString];
                    v188 = [v182 sourceEventIdentifier];
                    v189 = [v188 UUIDString];
                    *(_DWORD *)buf = 138412546;
                    v371 = v187;
                    __int16 v372 = 2112;
                    *(void *)v373 = v189;
                    _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_INFO, "trimmedFrom, dropping action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);
                  }
                }
                else
                {
                  [v307 addObject:v182];
                }
              }
              id v179 = [v177 countByEnumeratingWithState:&v338 objects:v392 count:16];
            }
            while (v179);
          }

          [v314 setActions:v307];
          v305 = objc_opt_new();
          long long v334 = 0u;
          long long v335 = 0u;
          long long v336 = 0u;
          long long v337 = 0u;
          v190 = [v314 backgroundActions];
          id v191 = [v190 countByEnumeratingWithState:&v334 objects:v391 count:16];
          if (v191)
          {
            id v192 = v191;
            uint64_t v193 = *(void *)v335;
            do
            {
              for (n = 0; n != v192; n = (char *)n + 1)
              {
                if (*(void *)v335 != v193) {
                  objc_enumerationMutation(v190);
                }
                v195 = *(void **)(*((void *)&v334 + 1) + 8 * (void)n);
                v196 = [v195 sourceEventIdentifier];
                unsigned __int8 v197 = [v321 containsObject:v196];

                if (v197)
                {
                  v198 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
                  {
                    v199 = [v314 bundleIdentifier];
                    v200 = [v199 UUIDString];
                    v201 = [v195 sourceEventIdentifier];
                    v202 = [v201 UUIDString];
                    *(_DWORD *)buf = 138412546;
                    v371 = v200;
                    __int16 v372 = 2112;
                    *(void *)v373 = v202;
                    _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_INFO, "trimmedFrom, dropping background action in final consistency pass, bundleID=%@, actionID=%@", buf, 0x16u);
                  }
                }
                else
                {
                  [v305 addObject:v195];
                }
              }
              id v192 = [v190 countByEnumeratingWithState:&v334 objects:v391 count:16];
            }
            while (v192);
          }

          [v314 setBackgroundActions:v305];
          id v312 = (id)objc_opt_new();
          long long v330 = 0u;
          long long v331 = 0u;
          long long v332 = 0u;
          long long v333 = 0u;
          v203 = [v314 resources];
          id v204 = [v203 countByEnumeratingWithState:&v330 objects:v390 count:16];
          id v10 = v313;
          if (v204)
          {
            id v205 = v204;
            uint64_t v206 = *(void *)v331;
            uint64_t v303 = *(void *)v331;
            do
            {
              for (ii = 0; ii != v205; ii = (char *)ii + 1)
              {
                if (*(void *)v331 != v206) {
                  objc_enumerationMutation(v203);
                }
                v208 = *(void **)(*((void *)&v330 + 1) + 8 * (void)ii);
                v209 = [v208 bundleSourceType];
                unsigned int v210 = [v10 containsObject:v209];
                if (v7)
                {
                  id v211 = v205;
                  v212 = [v208 sourceEventIdentifier];
                  unsigned int v213 = [v320 containsObject:v212];

                  if ([v209 isEqualToString:MOEventBundleSourceTypePhoto[0]])
                  {
                    v214 = v203;
                    v215 = [v318 objectForKeyedSubscript:v209];
                    v216 = [v208 photoLocalDate];
                    if ([v310 interfaceType] == (id)10)
                    {
                      id v217 = [v310 creationDate];
                    }
                    else
                    {
                      id v217 = v216;
                    }
                    unsigned int v218 = [v217 isAfterDate:v215];

                    v203 = v214;
                    uint64_t v206 = v303;
                  }
                  else
                  {
                    unsigned int v218 = [v209 isEqualToString:MOEventBundleSourceTypeReflectionPrompt[0]] | v213;
                  }
                  id v205 = v211;
                  BOOL v7 = v317;
                }
                else
                {
                  unsigned int v218 = 1;
                }
                if ((v210 & v218) == 1)
                {
                  v219 = [v208 copy];
                  [v312 addObject:v219];
                }
                else
                {
                  v219 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                  if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    v371 = v209;
                    __int16 v372 = 1024;
                    *(_DWORD *)v373 = v218;
                    *(_WORD *)&v373[4] = 1024;
                    *(_DWORD *)&v373[6] = v7;
                    _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_INFO, "trimmedFrom, resource failed conditions, type=%@, hasValidOnboardingDate=%d, respectOnboardingDate=%d", buf, 0x18u);
                  }
                }

                id v10 = v313;
              }
              id v205 = [v203 countByEnumeratingWithState:&v330 objects:v390 count:16];
            }
            while (v205);
          }

          [v318 objectForKeyedSubscript:@"OnboardingDate"];
          v304 = long long v45 = v295;
          if (!v304) {
            goto LABEL_269;
          }
          long long v328 = 0u;
          long long v329 = 0u;
          long long v326 = 0u;
          long long v327 = 0u;
          id v220 = v312;
          id v221 = [v220 countByEnumeratingWithState:&v326 objects:v389 count:16];
          if (v221)
          {
            id v222 = v221;
            uint64_t v223 = *(void *)v327;
            while (2)
            {
              for (jj = 0; jj != v222; jj = (char *)jj + 1)
              {
                if (*(void *)v327 != v223) {
                  objc_enumerationMutation(v220);
                }
                if ([*(id *)(*((void *)&v326 + 1) + 8 * (void)jj) type] == (id)2)
                {
                  char v225 = 1;
                  goto LABEL_230;
                }
              }
              id v222 = [v220 countByEnumeratingWithState:&v326 objects:v389 count:16];
              if (v222) {
                continue;
              }
              break;
            }
          }
          char v225 = 0;
LABEL_230:

          v229 = [v310 place];
          if (v229)
          {
            BOOL v230 = 1;
          }
          else
          {
            v234 = [v310 places];
            if (v234)
            {
              v235 = [v310 places];
              BOOL v230 = [v235 count] != 0;

              long long v45 = v295;
            }
            else
            {
              BOOL v230 = 0;
            }
          }
          char v236 = v225 | !v230;
          BOOL v7 = v317;
          if ((v236 & 1) == 0)
          {
            v301 = [v310 place];
            if (v301)
            {
              v237 = [v301 startDate];
              unsigned int v238 = [v237 isBeforeDate:v304];

              if (v238)
              {
                v239 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                if (os_log_type_enabled(v239, OS_LOG_TYPE_INFO))
                {
                  v240 = [v314 bundleIdentifier];
                  v241 = [v240 UUIDString];
                  v242 = [v301 startDate];
                  v243 = [v242 description];
                  *(_DWORD *)buf = 138412546;
                  v371 = v241;
                  __int16 v372 = 2112;
                  *(void *)v373 = v243;
                  _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping primary place, bundleID=%@, placeStartDate=%@", buf, 0x16u);
                }
                [v310 setPlace:0];
              }
            }
            v299 = objc_opt_new();
            long long v322 = 0u;
            long long v323 = 0u;
            long long v324 = 0u;
            long long v325 = 0u;
            v244 = [v310 places];
            id v245 = [v244 countByEnumeratingWithState:&v322 objects:v388 count:16];
            if (v245)
            {
              id v246 = v245;
              uint64_t v247 = *(void *)v323;
              do
              {
                for (kk = 0; kk != v246; kk = (char *)kk + 1)
                {
                  if (*(void *)v323 != v247) {
                    objc_enumerationMutation(v244);
                  }
                  uint64_t v249 = *(void *)(*((void *)&v322 + 1) + 8 * (void)kk);
                  if (v249
                    && ([*(id *)(*((void *)&v322 + 1) + 8 * (void)kk) startDate],
                        v250 = objc_claimAutoreleasedReturnValue(),
                        unsigned __int8 v251 = [v250 isBeforeDate:v304],
                        v250,
                        (v251 & 1) == 0))
                  {
                    [v299 addObject:v249];
                  }
                  else
                  {
                    v252 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
                    if (os_log_type_enabled(v252, OS_LOG_TYPE_INFO))
                    {
                      v253 = [v314 bundleIdentifier];
                      v254 = [v253 UUIDString];
                      v255 = [v301 startDate];
                      v256 = [v255 description];
                      *(_DWORD *)buf = 138412546;
                      v371 = v254;
                      __int16 v372 = 2112;
                      *(void *)v373 = v256;
                      _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping place, bundleID=%@, placeStartDate=%@", buf, 0x16u);

                      id v10 = v313;
                    }
                  }
                }
                id v246 = [v244 countByEnumeratingWithState:&v322 objects:v388 count:16];
              }
              while (v246);
            }

            [v310 setPlaces:v299];
            long long v45 = v295;
          }
          v257 = [v310 place];
          if (v257)
          {
            BOOL v258 = 1;
          }
          else
          {
            v259 = [v310 places];
            if (v259)
            {
              v260 = [v310 places];
              BOOL v258 = [v260 count] != 0;

              long long v45 = v295;
            }
            else
            {
              BOOL v258 = 0;
            }
          }
          if ([v308 containsObject:MOEventBundleSourceTypeVisitLocation[0]] && !v258)
          {
            v261 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
            if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
            {
              v262 = [v314 bundleIdentifier];
              v263 = [v262 UUIDString];
              *(_DWORD *)buf = 138412290;
              v371 = v263;
              _os_log_impl((void *)&_mh_execute_header, v261, OS_LOG_TYPE_INFO, "trimmedFrom, pre-onboarded visit, dropping bundle, bundleID=%@", buf, 0xCu);

              long long v45 = v295;
            }

            id v19 = v292;
          }
          else
          {
LABEL_269:
            [v314 setResources:v312];
            [v314 buildResources];
            v264 = [v314 resources];

            if (v264)
            {
              v265 = [v314 resources];
              id v266 = [v265 count];

              v267 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              v268 = v267;
              id v19 = v292;
              if (v266)
              {
                if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                {
                  v302 = [v314 bundleIdentifier];
                  v269 = [v302 UUIDString];
                  v300 = [v310 resources];
                  id v285 = [v300 count];
                  v287 = [v314 resources];
                  id v284 = [v287 count];
                  v286 = [v310 places];
                  v270 = (char *)[v286 count];
                  v271 = [v310 place];
                  if (v271) {
                    v272 = v270 + 1;
                  }
                  else {
                    v272 = v270;
                  }
                  v273 = [v314 places];
                  v274 = (char *)[v273 count];
                  v275 = [v314 place];
                  if (v275) {
                    v276 = v274 + 1;
                  }
                  else {
                    v276 = v274;
                  }
                  v277 = [v310 persons];
                  id v278 = [v277 count];
                  v279 = [v314 persons];
                  id v280 = [v279 count];
                  *(_DWORD *)buf = 138414082;
                  v371 = v269;
                  __int16 v372 = 2048;
                  *(void *)v373 = v285;
                  *(_WORD *)&v373[8] = 2048;
                  id v374 = v284;
                  __int16 v375 = 2048;
                  v376 = v272;
                  id v19 = v292;
                  __int16 v377 = 2048;
                  v378 = v276;
                  BOOL v7 = v317;
                  __int16 v379 = 2048;
                  id v380 = v278;
                  __int16 v381 = 2048;
                  id v382 = v280;
                  __int16 v383 = 1024;
                  BOOL v384 = v317;
                  _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEFAULT, "trimmedFrom, adding bundle, bundleID=%@, sourceResourceCount=%lu, resourceCount=%lu, sourcePlacesCount=%lu, placesCount=%lu, sourcePersonsCount=%lu, personsCount=%lu, respectOnboardingDate=%d", buf, 0x4Eu);

                  id v10 = v313;
                  long long v45 = v295;
                }
                [v288 addObject:v314];
                goto LABEL_285;
              }
              if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR)) {
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:]((uint64_t)v385, (uint64_t)v314);
              }
            }
            else
            {
              v268 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
              id v19 = v292;
              if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR)) {
                +[MOEventBundleProcessor trimmedFrom:with:respectOnboardingDate:shouldUseStandardSuite:]((uint64_t)v387, (uint64_t)v314);
              }
            }
          }
LABEL_285:
          v174 = v307;

          v32 = v298;
LABEL_286:

          unsigned int v30 = v314;
          goto LABEL_287;
        }
        v152 = _mo_log_facility_get_os_log(&MOLogFacilityBundleProcessing);
        id v19 = v292;
        v316 = v152;
        if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
        {
          v153 = [v314 bundleIdentifier];
          v154 = [v153 UUIDString];
          *(_DWORD *)buf = 138412290;
          v371 = v154;
          _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_INFO, "trimmedFrom, primary place on disallow list, dropping bundle, bundleID=%@", buf, 0xCu);

          unsigned int v30 = v314;
          v32 = v298;
          goto LABEL_228;
        }
LABEL_227:
        v32 = v298;
        unsigned int v30 = v314;
LABEL_228:
        long long v45 = v295;
LABEL_287:

LABEL_288:
LABEL_289:

LABEL_290:
        id v18 = v32 + 1;
      }
      while (v18 != v19);
      id v292 = [obj countByEnumeratingWithState:&v366 objects:v399 count:16];
    }
    while (v292);
  }

  id v281 = [v288 copy];

  return v281;
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = [[(id)OUTLINED_FUNCTION_2_1(a1, a2) bundleIdentifier];
  id v5 = [v4 UUIDString];
  *id v3 = 138412290;
  *id v2 = v5;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v6, v7, "trimmedFrom, nil resources, dropping bundle, bundleID=%@");
}

+ (void)trimmedFrom:(uint64_t)a1 with:(uint64_t)a2 respectOnboardingDate:shouldUseStandardSuite:.cold.2(uint64_t a1, uint64_t a2)
{
  id v4 = [[(id)OUTLINED_FUNCTION_2_1(a1, a2) bundleIdentifier];
  id v5 = [v4 UUIDString];
  *id v3 = 138412290;
  *id v2 = v5;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v6, v7, "trimmedFrom, no resources, dropping bundle, bundleID=%@");
}

@end