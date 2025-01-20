@interface PPAdaptiveCoalescerPendingKeyState
- (BOOL)shouldGarbageCollectForNowDate:(id)a3;
- (PPAdaptiveCoalescerPendingKeyState)initWithKey:(id)a3;
- (double)currentDelayForNowDate:(id)a3;
- (double)currentQPSForDateInterval:(id)a3;
- (double)currentQPSForNowDate:(id)a3;
- (void)addDate:(id)a3;
@end

@implementation PPAdaptiveCoalescerPendingKeyState

- (void)addDate:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_dates, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, [(NSMutableArray *)self->_dates count], 1024, &__block_literal_global_1823);
  unint64_t v5 = [(NSMutableArray *)self->_dates count];
  if (v5 < 0x31 || v4 != 0)
  {
    unint64_t v7 = v5;
    [(NSMutableArray *)self->_dates insertObject:v8 atIndex:v4];
    if (v7 >= 0x31) {
      [(NSMutableArray *)self->_dates removeObjectAtIndex:0];
    }
  }
}

- (double)currentDelayForNowDate:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  unint64_t v7 = [v5 dateByAddingTimeInterval:-1.0];
  id v8 = (void *)[v6 initWithStartDate:v7 endDate:v5];

  [(PPAdaptiveCoalescerPendingKeyState *)self currentQPSForDateInterval:v8];
  if (v9 < 1.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }

  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  v12 = [v5 dateByAddingTimeInterval:-20.0];
  v13 = (void *)[v11 initWithStartDate:v12 endDate:v5];

  [(PPAdaptiveCoalescerPendingKeyState *)self currentQPSForDateInterval:v13];
  double v15 = v14;

  id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
  v17 = [v5 dateByAddingTimeInterval:-300.0];
  v18 = (void *)[v16 initWithStartDate:v17 endDate:v5];

  [(PPAdaptiveCoalescerPendingKeyState *)self currentQPSForDateInterval:v18];
  if (v19 < 0.0333333333) {
    double v20 = 0.0;
  }
  else {
    double v20 = 30.0;
  }

  id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
  v22 = [v5 dateByAddingTimeInterval:-21600.0];
  v23 = (void *)[v21 initWithStartDate:v22 endDate:v5];

  [(PPAdaptiveCoalescerPendingKeyState *)self currentQPSForDateInterval:v23];
  double v25 = v24;

  double result = 4.0;
  if (v15 < 0.25) {
    double result = v10;
  }
  double v27 = 300.0;
  if (v25 < 0.00222222222) {
    double v27 = v20;
  }
  if (result < v27) {
    return v27;
  }
  return result;
}

- (double)currentQPSForDateInterval:(id)a3
{
  id v5 = a3;
  double v6 = 0.0;
  if ([(NSMutableArray *)self->_dates count])
  {
    dates = self->_dates;
    id v8 = [v5 startDate];
    unint64_t v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](dates, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, [(NSMutableArray *)self->_dates count], 1024, &__block_literal_global_1823);

    double v10 = self->_dates;
    id v11 = [v5 endDate];
    unint64_t v12 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, [(NSMutableArray *)self->_dates count], 1024, &__block_literal_global_1823);

    if (v12 < v9)
    {
      double v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"PPAdaptiveCoalescer.m", 82, @"expected startIndex <= endIndex, got startIndex %tu endIndex %tu (dateInterval=%@, _dates=%@)", v9, v12, v5, self->_dates object file lineNumber description];
    }
    unint64_t v13 = v12 - v9;
    if (v13)
    {
      if (!v9 && [(NSMutableArray *)self->_dates count] == 48)
      {
        double v14 = [(NSMutableArray *)self->_dates objectAtIndexedSubscript:0];
        if ([v5 containsDate:v14])
        {
          id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
          id v16 = [v5 endDate];
          uint64_t v17 = [v15 initWithStartDate:v14 endDate:v16];

          id v5 = (id)v17;
        }
      }
      [v5 duration];
      double v6 = (double)v13 / v18;
    }
  }

  return v6;
}

- (PPAdaptiveCoalescerPendingKeyState)initWithKey:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPAdaptiveCoalescerPendingKeyState;
  double v6 = [(PPAdaptiveCoalescerPendingKeyState *)&v13 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_key, a3);
    uint64_t v8 = objc_opt_new();
    handlers = v7->_handlers;
    v7->_handlers = (NSMutableArray *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:48];
    dates = v7->_dates;
    v7->_dates = (NSMutableArray *)v10;
  }
  return v7;
}

- (BOOL)shouldGarbageCollectForNowDate:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_handlers count])
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = [(NSMutableArray *)self->_dates lastObject];
    [v4 timeIntervalSinceDate:v6];
    BOOL v5 = v7 > 600.0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong(&self->_key, 0);
}

- (double)currentQPSForNowDate:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v8 = (void *)[v6 initWithStartDate:v7 endDate:v5];

  [(PPAdaptiveCoalescerPendingKeyState *)self currentQPSForDateInterval:v8];
  double v10 = v9;

  return v10;
}

@end