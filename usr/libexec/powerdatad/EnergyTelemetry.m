@interface EnergyTelemetry
+ (id)sharedInstance;
- (BOOL)isBAInfoAvailable;
- (BOOL)recordLastAccumulatedEnergyTelemetry:(id)a3;
- (EnergyTelemetry)init;
- (id)appendIncrementalData:(id)a3 toRecords:(id)a4;
- (id)calcSlotValueFromEnergy:(double)a3 withIntensity:(double)a4;
- (id)copyAccumulatedEnergyTelemetry;
- (id)fetchEmissionHistoriesForDays:(id)a3 fromRecords:(id)a4;
- (id)findDayStarts:(id)a3 returnMidnights:(id *)a4;
- (id)getBalancingAuthority;
- (id)getDateFrom:(id)a3 alignedToMinutes:(unint64_t)a4;
- (id)getIncrementalEnergyRecord;
- (id)getLastAccumulatedEnergyTelemetry;
- (id)getUTCMidnightFor:(id)a3;
- (unint64_t)iterateDaysCovering:(id)a3 toEnd:(id)a4;
- (unsigned)getSlotWithDate:(id)a3;
- (void)calculateEnergyAndPublishTelemetry;
- (void)getEnergyTelemetry;
- (void)sendDailySummaryToCoreAnalyticsForDate:(id)a3 withLocation:(id)a4 withCarbon:(double)a5 withEnergy:(double)a6 withSystem:(double)a7 missingIntensity:(BOOL)a8;
- (void)sendDayToCoreAnalytics:(_NSRange)a3 ofRecord:(id)a4;
- (void)sendDayToPowerlog:(_NSRange)a3 ofRecord:(id)a4;
- (void)sendSlotEventToCoreAnalytics:(id)a3;
- (void)sendTypedEventToCoreAnalyticsWithDate:(id)a3 withEnergy:(double)a4 andIntensity:(id)a5 forSlot:(id)a6 atLocation:(id)a7;
- (void)setIncrementalEnergyRecord:(id)a3;
@end

@implementation EnergyTelemetry

- (EnergyTelemetry)init
{
  v28.receiver = self;
  v28.super_class = (Class)EnergyTelemetry;
  id v2 = [(EnergyTelemetry *)&v28 init];
  os_log_t v3 = os_log_create("com.apple.powerdatad", "energyTelemetry");
  v4 = (void *)*((void *)v2 + 5);
  *((void *)v2 + 5) = v3;

  if (!*((void *)v2 + 5))
  {
    BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v19) {
      sub_10000A3A8(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_16;
  }
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  v6 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = v5;

  if (!*((void *)v2 + 4))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR)) {
      sub_10000A3E4();
    }
    goto LABEL_16;
  }
  uint64_t v7 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  v8 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v7;

  if (!*((void *)v2 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR)) {
      sub_10000A418();
    }
    goto LABEL_16;
  }
  id v9 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v10 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v9;

  v11 = (void *)*((void *)v2 + 1);
  v12 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v11 setTimeZone:v12];

  v13 = +[NSDate date];
  uint64_t v14 = [v2 getUTCMidnightFor:v13];
  v15 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v14;

  if (!*((void *)v2 + 3))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 5), OS_LOG_TYPE_ERROR)) {
      sub_10000A44C();
    }
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if (sub_100008244())
  {
    uint64_t v16 = [sub_100004920() managerWithID:@"com.apple.powerdatad.gridManager" locationBundlePath:@"/System/Library/LocationBundles/WirelessDiagnostics.bundle"];
    v17 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v16;
  }
  v18 = (EnergyTelemetry *)v2;
LABEL_17:

  return v18;
}

+ (id)sharedInstance
{
  if (qword_100014B18 != -1) {
    dispatch_once(&qword_100014B18, &stru_1000105D0);
  }
  id v2 = (void *)qword_100014B10;

  return v2;
}

- (id)getUTCMidnightFor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_utcMidnight = &self->_utcMidnight;
    if (!self->_utcMidnight || !-[NSCalendar isDate:inSameDayAsDate:](self->_utcCal, "isDate:inSameDayAsDate:", v4))
    {
      v6 = [(NSCalendar *)self->_utcCal dateBySettingHour:0 minute:0 second:0 ofDate:v4 options:0];
      utcMidnight = self->_utcMidnight;
      self->_utcMidnight = v6;

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
        sub_10000A4B4((uint64_t)p_utcMidnight, log, v9, v10, v11, v12, v13, v14);
      }
    }
    v15 = *p_utcMidnight;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A480();
    }
    v15 = 0;
  }

  return v15;
}

- (unsigned)getSlotWithDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EnergyTelemetry *)self getUTCMidnightFor:v4];
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    unsigned int v7 = (v6 / 60.0) / 0xF;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A524();
    }
    unsigned int v7 = -1;
  }

  return v7;
}

- (BOOL)recordLastAccumulatedEnergyTelemetry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_defaults;
  objc_sync_enter(v5);
  [(NSUserDefaults *)self->_defaults setObject:v4 forKey:@"last_telemetry_baseline"];
  objc_sync_exit(v5);

  return 1;
}

- (id)getLastAccumulatedEnergyTelemetry
{
  os_log_t v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"last_telemetry_baseline"];
  objc_sync_exit(v3);

  return v4;
}

- (id)getIncrementalEnergyRecord
{
  os_log_t v3 = self->_defaults;
  objc_sync_enter(v3);
  id v4 = [(NSUserDefaults *)self->_defaults arrayForKey:@"incremental_telemetry_array"];
  objc_sync_exit(v3);

  return v4;
}

