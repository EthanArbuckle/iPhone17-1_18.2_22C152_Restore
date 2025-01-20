@interface PLTripProcessor
+ (BOOL)tripsEligibleForMoments:(id)a3 frequentLocations:(id)a4;
+ (double)_minimumDistanceBetweenFrequentLocations:(id)a3 andItem:(id)a4;
+ (double)_timeIntervalBetweenItem:(id)a3 andItem:(id)a4;
+ (id)_filterFrequentLocations:(id)a3 forDateInterval:(id)a4;
+ (id)_generateTripFromTripsMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5;
+ (id)_tripFromTripMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5;
+ (id)processTripsWithItems:(id)a3 frequentLocations:(id)a4 lastHomeVisitDate:(id)a5 progressBlock:(id)a6;
+ (unint64_t)_numberOfAssetsInItems:(id)a3;
@end

@implementation PLTripProcessor

+ (id)_filterFrequentLocations:(id)a3 forDateInterval:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "dateInterval", (void)v17);
        int v15 = [v14 intersectsDateInterval:v6];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (double)_minimumDistanceBetweenFrequentLocations:(id)a3 andItem:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count]) {
    goto LABEL_8;
  }
  objc_msgSend(v7, "pl_coordinate");
  double latitude = v79.latitude;
  double longitude = v79.longitude;
  if (!CLLocationCoordinate2DIsValid(v79)) {
    goto LABEL_8;
  }
  BOOL v10 = latitude != 0.0;
  if (longitude != 0.0) {
    BOOL v10 = 1;
  }
  double v11 = 1.79769313e308;
  if (v10)
  {
    if (latitude == 40.0 && longitude == -100.0)
    {
LABEL_8:
      double v11 = 1.79769313e308;
      goto LABEL_9;
    }
    objc_msgSend(v7, "pl_coordinate");
    uint64_t v71 = v13;
    uint64_t v72 = v14;
    int v15 = objc_msgSend(v7, "pl_startDate");
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;

    long long v18 = objc_msgSend(v7, "pl_endDate");
    [v18 timeIntervalSinceReferenceDate];
    double v20 = v19;

    if (v17 >= v20) {
      double v21 = v20;
    }
    else {
      double v21 = v17;
    }
    if (v17 < v20) {
      double v17 = v20;
    }
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v21 + -2592000.0];
    v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v17 + 2592000.0];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v23];
    v25 = [a1 _filterFrequentLocations:v6 forDateInterval:v24];
    if (![v25 count])
    {
      id v26 = v6;

      v25 = v26;
    }
    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
    v62 = v25;
    if ([v61 BOOLForKey:@"PLOnlyUsePrimaryLocationsForTrip"])
    {
      v56 = v24;
      v57 = v23;
      v58 = v22;
      id v60 = v6;
      v27 = PLMomentsGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v7;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Finding primary frequent locations for %@", buf, 0xCu);
      }
      id v59 = v7;

      v28 = [v25 allObjects];
      v29 = [v28 sortedArrayUsingComparator:&__block_literal_global_69409];

      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v31 = [v29 objectAtIndexedSubscript:0];
      v32 = [v31 sortedMoments];
      unint64_t v33 = [v32 count];

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v34 = v29;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        double v37 = (double)v33;
        uint64_t v38 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v68 != v38) {
              objc_enumerationMutation(v34);
            }
            v40 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            v41 = [v40 sortedMoments];
            double v42 = (double)(unint64_t)[v41 count];

            if (v37 * 0.8 >= v42)
            {
              v43 = PLMomentsGetLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218498;
                *(double *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v40;
                __int16 v75 = 2048;
                double v76 = v37 * 0.8;
                _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "[Reject] Current score: %f for %@ (below threshold of %f)", buf, 0x20u);
              }
            }
            else
            {
              [v30 addObject:v40];
              v43 = PLMomentsGetLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218242;
                *(double *)&buf[4] = v42;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v40;
                _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "Current score: %f for %@", buf, 0x16u);
              }
              double v37 = v42;
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v36);
      }

      v44 = PLMomentsGetLog();
      v24 = v56;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v45 = [v30 count];
        uint64_t v46 = [v62 count];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v46;
        _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEBUG, "Found (%lu/%lu) primary frequent locations for trip generation", buf, 0x16u);
      }

      id v7 = v59;
      id v6 = v60;
      v23 = v57;
      uint64_t v22 = v58;
    }
    else
    {
      id v30 = v25;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v47 = v30;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v64;
      double v11 = 1.79769313e308;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v64 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v52 coordinate];
          *(void *)buf = v53;
          *(void *)&buf[8] = v54;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v11 >= v55) {
            double v11 = v55;
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v49);
    }
    else
    {
      double v11 = 1.79769313e308;
    }
  }
