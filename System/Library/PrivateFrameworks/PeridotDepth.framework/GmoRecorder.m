@interface GmoRecorder
- (BOOL)isActive;
- (BOOL)isComplete;
- (BOOL)isStopped;
- (BOOL)setPathWith:(id)a3;
- (BOOL)startRequested;
- (BOOL)stopRequested;
- (NSString)currentRecDirPath;
- (NSString)fileNameWithExt;
- (NSString)fullFilePath;
- (NSString)recDirPath;
- (gmoRecorderStatusUpdateDelegate)delegate;
- (id)generateFileNameWithExtension:(id)a3 extensionStr:(id)a4;
- (id)init:(id)a3 recordType:(int)a4 recorderId:(unsigned int)a5 filePrefix:(id)a6 fileExt:(id)a7;
- (int64_t)currentRecLengthMs;
- (int64_t)recLenghMsRequested;
- (unint64_t)bytesWritten;
- (unint64_t)recordsRequested;
- (unint64_t)recordsWritten;
- (unsigned)recorderId;
- (void)addHeaderRec:(void *)a3;
- (void)addRec:(void *)a3;
- (void)addRecSize:(void *)a3 size:(unint64_t)a4 headerRec:(BOOL)a5;
- (void)addRecWithObject:(id)a3;
- (void)checkStopConditionsAndStop;
- (void)finish;
- (void)requestWithNumOfRecords:(unint64_t)a3;
- (void)requestWithRecordLengthMs:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startRec:(id)a3 addTimeStamp:(BOOL)a4 dirName:(id)a5;
- (void)stop;
- (void)stopAndCloseFile;
- (void)timersUpdate;
@end

@implementation GmoRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullFilePath, 0);
  objc_storeStrong((id *)&self->_fileNameWithExt, 0);
  objc_storeStrong((id *)&self->_currentRecDirPath, 0);
  objc_storeStrong((id *)&self->_recDirPath, 0);
  objc_storeStrong((id *)&self->_ext, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_csvTitle, 0);
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (unint64_t)recordsWritten
{
  return self->_recordsWritten;
}

- (unint64_t)recordsRequested
{
  return self->_recordsRequested;
}

- (int64_t)currentRecLengthMs
{
  return self->_currentRecLengthMs;
}

- (int64_t)recLenghMsRequested
{
  return self->_recLenghMsRequested;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)stopRequested
{
  return self->_stopRequested;
}

- (BOOL)startRequested
{
  return self->_startRequested;
}

- (NSString)fullFilePath
{
  return self->_fullFilePath;
}

- (NSString)fileNameWithExt
{
  return self->_fileNameWithExt;
}

- (NSString)currentRecDirPath
{
  return self->_currentRecDirPath;
}

- (NSString)recDirPath
{
  return self->_recDirPath;
}

- (unsigned)recorderId
{
  return self->_recorderId;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (gmoRecorderStatusUpdateDelegate *)a3;
}

- (gmoRecorderStatusUpdateDelegate)delegate
{
  return self->delegate;
}

- (void)finish
{
  [(GmoRecorder *)self stop];
  delegate = self->delegate;
  [(gmoRecorderStatusUpdateDelegate *)delegate gmoRecorderCompleteDelegate:self];
}

- (void)stop
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!self->_startRequested)
  {
    if (!self->_isActive) {
      return;
    }
    goto LABEL_5;
  }
  if (self->_isActive)
  {
LABEL_5:
    self->_stopRequested = 1;
    goto LABEL_6;
  }
  self->_BOOL startRequested = 0;
