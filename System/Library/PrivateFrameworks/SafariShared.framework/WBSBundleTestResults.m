@interface WBSBundleTestResults
- (NSURL)fileURL;
- (WBSBundleTestResults)initWithFileURL:(id)a3 error:(id *)a4;
- (void)endTest:(id)a3 inBundle:(id)a4;
- (void)flushWithCompletionHandler:(id)a3;
- (void)reportActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9;
- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
- (void)reportPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6;
@end

@implementation WBSBundleTestResults

- (WBSBundleTestResults)initWithFileURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (([v7 isFileURL] & 1) == 0)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v18.receiver = self;
  v18.super_class = (Class)WBSBundleTestResults;
  self = [(WBSBundleTestResults *)&v18 init];
  if (!self) {
    goto LABEL_7;
  }
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v7 path];
  int v10 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];

  if (!v10) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_fileURL, a3);
  id v11 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSFileTestsResults.%@.%p.internalQueue", objc_opt_class(), self];
  v12 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v11 UTF8String], 0);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pendingReports = self->_pendingReports;
  self->_pendingReports = v14;

  self = self;
  v16 = self;
LABEL_8:

  return v16;
}

- (void)endTest:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__WBSBundleTestResults_endTest_inBundle___block_invoke;
  block[3] = &unk_1E5C8CD20;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "safari_mapObjectsUsingBlock:", &__block_literal_global_8);
  id v17 = 0;
  v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v17];
  id v4 = v17;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    goto LABEL_7;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXTest();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (v3) {
      goto LABEL_7;
    }
LABEL_13:
    id v14 = v5;
    goto LABEL_11;
  }
  __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_2((uint64_t)v5, v7);
  if (!v3) {
    goto LABEL_13;
  }
LABEL_7:
  v8 = *(void **)(*(void *)(a1 + 32) + 24);
  id v9 = NSString;
  uint64_t v10 = [*(id *)(a1 + 40) identifier];
  id v11 = [*(id *)(a1 + 48) identifier];
  id v12 = [v9 stringWithFormat:@"%@_%@.plist", v10, v11];
  id v13 = [v8 URLByAppendingPathComponent:v12];

  id v16 = v5;
  LOBYTE(v10) = [v3 writeToURL:v13 options:0 error:&v16];
  id v14 = v16;

  if ((v10 & 1) == 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_1((uint64_t)v14, v15);
    }
  }

LABEL_11:
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

uint64_t __41__WBSBundleTestResults_endTest_inBundle___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)reportActualResults:(id)a3 expectedResults:(id)a4 expectedResultsName:(id)a5 uniformTypeIdentifier:(id)a6 forStage:(id)a7 forTest:(id)a8 inBundle:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a4;
  v21 = (void *)[a3 copy];
  v22 = (void *)[v20 copy];

  internalQueue = self->_internalQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __128__WBSBundleTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke;
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

void __128__WBSBundleTestResults_reportActualResults_expectedResults_expectedResultsName_uniformTypeIdentifier_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 16);
  id v2 = +[WBSTestResultsReport reportForActualResults:a1[5] expectedResults:a1[6] expectedResultsName:a1[7] uniformTypeIdentifier:a1[8] forStage:a1[9] forTest:a1[10] inBundle:a1[11]];
  [v1 addObject:v2];
}

- (void)reportPerformance:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[a3 copy];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSBundleTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke;
  block[3] = &unk_1E5C8CD70;
  block[4] = self;
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

void __68__WBSBundleTestResults_reportPerformance_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 16);
  id v2 = +[WBSTestResultsReport reportForPerformance:a1[5] forStage:a1[6] forTest:a1[7] inBundle:a1[8]];
  [v1 addObject:v2];
}

- (void)reportError:(id)a3 forStage:(id)a4 forTest:(id)a5 inBundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WBSBundleTestResults_reportError_forStage_forTest_inBundle___block_invoke;
    block[3] = &unk_1E5C8CD70;
    block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(internalQueue, block);
  }
}

void __62__WBSBundleTestResults_reportError_forStage_forTest_inBundle___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 16);
  id v2 = +[WBSTestResultsReport reportForError:a1[5] forStage:a1[6] forTest:a1[7] inBundle:a1[8]];
  [v1 addObject:v2];
}

- (void)flushWithCompletionHandler:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_pendingReports, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to write reports: %{private}@", (uint8_t *)&v2, 0xCu);
}

void __41__WBSBundleTestResults_endTest_inBundle___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize reports: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end