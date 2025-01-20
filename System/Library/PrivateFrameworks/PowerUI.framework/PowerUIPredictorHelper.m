@interface PowerUIPredictorHelper
+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4;
+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5;
+ (double)meanEventDuration:(id)a3;
+ (double)meanOf:(id)a3;
+ (double)medianOf:(id)a3;
+ (double)medianTimeBetweenDescendingEvents:(id)a3;
+ (double)standardDeviationOf:(id)a3;
+ (id)column:(id)a3 inDataFrame:(id)a4;
+ (id)convertDateTimeColumnToSeconds:(id)a3 inDataFrame:(id)a4;
+ (id)convertDateToSeconds:(id)a3;
+ (id)countForColumn:(id)a3 inDataFrame:(id)a4;
+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6;
+ (id)filterDataFrame:(id)a3 forColumn:(id)a4 withFilterHandler:(id)a5;
+ (id)filterDataFrame:(id)a3 withValue:(double)a4 forColumn:(id)a5;
+ (id)filterDataFrame:(id)a3 withValueGreaterThan:(double)a4 andLessThan:(double)a5 forColumn:(id)a6;
+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4;
+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6;
+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5;
+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5;
+ (id)meanForColumn:(id)a3 inDataFrame:(id)a4;
+ (id)percentile:(double)a3 forColumn:(id)a4 inDataFrame:(id)a5;
+ (id)percentiles:(id)a3 forColumn:(id)a4 inDataFrame:(id)a5;
+ (id)standardDeviationForColumn:(id)a3 inDataFrame:(id)a4;
+ (id)timeBetweenUsesForSortedDescendingByAgeEvents:(id)a3 forHourBin:(unint64_t)a4 atDate:(id)a5 addAtDate:(BOOL)a6;
+ (id)varianceForColumn:(id)a3 inDataFrame:(id)a4;
+ (void)quantizeValuesInDataFrame:(id)a3 forColumn:(id)a4 withBinWidth:(id)a5;
@end

@implementation PowerUIPredictorHelper

+ (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  v7 = [v5 currentCalendar];
  v8 = [v7 components:32 fromDate:v6];

  double v9 = (double)[v8 hour] / (double)a4;
  return v9;
}

+ (id)events:(id)a3 forHourBin:(unint64_t)a4 date:(id)a5 withMaxDuration:(double)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (void *)MEMORY[0x263EFF8F0];
  id v12 = a5;
  v13 = [v11 currentCalendar];
  v14 = [v13 timeZone];
  uint64_t v15 = objc_msgSend(v12, "dateByAddingTimeInterval:", (double)objc_msgSend(v14, "secondsFromGMT"));

  v34 = (void *)v15;
  v35 = v13;
  v33 = [v13 components:32 fromDate:v15];
  uint64_t v16 = [v33 hour];
  v17 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    unint64_t v21 = (unint64_t)(double)v16 / a4;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v25 = [v24 startDate];
        [a1 getHourBinID:v25 forHourBin:a4];
        if (v21 == (unint64_t)v26)
        {
          v27 = [v24 endDate];
          [v27 timeIntervalSinceDate:v25];
          double v29 = v28 / 3600.0;

          if (v29 >= a6) {
            double v30 = a6;
          }
          else {
            double v30 = v29;
          }
          if (a6 <= 0.0) {
            double v30 = v29;
          }
          v31 = [NSNumber numberWithDouble:v30];
          [v17 addObject:v31];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  return v17;
}

+ (id)filterEvents:(id)a3 startOnSameWeekdayAs:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  unint64_t v21 = v6;
  uint64_t v20 = [v8 components:512 fromDate:v6];
  uint64_t v9 = [v20 weekday];
  context = (void *)MEMORY[0x223C80A30]();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [v15 startDate];
        v17 = [v8 components:512 fromDate:v16];

        if ([v17 weekday] == v9) {
          [v7 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v7;
}

+ (id)getDurationsFromEvents:(id)a3 withUnit:(double)a4 cappedAt:(double)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "duration", (void)v19);
        double v15 = v14 / a4;
        if (v15 >= a5) {
          double v16 = a5;
        }
        else {
          double v16 = v15;
        }
        if (a5 > 0.0) {
          double v15 = v16;
        }
        v17 = [NSNumber numberWithDouble:v15];
        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (double)meanOf:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "doubleValue", (void)v13);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v11 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

