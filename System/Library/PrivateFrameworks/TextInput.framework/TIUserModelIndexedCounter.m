@interface TIUserModelIndexedCounter
- (NSArray)counts;
- (NSArray)currentCounts;
- (NSNumber)aggregatedCount;
- (NSString)name;
- (TIUserModelIndexedCounter)initWithName:(id)a3;
- (id)_createEmptyCountsArray;
- (id)aggregatedCountForNumberOfDays:(int)a3;
- (id)countsForNumberOfDays:(int)a3;
- (int)bucketCount;
- (int)dataType;
- (int)days;
- (void)doPersist:(id)a3 forDate:(id)a4 forContext:(id)a5;
- (void)extendToNumberOfDays:(int)a3;
- (void)prepareBuckets;
- (void)updateWithDouble:(double)a3 forIndex:(int)a4;
- (void)updateWithInteger:(int)a3 forIndex:(int)a4;
- (void)updateWithLoadedInteger:(int)a3 andDouble:(double)a4 forIndex:(int)a5 andDaysPrior:(int)a6;
@end

@implementation TIUserModelIndexedCounter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_current, 0);

  objc_storeStrong((id *)&self->_persisted, 0);
}

- (int)dataType
{
  return self->_dataType;
}

- (NSString)name
{
  return self->_name;
}

- (void)doPersist:(id)a3 forDate:(id)a4 forContext:(id)a5
{
  id v44 = a3;
  id v43 = a4;
  id v8 = a5;
  if (self->_current && self->_dataType)
  {
    id v45 = 0;
    v42 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v45];
    id v39 = v45;
    v41 = [(id)kUserModelDatabasePrefix stringByAppendingString:self->_name];
    v9 = [(NSMutableArray *)self->_persisted objectAtIndex:0];
    uint64_t v10 = 0;
    unint64_t v11 = 0x1E4F28000uLL;
    while (1)
    {
      v12 = [(NSMutableArray *)self->_current objectAtIndex:v10];
      v13 = v12;
      if (self->_dataType == 2)
      {
        [v12 doubleValue];
        if (v14 != 0.0)
        {
          double v15 = v14;
          v16 = [*(id *)(v11 + 3792) numberWithInt:0];
          v17 = [*(id *)(v11 + 3792) numberWithInt:v10];
          v18 = [*(id *)(v11 + 3792) numberWithDouble:v15];
          v19 = [v8 inputLanguageAndRegion];
          [v44 addValue:v16 andSecondaryValue:v17 andRealValue:v18 andProperties:v42 forKey:v41 forInputMode:v19 forDate:v43];

          v20 = [v9 objectAtIndex:v10];
          [v20 doubleValue];
          double v22 = v21;

          v23 = *(void **)(v11 + 3792);
          double v24 = v15 + v22;
LABEL_9:
          v36 = [v23 numberWithDouble:v24];
          [v9 setObject:v36 atIndexedSubscript:v10];

          current = self->_current;
          v38 = [*(id *)(v11 + 3792) numberWithInt:0];
          [(NSMutableArray *)current setObject:v38 atIndexedSubscript:v10];
        }
      }
      else
      {
        uint64_t v25 = [v12 intValue];
        if (v25)
        {
          int v26 = v25;
          v27 = [*(id *)(v11 + 3792) numberWithInt:v25];
          v28 = [*(id *)(v11 + 3792) numberWithInt:v10];
          v29 = [*(id *)(v11 + 3792) numberWithDouble:0.0];
          [v8 inputLanguageAndRegion];
          v40 = v13;
          v30 = self;
          unint64_t v31 = v11;
          v32 = v9;
          v34 = id v33 = v8;
          [v44 addValue:v27 andSecondaryValue:v28 andRealValue:v29 andProperties:v42 forKey:v41 forInputMode:v34 forDate:v43];

          id v8 = v33;
          v9 = v32;
          unint64_t v11 = v31;
          self = v30;
          v13 = v40;

          v35 = [v9 objectAtIndex:v10];
          LODWORD(v28) = [v35 intValue];

          v23 = *(void **)(v11 + 3792);
          double v24 = (double)((int)v28 + v26);
          goto LABEL_9;
        }
      }

      if (++v10 == 11)
      {

        break;
      }
    }
  }
}

- (id)_createEmptyCountsArray
{
  v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
  for (uint64_t i = 0; i != 11; ++i)
  {
    v4 = [NSNumber numberWithInt:0];
    [v2 setObject:v4 atIndexedSubscript:i];
  }

  return v2;
}

