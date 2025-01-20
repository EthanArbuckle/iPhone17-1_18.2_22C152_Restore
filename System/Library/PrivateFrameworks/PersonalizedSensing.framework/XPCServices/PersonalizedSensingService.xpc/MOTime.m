@interface MOTime
+ (BOOL)supportsSecureCoding;
+ (id)buildSimpleMealTagIntervalsForDate:(id)a3;
+ (id)buildSimpleTimeTagIntervalsForDate:(id)a3;
+ (id)buildTimeTagIntervalsForDate:(id)a3;
+ (id)dateFromDate:(id)a3 hour:(int64_t)a4;
+ (id)dayOfWeekFromDate:(id)a3;
+ (id)dayOfWeekFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5;
+ (id)localTimeOfDate:(id)a3 timeZone:(id)a4;
+ (id)localizedDateStringFromDate:(id)a3;
+ (id)timeForDate:(id)a3;
+ (id)timeForDate:(id)a3 timeZoneManager:(id)a4;
+ (id)timeFromStartDate:(id)a3 endDate:(id)a4;
+ (id)timeFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5;
+ (id)timeOfDayPrefixFromDate:(id)a3;
+ (id)timeOfDayPrefixFromStartDate:(id)a3 endDate:(id)a4;
+ (id)timeStringFromTimeTag:(unint64_t)a3;
+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 nowDate:(id)a5 timeZone:(id)a6;
+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
+ (unint64_t)dayOfWeekTagFromDate:(id)a3;
+ (unint64_t)dayOfWeekTagFromStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)mealtagFromStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)simpleTimetagFromStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)timetagFromStartDate:(id)a3 endDate:(id)a4;
+ (unint64_t)typeOfDayTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5;
- (BOOL)isEqual:(id)a3;
- (MOTime)initWithCoder:(id)a3;
- (MOTime)initWithIdentifier:(id)a3;
- (MOTime)initWithIdentifier:(id)a3 timestamp:(double)a4 timeString:(id)a5 timeZone:(id)a6 timeTag:(unint64_t)a7;
- (MOTime)initWithTimestamp:(double)a3 timeString:(id)a4 timeZone:(id)a5 timeTag:(unint64_t)a6;
- (NSString)timeString;
- (NSString)timeZone;
- (NSUUID)identifier;
- (double)timestamp;
- (id)date;
- (id)description;
- (id)localTime;
- (id)timeZoneObject;
- (unint64_t)dateReferenceTag;
- (unint64_t)hash;
- (unint64_t)timeTag;
- (void)encodeWithCoder:(id)a3;
- (void)setDateReferenceTag:(unint64_t)a3;
@end

@implementation MOTime

- (MOTime)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOTime initWithIdentifier:](v5);
    }
  }
  v6 = +[NSDate date];
  [v6 timeIntervalSinceReferenceDate];
  v7 = -[MOTime initWithIdentifier:timestamp:timeString:timeZone:timeTag:](self, "initWithIdentifier:timestamp:timeString:timeZone:timeTag:", v4, @"today", @"Unknown", 0);

  return v7;
}

- (MOTime)initWithTimestamp:(double)a3 timeString:(id)a4 timeZone:(id)a5 timeTag:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = +[NSUUID UUID];
  v13 = [(MOTime *)self initWithIdentifier:v12 timestamp:v11 timeString:v10 timeZone:a6 timeTag:a3];

  return v13;
}

- (MOTime)initWithIdentifier:(id)a3 timestamp:(double)a4 timeString:(id)a5 timeZone:(id)a6 timeTag:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MOTime;
  v16 = [(MOTime *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_timestamp = a4;
    objc_storeStrong((id *)&v17->_timeString, a5);
    objc_storeStrong((id *)&v17->_timeZone, a6);
    v17->_timeTag = a7;
    v17->_dateReferenceTag = 0;
  }

  return v17;
}

