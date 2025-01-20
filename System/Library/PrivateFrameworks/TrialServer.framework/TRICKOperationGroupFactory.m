@interface TRICKOperationGroupFactory
+ (id)groupForBMLTId:(id)a3;
+ (id)groupForDownloadOptions:(id)a3;
+ (id)groupForExperimentId:(id)a3;
+ (id)groupForRolloutId:(id)a3;
+ (id)groupForScheduledFetch;
+ (id)groupForUserInitiatedFetch;
@end

@implementation TRICKOperationGroupFactory

+ (id)groupForExperimentId:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)[[NSString alloc] initWithFormat:@"experiment-%@", v3];

  [v4 setName:v5];
  return v4;
}

+ (id)groupForRolloutId:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)[[NSString alloc] initWithFormat:@"rollout-%@", v3];

  [v4 setName:v5];
  return v4;
}

+ (id)groupForBMLTId:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)[[NSString alloc] initWithFormat:@"bmlt-%@", v3];

  [v4 setName:v5];
  return v4;
}

+ (id)groupForDownloadOptions:(id)a3
{
  v4 = [a3 activity];

  if (v4) {
    [a1 groupForScheduledFetch];
  }
  else {
  v5 = [a1 groupForUserInitiatedFetch];
  }
  return v5;
}

+ (id)groupForScheduledFetch
{
  v2 = objc_opt_new();
  [v2 setName:@"Periodic"];
  return v2;
}

+ (id)groupForUserInitiatedFetch
{
  v2 = objc_opt_new();
  [v2 setName:@"UserActionExplicit"];
  return v2;
}

@end