LABEL_6:
  [(gmoRecorderStatusUpdateDelegate *)self->delegate gmoRecorderStopRequestedDelegate:self];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int recorderId = self->_recorderId;
    int type_low = LOBYTE(self->_type);
    BOOL startRequested = self->_startRequested;
    BOOL isActive = self->_isActive;
    unint64_t recordsRequested = self->_recordsRequested;
    unint64_t recordsWritten = self->_recordsWritten;
    int64_t recLenghMsRequested = self->_recLenghMsRequested;
    int64_t currentRecLengthMs = self->_currentRecLengthMs;
    int v11 = 136317186;
    v12 = "-[GmoRecorder stop]";
    __int16 v13 = 1024;
    unsigned int v14 = recorderId;
    __int16 v15 = 1024;
    int v16 = type_low;
    __int16 v17 = 1024;
    BOOL v18 = startRequested;
    __int16 v19 = 1024;
    BOOL v20 = isActive;
    __int16 v21 = 2048;
    unint64_t v22 = recordsRequested;
    __int16 v23 = 2048;
    unint64_t v24 = recordsWritten;
    __int16 v25 = 2048;
    int64_t v26 = recLenghMsRequested;
    __int16 v27 = 2048;
    int64_t v28 = currentRecLengthMs;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ReqStop: recId: %d, Type: %d, Req: %d, Actv: %d,  recsReq: %lld, recWritten: %lld, recLegthReqMs: %ld, currRecLengthMs: %ld\n", (uint8_t *)&v11, 0x4Cu);
  }
  [(GmoRecorder *)self stopAndCloseFile];
}

- (void)stopAndCloseFile
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(_WORD *)&self->_BOOL isActive = 256;
  self->_BOOL startRequested = 0;
  self->_unint64_t recordsRequested = 0;
  file = self->_file;
  if (file)
  {
    int v4 = fclose(file);
    self->_file = 0;
    if (v4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        recDirPath = self->_recDirPath;
        int v13 = 136315394;
        unsigned int v14 = "-[GmoRecorder stopAndCloseFile]";
        __int16 v15 = 2112;
        unint64_t v16 = (unint64_t)recDirPath;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ERROR: Unable to close file: %@\n", (uint8_t *)&v13, 0x16u);
      }
      __assert_rtn("-[GmoRecorder stopAndCloseFile]", "GmoRecorder.mm", 412, "!\"REC:ERROR: Unable to close file\"");
    }
    v5 = fopen([(NSString *)self->_fullFilePath UTF8String], "rb");
    self->_file = v5;
    if (!v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_recDirPath;
        int v13 = 136315394;
        unsigned int v14 = "-[GmoRecorder stopAndCloseFile]";
        __int16 v15 = 2112;
        unint64_t v16 = (unint64_t)v11;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ERROR: File write check failed for: %@\n", (uint8_t *)&v13, 0x16u);
      }
      __assert_rtn("-[GmoRecorder stopAndCloseFile]", "GmoRecorder.mm", 428, "!\"REC:ERROR: File write check failed\"");
    }
    fseek(v5, 0, 2);
    uint64_t v6 = MEMORY[0x25A2D6600](self->_file);
    fclose(self->_file);
    self->_file = 0;
    unint64_t bytesWritten = self->_bytesWritten;
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (v6 != bytesWritten)
    {
      if (v8)
      {
        v12 = self->_recDirPath;
        int v13 = 136315906;
        unsigned int v14 = "-[GmoRecorder stopAndCloseFile]";
        __int16 v15 = 2048;
        unint64_t v16 = bytesWritten;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        BOOL v20 = v12;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ERROR: File size written do not match! Written: %lld, Actual size: %llu, path: %@\n", (uint8_t *)&v13, 0x2Au);
      }
      __assert_rtn("-[GmoRecorder stopAndCloseFile]", "GmoRecorder.mm", 434, "!\"REC:ERROR: File size written do not match!\"");
    }
    if (v8)
    {
      v9 = self->_recDirPath;
      int v13 = 136315906;
      unsigned int v14 = "-[GmoRecorder stopAndCloseFile]";
      __int16 v15 = 2048;
      unint64_t v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2112;
      BOOL v20 = v9;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:file: File written, Written: %lld, Actual size: %llu, path: %@\n", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)checkStopConditionsAndStop
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_isActive)
  {
    int64_t v3 = (self->_currentRecLengthMs / 1000);
    if (self->_secondsComplete < v3)
    {
      -[gmoRecorderStatusUpdateDelegate gmoRecorderStatusUpdateDelegate:secondsCompleted:](self->delegate, "gmoRecorderStatusUpdateDelegate:secondsCompleted:", self);
      self->_secondsComplete = v3;
    }
    unint64_t recordsRequested = self->_recordsRequested;
    if (recordsRequested && self->_recordsWritten >= recordsRequested
      || (int64_t v5 = self->_recLenghMsRequested) != 0 && self->_currentRecLengthMs >= v5
      || self->_stopRequested)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int recorderId = self->_recorderId;
        int type_low = LOBYTE(self->_type);
        BOOL isActive = self->_isActive;
        unint64_t recordsWritten = self->_recordsWritten;
        int64_t recLenghMsRequested = self->_recLenghMsRequested;
        int64_t currentRecLengthMs = self->_currentRecLengthMs;
        int v12 = 136316930;
        int v13 = "-[GmoRecorder checkStopConditionsAndStop]";
        __int16 v14 = 1024;
        unsigned int v15 = recorderId;
        __int16 v16 = 1024;
        int v17 = type_low;
        __int16 v18 = 1024;
        BOOL v19 = isActive;
        __int16 v20 = 2048;
        unint64_t v21 = recordsRequested;
        __int16 v22 = 2048;
        unint64_t v23 = recordsWritten;
        __int16 v24 = 2048;
        int64_t v25 = recLenghMsRequested;
        __int16 v26 = 2048;
        int64_t v27 = currentRecLengthMs;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:STOP: recId: %d, Type: %d, Actv: %d, recsReq: %lld, recWritten: %lld, recLegthReqMs: %ld, currRecLengthMs: %ld\n", (uint8_t *)&v12, 0x46u);
      }
      self->_isComplete = 1;
      [(GmoRecorder *)self stopAndCloseFile];
      [(gmoRecorderStatusUpdateDelegate *)self->delegate gmoRecorderCompleteDelegate:self];
    }
  }
}

