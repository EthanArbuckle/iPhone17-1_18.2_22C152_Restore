@interface RTTripSegmentActivityFilter
+ (BOOL)isRealModeOfTransportation:(unint64_t)a3;
- (BOOL)isRealModeOfTransportationExisted:(id)a3;
- (double)findTotalDurationForActivity:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5;
- (id)discardFalseTransitionsFromActivities:(id)a3 whileInTransportMode:(unint64_t)a4 dateInterval:(id)a5 withTimeCushion:(double)a6;
- (id)discardTrivialActivitiesBetweenIdenticalRealActivities:(id)a3;
- (id)findGapMergeOrderFromActivities:(id)a3 dateInterval:(id)a4;
- (id)findIndicesAndDurationForMode:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5;
- (id)forceActivities:(id)a3 toTransportationMode:(unint64_t)a4 dateInterval:(id)a5;
- (id)forceActivities:(id)a3 withinTransitionInterval:(id)a4 toAutoByConnection:(id)a5;
- (id)mergeRepeatedActivities:(id)a3;
- (id)populatePredominantActivity:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5;
- (id)preventDirectModeSwitchingInActivities:(id)a3 dateInterval:(id)a4;
- (id)removeFalseTransitionsFromActivities:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5;
- (id)removeNonTransportationModeActivities:(id)a3 dateInterval:(id)a4 vehicleIntervals:(id)a5 predominantActivityType:(unint64_t)a6;
@end

@implementation RTTripSegmentActivityFilter

+ (BOOL)isRealModeOfTransportation:(unint64_t)a3
{
  return a3 - 2 < 4;
}

- (id)mergeRepeatedActivities:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x1E4F5CE50]);
        if ([v9 type] == 3) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = [v9 type];
        }
        uint64_t v12 = [v9 confidence];
        v13 = [v9 startDate];
        v14 = (void *)[v10 initWithType:v11 confidence:v12 startDate:v13];

        if (![v4 count]
          || ([v4 lastObject],
              v15 = objc_claimAutoreleasedReturnValue(),
              uint64_t v16 = [v15 type],
              uint64_t v17 = [v14 type],
              v15,
              v16 != v17))
        {
          [v4 addObject:v14];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)findIndicesAndDurationForMode:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 count])
  {
    unint64_t v10 = 1;
    p_superclass = &OBJC_METACLASS___SMReceiverCacheManager.superclass;
    unint64_t v27 = a3;
    do
    {
      uint64_t v12 = [v7 objectAtIndexedSubscript:v10 - 1];
      if ([v12 type] == a3)
      {
        v13 = [v8 endDate];
        v14 = [v12 startDate];
        [v13 timeIntervalSinceDate:v14];
        double v16 = v15;

        if (v10 - 1 < [v7 count] - 1)
        {
          uint64_t v17 = [v7 objectAtIndexedSubscript:v10];
          v18 = [v17 startDate];
          [v12 startDate];
          v19 = v9;
          id v20 = v8;
          v22 = long long v21 = p_superclass;
          [v18 timeIntervalSinceDate:v22];
          double v16 = v23;

          p_superclass = v21;
          id v8 = v20;
          v9 = v19;
          a3 = v27;
        }
        v24 = (void *)[objc_alloc((Class)(p_superclass + 424)) initWithType:a3 index:v10 - 1 duration:v16];
        [v9 addObject:v24];
      }
    }
    while (v10++ < [v7 count]);
  }

  return v9;
}

- (id)forceActivities:(id)a3 toTransportationMode:(unint64_t)a4 dateInterval:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    for (unint64_t i = 0; i < [v7 count]; ++i)
    {
      unint64_t v10 = [v7 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 startDate];
      uint64_t v12 = [v8 startDate];
      char v13 = [v11 isBeforeDate:v12];

      if ((v13 & 1) == 0)
      {
        v14 = [v10 startDate];
        double v15 = [v8 endDate];
        char v16 = [v14 isAfterDate:v15];

        if (v16)
        {

          break;
        }
        if ([v10 type] != a4)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F5CE50]);
          uint64_t v18 = [v10 confidence];
          v19 = [v10 startDate];
          id v20 = (void *)[v17 initWithType:a4 confidence:v18 startDate:v19];

          [v7 replaceObjectAtIndex:i withObject:v20];
        }
      }
    }
  }

  return v7;
}

