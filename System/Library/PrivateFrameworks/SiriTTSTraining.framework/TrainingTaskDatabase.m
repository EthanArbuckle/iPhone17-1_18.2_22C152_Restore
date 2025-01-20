@interface TrainingTaskDatabase
+ (TrainingTaskDatabase)sharedInstance;
- (TrainingTaskDatabase)init;
- (id)getAllTasks;
- (id)getNextSubmittedTask;
- (id)getSubmittedTasks;
- (id)getTaskById:(id)a3;
- (id)isTaskInSubmittedQueue:(id)a3;
- (int64_t)getSubmittedTaskQueueSize;
- (void)addFailedTaskToFinishQueue:(id)a3 errorCode:(unint64_t)a4 description:(id)a5;
- (void)addTaskToFinishedQueueWithStatus:(id)a3 status:(int64_t)a4;
- (void)addTaskToSubmittedQueue:(id)a3;
- (void)cleanUpQueue;
- (void)submitTaskToSubmittedQueue:(id)a3;
- (void)updateTaskToSubmittedQueue:(id)a3;
- (void)updateTaskWithStatusToSubmittedQueue:(id)a3 taskStatus:(int64_t)a4;
- (void)updateTaskWithTrainingStatusToSubmittedQueue:(id)a3 trainingStatus:(int64_t)a4 currentProgressValue:(int64_t)a5 totalProgressValue:(int64_t)a6 normalizedProgressValue:(float)a7;
@end

@implementation TrainingTaskDatabase

+ (TrainingTaskDatabase)sharedInstance
{
  if (qword_10001D848 != -1) {
    dispatch_once(&qword_10001D848, &stru_100018CA0);
  }
  v2 = (void *)qword_10001D840;

  return (TrainingTaskDatabase *)v2;
}

- (TrainingTaskDatabase)init
{
  v17.receiver = self;
  v17.super_class = (Class)TrainingTaskDatabase;
  v2 = [(TrainingTaskDatabase *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(TrainingTaskProtectedDefaults);
    defaults = v2->_defaults;
    v2->_defaults = v3;

    v5 = sub_10000E7A0(&v2->_defaults->super.isa, @"submitted_task_queue");
    v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v5];
    submittedTaskQueue = v2->_submittedTaskQueue;
    v2->_submittedTaskQueue = v6;

    v8 = sub_10000E7A0(&v2->_defaults->super.isa, @"finished_task_queue");
    v9 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v8];
    finishedTaskQueue = v2->_finishedTaskQueue;
    v2->_finishedTaskQueue = v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v12 = dispatch_queue_create("TrainingTaskDatabaseQueue", v11);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v12;

    v14 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v14;
  }
  return v2;
}

- (int64_t)getSubmittedTaskQueueSize
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(NSMutableArray *)self->_submittedTaskQueue count];
  [(NSRecursiveLock *)self->_lock unlock];
  return (int64_t)v3;
}

- (void)submitTaskToSubmittedQueue:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [v5 setTaskStatus:1];
  +[SiriTTSTrainingAgentUtils postTaskStatusNotification:](SiriTTSTrainingAgentUtils, "postTaskStatusNotification:", [v5 taskStatus]);
  [(TrainingTaskDatabase *)self addTaskToSubmittedQueue:v5];

  v6 = self->_lock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)addTaskToSubmittedQueue:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v4 taskId];
    v10 = [v4 trainingAssetPath];
    v11 = [v4 dataAssetPath];
    dispatch_queue_t v12 = [v4 inferenceAssetPath];
    v13 = [v4 agentTrainingAssetPath];
    v14 = [v4 agentInferenceAssetPath];
    *(_DWORD *)buf = 138413570;
    id v17 = v9;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "addTaskToSubmittedQueue: taskId=%@ trainingAssetPath=%@ dataAssetPath=%@ inferenceAssetPath=%@ agentTrainingAssetPath=%@ agentInferenceAssetPath=%@", buf, 0x3Eu);
  }
  id v15 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v7 = v15;
  if (v7)
  {
    v8 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "addTaskToSubmittedQueue: error=%@", buf, 0xCu);
    }
  }
  else
  {
    [(NSMutableArray *)self->_submittedTaskQueue addObject:v6];
    sub_10000E640((uint64_t)self->_defaults, self->_submittedTaskQueue, @"submitted_task_queue");
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)updateTaskToSubmittedQueue:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v4 taskId];
    v10 = [v4 trainingAssetPath];
    v11 = [v4 dataAssetPath];
    dispatch_queue_t v12 = [v4 inferenceAssetPath];
    id v13 = [v4 taskStatus];
    v14 = [v4 agentTrainingAssetPath];
    id v15 = [v4 agentInferenceAssetPath];
    int v16 = 138413826;
    id v17 = v9;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2048;
    id v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateTaskToSubmittedQueue: taskId=%@ trainingAssetPath=%@ dataAssetPath=%@ inferenceAssetPath=%@ taskStatus=%ld agentTrainingAssetPath=%@ agentInferenceAssetPath=%@", (uint8_t *)&v16, 0x48u);
  }
  uint64_t v6 = sub_10000EB90((uint64_t)self, self->_submittedTaskQueue, v4);
  if (v6 < 0)
  {
    id v7 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 taskId];
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateTaskToSubmittedQueue: taskId=%@ not found", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    [(NSMutableArray *)self->_submittedTaskQueue removeObjectAtIndex:v6];
    [(TrainingTaskDatabase *)self addTaskToSubmittedQueue:v4];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)updateTaskWithStatusToSubmittedQueue:(id)a3 taskStatus:(int64_t)a4
{
  lock = self->_lock;
  id v7 = a3;
  [(NSRecursiveLock *)lock lock];
  [v7 setTaskStatus:a4];
  +[SiriTTSTrainingAgentUtils postTaskStatusNotification:](SiriTTSTrainingAgentUtils, "postTaskStatusNotification:", [v7 taskStatus]);
  [(TrainingTaskDatabase *)self updateTaskToSubmittedQueue:v7];

  v8 = self->_lock;

  [(NSRecursiveLock *)v8 unlock];
}

