@interface VSSpeechTaskQueue
+ (id)mainDeviceQueue;
+ (id)parallelQueueWithIdentifier:(id)a3;
+ (void)cancelTasksWithDelegate:(id)a3;
- (NSMutableArray)eagerTasks;
- (NSMutableArray)speakTasks;
- (OS_dispatch_queue)speakingQueue;
- (VSSpeechRequest)lastSynthesisRequest;
- (VSSpeechTaskProtocol)currentTask;
- (VSSpeechTaskQueue)init;
- (_opaque_pthread_mutex_t)threadMutex;
- (_opaque_pthread_mutexattr_t)threadMutexAttr;
- (id)taskWithCreatedTimeStamp:(unint64_t)a3;
- (id)tasksWithDelegate:(id)a3;
- (unint64_t)createdTimestampWithTask:(id)a3;
- (unint64_t)lastSynthesisRequestCreatedTimeStamp;
- (void)addTask:(id)a3;
- (void)cancelTask:(id)a3;
- (void)resumeCurrentTask;
- (void)setCurrentTask:(id)a3;
- (void)setEagerTasks:(id)a3;
- (void)setLastSynthesisRequest:(id)a3;
- (void)setLastSynthesisRequestCreatedTimeStamp:(unint64_t)a3;
- (void)setSpeakTasks:(id)a3;
- (void)setSpeakingQueue:(id)a3;
- (void)setThreadMutex:(_opaque_pthread_mutex_t *)a3;
- (void)setThreadMutexAttr:(_opaque_pthread_mutexattr_t)a3;
- (void)spinNextTask;
- (void)suspendCurrentTask;
@end

@implementation VSSpeechTaskQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSynthesisRequest, 0);
  objc_storeStrong((id *)&self->_speakingQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_speakTasks, 0);
  objc_storeStrong((id *)&self->_eagerTasks, 0);
}

- (void)setLastSynthesisRequestCreatedTimeStamp:(unint64_t)a3
{
  self->_lastSynthesisRequestCreatedTimeStamp = a3;
}

- (unint64_t)lastSynthesisRequestCreatedTimeStamp
{
  return self->_lastSynthesisRequestCreatedTimeStamp;
}

- (void)setLastSynthesisRequest:(id)a3
{
}

- (VSSpeechRequest)lastSynthesisRequest
{
  return self->_lastSynthesisRequest;
}

- (void)setSpeakingQueue:(id)a3
{
}

- (OS_dispatch_queue)speakingQueue
{
  return self->_speakingQueue;
}

- (void)setThreadMutexAttr:(_opaque_pthread_mutexattr_t)a3
{
  self->_threadMutexAttr = a3;
}

- (_opaque_pthread_mutexattr_t)threadMutexAttr
{
  uint64_t v2 = *(void *)self->_threadMutexAttr.__opaque;
  uint64_t sig = self->_threadMutexAttr.__sig;
  *(void *)result.__opaque = v2;
  result.__uint64_t sig = sig;
  return result;
}

- (void)setThreadMutex:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_threadMutex.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_threadMutex.__opaque[24] = v5;
  *(_OWORD *)&self->_threadMutex.__opaque[8] = v4;
  *(_OWORD *)&self->_threadMutex.__uint64_t sig = v3;
}