- (void)setIncrementalEnergyRecord:(id)a3
{
  id v5 = a3;
  id v4 = self->_defaults;
  objc_sync_enter(v4);
  [(NSUserDefaults *)self->_defaults setObject:v5 forKey:@"incremental_telemetry_array"];
  objc_sync_exit(v4);
}

- (id)getDateFrom:(id)a3 alignedToMinutes:(unint64_t)a4
{
  if (a3)
  {
    if (a4) {
      unint64_t v5 = a4;
    }
    else {
      unint64_t v5 = 60;
    }
    utcCal = self->_utcCal;
    id v7 = a3;
    v8 = [(NSCalendar *)utcCal components:96 fromDate:v7];
    uint64_t v9 = [[self->_utcCal dateBySettingHour:[v8 hour] minute:([v8 minute] / v5 * v5) second:0 ofDate:v7 options:0];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isBAInfoAvailable
{
  uint64_t v2 = sub_100008244();
  if (v2)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2050000000;
    uint64_t v10 = (void *)qword_100014B30;
    uint64_t v18 = qword_100014B30;
    if (!qword_100014B30)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100008430;
      v14[3] = &unk_1000106C0;
      v14[4] = &v15;
      sub_100008430((uint64_t)v14, v3, v4, v5, v6, v7, v8, v9, v13);
      uint64_t v10 = (void *)v16[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v15, 8);
    LOBYTE(v2) = objc_opt_class() != 0;
  }
  return v2;
}

- (id)findDayStarts:(id)a3 returnMidnights:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = +[NSSortDescriptor sortDescriptorWithKey:@"slot_date" ascending:1];
  uint64_t v20 = v17;
  uint64_t v6 = +[NSArray arrayWithObjects:&v20 count:1];
  [v5 sortUsingDescriptors:v6];

  id v19 = +[NSMutableIndexSet indexSet];
  uint64_t v7 = +[NSMutableArray arrayWithCapacity:7];
  uint64_t v8 = (char *)[v5 count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    for (i = 0; i != v9; ++i)
    {
      uint64_t v12 = [v5 objectAtIndexedSubscript:i];
      uint8_t v13 = [v12 objectForKeyedSubscript:@"slot_date"];
      uint64_t v14 = [(EnergyTelemetry *)self getUTCMidnightFor:v13];

      if (v14 && ([v10 isEqualToDate:v14] & 1) == 0)
      {
        [v19 addIndex:i];
        [v7 addObject:v14];
        id v15 = v14;

        uint64_t v10 = v15;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (a4) {
    *a4 = v7;
  }

  return v19;
}

- (id)appendIncrementalData:(id)a3 toRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] < 0x2A0)
  {
    if ([v7 count])
    {
      uint64_t v9 = [v7 lastObject];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"slot_date"];
      if (!v10)
      {
        id v11 = [v9 objectForKeyedSubscript:@"telemetry_date"];
        uint64_t v10 = [(EnergyTelemetry *)self getDateFrom:v11 alignedToMinutes:15];
      }
      uint64_t v12 = [v6 objectForKeyedSubscript:@"slot_date"];
      if ([v12 isEqualToDate:v10])
      {
        uint8_t v13 = [v9 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v13 doubleValue];
        double v15 = v14;
        uint64_t v16 = [v6 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v16 doubleValue];
        uint64_t v18 = +[NSNumber numberWithDouble:v15 + v17];
        [v6 setObject:v18 forKeyedSubscript:@"wall_energy_consumed"];

        id v19 = [v9 objectForKeyedSubscript:@"system_energy_consumed"];
        [v19 doubleValue];
        double v21 = v20;
        uint64_t v22 = [v6 objectForKeyedSubscript:@"system_energy_consumed"];
        [v22 doubleValue];
        uint64_t v24 = +[NSNumber numberWithDouble:v21 + v23];
        [v6 setObject:v24 forKeyedSubscript:@"system_energy_consumed"];

        [v7 removeLastObject];
      }
      [v7 addObject:v6];
      id v8 = v6;
    }
    else
    {
      [v7 addObject:v6];
      id v8 = v6;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A598();
    }
    id v8 = 0;
  }

  return v8;
}