- (void)timersUpdate
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_int64_t currentRecLengthMs = vcvtmd_s64_f64((v3 - self->_startTime) * 1000.0);
}

- (void)addRecWithObject:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(GmoRecorder *)self timersUpdate];
  [(GmoRecorder *)self checkStopConditionsAndStop];
  if (self->_isActive)
  {
    int type = self->_type;
    uint64_t v6 = 200;
    if (type != 1) {
      uint64_t v6 = 0;
    }
    if (type) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 100;
    }
    id v20 = 0;
    BOOL v8 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:v7 options:0 error:&v20];
    id v9 = v20;
    fullFilePath = self->_fullFilePath;
    id v19 = v9;
    [v8 writeToFile:fullFilePath options:1 error:&v19];
    id v11 = v19;

    ++self->_recordsWritten;
    unint64_t v12 = self->_bytesWritten + [v8 length];
    self->_unint64_t bytesWritten = v12;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int recorderId = self->_recorderId;
      int type_low = LOBYTE(self->_type);
      unint64_t recordsRequested = self->_recordsRequested;
      unint64_t recordsWritten = self->_recordsWritten;
      int64_t recLenghMsRequested = self->_recLenghMsRequested;
      int64_t currentRecLengthMs = self->_currentRecLengthMs;
      *(_DWORD *)buf = 136316930;
      __int16 v22 = "-[GmoRecorder addRecWithObject:]";
      __int16 v23 = 1024;
      unsigned int v24 = recorderId;
      __int16 v25 = 1024;
      int v26 = type_low;
      __int16 v27 = 2048;
      unint64_t v28 = recordsRequested;
      __int16 v29 = 2048;
      unint64_t v30 = recordsWritten;
      __int16 v31 = 2048;
      int64_t v32 = recLenghMsRequested;
      __int16 v33 = 2048;
      int64_t v34 = currentRecLengthMs;
      __int16 v35 = 2048;
      unint64_t v36 = v12;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ADD: recId: %d, Type: %d, recReq: %lld, recWritten: %lld, lengthReq: %ld [ms], currRecLength: %ld [ms], written %lld bytes\n", buf, 0x4Au);
    }
  }
}

