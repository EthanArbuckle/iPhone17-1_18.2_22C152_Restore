@interface _OSInactivityFeatureFactory
+ (BOOL)extractLeftWatershed:(int *)a3 andRight:(int *)a4 fromFeatureName:(id)a5;
+ (id)activityFeatureValueWithName:(id)a3 atDate:(id)a4 withActivityHistory:(id)a5 withContext:(id)a6;
+ (id)extractPercentileOrQuantileNumberIfAnyFromFeatureName:(id)a3;
+ (id)filterInactiveEvents:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withHourBinWidth:(unint64_t)a6;
+ (id)filteredDurationsFromIntervals:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withBinWidth:(unint64_t)a6;
+ (id)handleSpecialHistoryAgnosticFeaturesWithName:(id)a3 atDate:(id)a4 withContext:(id)a5;
+ (id)inputFeaturesWithNames:(id)a3 atDate:(id)a4 withIntervalHistory:(id)a5 withContext:(id)a6;
+ (id)lockFeatureValueWithName:(id)a3 atDate:(id)a4 withLockHistory:(id)a5 withContext:(id)a6;
+ (id)lockedEventsFromDataSourceUpToDate:(id)a3;
+ (id)prefixStringFromFeatureName:(id)a3;
+ (int)suffixNumberFromFeatureName:(id)a3;
+ (int64_t)parseStrataTypeFromFeatureName:(id)a3;
+ (void)initialize;
@end

@implementation _OSInactivityFeatureFactory

+ (void)initialize
{
  qword_10007A810 = (uint64_t)os_log_create("com.apple.osintelligence", "inactivity.featurefactory");

  _objc_release_x1();
}

+ (id)inputFeaturesWithNames:(id)a3 atDate:(id)a4 withIntervalHistory:(id)a5 withContext:(id)a6
{
  id v10 = a3;
  id v29 = a4;
  id v11 = a5;
  id v28 = a6;
  v12 = +[NSMutableDictionary dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v10;
  id v13 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v32;
    *(void *)&long long v14 = 138412290;
    long long v26 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [a1 lockFeatureValueWithName:v18 atDate:v29 withLockHistory:v11 withContext:v28];
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [a1 activityFeatureValueWithName:v18 atDate:v29 withActivityHistory:v11 withContext:v28];
LABEL_10:
          v21 = (void *)v20;
          if (v20) {
            goto LABEL_14;
          }
        }
        v22 = qword_10007A810;
        if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          uint64_t v36 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Feature value for %@ is nil! Default to 0", buf, 0xCu);
        }
        v21 = 0;
LABEL_14:
        [v12 setObject:v21 forKeyedSubscript:v18];

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v15);
  }

  id v30 = 0;
  id v23 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v12 error:&v30];
  id v24 = v30;
  if (v24 && os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
    sub_1000413D0();
  }

  return v23;
}

+ (id)lockFeatureValueWithName:(id)a3 atDate:(id)a4 withLockHistory:(id)a5 withContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_100041438();
    }
    goto LABEL_9;
  }
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_10004146C();
    }
LABEL_9:
    id v16 = 0;
    goto LABEL_33;
  }
  long long v14 = [a1 handleSpecialHistoryAgnosticFeaturesWithName:v10 atDate:v11 withContext:v13];
  id v15 = v14;
  if (!v14)
  {
    if (!v12
      || ([v12 allIntervalsSortByStartAsc],
          v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 count],
          v17,
          !v18))
    {
      if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
        sub_1000414A0();
      }
      id v16 = 0;
      goto LABEL_32;
    }
    v19 = @"overlap";
    if ([v10 containsString:@"overlap"])
    {
      uint64_t v20 = 0;
    }
    else
    {
      v19 = [a1 prefixStringFromFeatureName:v10];
      uint64_t v20 = (int)[a1 suffixNumberFromFeatureName:v10];
    }
    v21 = [v12 getAllLockIntervalsEndingBefore:v11];
    v22 = [a1 filteredDurationsFromIntervals:v21 beforeDate:v11 whichHistorySubset:v19 withBinWidth:v20];

    id v23 = [a1 extractPercentileOrQuantileNumberIfAnyFromFeatureName:v10];
    id v24 = v23;
    if (v23)
    {
      [v23 doubleValue];
      +[OSIntelligenceUtilities qthPercentileOf:withQ:](OSIntelligenceUtilities, "qthPercentileOf:withQ:", v22);
    }
    else if ([v10 containsString:@"dur_std"])
    {
      +[OSIntelligenceUtilities standardDeviationOf:v22];
    }
    else if ([v10 containsString:@"dur_avg"])
    {
      +[OSIntelligenceUtilities meanOf:v22];
    }
    else if ([v10 containsString:@"dur_med"])
    {
      +[OSIntelligenceUtilities medianOf:v22];
    }
    else if ([v10 containsString:@"dur_mad"])
    {
      +[OSIntelligenceUtilities meanAbsoluteDeviationOf:v22];
    }
    else
    {
      if (![v10 containsString:@"long_percent"])
      {
        if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
          sub_1000414D4();
        }
        id v16 = 0;
        goto LABEL_31;
      }
      +[OSIntelligenceUtilities percentOfLongDurationsIn:v22 withLongThreshold:10800.0];
    }
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

    goto LABEL_32;
  }
  id v16 = v14;
