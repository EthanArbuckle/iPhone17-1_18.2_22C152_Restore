@interface TRISequenceTask
+ (BOOL)_isTask:(id)a3 equalTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSDate)startTime;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)taskName;
- (TRISequenceTask)initWithCoder:(id)a3;
- (TRISequenceTask)initWithTask:(id)a3 dependency:(id)a4;
- (TRITask)lastTask;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)hash;
- (void)addTaskToEndOfSequence:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRISequenceTask

- (int)taskType
{
  return 15;
}

+ (id)task
{
  v2 = objc_opt_new();
  return v2;
}

- (TRISequenceTask)initWithTask:(id)a3 dependency:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRISequenceTask;
  v10 = [(TRISequenceTask *)&v13 init];
  if (v10)
  {
    if (!v8 && v9)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v10 file:@"TRISequenceTask.m" lineNumber:37 description:@"task must not be nil if dependency is nil"];
    }
    objc_storeStrong((id *)&v10->_task, a3);
    objc_storeStrong((id *)&v10->_dependentTask, a4);
  }

  return v10;
}

- (NSString)taskName
{
  if (self->_task)
  {
    [(TRITask *)self->_task taskName];
  }
  else
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
  v2 = };
  return (NSString *)v2;
}

- (id)metrics
{
  task = self->_task;
  if (task)
  {
    if ([(TRITask *)task conformsToProtocol:&unk_1F3482928]) {
      task = self->_task;
    }
    else {
      task = 0;
    }
  }
  return (id)[(TRITask *)task metrics];
}

- (id)dimensions
{
  task = self->_task;
  if (task)
  {
    if ([(TRITask *)task conformsToProtocol:&unk_1F3482928]) {
      task = self->_task;
    }
    else {
      task = 0;
    }
  }
  return (id)[(TRITask *)task dimensions];
}

- (id)trialSystemTelemetry
{
  task = self->_task;
  if (task)
  {
    if ([(TRITask *)task conformsToProtocol:&unk_1F3482928]) {
      task = self->_task;
    }
    else {
      task = 0;
    }
  }
  return (id)[(TRITask *)task trialSystemTelemetry];
}

- (int)retryCount
{
  task = self->_task;
  if (task)
  {
    if ([(TRITask *)task conformsToProtocol:&unk_1F3483128]) {
      task = self->_task;
    }
    else {
      task = 0;
    }
  }
  return [(TRITask *)task retryCount];
}

- (void)setRetryCount:(int)a3
{
  task = self->_task;
  if (task)
  {
    uint64_t v5 = *(void *)&a3;
    if ([(TRITask *)task conformsToProtocol:&unk_1F3483128])
    {
      v6 = self->_task;
      if (v6)
      {
        v7 = v6;
        [(TRITask *)v6 setRetryCount:v5];
      }
    }
  }
}

- (TRITask)lastTask
{
  return self->_task;
}

- (void)addTaskToEndOfSequence:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v9[4];
    task = v9;
    [(TRISequenceTask *)self addTaskToEndOfSequence:v4];
    [(TRISequenceTask *)self addTaskToEndOfSequence:*((void *)task + 3)];
  }
  else
  {
    if (self->_task)
    {
      v6 = [[TRISequenceTask alloc] initWithTask:self->_task dependency:self->_dependentTask];
      dependentTask = self->_dependentTask;
      self->_dependentTask = (TRITask *)v6;
    }
    id v8 = v9;
    task = self->_task;
    self->_task = v8;
  }
}

- (NSArray)dependencies
{
  if (self->_dependentTask)
  {
    v3 = objc_opt_new();
    [v3 addObject:self->_dependentTask];
    uint64_t v4 = [(TRITask *)self->_task dependencies];

    if (v4)
    {
      uint64_t v5 = [(TRITask *)self->_task dependencies];
      [v3 addObjectsFromArray:v5];
    }
  }
  else
  {
    v3 = [(TRITask *)self->_task dependencies];
  }
  return (NSArray *)v3;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  return (id)[(TRITask *)self->_task runUsingContext:a3 withTaskQueue:a4];
}

- (NSArray)tags
{
  return (NSArray *)[(TRITask *)self->_task tags];
}

- (NSDate)startTime
{
  return (NSDate *)[(TRITask *)self->_task startTime];
}

- (NSString)description
{
  return (NSString *)[(TRITask *)self->_task description];
}

- (NSString)debugDescription
{
  v2 = NSString;
  v3 = [(TRITask *)self->_task debugDescription];
  uint64_t v4 = [v2 stringWithFormat:@"<SequenceTask: %@>", v3];

  return (NSString *)v4;
}

