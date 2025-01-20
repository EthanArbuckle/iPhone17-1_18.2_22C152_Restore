@interface TAFilterSingleVisit
+ (BOOL)shouldDetectWithStore:(id)a3 filterSingleVisitSettings:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 singleVisitSettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
+ (unint64_t)getSingleVisitDetectionTypeForLOIType:(unint64_t)a3;
+ (unint64_t)getSingleVisitNotificationImmediacyTypeForLOIType:(unint64_t)a3 singleVisitSettings:(id)a4;
@end

@implementation TAFilterSingleVisit

+ (BOOL)shouldDetectWithStore:(id)a3 filterSingleVisitSettings:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_16;
  }
  v7 = [v5 visitState];
  v8 = [v7 visitSnapshotBuffer];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v28 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v32 = 68289026;
    int v33 = 0;
    __int16 v34 = 2082;
    v35 = "";
    v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit no snapshots\"}";
LABEL_15:
    _os_log_impl(&dword_22345C000, v28, OS_LOG_TYPE_DEBUG, v29, (uint8_t *)&v32, 0x12u);
    goto LABEL_16;
  }
  v10 = [v5 visitState];
  v11 = [v10 visitSnapshotBuffer];
  uint64_t v12 = [v11 lastObject];
  unint64_t v13 = [(id)v12 loiType];

  v14 = [v6 enabledLoiTypes];
  v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v13];
  LOBYTE(v12) = [v14 containsObject:v15];

  if ((v12 & 1) == 0)
  {
    v30 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterSingleVisit shouldDetectWithStore:filterSingleVisitSettings:](v30, v13, v6);
    }
    goto LABEL_16;
  }
  v16 = [v5 visitState];
  v17 = [v16 interVisitMetricSnapshotBuffer];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    v28 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    int v32 = 68289026;
    int v33 = 0;
    __int16 v34 = 2082;
    v35 = "";
    v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit no intervisit snapshots\"}";
    goto LABEL_15;
  }
  v19 = [v5 visitState];
  v20 = [v19 interVisitMetricSnapshotBuffer];
  v21 = [v20 lastObject];
  char v22 = [v21 isClosed];

  if ((v22 & 1) == 0)
  {
    v28 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      int v32 = 68289026;
      int v33 = 0;
      __int16 v34 = 2082;
      v35 = "";
      v29 = "{\"msg%{public}.0s\":\"#TAFilterSingleVisit last snapshot not closed\"}";
      goto LABEL_15;
    }
LABEL_16:
    char v27 = 0;
    goto LABEL_17;
  }
  v23 = [v5 visitState];
  v24 = [v23 visitSnapshotBuffer];
  v25 = [v24 lastObject];
  char v26 = [v25 isClosed];

  char v27 = v26 ^ 1;
