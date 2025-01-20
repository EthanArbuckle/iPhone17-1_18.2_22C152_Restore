@interface VMUSampler
+ (id)sampleAllThreadsOfPID:(int)a3;
+ (id)sampleAllThreadsOfTask:(unsigned int)a3;
+ (id)sampleAllThreadsOfTask:(unsigned int)a3 symbolicate:(BOOL)a4;
+ (void)initialize;
- (BOOL)start;
- (BOOL)stop;
- (BOOL)waitUntilDone;
- (VMUSampler)initWithPID:(int)a3;
- (VMUSampler)initWithPID:(int)a3 options:(unint64_t)a4;
- (VMUSampler)initWithPID:(int)a3 orTask:(unsigned int)a4 options:(unint64_t)a5;
- (VMUSampler)initWithPID:(int)a3 task:(unsigned int)a4 processName:(id)a5 is64Bit:(BOOL)a6 options:(unint64_t)a7;
- (VMUSampler)initWithTask:(unsigned int)a3;
- (VMUSampler)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (_CSTypeRef)symbolicator;
- (double)samplingInterval;
- (double)timeLimit;
- (id)delegate;
- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3;
- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3 returnedConcurrentFlag:(BOOL *)a4 returnedThreadId:(unint64_t *)a5;
- (id)outputString;
- (id)sampleAllThreadsOnce;
- (id)sampleAllThreadsOnceWithFramePointers:(BOOL)a3;
- (id)sampleThread:(unsigned int)a3;
- (id)samples;
- (id)stopSamplingAndReturnCallNode;
- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4;
- (id)threadNameForThread:(unsigned int)a3;
- (id)threadNameForThread:(unsigned int)a3 returnedThreadId:(unint64_t *)a4 returnedDispatchQueueSerialNum:(unint64_t *)a5;
- (int)pid;
- (unint64_t)recordSampleTo:(id)a3 timestamp:(unint64_t)a4 thread:(unsigned int)a5 recordFramePointers:(BOOL)a6 clearMemoryCache:(BOOL)a7;
- (unsigned)mainThread;
- (unsigned)sampleCount;
- (unsigned)sampleLimit;
- (void)_checkDispatchThreadLimits;
- (void)_fixupStacks:(id)a3;
- (void)_runSamplingThread;
- (void)dealloc;
- (void)flushData;
- (void)initializeSamplingContextWithOptions:(int)a3;
- (void)preloadSymbols;
- (void)sampleForDuration:(unsigned int)a3 interval:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setRecordThreadStates:(BOOL)a3;
- (void)setSampleLimit:(unsigned int)a3;
- (void)setSamplingInterval:(double)a3;
- (void)setSymbolicator:(_CSTypeRef)a3;
- (void)setTimeLimit:(double)a3;
- (void)writeOutput:(id)a3 append:(BOOL)a4;
@end

@implementation VMUSampler

- (unint64_t)recordSampleTo:(id)a3 timestamp:(unint64_t)a4 thread:(unsigned int)a5 recordFramePointers:(BOOL)a6 clearMemoryCache:(BOOL)a7
{
  kern_return_t v32;
  kern_return_t v33;
  int pid;
  void *v35;
  void *v36;
  int v37;
  integer_t v38;
  uint64_t v40;
  VMUBacktrace *v41;
  double v42;
  int v43;
  void *v44;
  unint64_t v45;
  unsigned int v46;
  ipc_space_t *v47;
  const void *v48;
  uint64_t v49;
  BOOL v50;
  unsigned int maxPreviousThreadCount;
  unsigned int v52;
  unsigned int *previousThreadList;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  char v63;
  void *v64;
  void *v65;
  BOOL v67;
  mach_msg_type_number_t v68;
  integer_t thread_info_out[4];
  long long v70;
  uint64_t v71;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  unsigned int v74;
  mach_msg_type_number_t thread_info_outCnt[2];
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  kern_return_t v81;
  uint64_t v82;

  BOOL v7 = a7;
  v67 = a6;
  v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v74 = a5;
  act_list = 0;
  act_listCnt = 0;
  v71 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v70 = 0u;
  if (!self->_samplingContext)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_26;
  }
  if (a5)
  {
    act_list = &v74;
    mach_msg_type_number_t v11 = 1;
    act_listCnt = 1;
  }
  else
  {
    if (task_threads(self->_task, &act_list, &act_listCnt)) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = act_list == 0;
    }
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:]();
      }
      goto LABEL_26;
    }
    mach_msg_type_number_t v11 = act_listCnt;
  }
  BOOL v21 = self->_previousThreadCount != v11;
  if (self->_recordThreadStates)
  {
    v22 = malloc_type_calloc(v11, 4uLL, 0x100004052888210uLL);
    if (act_listCnt)
    {
      for (unint64_t i = 0; i < act_listCnt; ++i)
      {
        thread_inspect_t v24 = act_list[i];
        thread_info_outCnt[0] = 10;
        if (!thread_info(v24, 3u, thread_info_out, thread_info_outCnt)) {
          v22[i] = DWORD2(v70);
        }
      }
    }
  }
  else
  {
    v22 = 0;
  }
  if (task_suspend2(self->_task, &self->_suspensionToken))
  {
    if (v22) {
      free(v22);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:].cold.4();
    }
