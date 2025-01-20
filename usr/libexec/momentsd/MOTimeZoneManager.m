@interface MOTimeZoneManager
- (MOTimeZoneManager)initWithUniverse:(id)a3;
- (NSDictionary)condensedRecords;
- (NSDictionary)timeZoneRecords;
- (id)condensedRecordsFromRecords:(id)a3;
- (id)description;
- (id)keywordForDate:(id)a3;
- (id)timeZoneAtDate:(id)a3;
- (void)processTimeZoneEvents:(id)a3;
- (void)setCondensedRecords:(id)a3;
- (void)setTimeZoneRecords:(id)a3;
@end

@implementation MOTimeZoneManager

- (MOTimeZoneManager)initWithUniverse:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MOTimeZoneManager;
  return [(MOTimeZoneManager *)&v4 init];
}

- (void)processTimeZoneEvents:(id)a3
{
  id v4 = a3;
  v33 = +[NSPredicate predicateWithFormat:@"timeZone != nil"];
  v34 = v4;
  v5 = [v4 filteredArrayUsingPredicate:];
  id v32 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  id v51 = v32;
  v6 = +[NSArray arrayWithObjects:&v51 count:1];
  v7 = [v5 sortedArrayUsingDescriptors:v6];

  v8 = self;
  v9 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  v36 = self;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v15 = [v14 endDate];
        v16 = [(MOTimeZoneManager *)v8 keywordForDate:v15];

        v17 = [v14 timeZone];
        v18 = [v17 name];
        [v9 setObject:v18 forKey:v16];

        v19 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v20 = NSStringFromSelector(a2);
          v21 = [v14 endDate];
          v22 = [v14 timeZone];
          *(_DWORD *)buf = 138413058;
          v43 = v20;
          __int16 v44 = 2112;
          v45 = v21;
          __int16 v46 = 2112;
          v47 = v16;
          __int16 v48 = 2112;
          v49 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@, raw timeZone, date %@, keyword, %@, event.timeZone, %@", buf, 0x2Au);

          v8 = v36;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v11);
  }

  if (![v9 count])
  {
    v23 = +[NSDate date];
    v24 = [(MOTimeZoneManager *)v36 keywordForDate:v23];

    v25 = +[NSTimeZone systemTimeZone];
    v26 = [v25 name];
    [v9 setObject:v26 forKey:v24];
  }
  id v27 = [v9 copy];
  [(MOTimeZoneManager *)v36 setTimeZoneRecords:v27];

  v28 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[MOTimeZoneManager processTimeZoneEvents:](a2, v9);
  }

  v29 = [(MOTimeZoneManager *)v36 timeZoneRecords];
  v30 = [(MOTimeZoneManager *)v36 condensedRecordsFromRecords:v29];
  [(MOTimeZoneManager *)v36 setCondensedRecords:v30];

  v31 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[MOTimeZoneManager processTimeZoneEvents:](a2, v36);
  }
}

- (id)condensedRecordsFromRecords:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 allKeys];
  v6 = [v5 sortedArrayUsingSelector:"compare:"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        v13 = v10;
        v14 = v9;
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = [v3 objectForKey:v15];
        if (v13 && ([v14 isEqualToString:v9] & 1) == 0)
        {
          v16 = [v4 objectForKey:v13];

          if (!v16)
          {
            [v4 setObject:v14 forKey:v13];
            v17 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v25 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v34 = v25;
              __int16 v35 = 2112;
              id v36 = v13;
              __int16 v37 = 2112;
              long long v38 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);
            }
          }
          v18 = [v4 objectForKey:v15];

          if (!v18)
          {
            [v4 setObject:v9 forKey:v15];
            v19 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v26 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412802;
              v34 = v26;
              __int16 v35 = 2112;
              id v36 = v15;
              __int16 v37 = 2112;
              long long v38 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);
            }
          }
        }
        id v10 = v15;
      }
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    id v10 = 0;
  }

  id v20 = [v4 count];
  if (v10 && !v20)
  {
    [v4 setObject:v9 forKey:v10];
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v34 = v24;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      long long v38 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@, TimeZone entry, keyword, %@, event.timeZone, %@ ADD", buf, 0x20u);
    }
  }
  id v22 = [v4 copy];

  return v22;
}

