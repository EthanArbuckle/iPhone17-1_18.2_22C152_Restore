@interface SPProcessEvent
- (BOOL)forceOneBasedTimeIndexes;
- (BOOL)headerOnly;
- (BOOL)includeBinaryFormatInReport;
- (BOOL)includeTextualFormatInReport;
- (BOOL)isUrgent;
- (BOOL)isWSBased;
- (BOOL)omitSensitiveStrings;
- (BOOL)omitThirdPartyProcessStacks;
- (BOOL)sanitizePaths;
- (BOOL)shouldSymbolicate;
- (BOOL)shouldUseBulkSymbolication;
- (BOOL)targetProcessIsThirdParty;
- (BOOL)useDsymForUUIDForEverything;
- (NSArray)dsymPaths;
- (NSArray)findDsymsForIDs;
- (NSString)customOutput;
- (NSString)durationNote;
- (NSString)event;
- (NSString)eventNote;
- (NSString)hardwareModel;
- (NSString)reason;
- (NSString)signature;
- (NSString)stepsNote;
- (NSString)targetProcessAbsolutePath;
- (NSString)targetProcessAdamId;
- (NSString)targetProcessBundleId;
- (NSString)targetProcessBundleName;
- (NSString)targetProcessName;
- (NSString)targetProcessVersion;
- (NSUUID)incidentUUID;
- (NSUUID)targetProcessMainBinaryUUID;
- (SASamplePrintOptions)printOptions;
- (SATimeRange)dataTimeRange;
- (SATimeRange)eventTimeRange;
- (SATimestamp)reportTimeEnd;
- (SATimestamp)reportTimeStart;
- (SPProcessEvent)init;
- (double)dataDuration;
- (double)eventDuration;
- (double)extraDuration;
- (double)overlapDuration;
- (double)targetProcessTimeOfLastResponse;
- (id)_samplePrinterForSampleStore:(id)a3;
- (int)numSamples;
- (int)numSamplesAvoidedDueToAudio;
- (int)numSamplesSuspended;
- (int)targetProcessId;
- (unint64_t)targetHIDEventEndMachAbs;
- (unint64_t)targetHIDEventMachAbs;
- (unint64_t)targetThreadId;
- (void)_performSamplePrinterWork:(id)a3;
- (void)_saveReportToStream:(__sFILE *)a3;
- (void)_saveReportToStream:(__sFILE *)a3 withSampleStore:(id)a4;
- (void)_setupSampleStore:(id)a3;
- (void)dealloc;
- (void)dropTransaction;
- (void)filterToStartTime:(id)a3 endTime:(id)a4;
- (void)filterToStartTimeIndex:(unint64_t)a3 endTimeIndex:(unint64_t)a4;
- (void)performSamplePrinterWork:(id)a3;
- (void)saveReportToStream:(__sFILE *)a3;
- (void)setCustomOutput:(id)a3;
- (void)setDataTimeRange:(id)a3;
- (void)setDsymPaths:(id)a3;
- (void)setDurationNote:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventNote:(id)a3;
- (void)setEventTimeRange:(id)a3;
- (void)setExtraDuration:(double)a3;
- (void)setFindDsymsForIDs:(id)a3;
- (void)setForceOneBasedTimeIndexes:(BOOL)a3;
- (void)setHeaderOnly:(BOOL)a3;
- (void)setIncidentUUID:(id)a3;
- (void)setIncludeBinaryFormatInReport:(BOOL)a3;
- (void)setIncludeTextualFormatInReport:(BOOL)a3;
- (void)setIsUrgent:(BOOL)a3;
- (void)setOmitSensitiveStrings:(BOOL)a3;
- (void)setOmitThirdPartyProcessStacks:(BOOL)a3;
- (void)setPrintOptions:(id)a3;
- (void)setReason:(id)a3;
- (void)setReportTimeEnd:(id)a3;
- (void)setReportTimeStart:(id)a3;
- (void)setSanitizePaths:(BOOL)a3;
- (void)setShouldSymbolicate:(BOOL)a3;
- (void)setShouldUseBulkSymbolication:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setStepsNote:(id)a3;
- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3;
- (void)setTargetHIDEventMachAbs:(unint64_t)a3;
- (void)setTargetProcessAbsolutePath:(id)a3;
- (void)setTargetThreadId:(unint64_t)a3;
- (void)setUseDsymForUUIDForEverything:(BOOL)a3;
- (void)takeTransaction;
@end

@implementation SPProcessEvent

- (void)takeTransaction
{
  if (!self->_transaction)
  {
    v3 = (void *)sub_10002E390("Process Event [%d]", self->_targetProcessId);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self->_transaction, (unint64_t *)&v4, (unint64_t)v3, memory_order_relaxed, memory_order_relaxed);
    if (v4)
    {
    }
  }
}

