@interface NSDateComponents(ReminderKitAdditions)
+ (id)rem_dateComponentsWithDate:()ReminderKitAdditions timeZone:isAllDay:;
+ (id)rem_dateComponentsWithDateUsingArchivingTimeZone:()ReminderKitAdditions isAllDay:;
+ (id)rem_dateComponentsWithYear:()ReminderKitAdditions month:day:hour:minute:second:allDay:timeZone:;
+ (id)rem_dateWithDateComponents:()ReminderKitAdditions timeZone:;
+ (id)rem_dateWithDateComponentsUsingArchivingTimeZone:()ReminderKitAdditions;
- (BOOL)rem_isAllDayDateComponents;
- (BOOL)rem_isWeekendDateComponents;
- (id)rem_allDayDateComponents;
- (id)rem_dateComponentsByAddingTimeInterval:()ReminderKitAdditions;
- (id)rem_gregorianEquivalent;
- (id)rem_stringRepresentation;
- (id)rem_strippingTimeZone;
- (uint64_t)rem_compare:()ReminderKitAdditions;
- (uint64_t)rem_isValidDateComponents;
- (void)rem_isValidDateComponents;
@end

@implementation NSDateComponents(ReminderKitAdditions)

+ (id)rem_dateComponentsWithDateUsingArchivingTimeZone:()ReminderKitAdditions isAllDay:
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    uint64_t v7 = 30;
  }
  else {
    uint64_t v7 = 254;
  }
  v8 = _REMDateGetDateComponents(v5, v7, 0);
  if (!v8)
  {
    v9 = +[REMLog utility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[NSDateComponents(ReminderKitAdditions) rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:]((uint64_t)v6, v7, v9);
    }

    v8 = objc_opt_new();
  }

  return v8;
}

+ (id)rem_dateComponentsWithDate:()ReminderKitAdditions timeZone:isAllDay:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    uint64_t v9 = 30;
  }
  else {
    uint64_t v9 = 254;
  }
  v10 = _REMDateGetDateComponents(v7, v9, v8);
  if (!v10)
  {
    v11 = +[REMLog utility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = [NSNumber numberWithUnsignedInteger:v9];
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_fault_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_FAULT, "Could not get a date component with {date %@, timeZone: %@, flags: %@}", (uint8_t *)&v14, 0x20u);
    }
    v10 = objc_opt_new();
  }

  return v10;
}

+ (id)rem_dateWithDateComponentsUsingArchivingTimeZone:()ReminderKitAdditions
{
  return REMDateComponentsGetDateWithTimeZone(a3, 0);
}

+ (id)rem_dateWithDateComponents:()ReminderKitAdditions timeZone:
{
  return REMDateComponentsGetDateWithTimeZone(a3, a4);
}

+ (id)rem_dateComponentsWithYear:()ReminderKitAdditions month:day:hour:minute:second:allDay:timeZone:
{
  __int16 v16 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v17 = a10;
  id v18 = objc_alloc_init(v16);
  [v18 setYear:a3];
  [v18 setMonth:a4];
  [v18 setDay:a5];
  if (a9) {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v19 = a6;
  }
  if (a9)
  {
    a7 = 0x7FFFFFFFFFFFFFFFLL;
    a8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v18 setHour:v19];
  [v18 setMinute:a7];
  [v18 setSecond:a8];
  [v18 setCalendar:0];
  [v18 setTimeZone:v17];

  return v18;
}

- (id)rem_gregorianEquivalent
{
  uint64_t v2 = [a1 calendar];
  if (!v2) {
    goto LABEL_3;
  }
  v3 = (void *)v2;
  v4 = [a1 calendar];
  id v5 = [v4 calendarIdentifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v6 & 1) == 0)
  {
    id v8 = [a1 timeZone];
    uint64_t v9 = objc_msgSend(a1, "rem_isAllDayDateComponents");
    v10 = [a1 date];
    v11 = (void *)MEMORY[0x1E4F1C9D8];
    if (v8)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateComponentsWithDate:timeZone:isAllDay:", v10, v8, v9);
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      id v7 = objc_msgSend(v11, "rem_dateComponentsWithDate:timeZone:isAllDay:", v10, v12, v9);
    }
    [v7 setTimeZone:v8];
  }
  else
  {
LABEL_3:
    id v7 = (void *)[a1 copy];
  }

  return v7;
}

- (id)rem_dateComponentsByAddingTimeInterval:()ReminderKitAdditions
{
  v4 = [a1 timeZone];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  id v7 = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponents:timeZone:", a1, v6);
  uint64_t v9 = [v8 dateByAddingTimeInterval:a2];
  v10 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateComponentsWithDate:timeZone:isAllDay:", v9, v7, objc_msgSend(a1, "rem_isAllDayDateComponents"));
  [v10 setTimeZone:v5];

  return v10;
}

- (id)rem_strippingTimeZone
{
  v1 = (void *)[a1 copy];
  [v1 setTimeZone:0];

  return v1;
}

- (id)rem_allDayDateComponents
{
  v1 = (void *)[a1 copy];
  [v1 setHour:0x7FFFFFFFFFFFFFFFLL];
  [v1 setMinute:0x7FFFFFFFFFFFFFFFLL];
  [v1 setSecond:0x7FFFFFFFFFFFFFFFLL];
  [v1 setNanosecond:0x7FFFFFFFFFFFFFFFLL];

  return v1;
}

