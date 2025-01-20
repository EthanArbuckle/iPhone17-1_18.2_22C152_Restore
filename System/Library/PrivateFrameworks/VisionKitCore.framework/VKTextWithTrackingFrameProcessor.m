@interface VKTextWithTrackingFrameProcessor
+ (NSArray)supportedRecognitionLanguages;
- (BOOL)wantsThrottling;
- (VKTextFrameProcessorConfiguration)configuration;
- (VKTextWithTrackingFrameProcessor)init;
- (id)_createRequest;
- (id)_filterDocuments:(uint64_t)a1;
- (id)resultHandler;
- (void)_performRecognitionAndTracking:(void *)a1;
- (void)_processResults:(void *)a1;
- (void)processFrame:(id)a3;
- (void)reset;
- (void)sendResult:(void *)a1;
- (void)setConfiguration:(id)a3;
- (void)setResultHandler:(id)a3;
@end

@implementation VKTextWithTrackingFrameProcessor

+ (NSArray)supportedRecognitionLanguages
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F45908]);
  id v6 = 0;
  v3 = [v2 supportedRecognitionLanguagesAndReturnError:&v6];
  id v4 = v6;
  if (v4) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "error == ((void *)0)", "+[VKTextWithTrackingFrameProcessor supportedRecognitionLanguages]", 0, 0, @"Error retrieving supportedRecognitionLanguages: %@", v4);
  }

  return (NSArray *)v3;
}

- (VKTextWithTrackingFrameProcessor)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKTextWithTrackingFrameProcessor;
  id v2 = [(VKFrameProcessor *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKTextFrameProcessorConfiguration);
    config = v2->_config;
    v2->_config = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
    recognizedItems = v2->_recognizedItems;
    v2->_recognizedItems = (NSMutableOrderedSet *)v5;
  }
  return v2;
}

- (BOOL)wantsThrottling
{
  return 0;
}

- (void)reset
{
  v6.receiver = self;
  v6.super_class = (Class)VKTextWithTrackingFrameProcessor;
  [(VKFrameProcessor *)&v6 reset];
  [(VKFrameProcessor *)self lock];
  request = self->_request;
  self->_request = 0;

  id v4 = (void *)[(NSMutableOrderedSet *)self->_recognizedItems copy];
  [(NSMutableOrderedSet *)self->_recognizedItems removeAllObjects];
  [(VKFrameProcessor *)self unlock];
  if ([v4 count])
  {
    uint64_t v5 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    [(VKRecognizedItemFrameProcessorResult *)v5 setRemovedItems:v4];
    -[VKTextWithTrackingFrameProcessor sendResult:](self, v5);
  }
}

- (void)sendResult:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKTextWithTrackingFrameProcessor sendResult:]", 0, 0, @"Expecting a non-nil result object.");
    }
    uint64_t v5 = [a1 resultHandler];
    if (v5)
    {
      objc_super v6 = [a1 resultHandlerQueue];
      if (v6)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __47__VKTextWithTrackingFrameProcessor_sendResult___block_invoke;
        v7[3] = &unk_1E6BF1330;
        v9 = v5;
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

- (VKTextFrameProcessorConfiguration)configuration
{
  [(VKFrameProcessor *)self lock];
  id v3 = (void *)[(VKTextFrameProcessorConfiguration *)self->_config copy];
  [(VKFrameProcessor *)self unlock];
  return (VKTextFrameProcessorConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKTextWithTrackingFrameProcessor *)self configuration];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)[v4 copy];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __53__VKTextWithTrackingFrameProcessor_setConfiguration___block_invoke;
    v12 = &unk_1E6BF12B8;
    v13 = self;
    id v14 = v7;
    id v8 = v7;
    vk_performWhileLocked(self, &v9);
    [(VKTextWithTrackingFrameProcessor *)self reset];
    [(VKFrameProcessor *)self requestImmediateProcessing];
  }
}

void __53__VKTextWithTrackingFrameProcessor_setConfiguration___block_invoke(uint64_t a1)
{
}

- (id)resultHandler
{
  [(VKFrameProcessor *)self lock];
  id v3 = (void *)MEMORY[0x1E018E600](self->_resultHandler);
  [(VKFrameProcessor *)self unlock];
  id v4 = (void *)MEMORY[0x1E018E600](v3);

  return v4;
}

- (void)setResultHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VKTextWithTrackingFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E6BF1308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  vk_performWhileLocked(self, v6);
}

void __53__VKTextWithTrackingFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;
}