- (id)timeZoneObject
{
  v3 = [(MOTime *)self timeZone];

  if (v3)
  {
    id v4 = [(MOTime *)self timeZone];
    v5 = +[NSTimeZone timeZoneWithName:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)localTime
{
  [(MOTime *)self timestamp];
  if (v3 == 0.0)
  {
    v6 = 0;
  }
  else
  {
    [(MOTime *)self timestamp];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = [(MOTime *)self timeZoneObject];
    v6 = +[MOTime localTimeOfDate:v4 timeZone:v5];
  }
  return v6;
}

- (id)date
{
  [(MOTime *)self timestamp];
  if (v3 == 0.0)
  {
    id v4 = 0;
  }
  else
  {
    [(MOTime *)self timestamp];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  return v4;
}

+ (id)localTimeOfDate:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = +[NSTimeZone systemTimeZone];
      if ([v8 isEqualToTimeZone:v7])
      {
        id v9 = v5;
      }
      else
      {
        id v10 = [v7 secondsFromGMTForDate:v5];
        uint64_t v11 = v10 - (unsigned char *)[v8 secondsFromGMTForDate:v5];
        id v9 = [v5 dateByAddingTimeInterval:(double)v11];
        v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 138413314;
          id v15 = v5;
          __int16 v16 = 2112;
          v17 = v7;
          __int16 v18 = 2112;
          objc_super v19 = v8;
          __int16 v20 = 2048;
          uint64_t v21 = v11;
          __int16 v22 = 2112;
          id v23 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "localTime, object date, %@, object timezone, %@, system timezone, %@, timezone diff, %ld, adjusted date, %@", (uint8_t *)&v14, 0x34u);
        }
      }
    }
    else
    {
      id v9 = v5;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)timeForDate:(id)a3
{
  return +[MOTime timeFromStartDate:a3 endDate:0 timeZoneManager:0];
}

+ (id)timeForDate:(id)a3 timeZoneManager:(id)a4
{
  return +[MOTime timeFromStartDate:a3 endDate:0 timeZoneManager:a4];
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4
{
  return +[MOTime timeFromStartDate:a3 endDate:a4 timeZoneManager:0];
}

+ (id)timeFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  if (v7)
  {
    id v10 = [v7 timeZoneAtDate:v6];
    uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      objc_super v19 = v10;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "timeZone, date, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    id v10 = +[NSTimeZone systemTimeZone];
    uint64_t v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[MOTime timeFromStartDate:endDate:timeZoneManager:]();
    }
  }

  v12 = [MOTime alloc];
  id v13 = [v10 name];
  int v14 = [(MOTime *)v12 initWithTimestamp:0 timeString:v13 timeZone:0 timeTag:v9];

  return v14;
}

+ (id)dateFromDate:(id)a3 hour:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSCalendar currentCalendar];
  id v7 = [v6 components:60 fromDate:v5];

  [v7 setHour:a4];
  double v8 = [v6 dateFromComponents:v7];

  return v8;
}

+ (id)buildTimeTagIntervalsForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MOTimeTagInterval alloc];
  id v6 = objc_alloc((Class)NSDateInterval);
  id v7 = +[MOTime dateFromDate:v3 hour:0];
  id v8 = [v6 initWithStartDate:v7 duration:10800.0];
  double v9 = [(MOTimeTagInterval *)v5 initWithTimeTag:8 dateInterval:v8];
  [v4 addObject:v9];

  id v10 = [MOTimeTagInterval alloc];
  id v11 = objc_alloc((Class)NSDateInterval);
  v12 = +[MOTime dateFromDate:v3 hour:3];
  id v13 = [v11 initWithStartDate:v12 duration:21600.0];
  int v14 = [(MOTimeTagInterval *)v10 initWithTimeTag:2 dateInterval:v13];
  [v4 addObject:v14];

  id v15 = [MOTimeTagInterval alloc];
  id v16 = objc_alloc((Class)NSDateInterval);
  id v17 = +[MOTime dateFromDate:v3 hour:9];
  id v18 = [v16 initWithStartDate:v17 duration:10800.0];
  objc_super v19 = [(MOTimeTagInterval *)v15 initWithTimeTag:3 dateInterval:v18];
  [v4 addObject:v19];

  __int16 v20 = [MOTimeTagInterval alloc];
  id v21 = objc_alloc((Class)NSDateInterval);
  __int16 v22 = +[MOTime dateFromDate:v3 hour:12];
  id v23 = [v21 initWithStartDate:v22 duration:10800.0];
  v24 = [(MOTimeTagInterval *)v20 initWithTimeTag:4 dateInterval:v23];
  [v4 addObject:v24];

  v25 = [MOTimeTagInterval alloc];
  id v26 = objc_alloc((Class)NSDateInterval);
  v27 = +[MOTime dateFromDate:v3 hour:15];
  id v28 = [v26 initWithStartDate:v27 duration:10800.0];
  v29 = [(MOTimeTagInterval *)v25 initWithTimeTag:5 dateInterval:v28];
  [v4 addObject:v29];

  v30 = [MOTimeTagInterval alloc];
  id v31 = objc_alloc((Class)NSDateInterval);
  v32 = +[MOTime dateFromDate:v3 hour:18];
  id v33 = [v31 initWithStartDate:v32 duration:10800.0];
  v34 = [(MOTimeTagInterval *)v30 initWithTimeTag:6 dateInterval:v33];
  [v4 addObject:v34];

  v35 = [MOTimeTagInterval alloc];
  id v36 = objc_alloc((Class)NSDateInterval);
  v37 = +[MOTime dateFromDate:v3 hour:21];

  id v38 = [v36 initWithStartDate:v37 duration:10800.0];
  v39 = [(MOTimeTagInterval *)v35 initWithTimeTag:7 dateInterval:v38];
  [v4 addObject:v39];

  id v40 = [v4 copy];
  return v40;
}

