@interface SDTaskDepotContainer
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7;
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7 withCompletionBlock:(id)a8;
- (BOOL)_execute;
- (BOOL)addSDTasksToContainer:(id)a3;
- (BOOL)addSDTasksToContainer:(id)a3 withTmpOutputDir:(id)a4;
- (BOOL)exceededAllowedCPUTime:(unint64_t)a3;
- (BOOL)isConcurrent;
- (BOOL)isRunningAlone;
- (BOOL)mayStartExecuting;
- (BOOL)ranForMaximumTime;
- (BOOL)ranForMinimumTime;
- (BOOL)startTasks;
- (BOOL)startTasksSequentially;
- (NSMutableArray)runningTasks;
- (OS_dispatch_queue)sequentialTasksQueue;
- (OS_dispatch_semaphore)sequentialTasksSem;
- (id)completionBlock;
- (id)createTaskHandlers:(id)a3;
- (id)timeoutMetricsString;
- (int64_t)numExitedTasks;
- (int64_t)numReapedTasks;
- (int64_t)numTimeouts;
- (unint64_t)countCPUTimeUsedNS;
- (unint64_t)cpuTimeUsedNS;
- (unint64_t)reapTasks;
- (unint64_t)wallTimeUsedNS;
- (void)endExecution;
- (void)markTaskAsDone:(id)a3;
- (void)replaceTaskArguments:(id)a3 withSubstitutionKey:(id)a4 withSubstitutionString:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setCpuTimeUsedNS:(unint64_t)a3;
- (void)setIsConcurrent:(BOOL)a3;
- (void)setMayStartExecuting:(BOOL)a3;
- (void)setNumExitedTasks:(int64_t)a3;
- (void)setNumReapedTasks:(int64_t)a3;
- (void)setNumTimeouts:(int64_t)a3;
- (void)setRunningTasks:(id)a3;
- (void)setSequentialTasksQueue:(id)a3;
- (void)setSequentialTasksSem:(id)a3;
- (void)setTasks:(id)a3;
- (void)setWallTimeUsedNS:(unint64_t)a3;
- (void)startTimeout;
@end

@implementation SDTaskDepotContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a7;
  id v13 = a4;
  v14 = [(SDContainer *)[SDTaskDepotContainer alloc] initWithName:v11 andDestination:v13 withDelegate:v12];

  if (v14)
  {
    [(SDTaskContainer *)v14 setTimeout:a5];
    [(SDTaskDepotContainer *)v14 setIsConcurrent:v8];
    [(SDTaskDepotContainer *)v14 setMayStartExecuting:1];
    [(SDContainer *)v14 setName:v11];
    v15 = +[NSMutableArray array];
    [(SDTaskDepotContainer *)v14 setRunningTasks:v15];

    [(SDTaskDepotContainer *)v14 setNumExitedTasks:0];
    [(SDTaskDepotContainer *)v14 setNumReapedTasks:0];
    [(SDTaskContainer *)v14 setTimeoutSource:0];
    [(SDTaskDepotContainer *)v14 setNumTimeouts:0];
    [(SDTaskDepotContainer *)v14 setCompletionBlock:0];
    [(SDTaskDepotContainer *)v14 setWallTimeUsedNS:0];
    [(SDTaskDepotContainer *)v14 setCpuTimeUsedNS:0];
    [(SDTaskDepotContainer *)v14 setSequentialTasksQueue:0];
    [(SDTaskDepotContainer *)v14 setSequentialTasksSem:0];
  }

  return v14;
}

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7 withCompletionBlock:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  v17 = [(id)objc_opt_class() containerWithName:v16 destination:v15 withTimeout:v9 withConcurrency:v14 withDelegate:a5];

  if (v17) {
    [v17 setCompletionBlock:v13];
  }

  return v17;
}

- (BOOL)addSDTasksToContainer:(id)a3
{
  return [(SDTaskDepotContainer *)self addSDTasksToContainer:a3 withTmpOutputDir:0];
}

