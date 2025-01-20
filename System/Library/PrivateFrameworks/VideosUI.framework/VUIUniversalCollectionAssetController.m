@interface VUIUniversalCollectionAssetController
- (BOOL)contentAllowsCellularDownload;
- (BOOL)showDownloadingOnlyWhenWholeCollectionDownloads;
- (BOOL)supportsRedownloadingContent;
- (BOOL)supportsStartingDownload;
- (NSArray)assetControllers;
- (OS_dispatch_queue)completionDispatchQueueInternal;
- (VUIContentRating)contentRating;
- (VUIMediaEntityAssetControllerState)stateInternal;
- (VUIUniversalCollectionAssetController)initWithAssetControllers:(id)a3 completionCount:(unint64_t)a4 showDownloadingOnlyWhenWholeCollectionDownloads:(BOOL)a5;
- (VUIUniversalCollectionAssetController)initWithMediaItemCollection:(id)a3;
- (unint64_t)completionCount;
- (void)_updateDownloadStateAndNotifyListeners;
- (void)addAssetControllers:(id)a3;
- (void)cancelAndRemoveDownload;
- (void)dealloc;
- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6;
- (void)pauseDownload;
- (void)removeAssetControllers:(id)a3;
- (void)resumeDownload;
- (void)setAssetControllers:(id)a3;
- (void)setCompletionCount:(unint64_t)a3;
- (void)setCompletionDispatchQueue:(id)a3;
- (void)setCompletionDispatchQueueInternal:(id)a3;
- (void)setShowDownloadingOnlyWhenWholeCollectionDownloads:(BOOL)a3;
- (void)setStateInternal:(id)a3;
- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7;
@end

@implementation VUIUniversalCollectionAssetController

- (VUIUniversalCollectionAssetController)initWithMediaItemCollection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [v4 valueForProperty:*MEMORY[0x1E4F312B0]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = objc_msgSend(v4, "items", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[VUIUniversalAssetController alloc] initWithMPMediaItem:*(void *)(*((void *)&v17 + 1) + 8 * v11)];
        [v5 addObject:v12];
        if (v6) {
          [(VUIUniversalAssetController *)v12 setMpMediaItemCollection:v4];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v13 = [v4 items];
  uint64_t v14 = [v13 count];

  v15 = [(VUIUniversalCollectionAssetController *)self initWithAssetControllers:v5 completionCount:v14 showDownloadingOnlyWhenWholeCollectionDownloads:0];
  return v15;
}

- (VUIUniversalCollectionAssetController)initWithAssetControllers:(id)a3 completionCount:(unint64_t)a4 showDownloadingOnlyWhenWholeCollectionDownloads:(BOOL)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VUIUniversalCollectionAssetController;
  uint64_t v10 = [(VUIUniversalCollectionAssetController *)&v28 init];
  uint64_t v11 = v10;
  if (v10)
  {
    unint64_t v23 = a4;
    objc_storeStrong((id *)&v10->_completionDispatchQueueInternal, MEMORY[0x1E4F14428]);
    v12 = objc_alloc_init(VUIMediaEntityAssetControllerState);
    stateInternal = v11->_stateInternal;
    v11->_stateInternal = v12;

    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setStatus:0];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setDownloadProgress:-1.0];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setSupportsCancellation:1];
    [(VUIMediaEntityAssetControllerState *)v11->_stateInternal setSupportsPausing:1];
    v11->_showDownloadingOnlyWhenWholeCollectionDownloads = a5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v22 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v20 addObserver:v11 selector:sel__assetControllerDidChange_ name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:v19];

          [v19 setCompletionDispatchQueue:v11->_completionDispatchQueueInternal];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    objc_storeStrong((id *)&v11->_assetControllers, a3);
    v11->_completionCount = v23;
    [(VUIUniversalCollectionAssetController *)v11 _updateDownloadStateAndNotifyListeners];
    id v9 = v22;
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIUniversalCollectionAssetController;
  [(VUIUniversalCollectionAssetController *)&v4 dealloc];
}

