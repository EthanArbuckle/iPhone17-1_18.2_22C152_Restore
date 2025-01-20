@interface TAFilterGeneral
+ (BOOL)locationA:(id)a3 isSignificantlyDifferentFromLocationB:(id)a4;
+ (BOOL)locationSegments:(id)a3 underMaxSpeed:(double)a4;
+ (BOOL)locationSegmentsUnderPedestrianMaxSpeed:(id)a3 withFilterSettings:(id)a4;
+ (BOOL)satisfyBeepOnMoveRequirementForAddress:(id)a3 store:(id)a4 settings:(id)a5;
+ (BOOL)satisfyNextPLOIHomeWithStore:(id)a3;
+ (BOOL)shouldIssuePeopleDensityScan:(unint64_t)a3 distTravel:(double)a4 durationOfTravel:(double)a5 settings:(id)a6 resultsInBuffer:(id)a7;
+ (double)distOfTravelAlong:(id)a3;
+ (id)dateIntervalAfterVisitAdjustment:(id)a3 intervalOfInterest:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
+ (id)filteredInterVisitMetadata:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5;
+ (id)filteredInterVisitMetadataWithVisitAdjustment:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5;
+ (id)filteredPeopleDensityResults:(id)a3 within:(id)a4;
+ (id)getDateIntervalOfInterestForFiltering:(id)a3 settings:(id)a4;
+ (void)preprocessLocationAndAdvertisementWithEnumerator:(id)a3 addressToLocationList:(id)a4 addressToAdvertisementList:(id)a5 relevanceThreshold:(double)a6;
@end

@implementation TAFilterGeneral

+ (void)preprocessLocationAndAdvertisementWithEnumerator:(id)a3 addressToLocationList:(id)a4 addressToAdvertisementList:(id)a5 relevanceThreshold:(double)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v43 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    v12 = 0;
    if (v43)
    {
      uint64_t v13 = *(void *)v45;
      unint64_t v14 = 0x2646AA000uLL;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;

            v12 = v17;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v16;
            v19 = v18;
            if (v10)
            {
              v20 = [v18 address];
              v21 = [v10 objectForKeyedSubscript:v20];

              if (!v21)
              {
                id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
                v23 = [v19 address];
                [v10 setObject:v22 forKey:v23];
              }
              v24 = [v19 address];
              v25 = [v10 objectForKeyedSubscript:v24];

              if (!v12) {
                goto LABEL_16;
              }
              v26 = [v19 getDate];
              [v12 getDate];
              v42 = v12;
              unint64_t v27 = v14;
              id v28 = v11;
              id v29 = v10;
              uint64_t v30 = v13;
              v32 = id v31 = v9;
              [v26 timeIntervalSinceDate:v32];
              double v34 = fabs(v33);

              id v9 = v31;
              uint64_t v13 = v30;
              id v10 = v29;
              id v11 = v28;
              unint64_t v14 = v27;
              v12 = v42;

              if (v34 < a6)
              {
                [v25 addObject:v42];
              }
              else
              {
LABEL_16:
                v35 = [MEMORY[0x263EFF9D0] null];
                [v25 addObject:v35];
              }
            }
            if (v11)
            {
              v36 = [v19 address];
              v37 = [v11 objectForKeyedSubscript:v36];

              if (!v37)
              {
                id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
                v39 = [v19 address];
                [v11 setObject:v38 forKey:v39];
              }
              v40 = [v19 address];
              v41 = [v11 objectForKeyedSubscript:v40];

              [v41 addObject:v19];
            }
          }
        }
        uint64_t v43 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v43);
    }
  }
}

+ (id)filteredInterVisitMetadataWithVisitAdjustment:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5
{
  id v7 = a3;
  v8 = +[TAFilterGeneral dateIntervalAfterVisitAdjustment:v7 intervalOfInterest:a4];
  id v9 = +[TAFilterGeneral filteredInterVisitMetadata:v7 inInterval:v8 withLocRelevanceThreshold:a5];

  return v9;
}