+ (double)standardDeviationOf:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = 0.0;
  if ((unint64_t)[v3 count] >= 2)
  {
    +[PowerUIPredictorHelper meanOf:v3];
    double v6 = v5;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "doubleValue", (void)v15);
          double v11 = v11 + (v13 - v6) * (v13 - v6);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    double v4 = sqrt(v11 / (double)(unint64_t)([v7 count] - 1));
  }

  return v4;
}

+ (double)medianOf:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    double v4 = [v3 sortedArrayUsingSelector:sel_compare_];
    char v5 = [v4 count];
    unint64_t v6 = (unint64_t)[v4 count] >> 1;
    if (v5)
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      [v7 doubleValue];
      double v12 = v13;
    }
    else
    {
      id v7 = [v4 objectAtIndexedSubscript:v6 - 1];
      [v7 doubleValue];
      double v9 = v8;
      uint64_t v10 = [v4 objectAtIndexedSubscript:v6];
      [v10 doubleValue];
      double v12 = (v9 + v11) * 0.5;
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

+ (id)filterEventsSortedByStartDateAscending:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withHourBinWidth:(unint64_t)a6
{
  return +[PowerUISmartChargeUtilities filterChargeSessions:a3 startsBefore:a4 dynamicallyAroundDate:a5 withinSeconds:(unint64_t)((double)a6 * 1800.0)];
}

+ (id)timeBetweenUsesForSortedDescendingByAgeEvents:(id)a3 forHourBin:(unint64_t)a4 atDate:(id)a5 addAtDate:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  id v44 = [MEMORY[0x263EFF980] array];
  if ((unint64_t)[v9 count] >= 2)
  {
    BOOL v40 = a6;
    double v11 = [MEMORY[0x263EFF8F0] currentCalendar];
    double v12 = [v11 timeZone];
    uint64_t v13 = objc_msgSend(v10, "dateByAddingTimeInterval:", (double)objc_msgSend(v12, "secondsFromGMT"));

    v42 = (void *)v13;
    v43 = v11;
    uint64_t v41 = [v11 components:32 fromDate:v13];
    unint64_t v14 = (unint64_t)(double)[v41 hour] / a4;
    int v15 = [v9 count];
    if (v15 >= 2)
    {
      uint64_t v16 = v15;
      do
      {
        int v17 = v16--;
        long long v18 = [v9 objectAtIndexedSubscript:v16];
        long long v19 = [v18 endDate];

        uint64_t v20 = [v9 objectAtIndexedSubscript:(v17 - 2)];
        long long v21 = [v20 startDate];

        long long v22 = [v19 earlierDate:v21];

        if (v22 != v21)
        {
          long long v23 = [v9 objectAtIndexedSubscript:v16];
          uint64_t v24 = [v23 startDate];
          +[PowerUIPredictorHelper getHourBinID:v24 forHourBin:a4];
          unint64_t v26 = (unint64_t)v25;

          if (v14 == v26)
          {
            uint64_t v27 = NSNumber;
            [v21 timeIntervalSinceDate:v19];
            double v29 = [v27 numberWithDouble:v28 / 60.0];
            [v44 addObject:v29];
          }
        }
      }
      while ((unint64_t)(v16 + 1) > 2);
    }
    id v10 = v42;
    if (v40)
    {
      double v30 = [v9 firstObject];
      v31 = [v30 startDate];
      +[PowerUIPredictorHelper getHourBinID:v31 forHourBin:a4];
      unint64_t v33 = (unint64_t)v32;

      if (v14 == v33)
      {
        v34 = NSNumber;
        v35 = [v9 firstObject];
        long long v36 = [v35 endDate];
        [v42 timeIntervalSinceDate:v36];
        long long v38 = [v34 numberWithDouble:v37 / 60.0];

        [v44 addObject:v38];
      }
    }
  }
  return v44;
}

