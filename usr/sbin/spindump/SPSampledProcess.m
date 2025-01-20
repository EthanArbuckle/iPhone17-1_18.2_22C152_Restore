@interface SPSampledProcess
+ (BOOL)receivedHidEventForPid:(int)a3 eventTimeMachAbs:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6;
+ (id)allSampledProcesses;
+ (id)copySampledProcessForPid:(int)a3 isWSBased:(BOOL)a4 createIfUnsampled:(BOOL)a5 wasSampled:(BOOL *)a6;
- (BOOL)cancelOnMemoryPressure;
- (BOOL)startSampling;
- (SPSampledProcess)initWithPid:(int)a3 isWSBased:(BOOL)a4;
- (unsigned)occasionalDataIntervalSec;
- (unsigned)samplingIntervalUs;
- (unsigned)samplingMode;
- (void)_performSamplePrinterWork:(id)a3;
- (void)_samplingHasCompletedWithEndSnapshot:(id)a3 withReason:(unsigned __int8)a4;
- (void)_saveReportToStream:(__sFILE *)a3;
- (void)createHIDExitSource;
- (void)dealloc;
- (void)deleteHIDExitSource;
- (void)gatherLoadInfoForPid:(int)a3;
- (void)removeSelfFromPidCache;
- (void)requireHIDEvent:(BOOL)a3;
- (void)setCancelOnMemoryPressure:(BOOL)a3;
- (void)setOccasionalDataIntervalSec:(unsigned int)a3;
- (void)setSamplingCompletionHandlerQueue:(id)a3 andBlock:(id)a4;
- (void)setSamplingIntervalUs:(unsigned int)a3;
- (void)setSamplingMode:(unsigned __int8)a3 withAdditionalSampledProcesses:(id)a4;
- (void)setSamplingTimeoutAtTime:(double)a3;
- (void)setStopWhenProcessExits:(BOOL)a3;
- (void)stopSamplingWithReason:(unsigned __int8)a3;
@end

@implementation SPSampledProcess

- (SPSampledProcess)initWithPid:(int)a3 isWSBased:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SPSampledProcess;
  v6 = -[SPMonitoredProcess initWithPid:](&v9, "initWithPid:");
  if (v6)
  {
    snprintf(__str, 0x40uLL, "com.apple.spindump.sampled_process_%d", a3);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->super.super._processingQueue = (OS_dispatch_queue *)dispatch_queue_create(__str, v7);
    dispatch_release(v7);
    v6->super.super._isWSBased = a4;
    v6->_samplingMode = 3;
    v6->_sampledProcesses = 0;
    v6->_cancelOnMemoryPressure = 0;
  }
  return v6;
}

- (void)dealloc
{
  hidEventSem = self->_hidEventSem;
  if (hidEventSem) {
    dispatch_release(hidEventSem);
  }
  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource) {
    dispatch_release((dispatch_object_t)exitHIDSource);
  }

  v5.receiver = self;
  v5.super_class = (Class)SPSampledProcess;
  [(SPProcessEvent *)&v5 dealloc];
}

- (BOOL)cancelOnMemoryPressure
{
  return self->_cancelOnMemoryPressure;
}

- (void)setCancelOnMemoryPressure:(BOOL)a3
{
  self->_cancelOnMemoryPressure = a3;
  if (a3) {
    +[SPSampledProcess startMemoryPressureTimer];
  }
}

+ (id)copySampledProcessForPid:(int)a3 isWSBased:(BOOL)a4 createIfUnsampled:(BOOL)a5 wasSampled:(BOOL *)a6
{
  uint64_t v9 = *(void *)&a3;
  if (qword_1000EBC70 != -1) {
    dispatch_once(&qword_1000EBC70, &stru_1000DD8F8);
  }
  id v10 = [objc_alloc((Class)NSNumber) initWithInt:v9];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = sub_1000622C8;
  v21 = sub_1000622D8;
  uint64_t v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000622E4;
  v13[3] = &unk_1000DD920;
  v13[4] = v10;
  v13[5] = &v17;
  BOOL v15 = a5;
  int v14 = v9;
  BOOL v16 = a4;
  v13[6] = a6;
  dispatch_sync((dispatch_queue_t)qword_1000EBC80, v13);

  v11 = (void *)v18[5];
  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (id)allSampledProcesses
{
  return [(id)qword_1000EBC78 allValues];
}

- (void)removeSelfFromPidCache
{
  if (self->super.super._isSelfInPidCache)
  {
    self->super.super._isSelfInPidCache = 0;
    int targetProcessId = self->super.super._targetProcessId;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100062484;
    v3[3] = &unk_1000DD840;
    int v4 = targetProcessId;
    v3[4] = self;
    dispatch_async((dispatch_queue_t)qword_1000EBC80, v3);
  }
}

- (void)gatherLoadInfoForPid:(int)a3
{
}

- (void)createHIDExitSource
{
  if (self->_exitHIDSource) {
    return;
  }
  p_uintptr_t targetProcessId = &self->super.super._targetProcessId;
  uintptr_t targetProcessId = self->super.super._targetProcessId;
  global_queue = dispatch_get_global_queue(25, 2uLL);
  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, targetProcessId, 0xA0000000uLL, global_queue);
  self->_exitHIDSource = v6;
  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000628DC;
    handler[3] = &unk_1000DD618;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    dispatch_resume((dispatch_object_t)self->_exitHIDSource);
    return;
  }
  if ((*p_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v7 = *__error();
      v8 = sub_10002E548();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100094504();
      }
      *__error() = v7;
    }
    if (byte_1000EBCF9) {
      BOOL v9 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      return;
    }
    int v10 = *__error();
    v11 = sub_10002E4E8(*p_targetProcessId);
    CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Unable to allocate proc exit HID dispatch source", v11, *p_targetProcessId);
    if (v12)
    {
      CFStringRef v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        BOOL v15 = (char *)CStringPtr;
        BOOL v16 = 0;
      }
      else
      {
        BOOL v15 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3E81B049uLL);
        CFStringGetCString(v13, v15, 1024, 0x8000100u);
        BOOL v16 = v15;
      }
      if (qword_1000EBD00) {
        v26 = (FILE *)qword_1000EBD00;
      }
      else {
        v26 = __stderrp;
      }
      fprintf(v26, "%s\n", v15);
      if (v16) {
        free(v16);
      }
      CFStringRef v27 = v13;
LABEL_51:
      CFRelease(v27);
LABEL_52:
      *__error() = v10;
      return;
    }
    v25 = sub_10002E548();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_10009448C();
    }
    goto LABEL_40;
  }
  if (byte_1000EBCF8)
  {
    int v17 = *__error();
    v18 = sub_10002E548();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000945B0();
    }
    *__error() = v17;
  }
  if (byte_1000EBCF9) {
    BOOL v19 = dword_1000EB4A8 <= 3;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v10 = *__error();
    CFStringRef v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Unable to allocate proc exit HID dispatch source");
    if (v20)
    {
      CFStringRef v21 = v20;
      uint64_t v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        v23 = (char *)v22;
        v24 = 0;
      }
      else
      {
        v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3E81B049uLL);
        CFStringGetCString(v21, v23, 1024, 0x8000100u);
        v24 = v23;
      }
      if (qword_1000EBD00) {
        v30 = (FILE *)qword_1000EBD00;
      }
      else {
        v30 = __stderrp;
      }
      fprintf(v30, "%s\n", v23);
      if (v24) {
        free(v24);
      }
      CFStringRef v27 = v21;
      goto LABEL_51;
    }
    v28 = sub_10002E548();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_10009457C();
    }
LABEL_40:
    if (qword_1000EBD00) {
      v29 = (FILE *)qword_1000EBD00;
    }
    else {
      v29 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_52;
  }
}

- (void)deleteHIDExitSource
{
  exitHIDSource = self->_exitHIDSource;
  if (exitHIDSource)
  {
    dispatch_release((dispatch_object_t)exitHIDSource);
    self->_exitHIDSource = 0;
  }
}

- (void)requireHIDEvent:(BOOL)a3
{
  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100063380;
  v4[3] = &unk_1000DD998;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(processingQueue, v4);
}

