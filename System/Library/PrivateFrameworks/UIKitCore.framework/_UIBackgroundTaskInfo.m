@interface _UIBackgroundTaskInfo
+ (id)backgroundTaskAssertionQueue;
- (_UIBackgroundTaskInfo)initWithProcessAssertion:(id)a3 taskName:(id)a4 expirationHandler:(id)a5;
- (id)description;
- (void)dealloc;
- (void)fireExpirationHandler;
- (void)invalidate;
@end

@implementation _UIBackgroundTaskInfo

- (void)dealloc
{
  [(_UIBackgroundTaskInfo *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIBackgroundTaskInfo;
  [(_UIBackgroundTaskInfo *)&v3 dealloc];
}

- (void)invalidate
{
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    self->_processAssertion = 0;
  }
}

+ (id)backgroundTaskAssertionQueue
{
  if (qword_1EB260A20 != -1) {
    dispatch_once(&qword_1EB260A20, &__block_literal_global_252);
  }
  v2 = (void *)qword_1EB260A28;
  return v2;
}

- (id)description
{
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp);
  __darwin_time_t v3 = __tp.tv_sec - self->_creationTime;
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIBackgroundTaskInfo;
  v5 = [(_UIBackgroundTaskInfo *)&v8 description];
  v6 = [v4 stringWithFormat:@"%@: taskID = %lu, taskName = %@, creationTime = %lu (elapsed = %lu)", v5, self->_taskId, self->_taskName, self->_creationTime, v3];

  return v6;
}

- (_UIBackgroundTaskInfo)initWithProcessAssertion:(id)a3 taskName:(id)a4 expirationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIBackgroundTaskInfo;
  v12 = [(_UIBackgroundTaskInfo *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_taskId = 0;
    v14 = _Block_copy(v11);
    id expireHandler = v13->_expireHandler;
    v13->_id expireHandler = v14;

    objc_storeStrong((id *)&v13->_processAssertion, a3);
    uint64_t v16 = [v10 copy];
    taskName = v13->_taskName;
    v13->_taskName = (NSString *)v16;

    v19.tv_sec = 0;
    v19.tv_nsec = 0;
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &v19);
    v13->_creationTime = v19.tv_sec;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong(&self->_expireHandler, 0);
}

- (void)fireExpirationHandler
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id expireHandler = (void (**)(id, SEL))self->_expireHandler;
  if (expireHandler && self->_processAssertion)
  {
    expireHandler[2](expireHandler, a2);
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A30);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = self->_expireHandler;
        v7 = v5;
        objc_super v8 = _Block_copy(v6);
        id v9 = [(_UIBackgroundTaskInfo *)self description];
        int v14 = 136315650;
        v15 = "-[_UIBackgroundTaskInfo fireExpirationHandler]";
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        timespec v19 = v9;
        id v10 = "%s: Called expiration handler: %@ for task: %@";
LABEL_10:
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x20u);
      }
    }
  }
  else
  {
    unint64_t v11 = __UILogGetCategoryCachedImpl("BackgroundTask", &qword_1EB260A38);
    if (*(unsigned char *)v11)
    {
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = self->_expireHandler;
        v7 = v12;
        objc_super v8 = _Block_copy(v13);
        id v9 = [(_UIBackgroundTaskInfo *)self description];
        int v14 = 136315650;
        v15 = "-[_UIBackgroundTaskInfo fireExpirationHandler]";
        __int16 v16 = 2112;
        v17 = v8;
        __int16 v18 = 2112;
        timespec v19 = v9;
        id v10 = "%s: Did not call expiration handler: %@ for task: %@. Handler was nil, or UIKIT_SUPPORTS_ASSERTIONSERVICES is false.";
        goto LABEL_10;
      }
    }
  }
}

@end