LABEL_26:
    unint64_t v25 = 0;
    goto LABEL_27;
  }
  mach_msg_type_number_t v27 = act_listCnt;
  if (self->_dispatchThreadSoftLimit - 1 < act_listCnt || self->_dispatchThreadHardLimit - 1 < act_listCnt)
  {
    [(VMUSampler *)self _checkDispatchThreadLimits];
    mach_msg_type_number_t v27 = act_listCnt;
  }
  v64 = v10;
  v62 = v7;
  v63 = v21;
  if (act_list && v27)
  {
    self->_mainThread = *act_list;
LABEL_35:
    uint64_t v28 = 0;
    v65 = 0;
    int v29 = g_environment_flags;
    v30 = MEMORY[0x1E4F14500];
    while (1)
    {
      v31 = (const void *)act_list[v28];
      if (v22 && !v22[v28]) {
        goto LABEL_65;
      }
      v68 = 10;
      v32 = thread_info((thread_inspect_t)v31, 3u, thread_info_out, &v68);
      if (v32)
      {
        v33 = v32;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          pid = self->_pid;
          thread_info_outCnt[0] = 67109888;
          thread_info_outCnt[1] = pid;
          v76 = 1024;
          v77 = v28;
          v78 = 1024;
          v79 = (int)v31;
          v80 = 1024;
          v81 = v33;
          _os_log_error_impl(&dword_1A7CC9000, v30, OS_LOG_TYPE_ERROR, "[VMUSampler recordSampleTo:...] thread_info failed for pid %u thread index %u thread %u, err %d", (uint8_t *)thread_info_outCnt, 0x1Au);
        }
        goto LABEL_64;
      }
      v35 = NSMapGet(self->_lastThreadBacktraceMap, v31);
      v36 = v35;
      if (!v35) {
        break;
      }
      v37 = thread_info_out[1];
      v38 = *((_DWORD *)v35 + 1);
      if (thread_info_out[1] < v38) {
        v37 = thread_info_out[1] + 1000000;
      }
      if (v37 != v38 || thread_info_out[0] - *(_DWORD *)v35 != thread_info_out[1] < v38) {
        break;
      }
      v41 = (VMUBacktrace *)*((id *)v35 + 1);
      ++self->_numberOfCopiedBacktraces;
      if (v41) {
        goto LABEL_55;
      }
LABEL_63:

LABEL_64:
      mach_msg_type_number_t v27 = act_listCnt;
LABEL_65:
      if (++v28 >= (unint64_t)v27) {
        goto LABEL_66;
      }
    }
    if (v29)
    {
      v40 = [MEMORY[0x1E4F1C9C8] date];

      v65 = (void *)v40;
    }
    v41 = [[VMUBacktrace alloc] initWithSamplingContext:self->_samplingContext thread:v31 recordFramePointers:v67];
    if (v29)
    {
      [v65 timeIntervalSinceNow];
      self->_timeSpentSampling = self->_timeSpentSampling - v42;
    }
    if (!v41) {
      goto LABEL_63;
    }
LABEL_55:
    [(VMUBacktrace *)v41 setTimestamp:a4];
    v41->_callstack.context.pid = self->_pid;
    if (v22) {
      v43 = v22[v28];
    }
    else {
      v43 = 0;
    }
    v41->_callstack.context.run_state = v43;
    if (!v36)
    {
      v44 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      if (!v44)
      {
LABEL_62:
        [v64 addObject:v41];
        goto LABEL_63;
      }
      v36 = v44;
      NSMapInsert(self->_lastThreadBacktraceMap, v31, v44);
      v63 = 1;
    }
    *v36 = *(void *)thread_info_out;
    v36[1] = v41;
    goto LABEL_62;
  }
  self->_mainThread = 0;
  if (v27) {
    goto LABEL_35;
  }
  v65 = 0;