- (id)timeZoneAtDate:(id)a3
{
  id v5 = a3;
  v6 = [(MOTimeZoneManager *)self keywordForDate:v5];
  id v7 = [(MOTimeZoneManager *)self condensedRecords];
  id v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v11 = [(MOTimeZoneManager *)self condensedRecords];
    uint64_t v12 = [v11 keysSortedByValueUsingSelector:"compare:"];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      __int16 v35 = a2;
      id v36 = v5;
      v16 = 0;
      uint64_t v17 = *(void *)v38;
      double v18 = 1.79769313e308;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v13);
          }
          id v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v21 = [(MOTimeZoneManager *)self condensedRecords];
          id v22 = [v21 objectForKey:v20];

          [v6 doubleValue];
          double v24 = v23;
          [v20 doubleValue];
          double v26 = vabdd_f64(v24, v25);
          if (v26 < v18)
          {
            id v27 = v22;

            double v18 = v26;
            v16 = v27;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v15);

      id v8 = 0;
      id v5 = v36;
      a2 = v35;
      if (v16)
      {
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v34 = NSStringFromSelector(v35);
          *(_DWORD *)buf = 138413058;
          v43 = v34;
          __int16 v44 = 2112;
          id v45 = v36;
          __int16 v46 = 2112;
          v47 = v6;
          __int16 v48 = 2112;
          v49 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, interpolated", buf, 0x2Au);
        }
        id v10 = +[NSTimeZone timeZoneWithName:v16];

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
    }
    long long v29 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      long long v32 = NSStringFromSelector(a2);
      v33 = +[NSTimeZone systemTimeZone];
      *(_DWORD *)buf = 138413058;
      v43 = v32;
      __int16 v44 = 2112;
      id v45 = v5;
      __int16 v46 = 2112;
      v47 = v6;
      __int16 v48 = 2112;
      v49 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, system", buf, 0x2Au);
    }
    id v10 = +[NSTimeZone systemTimeZone];
    goto LABEL_22;
  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v31 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v43 = v31;
    __int16 v44 = 2112;
    id v45 = v5;
    __int16 v46 = 2112;
    v47 = v6;
    __int16 v48 = 2112;
    v49 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, date %@, keyword, %@, timeZone, %@, source, lookup", buf, 0x2Au);
  }
  id v10 = +[NSTimeZone timeZoneWithName:v8];
LABEL_23:

  return v10;
}

- (id)keywordForDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  return +[NSNumber numberWithUnsignedInteger:(unint64_t)(v3 / 3600.0)];
}

- (id)description
{
  double v3 = +[NSMutableString stringWithFormat:@"TimeZone records:"];
  id v4 = [(MOTimeZoneManager *)self condensedRecords];
  id v5 = [v4 allKeys];
  v6 = [v5 sortedArrayUsingSelector:"compare:"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(MOTimeZoneManager *)self condensedRecords];
        id v14 = [v13 objectForKey:v12];

        [v3 appendFormat:@"<%@:%@>", v12, v14, (void)v17];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v3 copy];

  return v15;
}

- (NSDictionary)timeZoneRecords
{
  return self->_timeZoneRecords;
}

- (void)setTimeZoneRecords:(id)a3
{
}

- (NSDictionary)condensedRecords
{
  return self->_condensedRecords;
}

- (void)setCondensedRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condensedRecords, 0);

  objc_storeStrong((id *)&self->_timeZoneRecords, 0);
}

- (void)processTimeZoneEvents:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  double v3 = NSStringFromSelector(a1);
  id v4 = [a2 condensedRecords];
  [v4 count];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v5, v6, "%@, TimeZoneManager.condensedRecords, %lu", v7, v8, v9, v10, v11);
}

- (void)processTimeZoneEvents:(const char *)a1 .cold.2(const char *a1, void *a2)
{
  double v3 = NSStringFromSelector(a1);
  [a2 count];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v4, v5, "%@, TimeZoneManager.timeZoneRecords, %lu", v6, v7, v8, v9, v10);
}

@end