+ (BOOL)receivedHidEventForPid:(int)a3 eventTimeMachAbs:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100064C30;
  v8[3] = &unk_1000DD9C0;
  int v9 = a3;
  v8[4] = a6;
  v8[5] = a5;
  v8[6] = &v10;
  v8[7] = a4;
  sub_100062C50((uint64_t)v8);
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)setSamplingMode:(unsigned __int8)a3 withAdditionalSampledProcesses:(id)a4
{
  id v4 = a4;
  int v5 = a3;
  if (a3 == 3 && a4)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v18 = *__error();
        BOOL v19 = sub_10002E548();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100095AA4();
        }
        *__error() = v18;
      }
      if (byte_1000EBCF9) {
        BOOL v20 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v20 = 0;
      }
      if (!v20) {
        goto LABEL_24;
      }
      int v11 = *__error();
      CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Pids is ignored when sampling all processes");
      if (v21)
      {
        CFStringRef v22 = v21;
        CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
        if (CStringPtr)
        {
          v24 = (char *)CStringPtr;
          v25 = 0;
        }
        else
        {
          v24 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD3012E27uLL);
          CFStringGetCString(v22, v24, 1024, 0x8000100u);
          v25 = v24;
        }
        if (qword_1000EBD00) {
          v31 = (FILE *)qword_1000EBD00;
        }
        else {
          v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v24);
        if (v25) {
          free(v25);
        }
        CFStringRef v28 = v22;
        goto LABEL_50;
      }
      v29 = sub_10002E548();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_100095A70();
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v8 = *__error();
        int v9 = sub_10002E548();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000959F8();
        }
        *__error() = v8;
      }
      if (byte_1000EBCF9) {
        BOOL v10 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10)
      {
LABEL_24:
        id v4 = 0;
        goto LABEL_52;
      }
      int v11 = *__error();
      uint64_t v12 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Pids is ignored when sampling all processes", v12, *p_targetProcessId);
      if (v13)
      {
        CFStringRef v14 = v13;
        BOOL v15 = CFStringGetCStringPtr(v13, 0x8000100u);
        if (v15)
        {
          BOOL v16 = (char *)v15;
          int v17 = 0;
        }
        else
        {
          BOOL v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD3012E27uLL);
          CFStringGetCString(v14, v16, 1024, 0x8000100u);
          int v17 = v16;
        }
        if (qword_1000EBD00) {
          CFStringRef v27 = (FILE *)qword_1000EBD00;
        }
        else {
          CFStringRef v27 = __stderrp;
        }
        fprintf(v27, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        CFStringRef v28 = v14;
LABEL_50:
        CFRelease(v28);
LABEL_51:
        id v4 = 0;
        *__error() = v11;
        goto LABEL_52;
      }
      v26 = sub_10002E548();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_100095980();
      }
    }
    if (qword_1000EBD00) {
      v30 = (FILE *)qword_1000EBD00;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
LABEL_52:
  if (!self->super.super._hasSampled || self->super.super._isSampling)
  {
    if (self->_samplingMode != v5
      || v4 && (!self->_sampledProcesses || (objc_msgSend(v4, "isSubsetOfSet:") & 1) == 0))
    {
      self->_samplingMode = v5;
      sampledProcesses = self->_sampledProcesses;
      if (v5 == 3)
      {

        self->_sampledProcesses = 0;
      }
      else
      {
        if (!sampledProcesses)
        {
          v33 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
          self->_sampledProcesses = v33;
          if ((self->super.super._targetProcessId & 0x80000000) == 0) {
            [(NSMutableSet *)v33 addObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:")];
          }
        }
        if (v4) {
          [(NSMutableSet *)self->_sampledProcesses unionSet:v4];
        }
      }
      if (self->super.super._isSampling) {
        [(SPStackshotProvider *)self->super.super._sampleProvider sampleProcesses:self->_sampledProcesses onlyMainThreads:self->_samplingMode == 1];
      }
    }
    return;
  }
  int targetProcessId = self->super.super._targetProcessId;
  v34 = &self->super.super._targetProcessId;
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v36 = *__error();
      v37 = sub_10002E548();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1000958A0();
      }
      *__error() = v36;
    }
    if (byte_1000EBCF9) {
      BOOL v38 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v38 = 0;
    }
    if (!v38) {
      return;
    }
    int v39 = *__error();
    v40 = sub_10002E4E8(*v34);
    CFStringRef v41 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Attempted to change sampling target after done sampling", v40, *v34);
    if (v41)
    {
      CFStringRef v42 = v41;
      v43 = CFStringGetCStringPtr(v41, 0x8000100u);
      if (v43)
      {
        v44 = (char *)v43;
        v45 = 0;
      }
      else
      {
        v44 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE9F1A1D6uLL);
        CFStringGetCString(v42, v44, 1024, 0x8000100u);
        v45 = v44;
      }
      if (qword_1000EBD00) {
        v55 = (FILE *)qword_1000EBD00;
      }
      else {
        v55 = __stderrp;
      }
      fprintf(v55, "%s\n", v44);
      if (v45) {
        free(v45);
      }
      CFStringRef v56 = v42;
LABEL_114:
      CFRelease(v56);
LABEL_115:
      *__error() = v39;
      return;
    }
    v54 = sub_10002E548();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      sub_100095828();
    }
    goto LABEL_103;
  }
  if (byte_1000EBCF8)
  {
    int v46 = *__error();
    v47 = sub_10002E548();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_10009594C();
    }
    *__error() = v46;
  }
  if (byte_1000EBCF9) {
    BOOL v48 = dword_1000EB4A8 <= 3;
  }
  else {
    BOOL v48 = 0;
  }
  if (v48)
  {
    int v39 = *__error();
    CFStringRef v49 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Attempted to change sampling target after done sampling");
    if (v49)
    {
      CFStringRef v50 = v49;
      v51 = CFStringGetCStringPtr(v49, 0x8000100u);
      if (v51)
      {
        v52 = (char *)v51;
        v53 = 0;
      }
      else
      {
        v52 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE9F1A1D6uLL);
        CFStringGetCString(v50, v52, 1024, 0x8000100u);
        v53 = v52;
      }
      if (qword_1000EBD00) {
        v59 = (FILE *)qword_1000EBD00;
      }
      else {
        v59 = __stderrp;
      }
      fprintf(v59, "%s\n", v52);
      if (v53) {
        free(v53);
      }
      CFStringRef v56 = v50;
      goto LABEL_114;
    }
    v57 = sub_10002E548();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
      sub_100095918();
    }
LABEL_103:
    if (qword_1000EBD00) {
      v58 = (FILE *)qword_1000EBD00;
    }
    else {
      v58 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v58);
    goto LABEL_115;
  }
}

- (unsigned)samplingIntervalUs
{
  return self->_samplingIntervalUs;
}

- (void)setSamplingIntervalUs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_unsigned int samplingIntervalUs = a3;
    return;
  }
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v5 = *__error();
      char v6 = sub_10002E548();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002E4E8(self->super.super._targetProcessId);
        unsigned int samplingIntervalUs = self->_samplingIntervalUs;
        int targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        int v36 = v32;
        __int16 v37 = 1024;
        int v38 = targetProcessId;
        __int16 v39 = 1024;
        int v40 = v3;
        __int16 v41 = 1024;
        unsigned int v42 = samplingIntervalUs;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
      }
      *__error() = v5;
    }
    if (byte_1000EBCF9) {
      BOOL v7 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v7 = 0;
    }
    if (!v7) {
      return;
    }
    int v8 = *__error();
    int v9 = sub_10002E4E8(self->super.super._targetProcessId);
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus", v9, self->super.super._targetProcessId, v3, self->_samplingIntervalUs);
    if (v10)
    {
      CFStringRef v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        CFStringRef v13 = (char *)CStringPtr;
        CFStringRef v14 = 0;
      }
      else
      {
        CFStringRef v13 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC77751D4uLL);
        CFStringGetCString(v11, v13, 1024, 0x8000100u);
        CFStringRef v14 = v13;
      }
      if (qword_1000EBD00) {
        CFStringRef v27 = (FILE *)qword_1000EBD00;
      }
      else {
        CFStringRef v27 = __stderrp;
      }
      fprintf(v27, "%s\n", v13);
      if (v14) {
        free(v14);
      }
      CFStringRef v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }
    v23 = sub_10002E548();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002E4E8(self->super.super._targetProcessId);
      unsigned int v25 = self->_samplingIntervalUs;
      int v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      int v36 = v24;
      __int16 v37 = 1024;
      int v38 = v26;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      unsigned int v42 = v25;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: Attempted to change sampling interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
    }
    goto LABEL_39;
  }
  if (byte_1000EBCF8)
  {
    int v15 = *__error();
    BOOL v16 = sub_10002E548();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100095B44();
    }
    *__error() = v15;
  }
  if (byte_1000EBCF9) {
    BOOL v17 = dword_1000EB4A8 <= 3;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    int v8 = *__error();
    CFStringRef v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Attempted to change sampling interval to %uus while already sampling/sampled at %uus", v3, self->_samplingIntervalUs);
    if (v18)
    {
      CFStringRef v19 = v18;
      BOOL v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        CFStringRef v21 = (char *)v20;
        CFStringRef v22 = 0;
      }
      else
      {
        CFStringRef v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC77751D4uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        CFStringRef v22 = v21;
      }
      if (qword_1000EBD00) {
        v31 = (FILE *)qword_1000EBD00;
      }
      else {
        v31 = __stderrp;
      }
      fprintf(v31, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      CFStringRef v28 = v19;
      goto LABEL_50;
    }
    v29 = sub_10002E548();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_100095AD8();
    }
