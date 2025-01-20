@interface PXGPPTTextRenderingTester
- (PXGPPTStringsLayout)stringsLayout;
- (PXGStringTextureProvider)stringTextureProvider;
- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5;
- (id)textureProviderDidProvideCGImageHandler;
- (void)runRenderTextTestWithOptions:(id)a3 latencyMeter:(id)a4 completionHandler:(id)a5 failureHandler:(id)a6;
- (void)setStringTextureProvider:(id)a3;
- (void)setStringsLayout:(id)a3;
- (void)setTextureProviderDidProvideCGImageHandler:(id)a3;
- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8;
@end

@implementation PXGPPTTextRenderingTester

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textureProviderDidProvideCGImageHandler, 0);
  objc_storeStrong((id *)&self->_stringsLayout, 0);
  objc_storeStrong((id *)&self->_stringTextureProvider, 0);
}

- (void)setTextureProviderDidProvideCGImageHandler:(id)a3
{
}

- (id)textureProviderDidProvideCGImageHandler
{
  return self->_textureProviderDidProvideCGImageHandler;
}

- (void)setStringsLayout:(id)a3
{
}

- (PXGPPTStringsLayout)stringsLayout
{
  return self->_stringsLayout;
}

- (void)setStringTextureProvider:(id)a3
{
}

- (PXGStringTextureProvider)stringTextureProvider
{
  return self->_stringTextureProvider;
}

- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5
{
  return 0;
}

- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8
{
  v10 = [(PXGPPTTextRenderingTester *)self textureProviderDidProvideCGImageHandler];

  if (v10)
  {
    v11 = [(PXGPPTTextRenderingTester *)self textureProviderDidProvideCGImageHandler];
    v11[2](v11, a4);
  }
}

- (void)runRenderTextTestWithOptions:(id)a3 latencyMeter:(id)a4 completionHandler:(id)a5 failureHandler:(id)a6
{
  id v28 = a3;
  id v30 = a4;
  id v31 = a5;
  id v29 = a6;
  [v30 setMeasurementsUnit:@"ms"];
  v10 = objc_alloc_init(PXGStringTextureProvider);
  v11 = (void *)MEMORY[0x1E4F14428];
  [(PXGTextureProvider *)v10 setRequestQueue:MEMORY[0x1E4F14428]];
  [(PXGTextureProvider *)v10 setProcessingQueue:v11];

  [(PXGTextureProvider *)v10 setDelegate:self];
  v12 = [[PXGPPTStringsLayout alloc] initWithStringCount:5 localeCodes:&unk_1F02D5728];
  -[PXGLayout setReferenceSize:](v12, "setReferenceSize:", 600.0, 400.0);
  [(PXGLayout *)v12 setDisplayScale:2.0];
  [(PXGLayout *)v12 updateIfNeeded];
  [(PXGPPTTextRenderingTester *)self setStringTextureProvider:v10];
  [(PXGPPTTextRenderingTester *)self setStringsLayout:v12];
  uint64_t v13 = [(PXGItemsLayout *)v12 numberOfItems];
  id v14 = [(PXGLayout *)v12 spriteDataStore];
  uint64_t v15 = [v14 geometries];

  id v16 = [(PXGLayout *)v12 spriteDataStore];
  uint64_t v17 = [v16 styles];

  id v18 = [(PXGLayout *)v12 spriteDataStore];
  uint64_t v19 = [v18 infos];

  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  int v53 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke;
  aBlock[3] = &unk_1E5DD2228;
  v46 = v51;
  v20 = v10;
  v44 = v20;
  v47 = v52;
  uint64_t v48 = v15;
  uint64_t v49 = v17;
  uint64_t v50 = v19;
  v21 = v12;
  v45 = v21;
  v22 = _Block_copy(aBlock);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__295926;
  v41[4] = __Block_byref_object_dispose__295927;
  v23 = self;
  v42 = v23;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke_13;
  v32[3] = &unk_1E5DD2250;
  id v24 = v29;
  id v34 = v24;
  v37 = v52;
  v38 = v51;
  id v25 = v30;
  v39 = v41;
  uint64_t v40 = v13;
  id v33 = v25;
  id v26 = v31;
  id v35 = v26;
  v27 = v22;
  id v36 = v27;
  [(PXGPPTTextRenderingTester *)v23 setTextureProviderDidProvideCGImageHandler:v32];
  v27[2](v27);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
}

uint64_t __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke(void *a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v2;
  uint64_t v3 = a1[8];
  uint64_t v4 = *(unsigned int *)(*(void *)(a1[7] + 8) + 24) | 0x100000000;
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[10];
  v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  return [v7 requestTexturesForSpritesInRange:v4 geometries:v3 styles:v5 infos:v6 inLayout:v8];
}

void __104__PXGPPTTextRenderingTester_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler___block_invoke_13(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    [*(id *)(a1 + 32) reportLatency:2 forOutputQuality:(v3 - *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) * 1000.0];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to render a texture with index: %d", *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  if (*(void *)(a1 + 88) == *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setStringTextureProvider:0];
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setStringsLayout:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
}

@end