- (void)dropTransaction
{
  transaction = self->_transaction;
  if (transaction)
  {
    v3 = self->_transaction;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&self->_transaction, (unint64_t *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
    if (v3 == transaction) {
      _objc_release_x1();
    }
  }
}

- (SPProcessEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPProcessEvent;
  v2 = [(SPProcessEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_useDsymForUUIDForEverything = 0;
    v2->_includeTextualFormatInReport = 1;
    v2->_headerOnly = 0;
    v2->_printOptions = (SASamplePrintOptions *)objc_alloc_init((Class)SASamplePrintOptions);
    unsigned int v4 = byte_1000EBD0C;
    v3->_shouldSymbolicate = (byte_1000EBD0C & 8) != 0;
    v3->_shouldUseBulkSymbolication = ((v4 >> 4) & 1) == 0;
  }
  return v3;
}

- (void)dealloc
{
  p_targetProcessId = &self->_targetProcessId;
  if ((self->_targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v4 = *__error();
      v5 = sub_10002E548();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100093D0C(p_targetProcessId);
      }
      *__error() = v4;
    }
    if (byte_1000EBCF9) {
      BOOL v6 = dword_1000EB4A8 <= 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6) {
      goto LABEL_50;
    }
    int v7 = *__error();
    v8 = sub_10002E4E8(self->_targetProcessId);
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: dealloc with %p transaction", v8, self->_targetProcessId, self->_transaction);
    if (v9)
    {
      CFStringRef v10 = v9;
      CStringPtr = CFStringGetCStringPtr(v9, 0x8000100u);
      if (CStringPtr)
      {
        v12 = (char *)CStringPtr;
        v13 = 0;
      }
      else
      {
        v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x94DCECFAuLL);
        CFStringGetCString(v10, v12, 1024, 0x8000100u);
        v13 = v12;
      }
      if (qword_1000EBD00) {
        v23 = (FILE *)qword_1000EBD00;
      }
      else {
        v23 = __stderrp;
      }
      fprintf(v23, "%s\n", v12);
      if (v13) {
        free(v13);
      }
      CFStringRef v24 = v10;
LABEL_48:
      CFRelease(v24);
LABEL_49:
      *__error() = v7;
      goto LABEL_50;
    }
    v22 = sub_10002E548();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100093C78(p_targetProcessId);
    }
    goto LABEL_37;
  }
  if (byte_1000EBCF8)
  {
    int v14 = *__error();
    v15 = sub_10002E548();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100093E10((uint64_t)self, v15);
    }
    *__error() = v14;
  }
  if (byte_1000EBCF9) {
    BOOL v16 = dword_1000EB4A8 <= 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    int v7 = *__error();
    CFStringRef v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"dealloc with %p transaction", self->_transaction);
    if (v17)
    {
      CFStringRef v18 = v17;
      v19 = CFStringGetCStringPtr(v17, 0x8000100u);
      if (v19)
      {
        v20 = (char *)v19;
        v21 = 0;
      }
      else
      {
        v20 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x94DCECFAuLL);
        CFStringGetCString(v18, v20, 1024, 0x8000100u);
        v21 = v20;
      }
      if (qword_1000EBD00) {
        v33 = (FILE *)qword_1000EBD00;
      }
      else {
        v33 = __stderrp;
      }
      fprintf(v33, "%s\n", v20);
      if (v21) {
        free(v21);
      }
      CFStringRef v24 = v18;
      goto LABEL_48;
    }
    v25 = sub_10002E548();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_100093DA0((uint64_t)&self->_transaction, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_37:
    if (qword_1000EBD00) {
      v32 = (FILE *)qword_1000EBD00;
    }
    else {
      v32 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v32);
    goto LABEL_49;
  }
LABEL_50:
  [(SPProcessEvent *)self dropTransaction];

  processingQueue = self->_processingQueue;
  if (processingQueue) {
    dispatch_release(processingQueue);
  }
  exitSource = self->_exitSource;
  if (exitSource) {
    dispatch_release((dispatch_object_t)exitSource);
  }
  timeoutSource = self->_timeoutSource;
  if (timeoutSource) {
    dispatch_release((dispatch_object_t)timeoutSource);
  }

  completionCallbackQueue = self->_completionCallbackQueue;
  if (completionCallbackQueue)
  {
    dispatch_release(completionCallbackQueue);
    self->_completionCallbackQueue = 0;
  }
  id completionCallbackBlock = self->_completionCallbackBlock;
  if (completionCallbackBlock)
  {
    _Block_release(completionCallbackBlock);
    self->_id completionCallbackBlock = 0;
  }

  v39.receiver = self;
  v39.super_class = (Class)SPProcessEvent;
  [(SPProcessEvent *)&v39 dealloc];
}

- (int)numSamples
{
  if (self->_isSampling) {
    int numSamplesAtEnd = [(SPStackshotProvider *)self->_sampleProvider numSamples];
  }
  else {
    int numSamplesAtEnd = self->_numSamplesAtEnd;
  }
  return numSamplesAtEnd - self->_numSamplesAtStart;
}

- (int)numSamplesAvoidedDueToAudio
{
  if (self->_isSampling) {
    int numSamplesAvoidedDueToAudioAtEnd = [(SPStackshotProvider *)self->_sampleProvider numSamplesAvoidedDueToAudio];
  }
  else {
    int numSamplesAvoidedDueToAudioAtEnd = self->_numSamplesAvoidedDueToAudioAtEnd;
  }
  return numSamplesAvoidedDueToAudioAtEnd - self->_numSamplesAvoidedDueToAudioAtStart;
}

- (double)dataDuration
{
  dataTimeRange = self->_dataTimeRange;
  if (!dataTimeRange) {
    return 0.0;
  }
  id v4 = [(SATimeRange *)dataTimeRange startTime];
  id v5 = [(SATimeRange *)self->_dataTimeRange endTime];

  return sub_100060284(v4, v5);
}