LABEL_39:
    if (qword_1000EBD00) {
      v30 = (FILE *)qword_1000EBD00;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
}

- (unsigned)occasionalDataIntervalSec
{
  return self->_occasionalDataIntervalSec;
}

- (void)setOccasionalDataIntervalSec:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!self->super.super._hasSampled)
  {
    self->_unsigned int occasionalDataIntervalSec = a3;
    return;
  }
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v5 = *__error();
      char v6 = sub_10002E548();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10002E4E8(self->super.super._targetProcessId);
        unsigned int occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
        int targetProcessId = self->super.super._targetProcessId;
        *(_DWORD *)buf = 136446978;
        int v36 = v32;
        __int16 v37 = 1024;
        int v38 = targetProcessId;
        __int16 v39 = 1024;
        int v40 = v3;
        __int16 v41 = 1024;
        unsigned int v42 = occasionalDataIntervalSec;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
      }
      *__error() = v5;
    }
    if (byte_1000EBCF9) {
      BOOL v7 = dword_1000EB4A8 <= 3;
    }
    else {
      BOOL v7 = 0;
    }
    if (!v7) {
      return;
    }
    int v8 = *__error();
    int v9 = sub_10002E4E8(self->super.super._targetProcessId);
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", v9, self->super.super._targetProcessId, v3, self->_occasionalDataIntervalSec);
    if (v10)
    {
      CFStringRef v11 = v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (CStringPtr)
      {
        CFStringRef v13 = (char *)CStringPtr;
        CFStringRef v14 = 0;
      }
      else
      {
        CFStringRef v13 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F766282uLL);
        CFStringGetCString(v11, v13, 1024, 0x8000100u);
        CFStringRef v14 = v13;
      }
      if (qword_1000EBD00) {
        CFStringRef v27 = (FILE *)qword_1000EBD00;
      }
      else {
        CFStringRef v27 = __stderrp;
      }
      fprintf(v27, "%s\n", v13);
      if (v14) {
        free(v14);
      }
      CFStringRef v28 = v11;
LABEL_50:
      CFRelease(v28);
LABEL_51:
      *__error() = v8;
      return;
    }
    v23 = sub_10002E548();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = sub_10002E4E8(self->super.super._targetProcessId);
      unsigned int v25 = self->_occasionalDataIntervalSec;
      int v26 = self->super.super._targetProcessId;
      *(_DWORD *)buf = 136315906;
      int v36 = v24;
      __int16 v37 = 1024;
      int v38 = v26;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      unsigned int v42 = v25;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", buf, 0x1Eu);
    }
    goto LABEL_39;
  }
  if (byte_1000EBCF8)
  {
    int v15 = *__error();
    BOOL v16 = sub_10002E548();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100095C24();
    }
    *__error() = v15;
  }
  if (byte_1000EBCF9) {
    BOOL v17 = dword_1000EB4A8 <= 3;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    int v8 = *__error();
    CFStringRef v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Attempted to change occasional data interval to %uus while already sampling/sampled at %uus", v3, self->_occasionalDataIntervalSec);
    if (v18)
    {
      CFStringRef v19 = v18;
      BOOL v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        CFStringRef v21 = (char *)v20;
        CFStringRef v22 = 0;
      }
      else
      {
        CFStringRef v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F766282uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        CFStringRef v22 = v21;
      }
      if (qword_1000EBD00) {
        v31 = (FILE *)qword_1000EBD00;
      }
      else {
        v31 = __stderrp;
      }
      fprintf(v31, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      CFStringRef v28 = v19;
      goto LABEL_50;
    }
    v29 = sub_10002E548();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      sub_100095BB8();
    }
LABEL_39:
    if (qword_1000EBD00) {
      v30 = (FILE *)qword_1000EBD00;
    }
    else {
      v30 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v30);
    goto LABEL_51;
  }
}

- (void)setSamplingTimeoutAtTime:(double)a3
{
  if (self->super.super._timeoutTime <= a3)
  {
    SAMachAbsTimeSecondsGetCurrent();
    double v17 = v16;
    if (v16 < a3) {
      double v18 = a3;
    }
    else {
      double v18 = v16;
    }
    p_int targetProcessId = &self->super.super._targetProcessId;
    int targetProcessId = self->super.super._targetProcessId;
    self->super.super._timeoutTime = v18;
    if (targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v39 = *__error();
        int v40 = sub_10002E548();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v71 = v18 - v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Setting sampling timeout for %.2f seconds from now", buf, 0xCu);
        }
        *__error() = v39;
      }
      if (byte_1000EBCF9) {
        BOOL v41 = dword_1000EB4A8 <= 0;
      }
      else {
        BOOL v41 = 0;
      }
      if (!v41) {
        goto LABEL_103;
      }
      int v24 = *__error();
      CFStringRef v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Setting sampling timeout for %.2f seconds from now", v18 - v17);
      if (v42)
      {
        CFStringRef v43 = v42;
        CStringPtr = CFStringGetCStringPtr(v42, 0x8000100u);
        if (CStringPtr)
        {
          v45 = (char *)CStringPtr;
          int v46 = 0;
        }
        else
        {
          v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF452902CuLL);
          CFStringGetCString(v43, v45, 1024, 0x8000100u);
          int v46 = v45;
        }
        if (qword_1000EBD00) {
          v65 = (FILE *)qword_1000EBD00;
        }
        else {
          v65 = __stderrp;
        }
        fprintf(v65, "%s\n", v45);
        if (v46) {
          free(v46);
        }
        CFStringRef v52 = v43;
        goto LABEL_101;
      }
      v55 = sub_10002E548();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
        sub_100095E8C(v55, v56, v57, v58, v59, v60, v61, v62);
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v21 = *__error();
        CFStringRef v22 = sub_10002E548();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v67 = sub_10002E4E8(*p_targetProcessId);
          int v68 = *p_targetProcessId;
          *(_DWORD *)buf = 136446722;
          double v71 = *(double *)&v67;
          __int16 v72 = 1024;
          int v73 = v68;
          __int16 v74 = 2048;
          double v75 = v18 - v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s [%d]: Setting sampling timeout for %.2f seconds from now", buf, 0x1Cu);
        }
        *__error() = v21;
      }
      if (byte_1000EBCF9) {
        BOOL v23 = dword_1000EB4A8 <= 0;
      }
      else {
        BOOL v23 = 0;
      }
      if (!v23) {
        goto LABEL_103;
      }
      int v24 = *__error();
      unsigned int v25 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Setting sampling timeout for %.2f seconds from now", v25, *p_targetProcessId, v18 - v17);
      if (v26)
      {
        CFStringRef v27 = v26;
        CFStringRef v28 = CFStringGetCStringPtr(v26, 0x8000100u);
        if (v28)
        {
          v29 = (char *)v28;
          v30 = 0;
        }
        else
        {
          v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF452902CuLL);
          CFStringGetCString(v27, v29, 1024, 0x8000100u);
          v30 = v29;
        }
        if (qword_1000EBD00) {
          v51 = (FILE *)qword_1000EBD00;
        }
        else {
          v51 = __stderrp;
        }
        fprintf(v51, "%s\n", v29);
        if (v30) {
          free(v30);
        }
        CFStringRef v52 = v27;
LABEL_101:
        CFRelease(v52);
LABEL_102:
        *__error() = v24;
LABEL_103:
        processingQueue = self->super.super._processingQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100066ECC;
        block[3] = &unk_1000DD148;
        block[4] = self;
        *(double *)&block[5] = v18;
        *(double *)&block[6] = v17;
        dispatch_async(processingQueue, block);
        return;
      }
      BOOL v48 = sub_10002E548();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
        sub_100095DF0(&self->super.super._targetProcessId);
      }
    }
    if (qword_1000EBD00) {
      v63 = (FILE *)qword_1000EBD00;
    }
    else {
      v63 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
    goto LABEL_102;
  }
  int v5 = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v6 = *__error();
      BOOL v7 = sub_10002E548();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100095D10();
      }
      *__error() = v6;
    }
    if (byte_1000EBCF9) {
      BOOL v8 = dword_1000EB4A8 <= 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8) {
      return;
    }
    int v9 = *__error();
    CFStringRef v10 = sub_10002E4E8(*v5);
    CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Asked to stop sooner than the existing timeout", v10, *v5);
    if (v11)
    {
      CFStringRef v12 = v11;
      CFStringRef v13 = CFStringGetCStringPtr(v11, 0x8000100u);
      if (v13)
      {
        CFStringRef v14 = (char *)v13;
        int v15 = 0;
      }
      else
      {
        CFStringRef v14 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x38B5FEC3uLL);
        CFStringGetCString(v12, v14, 1024, 0x8000100u);
        int v15 = v14;
      }
      if (qword_1000EBD00) {
        CFStringRef v49 = (FILE *)qword_1000EBD00;
      }
      else {
        CFStringRef v49 = __stderrp;
      }
      fprintf(v49, "%s\n", v14);
      if (v15) {
        free(v15);
      }
      CFStringRef v50 = v12;
