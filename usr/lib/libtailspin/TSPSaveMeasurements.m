@interface TSPSaveMeasurements
- (NSMutableDictionary)timeSpentByPhases;
- (TSPSaveMeasurements)init;
- (double)lostTimePeriodAtStartSecs;
- (double)ratioTimePeriodCovered;
- (double)requestProcessingLatencySecs;
- (double)tailspinDurationSecs;
- (int64_t)fileSizeBytes;
- (unint64_t)_startRecordingTimeForPhase:(const char *)a3;
- (unint64_t)request_id;
- (void)_stopRecordingTimeForPhase:(const char *)a3;
- (void)recordLostTimePeriodAtStart:(unint64_t)a3;
- (void)recordRatioTimePeriodCovered:(double)a3;
- (void)recordRequestProcessingLatencySecsWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4;
- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4;
- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3;
- (void)setFileSizeBytes:(int64_t)a3;
- (void)startRecordingTimeForAugmentLoggingPhase:(BOOL)a3 collectOSLog:(BOOL)a4 scrubData:(BOOL)a5;
- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6;
- (void)startRecordingTimeForAugmentSymbolicatePhase;
- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4;
- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4;
- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3;
- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4;
- (void)stopRecordingTimeForAugmentSymbolicatePhase;
- (void)stopRecordingTimeForDumpRequestPhase:(id)a3;
- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3;
@end

@implementation TSPSaveMeasurements

- (TSPSaveMeasurements)init
{
  v12.receiver = self;
  v12.super_class = (Class)TSPSaveMeasurements;
  v2 = [(TSPSaveMeasurements *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_request_id = atomic_fetch_add(&qword_1EA52E280, 1uLL);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    timeSpentByPhases = v3->_timeSpentByPhases;
    v3->_timeSpentByPhases = (NSMutableDictionary *)v4;

    v3->_saveStandardChunksStartTimestampMCT = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->_ratioTimePeriodCovered = _Q0;
    v3->_lostTimePeriodAtStartSecs = -1.0;
  }
  return v3;
}

- (void)startRecordingTimeForDumpRequestPhase:(const char *)a3 pid:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = *__error();
  v8 = sub_1C86DE154();
  v9 = v8;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = "<unknown>";
    if (a3) {
      v11 = a3;
    }
    int v12 = 136446466;
    v13 = v11;
    __int16 v14 = 1024;
    int v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "DumpRequest", "Request from %{public}s [%d]", (uint8_t *)&v12, 0x12u);
  }

  *__error() = v7;
  [(TSPSaveMeasurements *)self _startRecordingTimeForPhase:"DumpRequest"];
}

- (void)stopRecordingTimeForDumpRequestPhase:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *__error();
  v6 = sub_1C86DE154();
  int v7 = v6;
  unint64_t request_id = self->_request_id;
  if (v4)
  {
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v13 = 138543362;
      id v14 = v4;
      v9 = "FAILED due to reason: %{public}@";
      v10 = v7;
      os_signpost_id_t v11 = request_id;
      uint32_t v12 = 12;
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1C86D7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "DumpRequest", v9, (uint8_t *)&v13, v12);
    }
  }
  else if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v13) = 0;
    v9 = "SUCCEEDED";
    v10 = v7;
    os_signpost_id_t v11 = request_id;
    uint32_t v12 = 2;
    goto LABEL_8;
  }

  *__error() = v5;
  [(TSPSaveMeasurements *)self _stopRecordingTimeForPhase:"DumpRequest"];
}

- (void)startRecordingTimeForSaveStandardChunksPhase:(const char *)a3 pid:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = *__error();
  v8 = sub_1C86DE154();
  v9 = v8;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    os_signpost_id_t v11 = "<unknown>";
    if (a3) {
      os_signpost_id_t v11 = a3;
    }
    int v12 = 136446466;
    int v13 = v11;
    __int16 v14 = 1024;
    int v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "SaveStandardChunks", "Save for '%{public}s [%d]", (uint8_t *)&v12, 0x12u);
  }

  *__error() = v7;
  self->_saveStandardChunksStartTimestampMCT = [(TSPSaveMeasurements *)self _startRecordingTimeForPhase:"SaveStandardChunks"];
}

