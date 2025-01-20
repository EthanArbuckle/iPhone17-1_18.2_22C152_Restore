@interface VKBarcodeFrameProcessor
- (BOOL)wantsThrottling;
- (VKBarcodeFrameProcessor)init;
- (VKBarcodeFrameProcessorConfiguration)configuration;
- (__n128)warpTransform;
- (id)_barcodeRequest;
- (id)_performRecognition:(id *)a1;
- (id)resultHandler;
- (void)_performAssociation:(void *)a1;
- (void)_processRecognitionResults:(void *)a3 forFrame:;
- (void)_removeAllItems;
- (void)applyWarpTransform:(__n128)a3;
- (void)processFrame:(id)a3;
- (void)reset;
- (void)sendResult:(void *)a1;
- (void)setConfiguration:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setWarpTransform:(__n128)a3;
@end

@implementation VKBarcodeFrameProcessor

- (VKBarcodeFrameProcessor)init
{
  v10.receiver = self;
  v10.super_class = (Class)VKBarcodeFrameProcessor;
  v2 = [(VKFrameProcessor *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKBarcodeFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    uint64_t v5 = MEMORY[0x1E4F14998];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    *(_OWORD *)v2->_anon_50 = *MEMORY[0x1E4F14998];
    *(_OWORD *)&v2->_anon_50[16] = v6;
    *(_OWORD *)&v2->_anon_50[32] = *(_OWORD *)(v5 + 32);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableArray *)v7;
  }
  return v2;
}

- (VKBarcodeFrameProcessorConfiguration)configuration
{
  [(VKFrameProcessor *)self lock];
  v3 = (void *)[(VKBarcodeFrameProcessorConfiguration *)self->_config copy];
  [(VKFrameProcessor *)self unlock];
  return (VKBarcodeFrameProcessorConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKBarcodeFrameProcessor *)self configuration];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)[v4 copy];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __44__VKBarcodeFrameProcessor_setConfiguration___block_invoke;
    v12 = &unk_1E6BF12B8;
    v13 = self;
    id v14 = v7;
    id v8 = v7;
    vk_performWhileLocked(self, &v9);
    [(VKFrameProcessor *)self requestImmediateProcessing];
  }
}

void __44__VKBarcodeFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
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
  v6[2] = __44__VKBarcodeFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E6BF1308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  vk_performWhileLocked(self, v6);
}

void __44__VKBarcodeFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;
}

- (void)sendResult:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKBarcodeFrameProcessor sendResult:]", 0, 0, @"Expecting a non-nil result object.");
    }
    id v5 = [a1 resultHandler];
    if (v5)
    {
      char v6 = [a1 resultHandlerQueue];
      if (v6)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __38__VKBarcodeFrameProcessor_sendResult___block_invoke;
        v7[3] = &unk_1E6BF1330;
        uint64_t v9 = v5;
        id v8 = v4;
        dispatch_async(v6, v7);
      }
      else
      {
        ((void (**)(void, void *))v5)[2](v5, v4);
      }
    }
  }
}

uint64_t __38__VKBarcodeFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)applyWarpTransform:(__n128)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VKBarcodeFrameProcessor_applyWarpTransform___block_invoke;
  v6[3] = &unk_1E6BF1358;
  __n128 v7 = a2;
  __n128 v8 = a3;
  __n128 v9 = a4;
  uint64_t v10 = a1;
  v11 = &v12;
  vk_performWhileLocked(a1, v6);
  id v5 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
  [(VKRecognizedItemFrameProcessorResult *)v5 setAllItems:v13[5]];
  [(VKRecognizedItemFrameProcessorResult *)v5 setAddedItems:MEMORY[0x1E4F1CBF0]];
  [(VKRecognizedItemFrameProcessorResult *)v5 setUpdatedItems:v13[5]];
  [(VKRecognizedItemFrameProcessorResult *)v5 setRemovedItems:MEMORY[0x1E4F1CBF0]];
  -[VKBarcodeFrameProcessor sendResult:](a1, v5);

  _Block_object_dispose(&v12, 8);
}

void __46__VKBarcodeFrameProcessor_applyWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 80) + 80;
  float32x4_t v4 = *(float32x4_t *)v3;
  float32x4_t v5 = *(float32x4_t *)(*(void *)(a1 + 80) + 96);
  float32x4_t v6 = *(float32x4_t *)(*(void *)(a1 + 80) + 112);
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
  *(_DWORD *)(v3 + 40) = DWORD2(v11);
  *(void *)(v3 + 16) = v10;
  *(void *)(v3 + 32) = v11;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 80) + 128);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16++), "applyHomographyWarpTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), (void)v20);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [*(id *)(*(void *)(a1 + 80) + 128) copy];
  uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

- (__n128)warpTransform
{
  if (!a1) {
    return (__n128)0;
  }
  [a1 lock];
  long long v3 = a1[5];
  [a1 unlock];
  return (__n128)v3;
}

- (void)setWarpTransform:(__n128)a3
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__VKBarcodeFrameProcessor_setWarpTransform___block_invoke;
    v4[3] = &unk_1E6BF1380;
    long long v8 = a1;
    __n128 v5 = a2;
    __n128 v6 = a3;
    __n128 v7 = a4;
    vk_performWhileLocked(a1, v4);
  }
}

__n128 __44__VKBarcodeFrameProcessor_setWarpTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 80) + 80;
  long long v3 = *(_OWORD *)(a1 + 48);
  __n128 result = *(__n128 *)(a1 + 64);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 16) = v3;
  *(__n128 *)(v1 + 32) = result;
  return result;
}

- (BOOL)wantsThrottling
{
  return 1;
}