- (BOOL)addSDTasksToContainer:(id)a3 withTmpOutputDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v11);
        id v13 = [(SDContainer *)self destination];
        id v14 = [v13 copy];
        [v12 setDestination:v14];

        if (v7) {
          [(SDTaskDepotContainer *)self replaceTaskArguments:v12 withSubstitutionKey:@"<TMPOUTPUTDIR>" withSubstitutionString:v7];
        }
        uint64_t v15 = [(SDContainer *)self runtimeFlagDelegate];
        if (v15)
        {
          id v16 = (void *)v15;
          v17 = [(SDContainer *)self runtimeFlagDelegate];
          v18 = [v17 providedPIDorProcess];

          if (v18)
          {
            v19 = [(SDContainer *)self runtimeFlagDelegate];
            v20 = [v19 providedPIDorProcess];
            [(SDTaskDepotContainer *)self replaceTaskArguments:v12 withSubstitutionKey:@"<PID>" withSubstitutionString:v20];
          }
        }
        v21 = [v12 launchPath];
        v22 = [v12 arguments];
        id v23 = [v22 count];

        if (v23)
        {
          v24 = [v21 stringByAppendingString:@" "];

          v25 = [v12 arguments];
          v26 = [v25 componentsJoinedByString:@" "];
          v21 = [v24 stringByAppendingString:v26];
        }
        if (-[SDContainer evaluateCollectionFlagsWithOverlay:withName:](self, "evaluateCollectionFlagsWithOverlay:withName:", [v12 runtimeChecks], v21))
        {
          v27 = [(SDContainer *)self units];
          [v27 addObject:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  return 1;
}

- (void)markTaskAsDone:(id)a3
{
  id v4 = a3;
  v5 = sub_100028174();
  id v6 = v5;
  if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v5))
  {
    int v13 = 134217984;
    double v14 = (double)(unint64_t)[v4 cpuTimeUsedNS] / 1000000000.0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CLI Task", "CPU time: %fs", (uint8_t *)&v13, 0xCu);
  }

  id v7 = [(SDTaskDepotContainer *)self sequentialTasksSem];

  if (v7)
  {
    id v8 = [(SDTaskDepotContainer *)self sequentialTasksSem];
    dispatch_semaphore_signal(v8);
  }
  [v4 executionTime];
  [(SDTaskDepotContainer *)self setWallTimeUsedNS:(char *)[(SDTaskDepotContainer *)self wallTimeUsedNS] + (unint64_t)(v9 * 1000000000.0)];
  -[SDTaskDepotContainer setCpuTimeUsedNS:](self, "setCpuTimeUsedNS:", (char *)[v4 cpuTimeUsedNS] + -[SDTaskDepotContainer cpuTimeUsedNS](self, "cpuTimeUsedNS"));
  [(SDTaskDepotContainer *)self setNumExitedTasks:(char *)[(SDTaskDepotContainer *)self numExitedTasks] + 1];
  uint64_t v10 = [(SDTaskDepotContainer *)self runningTasks];
  [v10 removeObject:v4];

  id v11 = [(SDTaskDepotContainer *)self runningTasks];
  id v12 = [v11 count];

  if (!v12) {
    [(SDTaskDepotContainer *)self endExecution];
  }
}

- (id)createTaskHandlers:(id)a3
{
  id v4 = a3;
  v5 = +[SDTaskDepot sharedTaskDepot];
  id v6 = [v5 taskQueue];
  id v7 = sub_10002899C(v4, v6);
  [v4 setExitSource:v7];

  id v8 = [v4 exitSource];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100044390;
  handler[3] = &unk_10009D2B8;
  handler[4] = self;
  id v9 = v4;
  id v21 = v9;
  dispatch_source_set_event_handler(v8, handler);

  uint64_t v10 = [v9 exitSource];
  double v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100044488;
  v17 = &unk_10009D2B8;
  v18 = self;
  id v19 = v9;
  id v11 = v9;
  dispatch_source_set_cancel_handler(v10, &v14);

  id v12 = [v11 exitSource:v14, v15, v16, v17, v18];

  return v12;
}

