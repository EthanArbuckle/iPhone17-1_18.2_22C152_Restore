@interface STBlueprintSchedule
+ (id)_boundaryForState:(int64_t)a3 fromStartBoundaries:(id)a4 fromEndBoundaries:(id)a5;
+ (id)_nextBoundaryAfterDate:(id)a3 matchingDate:(id)a4 onDay:(int64_t)a5 inCalendar:(id)a6;
+ (id)endDateKeyPaths;
+ (id)keyPathsForValuesAffectingScheduleRepresentation;
+ (id)startDateKeyPaths;
- (BOOL)_computeNextStartDate:(id *)a3 nextEndDate:(id *)a4 afterDate:(id)a5 forDay:(int64_t)a6 usingCalendar:(id)a7;
- (BOOL)_computeStartBoundaries:(id *)a3 endBoundaries:(id *)a4 forCreationDate:(id)a5 calendar:(id)a6;
- (BOOL)_validateBlueprint:(id)a3;
- (BOOL)isActiveAtDate:(id)a3 inCalendar:(id)a4;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (STBlueprintScheduleRepresentation)scheduleRepresentation;
- (id)computeNextOverrideEndDateForState:(int64_t)a3 creationDate:(id)a4 inCalendar:(id)a5;
- (id)computeNextScheduleBoundaryAfterDate:(id)a3 inCalendar:(id)a4 isStartDate:(BOOL *)a5;
- (id)dictionaryRepresentation;
- (void)_datePairForDay:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5;
- (void)setScheduleRepresentation:(id)a3;
- (void)setStartTime:(id)a3 endTime:(id)a4;
- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5;
@end

@implementation STBlueprintSchedule

+ (id)startDateKeyPaths
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"day0Start";
  v4[1] = @"day1Start";
  v4[2] = @"day2Start";
  v4[3] = @"day3Start";
  v4[4] = @"day4Start";
  v4[5] = @"day5Start";
  v4[6] = @"day6Start";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

+ (id)endDateKeyPaths
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"day0End";
  v4[1] = @"day1End";
  v4[2] = @"day2End";
  v4[3] = @"day3End";
  v4[4] = @"day4End";
  v4[5] = @"day5End";
  v4[6] = @"day6End";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

+ (id)keyPathsForValuesAffectingScheduleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"day0Start", @"day1Start", @"day2Start", @"day3Start", @"day4Start", @"day5Start", @"day6Start", @"day0End", @"day1End", @"day2End", @"day3End", @"day4End", @"day5End", @"day6End", 0);
}

- (STBlueprintScheduleRepresentation)scheduleRepresentation
{
  v25 = objc_opt_new();
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  v29 = v3;
  [v3 setTimeZone:v4];

  v5 = +[STBlueprintSchedule startDateKeyPaths];
  v28 = +[STBlueprintSchedule endDateKeyPaths];
  v27 = objc_opt_new();
  v26 = v5;
  if ([v5 count])
  {
    v6 = 0;
    v7 = 0;
    unint64_t v8 = 0;
    int v30 = 1;
    uint64_t v9 = 1;
    do
    {
      v10 = [v5 objectAtIndexedSubscript:v8];
      v11 = [(STBlueprintSchedule *)self valueForKey:v10];

      v12 = [v28 objectAtIndexedSubscript:v8];
      v13 = [(STBlueprintSchedule *)self valueForKey:v12];

      uint64_t v14 = 0;
      if (v11 && v13)
      {
        v15 = objc_opt_new();
        [v15 setDay:v8];
        v16 = [v29 components:96 fromDate:v11];
        if (v6) {
          v30 &= [v6 isEqual:v16];
        }
        [v15 setStartTime:v16];
        v17 = [v29 components:96 fromDate:v13];
        if (v7) {
          uint64_t v9 = [v7 isEqual:v17] & v9;
        }
        [v15 setEndTime:v17];
        id v18 = v16;

        [v27 addObject:v15];
        uint64_t v14 = v9;
        v6 = v18;
        v5 = v26;
      }
      else
      {
        v17 = v7;
        int v30 = 0;
      }

      ++v8;
      uint64_t v9 = v14;
      v7 = v17;
    }
    while (v8 < [v5 count]);
  }
  else
  {
    v17 = 0;
    v6 = 0;
    LOBYTE(v14) = 1;
    LOBYTE(v30) = 1;
  }
  [v25 setCustomScheduleItems:v27];
  if (v30 & 1) != 0 && (v14)
  {
    v19 = [v27 firstObject];
    v20 = objc_opt_new();
    v21 = [v19 startTime];
    [v20 setStartTime:v21];

    v22 = [v19 endTime];
    [v20 setEndTime:v22];

    [v25 setSimpleSchedule:v20];
    v5 = v26;
  }
  v23 = v25;

  return v23;
}

