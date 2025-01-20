@interface FCCKDatabaseQualityOfServiceUpgradingMiddleware
- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5;
@end

@implementation FCCKDatabaseQualityOfServiceUpgradingMiddleware

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  id v5 = a4;
  v6 = [v5 configuration];
  v7 = (void *)[v6 copy];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  if ([v10 qualityOfService] == -1) {
    [v10 setQualityOfService:17];
  }
  [v10 setAutomaticallyRetryNetworkFailures:0];
  [v10 setDiscretionaryNetworkBehavior:0];
  [v5 setConfiguration:v10];

  return 0;
}

@end