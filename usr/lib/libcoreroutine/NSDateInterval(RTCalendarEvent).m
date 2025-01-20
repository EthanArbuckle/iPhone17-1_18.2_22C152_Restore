@interface NSDateInterval(RTCalendarEvent)
+ (id)dateIntervalFromEvent:()RTCalendarEvent;
+ (id)dateIntervalFromEvents:()RTCalendarEvent;
@end

@implementation NSDateInterval(RTCalendarEvent)

+ (id)dateIntervalFromEvents:()RTCalendarEvent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [a1 dateIntervalFromEvent:*(void *)(*((void *)&v13 + 1) + 8 * i) (void)v13];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)dateIntervalFromEvent:()RTCalendarEvent
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 startDate];
  v5 = [v3 endDate];
  char v6 = [v4 isOnOrBefore:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [v3 endDate];
      v17 = [v3 startDate];
      int v18 = 138413314;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      __int16 v22 = 2112;
      __int16 v24 = 2080;
      id v23 = v3;
      v25 = "+[NSDateInterval(RTCalendarEvent) dateIntervalFromEvent:]";
      __int16 v26 = 1024;
      int v27 = 35;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "endDate, %@, was before startDate, %@, event: %@ (in %s:%d)", (uint8_t *)&v18, 0x30u);
    }
  }
  uint64_t v8 = [v3 startDate];
  uint64_t v9 = [v3 endDate];
  int v10 = [v8 isOnOrBefore:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    v12 = [v3 startDate];
    long long v13 = [v3 endDate];
    long long v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

@end