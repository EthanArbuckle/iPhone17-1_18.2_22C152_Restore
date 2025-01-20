@interface NSCalendar(PLExtensions)
- (BOOL)pl_isDateValid:()PLExtensions;
- (id)pl_dateByAddingDays:()PLExtensions toDate:;
- (id)pl_endOfDayForDate:()PLExtensions;
- (id)pl_endOfPreviousDayForDate:()PLExtensions;
- (id)pl_endOfWeekForDate:()PLExtensions;
- (id)pl_startOfDayForDate:()PLExtensions;
- (id)pl_startOfMonthForDate:()PLExtensions;
- (id)pl_startOfNextDayForDate:()PLExtensions;
- (id)pl_startOfWeekForDate:()PLExtensions;
- (id)pl_validDateForDate:()PLExtensions;
@end

@implementation NSCalendar(PLExtensions)

- (id)pl_startOfMonthForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    id v7 = 0;
    [a1 rangeOfUnit:8 startDate:&v7 interval:0 forDate:v4];

    id v5 = v7;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pl_startOfWeekForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    id v7 = 0;
    [a1 rangeOfUnit:0x2000 startDate:&v7 interval:0 forDate:v4];

    id v5 = v7;
  }
  else
  {
    objc_msgSend(a1, "pl_validDateForDate:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pl_startOfDayForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4)) {
    [a1 startOfDayForDate:v4];
  }
  else {
  id v5 = objc_msgSend(a1, "pl_validDateForDate:", v4);
  }

  return v5;
}

- (id)pl_endOfWeekForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    id v8 = 0;
    double v9 = 0.0;
    [a1 rangeOfUnit:0x2000 startDate:&v8 interval:&v9 forDate:v4];

    id v4 = v8;
    uint64_t v5 = [v4 dateByAddingTimeInterval:v9 + -0.001];
  }
  else
  {
    uint64_t v5 = objc_msgSend(a1, "pl_validDateForDate:", v4);
  }
  v6 = (void *)v5;

  return v6;
}

- (id)pl_dateByAddingDays:()PLExtensions toDate:
{
  id v6 = a4;
  if (objc_msgSend(a1, "pl_isDateValid:", v6)) {
    [a1 dateByAddingUnit:16 value:a3 toDate:v6 options:0];
  }
  else {
  id v7 = objc_msgSend(a1, "pl_validDateForDate:", v6);
  }

  return v7;
}

- (id)pl_endOfDayForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    uint64_t v5 = [a1 startOfDayForDate:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v6 setDay:1];
    [v6 setNanosecond:-1000000];
    id v7 = [a1 dateByAddingComponents:v6 toDate:v5 options:0];

    id v4 = (id)v5;
  }
  else
  {
    id v7 = objc_msgSend(a1, "pl_validDateForDate:", v4);
  }

  return v7;
}

- (id)pl_endOfPreviousDayForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    uint64_t v5 = [a1 startOfDayForDate:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v6 setNanosecond:-1000000];
    id v7 = [a1 dateByAddingComponents:v6 toDate:v5 options:0];

    id v4 = (id)v5;
  }
  else
  {
    id v7 = objc_msgSend(a1, "pl_validDateForDate:", v4);
  }

  return v7;
}

- (id)pl_startOfNextDayForDate:()PLExtensions
{
  id v4 = a3;
  if (objc_msgSend(a1, "pl_isDateValid:", v4))
  {
    uint64_t v5 = [a1 startOfDayForDate:v4];

    id v6 = objc_msgSend(a1, "pl_dateByAddingDays:toDate:", 1, v5);
    id v4 = (id)v5;
  }
  else
  {
    id v6 = objc_msgSend(a1, "pl_validDateForDate:", v4);
  }

  return v6;
}

- (id)pl_validDateForDate:()PLExtensions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v5 = [v3 compare:v4];

  if (v5 == -1)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  id v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v7 = [v6 compare:v3];

  id v8 = v3;
  if (v7 == -1)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid date found: %@, using %@ instead.", (uint8_t *)&v10, 0x16u);
    }
  }
LABEL_8:

  return v8;
}

- (BOOL)pl_isDateValid:()PLExtensions
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"NSCalendar+PLExtensions.m", 17, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([v5 compare:v6] == -1)
  {
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  BOOL v8 = [v7 compare:v5] != -1;

LABEL_6:
  return v8;
}

@end