- (void)getEnergyTelemetry
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(EnergyTelemetry *)v2 getIncrementalEnergyRecord];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v4 = +[NSMutableArray array];
  }
  v92 = v4;
  id v5 = v2->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A830((int)[v4 count], v97, v5);
  }

  id v6 = [(EnergyTelemetry *)v2 copyAccumulatedEnergyTelemetry];
  if (v6)
  {
    if ([v92 count])
    {
      id v7 = [v92 lastObject];
      id v8 = [v7 objectForKeyedSubscript:@"slot_date"];
      BOOL v9 = v8 == 0;

      if (v9)
      {
        if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG)) {
          sub_10000A7F0();
        }
        uint64_t v10 = +[NSMutableArray array];

        [(EnergyTelemetry *)v2 setIncrementalEnergyRecord:v10];
        v92 = (void *)v10;
      }
    }
    v90 = [(EnergyTelemetry *)v2 getLastAccumulatedEnergyTelemetry];
    if (v90)
    {
      id v11 = [v6 objectForKeyedSubscript:@"system_energy_consumed"];
      [v11 doubleValue];
      double v13 = v12;
      double v14 = [v90 objectForKeyedSubscript:@"system_energy_consumed"];
      [v14 doubleValue];
      if (v13 < v15)
      {
        BOOL v21 = 1;
      }
      else
      {
        uint64_t v16 = [v6 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v16 doubleValue];
        double v18 = v17;
        id v19 = [v90 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v19 doubleValue];
        BOOL v21 = v18 < v20;
      }
      double v23 = [v90 objectForKeyedSubscript:@"telemetry_date"];
      uint64_t v24 = +[NSDate date];
      uint64_t v25 = [v23 laterDate:v24];
      v89 = v23;
      BOOL v22 = v25 == v23;

      if (v22)
      {
        log = v2->_log;
        BOOL v22 = 1;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v89;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Last accumulated-energy date %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v89 = 0;
      BOOL v22 = 0;
      BOOL v21 = 0;
    }
    if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG)) {
      sub_10000A788();
    }
    if (v90) {
      BOOL v27 = v89 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    int v28 = v27 || v21;
    if ((v22 | v28) == 1)
    {
      v29 = v2->_log;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v94 = v90;
        __int16 v95 = 1024;
        LODWORD(v96[0]) = v21;
        WORD2(v96[0]) = 1024;
        *(_DWORD *)((char *)v96 + 6) = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Recreating baseline. lastData %@ negativeDelta %u, lastDateInFuture %u", buf, 0x18u);
      }
    }
    else
    {
      v31 = [v6 objectForKeyedSubscript:@"telemetry_date"];
      [v31 timeIntervalSinceDate:v89];
      double v33 = v32;

      v34 = v2->_log;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10000A704((uint64_t)v90, v34, v33);
      }
      if (v33 <= 14400.0)
      {
        v35 = [v6 objectForKeyedSubscript:@"system_energy_consumed"];
        [v35 doubleValue];
        double v37 = v36;
        v38 = [v90 objectForKeyedSubscript:@"system_energy_consumed"];
        [v38 doubleValue];
        double v40 = v39;

        v41 = [v6 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v41 doubleValue];
        double v43 = v42;
        v44 = [v90 objectForKeyedSubscript:@"wall_energy_consumed"];
        [v44 doubleValue];
        double v46 = v45;

        id v47 = [(EnergyTelemetry *)v2 getDateFrom:v89 alignedToMinutes:15];
        id v48 = v89;
        v91 = [v6 objectForKeyedSubscript:@"telemetry_date"];
        v49 = v48;
        v50 = [v6 objectForKeyedSubscript:@"telemetry_date"];
        [v50 timeIntervalSinceDate:v47];
        double v52 = v51;

        id v53 = [v92 count];
        id v54 = v53;
        if (v53 == (id)672 || 672 - (uint64_t)v53 >= (uint64_t)vcvtpd_s64_f64(v52 / 900.0))
        {
          id v57 = v49;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_ERROR)) {
            sub_10000A680();
          }
          v55 = [(EnergyTelemetry *)v2 getDateFrom:v91 alignedToMinutes:15];
          v56 = [v55 dateByAddingTimeInterval:-(double)(900 * (671 - (uint64_t)v54))];

          id v47 = v56;
          id v57 = v47;
        }
        id v87 = v47;
        v58 = [v87 dateByAddingTimeInterval:900.0];
        v59 = [(EnergyTelemetry *)v2 getDateFrom:v91 alignedToMinutes:15];
        [v58 timeIntervalSinceDate:v57];
        double v61 = v60;
        v85 = v57;
        v86 = v58;
        [v91 timeIntervalSinceDate:v57];
        double v63 = v62;
        v88 = 0;
        double v64 = v37 - v40;
        double v65 = v43 - v46;
        for (i = v87; ; i = (void *)v81)
        {
          v67 = [v59 laterDate:i];
          BOOL v68 = v61 > 0.001 && v67 == v59;
          BOOL v69 = v68;

          if (!v69) {
            break;
          }
          if (v61 <= v63) {
            double v70 = v61;
          }
          else {
            double v70 = v63;
          }
          v71 = +[NSMutableDictionary dictionary];
          v72 = +[NSNumber numberWithUnsignedInt:[(EnergyTelemetry *)v2 getSlotWithDate:i]];
          [v71 setObject:v72 forKeyedSubscript:@"slot_id"];

          [v71 setObject:i forKeyedSubscript:@"slot_date"];
          v73 = [v6 objectForKeyedSubscript:@"adapter_family"];
          [v71 setObject:v73 forKeyedSubscript:@"adapter_family"];

          double v74 = v70 / v63;
          v75 = +[NSNumber numberWithDouble:v65 * v74];
          [v71 setObject:v75 forKeyedSubscript:@"wall_energy_consumed"];

          v76 = +[NSNumber numberWithDouble:v64 * v74];
          [v71 setObject:v76 forKeyedSubscript:@"system_energy_consumed"];

          v77 = [v6 objectForKeyedSubscript:@"balancing_authority_id"];
          [v71 setObject:v77 forKeyedSubscript:@"balancing_authority_id"];

          v78 = [v6 objectForKeyedSubscript:@"telemetry_date"];
          [v71 setObject:v78 forKeyedSubscript:@"telemetry_date"];

          v79 = v2->_log;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            v84 = [v71 description];
            *(_DWORD *)buf = 134218242;
            v94 = v88;
            __int16 v95 = 2112;
            v96[0] = v84;
            _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Segment %lu telemetry %@", buf, 0x16u);

            ++v88;
          }

          id v80 = [(EnergyTelemetry *)v2 appendIncrementalData:v71 toRecords:v92];
          uint64_t v81 = [i dateByAddingTimeInterval:900.0];

          [v91 timeIntervalSinceDate:v81];
          double v83 = v82;

          double v61 = fmin(fabs(v83), 900.0);
        }
        [(EnergyTelemetry *)v2 setIncrementalEnergyRecord:v92];
        [(EnergyTelemetry *)v2 recordLastAccumulatedEnergyTelemetry:v6];

        v30 = v89;
        goto LABEL_60;
      }
      if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_ERROR)) {
        sub_10000A64C();
      }
    }
    [(EnergyTelemetry *)v2 recordLastAccumulatedEnergyTelemetry:v6];
    v30 = v89;
