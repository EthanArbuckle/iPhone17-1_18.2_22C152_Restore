@interface NSDateInterval(UICalendarAdditions)
- (BOOL)_ui_containsDay:()UICalendarAdditions;
- (BOOL)_ui_containsMonth:()UICalendarAdditions;
- (id)_ui_dateInRangeForDate:()UICalendarAdditions;
@end

@implementation NSDateInterval(UICalendarAdditions)

- (id)_ui_dateInRangeForDate:()UICalendarAdditions
{
  id v4 = a3;
  if ([a1 containsDate:v4])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [a1 startDate];
    uint64_t v7 = [v4 compare:v6];

    if (v7 == 1) {
      [a1 endDate];
    }
    else {
    id v5 = [a1 startDate];
    }
  }
  v8 = v5;

  return v8;
}

- (BOOL)_ui_containsMonth:()UICalendarAdditions
{
  return -[NSDateInterval _intersectsDateComponents:accuracy:](a1, a3, 8);
}

- (BOOL)_ui_containsDay:()UICalendarAdditions
{
  return -[NSDateInterval _intersectsDateComponents:accuracy:](a1, a3, 16);
}

@end