+ (id)buildSimpleTimeTagIntervalsForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MOTimeTagInterval alloc];
  id v6 = objc_alloc((Class)NSDateInterval);
  id v7 = +[MOTime dateFromDate:v3 hour:3];
  id v8 = [v6 initWithStartDate:v7 duration:32400.0];
  double v9 = [(MOTimeTagInterval *)v5 initWithTimeTag:2 dateInterval:v8];
  [v4 addObject:v9];

  id v10 = [MOTimeTagInterval alloc];
  id v11 = objc_alloc((Class)NSDateInterval);
  v12 = +[MOTime dateFromDate:v3 hour:12];
  id v13 = [v11 initWithStartDate:v12 duration:21600.0];
  int v14 = [(MOTimeTagInterval *)v10 initWithTimeTag:4 dateInterval:v13];
  [v4 addObject:v14];

  id v15 = [MOTimeTagInterval alloc];
  id v16 = objc_alloc((Class)NSDateInterval);
  id v17 = +[MOTime dateFromDate:v3 hour:18];
  id v18 = [v16 initWithStartDate:v17 duration:10800.0];
  objc_super v19 = [(MOTimeTagInterval *)v15 initWithTimeTag:6 dateInterval:v18];
  [v4 addObject:v19];

  __int16 v20 = [MOTimeTagInterval alloc];
  id v21 = objc_alloc((Class)NSDateInterval);
  __int16 v22 = +[MOTime dateFromDate:v3 hour:21];
  id v23 = [v21 initWithStartDate:v22 duration:21600.0];
  v24 = [(MOTimeTagInterval *)v20 initWithTimeTag:7 dateInterval:v23];
  [v4 addObject:v24];

  v25 = [MOTimeTagInterval alloc];
  id v26 = objc_alloc((Class)NSDateInterval);
  v27 = +[MOTime dateFromDate:v3 hour:-3];

  id v28 = [v26 initWithStartDate:v27 duration:21600.0];
  v29 = [(MOTimeTagInterval *)v25 initWithTimeTag:7 dateInterval:v28];
  [v4 addObject:v29];

  id v30 = [v4 copy];
  return v30;
}

+ (unint64_t)timetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6
    || ([v5 isSameDayWithDate:v6] & 1) != 0
    || ([v6 timeIntervalSinceDate:v5], v7 <= 43200.0))
  {
    +[MOTime buildTimeTagIntervalsForDate:v5];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v8 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v40;
      *(void *)&long long v11 = 138413058;
      long long v33 = v11;
LABEL_9:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
        objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v33);
        double v17 = v16;
        if (v16 > 0.0)
        {
          id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            id v45 = v5;
            __int16 v46 = 2112;
            id v47 = v6;
            __int16 v48 = 2112;
            id v49 = v15;
            __int16 v50 = 2048;
            double v51 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }
        }
        if (v17 > 0.7) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v8 countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v12) {
            goto LABEL_9;
          }
          goto LABEL_19;
        }
      }
      id v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_35;
      }
      id v29 = [v15 timetag];
      id v30 = +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", [v15 timetag]);
      *(_DWORD *)buf = v33;
      id v45 = v5;
      __int16 v46 = 2112;
      id v47 = v6;
      __int16 v48 = 2048;
      id v49 = v29;
      __int16 v50 = 2112;
      double v51 = *(double *)&v30;
    }
    else
    {
LABEL_19:

      objc_super v19 = +[MOTime buildSimpleTimeTagIntervalsForDate:v5];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v8 = v19;
      id v20 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (!v20)
      {
LABEL_31:
        id v9 = 0;
LABEL_36:

        goto LABEL_37;
      }
      id v22 = v20;
      uint64_t v23 = *(void *)v36;
      *(void *)&long long v21 = 138413058;
      long long v34 = v21;
LABEL_21:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v35 + 1) + 8 * v24);
        objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v34, (void)v35);
        double v26 = v25;
        if (v25 > 0.0)
        {
          v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            id v45 = v5;
            __int16 v46 = 2112;
            id v47 = v6;
            __int16 v48 = 2112;
            id v49 = v15;
            __int16 v50 = 2048;
            double v51 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
          }
        }
        if (v26 > 0.7) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v22) {
            goto LABEL_21;
          }
          goto LABEL_31;
        }
      }
      id v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_35;
      }
      id v32 = [v15 timetag];
      id v30 = +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", [v15 timetag]);
      *(_DWORD *)buf = v34;
      id v45 = v5;
      __int16 v46 = 2112;
      id v47 = v6;
      __int16 v48 = 2048;
      id v49 = v32;
      __int16 v50 = 2112;
      double v51 = *(double *)&v30;
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);