+ (id)filteredInterVisitMetadata:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 eventBuffer];
  id v10 = [v9 getAllTAEventsBetween:v8];

  if (![v10 count])
  {
    id v97 = [NSDictionary dictionary];
    goto LABEL_63;
  }
  id v85 = v8;
  id v86 = v7;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v14 = [v10 objectEnumerator];
  v91 = v13;
  +[TAFilterGeneral preprocessLocationAndAdvertisementWithEnumerator:v14 addressToLocationList:v11 addressToAdvertisementList:v13 relevanceThreshold:a5];

  v84 = v10;
  v15 = v10;
  v16 = v12;
  id v17 = [v15 reverseObjectEnumerator];
  +[TAFilterGeneral preprocessLocationAndAdvertisementWithEnumerator:v17 addressToLocationList:v12 addressToAdvertisementList:0 relevanceThreshold:a5];

  id v92 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v110 objects:v119 count:16];
  v87 = v12;
  id obj = v18;
  if (!v19) {
    goto LABEL_38;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v111;
  unint64_t v22 = 0x263EFF000uLL;
  uint64_t v88 = *(void *)v111;
  do
  {
    uint64_t v23 = 0;
    uint64_t v89 = v20;
    do
    {
      if (*(void *)v111 != v21) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v110 + 1) + 8 * v23);
      uint64_t v25 = MEMORY[0x223CB66C0]();
      uint64_t v26 = [v16 objectForKeyedSubscript:v24];
      context = (void *)v25;
      if (v26
        && (unint64_t v27 = (void *)v26,
            [v91 objectForKeyedSubscript:v24],
            id v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            v27,
            v28))
      {
        id v29 = [obj objectForKeyedSubscript:v24];
        uint64_t v30 = [v16 objectForKeyedSubscript:v24];
        v93 = [v91 objectForKeyedSubscript:v24];
        uint64_t v31 = [v29 count];
        v98 = v30;
        if (v31 == [v30 count]
          && (v32 = v24, uint64_t v33 = [v29 count], v33 == objc_msgSend(v93, "count")))
        {
          id v94 = objc_alloc_init(MEMORY[0x263EFF980]);
          if ([v29 count])
          {
            uint64_t v34 = 0;
            unsigned int v35 = 1;
            int v36 = -1;
            id v96 = v32;
            do
            {
              uint64_t v37 = v36 + [v98 count];
              id v38 = [v29 objectAtIndexedSubscript:v34];
              v39 = [v98 objectAtIndexedSubscript:v37];
              v40 = [*(id *)(v22 + 2512) null];
              if (v38 == v40)
              {
                v56 = [*(id *)(v22 + 2512) null];

                if (v39 != v56)
                {
                  v57 = v94;
                  v58 = v39;
                  goto LABEL_27;
                }
              }
              else
              {
              }
              v41 = [*(id *)(v22 + 2512) null];
              if (v39 != v41)
              {

LABEL_17:
                uint64_t v42 = [*(id *)(v22 + 2512) null];
                if (v39 == (void *)v42)
                {
                }
                else
                {
                  uint64_t v43 = (void *)v42;
                  [*(id *)(v22 + 2512) null];
                  v45 = unint64_t v44 = v22;

                  BOOL v72 = v38 == v45;
                  unint64_t v22 = v44;
                  if (!v72)
                  {
                    long long v46 = [v93 objectAtIndexedSubscript:v34];
                    long long v47 = [v46 getDate];
                    v48 = [v38 getDate];
                    [v47 timeIntervalSinceDate:v48];
                    double v50 = fabs(v49);

                    v51 = [v46 getDate];
                    v52 = [v39 getDate];
                    [v51 timeIntervalSinceDate:v52];
                    double v54 = fabs(v53);

                    unint64_t v22 = v44;
                    if (v50 <= v54) {
                      v55 = v38;
                    }
                    else {
                      v55 = v39;
                    }
                    [v94 addObject:v55];
                  }
                }
                goto LABEL_29;
              }
              v59 = [*(id *)(v22 + 2512) null];

              if (v38 == v59) {
                goto LABEL_17;
              }
              v57 = v94;
              v58 = v38;
LABEL_27:
              [v57 addObject:v58];
LABEL_29:

              uint64_t v34 = v35;
              BOOL v60 = [v29 count] > (unint64_t)v35++;
              --v36;
              id v32 = v96;
            }
            while (v60);
          }
          [v92 setObject:v94 forKey:v32];

          v16 = v87;
        }
        else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        {
          +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.5(&v106, v107);
        }

        uint64_t v21 = v88;
        uint64_t v20 = v89;
      }
      else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      {
        +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.4(&v108, v109);
      }
      ++v23;
    }
    while (v23 != v20);
    uint64_t v20 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
  }
  while (v20);
LABEL_38:

  id v97 = [MEMORY[0x263EFF9A0] dictionary];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v61 = v91;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v102 objects:v118 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v103;
    do
    {
      uint64_t v65 = 0;
      uint64_t v99 = v63;
      do
      {
        if (*(void *)v103 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = *(void **)(*((void *)&v102 + 1) + 8 * v65);
        v67 = [v92 objectForKeyedSubscript:v66];

        if (v67)
        {
          v68 = [v61 objectForKeyedSubscript:v66];
          v69 = [v68 firstObject];

          v70 = [v61 objectForKeyedSubscript:v66];
          v71 = [v70 lastObject];

          if (v69) {
            BOOL v72 = v71 == 0;
          }
          else {
            BOOL v72 = 1;
          }
          if (v72)
          {
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
              +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:](&v100, v101);
            }
          }
          else
          {
            uint64_t v74 = v64;
            v75 = (void *)MEMORY[0x263F08798];
            v76 = [v69 getDate];
            v77 = [v71 getDate];
            v78 = [v75 createIntervalSafelyWithStartDate:v76 endDate:v77];

            v79 = [v92 objectForKey:v66];
            v80 = [[TAInterVisitSummary alloc] initWithObservationInterval:v78 andLocationHistory:v79 andLastObservation:v71];
            v81 = v80;
            if (v80)
            {
              [v97 setObject:v80 forKey:v66];
            }
            else
            {
              v82 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
                +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:](v114, v82, v66, &v115);
              }
            }

            uint64_t v64 = v74;
            uint64_t v63 = v99;
          }
        }
        else
        {
          v73 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
            +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:](v116, v73, v66, &v117);
          }
        }
        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [v61 countByEnumeratingWithState:&v102 objects:v118 count:16];
    }
    while (v63);
  }

  id v8 = v85;
  id v7 = v86;
  id v10 = v84;
