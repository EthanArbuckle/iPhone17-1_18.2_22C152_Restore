@interface SCMLHandler
+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5;
+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5 modelVersion:(id)a6 error:(id *)a7;
+ (BOOL)supportsANE;
+ (BOOL)supportsCPU;
+ (id)currentModelVersion;
- (NSDictionary)options;
- (OS_dispatch_queue)clientQueue;
- (SCMLHandler)initWithOptions:(id)a3 error:(id *)a4;
- (SCMLImageAnalyzer)imageAnalyzer;
- (SCMLPerformance)perfResults;
- (SCMLTextAnalyzer)textAnalyzer;
- (id)analyzeImage:(CGImage *)a3 error:(id *)a4;
- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)classifyPixelBuffer:(__CVBuffer *)a3 stagedText:(id)a4 inConversationWithIdentifier:(id)a5 error:(id *)a6;
- (id)classifyPixelBuffer:(__CVBuffer *)a3 startDate:(id)a4 endDate:(id)a5 stagedText:(id)a6 inConversationWithIdentifier:(id)a7 error:(id *)a8;
- (id)getOperatingPointDataForClassName:(id)a3 error:(id *)a4;
- (id)performanceStatistics;
- (int64_t)classifyImage:(CGImage *)a3 error:(id *)a4;
- (int64_t)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
@end

@implementation SCMLHandler

- (SCMLHandler)initWithOptions:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (a4) {
    *a4 = 0;
  }
  v47.receiver = self;
  v47.super_class = (Class)SCMLHandler;
  v8 = [(SCMLHandler *)&v47 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v8->_options, a3);
  dispatch_queue_t v10 = dispatch_queue_create("comm_safety_handler", 0);
  clientQueue = v9->_clientQueue;
  v9->_clientQueue = (OS_dispatch_queue *)v10;

  v12 = [[SCMLPerformance alloc] initWithOptions:v7];
  perfResults = v9->_perfResults;
  v9->_perfResults = v12;

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  v15 = [v7 objectForKey:SCMLUseImageAnalyzer[0]];

  if (v15)
  {
    v16 = [v7 objectForKeyedSubscript:SCMLUseImageAnalyzer[0]];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v18 = [v7 objectForKeyedSubscript:SCMLUseImageAnalyzer[0]];
    }
    else
    {
      v18 = 0;
    }
    char v19 = [v18 BOOLValue];
    *((unsigned char *)v44 + 24) = v19;
    if (isKindOfClass) {
  }
    }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v20 = [v7 objectForKeyedSubscript:SCMLUseTextAnalyzer[0]];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();
  if (v21)
  {
    v22 = [v7 objectForKeyedSubscript:SCMLUseTextAnalyzer[0]];
  }
  else
  {
    v22 = 0;
  }
  char v23 = [v22 BOOLValue];
  if (v21) {

  }
  char v42 = v23;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  v24 = [(SCMLHandler *)v9 perfResults];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __37__SCMLHandler_initWithOptions_error___block_invoke;
  v29[3] = &unk_2654A8F28;
  v32 = &v43;
  id v25 = v14;
  id v30 = v25;
  v31 = v9;
  v33 = &v35;
  v34 = v41;
  [v24 run:@"Create" block:v29];

  v26 = (void *)v36[5];
  if (a4 && v26) {
    *a4 = v26;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  if (v26) {
    v27 = 0;
  }
  else {
LABEL_21:
  }
    v27 = v9;

  return v27;
}

void __37__SCMLHandler_initWithOptions_error___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = NSURL;
    v3 = [*(id *)(a1 + 32) resourcePath];
    v16[0] = v3;
    v16[1] = @"Models/ImageModel";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v5 = [v2 fileURLWithPathComponents:v4];

    v6 = [SCMLImageAnalyzer alloc];
    id v7 = [*(id *)(a1 + 40) options];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    uint64_t v9 = [(SCMLImageAnalyzer *)v6 initWithModelURL:v5 options:v7 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = v9;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:SCMLErrorDomain[0] code:1 userInfo:0];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

- (id)analyzeImage:(CGImage *)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = (void *)MEMORY[0x26117B0B0](self, a2);
  uint64_t v8 = [(SCMLHandler *)self clientQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__SCMLHandler_analyzeImage_error___block_invoke;
  v13[3] = &unk_2654A8F50;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  v13[7] = a3;
  dispatch_sync(v8, v13);

  uint64_t v9 = (void *)v21[5];
  if (!v9)
  {
    if (a4)
    {
      uint64_t v10 = (void *)v15[5];
      if (v10)
      {
        *a4 = v10;
        uint64_t v9 = (void *)v21[5];
      }
    }
  }
  id v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __34__SCMLHandler_analyzeImage_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageAnalyzer];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 analyzeImage:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int64_t)classifyImage:(CGImage *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v7 = (void *)MEMORY[0x26117B0B0](self, a2);
  uint64_t v8 = [(SCMLHandler *)self clientQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__SCMLHandler_classifyImage_error___block_invoke;
  v12[3] = &unk_2654A8F78;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(v8, v12);

  if (a4)
  {
    uint64_t v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
  }
  int64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __35__SCMLHandler_classifyImage_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageAnalyzer];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 classifyImage:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:SCMLImageSensitivity[0]];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 unsignedIntegerValue];
  }
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v7 = (void *)MEMORY[0x26117B0B0](self, a2);
  uint64_t v8 = [(SCMLHandler *)self clientQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__SCMLHandler_analyzePixelBuffer_error___block_invoke;
  v13[3] = &unk_2654A8F50;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  v13[7] = a3;
  dispatch_sync(v8, v13);

  uint64_t v9 = (void *)v21[5];
  if (!v9)
  {
    if (a4)
    {
      int64_t v10 = (void *)v15[5];
      if (v10)
      {
        *a4 = v10;
        uint64_t v9 = (void *)v21[5];
      }
    }
  }
  id v11 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v11;
}

