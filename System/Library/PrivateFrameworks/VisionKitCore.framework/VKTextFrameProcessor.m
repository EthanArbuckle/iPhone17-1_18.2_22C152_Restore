@interface VKTextFrameProcessor
+ (NSArray)supportedRecognitionLanguages;
- (BOOL)wantsThrottling;
- (VKTextFrameProcessor)init;
- (VKTextFrameProcessorConfiguration)configuration;
- (__n128)warpTransform;
- (id)_documentRequestForInputObservation:(uint64_t)a1;
- (id)_filterDocuments:(uint64_t)a1;
- (id)_performDetection:(void *)a1;
- (id)_performGatingAndRecognition:(id *)a1;
- (id)_performRecognition:(void *)a3 inputObservation:;
- (id)resultHandler;
- (void)_performAssociation:(void *)a1;
- (void)_processRecognitionResults:(void *)a3 forFrame:;
- (void)_removeAllItems;
- (void)applyHomographyWarpTransform:(__n128)a3;
- (void)processFrame:(id)a3;
- (void)reset;
- (void)sendResult:(void *)a1;
- (void)setConfiguration:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setWantsThrottling:(BOOL)a3;
- (void)setWarpTransform:(__n128)a3;
@end

@implementation VKTextFrameProcessor

+ (NSArray)supportedRecognitionLanguages
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F45908]);
  id v6 = 0;
  v3 = [v2 supportedRecognitionLanguagesAndReturnError:&v6];
  id v4 = v6;
  if (v4) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKTextFrameProcessor supportedRecognitionLanguages]", 0, 0, @"Error retrieving supportedRecognitionLanguages: %@", v4);
  }

  return (NSArray *)v3;
}

- (VKTextFrameProcessor)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKTextFrameProcessor;
  id v2 = [(VKFrameProcessor *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKTextFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    uint64_t v5 = MEMORY[0x1E4F14998];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    *(_OWORD *)v2->_anon_60 = *MEMORY[0x1E4F14998];
    *(_OWORD *)&v2->_anon_60[16] = v6;
    *(_OWORD *)&v2->_anon_60[32] = *(_OWORD *)(v5 + 32);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableArray *)v7;
  }
  return v2;
}

- (VKTextFrameProcessorConfiguration)configuration
{
  [(VKFrameProcessor *)self lock];
  v3 = (void *)[(VKTextFrameProcessorConfiguration *)self->_config copy];
  [(VKFrameProcessor *)self unlock];
  return (VKTextFrameProcessorConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKTextFrameProcessor *)self configuration];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)[v4 copy];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __41__VKTextFrameProcessor_setConfiguration___block_invoke;
    v12 = &unk_1E6BF12B8;
    v13 = self;
    id v14 = v7;
    id v8 = v7;
    vk_performWhileLocked(self, &v9);
    [(VKFrameProcessor *)self requestImmediateProcessing];
  }
}

void __41__VKTextFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
{
}

- (id)resultHandler
{
  [(VKFrameProcessor *)self lock];
  v3 = (void *)MEMORY[0x1E018E600](self->_resultHandler);
  [(VKFrameProcessor *)self unlock];
  id v4 = (void *)MEMORY[0x1E018E600](v3);

  return v4;
}

- (void)setResultHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__VKTextFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E6BF1308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  vk_performWhileLocked(self, v6);
}

void __41__VKTextFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = v2;
}

- (void)sendResult:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 allItems];
    objc_msgSend(a1, "setWantsThrottling:", objc_msgSend(v5, "count") != 0);

    if (!v4) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKTextFrameProcessor sendResult:]", 0, 0, @"Expecting a non-nil result object.");
    }
    char v6 = [a1 resultHandler];
    if (v6)
    {
      id v7 = [a1 resultHandlerQueue];
      if (v7)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __35__VKTextFrameProcessor_sendResult___block_invoke;
        v8[3] = &unk_1E6BF1330;
        uint64_t v10 = v6;
        id v9 = v4;
        dispatch_async(v7, v8);
      }
      else
      {
        ((void (**)(void, void *))v6)[2](v6, v4);
      }
    }
  }
}

