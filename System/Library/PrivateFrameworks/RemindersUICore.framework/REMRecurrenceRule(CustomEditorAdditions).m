@interface REMRecurrenceRule(CustomEditorAdditions)
- (uint64_t)isAnyDayRule;
- (uint64_t)isSimpleRule;
- (uint64_t)isWeekdayRule;
- (uint64_t)isWeekendRule;
@end

@implementation REMRecurrenceRule(CustomEditorAdditions)

- (uint64_t)isWeekdayRule
{
  v1 = [a1 daysOfTheWeek];
  v2 = [v1 valueForKey:@"dayOfTheWeek"];

  uint64_t v3 = [v2 isEqualToArray:&unk_1F1336558];
  return v3;
}

- (uint64_t)isWeekendRule
{
  v1 = [a1 daysOfTheWeek];
  v2 = [v1 valueForKey:@"dayOfTheWeek"];

  uint64_t v3 = [v2 isEqualToArray:&unk_1F1336570];
  return v3;
}

- (uint64_t)isAnyDayRule
{
  v1 = [a1 daysOfTheWeek];
  v2 = [v1 valueForKey:@"dayOfTheWeek"];

  uint64_t v3 = [v2 isEqualToArray:&unk_1F1336588];
  return v3;
}

- (uint64_t)isSimpleRule
{
  if (![a1 frequency]) {
    return 1;
  }
  uint64_t v5 = [a1 frequency];
  if (v5 == 1)
  {
    v1 = [a1 daysOfTheWeek];
    if ((unint64_t)[v1 count] < 2)
    {
      BOOL v6 = 1;
LABEL_14:

      return v6;
    }
  }
  uint64_t v7 = [a1 frequency];
  if (v7 != 2
    || ([a1 daysOfTheWeek], v2 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v2, "count")))
  {
    int v8 = 0;
    BOOL v6 = 0;
    if ([a1 frequency] != 3) {
      goto LABEL_11;
    }
LABEL_8:
    v9 = [a1 daysOfTheWeek];
    if ([v9 count])
    {

      BOOL v6 = 0;
      if (!v8) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    v11 = [a1 monthsOfTheYear];
    if (![v11 count])
    {
      v12 = [a1 weeksOfTheYear];
      if (![v12 count])
      {
        v13 = [a1 daysOfTheYear];
        v14 = v12;
        BOOL v6 = (unint64_t)[v13 count] < 2;

        if ((v8 & 1) == 0)
        {
LABEL_11:
          if (v7 != 2) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    BOOL v6 = 0;
    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v3 = [a1 daysOfTheMonth];
  if ((unint64_t)[v3 count] > 1)
  {
    if ([a1 frequency] != 3)
    {

      BOOL v6 = 0;
LABEL_12:

      goto LABEL_13;
    }
    int v8 = 1;
    goto LABEL_8;
  }

  BOOL v6 = 1;
LABEL_13:
  if (v5 == 1) {
    goto LABEL_14;
  }
  return v6;
}

@end