+ (id)getUsageBucketsForEvents:(id)a3 forDate:(id)a4 withLog:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  memset(v56, 0, sizeof(v56));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v7;
  uint64_t v46 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v46) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)v50;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v50 != v9) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
      double v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v13 = [v11 startDate];
      unint64_t v14 = [v12 components:112 fromDate:v13];

      int v15 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v16 = [v11 endDate];
      int v17 = [v15 components:96 fromDate:v16];

      uint64_t v18 = [v14 hour];
      uint64_t v19 = [v17 hour];
      uint64_t v47 = [v14 minute];
      uint64_t v48 = [v17 minute];
      uint64_t v20 = [MEMORY[0x263EFF8F0] currentCalendar];
      long long v21 = [v11 startDate];
      if ([v20 isDate:v21 inSameDayAsDate:v8])
      {

        goto LABEL_22;
      }
      uint64_t v45 = v19;
      long long v22 = [v11 startDate];
      [v8 earlierDate:v22];
      uint64_t v23 = v9;
      id v24 = v8;
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v26 = v25 == v24;
      id v8 = v24;
      uint64_t v9 = v23;
      if (!v26)
      {
        if (v18 < v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - v47)) + *((double *)v56 + v18);
          if (v18 + 1 < v45)
          {
            uint64_t v27 = ~v18 + v45;
            double v28 = (double *)v56 + v18 + 1;
            do
            {
              *double v28 = *v28 + 7.74596669;
              ++v28;
              --v27;
            }
            while (v27);
          }
LABEL_21:
          *((double *)v56 + v45) = sqrt((double)v48) + *((double *)v56 + v45);
          goto LABEL_22;
        }
        if (v18 > v45)
        {
          *((double *)v56 + v18) = sqrt((double)(60 - v47)) + *((double *)v56 + v18);
          if (v18 <= 22)
          {
            uint64_t v29 = v18 + 1;
            do
            {
              *((double *)v56 + v29) = *((double *)v56 + v29) + 7.74596669;
              ++v29;
            }
            while (v29 != 24);
          }
          if (v45 >= 1)
          {
            double v30 = (double *)v56;
            uint64_t v31 = v45;
            do
            {
              *double v30 = *v30 + 7.74596669;
              ++v30;
              --v31;
            }
            while (v31);
          }
          goto LABEL_21;
        }
        if (v48 - v47 >= 0) {
          *((double *)v56 + v18) = sqrt((double)(v48 - v47)) + *((double *)v56 + v18);
        }
      }
LABEL_22:

      ++v10;
    }
    while (v10 != v46);
    uint64_t v32 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    uint64_t v46 = v32;
  }
  while (v32);
LABEL_27:
  uint64_t v33 = 0;
  double v34 = 0.0;
  do
  {
    if (*(double *)((char *)v56 + v33) > v34) {
      double v34 = *(double *)((char *)v56 + v33);
    }
    v33 += 8;
  }
  while (v33 != 192);
  v35 = v43;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    long long v36 = [NSNumber numberWithDouble:v34];
    *(_DWORD *)buf = 138412290;
    v54 = v36;
    _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "maxValue in buckets = %@", buf, 0xCu);
  }
  if (v34 == 0.0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v35, OS_LOG_TYPE_DEFAULT, "Something went wront, maxValue is 0", buf, 2u);
    }
    double v37 = &unk_26D385B10;
  }
  else
  {
    id v38 = v8;
    long long v39 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 192; i += 8)
    {
      uint64_t v41 = [NSNumber numberWithDouble:*(double *)((char *)v56 + i) / v34];
      [v39 addObject:v41];
    }
    double v37 = [MEMORY[0x263EFF8C0] arrayWithArray:v39];

    id v8 = v38;
  }

  return v37;
}

+ (double)hoursUntilUseFromBucketedUsage:(id)a3 withCurrentHour:(int)a4 withComponentsMinutes:(int64_t)a5
{
  double v8 = 0.0;
  int v9 = 1;
  while (1)
  {
    int v10 = a4 + v9;
    if (a4 + v9 > 23) {
      int v10 = a4 + v9 - 24;
    }
    double v11 = [a3 objectAtIndexedSubscript:v10];
    [v11 doubleValue];
    double v13 = v12;

    if (v13 > 0.2) {
      break;
    }
    if (v9 == 11) {
      double v8 = 12.0;
    }
    if (++v9 == 12) {
      return v8;
    }
  }
  return (double)v9 + (double)a5 / -60.0;
}

+ (double)medianTimeBetweenDescendingEvents:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x263EFF980] array];
  if ((int)[v3 count] >= 2)
  {
    uint64_t v5 = 0;
    do
    {
      unint64_t v6 = [v3 objectAtIndexedSubscript:v5];
      id v7 = [v6 startDate];
      double v8 = [v3 objectAtIndexedSubscript:++v5];
      int v9 = [v8 endDate];
      [v7 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 0.0)
      {
        double v12 = [NSNumber numberWithDouble:v11];
        [v4 addObject:v12];
      }
    }
    while (v5 < (int)([v3 count] - 1));
  }
  +[PowerUIPredictorHelper medianOf:v4];
  double v14 = v13;

  return v14;
}