LABEL_66:
  if (v63)
  {
    if (self->_previousThreadCount)
    {
      v45 = 0;
      v46 = 0;
      v47 = (ipc_space_t *)MEMORY[0x1E4F14960];
      do
      {
        v48 = (const void *)self->_previousThreadList[v45];
        if (act_listCnt <= v46)
        {
LABEL_73:
          mach_port_deallocate(*v47, self->_previousThreadList[v45]);
          NSMapRemove(self->_lastThreadBacktraceMap, v48);
        }
        else
        {
          v49 = 0;
          while (act_list[v46 + v49] != v48)
          {
            if (act_listCnt - v46 == ++v49) {
              goto LABEL_73;
            }
          }
          if (!v49) {
            ++v46;
          }
          if (!a5) {
            mach_port_deallocate(*v47, self->_previousThreadList[v45]);
          }
        }
        ++v45;
      }
      while (v45 < self->_previousThreadCount);
      mach_msg_type_number_t v27 = act_listCnt;
    }
    maxPreviousThreadCount = self->_maxPreviousThreadCount;
    if (maxPreviousThreadCount >= v27)
    {
      previousThreadList = self->_previousThreadList;
    }
    else
    {
      v52 = 2 * maxPreviousThreadCount;
      if (v52 > v27) {
        mach_msg_type_number_t v27 = v52;
      }
      self->_maxPreviousThreadCount = v27;
      previousThreadList = (unsigned int *)malloc_type_realloc(self->_previousThreadList, 4 * v27, 0x100004052888210uLL);
      self->_previousThreadList = previousThreadList;
      mach_msg_type_number_t v27 = act_listCnt;
    }
    id v10 = v64;
    v50 = v62;
    memcpy(previousThreadList, act_list, 4 * v27);
    mach_msg_type_number_t v27 = act_listCnt;
    self->_previousThreadCount = act_listCnt;
    if (!v27) {
      goto LABEL_89;
    }
  }
  else
  {
    id v10 = v64;
    v50 = v62;
    if (!v27) {
      goto LABEL_89;
    }
  }
  mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)act_list, 4 * v27);
  act_listCnt = 0;
LABEL_89:
  if (v22) {
    free(v22);
  }
  if (v50 && self->_samplingContext) {
    sampling_context_clear_cache();
  }
  task_resume2(self->_suspensionToken);
  self->_stacksFixed = 0;
  if (![v10 count])
  {
    v54 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v54) {
      -[VMUSampler recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:](v54, v55, v56, v57, v58, v59, v60, v61);
    }
  }
  unint64_t v25 = [v10 count];

LABEL_27:
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueSerialNumToNameMap, 0);
  objc_storeStrong((id *)&self->_threadPortToNameMap, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_lastThreadBacktraceMap, 0);
  objc_storeStrong((id *)&self->_processDescription, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)threadNameForThread:(unsigned int)a3
{
  return [(VMUSampler *)self threadNameForThread:*(void *)&a3 returnedThreadId:0 returnedDispatchQueueSerialNum:0];
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3
{
  return [(VMUSampler *)self dispatchQueueNameForSerialNumber:a3 returnedConcurrentFlag:0 returnedThreadId:0];
}

+ (void)initialize
{
  g_environment_flags = 0;
  g_environment_flags = getenv("SYMBOLICATION_SHOW_BACKTRACE_TIMINGS") != 0;
}

- (id)threadNameForThread:(unsigned int)a3 returnedThreadId:(unint64_t *)a4 returnedDispatchQueueSerialNum:(unint64_t *)a5
{
  samplingContext = self->_samplingContext;
  if (samplingContext)
  {
    samplingContext = (void *)thread_name_for_thread_port();
    if (samplingContext)
    {
      samplingContext = [NSString stringWithUTF8String:samplingContext];
    }
  }

  return samplingContext;
}

- (id)dispatchQueueNameForSerialNumber:(unint64_t)a3 returnedConcurrentFlag:(BOOL *)a4 returnedThreadId:(unint64_t *)a5
{
  if (self->_samplingContext)
  {
    if (a3)
    {
      uint64_t v6 = dispatch_queue_name_for_serial_number();
      if (!a4) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = 0;
      if (!a4)
      {
LABEL_5:
        if (v6)
        {
          BOOL v7 = [NSString stringWithUTF8String:];
        }
        else
        {
          BOOL v7 = 0;
        }
        goto LABEL_14;
      }
    }
    *a4 = 0;
    goto LABEL_5;
  }
  if (a4) {
    *a4 = 0;
  }
  BOOL v7 = 0;
  if (a5) {
    *a5 = 0;
  }
LABEL_14:

  return v7;
}

- (void)_fixupStacks:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_stacksFixed && self->_samplingContext)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) fixupStackWithSamplingContext:self->_samplingContext symbolicator:self->_symbolicator._opaque_1 symbolicator:self->_symbolicator._opaque_2];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    self->_stacksFixed = 1;
  }
}