LABEL_9:

  return v11;
}

BOOL __68__PLTripProcessor__minimumDistanceBetweenFrequentLocations_andItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sortedMoments];
  unint64_t v6 = [v5 count];
  id v7 = [v4 sortedMoments];

  BOOL v8 = v6 < [v7 count];
  return v8;
}

+ (unint64_t)_numberOfAssetsInItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "pl_numberOfAssets");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (double)_timeIntervalBetweenItem:(id)a3 andItem:(id)a4
{
  if (a3 == a4 || !a3 || !a4) {
    return 0.0;
  }
  id v5 = a4;
  unint64_t v6 = objc_msgSend(a3, "pl_startDate");
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;
  uint64_t v9 = objc_msgSend(v5, "pl_startDate");

  [v9 timeIntervalSinceReferenceDate];
  double v11 = vabdd_f64(v8, v10);

  return v11;
}

+ (BOOL)tripsEligibleForMoments:(id)a3 frequentLocations:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(a1, "_minimumDistanceBetweenFrequentLocations:andItem:", v7, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v13 >= 70000.0)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

+ (id)_tripFromTripMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] < 2) {
    goto LABEL_4;
  }
  uint64_t v11 = [v8 firstObject];
  long long v12 = [v8 lastObject];
  [a1 _timeIntervalBetweenItem:v11 andItem:v12];
  double v14 = v13;

  if (v14 < 28800.0 || (unint64_t)[a1 _numberOfAssetsInItems:v8] < 8)
  {
LABEL_4:
    uint64_t v15 = 0;
    goto LABEL_5;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
LABEL_10:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v38 != v20) {
        objc_enumerationMutation(v17);
      }
      if ((objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v21), "pl_originatorState") & 4) == 0) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v19) {
          goto LABEL_10;
        }
LABEL_25:
        uint64_t v15 = 0;
        goto LABEL_35;
      }
    }
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v17;
  uint64_t v22 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
LABEL_19:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v34 != v24) {
        objc_enumerationMutation(v17);
      }
      if (objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v25), "pl_locationType", (void)v33) != 10) {
        break;
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v23) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
  }

  uint64_t v26 = v14 >= 345600.0;
  uint64_t v27 = [v17 lastObject];
  if ((id)v27 == v10)
  {
    v28 = [MEMORY[0x1E4F1C9C8] date];
    v29 = objc_msgSend(v10, "pl_endDate");
    [v28 timeIntervalSinceDate:v29];
    if (v30 > 518400.0)
    {

      goto LABEL_34;
    }
    if (v9)
    {
      v31 = objc_msgSend(v10, "pl_endDate");
      uint64_t v32 = [v31 compare:v9];

      if (v32 != 1) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    uint64_t v26 = 2;
  }
LABEL_34:
  uint64_t v15 = [[PLTrip alloc] initWithItems:v17 type:v26];
  id v17 = (id)v27;
LABEL_35:

LABEL_5:
  return v15;
}

+ (id)_generateTripFromTripsMoments:(id)a3 withLastHomeVisitDate:(id)a4 andLastItem:(id)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v73 = a4;
  id v81 = a5;
  id v78 = [MEMORY[0x1E4F1CA48] array];
  v74 = [MEMORY[0x1E4F1CA48] array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  id v11 = 0;
  uint64_t v12 = *(void *)v106;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v106 != v12) {
        objc_enumerationMutation(v8);
      }
      double v14 = *(void **)(*((void *)&v105 + 1) + 8 * v13);
      if (!v11) {
        goto LABEL_10;
      }
      uint64_t v15 = [*(id *)(*((void *)&v105 + 1) + 8 * v13) firstObject];
      long long v16 = [v11 lastObject];
      id v17 = objc_msgSend(v16, "pl_endDate");
      uint64_t v18 = objc_msgSend(v15, "pl_startDate");
      [v17 timeIntervalSinceDate:v18];
      double v20 = fabs(v19);

      if (v20 > 172800.0
        || (objc_msgSend(v15, "pl_coordinate"),
            uint64_t v103 = v21,
            uint64_t v104 = v22,
            objc_msgSend(v16, "pl_coordinate"),
            uint64_t v101 = v23,
            uint64_t v102 = v24,
            CLLocationCoordinate2DGetDistanceFrom(),
            v25 > 70000.0))
      {

LABEL_10:
        uint64_t v15 = v11;
        id v11 = v14;
        goto LABEL_11;
      }
      [v11 addObjectsFromArray:v14];
      [v74 addObject:v14];