- (id)preventDirectModeSwitchingInActivities:(id)a3 dateInterval:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    unint64_t v7 = 0;
    unint64_t v8 = 1;
    do
    {
      v9 = [v5 objectAtIndex:v8 - 1];
      if (v8 == [v5 count])
      {
        id v10 = v9;
      }
      else
      {
        id v10 = [v5 objectAtIndex:v8];
      }
      uint64_t v11 = v10;
      uint64_t v12 = [v10 startDate];
      char v13 = [v9 startDate];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v8 - 1 == [v5 count] - 1)
      {
        char v16 = [v6 endDate];
        id v17 = [v9 startDate];
        [v16 timeIntervalSinceDate:v17];
        double v15 = v18;
      }
      if (v7 <= 6)
      {
        if (((1 << v7) & 0x4F) != 0) {
          goto LABEL_10;
        }
        uint64_t v19 = [v9 type];
        BOOL v20 = v15 < 10.0 && v19 == 6;
        BOOL v21 = v20;
        uint64_t v22 = [v9 type];
        BOOL v23 = v22 == 5;
        BOOL v24 = v15 < 60.0 && v22 == 4;
        BOOL v25 = v24;
        if (v7 == 5) {
          BOOL v23 = 0;
        }
        else {
          BOOL v25 = 0;
        }
        if (v21 || v25 || v23)
        {
          id v26 = objc_alloc(MEMORY[0x1E4F5CE50]);
          uint64_t v27 = [v9 confidence];
          v28 = [v9 startDate];
          v29 = (void *)[v26 initWithType:v7 confidence:v27 startDate:v28];

          [v5 replaceObjectAtIndex:v8 - 1 withObject:v29];
        }
        else
        {
LABEL_10:
          unint64_t v7 = [v9 type];
        }
      }
    }
    while (v8++ < [v5 count]);
  }
  v31 = [(RTTripSegmentActivityFilter *)self mergeRepeatedActivities:v5];

  return v31;
}

