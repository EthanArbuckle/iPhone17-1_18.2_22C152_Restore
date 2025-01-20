@interface SCMLVideoAnalyzer
- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (SCMLHandler)handler;
- (SCMLImageAnalyzer)imageAnalyzer;
- (SCMLVideoAnalyzer)initWithMLHandler:(id)a3;
- (SCMLVideoDecoder)decoder;
- (SCMLVideoFrameProcessor)frameProcessor;
- (id)analyze:(id *)a3;
- (id)analyzeVideoURL:(id)a3 config:(id)a4 error:(id *)a5;
- (id)finalizeAnalysis:(id *)a3;
- (void)setDecoder:(id)a3;
- (void)setFrameProcessor:(id)a3;
- (void)startAnalysisWithConfig:(id)a3;
@end

@implementation SCMLVideoAnalyzer

- (SCMLVideoAnalyzer)initWithMLHandler:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCMLVideoAnalyzer;
  v6 = [(SCMLVideoAnalyzer *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_handler, a3);
    uint64_t v8 = [v5 imageAnalyzer];
    imageAnalyzer = v7->_imageAnalyzer;
    v7->_imageAnalyzer = (SCMLImageAnalyzer *)v8;

    v10 = [SCMLVideoFrameProcessor alloc];
    v11 = [v5 imageAnalyzer];
    uint64_t v12 = [(SCMLVideoFrameProcessor *)v10 initWithImageAnalyzer:v11];
    frameProcessor = v7->_frameProcessor;
    v7->_frameProcessor = (SCMLVideoFrameProcessor *)v12;
  }
  return v7;
}

- (id)analyzeVideoURL:(id)a3 config:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v10 = (void *)MEMORY[0x26117B0B0]();
  v11 = [(SCMLVideoAnalyzer *)self handler];
  uint64_t v12 = [v11 clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCMLVideoAnalyzer_analyzeVideoURL_config_error___block_invoke;
  block[3] = &unk_2654A9218;
  id v13 = v9;
  id v19 = v13;
  v20 = self;
  id v14 = v8;
  id v21 = v14;
  v22 = &v24;
  v23 = &v30;
  dispatch_sync(v12, block);

  objc_super v15 = (void *)v25[5];
  if (v15)
  {
    id v16 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    id v16 = (id)v31[5];
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);

  return v16;
}

void __50__SCMLVideoAnalyzer_analyzeVideoURL_config_error___block_invoke(uint64_t a1)
{
  v2 = [[SCMLVideoDecoder alloc] initWithConfig:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 40) frameProcessor];
  [v3 startAnalysisWithConfig:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  BOOL v6 = [(SCMLVideoDecoder *)v2 startDecodingVideoURL:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    if (([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) sensitive] & 1) == 0)
    {
      v7 = 0;
      do
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        id v23 = *(id *)(v8 + 40);
        id v9 = [(SCMLVideoDecoder *)v2 nextFrameWithError:&v23];
        objc_storeStrong((id *)(v8 + 40), v23);

        if (!v9) {
          break;
        }
        v10 = [*(id *)(a1 + 40) frameProcessor];
        [v10 pushFrame:v9];

        v11 = [*(id *)(a1 + 40) frameProcessor];
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        id v22 = *(id *)(v12 + 40);
        uint64_t v13 = [v11 analyze:&v22];
        objc_storeStrong((id *)(v12 + 40), v22);
        uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
        objc_super v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        v7 = v9;
      }
      while (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) sensitive]);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      && ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) sensitive] & 1) == 0)
    {
      id v16 = [*(id *)(a1 + 40) frameProcessor];
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      id v21 = *(id *)(v17 + 40);
      uint64_t v18 = [v16 finalizeAnalysis:&v21];
      objc_storeStrong((id *)(v17 + 40), v21);
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
}

- (void)startAnalysisWithConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x26117B0B0]();
  BOOL v6 = [(SCMLVideoAnalyzer *)self handler];
  v7 = [v6 clientQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__SCMLVideoAnalyzer_startAnalysisWithConfig___block_invoke;
  v9[3] = &unk_2654A9240;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  dispatch_sync(v7, v9);
}

void __45__SCMLVideoAnalyzer_startAnalysisWithConfig___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frameProcessor];
  [v2 startAnalysisWithConfig:*(void *)(a1 + 40)];
}

- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v6 = (void *)MEMORY[0x26117B0B0](self, a2, a3, a4);
  v7 = [(SCMLVideoAnalyzer *)self handler];
  id v8 = [v7 clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SCMLVideoAnalyzer_addFrameBuffer_error___block_invoke;
  block[3] = &unk_2654A9268;
  void block[4] = self;
  block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  LOBYTE(v6) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v6;
}

void __42__SCMLVideoAnalyzer_addFrameBuffer_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frameProcessor];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 addFrameBuffer:*(void *)(a1 + 48)];
}

- (id)analyze:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v5 = (void *)MEMORY[0x26117B0B0](self, a2);
  BOOL v6 = [(SCMLVideoAnalyzer *)self handler];
  v7 = [v6 clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SCMLVideoAnalyzer_analyze___block_invoke;
  block[3] = &unk_2654A9290;
  void block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v7, block);

  if (a3)
  {
    id v8 = (void *)v13[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

void __29__SCMLVideoAnalyzer_analyze___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frameProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 analyze:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)finalizeAnalysis:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__3;
  id v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v5 = (void *)MEMORY[0x26117B0B0](self, a2);
  BOOL v6 = [(SCMLVideoAnalyzer *)self handler];
  v7 = [v6 clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SCMLVideoAnalyzer_finalizeAnalysis___block_invoke;
  block[3] = &unk_2654A9290;
  void block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(v7, block);

  if (a3)
  {
    id v8 = (void *)v13[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

void __38__SCMLVideoAnalyzer_finalizeAnalysis___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) frameProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 finalizeAnalysis:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (SCMLHandler)handler
{
  return self->_handler;
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (SCMLVideoFrameProcessor)frameProcessor
{
  return self->_frameProcessor;
}

- (void)setFrameProcessor:(id)a3
{
}

- (SCMLVideoDecoder)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);

  objc_storeStrong((id *)&self->_handler, 0);
}

@end