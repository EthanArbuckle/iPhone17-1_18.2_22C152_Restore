@interface TAAnalyticsManager
+ (double)_getMotionDuration:(unint64_t)a3 motionDistribution:(id)a4;
+ (id)_convertAISFetch:(id)a3;
+ (id)_convertBOMObservation:(id)a3;
+ (id)_convertDetection:(id)a3 service:(id)a4;
+ (id)_convertHomeDetection:(id)a3 service:(id)a4;
+ (id)_convertPlaySoundWithDetection:(id)a3;
+ (id)_convertRecord:(id)a3 service:(id)a4;
+ (id)_convertRecordForAISFetch:(id)a3 service:(id)a4;
+ (id)_convertScanRequest:(id)a3 service:(id)a4;
+ (int64_t)getHour:(id)a3;
- (TAAnalyticsManager)init;
- (TAAnalyticsManager)initWithSettings:(id)a3;
- (void)_submitDefaultAISFetchCountEvent;
- (void)_submitEvent:(id)a3 content:(id)a4;
- (void)didReadFromURL:(id)a3 bytes:(unint64_t)a4;
- (void)didWriteToURL:(id)a3 bytes:(unint64_t)a4;
- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4;
- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4;
@end

@implementation TAAnalyticsManager

- (TAAnalyticsManager)init
{
  v3 = objc_alloc_init(TAAnalyticsManagerSettings);
  v4 = [(TAAnalyticsManager *)self initWithSettings:v3];

  return v4;
}

- (TAAnalyticsManager)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TAAnalyticsManager;
  v6 = [(TAAnalyticsManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    [(TAAnalyticsManager *)v7 _submitDefaultAISFetchCountEvent];
  }

  return v7;
}

- (void)_submitDefaultAISFetchCountEvent
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"numOfFetchesPerDay";
  v4[1] = @"accessoryType";
  v5[0] = &unk_26D6842C0;
  v5[1] = @"Unknown";
  v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.aisFetchCount" content:v3];
}

+ (id)_convertScanRequest:(id)a3 service:(id)a4
{
  v23[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_super v9 = [v5 key];
    int v10 = [v9 isEqualToString:@"RequestingAdditionalScans"];

    if (v10)
    {
      v11 = [v5 additionalInformation];
      v12 = [v11 objectForKey:@"ScanRequestReason"];
      if (v12)
      {
        v13 = [v5 additionalInformation];
        v14 = [v13 objectForKey:@"ScanRequestReason"];
      }
      else
      {
        v14 = @"Unknown";
      }

      v23[0] = &unk_26D6842D8;
      v22[0] = @"scanRequests";
      v22[1] = @"maximumScanRequests";
      v15 = NSNumber;
      v16 = [v7 settings];
      v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "maximumDailyScans"));
      v23[1] = v17;
      v23[2] = v14;
      v22[2] = @"reason";
      v22[3] = @"settingsVersion";
      v18 = NSNumber;
      v19 = [v7 settings];
      v20 = objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "settingsVersion"));
      v23[3] = v20;
      v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (int64_t)getHour:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 components:32 fromDate:v4];

  int64_t v7 = [v6 hour];
  return v7;
}