- (BOOL)stop
{
  if (self->_sampling)
  {
    self->_sampling = 0;
    [(NSConditionLock *)self->_stateLock lockWhenCondition:0];
    [(NSConditionLock *)self->_stateLock unlock];
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [self->_delegate samplingDidStop:self];
      }
    }
  }
  return 1;
}

- (id)sampleAllThreadsOnce
{
  return [(VMUSampler *)self sampleAllThreadsOnceWithFramePointers:0];
}

- (id)sampleAllThreadsOnceWithFramePointers:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [(VMUSampler *)self initializeSamplingContextWithOptions:0];
  if (self->_samplingContext)
  {
    if ([(VMUSampler *)self recordSampleTo:v5 timestamp:mach_absolute_time() thread:0 recordFramePointers:v3 clearMemoryCache:0])
    {
      [(VMUSampler *)self _fixupStacks:v5];
    }
    else
    {

      id v5 = 0;
    }
    id v5 = v5;
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)initializeSamplingContextWithOptions:(int)a3
{
  if (self->_samplingContext)
  {
    if (self->_samplingContextOptions == a3) {
      return;
    }
    destroy_sampling_context();
    self->_samplingContext = 0;
    self->_samplingContextOptions = 0;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t options = self->_options;
  if ((options & 0x200) != 0) {
    unsigned int v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3 | 0x10;
  }
  else {
    unsigned int v7 = (options >> 3) & 0x20 | (options >> 2) & 0x10 | (options >> 4) & 0x40 | a3;
  }
  sampling_context_for_task_pid_symbolicator = (sampling_context_t *)create_sampling_context_for_task_pid_symbolicator();
  self->_samplingContext = sampling_context_for_task_pid_symbolicator;
  self->_samplingContextOptions = v7;
  if (!sampling_context_for_task_pid_symbolicator)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v9) {
      -[VMUSampler initializeSamplingContextWithOptions:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  if (g_environment_flags == 1)
  {
    [v5 timeIntervalSinceNow];
    NSLog(&cfstr_TimeToInitiali.isa, -v17);
  }
}

- (VMUSampler)initWithPID:(int)a3 task:(unsigned int)a4 processName:(id)a5 is64Bit:(BOOL)a6 options:(unint64_t)a7
{
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)VMUSampler;
  uint64_t v12 = [(VMUSampler *)&v36 init];
  uint64_t v13 = v12;
  if (!v12)
  {
LABEL_27:
    uint64_t v14 = v13;
    goto LABEL_28;
  }
  uint64_t v14 = 0;
  if (a3 && a4)
  {
    v12->_pid = a3;
    v12->_task = a4;
    v12->_unint64_t options = a7 | ((a7 & 0x40) >> 1);
    uint64_t v15 = [[VMUProcInfo alloc] initWithPid:v12->_pid];
    if ([(VMUProcInfo *)v15 shouldAnalyzeWithCorpse])
    {
      v13->_options |= 0x200uLL;
      if ((a7 & 0x20) != 0)
      {
LABEL_6:
        if ((a7 & 0x10) == 0)
        {
LABEL_16:
          uint64_t v25 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:259];
          lastThreadBacktraceMap = v13->_lastThreadBacktraceMap;
          v13->_lastThreadBacktraceMap = (NSMapTable *)v25;

          v13->_numberOfCopiedBacktraces = 0;
          if ((a7 & 0x40) != 0)
          {
            v13->_symbolicator._opaque_1 = 0;
            v13->_symbolicator._opaque_2 = 0;
          }
          else if ((a7 & 0x20) != 0)
          {
            if (initWithPID_task_processName_is64Bit_options__once_token != -1) {
              dispatch_once(&initWithPID_task_processName_is64Bit_options__once_token, &__block_literal_global_8);
            }
            v13->_symbolicator = (_CSTypeRef)initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask;
            CSRetain();
            CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime();
          }
          else
          {
            if (a7) {
              CSSymbolicatorGetFlagsForNListOnlyData();
            }
            v13->_symbolicator._opaque_1 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
            v13->_symbolicator._opaque_2 = v27;
          }
          uint64_t v28 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
          stateLock = v13->_stateLock;
          v13->_stateLock = (NSConditionLock *)v28;

          v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          samples = v13->_samples;
          v13->_samples = v30;

          mach_timebase_info info = 0;
          mach_timebase_info(&info);
          LODWORD(v33) = info.denom;
          LODWORD(v32) = info.numer;
          v13->_tbRate = 1000000000.0 / (double)v32 * (double)v33;
          v13->_interval = 0.01;

          goto LABEL_27;
        }
LABEL_13:
        BOOL v21 = [[VMUProcessDescription alloc] initWithTask:v13->_task getBinariesList:1];
        processDescription = v13->_processDescription;
        v13->_processDescription = v21;

        v23 = v13->_processDescription;
        if (v23 && ![(VMUProcessDescription *)v23 pid])
        {
          thread_inspect_t v24 = v13->_processDescription;
          v13->_processDescription = 0;
        }
        goto LABEL_16;
      }
    }
    else if ((a7 & 0x20) != 0)
    {
      goto LABEL_6;
    }
    if (v11)
    {
      uint64_t v16 = [v11 copy];
      processName = v13->_processName;
      v13->_processName = (NSString *)v16;
    }
    else
    {
      processName = [(VMUProcInfo *)v15 userAppName];
      uint64_t v18 = [processName lastPathComponent];
      uint64_t v19 = [v18 copy];
      BOOL v20 = v13->_processName;
      v13->_processName = (NSString *)v19;
    }
    if ((a7 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_28:

  return v14;
}

- (void)dealloc
{
  [(VMUSampler *)self stop];
  previousThreadList = self->_previousThreadList;
  if (previousThreadList)
  {
    if (self->_previousThreadCount)
    {
      unint64_t v4 = 0;
      id v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
      do
        mach_port_deallocate(*v5, self->_previousThreadList[v4++]);
      while (v4 < self->_previousThreadCount);
      previousThreadList = self->_previousThreadList;
    }
    free(previousThreadList);
  }
  CSRelease();
  self->_symbolicator._opaque_1 = 0;
  self->_symbolicator._opaque_2 = 0;
  mach_port_name_t task = self->_task;
  if (task + 1 >= 2 && self->_needTaskPortDealloc) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], task);
  }
  if (self->_samplingContext)
  {
    destroy_sampling_context();
    self->_samplingContext = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)VMUSampler;
  [(VMUSampler *)&v7 dealloc];
}