+ (BOOL)_isTask:(id)a3 equalTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    char v8 = 0;
    if (v5 && v6) {
      char v8 = [(id)v5 isEqual:v6];
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TRISequenceTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRISequenceTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4])
    {
      unint64_t v5 = v4;
      if ([(id)objc_opt_class() _isTask:self->_task equalTo:v5->_task]) {
        char v6 = [(id)objc_opt_class() _isTask:self->_dependentTask equalTo:v5->_dependentTask];
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
  v8.receiver = self;
  v8.super_class = (Class)TRISequenceTask;
  unint64_t v3 = [(TRIBaseTask *)&v8 hash];
  task = self->_task;
  if (task) {
    uint64_t v5 = [(TRITask *)task hash];
  }
  else {
    uint64_t v5 = 0;
  }
  dependentTask = self->_dependentTask;
  if (dependentTask) {
    dependentTask = (TRITask *)[(TRITask *)dependentTask hash];
  }
  return (unint64_t)dependentTask + 1369 * v3 + 37 * v5;
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  if (self->_task)
  {
    uint64_t v4 = objc_opt_new();
    [v3 setTask:v4];

    uint64_t v5 = [(TRITask *)self->_task taskType];
    char v6 = [v3 task];
    [v6 setType:v5];

    v7 = [(TRITask *)self->_task serialize];
    objc_super v8 = [v3 task];
    [v8 setSerialized:v7];
  }
  if (self->_dependentTask)
  {
    id v9 = objc_opt_new();
    [v3 setDependentTask:v9];

    uint64_t v10 = [(TRITask *)self->_dependentTask taskType];
    v11 = [v3 dependentTask];
    [v11 setType:v10];

    v12 = [(TRITask *)self->_dependentTask serialize];
    objc_super v13 = [v3 dependentTask];
    [v13 setSerialized:v12];
  }
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRISequenceTask *)self _asPersistedTask];
  uint64_t v5 = [v4 data];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRISequenceTask.m", 194, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v12];
  id v4 = v12;
  if (!v3)
  {
    char v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISequencePersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if ([v3 hasTask])
  {
    uint64_t v5 = [v3 task];
    char v6 = __33__TRISequenceTask_parseFromData___block_invoke(v5);

    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    char v6 = 0;
  }
  if ([v3 hasDependentTask])
  {
    v7 = [v3 dependentTask];
    objc_super v8 = __33__TRISequenceTask_parseFromData___block_invoke(v7);

    if (!v8)
    {
LABEL_14:
      uint64_t v10 = 0;
      goto LABEL_18;
    }
    if (!v6)
    {
      id v9 = TRILogCategory_Server();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "TRISequencePersistedTask encodes dependent task without primary task", buf, 2u);
      }

      char v6 = 0;
      uint64_t v10 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  uint64_t v10 = [[TRISequenceTask alloc] initWithTask:v6 dependency:v8];
LABEL_17:

LABEL_18:
  return v10;
}

id __33__TRISequenceTask_parseFromData___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (([v1 hasType] & 1) == 0)
  {
    char v6 = TRILogCategory_Server();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v11[0]) = 0;
    v7 = "TRISequencePersistedTask is missing task type";
    goto LABEL_9;
  }
  if (([v1 hasSerialized] & 1) == 0)
  {
    char v6 = TRILogCategory_Server();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v11[0]) = 0;
    v7 = "TRISequencePersistedTask is missing serialized task bytes";
LABEL_9:
    objc_super v8 = v6;
    uint32_t v9 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v11, v9);
    goto LABEL_12;
  }
  v2 = +[TRITaskSupport sharedInstance];
  unint64_t v3 = objc_msgSend(v2, "taskClassForTaskType:", objc_msgSend(v1, "type"));

  if (v3)
  {
    id v4 = [v1 serialized];
    uint64_t v5 = [v3 parseFromData:v4];

    goto LABEL_13;
  }
  char v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11[0] = 67109120;
    v11[1] = [v1 type];
    v7 = "TRISequencePersistedTask encodes unsupported class type %d";
    objc_super v8 = v6;
    uint32_t v9 = 8;
    goto LABEL_10;
  }
LABEL_12:

  uint64_t v5 = 0;
LABEL_13:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISequenceTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISequenceTask;
  uint64_t v5 = [(TRISequenceTask *)&v9 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
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
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRISequenceTask.m", 255, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  uint64_t v5 = [(TRISequenceTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentTask, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end