LABEL_60:

    goto LABEL_61;
  }
  if (os_log_type_enabled((os_log_t)v2->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000A60C();
  }
LABEL_61:

  objc_sync_exit(v2);
}

- (id)copyAccumulatedEnergyTelemetry
{
  uint64_t v26 = 0;
  uint64_t valuePtr = 0;
  uint64_t v25 = 0;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSDate date];
  [v3 setObject:v4 forKeyedSubscript:@"telemetry_date"];

  CFDictionaryRef v5 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A878();
    }
    goto LABEL_9;
  }
  io_object_t v7 = MatchingService;
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"PowerTelemetryData", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v7);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A8AC();
    }
LABEL_9:
    id v12 = 0;
    goto LABEL_28;
  }
  CFDictionaryRef v9 = CFProperty;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"AccumulatedWallEnergyEstimate");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
    uint64_t v11 = valuePtr;
  }
  else
  {
    uint64_t v11 = 0;
  }
  double v13 = +[NSNumber numberWithUnsignedLongLong:v11];
  [v3 setObject:v13 forKeyedSubscript:@"wall_energy_consumed"];

  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v9, @"AccumulatedSystemEnergyConsumed");
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberSInt64Type, &v26);
    uint64_t v15 = v26;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = +[NSNumber numberWithUnsignedLongLong:v15];
  [v3 setObject:v16 forKeyedSubscript:@"system_energy_consumed"];

  CFDictionaryRef v17 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(v7, @"AdapterDetails", kCFAllocatorDefault, 0);
  CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v17, @"FamilyCode");
  if (v18)
  {
    CFNumberGetValue(v18, kCFNumberSInt64Type, &v25);
    uint64_t v19 = v25;
  }
  else
  {
    uint64_t v19 = 0;
  }
  double v20 = +[NSNumber numberWithUnsignedLongLong:v19];
  [v3 setObject:v20 forKeyedSubscript:@"adapter_family"];

  CFRelease(v17);
  CFRelease(v9);
  IOObjectRelease(v7);
  if (!sub_100008244()
    || !sub_1000044F8()
    || ![(EnergyTelemetry *)self isBAInfoAvailable])
  {
LABEL_23:
    BOOL v22 = 0;
    goto LABEL_24;
  }
  BOOL v21 = [(EnergyTelemetry *)self getBalancingAuthority];
  BOOL v22 = [v21 identifier];

  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10000A8E0();
    }
    goto LABEL_23;
  }
LABEL_24:
  if (v22) {
    CFStringRef v23 = v22;
  }
  else {
    CFStringRef v23 = &stru_100010C58;
  }
  [v3 setObject:v23 forKeyedSubscript:@"balancing_authority_id"];
  id v12 = v3;

LABEL_28:
  return v12;
}

- (id)calcSlotValueFromEnergy:(double)a3 withIntensity:(double)a4
{
  return +[NSNumber numberWithDouble:a3 * a4 / 1000000000.0];
}