- (id)discardFalseTransitionsFromActivities:(id)a3 whileInTransportMode:(unint64_t)a4 dateInterval:(id)a5 withTimeCushion:(double)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v62 = self;
  [(RTTripSegmentActivityFilter *)self findIndicesAndDurationForMode:a4 activities:v10 dateInterval:v11];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v65 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v65) {
    goto LABEL_45;
  }
  uint64_t v13 = 0;
  uint64_t v66 = *(void *)v69;
  unint64_t v61 = a4;
  if (a4 == 4) {
    double v14 = 0.0;
  }
  else {
    double v14 = 60.0;
  }
  v64 = v12;
  v63 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v65; ++i)
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(v12);
      }
      char v16 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      uint64_t v17 = [v16 index];
      if (v17 == [v10 count] - 1)
      {
        id v11 = v63;
        goto LABEL_45;
      }
      unint64_t v18 = [v16 index];
      if (v18 >= [v10 count])
      {
        uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = [v16 index];
          uint64_t v54 = [v10 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v73 = v53;
          __int16 v74 = 2048;
          uint64_t v75 = v54;
          _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity index beyond valid scope,index,%tu,activityCount,%tu", buf, 0x16u);
        }
        id v11 = v63;
        goto LABEL_44;
      }
      uint64_t v19 = [v10 objectAtIndexedSubscript:[v16 index]];
      [v16 duration];
      double v21 = v20;
      v67 = v19;
      if (v13 + i < (unint64_t)([v12 count] - 1))
      {
        uint64_t v22 = [v12 objectAtIndexedSubscript:v13 + i + 1];
        unint64_t v23 = [v22 index];
        if (v23 >= [v10 count])
        {
          id v26 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v55 = [v16 index];
            uint64_t v56 = [v10 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v73 = v55;
            __int16 v74 = 2048;
            uint64_t v75 = v56;
            _os_log_debug_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: next activity index beyond valid scope,index,%tu,activityCount,%tu", buf, 0x16u);
          }
          id v11 = v63;
        }
        else
        {
          [v22 duration];
          double v25 = v24;
          id v26 = [v10 objectAtIndexedSubscript:-[NSObject index](v22, "index")];
          uint64_t v27 = [v22 index];
          uint64_t v28 = [v10 count];
          v29 = [v67 startDate];
          v30 = [v26 startDate];
          char v31 = [v29 isBeforeDate:v30];

          if (v31)
          {
            BOOL v32 = v27 == v28 - 1;
            id v33 = objc_alloc(MEMORY[0x1E4F28C18]);
            v34 = [v67 startDate];
            v35 = [v26 startDate];
            v36 = (void *)[v33 initWithStartDate:v34 endDate:v35];

            goto LABEL_17;
          }
          v50 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v59 = [v67 startDate];
            v60 = [v26 startDate];
            *(_DWORD *)buf = 138412546;
            uint64_t v73 = (uint64_t)v59;
            __int16 v74 = 2112;
            uint64_t v75 = (uint64_t)v60;
            _os_log_debug_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity date, %@, after next activity date, %@", buf, 0x16u);
          }
          id v11 = v63;
          id v12 = v64;
        }

        uint64_t v19 = v67;
        goto LABEL_43;
      }
      id v11 = v63;
      [v63 duration];
      double v25 = v37;
      v38 = [v19 startDate];
      v39 = [v63 endDate];
      int v40 = [v38 isBeforeDate:v39];

      if (!v40)
      {
        uint64_t v22 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v57 = [v19 startDate];
          v58 = [v63 endDate];
          *(_DWORD *)buf = 138412546;
          uint64_t v73 = (uint64_t)v57;
          __int16 v74 = 2112;
          uint64_t v75 = (uint64_t)v58;
          _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity date, %@, after transition end date, %@", buf, 0x16u);
        }
        id v12 = v64;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      id v41 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v22 = [v19 startDate];
      v34 = [v63 endDate];
      v36 = (void *)[v41 initWithStartDate:v22 endDate:v34];
      id v26 = 0;
      BOOL v32 = 0;
LABEL_17:

      int v42 = v25 > v14 || v32;
      id v12 = v64;
      if (v42 == 1 && v21 > v14)
      {
        [v36 duration];
        if (v43 - v21 < a6)
        {
          uint64_t v44 = [(RTTripSegmentActivityFilter *)v62 forceActivities:v10 toTransportationMode:v61 dateInterval:v36];

          if (v13 + i < (unint64_t)([v64 count] - 1))
          {
            v45 = [v26 startDate];
            v46 = [v67 startDate];
            [v45 timeIntervalSinceDate:v46];
            double v48 = v25 + v47;

            v49 = [v64 objectAtIndexedSubscript:v13 + i + 1];
            [v49 setDuration:v48];
          }
          id v10 = (id)v44;
        }
      }
    }
    v13 += i;
    id v11 = v63;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v65) {
      continue;
    }
    break;
  }
LABEL_45:

  v51 = [(RTTripSegmentActivityFilter *)v62 mergeRepeatedActivities:v10];

  return v51;
}

- (id)discardTrivialActivitiesBetweenIdenticalRealActivities:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", [*(id *)(*((void *)&v30 + 1) + 8 * i) type]))
        {
          id v11 = [NSNumber numberWithUnsignedInteger:v8 + i];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
      v8 += i;
    }
    while (v7);
  }

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v5 copyItems:1];
  uint64_t v13 = [v4 count];
  uint64_t v14 = v13 - 1;
  if (v13 != 1)
  {
    for (j = v13; j != 1; uint64_t v14 = j - 1)
    {
      uint64_t v16 = j;
      uint64_t j = v14;
      uint64_t v17 = [v4 objectAtIndexedSubscript:v14];
      uint64_t v18 = [v17 unsignedIntValue];

      uint64_t v19 = [v4 objectAtIndexedSubscript:v16 - 2];
      unint64_t v20 = [v19 unsignedIntValue];

      double v21 = [v12 objectAtIndexedSubscript:v20];
      uint64_t v22 = [v21 type];
      unint64_t v23 = [v12 objectAtIndexedSubscript:v18];
      uint64_t v24 = [v23 type];

      unint64_t v25 = v18 - 1;
      if (v22 == v24 && v25 > v20)
      {
        do
          [v12 removeObjectAtIndex:v25--];
        while (v25 > v20);
      }
    }
  }
  uint64_t v27 = [(RTTripSegmentActivityFilter *)self mergeRepeatedActivities:v12];

  return v27;
}