LABEL_35:
    id v9 = [v15 timetag];
    goto LABEL_36;
  }
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[MOTime timetagFromStartDate:endDate:]();
  }
  id v9 = 0;
LABEL_37:

  return (unint64_t)v9;
}

+ (unint64_t)simpleTimetagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6
    || ([v5 isSameDayWithDate:v6] & 1) != 0
    || ([v6 timeIntervalSinceDate:v5], v7 <= 43200.0))
  {
    +[MOTime buildSimpleTimeTagIntervalsForDate:v5];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v25;
      *(void *)&long long v11 = 138413058;
      long long v23 = v11;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v23, (void)v24);
          double v17 = v16;
          if (v16 > 0.0)
          {
            id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              id v29 = v5;
              __int16 v30 = 2112;
              id v31 = v6;
              __int16 v32 = 2112;
              id v33 = v15;
              __int16 v34 = 2048;
              double v35 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }
          }
          if (v17 > 0.7)
          {
            objc_super v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              id v21 = [v15 timetag];
              id v22 = +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", [v15 timetag]);
              *(_DWORD *)buf = v23;
              id v29 = v5;
              __int16 v30 = 2112;
              id v31 = v6;
              __int16 v32 = 2048;
              id v33 = v21;
              __int16 v34 = 2112;
              double v35 = *(double *)&v22;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);
            }
            id v9 = [v15 timetag];
            goto LABEL_23;
          }
        }
        id v12 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_23:
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[MOTime timetagFromStartDate:endDate:]();
    }
    id v9 = 0;
  }

  return (unint64_t)v9;
}

+ (id)buildSimpleMealTagIntervalsForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MOTimeTagInterval alloc];
  id v6 = objc_alloc((Class)NSDateInterval);
  double v7 = +[MOTime dateFromDate:v3 hour:6];
  id v8 = [v6 initWithStartDate:v7 duration:18000.0];
  id v9 = [(MOTimeTagInterval *)v5 initWithTimeTag:2000 dateInterval:v8];
  [v4 addObject:v9];

  id v10 = [MOTimeTagInterval alloc];
  id v11 = objc_alloc((Class)NSDateInterval);
  id v12 = +[MOTime dateFromDate:v3 hour:11];
  id v13 = [v11 initWithStartDate:v12 duration:10800.0];
  uint64_t v14 = [(MOTimeTagInterval *)v10 initWithTimeTag:2001 dateInterval:v13];
  [v4 addObject:v14];

  id v15 = [MOTimeTagInterval alloc];
  id v16 = objc_alloc((Class)NSDateInterval);
  double v17 = +[MOTime dateFromDate:v3 hour:17];

  id v18 = [v16 initWithStartDate:v17 duration:14400.0];
  objc_super v19 = [(MOTimeTagInterval *)v15 initWithTimeTag:2002 dateInterval:v18];
  [v4 addObject:v19];

  id v20 = [v4 copy];
  return v20;
}

