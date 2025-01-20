@interface SPStackshotProvider
+ (id)sharedInstanceLock;
+ (id)snapshotWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7;
- (BOOL)startWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7;
- (SPStackshotProvider)init;
- (int)numSamples;
- (int)numSamplesAvoidedDueToAudio;
- (void)dealloc;
- (void)gatherLoadInfoForPid:(int)a3;
- (void)performSampleStoreWork:(id)a3;
- (void)sampleProcesses:(id)a3 onlyMainThreads:(BOOL)a4;
- (void)startSamplingThread;
- (void)stopAndWaitForAllSamplingToComplete:(BOOL)a3 withCompletionCallbackOnQueue:(id)a4 withBlock:(id)a5;
- (void)stopSamplingThread;
- (void)waitForSamplingToComplete;
@end

@implementation SPStackshotProvider

- (SPStackshotProvider)init
{
  v32.receiver = self;
  v32.super_class = (Class)SPStackshotProvider;
  v2 = [(SPStackshotProvider *)&v32 init];
  v3 = v2;
  if (v2)
  {
    v2->_numClientsSampling = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v3->_storeReportingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.sample_store", v5);
    dispatch_release(v5);
    v6 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v3->_stackshotParsingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spindump.stackshot_parsing", v6);
    v3->_pidsToGatherLoadInfo = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dispatch_release(v6);
    dispatch_release(v4);
    v3->_samplingGroup = (OS_dispatch_group *)dispatch_group_create();
    v3->_pidsSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v7 = (SASampleStore *)[objc_alloc((Class)SASampleStore) initForLiveSampling];
    v3->_sampleStore = v7;
    sub_100059EA8(v7, (byte_1000EFD4C >> 3) & 1, (byte_1000EFD4C >> 2) & 1, (byte_1000EFD4C & 0x10) == 0);
    if ((byte_1000EFD4C & 2) != 0 && sub_100025844())
    {
      if (byte_1000EFD38)
      {
        int v8 = *__error();
        v9 = sub_10002FC70();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Avoiding inspecting live processes for stackshot report due to audio running", buf, 2u);
        }
        *__error() = v8;
      }
      if (byte_1000EFD39 && dword_1000EF4E8 <= 2)
      {
        int v10 = *__error();
        CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Avoiding inspecting live processes for stackshot report due to audio running");
        if (v11)
        {
          CFStringRef v12 = v11;
          CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
          if (CStringPtr)
          {
            v14 = (char *)CStringPtr;
            v15 = 0;
          }
          else
          {
            v14 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5DD56AFCuLL);
            CFStringGetCString(v12, v14, 1024, 0x8000100u);
            v15 = v14;
          }
          if (qword_1000EFD40) {
            v18 = (FILE *)qword_1000EFD40;
          }
          else {
            v18 = __stderrp;
          }
          fprintf(v18, "%s\n", v14);
          if (v15) {
            free(v15);
          }
          CFRelease(v12);
        }
        else
        {
          v16 = sub_10002FC70();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            sub_100099BF0();
          }
          if (qword_1000EFD40) {
            v17 = (FILE *)qword_1000EFD40;
          }
          else {
            v17 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v17);
        }
        *__error() = v10;
      }
      [(SASampleStore *)v3->_sampleStore setDataGatheringOptions:(unint64_t)[(SASampleStore *)v3->_sampleStore dataGatheringOptions] & 0xFFFFFFFFFFFFFFFDLL];
    }
    [(SASampleStore *)v3->_sampleStore gatherMachineArchitecture];
    if (byte_1000EFD38)
    {
      int v19 = *__error();
      v20 = sub_10002FC70();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100099BBC();
      }
      *__error() = v19;
    }
    if (byte_1000EFD39 && dword_1000EF4E8 <= 0)
    {
      int v21 = *__error();
      CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Created shared SPStackshotProvider");
      if (v22)
      {
        CFStringRef v23 = v22;
        v24 = CFStringGetCStringPtr(v22, 0x8000100u);
        if (v24)
        {
          v25 = (char *)v24;
          v26 = 0;
        }
        else
        {
          v25 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x870B609uLL);
          CFStringGetCString(v23, v25, 1024, 0x8000100u);
          v26 = v25;
        }
        if (qword_1000EFD40) {
          v29 = (FILE *)qword_1000EFD40;
        }
        else {
          v29 = __stderrp;
        }
        fprintf(v29, "%s\n", v25);
        if (v26) {
          free(v26);
        }
        CFRelease(v23);
      }
      else
      {
        v27 = sub_10002FC70();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          sub_100099B88();
        }
        if (qword_1000EFD40) {
          v28 = (FILE *)qword_1000EFD40;
        }
        else {
          v28 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v28);
      }
      *__error() = v21;
    }
  }
  return v3;
}