LABEL_17:

  return v27;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 singleVisitSettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (TAFilterSingleVisitSettings *)a4;
  id v109 = objc_alloc_init(MEMORY[0x263EFF980]);
  v124 = v6;
  if (+[TAFilterSingleVisit shouldDetectWithStore:v6 filterSingleVisitSettings:v7])
  {
    if (!v7) {
      v7 = [[TAFilterSingleVisitSettings alloc] initWithDefaults];
    }
    v8 = [v6 visitState];
    uint64_t v9 = [v8 visitSnapshotBuffer];
    v10 = [v9 lastObject];

    uint64_t v107 = [v10 loiType];
    v11 = [v10 representativeVisit];
    uint64_t v12 = [TALocationLite alloc];
    unint64_t v13 = [v11 arrivalDate];
    [v11 coordinate];
    double v15 = v14;
    [v11 coordinate];
    double v17 = v16;
    v106 = v11;
    [v11 horizontalAccuracy];
    v108 = [(TALocationLite *)v12 initWithTimestamp:v13 latitude:v15 longitude:v17 horizontalAccuracy:v18];

    v19 = [v124 visitState];
    v20 = [v19 interVisitMetricSnapshotBuffer];
    v21 = [v20 lastObject];

    char v22 = [(TAFilterSingleVisitSettings *)v7 visitsSettings];
    v23 = +[TAFilterVisits getEntryAddressSetInTAVisitSnapshot:v10 usingSettings:v22];

    v24 = (void *)MEMORY[0x263EFFA08];
    v115 = v21;
    v25 = [v21 accumulatedDeviceMetrics];
    char v26 = [v25 allKeys];
    char v27 = [v24 setWithArray:v26];

    v28 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:](v28, v23);
    }
    v29 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:](v29, v27);
    }
    v104 = v27;
    v105 = v23;
    v30 = +[TAFilterVisits getIntersectionOfFirstSet:v23 andSecondSet:v27];
    v31 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = v31;
      *(_DWORD *)buf = 134349056;
      uint64_t v130 = [v30 count];
      _os_log_impl(&dword_22345C000, v32, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit identified %{public}lu suspicious candidates ...", buf, 0xCu);
    }
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v33 = v30;
    uint64_t v123 = [v33 countByEnumeratingWithState:&v125 objects:v143 count:16];
    if (v123)
    {
      uint64_t v122 = *(void *)v126;
      v116 = v7;
      v119 = v10;
      id v114 = v33;
      do
      {
        for (uint64_t i = 0; i != v123; ++i)
        {
          if (*(void *)v126 != v122) {
            objc_enumerationMutation(v33);
          }
          v35 = *(void **)(*((void *)&v125 + 1) + 8 * i);
          uint64_t v36 = [v10 latestUtAdvertisements];
          v37 = [v36 objectForKey:v35];
          v38 = [v37 getDate];

          v39 = [v124 clock];
          [v39 timeIntervalSinceDate:v38];
          double v41 = v40;
          v42 = [(TAFilterSingleVisitSettings *)v7 visitsSettings];
          [v42 maxSuspiciousDuration];
          double v44 = v43;

          if (v41 < v44)
          {
            v45 = [v10 earliestUtAdvertisements];
            v46 = [v45 objectForKey:v35];

            v47 = [v10 latestUtAdvertisements];
            v48 = [v47 objectForKey:v35];

            v121 = v48;
            if (v46 && v48)
            {
              v49 = [v48 getDate];
              v120 = v46;
              v50 = [v46 getDate];
              [v49 timeIntervalSinceDate:v50];
              double v52 = v51;
              v53 = [(TAFilterSingleVisitSettings *)v7 visitsSettings];
              [v53 minObservationInterval];
              double v55 = v54;

              v56 = [v115 accumulatedDeviceMetrics];
              v57 = [v56 objectForKey:v35];

              [v57 distance];
              double v59 = v58;
              [(TAFilterSingleVisitSettings *)v7 thresholdOfSignificantDistance];
              double v61 = v60;
              [v57 duration];
              double v63 = v62;
              [(TAFilterSingleVisitSettings *)v7 thresholdOfSignificantDuration];
              double v65 = v64;
              int v66 = [v57 segmentSpeedExceedsLimit];
              int v67 = v66;
              if (v59 <= v61 || v63 <= v65 || (v66 & 1) != 0 || v52 <= v55)
              {
                v81 = (void *)TAStatusLog;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
                {
                  int v82 = v67 ^ 1;
                  v83 = v81;
                  v84 = [v35 hexString];
                  *(_DWORD *)buf = 138478851;
                  uint64_t v130 = (uint64_t)v84;
                  __int16 v131 = 1026;
                  BOOL v132 = v59 > v61;
                  v7 = v116;
                  __int16 v133 = 1026;
                  BOOL v134 = v63 > v65;
                  __int16 v135 = 1026;
                  int v136 = v82;
                  __int16 v137 = 1026;
                  BOOL v138 = v52 > v55;
                  v10 = v119;
                  _os_log_impl(&dword_22345C000, v83, OS_LOG_TYPE_DEFAULT, "#TAFilterSingleVisit not adding %{private}@ because satisfy-length=%{public}d satisfy-duration=%{public}d satisfy-speed=%{public}d  satisfy-min-observation-duration=%{public}d", buf, 0x24u);
                }
              }
              else
              {
                v68 = [v10 latestUtAdvertisements];
                v69 = [v68 objectForKey:v35];

                v70 = [v57 sampledObservedLocations];
                v113 = [v70 arrayByAddingObject:v108];

                v71 = [v124 visitState];
                v72 = [v71 visitSnapshotBuffer];
                uint64_t v73 = [v72 count] - 2;

                v74 = [v124 visitState];
                v75 = [v74 visitSnapshotBuffer];
                v76 = [v75 getObjectAtIndex:v73];

                if (v76)
                {
                  v77 = [v124 visitState];
                  v78 = [v77 visitSnapshotBuffer];
                  v79 = [v78 getObjectAtIndex:v73];
                  uint64_t v111 = [v79 loiType];
                }
                else
                {
                  uint64_t v111 = 0;
                }
                v139[0] = @"DetectionAlgorithm";
                v85 = (objc_class *)objc_opt_class();
                v86 = NSStringFromClass(v85);
                v140[0] = v86;
                v139[1] = @"CurrentVisit";
                v87 = [v119 representativeVisit];
                v88 = [v87 descriptionDictionary];
                v140[1] = v88;
                v139[2] = @"LastObservation";
                v89 = [v69 descriptionDictionary];
                v140[2] = v89;
                v139[3] = @"LengthTraveled";
                v117 = v69;
                v90 = NSNumber;
                [v57 distance];
                v91 = objc_msgSend(v90, "numberWithDouble:");
                v140[3] = v91;
                v139[4] = @"Duration";
                v92 = NSNumber;
                [v57 duration];
                v93 = objc_msgSend(v92, "numberWithDouble:");
                v140[4] = v93;
                v110 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:5];

                v118 = v57;
                unint64_t v94 = +[TAFilterSingleVisit getSingleVisitDetectionTypeForLOIType:v107];
                unint64_t v95 = +[TAFilterSingleVisit getSingleVisitNotificationImmediacyTypeForLOIType:v107 singleVisitSettings:v116];
                v112 = -[TASingleVisitDetectionMetrics initWithInterVisitMetrics:loiType:previousVisitType:]([TASingleVisitDetectionMetrics alloc], "initWithInterVisitMetrics:loiType:previousVisitType:", v118, [v119 loiType], v111);
                v96 = [[TAMetricsDetection alloc] initWithDetectionType:v94 visitDetectionMetrics:0 generalDetectionMetrics:0 singleVisitDetectionMetrics:v112 latestAdvertisement:v117];
                v97 = [TASuspiciousDevice alloc];
                v98 = [v124 clock];
                v99 = [v124 deviceRecord];
                v100 = [v99 getAccessoryInfo:v35];
                unint64_t v101 = v94;
                v57 = v118;
                v102 = [(TASuspiciousDevice *)v97 initWithLatestAdv:v117 detectionSummary:v110 date:v98 locHistory:v113 detectionMetrics:v96 detectionType:v101 immediacyType:v95 accessoryInfo:v100 forceSurfaceReason:1];
                [v109 addObject:v102];

                v7 = v116;
                v10 = v119;
              }
              id v33 = v114;
              v46 = v120;
            }
            else
            {
              v80 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
                +[TAFilterSingleVisit filterSuspiciousDeviceWithStore:singleVisitSettings:andAppendOutgoingRequestsTo:](v141, v80, v35, &v142);
              }
            }
          }
        }
        uint64_t v123 = [v33 countByEnumeratingWithState:&v125 objects:v143 count:16];
      }
      while (v123);
    }
  }
  return v109;
}