LABEL_92:
      CFRelease(v50);
LABEL_93:
      *__error() = v9;
      return;
    }
    v47 = sub_10002E548();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
      sub_100095C98();
    }
    goto LABEL_75;
  }
  if (byte_1000EBCF8)
  {
    int v31 = *__error();
    v32 = sub_10002E548();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_100095DBC();
    }
    *__error() = v31;
  }
  if (byte_1000EBCF9) {
    BOOL v33 = dword_1000EB4A8 <= 0;
  }
  else {
    BOOL v33 = 0;
  }
  if (v33)
  {
    int v9 = *__error();
    CFStringRef v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Asked to stop sooner than the existing timeout");
    if (v34)
    {
      CFStringRef v35 = v34;
      int v36 = CFStringGetCStringPtr(v34, 0x8000100u);
      if (v36)
      {
        __int16 v37 = (char *)v36;
        int v38 = 0;
      }
      else
      {
        __int16 v37 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x38B5FEC3uLL);
        CFStringGetCString(v35, v37, 1024, 0x8000100u);
        int v38 = v37;
      }
      if (qword_1000EBD00) {
        v64 = (FILE *)qword_1000EBD00;
      }
      else {
        v64 = __stderrp;
      }
      fprintf(v64, "%s\n", v37);
      if (v38) {
        free(v38);
      }
      CFStringRef v50 = v35;
      goto LABEL_92;
    }
    v53 = sub_10002E548();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      sub_100095D88();
    }
LABEL_75:
    if (qword_1000EBD00) {
      v54 = (FILE *)qword_1000EBD00;
    }
    else {
      v54 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v54);
    goto LABEL_93;
  }
}

- (void)setSamplingCompletionHandlerQueue:(id)a3 andBlock:(id)a4
{
  if (!a3 || !a4)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v22 = *__error();
        BOOL v23 = sub_10002E548();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100096484(v23, v24, v25, v26, v27, v28, v29, v30);
        }
        *__error() = v22;
      }
      if (byte_1000EBCF9) {
        BOOL v31 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v31 = 0;
      }
      if (v31)
      {
        int v32 = *__error();
        CFStringRef v33 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Must provide both queue and block", "queue && block");
        if (v33)
        {
          CFStringRef v47 = v33;
          CStringPtr = CFStringGetCStringPtr(v33, 0x8000100u);
          if (CStringPtr)
          {
            CFStringRef v49 = (char *)CStringPtr;
            CFStringRef v50 = 0;
          }
          else
          {
            CFStringRef v49 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1AD4BD14uLL);
            CFStringGetCString(v47, v49, 1024, 0x8000100u);
            CFStringRef v50 = v49;
          }
          if (qword_1000EBD00) {
            uint64_t v57 = (FILE *)qword_1000EBD00;
          }
          else {
            uint64_t v57 = __stderrp;
          }
          fprintf(v57, "%s\n", v49);
          if (v50) {
            free(v50);
          }
          CFRelease(v47);
        }
        else
        {
          CFStringRef v34 = sub_10002E548();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
            sub_10009640C(v34, v35, v36, v37, v38, v39, v40, v41);
          }
          if (qword_1000EBD00) {
            CFStringRef v42 = (FILE *)qword_1000EBD00;
          }
          else {
            CFStringRef v42 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v42);
        }
        *__error() = v32;
      }
      sub_10002E41C("-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]", "SPProcessEvent.m", 1121, "%s: Must provide both queue and block", v4, v5, v6, v7, (char)"queue && block");
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v14 = *__error();
        int v15 = sub_10002E548();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100096388();
        }
        *__error() = v14;
      }
      if (byte_1000EBCF9) {
        BOOL v16 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        int v17 = *__error();
        double v18 = sub_10002E4E8(*p_targetProcessId);
        CFStringRef v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: %s: Must provide both queue and block", v18, *p_targetProcessId, "queue && block");
        if (v19)
        {
          CFStringRef v43 = v19;
          v44 = CFStringGetCStringPtr(v19, 0x8000100u);
          if (v44)
          {
            v45 = (char *)v44;
            int v46 = 0;
          }
          else
          {
            v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1AD4BD14uLL);
            CFStringGetCString(v43, v45, 1024, 0x8000100u);
            int v46 = v45;
          }
          if (qword_1000EBD00) {
            v51 = (FILE *)qword_1000EBD00;
          }
          else {
            v51 = __stderrp;
          }
          fprintf(v51, "%s\n", v45);
          if (v46) {
            free(v46);
          }
          CFRelease(v43);
        }
        else
        {
          BOOL v20 = sub_10002E548();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            sub_100096304();
          }
          if (qword_1000EBD00) {
            int v21 = (FILE *)qword_1000EBD00;
          }
          else {
            int v21 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
        }
        *__error() = v17;
      }
      char v52 = sub_10002E4E8(*p_targetProcessId);
      sub_10002E41C("-[SPSampledProcess setSamplingCompletionHandlerQueue:andBlock:]", "SPProcessEvent.m", 1121, "%s [%d]: %s: Must provide both queue and block", v53, v54, v55, v56, v52);
    }
    abort();
  }
  dispatch_retain((dispatch_object_t)a3);
  CFStringRef v11 = _Block_copy(a4);
  processingQueue = self->super.super._processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067CC4;
  block[3] = &unk_1000DD9E8;
  block[4] = self;
  block[5] = a3;
  block[6] = v11;
  dispatch_async(processingQueue, block);
}

- (void)setStopWhenProcessExits:(BOOL)a3
{
  processingQueue = self->super.super._processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100067D94;
  v4[3] = &unk_1000DD998;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(processingQueue, v4);
}

- (BOOL)startSampling
{
  if (self->super.super._hasSampled || !self->_samplingIntervalUs) {
    return 0;
  }
  [(SPProcessEvent *)self takeTransaction];
  id v4 = +[SPStackshotProvider snapshotWithSamplingIntervalUs:self->_samplingIntervalUs andOccasionalDataIntervalSec:self->_occasionalDataIntervalSec andOnlySampleProcesses:self->_sampledProcesses andOnlySampleMainThreads:self->_samplingMode == 1 andOmitSensitiveStrings:self->super.super._omitSensitiveStrings];
  if (!v4)
  {
    [(SPProcessEvent *)self dropTransaction];
    return 0;
  }
  BOOL v5 = v4;
  self->super.super._numSamplesAvoidedDueToAudioAtStart = [v4 numSamplesAvoidedDueToAudio];
  self->super.super._numSamplesAtStart = [v5 numSamples];
  self->_startedMonitoringTimestamp = (SATimestamp *)[v5 timestamp];
  self->super.super._sampleProvider = (SPStackshotProvider *)[v5 stackshotProvider];
  *(_WORD *)&self->super.super._isSampling = 257;
  return 1;
}

- (void)stopSamplingWithReason:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  if (self->super.super._isSampling)
  {
    processingQueue = self->super.super._processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100068C40;
    block[3] = &unk_1000DD998;
    block[4] = self;
    unsigned __int8 v32 = a3;
    dispatch_async(processingQueue, block);
    return;
  }
  p_int targetProcessId = &self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v7 = *__error();
      BOOL v8 = sub_10002E548();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1000968AC(p_targetProcessId, v3, v8);
      }
      *__error() = v7;
    }
    if (byte_1000EBCF9) {
      BOOL v9 = dword_1000EB4A8 <= 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (!v9) {
      return;
    }
    int v10 = *__error();
    CFStringRef v11 = sub_10002E4E8(*p_targetProcessId);
    CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Already not sampling when stopped with reason %d", v11, *p_targetProcessId, v3);
    if (v12)
    {
      CFStringRef v13 = v12;
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      if (CStringPtr)
      {
        int v15 = (char *)CStringPtr;
        BOOL v16 = 0;
      }
      else
      {
        int v15 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x52B7F0E3uLL);
        CFStringGetCString(v13, v15, 1024, 0x8000100u);
        BOOL v16 = v15;
      }
      if (qword_1000EBD00) {
        uint64_t v26 = (FILE *)qword_1000EBD00;
      }
      else {
        uint64_t v26 = __stderrp;
      }
      fprintf(v26, "%s\n", v15);
      if (v16) {
        free(v16);
      }
      CFStringRef v27 = v13;
LABEL_50:
      CFRelease(v27);
LABEL_51:
      *__error() = v10;
      return;
    }
    uint64_t v25 = sub_10002E548();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100096814(p_targetProcessId);
    }
    goto LABEL_39;
  }
  if (byte_1000EBCF8)
  {
    int v17 = *__error();
    double v18 = sub_10002E548();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000969D8(v3, v18);
    }
    *__error() = v17;
  }
  if (byte_1000EBCF9) {
    BOOL v19 = dword_1000EB4A8 <= 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v10 = *__error();
    CFStringRef v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Already not sampling when stopped with reason %d", v3);
    if (v20)
    {
      CFStringRef v21 = v20;
      int v22 = CFStringGetCStringPtr(v20, 0x8000100u);
      if (v22)
      {
        BOOL v23 = (char *)v22;
        uint64_t v24 = 0;
      }
      else
      {
        BOOL v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x52B7F0E3uLL);
        CFStringGetCString(v21, v23, 1024, 0x8000100u);
        uint64_t v24 = v23;
      }
      if (qword_1000EBD00) {
        uint64_t v30 = (FILE *)qword_1000EBD00;
      }
      else {
        uint64_t v30 = __stderrp;
      }
      fprintf(v30, "%s\n", v23);
      if (v24) {
        free(v24);
      }
      CFStringRef v27 = v21;
      goto LABEL_50;
    }
    uint64_t v28 = sub_10002E548();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_100096960(v3, v28);
    }