- (void)dealloc
{
  p_numClientsSampling = &self->_numClientsSampling;
  if (self->_numClientsSampling)
  {
    if (byte_1000EFD38)
    {
      int v8 = *__error();
      v9 = sub_10002FC70();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100099CA4();
      }
      *__error() = v8;
    }
    if (byte_1000EFD39) {
      BOOL v10 = dword_1000EF4E8 <= 3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      int v11 = *__error();
      CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Still have %d clients sampling when dealloc'ed", "_numClientsSampling == 0", *p_numClientsSampling);
      int v20 = v11;
      if (v12)
      {
        CFStringRef theString = v12;
        CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
        if (CStringPtr)
        {
          v16 = (char *)CStringPtr;
          v17 = 0;
        }
        else
        {
          v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA6E5828FuLL);
          CFStringGetCString(theString, v16, 1024, 0x8000100u);
          v17 = v16;
        }
        if (qword_1000EFD40) {
          v18 = (FILE *)qword_1000EFD40;
        }
        else {
          v18 = __stderrp;
        }
        fprintf(v18, "%s\n", v16);
        if (v17) {
          free(v17);
        }
        CFRelease(theString);
      }
      else
      {
        v13 = sub_10002FC70();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_100099C24();
        }
        if (qword_1000EFD40) {
          v14 = (FILE *)qword_1000EFD40;
        }
        else {
          v14 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v14);
      }
      *__error() = v20;
    }
    sub_10002FB44("-[SPStackshotProvider dealloc]", "SPSampleProvider.m", 499, "%s: Still have %d clients sampling when dealloc'ed", v2, v3, v4, v5, (char)"_numClientsSampling == 0");
    abort();
  }
  [(SPStackshotProvider *)self stopSamplingThread];

  dispatch_release((dispatch_object_t)self->_storeReportingQueue);
  dispatch_release((dispatch_object_t)self->_stackshotParsingQueue);
  dispatch_release((dispatch_object_t)self->_samplingGroup);

  dispatch_release((dispatch_object_t)self->_pidsSem);
  v21.receiver = self;
  v21.super_class = (Class)SPStackshotProvider;
  [(SPStackshotProvider *)&v21 dealloc];
}

- (void)startSamplingThread
{
  objc_sync_enter(self);
  if (self->_samplingThread)
  {
    if (byte_1000EFD38)
    {
      int v3 = *__error();
      uint64_t v4 = sub_10002FC70();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_100099E34();
      }
      *__error() = v3;
    }
    if (byte_1000EFD39) {
      BOOL v5 = dword_1000EF4E8 <= 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      int v6 = *__error();
      CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Already have a sampling thread");
      CFStringRef v8 = v7;
      if (v7)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v7, 0x8000100u);
        if (CStringPtr)
        {
          BOOL v10 = 0;
        }
        else
        {
          CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xDA9EEA40uLL);
          CFStringGetCString(v8, CStringPtr, 1024, 0x8000100u);
          BOOL v10 = CStringPtr;
        }
        if (qword_1000EFD40) {
          objc_super v21 = (FILE *)qword_1000EFD40;
        }
        else {
          objc_super v21 = __stderrp;
        }
        fprintf(v21, "%s\n", CStringPtr);
        if (v10) {
          free(v10);
        }
        CFRelease(v8);
      }
      else
      {
        int v19 = sub_10002FC70();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          sub_100099E00();
        }
        if (qword_1000EFD40) {
          int v20 = (FILE *)qword_1000EFD40;
        }
        else {
          int v20 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v20);
      }
      *__error() = v6;
    }
  }
  else
  {
    self->_samplingStoppedSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    if (byte_1000EFD38)
    {
      int v11 = *__error();
      CFStringRef v12 = sub_10002FC70();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting sampling thread", buf, 2u);
      }
      *__error() = v11;
    }
    if (byte_1000EFD39) {
      BOOL v13 = dword_1000EF4E8 <= 1;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      int v14 = *__error();
      CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Starting sampling thread");
      CFStringRef v16 = v15;
      if (v15)
      {
        v17 = (char *)CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          v18 = 0;
        }
        else
        {
          v17 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xDA5638ECuLL);
          CFStringGetCString(v16, v17, 1024, 0x8000100u);
          v18 = v17;
        }
        if (qword_1000EFD40) {
          v24 = (FILE *)qword_1000EFD40;
        }
        else {
          v24 = __stderrp;
        }
        fprintf(v24, "%s\n", v17);
        if (v18) {
          free(v18);
        }
        CFRelease(v16);
      }
      else
      {
        CFStringRef v22 = sub_10002FC70();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100099DCC();
        }
        if (qword_1000EFD40) {
          CFStringRef v23 = (FILE *)qword_1000EFD40;
        }
        else {
          CFStringRef v23 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v23);
      }
      *__error() = v14;
    }
    uint64_t v25 = pthread_create(&self->_samplingThread, 0, (void *(__cdecl *)(void *))sub_100070CB8, self);
    if (v25)
    {
      *(void *)__errnum = v25;
      if (byte_1000EFD38)
      {
        int v31 = *__error();
        objc_super v32 = sub_10002FC70();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = strerror(__errnum[0]);
          sub_100099D78((uint64_t)v33, buf, __errnum[0]);
        }
        *__error() = v31;
      }
      if (byte_1000EFD39) {
        BOOL v26 = dword_1000EF4E8 <= 3;
      }
      else {
        BOOL v26 = 0;
      }
      if (v26)
      {
        int v34 = *__error();
        v35 = strerror(__errnum[0]);
        CFStringRef v36 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: Unable to create sampling thread: %d (%s)", "ret == 0", *(void *)__errnum, v35);
        CFStringRef v37 = v36;
        if (v36)
        {
          v41 = (char *)CFStringGetCStringPtr(v36, 0x8000100u);
          if (v41)
          {
            v42 = 0;
          }
          else
          {
            v41 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x98EFEE2EuLL);
            CFStringGetCString(v37, v41, 1024, 0x8000100u);
            v42 = v41;
          }
          if (qword_1000EFD40) {
            v43 = (FILE *)qword_1000EFD40;
          }
          else {
            v43 = __stderrp;
          }
          fprintf(v43, "%s\n", v41);
          if (v42) {
            free(v42);
          }
          CFRelease(v37);
        }
        else
        {
          v38 = sub_10002FC70();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            v39 = strerror(__errnum[0]);
            sub_100099D24((uint64_t)v39, v45, __errnum[0]);
          }
          if (qword_1000EFD40) {
            v40 = (FILE *)qword_1000EFD40;
          }
          else {
            v40 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v40);
        }
        *__error() = v34;
      }
      strerror(__errnum[0]);
      sub_10002FB44("-[SPStackshotProvider startSamplingThread]", "SPSampleProvider.m", 517, "%s: Unable to create sampling thread: %d (%s)", v27, v28, v29, v30, (char)"ret == 0");
      abort();
    }
  }
  objc_sync_exit(self);
}