+ (id)_convertDetection:(id)a3 service:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = v6;
  if (v5 && v6)
  {
    v8 = [v6 store];
    objc_super v9 = [v8 deviceRecord];
    int v10 = [v5 address];
    uint64_t v11 = [v9 hasSurfacedNotificationFor:v10];

    v12 = [v5 locationHistory];
    unint64_t v13 = [v12 count];

    if (v13 < 2)
    {
      double v35 = 0.0;
      double v36 = -1.0;
    }
    else
    {
      uint64_t v14 = v11;
      v15 = [v5 locationHistory];
      v16 = [v15 firstObject];
      v17 = [v16 getDate];

      v18 = [v5 locationHistory];
      v19 = [v18 firstObject];
      v20 = [v19 getDate];

      v21 = [v5 locationHistory];
      unint64_t v22 = [v21 count];

      if (v22 < 2)
      {
        id v30 = v20;
        id v28 = v17;
      }
      else
      {
        unint64_t v23 = 1;
        do
        {
          v24 = [v5 locationHistory];
          v25 = [v24 objectAtIndexedSubscript:v23];
          v26 = [v25 getDate];

          if ([v17 compare:v26] == 1) {
            v27 = v26;
          }
          else {
            v27 = v17;
          }
          id v28 = v27;

          if ([v20 compare:v26] == -1) {
            v29 = v26;
          }
          else {
            v29 = v20;
          }
          id v30 = v29;

          ++v23;
          v31 = [v5 locationHistory];
          unint64_t v32 = [v31 count];

          v17 = v28;
          v20 = v30;
        }
        while (v32 > v23);
      }
      [v30 timeIntervalSinceDate:v28];
      double v35 = v37;
      v38 = [v7 store];
      uint64_t v39 = [v38 deviceRecord];
      v40 = [v5 address];
      v41 = [(id)v39 getFirstStagedDetectionDate:v40];

      v42 = [MEMORY[0x263EFF910] distantFuture];
      LOBYTE(v39) = [v41 isEqual:v42];

      double v36 = -1.0;
      if ((v39 & 1) == 0)
      {
        [v41 timeIntervalSinceDate:v28];
        if (v43 >= -1.0) {
          double v36 = v43;
        }
        else {
          double v36 = -1.0;
        }
      }

      uint64_t v11 = v14;
    }
    v44 = [v7 store];
    v45 = [v44 deviceRecord];
    v46 = [v5 address];
    uint64_t v47 = [v45 getNumStagedDetections:v46];

    v48 = [v7 store];
    v49 = [v48 deviceRecord];
    v50 = [v5 address];
    uint64_t v51 = [v49 getNumOfAISFetch:v50];

    v52 = [v5 latestAdvertisement];
    v53 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", [v52 getDeviceType]);

    v54 = [v5 accessoryInfo];

    if (v54)
    {
      v55 = [v5 accessoryInfo];
      v56 = [v5 latestAdvertisement];
      [v56 getLatestAdvTypeToString:0];
      v58 = uint64_t v57 = v47;
      uint64_t v59 = [v55 accessoryTypeNameWithAdvTypeString:v58];

      uint64_t v47 = v57;
      v53 = v56;
    }
    else
    {
      v55 = [v5 latestAdvertisement];
      uint64_t v59 = [v55 getLatestAdvTypeToString:v53];
    }

    v60 = [v7 store];
    v61 = [v60 deviceRecord];
    v62 = [v5 address];
    unsigned int v80 = [v61 isAISFetchSuccessful:v62];

    v63 = NSString;
    v64 = +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", [v5 detectionType]);
    v65 = +[TASuspiciousDevice convertTAForceSurfaceReasonToString:](TASuspiciousDevice, "convertTAForceSurfaceReasonToString:", [v5 forceSurfaceReason]);
    v81 = [v63 stringWithFormat:@"%@.%@", v64, v65];

    v84[0] = v81;
    v83[0] = @"type";
    v83[1] = @"hasSurfacedBefore";
    v79 = [NSNumber numberWithBool:v11];
    v84[1] = v79;
    v83[2] = @"secondsFromFirstSeen";
    v77 = [NSNumber numberWithDouble:v35];
    v78 = (void *)v59;
    v84[2] = v77;
    v84[3] = v59;
    v83[3] = @"productName";
    v83[4] = @"hourOfDay";
    v66 = NSNumber;
    [v5 date];
    v67 = v82 = v7;
    v68 = objc_msgSend(v66, "numberWithInteger:", +[TAAnalyticsManager getHour:](TAAnalyticsManager, "getHour:", v67));
    v84[4] = v68;
    v83[5] = @"numStagedDetections";
    v69 = [NSNumber numberWithUnsignedInteger:v47];
    v84[5] = v69;
    v83[6] = @"secondsUntilFirstStagedDetection";
    v70 = [NSNumber numberWithDouble:v36];
    v84[6] = v70;
    v83[7] = @"settingsVersion";
    v71 = NSNumber;
    v72 = [v82 settings];
    v73 = objc_msgSend(v71, "numberWithUnsignedInteger:", objc_msgSend(v72, "settingsVersion"));
    v84[7] = v73;
    v83[8] = @"numAISFetch";
    v74 = [NSNumber numberWithUnsignedInteger:v51];
    v84[8] = v74;
    v83[9] = @"fetchSucceed";
    v75 = [NSNumber numberWithBool:v80];
    v84[9] = v75;
    v34 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:10];

    int64_t v7 = v82;
  }
  else
  {
    v33 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289026;
      __int16 v86 = 2082;
      v87 = "";
      _os_log_impl(&dword_22345C000, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager nil device or service in conversion\"}", (uint8_t *)&buf, 0x12u);
    }
    v34 = 0;
  }

  return v34;
}

