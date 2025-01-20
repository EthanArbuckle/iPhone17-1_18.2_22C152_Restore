@interface NTKDebugRadarArgonErrorReporterQueue
- (BOOL)canSubmitReports;
- (NSString)queueDirectoryPath;
- (NTKDebugRadarArgonErrorReporterQueue)initWithQueueDirectoryPath:(id)a3;
- (NTKFirstUnlockQueue)unlockQueue;
- (OS_dispatch_queue)queue;
- (void)_queue_deleteStagedReports;
- (void)_queue_handleEnqueuedReports;
- (void)enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5;
- (void)queue_enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5;
- (void)setCanSubmitReports:(BOOL)a3;
@end

@implementation NTKDebugRadarArgonErrorReporterQueue

- (NTKDebugRadarArgonErrorReporterQueue)initWithQueueDirectoryPath:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NTKDebugRadarArgonErrorReporterQueue;
  v5 = [(NTKDebugRadarArgonErrorReporterQueue *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    queueDirectoryPath = v5->_queueDirectoryPath;
    v5->_queueDirectoryPath = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanotimekit.facesupport.taptoradar", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v5);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke;
    aBlock[3] = &unk_1E62C0068;
    objc_copyWeak(&v21, &location);
    v11 = _Block_copy(aBlock);
    v12 = [[NTKFirstUnlockQueue alloc] initWithName:"com.apple.nanotimekit.facesupport.taptoradar.firstunlock"];
    unlockQueue = v5->_unlockQueue;
    v5->_unlockQueue = v12;

    v14 = v5->_unlockQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_3;
    v17[3] = &unk_1E62C3398;
    objc_copyWeak(&v19, &location);
    id v15 = v11;
    id v18 = v15;
    [(NTKFirstUnlockQueue *)v14 dispatch:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_2;
  block[3] = &unk_1E62BFF20;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanSubmitReports:1];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_handleEnqueuedReports");
}

void __67__NTKDebugRadarArgonErrorReporterQueue_initWithQueueDirectoryPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[a5 copy];
  v11 = [(NTKDebugRadarArgonErrorReporterQueue *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__NTKDebugRadarArgonErrorReporterQueue_enqueueReportWithTitle_description_attachmentURLs___block_invoke;
  v15[3] = &unk_1E62C32F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __90__NTKDebugRadarArgonErrorReporterQueue_enqueueReportWithTitle_description_attachmentURLs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enqueueReportWithTitle:description:attachmentURLs:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_queue_deleteStagedReports
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "LS of path %@ failed %@");
}

- (void)_queue_handleEnqueuedReports
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't find URLs at %@ - %@");
}

id __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2];
  id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

void __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_30(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) present];
  id v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      id v5 = "User chose to create bug report.";
LABEL_6:
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    id v5 = "User chose not to create bug report.";
    goto LABEL_6;
  }

  uint64_t v6 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_31;
  block[3] = &unk_1E62BFF20;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __68__NTKDebugRadarArgonErrorReporterQueue__queue_handleEnqueuedReports__block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deleteStagedReports");
}

- (void)queue_enqueueReportWithTitle:(id)a3 description:(id)a4 attachmentURLs:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NTKDebugRadarArgonErrorReporterQueue *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)[v10 copy];
  if ([v12 count])
  {
    id v43 = v8;
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [(id)v13 UUIDString];

    id v15 = [(NTKDebugRadarArgonErrorReporterQueue *)self queueDirectoryPath];
    id v16 = [v15 stringByAppendingPathComponent:v14];
    id v17 = [v16 stringByAppendingPathComponent:@"URLs"];
    id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v52 = 0;
    LOBYTE(v13) = [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v52];
    id v42 = v52;
    if (v13)
    {
      v36 = v15;
      v37 = self;
      v38 = v14;
      id v40 = v10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke;
      aBlock[3] = &unk_1E62C6858;
      v35 = v16;
      v51 = v16;
      id v19 = (void (**)(void *, void, __CFString *))_Block_copy(aBlock);
      ((void (**)(void *, id, __CFString *))v19)[2](v19, v43, @"title.utf8");
      v33 = v19;
      id v41 = v9;
      ((void (**)(void *, id, __CFString *))v19)[2](v19, v9, @"description.utf8");
      v34 = v17;
      v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v39 = v12;
      id obj = v12;
      uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v26 = [v25 lastPathComponent];
            v27 = [v20 URLByAppendingPathComponent:v26];
            id v45 = 0;
            char v28 = [v18 copyItemAtURL:v25 toURL:v27 error:&v45];
            id v29 = v45;
            if ((v28 & 1) == 0)
            {
              v30 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v54 = v25;
                __int16 v55 = 2112;
                v56 = v27;
                __int16 v57 = 2112;
                id v58 = v29;
                _os_log_error_impl(&dword_1BC5A9000, v30, OS_LOG_TYPE_ERROR, "Couldn't copy URL from %@ to %@ - %@", buf, 0x20u);
              }
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
        }
        while (v22);
      }

      [(NTKDebugRadarArgonErrorReporterQueue *)v37 _queue_handleEnqueuedReports];
      v31 = v51;
      id v10 = v40;
      id v9 = v41;
      id v14 = v38;
      id v12 = v39;
      id v16 = v35;
      id v15 = v36;
      id v17 = v34;
    }
    else
    {
      v31 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = v42;
        -[NTKDebugRadarArgonErrorReporterQueue queue_enqueueReportWithTitle:description:attachmentURLs:]();
        goto LABEL_17;
      }
    }
    v32 = v42;
LABEL_17:

    id v8 = v43;
  }
}

void __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 dataUsingEncoding:4];
  id v8 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
  if (([v7 writeToFile:v8 atomically:1] & 1) == 0)
  {
    id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke_cold_1();
    }
  }
}

- (NSString)queueDirectoryPath
{
  return self->_queueDirectoryPath;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NTKFirstUnlockQueue)unlockQueue
{
  return self->_unlockQueue;
}

- (BOOL)canSubmitReports
{
  return self->_canSubmitReports;
}

- (void)setCanSubmitReports:(BOOL)a3
{
  self->_canSubmitReports = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queueDirectoryPath, 0);
}

- (void)queue_enqueueReportWithTitle:description:attachmentURLs:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't create report for path %@ - %@");
}

void __96__NTKDebugRadarArgonErrorReporterQueue_queue_enqueueReportWithTitle_description_attachmentURLs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't write %@ to %@");
}

@end