- (void)stopSamplingThread
{
  objc_sync_enter(self);
  if (self->_samplingThread)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_samplingStoppedSem);
    if (byte_1000EFD39)
    {
      if (qword_1000EFD98 && dispatch_group_wait((dispatch_group_t)qword_1000EFD98, 0))
      {
        if (byte_1000EFD91) {
          goto LABEL_109;
        }
        if (byte_1000EFD38)
        {
          int v3 = *__error();
          uint64_t v4 = sub_10002FC70();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sampling completed, waiting for SIGINFO...", buf, 2u);
          }
          *__error() = v3;
        }
        if (!byte_1000EFD39 || dword_1000EF4E8 > 2) {
          goto LABEL_109;
        }
        int v5 = *__error();
        CFStringRef v6 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Sampling completed, waiting for SIGINFO...");
        CFStringRef v7 = v6;
        if (v6)
        {
          CStringPtr = (char *)CFStringGetCStringPtr(v6, 0x8000100u);
          if (CStringPtr)
          {
            v9 = 0;
          }
          else
          {
            CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x34D87FFDuLL);
            CFStringGetCString(v7, CStringPtr, 1024, 0x8000100u);
            v9 = CStringPtr;
          }
          if (qword_1000EFD40) {
            v44 = (FILE *)qword_1000EFD40;
          }
          else {
            v44 = __stderrp;
          }
          fprintf(v44, "%s\n", CStringPtr);
          if (v9) {
            free(v9);
          }
          CFRelease(v7);
        }
        else
        {
          v42 = sub_10002FC70();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
            sub_100099E68();
          }
          if (qword_1000EFD40) {
            v43 = (FILE *)qword_1000EFD40;
          }
          else {
            v43 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v43);
        }
        v40 = __error();
      }
      else if ((byte_1000EFD4C & 0x18) == 0x10)
      {
        if (byte_1000EFD38)
        {
          int v18 = *__error();
          int v19 = sub_10002FC70();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sampling completed, generating report...", v56, 2u);
          }
          *__error() = v18;
        }
        if (byte_1000EFD39) {
          BOOL v20 = dword_1000EF4E8 <= 2;
        }
        else {
          BOOL v20 = 0;
        }
        if (!v20) {
          goto LABEL_109;
        }
        int v5 = *__error();
        CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Sampling completed, generating report...");
        CFStringRef v22 = v21;
        if (v21)
        {
          CFStringRef v23 = (char *)CFStringGetCStringPtr(v21, 0x8000100u);
          if (v23)
          {
            v24 = 0;
          }
          else
          {
            CFStringRef v23 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE90DD6FFuLL);
            CFStringGetCString(v22, v23, 1024, 0x8000100u);
            v24 = v23;
          }
          if (qword_1000EFD40) {
            v39 = (FILE *)qword_1000EFD40;
          }
          else {
            v39 = __stderrp;
          }
          fprintf(v39, "%s\n", v23);
          if (v24) {
            free(v24);
          }
          CFRelease(v22);
        }
        else
        {
          v35 = sub_10002FC70();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            sub_10009A104();
          }
          if (qword_1000EFD40) {
            CFStringRef v36 = (FILE *)qword_1000EFD40;
          }
          else {
            CFStringRef v36 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v36);
        }
        v40 = __error();
      }
      else
      {
        if (byte_1000EFD38)
        {
          int v25 = *__error();
          BOOL v26 = sub_10002FC70();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v57 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Sampling completed, processing symbols...", v57, 2u);
          }
          *__error() = v25;
        }
        if (byte_1000EFD39) {
          BOOL v27 = dword_1000EF4E8 <= 2;
        }
        else {
          BOOL v27 = 0;
        }
        if (!v27) {
          goto LABEL_109;
        }
        int v5 = *__error();
        CFStringRef v28 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Sampling completed, processing symbols...");
        CFStringRef v29 = v28;
        if (v28)
        {
          uint64_t v30 = (char *)CFStringGetCStringPtr(v28, 0x8000100u);
          if (v30)
          {
            int v31 = 0;
          }
          else
          {
            uint64_t v30 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF202B765uLL);
            CFStringGetCString(v29, v30, 1024, 0x8000100u);
            int v31 = v30;
          }
          if (qword_1000EFD40) {
            v41 = (FILE *)qword_1000EFD40;
          }
          else {
            v41 = __stderrp;
          }
          fprintf(v41, "%s\n", v30);
          if (v31) {
            free(v31);
          }
          CFRelease(v29);
        }
        else
        {
          CFStringRef v37 = sub_10002FC70();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
            sub_10009A138();
          }
          if (qword_1000EFD40) {
            v38 = (FILE *)qword_1000EFD40;
          }
          else {
            v38 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v38);
        }
        v40 = __error();
      }
      int *v40 = v5;
    }