uint64_t __35__VKTextFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)applyHomographyWarpTransform:(__n128)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__VKTextFrameProcessor_applyHomographyWarpTransform___block_invoke;
  v7[3] = &unk_1E6BF1358;
  __n128 v8 = a2;
  __n128 v9 = a3;
  __n128 v10 = a4;
  v11 = a1;
  v12 = &v13;
  vk_performWhileLocked(a1, v7);
  id v5 = (id)v14[5];
  char v6 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
  [(VKRecognizedItemFrameProcessorResult *)v6 setAllItems:v5];
  [(VKRecognizedItemFrameProcessorResult *)v6 setUpdatedItems:v5];
  -[VKTextFrameProcessor sendResult:](a1, v6);

  _Block_object_dispose(&v13, 8);
}

void __53__VKTextFrameProcessor_applyHomographyWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 80) + 96;
  float32x4_t v4 = *(float32x4_t *)v3;
  float32x4_t v5 = *(float32x4_t *)(*(void *)(a1 + 80) + 112);
  float32x4_t v6 = *(float32x4_t *)(*(void *)(a1 + 80) + 128);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 64);
  v24[0] = *(_OWORD *)(a1 + 32);
  v24[1] = v7;
  v24[2] = v8;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  do
  {
    *(long long *)((char *)&v25 + v2 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v24[v2])), v5, *(float32x2_t *)&v24[v2], 1), v6, (float32x4_t)v24[v2], 2);
    ++v2;
  }
  while (v2 != 3);
  uint64_t v9 = v25;
  long long v10 = v26;
  long long v11 = v27;
  *(_DWORD *)(v3 + 8) = DWORD2(v25);
  *(void *)uint64_t v3 = v9;
  *(_DWORD *)(v3 + 24) = DWORD2(v10);
  *(void *)(v3 + 16) = v10;
  *(_DWORD *)(v3 + 40) = DWORD2(v11);
  *(void *)(v3 + 32) = v11;
  uint64_t v12 = [*(id *)(*(void *)(a1 + 80) + 144) copy];
  uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "applyHomographyWarpTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (__n128)warpTransform
{
  if (!a1) {
    return (__n128)0;
  }
  [a1 lock];
  long long v3 = a1[6];
  [a1 unlock];
  return (__n128)v3;
}

- (void)setWarpTransform:(__n128)a3
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__VKTextFrameProcessor_setWarpTransform___block_invoke;
    v4[3] = &unk_1E6BF1380;
    long long v8 = a1;
    __n128 v5 = a2;
    __n128 v6 = a3;
    __n128 v7 = a4;
    vk_performWhileLocked(a1, v4);
  }
}

__n128 __41__VKTextFrameProcessor_setWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 80) + 96;
  long long v3 = *(_OWORD *)(a1 + 48);
  __n128 result = *(__n128 *)(a1 + 64);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

- (BOOL)wantsThrottling
{
  [(VKFrameProcessor *)self lock];
  BOOL wantsThrottling = self->_wantsThrottling;
  [(VKFrameProcessor *)self unlock];
  return wantsThrottling;
}

- (void)setWantsThrottling:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VKTextFrameProcessor_setWantsThrottling___block_invoke;
  v3[3] = &unk_1E6BF0CC8;
  v3[4] = self;
  BOOL v4 = a3;
  vk_performWhileLocked(self, v3);
}

uint64_t __43__VKTextFrameProcessor_setWantsThrottling___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40);
  return result;
}

- (void)processFrame:(id)a3
{
  id v4 = a3;
  __n128 v5 = [(VKTextFrameProcessor *)self configuration];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  self->_dataType = [(VKTextFrameProcessorConfiguration *)self->_currentConfig dataType];
  -[VKTextFrameProcessor _performGatingAndRecognition:]((id *)&self->super.super.isa, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessor _processRecognitionResults:forFrame:](self, v7, v4);
}

- (id)_performGatingAndRecognition:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([a1[20] shouldPerformTextDetectionGating])
    {
      id v4 = -[VKTextFrameProcessor _performDetection:](a1, v3);
      if (!v4)
      {
        a1 = (id *)MEMORY[0x1E4F1CBF0];
        goto LABEL_7;
      }
    }
    else
    {
      id v4 = 0;
    }
    -[VKTextFrameProcessor _performRecognition:inputObservation:](a1, v3, v4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return a1;
}

