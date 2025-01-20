@interface UIKeyboardTaskQueue
- (BOOL)isEmpty;
- (BOOL)isMainThreadExecutingTask;
- (BOOL)tryLockWhenReadyForMainThread;
- (NSArray)activeOriginator;
- (UIKeyboardTaskExecutionContext)executionContext;
- (UIKeyboardTaskQueue)init;
- (id)activeTaskBreadcrumb;
- (id)addAndReturnTask:(id)a3 breadcrumb:(id)a4;
- (id)diagnosticTrampoline;
- (id)scheduleTask:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5;
- (id)scheduleTask:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5 breadcrumb:(id)a6;
- (void)_lockWhenReadyForMainThread;
- (void)addDeferredTask:(id)a3;
- (void)addDeferredTask:(id)a3 breadcrumb:(id)a4;
- (void)addTask:(id)a3;
- (void)addTask:(id)a3 breadcrumb:(id)a4;
- (void)continueExecutionOnMainThread;
- (void)finishExecution;
- (void)lock;
- (void)lockWhenReadyForMainThread;
- (void)performDeferredTaskIfIdle;
- (void)performSingleTask:(id)a3;
- (void)performSingleTask:(id)a3 breadcrumb:(id)a4;
- (void)performTask:(id)a3;
- (void)performTask:(id)a3 breadcrumb:(id)a4;
- (void)performTaskOnMainThread:(id)a3 breadcrumb:(id)a4 waitUntilDone:(BOOL)a5;
- (void)promoteDeferredTaskIfIdle;
- (void)setActiveOriginator:(id)a3;
- (void)setActiveTaskBreadcrumb:(id)a3;
- (void)setDiagnosticTrampoline:(id)a3;
- (void)setExecutionContext:(id)a3;
- (void)unlock;
- (void)waitUntilAllTasksAreFinished;
- (void)waitUntilTaskIsFinished:(id)a3;
@end

@implementation UIKeyboardTaskQueue

- (UIKeyboardTaskQueue)init
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardTaskQueue;
  v2 = [(UIKeyboardTaskQueue *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    lock = v2->_lock;
    v2->_lock = (NSConditionLock *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tasks = v2->_tasks;
    v2->_tasks = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredTasks = v2->_deferredTasks;
    v2->_deferredTasks = v7;
  }
  return v2;
}

- (void)setExecutionContext:(id)a3
{
}

- (void)lock
{
}

- (void)lockWhenReadyForMainThread
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIKeyboardTaskQueue_lockWhenReadyForMainThread__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = [(UIKeyboardTaskQueue *)self activeTaskBreadcrumb];

  if (v4)
  {
    v5 = [(UIKeyboardTaskQueue *)self activeTaskBreadcrumb];
    ((void (**)(void, void (**)(void)))v5)[2](v5, v3);
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __49__UIKeyboardTaskQueue_lockWhenReadyForMainThread__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockWhenReadyForMainThread];
}

- (void)_lockWhenReadyForMainThread
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  lock = self->_lock;
  double v4 = 0.05;
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.05];
  LOBYTE(lock) = [(NSConditionLock *)lock lockWhenCondition:0 beforeDate:v5];

  if ((lock & 1) == 0)
  {
    char v6 = 0;
    do
    {
      v7 = [(UIKeyboardTaskExecutionContext *)self->_executionContext takeOwnershipOfPendingCompletionBlock];
      if (v7)
      {
        v8 = _UIKeyboardTaskQueueLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v17 = "-[UIKeyboardTaskQueue _lockWhenReadyForMainThread]";
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s execute pending completion block", buf, 0xCu);
        }

        v7[2](v7);
      }
      else if (v4 >= 1.0)
      {
        if ((v6 & 1) == 0)
        {
          v9 = _UIKeyboardTaskQueueLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            v12 = [(UIKeyboardTaskQueue *)self activeOriginator];
            v13 = @"No stack!";
            if (v12)
            {
              v15 = [(UIKeyboardTaskQueue *)self activeOriginator];
              v14 = [v15 description];
              v13 = v14;
            }
            *(_DWORD *)buf = 136315394;
            v17 = "-[UIKeyboardTaskQueue _lockWhenReadyForMainThread]";
            __int16 v18 = 2112;
            v19 = v13;
            _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "%s Keyboard queue task timeout detected\n\nLast Exception Backtrace:\n%@", buf, 0x16u);
            if (v12)
            {
            }
          }
        }
        char v6 = 1;
      }
      else
      {
        double v4 = 1.0;
      }

      objc_super v10 = self->_lock;
      v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
      LODWORD(v10) = [(NSConditionLock *)v10 lockWhenCondition:0 beforeDate:v11];
    }
    while (!v10);
  }
}