- (void)stopRecordingTimeForSaveStandardChunksPhase:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = *__error();
  v6 = sub_1C86DE154();
  int v7 = v6;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = "FAILED";
    if (v3) {
      v9 = "SUCCEEDED";
    }
    int v10 = 136315138;
    os_signpost_id_t v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v7, OS_SIGNPOST_INTERVAL_END, request_id, "SaveStandardChunks", "%s", (uint8_t *)&v10, 0xCu);
  }

  *__error() = v5;
  [(TSPSaveMeasurements *)self _stopRecordingTimeForPhase:"SaveStandardChunks"];
}

- (void)recordTimeForSaveStandardChunksWithoutPostProcessing:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t saveStandardChunksStartTimestampMCT = self->_saveStandardChunksStartTimestampMCT;
  if (saveStandardChunksStartTimestampMCT) {
    BOOL v4 = saveStandardChunksStartTimestampMCT >= a3;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    int v7 = *__error();
    v8 = sub_1C86DE154();
    v9 = v8;
    os_signpost_id_t request_id = self->_request_id;
    if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      unint64_t v11 = self->_saveStandardChunksStartTimestampMCT;
      int v15 = 134349312;
      unint64_t v16 = v11;
      __int16 v17 = 2050;
      unint64_t v18 = a3;
      _os_signpost_emit_with_name_impl(&dword_1C86D7000, v9, OS_SIGNPOST_EVENT, request_id, "SaveStandardChunks_WithoutPostProcessing", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", (uint8_t *)&v15, 0x16u);
    }

    *__error() = v7;
    uint64_t v12 = NSNumber;
    unint64_t v13 = a3 - self->_saveStandardChunksStartTimestampMCT;
    if (qword_1EA52E768 != -1) {
      dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
    }
    __int16 v14 = [v12 numberWithDouble:*(double *)&qword_1EA52E760 * (double)v13 * 0.000000001];
    [(NSMutableDictionary *)self->_timeSpentByPhases setObject:v14 forKeyedSubscript:@"SaveStandardChunks_WithoutPostProcessing"];
  }
}

- (void)startRecordingTimeForAugmentPhase:(const char *)a3 pid:(int)a4 originalFd:(int)a5 dupFd:(int)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v11 = *__error();
  uint64_t v12 = sub_1C86DE154();
  unint64_t v13 = v12;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v15 = "<unknown>";
    int v16 = 136446978;
    if (a3) {
      int v15 = a3;
    }
    __int16 v17 = v15;
    __int16 v18 = 1024;
    int v19 = a4;
    __int16 v20 = 1024;
    int v21 = a5;
    __int16 v22 = 1024;
    int v23 = a6;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment", "Augment for %{public}s [%d], fd: %d, dup fd: %d", (uint8_t *)&v16, 0x1Eu);
  }

  *__error() = v11;
  [(TSPSaveMeasurements *)self _startRecordingTimeForPhase:"Augment"];
}

- (void)stopRecordingTimeForAugmentPhase:(BOOL)a3 finalSizeBytes:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = *__error();
  v8 = sub_1C86DE154();
  v9 = v8;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v11 = "FAILED";
    if (v5) {
      int v11 = "SUCCEEDED";
    }
    int v12 = 136315394;
    unint64_t v13 = v11;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v9, OS_SIGNPOST_INTERVAL_END, request_id, "Augment", "%s (final size: %{bytes}lld)", (uint8_t *)&v12, 0x16u);
  }

  *__error() = v7;
  [(TSPSaveMeasurements *)self _stopRecordingTimeForPhase:"Augment"];
  self->_fileSizeBytes = a4;
}

- (void)startRecordingTimeForAugmentLoggingPhase:(BOOL)a3 collectOSLog:(BOOL)a4 scrubData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v9 = *__error();
  int v10 = sub_1C86DE154();
  int v11 = v10;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13[0] = 67109632;
    v13[1] = v7;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_LoggingData", "os_signpost: %{BOOL}d\nos_log: %{BOOL}d\nscrub_data: %{BOOL}d", (uint8_t *)v13, 0x14u);
  }

  *__error() = v9;
  [(TSPSaveMeasurements *)self _startRecordingTimeForPhase:"Augment_LoggingData"];
}