- (void)endExecution
{
  v3 = +[SDTaskDepot sharedTaskDepot];
  id v4 = [v3 taskQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(SDTaskContainer *)self timeoutSource];

  if (v5)
  {
    id v6 = [(SDTaskContainer *)self timeoutSource];
    dispatch_source_cancel(v6);
  }
  double v7 = (double)[(SDTaskDepotContainer *)self wallTimeUsedNS];
  double v8 = (double)[(SDTaskDepotContainer *)self cpuTimeUsedNS] / 1000000000.0;
  [(SDTaskContainer *)self timeout];
  if (v9 == 0.0)
  {
    double v11 = 0.0;
  }
  else
  {
    [(SDTaskContainer *)self timeout];
    double v11 = v8 / v10 * 100.0;
  }
  double v12 = v7 / 1000000000.0;
  int64_t v13 = [(SDTaskDepotContainer *)self numExitedTasks];
  int64_t v14 = v13 - [(SDTaskDepotContainer *)self numReapedTasks];
  uint64_t v15 = sub_10002820C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(SDContainer *)self name];
    v17 = [(SDTaskDepotContainer *)self tasks];
    id v18 = [v17 count];
    double v19 = v8 / v12;
    [(SDTaskContainer *)self timeout];
    *(_DWORD *)buf = 138414338;
    v43 = v16;
    __int16 v44 = 2048;
    int64_t v45 = v14;
    __int16 v46 = 2048;
    id v47 = v18;
    __int16 v48 = 2048;
    double v49 = v7 / 1000000000.0;
    __int16 v50 = 2048;
    double v51 = v8;
    __int16 v52 = 2048;
    double v53 = v8 / v12;
    __int16 v54 = 2048;
    uint64_t v55 = v20;
    __int16 v56 = 2048;
    double v57 = v11;
    __int16 v58 = 2048;
    int64_t v59 = [(SDTaskDepotContainer *)self numTimeouts];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] ", buf, 0x5Cu);
  }
  else
  {
    double v19 = v8 / v12;
  }

  id v21 = +[SDResourceManager sharedResourceManager];
  v22 = [(SDContainer *)self name];
  id v23 = [(SDTaskDepotContainer *)self tasks];
  id v24 = [v23 count];
  [(SDTaskContainer *)self timeout];
  [v21 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] ", v22, v14, v24, *(void *)&v12, *(void *)&v8, *(void *)&v19, v25, *(void *)&v11, -[SDTaskDepotContainer numTimeouts](self, "numTimeouts") category msg];

  v26 = [(SDTaskDepotContainer *)self completionBlock];

  if (v26)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100044A0C;
    v41[3] = &unk_10009CFE0;
    v41[4] = self;
    double v27 = sub_100028914(v41);
    if (v27 > 1.0)
    {
      v28 = sub_10002820C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100064ABC(self);
      }

      v29 = +[SDResourceManager sharedResourceManager];
      long long v30 = [(SDContainer *)self name];
      [v29 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v30, *(void *)&v27, 0x3FF0000000000000 category msg];
    }
  }
  long long v31 = +[SDTaskDepot sharedTaskDepot];
  uint64_t v32 = [v31 pushBufferDelegate];
  if (v32)
  {
    long long v33 = (void *)v32;
    v34 = [v31 pushBufferDelegate];
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      v36 = [v31 pushBufferDelegate];
      v37 = [(SDTaskDepotContainer *)self tasks];
      [(SDTaskContainer *)self timeout];
      double v39 = v38;
      v40 = [(SDContainer *)self name];
      [v36 writeReportForTasks:v37 withTimeout:1 concurrently:v40 withDepotName:v39];
    }
  }
  [v31 recordTaskContainerEnd:self];
}

