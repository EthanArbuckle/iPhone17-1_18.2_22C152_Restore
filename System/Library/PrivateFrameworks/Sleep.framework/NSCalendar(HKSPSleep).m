@interface NSCalendar(HKSPSleep)
+ (uint64_t)_hksp_optionsForBackwards:()HKSPSleep;
- (double)hksp_timeIntervalFromComponents:()HKSPSleep toComponents:;
- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingComponents:backwards:;
- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:backwards:;
- (id)_hksp_nextDateHelperAfterDate:()HKSPSleep nextDateBlock:;
- (id)hksp_componentsByAddingTimeInterval:()HKSPSleep toComponents:;
- (id)hksp_localizedGroupingStringForWeekdays:()HKSPSleep;
- (id)hksp_orderedSleepDays;
- (id)hksp_orderedSleepWeekdaysForWeekdays:()HKSPSleep;
- (uint64_t)hksp_dateRequiresSingularTimeString:()HKSPSleep;
- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:;
- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:options:;
- (uint64_t)hksp_firstNonWeekendDay;
- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingComponents:;
- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:;
- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingComponents:;
- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingUnit:value:;
@end

@implementation NSCalendar(HKSPSleep)

- (uint64_t)hksp_firstNonWeekendDay
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0xFFFFFFFFLL;
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "firstWeekday"));
  v3 = objc_msgSend(a1, "hk_weekendDays");
  uint64_t v4 = [v2 unsignedIntegerValue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSCalendar_HKSPSleep__hksp_firstNonWeekendDay__block_invoke;
  v8[3] = &unk_1E5D31A30;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  HKSPEnumerateDaysOfWeekStartingOnDay(v4, (uint64_t)v8, 0);
  uint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingComponents:backwards:
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_msgSend((id)objc_opt_class(), "_hksp_optionsForBackwards:", a5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingComponents_backwards___block_invoke;
  v14[3] = &unk_1E5D319E0;
  v14[4] = a1;
  id v15 = v8;
  uint64_t v16 = v10;
  id v11 = v8;
  v12 = objc_msgSend(a1, "_hksp_nextDateHelperAfterDate:nextDateBlock:", v9, v14);

  return v12;
}

- (id)_hksp_nextDateHelperAfterDate:()HKSPSleep nextDateBlock:
{
  id v6 = a3;
  v7 = a4;
  id v8 = [a1 timeZone];
  [v8 daylightSavingTimeOffsetForDate:v6];
  double v10 = v9;

  if (v10 > 0.0)
  {
    id v11 = [v6 dateByAddingTimeInterval:-v10];
    v12 = [a1 timeZone];
    [v12 daylightSavingTimeOffsetForDate:v11];
    double v14 = v13;

    if (v10 > v14)
    {
      id v15 = v7[2](v7, v11);
      if (objc_msgSend(v15, "hksp_isAfterDate:", v6))
      {

        goto LABEL_8;
      }
    }
  }
  id v15 = v7[2](v7, v6);
LABEL_8:

  return v15;
}

+ (uint64_t)_hksp_optionsForBackwards:()HKSPSleep
{
  if (a3) {
    return 8708;
  }
  else {
    return 512;
  }
}

- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingComponents:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingComponents:backwards:", a3, a4, 1);
}

- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingComponents:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingComponents:backwards:", a3, a4, 0);
}

- (id)hksp_orderedSleepDays
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NSCalendar_HKSPSleep__hksp_orderedSleepDays__block_invoke;
  v6[3] = &unk_1E5D31A58;
  id v7 = v2;
  id v3 = v2;
  HKSPEnumerateDaysOfWeekInCalendar(a1, v6, 0);
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (id)hksp_orderedSleepWeekdaysForWeekdays:()HKSPSleep
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NSCalendar_HKSPSleep__hksp_orderedSleepWeekdaysForWeekdays___block_invoke;
  v9[3] = &unk_1E5D31A58;
  id v10 = v5;
  id v6 = v5;
  HKSPWeekdaysEnumerateDaysInCalendar(a1, a3, v9, 0);
  id v7 = (void *)[v6 copy];

  return v7;
}

- (id)hksp_localizedGroupingStringForWeekdays:()HKSPSleep
{
  if (a3 == 127)
  {
    id v3 = @"EVERY_DAY";
LABEL_7:
    id v6 = HKSPLocalizedString(v3);
    goto LABEL_8;
  }
  uint64_t v5 = HKSPWeekendDaysInCalendar(a1);
  if (v5 == a3)
  {
    id v3 = @"WEEKENDS";
    goto LABEL_7;
  }
  if ((~(_BYTE)v5 & 0x7F) == a3)
  {
    id v3 = @"WEEKDAYS";
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:
  return v6;
}

- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:
{
  return objc_msgSend(a1, "hksp_dayPeriodForDate:locale:options:", a3, a4, 1);
}

- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:options:
{
  id v8 = a3;
  unint64_t v9 = objc_msgSend(a1, "bs_dayPeriodForDate:inLocale:", v8, a4);
  uint64_t v10 = 1;
  if (v9 <= 9)
  {
    if (((1 << v9) & 0x2F0) != 0)
    {
      if (a5)
      {
        if ((unint64_t)([a1 component:32 fromDate:v8] - 3) < 7) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = 3;
        }
      }
      else
      {
        uint64_t v10 = 3;
      }
    }
    else
    {
      BOOL v11 = (a5 & 2) == 0;
      if (v9) {
        BOOL v11 = 1;
      }
      if (((1 << v9) & 0x10C) != 0) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v11;
      }
    }
  }

  return v10;
}

- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 0);
}

- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingUnit:value:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 1);
}

- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:backwards:
{
  id v10 = a3;
  uint64_t v11 = objc_msgSend((id)objc_opt_class(), "_hksp_optionsForBackwards:", a6);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingUnit_value_backwards___block_invoke;
  v14[3] = &unk_1E5D31A08;
  v14[4] = a1;
  void v14[5] = a4;
  v14[6] = a5;
  v14[7] = v11;
  v12 = objc_msgSend(a1, "_hksp_nextDateHelperAfterDate:nextDateBlock:", v10, v14);

  return v12;
}

- (uint64_t)hksp_dateRequiresSingularTimeString:()HKSPSleep
{
  uint64_t result = [a1 component:32 fromDate:a3];
  if (result != 1)
  {
    if (result == 13)
    {
      uint64_t v5 = [a1 locale];
      uint64_t v6 = objc_msgSend(v5, "hk_isIn24HourTime");

      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)hksp_componentsByAddingTimeInterval:()HKSPSleep toComponents:
{
  uint64_t v4 = objc_msgSend(a1, "dateFromComponents:");
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setSecond:(uint64_t)a2];
  uint64_t v6 = [a1 dateByAddingComponents:v5 toDate:v4 options:0];

  id v7 = [a1 components:96 fromDate:v6];

  return v7;
}

- (double)hksp_timeIntervalFromComponents:()HKSPSleep toComponents:
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = [v6 dateWithTimeIntervalSinceReferenceDate:0.0];
  id v10 = [a1 nextDateAfterDate:v9 matchingComponents:v8 options:512];

  uint64_t v11 = [a1 nextDateAfterDate:v10 matchingComponents:v7 options:512];

  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;

  return v13;
}

@end