- (void)_processRecognitionResults:(void *)a3 forFrame:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1 && ([a1 isCancelled] & 1) == 0)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    [a1 lock];
    long long v19 = a1[7];
    long long v20 = a1[6];
    long long v18 = a1[8];
    uint64_t v17 = a1;
    [a1 unlock];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [VKRecognizedText alloc];
          id v15 = [v6 info];
          uint64_t v16 = [(VKRecognizedText *)v14 initWithFrameInfo:v15 textBlockObservation:v13];

          -[VKRecognizedItem applyHomographyWarpTransform:](v16, "applyHomographyWarpTransform:", *(double *)&v20, *(double *)&v19, *(double *)&v18);
          [v7 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    -[VKTextFrameProcessor _performAssociation:](v17, v7);
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)VKTextFrameProcessor;
  [(VKFrameProcessor *)&v3 reset];
  -[VKTextFrameProcessor _removeAllItems]((id *)&self->super.super.isa);
}

- (void)_removeAllItems
{
  if (a1)
  {
    [a1 lock];
    id v3 = (id)[a1[18] copy];
    [a1[18] removeAllObjects];
    [a1 unlock];
    if ([v3 count])
    {
      uint64_t v2 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
      [(VKRecognizedItemFrameProcessorResult *)v2 setRemovedItems:v3];
      -[VKTextFrameProcessor sendResult:](a1, v2);
    }
  }
}

- (id)_performDetection:(void *)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v28 = v3;
  if (a1)
  {
    id v4 = v3;
    id v5 = [a1 configuration];
    if (([v5 shouldPerformTextDetectionGating] & 1) == 0) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "configuration.shouldPerformTextDetectionGating", "-[VKTextFrameProcessor _performDetection:]", 0, 0, @"Running detection when the configuration does not support it.");
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F45908]);
    objc_msgSend(v6, "setUsesAlternateLineGrouping:", objc_msgSend(v5, "usesAlternateLineGrouping"));
    [v6 setMaximumCandidateCount:1];
    [v6 setDetectionOnly:1];
    id v7 = [v4 info];
    [v7 regionOfInterest];
    objc_msgSend(v6, "setRegionOfInterest:");

    id v8 = [v4 imageRequestHandler];
    id v34 = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    id v29 = 0;
    long long v27 = v8;
    [v8 performRequests:v9 error:&v29];
    id v10 = v29;

    if (v10)
    {
      uint64_t v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[VKTextFrameProcessor _performDetection:]((uint64_t)v10, v11);
      }
    }
    [v5 comparisonPoint];
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [v5 documentBlockType];
    id v17 = [v6 results];
    long long v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v24 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", v16, 10000, v13, v15);
          if (v24) {
            [v18 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    long long v25 = VKVNRectClosestToPoint(v18, v13, v15);
  }
  else
  {
    long long v25 = 0;
  }

  return v25;
}