- (BOOL)tryLockWhenReadyForMainThread
{
  return [(NSConditionLock *)self->_lock tryLockWhenCondition:0];
}

- (void)unlock
{
  if (self->_executionContext) {
    BOOL v2 = self->_mainThreadContinuation == 0;
  }
  else {
    BOOL v2 = 0;
  }
  [(NSConditionLock *)self->_lock unlockWithCondition:v2];
}

- (void)continueExecutionOnMainThread
{
  if (pthread_main_np() == 1)
  {
    if (![(UIKeyboardTaskQueue *)self tryLockWhenReadyForMainThread]) {
      return;
    }
    if (self->_executionContext)
    {
      mainThreadContinuation = self->_mainThreadContinuation;
      if (!mainThreadContinuation)
      {
        v5 = 0;
LABEL_14:
        v14 = v5;
        v7 = [(UIKeyboardTaskEntry *)v5 originatingStack];
        [(UIKeyboardTaskQueue *)self setActiveOriginator:v7];

        v8 = [(UIKeyboardTaskEntry *)v14 breadcrumb];
        [(UIKeyboardTaskQueue *)self setActiveTaskBreadcrumb:v8];

        [(UIKeyboardTaskQueue *)self unlock];
        v9 = v14;
        BOOL executingOnMainThread = self->_executingOnMainThread;
        self->_BOOL executingOnMainThread = 1;
        executionContext = self->_executionContext;
        if (v14)
        {
          [(UIKeyboardTaskEntry *)v14 execute:executionContext];
        }
        else
        {
          if (executionContext || (uint64_t v12 = [(NSMutableArray *)self->_deferredTasks count], v9 = 0, !v12))
          {
LABEL_18:
            self->_BOOL executingOnMainThread = executingOnMainThread;

            return;
          }
          [(UIKeyboardTaskQueue *)self performDeferredTaskIfIdle];
        }
        v9 = v14;
        goto LABEL_18;
      }
      v13 = mainThreadContinuation;
      double v4 = self->_mainThreadContinuation;
      self->_mainThreadContinuation = 0;
    }
    else
    {
      v5 = (UIKeyboardTaskEntry *)[(NSMutableArray *)self->_tasks count];
      if (!v5) {
        goto LABEL_14;
      }
      char v6 = [[UIKeyboardTaskExecutionContext alloc] initWithExecutionQueue:self];
      [(UIKeyboardTaskQueue *)self setExecutionContext:v6];

      v13 = [(NSMutableArray *)self->_tasks objectAtIndex:0];
      [(NSMutableArray *)self->_tasks removeObjectAtIndex:0];
    }
    v5 = v13;
    goto LABEL_14;
  }
  [(UIKeyboardTaskQueue *)self performSelectorOnMainThread:sel_continueExecutionOnMainThread withObject:0 waitUntilDone:0];
}

- (void)finishExecution
{
  [(UIKeyboardTaskQueue *)self lock];
  if (!self->_executionContext)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIKeyboardTaskQueue.m" lineNumber:502 description:@"Received keyboard task completion but there is no current keyboard task."];
  }
  if (self->_mainThreadContinuation)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIKeyboardTaskQueue.m" lineNumber:503 description:@"Received keyboard task completion before the task's continuation executed."];
  }
  [(UIKeyboardTaskQueue *)self setExecutionContext:0];
  [(UIKeyboardTaskQueue *)self setActiveOriginator:0];
  if ([(NSMutableArray *)self->_tasks count])
  {
    [(UIKeyboardTaskQueue *)self unlock];
LABEL_8:
    [(UIKeyboardTaskQueue *)self performSelectorOnMainThread:sel_continueExecutionOnMainThread withObject:0 waitUntilDone:0];
    return;
  }
  uint64_t v4 = [(NSMutableArray *)self->_deferredTasks count];
  [(UIKeyboardTaskQueue *)self unlock];
  if (v4) {
    goto LABEL_8;
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UIKeyboardTaskQueueIsEmptyNotification" object:self];
}