- (void)calculateEnergyAndPublishTelemetry
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  obj = (os_log_t *)v2;
  double v70 = +[NSMutableIndexSet indexSet];
  id v3 = [(EnergyTelemetry *)v2 getIncrementalEnergyRecord];
  id v71 = [v3 mutableCopy];

  if (v71 && [v71 count])
  {
    if ([v71 count]
      && ([v71 lastObject],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 objectForKeyedSubscript:@"slot_date"],
          CFDictionaryRef v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4,
          !v5))
    {
      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR)) {
        sub_10000A9F8();
      }
    }
    else
    {
      BOOL v68 = [(os_log_t *)obj findDayStarts:v71 returnMidnights:0];
      if (sub_100008244())
      {
        if (sub_1000044F8() && [(os_log_t *)obj isBAInfoAvailable])
        {
          id v6 = [(os_log_t *)obj fetchEmissionHistoriesForDays:v68 fromRecords:v71];
          io_object_t v7 = obj[5];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            sub_10000A9B0(v79, (uint64_t)[v6 count], v7);
          }

          uint64_t v67 = [v71 count];
          if (v67)
          {
            uint64_t v9 = 0;
            *(void *)&long long v8 = 138412290;
            long long v66 = v8;
            do
            {
              uint64_t v10 = [v71 objectAtIndexedSubscript:v9];
              id v11 = [v10 mutableCopy];

              id v12 = [v11 objectForKeyedSubscript:@"telemetry_date"];
              double v13 = [v11 objectForKeyedSubscript:@"slot_date"];
              CFNumberRef v14 = [v6 objectForKeyedSubscript:v13];
              uint64_t v15 = v14;
              if (v13)
              {
                if (v14)
                {
                  uint64_t v16 = [v14 objectForKeyedSubscript:@"average"];
                  if (!v16
                    || (+[NSNull null],
                        CFDictionaryRef v17 = objc_claimAutoreleasedReturnValue(),
                        BOOL v18 = v16 == v17,
                        v17,
                        v18))
                  {
                    uint64_t v24 = obj[5];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v66;
                      id v78 = v11;
                      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "systemwide emissions data wasn't found for record: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    uint64_t v19 = [v15 objectForKeyedSubscript:@"marginal"];
                    if (!v19
                      || (+[NSNull null],
                          double v20 = objc_claimAutoreleasedReturnValue(),
                          BOOL v21 = v19 == v20,
                          v20,
                          v21))
                    {

                      uint64_t v26 = obj[5];
                      BOOL v22 = &off_100011350;
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v66;
                        id v78 = v11;
                        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "marginal emissions data wasn't found for record: %@", buf, 0xCu);
                      }
                    }
                    else
                    {
                      BOOL v22 = (_UNKNOWN **)v19;
                    }
                    BOOL v27 = [v11 objectForKeyedSubscript:@"wall_energy_consumed"];
                    [v27 doubleValue];
                    double v29 = v28;
                    [v16 doubleValue];
                    v31 = [(os_log_t *)obj calcSlotValueFromEnergy:v29 withIntensity:v30];
                    [v11 setObject:v31 forKeyedSubscript:@"carbon_footprint"];

                    [v11 setObject:v16 forKeyedSubscript:@"avg_intensity"];
                    [v11 setObject:v22 forKeyedSubscript:@"marginal_intensity"];
                    [v71 setObject:v11 atIndexedSubscript:v9];
                    [v70 addIndex:[v71 indexOfObject:v11]];
                    double v32 = obj[5];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v66;
                      id v78 = v11;
                      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Calculated carbon %@", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  uint64_t v25 = obj[5];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v66;
                    id v78 = v11;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "emissions data wasn't found for record: %@", buf, 0xCu);
                  }
                }
              }
              else
              {
                CFStringRef v23 = obj[5];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v66;
                  id v78 = v11;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "calculateEnergy tried to process a record in the old format: %@", buf, 0xCu);
                }
              }

              ++v9;
            }
            while (v67 != v9);
          }
          int v33 = 1;
        }
        else
        {
          int v33 = 0;
          id v6 = &__NSDictionary0__struct;
        }
        if (sub_1000044F8())
        {
          if (([(os_log_t *)obj isBAInfoAvailable] & 1) == 0)
          {
            v34 = obj[5];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "GridDataServices framework unavailable", buf, 2u);
            }
          }
        }
      }
      else
      {
        int v33 = 0;
      }
      uint64_t v35 = (uint64_t)[v68 count];
      double v36 = (char *)[v68 firstIndex];
      int v37 = v33 ^ 1;
      while (v36 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = (char *)[v68 indexGreaterThanIndex:v36];
        double v39 = v38;
        if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v35 > 4) {
          int v40 = 1;
        }
        else {
          int v40 = v37;
        }
        if (v40 == 1 && v38 > v36)
        {
          v41 = v36;
          do
          {
            double v42 = [v71 objectAtIndexedSubscript:v41];
            double v43 = [v42 objectForKeyedSubscript:@"carbon_footprint"];

            if (!v43)
            {
              v44 = [v71 objectAtIndexedSubscript:v41];
              id v45 = [v44 mutableCopy];

              [v45 setObject:&stru_100010C58 forKeyedSubscript:@"balancing_authority_id"];
              [v45 setObject:&off_100011360 forKeyedSubscript:@"avg_intensity"];
              double v46 = [v45 objectForKeyedSubscript:@"wall_energy_consumed"];
              [v46 doubleValue];
              id v47 = -[os_log_t calcSlotValueFromEnergy:withIntensity:](obj, "calcSlotValueFromEnergy:withIntensity:");
              [v45 setObject:v47 forKeyedSubscript:@"carbon_footprint"];

              [v71 setObject:v45 atIndexedSubscript:v41];
            }
            ++v41;
          }
          while (v39 != v41);
        }
        if (v39 <= v36) {
          goto LABEL_61;
        }
        char v48 = 1;
        v49 = v36;
        do
        {
          v50 = [v71 objectAtIndexedSubscript:v49];
          double v51 = [v50 objectForKeyedSubscript:@"carbon_footprint"];
          BOOL v52 = v51 != 0;

          v48 &= v52;
          ++v49;
        }
        while (v39 != v49);
        if (v48)
        {
LABEL_61:
          -[os_log_t sendDayToCoreAnalytics:ofRecord:](obj, "sendDayToCoreAnalytics:ofRecord:", v36, v39 - v36, v71);
          -[os_log_t sendDayToPowerlog:ofRecord:](obj, "sendDayToPowerlog:ofRecord:", v36, v39 - v36, v71);
          [v70 addIndexesInRange:v36, v39 - v36];
        }
        --v35;
        double v36 = (char *)[v68 indexGreaterThanIndex:v36];
      }
      if ([v70 count])
      {
        id v53 = obj[5];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v70;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Pruning processed records %@", buf, 0xCu);
        }
        [v71 removeObjectsAtIndexes:v70];
        [v70 removeAllIndexes];
      }
      id v54 = +[NSDate date];
      v55 = [v54 dateByAddingTimeInterval:-345600.0];

      if (os_log_type_enabled(obj[5], OS_LOG_TYPE_DEBUG)) {
        sub_10000A948();
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v56 = v71;
      id v57 = [v56 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v73;
        do
        {
          for (i = 0; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v73 != v58) {
              objc_enumerationMutation(v56);
            }
            double v60 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            double v61 = [v60 objectForKeyedSubscript:@"telemetry_date"];
            double v62 = [v61 earlierDate:v55];
            double v63 = [v60 objectForKeyedSubscript:@"telemetry_date"];
            BOOL v64 = v62 == v63;

            if (v64) {
              [v70 addIndex:[v56 indexOfObject:v60]];
            }
          }
          id v57 = [v56 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v57);
      }

      double v65 = obj[5];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v78 = v70;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Pruning expired records %@", buf, 0xCu);
      }
      [v56 removeObjectsAtIndexes:v70];
      [(os_log_t *)obj setIncrementalEnergyRecord:v56];
    }
  }
  else if (os_log_type_enabled(obj[5], OS_LOG_TYPE_ERROR))
  {
    sub_10000A914();
  }

  objc_sync_exit(obj);
}