LABEL_39:
    if (qword_1000EBD00) {
      uint64_t v29 = (FILE *)qword_1000EBD00;
    }
    else {
      uint64_t v29 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v29);
    goto LABEL_51;
  }
}

- (void)_samplingHasCompletedWithEndSnapshot:(id)a3 withReason:(unsigned __int8)a4
{
  int v4 = a4;
  if (!self->super.super._isUrgent) {
    [(SPStackshotProvider *)self->super.super._sampleProvider waitForSamplingToComplete];
  }
  unsigned int v7 = v4 - 6;
  if (!a3 || v7 < 0xFFFFFFFC || !self->_hidEventSem)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v29 = *__error();
        uint64_t v30 = sub_10002E548();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_100096B78();
        }
        *__error() = v29;
      }
      if (byte_1000EBCF9) {
        BOOL v31 = dword_1000EB4A8 <= 0;
      }
      else {
        BOOL v31 = 0;
      }
      if (!v31)
      {
LABEL_87:
        if (v7 <= 0xFFFFFFFB) {
          goto LABEL_209;
        }
LABEL_88:
        sampleProvider = self->super.super._sampleProvider;
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472;
        v124[2] = sub_10006A274;
        v124[3] = &unk_1000DDA60;
        char v125 = v4;
        v124[4] = self;
        v124[5] = a3;
        [(SPStackshotProvider *)sampleProvider performSampleStoreWork:v124];
        return;
      }
      int v22 = *__error();
      CFStringRef v32 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"No HID event required");
      if (v32)
      {
        CFStringRef v33 = v32;
        CStringPtr = CFStringGetCStringPtr(v32, 0x8000100u);
        if (CStringPtr)
        {
          uint64_t v35 = (char *)CStringPtr;
          uint64_t v36 = 0;
        }
        else
        {
          uint64_t v35 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF7045B2EuLL);
          CFStringGetCString(v33, v35, 1024, 0x8000100u);
          uint64_t v36 = v35;
        }
        if (qword_1000EBD00) {
          CFStringRef v50 = (FILE *)qword_1000EBD00;
        }
        else {
          CFStringRef v50 = __stderrp;
        }
        fprintf(v50, "%s\n", v35);
        if (v36) {
          free(v36);
        }
        CFStringRef v46 = v33;
        goto LABEL_85;
      }
      CFStringRef v47 = sub_10002E548();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        sub_100096B44();
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v19 = *__error();
        CFStringRef v20 = sub_10002E548();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_100096ACC();
        }
        *__error() = v19;
      }
      if (byte_1000EBCF9) {
        BOOL v21 = dword_1000EB4A8 <= 0;
      }
      else {
        BOOL v21 = 0;
      }
      if (!v21) {
        goto LABEL_87;
      }
      int v22 = *__error();
      BOOL v23 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: No HID event required", v23, *p_targetProcessId);
      if (v24)
      {
        CFStringRef v25 = v24;
        uint64_t v26 = CFStringGetCStringPtr(v24, 0x8000100u);
        if (v26)
        {
          CFStringRef v27 = (char *)v26;
          uint64_t v28 = 0;
        }
        else
        {
          CFStringRef v27 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF7045B2EuLL);
          CFStringGetCString(v25, v27, 1024, 0x8000100u);
          uint64_t v28 = v27;
        }
        if (qword_1000EBD00) {
          v45 = (FILE *)qword_1000EBD00;
        }
        else {
          v45 = __stderrp;
        }
        fprintf(v45, "%s\n", v27);
        if (v28) {
          free(v28);
        }
        CFStringRef v46 = v25;
LABEL_85:
        CFRelease(v46);
LABEL_86:
        *__error() = v22;
        goto LABEL_87;
      }
      v44 = sub_10002E548();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        sub_100096A54();
      }
    }
    if (qword_1000EBD00) {
      BOOL v48 = (FILE *)qword_1000EBD00;
    }
    else {
      BOOL v48 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
    goto LABEL_86;
  }
  BOOL v8 = (unsigned int *)&self->super.super._targetProcessId;
  if ((self->super.super._targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v9 = *__error();
      int v10 = sub_10002E548();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        CFStringRef v11 = sub_10002E4E8(*v8);
        int v12 = *v8;
        *(_DWORD *)buf = 136446466;
        v130 = v11;
        __int16 v131 = 1024;
        int v132 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for HID event...", buf, 0x12u);
      }
      *__error() = v9;
    }
    if (byte_1000EBCF9) {
      BOOL v13 = dword_1000EB4A8 <= 1;
    }
    else {
      BOOL v13 = 0;
    }
    if (!v13) {
      goto LABEL_96;
    }
    int v14 = *__error();
    int v15 = sub_10002E4E8(*v8);
    CFStringRef v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Waiting for HID event...", v15, *v8);
    if (!v16)
    {
      int v17 = sub_10002E548();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100096F08();
      }
LABEL_91:
      if (qword_1000EBD00) {
        uint64_t v53 = (FILE *)qword_1000EBD00;
      }
      else {
        uint64_t v53 = __stderrp;
      }
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v53);
LABEL_95:
      *__error() = v14;
      goto LABEL_96;
    }
    goto LABEL_54;
  }
  if (byte_1000EBCF8)
  {
    int v37 = *__error();
    uint64_t v38 = sub_10002E548();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Waiting for HID event...", buf, 2u);
    }
    *__error() = v37;
  }
  if (byte_1000EBCF9) {
    BOOL v39 = dword_1000EB4A8 <= 1;
  }
  else {
    BOOL v39 = 0;
  }
  if (v39)
  {
    int v14 = *__error();
    CFStringRef v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Waiting for HID event...");
    if (!v16)
    {
      char v52 = sub_10002E548();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        sub_100096F80();
      }
      goto LABEL_91;
    }
LABEL_54:
    CFStringRef v40 = v16;
    uint64_t v41 = CFStringGetCStringPtr(v16, 0x8000100u);
    if (v41)
    {
      CFStringRef v42 = (char *)v41;
      CFStringRef v43 = 0;
    }
    else
    {
      CFStringRef v42 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x984730BCuLL);
      CFStringGetCString(v40, v42, 1024, 0x8000100u);
      CFStringRef v43 = v42;
    }
    if (qword_1000EBD00) {
      CFStringRef v49 = (FILE *)qword_1000EBD00;
    }
    else {
      CFStringRef v49 = __stderrp;
    }
    fprintf(v49, "%s\n", v42);
    if (v43) {
      free(v43);
    }
    CFRelease(v40);
    goto LABEL_95;
  }