- (void)addRecSize:(void *)a3 size:(unint64_t)a4 headerRec:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(GmoRecorder *)self timersUpdate];
  [(GmoRecorder *)self checkStopConditionsAndStop];
  if (self->_isActive)
  {
    if (self->_type)
    {
      if (a5) {
        return;
      }
      goto LABEL_4;
    }
    if (fwrite(a3, a4, 1uLL, self->_file) != 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        fullFilePath = self->_fullFilePath;
        int v10 = 136315394;
        id v11 = "-[GmoRecorder addRecSize:size:headerRec:]";
        __int16 v12 = 2112;
        int v13 = fullFilePath;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ERROR: Write to file failed: %@\n", (uint8_t *)&v10, 0x16u);
      }
      __assert_rtn("-[GmoRecorder addRecSize:size:headerRec:]", "GmoRecorder.mm", 284, "!\"REC:ERROR: Write to file failed\"");
    }
    self->_bytesWritten += a4;
    if (!a5) {
LABEL_4:
    }
      ++self->_recordsWritten;
  }
}

- (void)addHeaderRec:(void *)a3
{
}

- (void)addRec:(void *)a3
{
}

- (void)startRec:(id)a3 addTimeStamp:(BOOL)a4 dirName:(id)a5
{
  BOOL v6 = a4;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (self->_recordsRequested == self->_recLenghMsRequested) {
    __assert_rtn("-[GmoRecorder startRec:addTimeStamp:dirName:]", "GmoRecorder.mm", 191, "_recordsRequested ^ _recLenghMsRequested");
  }
  if (self->_startRequested && !self->_isActive && !self->_stopRequested)
  {
    int v10 = [(NSString *)self->_recDirPath stringByAppendingPathComponent:v9];
    currentRecDirPath = self->_currentRecDirPath;
    self->_currentRecDirPath = v10;

    __int16 v12 = [MEMORY[0x263F08850] defaultManager];
    int v13 = self->_currentRecDirPath;
    id v39 = 0;
    int v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v38 = v39;

    id v37 = [v38 description];
    if (v14)
    {
      self->_BOOL isActive = 1;
      self->_BOOL startRequested = 0;
      if (v6) {
        [(GmoRecorder *)self generateFileNameWithExtension:v8 extensionStr:self->_ext];
      }
      else {
      unsigned int v15 = [NSString stringWithFormat:@"%@.%@", v8, self->_ext];
      }
      fileNameWithExt = self->_fileNameWithExt;
      self->_fileNameWithExt = v15;

      __int16 v25 = [(NSString *)self->_currentRecDirPath stringByAppendingPathComponent:self->_fileNameWithExt];
      fullFilePath = self->_fullFilePath;
      self->_fullFilePath = v25;

      __int16 v27 = fopen([(NSString *)self->_fullFilePath UTF8String], "w");
      self->_file = v27;
      if (!v27)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = *__error();
          unint64_t v36 = [(NSString *)self->_fullFilePath UTF8String];
          *(_DWORD *)buf = 136315650;
          v41 = "-[GmoRecorder startRec:addTimeStamp:dirName:]";
          __int16 v42 = 1024;
          LODWORD(v43) = v35;
          WORD2(v43) = 2080;
          *(void *)((char *)&v43 + 6) = v36;
          _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:ERROR: %d Unable to create record: %s\n", buf, 0x1Cu);
        }
        perror("startRec: ERROR");
        __assert_rtn("-[GmoRecorder startRec:addTimeStamp:dirName:]", "GmoRecorder.mm", 224, "false");
      }
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      self->_startTime = v28;
      [(gmoRecorderStatusUpdateDelegate *)self->delegate gmoRecorderStartedDelegate:self];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int recorderId = self->_recorderId;
        int type_low = LOBYTE(self->_type);
        BOOL startRequested = self->_startRequested;
        BOOL isActive = self->_isActive;
        unint64_t recordsRequested = self->_recordsRequested;
        unint64_t recordsWritten = self->_recordsWritten;
        *(_DWORD *)buf = 136316674;
        v41 = "-[GmoRecorder startRec:addTimeStamp:dirName:]";
        __int16 v42 = 1024;
        LODWORD(v43) = recorderId;
        WORD2(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 6) = type_low;
        WORD5(v43) = 1024;
        HIDWORD(v43) = startRequested;
        *(_WORD *)v44 = 2048;
        *(void *)&v44[2] = recordsRequested;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = isActive;
        *(_WORD *)&v46[4] = 2048;
        *(void *)&v46[6] = recordsWritten;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:START: recId: %d, Type: %d, Req: %d, recReq: %lld, Actv: %d, recWritten: %lld\n", buf, 0x38u);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = self->_currentRecDirPath;
        unsigned int v17 = self->_recorderId;
        int v18 = LOBYTE(self->_type);
        BOOL v19 = self->_startRequested;
        BOOL v20 = self->_isActive;
        unint64_t v22 = self->_recordsRequested;
        unint64_t v21 = self->_recordsWritten;
        uint64_t v23 = [v37 UTF8String];
        *(_DWORD *)buf = 136317186;
        v41 = "-[GmoRecorder startRec:addTimeStamp:dirName:]";
        __int16 v42 = 2112;
        *(void *)&long long v43 = v16;
        WORD4(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 10) = v17;
        HIWORD(v43) = 1024;
        *(_DWORD *)v44 = v18;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v19;
        __int16 v45 = 2048;
        *(void *)v46 = v22;
        *(_WORD *)&v46[8] = 1024;
        *(_DWORD *)&v46[10] = v20;
        __int16 v47 = 2048;
        unint64_t v48 = v21;
        __int16 v49 = 2080;
        uint64_t v50 = v23;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:START:ERROR Error creating path: %@ for: recId: %d, Type: %d, Req: %d, recReq: %lld, Actv: %d, recWritten: %lld, error:%s\n", buf, 0x4Cu);
      }
      [(GmoRecorder *)self stop];
    }
  }
}