- (void)updateTaskWithTrainingStatusToSubmittedQueue:(id)a3 trainingStatus:(int64_t)a4 currentProgressValue:(int64_t)a5 totalProgressValue:(int64_t)a6 normalizedProgressValue:(float)a7
{
  lock = self->_lock;
  id v13 = a3;
  [(NSRecursiveLock *)lock lock];
  [v13 setTrainingStatus:a4];
  [v13 setCurrentTaskStatusProgressValue:a5];
  [v13 setTotalTaskStatusProgressValue:a6];
  *(float *)&double v14 = a7;
  [v13 setNormalizedProgressValue:v14];
  [(TrainingTaskDatabase *)self updateTaskToSubmittedQueue:v13];

  id v15 = self->_lock;

  [(NSRecursiveLock *)v15 unlock];
}

- (id)getNextSubmittedTask
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableArray *)self->_submittedTaskQueue count];
    *(_DWORD *)buf = 134217984;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "getNextSubmittedTask: current task size=%ld", buf, 0xCu);
  }

  if ([(NSMutableArray *)self->_submittedTaskQueue count])
  {
    id v5 = [(NSMutableArray *)self->_submittedTaskQueue firstObject];
    id v19 = 0;
    uint64_t v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v19];
    id v7 = v19;
    v8 = SiriTTSTrainerGetLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        v10 = [v6 taskId];
        v11 = [v6 trainingAssetPath];
        [v6 dataAssetPath];
        dispatch_queue_t v12 = v18 = v7;
        id v13 = [v6 inferenceAssetPath];
        double v14 = [v6 agentTrainingAssetPath];
        id v15 = [v6 agentInferenceAssetPath];
        *(_DWORD *)buf = 138413570;
        id v21 = v10;
        __int16 v22 = 2112;
        v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        __int16 v26 = 2112;
        v27 = v13;
        __int16 v28 = 2112;
        v29 = v14;
        __int16 v30 = 2112;
        v31 = v15;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getNextSubmittedTask: taskId=%@ trainingAssetPath=%@ dataAssetPath=%@ inferenceAssetPath=%@ agentTrainingAssetPath=%@ agentInferenceAssetPath=%@", buf, 0x3Eu);

        id v7 = v18;
      }

      [(NSRecursiveLock *)self->_lock unlock];
      id v16 = v6;
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getNextSubmittedTask: error=%@", buf, 0xCu);
      }

      [(NSRecursiveLock *)self->_lock unlock];
    }
  }
  else
  {
    [(NSRecursiveLock *)self->_lock unlock];
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)addFailedTaskToFinishQueue:(id)a3 errorCode:(unint64_t)a4 description:(id)a5
{
  lock = self->_lock;
  id v9 = a5;
  id v10 = a3;
  [(NSRecursiveLock *)lock lock];
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  id v14 = v9;
  v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  dispatch_queue_t v12 = +[NSError errorWithDomain:@"SiriTTSTrainerTask" code:a4 userInfo:v11];
  [v10 setError:v12];

  [(TrainingTaskDatabase *)self addTaskToFinishedQueueWithStatus:v10 status:4];
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)addTaskToFinishedQueueWithStatus:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v7 = sub_10000EB90((uint64_t)self, self->_submittedTaskQueue, v6);
  v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 taskId];
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "addTaskToFinishedQueue: task_id=%@", buf, 0xCu);
  }
  if (v7 < 0)
  {
    id v10 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v6 taskId];
      *(_DWORD *)buf = 138412290;
      id v17 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "addTaskToFinishedQueue: task_id %@ not found from submitted queue.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  [v6 setTaskStatus:a4];
  +[SiriTTSTrainingAgentUtils postTaskStatusNotification:](SiriTTSTrainingAgentUtils, "postTaskStatusNotification:", [v6 taskStatus]);
  [(NSMutableArray *)self->_submittedTaskQueue removeObjectAtIndex:v7];
  sub_10000E640((uint64_t)self->_defaults, self->_submittedTaskQueue, @"submitted_task_queue");
  id v15 = 0;
  id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v11 = v15;
  if (!v11)
  {
    [(NSMutableArray *)self->_finishedTaskQueue addObject:v10];
    sub_10000E640((uint64_t)self->_defaults, self->_finishedTaskQueue, @"finished_task_queue");
LABEL_11:

    [(NSRecursiveLock *)self->_lock unlock];
    goto LABEL_12;
  }
  dispatch_queue_t v12 = v11;
  NSErrorUserInfoKey v13 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "addTaskToFinishedQueue: error=%@", buf, 0xCu);
  }

  [(NSRecursiveLock *)self->_lock unlock];
