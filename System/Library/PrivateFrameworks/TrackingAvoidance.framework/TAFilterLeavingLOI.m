@interface TAFilterLeavingLOI
+ (BOOL)shouldDetectWithStore:(id)a3 filterLeavingLOISettings:(id)a4;
+ (id)filterSuspiciousDeviceWithStore:(id)a3 leavingLOISettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5;
+ (unint64_t)getLeavingLOIDetectionTypeForLOIType:(unint64_t)a3;
+ (unint64_t)getLeavingLOINotificationImmediacyTypeForLOIType:(unint64_t)a3 leavingLOISettings:(id)a4;
@end

@implementation TAFilterLeavingLOI

+ (id)filterSuspiciousDeviceWithStore:(id)a3 leavingLOISettings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (TAFilterLeavingLOISettings *)a4;
  id v99 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (+[TAFilterLeavingLOI shouldDetectWithStore:v6 filterLeavingLOISettings:v7])
  {
    if (!v7) {
      v7 = [[TAFilterLeavingLOISettings alloc] initWithDefaults];
    }
    v8 = [v6 visitState];
    v9 = [v8 visitSnapshotBuffer];
    uint64_t v10 = [v9 lastObject];

    v106 = v6;
    v11 = [v6 visitState];
    v12 = [v11 interVisitMetricSnapshotBuffer];
    v13 = [v12 lastObject];

    v14 = [(TAFilterLeavingLOISettings *)v7 visitsSettings];
    v107 = (void *)v10;
    v15 = +[TAFilterVisits getExitAddressSetInTAVisitSnapshot:v10 usingSettings:v14];

    v16 = (void *)MEMORY[0x263EFFA08];
    v17 = [v13 accumulatedDeviceMetrics];
    v18 = [v17 allKeys];
    v19 = [v16 setWithArray:v18];

    v20 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.5(v20, v15);
    }
    v21 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:].cold.4(v21, v19);
    }
    v97 = v19;
    v98 = v15;
    v22 = +[TAFilterVisits getIntersectionOfFirstSet:v15 andSecondSet:v19];
    v23 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      *(_DWORD *)buf = 134349056;
      uint64_t v119 = [v22 count];
      _os_log_impl(&dword_22345C000, v24, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI identified %{public}lu suspicious candidates ...", buf, 0xCu);
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id obj = v22;
    uint64_t v112 = [obj countByEnumeratingWithState:&v114 objects:v133 count:16];
    if (v112)
    {
      uint64_t v111 = *(void *)v115;
      v104 = v7;
      v100 = v13;
      do
      {
        for (uint64_t i = 0; i != v112; ++i)
        {
          if (*(void *)v115 != v111) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          v27 = [v13 lastAdvPerDevice];
          v28 = [v27 objectForKey:v26];

          if (v28)
          {
            uint64_t v29 = [v28 getDate];
            v30 = [v6 clock];
            v113 = (void *)v29;
            [v30 timeIntervalSinceDate:v29];
            double v32 = v31;
            v33 = [(TAFilterLeavingLOISettings *)v7 visitsSettings];
            [v33 maxSuspiciousDuration];
            double v35 = v34;

            if (v32 >= v35)
            {
              v81 = (void *)TAStatusLog;
              v82 = v113;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
                +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:]((uint64_t)v131, v81);
              }
            }
            else
            {
              v36 = [v107 earliestUtAdvertisements];
              v37 = [v36 objectForKey:v26];

              v38 = [v107 latestUtAdvertisements];
              v39 = [v38 objectForKey:v26];

              v109 = v39;
              v110 = v37;
              if (v37 && v39)
              {
                v40 = [v39 getDate];
                v41 = [v37 getDate];
                [v40 timeIntervalSinceDate:v41];
                double v43 = v42;
                v44 = [(TAFilterLeavingLOISettings *)v7 visitsSettings];
                [v44 minObservationInterval];
                double v46 = v45;

                v47 = [v13 accumulatedDeviceMetrics];
                v48 = [v47 objectForKey:v26];

                [v48 distance];
                double v50 = v49;
                [(TAFilterLeavingLOISettings *)v7 thresholdOfSignificantDistance];
                double v52 = v51;
                [v48 duration];
                double v54 = v53;
                [(TAFilterLeavingLOISettings *)v7 thresholdOfSignificantDuration];
                double v56 = v55;
                int v57 = [v48 segmentSpeedExceedsLimit];
                int v58 = v57;
                if (v50 <= v52 || v54 <= v56 || (v57 & 1) != 0 || v43 <= v46)
                {
                  v84 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
                  {
                    int v85 = v58 ^ 1;
                    v86 = v84;
                    v87 = [v26 hexString];
                    *(_DWORD *)buf = 138478851;
                    uint64_t v119 = (uint64_t)v87;
                    __int16 v120 = 1026;
                    BOOL v121 = v50 > v52;
                    v13 = v100;
                    __int16 v122 = 1026;
                    BOOL v123 = v54 > v56;
                    __int16 v124 = 1026;
                    int v125 = v85;
                    id v6 = v106;
                    __int16 v126 = 1026;
                    BOOL v127 = v43 > v46;
                    v7 = v104;
                    _os_log_impl(&dword_22345C000, v86, OS_LOG_TYPE_DEFAULT, "#TAFilterLeavingLOI not adding %{private}@ because satisfy-length=%{public}d satisfy-duration=%{public}d satisfy-speed=%{public}d  satisfy-min-observation-duration=%{public}d", buf, 0x24u);
                  }
                }
                else
                {
                  v59 = [v13 lastAdvPerDevice];
                  [v59 objectForKey:v26];
                  v60 = v105 = v48;

                  uint64_t v61 = [v107 loiType];
                  v128[0] = @"DetectionAlgorithm";
                  v62 = (objc_class *)objc_opt_class();
                  v63 = NSStringFromClass(v62);
                  v129[0] = v63;
                  v128[1] = @"LastObservation";
                  v64 = [v60 descriptionDictionary];
                  v129[1] = v64;
                  v128[2] = @"LengthTraveled";
                  v65 = NSNumber;
                  [v105 distance];
                  v66 = objc_msgSend(v65, "numberWithDouble:");
                  v129[2] = v66;
                  v128[3] = @"Duration";
                  v67 = NSNumber;
                  [v105 duration];
                  v68 = objc_msgSend(v67, "numberWithDouble:");
                  v129[3] = v68;
                  v128[4] = @"LOIType";
                  v69 = [NSNumber numberWithUnsignedInteger:v61];
                  v129[4] = v69;
                  v103 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:5];

                  v70 = [v106 visitState];
                  v71 = [v70 visitSnapshotBuffer];
                  uint64_t v72 = [v71 count] - 2;

                  v73 = [v106 visitState];
                  v74 = [v73 visitSnapshotBuffer];
                  v75 = [v74 getObjectAtIndex:v72];

                  if (v75)
                  {
                    v76 = [v106 visitState];
                    v77 = [v76 visitSnapshotBuffer];
                    v78 = [v77 getObjectAtIndex:v72];
                    uint64_t v79 = [v78 loiType];
                  }
                  else
                  {
                    uint64_t v79 = 0;
                  }
                  unint64_t v88 = +[TAFilterLeavingLOI getLeavingLOIDetectionTypeForLOIType:v61];
                  unint64_t v101 = +[TAFilterLeavingLOI getLeavingLOINotificationImmediacyTypeForLOIType:v61 leavingLOISettings:v104];
                  v102 = [[TASingleVisitDetectionMetrics alloc] initWithInterVisitMetrics:v105 loiType:v61 previousVisitType:v79];
                  v89 = [[TAMetricsDetection alloc] initWithDetectionType:v88 visitDetectionMetrics:0 generalDetectionMetrics:0 singleVisitDetectionMetrics:v102 latestAdvertisement:v60];
                  v90 = [TASuspiciousDevice alloc];
                  v91 = [v106 clock];
                  v92 = [v105 sampledObservedLocations];
                  v93 = [v106 deviceRecord];
                  v94 = [v93 getAccessoryInfo:v26];
                  v95 = [(TASuspiciousDevice *)v90 initWithLatestAdv:v60 detectionSummary:v103 date:v91 locHistory:v92 detectionMetrics:v89 detectionType:v88 immediacyType:v101 accessoryInfo:v94 forceSurfaceReason:0];
                  [v99 addObject:v95];

                  id v6 = v106;
                  v7 = v104;

                  v48 = v105;
                  v13 = v100;
                }

                v82 = v113;
              }
              else
              {
                v83 = (void *)TAStatusLog;
                v82 = v113;
                if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
                  +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:]((uint64_t)v130, v83);
                }
              }
            }
          }
          else
          {
            v80 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
              +[TAFilterLeavingLOI filterSuspiciousDeviceWithStore:leavingLOISettings:andAppendOutgoingRequestsTo:]((uint64_t)v132, v80);
            }
          }
        }
        uint64_t v112 = [obj countByEnumeratingWithState:&v114 objects:v133 count:16];
      }
      while (v112);
    }
  }
  return v99;
}

