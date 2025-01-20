@interface TAFilterVisits
+ (BOOL)isReasonableSpeedOfTravelFrom:(id)a3 to:(id)a4;
+ (BOOL)sensitiveVisitsTooCloseBetweenFromLOIType:(unint64_t)a3 toLOIType:(unint64_t)a4 distance:(double)a5 settings:(id)a6;
+ (BOOL)shouldDetectWithStore:(id)a3 settings:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
+ (id)getAddressSetInTAVisitSnapshot:(id)a3;
+ (id)getEntryAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4;
+ (id)getExitAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4;
+ (id)getIntersectionOfFirstSet:(id)a3 andSecondSet:(id)a4;
+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6;
+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6 skipFreshObservationCheck:(BOOL)a7;
+ (unint64_t)identifyDetectionTypeWithStore:(id)a3 settings:(id)a4;
@end

@implementation TAFilterVisits

+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  uint64_t v192 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (TAFilterVisitsSettings *)a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v8) {
    v8 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  }
  if (+[TAFilterVisits shouldDetectWithStore:v7 settings:v8])
  {
    id v148 = v9;
    v168 = v10;
    v11 = [v7 visitState];
    v12 = [v11 visitSnapshotBuffer];
    v13 = [v12 lastObject];

    v14 = [v7 visitState];
    v15 = [v14 visitSnapshotBuffer];
    v16 = v7;
    uint64_t v17 = [v15 count] - 2;

    v18 = [v16 visitState];
    v19 = [v18 visitSnapshotBuffer];
    v20 = [v19 bufferCopy];
    v21 = [v20 objectAtIndex:v17];

    v22 = v13;
    v23 = [v21 representativeVisit];
    v24 = [v13 representativeVisit];
    v25 = [TALocationLite alloc];
    v26 = [v23 departureDate];
    [v23 coordinate];
    double v28 = v27;
    [v23 coordinate];
    double v30 = v29;
    v147 = v23;
    [v23 horizontalAccuracy];
    v32 = [(TALocationLite *)v25 initWithTimestamp:v26 latitude:v28 longitude:v30 horizontalAccuracy:v31];

    v33 = [TALocationLite alloc];
    v34 = [v24 arrivalDate];
    [v24 coordinate];
    double v36 = v35;
    [v24 coordinate];
    double v38 = v37;
    v146 = v24;
    [v24 horizontalAccuracy];
    uint64_t v40 = [(TALocationLite *)v33 initWithTimestamp:v34 latitude:v36 longitude:v38 horizontalAccuracy:v39];

    uint64_t v41 = [v21 loiType];
    uint64_t v42 = [v22 loiType];
    v163 = (void *)v40;
    v164 = v32;
    [(TALocationLite *)v32 distanceFromLocation:v40];
    v169 = v16;
    if (+[TAFilterVisits sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:](TAFilterVisits, "sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:", v41, v42, v8))
    {
      v43 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289026;
        __int16 v190 = 2082;
        v191 = "";
        _os_log_impl(&dword_22345C000, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterVisit two sensitive visits too close, abort detection\"}", (uint8_t *)&buf, 0x12u);
      }
      id v10 = v168;
      id v44 = v168;
      id v7 = v16;
      id v9 = v148;
    }
    else
    {
      v46 = [v16 clock];
      v151 = v22;
      v47 = +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:v21 toVisitSnapshot:v22 settings:v8 currentClockTime:v46];

      id v166 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      v48 = [v16 visitState];
      v49 = [v48 visitSnapshotBuffer];
      unint64_t v50 = [v49 count];

      v150 = v8;
      v152 = v21;
      if (v50 < 3)
      {
        v149 = 0;
      }
      else
      {
        v51 = [v16 visitState];
        v52 = [v51 visitSnapshotBuffer];
        uint64_t v53 = [v52 count] - 3;

        v54 = [v16 visitState];
        v55 = [v54 visitSnapshotBuffer];
        v56 = [v55 bufferCopy];
        v57 = [v56 objectAtIndex:v53];

        v58 = [v57 representativeVisit];
        v59 = [TALocationLite alloc];
        v60 = [v58 departureDate];
        [v58 coordinate];
        double v62 = v61;
        [v58 coordinate];
        double v64 = v63;
        [v58 horizontalAccuracy];
        v66 = [(TALocationLite *)v59 initWithTimestamp:v60 latitude:v62 longitude:v64 horizontalAccuracy:v65];

        v149 = v57;
        uint64_t v67 = [v57 loiType];
        uint64_t v68 = [v21 loiType];
        [(TALocationLite *)v66 distanceFromLocation:v32];
        uint64_t v69 = v68;
        v8 = v150;
        if (!+[TAFilterVisits sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:](TAFilterVisits, "sensitiveVisitsTooCloseBetweenFromLOIType:toLOIType:distance:settings:", v67, v69, v150))
        {
          v70 = [v169 clock];
          v71 = +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:v149 toVisitSnapshot:v21 settings:v150 currentClockTime:v70 skipFreshObservationCheck:1];

          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          id v72 = v71;
          uint64_t v73 = [v72 countByEnumeratingWithState:&v179 objects:v188 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v180;
            do
            {
              for (uint64_t i = 0; i != v74; ++i)
              {
                if (*(void *)v180 != v75) {
                  objc_enumerationMutation(v72);
                }
                v77 = [*(id *)(*((void *)&v179 + 1) + 8 * i) address];
                [v166 addObject:v77];
              }
              uint64_t v74 = [v72 countByEnumeratingWithState:&v179 objects:v188 count:16];
            }
            while (v74);
          }

          v8 = v150;
        }
      }
      v78 = [TAVisitDetectionMetrics alloc];
      [v163 distanceFromLocation:v32];
      double v80 = v79;
      +[TALocationLite residualDistanceFromLocation:v32 toLocation:v163 nSigma:[(TAFilterVisitsSettings *)v8 minNSigmaBetweenVisits]];
      v167 = [(TAVisitDetectionMetrics *)v78 initWithDistance:[(TAFilterVisitsSettings *)v8 minNSigmaBetweenVisits] residualDistance:v80 nSigma:v81];
      unint64_t v82 = +[TAFilterVisits identifyDetectionTypeWithStore:v169 settings:v8];
      BOOL v160 = v82 == 5;
      unint64_t v161 = v82;
      uint64_t v83 = 1;
      if (v82 == 5) {
        uint64_t v83 = 2;
      }
      uint64_t v159 = v83;
      v186[0] = @"DetectionAlgorithm";
      unint64_t v84 = 0x2646AA000uLL;
      v85 = +[TAMetricsDetection convertTADetectionTypeToString:v82];
      v187[0] = v85;
      v186[1] = @"LastVisit";
      v86 = [v152 representativeVisit];
      v87 = [v86 descriptionDictionary];
      v187[1] = v87;
      v186[2] = @"CurrentVisit";
      v88 = [v151 representativeVisit];
      v89 = [v88 descriptionDictionary];
      v187[2] = v89;
      v162 = [NSDictionary dictionaryWithObjects:v187 forKeys:v186 count:3];

      id v7 = v169;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      id obj = v47;
      uint64_t v165 = [obj countByEnumeratingWithState:&v175 objects:v185 count:16];
      if (v165)
      {
        uint64_t v158 = *(void *)v176;
        do
        {
          uint64_t v90 = 0;
          do
          {
            if (*(void *)v176 != v158) {
              objc_enumerationMutation(obj);
            }
            v91 = *(void **)(*((void *)&v175 + 1) + 8 * v90);
            id v92 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v92 addObject:v164];
            v93 = [v7 visitState];
            v94 = [v93 interVisitMetricSnapshotBuffer];
            v95 = [v94 lastObject];

            if (v95)
            {
              v96 = [v95 accumulatedDeviceMetrics];
              v97 = [v91 address];
              v98 = [v96 objectForKey:v97];

              if (v98)
              {
                v99 = [v98 sampledObservedLocations];
                [v92 addObjectsFromArray:v99];
              }
            }
            v171 = v95;
            uint64_t v174 = v90;
            [v92 addObject:v163];
            uint64_t v100 = [objc_alloc(*(Class *)(v84 + 2088)) initWithDetectionType:v161 visitDetectionMetrics:v167 generalDetectionMetrics:0 singleVisitDetectionMetrics:0 latestAdvertisement:v91];
            v101 = [TASuspiciousDevice alloc];
            v102 = [v7 clock];
            id v172 = v92;
            v103 = (void *)[v92 copy];
            v104 = [v7 deviceRecord];
            [v91 address];
            v106 = unint64_t v105 = v84;
            v107 = [v104 getAccessoryInfo:v106];
            v170 = (void *)v100;
            v108 = [(TASuspiciousDevice *)v101 initWithLatestAdv:v91 detectionSummary:v162 date:v102 locHistory:v103 detectionMetrics:v100 detectionType:v161 immediacyType:v159 accessoryInfo:v107 forceSurfaceReason:v160];
            [v168 addObject:v108];

            v109 = [v91 address];
            LODWORD(v102) = [v166 containsObject:v109];

            if (v102)
            {
              v183[0] = @"DetectionAlgorithm";
              v110 = [*(id *)(v105 + 2088) convertTADetectionTypeToString:16];
              v184[0] = v110;
              v183[1] = @"LastVisit";
              v111 = [v152 representativeVisit];
              v112 = [v111 descriptionDictionary];
              v184[1] = v112;
              v183[2] = @"CurrentVisit";
              v113 = [v151 representativeVisit];
              v114 = [v113 descriptionDictionary];
              v184[2] = v114;
              v183[3] = @"PastTwoVisit";
              uint64_t v115 = v105;
              if (v149)
              {
                v155 = [v149 representativeVisit];
                v154 = [v155 descriptionDictionary];
                v116 = v154;
              }
              else
              {
                v116 = &stru_26D677430;
              }
              v184[3] = v116;
              v157 = [NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:4];
              uint64_t v117 = v174;
              if (v149)
              {
              }
              id v119 = objc_alloc_init(MEMORY[0x263EFF980]);
              v120 = [v169 visitState];
              v121 = [v120 interVisitMetricSnapshotBuffer];
              unint64_t v122 = [v121 count];

              if (v122 < 2)
              {
                v135 = TAStatusLog;
                v130 = v172;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t buf = 68289026;
                  __int16 v190 = 2082;
                  v191 = "";
                  _os_log_impl(&dword_22345C000, v135, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterVisits missing intervisit metrics\"}", (uint8_t *)&buf, 0x12u);
                }
              }
              else
              {
                v123 = [v169 visitState];
                v124 = [v123 interVisitMetricSnapshotBuffer];
                uint64_t v125 = [v124 count] - 2;

                v126 = [v169 visitState];
                v127 = [v126 interVisitMetricSnapshotBuffer];
                v128 = [v127 bufferCopy];
                v129 = [v128 objectAtIndex:v125];

                uint64_t v115 = 0x2646AA000;
                v130 = v172;
                if (v129)
                {
                  v131 = [v129 accumulatedDeviceMetrics];
                  v132 = [v91 address];
                  v133 = [v131 objectForKey:v132];

                  if (v133)
                  {
                    v134 = [v133 sampledObservedLocations];
                    [v119 addObjectsFromArray:v134];
                  }
                }
              }
              [v119 addObjectsFromArray:v130];
              v156 = (void *)[objc_alloc(*(Class *)(v115 + 2088)) initWithDetectionType:16 visitDetectionMetrics:v167 generalDetectionMetrics:0 singleVisitDetectionMetrics:0 latestAdvertisement:v91];
              v136 = [TASuspiciousDevice alloc];
              v137 = [v169 clock];
              v138 = (void *)[v119 copy];
              uint64_t v139 = [(TAFilterVisitsSettings *)v150 threeVisitImmediacyType];
              [v169 deviceRecord];
              v140 = v173 = v119;
              v141 = [v91 address];
              [v140 getAccessoryInfo:v141];
              v142 = v118 = v130;
              v143 = [(TASuspiciousDevice *)v136 initWithLatestAdv:v91 detectionSummary:v157 date:v137 locHistory:v138 detectionMetrics:v156 detectionType:16 immediacyType:v139 accessoryInfo:v142 forceSurfaceReason:0];
              [v168 addObject:v143];

              id v7 = v169;
            }
            else
            {
              id v7 = v169;
              v118 = v172;
              uint64_t v117 = v174;
            }

            uint64_t v90 = v117 + 1;
            unint64_t v84 = 0x2646AA000;
          }
          while (v165 != v90);
          uint64_t v165 = [obj countByEnumeratingWithState:&v175 objects:v185 count:16];
        }
        while (v165);
      }

      id v10 = v168;
      id v144 = v168;

      id v9 = v148;
      v8 = v150;
      v22 = v151;
      v21 = v152;
    }
  }
  else
  {
    id v45 = v10;
  }

  return v10;
}