+ (unint64_t)mealtagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6
    || ([v5 isSameDayWithDate:v6] & 1) != 0
    || ([v6 timeIntervalSinceDate:v5], v7 <= 43200.0))
  {
    +[MOTime buildSimpleMealTagIntervalsForDate:v5];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v25;
      *(void *)&long long v11 = 138413058;
      long long v23 = v11;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "overlapsScoreForStartDate:endDate:", v5, v6, v23, (void)v24);
          double v17 = v16;
          if (v16 > 0.0)
          {
            id v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              id v29 = v5;
              __int16 v30 = 2112;
              id v31 = v6;
              __int16 v32 = 2112;
              id v33 = v15;
              __int16 v34 = 2048;
              double v35 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, interval, %@, score, %f", buf, 0x2Au);
            }
          }
          if (v17 > 0.7)
          {
            objc_super v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              id v21 = [v15 timetag];
              id v22 = +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", [v15 timetag]);
              *(_DWORD *)buf = v23;
              id v29 = v5;
              __int16 v30 = 2112;
              id v31 = v6;
              __int16 v32 = 2048;
              id v33 = v21;
              __int16 v34 = 2112;
              double v35 = *(double *)&v22;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "mealType, startDate, %@, endDate, %@, timetag, %lu(%@)", buf, 0x2Au);
            }
            id v8 = [v15 timetag];
            goto LABEL_21;
          }
        }
        id v12 = [v9 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v8 = 0;
LABEL_21:
  }
  else
  {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

+ (id)timeOfDayPrefixFromDate:(id)a3
{
  return +[MOTime timeOfDayPrefixFromStartDate:a3 endDate:0];
}

+ (id)timeOfDayPrefixFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = +[MOTime timetagFromStartDate:v5 endDate:v6];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v18 = +[MOTime timeStringFromTimeTag:v7];
    int v19 = 138413058;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2048;
    unint64_t v24 = v7;
    __int16 v25 = 2112;
    long long v26 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "timeOfDay, startDate, %@, endDate, %@, timeTag, %lu(%@)", (uint8_t *)&v19, 0x2Au);
  }
  id v9 = +[MOTime timeStringFromTimeTag:v7];
  if (v9)
  {
    [v5 timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = +[NSCalendar currentCalendar];
    uint64_t v13 = [MOTime alloc];
    uint64_t v14 = [v12 timeZone];
    id v15 = [v14 name];
    double v16 = [(MOTime *)v13 initWithTimestamp:v9 timeString:v15 timeZone:v7 timeTag:v11];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

+ (id)dayOfWeekFromDate:(id)a3
{
  return +[MOTime dayOfWeekFromStartDate:a3 endDate:0 timeZoneManager:0];
}

+ (id)dayOfWeekFromStartDate:(id)a3 endDate:(id)a4 timeZoneManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if (!v9)
  {
    double v11 = +[NSTimeZone systemTimeZone];
    int v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:]();
    }

    BOOL v18 = v8 != 0;
    goto LABEL_13;
  }
  double v11 = [v9 timeZoneAtDate:v7];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138412802;
    id v30 = v7;
    __int16 v31 = 2112;
    __int16 v32 = v11;
    __int16 v33 = 2112;
    __int16 v34 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "timeZone, startDate, %@, timeZone, %@, source, timeZoneManager, %@", (uint8_t *)&v29, 0x20u);
  }

  if (!v8)
  {
    BOOL v18 = 0;
    goto LABEL_13;
  }
  uint64_t v13 = [v10 timeZoneAtDate:v7];
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:]();
  }

  id v15 = [v11 name];
  double v16 = [v13 name];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if (v17)
  {

    BOOL v18 = 1;
LABEL_13:
    uint64_t v13 = +[MOTime localTimeOfDate:v7 timeZone:v11];
    if (v18)
    {
      id v20 = +[MOTime localTimeOfDate:v8 timeZone:v11];
    }
    else
    {
      id v20 = 0;
    }
    unint64_t v21 = +[MOTime dayOfWeekTagFromStartDate:v13 endDate:v20];
    id v22 = +[MOTime timeStringFromTimeTag:v21];
    if (v22)
    {
      [v7 timeIntervalSinceReferenceDate];
      double v24 = v23;
      __int16 v25 = [MOTime alloc];
      long long v26 = [v11 name];
      long long v27 = [(MOTime *)v25 initWithTimestamp:v22 timeString:v26 timeZone:v21 timeTag:v24];
    }
    else
    {
      long long v27 = 0;
    }

    goto LABEL_20;
  }
  id v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[MOTime dayOfWeekFromStartDate:endDate:timeZoneManager:]();
  }
  long long v27 = 0;
LABEL_20:

  return v27;
}