- (void)setScheduleRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 simpleSchedule];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 startTime];
    unint64_t v8 = [v6 endTime];
    [(STBlueprintSchedule *)self setStartTime:v7 endTime:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = objc_msgSend(v4, "customScheduleItems", 0);
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
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = [v14 startTime];
        v16 = [v14 endTime];
        -[STBlueprintSchedule setStartTime:endTime:forDay:](self, "setStartTime:endTime:forDay:", v15, v16, [v14 day]);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)setStartTime:(id)a3 endTime:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v9 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v8 setTimeZone:v9];

  v33 = v6;
  uint64_t v10 = [v8 dateFromComponents:v6];
  v31 = v8;
  v32 = v7;
  uint64_t v11 = [v8 dateFromComponents:v7];
  uint64_t v12 = +[STBlueprintSchedule startDateKeyPaths];
  v29 = +[STBlueprintSchedule endDateKeyPaths];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        long long v19 = [(STBlueprintSchedule *)self valueForKey:v18];
        char v20 = [v19 isEqualToDate:v10];

        if ((v20 & 1) == 0) {
          [(STBlueprintSchedule *)self setValue:v10 forKey:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v15);
  }
  int v30 = v13;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = v29;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        v27 = [(STBlueprintSchedule *)self valueForKey:v26];
        char v28 = [v27 isEqualToDate:v11];

        if ((v28 & 1) == 0) {
          [(STBlueprintSchedule *)self setValue:v11 forKey:v26];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v23);
  }
}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5
{
  id v15 = a3;
  id v9 = a4;
  if (a5 >= 7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"STBlueprintSchedule.m", 214, @"Invalid parameter not satisfying: %@", @"day < 7" object file lineNumber description];
  }
  uint64_t v10 = 0;
  if (v15)
  {
    uint64_t v11 = 0;
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      id v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
      [v12 setTimeZone:v13];

      uint64_t v11 = [v12 dateFromComponents:v15];
      uint64_t v10 = [v12 dateFromComponents:v9];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  switch(a5)
  {
    case 0uLL:
      [(STBlueprintSchedule *)self setDay0Start:v11];
      [(STBlueprintSchedule *)self setDay0End:v10];
      break;
    case 1uLL:
      [(STBlueprintSchedule *)self setDay1Start:v11];
      [(STBlueprintSchedule *)self setDay1End:v10];
      break;
    case 2uLL:
      [(STBlueprintSchedule *)self setDay2Start:v11];
      [(STBlueprintSchedule *)self setDay2End:v10];
      break;
    case 3uLL:
      [(STBlueprintSchedule *)self setDay3Start:v11];
      [(STBlueprintSchedule *)self setDay3End:v10];
      break;
    case 4uLL:
      [(STBlueprintSchedule *)self setDay4Start:v11];
      [(STBlueprintSchedule *)self setDay4End:v10];
      break;
    case 5uLL:
      [(STBlueprintSchedule *)self setDay5Start:v11];
      [(STBlueprintSchedule *)self setDay5End:v10];
      break;
    case 6uLL:
      [(STBlueprintSchedule *)self setDay6Start:v11];
      [(STBlueprintSchedule *)self setDay6End:v10];
      break;
    default:
      break;
  }
}

- (void)_datePairForDay:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5
{
  switch(a3)
  {
    case 1:
      id v10 = [(STBlueprintSchedule *)self day0Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day0End];
      goto LABEL_11;
    case 2:
      id v10 = [(STBlueprintSchedule *)self day1Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day1End];
      goto LABEL_11;
    case 3:
      id v10 = [(STBlueprintSchedule *)self day2Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day2End];
      goto LABEL_11;
    case 4:
      id v10 = [(STBlueprintSchedule *)self day3Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day3End];
      goto LABEL_11;
    case 5:
      id v10 = [(STBlueprintSchedule *)self day4Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day4End];
      goto LABEL_11;
    case 6:
      id v10 = [(STBlueprintSchedule *)self day5Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day5End];
      goto LABEL_11;
    case 7:
      id v10 = [(STBlueprintSchedule *)self day6Start];
      uint64_t v8 = [(STBlueprintSchedule *)self day6End];
LABEL_11:
      id v9 = (void *)v8;
      if (a4) {
        goto LABEL_12;
      }
      goto LABEL_13;
    default:
      id v9 = 0;
      id v10 = 0;
      if (!a4) {
        goto LABEL_13;
      }
LABEL_12:
      *a4 = v10;
LABEL_13:
      if (a5) {
        *a5 = v9;
      }

      return;
  }
}

