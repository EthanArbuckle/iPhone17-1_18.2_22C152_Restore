@interface OSIUtilities
+ (id)loIAtBeginningAndEndOfIntervals:(id)a3;
@end

@implementation OSIUtilities

+ (id)loIAtBeginningAndEndOfIntervals:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  oslog = os_log_create("com.apple.osintelligence", "osiutilities.loi");
  v49 = [MEMORY[0x1E4F5CEB8] defaultManager];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  id v79 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [v54 firstObject];
  v5 = [v4 startDate];
  v52 = [v5 dateByAddingTimeInterval:-86400.0];

  v6 = [v54 lastObject];
  v7 = [v6 endDate];
  v51 = [v7 dateByAddingTimeInterval:86400.0];

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v81 = (uint64_t)v52;
    __int16 v82 = 2112;
    v83 = v51;
    _os_log_impl(&dword_1CA50C000, oslog, OS_LOG_TYPE_INFO, "Querying for LoIs and visits between start %@ and end %@", buf, 0x16u);
  }
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__0;
  v72[4] = __Block_byref_object_dispose__0;
  id v73 = 0;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke;
  v68[3] = &unk_1E65AACE8;
  v70 = &v74;
  v71 = v72;
  v8 = v3;
  v69 = v8;
  [v49 fetchLocationsOfInterestVisitedBetweenStartDate:v52 endDate:v51 withHandler:v68];
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v8, v9);
  v59 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = (id)v75[5];
  v48 = v8;
  uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v97 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v65 != v55) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v11 = [v10 visits];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v96 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v61;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v61 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = *(void **)(*((void *)&v60 + 1) + 8 * j);
              v94[0] = @"visitEntryDate";
              v16 = [v15 entryDate];
              v95[0] = v16;
              v94[1] = @"visitExitDate";
              v17 = [v15 exitDate];
              v95[1] = v17;
              v94[2] = @"loi";
              v18 = [v10 identifier];
              v19 = [v18 UUIDString];
              v95[2] = v19;
              v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:3];

              [v59 addObject:v20];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v60 objects:v96 count:16];
          }
          while (v12);
        }
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v64 objects:v97 count:16];
    }
    while (v56);
  }

  [v59 sortUsingComparator:&__block_literal_global];
  v21 = objc_opt_new();
  for (unint64_t k = 0; [v54 count] > k; ++k)
  {
    v92[0] = @"interval";
    v23 = [v54 objectAtIndexedSubscript:k];
    v92[1] = @"loi";
    v93[0] = v23;
    v93[1] = &stru_1F24C7E38;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
    [v21 addObject:v24];
  }
  unsigned int v25 = 0;
  int v58 = 0;
  for (unsigned int m = 0; ; unsigned int m = v27 + (v42 ^ 1))
  {
    uint64_t v27 = m;
    if ([v54 count] <= (unint64_t)m || objc_msgSend(v59, "count") <= (unint64_t)v25) {
      break;
    }
    v28 = objc_msgSend(v59, "objectAtIndexedSubscript:");
    v29 = [v54 objectAtIndexedSubscript:m];
    v30 = [v28 objectForKeyedSubscript:@"visitEntryDate"];
    v31 = [v29 startDate];
    [v30 timeIntervalSinceDate:v31];
    if (v32 <= 0.0)
    {
      v33 = [v28 objectForKeyedSubscript:@"visitExitDate"];
      v34 = [v29 endDate];
      [v33 timeIntervalSinceDate:v34];
      BOOL v36 = v35 < 0.0;

      if (v36) {
        goto LABEL_28;
      }
      v37 = [v21 objectAtIndexedSubscript:v27];
      v30 = (void *)[v37 mutableCopy];

      v38 = [v28 objectForKeyedSubscript:@"loi"];
      [v30 setObject:v38 forKeyedSubscript:@"loi"];

      [v21 setObject:v30 atIndexedSubscript:v27];
      ++v58;
    }
    else
    {
    }
LABEL_28:
    v39 = [v28 objectForKeyedSubscript:@"visitExitDate"];
    v40 = [v29 endDate];
    [v39 timeIntervalSinceDate:v40];
    int v42 = v41 <= 0.0;

    v25 += v42;
  }
  v43 = oslog;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = [v54 count];
    uint64_t v45 = [(id)v75[5] count];
    uint64_t v46 = [v59 count];
    *(_DWORD *)buf = 134219266;
    uint64_t v81 = v44;
    __int16 v82 = 2112;
    v83 = v52;
    __int16 v84 = 2112;
    v85 = v51;
    __int16 v86 = 2048;
    uint64_t v87 = v45;
    __int16 v88 = 2048;
    uint64_t v89 = v46;
    __int16 v90 = 1024;
    int v91 = v58;
    _os_log_impl(&dword_1CA50C000, v43, OS_LOG_TYPE_DEFAULT, "For %lu intervals spanning from %@ to %@: \n found %lu lois and %lu visits \n assosciated %d intervals with lois", buf, 0x3Au);
  }

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v74, 8);

  return v21;
}

void __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"visitEntryDate"];
  id v6 = [v4 objectForKeyedSubscript:@"visitEntryDate"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end