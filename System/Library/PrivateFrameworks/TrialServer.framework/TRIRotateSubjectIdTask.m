@interface TRIRotateSubjectIdTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
+ (id)taskWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)tags;
- (TRIRotateSubjectIdTask)initWithCoder:(id)a3;
- (TRIRotateSubjectIdTask)initWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5;
- (id)_asPersistedTask;
- (id)runTaskUsingContext:(id)a3;
- (id)serialize;
- (int)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRotateSubjectIdTask

- (int)taskType
{
  return 9;
}

+ (id)task
{
  return +[TRIRotateSubjectIdTask taskWithDeviceId:0 nextRotationDate:0 forceUpdate:0];
}

- (TRIRotateSubjectIdTask)initWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  if (v10 && (unint64_t)[v10 length] <= 7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIRotateSubjectIdTask.m", 51, @"TRIRotateSubjectIdTask instantiated with unreasonably short deviceId: \"%@\"", v10 object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)TRIRotateSubjectIdTask;
  v12 = [(TRIRotateSubjectIdTask *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deviceId, a3);
    objc_storeStrong((id *)&v13->_nextRotationDate, a4);
    v13->_forceUpdate = a5;
  }

  return v13;
}

+ (id)taskWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithDeviceId:v9 nextRotationDate:v8 forceUpdate:v5];

  return v10;
}

- (NSArray)tags
{
  return 0;
}

- (id)runTaskUsingContext:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4FB0248];
  v6 = [v4 paths];
  v7 = [v5 defaultProviderWithPaths:v6];

  if (self->_forceUpdate) {
    goto LABEL_8;
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v7 nextRotationDate];
  if (!v9
    || (id v10 = (void *)v9,
        [v7 nextRotationDate],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 compare:v8],
        v11,
        v10,
        v12 != 1))
  {

LABEL_8:
    v15 = [v4 client];
    id v8 = [v15 trackingId];

    objc_super v16 = [v7 subject];
    [v7 rotateSubject];
    deviceId = self->_deviceId;
    v18 = [v7 subject];
    v19 = v18;
    if (deviceId)
    {
      [v18 setDeviceId:deviceId];
    }
    else
    {
      v20 = [v18 deviceId];
      v21 = self->_deviceId;
      self->_deviceId = v20;
    }
    if (self->_nextRotationDate)
    {
      objc_msgSend(v7, "setNextRotationDate:");
    }
    else
    {
      v22 = [v7 nextRotationDate];
      nextRotationDate = self->_nextRotationDate;
      self->_nextRotationDate = v22;
    }
    if (![v7 save])
    {
      uint64_t v32 = 3;
      v26 = v7;
LABEL_30:
      v14 = +[TRITaskRunResult resultWithRunStatus:v32 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

      v7 = v26;
      goto LABEL_31;
    }
    v24 = (void *)MEMORY[0x1E4FB0248];
    v25 = [v4 paths];
    v26 = [v24 defaultProviderWithPaths:v25];

    v27 = [v26 subject];
    int v28 = [v27 hasDeviceId];
    char v29 = v28;
    if (v28 && v16)
    {
      v30 = [v26 subject];
      char v31 = [v16 isEqual:v30];

      if (v31)
      {
LABEL_25:
        v39 = [v26 subject];
        v40 = [v39 deviceId];

        v41 = TRILogCategory_Server();
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            *(_WORD *)buf = 0;
            v43 = "subject rotated but device id was not changed";
LABEL_35:
            _os_log_error_impl(&dword_1DA291000, v41, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
        }
        else if (v42)
        {
          *(_WORD *)buf = 0;
          v43 = "subject rotated but device id is nil";
          goto LABEL_35;
        }

        uint64_t v32 = 3;
        goto LABEL_30;
      }
    }
    else
    {

      if ((v29 & 1) == 0) {
        goto LABEL_25;
      }
      if (!v16) {
        goto LABEL_24;
      }
    }
    v33 = [v4 client];
    int v34 = [v33 shouldLogAtLevel:20];

    if (v34)
    {
      v35 = [v4 client];
      v36 = [v35 logger];
      v37 = [MEMORY[0x1E4FB05A8] metricWithName:@"SubjectIdEnd"];
      v46 = v37;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [v36 logWithTrackingId:v8 metrics:v38 dimensions:0 trialSystemTelemetry:0];
    }
LABEL_24:
    [MEMORY[0x1E4FB0250] notifySubjectRotation];
    uint64_t v32 = 2;
    goto LABEL_30;
  }
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v45 = [v7 nextRotationDate];
    *(_DWORD *)buf = 138412290;
    v48 = v45;
    _os_log_debug_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEBUG, "Not yet rotating subject id.  Next rotation date is %@", buf, 0xCu);
  }
  v14 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_31:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIRotateSubjectIdTask *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIRotateSubjectIdTask;
    if ([(TRIBaseTask *)&v13 isEqual:v4])
    {
      BOOL v5 = v4;
      if (self->_forceUpdate == v5->_forceUpdate)
      {
        v6 = self->_deviceId;
        v7 = v5->_deviceId;
        if (v6 == v7)
        {

LABEL_15:
          char v10 = [MEMORY[0x1E4F1C9C8] triIsDate:self->_nextRotationDate equalToDate:v5->_nextRotationDate];
LABEL_17:

          goto LABEL_18;
        }
        id v8 = v7;
        if (v6) {
          BOOL v9 = v7 == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9)
        {
        }
        else
        {
          BOOL v11 = [(NSString *)v6 isEqualToString:v7];

          if (v11) {
            goto LABEL_15;
          }
        }
      }
      char v10 = 0;
      goto LABEL_17;
    }
    char v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)TRIRotateSubjectIdTask;
  unint64_t v3 = [(TRIBaseTask *)&v9 hash];
  BOOL forceUpdate = self->_forceUpdate;
  deviceId = self->_deviceId;
  if (deviceId) {
    uint64_t v6 = [(NSString *)deviceId hash];
  }
  else {
    uint64_t v6 = 0;
  }
  nextRotationDate = self->_nextRotationDate;
  if (nextRotationDate) {
    nextRotationDate = (NSDate *)[(NSDate *)nextRotationDate hash];
  }
  return (unint64_t)nextRotationDate + 50653 * v3 + 1369 * forceUpdate + 37 * v6;
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  [v3 setForceUpdate:self->_forceUpdate];
  if (self->_deviceId) {
    objc_msgSend(v3, "setDeviceId:");
  }
  if (self->_nextRotationDate)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB05F0]) initWithDate:self->_nextRotationDate];
    [v3 setNextRotationTimestamp:v4];
  }
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIRotateSubjectIdTask *)self _asPersistedTask];
  BOOL v5 = [v4 data];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIRotateSubjectIdTask.m", 190, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v15];
  BOOL v5 = v15;
  if (!v4)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRotateSubjectIdPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (([v4 hasForceUpdate] & 1) == 0)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: forceUpdate", buf, 0xCu);
    }