- (double)eventDuration
{
  eventTimeRange = self->_eventTimeRange;
  if (!eventTimeRange) {
    return 0.0;
  }
  id v4 = [(SATimeRange *)eventTimeRange startTime];
  id v5 = [(SATimeRange *)self->_eventTimeRange endTime];

  return sub_100060284(v4, v5);
}

- (double)overlapDuration
{
  p_eventTimeRange = &self->_eventTimeRange;
  dataTimeRange = self->_dataTimeRange;
  eventTimeRange = self->_eventTimeRange;
  if (dataTimeRange)
  {
    p_dataTimeRange = &self->_dataTimeRange;
    id v7 = [(SATimeRange *)dataTimeRange startTime];
    if (eventTimeRange)
    {
      if (objc_msgSend(v7, "compare:", -[SATimeRange startTime](*p_eventTimeRange, "startTime")) == (id)-1) {
        v8 = (id *)p_eventTimeRange;
      }
      else {
        v8 = (id *)p_dataTimeRange;
      }
      id v7 = [*v8 startTime];
      if ([-[SATimeRange endTime](*p_dataTimeRange, "endTime") compare:-[SATimeRange endTime](*p_eventTimeRange, "endTime")] != (id)1)p_eventTimeRange = p_dataTimeRange; {
    }
      }
    else
    {
      p_eventTimeRange = p_dataTimeRange;
    }
  }
  else
  {
    if (!eventTimeRange) {
      return 0.0;
    }
    id v7 = [(SATimeRange *)self->_eventTimeRange startTime];
  }
  id v9 = [(SATimeRange *)*p_eventTimeRange endTime];

  return sub_100060284(v7, v9);
}

- (void)filterToStartTimeIndex:(unint64_t)a3 endTimeIndex:(unint64_t)a4
{
  self->_startTimeIndex = a3;
  self->_endTimeIndex = a4;
}

- (void)filterToStartTime:(id)a3 endTime:(id)a4
{
  self->_reportTimeStart = (SATimestamp *)a3;
  self->_reportTimeEnd = (SATimestamp *)a4;
}

- (void)_setupSampleStore:(id)a3
{
  p_int targetProcessId = (unsigned int *)&self->_targetProcessId;
  int targetProcessId = self->_targetProcessId;
  if (!a3)
  {
    if (targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v61 = *__error();
        v62 = sub_10002E548();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_10009400C(v62, v63, v64, v65, v66, v67, v68, v69);
        }
        *__error() = v61;
      }
      if (byte_1000EBCF9) {
        BOOL v70 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v70 = 0;
      }
      if (v70)
      {
        int v71 = *__error();
        CFStringRef v72 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s: nil sampleStore", "sampleStore");
        if (v72)
        {
          CFStringRef v86 = v72;
          CStringPtr = CFStringGetCStringPtr(v72, 0x8000100u);
          if (CStringPtr)
          {
            v88 = (char *)CStringPtr;
            v89 = 0;
          }
          else
          {
            v88 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x26185D76uLL);
            CFStringGetCString(v86, v88, 1024, 0x8000100u);
            v89 = v88;
          }
          if (qword_1000EBD00) {
            v96 = (FILE *)qword_1000EBD00;
          }
          else {
            v96 = __stderrp;
          }
          fprintf(v96, "%s\n", v88);
          if (v89) {
            free(v89);
          }
          CFRelease(v86);
        }
        else
        {
          v73 = sub_10002E548();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
            sub_100093F94(v73, v74, v75, v76, v77, v78, v79, v80);
          }
          if (qword_1000EBD00) {
            v81 = (FILE *)qword_1000EBD00;
          }
          else {
            v81 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v81);
        }
        *__error() = v71;
      }
      sub_10002E41C("-[SPProcessEvent _setupSampleStore:]", "SPProcessEvent.m", 267, "%s: nil sampleStore", v3, v4, v5, v6, (char)"sampleStore");
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v53 = *__error();
        v54 = sub_10002E548();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_100093F10();
        }
        *__error() = v53;
      }
      if (byte_1000EBCF9) {
        BOOL v55 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v55 = 0;
      }
      if (v55)
      {
        int v56 = *__error();
        v57 = sub_10002E4E8(*p_targetProcessId);
        CFStringRef v58 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: %s: nil sampleStore", v57, *p_targetProcessId, "sampleStore");
        if (v58)
        {
          CFStringRef v82 = v58;
          v83 = CFStringGetCStringPtr(v58, 0x8000100u);
          if (v83)
          {
            v84 = (char *)v83;
            v85 = 0;
          }
          else
          {
            v84 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x26185D76uLL);
            CFStringGetCString(v82, v84, 1024, 0x8000100u);
            v85 = v84;
          }
          if (qword_1000EBD00) {
            v90 = (FILE *)qword_1000EBD00;
          }
          else {
            v90 = __stderrp;
          }
          fprintf(v90, "%s\n", v84);
          if (v85) {
            free(v85);
          }
          CFRelease(v82);
        }
        else
        {
          v59 = sub_10002E548();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
            sub_100093E8C();
          }
          if (qword_1000EBD00) {
            v60 = (FILE *)qword_1000EBD00;
          }
          else {
            v60 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v60);
        }
        *__error() = v56;
      }
      char v91 = sub_10002E4E8(*p_targetProcessId);
      sub_10002E41C("-[SPProcessEvent _setupSampleStore:]", "SPProcessEvent.m", 267, "%s [%d]: %s: nil sampleStore", v92, v93, v94, v95, v91);
    }
    abort();
  }
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v11 = *__error();
      v12 = sub_10002E548();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = sub_10002E4E8(*p_targetProcessId);
        int v14 = *p_targetProcessId;
        *(_DWORD *)buf = 136446466;
        v104 = v13;
        __int16 v105 = 1024;
        int v106 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s [%d]: Generating report", buf, 0x12u);
      }
      *__error() = v11;
    }
    if (byte_1000EBCF9) {
      BOOL v15 = dword_1000EB4A8 <= 1;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15) {
      goto LABEL_48;
    }
    int v16 = *__error();
    CFStringRef v17 = sub_10002E4E8(*p_targetProcessId);
    CFStringRef v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Generating report", v17, *p_targetProcessId);
    if (v18)
    {
      CFStringRef v19 = v18;
      v20 = CFStringGetCStringPtr(v18, 0x8000100u);
      if (v20)
      {
        v21 = (char *)v20;
        v22 = 0;
      }
      else
      {
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x166466F8uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      uint64_t v31 = qword_1000EBD00;
      v32 = __stderrp;
LABEL_41:
      if (v31) {
        v35 = (FILE *)v31;
      }
      else {
        v35 = v32;
      }
      fprintf(v35, "%s\n", v21);
      if (v22) {
        free(v22);
      }
      CFRelease(v19);
      goto LABEL_47;
    }
    uint64_t v28 = sub_10002E548();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      sub_100094084();
    }
    uint64_t v29 = qword_1000EBD00;
    uint64_t v30 = __stderrp;
    goto LABEL_35;
  }
  if (byte_1000EBCF8)
  {
    int v23 = *__error();
    CFStringRef v24 = sub_10002E548();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Generating report", buf, 2u);
    }
    *__error() = v23;
  }
  if (byte_1000EBCF9) {
    BOOL v25 = dword_1000EB4A8 <= 1;
  }
  else {
    BOOL v25 = 0;
  }
  if (v25)
  {
    int v16 = *__error();
    CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Generating report");
    if (v26)
    {
      CFStringRef v19 = v26;
      uint64_t v27 = CFStringGetCStringPtr(v26, 0x8000100u);
      if (v27)
      {
        v21 = (char *)v27;
        v22 = 0;
      }
      else
      {
        v21 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x166466F8uLL);
        CFStringGetCString(v19, v21, 1024, 0x8000100u);
        v22 = v21;
      }
      uint64_t v31 = qword_1000EBD00;
      v32 = __stderrp;
      goto LABEL_41;
    }
    v33 = sub_10002E548();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      sub_1000940FC();
    }
    uint64_t v29 = qword_1000EBD00;
    uint64_t v30 = __stderrp;