- (_opaque_pthread_mutex_t)threadMutex
{
  long long v3 = *(_OWORD *)&self[1].__opaque[16];
  *(_OWORD *)&retstr->__uint64_t sig = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__opaque[48];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[32];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setCurrentTask:(id)a3
{
}

- (void)setSpeakTasks:(id)a3
{
}

- (NSMutableArray)speakTasks
{
  return self->_speakTasks;
}

- (void)setEagerTasks:(id)a3
{
}

- (NSMutableArray)eagerTasks
{
  return self->_eagerTasks;
}

- (void)resumeCurrentTask
{
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  [(VSSpeechTaskProtocol *)self->_currentTask resume];
  pthread_mutex_unlock(p_threadMutex);
}

- (void)suspendCurrentTask
{
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  [(VSSpeechTaskProtocol *)self->_currentTask suspend];
  pthread_mutex_unlock(p_threadMutex);
}

- (void)cancelTask:(id)a3
{
  p_threadMutex = &self->_threadMutex;
  id v4 = a3;
  pthread_mutex_lock(p_threadMutex);
  [v4 cancel];

  pthread_mutex_unlock(p_threadMutex);
}

- (id)tasksWithDelegate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  v6 = [MEMORY[0x263EFF980] array];
  v7 = [(VSSpeechTaskQueue *)self currentTask];
  id v8 = [v7 delegate];

  if (v8 == v4)
  {
    v9 = [(VSSpeechTaskQueue *)self currentTask];
    [v6 addObject:v9];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v10 = [(VSSpeechTaskQueue *)self speakTasks];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v16 = [v15 delegate];

        if (v16 == v4) {
          [v6 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v12);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = [(VSSpeechTaskQueue *)self eagerTasks];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        id v23 = [v22 delegate];

        if (v23 == v4) {
          [v6 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  pthread_mutex_unlock(p_threadMutex);
  return v6;
}

- (id)taskWithCreatedTimeStamp:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  p_threadMutex = &self->_threadMutex;
  pthread_mutex_lock(&self->_threadMutex);
  v6 = [(VSSpeechTaskQueue *)self currentTask];
  unint64_t v7 = [(VSSpeechTaskQueue *)self createdTimestampWithTask:v6];

  if (v7 == a3)
  {
    pthread_mutex_unlock(p_threadMutex);
    id v8 = [(VSSpeechTaskQueue *)self currentTask];
    goto LABEL_21;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = [(VSSpeechTaskQueue *)self speakTasks];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
      if ([(VSSpeechTaskQueue *)self createdTimestampWithTask:v14] == a3) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = [(VSSpeechTaskQueue *)self eagerTasks];
    uint64_t v15 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (!v15)
    {
LABEL_19:

      pthread_mutex_unlock(p_threadMutex);
      id v8 = 0;
      goto LABEL_21;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
LABEL_13:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v21 != v17) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
      if ([(VSSpeechTaskQueue *)self createdTimestampWithTask:v14] == a3) {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v16) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }
  pthread_mutex_unlock(p_threadMutex);
  id v8 = v14;

LABEL_21:
  return v8;
}

- (unint64_t)createdTimestampWithTask:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26DADCB08]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v5 = [v4 request];
    unint64_t v6 = [v5 requestCreatedTimestamp];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (VSSpeechTaskProtocol)currentTask
{
  return self->_currentTask;
}

- (void)spinNextTask
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEBUG, "Start spinNextTask", buf, 2u);
  }

  if ([(NSMutableArray *)self->_speakTasks count])
  {
    id v4 = [(NSMutableArray *)self->_speakTasks firstObject];
    p_currentTask = &self->_currentTask;
    currentTask = self->_currentTask;
    if (currentTask)
    {
      if (![(VSSpeechTaskProtocol *)currentTask conformsToProtocol:&unk_26DADCB08]|| ![(VSSpeechTaskProtocol *)*p_currentTask isSpeaking])
      {
        long long v27 = *p_currentTask;
        if ([(VSSpeechTaskProtocol *)v27 conformsToProtocol:&unk_26DADCB90]
          && [(VSSpeechTaskProtocol *)v27 readyForEagerTask]
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && ([(VSSpeechTaskProtocol *)v27 request],
              long long v28 = objc_claimAutoreleasedReturnValue(),
              [v4 request],
              long long v29 = objc_claimAutoreleasedReturnValue(),
              char v30 = [v28 isSimilarTo:v29],
              v29,
              v28,
              (v30 & 1) != 0))
        {
          [(VSSpeechTaskProtocol *)v27 setSpeakTask:v4];
          [(NSMutableArray *)self->_speakTasks removeObjectAtIndex:0];
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            long long v31 = [v4 instrumentMetrics];
            uint64_t v32 = [v31 requestCreatedTimestamp];
            v33 = [(VSSpeechTaskProtocol *)v27 instrumentMetrics];
            uint64_t v34 = v32 - [v33 requestCreatedTimestamp];
            uint64_t v35 = [v4 instrumentMetrics];
            [v35 setEagerRequestCreatedTimestampDiffs:v34];

            v36 = [v4 instrumentMetrics];
            uint64_t v37 = [v36 eagerRequestCreatedTimestampDiffs];
            v38 = [(VSSpeechTaskProtocol *)v27 instrumentMetrics];
            [v38 setEagerRequestCreatedTimestampDiffs:v37];
          }
          v39 = VSGetLogDefault();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = [v4 instrumentMetrics];
            uint64_t v41 = [v40 requestCreatedTimestamp];
            v42 = [(VSSpeechTaskProtocol *)v27 instrumentMetrics];
            uint64_t v43 = [v42 requestCreatedTimestamp];
            *(_DWORD *)buf = 134218240;
            uint64_t v87 = v41;
            __int16 v88 = 2048;
            uint64_t v89 = v43;
            _os_log_impl(&dword_226CB1000, v39, OS_LOG_TYPE_INFO, "Speak task %llu is attached to eager task %llu", buf, 0x16u);
          }
          lastSynthesisRequest = self->_lastSynthesisRequest;
          self->_lastSynthesisRequest = 0;
        }
        else
        {
          v45 = VSGetLogDefault();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = [v4 instrumentMetrics];
            uint64_t v47 = [v46 requestCreatedTimestamp];
            v48 = [(VSSpeechTaskProtocol *)v27 instrumentMetrics];
            uint64_t v49 = [v48 requestCreatedTimestamp];
            *(_DWORD *)buf = 134218240;
            uint64_t v87 = v47;
            __int16 v88 = 2048;
            uint64_t v89 = v49;
            _os_log_impl(&dword_226CB1000, v45, OS_LOG_TYPE_INFO, "%llu interrupt task %llu", buf, 0x16u);
          }
          [(VSSpeechTaskProtocol *)v27 cancel];
        }

        goto LABEL_50;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v8 = [v4 request];
      v9 = v8;
      if (isKindOfClass)
      {
        int v10 = [v8 enqueue];

        if (v10)
        {
          uint64_t v11 = VSGetLogDefault();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = [v4 instrumentMetrics];
            uint64_t v13 = [v12 requestCreatedTimestamp];
            v14 = [(VSSpeechTaskProtocol *)*p_currentTask instrumentMetrics];
            uint64_t v15 = [v14 requestCreatedTimestamp];
            *(_DWORD *)buf = 134218240;
            uint64_t v87 = v13;
            __int16 v88 = 2048;
            uint64_t v89 = v15;
            uint64_t v16 = "PresynthesisTask %llu requested to wait another speaking task %llu";
            uint64_t v17 = v11;
            os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_57:
            _os_log_impl(&dword_226CB1000, v17, v18, v16, buf, 0x16u);

            goto LABEL_58;
          }
          goto LABEL_58;
        }
      }
      else
      {
        char v64 = [v8 shouldWaitCurrentSpeaking];

        if ((v64 & 1) == 0)
        {
          v67 = VSGetLogDefault();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = [v4 instrumentMetrics];
            uint64_t v69 = [v68 requestCreatedTimestamp];
            v70 = [(VSSpeechTaskProtocol *)*p_currentTask instrumentMetrics];
            uint64_t v71 = [v70 requestCreatedTimestamp];
            *(_DWORD *)buf = 134218240;
            uint64_t v87 = v69;
            __int16 v88 = 2048;
            uint64_t v89 = v71;
            _os_log_impl(&dword_226CB1000, v67, OS_LOG_TYPE_DEFAULT, "New speak task %llu interrupts speaking task %llu", buf, 0x16u);
          }
          [(VSSpeechTaskProtocol *)*p_currentTask cancel];
          goto LABEL_50;
        }
      }
      uint64_t v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v4 instrumentMetrics];
        uint64_t v65 = [v12 requestCreatedTimestamp];
        v14 = [(VSSpeechTaskProtocol *)*p_currentTask instrumentMetrics];
        uint64_t v66 = [v14 requestCreatedTimestamp];
        *(_DWORD *)buf = 134218240;
        uint64_t v87 = v65;
        __int16 v88 = 2048;
        uint64_t v89 = v66;
        uint64_t v16 = "New speak task %llu waits for speaking task %llu";
        uint64_t v17 = v11;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_57;
      }