+ (double)meanEventDuration:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v11 = objc_msgSend(v10, "endDate", (void)v16);
          double v12 = [v10 startDate];
          [v11 timeIntervalSinceDate:v12];
          double v8 = v8 + v13;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v14 = v8 / (double)(unint64_t)[v4 count];
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

+ (void)quantizeValuesInDataFrame:(id)a3 forColumn:(id)a4 withBinWidth:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v7);
        }
        double v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v15 = NSNumber;
        long long v16 = [v14 objectForKeyedSubscript:v8];
        [v16 doubleValue];
        double v18 = v17;
        [v9 doubleValue];
        LODWORD(v20) = vcvtmd_s64_f64(v18 / v19);
        uint64_t v21 = [v15 numberWithInt:v20];
        [v14 setObject:v21 forKeyedSubscript:v8];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

+ (id)convertDateToSeconds:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:224 fromDate:v4];

  id v7 = objc_msgSend(NSNumber, "numberWithDouble:", (double)objc_msgSend(v6, "minute") * 60.0+ (double)objc_msgSend(v6, "hour") * 3600.0+ (double)objc_msgSend(v6, "second"));

  return v7;
}

+ (id)convertDateTimeColumnToSeconds:(id)a3 inDataFrame:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "objectForKey:", v6, (void)v17);
        int v15 = [a1 convertDateToSeconds:v14];
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)filterDataFrame:(id)a3 withValue:(double)a4 forColumn:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "objectForKeyedSubscript:", v8, (void)v20);
        [v16 doubleValue];
        double v18 = vabdd_f64(v17, a4);

        if (v18 <= 0.01) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

+ (id)filterDataFrame:(id)a3 withValueGreaterThan:(double)a4 andLessThan:(double)a5 forColumn:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v18 = objc_msgSend(v17, "objectForKeyedSubscript:", v10, (void)v24);
        [v18 doubleValue];
        if (v19 >= a4)
        {
          long long v20 = [v17 objectForKeyedSubscript:v10];
          [v20 doubleValue];
          double v22 = v21;

          if (v22 < a5) {
            [v11 addObject:v17];
          }
        }
        else
        {
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)filterDataFrame:(id)a3 forColumn:(id)a4 withFilterHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t (**)(id, void *))a5;
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v16 = [v15 objectForKey:v8];

        if (v16)
        {
          double v17 = [v15 objectForKeyedSubscript:v8];
          int v18 = v9[2](v9, v17);

          if (v18) {
            [v20 addObject:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v20;
}

+ (id)column:(id)a3 inDataFrame:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
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
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectForKey:", v5, (void)v16);
        uint64_t v14 = (void *)[v13 copy];
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)meanForColumn:(id)a3 inDataFrame:(id)a4
{
  id v4 = [a1 column:a3 inDataFrame:a4];
  id v5 = NSNumber;
  [v4 mean];
  id v6 = objc_msgSend(v5, "numberWithDouble:");

  return v6;
}

+ (id)percentile:(double)a3 forColumn:(id)a4 inDataFrame:(id)a5
{
  id v6 = [a1 column:a4 inDataFrame:a5];
  id v7 = NSNumber;
  [v6 percentile:a3];
  id v8 = objc_msgSend(v7, "numberWithDouble:");

  return v8;
}

+ (id)percentiles:(id)a3 forColumn:(id)a4 inDataFrame:(id)a5
{
  id v5 = [a1 column:a4 inDataFrame:a5];
  id v6 = [v5 percentiles:v5];

  return v6;
}

+ (id)standardDeviationForColumn:(id)a3 inDataFrame:(id)a4
{
  id v4 = [a1 column:a3 inDataFrame:a4];
  id v5 = NSNumber;
  [v4 standardDeviation];
  id v6 = objc_msgSend(v5, "numberWithDouble:");

  return v6;
}

+ (id)varianceForColumn:(id)a3 inDataFrame:(id)a4
{
  id v4 = [a1 standardDeviationForColumn:a3 inDataFrame:a4];
  [v4 doubleValue];
  double v6 = v5;

  id v7 = NSNumber;
  return (id)[v7 numberWithDouble:v6 * v6];
}

+ (id)countForColumn:(id)a3 inDataFrame:(id)a4
{
  id v4 = [a1 column:a3 inDataFrame:a4];
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));

  return v5;
}

@end