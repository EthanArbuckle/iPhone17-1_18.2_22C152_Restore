@interface BMSyncSessionMetricsAggregator
- (BMSyncSessionMetricsAggregator)initWithDatabase:(id)a3 activity:(id)a4;
- (void)compactAndDeleteSessionLogs;
- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3;
- (void)computeAndSendAggregatedMetrics;
- (void)enforceMaxSessionLogPrunePolicy;
@end

@implementation BMSyncSessionMetricsAggregator

- (BMSyncSessionMetricsAggregator)initWithDatabase:(id)a3 activity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSyncSessionMetricsAggregator;
  v9 = [(BMSyncSessionMetricsAggregator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)computeAndSendAggregatedMetrics
{
}

- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3
{
}

- (void)enforceMaxSessionLogPrunePolicy
{
}

- (void)compactAndDeleteSessionLogs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end