LABEL_11:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v26 = [v8 countByEnumeratingWithState:&v105 objects:v113 count:16];
    uint64_t v10 = v26;
  }
  while (v26);
LABEL_17:

  [v8 removeObjectsInArray:v74];
  __int16 v75 = [MEMORY[0x1E4F1CA48] array];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v8;
  uint64_t v82 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
  id v27 = 0;
  if (!v82) {
    goto LABEL_55;
  }
  uint64_t v79 = *(void *)v98;
  id v77 = v11;
  while (2)
  {
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v98 != v79) {
        objc_enumerationMutation(obj);
      }
      v29 = *(void **)(*((void *)&v97 + 1) + 8 * v28);
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v93 objects:v111 count:16];
      if (!v31)
      {
        v56 = v30;
        goto LABEL_50;
      }
      uint64_t v32 = v31;
      uint64_t v83 = v28;
      unint64_t v33 = 0;
      uint64_t v34 = *(void *)v94;
      double v35 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          long long v37 = v27;
          if (*(void *)v94 != v34) {
            objc_enumerationMutation(v30);
          }
          long long v38 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          if (v37)
          {
            int v39 = objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * i), "pl_originatorState");
            int v40 = objc_msgSend(v37, "pl_originatorState");
            if (v39 != v40 && (v39 == 4 || v40 == 4))
            {
              uint64_t v103 = 0;
              uint64_t v104 = 0;
              objc_msgSend(v38, "pl_coordinate");
              uint64_t v103 = v42;
              uint64_t v104 = v43;
              uint64_t v101 = 0;
              uint64_t v102 = 0;
              objc_msgSend(v37, "pl_coordinate");
              uint64_t v101 = v44;
              uint64_t v102 = v45;
              CLLocationCoordinate2DGetDistanceFrom();
              double v47 = v46;
              objc_msgSend(v38, "pl_startDate");
              uint64_t v48 = v84 = v33;
              uint64_t v49 = objc_msgSend(v37, "pl_endDate");
              [v48 timeIntervalSinceDate:v49];
              double v51 = fabs(v50);
              v52 = objc_msgSend(v38, "pl_endDate");
              uint64_t v53 = objc_msgSend(v37, "pl_startDate");
              [v52 timeIntervalSinceDate:v53];
              double v55 = fmin(v51, fabs(v54));

              double v35 = v35 + fmax(v47, 1.0) / fmax(v55, 1.0);
              unint64_t v33 = v84 + 1;
            }
          }
          id v27 = v38;
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v93 objects:v111 count:16];
      }
      while (v32);

      if (!v33)
      {
        id v11 = v77;
        goto LABEL_52;
      }
      id v11 = v77;
      if (v35 / (double)v33 <= 60.0)
      {
LABEL_52:
        uint64_t v28 = v83;
        goto LABEL_53;
      }
      v56 = [MEMORY[0x1E4F1CA48] array];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v57 = v30;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v89 objects:v110 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v90;
        do
        {
          for (uint64_t j = 0; j != v59; ++j)
          {
            if (*(void *)v90 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = *(void **)(*((void *)&v89 + 1) + 8 * j);
            if (objc_msgSend(v62, "pl_originatorState", v73) == 4) {
              [v56 addObject:v62];
            }
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v89 objects:v110 count:16];
        }
        while (v59);
      }

      [v57 removeObjectsInArray:v56];
      [v75 addObject:v56];
      uint64_t v28 = v83;
LABEL_50:

LABEL_53:
      if (++v28 != v82) {
        continue;
      }
      break;
    }
    uint64_t v82 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
    if (v82) {
      continue;
    }
    break;
  }
LABEL_55:

  [obj addObjectsFromArray:v75];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v63 = obj;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v85 objects:v109 count:16];
  id v65 = v73;
  if (v64)
  {
    uint64_t v66 = v64;
    uint64_t v67 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v86 != v67) {
          objc_enumerationMutation(v63);
        }
        long long v69 = objc_msgSend(a1, "_tripFromTripMoments:withLastHomeVisitDate:andLastItem:", *(void *)(*((void *)&v85 + 1) + 8 * k), v65, v81, v73);
        if (v69) {
          [v78 addObject:v69];
        }
      }
      uint64_t v66 = [v63 countByEnumeratingWithState:&v85 objects:v109 count:16];
    }
    while (v66);
  }

  long long v70 = v65;
  id v71 = v78;

  return v71;
}

