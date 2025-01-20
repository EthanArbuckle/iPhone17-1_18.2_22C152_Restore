@interface WBSCloudKitThrottler
+ (BOOL)policyStringRepresentsValidPolicy:(id)a3;
+ (id)_distributionBucketsFromConfiguration:(id)a3;
- (BOOL)_loadDistributionConfiguration:(id)a3;
- (BOOL)_throttlerIsActive;
- (BOOL)permitsOperationWithPriority:(int64_t)a3;
- (WBSCloudKitThrottler)init;
- (WBSCloudKitThrottler)initWithPolicyString:(id)a3;
- (WBSCloudKitThrottlerDataStore)dataStore;
- (double)_currentMinimumTimeIntervalBetweenOperations;
- (double)_minimumTimeBetweenOperationsForOperations:(id)a3;
- (double)_test_numberOfSecondsToMonitor;
- (double)_timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority;
- (double)_timeIntervalUntilOperationShouldBePruned:(id)a3;
- (id)_dateOfNextPermittedOperationAttemptWithNormalPriority;
- (id)dateOfNextPermittedOperationWithPriority:(int64_t)a3;
- (id)description;
- (unint64_t)_test_maximumNumberOfOperationWithinMonitoredPeriod;
- (void)_addOperationAtDate:(id)a3;
- (void)_loadRecordOfPastOperations;
- (void)_pruneExpiredOrInvalidOperations;
- (void)_saveRecordOfPastOperations;
- (void)operationWithPriority:(int64_t)a3 didCompleteWithResult:(int64_t)a4;
- (void)reloadRecordOfPastOperations;
- (void)setDataStore:(id)a3;
@end

@implementation WBSCloudKitThrottler

+ (BOOL)policyStringRepresentsValidPolicy:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _distributionBucketsFromConfiguration:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (WBSCloudKitThrottler)init
{
  return [(WBSCloudKitThrottler *)self initWithPolicyString:0];
}

- (WBSCloudKitThrottler)initWithPolicyString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudKitThrottler;
  BOOL v5 = [(WBSCloudKitThrottler *)&v10 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pastOperationsWithinMonitoredPeriod = v5->_pastOperationsWithinMonitoredPeriod;
    v5->_pastOperationsWithinMonitoredPeriod = v6;

    [(WBSCloudKitThrottler *)v5 setPolicyString:v4];
    v8 = v5;
  }

  return v5;
}

- (void)setDataStore:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataStore, obj);
    [(WBSCloudKitThrottler *)self _loadRecordOfPastOperations];
  }
}

- (BOOL)permitsOperationWithPriority:(int64_t)a3
{
  id v4 = self;
  [(WBSCloudKitThrottler *)self _pruneExpiredOrInvalidOperations];
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [(WBSCloudKitThrottler *)v4 dateOfNextPermittedOperationWithPriority:a3];
  LOBYTE(v4) = [v5 compare:v6] != -1;

  return (char)v4;
}

- (id)dateOfNextPermittedOperationWithPriority:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
    {
      self = [(WBSCloudKitThrottler *)self _dateOfNextPermittedOperationAttemptWithNormalPriority];
    }
  }
  else
  {
    self = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  return self;
}

- (void)operationWithPriority:(int64_t)a3 didCompleteWithResult:(int64_t)a4
{
  BOOL v5 = a4 != 2 && a4 != 4;
  if (a3 != 2 && !v5)
  {
    if (a3 == 1 && [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod count]) {
      [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod removeLastObject];
    }
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [(WBSCloudKitThrottler *)self _addOperationAtDate:v7];

    [(WBSCloudKitThrottler *)self _saveRecordOfPastOperations];
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  throttlingDistribution = self->_throttlingDistribution;
  double numberOfSecondsToMonitor = self->_numberOfSecondsToMonitor;
  unint64_t maximumNumberOfOperationWithinMonitoredPeriod = self->_maximumNumberOfOperationWithinMonitoredPeriod;
  v9 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSCloudKitThrottler *)self _currentMinimumTimeIntervalBetweenOperations];
  uint64_t v11 = v10;
  v12 = [(WBSCloudKitThrottler *)self _dateOfNextPermittedOperationAttemptWithNormalPriority];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; throttlingDistribution = \"%@\"; double numberOfSecondsToMonitor = %lf; maximumNumberOfOperationWithinMonitoredPeriod = %lu>; now = %@; currentMinimumTimeIntervalBetweenOperations = %f; dateOfNextPermittedOperationAttemptWithNormalPriority = %@; pastOperationsWithinMonitoredPeriod = %@",
    v5,
    self,
    throttlingDistribution,
    *(void *)&numberOfSecondsToMonitor,
    maximumNumberOfOperationWithinMonitoredPeriod,
    v9,
    v11,
    v12,
  v13 = self->_pastOperationsWithinMonitoredPeriod);

  return v13;
}

