@interface NTPBTelemetryNetworkEventGroup(FCNetworkBehaviorMonitorAdditions)
- (FCNetworkEventStats)connectDurationStats;
- (FCNetworkEventStats)dnsDurationStats;
- (FCNetworkEventStats)timeToFirstByteStats;
- (FCNetworkEventStats)totalDurationStats;
- (id)endDate;
- (id)startDate;
- (uint64_t)cacheHitCount;
- (uint64_t)cacheMissCount;
@end

@implementation NTPBTelemetryNetworkEventGroup(FCNetworkBehaviorMonitorAdditions)

- (id)startDate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [a1 successes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) startTime];
        if (v8 < v6) {
          unint64_t v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = objc_msgSend(a1, "failures", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * j) startTime];
        if (v14 < v6) {
          unint64_t v6 = v14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", v6);
  return v15;
}

- (id)endDate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [a1 successes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) startTime];
        if (v8 > v5) {
          unint64_t v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = objc_msgSend(a1, "failures", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * j) startTime];
        if (v14 > v5) {
          unint64_t v5 = v14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "fc_dateWithMillisecondTimeIntervalSince1970:", v5);
  return v15;
}

- (FCNetworkEventStats)totalDurationStats
{
  v1 = [a1 successes];
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_314);

  uint64_t v3 = [[FCNetworkEventStats alloc] initWithValues:v2];
  return v3;
}

- (FCNetworkEventStats)dnsDurationStats
{
  v1 = [a1 successes];
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_317);

  uint64_t v3 = [[FCNetworkEventStats alloc] initWithValues:v2];
  return v3;
}

- (FCNetworkEventStats)connectDurationStats
{
  v1 = [a1 successes];
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_319);

  uint64_t v3 = [[FCNetworkEventStats alloc] initWithValues:v2];
  return v3;
}

- (FCNetworkEventStats)timeToFirstByteStats
{
  v1 = [a1 successes];
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_321);

  uint64_t v3 = [[FCNetworkEventStats alloc] initWithValues:v2];
  return v3;
}

- (uint64_t)cacheHitCount
{
  v1 = [a1 successes];
  uint64_t v2 = objc_msgSend(v1, "fc_countOfObjectsPassingTest:", &__block_literal_global_324);

  return v2;
}

- (uint64_t)cacheMissCount
{
  v1 = [a1 successes];
  uint64_t v2 = objc_msgSend(v1, "fc_countOfObjectsPassingTest:", &__block_literal_global_326);

  return v2;
}

@end