LABEL_12:
}

- (id)isTaskInSubmittedQueue:(id)a3
{
  id v18 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = self;
  id v4 = self->_submittedTaskQueue;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        id v19 = 0;
        id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v9 error:&v19];
        id v12 = v19;
        if (v12)
        {
          NSErrorUserInfoKey v13 = SiriTTSTrainerGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to unarchive task, error: %@", buf, 0xCu);
          }
        }
        else if (v11)
        {
          id v14 = [v11 taskId];
          unsigned __int8 v15 = [v14 isEqualToString:v18];

          if (v15)
          {
            [(NSRecursiveLock *)v17->_lock unlock];

            goto LABEL_16;
          }
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(NSRecursiveLock *)v17->_lock unlock];
  id v11 = 0;
LABEL_16:

  return v11;
}

- (id)getTaskById:(id)a3
{
  id v28 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  long long v38 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  v27 = self;
  id v4 = self->_submittedTaskQueue;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        id v34 = 0;
        id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v9 error:&v34];
        id v12 = v34;
        if (v12)
        {
          NSErrorUserInfoKey v13 = SiriTTSTrainerGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to unarchive task, error: %@", buf, 0xCu);
          }
        }
        else if (v11)
        {
          id v14 = [v11 taskId];
          unsigned __int8 v15 = [v14 isEqualToString:v28];

          if (v15)
          {
LABEL_28:
            [(NSRecursiveLock *)v27->_lock unlock];

            goto LABEL_29;
          }
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v27->_finishedTaskQueue;
  id v16 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v4);
        }
        uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
        uint64_t v21 = objc_opt_class();
        id v29 = 0;
        id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v21 fromData:v20 error:&v29];
        id v22 = v29;
        if (v22)
        {
          long long v23 = SiriTTSTrainerGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unable to unarchive task, error: %@", buf, 0xCu);
          }
        }
        else if (v11)
        {
          __int16 v24 = [v11 taskId];
          unsigned __int8 v25 = [v24 isEqualToString:v28];

          if (v25) {
            goto LABEL_28;
          }
        }
      }
      id v17 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v17);
  }

  [(NSRecursiveLock *)v27->_lock unlock];
  id v11 = 0;
LABEL_29:

  return v11;
}

- (id)getAllTasks
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = +[NSMutableArray array];
  id v4 = [(NSMutableArray *)self->_submittedTaskQueue arrayByAddingObjectsFromArray:self->_finishedTaskQueue];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        uint64_t v15 = 0;
        uint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v9 error:&v15];
        id v12 = (void *)v11;
        if (v15) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v11 == 0;
        }
        if (!v13) {
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (id)getSubmittedTasks
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_submittedTaskQueue;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        uint64_t v15 = 0;
        uint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v9 error:&v15];
        id v12 = (void *)v11;
        if (v15) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v11 == 0;
        }
        if (!v13) {
          [v3 addObject:v11];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (void)cleanUpQueue
{
  [(NSRecursiveLock *)self->_lock lock];
  [(NSMutableArray *)self->_submittedTaskQueue removeAllObjects];
  [(NSMutableArray *)self->_finishedTaskQueue removeAllObjects];
  sub_10000E640((uint64_t)self->_defaults, self->_submittedTaskQueue, @"submitted_task_queue");
  sub_10000E640((uint64_t)self->_defaults, self->_finishedTaskQueue, @"finished_task_queue");
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_finishedTaskQueue, 0);
  objc_storeStrong((id *)&self->_submittedTaskQueue, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end