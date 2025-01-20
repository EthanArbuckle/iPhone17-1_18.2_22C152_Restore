@interface REActivityRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (REActivityRelevanceProviderManager)initWithQueue:(id)a3;
- (float)activeEnergy;
- (float)exerciseTime;
- (float)standHour;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (void)_prepareForUpdate;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation REActivityRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature activitySummaryFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (REActivityRelevanceProviderManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REActivityRelevanceProviderManager;
  result = [(RERelevanceProviderManager *)&v4 initWithQueue:a3];
  if (result)
  {
    result->_activeEnergy = 0.0;
    result->_exerciseTime = 0.0;
    result->_standHour = 0.0;
  }
  return result;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v5 = a3;
  int v6 = self->_activeEnergy < 1.0;
  float exerciseTime = self->_exerciseTime;
  float standHour = self->_standHour;
  if (v6 == [v5 closedActiveEngergy]
    || exerciseTime < 1.0 == [v5 closedExerciseTime])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = (standHour < 1.0) ^ [v5 closedStandHour];
  }
  v10 = +[REFeatureValue featureValueWithBool:v9];

  return v10;
}

- (void)resume
{
  id v3 = +[RESingleton sharedInstance];
  [v3 addObserver:self];
}

- (void)pause
{
  id v3 = +[RESingleton sharedInstance];
  [v3 removeObserver:self];
}

- (void)_prepareForUpdate
{
  id v3 = +[RESingleton sharedInstance];
  [v3 activeEnergyPercentComplete];
  self->_activeEnergy = v4;

  id v5 = +[RESingleton sharedInstance];
  [v5 exerciseTimePercentComplete];
  self->_float exerciseTime = v6;

  id v8 = +[RESingleton sharedInstance];
  [v8 standHourPercentComplete];
  self->_float standHour = v7;
}

- (void)predictorDidUpdate:(id)a3
{
  id v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];
}

- (float)activeEnergy
{
  return self->_activeEnergy;
}

- (float)exerciseTime
{
  return self->_exerciseTime;
}

- (float)standHour
{
  return self->_standHour;
}

@end