+ (BOOL)shouldDetectWithStore:(id)a3 settings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([v5 visitState],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 visitSnapshotBuffer],
        v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v7,
        v9 >= 2))
  {
    v11 = [v5 visitState];
    v12 = [v11 visitSnapshotBuffer];
    v13 = [v12 lastObject];
    char v14 = [v13 isClosed];

    char v10 = v14 ^ 1;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TAFilterVisitsSettings alloc] initWithDefaults];
  v8 = +[TAFilterVisits filterSuspiciousDeviceWithStore:v6 settings:v7 andAppendOutgoingRequestsTo:v5];

  return v8;
}

+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6
{
  return +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:a3 toVisitSnapshot:a4 settings:a5 currentClockTime:a6 skipFreshObservationCheck:0];
}

+ (id)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(id)a3 toVisitSnapshot:(id)a4 settings:(id)a5 currentClockTime:(id)a6 skipFreshObservationCheck:(BOOL)a7
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v102 = a5;
  id v97 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  v101 = v11;
  char v14 = [v11 representativeVisit];
  v15 = [v12 representativeVisit];
  v16 = [TALocationLite alloc];
  uint64_t v17 = [v14 departureDate];
  [v14 coordinate];
  double v19 = v18;
  [v14 coordinate];
  double v21 = v20;
  [v14 horizontalAccuracy];
  uint64_t v91 = [(TALocationLite *)v16 initWithTimestamp:v17 latitude:v19 longitude:v21 horizontalAccuracy:v22];

  v23 = [TALocationLite alloc];
  v24 = [v15 arrivalDate];
  [v15 coordinate];
  double v26 = v25;
  [v15 coordinate];
  double v28 = v27;
  uint64_t v90 = v15;
  [v15 horizontalAccuracy];
  uint64_t v92 = [(TALocationLite *)v23 initWithTimestamp:v24 latitude:v26 longitude:v28 horizontalAccuracy:v29];

  if (!a7 && ([v12 latestLocationInsideVisit] & 1) == 0)
  {
    uint64_t v83 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl(&dword_22345C000, v83, OS_LOG_TYPE_DEFAULT, "The latest location infers that we may be leaving the current visit; suppress visit-based detection logic",
        buf,
        2u);
    }
    double v81 = (void *)[v13 copy];
    goto LABEL_38;
  }
  uint64_t v30 = [v102 minNSigmaBetweenVisits];
  [v102 minInterVisitDistance];
  double v31 = (void *)v91;
  v32 = (void *)v92;
  if (+[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v91, v92, v30))
  {
    if (!+[TAFilterVisits isReasonableSpeedOfTravelFrom:v91 to:v92])
    {
      unint64_t v84 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_22345C000, v84, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits visit-to-visit speed exceeds threshold, not attempting to perform visit detection", buf, 2u);
      }
      double v81 = (void *)[v13 copy];
      goto LABEL_42;
    }
    v86 = v14;
    v94 = v13;
    v89 = +[TAFilterVisits getEntryAddressSetInTAVisitSnapshot:v12 usingSettings:v102];
    v88 = +[TAFilterVisits getExitAddressSetInTAVisitSnapshot:v101 usingSettings:v102];
    [v102 exitDisplayOnBudget];
    objc_msgSend(v101, "getDurationOfVisitExitConsideredWithDisplayOnBudget:");
    double v34 = v33;
    v87 = [v12 getEntryIntervalEvaluatedUntil];
    double v35 = (void *)TAStatusLog;
    double v36 = &off_2234A9000;
    v96 = v12;
    BOOL v95 = a7;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      double v37 = (objc_class *)MEMORY[0x263EFF910];
      loga = v35;
      id v38 = [v37 alloc];
      v107 = [v101 representativeVisit];
      unint64_t v105 = [v107 departureDate];
      double v39 = (void *)[v38 initWithTimeInterval:v105 sinceDate:-v34];
      v99 = [v39 getDateString];
      uint64_t v40 = [v101 representativeVisit];
      uint64_t v41 = [v40 departureDate];
      uint64_t v42 = [v41 getDateString];
      v43 = [v96 representativeVisit];
      id v44 = [v43 arrivalDate];
      id v45 = [v44 getDateString];
      v46 = [v87 getDateString];
      *(_DWORD *)uint64_t buf = 138478595;
      uint64_t v117 = v99;
      __int16 v118 = 2113;
      *(void *)id v119 = v42;
      *(_WORD *)&v119[8] = 2113;
      v120 = v45;
      __int16 v121 = 2113;
      unint64_t v122 = v46;
      _os_log_impl(&dword_22345C000, loga, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits past visit window of consideration %{private}@/%{private}@ and current window of consideration %{private}@/%{private}@", buf, 0x2Au);

      double v36 = &off_2234A9000;
      id v12 = v96;

      a7 = v95;
    }
    +[TAFilterVisits getIntersectionOfFirstSet:v89 andSecondSet:v88];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    os_log_t log = (os_log_t)[obj countByEnumeratingWithState:&v109 objects:v115 count:16];
    if (log)
    {
      uint64_t v100 = *(void *)v110;
      int v93 = *((void *)v36 + 382);
      do
      {
        os_log_t v47 = 0;
        do
        {
          if (*(void *)v110 != v100) {
            objc_enumerationMutation(obj);
          }
          v48 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v47);
          v49 = [v12 latestUtAdvertisements];
          unint64_t v50 = [v49 objectForKey:v48];

          uint64_t v51 = [v50 getDate];
          v108 = (void *)v51;
          if (a7)
          {
            BOOL v52 = 1;
          }
          else
          {
            [v97 timeIntervalSinceDate:v51];
            double v54 = v53;
            [v102 maxSuspiciousDuration];
            BOOL v52 = v54 < v55;
          }
          BOOL v106 = v52;
          v56 = [v101 earliestUtAdvertisements];
          v57 = [v56 objectForKey:v48];

          v58 = [v101 latestUtAdvertisements];
          v59 = [v58 objectForKey:v48];

          v60 = [v12 earliestUtAdvertisements];
          double v61 = [v60 objectForKey:v48];

          double v62 = [v12 latestUtAdvertisements];
          double v63 = [v62 objectForKey:v48];

          if (v57 && v59 && v61 && v63)
          {
            double v64 = [v59 getDate];
            double v65 = [v57 getDate];
            [v64 timeIntervalSinceDate:v65];
            double v67 = v66;
            [v102 minObservationInterval];
            double v69 = v68;

            v70 = [v63 getDate];
            v71 = [v61 getDate];
            [v70 timeIntervalSinceDate:v71];
            double v73 = v72;
            [v102 minObservationInterval];
            double v75 = v74;

            v76 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              v77 = v76;
              v78 = [v48 hexString];
              *(_DWORD *)uint64_t buf = v93;
              uint64_t v117 = v78;
              __int16 v118 = 1025;
              *(_DWORD *)id v119 = v106;
              *(_WORD *)&v119[4] = 1025;
              *(_DWORD *)&v119[6] = v67 > v69;
              LOWORD(v120) = 1025;
              *(_DWORD *)((char *)&v120 + 2) = v73 > v75;
              _os_log_impl(&dword_22345C000, v77, OS_LOG_TYPE_DEFAULT, "#TAFilterVisits considering %{private}@ based on satisfyFreshObservation:%{private}d satisfyPastVisitObservationDuration:%{private}d satisfyCurrentVisitObservationDuration:%{private}d", buf, 0x1Eu);
            }
            BOOL v79 = v67 > v69 && v106;
            id v12 = v96;
            a7 = v95;
            if (v79 && v73 > v75) {
              [v94 addObject:v50];
            }
          }
          else
          {
            double v80 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
              +[TAFilterVisits getSuspiciousDeviceAdvertisementsFromVisitSnapshot:toVisitSnapshot:settings:currentClockTime:skipFreshObservationCheck:](v113, v80, v48, &v114);
            }
          }

          os_log_t v47 = (os_log_t)((char *)v47 + 1);
        }
        while (log != v47);
        os_log_t log = (os_log_t)[obj countByEnumeratingWithState:&v109 objects:v115 count:16];
      }
      while (log);
    }
    id v13 = v94;
    double v81 = (void *)[v94 copy];

    char v14 = v86;