- (void)updateWithLoadedInteger:(int)a3 andDouble:(double)a4 forIndex:(int)a5 andDaysPrior:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(TIUserModelIndexedCounter *)self prepareBuckets];
  if (v9 || a4 != 0.0)
  {
    if (v9)
    {
      self->_dataType = 1;
      unint64_t v11 = [(NSMutableArray *)self->_persisted objectAtIndex:(int)v6];
      v12 = [v11 objectAtIndex:(int)v7];
      uint64_t v13 = [v12 intValue];

      double v14 = [NSNumber numberWithInt:(v13 + v9)];
      [v11 setObject:v14 atIndexedSubscript:(int)v7];

      double v15 = IXADefaultLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = NSString;
        v17 = [(TIUserModelIndexedCounter *)self name];
        v18 = [v16 stringWithFormat:@"%s Loaded indexed counter %@: Added %d to %d at index %d for %d days prior. _persisted: %@", "-[TIUserModelIndexedCounter updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:]", v17, v9, v13, v7, v6, self->_persisted];
        *(_DWORD *)buf = 138412290;
        int v26 = v18;
        _os_log_debug_impl(&dword_18D240000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

LABEL_10:
      }
    }
    else
    {
      self->_dataType = 2;
      unint64_t v11 = [(NSMutableArray *)self->_persisted objectAtIndex:(int)v6];
      v19 = [v11 objectAtIndex:(int)v7];
      [v19 doubleValue];
      double v21 = v20;

      double v22 = [NSNumber numberWithDouble:v21 + a4];
      [v11 setObject:v22 atIndexedSubscript:(int)v7];

      double v15 = IXADefaultLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v23 = NSString;
        double v24 = [(TIUserModelIndexedCounter *)self name];
        v18 = [v23 stringWithFormat:@"%s Loaded indexed counter %@: Added %f to %f at index %d for %d days prior. _persisted: %@", "-[TIUserModelIndexedCounter updateWithLoadedInteger:andDouble:forIndex:andDaysPrior:]", v24, *(void *)&a4, *(void *)&v21, v7, v6, self->_persisted];
        *(_DWORD *)buf = 138412290;
        int v26 = v18;
        _os_log_debug_impl(&dword_18D240000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_10;
      }
    }
  }
}

- (void)updateWithDouble:(double)a3 forIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(TIUserModelIndexedCounter *)self prepareBuckets];
  self->_dataType = 2;
  uint64_t v7 = [(NSMutableArray *)self->_current objectAtIndex:(int)v4];
  [v7 doubleValue];
  double v9 = v8;

  current = self->_current;
  unint64_t v11 = [NSNumber numberWithDouble:v9 + a3];
  [(NSMutableArray *)current setObject:v11 atIndexedSubscript:(int)v4];

  v12 = IXADefaultLogFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = NSString;
    double v14 = [(TIUserModelIndexedCounter *)self name];
    double v15 = [v13 stringWithFormat:@"%s Updated indexed counter %@: Added %f to %f at index %d. _current: %@", "-[TIUserModelIndexedCounter updateWithDouble:forIndex:]", v14, *(void *)&a3, *(void *)&v9, v4, self->_current];
    *(_DWORD *)buf = 138412290;
    v17 = v15;
    _os_log_debug_impl(&dword_18D240000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)updateWithInteger:(int)a3 forIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(TIUserModelIndexedCounter *)self prepareBuckets];
  self->_dataType = 1;
  uint64_t v7 = [(NSMutableArray *)self->_current objectAtIndex:(int)v4];
  uint64_t v8 = [v7 intValue];

  current = self->_current;
  uint64_t v10 = [NSNumber numberWithDouble:(double)((int)v8 + (int)v5)];
  [(NSMutableArray *)current setObject:v10 atIndexedSubscript:(int)v4];

  unint64_t v11 = IXADefaultLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = NSString;
    uint64_t v13 = [(TIUserModelIndexedCounter *)self name];
    double v14 = [v12 stringWithFormat:@"%s Updated indexed counter %@: Added %d to %d at index %d. _current: %@", "-[TIUserModelIndexedCounter updateWithInteger:forIndex:]", v13, v5, v8, v4, self->_current];
    *(_DWORD *)buf = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_18D240000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)extendToNumberOfDays:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(TIUserModelIndexedCounter *)self prepareBuckets];
  uint64_t v5 = [(NSMutableArray *)self->_persisted count];
  uint64_t v6 = v5;
  if ((int)v5 < (int)v3)
  {
    int v7 = v5;
    do
    {
      persisted = self->_persisted;
      double v9 = [(TIUserModelIndexedCounter *)self _createEmptyCountsArray];
      [(NSMutableArray *)persisted addObject:v9];

      ++v7;
    }
    while (v3 != v7);
    uint64_t v10 = IXADefaultLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v11 = NSString;
      v12 = [(TIUserModelIndexedCounter *)self name];
      uint64_t v13 = [v11 stringWithFormat:@"%s Extended indexed counter %@ from %d to %d days", "-[TIUserModelIndexedCounter extendToNumberOfDays:]", v12, v6, v3];
      *(_DWORD *)buf = 138412290;
      double v15 = v13;
      _os_log_debug_impl(&dword_18D240000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (id)aggregatedCountForNumberOfDays:(int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  current = self->_current;
  if (self->_dataType == 2)
  {
    if (current)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v4 = [(TIUserModelIndexedCounter *)self countsForNumberOfDays:*(void *)&a3];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v24;
        double v8 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v24 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) doubleValue];
            double v8 = v8 + v10;
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v6);
      }
      else
      {
        double v8 = 0.0;
      }
    }
    else
    {
      double v8 = 0.0;
    }
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithDouble:", *(void *)&a3, v8);
  }
  else
  {
    if (current)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      unint64_t v11 = -[TIUserModelIndexedCounter countsForNumberOfDays:](self, "countsForNumberOfDays:", *(void *)&a3, 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        LODWORD(v14) = 0;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v14 = [*(id *)(*((void *)&v19 + 1) + 8 * j) intValue] + v14;
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v13);
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v17 = [NSNumber numberWithInt:v14];
  }

  return v17;
}