+ (id)_convertRecord:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v7 = a4;
    v8 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", [v5 getDeviceType]);
    objc_super v9 = [v5 accessoryInfo];

    if (v9)
    {
      int v10 = [v5 accessoryInfo];
      uint64_t v11 = [v5 latestAdvertisement];
      v12 = [v11 getLatestAdvTypeToString:0];
      uint64_t v13 = [v10 accessoryTypeNameWithAdvTypeString:v12];

      v8 = v11;
    }
    else
    {
      int v10 = [v5 latestAdvertisement];
      uint64_t v13 = [v10 getLatestAdvTypeToString:v8];
    }

    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstArrivingWork"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstBeepOnMovePedestrian"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstBeepOnMoveVehicular"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstDetection"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstLeavingHome"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstLeavingWork"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstObservation"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstPLOIPedestrian"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstPLOIVehicular"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstStagedPLOIAnyVisit"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstStagedPLOIPedestrian"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstStagedPLOIVehicular"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstThreeConsecutiveVisit"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstVehicular"];
    [v14 setObject:&unk_26D6842F0 forKey:@"minuteOfFirstBOM"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numArrivingWork"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numAttemptPlaySound"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numBeepOnMovePedestrian"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numBeepOnMoveVehicular"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numFailurePlaySound"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numLeavingHome"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numLeavingWork"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numPLOIPedestrian"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numPLOIVehicular"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numStagedPLOIAnyVisit"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numStagedPLOIPedestrian"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numStagedPLOIVehicular"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numSuccessfulPlaySound"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numSurfacedAlerts"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numThreeConsecutive"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numVehicular"];
    [v14 setObject:&unk_26D6842C0 forKey:@"numBOMCount"];
    v118 = (void *)v13;
    [v14 setObject:v13 forKey:@"productName"];
    v15 = NSNumber;
    v16 = [v7 settings];

    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "settingsVersion"));
    [v14 setObject:v17 forKey:@"settingsVersion"];

    [v14 setObject:&unk_26D6842D8 forKey:@"submissionCount"];
    v18 = +[TADeviceInformation deviceTypeToString:](TADeviceInformation, "deviceTypeToString:", [v5 type]);
    [v14 setObject:v18 forKey:@"deviceRelation"];

    [v14 setObject:@"Unknown" forKey:@"firstAlertType"];
    v19 = NSNumber;
    v20 = [v5 earliestObservationDate];
    v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "getMinutesSinceStartOfDay"));
    [v14 setObject:v21 forKey:@"minuteOfFirstObservation"];

    uint64_t v22 = [v5 firstSurfacedAlertDate];
    if (v22)
    {
      unint64_t v23 = (void *)v22;
      v24 = [v5 firstSurfacedAlertDate];
      v25 = [MEMORY[0x263EFF910] distantFuture];
      char v26 = [v24 isEqual:v25];

      if ((v26 & 1) == 0)
      {
        v27 = NSNumber;
        id v28 = [v5 firstSurfacedAlertDate];
        v29 = [v5 earliestObservationDate];
        [v28 timeIntervalSinceDate:v29];
        v31 = [v27 numberWithInt:((int)v30 / 60)];
        [v14 setObject:v31 forKey:@"minuteOfFirstDetection"];
      }
    }
    unint64_t v32 = +[TAMetricsDetection convertTADetectionTypeToString:](TAMetricsDetection, "convertTADetectionTypeToString:", [v5 firstSurfacedAlertType]);
    [v14 setObject:v32 forKey:@"firstAlertType"];

    v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numSurfacedAlerts"));
    [v14 setObject:v33 forKey:@"numSurfacedAlerts"];

    uint64_t v34 = [v5 backgroundDetectionCountForDetectionType:11];
    double v35 = [v5 firstDetectionDateForDetectionType:11];
    if (v35)
    {
      double v36 = NSNumber;
      double v37 = [v5 earliestObservationDate];
      [v35 timeIntervalSinceDate:v37];
      uint64_t v39 = [v36 numberWithInt:((int)v38 / 60)];
      [v14 setObject:v39 forKey:@"minuteOfFirstArrivingWork"];
    }
    v40 = [NSNumber numberWithUnsignedInteger:v34];
    [v14 setObject:v40 forKey:@"numArrivingWork"];

    uint64_t v41 = [v5 backgroundDetectionCountForDetectionType:13];
    v42 = [v5 firstDetectionDateForDetectionType:13];
    if (v42)
    {
      double v43 = NSNumber;
      v44 = [v5 earliestObservationDate];
      [v42 timeIntervalSinceDate:v44];
      v46 = [v43 numberWithInt:((int)v45 / 60)];
      [v14 setObject:v46 forKey:@"minuteOfFirstBeepOnMovePedestrian"];
    }
    uint64_t v47 = [NSNumber numberWithUnsignedInteger:v41];
    [v14 setObject:v47 forKey:@"numBeepOnMovePedestrian"];

    uint64_t v48 = [v5 backgroundDetectionCountForDetectionType:12];
    v49 = [v5 firstDetectionDateForDetectionType:12];
    if (v49)
    {
      v50 = NSNumber;
      uint64_t v51 = [v5 earliestObservationDate];
      [v49 timeIntervalSinceDate:v51];
      v53 = [v50 numberWithInt:((int)v52 / 60)];
      [v14 setObject:v53 forKey:@"minuteOfFirstBeepOnMoveVehicular"];
    }
    v54 = [NSNumber numberWithUnsignedInteger:v48];
    [v14 setObject:v54 forKey:@"numBeepOnMoveVehicular"];

    uint64_t v55 = [v5 backgroundDetectionCountForDetectionType:6];
    v56 = [v5 firstDetectionDateForDetectionType:6];
    if (v56)
    {
      uint64_t v57 = NSNumber;
      v58 = [v5 earliestObservationDate];
      [v56 timeIntervalSinceDate:v58];
      v60 = [v57 numberWithInt:((int)v59 / 60)];
      [v14 setObject:v60 forKey:@"minuteOfFirstLeavingHome"];
    }
    v119 = v56;
    v61 = [NSNumber numberWithUnsignedInteger:v55];
    [v14 setObject:v61 forKey:@"numLeavingHome"];

    uint64_t v62 = [v5 backgroundDetectionCountForDetectionType:10];
    v63 = [v5 firstDetectionDateForDetectionType:10];
    if (v63)
    {
      v64 = NSNumber;
      v65 = [v5 earliestObservationDate];
      [v63 timeIntervalSinceDate:v65];
      v67 = [v64 numberWithInt:((int)v66 / 60)];
      [v14 setObject:v67 forKey:@"minuteOfFirstLeavingWork"];
    }
    v115 = v49;
    v116 = v42;
    v117 = v35;
    v68 = [NSNumber numberWithUnsignedInteger:v62];
    [v14 setObject:v68 forKey:@"numLeavingWork"];

    uint64_t v69 = [v5 backgroundDetectionCountForDetectionType:15];
    v70 = [v5 firstDetectionDateForDetectionType:15];
    if (v70)
    {
      v71 = NSNumber;
      v72 = [v5 earliestObservationDate];
      [v70 timeIntervalSinceDate:v72];
      v74 = [v71 numberWithInt:((int)v73 / 60)];
      [v14 setObject:v74 forKey:@"minuteOfFirstPLOIPedestrian"];
    }
    v113 = v70;
    v75 = [NSNumber numberWithUnsignedInteger:v69];
    [v14 setObject:v75 forKey:@"numPLOIPedestrian"];

    uint64_t v76 = [v5 backgroundDetectionCountForDetectionType:14];
    v77 = [v5 firstDetectionDateForDetectionType:14];
    v78 = v119;
    if (v77)
    {
      v79 = NSNumber;
      unsigned int v80 = [v5 earliestObservationDate];
      [v77 timeIntervalSinceDate:v80];
      v82 = [v79 numberWithInt:((int)v81 / 60)];
      [v14 setObject:v82 forKey:@"minuteOfFirstPLOIVehicular"];
    }
    v114 = v63;
    v83 = [NSNumber numberWithUnsignedInteger:v76];
    [v14 setObject:v83 forKey:@"numPLOIVehicular"];

    uint64_t v84 = [v5 backgroundDetectionCountForDetectionType:16];
    v85 = [v5 firstDetectionDateForDetectionType:16];
    if (v85)
    {
      __int16 v86 = NSNumber;
      v87 = [v5 earliestObservationDate];
      [v85 timeIntervalSinceDate:v87];
      v89 = [v86 numberWithInt:((int)v88 / 60)];
      [v14 setObject:v89 forKey:@"minuteOfFirstThreeConsecutiveVisit"];
    }
    v90 = [NSNumber numberWithUnsignedInteger:v84];
    [v14 setObject:v90 forKey:@"numThreeConsecutive"];

    uint64_t v91 = [v5 backgroundDetectionCountForDetectionType:7];
    v92 = [v5 firstDetectionDateForDetectionType:7];
    if (v92)
    {
      v93 = NSNumber;
      v94 = [v5 earliestObservationDate];
      [v92 timeIntervalSinceDate:v94];
      v96 = [v93 numberWithInt:((int)v95 / 60)];
      [v14 setObject:v96 forKey:@"minuteOfFirstVehicular"];

      v78 = v119;
    }
    v97 = [NSNumber numberWithUnsignedInteger:v91];
    [v14 setObject:v97 forKey:@"numVehicular"];

    v98 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundAttemptCount"));
    [v14 setObject:v98 forKey:@"numAttemptPlaySound"];

    v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundFailureCount"));
    [v14 setObject:v99 forKey:@"numFailurePlaySound"];

    v100 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "playSoundSuccessCount"));
    [v14 setObject:v100 forKey:@"numSuccessfulPlaySound"];

    v101 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "numBeepOnMove"));
    [v14 setObject:v101 forKey:@"numBOMCount"];

    uint64_t v102 = [v5 firstBeepOnMoveDate];
    if (v102)
    {
      v103 = (void *)v102;
      v104 = [v5 firstBeepOnMoveDate];
      v105 = [MEMORY[0x263EFF910] distantFuture];
      char v106 = [v104 isEqual:v105];

      v78 = v119;
      if ((v106 & 1) == 0)
      {
        v107 = NSNumber;
        v108 = [v5 firstBeepOnMoveDate];
        v109 = [v5 earliestObservationDate];
        [v108 timeIntervalSinceDate:v109];
        v111 = [v107 numberWithInt:((int)v110 / 60)];
        [v14 setObject:v111 forKey:@"minuteOfFirstBOM"];

        v78 = v119;
      }
    }
    id v6 = (void *)[v14 copy];
  }
  return v6;
}

