@interface VKCaptureTextAnalyzer
- (BOOL)_isCanceledRequest:(id)a3;
- (BOOL)_isProcessing;
- (BOOL)shouldCreateFeedbackProviders;
- (OS_dispatch_queue)_processingQueue;
- (VKCaptureTextAnalysisRequest)_pendingRequest;
- (VKCaptureTextAnalysisRequest)_processingRequest;
- (VKCaptureTextAnalyzer)init;
- (id)_documentDetectionRequest;
- (id)_documentRecognitionRequestWithInputBlock:(id)a3;
- (id)_documentRecognitionRequestWithInputBlocks:(id)a3;
- (id)_imageAnalysisForDocument:(id)a3 imageSize:(CGSize)a4;
- (void)_didProcessRequest:(id)a3 withDetectionResult:(id)a4 analysis:(id)a5 error:(id)a6;
- (void)_enqueueProcessingForRequest:(id)a3;
- (void)_setPendingRequest:(id)a3;
- (void)_setProcessing:(BOOL)a3;
- (void)_setProcessingRequest:(id)a3;
- (void)cancelAllRequests;
- (void)dealloc;
- (void)processRequest:(id)a3;
- (void)setShouldCreateFeedbackProviders:(BOOL)a3;
@end

@implementation VKCaptureTextAnalyzer

- (VKCaptureTextAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)VKCaptureTextAnalyzer;
  v2 = [(VKCaptureTextAnalyzer *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.visionkit.cameratextanalysis", v3);
    processingQueue = v2->__processingQueue;
    v2->__processingQueue = (OS_dispatch_queue *)v4;

    v2->_shouldCreateFeedbackProviders = vk_isInternalBuild();
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F45968] globalSession];
  [v3 releaseCachedResources];

  v4.receiver = self;
  v4.super_class = (Class)VKCaptureTextAnalyzer;
  [(VKCaptureTextAnalyzer *)&v4 dealloc];
}

- (void)processRequest:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [(VKCaptureTextAnalyzer *)self _processingRequest];
  if (v4 == v7)
  {
  }
  else
  {
    id v5 = [(VKCaptureTextAnalyzer *)self _pendingRequest];

    v6 = v7;
    if (v5 == v7) {
      goto LABEL_8;
    }
    [(VKCaptureTextAnalyzer *)self cancelAllRequests];
    if ([(VKCaptureTextAnalyzer *)self _isProcessing]) {
      [(VKCaptureTextAnalyzer *)self _setPendingRequest:v7];
    }
    else {
      [(VKCaptureTextAnalyzer *)self _enqueueProcessingForRequest:v7];
    }
  }
  v6 = v7;
LABEL_8:
}

- (void)cancelAllRequests
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(VKCaptureTextAnalyzer *)self _pendingRequest];
  v3 = [(VKCaptureTextAnalyzer *)self _processingRequest];
  if (v5)
  {
    id v4 = [v5 delegate];
    [v4 requestDidCancel:v5];

    [(VKCaptureTextAnalyzer *)self _setPendingRequest:0];
  }
  if (v3) {
    [(VKCaptureTextAnalyzer *)self _setProcessingRequest:0];
  }
}

- (BOOL)_isCanceledRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(VKCaptureTextAnalyzer *)self _pendingRequest];

  id v6 = [(VKCaptureTextAnalyzer *)self _processingRequest];

  return v5 != v4 && v6 != v4;
}