- (NSNumber)aggregatedCount
{
  return (NSNumber *)[(TIUserModelIndexedCounter *)self aggregatedCountForNumberOfDays:1];
}

- (id)countsForNumberOfDays:(int)a3
{
  [(TIUserModelIndexedCounter *)self prepareBuckets];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
  if (self->_dataType == 2)
  {
    for (uint64_t i = 0; i != 11; ++i)
    {
      uint64_t v7 = [(NSMutableArray *)self->_current objectAtIndex:i];
      [v7 doubleValue];
      double v9 = v8;

      if (a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          unint64_t v11 = [(NSMutableArray *)self->_persisted objectAtIndex:v10];
          uint64_t v12 = [v11 objectAtIndex:i];
          [v12 doubleValue];
          double v9 = v9 + v13;

          ++v10;
        }
        while (a3 != v10);
      }
      uint64_t v14 = [NSNumber numberWithDouble:v9];
      [v5 setObject:v14 atIndexedSubscript:i];
    }
  }
  else
  {
    for (uint64_t j = 0; j != 11; ++j)
    {
      uint64_t v16 = [(NSMutableArray *)self->_current objectAtIndex:j];
      uint64_t v17 = [v16 intValue];

      if (a3 >= 1)
      {
        uint64_t v18 = 0;
        do
        {
          long long v19 = [(NSMutableArray *)self->_persisted objectAtIndex:v18];
          long long v20 = [v19 objectAtIndex:j];
          uint64_t v17 = [v20 intValue] + v17;

          ++v18;
        }
        while (a3 != v18);
      }
      long long v21 = [NSNumber numberWithInt:v17];
      [v5 setObject:v21 atIndexedSubscript:j];
    }
  }

  return v5;
}

- (NSArray)counts
{
  return (NSArray *)[(TIUserModelIndexedCounter *)self countsForNumberOfDays:1];
}

- (NSArray)currentCounts
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
  if (self->_dataType == 2)
  {
    for (uint64_t i = 0; i != 11; ++i)
    {
      current = self->_current;
      uint64_t v6 = NSNumber;
      if (current)
      {
        uint64_t v7 = [(NSMutableArray *)current objectAtIndex:i];
        [v7 doubleValue];
        double v8 = objc_msgSend(v6, "numberWithDouble:");
        [v3 setObject:v8 atIndexedSubscript:i];
      }
      else
      {
        uint64_t v7 = [NSNumber numberWithDouble:0.0];
        [v3 setObject:v7 atIndexedSubscript:i];
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != 11; ++j)
    {
      uint64_t v10 = self->_current;
      unint64_t v11 = NSNumber;
      if (v10)
      {
        uint64_t v12 = [(NSMutableArray *)v10 objectAtIndex:j];
        double v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
        [v3 setObject:v13 atIndexedSubscript:j];
      }
      else
      {
        uint64_t v12 = [NSNumber numberWithInt:0];
        [v3 setObject:v12 atIndexedSubscript:j];
      }
    }
  }

  return (NSArray *)v3;
}

- (int)days
{
  return [(NSMutableArray *)self->_persisted count];
}

- (void)prepareBuckets
{
  if (!self->_current)
  {
    uint64_t v3 = [(TIUserModelIndexedCounter *)self _createEmptyCountsArray];
    current = self->_current;
    self->_current = v3;

    uint64_t v5 = (NSMutableArray *)objc_opt_new();
    persisted = self->_persisted;
    self->_persisted = v5;

    uint64_t v7 = self->_persisted;
    id v8 = [(TIUserModelIndexedCounter *)self _createEmptyCountsArray];
    [(NSMutableArray *)v7 addObject:v8];
  }
}

- (int)bucketCount
{
  return 11;
}

- (TIUserModelIndexedCounter)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIUserModelIndexedCounter;
  uint64_t v6 = [(TIUserModelIndexedCounter *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_dataType = 0;
  }

  return v7;
}

@end