@interface EPMergedRegionScanner
- (BOOL)isObjectSupported:(id)a3;
- (BOOL)processMergedRegion:(id)a3 inWorksheet:(id)a4;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation EPMergedRegionScanner

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v9 = a3;
  v5 = [v9 mergedCells];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = [v5 objectAtIndex:i];
      if (v8) {
        [(EPMergedRegionScanner *)self processMergedRegion:v8 inWorksheet:v9];
      }
    }
  }
}

- (BOOL)processMergedRegion:(id)a3 inWorksheet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 firstRow];
  uint64_t v8 = [v5 lastRow];
  int v9 = [v5 firstColumn];
  int v30 = [v5 lastColumn];
  if ((int)v7 >= (int)v8)
  {
    char v14 = 0;
  }
  else
  {
    id v28 = v6;
    id v29 = v5;
    v10 = [v6 rowBlocks];
    unint64_t v11 = [v10 expectedIndexOfRowBlockForRowNumber:v7];
    unint64_t v12 = [v10 expectedIndexOfRowBlockForRowNumber:v8];
    if (v11 <= v12)
    {
      char v13 = 0;
      do
      {
        v15 = [v10 rowBlockAtIndex:v11];
        v16 = v15;
        if (v15)
        {
          int v17 = [v15 rowCount];
          if (v17)
          {
            uint64_t v18 = 0;
            do
            {
              uint64_t v19 = [v16 rowInfoAtIndex:v18];
              if (v19)
              {
                int v20 = *(_DWORD *)(v19 + 4);
                if (v20 >= (int)v7)
                {
                  if (v20 > (int)v8) {
                    break;
                  }
                  if ((*(unsigned char *)(v19 + 23) & 2) != 0)
                  {
                    *(unsigned char *)(v19 + 23) &= ~2u;
                    char v13 = 1;
                  }
                }
              }
              uint64_t v18 = (v18 + 1);
            }
            while (v17 != v18);
          }
        }

        ++v11;
      }
      while (v11 <= v12);
    }
    else
    {
      char v13 = 0;
    }
    [v10 unlock];

    char v14 = v13 & 1;
    id v6 = v28;
    id v5 = v29;
  }
  if (v9 >= v30) {
    goto LABEL_29;
  }
  v21 = [v6 columnInfos];
  uint64_t v22 = [v21 count];
  if (!v22) {
    goto LABEL_28;
  }
  uint64_t v23 = 0;
  while (1)
  {
    v24 = [v21 objectAtIndex:v23];
    v25 = [v24 range];
    v26 = v25;
    if (v25)
    {
      if (v9 <= (int)[v25 lastColumn]) {
        break;
      }
    }
LABEL_25:

    if (v22 == ++v23) {
      goto LABEL_28;
    }
  }
  if (v30 >= (int)[v26 firstColumn])
  {
    if ([v24 isHidden])
    {
      [v24 setHidden:0];
      char v14 = 1;
    }
    goto LABEL_25;
  }

LABEL_28:
LABEL_29:

  return v14 & 1;
}

@end