- (void)performTaskOnMainThread:(id)a3 breadcrumb:(id)a4 waitUntilDone:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  [(UIKeyboardTaskQueue *)self lock];
  if (!self->_executionContext)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIKeyboardTaskQueue.m", 529, @"Received request for main thread, but there is no current keyboard task executing." object file lineNumber description];
  }
  if (self->_mainThreadContinuation)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UIKeyboardTaskQueue.m" lineNumber:530 description:@"Received more than one main-thread continuation for the current keyboard task."];
  }
  v11 = [[UIKeyboardTaskEntry alloc] initWithTask:v9 breadcrumb:v10];
  mainThreadContinuation = self->_mainThreadContinuation;
  self->_mainThreadContinuation = v11;

  [(UIKeyboardTaskQueue *)self unlock];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  if (v5)
  {
    executionContext = self->_executionContext;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__UIKeyboardTaskQueue_performTaskOnMainThread_breadcrumb_waitUntilDone___block_invoke;
    v17[3] = &unk_1E52E3D70;
    v17[4] = &v18;
    id v14 = [(UIKeyboardTaskExecutionContext *)executionContext childWithContinuation:v17];
  }
  [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
  if (v5)
  {
    while (*((unsigned char *)v19 + 24))
    {
      [(UIKeyboardTaskQueue *)self lockWhenReadyForMainThread];
      [(UIKeyboardTaskQueue *)self unlock];
      [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __72__UIKeyboardTaskQueue_performTaskOnMainThread_breadcrumb_waitUntilDone___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

- (void)performDeferredTaskIfIdle
{
  [(UIKeyboardTaskQueue *)self lock];
  [(UIKeyboardTaskQueue *)self promoteDeferredTaskIfIdle];
  [(UIKeyboardTaskQueue *)self unlock];
  [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
}

- (void)promoteDeferredTaskIfIdle
{
  if (!self->_executionContext && [(NSMutableArray *)self->_deferredTasks count])
  {
    id v3 = [(NSMutableArray *)self->_deferredTasks objectAtIndex:0];
    [(NSMutableArray *)self->_tasks addObject:v3];
    [(NSMutableArray *)self->_deferredTasks removeObjectAtIndex:0];
  }
}

- (void)addTask:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskQueue *)self addTask:v4 breadcrumb:v5];
}

- (void)addTask:(id)a3 breadcrumb:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UIKeyboardTaskQueue *)self lock];
  v8 = [[UIKeyboardTaskEntry alloc] initWithTask:v7 breadcrumb:v6];

  [(NSMutableArray *)self->_tasks addObject:v8];
  [(UIKeyboardTaskQueue *)self unlock];
  [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
}

- (id)addAndReturnTask:(id)a3 breadcrumb:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UIKeyboardTaskQueue *)self lock];
  v8 = [[UIKeyboardTaskEntry alloc] initWithTask:v7 breadcrumb:v6];

  [(NSMutableArray *)self->_tasks addObject:v8];
  [(UIKeyboardTaskQueue *)self unlock];
  [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
  return v8;
}

- (void)addDeferredTask:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskQueue *)self addDeferredTask:v4 breadcrumb:v5];
}

- (void)addDeferredTask:(id)a3 breadcrumb:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UIKeyboardTaskQueue *)self lock];
  v8 = [[UIKeyboardTaskEntry alloc] initWithTask:v7 breadcrumb:v6];

  [(NSMutableArray *)self->_deferredTasks addObject:v8];
  [(UIKeyboardTaskQueue *)self unlock];
  [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
}

- (void)waitUntilAllTasksAreFinished
{
  if (pthread_main_np() != 1)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 653, @"%s may only be called from the main thread.", "-[UIKeyboardTaskQueue waitUntilAllTasksAreFinished]");
  }
  while (1)
  {
    [(UIKeyboardTaskQueue *)self lockWhenReadyForMainThread];
    if (!self->_executionContext
      && ![(NSMutableArray *)self->_tasks count]
      && ![(NSMutableArray *)self->_deferredTasks count])
    {
      break;
    }
    if (![(NSMutableArray *)self->_tasks count]) {
      [(UIKeyboardTaskQueue *)self promoteDeferredTaskIfIdle];
    }
    [(UIKeyboardTaskQueue *)self unlock];
    [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
  }
  [(UIKeyboardTaskQueue *)self unlock];
}