- (id)getBalancingAuthority
{
  sub_100004920();
  if (objc_opt_class() && [(EnergyTelemetry *)self isBAInfoAvailable] && sub_100008244())
  {
    id v3 = [(_GDSManager *)self->gridManager latestBalancingAuthority];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      sub_10000AA2C(log, v3);
    }
  }
  else
  {
    CFDictionaryRef v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_object_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "GridDataServices framework unavailable", v7, 2u);
    }
    id v3 = 0;
  }

  return v3;
}

- (void)sendDayToPowerlog:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (length)
  {
    v56[0] = @"telemetry_date";
    v56[1] = @"slot_id";
    v56[2] = @"wall_energy_consumed";
    v56[3] = @"system_energy_consumed";
    v56[4] = @"adapter_family";
    v56[5] = @"balancing_authority_id";
    v56[6] = @"avg_intensity";
    v56[7] = @"marginal_intensity";
    v56[8] = @"carbon_footprint";
    uint64_t v8 = +[NSArray arrayWithObjects:v56 count:9];
    +[NSMutableDictionary dictionary];
    v41 = int v40 = (void *)v8;
    [v41 setObject:v8 forKeyedSubscript:@"Keys"];
    uint64_t v43 = 0;
    uint64_t v9 = 0;
    *(void *)&long long v10 = 138412290;
    long long v35 = v10;
    id v11 = v7;
    v38 = self;
    double v39 = v7;
    NSUInteger v36 = location;
    NSUInteger v37 = length;
    do
    {
      id v12 = [v11 objectAtIndexedSubscript:v9 + location];
      id v13 = [v12 mutableCopy];

      CFNumberRef v14 = [v13 objectForKeyedSubscript:@"sent_to_powerlog"];

      if (v14)
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v35;
          id v50 = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Skipping %@ as it was already sent to powerlog.", buf, 0xCu);
        }
      }
      else
      {
        NSUInteger v42 = v9 + location;
        uint64_t v16 = +[NSMutableArray array];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v17 = v40;
        id v18 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v46;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              BOOL v22 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * i), v35];
              if (v22)
              {
                [v16 addObject:v22];
              }
              else
              {
                CFStringRef v23 = +[NSNull null];
                [v16 addObject:v23];
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v45 objects:v55 count:16];
          }
          while (v19);
        }

        uint64_t v24 = +[NSNumber numberWithUnsignedInteger:v43];
        [v41 setObject:v16 forKeyedSubscript:v24];

        ++v43;
        [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"sent_to_powerlog"];
        id v11 = v39;
        [v39 setObject:v13 atIndexedSubscript:v42];

        NSUInteger length = v37;
        self = v38;
        NSUInteger location = v36;
      }

      ++v9;
    }
    while (v9 != length);
    id v7 = v11;
    uint64_t v25 = +[NSNumber numberWithUnsignedInteger:v43];
    [v41 setObject:v25 forKeyedSubscript:@"NumRows"];

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      sub_10000AB18();
      if (v43) {
        goto LABEL_20;
      }
    }
    else if (v43)
    {
LABEL_20:
      uint64_t v26 = self->_log;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v27 = v26;
        id v28 = [v41 count];
        double v29 = [v41 objectForKeyedSubscript:&off_100011370];
        double v30 = [v29 objectAtIndexedSubscript:0];
        v31 = +[NSNumber numberWithUnsignedInteger:v43 - 1];
        double v32 = [v41 objectForKeyedSubscript:v31];
        int v33 = [v32 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 134218498;
        id v50 = v28;
        __int16 v51 = 2112;
        BOOL v52 = v30;
        __int16 v53 = 2112;
        id v54 = v33;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Sending %lu entries to powerlog. Start %@ End %@", buf, 0x20u);
      }
      PLLogRegisteredEvent();
    }

    goto LABEL_26;
  }
  v34 = self->_log;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "Nothing to send to powerlog.", buf, 2u);
  }
LABEL_26:
}

