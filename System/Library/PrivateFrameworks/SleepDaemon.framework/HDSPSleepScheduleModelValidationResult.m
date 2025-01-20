@interface HDSPSleepScheduleModelValidationResult
+ (id)emptyFailureWithError:(id)a3;
- (BOOL)success;
- (HDSPSleepScheduleModelValidationResult)initWithSuccess:(BOOL)a3 timelineResults:(id)a4 error:(id)a5;
- (HKSPSleepEventTimelineResults)timelineResults;
- (NSError)error;
@end

@implementation HDSPSleepScheduleModelValidationResult

- (HDSPSleepScheduleModelValidationResult)initWithSuccess:(BOOL)a3 timelineResults:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSleepScheduleModelValidationResult;
  v11 = [(HDSPSleepScheduleModelValidationResult *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_error, a5);
    objc_storeStrong((id *)&v12->_timelineResults, a4);
    v13 = v12;
  }

  return v12;
}

+ (id)emptyFailureWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSuccess:0 timelineResults:0 error:v4];

  return v5;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (HKSPSleepEventTimelineResults)timelineResults
{
  return self->_timelineResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineResults, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end