- (void)start
{
}

- (id)generateFileNameWithExtension:(id)a3 extensionStr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF910] date];
  id v9 = objc_opt_new();
  [v9 setDateFormat:@"yyyy-MM-dd"];
  int v10 = [v9 stringFromDate:v8];
  id v11 = [MEMORY[0x263EFF910] date];
  __int16 v12 = objc_opt_new();
  [v12 setDateFormat:@"HH-mm-ss"];
  int v13 = [v12 stringFromDate:v11];
  prefix = self->_prefix;
  if (v6) {
    [NSString stringWithFormat:@"%@_D%@_T%@%@.%@", prefix, v10, v13, v6, v7];
  }
  else {
  unsigned int v15 = [NSString stringWithFormat:@"%@_D%@_T%@.%@", prefix, v10, v13, v7];
  }

  return v15;
}

- (void)requestWithNumOfRecords:(unint64_t)a3
{
  if (!self->_isActive)
  {
    *(_WORD *)&self->_BOOL startRequested = 1;
    *(_WORD *)&self->_isStopped = 0;
    self->_startTime = 0.0;
    self->_secondsComplete = 0;
    self->_int64_t recLenghMsRequested = 0;
    self->_int64_t currentRecLengthMs = 0;
    self->_unint64_t recordsWritten = 0;
    self->_unint64_t bytesWritten = 0;
    self->_unint64_t recordsRequested = a3;
    [(gmoRecorderStatusUpdateDelegate *)self->delegate gmoRecorderStartRequestedDelegate:self];
  }
}

- (void)requestWithRecordLengthMs:(int64_t)a3
{
  if (!self->_isActive)
  {
    *(_WORD *)&self->_BOOL startRequested = 1;
    *(_WORD *)&self->_isStopped = 0;
    self->_startTime = 0.0;
    self->_secondsComplete = 0;
    *(_OWORD *)&self->_int64_t currentRecLengthMs = 0u;
    *(_OWORD *)&self->_unint64_t recordsWritten = 0u;
    self->_int64_t recLenghMsRequested = a3;
    [(gmoRecorderStatusUpdateDelegate *)self->delegate gmoRecorderStartRequestedDelegate:self];
  }
}