void __40__SCMLHandler_analyzePixelBuffer_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageAnalyzer];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 analyzePixelBuffer:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int64_t)classifyPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  id v7 = (void *)MEMORY[0x26117B0B0](self, a2);
  uint64_t v8 = [(SCMLHandler *)self clientQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__SCMLHandler_classifyPixelBuffer_error___block_invoke;
  v12[3] = &unk_2654A8F78;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(v8, v12);

  if (a4)
  {
    uint64_t v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
  }
  int64_t v10 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __41__SCMLHandler_classifyPixelBuffer_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageAnalyzer];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 classifyPixelBuffer:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:SCMLImageSensitivity[0]];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 unsignedIntegerValue];
  }
}

- (id)getOperatingPointDataForClassName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v7 = (void *)MEMORY[0x26117B0B0]();
  uint64_t v8 = [(SCMLHandler *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SCMLHandler_getOperatingPointDataForClassName_error___block_invoke;
  block[3] = &unk_2654A8FA0;
  uint64_t v15 = &v23;
  id v9 = v6;
  id v14 = v9;
  uint64_t v16 = &v17;
  dispatch_sync(v8, block);

  if (a4)
  {
    int64_t v10 = (void *)v18[5];
    if (v10) {
      *a4 = v10;
    }
  }
  id v11 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v11;
}

void __55__SCMLHandler_getOperatingPointDataForClassName_error___block_invoke(void *a1)
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = NSURL;
  uint64_t v4 = [v2 resourcePath];
  v13[0] = v4;
  v13[1] = @"Models/ImageModel";
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  id v6 = [v3 fileURLWithPathComponents:v5];

  uint64_t v7 = a1[4];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = +[SCMLImageAnalyzer getOperatingPointDataForClassName:v7 modelURL:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 stagedText:(id)a4 inConversationWithIdentifier:(id)a5 error:(id *)a6
{
  id v6 = [(SCMLHandler *)self classifyPixelBuffer:a3 startDate:0 endDate:0 stagedText:a4 inConversationWithIdentifier:a5 error:a6];

  return v6;
}

- (id)classifyPixelBuffer:(__CVBuffer *)a3 startDate:(id)a4 endDate:(id)a5 stagedText:(id)a6 inConversationWithIdentifier:(id)a7 error:(id *)a8
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v11 = [(SCMLHandler *)self clientQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__SCMLHandler_classifyPixelBuffer_startDate_endDate_stagedText_inConversationWithIdentifier_error___block_invoke;
  v15[3] = &unk_2654A8F50;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  v15[7] = a3;
  dispatch_sync(v11, v15);

  if (a8)
  {
    uint64_t v12 = (void *)v17[5];
    if (v12) {
      *a8 = v12;
    }
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __99__SCMLHandler_classifyPixelBuffer_startDate_endDate_stagedText_inConversationWithIdentifier_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageAnalyzer];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 classifyPixelBuffer:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)performanceStatistics
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(SCMLHandler *)self perfResults];
  uint64_t v5 = [v4 results];
  [v3 addEntriesFromDictionary:v5];

  uint64_t v6 = [(SCMLHandler *)self imageAnalyzer];
  uint64_t v7 = [v6 performanceResults];
  [v3 addEntriesFromDictionary:v7];

  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

+ (BOOL)supportsANE
{
  if (+[SCMLHandler supportsANE]::once_token != -1) {
    dispatch_once(&+[SCMLHandler supportsANE]::once_token, &__block_literal_global);
  }
  return +[SCMLHandler supportsANE]::supportsANE;
}

uint64_t __26__SCMLHandler_supportsANE__block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result)
  {
    uint64_t result = MGGetBoolAnswer();
    +[SCMLHandler supportsANE]::supportsANE = result;
  }
  return result;
}

+ (BOOL)supportsCPU
{
  return [(id)objc_opt_class() supportsANE] ^ 1;
}

+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = +[SCMLHandler currentModelVersion];
  uint64_t v11 = 0;
  LOBYTE(a5) = [a1 isImageSensitiveForLabel:v8 confidenceScore:a5 classificationMode:v9 modelVersion:&v11 error:a4];

  return a5;
}

+ (id)currentModelVersion
{
  return @"1.7.9";
}

+ (BOOL)isImageSensitiveForLabel:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5 modelVersion:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = +[SCMLImageModelThresholds instance];
  [v13 thresholdForLabel:v11 classificationMode:a5 modelVersion:v12 error:a7];
  LOBYTE(a7) = v14 <= a4;

  return (char)a7;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return (SCMLImageAnalyzer *)objc_getProperty(self, a2, 16, 1);
}

- (SCMLTextAnalyzer)textAnalyzer
{
  return (SCMLTextAnalyzer *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (SCMLPerformance)perfResults
{
  return self->_perfResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfResults, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textAnalyzer, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end