LABEL_63:

  return v97;
}

+ (id)dateIntervalAfterVisitAdjustment:(id)a3 intervalOfInterest:(id)a4
{
  id v5 = a4;
  v6 = [a3 visitState];
  id v7 = [v6 getLatestValidVisitDepartureDate];

  id v8 = v5;
  if (v7)
  {
    id v9 = [v5 startDate];
    uint64_t v10 = [v9 compare:v7];

    id v8 = v5;
    if (v10 == -1)
    {
      id v11 = [v5 endDate];
      uint64_t v12 = [v11 compare:v7];

      if (v12 == -1)
      {
        v15 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
          +[TAFilterGeneral dateIntervalAfterVisitAdjustment:intervalOfInterest:](v15);
        }
        id v8 = [MEMORY[0x263F08798] createIntervalSafelyWithStartDate:v7 endDate:v7];
      }
      else
      {
        id v13 = (void *)MEMORY[0x263F08798];
        unint64_t v14 = [v5 endDate];
        id v8 = [v13 createIntervalSafelyWithStartDate:v7 endDate:v14];
      }
    }
  }
  id v16 = v8;

  return v16;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TAFilterGeneralSettings alloc] initWithDefaults];
  id v8 = +[TAFilterGeneral filterSuspiciousDeviceWithStore:v6 settings:v7 andAppendOutgoingRequestsTo:v5];

  return v8;
}

+ (id)getDateIntervalOfInterestForFiltering:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 clock];
  id v8 = [v6 visitState];
  id v9 = [v8 getLatestValidVisitDepartureDate];

  uint64_t v10 = [v6 eventBuffer];

  id v11 = [v10 getEarliestEventDate];

  if (v9)
  {
    id v12 = v9;
  }
  else if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v13 = (void *)MEMORY[0x263EFF910];
    [v5 durationOfConsideration];
    id v12 = [v13 dateWithTimeInterval:v7 sinceDate:-v14];
  }
  v15 = v12;
  id v16 = [MEMORY[0x263F08798] createIntervalSafelyWithStartDate:v12 endDate:v7];

  return v16;
}

+ (BOOL)satisfyBeepOnMoveRequirementForAddress:(id)a3 store:(id)a4 settings:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 deviceRecord];
  id v11 = [v10 getLatestBeepOnMoveDate:v7];

  if (v11)
  {
    id v12 = [MEMORY[0x263EFF910] distantPast];
    char v13 = [v11 isEqualToDate:v12];

    if ((v13 & 1) == 0)
    {
      id v16 = [v8 deviceRecord];
      uint64_t v17 = [v16 getDeviceType:v7];

      if (v17 == 1)
      {
        id v18 = [v8 clock];
        uint64_t v19 = objc_msgSend(v18, "dateByAddingTimeInterval:", -(double)(unint64_t)objc_msgSend(v9, "beepOnMoveConsiderationTimeInterval"));

        BOOL v14 = [v11 compare:v19] == 1;
        goto LABEL_4;
      }
      uint64_t v20 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v20;
        unint64_t v22 = [v7 hexString];
        v23[0] = 68289283;
        v23[1] = 0;
        __int16 v24 = 2082;
        uint64_t v25 = "";
        __int16 v26 = 2113;
        unint64_t v27 = v22;
        _os_log_impl(&dword_22345C000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAFilterGeneral found BOM on non-durian device\", \"address\":\"%{private}@\"}", (uint8_t *)v23, 0x1Cu);
      }
    }
  }
  BOOL v14 = 0;
LABEL_4:

  return v14;
}