- (BOOL)supportsStartingDownload
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) supportsStartingDownload])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsRedownloadingContent
{
  return 0;
}

- (BOOL)contentAllowsCellularDownload
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) contentAllowsCellularDownload])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = MEMORY[0x1E4F14428];
    id v4 = (id)MEMORY[0x1E4F14428];
  }
  id v6 = v4;
  [(VUIUniversalCollectionAssetController *)self setCompletionDispatchQueueInternal:v4];
}

- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7
{
  id v12 = a7;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 1;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__33;
  v30[4] = __Block_byref_object_dispose__33;
  id v31 = 0;
  dispatch_group_t v13 = dispatch_group_create();
  uint64_t v14 = +[VUIDownloadManager sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke;
  v22[3] = &unk_1E6DFD068;
  v22[4] = self;
  uint64_t v15 = v13;
  BOOL v27 = a3;
  BOOL v28 = a5;
  BOOL v29 = a6;
  unint64_t v23 = v15;
  long long v24 = v32;
  long long v25 = v30;
  int64_t v26 = a4;
  [v14 performBatchAddDownloadsWithBlock:v22];

  uint64_t v16 = [(VUIUniversalCollectionAssetController *)self completionDispatchQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_3;
  v18[3] = &unk_1E6DFD090;
  id v19 = v12;
  long long v20 = v32;
  v21 = v30;
  id v17 = v12;
  dispatch_group_notify(v15, v16, v18);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [*(id *)(a1 + 32) assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v8 = [v7 state];
        uint64_t v9 = [v8 status];

        long long v10 = [v7 state];
        uint64_t v11 = [v10 status];

        if (v11 == 4 && ([v7 allowsManualDownloadRenewal] & 1) == 0)
        {
          dispatch_group_t v13 = [v7 state];
          uint64_t v14 = [v13 downloadExpirationDate];

          if (v14) {
            int v12 = [MEMORY[0x1E4F1C9C8] shouldShowLabelForDownloadExpirationDate:v14];
          }
          else {
            int v12 = 0;
          }
        }
        else
        {
          int v12 = 0;
        }
        if (v9) {
          BOOL v15 = v12 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (!v15)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          uint64_t v16 = *(unsigned __int8 *)(a1 + 72);
          uint64_t v17 = *(unsigned __int8 *)(a1 + 73);
          uint64_t v18 = *(unsigned __int8 *)(a1 + 74);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2;
          v22[3] = &unk_1E6DFD040;
          uint64_t v19 = *(void *)(a1 + 64);
          uint64_t v24 = *(void *)(a1 + 56);
          long long v21 = *(_OWORD *)(a1 + 40);
          id v20 = (id)v21;
          long long v23 = v21;
          [v7 startDownloadAllowingCellular:v16 quality:v19 shouldMarkAsDeletedOnCancellationOrFailure:v17 prefer3DOrImmersiveDownload:v18 completion:v22];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
}

void __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v7 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24) && (a2 & 1) == 0)
  {
    *(unsigned char *)(v6 + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id, uint64_t, void))a6 + 2))(a6, 1, 0);
  }
}

- (void)pauseDownload
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) pauseDownload];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)resumeDownload
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resumeDownload];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)cancelAndRemoveDownload
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = self;
  uint64_t v4 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v10 = [v9 state];
        unint64_t v11 = [v10 status];

        if (v11 <= 5 && ((1 << v11) & 0x2E) != 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v13 = v3;
  }
  else
  {
    id v13 = [(VUIUniversalCollectionAssetController *)v19 assetControllers];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * j) cancelAndRemoveDownload];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)addAssetControllers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSArray *)self->_assetControllers mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412290;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v5, "indexOfObject:", v11, v18);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v5 addObject:v11];
          id v13 = VUIDefaultLogObject();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = v18;
          long long v25 = v11;
          id v14 = v13;
          uint64_t v15 = "VUIUniversalCollectionAssetController:: add assetController %@ to collectionAssetController";
        }
        else
        {
          [v5 replaceObjectAtIndex:v12 withObject:v11];
          id v13 = VUIDefaultLogObject();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          *(_DWORD *)buf = v18;
          long long v25 = v11;
          id v14 = v13;
          uint64_t v15 = "VUIUniversalCollectionAssetController:: replace assetController %@ to collectionAssetController";
        }
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
LABEL_12:

        uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v16 addObserver:self selector:sel__assetControllerDidChange_ name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:v11];

        [v11 setCompletionDispatchQueue:self->_completionDispatchQueueInternal];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v17 = (void *)[v5 copy];
  [(VUIUniversalCollectionAssetController *)self setAssetControllers:v17];
}

