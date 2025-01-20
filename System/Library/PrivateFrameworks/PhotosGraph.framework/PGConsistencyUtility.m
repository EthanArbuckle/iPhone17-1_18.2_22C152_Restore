@interface PGConsistencyUtility
+ (BOOL)_doubleValue:(double)a3 isEqualTo:(double)a4 toleranceFactor:(int64_t)a5;
+ (BOOL)properties:(id)a3 areConsistentWithProperties:(id)a4 toleranceFactor:(int64_t)a5;
@end

@implementation PGConsistencyUtility

+ (BOOL)_doubleValue:(double)a3 isEqualTo:(double)a4 toleranceFactor:(int64_t)a5
{
  return vabdd_f64(a3, a4) <= 1.0 / __exp10((double)a5);
}

+ (BOOL)properties:(id)a3 areConsistentWithProperties:(id)a4 toleranceFactor:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 allKeys];
  v9 = [v7 allKeys];
  if ([v8 isEqualToArray:v9])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v29 = v9;
      v30 = v8;
      uint64_t v13 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1D25FED50]();
          v17 = [v6 objectForKeyedSubscript:v15];
          v18 = [v7 objectForKeyedSubscript:v15];
          uint64_t v19 = [v17 dataType];
          uint64_t v20 = [v18 dataType];
          if (v19 == 2 && v20 == 2)
          {
            id v22 = v18;
            [v17 value];
            double v24 = v23;
            [v22 value];
            double v26 = v25;

            if (!+[PGConsistencyUtility _doubleValue:a5 isEqualTo:v24 toleranceFactor:v26])
            {
              v18 = v22;
LABEL_20:
              v9 = v29;
              v8 = v30;

              BOOL v27 = 0;
              goto LABEL_21;
            }
          }
          else if (![v17 isEqual:v18])
          {
            goto LABEL_20;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      BOOL v27 = 1;
      v9 = v29;
      v8 = v30;
    }
    else
    {
      BOOL v27 = 1;
    }
LABEL_21:
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

@end