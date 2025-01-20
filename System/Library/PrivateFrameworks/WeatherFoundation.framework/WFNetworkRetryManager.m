@interface WFNetworkRetryManager
- (BOOL)defaultAPIVersionIsFailingForSettings:(id)a3 failTracker:(id)a4;
- (NSArray)apiVersions;
- (NSArray)failingAPIVersions;
- (NSMutableDictionary)failTrackerDict;
- (NSMutableSet)failingAPIVersionsSet;
- (WFNetworkRetryManager)init;
- (double)lastFailTimeInSecondsForAPIVersion:(id)a3;
- (id)apiVersionForSettings:(id)a3;
- (int)consecutiveFailsForAPIVersion:(id)a3;
- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4;
- (void)requestSuccessForAPIVersion:(id)a3;
@end

@implementation WFNetworkRetryManager

- (WFNetworkRetryManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFNetworkRetryManager;
  v2 = [(WFNetworkRetryManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    failTrackerDict = v2->_failTrackerDict;
    v2->_failTrackerDict = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    failingAPIVersionsSet = v2->_failingAPIVersionsSet;
    v2->_failingAPIVersionsSet = (NSMutableSet *)v5;
  }
  return v2;
}

- (id)apiVersionForSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFNetworkRetryManager *)self failTrackerDict];
  v6 = [v4 apiVersion];
  v7 = [v5 objectForKeyedSubscript:v6];

  if ([(WFNetworkRetryManager *)self defaultAPIVersionIsFailingForSettings:v4 failTracker:v7])
  {
    objc_super v8 = [(WFNetworkRetryManager *)self failingAPIVersionsSet];
    v9 = [v4 apiVersion];
    char v10 = [v8 containsObject:v9];

    if ((v10 & 1) == 0)
    {
      v11 = [v4 apiVersion];

      if (v11)
      {
        v12 = [(WFNetworkRetryManager *)self failingAPIVersionsSet];
        v13 = [v4 apiVersion];
        [v12 addObject:v13];
      }
    }
    uint64_t v14 = [v4 apiVersionFallback];
  }
  else
  {
    v15 = [v4 apiVersion];

    if (v15)
    {
      v16 = [(WFNetworkRetryManager *)self failingAPIVersionsSet];
      v17 = [v4 apiVersion];
      [v16 removeObject:v17];
    }
    uint64_t v14 = [v4 apiVersion];
  }
  v18 = (void *)v14;

  return v18;
}

- (void)requestSuccessForAPIVersion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(WFNetworkRetryManager *)self failTrackerDict];
    [v5 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v9 = v5;
    v6 = [(WFNetworkRetryManager *)self failTrackerDict];
    v7 = [v6 objectForKeyedSubscript:v9];

    if (!v7)
    {
      v7 = objc_opt_new();
      objc_super v8 = [(WFNetworkRetryManager *)self failTrackerDict];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    [v7 incrementFailCount];

    id v5 = v9;
  }
}

- (BOOL)defaultAPIVersionIsFailingForSettings:(id)a3 failTracker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6
    && (int v8 = [v6 numConsecutiveFails],
        [v5 networkFailedAttemptsLimit] < (unint64_t)v8))
  {
    int v9 = [v7 lastFailTimeExpiredForSettings:v5] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSArray)apiVersions
{
  v2 = [(WFNetworkRetryManager *)self failTrackerDict];
  uint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSArray)failingAPIVersions
{
  v2 = [(WFNetworkRetryManager *)self failingAPIVersionsSet];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (int)consecutiveFailsForAPIVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkRetryManager *)self failTrackerDict];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v6 numConsecutiveFails];
  return (int)v4;
}

- (double)lastFailTimeInSecondsForAPIVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNetworkRetryManager *)self failTrackerDict];
  id v6 = [v5 objectForKeyedSubscript:v4];

  [v6 lastFailTimeInSeconds];
  double v8 = v7;

  return v8;
}

- (NSMutableDictionary)failTrackerDict
{
  return self->_failTrackerDict;
}

- (NSMutableSet)failingAPIVersionsSet
{
  return self->_failingAPIVersionsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failingAPIVersionsSet, 0);
  objc_storeStrong((id *)&self->_failTrackerDict, 0);
}

@end