- (void)stopRecordingTimeForAugmentLoggingPhase:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = *__error();
  BOOL v6 = sub_1C86DE154();
  BOOL v7 = v6;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = "FAILED";
    if (v3) {
      int v9 = "SUCCEEDED";
    }
    int v10 = 136315138;
    int v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v7, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_LoggingData", "%s", (uint8_t *)&v10, 0xCu);
  }

  *__error() = v5;
  [(TSPSaveMeasurements *)self _stopRecordingTimeForPhase:"Augment_LoggingData"];
}

- (void)startRecordingTimeForAugmentSymbolicatePhase
{
  int v3 = *__error();
  BOOL v4 = sub_1C86DE154();
  int v5 = v4;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, request_id, "Augment_Symbolicate", (const char *)&unk_1C86FACE1, v7, 2u);
  }

  *__error() = v3;
  [(TSPSaveMeasurements *)self _startRecordingTimeForPhase:"Augment_Symbolicate"];
}

- (void)stopRecordingTimeForAugmentSymbolicatePhase
{
  int v3 = *__error();
  BOOL v4 = sub_1C86DE154();
  int v5 = v4;
  os_signpost_id_t request_id = self->_request_id;
  if (request_id - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C86D7000, v5, OS_SIGNPOST_INTERVAL_END, request_id, "Augment_Symbolicate", (const char *)&unk_1C86FACE1, v7, 2u);
  }

  *__error() = v3;
  [(TSPSaveMeasurements *)self _stopRecordingTimeForPhase:"Augment_Symbolicate"];
}

- (void)recordRequestProcessingLatencySecsWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1EA52E768 != -1) {
    dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
  }
  self->_requestProcessingLatencySecs = *(double *)&qword_1EA52E760 * (double)(a4 - a3) * 0.000000001;
}

- (void)recordTailspinDurationWithStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4
{
  if (qword_1EA52E768 != -1) {
    dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
  }
  self->_tailspinDurationSecs = *(double *)&qword_1EA52E760 * (double)(a4 - a3) * 0.000000001;
}

- (void)recordRatioTimePeriodCovered:(double)a3
{
  self->_ratioTimePeriodCovered = a3;
}

- (void)recordLostTimePeriodAtStart:(unint64_t)a3
{
  if (qword_1EA52E768 != -1) {
    dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
  }
  self->_lostTimePeriodAtStartSecs = *(double *)&qword_1EA52E760 * (double)a3 * 0.000000001;
}

- (unint64_t)_startRecordingTimeForPhase:(const char *)a3
{
  BOOL v4 = [NSString stringWithUTF8String:a3];
  uint64_t v5 = mach_continuous_time();
  BOOL v6 = [NSNumber numberWithUnsignedLongLong:v5];
  [(NSMutableDictionary *)self->_timeSpentByPhases setObject:v6 forKeyedSubscript:v4];

  return v5;
}

- (void)_stopRecordingTimeForPhase:(const char *)a3
{
  id v10 = [NSString stringWithUTF8String:a3];
  uint64_t v4 = mach_continuous_time();
  uint64_t v5 = [(NSMutableDictionary *)self->_timeSpentByPhases objectForKeyedSubscript:v10];
  if (!v5) {
    sub_1C86F6550();
  }
  BOOL v6 = v5;
  uint64_t v7 = [v5 unsignedLongLongValue];
  v8 = NSNumber;
  if (qword_1EA52E768 != -1) {
    dispatch_once(&qword_1EA52E768, &unk_1F2318A20);
  }
  int v9 = [v8 numberWithDouble:*(double *)&qword_1EA52E760 * (double)(v4 - v7) * 0.000000001];
  [(NSMutableDictionary *)self->_timeSpentByPhases setObject:v9 forKeyedSubscript:v10];
}

- (unint64_t)request_id
{
  return self->_request_id;
}

- (NSMutableDictionary)timeSpentByPhases
{
  return self->_timeSpentByPhases;
}

- (double)tailspinDurationSecs
{
  return self->_tailspinDurationSecs;
}

- (double)ratioTimePeriodCovered
{
  return self->_ratioTimePeriodCovered;
}

- (double)requestProcessingLatencySecs
{
  return self->_requestProcessingLatencySecs;
}

- (double)lostTimePeriodAtStartSecs
{
  return self->_lostTimePeriodAtStartSecs;
}

- (int64_t)fileSizeBytes
{
  return self->_fileSizeBytes;
}

- (void)setFileSizeBytes:(int64_t)a3
{
  self->_fileSizeBytes = a3;
}

- (void).cxx_destruct
{
}

@end