uint64_t __59__VMUSampler_initWithPID_task_processName_is64Bit_options___block_invoke()
{
  CSSymbolicatorGetFlagsForNListOnlyData();
  uint64_t result = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  *(void *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask = result;
  *((void *)&initWithPID_task_processName_is64Bit_options__symbolicatorForThisToolTask + 1) = v1;
  return result;
}

- (VMUSampler)initWithPID:(int)a3 orTask:(unsigned int)a4 options:(unint64_t)a5
{
  int x = a3;
  if (a4 - 1 > 0xFFFFFFFD)
  {
    uint64_t v8 = *(void *)&a3;
    if (!a3)
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v9) {
        -[VMUSampler initWithPID:orTask:options:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
      goto LABEL_12;
    }
    if (task_read_for_pid())
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VMUSampler initWithPID:orTask:options:]();
      }
      goto LABEL_12;
    }
    self->_needTaskPortDealloc = 1;
    uint64_t v7 = a4;
LABEL_14:
    self = [(VMUSampler *)self initWithPID:v8 task:v7 processName:0 is64Bit:0 options:a5];
    double v17 = self;
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)&a4;
  if (!pid_for_task(a4, &x))
  {
    uint64_t v8 = x;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[VMUSampler initWithPID:orTask:options:]();
  }
LABEL_12:
  double v17 = 0;
LABEL_15:

  return v17;
}

- (VMUSampler)initWithPID:(int)a3
{
  return [(VMUSampler *)self initWithPID:*(void *)&a3 orTask:0 options:0];
}

- (VMUSampler)initWithTask:(unsigned int)a3
{
  return [(VMUSampler *)self initWithPID:0 orTask:*(void *)&a3 options:0];
}

- (VMUSampler)initWithPID:(int)a3 options:(unint64_t)a4
{
  return [(VMUSampler *)self initWithPID:*(void *)&a3 orTask:0 options:a4];
}

- (VMUSampler)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  return [(VMUSampler *)self initWithPID:0 orTask:*(void *)&a3 options:a4];
}

- (void)_checkDispatchThreadLimits
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if (proc_pidinfo(self->_pid, 12, 0, &v4, 16) >= 16)
  {
    char v3 = BYTE4(v5);
    if ((v5 & 0x100000000) != 0) {
      ++self->_dispatchThreadSoftLimitCount;
    }
    if ((v3 & 2) != 0) {
      ++self->_dispatchThreadHardLimitCount;
    }
  }
}

- (void)_runSamplingThread
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A7CC9000, MEMORY[0x1E4F14500], v0, "failed to set priority to %u for sampling thread: %d", v1, v2, v3, v4, v5);
}

+ (id)sampleAllThreadsOfPID:(int)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithPID:*(void *)&a3];
  uint64_t v4 = [v3 sampleAllThreadsOnce];

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithTask:*(void *)&a3];
  uint64_t v4 = [v3 sampleAllThreadsOnce];

  return v4;
}