LABEL_58:

      goto LABEL_50;
    }
    v50 = VSGetLogDefault();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      v72 = [v4 instrumentMetrics];
      uint64_t v73 = [v72 requestCreatedTimestamp];
      *(_DWORD *)buf = 134217984;
      uint64_t v87 = v73;
      _os_log_debug_impl(&dword_226CB1000, v50, OS_LOG_TYPE_DEBUG, "Dispatch speaking task %llu", buf, 0xCu);
    }
    [(NSMutableArray *)self->_speakTasks removeObjectAtIndex:0];
    objc_storeStrong((id *)&self->_currentTask, v4);
    if (![(VSSpeechTaskProtocol *)self->_currentTask isMemberOfClass:objc_opt_class()])goto LABEL_41; {
    v51 = *p_currentTask;
    }
    v52 = [MEMORY[0x263F84E90] standardInstance];
    if (([v52 disableCache] & 1) == 0)
    {
      v53 = [(VSSpeechTaskProtocol *)v51 request];
      int v54 = [v53 isSimilarTo:self->_lastSynthesisRequest];

      if (!v54)
      {
LABEL_40:

LABEL_41:
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v57 = self->_eagerTasks;
        uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v83 != v60) {
                objc_enumerationMutation(v57);
              }
              [*(id *)(*((void *)&v82 + 1) + 8 * i) cancel];
            }
            uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v82 objects:v90 count:16];
          }
          while (v59);
        }

        [(NSMutableArray *)self->_eagerTasks removeAllObjects];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __33__VSSpeechTaskQueue_spinNextTask__block_invoke;
        block[3] = &unk_2647DCED8;
        id v4 = v4;
        id v80 = v4;
        v81 = self;
        dispatch_block_t v62 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
        dispatch_async((dispatch_queue_t)self->_speakingQueue, v62);

        long long v26 = v80;
