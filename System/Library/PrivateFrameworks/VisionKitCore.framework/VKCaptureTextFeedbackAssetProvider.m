@interface VKCaptureTextFeedbackAssetProvider
- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4;
- (VKCaptureTextAnalysisRequest)request;
- (VKCaptureTextDetectionResult)detectionResult;
- (VKCaptureTextFeedbackAssetProvider)initWithRequest:(id)a3 detectionResult:(id)a4;
@end

@implementation VKCaptureTextFeedbackAssetProvider

- (VKCaptureTextFeedbackAssetProvider)initWithRequest:(id)a3 detectionResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCaptureTextFeedbackAssetProvider;
  v9 = [(VKCaptureTextFeedbackAssetProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_detectionResult, a4);
  }

  return v10;
}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(VKCaptureTextFeedbackAssetProvider *)self request];
  if ([v7 saveAssetsToFeedbackAttachmentsFolder:v6 error:a4])
  {
    id v8 = [v7 image];
    [v8 size];
    UIGraphicsBeginImageContext(v46);
    objc_msgSend(v8, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v9 = [(VKCaptureTextFeedbackAssetProvider *)self detectionResult];
    v10 = [MEMORY[0x1E4F428B8] magentaColor];
    [v10 setStroke];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v11 = [v9 lineQuads];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v39 + 1) + 8 * i) path];
          [v16 stroke];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v13);
    }

    v17 = [MEMORY[0x1E4F428B8] redColor];
    [v17 setStroke];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = objc_msgSend(v9, "blockQuads", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v35 + 1) + 8 * j) path];
          [v23 stroke];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v20);
    }

    v24 = [MEMORY[0x1E4F428B8] blueColor];
    [v24 setStroke];

    v25 = [v9 boundingQuad];
    v26 = [v25 path];
    [v26 stroke];

    v27 = [MEMORY[0x1E4F428B8] yellowColor];
    [v27 setStroke];

    v28 = [v7 focusQuad];
    v29 = [v28 path];
    [v29 stroke];

    v30 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v31 = objc_msgSend(v30, "vk_PNGData");
    v32 = [v6 URLByAppendingPathComponent:@"RequestAssetAnnotated.png"];
    char v33 = [v31 writeToURL:v32 options:2 error:a4];
  }
  else
  {
    char v33 = 0;
  }

  return v33;
}

- (VKCaptureTextAnalysisRequest)request
{
  return self->_request;
}

- (VKCaptureTextDetectionResult)detectionResult
{
  return self->_detectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end