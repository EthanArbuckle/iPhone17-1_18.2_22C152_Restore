@interface REMAppStoreDataViewConfigurationsInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCoder:(id)a3;
- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3 numberOfForegroundsThreshold:(unint64_t)a4 timeIntervalOfInterest:(double)a5 timeIntervalSinceInitialForeground:(double)a6 timeIntervalSinceLastPrompt:(double)a7 timeIntervalSinceLastFetch:(double)a8;
- (double)timeIntervalOfInterest;
- (double)timeIntervalSinceInitialForeground;
- (double)timeIntervalSinceLastFetch;
- (double)timeIntervalSinceLastPrompt;
- (unint64_t)createdOrCompletedRemindersCountThreshold;
- (unint64_t)hash;
- (unint64_t)numberOfForegroundsThreshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAppStoreDataViewConfigurationsInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3 numberOfForegroundsThreshold:(unint64_t)a4 timeIntervalOfInterest:(double)a5 timeIntervalSinceInitialForeground:(double)a6 timeIntervalSinceLastPrompt:(double)a7 timeIntervalSinceLastFetch:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)REMAppStoreDataViewConfigurationsInvocationResult;
  result = [(REMStoreInvocationValueStorage *)&v15 init];
  if (result)
  {
    result->_createdOrCompletedRemindersCountThreshold = a3;
    result->_numberOfForegroundsThreshold = a4;
    result->_timeIntervalOfInterest = a5;
    result->_timeIntervalSinceInitialForeground = a6;
    result->_timeIntervalSinceLastPrompt = a7;
    result->_timeIntervalSinceLastFetch = a8;
  }
  return result;
}

- (REMAppStoreDataViewConfigurationsInvocationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (int)[v4 decodeIntForKey:@"createdOrCompletedRemindersCountThreshold"];
  uint64_t v6 = (int)[v4 decodeIntForKey:@"numberOfForegroundsThreshold"];
  [v4 decodeDoubleForKey:@"timeIntervalOfInterest"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"timeIntervalSinceInitialForeground"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"timeIntervalSinceLastPrompt"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"timeIntervalSinceLastFetch"];
  double v14 = v13;

  return [(REMAppStoreDataViewConfigurationsInvocationResult *)self initWithCreatedOrCompletedRemindersCountThreshold:v5 numberOfForegroundsThreshold:v6 timeIntervalOfInterest:v8 timeIntervalSinceInitialForeground:v10 timeIntervalSinceLastPrompt:v12 timeIntervalSinceLastFetch:v14];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAppStoreDataViewConfigurationsInvocationResult createdOrCompletedRemindersCountThreshold](self, "createdOrCompletedRemindersCountThreshold"), @"createdOrCompletedRemindersCountThreshold");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAppStoreDataViewConfigurationsInvocationResult numberOfForegroundsThreshold](self, "numberOfForegroundsThreshold"), @"numberOfForegroundsThreshold");
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalOfInterest];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeIntervalOfInterest");
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceInitialForeground];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeIntervalSinceInitialForeground");
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastPrompt];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeIntervalSinceLastPrompt");
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastFetch];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeIntervalSinceLastFetch");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  unint64_t v5 = [(REMAppStoreDataViewConfigurationsInvocationResult *)self createdOrCompletedRemindersCountThreshold];
  if (v5 != [v4 createdOrCompletedRemindersCountThreshold]) {
    goto LABEL_7;
  }
  unint64_t v6 = [(REMAppStoreDataViewConfigurationsInvocationResult *)self numberOfForegroundsThreshold];
  if (v6 != [v4 numberOfForegroundsThreshold]) {
    goto LABEL_7;
  }
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalOfInterest];
  double v8 = v7;
  [v4 timeIntervalOfInterest];
  if (v8 != v9) {
    goto LABEL_7;
  }
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceInitialForeground];
  double v11 = v10;
  [v4 timeIntervalSinceInitialForeground];
  if (v11 == v12
    && (-[REMAppStoreDataViewConfigurationsInvocationResult timeIntervalSinceLastPrompt](self, "timeIntervalSinceLastPrompt"), double v14 = v13, [v4 timeIntervalSinceLastPrompt], v14 == v15))
  {
    [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastFetch];
    double v19 = v18;
    [v4 timeIntervalSinceLastFetch];
    BOOL v16 = v19 == v20;
  }
  else
  {
LABEL_7:
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3 = [(REMAppStoreDataViewConfigurationsInvocationResult *)self createdOrCompletedRemindersCountThreshold];
  double v4 = (double)([(REMAppStoreDataViewConfigurationsInvocationResult *)self numberOfForegroundsThreshold]+ v3);
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalOfInterest];
  double v6 = v5 + v4;
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceInitialForeground];
  double v8 = v7 + v6;
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastPrompt];
  double v10 = v9 + v8;
  [(REMAppStoreDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastFetch];
  return (unint64_t)(v11 + v10);
}

- (unint64_t)createdOrCompletedRemindersCountThreshold
{
  return self->_createdOrCompletedRemindersCountThreshold;
}

- (unint64_t)numberOfForegroundsThreshold
{
  return self->_numberOfForegroundsThreshold;
}

- (double)timeIntervalOfInterest
{
  return self->_timeIntervalOfInterest;
}

- (double)timeIntervalSinceInitialForeground
{
  return self->_timeIntervalSinceInitialForeground;
}

- (double)timeIntervalSinceLastPrompt
{
  return self->_timeIntervalSinceLastPrompt;
}

- (double)timeIntervalSinceLastFetch
{
  return self->_timeIntervalSinceLastFetch;
}

@end