+ (id)timeStringFromTimeTag:(unint64_t)a3
{
  if ((uint64_t)a3 <= 1999)
  {
    switch(a3)
    {
      case 'd':
        id result = @"today";
        break;
      case 'e':
        id result = @"yesterday";
        break;
      case 'f':
        id result = @"Sunday";
        break;
      case 'g':
        id result = @"Monday";
        break;
      case 'h':
        id result = @"Tuesday";
        break;
      case 'i':
        id result = @"Wednesday";
        break;
      case 'j':
        id result = @"Thursday";
        break;
      case 'k':
        id result = @"Friday";
        break;
      case 'l':
        id result = @"Saturday";
        break;
      case 'm':
        id result = @"this week";
        break;
      case 'n':
        id result = @"last week";
        break;
      case 'o':
        id result = @"this month";
        break;
      case 'p':
        id result = @"last month";
        break;
      case 'q':
        id result = @"this year";
        break;
      case 'r':
        id result = @"last year";
        break;
      default:
        switch(a3)
        {
          case 2uLL:
            id result = @"morning";
            break;
          case 3uLL:
            id result = @"prenoon";
            break;
          case 4uLL:
            id result = @"afternoon";
            break;
          case 5uLL:
            id result = @"preevening";
            break;
          case 6uLL:
            id result = @"evening";
            break;
          case 7uLL:
            id result = @"night";
            break;
          case 8uLL:
            id result = @"midnight";
            break;
          default:
            id result = 0;
            break;
        }
        break;
    }
  }
  else
  {
    CFStringRef v3 = @"dinner";
    CFStringRef v4 = @"weekend";
    if (a3 != 10001) {
      CFStringRef v4 = 0;
    }
    if (a3 == 10000) {
      CFStringRef v5 = @"weekday";
    }
    else {
      CFStringRef v5 = v4;
    }
    if (a3 != 2002) {
      CFStringRef v3 = v5;
    }
    CFStringRef v6 = @"breakfast";
    CFStringRef v7 = @"lunch";
    if (a3 != 2001) {
      CFStringRef v7 = 0;
    }
    if (a3 != 2000) {
      CFStringRef v6 = v7;
    }
    if ((uint64_t)a3 <= 2001) {
      return (id)v6;
    }
    else {
      return (id)v3;
    }
  }
  return result;
}

+ (id)localizedDateStringFromDate:(id)a3
{
  return +[NSDateFormatter localizedStringFromDate:a3 dateStyle:2 timeStyle:0];
}

+ (unint64_t)typeOfDayTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v8 && [v8 isBeforeDate:v7])
    {
      double v10 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v7;
        __int16 v29 = 2112;
        id v30 = v8;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted.", buf, 0x20u);
      }

      id v8 = 0;
    }
    if (v9)
    {
      double v11 = +[MOTime localTimeOfDate:v7 timeZone:v9];

      if (!v8) {
        goto LABEL_17;
      }
      uint64_t v12 = +[MOTime localTimeOfDate:v8 timeZone:v9];

      id v8 = (id)v12;
      if (!v12) {
        goto LABEL_17;
      }
    }
    else
    {
      double v11 = v7;
      if (!v8) {
        goto LABEL_17;
      }
    }
    if ([v8 isBeforeDate:v11])
    {
      uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v29 = 2112;
        id v30 = v8;
        __int16 v31 = 2112;
        id v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "typeOfDayTagFromStartDate, startDate, %@, endDate, %@, timeZone, %@, the timestamps are inverted after time zone shifting.", buf, 0x20u);
      }

      id v8 = 0;
    }
LABEL_17:
    id v15 = +[NSCalendar currentCalendar];
    id v27 = 0;
    *(void *)buf = 0;
    unsigned int v16 = [v15 rangeOfWeekendStartDate:&v27 interval:buf containingDate:v11];
    id v17 = v27;
    BOOL v18 = v17;
    if (!v8)
    {
      if (v16) {
        unint64_t v13 = 10001;
      }
      else {
        unint64_t v13 = 0;
      }
      goto LABEL_34;
    }
    if (!v17)
    {
      unint64_t v13 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v19 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v8];
    [v19 duration];
    if (v20 == 0.0)
    {
      unint64_t v13 = 0;
LABEL_33:

      goto LABEL_34;
    }
    id v21 = objc_alloc((Class)NSDateInterval);
    id v22 = [v21 initWithStartDate:v18 duration:*(double *)buf];
    if ([v19 intersectsDateInterval:v22])
    {
      double v23 = [v19 startDate];
      if ([v22 containsDate:v23])
      {
        double v24 = [v19 endDate];
        unsigned int v25 = [v22 containsDate:v24];

        if (v25) {
          unint64_t v13 = 10001;
        }
        else {
          unint64_t v13 = 0;
        }
        goto LABEL_32;
      }
    }
    unint64_t v13 = 0;