LABEL_35:
    if (v29) {
      v34 = (FILE *)v29;
    }
    else {
      v34 = v30;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v34);
LABEL_47:
    *__error() = v16;
  }
LABEL_48:
  if (self->_reason) {
    [a3 setReason:];
  }
  sub_10005EB20(a3, self->_shouldSymbolicate, self->_useDsymForUUIDForEverything, self->_shouldUseBulkSymbolication);
  stepsNote = self->_stepsNote;
  int numSamplesAvoidedDueToAudioAtStart = self->_numSamplesAvoidedDueToAudioAtStart;
  uint64_t v38 = (self->_numSamplesAvoidedDueToAudioAtEnd - numSamplesAvoidedDueToAudioAtStart);
  if ((int)v38 >= 1)
  {
    if (stepsNote) {
      objc_super v39 = +[NSString stringWithFormat:@"%@, %d samples avoided due to audio", self->_stepsNote, v38];
    }
    else {
      objc_super v39 = +[NSString stringWithFormat:@"%d samples avoided due to audio", (self->_numSamplesAvoidedDueToAudioAtEnd - numSamplesAvoidedDueToAudioAtStart), v97];
    }
    stepsNote = v39;
  }
  [a3 setTargetThreadId:0];
  if ((*p_targetProcessId & 0x80000000) == 0) {
    [a3 setTargetProcessId:];
  }
  if (self->_targetThreadId) {
    [a3 setTargetThreadId:];
  }
  if (self->_targetProcessAbsolutePath)
  {
    if ((objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinaryPath"), "isAbsolutePath") & 1) == 0)
    {
      id v40 = [a3 targetProcess];
      if (v40) {
        [v40 setMainBinaryPath:self->_targetProcessAbsolutePath];
      }
    }
  }
  [a3 setTargetHIDEventMachAbs:self->_targetHIDEventMachAbs];
  [a3 setTargetHIDEventEndMachAbs:self->_targetHIDEventEndMachAbs];
  if (self->_isLiveSampling) {
    [a3 setShouldGatherKextStat:!self->_headerOnly];
  }
  if (self->_dsymPaths) {
    +[SABinary addDsymPaths:](SABinary, "addDsymPaths:");
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  findDsymsForIDs = self->_findDsymsForIDs;
  id v42 = [(NSMutableArray *)findDsymsForIDs countByEnumeratingWithState:&v98 objects:v102 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v99;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v99 != v44) {
          objc_enumerationMutation(findDsymsForIDs);
        }
        [a3 useDsymForUUIDFor:*(void *)(*((void *)&v98 + 1) + 8 * i)];
      }
      id v43 = [(NSMutableArray *)findDsymsForIDs countByEnumeratingWithState:&v98 objects:v102 count:16];
    }
    while (v43);
  }
  [a3 postprocess];

  self->_targetProcessBundleName = (NSString *)[objc_msgSend(objc_msgSend(a3, "targetProcess"), "bundleName")];
  self->_targetProcessBundleId = (NSString *)[a3 targetProcess].bundleIdentifier;
  CFStringRef v46 = (const __CFString *)[[[a3 targetProcess] bundleShortVersion]];
  CFStringRef v47 = @"???";
  if (v46) {
    CFStringRef v48 = v46;
  }
  else {
    CFStringRef v48 = @"???";
  }
  CFStringRef v49 = (const __CFString *)[[objc_msgSend(a3, "targetProcess") bundleVersion];
  if (v49) {
    CFStringRef v47 = v49;
  }

  self->_targetProcessVersion = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@ (%@)", v48, v47];
  self->_targetProcessAdamId = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%llu", [objc_msgSend(objc_msgSend(a3, "targetProcess"), "adamID")]];

  self->_targetProcessName = (NSString *)[objc_msgSend(objc_msgSend(a3, "targetProcess"), "name")];
  self->_targetProcessMainBinaryUUID = (NSUUID *)[objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinary"), "uuid");

  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "targetProcess"), "mainBinaryPath"), "isAbsolutePath")) {
    v50 = (NSString *)[[[a3 targetProcess] mainBinaryPath];
  }
  else {
    v50 = 0;
  }
  self->_targetProcessAbsolutePath = v50;
  unsigned int v51 = [objc_msgSend(a3, "targetProcess") isUnresponsive];
  double v52 = 0.0;
  if (v51) {
    [objc_msgSend(a3, "targetProcess", 0.0) timeOfLastResponse];
  }
  self->_targetProcessTimeOfLastResponse = v52;

  self->_hardwareModel = (NSString *)[a3 hardwareModel];
  [a3 setEvent:self->_event];
  [a3 setEventNote:self->_eventNote];
  [a3 setEventTimeRange:self->_eventTimeRange];
  [a3 setSignature:self->_signature];
  [a3 setExtraDuration:self->_extraDuration];
  [a3 setDurationNote:self->_durationNote];
  [a3 setStepsNote:stepsNote];
  [a3 setSanitizePaths:self->_sanitizePaths];
  [a3 setCustomOutput:self->_customOutput];
}

