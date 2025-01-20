@interface PFSharingRemaker
+ (id)remakerWithOperations:(id)a3 options:(id)a4;
- (NSArray)_operations;
- (PFSharingRemaker)init;
- (PFSharingRemakerOptions)_options;
- (double)_computeProgress;
- (id)_completionHandler;
- (id)_progressHandler;
- (void)_abortWithUnderlyingOperationError:(id)a3;
- (void)_callProgressBlockWithProgress:(double)a3;
- (void)_completeOperationWithUUID:(id)a3;
- (void)_configurePhotoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5;
- (void)_configureVideoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5;
- (void)_endSessionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_setCompletionHandler:(id)a3;
- (void)_setOperations:(id)a3;
- (void)_setOptions:(id)a3;
- (void)_setProgressHandler:(id)a3;
- (void)_updateProgress;
- (void)cancelRemaking;
- (void)remakeWithProgressHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation PFSharingRemaker

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__progressHandler, 0);
  objc_storeStrong((id *)&self->__operations, 0);
  objc_storeStrong((id *)&self->__options, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_remakeOperationQueue, 0);
  objc_storeStrong((id *)&self->_remakerError, 0);
  objc_storeStrong((id *)&self->_inProgressOperationByUUID, 0);

  objc_storeStrong((id *)&self->_remakerQueue, 0);
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setProgressHandler:(id)a3
{
}

- (id)_progressHandler
{
  return self->__progressHandler;
}

- (void)_setOperations:(id)a3
{
}

- (NSArray)_operations
{
  return self->__operations;
}

- (void)_setOptions:(id)a3
{
}

- (PFSharingRemakerOptions)_options
{
  return self->__options;
}

- (void)_abortWithUnderlyingOperationError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_abortedRemaker)
  {
    *(_WORD *)&self->_remakerSuccess = 256;
    v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    [v5 setObject:@"Underlying operation encountered an error" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFSharingRemakerErrorDomain" code:2 userInfo:v5];
    remakerError = self->_remakerError;
    self->_remakerError = v6;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PFSharingRemaker] Aborted with underlying operation error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    [(NSOperationQueue *)self->_remakeOperationQueue cancelAllOperations];
  }
}

- (void)_completeOperationWithUUID:(id)a3
{
  id v10 = [(NSMutableDictionary *)self->_inProgressOperationByUUID objectForKey:a3];
  id v4 = [v10 _videoOperation];
  v5 = [v10 _imageOperation];
  if (v4
    && [v4 isFinished]
    && ([v4 success] & 1) == 0
    && ![v4 isCancelled])
  {
    id v9 = [v4 operationError];
    [(PFSharingRemaker *)self _abortWithUnderlyingOperationError:v9];

    if (!v5) {
      goto LABEL_22;
    }
    char v6 = 1;
  }
  else
  {
    if (!v5) {
      goto LABEL_14;
    }
    char v6 = 0;
  }
  if ([v5 isFinished]
    && ([v5 success] & 1) == 0
    && ([v5 isCancelled] & 1) == 0)
  {
    int v8 = [v5 operationError];
    [(PFSharingRemaker *)self _abortWithUnderlyingOperationError:v8];
    goto LABEL_21;
  }
  if (v6) {
    goto LABEL_22;
  }
  if ([v5 isFinished] && objc_msgSend(v5, "success"))
  {
    v7 = [v5 resultingFileURL];
    [v10 _setImageOutputURL:v7];
  }
LABEL_14:
  if (v4 && [v4 isFinished] && objc_msgSend(v4, "success"))
  {
    int v8 = [v4 resultingFileURL];
    [v10 _setVideoOutputURL:v8];
LABEL_21:
  }
LABEL_22:
}