- (id)_performRecognition:(void *)a3 inputObservation:
{
  id v3 = a1;
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    __n128 v15 = *(__n128 *)(MEMORY[0x1E4F14998] + 16);
    __n128 v16 = *(__n128 *)MEMORY[0x1E4F14998];
    __n128 v14 = *(__n128 *)(MEMORY[0x1E4F14998] + 32);
    id v5 = a3;
    id v6 = a2;
    -[VKTextFrameProcessor setWarpTransform:](v3, v16, v15, v14);
    id v7 = -[VKTextFrameProcessor _documentRequestForInputObservation:]((uint64_t)v3, v5);

    id v8 = [v6 info];
    [v8 regionOfInterest];
    objc_msgSend(v7, "setRegionOfInterest:");

    uint64_t v9 = [v6 imageRequestHandler];

    v18[0] = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v17 = 0;
    [v9 performRequests:v10 error:&v17];
    id v11 = v17;

    if (v11)
    {
      double v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[VKTextFrameProcessor _performRecognition:inputObservation:]((uint64_t)v11, v12);
      }
      id v3 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      double v12 = [v7 results];
      -[VKTextFrameProcessor _filterDocuments:]((uint64_t)v3, v12);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_documentRequestForInputObservation:(uint64_t)a1
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F45908]);
    objc_msgSend(v4, "setUsesAlternateLineGrouping:", objc_msgSend(*(id *)(a1 + 160), "usesAlternateLineGrouping"));
    [v4 setMaximumCandidateCount:1];
    [v4 setDetectionOnly:0];
    objc_msgSend(v4, "setUsesLanguageDetection:", objc_msgSend(*(id *)(a1 + 160), "usesLanguageDetection"));
    [v4 setUsesLanguageCorrection:1];
    [v4 setRecognitionLevel:0];
    id v5 = [*(id *)(a1 + 160) customWords];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 160) customWords];
      [v4 setCustomWords:v7];
    }
    id v8 = [*(id *)(a1 + 160) recognitionLanguages];
    uint64_t v9 = v8;
    if (!v8 || ![v8 count])
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];

      uint64_t v9 = (void *)v10;
    }
    [v4 setRecognitionLanguages:v9];
    if (v3)
    {
      v13[0] = v3;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v4 setInputTextBlocks:v11];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_filterDocuments:(uint64_t)a1
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 168);
      if (v6) {
        _FilterByDataType(v4, v6);
      }
      else {
      uint64_t v7 = _FilterByBlockType(v4, [*(id *)(a1 + 160) documentBlockType]);
      }

      id v5 = (void *)v7;
    }
    if ([*(id *)(a1 + 160) isForSingleItem] && objc_msgSend(v5, "count"))
    {
      [*(id *)(a1 + 160) comparisonPoint];
      uint64_t v10 = VKVNRectClosestToPoint(v5, v8, v9);
      v13[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

      id v5 = (void *)v11;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_performAssociation:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    id v38 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = __Block_byref_object_copy__2;
    long long v31 = __Block_byref_object_dispose__2;
    id v32 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__2;
    long long v25 = __Block_byref_object_dispose__2;
    id v26 = 0;
    uint64_t v15 = 0;
    __n128 v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__2;
    id v19 = __Block_byref_object_dispose__2;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __44__VKTextFrameProcessor__performAssociation___block_invoke;
    double v8 = &unk_1E6BF13A8;
    id v9 = v3;
    uint64_t v10 = a1;
    uint64_t v11 = &v27;
    double v12 = &v15;
    double v13 = &v33;
    __n128 v14 = &v21;
    vk_performWhileLocked(a1, &v5);
    id v4 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    -[VKRecognizedItemFrameProcessorResult setAllItems:](v4, "setAllItems:", v16[5], v5, v6, v7, v8);
    [(VKRecognizedItemFrameProcessorResult *)v4 setAddedItems:v34[5]];
    [(VKRecognizedItemFrameProcessorResult *)v4 setUpdatedItems:v28[5]];
    [(VKRecognizedItemFrameProcessorResult *)v4 setRemovedItems:v22[5]];
    -[VKTextFrameProcessor sendResult:](a1, v4);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);
  }
}

uint64_t __44__VKTextFrameProcessor__performAssociation___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        if (!objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "count", (void)v14)) {
          goto LABEL_13;
        }
        uint64_t v8 = 0;
        while (1)
        {
          id v9 = [*(id *)(*(void *)(a1 + 40) + 144) objectAtIndexedSubscript:v8];
          if ([v9 shouldAssociateWithItem:v7]) {
            break;
          }

          if (++v8 >= (unint64_t)[*(id *)(*(void *)(a1 + 40) + 144) count]) {
            goto LABEL_13;
          }
        }
        if (v9)
        {
          [v9 associateWithItem:v7];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v9];
          [*(id *)(*(void *)(a1 + 40) + 144) removeObjectAtIndex:v8];
        }
        else
        {
LABEL_13:
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v7];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v7];
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 144) copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  [*(id *)(*(void *)(a1 + 40) + 144) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 40) + 144) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)_performDetection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error performing detection request. %@", (uint8_t *)&v2, 0xCu);
}

- (void)_performRecognition:(uint64_t)a1 inputObservation:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error performing recognition request. %@", (uint8_t *)&v2, 0xCu);
}

@end