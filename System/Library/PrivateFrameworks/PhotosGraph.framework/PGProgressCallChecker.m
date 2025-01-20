@interface PGProgressCallChecker
- (BOOL)reportMemoryUsage;
- (NSString)taskName;
- (PGProgressCallChecker)initWithTaskName:(id)a3;
- (PGProgressCallChecker)initWithTaskName:(id)a3 loggingConnection:(id)a4;
- (id)memoryUsage;
- (void)checkCallsWithProgress:(double)a3 stop:(BOOL)a4;
- (void)setReportMemoryUsage:(BOOL)a3;
- (void)setTaskName:(id)a3;
@end

@implementation PGProgressCallChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (void)setReportMemoryUsage:(BOOL)a3
{
  self->_reportMemoryUsage = a3;
}

- (BOOL)reportMemoryUsage
{
  return self->_reportMemoryUsage;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)checkCallsWithProgress:(double)a3 stop:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL wasStopped = self->_wasStopped;
  if (wasStopped)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      taskName = self->_taskName;
      *(double *)&v37 = COERCE_DOUBLE(@" Also *stop* seems to have been reset!!!");
      if (v4) {
        *(double *)&v37 = COERCE_DOUBLE(&stru_1F283BC78);
      }
      int v39 = 138412546;
      v40 = taskName;
      __int16 v41 = 2112;
      double v42 = *(double *)&v37;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "%@: Progress called again although task was stopped!!!%@", (uint8_t *)&v39, 0x16u);
      BOOL wasStopped = self->_wasStopped;
    }
  }
  self->_BOOL wasStopped = wasStopped || v4;
  v9 = @", stopped";
  if (!v4) {
    v9 = &stru_1F283BC78;
  }
  v10 = v9;
  double lastProgress = self->_lastProgress;
  if (lastProgress + -2.22044605e-16 > a3)
  {
    v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_taskName;
      int v39 = 138412802;
      v40 = v13;
      __int16 v41 = 2048;
      double v42 = lastProgress;
      __int16 v43 = 2048;
      double v44 = a3;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "%@: Progress going backwards from %1.4f to %1.4f", (uint8_t *)&v39, 0x20u);
    }
  }
  self->_double lastProgress = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double timestampOfLastCallToProgress = self->_timestampOfLastCallToProgress;
  double v16 = Current - timestampOfLastCallToProgress;
  unint64_t numberOfCallsToProgressSinceLastRecordedCall = self->_numberOfCallsToProgressSinceLastRecordedCall;
  if (Current - timestampOfLastCallToProgress >= 1.0)
  {
    if (*(double *)&numberOfCallsToProgressSinceLastRecordedCall != 0.0)
    {
      v26 = self->_loggingConnection;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_taskName;
        double v28 = timestampOfLastCallToProgress - self->_timestampOfLastRecordedCallToProgress;
        int v39 = 138413058;
        v40 = v27;
        __int16 v41 = 2048;
        double v42 = *(double *)&numberOfCallsToProgressSinceLastRecordedCall;
        __int16 v43 = 2048;
        double v44 = v28;
        __int16 v45 = 2112;
        double v46 = *(double *)&v10;
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_DEFAULT, "%@: Progress --------, called %lu time(s) in %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
      if (self->_reportMemoryUsage)
      {
        v29 = self->_loggingConnection;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = [(PGProgressCallChecker *)self memoryUsage];
          int v39 = 138412290;
          v40 = v31;
          _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_DEFAULT, "Mem: %@", (uint8_t *)&v39, 0xCu);
        }
      }
      self->_unint64_t numberOfCallsToProgressSinceLastRecordedCall = 0;
    }
    if (v16 >= 30.0)
    {
      v34 = self->_loggingConnection;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v35 = self->_taskName;
        int v39 = 138413058;
        v40 = v35;
        __int16 v41 = 2048;
        double v42 = a3;
        __int16 v43 = 2048;
        double v44 = Current - timestampOfLastCallToProgress;
        __int16 v45 = 2112;
        double v46 = *(double *)&v10;
        _os_log_fault_impl(&dword_1D1805000, v34, OS_LOG_TYPE_FAULT, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
    }
    else
    {
      v32 = self->_loggingConnection;
      if (v16 >= 5.0)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v38 = self->_taskName;
          int v39 = 138413058;
          v40 = v38;
          __int16 v41 = 2048;
          double v42 = a3;
          __int16 v43 = 2048;
          double v44 = Current - timestampOfLastCallToProgress;
          __int16 v45 = 2112;
          double v46 = *(double *)&v10;
          _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_taskName;
        int v39 = 138413058;
        v40 = v33;
        __int16 v41 = 2048;
        double v42 = a3;
        __int16 v43 = 2048;
        double v44 = Current - timestampOfLastCallToProgress;
        __int16 v45 = 2112;
        double v46 = *(double *)&v10;
        _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_DEFAULT, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
    }
    self->_timestampOfLastRecordedCallToProgress = Current;
  }
  else
  {
    unint64_t v18 = numberOfCallsToProgressSinceLastRecordedCall + 1;
    self->_unint64_t numberOfCallsToProgressSinceLastRecordedCall = v18;
    double v19 = Current - self->_timestampOfLastRecordedCallToProgress;
    if (v19 >= 1.0 || v4)
    {
      v21 = self->_loggingConnection;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_taskName;
        int v39 = 138413314;
        v40 = v22;
        __int16 v41 = 2048;
        double v42 = a3;
        __int16 v43 = 2048;
        double v44 = *(double *)&v18;
        __int16 v45 = 2048;
        double v46 = v19;
        __int16 v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_DEFAULT, "%@: Progress %1.4f, called %lu times in %.2f sec%@", (uint8_t *)&v39, 0x34u);
      }
      if (self->_reportMemoryUsage)
      {
        v23 = self->_loggingConnection;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          v25 = [(PGProgressCallChecker *)self memoryUsage];
          int v39 = 138412290;
          v40 = v25;
          _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "Mem: %@", (uint8_t *)&v39, 0xCu);
        }
      }
      self->_timestampOfLastRecordedCallToProgress = Current;
      self->_unint64_t numberOfCallsToProgressSinceLastRecordedCall = 0;
    }
  }
  self->_double timestampOfLastCallToProgress = Current;
}

- (id)memoryUsage
{
  int v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v8 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  task_info(*MEMORY[0x1E4F14960], 0x16u, task_info_out, &task_info_outCnt);
  v2 = [MEMORY[0x1E4F71EE8] humanReadableMemorySizeWithSize:(void)v16];
  v3 = [MEMORY[0x1E4F71EE8] humanReadableMemorySizeWithSize:*((void *)&v17 + 1)];
  BOOL v4 = [NSString stringWithFormat:@"%@ (%@)", v2, v3];

  return v4;
}

- (PGProgressCallChecker)initWithTaskName:(id)a3
{
  return [(PGProgressCallChecker *)self initWithTaskName:a3 loggingConnection:MEMORY[0x1E4F14500]];
}

- (PGProgressCallChecker)initWithTaskName:(id)a3 loggingConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGProgressCallChecker;
  long long v8 = [(PGProgressCallChecker *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    taskName = v8->_taskName;
    v8->_taskName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_loggingConnection, a4);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v8->_double timestampOfLastCallToProgress = Current;
    v8->_timestampOfLastRecordedCallToProgress = Current;
  }

  return v8;
}

@end