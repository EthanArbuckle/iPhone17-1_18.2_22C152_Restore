@interface PEAdjustmentDataCacheEntry
+ (id)_resultHandlingQueue;
- (CGSize)inputSize;
- (NSString)editorBundleID;
- (OS_dispatch_group)group;
- (OS_dispatch_group)timeoutGroup;
- (PEAdjustmentDataCacheEntry)initWithAsset:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5;
- (PICompositionController)compositionController;
- (int64_t)disposition;
- (void)_load:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5;
- (void)deliverOn:(id)a3 completion:(id)a4;
- (void)setCompositionController:(id)a3;
- (void)setDisposition:(int64_t)a3;
- (void)setEditorBundleID:(id)a3;
- (void)setGroup:(id)a3;
- (void)setInputSize:(CGSize)a3;
- (void)setTimeoutGroup:(id)a3;
- (void)waitForResultsWithTimeout;
@end

@implementation PEAdjustmentDataCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_timeoutGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)setEditorBundleID:(id)a3
{
}

- (NSString)editorBundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_inputSize, &v3, 16, 1, 0);
}

- (CGSize)inputSize
{
  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDisposition:(int64_t)a3
{
  self->_disposition = a3;
}

- (int64_t)disposition
{
  return self->_disposition;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return (PICompositionController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimeoutGroup:(id)a3
{
}

- (OS_dispatch_group)timeoutGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (void)waitForResultsWithTimeout
{
  timeoutGroup = self->_timeoutGroup;
  dispatch_time_t v3 = dispatch_time(0, 1500000000);
  dispatch_group_wait(timeoutGroup, v3);
}

- (void)deliverOn:(id)a3 completion:(id)a4
{
  id v6 = a4;
  group = self->_group;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__PEAdjustmentDataCacheEntry_deliverOn_completion___block_invoke;
  v9[3] = &unk_2642BEE80;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_group_notify(group, (dispatch_queue_t)a3, v9);
}

uint64_t __51__PEAdjustmentDataCacheEntry_deliverOn_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_load:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 hasAdjustments])
  {
    [(PEAdjustmentDataCacheEntry *)self setDisposition:0];
    dispatch_group_enter((dispatch_group_t)self->_group);
    dispatch_group_enter((dispatch_group_t)self->_timeoutGroup);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 0;
    id v9 = objc_alloc_init(MEMORY[0x263F14E40]);
    id v10 = v9;
    if (v5) {
      uint64_t v11 = 17;
    }
    else {
      uint64_t v11 = 16;
    }
    [v9 setVersion:v11];
    [v10 setNetworkAccessAllowed:v6];
    v12 = [(id)objc_opt_class() _resultHandlingQueue];
    [v10 setResultHandlerQueue:v12];

    v13 = [MEMORY[0x263F14E38] defaultManager];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke;
    v24[3] = &unk_2642BEE30;
    v26 = v31;
    v24[4] = self;
    id v14 = v8;
    BOOL v28 = v5;
    id v25 = v14;
    v27 = v29;
    objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, 0, v10, v24, 0.0, 0.0);

    dispatch_time_t v15 = dispatch_time(0, 1500000000);
    v16 = +[PEAdjustmentDataCacheEntry _resultHandlingQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_82;
    v18[3] = &unk_2642BEE58;
    v21 = v31;
    BOOL v23 = v5;
    v22 = v29;
    id v19 = v14;
    v20 = self;
    dispatch_after(v15, v16, v18);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    [(PEAdjustmentDataCacheEntry *)self setDisposition:1];
    [v8 fetchPropertySetsIfNeeded];
    v17 = [v8 originalMetadataProperties];
    -[PEAdjustmentDataCacheEntry setInputSize:](self, "setInputSize:", (double)[v17 originalWidth], (double)objc_msgSend(v17, "originalHeight"));
  }
}

