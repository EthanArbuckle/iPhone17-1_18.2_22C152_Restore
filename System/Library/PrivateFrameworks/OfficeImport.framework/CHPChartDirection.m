@interface CHPChartDirection
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPChartDirection

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  BOOL v6 = 0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 chart];
      int v5 = [v4 direction];

      if (!v5) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v24 = a3;
  v4 = [v24 seriesCollection];
  int v5 = [v24 chart];
  if ([v4 count])
  {
    BOOL v6 = [v4 objectAtIndex:0];
    v7 = [v6 valueData];
    v8 = v7;
    if (!v7)
    {
      uint64_t v14 = 0;
LABEL_31:
      [v5 setDirection:v14];

      goto LABEL_32;
    }
    v9 = [v7 formula];
    v10 = [v9 references];

    if (!v10 || ![v10 count])
    {
      uint64_t v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v11 = [v10 objectAtIndex:0];
    int v12 = [v11 firstRow];
    if (v12 < (int)[v11 lastRow]
      && (int v13 = [v11 firstColumn], v13 == objc_msgSend(v11, "lastColumn")))
    {
      uint64_t v14 = 2;
    }
    else
    {
      int v15 = [v11 firstRow];
      if (v15 == [v11 lastRow])
      {
        int v16 = [v11 firstColumn];
        if (v16 == [v11 lastColumn])
        {
          if ((unint64_t)[v10 count] < 2)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v14 = 0;
                goto LABEL_29;
              }
            }
            v17 = [v6 categoryData];
            v19 = [v17 formula];
            v20 = [v19 references];

            if (v20 && [v20 count])
            {
              v21 = [v20 objectAtIndex:0];
              int v22 = [v11 firstRow];
              if (v22 == [v21 firstRow])
              {
                uint64_t v14 = 2;
              }
              else
              {
                int v23 = [v11 firstColumn];
                uint64_t v14 = v23 == [v21 firstColumn];
              }
            }
            else
            {
              uint64_t v14 = 0;
            }
          }
          else
          {
            v17 = [v10 objectAtIndex:1];
            int v18 = [v17 firstRow];
            if (v18 >= (int)[v11 lastRow]) {
              uint64_t v14 = 1;
            }
            else {
              uint64_t v14 = 2;
            }
          }

          goto LABEL_29;
        }
      }
      uint64_t v14 = 1;
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:
}

@end