LABEL_96:
  hidEventSem = self->_hidEventSem;
  dispatch_time_t v55 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(hidEventSem, v55))
  {
    if ([(SPProcessEvent *)self eventTimeRange])
    {
      if (objc_msgSend(-[SATimeRange startTime](-[SPProcessEvent eventTimeRange](self, "eventTimeRange"), "startTime"), "compare:", objc_msgSend(a3, "timestamp")) == (id)-1&& objc_msgSend(-[SATimeRange endTime](-[SPProcessEvent eventTimeRange](self, "eventTimeRange"), "endTime"), "compare:", self->_startedMonitoringTimestamp) == (id)1)
      {
        if ((*v8 & 0x80000000) != 0)
        {
          if (byte_1000EBCF8)
          {
            int v106 = *__error();
            v107 = sub_10002E548();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
              sub_100096D7C();
            }
            *__error() = v106;
          }
          if (!byte_1000EBCF9 || dword_1000EB4A8 > 0) {
            goto LABEL_237;
          }
          int v66 = *__error();
          CFStringRef v108 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Received HID event, reporting spin");
          if (v108)
          {
            CFStringRef v109 = v108;
            v110 = CFStringGetCStringPtr(v108, 0x8000100u);
            if (v110)
            {
              v111 = (char *)v110;
              v112 = 0;
            }
            else
            {
              v111 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9F24426AuLL);
              CFStringGetCString(v109, v111, 1024, 0x8000100u);
              v112 = v111;
            }
            if (qword_1000EBD00) {
              v123 = (FILE *)qword_1000EBD00;
            }
            else {
              v123 = __stderrp;
            }
            fprintf(v123, "%s\n", v111);
            if (v112) {
              free(v112);
            }
            CFStringRef v120 = v109;
            goto LABEL_235;
          }
          v121 = sub_10002E548();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT)) {
            sub_100096D48();
          }
        }
        else
        {
          if (byte_1000EBCF8)
          {
            int v64 = *__error();
            v65 = sub_10002E548();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
              sub_100096CD0();
            }
            *__error() = v64;
          }
          if (!byte_1000EBCF9 || dword_1000EB4A8 > 0) {
            goto LABEL_237;
          }
          int v66 = *__error();
          v67 = sub_10002E4E8(*v8);
          CFStringRef v68 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Received HID event, reporting spin", v67, *v8);
          if (v68)
          {
            CFStringRef v69 = v68;
            v70 = CFStringGetCStringPtr(v68, 0x8000100u);
            if (v70)
            {
              double v71 = (char *)v70;
              __int16 v72 = 0;
            }
            else
            {
              double v71 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9F24426AuLL);
              CFStringGetCString(v69, v71, 1024, 0x8000100u);
              __int16 v72 = v71;
            }
            if (qword_1000EBD00) {
              v119 = (FILE *)qword_1000EBD00;
            }
            else {
              v119 = __stderrp;
            }
            fprintf(v119, "%s\n", v71);
            if (v72) {
              free(v72);
            }
            CFStringRef v120 = v69;
LABEL_235:
            CFRelease(v120);
LABEL_236:
            *__error() = v66;
LABEL_237:
            if (v4 == 3) {
              LOBYTE(v4) = 4;
            }
            goto LABEL_88;
          }
          v118 = sub_10002E548();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT)) {
            sub_100096C58();
          }
        }
        if (qword_1000EBD00) {
          v122 = (FILE *)qword_1000EBD00;
        }
        else {
          v122 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v122);
        goto LABEL_236;
      }
      if ((*v8 & 0x80000000) != 0)
      {
        if (byte_1000EBCF8)
        {
          int v95 = *__error();
          v96 = sub_10002E548();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Canceling spin with no HID event in its time range", buf, 2u);
          }
          *__error() = v95;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
          goto LABEL_209;
        }
        int v83 = *__error();
        CFStringRef v85 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Canceling spin with no HID event in its time range");
        if (!v85)
        {
          v114 = sub_10002E548();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT)) {
            sub_100096E28();
          }
          goto LABEL_203;
        }
      }
      else
      {
        if (byte_1000EBCF8)
        {
          int v79 = *__error();
          v80 = sub_10002E548();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = sub_10002E4E8(*v8);
            int v82 = *v8;
            *(_DWORD *)buf = 136446466;
            v130 = v81;
            __int16 v131 = 1024;
            int v132 = v82;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Canceling spin with no HID event in its time range", buf, 0x12u);
          }
          *__error() = v79;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
          goto LABEL_209;
        }
        int v83 = *__error();
        v84 = sub_10002E4E8(*v8);
        CFStringRef v85 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Canceling spin with no HID event in its time range", v84, *v8);
        if (!v85)
        {
          v86 = sub_10002E548();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT)) {
            sub_100096DB0();
          }
LABEL_203:
          if (qword_1000EBD00) {
            v116 = (FILE *)qword_1000EBD00;
          }
          else {
            v116 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v116);
LABEL_207:
          *__error() = v83;
          goto LABEL_208;
        }
      }
      CFStringRef v97 = v85;
      v98 = CFStringGetCStringPtr(v85, 0x8000100u);
      if (!v98)
      {
        malloc_type_id_t v99 = 1922378494;
LABEL_192:
        v102 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v99);
        CFStringGetCString(v97, v102, 1024, 0x8000100u);
        v103 = v102;
        goto LABEL_193;
      }
    }
    else
    {
      if ((*v8 & 0x80000000) != 0)
      {
        if (byte_1000EBCF8)
        {
          int v100 = *__error();
          v101 = sub_10002E548();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Canceling spin with no HID event where process exited", buf, 2u);
          }
          *__error() = v100;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
          goto LABEL_209;
        }
        int v83 = *__error();
        CFStringRef v92 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Canceling spin with no HID event where process exited");
        if (!v92)
        {
          v115 = sub_10002E548();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_FAULT)) {
            sub_100096C24();
          }
          goto LABEL_203;
        }
      }
      else
      {
        if (byte_1000EBCF8)
        {
          int v87 = *__error();
          v88 = sub_10002E548();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = sub_10002E4E8(*v8);
            int v90 = *v8;
            *(_DWORD *)buf = 136446466;
            v130 = v89;
            __int16 v131 = 1024;
            int v132 = v90;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Canceling spin with no HID event where process exited", buf, 0x12u);
          }
          *__error() = v87;
        }
        LOBYTE(v4) = 8;
        if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
          goto LABEL_209;
        }
        int v83 = *__error();
        v91 = sub_10002E4E8(*v8);
        CFStringRef v92 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Canceling spin with no HID event where process exited", v91, *v8);
        if (!v92)
        {
          v93 = sub_10002E548();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT)) {
            sub_100096BAC();
          }
          goto LABEL_203;
        }
      }
      CFStringRef v97 = v92;
      v98 = CFStringGetCStringPtr(v92, 0x8000100u);
      if (!v98)
      {
        malloc_type_id_t v99 = 1974474667;
        goto LABEL_192;
      }
    }
    v102 = (char *)v98;
    v103 = 0;
LABEL_193:
    if (qword_1000EBD00) {
      v113 = (FILE *)qword_1000EBD00;
    }
    else {
      v113 = __stderrp;
    }
    fprintf(v113, "%s\n", v102);
    if (v103) {
      free(v103);
    }
    CFRelease(v97);
    goto LABEL_207;
  }
  if ((*v8 & 0x80000000) != 0)
  {
    if (byte_1000EBCF8)
    {
      int v73 = *__error();
      __int16 v74 = sub_10002E548();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Timed out waiting for HID event, canceling spin", buf, 2u);
      }
      *__error() = v73;
    }
    if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
      goto LABEL_181;
    }
    int v60 = *__error();
    CFStringRef v62 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Timed out waiting for HID event, canceling spin");
    if (!v62)
    {
      v104 = sub_10002E548();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT)) {
        sub_100096ED4();
      }
      goto LABEL_176;
    }
LABEL_127:
    CFStringRef v75 = v62;
    v76 = CFStringGetCStringPtr(v62, 0x8000100u);
    if (v76)
    {
      v77 = (char *)v76;
      v78 = 0;
    }
    else
    {
      v77 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x18BF36B5uLL);
      CFStringGetCString(v75, v77, 1024, 0x8000100u);
      v78 = v77;
    }
    if (qword_1000EBD00) {
      v94 = (FILE *)qword_1000EBD00;
    }
    else {
      v94 = __stderrp;
    }
    fprintf(v94, "%s\n", v77);
    if (v78) {
      free(v78);
    }
    CFRelease(v75);
    goto LABEL_180;
  }
  if (byte_1000EBCF8)
  {
    int v56 = *__error();
    uint64_t v57 = sub_10002E548();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = sub_10002E4E8(*v8);
      int v59 = *v8;
      *(_DWORD *)buf = 136446466;
      v130 = v58;
      __int16 v131 = 1024;
      int v132 = v59;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%{public}s [%d]: Timed out waiting for HID event, canceling spin", buf, 0x12u);
    }
    *__error() = v56;
  }
  if (!byte_1000EBCF9 || dword_1000EB4A8 > 2) {
    goto LABEL_181;
  }
  int v60 = *__error();
  uint64_t v61 = sub_10002E4E8(*v8);
  CFStringRef v62 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Timed out waiting for HID event, canceling spin", v61, *v8);
  if (v62) {
    goto LABEL_127;
  }
  v63 = sub_10002E548();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
    sub_100096E5C();
  }
LABEL_176:
  if (qword_1000EBD00) {
    v105 = (FILE *)qword_1000EBD00;
  }
  else {
    v105 = __stderrp;
  }
  fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v105);
LABEL_180:
  *__error() = v60;
LABEL_181:
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_100069F3C;
  v128[3] = &unk_1000DD948;
  v128[4] = self;
  sub_100062C50((uint64_t)v128);
LABEL_208:
  LOBYTE(v4) = 8;
