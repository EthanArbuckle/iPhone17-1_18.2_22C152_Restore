@interface SDTaskDepot
+ (id)sharedTaskDepot;
+ (unint64_t)stopTasks;
+ (void)signalInterrupt;
+ (void)signalStopTasks;
- (BOOL)allTasksComplete;
- (BOOL)mayStartExecuting;
- (BOOL)noTimeout;
- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3;
- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3 withSemaphore:(id)a4;
- (NSMutableArray)allTasksFinishedSemaphoresArray;
- (NSMutableArray)runningTaskContainers;
- (NSString)outputDirectory;
- (OS_dispatch_queue)taskQueue;
- (OS_dispatch_semaphore)defaultAllTasksFinishedSemaphore;
- (SDTaskDepotPushBufferDelegate)pushBufferDelegate;
- (double)minimumTimeBeforeTimeouts;
- (id)taskCompletionBlock;
- (int)totalFailedTasks;
- (int)totalTimeouts;
- (int64_t)numRunningBlocks;
- (int64_t)numRunningHelperTasks;
- (int64_t)numRunningTaskContainers;
- (unint64_t)_reapTasks;
- (unint64_t)totalTaskContainers;
- (unint64_t)totalTasks;
- (void)continueExecution;
- (void)recordBlockTaskEnd;
- (void)recordBlockTaskStart;
- (void)recordHelperTaskEnd;
- (void)recordHelperTaskStart;
- (void)recordTaskContainerEnd:(id)a3;
- (void)recordTaskContainerStart:(id)a3;
- (void)recordTaskEnd;
- (void)setAllTasksFinishedSemaphoresArray:(id)a3;
- (void)setDefaultAllTasksFinishedSemaphore:(id)a3;
- (void)setMayStartExecuting:(BOOL)a3;
- (void)setMinimumTimeBeforeTimeouts:(double)a3;
- (void)setNoTimeout:(BOOL)a3;
- (void)setNumRunningBlocks:(int64_t)a3;
- (void)setNumRunningHelperTasks:(int64_t)a3;
- (void)setNumRunningTaskContainers:(int64_t)a3;
- (void)setOutputDirectory:(id)a3;
- (void)setPushBufferDelegate:(id)a3;
- (void)setRunningTaskContainers:(id)a3;
- (void)setTaskCompletionBlock:(id)a3;
- (void)setTaskQueue:(id)a3;
- (void)setTotalFailedTasks:(int)a3;
- (void)setTotalTaskContainers:(unint64_t)a3;
- (void)setTotalTasks:(unint64_t)a3;
- (void)setTotalTimeouts:(int)a3;
@end

@implementation SDTaskDepot

+ (id)sharedTaskDepot
{
  if (qword_1000BD8B8 != -1) {
    dispatch_once(&qword_1000BD8B8, &stru_10009DCB8);
  }
  v2 = (void *)qword_1000BD8B0;

  return v2;
}

- (void)recordTaskContainerStart:(id)a3
{
  id v4 = a3;
  v5 = [v4 tasks];
  -[SDTaskDepot setTotalTasks:](self, "setTotalTasks:", (char *)[v5 count] + -[SDTaskDepot totalTasks](self, "totalTasks"));

  [(SDTaskDepot *)self setTotalTaskContainers:(char *)[(SDTaskDepot *)self totalTaskContainers] + 1];
  id v6 = [(SDTaskDepot *)self runningTaskContainers];
  [v6 addObject:v4];
}

- (void)recordTaskContainerEnd:(id)a3
{
  id v4 = a3;
  v5 = [(SDTaskDepot *)self runningTaskContainers];
  [v5 removeObject:v4];

  [(SDTaskDepot *)self recordTaskEnd];
}

- (void)recordHelperTaskStart
{
  [(SDTaskDepot *)self setTotalTasks:(char *)[(SDTaskDepot *)self totalTasks] + 1];
  v3 = (char *)[(SDTaskDepot *)self numRunningHelperTasks] + 1;

  [(SDTaskDepot *)self setNumRunningHelperTasks:v3];
}

- (void)recordHelperTaskEnd
{
  [(SDTaskDepot *)self setNumRunningHelperTasks:(char *)[(SDTaskDepot *)self numRunningHelperTasks] - 1];

  [(SDTaskDepot *)self recordTaskEnd];
}

- (void)recordBlockTaskStart
{
  [(SDTaskDepot *)self setTotalTasks:(char *)[(SDTaskDepot *)self totalTasks] + 1];
  v3 = (char *)[(SDTaskDepot *)self numRunningBlocks] + 1;

  [(SDTaskDepot *)self setNumRunningBlocks:v3];
}