+ (BOOL)satisfyNextPLOIHomeWithStore:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(a3, "visitState", 0);
  v4 = [v3 nextPredictedLOIs];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) type] == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  uint64_t v227 = *MEMORY[0x263EF8340];
  id v183 = a3;
  id v7 = (TAFilterGeneralSettings *)a4;
  id v8 = a5;
  if (!v7) {
    id v7 = [[TAFilterGeneralSettings alloc] initWithDefaults];
  }
  long long v9 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = v9;
    long long v11 = [v183 clock];
    *(_DWORD *)buf = 138477827;
    *(void *)v200 = v11;
    _os_log_impl(&dword_22345C000, v10, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Current Clock Time: %{private}@", buf, 0xCu);
  }
  long long v12 = v183;
  char v13 = +[TAFilterGeneral getDateIntervalOfInterestForFiltering:v183 settings:v7];
  uint64_t v14 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    id v16 = [v13 startDate];
    uint64_t v17 = [v13 endDate];
    *(_DWORD *)buf = 138478083;
    *(void *)v200 = v16;
    *(_WORD *)&v200[8] = 2113;
    *(void *)&v200[10] = v17;
    _os_log_impl(&dword_22345C000, v15, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);

    long long v12 = v183;
  }
  [(TAFilterGeneralSettings *)v7 thresholdOfLocationRelevance];
  id v18 = +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v12, v13);
  if ([v18 count])
  {
    v147 = v13;
    uint64_t v19 = [v12 eventBuffer];
    v152 = [v19 getAllTAEventsOf:objc_opt_class()];

    id v158 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    id obj = v18;
    uint64_t v165 = [obj countByEnumeratingWithState:&v195 objects:v226 count:16];
    if (!v165) {
      goto LABEL_106;
    }
    uint64_t v163 = *(void *)v196;
    v157 = v8;
    v179 = v7;
    v164 = v18;
    while (1)
    {
      for (uint64_t i = 0; i != v165; uint64_t i = v58 + 1)
      {
        if (*(void *)v196 != v163) {
          objc_enumerationMutation(obj);
        }
        uint64_t v181 = i;
        uint64_t v21 = *(void **)(*((void *)&v195 + 1) + 8 * i);
        uint64_t v180 = MEMORY[0x223CB66C0]();
        unint64_t v22 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = v22;
          __int16 v24 = [obj objectForKeyedSubscript:v21];
          uint64_t v25 = [v24 deviceLocationHistory];
          uint64_t v26 = [v25 count];
          *(_DWORD *)buf = 138478083;
          *(void *)v200 = v21;
          *(_WORD *)&v200[8] = 2049;
          *(void *)&v200[10] = v26;
          _os_log_impl(&dword_22345C000, v23, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Location Tag Count for %{private}@: %{private}ld", buf, 0x16u);
        }
        unint64_t v27 = [obj objectForKeyedSubscript:v21];
        uint64_t v28 = [v27 deviceLocationHistory];

        v186 = (void *)v28;
        +[TAFilterGeneral distOfTravelAlong:v28];
        double v30 = v29;
        [(TAFilterGeneralSettings *)v7 thresholdOfSignificantDistance];
        double v32 = v31;
        uint64_t v33 = [obj objectForKey:v21];
        uint64_t v34 = [v33 deviceObservationInterval];

        if (v34)
        {
          [v34 duration];
          double v36 = v35;
          [(TAFilterGeneralSettings *)v7 thresholdOfSignificantDuration];
          double v38 = v37;
          v39 = [v34 startDate];
          v182 = v34;
          v40 = [v34 endDate];
          v41 = +[TAVehicleCategoryLogic extractPrivateVehicleHintsFromTAStore:v183 since:v39 to:v40];

          uint64_t v42 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:2];
          int v43 = [v41 containsObject:v42];

          if ([(TAFilterGeneralSettings *)v7 allowNavGeoHintAsPrivateVehicleHint])
          {
            unint64_t v44 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:1];
            v43 |= [v41 containsObject:v44];
          }
          int v169 = v43;
          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v45 = v41;
          uint64_t v46 = [v45 countByEnumeratingWithState:&v189 objects:v225 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v190;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v190 != v48) {
                  objc_enumerationMutation(v45);
                }
                double v50 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
                {
                  v51 = *(void **)(*((void *)&v189 + 1) + 8 * j);
                  v52 = v50;
                  double v53 = [v21 hexString];
                  double v54 = TAPrivateVehicleClassificationReasonEnumToString([v51 reason]);
                  *(_DWORD *)buf = 138478083;
                  *(void *)v200 = v53;
                  *(_WORD *)&v200[8] = 2113;
                  *(void *)&v200[10] = v54;
                  _os_log_impl(&dword_22345C000, v52, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral private vehicle reason for %{private}@ : %{private}@", buf, 0x16u);
                }
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v189 objects:v225 count:16];
            }
            while (v47);
          }

          v55 = +[TAFilterGeneral filteredPeopleDensityResults:v152 within:v182];
          v176 = v55;
          if ([v55 count])
          {
            v56 = [v55 lastObject];
            BOOL v57 = [v56 peopleDensityState] == 0;
          }
          else
          {
            BOOL v57 = 0;
          }
          uint64_t v60 = +[TADominantUserActivity getDominantUserActivityInfoInDateInterval:v182 store:v183];
          BOOL v161 = v57;
          if (v60 == 3) {
            int v61 = v169 | v57;
          }
          else {
            int v61 = 0;
          }
          BOOL v62 = +[TAFilterGeneral locationSegmentsUnderPedestrianMaxSpeed:v186 withFilterSettings:v179];
          BOOL v159 = v62;
          BOOL v63 = v60 == 2 && v62;
          BOOL v166 = +[TAFilterGeneral satisfyBeepOnMoveRequirementForAddress:v21 store:v183 settings:v179];
          BOOL v168 = +[TAFilterGeneral satisfyNextPLOIHomeWithStore:v183];
          BOOL v64 = v30 > v32;
          if (v36 <= v38) {
            BOOL v64 = 0;
          }
          uint64_t v172 = v60;
          int v177 = v61;
          int v174 = v63;
          int v65 = v60 == 4 || v63;
          char v153 = v65;
          if (!v64 | v61) {
            int v66 = v64;
          }
          else {
            int v66 = v65;
          }
          v223[0] = @"DetectionAlgorithm";
          v67 = (objc_class *)objc_opt_class();
          v68 = NSStringFromClass(v67);
          v224[0] = v68;
          v223[1] = @"LengthTraveled";
          v69 = [NSNumber numberWithDouble:v30];
          v224[1] = v69;
          v223[2] = @"Duration";
          v70 = [NSNumber numberWithDouble:v36];
          v224[2] = v70;
          v223[3] = @"ObservationCount";
          v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v186, "count"));
          v224[3] = v71;
          v184 = [NSDictionary dictionaryWithObjects:v224 forKeys:v223 count:4];

          BOOL v72 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v73 = v72;
            uint64_t v74 = [v21 hexString];
            *(_DWORD *)buf = 68292099;
            *(_DWORD *)v200 = 0;
            *(_WORD *)&v200[4] = 2082;
            *(void *)&v200[6] = "";
            *(_WORD *)&v200[14] = 2113;
            *(void *)&v200[16] = v74;
            __int16 v201 = 1026;
            int v202 = v66;
            __int16 v203 = 1026;
            BOOL v204 = v30 > v32;
            __int16 v205 = 1026;
            BOOL v206 = v36 > v38;
            __int16 v207 = 1026;
            int v208 = v177;
            __int16 v209 = 1026;
            int v210 = v169;
            __int16 v211 = 1026;
            int v212 = v174;
            __int16 v213 = 1026;
            BOOL v214 = v159;
            __int16 v215 = 1026;
            BOOL v216 = v161;
            __int16 v217 = 1026;
            BOOL v218 = v172 == 4;
            __int16 v219 = 1026;
            BOOL v220 = v166;
            __int16 v221 = 1026;
            BOOL v222 = v168;
            _os_log_impl(&dword_22345C000, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral decisions\", \"address\":\"%{private}@\", \"satisfy\":%{public}hhd, \"satisfy-length\":%{public}hhd, \"satisfy-duration\":%{public}hhd, \"satisfy-vehicular-requirement\":%{public}hhd, \"satisfy-private-automotive\":%{public}hhd, \"satisfy-pedestrian-requirement\":%{public}hhd, \"satisfy-pedestrian-speed-check\":%{public}hhd, \"satisfy-people-density\":%{public}hhd, \"satisfy-cycling-requirement\":%{public}hhd, \"satisfy-beepOnMove\":%{public}hhd, \"satisfy-ploi\":%{public}hhd}", buf, 0x5Eu);
          }
          if (v66)
          {
            v75 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              v76 = v75;
              v77 = [v21 hexString];
              *(_DWORD *)buf = 138477827;
              *(void *)v200 = v77;
              _os_log_impl(&dword_22345C000, v76, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral adding %{private}@ because requirements satisfied", buf, 0xCu);
            }
            if (v177)
            {
              uint64_t v154 = [(TAFilterGeneralSettings *)v179 vehicularImmediacyType];
              uint64_t v170 = 7;
            }
            else
            {
              uint64_t v87 = 8;
              if (!v174) {
                uint64_t v87 = 9;
              }
              if ((v153 & 1) == 0)
              {
                uint64_t v88 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v89 = v88;
                  v90 = [v21 hexString];
                  *(_DWORD *)buf = 68289283;
                  *(_DWORD *)v200 = 0;
                  *(_WORD *)&v200[4] = 2082;
                  *(void *)&v200[6] = "";
                  *(_WORD *)&v200[14] = 2113;
                  *(void *)&v200[16] = v90;
                  _os_log_impl(&dword_22345C000, v89, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAFilterGeneral missing proper detection type classification\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
                }
                uint64_t v87 = 1;
              }
              uint64_t v170 = v87;
              uint64_t v154 = 1;
            }
            v91 = objc_alloc_init(TAInterVisitMetricPerDevice);
            [(TAInterVisitMetricPerDevice *)v91 accumulateDistance:v30];
            [(TAInterVisitMetricPerDevice *)v91 accumulateDuration:v36];
            -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](v91, "accumulateNumOfAssociatedLocs:", [v186 count]);
            [(TAInterVisitMetricPerDevice *)v91 accumulateSampledObservedLocations:v186];
            id v92 = [obj objectForKeyedSubscript:v21];
            v93 = [v92 latestObservation];
            v162 = v91;
            [(TAInterVisitMetricPerDevice *)v91 accumulateLatestAdvertisement:v93];

            id v94 = [TAGeneralDetectionMetrics alloc];
            uint64_t v95 = [v176 count];
            if (v95)
            {
              v148 = [v176 lastObject];
              uint64_t v96 = [v148 peopleDensityState];
            }
            else
            {
              uint64_t v96 = -1;
            }
            uint64_t v99 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:1];
            uint64_t v100 = [v45 containsObject:v99];
            v101 = [[TAPrivateVehicleClassificationReason alloc] initWithReason:2];
            uint64_t v102 = -[TAGeneralDetectionMetrics initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:](v94, "initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:", v162, v172, v96, v100, [v45 containsObject:v101]);

            if (v95) {
            long long v103 = [TAMetricsDetection alloc];
            }
            long long v104 = [obj objectForKey:v21];
            long long v105 = [v104 latestObservation];
            v160 = (void *)v102;
            v173 = [(TAMetricsDetection *)v103 initWithDetectionType:v170 visitDetectionMetrics:0 generalDetectionMetrics:v102 singleVisitDetectionMetrics:0 latestAdvertisement:v105];

            v149 = [TASuspiciousDevice alloc];
            v150 = [obj objectForKey:v21];
            uint64_t v106 = [v150 latestObservation];
            v107 = [v183 clock];
            char v108 = [v183 deviceRecord];
            v109 = [v108 getAccessoryInfo:v21];
            long long v110 = (void *)v106;
            long long v111 = [(TASuspiciousDevice *)v149 initWithLatestAdv:v106 detectionSummary:v184 date:v107 locHistory:v186 detectionMetrics:v173 detectionType:v170 immediacyType:v154 accessoryInfo:v109 forceSurfaceReason:0];
            [v158 addObject:v111];

            int v112 = v174;
            if (v177)
            {
              long long v113 = [TASuspiciousDevice alloc];
              v155 = [obj objectForKey:v21];
              v114 = [v155 latestObservation];
              uint64_t v115 = [v183 clock];
              v116 = [v183 deviceRecord];
              uint64_t v117 = [v116 getAccessoryInfo:v21];
              v118 = [(TASuspiciousDevice *)v113 initWithLatestAdv:v114 detectionSummary:v184 date:v115 locHistory:v186 detectionMetrics:v173 detectionType:v170 immediacyType:3 accessoryInfo:v117 forceSurfaceReason:0];
              [v158 addObject:v118];

              int v112 = 1;
            }
            if ((v166 & v112) == 1)
            {
              v119 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v120 = v119;
                v121 = [v21 hexString];
                *(_DWORD *)buf = 68289283;
                *(_DWORD *)v200 = 0;
                *(_WORD *)&v200[4] = 2082;
                *(void *)&v200[6] = "";
                *(_WORD *)&v200[14] = 2113;
                *(void *)&v200[16] = v121;
                _os_log_impl(&dword_22345C000, v120, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral detected beepOnMove\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
              }
              int v171 = v112;
              if (v177)
              {
                uint64_t v151 = [(TAFilterGeneralSettings *)v179 beepOnMoveVehicularImmediacyType];
                uint64_t v122 = 12;
                goto LABEL_82;
              }
              if (v174)
              {
                uint64_t v151 = [(TAFilterGeneralSettings *)v179 beepOnMovePedestrianImmediacyType];
                uint64_t v122 = 13;
LABEL_82:
                uint64_t v156 = v122;
              }
              else
              {
                v123 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
                {
                  v124 = v123;
                  v125 = [v21 hexString];
                  *(_DWORD *)buf = 68289283;
                  *(_DWORD *)v200 = 0;
                  *(_WORD *)&v200[4] = 2082;
                  *(void *)&v200[6] = "";
                  *(_WORD *)&v200[14] = 2113;
                  *(void *)&v200[16] = v125;
                  _os_log_impl(&dword_22345C000, v124, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral unhandled beepOnMove case\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
                }
                uint64_t v156 = 1;
                uint64_t v151 = 3;
              }
              v126 = [TASuspiciousDevice alloc];
              v167 = [obj objectForKey:v21];
              v127 = [v167 latestObservation];
              v128 = [v183 clock];
              v129 = [v183 deviceRecord];
              v130 = [v129 getAccessoryInfo:v21];
              v131 = [(TASuspiciousDevice *)v126 initWithLatestAdv:v127 detectionSummary:v184 date:v128 locHistory:v186 detectionMetrics:v173 detectionType:v156 immediacyType:v151 accessoryInfo:v130 forceSurfaceReason:0];
              [v158 addObject:v131];

              int v112 = v171;
            }
            uint64_t v34 = v182;
            v78 = v176;
            if ((v168 & v112) == 1)
            {
              v132 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
              {
                v133 = v132;
                v134 = [v21 hexString];
                *(_DWORD *)buf = 68289283;
                *(_DWORD *)v200 = 0;
                *(_WORD *)&v200[4] = 2082;
                *(void *)&v200[6] = "";
                *(_WORD *)&v200[14] = 2113;
                *(void *)&v200[16] = v134;
                _os_log_impl(&dword_22345C000, v133, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral detected PLOI home\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
              }
              if (v177)
              {
                uint64_t v175 = [(TAFilterGeneralSettings *)v179 nextPLOIVehicularImmediacyType];
                uint64_t v135 = 14;
                goto LABEL_96;
              }
              if (v174)
              {
                uint64_t v175 = [(TAFilterGeneralSettings *)v179 nextPLOIPedestrianImmediacyType];
                uint64_t v135 = 15;
LABEL_96:
                uint64_t v178 = v135;
              }
              else
              {
                v136 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
                {
                  v137 = v136;
                  v138 = [v21 hexString];
                  *(_DWORD *)buf = 68289283;
                  *(_DWORD *)v200 = 0;
                  *(_WORD *)&v200[4] = 2082;
                  *(void *)&v200[6] = "";
                  *(_WORD *)&v200[14] = 2113;
                  *(void *)&v200[16] = v138;
                  _os_log_impl(&dword_22345C000, v137, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral unhandled PLOI case\", \"address\":\"%{private}@\"}", buf, 0x1Cu);
                }
                uint64_t v178 = 1;
                uint64_t v175 = 3;
              }
              v139 = [TASuspiciousDevice alloc];
              v140 = [obj objectForKey:v21];
              v141 = [v140 latestObservation];
              v142 = [v183 clock];
              v143 = [v183 deviceRecord];
              v144 = [v143 getAccessoryInfo:v21];
              v145 = [(TASuspiciousDevice *)v139 initWithLatestAdv:v141 detectionSummary:v184 date:v142 locHistory:v186 detectionMetrics:v173 detectionType:v178 immediacyType:v175 accessoryInfo:v144 forceSurfaceReason:0];
              [v158 addObject:v145];

              uint64_t v34 = v182;
              v78 = v176;
            }

LABEL_102:
            id v18 = v164;
            v59 = (void *)v180;
            uint64_t v58 = v181;
          }
          else
          {
            v78 = v176;
            BOOL v79 = +[TAFilterGeneral shouldIssuePeopleDensityScan:v172 distTravel:v179 durationOfTravel:v176 settings:v30 resultsInBuffer:v36];
            v80 = (void *)TAStatusLog;
            BOOL v81 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT);
            uint64_t v34 = v182;
            if (!v79)
            {
              if (v81)
              {
                id v97 = v80;
                v98 = [v21 hexString];
                *(_DWORD *)buf = 138477827;
                *(void *)v200 = v98;
                _os_log_impl(&dword_22345C000, v97, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral not adding %{private}@ because requirements not satisfied", buf, 0xCu);
              }
              goto LABEL_102;
            }
            if (v81)
            {
              v82 = v80;
              v83 = [v21 hexString];
              *(_DWORD *)buf = 138477827;
              *(void *)v200 = v83;
              _os_log_impl(&dword_22345C000, v82, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral identified suspicious device %{private}@; issue people density scans to gather more information",
                buf,
                0xCu);
            }
            if (v157)
            {
              v84 = [TAOutgoingRequests alloc];
              id v85 = [v147 endDate];
              id v86 = [(TAOutgoingRequests *)v84 initWithRequestKey:@"RequestingPeopleDensity" additionalInformation:v184 date:v85];
              [v157 addObject:v86];

              goto LABEL_102;
            }
            id v18 = v164;
            v59 = (void *)v180;
            uint64_t v58 = v181;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
              +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](&v187, v188);
            }
          }

          id v8 = v157;
          id v7 = v179;
          goto LABEL_104;
        }
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](&v193, v194);
        }
        id v18 = v164;
        v59 = (void *)v180;
        uint64_t v58 = v181;