- (BOOL)isActiveAtDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(STBlueprintSchedule *)self enabled])
  {
    char v12 = 0;
    uint64_t v8 = [(STBlueprintSchedule *)self computeNextScheduleBoundaryAfterDate:v6 inCalendar:v7 isStartDate:&v12];
    if (v8) {
      BOOL v9 = v12 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    BOOL v10 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)computeNextScheduleBoundaryAfterDate:(id)a3 inCalendar:(id)a4 isStartDate:(BOOL *)a5
{
  id v8 = a4;
  BOOL v9 = STUTCErasedDateFromDate(a3, v8);
  BOOL v10 = (void *)[v8 copy];

  uint64_t v11 = STUTCTimeZone();
  [v10 setTimeZone:v11];

  id v24 = 0;
  id v25 = 0;
  BOOL v12 = [(STBlueprintSchedule *)self _computeStartBoundaries:&v25 endBoundaries:&v24 forCreationDate:v9 calendar:v10];
  id v13 = v25;
  id v14 = v24;
  id v15 = 0;
  if (v12)
  {
    uint64_t v16 = (void *)[v13 mutableCopy];
    long long v17 = (void *)[v14 mutableCopy];
    [v16 sortUsingComparator:&__block_literal_global_2];
    [v17 sortUsingComparator:&__block_literal_global_2];
    uint64_t v18 = [v16 firstObject];
    uint64_t v19 = [v17 firstObject];
    char v20 = (void *)v19;
    id v15 = 0;
    if (v18 && v19)
    {
      uint64_t v21 = [v18 compare:v19];
      if (v21 == -1) {
        uint64_t v22 = v18;
      }
      else {
        uint64_t v22 = v20;
      }
      if (a5) {
        *a5 = v21 == -1;
      }
      id v15 = v22;
    }
  }
  return v15;
}

uint64_t __83__STBlueprintSchedule_computeNextScheduleBoundaryAfterDate_inCalendar_isStartDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)computeNextOverrideEndDateForState:(int64_t)a3 creationDate:(id)a4 inCalendar:(id)a5
{
  id v8 = a5;
  BOOL v9 = STUTCErasedDateFromDate(a4, v8);
  BOOL v10 = (void *)[v8 copy];

  uint64_t v11 = STUTCTimeZone();
  [v10 setTimeZone:v11];

  id v17 = 0;
  id v18 = 0;
  BOOL v12 = [(STBlueprintSchedule *)self _computeStartBoundaries:&v18 endBoundaries:&v17 forCreationDate:v9 calendar:v10];
  id v13 = v18;
  id v14 = v17;
  id v15 = 0;
  if (v12)
  {
    id v15 = +[STBlueprintSchedule _boundaryForState:a3 fromStartBoundaries:v13 fromEndBoundaries:v14];
  }

  return v15;
}

- (BOOL)_computeStartBoundaries:(id *)a3 endBoundaries:(id *)a4 forCreationDate:(id)a5 calendar:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = v11;
  if (a3) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = !v13;
  if (!v13)
  {
    uint64_t v26 = a3;
    v27 = a4;
    BOOL v28 = v14;
    uint64_t v15 = [v11 component:512 fromDate:v10];
    uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v16 maximumRangeOfUnit:512];
    uint64_t v18 = v17;

    uint64_t v19 = objc_opt_new();
    v29 = objc_opt_new();
    if (v18 >= 1)
    {
      uint64_t v20 = 0;
      uint64_t v21 = (v15 - 1) % v18;
      do
      {
        id v30 = 0;
        id v31 = 0;
        BOOL v22 = [(STBlueprintSchedule *)self _computeNextStartDate:&v31 nextEndDate:&v30 afterDate:v10 forDay:(v21 + v20) % v18 + 1 usingCalendar:v12];
        id v23 = v31;
        id v24 = v30;
        if (v22)
        {
          [v19 addObject:v23];
          [v29 addObject:v24];
        }

        ++v20;
      }
      while (v18 != v20);
    }
    id *v26 = (id)[v19 copy];
    id *v27 = (id)[v29 copy];

    BOOL v14 = v28;
  }

  return v14;
}

- (BOOL)_computeNextStartDate:(id *)a3 nextEndDate:(id *)a4 afterDate:(id)a5 forDay:(int64_t)a6 usingCalendar:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  BOOL v14 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v13 setTimeZone:v14];

  id v29 = 0;
  id v30 = 0;
  [(STBlueprintSchedule *)self _datePairForDay:a6 startDate:&v30 endDate:&v29];
  id v15 = v30;
  id v16 = v29;
  uint64_t v17 = v16;
  BOOL v18 = 0;
  if (v15 && v16)
  {
    uint64_t v19 = +[STBlueprintSchedule _nextBoundaryAfterDate:v12 matchingDate:v15 onDay:a6 inCalendar:v13];
    if ([v15 compare:v17] == 1)
    {
      uint64_t v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v20 maximumRangeOfUnit:512];
      uint64_t v21 = a3;
      BOOL v22 = a4;
      uint64_t v24 = v23;

      int64_t v25 = a6 % v24;
      a4 = v22;
      a3 = v21;
      a6 = v25 + 1;
    }
    uint64_t v26 = +[STBlueprintSchedule _nextBoundaryAfterDate:v12 matchingDate:v17 onDay:a6 inCalendar:v13];
    v27 = (void *)v26;
    BOOL v18 = 0;
    if (v19 && v26)
    {
      if (a3) {
        *a3 = v19;
      }
      if (a4) {
        *a4 = v27;
      }
      BOOL v18 = 1;
    }
  }
  return v18;
}

