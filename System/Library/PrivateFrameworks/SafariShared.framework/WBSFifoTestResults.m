@interface WBSFifoTestResults
+ (BOOL)createFifoAtFileURL:(id)a3 error:(id *)a4;
+ (id)readReportFromFifoHandle:(id)a3 error:(id *)a4;
- (NSFileHandle)fifoHandle;
- (NSURL)fifoURL;
- (WBSFifoTestResults)initWithFifoURL:(id)a3 error:(id *)a4;
- (void)_writeReportToFifo:(id)a3;
- (void)flushWithCompletionHandler:(id)a3;
- (void)reportActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9;
- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
- (void)reportPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
@end

@implementation WBSFifoTestResults

- (WBSFifoTestResults)initWithFifoURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSFifoTestResults;
  v7 = [(WBSFifoTestResults *)&v19 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_fifoURL, a3);
    id v9 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSFifoTestResults.%@.%p.internalQueue", objc_opt_class(), v8];
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    internalQueue = v8->_internalQueue;
    v8->_internalQueue = (OS_dispatch_queue *)v10;

    v12 = v8->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke;
    block[3] = &unk_1E5C8C920;
    v13 = v8;
    v17 = v13;
    id v18 = v6;
    dispatch_async(v12, block);
    v14 = v13;
  }
  return v8;
}

void __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v1 = (uint64_t *)(a1 + 40);
  id v9 = 0;
  uint64_t v3 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v2 error:&v9];
  id v4 = v9;
  uint64_t v5 = *(v1 - 1);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v3;

  if (*(void *)(*(v1 - 1) + 24)) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke_cold_1(v1, (uint64_t)v4, v8);
    }
  }
}

+ (BOOL)createFifoAtFileURL:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isFileURL] & 1) == 0)
  {
    if (!a4)
    {
LABEL_8:
      BOOL v9 = 0;
      goto LABEL_9;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28798];
    uint64_t v22 = *MEMORY[0x1E4F289B0];
    v23[0] = v5;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v14 = v17;
    uint64_t v15 = v18;
    uint64_t v16 = 45;
LABEL_7:
    *a4 = [v14 errorWithDomain:v15 code:v16 userInfo:v13];

    goto LABEL_8;
  }
  id v6 = [v5 path];
  BOOL v7 = (const char *)[v6 fileSystemRepresentation];

  int v8 = mkfifo(v7, 0x180u);
  BOOL v9 = v8 == 0;
  if (a4 && v8)
  {
    dispatch_queue_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28798];
    uint64_t v12 = *__error();
    uint64_t v20 = *MEMORY[0x1E4F289B0];
    id v21 = v5;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v14 = v10;
    uint64_t v15 = v11;
    uint64_t v16 = v12;
    goto LABEL_7;
  }
LABEL_9:

  return v9;
}

+ (id)readReportFromFifoHandle:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 fileDescriptor];
  if (WBSReadExactAmountOfBytesFromFileDescriptor() <= 0)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:0];
      int v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    [v5 fileDescriptor];
    id v6 = WBSReadExactAmountOfBytesFromFileDescriptorAsNSData();
    if (v6)
    {
      BOOL v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:a4];
      if (v7) {
        int v8 = [[WBSTestResultsReport alloc] initWithDictionaryRepresentation:v7];
      }
      else {
        int v8 = 0;
      }
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:0];
      int v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v8 = 0;
    }
  }
  return v8;
}

- (void)_writeReportToFifo:(id)a3
{
  if (self->_fifoHandle)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [a3 dictionaryRepresentation];
    id v12 = 0;
    id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v12];
    id v7 = v12;

    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      [(NSFileHandle *)self->_fifoHandle fileDescriptor];
      uint64_t v11 = [v6 length];
      WBSWriteExactAmountOfBytesToFileDescriptor();
      objc_msgSend(v6, "bytes", v11);
      WBSWriteExactAmountOfBytesToFileDescriptor();
    }
    else
    {
      BOOL v9 = WBS_LOG_CHANNEL_PREFIXTest();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSFifoTestResults _writeReportToFifo:](v9);
      }
    }
  }
  else
  {
    dispatch_queue_t v10 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSFifoTestResults _writeReportToFifo:](v10);
    }
  }
}

- (void)reportActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a4;
  id v21 = (void *)[a3 copy];
  uint64_t v22 = (void *)[v20 copy];

  internalQueue = self->_internalQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __126__WBSFifoTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke;
  v31[3] = &unk_1E5C8CD48;
  v31[4] = self;
  id v32 = v21;
  id v33 = v22;
  id v34 = v15;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  id v29 = v22;
  id v30 = v21;
  dispatch_async(internalQueue, v31);
}

void __126__WBSFifoTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  id v2 = +[WBSTestResultsReport reportForActualResults:a1[5] expectedResults:a1[6] expectedResultsName:a1[7] uniformTypeIdentifier:a1[8] forStage:a1[9] forTest:a1[10] inBundle:a1[11]];
  [v1 _writeReportToFifo:v2];
}

- (void)reportPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[a3 copy];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WBSFifoTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke;
  block[3] = &unk_1E5C8CD70;
  void block[4] = self;
  id v20 = v13;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(internalQueue, block);
}

void __66__WBSFifoTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  id v2 = +[WBSTestResultsReport reportForPerformance:a1[5] forStage:a1[6] forTest:a1[7] inBundle:a1[8]];
  [v1 _writeReportToFifo:v2];
}

- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSFifoTestResults_reportError_forStage_forTest_inBundle___block_invoke;
  block[3] = &unk_1E5C8CD70;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(internalQueue, block);
}

void __60__WBSFifoTestResults_reportError_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  id v2 = +[WBSTestResultsReport reportForError:a1[5] forStage:a1[6] forTest:a1[7] inBundle:a1[8]];
  [v1 _writeReportToFifo:v2];
}

- (void)flushWithCompletionHandler:(id)a3
{
}

- (NSURL)fifoURL
{
  return self->_fifoURL;
}

- (NSFileHandle)fifoHandle
{
  return self->_fifoHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fifoHandle, 0);
  objc_storeStrong((id *)&self->_fifoURL, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __44__WBSFifoTestResults_initWithFifoURL_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Can't open fifo %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_writeReportToFifo:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "FIFO is not connected", v1, 2u);
}

- (void)_writeReportToFifo:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to serialize report", v1, 2u);
}

@end