- (void)_configurePhotoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  id v10 = [(PFSharingRemaker *)self _options];
  unsigned int v29 = [v10 shouldStripAllMetadata];
  unsigned int v28 = [v10 shouldStripLocation];
  unsigned int v27 = [v10 shouldStripCaption];
  unsigned int v26 = [v10 shouldStripAccessibilityDescription];
  uint64_t v11 = [v10 shouldConvertToSRGB];
  v12 = [v10 outputDirectoryURL];
  v13 = [v8 imageURL];
  v14 = [v13 absoluteString];
  uint64_t v15 = [v14 pathExtension];

  v16 = [v10 outputFilename];
  v17 = v16;
  v25 = (void *)v15;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [NSString stringWithFormat:@"%@.%@", v9, v15, v15];
  }
  v31 = v18;

  v19 = [v10 customLocation];
  v20 = [v10 customDate];
  v21 = [v10 customCaption];
  v22 = [v10 customAccessibilityLabel];
  [v8 setShouldStripMetadata:v29];
  [v8 setShouldStripLocation:v28];
  [v8 setShouldStripCaption:v27];
  [v8 setShouldStripAccessibilityDescription:v26];
  [v8 setShouldConvertToSRGB:v11];
  [v8 setOutputDirectoryURL:v12];
  [v8 setOutputFilename:v31];
  [v8 setCustomLocation:v19];
  [v8 setCustomDate:v20];
  [v8 setCustomCaption:v21];
  [v8 setCustomAccessibilityLabel:v22];
  objc_initWeak(&location, self);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke;
  v32[3] = &unk_1E5B2DFC0;
  v32[4] = self;
  objc_copyWeak(&v35, &location);
  id v23 = v9;
  id v33 = v23;
  id v24 = v30;
  id v34 = v24;
  [v8 setCompletionBlock:v32];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E5B2DF98;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__PFSharingRemaker__configurePhotoOperation_withUUID_dispatchGroup___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _completeOperationWithUUID:*(void *)(a1 + 32)];

  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

- (void)_configureVideoOperation:(id)a3 withUUID:(id)a4 dispatchGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  val = self;
  id v34 = a5;
  id v10 = [(PFSharingRemaker *)self _options];
  unsigned int v30 = [v10 shouldStripAllMetadata];
  unsigned int v29 = [v10 shouldStripLocation];
  unsigned int v27 = [v10 shouldStripCaption];
  unsigned int v26 = [v10 shouldStripAccessibilityDescription];
  uint64_t v11 = [v10 outputDirectoryURL];
  v12 = [v10 outputFilename];
  v13 = v12;
  v32 = v9;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"%@.mov", v9];
  }
  uint64_t v15 = v14;

  v16 = [v10 customLocation];
  uint64_t v17 = [v10 customDate];
  id v18 = [v10 customCaption];
  uint64_t v19 = [v10 customAccessibilityLabel];
  uint64_t v20 = [v10 exportPreset];
  v21 = [v10 exportFileType];
  [v8 setShouldStripMetadata:v30];
  [v8 setShouldStripLocation:v29];
  [v8 setShouldStripCaption:v27];
  [v8 setShouldStripAccessibilityDescription:v26];
  [v8 setOutputDirectoryURL:v11];
  [v8 setOutputFilename:v15];
  [v8 setCustomLocation:v16];
  v31 = (void *)v17;
  [v8 setCustomDate:v17];
  [v8 setCustomCaption:v18];
  unsigned int v28 = (void *)v19;
  uint64_t v22 = v19;
  id v23 = (void *)v20;
  [v8 setCustomAccessibilityLabel:v22];
  [v8 setExportPreset:v20];
  [v8 setExportFileType:v21];
  objc_initWeak(&location, val);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke;
  v35[3] = &unk_1E5B2DFC0;
  v35[4] = val;
  objc_copyWeak(&v38, &location);
  id v24 = v32;
  id v36 = v24;
  id v25 = v34;
  id v37 = v25;
  [v8 setCompletionBlock:v35];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke_2;
  block[3] = &unk_1E5B2DF98;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__PFSharingRemaker__configureVideoOperation_withUUID_dispatchGroup___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _completeOperationWithUUID:*(void *)(a1 + 32)];

  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

- (void)_endSessionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PFSharingRemaker *)self _completionHandler];
  [(PFSharingRemaker *)self _setCompletionHandler:0];
  [(PFSharingRemaker *)self _setProgressHandler:0];
  dispatch_source_cancel((dispatch_source_t)self->_progressTimer);
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  [(NSMutableDictionary *)self->_inProgressOperationByUUID removeAllObjects];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFSharingRemaker] Ended session with success %@, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (v7) {
    ((void (**)(void, BOOL, id))v7)[2](v7, v4, v6);
  }
}