LABEL_109:
    if (byte_1000EFD38)
    {
      int v45 = *__error();
      v46 = sub_10002FC70();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Stopping sampling thread", v55, 2u);
      }
      *__error() = v45;
      if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
      {
        int v47 = *__error();
        CFStringRef v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Stopping sampling thread");
        CFStringRef v49 = v48;
        if (v48)
        {
          v50 = (char *)CFStringGetCStringPtr(v48, 0x8000100u);
          if (v50)
          {
            v51 = 0;
          }
          else
          {
            v50 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF83B09A7uLL);
            CFStringGetCString(v49, v50, 1024, 0x8000100u);
            v51 = v50;
          }
          if (qword_1000EFD40) {
            v54 = (FILE *)qword_1000EFD40;
          }
          else {
            v54 = __stderrp;
          }
          fprintf(v54, "%s\n", v50);
          if (v51) {
            free(v51);
          }
          CFRelease(v49);
        }
        else
        {
          v52 = sub_10002FC70();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
            sub_10009A0D0();
          }
          if (qword_1000EFD40) {
            v53 = (FILE *)qword_1000EFD40;
          }
          else {
            v53 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v53);
        }
        *__error() = v47;
      }
    }
    pthread_join(self->_samplingThread, 0);
    dispatch_release((dispatch_object_t)self->_samplingStoppedSem);
    self->_samplingThread = 0;
    goto LABEL_132;
  }
  if (byte_1000EFD38)
  {
    int v10 = *__error();
    int v11 = sub_10002FC70();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10009A09C();
    }
    *__error() = v10;
  }
  if (byte_1000EFD39) {
    BOOL v12 = dword_1000EF4E8 <= 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    int v13 = *__error();
    CFStringRef v14 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"No sampling thread to stop");
    CFStringRef v15 = v14;
    if (v14)
    {
      CFStringRef v16 = (char *)CFStringGetCStringPtr(v14, 0x8000100u);
      if (v16)
      {
        v17 = 0;
      }
      else
      {
        CFStringRef v16 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5D81E1D0uLL);
        CFStringGetCString(v15, v16, 1024, 0x8000100u);
        v17 = v16;
      }
      if (qword_1000EFD40) {
        int v34 = (FILE *)qword_1000EFD40;
      }
      else {
        int v34 = __stderrp;
      }
      fprintf(v34, "%s\n", v16);
      if (v17) {
        free(v17);
      }
      CFRelease(v15);
    }
    else
    {
      objc_super v32 = sub_10002FC70();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_10009A068();
      }
      if (qword_1000EFD40) {
        v33 = (FILE *)qword_1000EFD40;
      }
      else {
        v33 = __stderrp;
      }
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    }
    *__error() = v13;
  }
LABEL_132:
  objc_sync_exit(self);
}

+ (id)sharedInstanceLock
{
  if (qword_1000EFCF0 != -1) {
    dispatch_once(&qword_1000EFCF0, &stru_1000E1BB8);
  }
  return (id)qword_1000EFCF8;
}

+ (id)snapshotWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t v14 = 0;
  CFStringRef v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = sub_100072B4C;
  int v18 = sub_100072B5C;
  uint64_t v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100072B68;
  v9[3] = &unk_1000E1BE0;
  unsigned int v10 = a3;
  unsigned int v11 = a4;
  BOOL v12 = a6;
  BOOL v13 = a7;
  v9[4] = a5;
  v9[5] = &v14;
  dispatch_sync((dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock], v9);
  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)sampleProcesses:(id)a3 onlyMainThreads:(BOOL)a4
{
  BOOL v4 = a4;
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    sampleOnlyPids = self->_sampleOnlyPids;
    if (a3)
    {
      if (sampleOnlyPids)
      {
        id v8 = [a3 mutableCopy];
        [v8 minusSet:self->_sampleOnlyPids];
        if ([v8 count])
        {
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
          self->_sampleOnlyPidsHasUpdate = 1;
          [(NSMutableSet *)self->_sampleOnlyPids unionSet:v8];
          if (byte_1000EFD38)
          {
            int v9 = *__error();
            unsigned int v10 = sub_10002FC70();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              id v52 = [[[v8 description] UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Changing to sampling %s also", buf, 0xCu);
            }
            *__error() = v9;
          }
          if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
          {
            int v11 = *__error();
            CFStringRef v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Changing to sampling %s also", [objc_msgSend(objc_msgSend(v8, "description"), "UTF8String") UTF8String]);
            CFStringRef v13 = v12;
            if (v12)
            {
              CStringPtr = (char *)CFStringGetCStringPtr(v12, 0x8000100u);
              if (CStringPtr)
              {
                CFStringRef v15 = 0;
              }
              else
              {
                CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x76625223uLL);
                CFStringGetCString(v13, CStringPtr, 1024, 0x8000100u);
                CFStringRef v15 = CStringPtr;
              }
              if (qword_1000EFD40) {
                v38 = (FILE *)qword_1000EFD40;
              }
              else {
                v38 = __stderrp;
              }
              fprintf(v38, "%s\n", CStringPtr);
              if (v15) {
                free(v15);
              }
              CFRelease(v13);
            }
            else
            {
              int v34 = sub_10002FC70();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
                sub_10009A2F0([[objc_msgSend(v8, "description") UTF8String], buf, v34);
              }
              if (qword_1000EFD40) {
                v35 = (FILE *)qword_1000EFD40;
              }
              else {
                v35 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v35);
            }
            *__error() = v11;
          }
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
        }
      }
      if (!v4 && [(SASampleStore *)self->_sampleStore sampleOnlyMainThreads])
      {
        if (byte_1000EFD38)
        {
          int v39 = *__error();
          v40 = sub_10002FC70();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Upping sampling to include non-main threads", v50, 2u);
          }
          *__error() = v39;
        }
        if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
        {
          int v41 = *__error();
          CFStringRef v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Upping sampling to include non-main threads");
          CFStringRef v43 = v42;
          if (v42)
          {
            v44 = (char *)CFStringGetCStringPtr(v42, 0x8000100u);
            if (v44)
            {
              int v45 = 0;
            }
            else
            {
              v44 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6F456C6EuLL);
              CFStringGetCString(v43, v44, 1024, 0x8000100u);
              int v45 = v44;
            }
            if (qword_1000EFD40) {
              CFStringRef v49 = (FILE *)qword_1000EFD40;
            }
            else {
              CFStringRef v49 = __stderrp;
            }
            fprintf(v49, "%s\n", v44);
            if (v45) {
              free(v45);
            }
            CFRelease(v43);
          }
          else
          {
            v46 = sub_10002FC70();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
              sub_10009A2BC();
            }
            if (qword_1000EFD40) {
              int v47 = (FILE *)qword_1000EFD40;
            }
            else {
              int v47 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v47);
          }
          *__error() = v41;
        }
        [(SASampleStore *)self->_sampleStore setSampleOnlyMainThreads:0];
      }
      goto LABEL_111;
    }
    if (sampleOnlyPids)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
      if ([(SASampleStore *)self->_sampleStore sampleOnlyMainThreads]) {
        [(SASampleStore *)self->_sampleStore setSampleOnlyMainThreads:0];
      }
      [(SASampleStore *)self->_sampleStore setStackshotsOnlyIncludeSpecificProcesses:0];
      if (byte_1000EFD38)
      {
        int v24 = *__error();
        int v25 = sub_10002FC70();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Changing to sampling everything", buf, 2u);
        }
        *__error() = v24;
      }
      if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
      {
        int v19 = *__error();
        CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Changing to sampling everything");
        CFStringRef v27 = v26;
        if (v26)
        {
          CFStringRef v28 = (char *)CFStringGetCStringPtr(v26, 0x8000100u);
          if (v28)
          {
            CFStringRef v29 = 0;
          }
          else
          {
            CFStringRef v28 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD26AF731uLL);
            CFStringGetCString(v27, v28, 1024, 0x8000100u);
            CFStringRef v29 = v28;
          }
          if (qword_1000EFD40) {
            CFStringRef v48 = (FILE *)qword_1000EFD40;
          }
          else {
            CFStringRef v48 = __stderrp;
          }
          fprintf(v48, "%s\n", v28);
          if (v29) {
            free(v29);
          }
          CFRelease(v27);
        }
        else
        {
          CFStringRef v36 = sub_10002FC70();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
            sub_10009A288();
          }
          if (qword_1000EFD40) {
            CFStringRef v37 = (FILE *)qword_1000EFD40;
          }
          else {
            CFStringRef v37 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v37);
        }
        v33 = __error();