LABEL_49:

LABEL_50:
        goto LABEL_51;
      }
      v52 = [(VSSpeechTaskProtocol *)v51 instrumentMetrics];
      unint64_t v55 = [v52 requestCreatedTimestamp] - self->_lastSynthesisRequestCreatedTimeStamp;
      v56 = [(VSSpeechTaskProtocol *)v51 instrumentMetrics];
      [v56 setEagerRequestCreatedTimestampDiffs:v55];
    }
    goto LABEL_40;
  }
  if ([(NSMutableArray *)self->_eagerTasks count] && !self->_currentTask)
  {
    uint64_t v19 = [(NSMutableArray *)self->_eagerTasks firstObject];
    [(NSMutableArray *)self->_eagerTasks removeObjectAtIndex:0];
    long long v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v74 = [v19 instrumentMetrics];
      uint64_t v75 = [v74 requestCreatedTimestamp];
      *(_DWORD *)buf = 134217984;
      uint64_t v87 = v75;
      _os_log_debug_impl(&dword_226CB1000, v20, OS_LOG_TYPE_DEBUG, "Dispatch synthesis task %llu", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentTask, v19);
    if ([v19 conformsToProtocol:&unk_26DADCB90])
    {
      id v21 = v19;
      long long v22 = [v21 request];
      long long v23 = self->_lastSynthesisRequest;
      self->_lastSynthesisRequest = v22;

      long long v24 = [v21 instrumentMetrics];

      self->_lastSynthesisRequestCreatedTimeStamp = [v24 requestCreatedTimestamp];
    }
    speakingQueue = self->_speakingQueue;
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __33__VSSpeechTaskQueue_spinNextTask__block_invoke_84;
    v76[3] = &unk_2647DCED8;
    v77 = v19;
    v78 = self;
    id v4 = v19;
    dispatch_async(speakingQueue, v76);
    long long v26 = v77;
    goto LABEL_49;
  }
LABEL_51:
  v63 = VSGetLogDefault();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_226CB1000, v63, OS_LOG_TYPE_DEBUG, "Finish spinNextTask", buf, 2u);
  }
}

uint64_t __33__VSSpeechTaskQueue_spinNextTask__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) instrumentMetrics];
    int v5 = 134217984;
    uint64_t v6 = [v3 requestCreatedTimestamp];
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_INFO, "Starting task %llu", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) start];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 72));
  [*(id *)(a1 + 40) setCurrentTask:0];
  [*(id *)(a1 + 40) setLastSynthesisRequest:0];
  [*(id *)(a1 + 40) spinNextTask];
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 72));
}

uint64_t __33__VSSpeechTaskQueue_spinNextTask__block_invoke_84(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) instrumentMetrics];
    int v5 = 134217984;
    uint64_t v6 = [v4 requestCreatedTimestamp];
    _os_log_debug_impl(&dword_226CB1000, v2, OS_LOG_TYPE_DEBUG, "Starting task %llu", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) start];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 72));
  [*(id *)(a1 + 40) setCurrentTask:0];
  [*(id *)(a1 + 40) spinNextTask];
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 72));
}

