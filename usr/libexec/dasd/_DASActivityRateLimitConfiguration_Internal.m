@interface _DASActivityRateLimitConfiguration_Internal
+ (id)rateLimitConfiguration:(id)a3 withIdentifier:(id)a4;
- (BOOL)containsPendingActivity:(id)a3;
- (BOOL)isInactiveAtDate:(id)a3;
- (NSMutableArray)ratelimitTrackers;
- (NSMutableSet)pendingActivities;
- (NSString)configurationName;
- (NSString)uniqueGroupName;
- (_DASActivityRateLimitConfiguration_Internal)initWithConfigurationName:(id)a3 andIdentifier:(id)a4;
- (_DASActivityRateLimitConfiguration_Internal)initWithRateLimit:(id)a3 withIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)evaluationResultsWithLPMState:(BOOL)a3;
- (void)addPendingActivity:(id)a3;
- (void)executeActivity:(id)a3 atDate:(id)a4;
- (void)removePendingActivity:(id)a3;
- (void)replaceRateLimitConfiguration:(id)a3;
- (void)setConfigurationName:(id)a3;
- (void)setPendingActivities:(id)a3;
- (void)setRatelimitTrackers:(id)a3;
- (void)setUniqueGroupName:(id)a3;
@end

@implementation _DASActivityRateLimitConfiguration_Internal

+ (id)rateLimitConfiguration:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithRateLimit:v6 withIdentifier:v5];

  return v7;
}

- (_DASActivityRateLimitConfiguration_Internal)initWithRateLimit:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_DASActivityRateLimitConfiguration_Internal;
  v8 = [(_DASActivityRateLimitConfiguration_Internal *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uniqueGroupName, a4);
    uint64_t v10 = [v6 name];
    configurationName = v9->_configurationName;
    v9->_configurationName = (NSString *)v10;

    uint64_t v12 = +[NSMutableArray array];
    ratelimitTrackers = v9->_ratelimitTrackers;
    v9->_ratelimitTrackers = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableSet set];
    pendingActivities = v9->_pendingActivities;
    v9->_pendingActivities = (NSMutableSet *)v14;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = [v6 rateLimits];
    id v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_DASActivityRateLimitTracker alloc] initWithRateLimit:*(void *)(*((void *)&v23 + 1) + 8 * (void)v20)];
          [(NSMutableArray *)v9->_ratelimitTrackers addObject:v21];

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v18);
    }
  }
  return v9;
}

- (_DASActivityRateLimitConfiguration_Internal)initWithConfigurationName:(id)a3 andIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_DASActivityRateLimitConfiguration_Internal;
  v9 = [(_DASActivityRateLimitConfiguration_Internal *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueGroupName, a4);
    objc_storeStrong((id *)&v10->_configurationName, a3);
    uint64_t v11 = +[NSMutableArray array];
    ratelimitTrackers = v10->_ratelimitTrackers;
    v10->_ratelimitTrackers = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMutableSet set];
    pendingActivities = v10->_pendingActivities;
    v10->_pendingActivities = (NSMutableSet *)v13;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(_DASActivityRateLimitConfiguration_Internal *)self configurationName];
  id v6 = [(_DASActivityRateLimitConfiguration_Internal *)self uniqueGroupName];
  id v7 = [v4 initWithConfigurationName:v5 andIdentifier:v6];

  id v8 = [(_DASActivityRateLimitConfiguration_Internal *)self ratelimitTrackers];
  [v7 setRatelimitTrackers:v8];

  v9 = [(_DASActivityRateLimitConfiguration_Internal *)self pendingActivities];
  [v7 setPendingActivities:v9];

  return v7;
}

- (id)description
{
  uniqueGroupName = self->_uniqueGroupName;
  configurationName = self->_configurationName;
  id v4 = [(NSMutableArray *)self->_ratelimitTrackers description];
  id v5 = +[NSString stringWithFormat:@"Unique Group Name: %@, Configuration Name %@, Rate Limits %@", uniqueGroupName, configurationName, v4];

  return v5;
}

- (BOOL)isInactiveAtDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivityRateLimitConfiguration_Internal *)self pendingActivities];
  id v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(_DASActivityRateLimitConfiguration_Internal *)self ratelimitTrackers];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (![*(id *)(*((void *)&v14 + 1) + 8 * i) onlyExpiredOccurrencesAtDate:v4])
          {
            BOOL v7 = 0;
            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 1;
LABEL_13:
  }
  return v7;
}

- (void)replaceRateLimitConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = self->_ratelimitTrackers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v10) occurrences];
        [v5 addObjectsFromArray:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v4 name];
  configurationName = self->_configurationName;
  self->_configurationName = v12;

  long long v14 = +[NSMutableArray array];
  ratelimitTrackers = self->_ratelimitTrackers;
  self->_ratelimitTrackers = v14;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v16 = [v4 rateLimits];
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [[_DASActivityRateLimitTracker alloc] initWithRateLimit:*(void *)(*((void *)&v22 + 1) + 8 * (void)v20) andOccurrences:v5];
        [(NSMutableArray *)self->_ratelimitTrackers addObject:v21];

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (id)evaluationResultsWithLPMState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = +[NSDate now];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [(_DASActivityRateLimitConfiguration_Internal *)self ratelimitTrackers];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  uint64_t v9 = v6;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    uint64_t v9 = v6;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v13 window];
        BOOL v15 = v14 == 900.0 && [v13 maximum] == (id)1;
        uint64_t v16 = v15 & v3;
        if (([v13 timewiseEligibleAtDate:v6 withLPMWindowExtension:v16] & 1) == 0)
        {
          [v5 addObject:v13];
          id v17 = [v13 nextTimewiseEligibleDateFromDate:v6 withLPMWindowExtension:v16];
          uint64_t v18 = [v9 laterDate:v17];

          uint64_t v9 = (void *)v18;
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v19 = +[_DASRateLimitEvaluationResults evaluationResultsWithMaxedRateLimits:v5 withNextEvaluationDate:v9];

  return v19;
}

- (void)executeActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(_DASActivityRateLimitConfiguration_Internal *)self ratelimitTrackers];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) executeAtDate:v7];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ([(_DASActivityRateLimitConfiguration_Internal *)self containsPendingActivity:v6]) {
    [(_DASActivityRateLimitConfiguration_Internal *)self removePendingActivity:v6];
  }
}

- (void)addPendingActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivityRateLimitConfiguration_Internal *)self pendingActivities];
  [v5 addObject:v4];
}

- (void)removePendingActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivityRateLimitConfiguration_Internal *)self pendingActivities];
  [v5 removeObject:v4];
}

- (BOOL)containsPendingActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASActivityRateLimitConfiguration_Internal *)self pendingActivities];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (NSMutableArray)ratelimitTrackers
{
  return self->_ratelimitTrackers;
}

- (void)setRatelimitTrackers:(id)a3
{
}

- (NSString)uniqueGroupName
{
  return self->_uniqueGroupName;
}

- (void)setUniqueGroupName:(id)a3
{
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (void)setConfigurationName:(id)a3
{
}

- (NSMutableSet)pendingActivities
{
  return self->_pendingActivities;
}

- (void)setPendingActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActivities, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_uniqueGroupName, 0);

  objc_storeStrong((id *)&self->_ratelimitTrackers, 0);
}

@end