- (void)_enqueueProcessingForRequest:(id)a3
{
  id v4 = a3;
  [(VKCaptureTextAnalyzer *)self _setProcessing:1];
  [(VKCaptureTextAnalyzer *)self _setProcessingRequest:v4];
  id v5 = [(VKCaptureTextAnalyzer *)self _processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke;
  v7[3] = &unk_1E6BF12B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke(uint64_t a1)
{
  v72[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) requestHandler];
  id v4 = [*(id *)(a1 + 40) _documentDetectionRequest];
  v72[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  id v65 = 0;
  [v3 performRequests:v5 error:&v65];
  id v6 = v65;

  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_2;
  v58[3] = &unk_1E6BF1218;
  v60 = &v61;
  int8x16_t v44 = *(int8x16_t *)v2;
  id v7 = *v2;
  int8x16_t v59 = vextq_s8(v44, v44, 8uLL);
  vk_performBlockOnMainThreadAndWait(v58);
  if (v6)
  {
    id v8 = 0;
    v9 = 0;
LABEL_3:
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28A50];
    id v69 = v6;
    v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1, v42.i64[0]);
    v12 = [v10 errorWithDomain:@"VKCaptureTextAnalysis" code:-1 userInfo:v11];

LABEL_4:
    goto LABEL_7;
  }
  if (*((unsigned char *)v62 + 24))
  {
    id v8 = 0;
    v9 = 0;
    v12 = 0;
    goto LABEL_7;
  }
  v17 = [*(id *)(a1 + 32) image];
  [v17 size];
  double v19 = v18;
  double v21 = v20;

  v22 = [*(id *)(a1 + 32) focusQuad];
  v46 = objc_msgSend(v22, "quadMultipliedBySize:", 1.0 / v19, 1.0 / v21);

  v23 = objc_msgSend(v46, "quadByFlippingPointsWithSourceFrame:", 0.0, 0.0, 1.0, 1.0);
  v24 = [v4 results];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_3;
  v56[3] = &unk_1E6BF1240;
  v56[4] = *(void *)(a1 + 40);
  id v43 = v23;
  id v57 = v43;
  v25 = objc_msgSend(v24, "vk_flatMap:", v56);

  if (![v25 count])
  {
    v9 = 0;
    id v8 = 0;
    id v6 = 0;
    uint64_t v32 = -2;
    goto LABEL_20;
  }
  v26 = [VKCaptureTextDetectionResult alloc];
  v27 = [*(id *)(a1 + 32) image];
  [v27 size];
  v28 = -[VKCaptureTextDetectionResult initWithBlocks:imageSize:](v26, "initWithBlocks:imageSize:", v25);

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_4;
  v53[3] = &unk_1E6BF1268;
  int8x16_t v42 = *(int8x16_t *)(a1 + 32);
  id v29 = (id)v42.i64[0];
  int8x16_t v54 = vextq_s8(v42, v42, 8uLL);
  v9 = v28;
  v55 = v9;
  vk_performBlockOnMainThread(v53);
  v30 = [*(id *)(a1 + 40) _documentRecognitionRequestWithInputBlocks:v25];
  v71 = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  id v52 = 0;
  [v3 performRequests:v31 error:&v52];
  id v6 = v52;

  if (!v6)
  {
    v42.i64[0] = [v30 results];
    unint64_t v33 = [(id)v42.i64[0] count];
    uint64_t v34 = v33;
    if (v33 < 2)
    {
      if (!v33)
      {
        id v8 = 0;
        uint64_t v32 = -3;
        goto LABEL_18;
      }
    }
    else
    {
      v35 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_cold_1(v37, buf, v34, v35);
      }
    }
    v38 = *(void **)(a1 + 40);
    v39 = [(id)v42.i64[0] firstObject];
    v40 = [*(id *)(a1 + 32) image];
    [v40 size];
    id v8 = objc_msgSend(v38, "_imageAnalysisForDocument:imageSize:", v39);

    uint64_t v32 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v8 = 0;
  uint64_t v32 = 0;
LABEL_19:

LABEL_20:
  if (v6) {
    goto LABEL_3;
  }
  v12 = 0;
  if (!*((unsigned char *)v62 + 24) && !v8)
  {
    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    v67 = @"No text was found during detection or recognition.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v12 = [v41 errorWithDomain:@"VKCaptureTextAnalysis" code:v32 userInfo:v11];
    id v8 = 0;
    goto LABEL_4;
  }
LABEL_7:
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_48;
  v47[3] = &unk_1E6BF1290;
  int8x16_t v45 = *(int8x16_t *)(a1 + 32);
  id v13 = (id)v45.i64[0];
  int8x16_t v48 = vextq_s8(v45, v45, 8uLL);
  v14 = v9;
  v49 = v14;
  id v15 = v8;
  id v50 = v15;
  id v16 = v12;
  id v51 = v16;
  vk_performBlockOnMainThread(v47);

  _Block_object_dispose(&v61, 8);
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isCanceledRequest:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _blocksIntersectingQuad:*(void *)(a1 + 40) inDocument:a2];
}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isCanceledRequest:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 40) delegate];
    [v2 request:*(void *)(a1 + 40) didDetectTextWithResult:*(void *)(a1 + 48)];
  }
}

