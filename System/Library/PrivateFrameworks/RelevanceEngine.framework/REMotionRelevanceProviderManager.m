@interface REMotionRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (REMotionRelevanceProviderManager)initWithQueue:(id)a3;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (unint64_t)motionType;
- (void)_prepareForUpdate;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation REMotionRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature motionFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (REMotionRelevanceProviderManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REMotionRelevanceProviderManager;
  result = [(RERelevanceProviderManager *)&v4 initWithQueue:a3];
  if (result) {
    result->_type = 0;
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
  BOOL v4 = (self->_type & [a3 motionTypes]) != 0;
  return +[REFeatureValue featureValueWithBool:v4];
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
  self->_type = [v3 motionType];
}

- (void)predictorDidUpdate:(id)a3
{
  id v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];
}

- (unint64_t)motionType
{
  return self->_type;
}

@end