@interface _REMAppStoreReviewCloudConfigurationStorage
- (_REMAppStoreReviewCloudConfigurationStorage)initWithCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3 numberOfForegroundsThreshold:(unint64_t)a4 timeIntervalOfInterest:(double)a5 timeIntervalSinceInitialForeground:(double)a6 timeIntervalSinceLastFetch:(double)a7 timeIntervalSinceLastPrompt:(double)a8;
- (double)appStoreReviewTimeIntervalOfInterest;
- (double)appStoreReviewTimeIntervalSinceInitialForeground;
- (double)appStoreReviewTimeIntervalSinceLastFetch;
- (double)appStoreReviewTimeIntervalSinceLastPrompt;
- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold;
- (unint64_t)appStoreReviewNumberOfForegroundsThreshold;
@end

@implementation _REMAppStoreReviewCloudConfigurationStorage

- (_REMAppStoreReviewCloudConfigurationStorage)initWithCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3 numberOfForegroundsThreshold:(unint64_t)a4 timeIntervalOfInterest:(double)a5 timeIntervalSinceInitialForeground:(double)a6 timeIntervalSinceLastFetch:(double)a7 timeIntervalSinceLastPrompt:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)_REMAppStoreReviewCloudConfigurationStorage;
  result = [(_REMAppStoreReviewCloudConfigurationStorage *)&v15 init];
  if (result)
  {
    result->_appStoreReviewCreatedOrCompletedRemindersCountThreshold = a3;
    result->_appStoreReviewNumberOfForegroundsThreshold = a4;
    result->_appStoreReviewTimeIntervalOfInterest = a5;
    result->_appStoreReviewTimeIntervalSinceInitialForeground = a6;
    result->_appStoreReviewTimeIntervalSinceLastPrompt = a8;
    result->_appStoreReviewTimeIntervalSinceLastFetch = a7;
  }
  return result;
}

- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold
{
  return self->_appStoreReviewCreatedOrCompletedRemindersCountThreshold;
}

- (unint64_t)appStoreReviewNumberOfForegroundsThreshold
{
  return self->_appStoreReviewNumberOfForegroundsThreshold;
}

- (double)appStoreReviewTimeIntervalOfInterest
{
  return self->_appStoreReviewTimeIntervalOfInterest;
}

- (double)appStoreReviewTimeIntervalSinceInitialForeground
{
  return self->_appStoreReviewTimeIntervalSinceInitialForeground;
}

- (double)appStoreReviewTimeIntervalSinceLastPrompt
{
  return self->_appStoreReviewTimeIntervalSinceLastPrompt;
}

- (double)appStoreReviewTimeIntervalSinceLastFetch
{
  return self->_appStoreReviewTimeIntervalSinceLastFetch;
}

@end