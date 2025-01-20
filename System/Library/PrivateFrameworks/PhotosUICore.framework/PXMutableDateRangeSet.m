@interface PXMutableDateRangeSet
- (BOOL)_attemptToAddDateRange:(id)a3 outNextRange:(id *)a4;
- (void)addDateRange:(id)a3;
- (void)removeAllDateRanges;
@end

@implementation PXMutableDateRangeSet

- (void)removeAllDateRanges
{
  id v2 = [(PXDateRangeSet *)self _dateRanges];
  [v2 removeAllObjects];
}

- (BOOL)_attemptToAddDateRange:(id)a3 outNextRange:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PXDateRangeSet.m" lineNumber:142 description:@"outNextAttempt required"];
  }
  [(PXDateRangeSet *)self _dateRanges];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      uint64_t v13 = 0;
      unint64_t v14 = v11 + v10;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
        if (objc_msgSend(v7, "intersectsRange:", v15, (void)v31))
        {

          v16 = [v8 objectAtIndex:v11 + v13];
          [v8 removeObjectAtIndex:v11 + v13];
          [v7 startDate];
          double v18 = v17;
          [v16 startDate];
          if (v18 <= v19) {
            v20 = v7;
          }
          else {
            v20 = v16;
          }
          [v20 startDate];
          double v22 = v21;
          [v7 endDate];
          double v24 = v23;
          [v16 endDate];
          if (v24 >= v25) {
            v26 = v7;
          }
          else {
            v26 = v16;
          }
          [v26 endDate];
          *a4 = [[PXDateRange alloc] initWithStartDate:v22 endDate:v27];

          BOOL v28 = 0;
          goto LABEL_26;
        }
        if ([v7 isStrictlyBeforeRange:v15])
        {
          unint64_t v14 = v11 + v13;
          goto LABEL_22;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      unint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_22:

  if (v14 >= [v8 count]) {
    [v8 addObject:v7];
  }
  else {
    [v8 insertObject:v7 atIndex:v14];
  }
  BOOL v28 = 1;
LABEL_26:

  return v28;
}

- (void)addDateRange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  do
  {
    v6 = v5;
    id v8 = 0;
    BOOL v7 = [(PXMutableDateRangeSet *)self _attemptToAddDateRange:v5 outNextRange:&v8];
    id v5 = v8;
  }
  while (!v7);
}

@end