- (unint64_t)reapTasks
{
  v3 = [(SDTaskDepotContainer *)self runningTasks];
  id v4 = [v3 count];

  if (v4)
  {
    [(SDTaskDepotContainer *)self setMayStartExecuting:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = [(SDTaskDepotContainer *)self runningTasks];
    id v6 = [v5 copy];

    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 isRunning])
          {
            ++v9;
            [v12 stop];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }

    int64_t v13 = sub_10002820C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = [(SDContainer *)self name];
      *(_DWORD *)buf = 134218242;
      unint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Reaping %lu tasks for container: %@", buf, 0x16u);
    }
    uint64_t v15 = +[SDResourceManager sharedResourceManager];
    id v16 = [(SDContainer *)self name];
    [v15 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Reaping %lu tasks for container: %@", v9, v16 category msg];
  }
  else
  {
    if ([(SDTaskDepotContainer *)self mayStartExecuting])
    {
      [(SDTaskDepotContainer *)self setMayStartExecuting:0];
      [(SDTaskDepotContainer *)self endExecution];
    }
    return 0;
  }
  return v9;
}

- (id)timeoutMetricsString
{
  int64_t v3 = [(SDTaskDepotContainer *)self numTimeouts];
  [(SDTaskContainer *)self timeout];
  uint64_t v5 = v4;
  [(SDTaskContainer *)self elapsedTime];
  uint64_t v7 = v6;
  double v8 = (double)[(SDTaskDepotContainer *)self countCPUTimeUsedNS] / 1000000000.0;
  unint64_t v9 = +[SDTaskDepot sharedTaskDepot];
  uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(numTimeouts: %ld) (timeout: %f) (elapsed time: %.2fs) (CPU time used: %.2f) (task containers running: %ld)", v3, v5, v7, *(void *)&v8, [v9 numRunningTaskContainers]);

  return v10;
}

- (unint64_t)countCPUTimeUsedNS
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SDTaskDepotContainer *)self tasks];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) cpuTimeUsedNS];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)exceededAllowedCPUTime:(unint64_t)a3
{
  double v3 = (double)a3;
  [(SDTaskContainer *)self timeout];
  return v4 * 1000000000.0 <= v3;
}

- (BOOL)ranForMinimumTime
{
  [(SDTaskContainer *)self timeout];
  double v4 = v3;
  unint64_t v5 = +[SDTaskDepot sharedTaskDepot];
  [v5 minimumTimeBeforeTimeouts];
  double v7 = v4 + v6;

  [(SDTaskContainer *)self elapsedTime];
  return v8 >= v7;
}

- (BOOL)ranForMaximumTime
{
  [(SDTaskContainer *)self elapsedTime];
  double v4 = v3;
  [(SDTaskContainer *)self timeout];
  if (v5 >= 60.0) {
    double v6 = v5;
  }
  else {
    double v6 = 60.0;
  }
  double v7 = +[SDTaskDepot sharedTaskDepot];
  [v7 minimumTimeBeforeTimeouts];
  BOOL v9 = v4 >= v6 + v8;

  return v9;
}

- (BOOL)isRunningAlone
{
  double v3 = +[SDTaskDepot sharedTaskDepot];
  if ([v3 numRunningTaskContainers] == (id)1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(SDTaskContainer *)self runByItself];
  }

  return v4;
}

- (void)startTimeout
{
  [(SDTaskContainer *)self timeout];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100045054;
  v3[3] = &unk_10009CFE0;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (void)replaceTaskArguments:(id)a3 withSubstitutionKey:(id)a4 withSubstitutionString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [v7 arguments];

  if (v10)
  {
    long long v11 = [v7 arguments];
    id v12 = [v11 mutableCopy];

    if ([v12 count])
    {
      unint64_t v13 = 0;
      do
      {
        int64_t v14 = [v7 arguments];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v13];

        if ([v15 rangeOfString:v8] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v16 = [v15 stringByReplacingOccurrencesOfString:v8 withString:v9];
          v17 = sub_10002820C();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v21 = v8;
            __int16 v22 = 2112;
            unint64_t v23 = v15;
            __int16 v24 = 2112;
            uint64_t v25 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ Substitution found: %@ --> %@", buf, 0x20u);
          }

          long long v18 = +[SDResourceManager sharedResourceManager];
          [v18 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ Substitution found: %@ --> %@", v8, v15, v16 category msg];

          [v12 replaceObjectAtIndex:v13 withObject:v16];
        }

        ++v13;
      }
      while ((unint64_t)[v12 count] > v13);
    }
    id v19 = [v12 copy];
    [v7 setArguments:v19];
  }
  else
  {
    [v7 setArguments:&__NSArray0__struct];
  }
}