LABEL_104:
      }
      uint64_t v165 = [obj countByEnumeratingWithState:&v195 objects:v226 count:16];
      if (!v165)
      {
LABEL_106:

        char v13 = v147;
        goto LABEL_108;
      }
    }
  }
  id v158 = [MEMORY[0x263EFF8C0] array];
LABEL_108:

  return v158;
}

+ (BOOL)locationA:(id)a3 isSignificantlyDifferentFromLocationB:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  [v5 horizontalAccuracy];
  double v8 = v7;
  [v6 horizontalAccuracy];
  if (v8 < 0.0 || (double v10 = v9, v8 > 70.0) || v9 < 0.0 || v9 > 70.0)
  {
    char v13 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      v15[0] = 68289026;
      v15[1] = 0;
      __int16 v16 = 2082;
      uint64_t v17 = "";
      _os_log_impl(&dword_22345C000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral checking if locations are different with invalid uncertainty\"}", (uint8_t *)v15, 0x12u);
    }
    BOOL v12 = 1;
  }
  else
  {
    [v5 distanceFromLocation:v6];
    BOOL v12 = v11 * v11 > v10 * v10 + v8 * v8;
  }

  return v12;
}

+ (double)distOfTravelAlong:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if ((unint64_t)[v3 count] >= 2 && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    int v5 = 0;
    unint64_t v6 = 1;
    do
    {
      double v7 = [v3 objectAtIndexedSubscript:v6];
      double v8 = [v3 objectAtIndexedSubscript:v5];
      BOOL v9 = +[TAFilterGeneral locationA:v7 isSignificantlyDifferentFromLocationB:v8];

      if (v9)
      {
        double v10 = [v3 objectAtIndexedSubscript:v6];
        double v11 = [v3 objectAtIndexedSubscript:v5];
        [v10 distanceFromLocation:v11];
        double v4 = v4 + v12;

        int v5 = v6;
      }
      ++v6;
    }
    while ([v3 count] > v6);
  }

  return v4;
}