- (void)sendDayToCoreAnalytics:(_NSRange)a3 ofRecord:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (length)
  {
    NSUInteger v33 = location;
    if (location >= location + length)
    {
      char v9 = 1;
      double v11 = 0.0;
      double v10 = 0.0;
      double v8 = 0.0;
    }
    else
    {
      double v8 = 0.0;
      char v9 = 1;
      double v10 = 0.0;
      double v11 = 0.0;
      do
      {
        id v13 = [v7 objectAtIndexedSubscript:location];
        id v14 = [v13 mutableCopy];

        uint64_t v15 = [v14 objectForKeyedSubscript:@"avg_intensity"];
        if (v15)
        {
          uint64_t v16 = [v14 objectForKeyedSubscript:@"balancing_authority_id"];
          unsigned __int8 v17 = [&stru_100010C58 isEqualToString:v16];

          v9 &= v17;
        }
        id v18 = [v14 objectForKeyedSubscript:@"sent_to_coreanalytics"];

        if (v18)
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Skipping %@ as it was already sent to Core Analytics.", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v20 = [v14 objectForKeyedSubscript:@"carbon_footprint"];
          [v20 doubleValue];
          double v8 = v8 + v21;

          BOOL v22 = [v14 objectForKeyedSubscript:@"wall_energy_consumed"];
          [v22 doubleValue];
          double v10 = v10 + v23;

          uint64_t v24 = [v14 objectForKeyedSubscript:@"system_energy_consumed"];
          [v24 doubleValue];
          double v11 = v11 + v25;

          [(EnergyTelemetry *)self sendSlotEventToCoreAnalytics:v14];
          [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"sent_to_coreanalytics"];
          [v7 setObject:v14 atIndexedSubscript:location];
        }

        ++location;
        --length;
      }
      while (length);
    }
    BOOL v27 = [v7 objectAtIndexedSubscript:v33];
    id v28 = [v27 objectForKeyedSubscript:@"slot_date"];
    double v29 = [(EnergyTelemetry *)self getUTCMidnightFor:v28];

    double v30 = [v7 objectAtIndexedSubscript:v33];
    v31 = [v30 objectForKeyedSubscript:@"balancing_authority_id"];

    double v32 = self->_log;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413826;
      id v35 = v29;
      __int16 v36 = 2112;
      NSUInteger v37 = v31;
      __int16 v38 = 2048;
      double v39 = v8;
      __int16 v40 = 2048;
      double v41 = v10;
      __int16 v42 = 2048;
      double v43 = v11;
      __int16 v44 = 1024;
      int v45 = v9 & 1;
      __int16 v46 = 2048;
      long long v47 = v31;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEBUG, "sending daily summary: %@ \"%@\" %.20e %.20e %.20e %d %p", buf, 0x44u);
    }
    [(EnergyTelemetry *)self sendDailySummaryToCoreAnalyticsForDate:v29 withLocation:v31 withCarbon:v9 & 1 withEnergy:v8 withSystem:v10 missingIntensity:v11];
  }
  else
  {
    uint64_t v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Nothing to send to Core Analytics.", buf, 2u);
    }
  }
}

- (void)sendDailySummaryToCoreAnalyticsForDate:(id)a3 withLocation:(id)a4 withCarbon:(double)a5 withEnergy:(double)a6 withSystem:(double)a7 missingIntensity:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  v24[0] = v14;
  v23[0] = @"domain";
  v23[1] = @"date";
  uint64_t v15 = [(NSISO8601DateFormatter *)self->_utcFormatter stringFromDate:a3];
  v24[1] = v15;
  v23[2] = @"summary_value";
  uint64_t v16 = +[NSNumber numberWithDouble:a5];
  v24[2] = v16;
  v23[3] = @"wall_value";
  unsigned __int8 v17 = +[NSNumber numberWithDouble:a6];
  v24[3] = v17;
  v23[4] = @"system_energy_value";
  uint64_t v18 = +[NSNumber numberWithDouble:a7];
  id v19 = (void *)v18;
  uint64_t v20 = &__kCFBooleanTrue;
  if (!v8) {
    uint64_t v20 = &__kCFBooleanFalse;
  }
  v24[4] = v18;
  v24[5] = v20;
  v23[5] = @"is_intensity_static";
  v23[6] = @"algorithm_enabled";
  v24[6] = &__kCFBooleanFalse;
  double v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10000AB80();
  }
  id v22 = v21;
  AnalyticsSendEventLazy();
}

- (void)sendSlotEventToCoreAnalytics:(id)a3
{
  id v4 = a3;
  id v11 = [v4 objectForKeyedSubscript:@"balancing_authority_id"];
  CFDictionaryRef v5 = [v4 objectForKeyedSubscript:@"slot_date"];
  id v6 = [v4 objectForKeyedSubscript:@"wall_energy_consumed"];
  [v6 doubleValue];
  double v8 = v7;
  char v9 = [v4 objectForKeyedSubscript:@"avg_intensity"];
  double v10 = [v4 objectForKeyedSubscript:@"slot_id"];

  [(EnergyTelemetry *)self sendTypedEventToCoreAnalyticsWithDate:v5 withEnergy:v9 andIntensity:v10 forSlot:v11 atLocation:v8];
}

- (void)sendTypedEventToCoreAnalyticsWithDate:(id)a3 withEnergy:(double)a4 andIntensity:(id)a5 forSlot:(id)a6 atLocation:(id)a7
{
  id v10 = a3;
  id v11 = (_UNKNOWN **)a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = v13;
  if (v11) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = &off_100011360;
  }
  uint64_t v20 = v13;
  double v21 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v14;
  id v19 = v15;
  AnalyticsSendEventLazy();
}