LABEL_32:

LABEL_33:

  return v16;
}

+ (id)activityFeatureValueWithName:(id)a3 atDate:(id)a4 withActivityHistory:(id)a5 withContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_100041438();
    }
    goto LABEL_9;
  }
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_10004146C();
    }
LABEL_9:
    id v16 = 0;
    goto LABEL_47;
  }
  long long v14 = [a1 handleSpecialHistoryAgnosticFeaturesWithName:v10 atDate:v11 withContext:v13];
  id v15 = v14;
  if (!v14)
  {
    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
        sub_10004153C();
      }
      id v16 = 0;
      goto LABEL_46;
    }
    id v17 = [a1 parseStrataTypeFromFeatureName:v10];
    id v18 = [v12 getDailyAnchorsForDate:v11 whichStrata:v17];
    if ([v10 containsString:@"dur_til_act"])
    {
      v19 = [v12 historicalTimesUntilNextActivityAtDate:v11 whichStrata:v17 useDecay:1];
      uint64_t v20 = [a1 extractPercentileOrQuantileNumberIfAnyFromFeatureName:v10];
      v21 = v20;
      if (v20)
      {
        [v20 doubleValue];
        +[OSIntelligenceUtilities qthPercentileOf:withQ:](OSIntelligenceUtilities, "qthPercentileOf:withQ:", v19);
LABEL_19:
        +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
        goto LABEL_46;
      }
      if ([v10 containsString:@"std"])
      {
        +[OSIntelligenceUtilities standardDeviationOf:v19];
        goto LABEL_19;
      }
    }
    uint64_t v42 = 0;
    if ([a1 extractLeftWatershed:(char *)&v42 + 4 andRight:&v42 fromFeatureName:v10])
    {
      v37 = v10;
      uint64_t v36 = [v12 getPastSliceTimewiseNearDate:v11 whichStrata:v17 earlyBoundaryInSeconds:1 laterBoundaryInSeconds:(double)(60 * HIDWORD(v42)) clipIntervals:(double)(60 * (int)v42)];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v22 = v18;
      id v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v39;
        double v26 = 0.0;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            double v28 = (double)((int)v42 - HIDWORD(v42)) / 60.0;
            uint64_t v29 = +[OSIntelligenceUtilities datewiseDistanceBetweenDate:v11 andDate:*(void *)(*((void *)&v38 + 1) + 8 * i)];
            [v12 recommendedDecayDegree];
            +[OSIntelligenceUtilities exponentialDecayByDateDistance:withDegree:](OSIntelligenceUtilities, "exponentialDecayByDateDistance:withDegree:", v29);
            double v26 = v26 + v28 * v30;
          }
          id v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v24);
      }
      else
      {
        double v26 = 0.0;
      }

      id v10 = v37;
      id v15 = 0;
      if ([v37 containsString:@"dur"])
      {
        [v12 recommendedDecayDegree];
        +[OSIntelligenceUtilities sumIntervalsWithDateDecay:fromDate:withDecayDegree:](OSIntelligenceUtilities, "sumIntervalsWithDateDecay:fromDate:withDecayDegree:", v36, v11);
        double v32 = v31 / 3600.0;
        if ([v37 hasSuffix:@"act"])
        {
LABEL_36:
          double v34 = v32;
LABEL_40:
          id v16 = +[NSNumber numberWithDouble:v34];

          goto LABEL_45;
        }
        if ([v37 hasSuffix:@"r8"]) {
          goto LABEL_38;
        }
      }
      if ([v37 containsString:@"cnt"])
      {
        [v12 recommendedDecayDegree];
        +[OSIntelligenceUtilities countIntervalsWithDateDecay:fromDate:withDecayDegree:](OSIntelligenceUtilities, "countIntervalsWithDateDecay:fromDate:withDecayDegree:", v36, v11);
        double v32 = v33;
        if ([v37 hasSuffix:@"act"]) {
          goto LABEL_36;
        }
        if ([v37 hasSuffix:@"r8"])
        {
LABEL_38:
          double v34 = v32 / v26;
          if (v26 == 0.0) {
            double v34 = 0.0;
          }
          goto LABEL_40;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_1000414D4();
    }
    id v16 = 0;
    goto LABEL_45;
  }
  id v16 = v14;