uint64_t __47__VKTextWithTrackingFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_createRequest
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F45908]);
    uint64_t v3 = [*(id *)(a1 + 112) documentBlockType];
    long long v12 = *MEMORY[0x1E4F1FA48];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    id v4 = (void *)[v2 initWithFrameAnalysisSpacing:&v12 trackingLevelBlockType:v3 completionHandler:0];
    objc_msgSend(v4, "setUsesAlternateLineGrouping:", objc_msgSend(*(id *)(a1 + 112), "usesAlternateLineGrouping"));
    objc_msgSend(v4, "setUsesLanguageDetection:", objc_msgSend(*(id *)(a1 + 112), "usesLanguageDetection"));
    [v4 setUsesLanguageCorrection:1];
    [v4 setRecognitionLevel:0];
    id v5 = [*(id *)(a1 + 112) customWords];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 112) customWords];
      [v4 setCustomWords:v7];
    }
    id v8 = [*(id *)(a1 + 112) recognitionLanguages];
    uint64_t v9 = v8;
    if (!v8 || ![v8 count])
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA20] preferredLanguages];

      uint64_t v9 = (void *)v10;
    }
    [v4 setRecognitionLanguages:v9];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)processFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(VKTextWithTrackingFrameProcessor *)self configuration];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v5;

  self->_dataType = [(VKTextFrameProcessorConfiguration *)self->_currentConfig dataType];
  id v7 = -[VKTextWithTrackingFrameProcessor _performRecognitionAndTracking:](self, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__VKTextWithTrackingFrameProcessor_processFrame___block_invoke;
  v10[3] = &unk_1E6BF13D0;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = objc_msgSend(v7, "vk_compactMap:", v10);
  -[VKTextWithTrackingFrameProcessor _processResults:](self, v9);
}

- (void)_performRecognitionAndTracking:(void *)a1
{
  id v2 = a1;
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 imageRequestHandler];
    [v2 lock];
    id v5 = (void *)v2[13];
    if (!v5)
    {
      uint64_t v6 = -[VKTextWithTrackingFrameProcessor _createRequest]((uint64_t)v2);
      id v7 = (void *)v2[13];
      v2[13] = v6;

      id v5 = (void *)v2[13];
    }
    id v8 = v5;
    [v2 unlock];
    uint64_t v9 = [v3 info];

    [v9 regionOfInterest];
    objc_msgSend(v8, "setRegionOfInterest:");

    v15[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v14 = 0;
    [v4 performRequests:v10 error:&v14];
    id v11 = v14;

    long long v12 = [v8 results];
    id v2 = -[VKTextWithTrackingFrameProcessor _filterDocuments:]((uint64_t)v2, v12);
  }
  return v2;
}

VKRecognizedText *__49__VKTextWithTrackingFrameProcessor_processFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [VKRecognizedText alloc];
  id v5 = [*(id *)(a1 + 32) info];
  uint64_t v6 = [(VKRecognizedText *)v4 initWithFrameInfo:v5 textBlockObservation:v3];

  return v6;
}

- (void)_processResults:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__VKTextWithTrackingFrameProcessor__processResults___block_invoke;
    v10[3] = &unk_1E6BF13F8;
    void v10[4] = a1;
    id v6 = v3;
    id v11 = v6;
    id v7 = v5;
    id v12 = v7;
    id v8 = v4;
    id v13 = v8;
    id v14 = &v15;
    vk_performWhileLocked(a1, v10);
    uint64_t v9 = objc_alloc_init(VKRecognizedItemFrameProcessorResult);
    [(VKRecognizedItemFrameProcessorResult *)v9 setAllItems:v6];
    [(VKRecognizedItemFrameProcessorResult *)v9 setAddedItems:v8];
    [(VKRecognizedItemFrameProcessorResult *)v9 setUpdatedItems:v7];
    [(VKRecognizedItemFrameProcessorResult *)v9 setRemovedItems:v16[5]];
    -[VKTextWithTrackingFrameProcessor sendResult:](a1, v9);

    _Block_object_dispose(&v15, 8);
  }
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
      uint64_t v6 = *(void *)(a1 + 120);
      if (v6) {
        _FilterByDataType(v4, v6);
      }
      else {
      uint64_t v7 = _FilterByBlockType(v4, [*(id *)(a1 + 112) documentBlockType]);
      }

      id v5 = (void *)v7;
    }
    if ([*(id *)(a1 + 112) isForSingleItem] && objc_msgSend(v5, "count"))
    {
      [*(id *)(a1 + 112) comparisonPoint];
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

void __52__VKTextWithTrackingFrameProcessor__processResults___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithOrderedSet:*(void *)(*(void *)(a1 + 32) + 88)];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:*(void *)(a1 + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v2, "containsObject:", v9, (void)v15))
        {
          [*(id *)(a1 + 48) addObject:v9];
          [v2 removeObject:v9];
        }
        else
        {
          [*(id *)(a1 + 56) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v2 array];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 88);
  *(void *)(v13 + 88) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_recognizedItems, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end