void __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    v4 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v4, OS_LOG_TYPE_DEFAULT, "Extra call to requestImageForAsset callback (_load)", buf, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F14F78]];
    BOOL v6 = [v4 editorBundleID];
    [*(id *)(a1 + 32) setEditorBundleID:v6];

    uint64_t v28 = 0;
    uint64_t v29 = 0;
    BOOL v7 = +[PESerializationUtility adjustmentDataIsSupported:v4];
    BOOL v8 = v7;
    if (!v7) {
      goto LABEL_21;
    }
    id v9 = [*(id *)(a1 + 40) originalAVAssetOrProxy];
    if (v9)
    {
      id v27 = 0;
      id v10 = [MEMORY[0x263F586C0] firstEnabledVideoTrackInAsset:v9 error:&v27];
      uint64_t v11 = (__CFString *)v27;
      if (v10)
      {
        v12 = (void *)MEMORY[0x263F586C0];
        [v10 preferredTransform];
        uint64_t v13 = [v12 videoOrientationForAssetPreferredTransform:v26];
      }
      else
      {
        v16 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v11;
          _os_log_impl(&dword_217B65000, v16, OS_LOG_TYPE_DEFAULT, "[PEAdjustmentDataCache] failed to extract orientation from video track %@", buf, 0xCu);
        }

        uint64_t v13 = 1;
      }
    }
    else
    {
      [*(id *)(a1 + 40) fetchPropertySetsIfNeeded];
      id v14 = *(void **)(a1 + 40);
      if (v14)
      {
        dispatch_time_t v15 = [v14 originalMetadataProperties];
        uint64_t v13 = (int)[v15 originalExifOrientation];
      }
      else
      {
        uint64_t v13 = 1;
      }
    }
    if (NUOrientationIsValid()) {
      uint64_t v17 = v13;
    }
    else {
      uint64_t v17 = 1;
    }
    v18 = [MEMORY[0x263F5D980] compositionControllerWithAdjustmentData:v4 asset:*(void *)(a1 + 40) imageOrientation:v17 outMasterWidth:&v29 outMasterHeight:&v28];
    id v19 = [v18 orientationAdjustmentController];

    if (!v19)
    {
      uint64_t v20 = *MEMORY[0x263F5D760];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_72;
      v25[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
      v25[4] = v17;
      [v18 modifyAdjustmentWithKey:v20 modificationBlock:v25];
    }
    [*(id *)(a1 + 32) setCompositionController:v18];
    [*(id *)(a1 + 32) setDisposition:2];

    uint64_t v21 = v29;
    if (!v29 || (uint64_t v22 = v28) == 0)
    {
LABEL_21:
      uint64_t v21 = 1024;
      uint64_t v22 = 769;
      uint64_t v28 = 769;
      uint64_t v29 = 1024;
    }
    objc_msgSend(*(id *)(a1 + 32), "setInputSize:", (double)v21, (double)v22);
    if (!v8)
    {
      BOOL v23 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(a1 + 64)) {
          v24 = @"YES";
        }
        else {
          v24 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_DEFAULT, "[PEAdjustmentDataCache] editing as opaque. parsedEnvelope does not contain supported photo adjustments. Is loading original adjustment data: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setDisposition:3];
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
    }
  }
}

void __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_82(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    double v2 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = @"YES";
      if (!*(unsigned char *)(a1 + 64)) {
        v4 = @"NO";
      }
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      BOOL v8 = v4;
      _os_log_impl(&dword_217B65000, v2, OS_LOG_TYPE_ERROR, "PEAdjustmentDataCache timed out for asset: %@ original adjustment data: %@", (uint8_t *)&v5, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 16));
  }
}

uint64_t __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_72(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32)];
}

- (PEAdjustmentDataCacheEntry)initWithAsset:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PEAdjustmentDataCacheEntry;
  id v7 = a3;
  BOOL v8 = [(PEAdjustmentDataCacheEntry *)&v14 init];
  dispatch_group_t v9 = dispatch_group_create();
  group = v8->_group;
  v8->_group = (OS_dispatch_group *)v9;

  dispatch_group_t v11 = dispatch_group_create();
  timeoutGroup = v8->_timeoutGroup;
  v8->_timeoutGroup = (OS_dispatch_group *)v11;

  v8->_disposition = 0;
  -[PEAdjustmentDataCacheEntry _load:networkAccessAllowed:originalAdjustmentData:](v8, "_load:networkAccessAllowed:originalAdjustmentData:", v7, v6, v5, v14.receiver, v14.super_class);

  return v8;
}

+ (id)_resultHandlingQueue
{
  if (_resultHandlingQueue_onceToken != -1) {
    dispatch_once(&_resultHandlingQueue_onceToken, &__block_literal_global_1559);
  }
  double v2 = (void *)_resultHandlingQueue_resultHandlingQueue;
  return v2;
}

void __50__PEAdjustmentDataCacheEntry__resultHandlingQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PEAdjustmentDataCache.resultHandlingQueue", attr);
  double v2 = (void *)_resultHandlingQueue_resultHandlingQueue;
  _resultHandlingQueue_resultHandlingQueue = (uint64_t)v1;
}

@end