+ (id)processTripsWithItems:(id)a3 frequentLocations:(id)a4 lastHomeVisitDate:(id)a5 progressBlock:(id)a6
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count] && objc_msgSend(v9, "count"))
  {
    v121 = v11;
    PLMomentGenerationGetLog();
    uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v15 = v13;
    long long v16 = v15;
    unint64_t v116 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "TripsProcessing", "", buf, 2u);
    }
    os_signpost_id_t spid = v14;
    v120 = v16;

    uint64_t v115 = mach_absolute_time();
    id v118 = v12;
    uint64_t v127 = MEMORY[0x19F38D650](v12);
    id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v18 = objc_opt_new();
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v117 = v10;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v151 objects:v162 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v152;
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = v17;
        do
        {
          if (*(void *)v152 != v22) {
            objc_enumerationMutation(v19);
          }
          double v25 = *(void **)(*((void *)&v151 + 1) + 8 * v23);
          uint64_t v26 = [v25 sortedMoments];
          [v18 addObjectsFromArray:v26];

          id v27 = [v25 dateInterval];
          uint64_t v28 = [v27 endDate];
          id v17 = [v24 laterDate:v28];

          ++v23;
          uint64_t v24 = v17;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v151 objects:v162 count:16];
      }
      while (v21);
    }

    if (!v121 || [v121 compare:v17] == -1)
    {
      id v29 = v17;

      v121 = v29;
    }
    id v30 = +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime];
    v119 = v9;
    uint64_t v31 = [v9 sortedArrayUsingDescriptors:v30];

    v123 = [v31 lastObject];
    uint64_t v32 = objc_opt_new();
    v122 = objc_opt_new();
    unint64_t v33 = [v31 count];
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    obuint64_t j = v31;
    uint64_t v135 = [obj countByEnumeratingWithState:&v147 objects:v161 count:16];
    id v34 = 0;
    if (v135)
    {
      double v35 = 1.0 / (double)v33;
      uint64_t v134 = *(void *)v148;
      long long v36 = (void (**)(void, void, double))v127;
      double v37 = 0.0;
      *(double *)&uint64_t v38 = 2500000.0;
      double v39 = 172800.0;
      int v40 = (void *)v32;
      v41 = obj;
LABEL_18:
      uint64_t v42 = 0;
      while (1)
      {
        if (*(void *)v148 != v134) {
          objc_enumerationMutation(v41);
        }
        uint64_t v43 = *(void **)(*((void *)&v147 + 1) + 8 * v42);
        if (v36)
        {
          LOBYTE(v141) = 0;
          ((void (**)(void, uint64_t *, double))v36)[2](v36, &v141, v37);
          if ((_BYTE)v141)
          {
            uint64_t v101 = v40;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = 86;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            long long v100 = (void *)MEMORY[0x1E4F1CBF0];
            uint64_t v102 = v41;
            id v10 = v117;
            goto LABEL_124;
          }
        }
        uint64_t v44 = (void *)MEMORY[0x19F38D3B0]();
        if ((objc_msgSend(v43, "pl_originatorState") & 8) != 0) {
          goto LABEL_107;
        }
        v136 = v44;
        objc_msgSend(v43, "pl_coordinate");
        double latitude = v165.latitude;
        double longitude = v165.longitude;
        if (!CLLocationCoordinate2DIsValid(v165)) {
          goto LABEL_29;
        }
        BOOL v47 = latitude != 0.0;
        if (longitude != 0.0) {
          BOOL v47 = 1;
        }
        if (v47)
        {
          id v57 = v36;
          int v58 = objc_msgSend(v43, "pl_locationType");
          BOOL v59 = v58 == 10;
          if (latitude != 40.0 || longitude != -100.0)
          {
            int v61 = v58;
            [a1 _timeIntervalBetweenItem:v43 andItem:v34];
            double v49 = v62;
            id v63 = v43;

            v132 = v63;
            if (v61 == 10)
            {
              BOOL v59 = 1;
              int v131 = 1;
              goto LABEL_32;
            }
            long long v36 = v57;
            if ([v18 containsObject:v63])
            {
              int v56 = 0;
              int v133 = 1;
              int v131 = 1;
              v41 = obj;
              goto LABEL_76;
            }
            [a1 _minimumDistanceBetweenFrequentLocations:v19 andItem:v63];
            BOOL v59 = 0;
            int v56 = 0;
            int v131 = 1;
            int v133 = 1;
            v41 = obj;
            if (v98 < 70000.0)
            {
LABEL_76:
              BOOL v84 = (objc_msgSend(v43, "pl_originatorState") & 3) != 0 || objc_msgSend(v43, "pl_originatorState") == 0;
              uint64_t v44 = v136;
              if (((v133 | ~v56) & v84 & 1) != 0 || v43 == v123)
              {
                int v124 = v56;
                long long v85 = v36;
                v126 = v43;
                long long v139 = 0u;
                long long v140 = 0u;
                long long v137 = 0u;
                long long v138 = 0u;
                v129 = v40;
                long long v86 = [v40 reverseObjectEnumerator];
                uint64_t v87 = [v86 countByEnumeratingWithState:&v137 objects:v159 count:16];
                if (v87)
                {
                  uint64_t v88 = v87;
                  uint64_t v89 = 0;
                  uint64_t v90 = *(void *)v138;
                  do
                  {
                    uint64_t v91 = 0;
                    uint64_t v92 = v89 + v88;
                    do
                    {
                      if (*(void *)v138 != v90) {
                        objc_enumerationMutation(v86);
                      }
                      objc_msgSend(*(id *)(*((void *)&v137 + 1) + 8 * v91), "pl_coordinate");
                      double v93 = v167.latitude;
                      double v94 = v167.longitude;
                      if (CLLocationCoordinate2DIsValid(v167))
                      {
                        BOOL v95 = v93 != 0.0;
                        if (v94 != 0.0) {
                          BOOL v95 = 1;
                        }
                        if (v95 && (v93 != 40.0 || v94 != -100.0))
                        {
                          uint64_t v92 = v89 + v91;
                          goto LABEL_98;
                        }
                      }
                      ++v91;
                    }
                    while (v88 != v91);
                    uint64_t v88 = [v86 countByEnumeratingWithState:&v137 objects:v159 count:16];
                    uint64_t v89 = v92;
                  }
                  while (v88);
LABEL_98:

                  long long v85 = (void (**)(void, void, double))v127;
                  uint64_t v44 = v136;
                  if (v92) {
                    objc_msgSend(v129, "removeObjectsInRange:", objc_msgSend(v129, "count") - v92, v92);
                  }
                }
                else
                {
                }
                int v40 = v129;
                if ([v129 count])
                {
                  [v122 addObject:v129];
                  uint64_t v97 = objc_opt_new();

                  int v40 = (void *)v97;
                }

                if ((v133 | v124 | v131 ^ 1))
                {
                  id v34 = 0;
                }
                else
                {
                  [v40 addObject:v126];
                  id v34 = v126;
                }
                long long v36 = v85;
                v41 = obj;
              }
              else
              {
                id v34 = v132;
              }
              goto LABEL_107;
            }
LABEL_32:
            double v50 = [v40 firstObject];
            double v51 = objc_msgSend(v50, "pl_startDate");
            v52 = objc_msgSend(v43, "pl_endDate");
            [v51 timeIntervalSinceDate:v52];
            double v54 = fabs(v53);

            if (v54 >= 86400.0)
            {
              int v55 = v131 ^ 1;
              if (v49 > 518400.0) {
                int v55 = 1;
              }
              if ((v55 | v59))
              {
                if (v49 <= 518400.0) {
                  goto LABEL_37;
                }
LABEL_74:
                int v133 = 0;
                int v56 = 0;
LABEL_75:
                v41 = obj;
                long long v36 = (void (**)(void, void, double))v127;
                goto LABEL_76;
              }
              long long v145 = 0u;
              long long v146 = 0u;
              long long v143 = 0u;
              long long v144 = 0u;
              uint64_t v64 = [v40 reverseObjectEnumerator];
              uint64_t v65 = [v64 countByEnumeratingWithState:&v143 objects:v160 count:16];
              if (v65)
              {
                uint64_t v66 = v65;
                uint64_t v67 = v38;
                double v68 = v39;
                v128 = v40;
                uint64_t v69 = *(void *)v144;
LABEL_47:
                uint64_t v70 = 0;
                while (1)
                {
                  if (*(void *)v144 != v69) {
                    objc_enumerationMutation(v64);
                  }
                  id v71 = *(void **)(*((void *)&v143 + 1) + 8 * v70);
                  objc_msgSend(v71, "pl_coordinate");
                  double v72 = v166.latitude;
                  double v73 = v166.longitude;
                  if (CLLocationCoordinate2DIsValid(v166))
                  {
                    BOOL v74 = v72 != 0.0;
                    if (v73 != 0.0) {
                      BOOL v74 = 1;
                    }
                    if (v74 && (v72 != 40.0 || v73 != -100.0)) {
                      break;
                    }
                  }
                  if (v66 == ++v70)
                  {
                    uint64_t v66 = [v64 countByEnumeratingWithState:&v143 objects:v160 count:16];
                    if (v66) {
                      goto LABEL_47;
                    }
                    double v76 = 1.79769313e308;
                    goto LABEL_65;
                  }
                }
                id v77 = v71;

                if (v77)
                {
                  *(void *)&buf[8] = 0;
                  *(void *)buf = 0;
                  objc_msgSend(v43, "pl_coordinate");
                  *(void *)buf = v78;
                  *(void *)&buf[8] = v79;
                  uint64_t v141 = 0;
                  uint64_t v142 = 0;
                  objc_msgSend(v77, "pl_coordinate");
                  uint64_t v141 = v80;
                  uint64_t v142 = v81;
                  CLLocationCoordinate2DGetDistanceFrom();
                  double v76 = v82;
                  uint64_t v64 = v77;
LABEL_65:
                  int v40 = v128;
                  double v39 = v68;
                  uint64_t v38 = v67;
                  goto LABEL_69;
                }
                double v76 = 1.79769313e308;
                int v40 = v128;
                double v39 = v68;
                uint64_t v38 = v67;
              }
              else
              {
                double v76 = 1.79769313e308;
LABEL_69:
              }
              double v83 = *(double *)&v38;
              if (v49 > v39) {
                double v83 = v49 / 86400.0 * -375000.0 + 3250000.0;
              }
              if (v76 >= v83) {
                goto LABEL_74;
              }
            }
LABEL_37:
            [v40 addObject:v43];
            int v133 = 0;
            int v56 = 1;
            goto LABEL_75;
          }
          v41 = obj;
        }
        else
        {
LABEL_29:
          BOOL v59 = objc_msgSend(v43, "pl_locationType") == 10;
        }
        if ([v40 count])
        {
          [a1 _timeIntervalBetweenItem:v43 andItem:v34];
          double v49 = v48;
          int v131 = 0;
          v132 = v34;
          goto LABEL_32;
        }
        uint64_t v44 = v136;
LABEL_107:
        double v37 = v35 + v37;
        if (++v42 == v135)
        {
          uint64_t v99 = [v41 countByEnumeratingWithState:&v147 objects:v161 count:16];
          uint64_t v135 = v99;
          if (v99) {
            goto LABEL_18;
          }
          goto LABEL_118;
        }
      }
    }
    int v40 = (void *)v32;
    v41 = obj;
    long long v36 = (void (**)(void, void, double))v127;