LABEL_32:

    goto LABEL_33;
  }
  unint64_t v13 = 0;
LABEL_35:

  return v13;
}

+ (unint64_t)dayOfWeekTagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && ![v5 isSameDayWithDate:v6]) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = +[MOTime dayOfWeekTagFromDate:v5];
  }

  return v7;
}

+ (unint64_t)dayOfWeekTagFromDate:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  [v4 setFirstWeekday:1];
  id v5 = [v4 components:512 fromDate:v3];
  id v6 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[MOTime dayOfWeekTagFromDate:v6];
  }

  if ([v5 weekday] == (id)1)
  {
    unint64_t v7 = 102;
  }
  else if ([v5 weekday] == (id)2)
  {
    unint64_t v7 = 103;
  }
  else if ([v5 weekday] == (id)3)
  {
    unint64_t v7 = 104;
  }
  else if ([v5 weekday] == (id)4)
  {
    unint64_t v7 = 105;
  }
  else if ([v5 weekday] == (id)5)
  {
    unint64_t v7 = 106;
  }
  else if ([v5 weekday] == (id)6)
  {
    unint64_t v7 = 107;
  }
  else if ([v5 weekday] == (id)7)
  {
    unint64_t v7 = 108;
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MOTime dayOfWeekTagFromDate:v8];
    }

    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = +[NSDate date];
  unint64_t v8 = +[MOTime dateReferenceTagFromStartDate:v6 endDate:v5 nowDate:v7 timeZone:0];

  return v8;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = +[NSDate now];
  unint64_t v11 = +[MOTime dateReferenceTagFromStartDate:v9 endDate:v8 nowDate:v10 timeZone:v7];

  return v11;
}