- (id)_samplePrinterForSampleStore:(id)a3
{
  -[SPProcessEvent _setupSampleStore:](self, "_setupSampleStore:");
  id v5 = [objc_alloc((Class)SASamplePrinter) initWithSampleStore:a3];
  if (!v5)
  {
    int targetProcessId = self->_targetProcessId;
    p_int targetProcessId = &self->_targetProcessId;
    if (targetProcessId < 0)
    {
      if (byte_1000EBCF8)
      {
        int v21 = *__error();
        v22 = sub_10002E548();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100094254();
        }
        *__error() = v21;
      }
      if (byte_1000EBCF9) {
        BOOL v23 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v23 = 0;
      }
      if (!v23) {
        return 0;
      }
      int v13 = *__error();
      CFStringRef v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Unable to create sample printer");
      if (v24)
      {
        CFStringRef v25 = v24;
        CStringPtr = CFStringGetCStringPtr(v24, 0x8000100u);
        if (CStringPtr)
        {
          uint64_t v27 = (char *)CStringPtr;
          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v27 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAD597AAEuLL);
          CFStringGetCString(v25, v27, 1024, 0x8000100u);
          uint64_t v28 = v27;
        }
        if (qword_1000EBD00) {
          v34 = (FILE *)qword_1000EBD00;
        }
        else {
          v34 = __stderrp;
        }
        fprintf(v34, "%s\n", v27);
        if (v28) {
          free(v28);
        }
        CFStringRef v31 = v25;
        goto LABEL_65;
      }
      v32 = sub_10002E548();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        sub_100094220();
      }
    }
    else
    {
      if (byte_1000EBCF8)
      {
        int v10 = *__error();
        int v11 = sub_10002E548();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000941A8();
        }
        *__error() = v10;
      }
      if (byte_1000EBCF9) {
        BOOL v12 = dword_1000EB4A8 <= 3;
      }
      else {
        BOOL v12 = 0;
      }
      if (!v12) {
        return 0;
      }
      int v13 = *__error();
      int v14 = sub_10002E4E8(*p_targetProcessId);
      CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Unable to create sample printer", v14, *p_targetProcessId);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFStringRef v17 = CFStringGetCStringPtr(v15, 0x8000100u);
        if (v17)
        {
          CFStringRef v18 = (char *)v17;
          CFStringRef v19 = 0;
        }
        else
        {
          CFStringRef v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAD597AAEuLL);
          CFStringGetCString(v16, v18, 1024, 0x8000100u);
          CFStringRef v19 = v18;
        }
        if (qword_1000EBD00) {
          uint64_t v30 = (FILE *)qword_1000EBD00;
        }
        else {
          uint64_t v30 = __stderrp;
        }
        fprintf(v30, "%s\n", v18);
        if (v19) {
          free(v19);
        }
        CFStringRef v31 = v16;