+ (id)_distributionBucketsFromConfiguration:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [v22 componentsSeparatedByString:@" | "];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@":"];
        if ([v8 count] != 2) {
          goto LABEL_18;
        }
        v9 = [v8 objectAtIndexedSubscript:0];
        if (![v9 length])
        {

LABEL_18:
          id v20 = 0;
          goto LABEL_19;
        }
        uint64_t v10 = [v8 objectAtIndexedSubscript:1];
        BOOL v11 = [v10 length] == 0;

        if (v11) {
          goto LABEL_18;
        }
        v12 = [v8 objectAtIndexedSubscript:0];
        uint64_t v13 = [v12 integerValue];

        v14 = [v8 objectAtIndexedSubscript:1];
        uint64_t v15 = [v14 integerValue];

        if (v13 < 1 || v15 < 1) {
          goto LABEL_18;
        }
        v27[0] = @"numberOfOperations";
        v16 = [NSNumber numberWithInteger:v13];
        v27[1] = @"minimumTimeIntervalBetweenOperations";
        v28[0] = v16;
        v17 = [NSNumber numberWithDouble:(double)v15 * 60.0];
        v28[1] = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
        [v3 addObject:v18];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if ([v3 count]) {
    v19 = v3;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;
LABEL_19:

  return v20;
}

- (BOOL)_throttlerIsActive
{
  return self->_pastOperationsWithinMonitoredPeriod != 0;
}

- (BOOL)_loadDistributionConfiguration:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v21 = self;
  id v4 = [(id)objc_opt_class() _distributionBucketsFromConfiguration:v20];
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v4;
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v12 = [v11 objectForKeyedSubscript:@"numberOfOperations"];
          unint64_t v13 = [v12 unsignedIntegerValue];

          v14 = [v11 objectForKeyedSubscript:@"minimumTimeIntervalBetweenOperations"];
          [v14 doubleValue];
          double v16 = v15;

          v6 += v13;
          double v9 = v9 + v16 * (double)v13;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    objc_storeStrong((id *)&v21->_throttlingDistribution, obj);
    v21->_double numberOfSecondsToMonitor = v9;
    v21->_unint64_t maximumNumberOfOperationWithinMonitoredPeriod = v6;
    id v4 = obj;
  }
  BOOL v17 = v4 != 0;

  return v17;
}

- (id)_dateOfNextPermittedOperationAttemptWithNormalPriority
{
  id v3 = [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod firstObject];
  if (v3)
  {
    [(WBSCloudKitThrottler *)self _timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority];
    objc_msgSend(v3, "dateByAddingTimeInterval:");
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] distantPast];
  id v4 = };

  return v4;
}

- (double)_timeIntervalUntilNextPermittedOperationAttemptWithNormalPriority
{
  for (uint64_t i = self->_pastOperationsWithinMonitoredPeriod;
        ;
        [(NSMutableArray *)i removeLastObject])
  {
    [(WBSCloudKitThrottler *)self _minimumTimeBetweenOperationsForOperations:i];
    double v5 = v4;
    unint64_t v6 = [(NSMutableArray *)i lastObject];
    [(WBSCloudKitThrottler *)self _timeIntervalUntilOperationShouldBePruned:v6];
    double v8 = v7;

    if (v5 <= v8) {
      break;
    }
    if (i == self->_pastOperationsWithinMonitoredPeriod)
    {
      uint64_t v9 = [(NSMutableArray *)i mutableCopy];

      uint64_t i = (NSMutableArray *)v9;
    }
  }

  return v5;
}