LABEL_46:

LABEL_47:

  return v16;
}

+ (id)handleSpecialHistoryAgnosticFeaturesWithName:(id)a3 atDate:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    if (v9)
    {
      id v11 = [v9 objectForKey:v7];

      if (v11)
      {
        uint64_t v12 = [v10 objectForKey:v7];
LABEL_7:
        id v13 = (void *)v12;
        goto LABEL_11;
      }
    }
    if ([v7 isEqualToString:@"time_of_day"])
    {
      +[OSIntelligenceUtilities timeOfDayWithDate:v8];
      uint64_t v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR))
  {
    sub_100041438();
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

+ (id)filteredDurationsFromIntervals:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withBinWidth:(unint64_t)a6
{
  id v10 = a4;
  id v11 = [a1 filterInactiveEvents:a3 beforeDate:v10 whichHistorySubset:a5 withHourBinWidth:a6];
  uint64_t v12 = +[OSIntelligenceUtilities dynamicDurationsFromEvents:v11 withAnchorDate:v10 withUnit:3600.0 cappedAt:50400.0];

  return v12;
}

+ (id)filterInactiveEvents:(id)a3 beforeDate:(id)a4 whichHistorySubset:(id)a5 withHourBinWidth:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000B5BC;
  v30[3] = &unk_100064918;
  id v12 = v10;
  id v31 = v12;
  id v13 = +[NSPredicate predicateWithBlock:v30];
  long long v14 = [v9 filteredArrayUsingPredicate:v13];

  if ([v11 isEqualToString:@"overlap"])
  {
    id v15 = v14;
    goto LABEL_18;
  }
  id v16 = +[OSIntelligenceUtilities filterEventsSortedByStartDateAscending:v9 startsBefore:v12 dynamicallyAroundDate:v12 withHourBinWidth:a6];
  id v17 = +[NSMutableSet setWithArray:v14];
  [v17 addObjectsFromArray:v16];
  id v18 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
  double v32 = v18;
  v19 = +[NSArray arrayWithObjects:&v32 count:1];
  uint64_t v20 = [v17 sortedArrayUsingDescriptors:v19];

  if ([v11 isEqualToString:@"all"])
  {
    id v21 = v20;
  }
  else if ([v11 isEqualToString:@"recent"])
  {
    id v21 = +[OSIntelligenceUtilities filterEvents:v20 isRecentForDate:v12 goingDaysBack:3 useEndDate:0];
  }
  else if ([v11 isEqualToString:@"woo"])
  {
    id v21 = +[OSIntelligenceUtilities filterEvents:v20 withSameWorkOrOffStatusAs:v12];
  }
  else if ([v11 isEqualToString:@"dow"])
  {
    id v21 = +[OSIntelligenceUtilities filterEvents:v20 startOnSameWeekdayAs:v12 withHourBinWidth:a6];
  }
  else
  {
    if ([v11 isEqualToString:@"eligible"])
    {
      double v22 = 600.0;
    }
    else
    {
      if (![v11 isEqualToString:@"long"])
      {
        if ([v11 isEqualToString:@"startafter"])
        {
          uint64_t v25 = _NSConcreteStackBlock;
          uint64_t v26 = 3221225472;
          v27 = sub_10000B5D4;
          double v28 = &unk_100064918;
          id v29 = v12;
          id v24 = +[NSPredicate predicateWithBlock:&v25];
          [v20 filteredArrayUsingPredicate:v24, v25, v26, v27, v28];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
            sub_100041570();
          }
          id v15 = 0;
        }
        goto LABEL_17;
      }
      double v22 = 7200.0;
    }
    id v21 = +[OSIntelligenceUtilities filterEvents:v20 withMinimumDuration:v22];
  }
  id v15 = v21;
LABEL_17:

LABEL_18:

  return v15;
}

+ (id)lockedEventsFromDataSourceUpToDate:(id)a3
{
  id v3 = a3;
  v4 = +[_OSLockHistory sharedInstance];
  v5 = [v4 getAllLockIntervalsEndingBefore:v3];

  return v5;
}