+ (id)_convertRecordForAISFetch:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", [v5 getDeviceType]);
    objc_super v9 = [v5 accessoryInfo];

    if (v9)
    {
      int v10 = [v5 accessoryInfo];
      uint64_t v11 = [v5 latestAdvertisement];
      v12 = [v11 getLatestAdvTypeToString:0];
      uint64_t v13 = [v10 accessoryTypeNameWithAdvTypeString:v12];

      v8 = v11;
    }
    else
    {
      int v10 = [v5 latestAdvertisement];
      uint64_t v13 = [v10 getLatestAdvTypeToString:v8];
    }

    [v7 setObject:v13 forKey:@"accessoryType"];
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "AISFetchCount"));
    [v7 setObject:v14 forKey:@"numOfFetches"];

    v15 = [v5 accessoryInfo];
    BOOL v16 = v15 != 0;

    v17 = [NSNumber numberWithBool:v16];
    [v7 setObject:v17 forKey:@"isFetchSuccessful"];

    id v6 = (void *)[v7 copy];
  }

  return v6;
}

+ (id)_convertBOMObservation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [v3 objectForKeyedSubscript:@"timeSinceBOM"];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"timeSinceBOM"];
    [v6 doubleValue];
    v8 = [NSNumber numberWithInt:((int)v7 / 60)];
    [v4 setObject:v8 forKey:@"minutesSinceLastBOMBounded"];
  }
  objc_super v9 = [v3 objectForKeyedSubscript:@"productInfo"];

  if (v9)
  {
    int v10 = [v3 objectForKeyedSubscript:@"productInfo"];
    [v4 setObject:v10 forKey:@"productInfo"];
  }
  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

