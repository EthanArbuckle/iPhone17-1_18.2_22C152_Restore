@interface REWorkoutRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (REWorkoutRelevanceProviderManager)initWithQueue:(id)a3;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (unint64_t)state;
- (void)_prepareForUpdate;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation REWorkoutRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature workoutStateFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (REWorkoutRelevanceProviderManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REWorkoutRelevanceProviderManager;
  result = [(RERelevanceProviderManager *)&v4 initWithQueue:a3];
  if (result) {
    result->_state = 0;
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
  uint64_t v5 = [a3 state] == self->_state;
  v6 = [(NSDate *)self->_lastWorkoutDate dateByAddingTimeInterval:*(double *)&kLastWorkoutWorkoutSuggestionDelay];
  v7 = v6;
  if (v6)
  {
    [v6 timeIntervalSinceNow];
    if (v8 > 0.0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v5;
    }
  }
  v9 = +[REFeatureValue featureValueWithBool:v5];

  return v9;
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
  self->_state = [v3 isActiveWorkout];

  id v6 = +[RESingleton sharedInstance];
  objc_super v4 = [v6 lastWorkoutDate];
  lastWorkoutDate = self->_lastWorkoutDate;
  self->_lastWorkoutDate = v4;
}

- (void)predictorDidUpdate:(id)a3
{
  objc_super v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];

  uint64_t v5 = +[RESingleton sharedInstance];
  id v6 = [v5 lastWorkoutDate];

  id v10 = [v6 dateByAddingTimeInterval:*(double *)&kLastWorkoutWorkoutSuggestionDelay];

  v7 = v10;
  if (v10)
  {
    [v10 timeIntervalSinceNow];
    v7 = v10;
    if (v8 > 0.0)
    {
      v9 = +[RERelevanceProviderManagerUpdate scheduledUpdateForAllProvidersAtDate:v10];
      [(RERelevanceProviderManager *)self _scheduleUpdate:v9];

      v7 = v10;
    }
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end