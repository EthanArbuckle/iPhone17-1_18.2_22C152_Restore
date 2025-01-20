@interface NSCalendar(SchoolTime)
- (id)SCL_orderedWeekdays;
- (uint64_t)SCL_nonWeekendDays;
- (void)SCL_enumerateWeekdaysUsingBlock:()SchoolTime;
- (void)SCL_nonWeekendDays;
@end

@implementation NSCalendar(SchoolTime)

- (void)SCL_enumerateWeekdaysUsingBlock:()SchoolTime
{
  v4 = a3;
  unint64_t v5 = [a1 firstWeekday];
  unint64_t v6 = v5;
  char v9 = 0;
  if (v5 > 7) {
    goto LABEL_8;
  }
  unint64_t v7 = v5;
LABEL_3:
  v4[2](v4, v7, &v9);
  while (v7 != 7)
  {
    ++v7;
    if (!v9) {
      goto LABEL_3;
    }
  }
  if (v6 >= 2)
  {
LABEL_8:
    uint64_t v8 = 1;
    do
    {
      if (!v9) {
        v4[2](v4, v8, &v9);
      }
      ++v8;
    }
    while (v6 != v8);
  }
}

- (id)SCL_orderedWeekdays
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__NSCalendar_SchoolTime__SCL_orderedWeekdays__block_invoke;
  v5[3] = &unk_2648ACAC0;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "SCL_enumerateWeekdaysUsingBlock:", v5);

  return v3;
}

- (uint64_t)SCL_nonWeekendDays
{
  id v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v3 = [MEMORY[0x263EFF9C0] set];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v22 = __44__NSCalendar_SchoolTime__SCL_nonWeekendDays__block_invoke;
  v23 = &unk_2648ACAE8;
  id v4 = v3;
  id v24 = v4;
  for (uint64_t i = 1; i != 8; ++i)
  {
    if ((i - 8) >= 0xFFFFFFF9) {
      v22((uint64_t)v21, i);
    }
  }
  uint64_t v6 = 0;
  int v7 = 7;
  do
  {
    uint64_t v8 = v2;
    uint64_t v9 = [a1 component:512 fromDate:v2];
    v10 = [NSNumber numberWithInteger:v9];
    [v4 removeObject:v10];

    char v11 = [a1 isDateInWeekend:v8];
    if ((unint64_t)(v9 - 1) >= 7) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (1 << (v9 - 1));
    }
    uint64_t v13 = v12 | v6;
    if ((v11 & 1) == 0) {
      uint64_t v6 = v13;
    }
    id v2 = [a1 dateByAddingUnit:512 value:1 toDate:v8 options:0];

    --v7;
  }
  while (v7);
  if ([v4 count])
  {
    if (os_variant_has_internal_diagnostics())
    {
      v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF488];
      v16 = [a1 calendarIdentifier];
      v17 = [a1 locale];
      v18 = [v17 localeIdentifier];
      v19 = [a1 timeZone];
      [v14 raise:v15, @"Did not iterate all weekdays; %@; %@ %@ - %@", v4, v16, v18, v19 format];
    }
    else
    {
      v16 = scl_framework_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(NSCalendar(SchoolTime) *)(uint64_t)v4 SCL_nonWeekendDays];
      }
    }
  }
  return v6;
}

- (void)SCL_nonWeekendDays
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 calendarIdentifier];
  int v7 = [a2 locale];
  uint64_t v8 = [v7 localeIdentifier];
  uint64_t v9 = [a2 timeZone];
  int v10 = 138544130;
  uint64_t v11 = a1;
  __int16 v12 = 2114;
  uint64_t v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v8;
  __int16 v16 = 2114;
  v17 = v9;
  _os_log_fault_impl(&dword_22B7B4000, a3, OS_LOG_TYPE_FAULT, "Did not iterate all weekdays; %{public}@; %{public}@ %{public}@ - %{public}@",
    (uint8_t *)&v10,
    0x2Au);
}

@end