- (void)recordBlockTaskEnd
{
  [(SDTaskDepot *)self setNumRunningBlocks:(char *)[(SDTaskDepot *)self numRunningBlocks] - 1];

  [(SDTaskDepot *)self recordTaskEnd];
}

- (void)recordTaskEnd
{
  v3 = [(SDTaskDepot *)self taskCompletionBlock];

  if (v3)
  {
    id v4 = [(SDTaskDepot *)self taskCompletionBlock];
    v4[2]();
  }
  if ([(SDTaskDepot *)self allTasksComplete])
  {
    [(SDTaskDepot *)self continueExecution];
  }
}

- (int64_t)numRunningTaskContainers
{
  v3 = [(SDTaskDepot *)self runningTaskContainers];
  id v4 = (char *)[v3 count];
  int64_t v5 = [(SDTaskDepot *)self numRunningHelperTasks];
  id v6 = &v4[[(SDTaskDepot *)self numRunningBlocks] + v5];

  return (int64_t)v6;
}

- (BOOL)allTasksComplete
{
  return [(SDTaskDepot *)self numRunningTaskContainers] < 1;
}

- (void)continueExecution
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TaskDepot unblocking waiting threads", buf, 2u);
  }
  v3 = +[SDResourceManager sharedResourceManager];
  [v3 stdoutWrite:@"TaskDepot unblocking waiting threads"];

  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 log:@"TaskDepot unblocking waiting threads"];

  int64_t v5 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3 withSemaphore:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if ([(SDTaskDepot *)self allTasksComplete])
    {
      BOOL v7 = 1;
    }
    else
    {
      long long v10 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
      objc_sync_enter(v10);
      long long v11 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
      unsigned int v12 = [v11 containsObject:v6];

      if (v12)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10006493C();
        }
        long long v13 = +[SDResourceManager sharedResourceManager];
        [v13 stderrWrite:@"Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."];

        v14 = +[SDResourceManager sharedResourceManager];
        [v14 log:@"Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."];
      }
      v15 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
      [v15 addObject:v6];

      objc_sync_exit(v10);
      if (a3) {
        dispatch_time_t v16 = dispatch_time(0, 1000000000 * a3);
      }
      else {
        dispatch_time_t v16 = -1;
      }
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      char v34 = 0;
      v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      v26 = sub_1000425A4;
      v27 = &unk_10009DCE0;
      v29 = &v31;
      id v17 = v6;
      id v28 = v17;
      dispatch_time_t v30 = v16;
      double v18 = sub_100028914(&v24);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Blocked thread for %.1fs while waiting for tasks to complete", buf, 0xCu);
      }
      v19 = +[SDResourceManager sharedResourceManager];
      [v19 log:@"Blocked thread for %.1fs while waiting for tasks to complete", *(void *)&v18, v24, v25, v26, v27];

      if (*((unsigned char *)v32 + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000648BC(a3);
        }
        v20 = +[SDResourceManager sharedResourceManager];
        [v20 log:@"Timed out waiting for all tasks to complete. Timeout: %llus", a3];
      }
      v21 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
      objc_sync_enter(v21);
      v22 = [(SDTaskDepot *)self allTasksFinishedSemaphoresArray];
      [v22 removeObject:v17];

      objc_sync_exit(v21);
      BOOL v7 = *((unsigned char *)v32 + 24) == 0;

      _Block_object_dispose(&v31, 8);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100064874();
    }
    uint64_t v8 = +[SDResourceManager sharedResourceManager];
    [v8 stderrWrite:@"Semaphore to wait for tasks to complete is nil"];

    v9 = +[SDResourceManager sharedResourceManager];
    [v9 log:@"Semaphore to wait for tasks to complete is nil"];

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3
{
  int64_t v5 = [(SDTaskDepot *)self defaultAllTasksFinishedSemaphore];
  LOBYTE(a3) = [(SDTaskDepot *)self waitUntilAllTasksComplete:a3 withSemaphore:v5];

  return a3;
}

- (unint64_t)_reapTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to reap tasks...", buf, 2u);
  }
  v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"Trying to reap tasks..."];

  *(void *)buf = 0;
  v20 = buf;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(SDTaskDepot *)self runningTaskContainers];
  id obj = [v4 copy];

  id v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v7);
        v9 = +[SDTaskDepot sharedTaskDepot];
        long long v10 = [v9 taskQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100042890;
        block[3] = &unk_10009DD08;
        block[4] = v8;
        block[5] = buf;
        dispatch_sync(v10, block);

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }

  unint64_t v11 = *((void *)v20 + 3);
  _Block_object_dispose(buf, 8);
  return v11;
}