LABEL_209:
  completionCallbackQueue = self->super.super._completionCallbackQueue;
  if (completionCallbackQueue)
  {
    if (self->super.super._completionCallbackBlock)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006A228;
      block[3] = &unk_1000DD998;
      block[4] = self;
      char v127 = v4;
      dispatch_async(completionCallbackQueue, block);
      dispatch_release((dispatch_object_t)self->super.super._completionCallbackQueue);
      self->super.super._completionCallbackQueue = 0;
    }
  }
}

- (void)_saveReportToStream:(__sFILE *)a3
{
  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v44 = *__error();
        v45 = sub_10002E548();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100097320();
        }
        *__error() = v44;
      }
      if (byte_1000EBCF9) {
        BOOL v46 = dword_1000EB4A8 < 4;
      }
      else {
        BOOL v46 = 0;
      }
      if (v46)
      {
        BOOL v57 = a3 != 0;
        int v58 = *__error();
        CFStringRef v59 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: save report fail %d %d %d", "stream && !_isSampling && _hasSampled", a3 != 0, self->super.super._isSampling, self->super.super._hasSampled);
        if (v59)
        {
          CFStringRef v68 = v59;
          int v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            double v71 = 0;
          }
          else
          {
            v70 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5BECA00EuLL);
            CFStringGetCString(v68, v70, 1024, 0x8000100u);
            double v71 = v70;
          }
          if (qword_1000EBD00) {
            v78 = (FILE *)qword_1000EBD00;
          }
          else {
            v78 = __stderrp;
          }
          fprintf(v78, "%s\n", v70);
          if (v71) {
            free(v71);
          }
          CFRelease(v68);
          int v58 = v79;
        }
        else
        {
          int v60 = sub_10002E548();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            BOOL isSampling = self->super.super._isSampling;
            BOOL hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            int v82 = "stream && !_isSampling && _hasSampled";
            __int16 v83 = 1024;
            int v84 = v57;
            __int16 v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_FAULT, "Unable to format: %s: save report fail %d %d %d", buf, 0x1Eu);
          }
          if (qword_1000EBD00) {
            v63 = (FILE *)qword_1000EBD00;
          }
          else {
            v63 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }
        *__error() = v58;
      }
      sub_10002E41C("-[SPSampledProcess _saveReportToStream:]", "SPProcessEvent.m", 1417, "%s: save report fail %d %d %d", v3, v4, v5, v6, (char)"stream && !_isSampling && _hasSampled");
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v37 = *__error();
        uint64_t v38 = sub_10002E548();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          BOOL v39 = (const char *)sub_10002E4E8(self->super.super._targetProcessId);
          int targetProcessId = self->super.super._targetProcessId;
          BOOL v41 = self->super.super._isSampling;
          BOOL v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          int v82 = v39;
          __int16 v83 = 1024;
          int v84 = targetProcessId;
          __int16 v85 = 2080;
          *(void *)v86 = "stream && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          BOOL v87 = a3 != 0;
          __int16 v88 = 1024;
          BOOL v89 = v41;
          __int16 v90 = 1024;
          BOOL v91 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
        }
        *__error() = v37;
      }
      if (byte_1000EBCF9) {
        BOOL v43 = dword_1000EB4A8 < 4;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43)
      {
        BOOL v47 = a3 != 0;
        int v48 = *__error();
        CFStringRef v49 = sub_10002E4E8(self->super.super._targetProcessId);
        CFStringRef v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: %s: save report fail %d %d %d", v49, self->super.super._targetProcessId, "stream && !_isSampling && _hasSampled", v47, self->super.super._isSampling, self->super.super._hasSampled);
        if (v50)
        {
          CFStringRef v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            int v66 = (char *)v65;
            v67 = 0;
          }
          else
          {
            int v66 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5BECA00EuLL);
            CFStringGetCString(v64, v66, 1024, 0x8000100u);
            v67 = v66;
          }
          if (qword_1000EBD00) {
            __int16 v72 = (FILE *)qword_1000EBD00;
          }
          else {
            __int16 v72 = __stderrp;
          }
          fprintf(v72, "%s\n", v66);
          if (v67) {
            free(v67);
          }
          CFRelease(v64);
        }
        else
        {
          v51 = sub_10002E548();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            char v52 = (const char *)sub_10002E4E8(self->super.super._targetProcessId);
            int v53 = self->super.super._targetProcessId;
            BOOL v54 = self->super.super._isSampling;
            BOOL v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            int v82 = v52;
            __int16 v83 = 1024;
            int v84 = v53;
            __int16 v85 = 2080;
            *(void *)v86 = "stream && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            BOOL v87 = v47;
            __int16 v88 = 1024;
            BOOL v89 = v54;
            __int16 v90 = 1024;
            BOOL v91 = v55;
            _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
          }
          if (qword_1000EBD00) {
            int v56 = (FILE *)qword_1000EBD00;
          }
          else {
            int v56 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }
        *__error() = v48;
      }
      char v73 = sub_10002E4E8(self->super.super._targetProcessId);
      sub_10002E41C("-[SPSampledProcess _saveReportToStream:]", "SPProcessEvent.m", 1417, "%s [%d]: %s: save report fail %d %d %d", v74, v75, v76, v77, v73);
    }
    abort();
  }
  if (!self->super.super._isUrgent)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v22 = *__error();
        BOOL v23 = sub_10002E548();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }
        *__error() = v22;
      }
      if (byte_1000EBCF9) {
        BOOL v24 = dword_1000EB4A8 <= 1;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        goto LABEL_54;
      }
      int v15 = *__error();
      CFStringRef v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Waiting for sampling to complete");
      if (v25)
      {
        CFStringRef v26 = v25;
        CFStringRef v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          uint64_t v28 = (char *)v27;
          int v29 = 0;
        }
        else
        {
          uint64_t v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8D9ED53DuLL);
          CFStringGetCString(v26, v28, 1024, 0x8000100u);
          int v29 = v28;
        }
        if (qword_1000EBD00) {
          uint64_t v35 = (FILE *)qword_1000EBD00;
        }
        else {
          uint64_t v35 = __stderrp;
        }
        fprintf(v35, "%s\n", v28);
        if (v29) {
          free(v29);
        }
        CFStringRef v32 = v26;
        goto LABEL_52;
      }
      CFStringRef v33 = sub_10002E548();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_10009740C();
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v10 = *__error();
        CFStringRef v11 = sub_10002E548();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = (const char *)sub_10002E4E8(*p_targetProcessId);
          int v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          int v82 = v12;
          __int16 v83 = 1024;
          int v84 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for sampling to complete", buf, 0x12u);
        }
        *__error() = v10;
      }
      if (byte_1000EBCF9) {
        BOOL v14 = dword_1000EB4A8 <= 1;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14) {
        goto LABEL_54;
      }
      int v15 = *__error();
      CFStringRef v16 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Waiting for sampling to complete", v16, *p_targetProcessId);
      if (v17)
      {
        CFStringRef v18 = v17;
        int v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          CFStringRef v20 = (char *)v19;
          BOOL v21 = 0;
        }
        else
        {
          CFStringRef v20 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8D9ED53DuLL);
          CFStringGetCString(v18, v20, 1024, 0x8000100u);
          BOOL v21 = v20;
        }
        if (qword_1000EBD00) {
          BOOL v31 = (FILE *)qword_1000EBD00;
        }
        else {
          BOOL v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v20);
        if (v21) {
          free(v21);
        }
        CFStringRef v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        [(SPStackshotProvider *)self->super.super._sampleProvider waitForSamplingToComplete];
        goto LABEL_55;
      }
      uint64_t v30 = sub_10002E548();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100097394();
      }
    }
    if (qword_1000EBD00) {
      CFStringRef v34 = (FILE *)qword_1000EBD00;
    }
    else {
      CFStringRef v34 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }
LABEL_55:
  sampleProvider = self->super.super._sampleProvider;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10006B484;
  v80[3] = &unk_1000DDA88;
  v80[4] = self;
  v80[5] = a3;
  [(SPStackshotProvider *)sampleProvider performSampleStoreWork:v80];
}