- (double)_timeIntervalUntilOperationShouldBePruned:(id)a3
{
  id v4 = a3;
  double numberOfSecondsToMonitor = self->_numberOfSecondsToMonitor;
  unint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:v6];
  double v8 = numberOfSecondsToMonitor - v7;

  return v8;
}

- (double)_minimumTimeBetweenOperationsForOperations:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = self->_throttlingDistribution;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"numberOfOperations", (void)v17);
        uint64_t v12 = [v11 unsignedIntegerValue];

        v7 += v12;
        if (v4 < v7)
        {
          v14 = [v10 objectForKeyedSubscript:@"minimumTimeIntervalBetweenOperations"];
          [v14 doubleValue];
          double v13 = v15;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  double v13 = 1.79769313e308;
LABEL_11:

  return v13;
}

- (double)_currentMinimumTimeIntervalBetweenOperations
{
  [(WBSCloudKitThrottler *)self _minimumTimeBetweenOperationsForOperations:self->_pastOperationsWithinMonitoredPeriod];
  return result;
}

- (void)_pruneExpiredOrInvalidOperations
{
  uint64_t v3 = [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod count];
  if (v3)
  {
    uint64_t v4 = v3;
    double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_numberOfSecondsToMonitor];
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __56__WBSCloudKitThrottler__pruneExpiredOrInvalidOperations__block_invoke;
    v14 = &unk_1E615AA38;
    id v8 = v5;
    id v15 = v8;
    id v9 = v6;
    id v16 = v9;
    uint64_t v10 = [(NSMutableArray *)pastOperationsWithinMonitoredPeriod indexesOfObjectsPassingTest:&v11];
    -[NSMutableArray removeObjectsAtIndexes:](self->_pastOperationsWithinMonitoredPeriod, "removeObjectsAtIndexes:", v10, v11, v12, v13, v14);
    if ([(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod count] != v4) {
      [(WBSCloudKitThrottler *)self _saveRecordOfPastOperations];
    }
  }
}

BOOL __56__WBSCloudKitThrottler__pruneExpiredOrInvalidOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) compare:v3];
  uint64_t v5 = [v3 compare:*(void *)(a1 + 40)];
  BOOL v7 = v4 != -1 || v5 == 1;

  return v7;
}

- (void)_addOperationAtDate:(id)a3
{
  id v6 = a3;
  while (1)
  {
    uint64_t v4 = [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod firstObject];
    uint64_t v5 = v4;
    if (!v4 || [v4 compare:v6] == -1) {
      break;
    }
    [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_pastOperationsWithinMonitoredPeriod insertObject:v6 atIndex:0];
}

- (void)_loadRecordOfPastOperations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  uint64_t v4 = [WeakRetained recordOfPastOperationsForThrottler:self];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:1 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
      self->_pastOperationsWithinMonitoredPeriod = v6;

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(WBSCloudKitThrottler *)self _addOperationAtDate:v12];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)_saveRecordOfPastOperations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_pastOperationsWithinMonitoredPeriod format:200 options:0 error:0];
    [v5 setRecordOfPastOperations:v4 forThrottler:self];

    id WeakRetained = v5;
  }
}

- (void)reloadRecordOfPastOperations
{
  id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pastOperationsWithinMonitoredPeriod = self->_pastOperationsWithinMonitoredPeriod;
  self->_pastOperationsWithinMonitoredPeriod = v3;

  [(WBSCloudKitThrottler *)self _loadRecordOfPastOperations];
}

- (double)_test_numberOfSecondsToMonitor
{
  return self->_numberOfSecondsToMonitor;
}

- (unint64_t)_test_maximumNumberOfOperationWithinMonitoredPeriod
{
  return self->_maximumNumberOfOperationWithinMonitoredPeriod;
}

- (WBSCloudKitThrottlerDataStore)dataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  return (WBSCloudKitThrottlerDataStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStore);
  objc_storeStrong((id *)&self->_throttlingDistribution, 0);
  objc_storeStrong((id *)&self->_pastOperationsWithinMonitoredPeriod, 0);
}

@end