- (double)findTotalDurationForActivity:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(RTTripSegmentActivityFilter *)self findIndicesAndDurationForMode:a3 activities:a4 dateInterval:a5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) duration];
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)findGapMergeOrderFromActivities:(id)a3 dateInterval:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [&unk_1F34535B8 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(&unk_1F34535B8);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v11 = [v10 objectForKeyedSubscript:@"type"];
        -[RTTripSegmentActivityFilter findTotalDurationForActivity:activities:dateInterval:](self, "findTotalDurationForActivity:activities:dateInterval:", (int)[v11 intValue], v24, v23);
        double v13 = v12;

        v30[0] = @"type";
        long long v14 = [v10 objectForKeyedSubscript:@"type"];
        v31[0] = v14;
        v30[1] = @"maxGap";
        long long v15 = [v10 objectForKeyedSubscript:@"maxGap"];
        v31[1] = v15;
        v30[2] = @"duration";
        long long v16 = [NSNumber numberWithDouble:v13];
        v31[2] = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

        [v22 addObject:v17];
      }
      uint64_t v7 = [&unk_1F34535B8 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"duration" ascending:0];
  v29 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  unint64_t v20 = [v22 sortedArrayUsingDescriptors:v19];

  return v20;
}

- (id)removeFalseTransitionsFromActivities:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [(RTTripSegmentActivityFilter *)self mergeRepeatedActivities:a3];
  double v9 = [(RTTripSegmentActivityFilter *)self preventDirectModeSwitchingInActivities:v8 dateInterval:v7];

  id v10 = [(RTTripSegmentActivityFilter *)self discardTrivialActivitiesBetweenIdenticalRealActivities:v9];

  [(RTTripSegmentActivityFilter *)self findGapMergeOrderFromActivities:v10 dateInterval:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      long long v15 = v10;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
        uint64_t v17 = [v16 objectForKeyedSubscript:@"type"];
        uint64_t v18 = (int)[v17 intValue];
        uint64_t v19 = [v16 objectForKeyedSubscript:@"maxGap"];
        [v19 floatValue];
        id v10 = [(RTTripSegmentActivityFilter *)self discardFalseTransitionsFromActivities:v15 whileInTransportMode:v18 dateInterval:v7 withTimeCushion:v20];

        ++v14;
        long long v15 = v10;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v10;
}

- (id)forceActivities:(id)a3 withinTransitionInterval:(id)a4 toAutoByConnection:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a4;
  id v8 = a5;
  uint64_t v33 = v7;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    unint64_t v10 = 0;
    v34 = v9;
    id v35 = v8;
    do
    {
      uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 type];

      if (v12 != 4)
      {
        uint64_t v13 = [v9 objectAtIndexedSubscript:v10];
        uint64_t v14 = [v13 startDate];

        if (v10 == [v9 count] - 1)
        {
          long long v15 = [v36 endDate];
        }
        else
        {
          long long v16 = [v9 objectAtIndexedSubscript:v10 + 1];
          long long v15 = [v16 startDate];
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v17 = v8;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              long long v23 = [v22 endDate];
              if ([v14 isBeforeDate:v23])
              {
                long long v24 = [v22 startDate];
                char v25 = [v15 isAfterDate:v24];

                if (v25)
                {

                  double v9 = v34;
                  id v17 = [v34 objectAtIndexedSubscript:v10];
                  id v26 = objc_alloc(MEMORY[0x1E4F5CE50]);
                  uint64_t v27 = [v17 confidence];
                  uint64_t v28 = [v17 startDate];
                  v29 = (void *)[v26 initWithType:4 confidence:v27 startDate:v28];

                  [v34 replaceObjectAtIndex:v10 withObject:v29];
                  id v8 = v35;
                  goto LABEL_20;
                }
              }
              else
              {
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v19);
          double v9 = v34;
          id v8 = v35;
        }
LABEL_20:
      }
      ++v10;
    }
    while (v10 < [v9 count]);
  }
  long long v30 = [(RTTripSegmentActivityFilter *)self mergeRepeatedActivities:v9];

  return v30;
}