LABEL_13:
    id v8 = 0;
    goto LABEL_21;
  }
  if (![v4 hasDeviceId])
  {
    v7 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = [v4 deviceId];
  v7 = v6;
  if (!v6 || (unint64_t)[v6 length] > 7)
  {
LABEL_15:
    objc_super v9 = objc_opt_class();
    int v10 = [v4 hasNextRotationTimestamp];
    if (v10)
    {
      a1 = [v4 nextRotationTimestamp];
      BOOL v11 = [a1 date];
    }
    else
    {
      BOOL v11 = 0;
    }
    id v8 = objc_msgSend(v9, "taskWithDeviceId:nextRotationDate:forceUpdate:", v7, v11, objc_msgSend(v4, "forceUpdate"));
    if (!v10) {
      goto LABEL_21;
    }

    goto LABEL_20;
  }
  TRILogCategory_Server();
  a1 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_error_impl(&dword_1DA291000, (os_log_t)a1, OS_LOG_TYPE_ERROR, "TRIRotateSubjectIdPersistedTask contains unreasonably short deviceId: \"%@\"", buf, 0xCu);
  }
  id v8 = 0;
LABEL_20:

LABEL_21:
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRotateSubjectIdTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRotateSubjectIdTask;
  BOOL v5 = [(TRIRotateSubjectIdTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIRotateSubjectIdTask.m", 221, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  BOOL v5 = [(TRIRotateSubjectIdTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextRotationDate, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end