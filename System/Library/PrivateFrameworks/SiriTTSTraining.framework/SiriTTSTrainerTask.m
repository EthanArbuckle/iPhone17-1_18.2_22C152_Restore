@interface SiriTTSTrainerTask
+ (BOOL)supportsSecureCoding;
- (BOOL)forceToStart;
- (NSDate)taskSubmissionDate;
- (NSError)error;
- (NSString)appId;
- (NSString)assetLanguage;
- (NSString)assetName;
- (NSString)dataAssetPath;
- (NSString)inferenceAssetPath;
- (NSString)taskId;
- (NSString)trainingAssetPath;
- (SiriTTSTrainerTask)initWithCoder:(id)a3;
- (SiriTTSTrainerTask)initWithLanguage:(id)a3 name:(id)a4;
- (SiriTTSTrainerTask)initWithTask:(id)a3;
- (double)timeIntervalSinceSubmission;
- (double)timeIntervalSinceTrainingStart;
- (double)totalTrainingTime;
- (float)normalizedProgressValue;
- (id)description;
- (int64_t)assetVersion;
- (int64_t)currentTaskStatusProgressValue;
- (int64_t)retryTimes;
- (int64_t)taskMode;
- (int64_t)taskStatus;
- (int64_t)totalTaskStatusProgressValue;
- (int64_t)trainingStartTime;
- (int64_t)trainingStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAppId:(id)a3;
- (void)setAssetVersion:(int64_t)a3;
- (void)setCurrentTaskStatusProgressValue:(int64_t)a3;
- (void)setDataAssetPath:(id)a3;
- (void)setError:(id)a3;
- (void)setForceToStart:(BOOL)a3;
- (void)setInferenceAssetPath:(id)a3;
- (void)setNormalizedProgressValue:(float)a3;
- (void)setRetryTimes:(int64_t)a3;
- (void)setTaskId:(id)a3;
- (void)setTaskMode:(int64_t)a3;
- (void)setTaskStatus:(int64_t)a3;
- (void)setTaskSubmissionDate:(id)a3;
- (void)setTotalTaskStatusProgressValue:(int64_t)a3;
- (void)setTotalTrainingTime:(double)a3;
- (void)setTrainingAssetPath:(id)a3;
- (void)setTrainingStartTime:(int64_t)a3;
- (void)setTrainingStatus:(int64_t)a3;
@end

@implementation SiriTTSTrainerTask

- (SiriTTSTrainerTask)initWithLanguage:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriTTSTrainerTask;
  v9 = [(SiriTTSTrainerTask *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetLanguage, a3);
    objc_storeStrong((id *)&v10->_assetName, a4);
    v11 = v10;
  }

  return v10;
}