- (BOOL)startTasks
{
  double v3 = [(SDTaskDepotContainer *)self runningTasks];
  BOOL v4 = [(SDTaskDepotContainer *)self tasks];
  [v3 addObjectsFromArray:v4];

  double v5 = +[SDTaskDepot sharedTaskDepot];
  if ([v5 noTimeout])
  {
  }
  else
  {
    [(SDTaskContainer *)self timeout];
    double v7 = v6;

    if (v7 > 0.0) {
      [(SDTaskDepotContainer *)self startTimeout];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = [(SDTaskDepotContainer *)self tasks];
  id v9 = [v8 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v9)
  {
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v8);
        }
        int64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v15 = [(SDTaskDepotContainer *)self sequentialTasksSem];

        if (v15)
        {
          id v16 = [(SDTaskDepotContainer *)self sequentialTasksSem];
          dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
        }
        if (![(SDTaskDepotContainer *)self mayStartExecuting])
        {
          double v27 = sub_10002820C();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [(SDContainer *)self name];
            v29 = [v14 description];
            *(_DWORD *)buf = 138412546;
            __int16 v52 = v28;
            __int16 v53 = 2112;
            __int16 v54 = v29;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@ container] Can't start task %@ in because the container has been stopped", buf, 0x16u);
          }
          long long v30 = +[SDResourceManager sharedResourceManager];
          long long v31 = [(SDContainer *)self name];
          uint64_t v32 = [v14 description];
          [v30 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Can't start task %@ in because the container has been stopped", v31, v32 category msg];

          long long v33 = [(SDTaskDepotContainer *)self sequentialTasksSem];

          if (v33)
          {
            v34 = +[SDTaskDepot sharedTaskDepot];
            char v35 = [v34 taskQueue];
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_100045C6C;
            v46[3] = &unk_10009CFE0;
            v46[4] = self;
            dispatch_sync(v35, v46);

            v36 = [(SDTaskDepotContainer *)self sequentialTasksSem];
            dispatch_semaphore_signal(v36);
          }
          else
          {
            [(SDTaskDepotContainer *)self endExecution];
          }
          goto LABEL_29;
        }
        if ([v14 createChild])
        {
          v17 = [(SDTaskDepotContainer *)self createTaskHandlers:v14];
          dispatch_resume(v17);
          ++v11;
        }
        else
        {
          long long v18 = sub_10002820C();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = [v14 description];
            v26 = [(SDContainer *)self name];
            *(_DWORD *)buf = 138412546;
            __int16 v52 = v25;
            __int16 v53 = 2112;
            __int16 v54 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create child process for task %@ in group %@", buf, 0x16u);
          }
          id v19 = +[SDResourceManager sharedResourceManager];
          long long v20 = [v14 description];
          id v21 = [(SDContainer *)self name];
          [v19 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to create child process for task %@ in group %@", v20, v21 category msg];

          [v14 setStopped:1];
          __int16 v22 = [(SDTaskDepotContainer *)self sequentialTasksSem];

          if (v22)
          {
            unint64_t v23 = +[SDTaskDepot sharedTaskDepot];
            __int16 v24 = [v23 taskQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100045C74;
            block[3] = &unk_10009D2B8;
            block[4] = self;
            block[5] = v14;
            dispatch_sync(v24, block);

            v17 = [(SDTaskDepotContainer *)self sequentialTasksSem];
            dispatch_semaphore_signal(v17);
          }
          else
          {
            v17 = [(SDTaskDepotContainer *)self runningTasks];
            [v17 removeObject:v14];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_29:

    if (v11) {
      return 1;
    }
  }
  else
  {
  }
  double v38 = sub_10002820C();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    sub_100064C04(self);
  }

  double v39 = +[SDResourceManager sharedResourceManager];
  v40 = [(SDContainer *)self name];
  [v39 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"No tasks were created for %@", v40 category msg];

  v41 = [(SDTaskDepotContainer *)self sequentialTasksSem];

  if (v41)
  {
    v42 = +[SDTaskDepot sharedTaskDepot];
    v43 = [v42 taskQueue];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100045CC8;
    v44[3] = &unk_10009CFE0;
    v44[4] = self;
    dispatch_sync(v43, v44);
  }
  else
  {
    [(SDTaskDepotContainer *)self endExecution];
  }
  return 0;
}

- (BOOL)startTasksSequentially
{
  double v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepotContainer.sequentialTasksQueue", v3);
  [(SDTaskDepotContainer *)self setSequentialTasksQueue:v4];

  dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
  [(SDTaskDepotContainer *)self setSequentialTasksSem:v5];

  double v6 = [(SDTaskDepotContainer *)self sequentialTasksQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045DC0;
  block[3] = &unk_10009CFE0;
  block[4] = self;
  dispatch_async(v6, block);

  return 1;
}

- (BOOL)_execute
{
  double v3 = +[SDTaskDepot sharedTaskDepot];
  if ([v3 mayStartExecuting])
  {
    [v3 recordTaskContainerStart:self];
    dispatch_queue_t v4 = [(SDTaskDepotContainer *)self tasks];
    id v5 = [v4 count];

    if (![(SDTaskDepotContainer *)self isConcurrent] && (unint64_t)v5 <= 1)
    {
      double v6 = sub_10002820C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100064C88(self);
      }

      double v7 = +[SDResourceManager sharedResourceManager];
      id v8 = [(SDContainer *)self name];
      [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Container %@ shouldn't be marked as not concurrent because it only has %lu task", v8, v5 category msg];

      [(SDTaskDepotContainer *)self setIsConcurrent:1];
    }
    if ([(SDTaskDepotContainer *)self isConcurrent]) {
      unsigned __int8 v9 = [(SDTaskDepotContainer *)self startTasks];
    }
    else {
      unsigned __int8 v9 = [(SDTaskDepotContainer *)self startTasksSequentially];
    }
    BOOL v14 = v9;
  }
  else
  {
    id v10 = sub_10002820C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(SDContainer *)self name];
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@ container] Can't execute because sysdiagnose has stopped", buf, 0xCu);
    }
    uint64_t v12 = +[SDResourceManager sharedResourceManager];
    unint64_t v13 = [(SDContainer *)self name];
    [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Can't execute because sysdiagnose has stopped", v13 category msg];

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isConcurrent
{
  return self->_isConcurrent;
}

- (void)setIsConcurrent:(BOOL)a3
{
  self->_isConcurrent = a3;
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (void)setTasks:(id)a3
{
}

- (NSMutableArray)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
}

- (int64_t)numExitedTasks
{
  return self->_numExitedTasks;
}

- (void)setNumExitedTasks:(int64_t)a3
{
  self->_numExitedTasks = a3;
}

- (int64_t)numReapedTasks
{
  return self->_numReapedTasks;
}

- (void)setNumReapedTasks:(int64_t)a3
{
  self->_numReapedTasks = a3;
}

- (int64_t)numTimeouts
{
  return self->_numTimeouts;
}

- (void)setNumTimeouts:(int64_t)a3
{
  self->_numTimeouts = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  return self->_cpuTimeUsedNS;
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_cpuTimeUsedNS = a3;
}

- (unint64_t)wallTimeUsedNS
{
  return self->_wallTimeUsedNS;
}

- (void)setWallTimeUsedNS:(unint64_t)a3
{
  self->_wallTimeUsedNS = a3;
}

- (OS_dispatch_queue)sequentialTasksQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSequentialTasksQueue:(id)a3
{
}

- (OS_dispatch_semaphore)sequentialTasksSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSequentialTasksSem:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_sequentialTasksSem, 0);
  objc_storeStrong((id *)&self->_sequentialTasksQueue, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);

  objc_storeStrong((id *)&self->_tasks, 0);
}

@end