LABEL_101:
        int *v33 = v19;
      }
    }
  }
  else
  {
    if (a3) {
      [(SASampleStore *)self->_sampleStore setStackshotsOnlyIncludeSpecificProcesses:1];
    }
    if (byte_1000EFD38)
    {
      int v16 = *__error();
      v17 = sub_10002FC70();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10009A22C((uint64_t)[a3 description], v4, buf, v17);
      }
      *__error() = v16;
    }
    if (byte_1000EFD39) {
      BOOL v18 = dword_1000EF4E8 <= 3;
    }
    else {
      BOOL v18 = 0;
    }
    if (v18)
    {
      int v19 = *__error();
      CFStringRef v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"No one's sampling when requested to adjust sampling target to %@ %d", [a3 description], v4);
      CFStringRef v21 = v20;
      if (v20)
      {
        CFStringRef v22 = (char *)CFStringGetCStringPtr(v20, 0x8000100u);
        if (v22)
        {
          CFStringRef v23 = 0;
        }
        else
        {
          CFStringRef v22 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF089C3E9uLL);
          CFStringGetCString(v21, v22, 1024, 0x8000100u);
          CFStringRef v23 = v22;
        }
        if (qword_1000EFD40) {
          objc_super v32 = (FILE *)qword_1000EFD40;
        }
        else {
          objc_super v32 = __stderrp;
        }
        fprintf(v32, "%s\n", v22);
        if (v23) {
          free(v23);
        }
        CFRelease(v21);
      }
      else
      {
        uint64_t v30 = sub_10002FC70();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          sub_10009A1D4((uint64_t)[a3 description], v50, v4, v30);
        }
        if (qword_1000EFD40) {
          int v31 = (FILE *)qword_1000EFD40;
        }
        else {
          int v31 = __stderrp;
        }
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
      }
      v33 = __error();
      goto LABEL_101;
    }
  }
LABEL_111:
  objc_sync_exit(self);
}