- (SiriTTSTrainerTask)initWithTask:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SiriTTSTrainerTask;
  v5 = [(SiriTTSTrainerTask *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 taskId];
    taskId = v5->_taskId;
    v5->_taskId = (NSString *)v6;

    uint64_t v8 = [v4 trainingAssetPath];
    trainingAssetPath = v5->_trainingAssetPath;
    v5->_trainingAssetPath = (NSString *)v8;

    uint64_t v10 = [v4 dataAssetPath];
    dataAssetPath = v5->_dataAssetPath;
    v5->_dataAssetPath = (NSString *)v10;

    uint64_t v12 = [v4 inferenceAssetPath];
    inferenceAssetPath = v5->_inferenceAssetPath;
    v5->_inferenceAssetPath = (NSString *)v12;

    v5->_forceToStart = [v4 forceToStart];
    v5->_taskStatus = (int64_t)[v4 taskStatus];
    v5->_taskMode = (int64_t)[v4 taskMode];
    v5->_trainingStatus = (int64_t)[v4 trainingStatus];
    uint64_t v14 = [v4 assetLanguage];
    assetLanguage = v5->_assetLanguage;
    v5->_assetLanguage = (NSString *)v14;

    uint64_t v16 = [v4 assetName];
    assetName = v5->_assetName;
    v5->_assetName = (NSString *)v16;

    v5->_retryTimes = 0;
    v5->_normalizedProgressValue = 0.0;
    v5->_assetVersion = -1;
    v18 = v5;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"id: %@, language: %@, name: %@, trainingPath: %@, dataPath: %@, inferencePath: %@, taskStatus: %ld, trainingStatus: %ld, retryTimes: %ld, currentTaskStatusProgressValue: %ld, totalTaskStatusProgressValue: %ld, normalizedProgressValue: %f, assetVersion: %ld", self->_taskId, self->_assetLanguage, self->_assetName, self->_trainingAssetPath, self->_dataAssetPath, self->_inferenceAssetPath, self->_taskStatus, self->_trainingStatus, self->_retryTimes, self->_currentTaskStatusProgressValue, self->_totalTaskStatusProgressValue, self->_normalizedProgressValue, self->_assetVersion];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  assetLanguage = self->_assetLanguage;
  id v6 = a3;
  [v6 encodeObject:assetLanguage forKey:@"assetLanguage"];
  [v6 encodeObject:self->_assetName forKey:@"assetName"];
  [v6 encodeObject:self->_taskId forKey:@"taskId"];
  [v6 encodeObject:self->_trainingAssetPath forKey:@"trainingAssetPath"];
  [v6 encodeObject:self->_dataAssetPath forKey:@"dataAssetPath"];
  [v6 encodeObject:self->_inferenceAssetPath forKey:@"inferenceAssetPath"];
  [v6 encodeObject:self->_appId forKey:@"appId"];
  [v6 encodeBool:self->_forceToStart forKey:@"forceToStart"];
  [v6 encodeInteger:self->_taskStatus forKey:@"taskStatus"];
  [v6 encodeInteger:self->_taskMode forKey:@"taskMode"];
  [v6 encodeInteger:self->_trainingStatus forKey:@"trainingStatus"];
  [v6 encodeInteger:self->_currentTaskStatusProgressValue forKey:@"currentTaskStatusProgressValue"];
  [v6 encodeInteger:self->_totalTaskStatusProgressValue forKey:@"totalTaskStatusProgressValue"];
  *(float *)&double v5 = self->_normalizedProgressValue;
  [v6 encodeFloat:@"normalizedProgressValue" forKey:v5];
  [v6 encodeInteger:self->_retryTimes forKey:@"retryTimes"];
  [(NSDate *)self->_taskSubmissionDate timeIntervalSinceReferenceDate];
  objc_msgSend(v6, "encodeDouble:forKey:", @"taskSubmissionDate");
  [v6 encodeDouble:@"totalTrainingTime" forKey:self->_totalTrainingTime];
  [v6 encodeInteger:self->_assetVersion forKey:@"assetVersion"];
}

- (SiriTTSTrainerTask)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(SiriTTSTrainerTask *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetLanguage"];
  assetLanguage = v5->_assetLanguage;
  v5->_assetLanguage = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetName"];
  assetName = v5->_assetName;
  v5->_assetName = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskId"];
  taskId = v5->_taskId;
  v5->_taskId = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trainingAssetPath"];
  trainingAssetPath = v5->_trainingAssetPath;
  v5->_trainingAssetPath = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataAssetPath"];
  dataAssetPath = v5->_dataAssetPath;
  v5->_dataAssetPath = (NSString *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inferenceAssetPath"];
  inferenceAssetPath = v5->_inferenceAssetPath;
  v5->_inferenceAssetPath = (NSString *)v16;

  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appId"];
  appId = v5->_appId;
  v5->_appId = (NSString *)v18;

  v5->_forceToStart = [v4 decodeBoolForKey:@"forceToStart"];
  v5->_taskStatus = (int64_t)[v4 decodeIntegerForKey:@"taskStatus"];
  v5->_taskMode = (int64_t)[v4 decodeIntegerForKey:@"taskMode"];
  v5->_trainingStatus = (int64_t)[v4 decodeIntegerForKey:@"trainingStatus"];
  v5->_currentTaskStatusProgressValue = (int64_t)[v4 decodeIntegerForKey:@"currentTaskStatusProgressValue"];
  v5->_totalTaskStatusProgressValue = (int64_t)[v4 decodeIntegerForKey:@"totalTaskStatusProgressValue"];
  [v4 decodeFloatForKey:@"normalizedProgressValue"];
  v5->_normalizedProgressValue = v20;
  v5->_retryTimes = (int64_t)[v4 decodeIntegerForKey:@"retryTimes"];
  [v4 decodeDoubleForKey:@"taskSubmissionDate"];
  v5->_taskSubmissionDate = (NSDate *)+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 decodeDoubleForKey:@"totalTrainingTime"];
  v5->_totalTrainingTime = v21;
  id v22 = [v4 decodeIntegerForKey:@"assetVersion"];

  v5->_assetVersion = (int64_t)v22;
  return v5;
}