+ (id)sampleAllThreadsOfTask:(unsigned int)a3 symbolicate:(BOOL)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithTask:*(void *)&a3 options:!a4];
  uint8_t v5 = [v4 sampleAllThreadsOnce];

  return v5;
}

- (id)sampleThread:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((self->_options & 0x40) != 0) {
    uint64_t v5 = 25;
  }
  else {
    uint64_t v5 = 9;
  }
  [(VMUSampler *)self initializeSamplingContextWithOptions:v5];
  if (self->_samplingContext)
  {
    thread_suspend(v3);
    uint64_t v6 = [[VMUBacktrace alloc] initWithSamplingContext:self->_samplingContext thread:v3 recordFramePointers:0];
    thread_resume(v3);
    samplingContext = self->_samplingContext;
    uint64_t v8 = [(VMUSampler *)self symbolicator];
    -[VMUBacktrace fixupStackWithSamplingContext:symbolicator:](v6, "fixupStackWithSamplingContext:symbolicator:", samplingContext, v8, v9);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)start
{
  if (self->_sampling)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    BOOL v2 = [(NSConditionLock *)self->_stateLock tryLockWhenCondition:0];
    if (v2)
    {
      self->_sampling = 1;
      [(NSConditionLock *)self->_stateLock unlockWithCondition:1];
      [(NSMutableArray *)self->_samples removeAllObjects];
      self->_numberOfSamples = 0;
      if (self->_interval > 0.0) {
        [MEMORY[0x1E4F29060] detachNewThreadSelector:sel__runSamplingThread toTarget:self withObject:0];
      }
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
        [self->_delegate samplingDidStart:self];
      }
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (BOOL)waitUntilDone
{
  if (self->_sampling)
  {
    [(NSConditionLock *)self->_stateLock lockWhenCondition:0];
    [(NSConditionLock *)self->_stateLock unlock];
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [self->_delegate samplingDidStop:self];
      }
    }
  }
  return 1;
}

- (void)setSamplingInterval:(double)a3
{
  if (a3 > 0.0) {
    self->_interval = a3;
  }
}

- (double)samplingInterval
{
  return self->_interval;
}

- (void)setTimeLimit:(double)a3
{
  if (a3 >= 0.0) {
    self->_timeLimit = a3;
  }
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (void)setSampleLimit:(unsigned int)a3
{
  self->_sampleLimit = a3;
}

- (unsigned)sampleLimit
{
  return self->_sampleLimit;
}

- (void)setRecordThreadStates:(BOOL)a3
{
  self->_recordThreadStates = a3;
}

- (void)setSymbolicator:(_CSTypeRef)a3
{
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
  self->_symbolicator._opaque_1 = CSRetain();
  self->_symbolicator._opaque_2 = v4;
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2 = self->_symbolicator._opaque_2;
  unint64_t opaque_1 = self->_symbolicator._opaque_1;
  result._unint64_t opaque_2 = opaque_2;
  result._unint64_t opaque_1 = opaque_1;
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (id)samples
{
  [(VMUSampler *)self stop];
  samples = self->_samples;

  return samples;
}

- (unsigned)sampleCount
{
  return self->_numberOfSamples;
}

- (void)flushData
{
  if (!self->_sampling)
  {
    [(NSMutableArray *)self->_samples removeAllObjects];
    self->_numberOfSamples = 0;
    NSResetMapTable(self->_lastThreadBacktraceMap);
    self->_previousThreadCount = 0;
  }
}

- (unsigned)mainThread
{
  return self->_mainThread;
}

- (id)threadDescriptionStringForBacktrace:(id)a3 returnedAddress:(unint64_t *)a4
{
  id v6 = a3;
  if (!self->_threadPortToNameMap)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
    threadPortToNameMap = self->_threadPortToNameMap;
    self->_threadPortToNameMap = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
    dispatchQueueSerialNumToNameMap = self->_dispatchQueueSerialNumToNameMap;
    self->_dispatchQueueSerialNumToNameMap = v9;
  }
  uint64_t v11 = [v6 thread];
  unsigned int v12 = [(VMUSampler *)self mainThread];
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v13 = [(VMUSampler *)self threadNameForThread:v11 returnedThreadId:&v39 returnedDispatchQueueSerialNum:&v38];
  uint64_t v14 = [v13 length];
  uint64_t v15 = [v6 dispatchQueueSerialNumber];
  unint64_t v16 = v15;
  if (v11 == v12)
  {
    if (!v15 || v38 != v15) {
      goto LABEL_13;
    }
  }
  else if (!v15)
  {
LABEL_13:
    v22 = self->_threadPortToNameMap;
    [NSNumber numberWithUnsignedInt:v11];
    thread_inspect_t v24 = v23 = a4;
    id v19 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v24];

    a4 = v23;
    if (!v19)
    {
      if (v39) {
        [MEMORY[0x1E4F28E78] stringWithFormat:@"Thread_%qu", v39];
      }
      else {
      uint64_t v25 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Thread_%x", v11];
      }
      v26 = v25;
      if (v14)
      {
        [v25 appendFormat:@": %@", v13];
      }
      else if (v11 == v12)
      {
        [v25 appendFormat:@": %@", kVMUMainThreadName[0]];
        if (!v38 && (self->_options & 4) == 0) {
          [v26 appendString:@"   DispatchQueue_<multiple>"];
        }
      }
      unint64_t v27 = self->_threadPortToNameMap;
      uint64_t v28 = NSNumber;
      id v19 = v26;
      int v29 = [v28 numberWithUnsignedInt:v11];
      [(NSMutableDictionary *)v27 setObject:v19 forKeyedSubscript:v29];
    }
    unint64_t v16 = v11;
LABEL_25:
    if (!a4) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ((self->_options & 4) != 0) {
    goto LABEL_13;
  }
  double v17 = self->_dispatchQueueSerialNumToNameMap;
  uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v15];
  id v19 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v18];

  if (v19) {
    goto LABEL_25;
  }
  char v37 = 0;
  uint64_t v36 = 0;
  BOOL v20 = [(VMUSampler *)self dispatchQueueNameForSerialNumber:v16 returnedConcurrentFlag:&v37 returnedThreadId:&v36];
  if (v36 || v37)
  {
    BOOL v21 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Thread_%qu", v39];
  }
  else
  {
    BOOL v21 = [MEMORY[0x1E4F28E78] stringWithString:@"Thread_<multiple>"];
  }
  id v19 = v21;
  if (v37) {
    v31 = "concurrent";
  }
  else {
    v31 = "serial";
  }
  [v21 appendFormat:@"   DispatchQueue_%qu: %@  (%s)", v16, v20, v31];
  if (v36 || !v37)
  {
    unint64_t v32 = self->_dispatchQueueSerialNumToNameMap;
    unint64_t v33 = NSNumber;
    id v34 = v19;
    v35 = [v33 numberWithUnsignedLongLong:v16];
    [(NSMutableDictionary *)v32 setObject:v34 forKeyedSubscript:v35];
  }
  if (a4) {
LABEL_26:
  }
    *a4 = v16;
