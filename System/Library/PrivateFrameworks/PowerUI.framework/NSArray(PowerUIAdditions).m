@interface NSArray(PowerUIAdditions)
- (double)mean;
- (double)percentile:()PowerUIAdditions;
- (double)standardDeviation;
- (id)percentiles:()PowerUIAdditions;
- (uint64_t)median;
@end

@implementation NSArray(PowerUIAdditions)

- (double)mean
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v2 = 0.0;
  if ([a1 count])
  {
    v3 = [a1 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = a1;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "doubleValue", (void)v12);
            double v2 = v2 + v10;
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      return v2 / (double)(unint64_t)[v5 count];
    }
  }
  return v2;
}

- (double)standardDeviation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v2 = 0.0;
  if ((unint64_t)[a1 count] >= 2)
  {
    v3 = [a1 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [a1 mean];
      double v6 = v5;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = a1;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        double v11 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "doubleValue", (void)v15);
            double v11 = v11 + (v13 - v6) * (v13 - v6);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      else
      {
        double v11 = 0.0;
      }

      return sqrt(v11 / (double)(unint64_t)([v7 count] - 1));
    }
  }
  return v2;
}

- (uint64_t)median
{
  return [a1 percentile:0.5];
}

- (double)percentile:()PowerUIAdditions
{
  uint64_t v4 = [a1 count];
  double v5 = 0.0;
  if (v4)
  {
    unint64_t v6 = v4;
    id v7 = [a1 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (v6 == 1)
      {
        uint64_t v9 = [a1 firstObject];
        [v9 doubleValue];
        double v5 = v10;
LABEL_12:

        return v5;
      }
      double v11 = [a1 sortedArrayUsingSelector:sel_compare_];
      uint64_t v9 = v11;
      if (a2 >= 1.0)
      {
        v26 = [a1 lastObject];
      }
      else
      {
        if (a2 > 0.0)
        {
          int v12 = (int)((double)(v6 - 1) * a2);
          double v13 = (double)v6 + -1.0;
          double v14 = (double)v12 / v13;
          double v15 = (double)(v12 + 1) / v13;
          double v16 = a2 - v14;
          long long v17 = [v11 objectAtIndexedSubscript:v12 + 1];
          [v17 doubleValue];
          double v19 = v18;
          uint64_t v20 = v12;
          v21 = [v9 objectAtIndexedSubscript:v12];
          [v21 doubleValue];
          double v23 = v19 - v22;

          v24 = [v9 objectAtIndexedSubscript:v20];
          [v24 doubleValue];
          double v5 = v16 * v23 / (v15 - v14) + v25;
LABEL_11:

          goto LABEL_12;
        }
        v26 = [a1 firstObject];
      }
      v24 = v26;
      [v26 doubleValue];
      double v5 = v27;
      goto LABEL_11;
    }
  }
  return v5;
}

- (id)percentiles:()PowerUIAdditions
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [a1 count];
  unint64_t v6 = objc_opt_new();
  v30 = [a1 sortedArrayUsingSelector:sel_compare_];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    id v29 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) doubleValue];
        double v13 = 0.0;
        if (v5)
        {
          double v14 = v12;
          double v15 = [a1 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            if (v5 == 1) {
              goto LABEL_12;
            }
            if (v14 >= 1.0)
            {
              double v25 = [a1 lastObject];
            }
            else
            {
              if (v14 > 0.0)
              {
                int v17 = (int)(v14 * (double)(v5 - 1));
                v31 = [v30 objectAtIndexedSubscript:v17 + 1];
                [v31 doubleValue];
                double v19 = v18;
                uint64_t v20 = [v30 objectAtIndexedSubscript:v17];
                [v20 doubleValue];
                double v22 = v19 - v21;

                id v7 = v29;
                double v23 = [v30 objectAtIndexedSubscript:v17];
                [v23 doubleValue];
                double v13 = (v14 - (double)v17 / ((double)v5 + -1.0))
                    * v22
                    / ((double)(v17 + 1) / ((double)v5 + -1.0) - (double)v17 / ((double)v5 + -1.0))
                    + v24;
LABEL_15:

                goto LABEL_16;
              }
LABEL_12:
              double v25 = [a1 firstObject];
            }
            double v23 = v25;
            [v25 doubleValue];
            double v13 = v26;
            goto LABEL_15;
          }
        }
LABEL_16:
        double v27 = [NSNumber numberWithDouble:v13];
        [v6 addObject:v27];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  return v6;
}

@end