- (unint64_t)iterateDaysCovering:(id)a3 toEnd:(id)a4
{
  id v6 = a4;
  double v7 = [(EnergyTelemetry *)self getUTCMidnightFor:a3];
  double v8 = [(EnergyTelemetry *)self getUTCMidnightFor:v6];
  id v9 = v7;
  id v10 = [v8 earlierDate:v9];

  if (v10 == v8)
  {
    unint64_t v11 = 0;
    id v13 = v9;
  }
  else
  {
    unint64_t v11 = 0;
    id v12 = v9;
    do
    {
      ++v11;
      id v13 = [v12 dateByAddingTimeInterval:86400.0];

      id v14 = [v8 earlierDate:v13];

      id v12 = v13;
    }
    while (v14 != v8);
  }

  return v11;
}

- (id)fetchEmissionHistoriesForDays:(id)a3 fromRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (char *)[v5 firstIndex];
  double v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 96 * (void)[v5 count]);
  id v50 = v5;
  id v9 = (char *)[v5 indexGreaterThanIndex:v7];
  if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v12 = @"balancing_authority_id";
    *(void *)&long long v10 = 138412803;
    long long v47 = v10;
    long long v48 = v8;
    while (1)
    {
      id v13 = v9;
      id v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v9 - v7, v47);
      uint64_t v15 = v7;
      CFStringRef v16 = v12;
      if (v13 > v7)
      {
        do
        {
          id v17 = [v6 objectAtIndexedSubscript:v15];
          id v18 = [v17 objectForKeyedSubscript:v16];
          [v14 objectForKeyedSubscript:v18];
          v20 = id v19 = v14;
          [v20 doubleValue];
          double v22 = v21;
          double v23 = [v17 objectForKeyedSubscript:@"wall_energy_consumed"];
          [v23 doubleValue];
          double v25 = v22 + v24;

          id v14 = v19;
          uint64_t v26 = +[NSNumber numberWithDouble:v25];
          [v19 setObject:v26 forKeyedSubscript:v18];

          ++v15;
        }
        while (v13 != v15);
      }
      CFStringRef v12 = v16;
      BOOL v27 = [v14 keysSortedByValueUsingComparator:&stru_100010660];
      id v54 = v27;
      if ([v27 count])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          __int16 v44 = log;
          int v45 = [v6 objectAtIndexedSubscript:v7];
          __int16 v46 = [v45 objectForKeyedSubscript:@"slot_date"];
          *(_DWORD *)buf = 138412546;
          id v56 = v46;
          __int16 v57 = 2112;
          uint64_t v58 = v54;
          _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "sorted BA IDs for day %@: %@", buf, 0x16u);

          BOOL v27 = v54;
        }
      }
      if ([v27 count])
      {
        double v29 = [v27 objectAtIndexedSubscript:0];
      }
      else
      {
        double v29 = &stru_100010C58;
      }
      __int16 v53 = v14;
      if ((unint64_t)[v27 count] >= 2
        && [(__CFString *)v29 isEqualToString:&stru_100010C58])
      {
        uint64_t v30 = [v27 objectAtIndexedSubscript:1];

        double v29 = (__CFString *)v30;
      }
      v31 = v7;
      if (v13 > v7)
      {
        do
        {
          double v32 = [v6 objectAtIndexedSubscript:v31];
          id v33 = [v32 mutableCopy];

          [v33 setObject:v29 forKeyedSubscript:v16];
          [v6 setObject:v33 atIndexedSubscript:v31];

          ++v31;
        }
        while (v13 != v31);
      }
      v34 = [v6 objectAtIndexedSubscript:v7];
      id v35 = [v34 objectForKeyedSubscript:@"slot_date"];
      __int16 v36 = [(EnergyTelemetry *)self getUTCMidnightFor:v35];

      BOOL v52 = v36;
      NSUInteger v37 = [v36 dateByAddingTimeInterval:86400.0];
      if (!v29 || [(__CFString *)v29 isEqualToString:&stru_100010C58]) {
        break;
      }
      double v8 = v48;
      double v41 = v52;
      if (sub_100008244())
      {
        __int16 v51 = v37;
        __int16 v42 = self->_log;
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v47;
          id v56 = v52;
          __int16 v57 = 2112;
          uint64_t v58 = v51;
          __int16 v59 = 2113;
          double v60 = v29;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_DEBUG, "Fetching emissions for %@ to %@ for \"%{private}@\"", buf, 0x20u);
        }
        __int16 v38 = [(_GDSManager *)self->gridManager carbonIntensityHistoryForBA:v29 from:v52 to:v51];
        double v43 = [v38 historicalMap];
        if (v43) {
          [v48 addEntriesFromDictionary:v43];
        }

        goto LABEL_33;
      }
LABEL_34:

      id v9 = (char *)[v50 indexGreaterThanIndex:v13];
      double v7 = v13;
      if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_2;
      }
    }
    __int16 v51 = v37;
    v61[0] = @"average";
    v61[1] = @"marginal";
    v62[0] = &off_100011360;
    v62[1] = &off_100011360;
    __int16 v38 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
    if (v13 <= v7)
    {
      double v8 = v48;
    }
    else
    {
      double v8 = v48;
      do
      {
        double v39 = [v6 objectAtIndexedSubscript:v7];
        __int16 v40 = [v39 objectForKeyedSubscript:@"slot_date"];
        [v48 setObject:v38 forKeyedSubscript:v40];

        ++v7;
      }
      while (v13 != v7);
    }
    double v41 = v52;
LABEL_33:

    NSUInteger v37 = v51;
    goto LABEL_34;
  }
LABEL_2:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->gridManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_utcMidnight, 0);
  objc_storeStrong((id *)&self->_utcFormatter, 0);

  objc_storeStrong((id *)&self->_utcCal, 0);
}

@end