LABEL_65:
        CFRelease(v31);
LABEL_66:
        *__error() = v13;
        return 0;
      }
      uint64_t v29 = sub_10002E548();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_100094130();
      }
    }
    if (qword_1000EBD00) {
      v33 = (FILE *)qword_1000EBD00;
    }
    else {
      v33 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v33);
    goto LABEL_66;
  }
  uint64_t v6 = v5;
  [v5 setOptions:self->_printOptions];
  if (self->_includeBinaryFormatInReport) {
    goto LABEL_3;
  }
  if (self->_headerOnly) {
    goto LABEL_19;
  }
  if (![(SASamplePrintOptions *)self->_printOptions printHeavyStacks])
  {
LABEL_3:
    int v7 = 1;
  }
  else
  {
    if (self->_headerOnly) {
      goto LABEL_19;
    }
    int v7 = 0;
  }
  [v6 setHeaderNote:sub_10004D904((int)-[SASamplePrintOptions printHeavyStacks](self->_printOptions, "printHeavyStacks"), v7)];
LABEL_19:
  [objc_msgSend(v6, "options") setPrintTargetThreadOnly:self->_headerOnly];
  [objc_msgSend(v6, "options") setDisplayFooter:!self->_headerOnly];
  [v6 setShareWithAppDevs:AppAnalyticsEnabled()];
  if (*(_OWORD *)&self->_startTimeIndex == 0)
  {
    if (*(_OWORD *)&self->_reportTimeStart != 0) {
      [v6 filterToTimestampRangeStart:end:];
    }
  }
  else
  {
    [v6 filterToDisplayTimeIndexStart:end:];
  }
  [objc_msgSend(v6, "options") setForceOneBasedTimeIndexes:self->_forceOneBasedTimeIndexes];
  if (self->_incidentUUID) {
    [v6 setIncidentUUID:];
  }

  return v6;
}

- (void)_saveReportToStream:(__sFILE *)a3 withSampleStore:(id)a4
{
  [(SPProcessEvent *)self _setupSampleStore:a4];
  if (self->_includeTextualFormatInReport) {
    [[-[SPProcessEvent _samplePrinterForSampleStore:](self, "_samplePrinterForSampleStore:", a4) printToStream:a3];
  }
  if (self->_includeBinaryFormatInReport)
  {
    if (self->_includeTextualFormatInReport)
    {
      v8 = "\n\n";
      size_t v9 = 2;
    }
    else
    {
      v8 = "Use spindump -i to generate textual report\n";
      size_t v9 = 43;
    }
    fwrite(v8, v9, 1uLL, a3);
    if (([a4 saveBinaryFormatToStream:a3] & 1) == 0)
    {
      p_int targetProcessId = &self->_targetProcessId;
      if (self->_targetProcessId < 0)
      {
        if (byte_1000EBCF8)
        {
          int v20 = *__error();
          int v21 = sub_10002E548();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100094458();
          }
          *__error() = v20;
        }
        if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
        {
          int v13 = *__error();
          CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Unable to save spindump binary format");
          if (v22)
          {
            CFStringRef v23 = v22;
            CStringPtr = CFStringGetCStringPtr(v22, 0x8000100u);
            if (CStringPtr)
            {
              CFStringRef v25 = (char *)CStringPtr;
              CFStringRef v26 = 0;
            }
            else
            {
              CFStringRef v25 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC90302E6uLL);
              CFStringGetCString(v23, v25, 1024, 0x8000100u);
              CFStringRef v26 = v25;
            }
            if (qword_1000EBD00) {
              v32 = (FILE *)qword_1000EBD00;
            }
            else {
              v32 = __stderrp;
            }
            fprintf(v32, "%s\n", v25);
            if (v26) {
              free(v26);
            }
            CFStringRef v29 = v23;
            goto LABEL_49;
          }
          uint64_t v30 = sub_10002E548();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
            sub_100094424();
          }
LABEL_38:
          if (qword_1000EBD00) {
            CFStringRef v31 = (FILE *)qword_1000EBD00;
          }
          else {
            CFStringRef v31 = __stderrp;
          }
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v31);
          goto LABEL_50;
        }
      }
      else
      {
        if (byte_1000EBCF8)
        {
          int v11 = *__error();
          BOOL v12 = sub_10002E548();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000943AC();
          }
          *__error() = v11;
        }
        if (byte_1000EBCF9 && dword_1000EB4A8 <= 3)
        {
          int v13 = *__error();
          int v14 = sub_10002E4E8(*p_targetProcessId);
          CFStringRef v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Unable to save spindump binary format", v14, *p_targetProcessId);
          if (v15)
          {
            CFStringRef v16 = v15;
            CFStringRef v17 = CFStringGetCStringPtr(v15, 0x8000100u);
            if (v17)
            {
              CFStringRef v18 = (char *)v17;
              CFStringRef v19 = 0;
            }
            else
            {
              CFStringRef v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC90302E6uLL);
              CFStringGetCString(v16, v18, 1024, 0x8000100u);
              CFStringRef v19 = v18;
            }
            if (qword_1000EBD00) {
              uint64_t v28 = (FILE *)qword_1000EBD00;
            }
            else {
              uint64_t v28 = __stderrp;
            }
            fprintf(v28, "%s\n", v18);
            if (v19) {
              free(v19);
            }
            CFStringRef v29 = v16;
LABEL_49:
            CFRelease(v29);
LABEL_50:
            *__error() = v13;
            goto LABEL_51;
          }
          uint64_t v27 = sub_10002E548();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
            sub_100094334();
          }
          goto LABEL_38;
        }
      }
    }
  }