LABEL_38:
    double v31 = (void *)v91;
LABEL_42:
    v32 = (void *)v92;
    goto LABEL_43;
  }
  unint64_t v82 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl(&dword_22345C000, v82, OS_LOG_TYPE_DEFAULT, "Current and past visits are not far enough to be considered for UT", buf, 2u);
  }
  double v81 = (void *)[v13 copy];
LABEL_43:

  return v81;
}

+ (id)getEntryAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA08];
  if (v5)
  {
    [a4 entryDisplayOnBudget];
    id v7 = objc_msgSend(v5, "getEntryAdvertisementsWithDisplayOnBudget:");
    v8 = [v7 allKeys];
    unint64_t v9 = [v6 setWithArray:v8];
  }
  else
  {
    unint64_t v9 = [MEMORY[0x263EFFA08] set];
  }

  return v9;
}

+ (id)getExitAddressSetInTAVisitSnapshot:(id)a3 usingSettings:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA08];
  if (v5)
  {
    [a4 exitDisplayOnBudget];
    id v7 = objc_msgSend(v5, "getExitAdvertisementsWithDisplayOnBudget:");
    v8 = [v7 allKeys];
    unint64_t v9 = [v6 setWithArray:v8];
  }
  else
  {
    unint64_t v9 = [MEMORY[0x263EFFA08] set];
  }

  return v9;
}

