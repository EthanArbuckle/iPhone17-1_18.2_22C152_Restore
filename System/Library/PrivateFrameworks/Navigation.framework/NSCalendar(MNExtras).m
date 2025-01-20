@interface NSCalendar(MNExtras)
- (id)_navigation_dateStringForDate:()MNExtras withStyle:useRelativeFormatting:inTimeZone:;
- (id)_navigation_offsetDate:()MNExtras toTimeZone:;
- (id)_navigation_relativeDateStringForDate:()MNExtras context:inTimeZone:;
- (id)_navigation_transitRelativeDateStringForDate:()MNExtras context:inTimeZone:outUsedFormat:;
- (uint64_t)_navigation_isDateInToday:()MNExtras inTimeZone:;
- (uint64_t)_navigation_isDateInTomorrow:()MNExtras inTimeZone:;
@end

@implementation NSCalendar(MNExtras)

- (id)_navigation_offsetDate:()MNExtras toTimeZone:
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    v8 = [a1 componentsInTimeZone:a4 fromDate:v6];
    v9 = [a1 timeZone];
    [v8 setTimeZone:v9];

    id v10 = [a1 dateFromComponents:v8];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (uint64_t)_navigation_isDateInToday:()MNExtras inTimeZone:
{
  v2 = objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:");
  uint64_t v3 = [a1 isDateInToday:v2];

  return v3;
}

- (uint64_t)_navigation_isDateInTomorrow:()MNExtras inTimeZone:
{
  v2 = objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:");
  uint64_t v3 = [a1 isDateInTomorrow:v2];

  return v3;
}

- (id)_navigation_dateStringForDate:()MNExtras withStyle:useRelativeFormatting:inTimeZone:
{
  uint64_t v10 = qword_1EB59C220;
  id v11 = a6;
  id v12 = a3;
  if (v10 != -1) {
    dispatch_once(&qword_1EB59C220, &__block_literal_global_35);
  }
  [(id)_MergedGlobals_39 setDateStyle:a4];
  [(id)_MergedGlobals_39 setDoesRelativeDateFormatting:a5];
  v13 = (void *)_MergedGlobals_39;
  v14 = objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v12, v11);

  v15 = [v13 stringFromDate:v14];

  return v15;
}

- (id)_navigation_relativeDateStringForDate:()MNExtras context:inTimeZone:
{
  uint64_t v8 = qword_1EB59C230;
  id v9 = a5;
  id v10 = a3;
  if (v8 != -1) {
    dispatch_once(&qword_1EB59C230, &__block_literal_global_7);
  }
  id v11 = objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v10, v9);

  [(id)qword_1EB59C228 setFormattingContext:a4];
  [(id)qword_1EB59C228 setDoesRelativeDateFormatting:0];
  id v12 = [(id)qword_1EB59C228 stringFromDate:v11];
  [(id)qword_1EB59C228 setDoesRelativeDateFormatting:1];
  v13 = [(id)qword_1EB59C228 stringFromDate:v11];
  if ([v13 isEqualToString:v12]) {
    v14 = 0;
  }
  else {
    v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)_navigation_transitRelativeDateStringForDate:()MNExtras context:inTimeZone:outUsedFormat:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_msgSend(a1, "_navigation_relativeDateStringForDate:context:inTimeZone:", v10, a4, v11);
  v13 = v12;
  if (!v12)
  {
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    v16 = [a1 components:28 fromDate:v15];
    v17 = [a1 dateFromComponents:v16];

    v18 = [a1 dateByAddingUnit:16 value:5 toDate:v17 options:0];
    v19 = objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v10, v11);
    v20 = [a1 components:16 fromDate:v19 toDate:v18 options:0];
    if ([v20 day] < 0 || objc_msgSend(v20, "day") > 5)
    {
      if (qword_1EB59C250 != -1) {
        dispatch_once(&qword_1EB59C250, &__block_literal_global_16);
      }
      v21 = &qword_1EB59C248;
      if (!a6) {
        goto LABEL_16;
      }
      uint64_t v22 = 2;
    }
    else
    {
      if (qword_1EB59C240 != -1) {
        dispatch_once(&qword_1EB59C240, &__block_literal_global_10);
      }
      v21 = &qword_1EB59C238;
      if (!a6) {
        goto LABEL_16;
      }
      uint64_t v22 = 1;
    }
    *a6 = v22;
LABEL_16:
    id v14 = [(id)*v21 stringFromDate:v19];

    goto LABEL_17;
  }
  if (a6) {
    *a6 = 0;
  }
  id v14 = v12;
LABEL_17:

  return v14;
}

@end