- (NSError)error
{
  error = self->_error;
  if (self->_taskStatus == 4 && error == 0)
  {
    NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
    uint64_t v8 = @"Unknown failure";
    double v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v4 = +[NSError errorWithDomain:@"SiriTTSTrainerTask" code:1000 userInfo:v5];
  }
  else
  {
    id v4 = error;
  }

  return v4;
}

- (double)timeIntervalSinceTrainingStart
{
  if (qword_278C78 != -1) {
    dispatch_once(&qword_278C78, &__block_literal_global_3);
  }
  uint64_t v3 = mach_absolute_time();
  unint64_t trainingStartTime = self->_trainingStartTime;
  BOOL v5 = v3 >= trainingStartTime;
  unint64_t v6 = v3 - trainingStartTime;
  double result = *(double *)&_MergedGlobals_0 * (double)v6;
  if (v6 == 0 || !v5) {
    return 0.0;
  }
  return result;
}

void __52__SiriTTSTrainerTask_timeIntervalSinceTrainingStart__block_invoke(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&_MergedGlobals_0 = (double)v1 / (double)v2 / 1000000000.0;
}

- (double)timeIntervalSinceSubmission
{
  if (!self->_taskSubmissionDate) {
    return 0.0;
  }
  uint64_t v3 = +[NSDate now];
  [v3 timeIntervalSinceDate:self->_taskSubmissionDate];
  double v5 = v4;

  return v5;
}

- (NSString)assetLanguage
{
  return self->_assetLanguage;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
}

- (NSString)trainingAssetPath
{
  return self->_trainingAssetPath;
}

- (void)setTrainingAssetPath:(id)a3
{
}

- (NSString)dataAssetPath
{
  return self->_dataAssetPath;
}

- (void)setDataAssetPath:(id)a3
{
}

- (NSString)inferenceAssetPath
{
  return self->_inferenceAssetPath;
}

- (void)setInferenceAssetPath:(id)a3
{
}

- (BOOL)forceToStart
{
  return self->_forceToStart;
}

- (void)setForceToStart:(BOOL)a3
{
  self->_forceToStart = a3;
}

- (int64_t)taskStatus
{
  return self->_taskStatus;
}

- (void)setTaskStatus:(int64_t)a3
{
  self->_taskStatus = a3;
}

- (int64_t)taskMode
{
  return self->_taskMode;
}

- (void)setTaskMode:(int64_t)a3
{
  self->_taskMode = a3;
}

- (int64_t)retryTimes
{
  return self->_retryTimes;
}

- (void)setRetryTimes:(int64_t)a3
{
  self->_retryTimes = a3;
}

- (int64_t)trainingStatus
{
  return self->_trainingStatus;
}

- (void)setTrainingStatus:(int64_t)a3
{
  self->_trainingStatus = a3;
}

- (int64_t)currentTaskStatusProgressValue
{
  return self->_currentTaskStatusProgressValue;
}

- (void)setCurrentTaskStatusProgressValue:(int64_t)a3
{
  self->_currentTaskStatusProgressValue = a3;
}

- (int64_t)totalTaskStatusProgressValue
{
  return self->_totalTaskStatusProgressValue;
}

- (void)setTotalTaskStatusProgressValue:(int64_t)a3
{
  self->_totalTaskStatusProgressValue = a3;
}

- (float)normalizedProgressValue
{
  return self->_normalizedProgressValue;
}

- (void)setNormalizedProgressValue:(float)a3
{
  self->_normalizedProgressValue = a3;
}

- (void)setError:(id)a3
{
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(int64_t)a3
{
  self->_assetVersion = a3;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (int64_t)trainingStartTime
{
  return self->_trainingStartTime;
}

- (void)setTrainingStartTime:(int64_t)a3
{
  self->_unint64_t trainingStartTime = a3;
}

- (NSDate)taskSubmissionDate
{
  return self->_taskSubmissionDate;
}

- (void)setTaskSubmissionDate:(id)a3
{
  self->_taskSubmissionDate = (NSDate *)a3;
}

- (double)totalTrainingTime
{
  return self->_totalTrainingTime;
}

- (void)setTotalTrainingTime:(double)a3
{
  self->_totalTrainingTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inferenceAssetPath, 0);
  objc_storeStrong((id *)&self->_dataAssetPath, 0);
  objc_storeStrong((id *)&self->_trainingAssetPath, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_assetName, 0);

  objc_storeStrong((id *)&self->_assetLanguage, 0);
}

@end