LABEL_51:
  +[SABinary clearCoreSymbolicationCaches];
  int targetProcessId = self->_targetProcessId;
  v33 = &self->_targetProcessId;
  if ((targetProcessId & 0x80000000) == 0)
  {
    if (byte_1000EBCF8)
    {
      int v35 = *__error();
      v36 = sub_10002E548();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = sub_10002E4E8(*v33);
        int v38 = *v33;
        *(_DWORD *)buf = 136446466;
        v62 = v37;
        __int16 v63 = 1024;
        int v64 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}s [%d]: Done generating report", buf, 0x12u);
      }
      *__error() = v35;
    }
    if (byte_1000EBCF9) {
      BOOL v39 = dword_1000EB4A8 <= 1;
    }
    else {
      BOOL v39 = 0;
    }
    if (!v39) {
      goto LABEL_100;
    }
    int v40 = *__error();
    v41 = sub_10002E4E8(*v33);
    CFStringRef v42 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s [%d]: Done generating report", v41, *v33);
    if (v42)
    {
      CFStringRef v43 = v42;
      uint64_t v44 = CFStringGetCStringPtr(v42, 0x8000100u);
      if (v44)
      {
        v45 = (char *)v44;
        CFStringRef v46 = 0;
      }
      else
      {
        v45 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4FAF13AuLL);
        CFStringGetCString(v43, v45, 1024, 0x8000100u);
        CFStringRef v46 = v45;
      }
      if (qword_1000EBD00) {
        int v56 = (FILE *)qword_1000EBD00;
      }
      else {
        int v56 = __stderrp;
      }
      fprintf(v56, "%s\n", v45);
      if (v46) {
        free(v46);
      }
      CFStringRef v57 = v43;
LABEL_98:
      CFRelease(v57);
LABEL_99:
      *__error() = v40;
      goto LABEL_100;
    }
    BOOL v55 = sub_10002E548();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      sub_100094288();
    }
    goto LABEL_87;
  }
  if (byte_1000EBCF8)
  {
    int v47 = *__error();
    CFStringRef v48 = sub_10002E548();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Done generating report", buf, 2u);
    }
    *__error() = v47;
  }
  if (byte_1000EBCF9) {
    BOOL v49 = dword_1000EB4A8 <= 1;
  }
  else {
    BOOL v49 = 0;
  }
  if (v49)
  {
    int v40 = *__error();
    CFStringRef v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Done generating report");
    if (v50)
    {
      CFStringRef v51 = v50;
      double v52 = CFStringGetCStringPtr(v50, 0x8000100u);
      if (v52)
      {
        int v53 = (char *)v52;
        v54 = 0;
      }
      else
      {
        int v53 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x4FAF13AuLL);
        CFStringGetCString(v51, v53, 1024, 0x8000100u);
        v54 = v53;
      }
      if (qword_1000EBD00) {
        v60 = (FILE *)qword_1000EBD00;
      }
      else {
        v60 = __stderrp;
      }
      fprintf(v60, "%s\n", v53);
      if (v54) {
        free(v54);
      }
      CFStringRef v57 = v51;
      goto LABEL_98;
    }
    CFStringRef v58 = sub_10002E548();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
      sub_100094300();
    }
LABEL_87:
    if (qword_1000EBD00) {
      v59 = (FILE *)qword_1000EBD00;
    }
    else {
      v59 = __stderrp;
    }
    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v59);
    goto LABEL_99;
  }
LABEL_100:
}

- (void)_saveReportToStream:(__sFILE *)a3
{
}

- (void)saveReportToStream:(__sFILE *)a3
{
  [(SPProcessEvent *)self _saveReportToStream:a3];

  [(SPProcessEvent *)self dropTransaction];
}

- (void)performSamplePrinterWork:(id)a3
{
  [(SPProcessEvent *)self _performSamplePrinterWork:a3];
  [(SPProcessEvent *)self dropTransaction];
}

- (void)_performSamplePrinterWork:(id)a3
{
}

- (BOOL)targetProcessIsThirdParty
{
  targetProcessBundleId = self->_targetProcessBundleId;
  if (targetProcessBundleId && [(NSString *)targetProcessBundleId hasPrefix:@"com.apple."]) {
    return 0;
  }
  if (!self->_targetProcessAbsolutePath) {
    return 1;
  }
  uint64_t v5 = 0;
  do
  {
    unsigned __int8 v6 = [(NSString *)self->_targetProcessAbsolutePath hasPrefix:*(__CFString **)((char *)&off_1000DD8C8 + v5)];
    if (v6) {
      break;
    }
    BOOL v7 = v5 == 40;
    v5 += 8;
  }
  while (!v7);
  return v6 ^ 1;
}