+ (unint64_t)getLeavingLOIDetectionTypeForLOIType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_2234A9B80[a3];
  }
}

+ (unint64_t)getLeavingLOINotificationImmediacyTypeForLOIType:(unint64_t)a3 leavingLOISettings:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 1)
  {
    uint64_t v7 = [v5 leavingHomeImmediacyType];
  }
  else
  {
    if (a3 != 2)
    {
      unint64_t v8 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [v5 leavingWorkImmediacyType];
  }
  unint64_t v8 = v7;
LABEL_7:

  return v8;
}

+ (BOOL)shouldDetectWithStore:(id)a3 filterLeavingLOISettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 visitState];
  unint64_t v8 = [v7 visitSnapshotBuffer];
  uint64_t v9 = [v8 count];

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [v5 visitState];
  v11 = [v10 visitSnapshotBuffer];
  uint64_t v12 = [v11 lastObject];
  unint64_t v13 = [(id)v12 loiType];

  v14 = [v6 enabledLoiTypes];
  v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v13];
  LOBYTE(v12) = [v14 containsObject:v15];

  if ((v12 & 1) == 0)
  {
    v28 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
      +[TAFilterLeavingLOI shouldDetectWithStore:filterLeavingLOISettings:](v28, v13, v6);
    }
    goto LABEL_9;
  }
  v16 = [v5 visitState];
  v17 = [v16 interVisitMetricSnapshotBuffer];
  uint64_t v18 = [v17 count];

  if (!v18) {
    goto LABEL_9;
  }
  v19 = [v5 visitState];
  v20 = [v19 visitSnapshotBuffer];
  v21 = [v20 lastObject];
  int v22 = [v21 isClosed];

  if (!v22)
  {
LABEL_9:
    char v27 = 0;
    goto LABEL_10;
  }
  v23 = [v5 visitState];
  v24 = [v23 interVisitMetricSnapshotBuffer];
  v25 = [v24 lastObject];
  char v26 = [v25 isClosed];

  char v27 = v26 ^ 1;