+ (BOOL)locationSegments:(id)a3 underMaxSpeed:(double)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = v5;
  if (a4 >= 0.0)
  {
    if (v5 && (unint64_t)[v5 count] >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      unint64_t v10 = 1;
      *(void *)&long long v8 = 134218496;
      long long v20 = v8;
      do
      {
        double v11 = objc_msgSend(v6, "objectAtIndexedSubscript:", v10 - 1, v20);
        double v12 = [v6 objectAtIndexedSubscript:v10];
        +[TALocationLite estimateSpeedFrom:v11 to:v12];
        double v15 = v13;
        uint64_t v17 = v16;
        double v18 = v14;
        if (v13 < 0.0 || v14 < 0.0)
        {
          uint64_t v19 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            double v24 = v15;
            __int16 v25 = 2048;
            double v26 = v18;
            __int16 v27 = 2048;
            uint64_t v28 = v17;
            _os_log_error_impl(&dword_22345C000, v19, OS_LOG_TYPE_ERROR, "#TAFilterGeneral error calculating segment speed min=%f avg=%f max=%f", buf, 0x20u);
          }
        }
        else if (v13 <= 0.0)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
            +[TAFilterGeneral locationSegments:underMaxSpeed:](&v21, v22);
          }
        }
        else if (v14 > a4)
        {

          goto LABEL_2;
        }

        ++v10;
      }
      while ([v6 count] > v10);
    }
    BOOL v7 = 1;
  }
  else
  {
LABEL_2:
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)locationSegmentsUnderPedestrianMaxSpeed:(id)a3 withFilterSettings:(id)a4
{
  id v5 = a3;
  [a4 capOfReasonableWalkingSpeed];
  LOBYTE(a4) = +[TAFilterGeneral locationSegments:underMaxSpeed:](TAFilterGeneral, "locationSegments:underMaxSpeed:", v5);

  return (char)a4;
}

