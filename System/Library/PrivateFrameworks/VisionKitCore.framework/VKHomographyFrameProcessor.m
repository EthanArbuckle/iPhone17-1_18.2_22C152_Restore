@interface VKHomographyFrameProcessor
- (id)resultHandler;
- (void)processFrame:(id)a3;
- (void)sendResult:(id)a3;
- (void)setResultHandler:(id)a3;
@end

@implementation VKHomographyFrameProcessor

- (id)resultHandler
{
  [(VKFrameProcessor *)self lock];
  v3 = (void *)MEMORY[0x1E018E600](self->_resultHandler);
  [(VKFrameProcessor *)self unlock];
  v4 = (void *)MEMORY[0x1E018E600](v3);

  return v4;
}

- (void)setResultHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__VKHomographyFrameProcessor_setResultHandler___block_invoke;
  v6[3] = &unk_1E6BF1308;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  vk_performWhileLocked(self, v6);
}

void __47__VKHomographyFrameProcessor_setResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

- (void)sendResult:(id)a3
{
  id v4 = a3;
  if (!v4) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result", "-[VKHomographyFrameProcessor sendResult:]", 0, 0, @"Expecting a non-nil result object.");
  }
  id v5 = [(VKHomographyFrameProcessor *)self resultHandler];
  if (v5)
  {
    v6 = [(VKFrameProcessor *)self resultHandlerQueue];
    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__VKHomographyFrameProcessor_sendResult___block_invoke;
      v7[3] = &unk_1E6BF1330;
      v9 = v5;
      id v8 = v4;
      dispatch_async(v6, v7);
    }
    else
    {
      ((void (**)(void, id))v5)[2](v5, v4);
    }
  }
}

uint64_t __41__VKHomographyFrameProcessor_sendResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)processFrame:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_homographyRequest)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F45978]);
    long long v24 = *MEMORY[0x1E4F1F9F8];
    uint64_t v25 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v6 = (VNTrackHomographyRequest *)[v5 initWithFrameAnalysisSpacing:&v24 completionHandler:0];
    homographyRequest = self->_homographyRequest;
    self->_homographyRequest = v6;
  }
  id v8 = [v4 info];
  [v8 regionOfInterest];
  -[VNTrackHomographyRequest setRegionOfInterest:](self->_homographyRequest, "setRegionOfInterest:");

  v9 = [v4 imageRequestHandler];
  v26[0] = self->_homographyRequest;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v23 = 0;
  [v9 performRequests:v10 error:&v23];
  id v11 = v23;

  if (v11)
  {
    v12 = (VKHomographyFrameProcessorResult *)os_log_create("com.apple.VisionKit", "com.apple.VisionKit.UtilityCamera");
    if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_ERROR)) {
      -[VKTextFrameProcessor _performRecognition:inputObservation:]((uint64_t)v11, &v12->super.super);
    }
    goto LABEL_6;
  }
  if (![(VKFrameProcessor *)self isCancelled])
  {
    v13 = [(VNTrackHomographyRequest *)self->_homographyRequest results];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      v15 = [(VNTrackHomographyRequest *)self->_homographyRequest results];
      v16 = [v15 firstObject];
      [v16 warpTransform];
      double v21 = v18;
      double v22 = v17;
      double v20 = v19;

      v12 = objc_alloc_init(VKHomographyFrameProcessorResult);
      -[VKHomographyFrameProcessorResult setWarpTransform:](v12, "setWarpTransform:", v22, v21, v20);
      [(VKHomographyFrameProcessor *)self sendResult:v12];
LABEL_6:
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_homographyRequest, 0);
}

@end