- (BOOL)isRealModeOfTransportationExisted:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
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
          if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "type", (void)v9)))
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)populatePredominantActivity:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  }
  for (id i = (id)v10; [i count]; [i removeObjectAtIndex:0])
  {
    long long v12 = [i firstObject];
    BOOL v13 = +[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", [v12 type]);

    if (v13) {
      break;
    }
  }
  while ([i count])
  {
    uint64_t v14 = [i lastObject];
    BOOL v15 = +[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", [v14 type]);

    if (v15) {
      break;
    }
    [i removeLastObject];
  }
  if (![(RTTripSegmentActivityFilter *)self isRealModeOfTransportationExisted:i])
  {
    if (!+[RTTripSegmentActivityFilter isRealModeOfTransportation:a5])
    {
      long long v16 = 0;
      goto LABEL_19;
    }
    if (i)
    {
      [i removeAllObjects];
    }
    else
    {
      id i = [MEMORY[0x1E4F1CA48] array];
    }
    id v17 = objc_alloc(MEMORY[0x1E4F5CE50]);
    uint64_t v18 = [v9 startDate];
    uint64_t v19 = (void *)[v17 initWithType:a5 confidence:3 startDate:v18];

    [i addObject:v19];
  }
  id i = i;
  long long v16 = i;
LABEL_19:

  return v16;
}

- (id)removeNonTransportationModeActivities:(id)a3 dateInterval:(id)a4 vehicleIntervals:(id)a5 predominantActivityType:(unint64_t)a6
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v10 copyItems:1];
  }
  else
  {
    BOOL v13 = [MEMORY[0x1E4F1CA48] array];
  }
  uint64_t v14 = v13;
  if ([v13 count])
  {
    uint64_t v15 = [(RTTripSegmentActivityFilter *)self forceActivities:v14 withinTransitionInterval:v11 toAutoByConnection:v12];

    uint64_t v14 = (void *)v15;
  }
  long long v16 = [(RTTripSegmentActivityFilter *)self populatePredominantActivity:v14 dateInterval:v11 predominantActivityType:a6];

  if ([v16 count])
  {
    v84 = v11;
    id v85 = v10;
    id v83 = v12;
    v86 = self;
    if ([v16 count])
    {
      uint64_t v17 = [(RTTripSegmentActivityFilter *)self removeFalseTransitionsFromActivities:v16 dateInterval:v11 predominantActivityType:a6];

      long long v16 = (void *)v17;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v82 = v16;
    uint64_t v19 = [v16 reverseObjectEnumerator];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v97 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          if ([v18 count]
            && (([v18 firstObject],
                 char v25 = objc_claimAutoreleasedReturnValue(),
                 uint64_t v26 = [v25 type],
                 v25,
                 ![v24 type])
             || [v24 type] == 6)
            && +[RTTripSegmentActivityFilter isRealModeOfTransportation:v26])
          {
            id v27 = objc_alloc(MEMORY[0x1E4F5CE50]);
            uint64_t v28 = [v24 confidence];
            v29 = [v24 startDate];
            long long v30 = (void *)[v27 initWithType:v26 confidence:v28 startDate:v29];

            [v18 insertObject:v30 atIndex:0];
          }
          else
          {
            [v18 insertObject:v24 atIndex:0];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v96 objects:v101 count:16];
      }
      while (v21);
    }

    long long v31 = [(RTTripSegmentActivityFilter *)v86 mergeRepeatedActivities:v18];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __123__RTTripSegmentActivityFilter_removeNonTransportationModeActivities_dateInterval_vehicleIntervals_predominantActivityType___block_invoke;
    v94[3] = &unk_1E6B9C9A0;
    id v33 = v32;
    id v95 = v33;
    [v31 enumerateObjectsUsingBlock:v94];
    id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v33 count] != 1)
    {
      unint64_t v34 = 0;
      do
      {
        id v35 = [v33 objectAtIndexedSubscript:v34];
        uint64_t v36 = [v35 unsignedIntValue];

        long long v37 = [v33 objectAtIndexedSubscript:++v34];
        unsigned int v38 = [v37 unsignedIntValue];

        long long v39 = [v31 objectAtIndexedSubscript:v36];
        [v87 addObject:v39];

        if (v36 + 1 != v38)
        {
          long long v40 = [v31 objectAtIndexedSubscript:v36];
          uint64_t v41 = [v40 type];
          uint64_t v42 = [v31 objectAtIndexedSubscript:v38];
          uint64_t v43 = [v42 type];

          if (v41 != v43 && v36 <= v38)
          {
            while (1)
            {
              uint64_t v44 = [v31 objectAtIndexedSubscript:v36];
              uint64_t v45 = [v44 type];

              if (v45 == 1) {
                break;
              }
              if (v38 + 1 == ++v36) {
                goto LABEL_31;
              }
            }
            id obja = objc_alloc(MEMORY[0x1E4F5CE50]);
            v46 = [v31 objectAtIndexedSubscript:v38];
            uint64_t v47 = [v46 type];
            double v48 = [v31 objectAtIndexedSubscript:v38];
            uint64_t v49 = [v48 confidence];
            v50 = [v31 objectAtIndexedSubscript:v36];
            v51 = [v50 startDate];
            v52 = (void *)[obja initWithType:v47 confidence:v49 startDate:v51];

            [v87 addObject:v52];
          }
        }
LABEL_31:
        ;
      }
      while (v34 < [v33 count] - 1);
    }
    v80 = v33;
    v81 = v31;
    uint64_t v53 = [v31 lastObject];
    [v87 addObject:v53];

    uint64_t v54 = [(RTTripSegmentActivityFilter *)v86 mergeRepeatedActivities:v87];
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id obj = v54;
    uint64_t v56 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v91 != v58) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          if (![v55 count]) {
            goto LABEL_40;
          }
          unint64_t v61 = [v60 startDate];
          v62 = [v55 lastObject];
          v63 = [v62 startDate];
          [v61 timeIntervalSinceDate:v63];
          double v65 = v64;

          if (v65 < 30.0)
          {
            id v66 = objc_alloc(MEMORY[0x1E4F5CE50]);
            uint64_t v67 = [v60 type];
            uint64_t v68 = [v60 confidence];
            long long v69 = [v55 lastObject];
            long long v70 = [v69 startDate];
            long long v71 = (void *)[v66 initWithType:v67 confidence:v68 startDate:v70];

            [v55 removeLastObject];
            [v55 addObject:v71];
          }
          else
          {
LABEL_40:
            [v55 addObject:v60];
          }
        }
        uint64_t v57 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
      }
      while (v57);
    }

    v72 = [v55 firstObject];
    id v73 = objc_alloc(MEMORY[0x1E4F5CE50]);
    uint64_t v74 = [v72 type];
    uint64_t v75 = [v72 confidence];
    id v11 = v84;
    v76 = [v84 startDate];
    uint64_t v77 = (void *)[v73 initWithType:v74 confidence:v75 startDate:v76];

    [v55 removeObjectAtIndex:0];
    [v55 insertObject:v77 atIndex:0];

    id v10 = v85;
    id v78 = v82;
    id v12 = v83;
  }
  else
  {
    id v78 = v16;
    id v55 = v78;
  }

  return v55;
}

void __123__RTTripSegmentActivityFilter_removeNonTransportationModeActivities_dateInterval_vehicleIntervals_predominantActivityType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", [a2 type]))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 addObject:v6];
  }
}

@end