+ (id)filteredPeopleDensityResults:(id)a3 within:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v5 && v6)
  {
    long long v8 = (void *)MEMORY[0x263F08A98];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__TAFilterGeneral_filteredPeopleDensityResults_within___block_invoke;
    v12[3] = &unk_2646AAA40;
    id v13 = v6;
    BOOL v9 = [v8 predicateWithBlock:v12];
    unint64_t v10 = [v5 filteredArrayUsingPredicate:v9];
  }
  else
  {
    unint64_t v10 = [MEMORY[0x263EFF8C0] array];
  }

  return v10;
}

uint64_t __55__TAFilterGeneral_filteredPeopleDensityResults_within___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 observationInterval];
    uint64_t v5 = [v4 intersectsDateInterval:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldIssuePeopleDensityScan:(unint64_t)a3 distTravel:(double)a4 durationOfTravel:(double)a5 settings:(id)a6 resultsInBuffer:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  [v12 thresholdOfSignificantDistance];
  double v14 = v13;
  [v12 thresholdOfSignificantDuration];
  double v16 = v15;

  BOOL v17 = 0;
  if (a3 == 3 && v14 < a4 && v16 < a5) {
    BOOL v17 = [v11 count] == 0;
  }

  return v17;
}

+ (void)filterSuspiciousDeviceWithStore:(unsigned char *)a1 settings:(unsigned char *)a2 andAppendOutgoingRequestsTo:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22345C000, v2, v3, "address does not exist in observation interval dictionary", v4);
}