- (void)processFrame:(id)a3
{
  id v4 = a3;
  __n128 v5 = [(VKBarcodeFrameProcessor *)self configuration];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  -[VKBarcodeFrameProcessor _performRecognition:]((id *)&self->super.super.isa, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VKBarcodeFrameProcessor _processRecognitionResults:forFrame:](self, v7, v4);
}

- (id)_performRecognition:(id *)a1
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    __n128 v16 = *(__n128 *)(MEMORY[0x1E4F14998] + 16);
    __n128 v17 = *(__n128 *)MEMORY[0x1E4F14998];
    __n128 v15 = *(__n128 *)(MEMORY[0x1E4F14998] + 32);
    id v3 = a2;
    -[VKBarcodeFrameProcessor setWarpTransform:](a1, v17, v16, v15);
    id v4 = -[VKBarcodeFrameProcessor _barcodeRequest]((uint64_t)a1);
    __n128 v5 = [v3 info];
    [v5 regionOfInterest];
    objc_msgSend(v4, "setRegionOfInterest:");

    __n128 v6 = [v3 imageRequestHandler];

    v20[0] = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v18 = 0;
    [v6 performRequests:v7 error:&v18];
    id v8 = v18;

    if (v8)
    {
      uint64_t v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VKTextFrameProcessor _performRecognition:inputObservation:]((uint64_t)v8, v9);
      }
      long long v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      long long v10 = [v4 results];
      if (![a1[18] isForSingleItem] || !objc_msgSend(v10, "count")) {
        goto LABEL_10;
      }
      [a1[18] comparisonPoint];
      uint64_t v9 = VKVNRectClosestToPoint(v10, v11, v12);
      v19 = v9;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

      long long v10 = (void *)v13;
    }

LABEL_10:
    goto LABEL_11;
  }
  long long v10 = 0;
LABEL_11:
  return v10;
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
    long long v19 = a1[6];
    long long v20 = a1[5];
    long long v18 = a1[7];
    __n128 v17 = a1;
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
          uint64_t v14 = [VKRecognizedBarcode alloc];
          __n128 v15 = [v6 info];
          __n128 v16 = [(VKRecognizedBarcode *)v14 initWithFrameInfo:v15 barcodeObservation:v13];

          -[VKRecognizedItem applyHomographyWarpTransform:](v16, "applyHomographyWarpTransform:", *(double *)&v20, *(double *)&v19, *(double *)&v18);
          [v7 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    -[VKBarcodeFrameProcessor _performAssociation:](v17, v7);
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)VKBarcodeFrameProcessor;
  [(VKFrameProcessor *)&v3 reset];
  -[VKBarcodeFrameProcessor _removeAllItems]((id *)&self->super.super.isa);
}

- (void)_removeAllItems
{
  if (a1)
  {
    [a1 lock];
    id v3 = (id)[a1[16] copy];
    [a1[16] removeAllObjects];
    [a1 unlock];
    if ([v3 count])
    {
      uint64_t v2 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
      [(VKRecognizedItemFrameProcessorResult *)v2 setRemovedItems:v3];
      -[VKBarcodeFrameProcessor sendResult:](a1, v2);
    }
  }
}

- (id)_barcodeRequest
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F45768]);
    id v3 = [*(id *)(a1 + 144) symbologies];
    [v2 setSymbologies:v3];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_performAssociation:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__18;
    v37 = __Block_byref_object_dispose__18;
    id v38 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__18;
    v31 = __Block_byref_object_dispose__18;
    id v32 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__18;
    long long v25 = __Block_byref_object_dispose__18;
    id v26 = 0;
    uint64_t v15 = 0;
    __n128 v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__18;
    long long v19 = __Block_byref_object_dispose__18;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __47__VKBarcodeFrameProcessor__performAssociation___block_invoke;
    id v8 = &unk_1E6BF13A8;
    id v9 = v3;
    uint64_t v10 = a1;
    uint64_t v11 = &v27;
    double v12 = &v15;
    uint64_t v13 = &v33;
    uint64_t v14 = &v21;
    vk_performWhileLocked(a1, &v5);
    id v4 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    -[VKRecognizedItemFrameProcessorResult setAllItems:](v4, "setAllItems:", v16[5], v5, v6, v7, v8);
    [(VKRecognizedItemFrameProcessorResult *)v4 setAddedItems:v34[5]];
    [(VKRecognizedItemFrameProcessorResult *)v4 setUpdatedItems:v28[5]];
    [(VKRecognizedItemFrameProcessorResult *)v4 setRemovedItems:v22[5]];
    -[VKBarcodeFrameProcessor sendResult:](a1, v4);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);
  }
}

uint64_t __47__VKBarcodeFrameProcessor__performAssociation___block_invoke(uint64_t a1)
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
        if (!objc_msgSend(*(id *)(*(void *)(a1 + 40) + 128), "count", (void)v14)) {
          goto LABEL_13;
        }
        uint64_t v8 = 0;
        while (1)
        {
          id v9 = [*(id *)(*(void *)(a1 + 40) + 128) objectAtIndexedSubscript:v8];
          if ([v9 shouldAssociateWithItem:v7]) {
            break;
          }

          if (++v8 >= (unint64_t)[*(id *)(*(void *)(a1 + 40) + 128) count]) {
            goto LABEL_13;
          }
        }
        if (v9)
        {
          [v9 associateWithItem:v7];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v9];
          [*(id *)(*(void *)(a1 + 40) + 128) removeObjectAtIndex:v8];
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

  uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 128) copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  [*(id *)(*(void *)(a1 + 40) + 128) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 40) + 128) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end