LABEL_27:

  return v19;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)preloadSymbols
{
}

- (void)sampleForDuration:(unsigned int)a3 interval:(unsigned int)a4
{
  [(VMUSampler *)self setSamplingInterval:(double)a4 / 1000000.0];
  [(VMUSampler *)self setTimeLimit:(double)a3];
  [(VMUSampler *)self start];

  [(VMUSampler *)self waitUntilDone];
}

- (id)stopSamplingAndReturnCallNode
{
  uint64_t v3 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  [(VMUSampler *)self stop];
  [(VMUSampler *)self _fixupStacks:self->_samples];
  unint64_t v4 = +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:](VMUCallTreeNode, "rootForSamples:symbolicator:sampler:options:", self->_samples, self->_symbolicator._opaque_1, self->_symbolicator._opaque_2, self, ((self->_options >> 2) & 0x21 | self->_options & 2) ^ 1);

  return v4;
}

- (id)outputString
{
  uint64_t v3 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  if (!self->_processName)
  {
    self->_processName = (NSString *)@"unknown-process";
  }
  double v4 = self->_interval * 1000.0;
  if ((int)v4 <= 1) {
    uint64_t v5 = @"Analysis of sampling %@ (pid %d) every %d millisecond\n";
  }
  else {
    uint64_t v5 = @"Analysis of sampling %@ (pid %d) every %d milliseconds\n";
  }
  id v6 = [NSString stringWithFormat:v5, self->_processName, self->_pid, (int)v4];
  if (self->_dispatchThreadSoftLimitCount || self->_dispatchThreadHardLimitCount)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E78] string];
    uint64_t v8 = v7;
    if (self->_dispatchThreadSoftLimitCount) {
      [v7 appendFormat:@"Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n", @"Soft", self->_dispatchThreadSoftLimit, self->_dispatchThreadSoftLimitCount, self->_numberOfSamples];
    }
    if (self->_dispatchThreadHardLimitCount) {
      [v8 appendFormat:@"Dispatch Thread %@ Limit: %u reached in %u of %u samples -- too many dispatch threads blocked in synchronous operations\n", @"Hard", self->_dispatchThreadHardLimit, self->_dispatchThreadHardLimitCount, self->_numberOfSamples];
    }
    [v8 appendString:@"\n"];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(VMUProcessDescription *)self->_processDescription description];
  uint64_t v10 = [(VMUProcessDescription *)self->_processDescription binaryImagesDescription];
  uint64_t v11 = [(VMUSampler *)self stopSamplingAndReturnCallNode];
  unsigned int v12 = [v11 fullOutputWithThreshold:5];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v6];
  if ([v9 length]) {
    [v13 appendString:v9];
  }
  if ([v8 length]) {
    [v13 appendString:v8];
  }
  [v13 appendString:v12];
  if ([v10 length]) {
    [v13 appendFormat:@"\n%@", v10];
  }

  return v13;
}

