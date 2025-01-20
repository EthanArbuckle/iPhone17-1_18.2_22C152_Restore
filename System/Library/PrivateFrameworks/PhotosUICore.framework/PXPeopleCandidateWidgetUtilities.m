@interface PXPeopleCandidateWidgetUtilities
+ (BOOL)_pastMidnightBufferThreshold;
+ (BOOL)shouldFetchCandidatesForPerson:(id)a3 forDaysDictionary:(id)a4;
+ (id)_dateKeyForDay:(id)a3;
+ (id)_dateKeyForToday;
+ (id)_dateKeyForTomorrow;
+ (id)_localTimeZoneFormatStringForDate:(id)a3;
+ (id)_tomorrow;
+ (id)insertPerson:(id)a3 forDaysDictionary:(id)a4;
+ (id)removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:(id)a3;
@end

@implementation PXPeopleCandidateWidgetUtilities

+ (BOOL)_pastMidnightBufferThreshold
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [v3 dateBySettingHour:0 minute:0 second:0 ofDate:v2 options:0];
  v5 = [v3 components:32 fromDate:v4 toDate:v2 options:0];
  BOOL v6 = [v5 hour] > 21;

  return v6;
}

+ (id)_localTimeZoneFormatStringForDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v5 setTimeZone:v6];

  [v5 setDateFormat:@"yyyy.MM.dd"];
  v7 = [v5 stringFromDate:v4];

  return v7;
}

+ (id)_tomorrow
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 dateByAddingUnit:16 value:1 toDate:v3 options:0];

  return v4;
}

+ (id)_dateKeyForDay:(id)a3
{
  v3 = +[PXPeopleCandidateWidgetUtilities _localTimeZoneFormatStringForDate:a3];
  id v4 = [NSString stringWithFormat:@"%@%@", @"PXPeopleCandidateWidgetKey", v3];

  return v4;
}

+ (id)_dateKeyForTomorrow
{
  v2 = +[PXPeopleCandidateWidgetUtilities _tomorrow];
  v3 = +[PXPeopleCandidateWidgetUtilities _dateKeyForDay:v2];

  return v3;
}

+ (id)_dateKeyForToday
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = +[PXPeopleCandidateWidgetUtilities _dateKeyForDay:v2];

  return v3;
}

+ (id)removeAllPreviousNotNowPersonsIfNeededForDaysDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PXPeopleCandidateWidgetUtilities _dateKeyForToday];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([v5 compare:*(void *)(*((void *)&v19 + 1) + 8 * i)] == 1)
        {

          id v12 = v4;
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          if ([a1 _pastMidnightBufferThreshold])
          {
            v14 = +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow];
            v15 = [v12 objectForKey:v14];
            if (v15) {
              [v13 setObject:v15 forKey:v14];
            }
          }
          v16 = +[PXPeopleCandidateWidgetUtilities _dateKeyForToday];
          v17 = [v12 objectForKey:v16];
          if (v17) {
            [v13 setObject:v17 forKey:v16];
          }
          id v11 = (id)[v13 copy];

          goto LABEL_17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v11 = v4;
LABEL_17:

  return v11;
}

+ (BOOL)shouldFetchCandidatesForPerson:(id)a3 forDaysDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PXPeopleCandidateWidgetUtilities _dateKeyForToday];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = objc_msgSend(v6, "px_localIdentifier");

  if ([v8 containsObject:v9])
  {
    char v10 = 0;
  }
  else
  {
    id v11 = +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow];
    id v12 = [v5 objectForKeyedSubscript:v11];
    char v13 = [v12 containsObject:v9];

    char v10 = v13 ^ 1;
  }

  return v10;
}

+ (id)insertPerson:(id)a3 forDaysDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = (void *)[v7 mutableCopy];
    if ([a1 _pastMidnightBufferThreshold]) {
      +[PXPeopleCandidateWidgetUtilities _dateKeyForTomorrow];
    }
    else {
    id v11 = +[PXPeopleCandidateWidgetUtilities _dateKeyForToday];
    }
    id v12 = [v9 objectForKey:v11];
    id v13 = (id)[v12 mutableCopy];
    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v14 = objc_msgSend(v6, "px_localIdentifier");
    if (([v13 containsObject:v14] & 1) == 0) {
      [v13 addObject:v14];
    }
    v15 = (void *)[v13 copy];
    [v9 setObject:v15 forKey:v11];

    id v10 = (id)[v9 copy];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

@end