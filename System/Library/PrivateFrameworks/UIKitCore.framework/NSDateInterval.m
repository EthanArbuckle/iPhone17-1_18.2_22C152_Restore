@interface NSDateInterval
- (BOOL)_intersectsDateComponents:(uint64_t)a3 accuracy:;
@end

@implementation NSDateInterval

- (BOOL)_intersectsDateComponents:(uint64_t)a3 accuracy:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    double v22 = 0.0;
    v7 = [v5 calendar];
    id v21 = 0;
    v8 = [v6 date];
    char v9 = [v7 rangeOfUnit:a3 startDate:&v21 interval:&v22 forDate:v8];
    id v10 = v21;

    if ((v9 & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = [v6 date];
      v20 = [v6 calendar];
      [v18 handleFailureInMethod:sel__intersectsDateComponents_accuracy_, a1, @"NSDateInterval+UICalendarAdditions.m", 41, @"Unable to calculate range for date %@ in calendar %@ with accuracy %tu.", v19, v20, a3 object file lineNumber description];
    }
    v11 = [v10 dateByAddingTimeInterval:v22];
    v12 = [(id)a1 startDate];
    uint64_t v13 = [v12 compare:v11];

    v14 = [(id)a1 endDate];
    uint64_t v15 = [v10 compare:v14];

    a1 = v15 != 1 && v13 == -1;
  }

  return a1;
}

@end