- (void)writeOutput:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1AD0D9F90]();
  id v8 = [(VMUSampler *)self outputString];
  uint64_t v9 = (const char *)[v8 UTF8String];

  unint64_t options = self->_options;
  if (v6)
  {
    uint64_t v11 = (const char *)[v6 UTF8String];
    unsigned int v12 = (char *)v11;
    if (v4) {
      uint64_t v13 = "ae";
    }
    else {
      uint64_t v13 = "we";
    }
    uint64_t v14 = fopen(v11, v13);
    BOOL v15 = 1;
    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
    processName = self->_processName;
    unint64_t v26 = self->_options;
    unint64_t v27 = v7;
    if (!processName)
    {
      self->_processName = (NSString *)@"unknown-process";

      processName = self->_processName;
    }
    uint64_t v19 = [(NSString *)processName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v20 setDateFormat:@"yyyy-MM-dd_HHmmss"];
    BOOL v21 = [(VMUProcessDescription *)self->_processDescription date];
    if (!v21)
    {
      BOOL v21 = [MEMORY[0x1E4F1C9C8] date];
    }
    v22 = [v20 stringFromDate:v21];
    uint64_t v25 = (void *)v19;
    id v23 = [NSString stringWithFormat:@"/tmp/%@_%@_XXXX.sample.txt", v19, v22];
    snprintf(__str, 0x400uLL, "%s", (const char *)[v23 UTF8String]);
    int v24 = mkstemps(__str, 11);
    BOOL v15 = v24 >= 0;
    if (v24 < 0)
    {
      fwrite("Unable to create secure temp file\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      unsigned int v12 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = fdopen(v24, "we");
      unsigned int v12 = __str;
    }

    unint64_t options = v26;
    uint64_t v7 = v27;
    if (v14)
    {
LABEL_6:
      size_t v16 = strlen(v9);
      if (!fwrite(v9, v16, 1uLL, v14))
      {
        -[VMUSampler writeOutput:append:](v12);
        BOOL v15 = 0;
      }
      fclose(v14);
      if (geteuid())
      {
        if (v15) {
          goto LABEL_10;
        }
      }
      else
      {
        chmod(v12, 0x1A4u);
        if (v15)
        {
LABEL_10:
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "Sample analysis of process %d written to file %s\n", self->_pid, v12);
          LOBYTE(v17) = 0;
          if (v6) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
      }
      uint64_t v17 = (options >> 3) & 1;
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  perror("fopen");
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "Unable to open/create sample file %s\n", v12);
  uint64_t v17 = (options >> 3) & 1;
  if (v6) {
    goto LABEL_22;
  }
LABEL_20:
  if ((v17 & 1) == 0)
  {
    putchar(10);
    printf("%s", v9);
    putchar(10);
  }
LABEL_22:
}

- (void)initWithPID:orTask:options:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7CC9000, MEMORY[0x1E4F14500], v0, "[VMUSampler initWithPID:orTask:options:] failed to get pid for task %u  err %d", v1, v2, v3, v4, v5);
}

- (void)initWithPID:(uint64_t)a3 orTask:(uint64_t)a4 options:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPID:orTask:options:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A7CC9000, MEMORY[0x1E4F14500], v0, "[VMUSampler initWithPID:orTask:options:] failed to get task for pid %u  err %d", v1, v2, v3, v4, v5);
}

- (void)initializeSamplingContextWithOptions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A7CC9000, MEMORY[0x1E4F14500], v0, "[VMUSampler recordSampleTo:...] task_threads failed for pid %u, err %d", v1, v2, v3, v4, v5);
}

- (void)recordSampleTo:(uint64_t)a3 timestamp:(uint64_t)a4 thread:(uint64_t)a5 recordFramePointers:(uint64_t)a6 clearMemoryCache:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)recordSampleTo:timestamp:thread:recordFramePointers:clearMemoryCache:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A7CC9000, MEMORY[0x1E4F14500], v0, "[VMUSampler recordSampleTo:...] task_suspend2 failed for pid %u, err %d", v1, v2, v3, v4, v5);
}

- (uint64_t)writeOutput:(const char *)a1 append:.cold.1(const char *a1)
{
  return fprintf((FILE *)*MEMORY[0x1E4F143C8], "Unable to write sample file %s\n", a1);
}

@end