LABEL_118:
    uint64_t v103 = v36;
    uint64_t v101 = v40;

    long long v100 = [a1 _generateTripFromTripsMoments:v122 withLastHomeVisitDate:v121 andLastItem:v123];
    uint64_t v104 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    long long v107 = v120;
    long long v108 = v107;
    if (v116 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
    {
      uint64_t v109 = [v119 count];
      uint64_t v110 = [v100 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v109;
      v41 = obj;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v110;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v108, OS_SIGNPOST_INTERVAL_END, spid, "TripsProcessing", "[HighlightsGeneration] Trips Processing for %lu moments, %lu trips", buf, 0x16u);
    }

    uint64_t v102 = v108;
    id v10 = v117;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      float v111 = (float)((float)((float)(v104 - v115) * (float)numer) / (float)denom) / 1000000.0;
      v41 = obj;
      v112 = [NSString stringWithFormat:@"[HighlightsGeneration] Trips Processing for %lu moments, %lu trips", objc_msgSend(v119, "count"), objc_msgSend(v100, "count")];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "TripsProcessing";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v112;
      __int16 v157 = 2048;
      double v158 = v111;
      _os_log_impl(&dword_19B3C7000, v102, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
    }
    long long v36 = v103;
LABEL_124:

    id v9 = v119;
    id v11 = v121;
    id v12 = v118;
  }
  else
  {
    long long v100 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v100;
}

@end