+ (unint64_t)dateReferenceTagFromStartDate:(id)a3 endDate:(id)a4 nowDate:(id)a5 timeZone:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = v12;
  if (v9 && v12)
  {
    uint64_t v14 = +[MOTime localTimeOfDate:v9 timeZone:v12];

    id v9 = (id)v14;
  }
  if (v10 && v13)
  {
    uint64_t v15 = +[MOTime localTimeOfDate:v10 timeZone:v13];

    id v10 = (id)v15;
  }
  if ([v11 isBeforeDate:v9]) {
    goto LABEL_10;
  }
  if (!v10)
  {
    if ([v11 isSameDayWithDate:v9])
    {
LABEL_22:
      unint64_t v16 = 100;
      goto LABEL_11;
    }
    if ([v11 isFollowingDayAfterDate:v9])
    {
LABEL_25:
      unint64_t v16 = 101;
      goto LABEL_11;
    }
    if ([v11 isSameWeekWithDate:v9])
    {
LABEL_30:
      unint64_t v16 = 109;
      goto LABEL_11;
    }
    if ([v11 isFollowingWeekAfterDate:v9])
    {
LABEL_33:
      unint64_t v16 = 110;
      goto LABEL_11;
    }
    if ([v11 isSameMonthWithDate:v9])
    {
LABEL_38:
      unint64_t v16 = 111;
      goto LABEL_11;
    }
    if ([v11 isFollowingMonthAfterDate:v9])
    {
LABEL_41:
      unint64_t v16 = 112;
      goto LABEL_11;
    }
    if ([v11 isSameYearWithDate:v9])
    {
LABEL_46:
      unint64_t v16 = 113;
      goto LABEL_11;
    }
    BOOL v18 = v11;
    id v19 = v9;
LABEL_49:
    if ([v18 isFollowingYearAfterDate:v19])
    {
      unint64_t v16 = 114;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (([v11 isBeforeDate:v10] & 1) == 0)
  {
    if ([v11 isSameDayWithDate:v9]
      && ([v11 isSameDayWithDate:v10] & 1) != 0)
    {
      goto LABEL_22;
    }
    if ([v11 isFollowingDayAfterDate:v9])
    {
      if ([v11 isFollowingDayAfterDate:v10]) {
        goto LABEL_25;
      }
      if (![v11 isSameWeekWithDate:v9]) {
        goto LABEL_31;
      }
    }
    else if (([v11 isSameWeekWithDate:v9] & 1) == 0)
    {
      goto LABEL_31;
    }
    if ([v11 isSameWeekWithDate:v10]) {
      goto LABEL_30;
    }
LABEL_31:
    if ([v11 isFollowingWeekAfterDate:v9])
    {
      if ([v11 isFollowingWeekAfterDate:v10]) {
        goto LABEL_33;
      }
      if (![v11 isSameMonthWithDate:v9]) {
        goto LABEL_39;
      }
    }
    else if (([v11 isSameMonthWithDate:v9] & 1) == 0)
    {
      goto LABEL_39;
    }
    if ([v11 isSameMonthWithDate:v10]) {
      goto LABEL_38;
    }
LABEL_39:
    if ([v11 isFollowingMonthAfterDate:v9])
    {
      if ([v11 isFollowingMonthAfterDate:v10]) {
        goto LABEL_41;
      }
      if ([v11 isSameYearWithDate:v9])
      {
LABEL_45:
        if ([v11 isSameYearWithDate:v10]) {
          goto LABEL_46;
        }
      }
    }
    else if ([v11 isSameYearWithDate:v9])
    {
      goto LABEL_45;
    }
    if (([v11 isFollowingYearAfterDate:v9] & 1) == 0) {
      goto LABEL_10;
    }
    BOOL v18 = v11;
    id v19 = v10;
    goto LABEL_49;
  }
LABEL_10:
  unint64_t v16 = 1;
LABEL_11:

  return v16;
}

- (id)description
{
  id v3 = [(MOTime *)self identifier];
  [(MOTime *)self timestamp];
  uint64_t v5 = v4;
  id v6 = [(MOTime *)self timeString];
  id v7 = [(MOTime *)self timeZone];
  id v8 = [(MOTime *)self localTime];
  id v9 = +[NSString stringWithFormat:@"<MOTime identifier, %@, timestamp, %f, timeString, %@, timeZone, %@, localTime, %@, timeTag, %lu, dateReferenceTag, %lu>", v3, v5, v6, v7, v8, [(MOTime *)self timeTag], [(MOTime *)self dateReferenceTag]];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOTime)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [v4 decodeDoubleForKey:@"timestamp"];
  double v7 = v6;
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeString"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
  id v10 = [v4 decodeInt64ForKey:@"timeTag"];
  id v11 = [v4 decodeInt64ForKey:@"dateReferenceTag"];

  id v12 = [(MOTime *)self initWithIdentifier:v5 timestamp:v8 timeString:v9 timeZone:v10 timeTag:v7];
  unint64_t v13 = v12;
  if (v12) {
    [(MOTime *)v12 setDateReferenceTag:v11];
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v5 encodeObject:self->_timeString forKey:@"timeString"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v5 encodeInt64:self->_timeTag forKey:@"timeTag"];
  [v5 encodeInt64:self->_dateReferenceTag forKey:@"dateReferenceTag"];
}

- (unint64_t)hash
{
  v2 = [(MOTime *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOTime *)a3;
  double v6 = v5;
  if (self == v5)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = v6;
        id v8 = [(MOTime *)self identifier];
        if (v8 || ([(MOTime *)v7 identifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v9 = [(MOTime *)self identifier];
          id v10 = [(MOTime *)v7 identifier];
          unsigned __int8 v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    unsigned __int8 v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)timeString
{
  return self->_timeString;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (unint64_t)timeTag
{
  return self->_timeTag;
}

- (unint64_t)dateReferenceTag
{
  return self->_dateReferenceTag;
}

- (void)setDateReferenceTag:(unint64_t)a3
{
  self->_dateReferenceTag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  v2 = "-[MOTime initWithIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 102;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

+ (void)timeFromStartDate:endDate:timeZoneManager:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "timeZone, date, %@, timeZone, %@, source, system");
}

+ (void)timetagFromStartDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "timeOfDay, startDate, %@, endDate, %@, skip");
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "timeZone, startDate, %@, timeZone, %@, source, system");
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "timeZone crossing, timeZone, %@, endTimeZone, %@");
}

+ (void)dayOfWeekFromStartDate:endDate:timeZoneManager:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_6((void *)&_mh_execute_header, v0, v1, "timeZone, endDate, %@, timeZone, %@, source, system");
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 weekday];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "dayOfWeekTagFromDate, cannot read weekday, date, %@, weekday, %lu", v4, 0x16u);
}

+ (void)dayOfWeekTagFromDate:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 weekday];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "dayOfWeekTagFromDate, date, %@, weekday, %lu", v4, 0x16u);
}

@end