uint64_t __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_48(uint64_t a1)
{
  [*(id *)(a1 + 32) _setProcessing:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  return [v2 _didProcessRequest:v3 withDetectionResult:v4 analysis:v5 error:v6];
}

- (void)_didProcessRequest:(id)a3 withDetectionResult:(id)a4 analysis:(id)a5 error:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(VKCaptureTextAnalyzer *)self _isCanceledRequest:v18])
  {
    id v13 = [v18 delegate];
    [v13 requestDidCancel:v18];
  }
  else
  {
    [(VKCaptureTextAnalyzer *)self _setProcessingRequest:0];
    if ([(VKCaptureTextAnalyzer *)self shouldCreateFeedbackProviders])
    {
      v14 = objc_alloc_init(VKFeedbackProvider);
      id v15 = [[VKCaptureTextFeedbackAssetProvider alloc] initWithRequest:v18 detectionResult:v10];
      [(VKFeedbackProvider *)v14 setAssetsProvider:v15];

      [(VKFeedbackProvider *)v14 setError:v12];
      [v11 setFeedbackProvider:v14];
    }
    id v16 = [v18 delegate];
    id v13 = v16;
    if (v12) {
      [v16 request:v18 didFailWithError:v12];
    }
    else {
      [v16 request:v18 didRecgonizeTextWithAnalysis:v11];
    }
  }

  v17 = [(VKCaptureTextAnalyzer *)self _pendingRequest];
  if (v17)
  {
    [(VKCaptureTextAnalyzer *)self _setPendingRequest:0];
    [(VKCaptureTextAnalyzer *)self _enqueueProcessingForRequest:v17];
  }
}

- (id)_imageAnalysisForDocument:(id)a3 imageSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    id v6 = a3;
    id v7 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v6, 0, width, height);

    id v8 = [(VKImageAnalysis *)[VKCImageAnalysis alloc] initWithAnalysisResult:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_documentDetectionRequest
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F45908]);
  [v2 setDetectionOnly:1];
  [v2 setUsesLanguageCorrection:0];
  [v2 setRecognitionLevel:0];
  return v2;
}

- (id)_documentRecognitionRequestWithInputBlock:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = -[VKCaptureTextAnalyzer _documentRecognitionRequestWithInputBlocks:](self, "_documentRecognitionRequestWithInputBlocks:", v6, v9, v10);

  return v7;
}

- (id)_documentRecognitionRequestWithInputBlocks:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F45908];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDetectionOnly:0];
  [v5 setUsesLanguageCorrection:1];
  [v5 setRecognitionLevel:0];
  [v5 setInputTextBlocks:v4];

  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v5 setRecognitionLanguages:v6];

  return v5;
}

- (BOOL)shouldCreateFeedbackProviders
{
  return self->_shouldCreateFeedbackProviders;
}

- (void)setShouldCreateFeedbackProviders:(BOOL)a3
{
  self->_shouldCreateFeedbackProviders = a3;
}

- (OS_dispatch_queue)_processingQueue
{
  return self->__processingQueue;
}

- (VKCaptureTextAnalysisRequest)_pendingRequest
{
  return self->__pendingRequest;
}

- (void)_setPendingRequest:(id)a3
{
}

- (VKCaptureTextAnalysisRequest)_processingRequest
{
  return self->__processingRequest;
}

- (void)_setProcessingRequest:(id)a3
{
}

- (BOOL)_isProcessing
{
  return self->__processing;
}

- (void)_setProcessing:(BOOL)a3
{
  self->__processing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__processingRequest, 0);
  objc_storeStrong((id *)&self->__pendingRequest, 0);
  objc_storeStrong((id *)&self->__processingQueue, 0);
}

void __54__VKCaptureTextAnalyzer__enqueueProcessingForRequest___block_invoke_cold_1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "%@: unexpectedly recognized %lu documents; will use arbitrary document.",
    buf,
    0x16u);
}

@end