+ (id)_convertPlaySoundWithDetection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [v3 objectForKeyedSubscript:@"firstAlertMinutes"];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"firstAlertMinutes"];
    [v4 setObject:v6 forKey:@"firstAlertMinutes"];
  }
  double v7 = [v3 objectForKeyedSubscript:@"firstSeenMinutes"];

  if (v7)
  {
    v8 = [v3 objectForKeyedSubscript:@"firstSeenMinutes"];
    [v4 setObject:v8 forKey:@"firstSeenMinutes"];
  }
  objc_super v9 = [v3 objectForKeyedSubscript:@"lastAlertMinutes"];

  if (v9)
  {
    int v10 = [v3 objectForKeyedSubscript:@"lastAlertMinutes"];
    [v4 setObject:v10 forKey:@"lastAlertMinutes"];
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"lastAttemptMinutes"];

  if (v11)
  {
    v12 = [v3 objectForKeyedSubscript:@"lastAttemptMinutes"];
    [v4 setObject:v12 forKey:@"lastAttemptMinutes"];
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"productInfo"];

  if (v13)
  {
    id v14 = [v3 objectForKeyedSubscript:@"productInfo"];
    [v4 setObject:v14 forKey:@"productInfo"];
  }
  v15 = [v3 objectForKeyedSubscript:@"soundCount"];

  if (v15)
  {
    BOOL v16 = [v3 objectForKeyedSubscript:@"soundCount"];
    [v4 setObject:v16 forKey:@"soundCount"];
  }
  v17 = [v3 objectForKeyedSubscript:@"soundMinutes"];

  if (v17)
  {
    v18 = [v3 objectForKeyedSubscript:@"soundMinutes"];
    [v4 setObject:v18 forKey:@"soundMinutes"];
  }
  v19 = [v3 objectForKeyedSubscript:@"success"];

  if (v19)
  {
    v20 = [v3 objectForKeyedSubscript:@"success"];
    [v4 setObject:v20 forKey:@"success"];
  }
  v21 = (void *)[v4 copy];

  return v21;
}