- (uint64_t)rem_isValidDateComponents
{
  uint64_t v2 = [a1 calendar];
  v3 = v2;
  if (v2
    && ([v2 calendarIdentifier],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqualToString:*MEMORY[0x1E4F1C318]],
        v4,
        (v5 & 1) == 0))
  {
    id v6 = +[REMLog utility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[NSDateComponents(ReminderKitAdditions) rem_isValidDateComponents]();
    }
  }
  else
  {
    if ([a1 year] != 0x7FFFFFFFFFFFFFFFLL
      && [a1 month] != 0x7FFFFFFFFFFFFFFFLL
      && [a1 day] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 1;
      goto LABEL_11;
    }
    id v6 = +[REMLog utility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[NSDateComponents(ReminderKitAdditions) rem_isValidDateComponents]();
    }
  }

  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)rem_isAllDayDateComponents
{
  return [a1 hour] == 0x7FFFFFFFFFFFFFFFLL
      && [a1 minute] == 0x7FFFFFFFFFFFFFFFLL
      && [a1 second] == 0x7FFFFFFFFFFFFFFFLL
      && [a1 nanosecond] == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)rem_isWeekendDateComponents
{
  uint64_t v2 = [a1 calendar];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 calendarIdentifier];
    uint64_t v5 = *MEMORY[0x1E4F1C318];
    char v6 = [v4 isEqualToString:*MEMORY[0x1E4F1C318]];

    if ((v6 & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Calendar must be nil or Gregorian" userInfo:0];
      objc_exception_throw(v7);
    }
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F1C318];
  }
  id v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v5];

  uint64_t v9 = (void *)MEMORY[0x1E4F1C9D8];
  v10 = [a1 timeZone];
  if (v10)
  {
    v11 = objc_msgSend(v9, "rem_dateWithDateComponents:timeZone:", a1, v10);
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v11 = objc_msgSend(v9, "rem_dateWithDateComponents:timeZone:", a1, v12);
  }
  uint64_t v13 = [v8 component:512 fromDate:v11];
  BOOL v15 = v13 == 1 || v13 == 7;

  return v15;
}

- (uint64_t)rem_compare:()ReminderKitAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 timeZone];

  char v6 = [v4 timeZone];
  id v7 = v6;
  if (v5)
  {

    if (v7)
    {
      id v8 = [a1 timeZone];
      uint64_t v9 = _REMSharedGregorianCalendarForTimeZone(v8);
      v10 = [v9 dateFromComponents:a1];

      v11 = [v4 timeZone];
      v12 = _REMSharedGregorianCalendarForTimeZone(v11);
      uint64_t v13 = [v12 dateFromComponents:v4];

      if (v10 && v13)
      {
        uint64_t v14 = [v10 compare:v13];
      }
      else
      {
        __int16 v16 = +[REMLog utility];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[NSDateComponents(ReminderKitAdditions) rem_compare:]();
        }

        uint64_t v14 = 0;
      }

      goto LABEL_17;
    }
    BOOL v15 = +[REMLog utility];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NSDateComponents(ReminderKitAdditions) rem_compare:]();
    }
  }
  else
  {

    if (!v7)
    {
      v10 = (void *)[a1 copy];
      id v17 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
      [v10 setTimeZone:v17];

      id v18 = (void *)[v4 copy];
      uint64_t v19 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
      [v18 setTimeZone:v19];

      uint64_t v14 = objc_msgSend(v10, "rem_compare:", v18);
LABEL_17:

      goto LABEL_18;
    }
    BOOL v15 = +[REMLog utility];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NSDateComponents(ReminderKitAdditions) rem_compare:]();
    }
  }

  uint64_t v14 = 0;
LABEL_18:

  return v14;
}

- (id)rem_stringRepresentation
{
  char v6 = NSString;
  uint64_t v2 = [a1 timeZone];
  v3 = [v2 name];
  id v4 = [v6 stringWithFormat:@"%@_%ld_%ld_%ld_%ld_%ld_%ld_%ld_%ld", v3, objc_msgSend(a1, "era"), objc_msgSend(a1, "year"), objc_msgSend(a1, "month"), objc_msgSend(a1, "day"), objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"), objc_msgSend(a1, "second"), objc_msgSend(a1, "nanosecond")];

  return v4;
}

+ (void)rem_dateComponentsWithDateUsingArchivingTimeZone:()ReminderKitAdditions isAllDay:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "Could not get a date component with floating time zone {date %@, flags: %@}", (uint8_t *)&v6, 0x16u);
}

- (void)rem_isValidDateComponents
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Calendar must be nil or Gregorian", v2, v3, v4, v5, v6);
}

- (void)rem_compare:()ReminderKitAdditions .cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Date components without time zone cannot be compared to date components with timezone", v2, v3, v4, v5, v6);
}

- (void)rem_compare:()ReminderKitAdditions .cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Date components with time zone cannot be compared to date components without timezone", v2, v3, v4, v5, v6);
}

- (void)rem_compare:()ReminderKitAdditions .cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Cannot create date from date components", v2, v3, v4, v5, v6);
}

@end