- (BOOL)startWithSamplingIntervalUs:(unsigned int)a3 andOccasionalDataIntervalSec:(unsigned int)a4 andOnlySampleProcesses:(id)a5 andOnlySampleMainThreads:(BOOL)a6 andOmitSensitiveStrings:(BOOL)a7
{
  if (a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    uint64_t v10 = *(void *)&a4;
    uint64_t v11 = *(void *)&a3;
    objc_sync_enter(self);
    int numClientsSampling = self->_numClientsSampling;
    if (numClientsSampling)
    {
      if (self->_samplingIntervalUs != v11
        || v10 && (unsigned int v14 = self->_occasionalDataIntervalSec) != 0 && v14 != v10)
      {
        if (byte_1000EFD38)
        {
          int v15 = *__error();
          int v16 = sub_10002FC70();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            unsigned int samplingIntervalUs = self->_samplingIntervalUs;
            unsigned int occasionalDataIntervalSec = self->_occasionalDataIntervalSec;
            *(_DWORD *)buf = 67109888;
            *(_DWORD *)v118 = samplingIntervalUs;
            *(_WORD *)&v118[4] = 1024;
            *(_DWORD *)&v118[6] = occasionalDataIntervalSec;
            __int16 v119 = 1024;
            LODWORD(v120[0]) = v11;
            WORD2(v120[0]) = 1024;
            *(_DWORD *)((char *)v120 + 6) = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data", buf, 0x1Au);
          }
          *__error() = v15;
        }
        if (byte_1000EFD39) {
          BOOL v17 = dword_1000EF4E8 <= 3;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          int v18 = *__error();
          CFStringRef v19 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data", self->_samplingIntervalUs, self->_occasionalDataIntervalSec, v11, v10);
          CFStringRef v20 = v19;
          if (v19)
          {
            CStringPtr = (char *)CFStringGetCStringPtr(v19, 0x8000100u);
            if (CStringPtr)
            {
              CFStringRef v22 = 0;
            }
            else
            {
              CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4D27C969uLL);
              CFStringGetCString(v20, CStringPtr, 1024, 0x8000100u);
              CFStringRef v22 = CStringPtr;
            }
            if (qword_1000EFD40) {
              v56 = (FILE *)qword_1000EFD40;
            }
            else {
              v56 = __stderrp;
            }
            fprintf(v56, "%s\n", CStringPtr);
            if (v22) {
              free(v22);
            }
            CFRelease(v20);
          }
          else
          {
            int v47 = sub_10002FC70();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
            {
              unsigned int v111 = self->_samplingIntervalUs;
              unsigned int v112 = self->_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v118 = v111;
              *(_WORD *)&v118[4] = 1024;
              *(_DWORD *)&v118[6] = v112;
              __int16 v119 = 1024;
              LODWORD(v120[0]) = v11;
              WORD2(v120[0]) = 1024;
              *(_DWORD *)((char *)v120 + 6) = v10;
              _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "Unable to format: Already sampling with %uus-interval stackshots and %uus-interval occasional data, so can't start sampling with %uus-interval stackshots and %us-interval occasional data", buf, 0x1Au);
            }
            if (qword_1000EFD40) {
              CFStringRef v48 = (FILE *)qword_1000EFD40;
            }
            else {
              CFStringRef v48 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
          }
          BOOL v23 = 0;
          *__error() = v18;
          goto LABEL_201;
        }
        goto LABEL_29;
      }
      if (!v7 || self->_omitSensitiveStrings)
      {
        self->_int numClientsSampling = numClientsSampling + 1;
        if (byte_1000EFD38)
        {
          int v27 = *__error();
          CFStringRef v28 = sub_10002FC70();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_10009A5A8();
          }
          *__error() = v27;
        }
        if (byte_1000EFD39) {
          BOOL v29 = dword_1000EF4E8 <= 0;
        }
        else {
          BOOL v29 = 0;
        }
        if (v29)
        {
          int v30 = *__error();
          CFStringRef v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Already sampling with %uus-interval stackshots and %us-interval occasional data", self->_samplingIntervalUs, self->_occasionalDataIntervalSec);
          CFStringRef v32 = v31;
          if (v31)
          {
            v33 = (char *)CFStringGetCStringPtr(v31, 0x8000100u);
            if (v33)
            {
              int v34 = 0;
            }
            else
            {
              v33 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x275E42D2uLL);
              CFStringGetCString(v32, v33, 1024, 0x8000100u);
              int v34 = v33;
            }
            if (qword_1000EFD40) {
              v67 = (FILE *)qword_1000EFD40;
            }
            else {
              v67 = __stderrp;
            }
            fprintf(v67, "%s\n", v33);
            if (v34) {
              free(v34);
            }
            CFRelease(v32);
          }
          else
          {
            v64 = sub_10002FC70();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
              sub_10009A52C();
            }
            if (qword_1000EFD40) {
              v65 = (FILE *)qword_1000EFD40;
            }
            else {
              v65 = __stderrp;
            }
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v65);
          }
          *__error() = v30;
        }
        [(SPStackshotProvider *)self sampleProcesses:a5 onlyMainThreads:v8];
        p_unsigned int occasionalDataIntervalSec = &self->_occasionalDataIntervalSec;
        if (!self->_occasionalDataIntervalSec)
        {
          unsigned int *p_occasionalDataIntervalSec = v10;
          if (byte_1000EFD38)
          {
            int v69 = *__error();
            v70 = sub_10002FC70();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              unsigned int v71 = *p_occasionalDataIntervalSec;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v118 = v71;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Turned on occasional data gathering at %us-intervals for additional client", buf, 8u);
            }
            *__error() = v69;
          }
          if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
          {
            int v72 = *__error();
            CFStringRef v73 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Turned on occasional data gathering at %us-intervals for additional client", *p_occasionalDataIntervalSec);
            CFStringRef v74 = v73;
            if (v73)
            {
              v75 = (char *)CFStringGetCStringPtr(v73, 0x8000100u);
              if (v75)
              {
                v76 = 0;
              }
              else
              {
                v75 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xCBE22889uLL);
                CFStringGetCString(v74, v75, 1024, 0x8000100u);
                v76 = v75;
              }
              if (qword_1000EFD40) {
                v86 = (FILE *)qword_1000EFD40;
              }
              else {
                v86 = __stderrp;
              }
              fprintf(v86, "%s\n", v75);
              if (v76) {
                free(v76);
              }
              CFRelease(v74);
            }
            else
            {
              v81 = sub_10002FC70();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT)) {
                sub_10009A4C0();
              }
              if (qword_1000EFD40) {
                v82 = (FILE *)qword_1000EFD40;
              }
              else {
                v82 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v82);
            }
            *__error() = v72;
          }
        }
        SAMachAbsTimeSecondsGetCurrent();
        if (v10)
        {
          uint64_t v88 = v87;
          global_queue = dispatch_get_global_queue(25, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100074820;
          block[3] = &unk_1000E0E48;
          block[5] = v88;
          block[4] = self;
          dispatch_async(global_queue, block);
        }
LABEL_200:
        BOOL v23 = 1;
        goto LABEL_201;
      }
      if (byte_1000EFD38)
      {
        int v59 = *__error();
        v60 = sub_10002FC70();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          sub_10009A488();
        }
        *__error() = v59;
      }
      BOOL v23 = 0;
      if (!byte_1000EFD39 || dword_1000EF4E8 > 3) {
        goto LABEL_201;
      }
      int v42 = *__error();
      CFStringRef v61 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Already sampling with sensitive strings, so can't start monitoring since we don't want sensitive strings");
      CFStringRef v44 = v61;
      if (v61)
      {
        v62 = (char *)CFStringGetCStringPtr(v61, 0x8000100u);
        if (v62)
        {
          v63 = 0;
        }
        else
        {
          v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9FC0D6DCuLL);
          CFStringGetCString(v44, v62, 1024, 0x8000100u);
          v63 = v62;
        }
        if (qword_1000EFD40) {
          v110 = (FILE *)qword_1000EFD40;
        }
        else {
          v110 = __stderrp;
        }
        fprintf(v110, "%s\n", v62);
        if (v63) {
          free(v63);
        }
