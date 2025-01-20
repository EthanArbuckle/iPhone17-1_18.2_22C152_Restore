@interface HDSPSleepScheduleModelSaveResult
+ (id)emptyResult;
+ (id)saveFailedWithError:(id)a3;
- (BOOL)shouldNotify;
- (BOOL)success;
- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation;
- (HDSPSleepScheduleModelSaveResult)initWithSuccess:(BOOL)a3 changeEvaluation:(id)a4 error:(id)a5 shouldNotify:(BOOL)a6;
- (NSError)error;
@end

@implementation HDSPSleepScheduleModelSaveResult

+ (id)emptyResult
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
  v4 = (void *)[v2 initWithSuccess:1 changeEvaluation:v3 error:0 shouldNotify:0];

  return v4;
}

+ (id)saveFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = +[HDSPSleepScheduleModelChangeEvaluation emptyEvaluation];
  v7 = (void *)[v5 initWithSuccess:0 changeEvaluation:v6 error:v4 shouldNotify:0];

  return v7;
}

- (HDSPSleepScheduleModelSaveResult)initWithSuccess:(BOOL)a3 changeEvaluation:(id)a4 error:(id)a5 shouldNotify:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSPSleepScheduleModelSaveResult;
  v13 = [(HDSPSleepScheduleModelSaveResult *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    objc_storeStrong((id *)&v13->_changeEvaluation, a4);
    objc_storeStrong((id *)&v14->_error, a5);
    v14->_shouldNotify = a6;
    v15 = v14;
  }

  return v14;
}

- (BOOL)success
{
  return self->_success;
}

- (HDSPSleepScheduleModelChangeEvaluation)changeEvaluation
{
  return self->_changeEvaluation;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_changeEvaluation, 0);
}

@end