+ (id)_convertAISFetch:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [v3 objectForKeyedSubscript:@"firstSeenSeconds"];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"firstSeenSeconds"];
    [v4 setObject:v6 forKey:@"secondsFromFirstSeen"];
  }
  double v7 = [v3 objectForKeyedSubscript:@"success"];

  if (v7)
  {
    v8 = [v3 objectForKeyedSubscript:@"success"];
    [v4 setObject:v8 forKey:@"fetchSucceed"];
  }
  objc_super v9 = [v3 objectForKeyedSubscript:@"deviceType"];

  if (v9)
  {
    int v10 = [v3 objectForKeyedSubscript:@"deviceType"];
    [v4 setObject:v10 forKey:@"accessoryType"];
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"fetchCount"];

  if (v11)
  {
    v12 = [v3 objectForKeyedSubscript:@"fetchCount"];
    [v4 setObject:v12 forKey:@"fetchCount"];
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"lastAttemptMinutes"];

  if (v13)
  {
    id v14 = [v3 objectForKeyedSubscript:@"lastAttemptMinutes"];
    [v4 setObject:v14 forKey:@"lastAttemptMinutes"];
  }
  v15 = (void *)[v4 copy];

  return v15;
}

+ (double)_getMotionDuration:(unint64_t)a3 motionDistribution:(id)a4
{
  id v5 = a4;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  double v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    objc_super v9 = [v5 objectForKeyedSubscript:v8];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (id)_convertHomeDetection:(id)a3 service:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v5 && v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_super v9 = [v5 detectionMetrics];
    double v10 = [v9 singleVisitDetectionMetrics];
    double v11 = [v10 interVisitMetrics];
    [v11 duration];
    double v13 = v12;

    id v14 = [NSNumber numberWithDouble:v13 / 60.0];
    [v8 setObject:v14 forKey:@"duration"];

    v15 = NSNumber;
    BOOL v16 = [v5 detectionMetrics];
    v17 = [v16 singleVisitDetectionMetrics];
    v18 = [v17 interVisitMetrics];
    [v18 distance];
    v19 = objc_msgSend(v15, "numberWithDouble:");
    [v8 setObject:v19 forKey:@"distanceTraveled"];

    v20 = [v5 latestAdvertisement];
    v21 = +[TASPAdvertisement TASPAdvertisementDeviceTypeToString:](TASPAdvertisement, "TASPAdvertisementDeviceTypeToString:", [v20 getDeviceType]);

    uint64_t v22 = [v5 accessoryInfo];

    if (v22)
    {
      unint64_t v23 = [v5 accessoryInfo];
      v24 = [v5 latestAdvertisement];
      v25 = [v24 getLatestAdvTypeToString:0];
      char v26 = [v23 accessoryTypeNameWithAdvTypeString:v25];

      v21 = v24;
    }
    else
    {
      unint64_t v23 = [v5 latestAdvertisement];
      char v26 = [v23 getLatestAdvTypeToString:v21];
    }

    [v8 setObject:v26 forKey:@"deviceType"];
    v29 = [v5 detectionMetrics];
    double v30 = [v29 singleVisitDetectionMetrics];
    uint64_t v31 = [v30 previousVisitType];

    if (v31 == 1)
    {
      unint64_t v32 = @"Home";
    }
    else
    {
      v33 = [v5 detectionMetrics];
      uint64_t v34 = [v33 singleVisitDetectionMetrics];
      uint64_t v35 = [v34 previousVisitType];

      if (v35) {
        unint64_t v32 = @"Non-Home";
      }
      else {
        unint64_t v32 = @"Unknown";
      }
    }
    [v8 setObject:v32 forKey:@"lastVisitType"];
    double v36 = [v5 detectionMetrics];
    double v37 = [v36 singleVisitDetectionMetrics];
    double v38 = [v37 interVisitMetrics];
    uint64_t v39 = [v38 durationPerMotionState];

    +[TAAnalyticsManager _getMotionDuration:1 motionDistribution:v39];
    double v41 = v40;
    +[TAAnalyticsManager _getMotionDuration:2 motionDistribution:v39];
    double v43 = v42;
    +[TAAnalyticsManager _getMotionDuration:3 motionDistribution:v39];
    double v45 = v44;
    +[TAAnalyticsManager _getMotionDuration:4 motionDistribution:v39];
    double v47 = v46;
    +[TAAnalyticsManager _getMotionDuration:0 motionDistribution:v39];
    double v49 = v48;
    double v50 = v41 + v43 + v45 + v47 + v48;
    if (fabs(v50) >= 0.0000001)
    {
      uint64_t v51 = [NSNumber numberWithDouble:v41 / v50];
      [v8 setObject:v51 forKey:@"staticRatio"];

      double v52 = [NSNumber numberWithDouble:v43 / v50];
      [v8 setObject:v52 forKey:@"pedestrianRatio"];

      v53 = [NSNumber numberWithDouble:v47 / v50];
      [v8 setObject:v53 forKey:@"cyclingRatio"];

      v54 = [NSNumber numberWithDouble:v45 / v50];
      [v8 setObject:v54 forKey:@"vehicularRatio"];

      uint64_t v55 = [NSNumber numberWithDouble:v49 / v50];
      [v8 setObject:v55 forKey:@"unknownRatio"];
    }
    else
    {
      [v8 setObject:&unk_26D6843E8 forKey:@"staticRatio"];
      [v8 setObject:&unk_26D6843E8 forKey:@"pedestrianRatio"];
      [v8 setObject:&unk_26D6843E8 forKey:@"cyclingRatio"];
      [v8 setObject:&unk_26D6843E8 forKey:@"vehicularRatio"];
      [v8 setObject:&unk_26D6843E8 forKey:@"unknownRatio"];
    }
    id v28 = (void *)[v8 copy];
  }
  else
  {
    v27 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      v57[0] = 68289026;
      v57[1] = 0;
      __int16 v58 = 2082;
      double v59 = "";
      _os_log_impl(&dword_22345C000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager nil device or service in conversion for home detection\"}", (uint8_t *)v57, 0x12u);
    }
    id v28 = 0;
  }

  return v28;
}