- (void)addTask:(id)a3
{
  id v5 = a3;
  pthread_mutex_lock(&self->_threadMutex);
  if ([v5 conformsToProtocol:&unk_26DADCB08]
    && ([v5 isSpeaking] & 1) != 0)
  {
    uint64_t v4 = 16;
  }
  else
  {
    uint64_t v4 = 8;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:v5];
  [(VSSpeechTaskQueue *)self spinNextTask];
  pthread_mutex_unlock(&self->_threadMutex);
}

- (VSSpeechTaskQueue)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)VSSpeechTaskQueue;
  uint64_t v2 = [(VSSpeechTaskQueue *)&v15 init];
  if (v2)
  {
    if ([MEMORY[0x263F84EB8] isHomePod])
    {
      memset(&v16, 0, sizeof(v16));
      pthread_attr_init(&v16);
      sched_param v14 = 0;
      pthread_attr_getschedparam(&v16, &v14);
      v14.sched_priority = 46;
      pthread_attr_setschedpolicy(&v16, 2);
      pthread_attr_setschedparam(&v16, &v14);
      pthread_attr_setinheritsched(&v16, 2);
      id v3 = dispatch_pthread_root_queue_create();
      uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("com.apple.voiced.speakingQueue", v4, v3);
      speakingQueue = v2->_speakingQueue;
      v2->_speakingQueue = (OS_dispatch_queue *)v5;
    }
    else
    {
      id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.voiced.speakingQueue", v3);
      id v8 = v2->_speakingQueue;
      v2->_speakingQueue = (OS_dispatch_queue *)v7;
    }
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    speakTasks = v2->_speakTasks;
    v2->_speakTasks = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    eagerTasks = v2->_eagerTasks;
    v2->_eagerTasks = (NSMutableArray *)v11;

    pthread_mutexattr_init(&v2->_threadMutexAttr);
    pthread_mutexattr_settype(&v2->_threadMutexAttr, 2);
    pthread_mutex_init(&v2->_threadMutex, &v2->_threadMutexAttr);
  }
  return v2;
}

+ (void)cancelTasksWithDelegate:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = [a1 mainDeviceQueue];
  uint64_t v6 = [v5 tasksWithDelegate:v4];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v13 = [a1 mainDeviceQueue];
        [v13 cancelTask:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v9);
  }

  if (VSSpeechTaskQueue_queueLock)
  {
    id v26 = v7;
    [(id)VSSpeechTaskQueue_queueLock lock];
    sched_param v14 = [(id)VSSpeechTaskQueue_queueMap allValues];
    [(id)VSSpeechTaskQueue_queueLock unlock];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          id v21 = [v20 tasksWithDelegate:v4];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v28;
            do
            {
              for (uint64_t k = 0; k != v23; ++k)
              {
                if (*(void *)v28 != v24) {
                  objc_enumerationMutation(v21);
                }
                [v20 cancelTask:*(void *)(*((void *)&v27 + 1) + 8 * k)];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v23);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v17);
    }

    id v7 = v26;
  }
}

+ (id)parallelQueueWithIdentifier:(id)a3
{
  id v3 = a3;
  if (parallelQueueWithIdentifier__onceToken != -1) {
    dispatch_once(&parallelQueueWithIdentifier__onceToken, &__block_literal_global_2);
  }
  [(id)VSSpeechTaskQueue_queueLock lock];
  id v4 = [(id)VSSpeechTaskQueue_queueMap objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(VSSpeechTaskQueue);
    [(id)VSSpeechTaskQueue_queueMap setObject:v4 forKeyedSubscript:v3];
  }
  [(id)VSSpeechTaskQueue_queueLock unlock];

  return v4;
}

uint64_t __49__VSSpeechTaskQueue_parallelQueueWithIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)VSSpeechTaskQueue_queueMap;
  VSSpeechTaskQueue_queueMap = (uint64_t)v0;

  VSSpeechTaskQueue_queueLocuint64_t k = (uint64_t)objc_alloc_init(MEMORY[0x263F08958]);
  return MEMORY[0x270F9A758]();
}

+ (id)mainDeviceQueue
{
  if (mainDeviceQueue_onceToken != -1) {
    dispatch_once(&mainDeviceQueue_onceToken, &__block_literal_global_3739);
  }
  uint64_t v2 = (void *)mainDeviceQueue___sharedQueue;
  return v2;
}

uint64_t __36__VSSpeechTaskQueue_mainDeviceQueue__block_invoke()
{
  mainDeviceQueue___sharedQueue = objc_alloc_init(VSSpeechTaskQueue);
  return MEMORY[0x270F9A758]();
}

@end