LABEL_107:
        CFRelease(v44);
        goto LABEL_108;
      }
      v90 = sub_10002FC70();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
        sub_10009A454();
      }
      if (qword_1000EFD40) {
        v58 = (FILE *)qword_1000EFD40;
      }
      else {
        v58 = __stderrp;
      }
    }
    else
    {
      if (!self->_hasSampled)
      {
        dispatch_group_enter((dispatch_group_t)self->_samplingGroup);
        self->_hasSampled = 1;
        ++self->_numClientsSampling;
        self->_unsigned int samplingIntervalUs = v11;
        self->_unsigned int occasionalDataIntervalSec = v10;
        self->_previousTimeOccasionalDataWasGathered = 0.0;
        self->_omitSensitiveStrings = v7;
        [(SASampleStore *)self->_sampleStore setOmitSensitiveStrings:v7];
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
        self->_sampleOnlyPidsHasUpdate = 1;

        if (a5)
        {
          self->_sampleOnlyPids = (NSMutableSet *)[a5 mutableCopy];
          if (byte_1000EFD38)
          {
            int v35 = *__error();
            CFStringRef v36 = sub_10002FC70();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)v118 = [objc_msgSend(a5, "description") UTF8String];
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Sampling only %s", buf, 0xCu);
            }
            *__error() = v35;
          }
          if (byte_1000EFD39 && dword_1000EF4E8 <= 1)
          {
            int v37 = *__error();
            CFStringRef v38 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Sampling only %s", [objc_msgSend(objc_msgSend(a5, "description"), "UTF8String") UTF8String]);
            CFStringRef v39 = v38;
            if (v38)
            {
              v40 = (char *)CFStringGetCStringPtr(v38, 0x8000100u);
              if (v40)
              {
                int v41 = 0;
              }
              else
              {
                v40 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x313082CuLL);
                CFStringGetCString(v39, v40, 1024, 0x8000100u);
                int v41 = v40;
              }
              if (qword_1000EFD40) {
                v83 = (FILE *)qword_1000EFD40;
              }
              else {
                v83 = __stderrp;
              }
              fprintf(v83, "%s\n", v40);
              if (v41) {
                free(v41);
              }
              CFRelease(v39);
            }
            else
            {
              v77 = sub_10002FC70();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
                sub_10009A3A0((uint64_t)[objc_msgSend(objc_msgSend(a5, "description"), "UTF8String") UTF8String], v121, v77);
              }
              if (qword_1000EFD40) {
                v78 = (FILE *)qword_1000EFD40;
              }
              else {
                v78 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v78);
            }
            *__error() = v37;
          }
        }
        else
        {
          self->_sampleOnlyPids = 0;
          if (byte_1000EFD38)
          {
            int v49 = *__error();
            v50 = sub_10002FC70();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
              sub_10009A36C();
            }
            *__error() = v49;
          }
          BOOL v8 = 0;
          if (byte_1000EFD39 && dword_1000EF4E8 <= 0)
          {
            int v51 = *__error();
            CFStringRef v52 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Sampling everything");
            CFStringRef v53 = v52;
            if (v52)
            {
              v54 = (char *)CFStringGetCStringPtr(v52, 0x8000100u);
              if (v54)
              {
                v55 = 0;
              }
              else
              {
                v54 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x45049F48uLL);
                CFStringGetCString(v53, v54, 1024, 0x8000100u);
                v55 = v54;
              }
              if (qword_1000EFD40) {
                v91 = (FILE *)qword_1000EFD40;
              }
              else {
                v91 = __stderrp;
              }
              fprintf(v91, "%s\n", v54);
              if (v55) {
                free(v55);
              }
              CFRelease(v53);
            }
            else
            {
              v84 = sub_10002FC70();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
                sub_10009A338();
              }
              if (qword_1000EFD40) {
                v85 = (FILE *)qword_1000EFD40;
              }
              else {
                v85 = __stderrp;
              }
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v85);
            }
            BOOL v8 = 0;
            *__error() = v51;
          }
        }
        [(SASampleStore *)self->_sampleStore setSampleOnlyMainThreads:v8];
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
        [(SPStackshotProvider *)self startSamplingThread];
        if (byte_1000EFD38)
        {
          int v92 = *__error();
          v93 = sub_10002FC70();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v107 = self->_samplingIntervalUs;
            unsigned int v106 = self->_occasionalDataIntervalSec;
            unsigned int v108 = [(SASampleStore *)self->_sampleStore sampleOnlyMainThreads];
            v109 = "";
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v118 = v107;
            if (v108) {
              v109 = ", sampling only main threads";
            }
            *(_WORD *)&v118[4] = 1024;
            *(_DWORD *)&v118[6] = v106;
            __int16 v119 = 2080;
            v120[0] = v109;
            _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "Started sampling with %uus-interval stackshots and %us-interval occasional data%s", buf, 0x18u);
          }
          *__error() = v92;
        }
        BOOL v23 = 1;
        if (!byte_1000EFD39 || dword_1000EF4E8 > 0) {
          goto LABEL_201;
        }
        int v94 = *__error();
        uint64_t v95 = self->_samplingIntervalUs;
        uint64_t v96 = self->_occasionalDataIntervalSec;
        if ([(SASampleStore *)self->_sampleStore sampleOnlyMainThreads]) {
          v97 = ", sampling only main threads";
        }
        else {
          v97 = "";
        }
        CFStringRef v98 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Started sampling with %uus-interval stackshots and %us-interval occasional data%s", v95, v96, v97);
        CFStringRef v99 = v98;
        if (v98)
        {
          v100 = (char *)CFStringGetCStringPtr(v98, 0x8000100u);
          if (v100)
          {
            v101 = 0;
          }
          else
          {
            v100 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x3B5D1D96uLL);
            CFStringGetCString(v99, v100, 1024, 0x8000100u);
            v101 = v100;
          }
          if (qword_1000EFD40) {
            v104 = (FILE *)qword_1000EFD40;
          }
          else {
            v104 = __stderrp;
          }
          fprintf(v104, "%s\n", v100);
          if (v101) {
            free(v101);
          }
          CFRelease(v99);
        }
        else
        {
          v102 = sub_10002FC70();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
          {
            unsigned int v114 = self->_samplingIntervalUs;
            unsigned int v113 = self->_occasionalDataIntervalSec;
            if ([(SASampleStore *)self->_sampleStore sampleOnlyMainThreads]) {
              v115 = ", sampling only main threads";
            }
            else {
              v115 = "";
            }
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v118 = v114;
            *(_WORD *)&v118[4] = 1024;
            *(_DWORD *)&v118[6] = v113;
            __int16 v119 = 2080;
            v120[0] = v115;
            _os_log_fault_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_FAULT, "Unable to format: Started sampling with %uus-interval stackshots and %us-interval occasional data%s", buf, 0x18u);
          }
          if (qword_1000EFD40) {
            v103 = (FILE *)qword_1000EFD40;
          }
          else {
            v103 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v103);
        }
        *__error() = v94;
        goto LABEL_200;
      }
      if (byte_1000EFD38)
      {
        int v24 = *__error();
        int v25 = sub_10002FC70();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10009A41C();
        }
        *__error() = v24;
      }
      if (byte_1000EFD39) {
        BOOL v26 = dword_1000EF4E8 <= 3;
      }
      else {
        BOOL v26 = 0;
      }
      if (!v26)
      {
LABEL_29:
        BOOL v23 = 0;
LABEL_201:
        objc_sync_exit(self);
        return v23;
      }
      int v42 = *__error();
      CFStringRef v43 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Caught a sampling provider that isn't sampling, but has already sampled");
      CFStringRef v44 = v43;
      if (v43)
      {
        int v45 = (char *)CFStringGetCStringPtr(v43, 0x8000100u);
        if (v45)
        {
          v46 = 0;
        }
        else
        {
          int v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x16F449BAuLL);
          CFStringGetCString(v44, v45, 1024, 0x8000100u);
          v46 = v45;
        }
        if (qword_1000EFD40) {
          v66 = (FILE *)qword_1000EFD40;
        }
        else {
          v66 = __stderrp;
        }
        fprintf(v66, "%s\n", v45);
        if (v46) {
          free(v46);
        }
        goto LABEL_107;
      }
      v57 = sub_10002FC70();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
        sub_10009A3E8();
      }
      if (qword_1000EFD40) {
        v58 = (FILE *)qword_1000EFD40;
      }
      else {
        v58 = __stderrp;
      }
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v58);
LABEL_108:
    BOOL v23 = 0;
    *__error() = v42;
    goto LABEL_201;
  }
  return 0;
}