- (void)cancelRemaking
{
  remakerQueue = self->_remakerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PFSharingRemaker_cancelRemaking__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  void block[4] = self;
  dispatch_async(remakerQueue, block);
}

void __34__PFSharingRemaker_cancelRemaking__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _progressHandler];
  if (v2)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v4 = [*(id *)(a1 + 32) _completionHandler];
    BOOL v3 = v4 == 0;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 34) && !v3)
  {
    *(unsigned char *)(v5 + 34) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Remaking was cancelled";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"PFSharingRemakerErrorDomain" code:1 userInfo:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(*(void *)(a1 + 32) + 48) cancelAllOperations];
  }
}

- (void)_callProgressBlockWithProgress:(double)a3
{
  BOOL v4 = [(PFSharingRemaker *)self _progressHandler];
  if (v4)
  {
    uint64_t v5 = v4;
    v4[2](a3);
    BOOL v4 = v5;
  }
}

- (double)_computeProgress
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  double v3 = (double)(unint64_t)[(NSMutableDictionary *)self->_inProgressOperationByUUID count];
  inProgressOperationByUUID = self->_inProgressOperationByUUID;
  v7[1] = 3221225472;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[2] = __36__PFSharingRemaker__computeProgress__block_invoke;
  v7[3] = &unk_1E5B2DF70;
  v7[4] = &v8;
  *(double *)&v7[5] = 1.0 / v3;
  [(NSMutableDictionary *)inProgressOperationByUUID enumerateKeysAndObjectsUsingBlock:v7];
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __36__PFSharingRemaker__computeProgress__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  BOOL v4 = [v10 _videoOperation];
  double v5 = v4;
  if (v4)
  {
    [v4 progress];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + v6 * *(double *)(a1 + 40);
  }
  v7 = [v10 _imageOperation];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 progress];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + v9 * *(double *)(a1 + 40);
  }
}

- (void)_updateProgress
{
  if (!self->_progressTimer)
  {
    double v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_remakerQueue);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    double v5 = self->_progressTimer;
    if (v5)
    {
      dispatch_time_t v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v5, v6, 0xEE6B280uLL, 0x5F5E100uLL);
      objc_initWeak(&location, self);
      v7 = self->_progressTimer;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      id v10 = __35__PFSharingRemaker__updateProgress__block_invoke;
      uint64_t v11 = &unk_1E5B2DF48;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v7, &v8);
      dispatch_resume((dispatch_object_t)self->_progressTimer);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  [(PFSharingRemaker *)self _computeProgress];
  -[PFSharingRemaker _callProgressBlockWithProgress:](self, "_callProgressBlockWithProgress:");
}

void __35__PFSharingRemaker__updateProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgress];
}

- (void)remakeWithProgressHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  remakerQueue = self->_remakerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E5B2DF20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(remakerQueue, block);
}