- (void)removeAssetControllers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  assetControllers = self->_assetControllers;
  id v5 = a3;
  uint64_t v6 = (void *)[(NSArray *)assetControllers mutableCopy];
  [v6 removeObjectsInArray:v5];

  long long v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v8 = [(NSArray *)self->_assetControllers count];
    int v10 = 134218240;
    NSUInteger v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = [v6 count];
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIUniversalCollectionAssetController:: removeAssetControllers, before: %lu, after: %lu", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = (void *)[v6 copy];
  [(VUIUniversalCollectionAssetController *)self setAssetControllers:v9];

  [(VUIUniversalCollectionAssetController *)self _updateDownloadStateAndNotifyListeners];
}

- (VUIContentRating)contentRating
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        NSUInteger v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) contentRating];
        unint64_t v9 = [v8 rank];
        if (v9 > [v5 rank])
        {
          id v10 = v8;

          id v5 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (VUIContentRating *)v5;
}

- (void)setCompletionCount:(unint64_t)a3
{
  if (self->_completionCount != a3)
  {
    self->_completionCount = a3;
    [(VUIUniversalCollectionAssetController *)self _updateDownloadStateAndNotifyListeners];
  }
}

- (void)_updateDownloadStateAndNotifyListeners
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  queue = [(VUIUniversalCollectionAssetController *)self completionDispatchQueueInternal];
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v40 = self;
  uint64_t v3 = [(VUIUniversalCollectionAssetController *)self assetControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (!v4)
  {
    v43 = 0;
    v44 = 0;
    uint64_t v42 = 0;
    uint64_t v6 = 0;
    goto LABEL_24;
  }
  uint64_t v5 = v4;
  v43 = 0;
  v44 = 0;
  uint64_t v42 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v57 != v7) {
        objc_enumerationMutation(v3);
      }
      unint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      id v10 = [v9 state];
      uint64_t v11 = [v10 status];

      if (v11)
      {
        long long v12 = [v9 state];
        uint64_t v13 = [v12 status];

        if (v13 != 4)
        {
          [v45 addObject:v9];
          continue;
        }
        [v46 addObject:v9];
        if (!_os_feature_enabled_impl()) {
          continue;
        }
        long long v14 = [v9 state];
        long long v15 = [v14 downloadExpirationDate];

        if (v15 && [MEMORY[0x1E4F1C9C8] shouldShowLabelForDownloadExpirationDate:v15])
        {
          id v16 = v15;

          v44 = v16;
        }
      }
      else
      {
        [v47 addObject:v9];
        if (!_os_feature_enabled_impl()) {
          continue;
        }
        uint64_t v17 = [v9 state];
        int v18 = [v17 downloadFailedDueToError];

        if (v18)
        {
          ++v6;
          continue;
        }
        uint64_t v19 = [v9 state];
        long long v15 = [v19 downloadExpirationDate];

        if (v15 && objc_msgSend(v15, "vui_isInThePast"))
        {
          ++v42;
          id v20 = v15;

          v43 = v20;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v56 objects:v63 count:16];
  }
  while (v5);