- (void)_submitEvent:(id)a3 content:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(TAAnalyticsManagerSettings *)self->_settings enableSubmission];
  objc_super v9 = TAStatusLog;
  BOOL v10 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      __int16 v16 = 2113;
      id v17 = v6;
      __int16 v18 = 2113;
      id v19 = v7;
      _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager Submitting analytics event\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
    }
    id v11 = v7;
    AnalyticsSendEventLazy();
  }
  else if (v10)
  {
    *(_DWORD *)uint64_t buf = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2113;
    id v19 = v7;
    _os_log_impl(&dword_22345C000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAAnalyticsManager Analytics submission not enabled\", \"eventName\":\"%{private}@\", \"content\":\"%{private}@\"}", buf, 0x26u);
  }
}

id __43__TAAnalyticsManager__submitEvent_content___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v13 = +[TAAnalyticsManager _convertDetection:v12 service:v6];
        [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.notifyDetection" content:v13];
        if ([v12 detectionType] == 3)
        {
          __int16 v14 = +[TAAnalyticsManager _convertHomeDetection:v12 service:v6];
          [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.arrivalHomeVisit" content:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)trackingAvoidanceService:(id)a3 requestingAdditionalInformation:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    double v42 = @"deviceType";
    uint64_t v43 = *(void *)v52;
    id v44 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v45 = v9;
      do
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        int v13 = objc_msgSend(v12, "key", v42);
        int v14 = [v13 isEqualToString:@"RequestingAdditionalScans"];

        uint64_t v46 = v11;
        if (v14)
        {
          long long v15 = +[TAAnalyticsManager _convertScanRequest:v12 service:v6];
          [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.ScanRequests" content:v15];
          goto LABEL_22;
        }
        long long v16 = [v12 key];
        int v17 = [v16 isEqualToString:@"ExpiringRecordMetrics"];

        if (v17)
        {
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v15 = [v12 additionalInformation];
          uint64_t v18 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v48 != v20) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                unint64_t v23 = [v12 additionalInformation];
                v24 = [v23 objectForKeyedSubscript:v22];

                v25 = +[TAAnalyticsManager _convertRecord:v24 service:v6];
                [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.recordExpiry" content:v25];
                char v26 = +[TAAnalyticsManager _convertRecordForAISFetch:v24 service:v6];
                [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.aisFetch.recordExpiry" content:v26];
              }
              uint64_t v19 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
            }
            while (v19);
            uint64_t v10 = v43;
            id v7 = v44;
            uint64_t v9 = v45;
          }
          goto LABEL_22;
        }
        v27 = [v12 key];
        int v28 = [v27 isEqualToString:@"BOMObservationMetrics"];

        if (v28)
        {
          v29 = [v12 additionalInformation];
          long long v15 = +[TAAnalyticsManager _convertBOMObservation:v29];

          double v30 = self;
          uint64_t v31 = @"com.apple.clx.ta.BOMObservations";
          goto LABEL_21;
        }
        unint64_t v32 = [v12 key];
        int v33 = [v32 isEqualToString:@"PlaySoundWithDetectionMetrics"];

        if (v33)
        {
          uint64_t v34 = [v12 additionalInformation];
          long long v15 = +[TAAnalyticsManager _convertPlaySoundWithDetection:v34];

          double v30 = self;
          uint64_t v31 = @"com.apple.clx.ta.playsound";
LABEL_21:
          [(TAAnalyticsManager *)v30 _submitEvent:v31 content:v15];
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v35 = [v12 key];
        int v36 = [v35 isEqualToString:@"AISFetchMetrics"];

        if (v36)
        {
          double v37 = [v12 additionalInformation];
          long long v15 = +[TAAnalyticsManager _convertAISFetch:v37];

          [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.aisFetch" content:v15];
          v55[0] = @"numOfFetchesPerDay";
          v55[1] = @"accessoryType";
          v56[0] = &unk_26D6842D8;
          double v38 = [v12 additionalInformation];
          uint64_t v39 = [v38 objectForKeyedSubscript:v42];
          v56[1] = v39;
          double v40 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
          [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.aisFetchCount" content:v40];

          uint64_t v9 = v45;
          goto LABEL_22;
        }
LABEL_23:
        uint64_t v11 = v46 + 1;
      }
      while (v46 + 1 != v9);
      uint64_t v41 = [v7 countByEnumeratingWithState:&v51 objects:v58 count:16];
      uint64_t v9 = v41;
    }
    while (v41);
  }
}

- (void)didWriteToURL:(id)a3 bytes:(unint64_t)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"type";
  v8[1] = @"numOperations";
  v9[0] = @"write";
  v9[1] = &unk_26D6842D8;
  v8[2] = @"size";
  id v5 = [NSNumber numberWithUnsignedInteger:a4];
  v9[2] = v5;
  v8[3] = @"settingsVersion";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAAnalyticsManagerSettings settingsVersion](self->_settings, "settingsVersion"));
  v9[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.persistence" content:v7];
}

- (void)didReadFromURL:(id)a3 bytes:(unint64_t)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"type";
  v8[1] = @"numOperations";
  v9[0] = @"read";
  v9[1] = &unk_26D6842D8;
  v8[2] = @"size";
  id v5 = [NSNumber numberWithUnsignedInteger:a4];
  v9[2] = v5;
  v8[3] = @"settingsVersion";
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAAnalyticsManagerSettings settingsVersion](self->_settings, "settingsVersion"));
  v9[3] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  [(TAAnalyticsManager *)self _submitEvent:@"com.apple.clx.ta.persistence" content:v7];
}

- (void).cxx_destruct
{
}

@end