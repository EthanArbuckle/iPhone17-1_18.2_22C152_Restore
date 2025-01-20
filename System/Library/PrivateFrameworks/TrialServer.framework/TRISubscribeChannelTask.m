@interface TRISubscribeChannelTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperimentId:(id)a3 startTime:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)startTime;
- (NSString)description;
- (NSString)experimentId;
- (TRISubscribeChannelTask)initWithCoder:(id)a3;
- (TRISubscribeChannelTask)initWithExperiment:(id)a3;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation TRISubscribeChannelTask

- (int)taskType
{
  return 27;
}

- (TRISubscribeChannelTask)initWithExperiment:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRISubscribeChannelTask.m", 36, @"Invalid parameter not satisfying: %@", @"experimentId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TRISubscribeChannelTask;
  v7 = [(TRISubscribeChannelTask *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_experimentId, a3);
  }

  return v8;
}

+ (id)taskWithExperimentId:(id)a3 startTime:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TRISubscribeChannelTask alloc] initWithExperiment:v6];

  [(TRISubscribeChannelTask *)v7 setStartTime:v5];
  return v7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4FB0090] currentEnvironment];
  v7 = [MEMORY[0x1E4FB0258] sharedInstance];
  int v8 = [v7 populationType];

  if (v8 == 3 && v6 == 3)
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      experimentId = self->_experimentId;
      int v18 = 138543362;
      v19 = experimentId;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Skipping subscribing to cloud channel for experiment %{public}@ because it is deployed to UAT", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v11 = MEMORY[0x1E4F1CBF0];
    uint64_t v12 = 4;
    uint64_t v13 = 1;
  }
  else
  {
    v10 = [v5 pushServiceMuxer];
    [v10 subscribeForExperimentId:self->_experimentId];

    uint64_t v11 = MEMORY[0x1E4F1CBF0];
    uint64_t v12 = 2;
    uint64_t v13 = 0;
  }
  v16 = +[TRITaskRunResult resultWithRunStatus:v12 reportResultToServer:v13 nextTasks:v11 earliestRetryDate:0];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRISubscribeChannelTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRISubscribeChannelTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4]
      && [(TRISubscribeChannelTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      if ([(NSString *)self->_experimentId isEqualToString:v5->_experimentId]) {
        char v6 = [MEMORY[0x1E4F1C9C8] triIsDate:self->_startTime equalToDate:v5->_startTime];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TRISubscribeChannelTask;
  unint64_t v3 = [(TRIBaseTask *)&v7 hash];
  NSUInteger v4 = [(NSString *)self->_experimentId hash];
  startTime = self->_startTime;
  if (startTime) {
    startTime = (NSDate *)[(NSDate *)startTime hash];
  }
  return (unint64_t)startTime + 1369 * v3 + 37 * v4;
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  [v3 setExperimentId:self->_experimentId];
  NSUInteger v4 = [(TRISubscribeChannelTask *)self startTime];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB05F0]);
    char v6 = [(TRISubscribeChannelTask *)self startTime];
    objc_super v7 = (void *)[v5 initWithDate:v6];
    [v3 setStartTimestamp:v7];
  }
  return v3;
}

- (id)serialize
{
  NSUInteger v4 = [(TRISubscribeChannelTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRISubscribeChannelTask.m", 114, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v20];
  id v4 = v20;
  if (!v3)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISubscribePersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v3 hasExperimentId] & 1) == 0)
  {
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      id v22 = v18;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    v15 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_19;
  }
  id v5 = [v3 experimentId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      uint64_t v11 = 0;
      goto LABEL_14;
    }
    v19 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_19:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_13;
  }
  objc_super v7 = objc_opt_class();
  objc_super v8 = [v3 experimentId];
  if ([v3 hasStartTimestamp])
  {
    v9 = [v3 startTimestamp];
    v10 = [v9 date];
    uint64_t v11 = [v7 taskWithExperimentId:v8 startTime:v10];
  }
  else
  {
    uint64_t v11 = [v7 taskWithExperimentId:v8 startTime:0];
  }
LABEL_14:

  return v11;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@>", objc_opt_class(), self->_experimentId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISubscribeChannelTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISubscribeChannelTask;
  id v5 = [(TRISubscribeChannelTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      objc_super v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRISubscribeChannelTask.m", 144, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRISubscribeChannelTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end