- (BOOL)setPathWith:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_recDirPath, a3);
  objc_storeStrong((id *)&self->_currentRecDirPath, a3);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v18 = 0;
  char v17 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v7 = v18;

  id v8 = [v7 description];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int recorderId = self->_recorderId;
    int type_low = LOBYTE(self->_type);
    BOOL startRequested = self->_startRequested;
    int64_t recLenghMsRequested = self->_recLenghMsRequested;
    BOOL isActive = self->_isActive;
    unint64_t recordsWritten = self->_recordsWritten;
    uint64_t v15 = [v8 UTF8String];
    *(_DWORD *)buf = 136317186;
    BOOL v20 = "-[GmoRecorder setPathWith:]";
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 1024;
    unsigned int v24 = recorderId;
    __int16 v25 = 1024;
    int v26 = type_low;
    __int16 v27 = 1024;
    BOOL v28 = startRequested;
    __int16 v29 = 2048;
    int64_t v30 = recLenghMsRequested;
    __int16 v31 = 1024;
    BOOL v32 = isActive;
    __int16 v33 = 2048;
    unint64_t v34 = recordsWritten;
    __int16 v35 = 2080;
    uint64_t v36 = v15;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:SETPATH: %@, recId: %d, Type: %d, Req: %d, lengthReg: %ld, Actv: %d, recWritten: %lld, error:%s\n", buf, 0x4Cu);
  }

  return v17;
}

- (id)init:(id)a3 recordType:(int)a4 recorderId:(unsigned int)a5 filePrefix:(id)a6 fileExt:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (!v12 || [v12 isEqualToString:&stru_270719A70]) {
    __assert_rtn("-[GmoRecorder init:recordType:recorderId:filePrefix:fileExt:]", "GmoRecorder.mm", 34, "recPath!=nullptr && ![recPath isEqualToString:@\"\"]");
  }
  self->_unsigned int recorderId = a5;
  self->_int type = a4;
  fileNameWithExt = self->_fileNameWithExt;
  self->_fileNameWithExt = (NSString *)&stru_270719A70;

  fullFilePath = self->_fullFilePath;
  self->_fullFilePath = (NSString *)&stru_270719A70;

  objc_storeStrong((id *)&self->_ext, a7);
  objc_storeStrong((id *)&self->_prefix, a6);
  self->_startTime = 0.0;
  self->_secondsComplete = 0;
  *(int64_t *)((char *)&self->_secondsComplete + 5) = 0;
  *(_OWORD *)&self->_int64_t recLenghMsRequested = 0u;
  *(_OWORD *)&self->_unint64_t recordsRequested = 0u;
  self->_unint64_t bytesWritten = 0;
  BOOL v17 = [(GmoRecorder *)self setPathWith:v12];
  BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v18)
    {
      int type_low = LOBYTE(self->_type);
      recDirPath = self->_recDirPath;
      int v25 = 136315650;
      int v26 = "-[GmoRecorder init:recordType:recorderId:filePrefix:fileExt:]";
      __int16 v27 = 1024;
      *(_DWORD *)BOOL v28 = type_low;
      *(_WORD *)&v28[4] = 2112;
      *(void *)&v28[6] = recDirPath;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:INIT: Type: %d, Path: %@\n", (uint8_t *)&v25, 0x1Cu);
    }
    __int16 v21 = self;
  }
  else
  {
    if (v18)
    {
      id v22 = self->_recDirPath;
      int v23 = LOBYTE(self->_type);
      int v25 = 136315650;
      int v26 = "-[GmoRecorder init:recordType:recorderId:filePrefix:fileExt:]";
      __int16 v27 = 2112;
      *(void *)BOOL v28 = v22;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = v23;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: REC:INIT:ERROR: Unable to use path: %@ for recorder type: %d\n", (uint8_t *)&v25, 0x1Cu);
    }
    __int16 v21 = 0;
  }

  return v21;
}

@end