- (BOOL)isEmpty
{
  [(UIKeyboardTaskQueue *)self lock];
  BOOL v3 = ![(NSMutableArray *)self->_tasks count]
    && ![(NSMutableArray *)self->_deferredTasks count]
    && self->_executionContext == 0;
  [(UIKeyboardTaskQueue *)self unlock];
  return v3;
}

- (void)performTask:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskQueue *)self performTask:v4 breadcrumb:v5];
}

- (void)performTask:(id)a3 breadcrumb:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (pthread_main_np() != 1)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 690, @"%s may only be called from the main thread.", "-[UIKeyboardTaskQueue performTask:breadcrumb:]");
  }
  if ([(UIKeyboardTaskQueue *)self isMainThreadExecutingTask])
  {
    [(UIKeyboardTaskQueue *)self performTaskOnMainThread:v9 breadcrumb:v7 waitUntilDone:1];
  }
  else
  {
    [(UIKeyboardTaskQueue *)self addTask:v9];
    [(UIKeyboardTaskQueue *)self waitUntilAllTasksAreFinished];
  }
}

- (void)waitUntilTaskIsFinished:(id)a3
{
  id v6 = a3;
  if (pthread_main_np() != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 704, @"%s may only be called from the main thread.", "-[UIKeyboardTaskQueue waitUntilTaskIsFinished:]");
  }
  while (1)
  {
    [(UIKeyboardTaskQueue *)self lockWhenReadyForMainThread];
    if (!self->_executionContext
      && ![(NSMutableArray *)self->_tasks containsObject:v6])
    {
      break;
    }
    [(UIKeyboardTaskQueue *)self unlock];
    [(UIKeyboardTaskQueue *)self continueExecutionOnMainThread];
  }
  [(UIKeyboardTaskQueue *)self unlock];
}

- (void)performSingleTask:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskQueue *)self performSingleTask:v4 breadcrumb:v5];
}

- (void)performSingleTask:(id)a3 breadcrumb:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (pthread_main_np() != 1)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 726, @"%s may only be called from the main thread.", "-[UIKeyboardTaskQueue performSingleTask:breadcrumb:]");
  }
  if ([(UIKeyboardTaskQueue *)self isMainThreadExecutingTask])
  {
    [(UIKeyboardTaskQueue *)self performTaskOnMainThread:v10 breadcrumb:v7 waitUntilDone:1];
  }
  else
  {
    id v8 = [(UIKeyboardTaskQueue *)self addAndReturnTask:v10 breadcrumb:v7];
    [(UIKeyboardTaskQueue *)self waitUntilTaskIsFinished:v8];
  }
}

- (BOOL)isMainThreadExecutingTask
{
  return self->_executingOnMainThread;
}

- (UIKeyboardTaskExecutionContext)executionContext
{
  return self->_executionContext;
}

- (NSArray)activeOriginator
{
  return self->_activeOriginator;
}

- (void)setActiveOriginator:(id)a3
{
}

- (id)activeTaskBreadcrumb
{
  return self->_activeTaskBreadcrumb;
}

- (void)setActiveTaskBreadcrumb:(id)a3
{
}

- (id)diagnosticTrampoline
{
  return self->_diagnosticTrampoline;
}

- (void)setDiagnosticTrampoline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_diagnosticTrampoline, 0);
  objc_storeStrong(&self->_activeTaskBreadcrumb, 0);
  objc_storeStrong((id *)&self->_activeOriginator, 0);
  objc_storeStrong((id *)&self->_mainThreadContinuation, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_deferredTasks, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)scheduleTask:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = _UIKeyboardTaskBreadcrumbEmpty();
  id v10 = [(UIKeyboardTaskQueue *)self scheduleTask:v8 timeInterval:v5 repeats:v9 breadcrumb:a4];

  return v10;
}

- (id)scheduleTask:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5 breadcrumb:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  id v12 = a3;
  if (pthread_main_np() != 1)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 755, @"%s may only be called from the main thread.", "-[UIKeyboardTaskQueue(UIKeyboardScheduledTask) scheduleTask:timeInterval:repeats:breadcrumb:]");
  }
  v13 = [[UIKeyboardScheduledTask alloc] initWithTaskQueue:self timeInterval:v6 repeats:v12 task:v11 breadcrumb:a4];

  return v13;
}

@end