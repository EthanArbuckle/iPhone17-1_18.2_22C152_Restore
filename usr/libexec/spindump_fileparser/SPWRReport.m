@interface SPWRReport
- (SADispatchQueue)dispatchQueue;
- (SATask)task;
- (SAThread)thread;
- (SATimeRange)timeRange;
- (SPWRReport)initWithReportReason:(id)a3 reportedSignpostTracker:(id)a4 task:(id)a5 timeRange:(id)a6 thread:(id)a7 dispatchQueue:(id)a8;
- (SPWRReportReason)reportReason;
- (WRSignpostTracker)reportedSignpostTracker;
- (void)dealloc;
@end

@implementation SPWRReport

- (SPWRReport)initWithReportReason:(id)a3 reportedSignpostTracker:(id)a4 task:(id)a5 timeRange:(id)a6 thread:(id)a7 dispatchQueue:(id)a8
{
  if (!((unint64_t)a7 | (unint64_t)a8))
  {
    if (byte_1000EFD38)
    {
      int v16 = *__error();
      v17 = sub_10002FC70();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100084340(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      *__error() = v16;
    }
    if (byte_1000EFD39) {
      BOOL v25 = dword_1000EF4E8 <= 3;
    }
    else {
      BOOL v25 = 0;
    }
    if (v25)
    {
      int v26 = *__error();
      CFStringRef v27 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: No thread nor dispatch queue", "thread || dispatchQueue");
      if (v27)
      {
        CFStringRef theString = v27;
        CStringPtr = CFStringGetCStringPtr(v27, 0x8000100u);
        if (CStringPtr)
        {
          v38 = (char *)CStringPtr;
          v39 = 0;
        }
        else
        {
          v38 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD11332AEuLL);
          CFStringGetCString(theString, v38, 1024, 0x8000100u);
          v39 = v38;
        }
        if (qword_1000EFD40) {
          v40 = (FILE *)qword_1000EFD40;
        }
        else {
          v40 = __stderrp;
        }
        fprintf(v40, "%s\n", v38);
        if (v39) {
          free(v39);
        }
        CFRelease(theString);
      }
      else
      {
        v28 = sub_10002FC70();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          sub_1000842C8(v28, v29, v30, v31, v32, v33, v34, v35);
        }
        if (qword_1000EFD40) {
          v36 = (FILE *)qword_1000EFD40;
        }
        else {
          v36 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v36);
      }
      *__error() = v26;
    }
    sub_10002FB44("-[SPWRReport initWithReportReason:reportedSignpostTracker:task:timeRange:thread:dispatchQueue:]", "monitor-WorkflowResponsiveness.m", 95, "%s: No thread nor dispatch queue", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (char)"thread || dispatchQueue");
    abort();
  }
  v14 = [(SPWRReport *)self init];
  if (v14)
  {
    v14->_reportReason = (SPWRReportReason *)a3;
    v14->_reportedSignpostTracker = (WRSignpostTracker *)a4;
    v14->_task = (SATask *)a5;
    v14->_timeRange = (SATimeRange *)a6;
    v14->_thread = (SAThread *)a7;
    v14->_dispatchQueue = (SADispatchQueue *)a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SPWRReport;
  [(SPWRReport *)&v3 dealloc];
}

- (SPWRReportReason)reportReason
{
  return self->_reportReason;
}

- (WRSignpostTracker)reportedSignpostTracker
{
  return self->_reportedSignpostTracker;
}

- (SATimeRange)timeRange
{
  return self->_timeRange;
}

- (SATask)task
{
  return self->_task;
}

- (SAThread)thread
{
  return self->_thread;
}

- (SADispatchQueue)dispatchQueue
{
  return self->_dispatchQueue;
}

@end