- (void)stopAndWaitForAllSamplingToComplete:(BOOL)a3 withCompletionCallbackOnQueue:(id)a4 withBlock:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074AE4;
  block[3] = &unk_1000E1620;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)+[SPStackshotProvider sharedInstanceLock], block);
  objc_sync_enter(self);
  if (self->_numClientsSampling)
  {
    id v9 = +[SATimestamp timestamp];
    uint64_t v10 = *(void *)&self->_numSamples;
    int v11 = self->_numClientsSampling - 1;
    self->_int numClientsSampling = v11;
    if (!v11)
    {
      [(SPStackshotProvider *)self stopSamplingThread];
      dispatch_group_leave((dispatch_group_t)self->_samplingGroup);
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_pidsSem, 0xFFFFFFFFFFFFFFFFLL);
      self->_sampleOnlyPidsHasUpdate = 1;

      self->_sampleOnlyPids = 0;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pidsSem);
    }
    global_queue = dispatch_get_global_queue(25, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100074E70;
    v14[3] = &unk_1000E1C58;
    v14[4] = v9;
    v14[5] = self;
    v14[6] = a4;
    v14[7] = a5;
    v14[8] = v10;
    BOOL v15 = a3;
    CFStringRef v13 = v14;
    goto LABEL_8;
  }
  if (a4 && a5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100074E5C;
    v16[3] = &unk_1000E1B28;
    v16[4] = a5;
    CFStringRef v13 = v16;
    global_queue = a4;
LABEL_8:
    dispatch_async(global_queue, v13);
  }
  objc_sync_exit(self);
}

- (void)waitForSamplingToComplete
{
}

- (void)performSampleStoreWork:(id)a3
{
  storeReportingQueue = self->_storeReportingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000750AC;
  v4[3] = &unk_1000E1798;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(storeReportingQueue, v4);
}

- (void)gatherLoadInfoForPid:(int)a3
{
  stackshotParsingQueue = self->_stackshotParsingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007513C;
  v4[3] = &unk_1000E1848;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(stackshotParsingQueue, v4);
}

- (int)numSamples
{
  return self->_numSamples;
}

- (int)numSamplesAvoidedDueToAudio
{
  return self->_numSamplesAvoidedDueToAudio;
}

@end