+ (unint64_t)getSingleVisitDetectionTypeForLOIType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_2234A9BD8[a3];
  }
}

+ (unint64_t)getSingleVisitNotificationImmediacyTypeForLOIType:(unint64_t)a3 singleVisitSettings:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    if (a3 == 1)
    {
      a3 = 2;
    }
    else if (a3 == 2)
    {
      a3 = [v5 arrivingWorkImmediacyType];
    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a3 singleVisitSettings:(void *)a4 andAppendOutgoingRequestsTo:.cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  v7 = a2;
  v8 = [a3 hexString];
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_fault_impl(&dword_22345C000, v7, OS_LOG_TYPE_FAULT, "#TAFilterSingleVisit some advertisements not present for %{private}@", a1, 0xCu);
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 singleVisitSettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1(&dword_22345C000, v4, v5, "#TAFilterSingleVisit observed %{public}lu devices before the current visit", v6, v7, v8, v9, 0);
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 singleVisitSettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.3(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1(&dword_22345C000, v4, v5, "#TAFilterSingleVisit observed %{public}lu devices in current visit", v6, v7, v8, v9, 0);
}

+ (void)shouldDetectWithStore:(void *)a3 filterSingleVisitSettings:.cold.1(void *a1, unint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = TALocationOfInterestTypeToString(a2);
  uint64_t v7 = [a3 enabledLoiTypesToString];
  int v8 = 138478083;
  uint64_t v9 = v6;
  __int16 v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterSingleVisit LOI type %{private}@ is not in the enabled list %{private}@", (uint8_t *)&v8, 0x16u);
}

@end