LABEL_24:

  long long v21 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  [(VUIMediaEntityAssetControllerState *)v21 setStatus:0];
  uint64_t v22 = v6 + v42 + [v46 count];
  BOOL showDownloadingOnlyWhenWholeCollectionDownloads = v40->_showDownloadingOnlyWhenWholeCollectionDownloads;
  uint64_t v24 = [v45 count];
  if (showDownloadingOnlyWhenWholeCollectionDownloads)
  {
    long long v25 = v43;
    long long v26 = v44;
    if (!v24 || v24 + v22 != v40->_completionCount)
    {
LABEL_27:
      uint64_t v27 = [v46 count];
      if (v27 == [(VUIUniversalCollectionAssetController *)v40 completionCount])
      {
        [(VUIMediaEntityAssetControllerState *)v21 setStatus:4];
        [(VUIMediaEntityAssetControllerState *)v21 setDownloadExpirationDate:v26];
      }
      else
      {
        [(VUIMediaEntityAssetControllerState *)v21 setStatus:0];
        if (v22 == v40->_completionCount) {
          v36 = v25;
        }
        else {
          v36 = 0;
        }
        if (v6) {
          BOOL v37 = v22 == v40->_completionCount;
        }
        else {
          BOOL v37 = 0;
        }
        [(VUIMediaEntityAssetControllerState *)v21 setDownloadFailedDueToError:v37];
        [(VUIMediaEntityAssetControllerState *)v21 setDownloadExpirationDate:v36];
        [(VUIMediaEntityAssetControllerState *)v21 setDownloadProgress:-1.0];
      }
      [(VUIMediaEntityAssetControllerState *)v21 setSupportsCancellation:1];
      [(VUIMediaEntityAssetControllerState *)v21 setSupportsPausing:1];
      goto LABEL_48;
    }
  }
  else
  {
    long long v25 = v43;
    long long v26 = v44;
    if (!v24) {
      goto LABEL_27;
    }
  }
  [(VUIMediaEntityAssetControllerState *)v21 setStatus:2];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v28 = v45;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v53;
    double v32 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        v34 = [*(id *)(*((void *)&v52 + 1) + 8 * j) state];
        [v34 downloadProgress];
        double v32 = v32 + v35;
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v30);
  }
  else
  {
    double v32 = 0.0;
  }

  -[VUIMediaEntityAssetControllerState setDownloadProgress:](v21, "setDownloadProgress:", (v32 + (double)(unint64_t)[v46 count])/ (double)-[NSArray count](v40->_assetControllers, "count"));
LABEL_48:
  [(VUIUniversalCollectionAssetController *)v40 setStateInternal:v21];
  if (v21)
  {
    v60 = @"VUIMediaEntityAssetControllerStateKey";
    v61 = v21;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  }
  else
  {
    v38 = 0;
  }
  objc_initWeak(&location, v40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__VUIUniversalCollectionAssetController__updateDownloadStateAndNotifyListeners__block_invoke;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v50, &location);
  id v49 = v38;
  id v39 = v38;
  dispatch_async(queue, block);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);
}

void __79__VUIUniversalCollectionAssetController__updateDownloadStateAndNotifyListeners__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:WeakRetained userInfo:*(void *)(a1 + 32)];
  }
}

- (unint64_t)completionCount
{
  return self->_completionCount;
}

- (NSArray)assetControllers
{
  return self->_assetControllers;
}

- (void)setAssetControllers:(id)a3
{
}

- (OS_dispatch_queue)completionDispatchQueueInternal
{
  return self->_completionDispatchQueueInternal;
}

- (void)setCompletionDispatchQueueInternal:(id)a3
{
}

- (VUIMediaEntityAssetControllerState)stateInternal
{
  return self->_stateInternal;
}

- (void)setStateInternal:(id)a3
{
}

- (BOOL)showDownloadingOnlyWhenWholeCollectionDownloads
{
  return self->_showDownloadingOnlyWhenWholeCollectionDownloads;
}

- (void)setShowDownloadingOnlyWhenWholeCollectionDownloads:(BOOL)a3
{
  self->_BOOL showDownloadingOnlyWhenWholeCollectionDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateInternal, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, 0);
  objc_storeStrong((id *)&self->_assetControllers, 0);
}

@end