+ (unint64_t)stopTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopping TaskDepot.", buf, 2u);
  }
  v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"Stopping TaskDepot."];

  v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"Stopping TaskDepot."];

  id v4 = +[SDTaskDepot sharedTaskDepot];
  id v5 = [v4 taskQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042A38;
  block[3] = &unk_10009CFE0;
  id v11 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = [v6 _reapTasks];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  [v6 waitUntilAllTasksComplete:60 withSemaphore:v8];

  return (unint64_t)v7;
}

+ (void)signalInterrupt
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n", v5, 2u);
  }
  v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n"];

  v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n"];

  id v4 = +[SDTaskDepot sharedTaskDepot];
  [v4 _reapTasks];
}

+ (void)signalStopTasks
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nTerminated, cleaning up subtasks and blocking new ones...\n", buf, 2u);
  }
  v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"\nTerminated, cleaning up subtasks and blocking new ones...\n"];

  v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"\nTerminated, cleaning up subtasks and blocking new ones...\n"];

  +[SDTaskDepot stopTasks];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting stop notification", v9, 2u);
  }
  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 log:@"Posting stop notification"];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sysdiagnose.sysdiagnoseStopped", 0, 0, 1u);
  id v6 = +[NSFileManager defaultManager];
  id v7 = +[SDTaskDepot sharedTaskDepot];
  dispatch_semaphore_t v8 = [v7 outputDirectory];
  [v6 removeItemAtPath:v8 error:0];
}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputDirectory:(id)a3
{
}

- (unint64_t)totalTasks
{
  return self->_totalTasks;
}

- (void)setTotalTasks:(unint64_t)a3
{
  self->_totalTasks = a3;
}

- (unint64_t)totalTaskContainers
{
  return self->_totalTaskContainers;
}

- (void)setTotalTaskContainers:(unint64_t)a3
{
  self->_totalTaskContainers = a3;
}

- (int)totalFailedTasks
{
  return self->_totalFailedTasks;
}

- (void)setTotalFailedTasks:(int)a3
{
  self->_totalFailedTasks = a3;
}

- (int)totalTimeouts
{
  return self->_totalTimeouts;
}

- (void)setTotalTimeouts:(int)a3
{
  self->_totalTimeouts = a3;
}

- (NSMutableArray)runningTaskContainers
{
  return self->_runningTaskContainers;
}

- (void)setRunningTaskContainers:(id)a3
{
}

- (int64_t)numRunningHelperTasks
{
  return self->_numRunningHelperTasks;
}

- (void)setNumRunningHelperTasks:(int64_t)a3
{
  self->_numRunningHelperTasks = a3;
}

- (int64_t)numRunningBlocks
{
  return self->_numRunningBlocks;
}

- (void)setNumRunningBlocks:(int64_t)a3
{
  self->_numRunningBlocks = a3;
}

- (void)setNumRunningTaskContainers:(int64_t)a3
{
  self->_numRunningTaskContainers = a3;
}

- (SDTaskDepotPushBufferDelegate)pushBufferDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pushBufferDelegate);

  return (SDTaskDepotPushBufferDelegate *)WeakRetained;
}

- (void)setPushBufferDelegate:(id)a3
{
}

- (OS_dispatch_queue)taskQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTaskQueue:(id)a3
{
}

- (OS_dispatch_semaphore)defaultAllTasksFinishedSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDefaultAllTasksFinishedSemaphore:(id)a3
{
}

- (NSMutableArray)allTasksFinishedSemaphoresArray
{
  return self->_allTasksFinishedSemaphoresArray;
}

- (void)setAllTasksFinishedSemaphoresArray:(id)a3
{
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (BOOL)noTimeout
{
  return self->_noTimeout;
}

- (void)setNoTimeout:(BOOL)a3
{
  self->_noTimeout = a3;
}

- (double)minimumTimeBeforeTimeouts
{
  return self->_minimumTimeBeforeTimeouts;
}

- (void)setMinimumTimeBeforeTimeouts:(double)a3
{
  self->_minimumTimeBeforeTimeouts = a3;
}

- (id)taskCompletionBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setTaskCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskCompletionBlock, 0);
  objc_storeStrong((id *)&self->_allTasksFinishedSemaphoresArray, 0);
  objc_storeStrong((id *)&self->_defaultAllTasksFinishedSemaphore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_destroyWeak((id *)&self->_pushBufferDelegate);
  objc_storeStrong((id *)&self->_runningTaskContainers, 0);

  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

@end