- (int)targetProcessId
{
  return self->_targetProcessId;
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (NSUUID)targetProcessMainBinaryUUID
{
  return self->_targetProcessMainBinaryUUID;
}

- (NSString)targetProcessBundleName
{
  return self->_targetProcessBundleName;
}

- (NSString)targetProcessBundleId
{
  return self->_targetProcessBundleId;
}

- (NSString)targetProcessVersion
{
  return self->_targetProcessVersion;
}

- (NSString)targetProcessAbsolutePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetProcessAbsolutePath:(id)a3
{
}

- (NSString)targetProcessAdamId
{
  return self->_targetProcessAdamId;
}

- (unint64_t)targetThreadId
{
  return self->_targetThreadId;
}

- (void)setTargetThreadId:(unint64_t)a3
{
  self->_targetThreadId = a3;
}

- (unint64_t)targetHIDEventMachAbs
{
  return self->_targetHIDEventMachAbs;
}

- (void)setTargetHIDEventMachAbs:(unint64_t)a3
{
  self->_targetHIDEventMachAbs = a3;
}

- (unint64_t)targetHIDEventEndMachAbs
{
  return self->_targetHIDEventEndMachAbs;
}

- (void)setTargetHIDEventEndMachAbs:(unint64_t)a3
{
  self->_targetHIDEventEndMachAbs = a3;
}

- (double)targetProcessTimeOfLastResponse
{
  return self->_targetProcessTimeOfLastResponse;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (BOOL)isWSBased
{
  return self->_isWSBased;
}

- (BOOL)isUrgent
{
  return self->_isUrgent;
}

- (void)setIsUrgent:(BOOL)a3
{
  self->_isUrgent = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)dsymPaths
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDsymPaths:(id)a3
{
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
}

- (BOOL)includeBinaryFormatInReport
{
  return self->_includeBinaryFormatInReport;
}

- (void)setIncludeBinaryFormatInReport:(BOOL)a3
{
  self->_includeBinaryFormatInReport = a3;
}

- (BOOL)shouldSymbolicate
{
  return self->_shouldSymbolicate;
}

- (void)setShouldSymbolicate:(BOOL)a3
{
  self->_shouldSymbolicate = a3;
}

- (BOOL)shouldUseBulkSymbolication
{
  return self->_shouldUseBulkSymbolication;
}

- (void)setShouldUseBulkSymbolication:(BOOL)a3
{
  self->_shouldUseBulkSymbolication = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReason:(id)a3
{
}

- (int)numSamplesSuspended
{
  return self->_numSamplesSuspended;
}

- (BOOL)forceOneBasedTimeIndexes
{
  return self->_forceOneBasedTimeIndexes;
}

- (void)setForceOneBasedTimeIndexes:(BOOL)a3
{
  self->_forceOneBasedTimeIndexes = a3;
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setEvent:(id)a3
{
}

- (NSString)eventNote
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setEventNote:(id)a3
{
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSignature:(id)a3
{
}

- (double)extraDuration
{
  return self->_extraDuration;
}

- (void)setExtraDuration:(double)a3
{
  self->_extraDuration = a3;
}

- (NSString)durationNote
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDurationNote:(id)a3
{
}

- (NSString)stepsNote
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStepsNote:(id)a3
{
}

- (BOOL)sanitizePaths
{
  return self->_sanitizePaths;
}

- (void)setSanitizePaths:(BOOL)a3
{
  self->_sanitizePaths = a3;
}

- (BOOL)omitThirdPartyProcessStacks
{
  return self->_omitThirdPartyProcessStacks;
}

- (void)setOmitThirdPartyProcessStacks:(BOOL)a3
{
  self->_omitThirdPartyProcessStacks = a3;
}

- (BOOL)omitSensitiveStrings
{
  return self->_omitSensitiveStrings;
}

- (void)setOmitSensitiveStrings:(BOOL)a3
{
  self->_omitSensitiveStrings = a3;
}

- (BOOL)includeTextualFormatInReport
{
  return self->_includeTextualFormatInReport;
}

- (void)setIncludeTextualFormatInReport:(BOOL)a3
{
  self->_includeTextualFormatInReport = a3;
}

- (BOOL)headerOnly
{
  return self->_headerOnly;
}

- (void)setHeaderOnly:(BOOL)a3
{
  self->_headerOnly = a3;
}

- (NSString)customOutput
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setCustomOutput:(id)a3
{
}

- (NSUUID)incidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 336, 1);
}

- (void)setIncidentUUID:(id)a3
{
}

- (SATimeRange)eventTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 344, 1);
}

- (void)setEventTimeRange:(id)a3
{
}

- (SATimeRange)dataTimeRange
{
  return (SATimeRange *)objc_getProperty(self, a2, 352, 1);
}

- (void)setDataTimeRange:(id)a3
{
}

- (SATimestamp)reportTimeStart
{
  return (SATimestamp *)objc_getProperty(self, a2, 360, 1);
}

- (void)setReportTimeStart:(id)a3
{
}

- (SATimestamp)reportTimeEnd
{
  return (SATimestamp *)objc_getProperty(self, a2, 368, 1);
}

- (void)setReportTimeEnd:(id)a3
{
}

- (SASamplePrintOptions)printOptions
{
  return (SASamplePrintOptions *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPrintOptions:(id)a3
{
}

@end