+ (id)_boundaryForState:(int64_t)a3 fromStartBoundaries:(id)a4 fromEndBoundaries:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = v8;
  if (a3 == 1) {
    goto LABEL_4;
  }
  if (!a3)
  {
    id v8 = v7;
LABEL_4:
    id v10 = (void *)[v8 mutableCopy];
    goto LABEL_6;
  }
  id v10 = 0;
LABEL_6:
  [v10 sortUsingComparator:&__block_literal_global_110];
  id v11 = [v10 firstObject];
  id v12 = (void *)[v11 copy];

  return v12;
}

uint64_t __79__STBlueprintSchedule__boundaryForState_fromStartBoundaries_fromEndBoundaries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_nextBoundaryAfterDate:(id)a3 matchingDate:(id)a4 onDay:(int64_t)a5 inCalendar:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = [v9 components:96 fromDate:a4];
  [v11 setWeekday:a5];
  id v12 = [v9 nextDateAfterDate:v10 matchingComponents:v11 options:1024];

  return v12;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"calendarIdentifier"];
  [(STBlueprintSchedule *)self setCalendarIdentifier:v5];

  id v6 = [v4 objectForKeyedSubscript:@"notificationTimeInterval"];
  [(STBlueprintSchedule *)self setNotificationTimeInterval:v6];

  id v7 = [v4 objectForKeyedSubscript:@"enabled"];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 BOOLValue];
  }
  else {
    uint64_t v9 = 1;
  }
  [(STBlueprintSchedule *)self setEnabled:v9];
  id v10 = +[STBlueprintSchedule startDateKeyPaths];
  id v11 = +[STBlueprintSchedule endDateKeyPaths];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        BOOL v18 = [v4 objectForKeyedSubscript:v17];
        [(STBlueprintSchedule *)self setValue:v18 forKeyPath:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v11;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        int64_t v25 = objc_msgSend(v4, "objectForKeyedSubscript:", v24, (void)v27);
        [(STBlueprintSchedule *)self setValue:v25 forKeyPath:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(STBlueprintSchedule *)self calendarIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"calendarIdentifier"];

  v5 = [(STBlueprintSchedule *)self notificationTimeInterval];
  [v3 setObject:v5 forKeyedSubscript:@"notificationTimeInterval"];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[STBlueprintSchedule enabled](self, "enabled"));
  [v3 setObject:v6 forKeyedSubscript:@"enabled"];

  id v7 = +[STBlueprintSchedule startDateKeyPaths];
  id v8 = +[STBlueprintSchedule endDateKeyPaths];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v15 = [(STBlueprintSchedule *)self valueForKeyPath:v14];
        [v3 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        uint64_t v22 = -[STBlueprintSchedule valueForKeyPath:](self, "valueForKeyPath:", v21, (void)v25);
        [v3 setObject:v22 forKeyedSubscript:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  uint64_t v23 = (void *)[v3 copy];
  return v23;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintSchedule;
  if (-[STBlueprintSchedule validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STBlueprintSchedule *)self _validateBlueprint:v5];
    if ([v5 count])
    {
      id v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintSchedule validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintSchedule;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintSchedule validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintSchedule;
  if (-[STBlueprintSchedule validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STBlueprintSchedule *)self _validateBlueprint:v5];
    if ([v5 count])
    {
      id v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintSchedule validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintSchedule;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintSchedule validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STBlueprintSchedule;
  if (-[STBlueprintSchedule validateForDelete:](&v10, sel_validateForDelete_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    if ([v5 count])
    {
      id v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[STBlueprintSchedule validateForDelete:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STBlueprintSchedule;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STBlueprintSchedule validateForDelete:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_validateBlueprint:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STBlueprintSchedule *)self blueprint];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"STBlueprintSchedule is missing a blueprint.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v8 = [v6 errorWithDomain:@"STErrorDomain" code:549 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 != 0;
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on BlueprintSchedule failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for insert on BlueprintSchedule failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for delete on BlueprintSchedule failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end