void __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  [*(id *)(a1 + 32) _setProgressHandler:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setCompletionHandler:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) _options];

  if (!v2)
  {
    double v3 = objc_alloc_init(PFSharingRemakerOptions);
    [*(id *)(a1 + 32) _setOptions:v3];
  }
  id v33 = [*(id *)(a1 + 32) _options];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if ([v33 shouldStripLocation]) {
      BOOL v4 = @"YES";
    }
    else {
      BOOL v4 = @"NO";
    }
    id v34 = v4;
    if ([v33 shouldStripCaption]) {
      double v5 = @"YES";
    }
    else {
      double v5 = @"NO";
    }
    v32 = v5;
    if ([v33 shouldStripAccessibilityDescription]) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    v31 = v6;
    if ([v33 shouldStripAllMetadata]) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    if (objc_msgSend(v33, "shouldConvertToSRGB", v7)) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    id v9 = [v33 customLocation];
    id v10 = [v33 customDate];
    uint64_t v11 = [v33 customCaption];
    id v12 = [v33 customAccessibilityLabel];
    id v13 = [v33 outputDirectoryURL];
    uint64_t v14 = [v33 outputFilename];
    uint64_t v15 = [v33 exportPreset];
    v16 = [v33 exportFileType];
    *(_DWORD *)buf = 138415363;
    v42 = v34;
    __int16 v43 = 2112;
    v44 = v32;
    __int16 v45 = 2112;
    v46 = v31;
    __int16 v47 = 2112;
    uint64_t v48 = v30;
    __int16 v49 = 2112;
    v50 = v8;
    __int16 v51 = 2113;
    v52 = v9;
    __int16 v53 = 2113;
    v54 = v10;
    __int16 v55 = 2113;
    v56 = v11;
    __int16 v57 = 2113;
    v58 = v12;
    __int16 v59 = 2114;
    v60 = v13;
    __int16 v61 = 2114;
    v62 = v14;
    __int16 v63 = 2114;
    v64 = v15;
    __int16 v65 = 2114;
    v66 = v16;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFSharingRemaker] Beginning remake with options:\nshouldStripLocation: %@\nshouldStripCaption: %@\nshouldStripAccessibilityDescription: %@\nshouldStripAllMetadata: %@\nshouldConvertToSRGB: %@\ncustomLocation: %{private}@\ncustomDate: %{private}@\ncustomCaption: %{private}@\ncustomAccessibilityLabel: %{private}@\noutputDirectoryURL: %{public}@\noutputFilename: %{public}@\nexportPreset: %{public}@\nexportFileType: %{public}@\n", buf, 0x84u);
  }
  uint64_t v17 = dispatch_group_create();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = [*(id *)(a1 + 32) _operations];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    uint64_t v22 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v25 = [v24 _uuid];
        [*(id *)(*(void *)(a1 + 32) + 24) setObject:v24 forKeyedSubscript:v25];
        unsigned int v26 = [v24 _videoOperation];
        if (v26)
        {
          dispatch_group_enter(v17);
          [*(id *)(a1 + 32) _configureVideoOperation:v26 withUUID:v25 dispatchGroup:v17];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v26;
            _os_log_impl(&dword_1A41FE000, v22, OS_LOG_TYPE_INFO, "[PFSharingRemaker] Enqueued video operation: %@", buf, 0xCu);
          }
          [*(id *)(*(void *)(a1 + 32) + 48) addOperation:v26];
        }
        unsigned int v27 = [v24 _imageOperation];
        if (v27)
        {
          dispatch_group_enter(v17);
          [*(id *)(a1 + 32) _configurePhotoOperation:v27 withUUID:v25 dispatchGroup:v17];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v27;
            _os_log_impl(&dword_1A41FE000, v22, OS_LOG_TYPE_INFO, "[PFSharingRemaker] Enqueued photo operation: %@", buf, 0xCu);
          }
          [*(id *)(*(void *)(a1 + 32) + 48) addOperation:v27];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  [*(id *)(a1 + 32) _setOperations:0];
  [*(id *)(a1 + 32) _updateProgress];
  uint64_t v28 = *(void *)(a1 + 32);
  unsigned int v29 = *(NSObject **)(v28 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke_136;
  block[3] = &unk_1E5B2F5F0;
  void block[4] = v28;
  dispatch_group_notify(v17, v29, block);
}

uint64_t __64__PFSharingRemaker_remakeWithProgressHandler_completionHandler___block_invoke_136(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSessionWithSuccess:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32) error:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (PFSharingRemaker)init
{
  v11.receiver = self;
  v11.super_class = (Class)PFSharingRemaker;
  v2 = [(PFSharingRemaker *)&v11 init];
  if (v2)
  {
    double v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PFSharingRemaker.remakerQueue", v3);
    remakerQueue = v2->_remakerQueue;
    v2->_remakerQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inProgressOperationByUUID = v2->_inProgressOperationByUUID;
    v2->_inProgressOperationByUUID = v6;

    uint64_t v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    remakeOperationQueue = v2->_remakeOperationQueue;
    v2->_remakeOperationQueue = v8;

    [(NSOperationQueue *)v2->_remakeOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v2->_remakeOperationQueue setMaxConcurrentOperationCount:2];
  }
  return v2;
}

+ (id)remakerWithOperations:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PFSharingRemaker] initialized with remake operations: %@", (uint8_t *)&v11, 0xCu);
  }
  id v9 = (void *)[v7 copy];

  [v8 _setOptions:v9];
  [v8 _setOperations:v6];

  return v8;
}

@end