- (void)_performSamplePrinterWork:(id)a3
{
  if (!a3 || self->super.super._isSampling || !self->super.super._hasSampled)
  {
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v44 = *__error();
        v45 = sub_10002E548();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100097440();
        }
        *__error() = v44;
      }
      if (byte_1000EBCF9) {
        BOOL v46 = dword_1000EB4A8 < 4;
      }
      else {
        BOOL v46 = 0;
      }
      if (v46)
      {
        BOOL v57 = a3 != 0;
        int v58 = *__error();
        CFStringRef v59 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: save report fail %d %d %d", "callback && !_isSampling && _hasSampled", a3 != 0, self->super.super._isSampling, self->super.super._hasSampled);
        if (v59)
        {
          CFStringRef v68 = v59;
          int v79 = v58;
          CStringPtr = CFStringGetCStringPtr(v59, 0x8000100u);
          if (CStringPtr)
          {
            v70 = (char *)CStringPtr;
            double v71 = 0;
          }
          else
          {
            v70 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5B63B3CCuLL);
            CFStringGetCString(v68, v70, 1024, 0x8000100u);
            double v71 = v70;
          }
          if (qword_1000EBD00) {
            v78 = (FILE *)qword_1000EBD00;
          }
          else {
            v78 = __stderrp;
          }
          fprintf(v78, "%s\n", v70);
          if (v71) {
            free(v71);
          }
          CFRelease(v68);
          int v58 = v79;
        }
        else
        {
          int v60 = sub_10002E548();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          {
            BOOL isSampling = self->super.super._isSampling;
            BOOL hasSampled = self->super.super._hasSampled;
            *(_DWORD *)buf = 136315906;
            int v82 = "callback && !_isSampling && _hasSampled";
            __int16 v83 = 1024;
            int v84 = v57;
            __int16 v85 = 1024;
            *(_DWORD *)v86 = isSampling;
            *(_WORD *)&v86[4] = 1024;
            *(_DWORD *)&v86[6] = hasSampled;
            _os_log_fault_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_FAULT, "Unable to format: %s: save report fail %d %d %d", buf, 0x1Eu);
          }
          if (qword_1000EBD00) {
            v63 = (FILE *)qword_1000EBD00;
          }
          else {
            v63 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v63);
        }
        *__error() = v58;
      }
      sub_10002E41C("-[SPSampledProcess _performSamplePrinterWork:]", "SPProcessEvent.m", 1433, "%s: save report fail %d %d %d", v3, v4, v5, v6, (char)"callback && !_isSampling && _hasSampled");
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v37 = *__error();
        uint64_t v38 = sub_10002E548();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          BOOL v39 = (const char *)sub_10002E4E8(self->super.super._targetProcessId);
          int targetProcessId = self->super.super._targetProcessId;
          BOOL v41 = self->super.super._isSampling;
          BOOL v42 = self->super.super._hasSampled;
          *(_DWORD *)buf = 136316418;
          int v82 = v39;
          __int16 v83 = 1024;
          int v84 = targetProcessId;
          __int16 v85 = 2080;
          *(void *)v86 = "callback && !_isSampling && _hasSampled";
          *(_WORD *)&v86[8] = 1024;
          BOOL v87 = a3 != 0;
          __int16 v88 = 1024;
          BOOL v89 = v41;
          __int16 v90 = 1024;
          BOOL v91 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
        }
        *__error() = v37;
      }
      if (byte_1000EBCF9) {
        BOOL v43 = dword_1000EB4A8 < 4;
      }
      else {
        BOOL v43 = 0;
      }
      if (v43)
      {
        BOOL v47 = a3 != 0;
        int v48 = *__error();
        CFStringRef v49 = sub_10002E4E8(self->super.super._targetProcessId);
        CFStringRef v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: %s: save report fail %d %d %d", v49, self->super.super._targetProcessId, "callback && !_isSampling && _hasSampled", v47, self->super.super._isSampling, self->super.super._hasSampled);
        if (v50)
        {
          CFStringRef v64 = v50;
          v65 = CFStringGetCStringPtr(v50, 0x8000100u);
          if (v65)
          {
            int v66 = (char *)v65;
            v67 = 0;
          }
          else
          {
            int v66 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5B63B3CCuLL);
            CFStringGetCString(v64, v66, 1024, 0x8000100u);
            v67 = v66;
          }
          if (qword_1000EBD00) {
            __int16 v72 = (FILE *)qword_1000EBD00;
          }
          else {
            __int16 v72 = __stderrp;
          }
          fprintf(v72, "%s\n", v66);
          if (v67) {
            free(v67);
          }
          CFRelease(v64);
        }
        else
        {
          v51 = sub_10002E548();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            char v52 = (const char *)sub_10002E4E8(self->super.super._targetProcessId);
            int v53 = self->super.super._targetProcessId;
            BOOL v54 = self->super.super._isSampling;
            BOOL v55 = self->super.super._hasSampled;
            *(_DWORD *)buf = 136316418;
            int v82 = v52;
            __int16 v83 = 1024;
            int v84 = v53;
            __int16 v85 = 2080;
            *(void *)v86 = "callback && !_isSampling && _hasSampled";
            *(_WORD *)&v86[8] = 1024;
            BOOL v87 = v47;
            __int16 v88 = 1024;
            BOOL v89 = v54;
            __int16 v90 = 1024;
            BOOL v91 = v55;
            _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Unable to format: %s [%d]: %s: save report fail %d %d %d", buf, 0x2Eu);
          }
          if (qword_1000EBD00) {
            int v56 = (FILE *)qword_1000EBD00;
          }
          else {
            int v56 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v56);
        }
        *__error() = v48;
      }
      char v73 = sub_10002E4E8(self->super.super._targetProcessId);
      sub_10002E41C("-[SPSampledProcess _performSamplePrinterWork:]", "SPProcessEvent.m", 1433, "%s [%d]: %s: save report fail %d %d %d", v74, v75, v76, v77, v73);
    }
    abort();
  }
  if (!self->super.super._isUrgent)
  {
    p_int targetProcessId = &self->super.super._targetProcessId;
    if (self->super.super._targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v22 = *__error();
        BOOL v23 = sub_10002E548();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Waiting for sampling to complete", buf, 2u);
        }
        *__error() = v22;
      }
      if (byte_1000EBCF9) {
        BOOL v24 = dword_1000EB4A8 <= 1;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        goto LABEL_54;
      }
      int v15 = *__error();
      CFStringRef v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Waiting for sampling to complete");
      if (v25)
      {
        CFStringRef v26 = v25;
        CFStringRef v27 = CFStringGetCStringPtr(v25, 0x8000100u);
        if (v27)
        {
          uint64_t v28 = (char *)v27;
          int v29 = 0;
        }
        else
        {
          uint64_t v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5FD08EACuLL);
          CFStringGetCString(v26, v28, 1024, 0x8000100u);
          int v29 = v28;
        }
        if (qword_1000EBD00) {
          uint64_t v35 = (FILE *)qword_1000EBD00;
        }
        else {
          uint64_t v35 = __stderrp;
        }
        fprintf(v35, "%s\n", v28);
        if (v29) {
          free(v29);
        }
        CFStringRef v32 = v26;
        goto LABEL_52;
      }
      CFStringRef v33 = sub_10002E548();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_10009740C();
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v10 = *__error();
        CFStringRef v11 = sub_10002E548();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = (const char *)sub_10002E4E8(*p_targetProcessId);
          int v13 = *p_targetProcessId;
          *(_DWORD *)buf = 136446466;
          int v82 = v12;
          __int16 v83 = 1024;
          int v84 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s [%d]: Waiting for sampling to complete", buf, 0x12u);
        }
        *__error() = v10;
      }
      if (byte_1000EBCF9) {
        BOOL v14 = dword_1000EB4A8 <= 1;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14) {
        goto LABEL_54;
      }
      int v15 = *__error();
      CFStringRef v16 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Waiting for sampling to complete", v16, *p_targetProcessId);
      if (v17)
      {
        CFStringRef v18 = v17;
        int v19 = CFStringGetCStringPtr(v17, 0x8000100u);
        if (v19)
        {
          CFStringRef v20 = (char *)v19;
          BOOL v21 = 0;
        }
        else
        {
          CFStringRef v20 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5FD08EACuLL);
          CFStringGetCString(v18, v20, 1024, 0x8000100u);
          BOOL v21 = v20;
        }
        if (qword_1000EBD00) {
          BOOL v31 = (FILE *)qword_1000EBD00;
        }
        else {
          BOOL v31 = __stderrp;
        }
        fprintf(v31, "%s\n", v20);
        if (v21) {
          free(v21);
        }
        CFStringRef v32 = v18;
LABEL_52:
        CFRelease(v32);
LABEL_53:
        *__error() = v15;
LABEL_54:
        [(SPStackshotProvider *)self->super.super._sampleProvider waitForSamplingToComplete];
        goto LABEL_55;
      }
      uint64_t v30 = sub_10002E548();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100097394();
      }
    }
    if (qword_1000EBD00) {
      CFStringRef v34 = (FILE *)qword_1000EBD00;
    }
    else {
      CFStringRef v34 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
    goto LABEL_53;
  }
LABEL_55:
  sampleProvider = self->super.super._sampleProvider;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10006BE40;
  v80[3] = &unk_1000DDAB0;
  v80[4] = self;
  v80[5] = a3;
  [(SPStackshotProvider *)sampleProvider performSampleStoreWork:v80];
}

- (unsigned)samplingMode
{
  return self->_samplingMode;
}

@end