LABEL_10:

  return v27;
}

+ (void)filterSuspiciousDeviceWithStore:(uint64_t)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.1(uint64_t a1, void *a2)
{
  id v5 = OUTLINED_FUNCTION_0_0(a1, a2);
  id v6 = [v3 hexString];
  _DWORD *v4 = 138477827;
  void *v2 = v6;
  OUTLINED_FUNCTION_2(&dword_22345C000, v7, v8, "#TAFilterLeavingLOI some advertisements not present for %{private}@");
}

+ (void)filterSuspiciousDeviceWithStore:(uint64_t)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.3(uint64_t a1, void *a2)
{
  id v5 = OUTLINED_FUNCTION_0_0(a1, a2);
  id v6 = [v3 hexString];
  *(_DWORD *)v4 = 138477827;
  void *v2 = v6;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterLeavingLOI does not satisfy recent observation requirement for %{private}@", v4, 0xCu);
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1(&dword_22345C000, v4, v5, "#TAFilterLeavingLOI observed %{public}lu devices after last visit", v6, v7, v8, v9, 0);
}

+ (void)filterSuspiciousDeviceWithStore:(void *)a1 leavingLOISettings:(void *)a2 andAppendOutgoingRequestsTo:.cold.5(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_1(&dword_22345C000, v4, v5, "#TAFilterLeavingLOI observed %{public}lu devices in last visit", v6, v7, v8, v9, 0);
}

+ (void)shouldDetectWithStore:(void *)a3 filterLeavingLOISettings:.cold.1(void *a1, unint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint64_t v6 = TALocationOfInterestTypeToString(a2);
  uint64_t v7 = [a3 enabledLoiTypesToString];
  int v8 = 138478083;
  uint64_t v9 = v6;
  __int16 v10 = 2113;
  v11 = v7;
  _os_log_debug_impl(&dword_22345C000, v5, OS_LOG_TYPE_DEBUG, "#TAFilterLeavingLOI LOI type %{private}@ is not in the enabled list %{private}@", (uint8_t *)&v8, 0x16u);
}

@end