+ (id)getAddressSetInTAVisitSnapshot:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  if (a3)
  {
    v4 = [a3 latestUtAdvertisements];
    id v5 = [v4 allKeys];
    id v6 = [v3 setWithArray:v5];
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  return v6;
}

+ (id)getIntersectionOfFirstSet:(id)a3 andSecondSet:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v7 = [MEMORY[0x263EFF9C0] setWithSet:a3];
    [v7 intersectSet:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA08] set];
  }

  return v7;
}

+ (BOOL)isReasonableSpeedOfTravelFrom:(id)a3 to:(id)a4
{
  +[TALocationLite estimateSpeedFrom:a3 to:a4];
  return v4 < 50.0 && v4 >= 0.0;
}

+ (unint64_t)identifyDetectionTypeWithStore:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v6 = [a3 visitState];
  id v7 = [v6 visitSnapshotBuffer];
  v8 = [v7 lastObject];
  unint64_t v9 = [v8 loiType];

  char v10 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
    +[TAFilterVisits identifyDetectionTypeWithStore:settings:](v10, v9, v5);
  }
  id v11 = [v5 sensitiveLOITypes];
  id v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v9];
  int v13 = [v11 containsObject:v12];

  if (v13) {
    unint64_t v14 = 5;
  }
  else {
    unint64_t v14 = 4;
  }

  return v14;
}

