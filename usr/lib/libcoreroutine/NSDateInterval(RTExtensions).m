@interface NSDateInterval(RTExtensions)
+ (id)dateIntervals:()RTExtensions intersectingDateInterval:;
+ (id)invertDateIntervals:()RTExtensions;
+ (id)mergeDateIntervals:()RTExtensions;
- (id)description;
@end

@implementation NSDateInterval(RTExtensions)

+ (id)mergeDateIntervals:()RTExtensions
{
  id v3 = a3;
  if ([v3 count] && objc_msgSend(v3, "count") != 1)
  {
    v5 = [v3 sortedArrayUsingComparator:&__block_literal_global_43];
    v6 = objc_opt_new();
    v7 = [v5 firstObject];
    v8 = [v7 startDate];
    v20 = v7;
    v9 = [v7 endDate];
    if ((unint64_t)[v5 count] < 2)
    {
      v17 = v9;
    }
    else
    {
      unint64_t v10 = 1;
      do
      {
        v11 = [v5 objectAtIndex:v10];
        v12 = [v11 startDate];
        v13 = [v12 earlierDate:v9];
        v14 = [v11 startDate];

        if (v13 == v14)
        {
          v15 = [v11 endDate];
          v17 = [v9 laterDate:v15];
        }
        else
        {
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
          if (v15) {
            [v6 addObject:v15];
          }
          uint64_t v16 = [v11 startDate];

          v17 = [v11 endDate];
          v8 = (void *)v16;
        }

        ++v10;
        v9 = v17;
      }
      while ([v5 count] > v10);
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v17];
    if (v18) {
      [v6 addObject:v18];
    }
    id v4 = v6;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

+ (id)invertDateIntervals:()RTExtensions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v24 = v4;
    v5 = [a1 mergeDateIntervals:v4];
    id v6 = (id)objc_opt_new();
    v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        v13 = v7;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
          id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
          uint64_t v16 = [v14 startDate];
          v17 = (void *)[v15 initWithStartDate:v13 endDate:v16];

          [v17 duration];
          if (v18 > 0.0) {
            [v6 addObject:v17];
          }
          v7 = [v14 endDate];

          ++v12;
          v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C18]);
    v20 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v21 = (void *)[v19 initWithStartDate:v7 endDate:v20];

    [v21 duration];
    if (v22 > 0.0) {
      [v6 addObject:v21];
    }

    id v4 = v24;
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

+ (id)dateIntervals:()RTExtensions intersectingDateInterval:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6 && [v5 count])
  {
    v7 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) intersectionWithDateInterval:v6, v15];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)description
{
  v2 = NSString;
  id v3 = [a1 startDate];
  id v4 = [v3 stringFromDate];
  id v5 = [a1 endDate];
  id v6 = [v5 stringFromDate];
  v7 = [v2 stringWithFormat:@"start date, %@, end date, %@", v4, v6];

  return v7;
}

@end