+ (void)filterSuspiciousDeviceWithStore:(unsigned char *)a1 settings:(unsigned char *)a2 andAppendOutgoingRequestsTo:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22345C000, v2, v3, "#TAFilterGeneral filterSuspiciousDeviceWithStore called with nil requests parameter", v4);
}

+ (void)dateIntervalAfterVisitAdjustment:(os_log_t)log intervalOfInterest:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "#TAFilterGeneral got visit departure date after clock", v1, 2u);
}

+ (void)filteredInterVisitMetadata:(void *)a3 inInterval:(void *)a4 withLocRelevanceThreshold:.cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  BOOL v7 = a2;
  long long v8 = [a3 hexString];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_fault_impl(&dword_22345C000, v7, OS_LOG_TYPE_FAULT, "#TAFilterGeneral no location list for address %@", a1, 0xCu);
}

+ (void)filteredInterVisitMetadata:(void *)a3 inInterval:(void *)a4 withLocRelevanceThreshold:.cold.2(uint8_t *a1, void *a2, void *a3, void *a4)
{
  BOOL v7 = a2;
  long long v8 = [a3 hexString];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_22345C000, v7, OS_LOG_TYPE_ERROR, "#TAFilterGeneral attempted to create empty summary for address %@", a1, 0xCu);
}

+ (void)filteredInterVisitMetadata:(unsigned char *)a1 inInterval:(unsigned char *)a2 withLocRelevanceThreshold:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22345C000, v2, v3, "#TAFilterGeneral no first or last advertisement", v4);
}

+ (void)filteredInterVisitMetadata:(unsigned char *)a1 inInterval:(unsigned char *)a2 withLocRelevanceThreshold:.cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22345C000, v2, v3, "#TAFilterGeneral no corresponding backward entry or advertisement entry", v4);
}

+ (void)filteredInterVisitMetadata:(unsigned char *)a1 inInterval:(unsigned char *)a2 withLocRelevanceThreshold:.cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_22345C000, v2, v3, "#TAFilterGeneral forward backward location count or advertisement count not equal!", v4);
}

+ (void)locationSegments:(unsigned char *)a1 underMaxSpeed:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_1(a1, a2);
  _os_log_debug_impl(&dword_22345C000, v2, OS_LOG_TYPE_DEBUG, "#TAFilterGeneral segment min speed not valid, skipping...", v3, 2u);
}

@end