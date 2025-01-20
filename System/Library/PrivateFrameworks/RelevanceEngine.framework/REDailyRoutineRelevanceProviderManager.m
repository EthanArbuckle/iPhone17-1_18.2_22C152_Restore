@interface REDailyRoutineRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)_isInRoutine:(unint64_t)a3 forDate:(id)a4;
- (BOOL)isInEveningRoutine;
- (BOOL)isInMorningRoutine;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (void)_prepareForUpdate;
- (void)_updateRoutines;
- (void)pause;
- (void)resume;
@end

@implementation REDailyRoutineRelevanceProviderManager

+ (id)_features
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = +[REFeature dailyRoutineFeature];
  v6[0] = v2;
  v3 = +[REFeature isInDailyRoutineFeature];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
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
  id v6 = a3;
  id v7 = a4;
  v8 = +[REFeature dailyRoutineFeature];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v6 type]);
LABEL_11:
    v14 = (void *)v10;
    goto LABEL_12;
  }
  uint64_t v11 = [v6 type];
  switch(v11)
  {
    case 0:
      uint64_t v12 = 96;
      goto LABEL_8;
    case 2:
      uint64_t v13 = 1;
      goto LABEL_10;
    case 1:
      uint64_t v12 = 97;
LABEL_8:
      uint64_t v13 = *((unsigned __int8 *)&self->super.super.isa + v12);
LABEL_10:
      uint64_t v10 = +[REFeatureValue featureValueWithBool:v13];
      goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  uint64_t v11 = [a4 attributeForKey:@"RETrainingContextDateKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v11)
    {
      uint64_t v12 = +[REFeature isInDailyRoutineFeature];
      int v13 = [v9 isEqual:v12];

      if (v13)
      {
        uint64_t v14 = +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", -[REDailyRoutineRelevanceProviderManager _isInRoutine:forDate:](self, "_isInRoutine:forDate:", [v10 type], v11));
        goto LABEL_7;
      }
    }
  }
  else
  {

    uint64_t v11 = 0;
  }
  uint64_t v14 = [(REDailyRoutineRelevanceProviderManager *)self _valueForProvider:v10 feature:v9];
LABEL_7:
  v15 = (void *)v14;

  return v15;
}

- (BOOL)_isInRoutine:(unint64_t)a3 forDate:(id)a4
{
  BOOL v5 = a3 == 1;
  id v6 = a4;
  if (a3) {
    uint64_t v7 = 2 * v5;
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = +[RESingleton sharedInstance];
  id v9 = [v8 currentRoutineInterval];
  int v10 = [v9 containsDate:v6];

  if (v10)
  {
    char v11 = [v8 currentRoutineType] == v7;
  }
  else
  {
    uint64_t v12 = [v8 routineIntervalForPreviousRoutine:v7];
    if ([v12 containsDate:v6])
    {
      char v11 = 1;
    }
    else
    {
      int v13 = [v8 routineIntervalForNextRoutine:v7];

      char v11 = [v13 containsDate:v6];
      uint64_t v12 = v13;
    }
  }
  return v11;
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
  uint64_t v4 = [v3 currentRoutineType];

  if (v4 == 1)
  {
    BOOL v5 = 0;
    self->_inMorningRoutine = 1;
  }
  else
  {
    self->_inMorningRoutine = REUpNextDemoAlwaysShowRoutines();
    BOOL v5 = v4 == 2 && !REUpNextDemoAlwaysShowRoutines();
  }
  self->_inEveningRoutine = v5;
}

- (void)_updateRoutines
{
  id v3 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v3];
}

- (BOOL)isInEveningRoutine
{
  return self->_inEveningRoutine;
}

- (BOOL)isInMorningRoutine
{
  return self->_inMorningRoutine;
}

@end