+ (BOOL)sensitiveVisitsTooCloseBetweenFromLOIType:(unint64_t)a3 toLOIType:(unint64_t)a4 distance:(double)a5 settings:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a6)
  {
    id v9 = a6;
    char v10 = [v9 sensitiveLOITypes];
    id v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
    int v12 = [v10 containsObject:v11];

    int v13 = [v9 sensitiveLOITypes];

    unint64_t v14 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
    int v15 = [v13 containsObject:v14];

    if (250.0 + 250.0 > a5) {
      int v16 = v12 & v15;
    }
    else {
      int v16 = 0;
    }
    uint64_t v17 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 68290051;
      v19[1] = 0;
      __int16 v20 = 2082;
      double v21 = "";
      __int16 v22 = 1025;
      int v23 = v12;
      __int16 v24 = 1025;
      int v25 = v15;
      __int16 v26 = 1025;
      BOOL v27 = 250.0 + 250.0 > a5;
      __int16 v28 = 1025;
      int v29 = v16;
      _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterVisits shouldDetectWithPastLOIType:currentLOIType:distance:settings:\", \"pastIsSensitiveVisit\":%{private}hhd, \"currentIsSensitiveVisit\":%{private}hhd, \"pastAndCurrentTooClose\":%{private}hhd, \"sensitiveVisitTooClose\":%{private}hhd}", (uint8_t *)v19, 0x2Au);
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  return v16;
}

+ (void)getSuspiciousDeviceAdvertisementsFromVisitSnapshot:(void *)a3 toVisitSnapshot:(void *)a4 settings:currentClockTime:skipFreshObservationCheck:.cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  v8 = [a3 hexString];
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_fault_impl(&dword_22345C000, v7, OS_LOG_TYPE_FAULT, "#TAFilterVisits some advertisements not present for %{private}@", a1, 0xCu);
}

+ (void)identifyDetectionTypeWithStore:(void *)a3 settings:.cold.1(void *a1, unint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = TALocationOfInterestTypeToString(a2);
  id v7 = [a3 sensitiveLOITypesToString];
  int v8 = 138478083;
  id v9 = v6;
  __int16 v10 = 2113;
  id v11 = v7;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterVisits LOI type is %{private}@ and sensitive LOI list contains %{private}@", (uint8_t *)&v8, 0x16u);
}

@end