+ (int64_t)parseStrataTypeFromFeatureName:(id)a3
{
  id v4 = a3;
  v5 = [a1 prefixStringFromFeatureName:v4];
  if (([v5 isEqualToString:@"all"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"woo"])
    {
      int64_t v6 = 2;
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"dow"])
    {
      int64_t v6 = 1;
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"l3d"])
    {
      int64_t v6 = 3;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_1000415D8();
    }
  }
  int64_t v6 = 0;
LABEL_9:

  return v6;
}

+ (id)prefixStringFromFeatureName:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v4 = +[NSRegularExpression regularExpressionWithPattern:@"^([^_\\W]+)_" options:16 error:&v11];
  id v5 = v11;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_100041640();
    }
    int64_t v6 = 0;
  }
  else
  {
    id v7 = [v4 firstMatchInString:v3 options:0 range:[v3 length]];
    int64_t v6 = 0;
    if ((unint64_t)[v7 numberOfRanges] >= 2)
    {
      id v8 = [v7 rangeAtIndex:1];
      int64_t v6 = [v3 substringWithRange:v8, v9];
    }
  }

  return v6;
}

+ (int)suffixNumberFromFeatureName:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = +[NSRegularExpression regularExpressionWithPattern:@"_(\\d+)$" options:16 error:&v12];
  id v5 = v12;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_1000416A8();
    }
    int v6 = 0;
  }
  else
  {
    id v7 = [v4 firstMatchInString:v3 options:0 range:[v3 length]];
    if ((unint64_t)[v7 numberOfRanges] >= 2)
    {
      id v8 = [v7 rangeAtIndex:1];
      id v10 = [v3 substringWithRange:v8, v9];
      int v6 = [v10 intValue];
    }
    else
    {
      int v6 = 0;
    }
  }
  return v6;
}

+ (id)extractPercentileOrQuantileNumberIfAnyFromFeatureName:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v18 = 0;
    id v4 = +[NSRegularExpression regularExpressionWithPattern:@"_q(\\d+)" options:1 error:&v18];
    id v5 = v18;
    if (v5)
    {
      id v6 = v5;
      if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
        sub_1000417AC();
      }
      id v7 = 0;
    }
    else
    {
      id v17 = 0;
      id v8 = +[NSRegularExpression regularExpressionWithPattern:@"_p(\\d+)" options:1 error:&v17];
      id v6 = v17;
      if (v6)
      {
        if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
          sub_100041744();
        }
        id v7 = 0;
      }
      else
      {
        uint64_t v9 = [v4 firstMatchInString:v3 options:0 range:[v3 length]];
        if ((unint64_t)[v9 numberOfRanges] < 2)
        {
          id v12 = [v8 firstMatchInString:v3 options:0 range:[v3 length]];
          if ((unint64_t)[v12 numberOfRanges] < 2)
          {
            id v7 = 0;
          }
          else
          {
            id v13 = [v12 rangeAtIndex:1];
            id v15 = [v3 substringWithRange:v13, v14];
            id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 intValue]);
          }
        }
        else
        {
          id v10 = [v9 rangeAtIndex:1];
          id v12 = [v3 substringWithRange:v10, v11];
          id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 intValue]);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_100041710();
    }
    id v7 = 0;
  }

  return v7;
}

+ (BOOL)extractLeftWatershed:(int *)a3 andRight:(int *)a4 fromFeatureName:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v20 = 0;
    id v8 = +[NSRegularExpression regularExpressionWithPattern:@"\\((-?\\d+),(-?\\d+)\\)" options:0 error:&v20];
    id v9 = v20;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
        sub_100041814();
      }
      BOOL v10 = 0;
    }
    else
    {
      uint64_t v11 = [v8 firstMatchInString:v7 options:0 range:[v7 length]];
      id v12 = [v11 numberOfRanges];
      BOOL v10 = (unint64_t)v12 > 2;
      if ((unint64_t)v12 >= 3)
      {
        id v13 = [v11 rangeAtIndex:1];
        id v15 = [v7 substringWithRange:v13, v14];
        id v16 = [v11 rangeAtIndex:2];
        id v18 = [v7 substringWithRange:v16, v17];
        *a3 = [v15 intValue];
        *a4 = [v18 intValue];
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007A810, OS_LOG_TYPE_ERROR)) {
      sub_100041710();
    }
    BOOL v10 = 0;
  }

  return v10;
}

@end