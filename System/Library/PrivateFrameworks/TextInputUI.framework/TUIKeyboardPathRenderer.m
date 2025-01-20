@interface TUIKeyboardPathRenderer
+ (id)generatePipelineDescriptorsForMTKView:(id)a3;
- (BOOL)paused;
- (TUIKeyboardPathRenderer)initWithMTKView:(id)a3 generatePipelineDescriptors:(BOOL)a4;
- (TUIKeyboardPathRendererDataSource)datasource;
- (__n128)pathColor;
- (void)completeRendering;
- (void)drawInMTKView:(id)a3;
- (void)keyboardDidHide;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)setDatasource:(id)a3;
- (void)setPathColor:(TUIKeyboardPathRenderer *)self;
- (void)setPaused:(BOOL)a3;
- (void)setupMetal;
- (void)setupPipeline;
- (void)updateVertexBufferForPaths:(id)a3;
@end

@implementation TUIKeyboardPathRenderer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setPathColor:(TUIKeyboardPathRenderer *)self
{
  *(_OWORD *)self->_pathColor = v2;
}

- (__n128)pathColor
{
  return a1[8];
}

- (void)setDatasource:(id)a3
{
}

- (TUIKeyboardPathRendererDataSource)datasource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);
  return (TUIKeyboardPathRendererDataSource *)WeakRetained;
}

- (void)keyboardDidHide
{
  [(MTKView *)self->_view releaseDrawables];
  v3 = [(MTKView *)self->_view layer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(MTKView *)self->_view layer];
    [v5 discardContents];
    [v5 removeBackBuffers];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTKView *)self->_view isPaused] != a3)
  {
    view = self->_view;
    [(MTKView *)view setPaused:v3];
  }
}

- (BOOL)paused
{
  return [(MTKView *)self->_view isPaused];
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  LODWORD(v5) = a4.width;
  HIDWORD(v5) = a4.height;
  *(void *)self->_viewportPixelSize = v5;
  id v6 = a3;
  [v6 bounds];
  *(_DWORD *)self->_viewportPointSize = v7;
  [v6 bounds];
  double v9 = v8;

  uint64_t v10 = *(void *)self->_viewportPointSize;
  *(_DWORD *)&self->_viewportPointSize[4] = v9;
  if (v10)
  {
    unsigned int v11 = *(void *)self->_viewportPixelSize / v10;
    if (v11 <= 1) {
      unsigned int v11 = 1;
    }
    float v12 = (float)v11;
  }
  else
  {
    float v12 = 1.0;
  }
  self->_scale = v12;
}

- (void)completeRendering
{
  self->_drawing = 0;
  if (!self->_vertexCount) {
    [(TUIKeyboardPathRenderer *)self setPaused:1];
  }
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  if (self->_setupCompleted && !self->_drawing)
  {
    if (self->_pipelineState)
    {
      uint32x2_t v5 = (uint32x2_t)vceqz_s32(*(int32x2_t *)self->_viewportPointSize);
      if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) == 0)
      {
        id v6 = [(TUIKeyboardPathRenderer *)self datasource];
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          double v8 = [(TUIKeyboardPathRenderer *)self datasource];
          double v9 = [v8 pathsToRender];

          [(TUIKeyboardPathRenderer *)self updateVertexBufferForPaths:v9];
        }
        uint64_t v10 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
        [v10 setLabel:@"PathCommand"];
        unsigned int v11 = [v4 currentRenderPassDescriptor];
        if (v11)
        {
          float v12 = [v10 renderCommandEncoderWithDescriptor:v11];
          [v12 setLabel:@"PathRenderEncoder"];
          [v12 setFrontFacingWinding:0];
          uint64_t v13 = *(void *)self->_viewportPixelSize;
          location[0] = 0;
          location[1] = 0;
          v14.i64[0] = v13;
          v14.i64[1] = HIDWORD(v13);
          float64x2_t v19 = vcvtq_f64_u64(v14);
          long long v20 = xmmword_18D516070;
          [v12 setViewport:location];
          [v12 setRenderPipelineState:self->_pipelineState];
          [v12 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
          [v12 setVertexBytes:self->_viewportPointSize length:8 atIndex:1];
          [v12 setFragmentBytes:self->_pathColor length:16 atIndex:2];
          if (self->_vertexCount) {
            objc_msgSend(v12, "drawPrimitives:vertexStart:vertexCount:", 3, 0);
          }
          [v12 endEncoding];
          objc_initWeak(location, self);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke;
          v16[3] = &unk_1E55939D8;
          objc_copyWeak(&v17, location);
          [v10 addCompletedHandler:v16];
          v15 = [v4 currentDrawable];
          [v10 presentDrawable:v15];

          objc_destroyWeak(&v17);
          objc_destroyWeak(location);
        }
        [v10 commit];
      }
    }
  }
}

void __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke_2;
  block[3] = &unk_1E5593EA0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __41__TUIKeyboardPathRenderer_drawInMTKView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained completeRendering];
    id WeakRetained = v2;
  }
}

- (void)updateVertexBufferForPaths:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_unint64_t vertexCount = 0;
  uint64_t v5 = [(MTLBuffer *)self->_vertexBuffer contents];
  float scale = self->_scale;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    float v45 = 0.5 / scale;
    uint64_t v41 = *(void *)v48;
    do
    {
      uint64_t v10 = 0;
      uint64_t v42 = v8;
      do
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v10;
        unsigned int v11 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
        float v12 = objc_msgSend(v11, "nonSentinelPoints", v41);
        unint64_t v13 = [v12 count];

        if (v13 >= 2)
        {
          uint64x2_t v14 = [v11 nonSentinelPoints];
          v15 = [v14 objectAtIndex:0];

          [v15 point];
          v17.f64[1] = v16;
          float32x2_t v18 = vcvt_f32_f64(v17);
          float32x2_t v19 = v18;
          float32x2_t v20 = v18;
          unint64_t v21 = 1;
          do
          {
            float32x2_t v22 = v20;
            float32x2_t v23 = v19;
            float32x2_t v24 = v18;
            v25 = [v11 nonSentinelPoints];
            v26 = [v25 objectAtIndex:v21];

            [v26 decay];
            *(float *)&double v27 = (float)v13 * v27 + 0.0;
            float v46 = (float)((float)((float)(1.0 - (float)((float)((float)v21 - *(float *)&v27) / (float)v13)) * -19.7)
                        + 19.7)
                * 0.5;
            [v26 point];
            v29.f64[1] = v28;
            float32x2_t v18 = vcvt_f32_f64(v29);
            *(float32x2_t *)&v29.f64[0] = vsub_f32(v18, v24);
            float32x2_t v30 = vmul_f32(*(float32x2_t *)&v29.f64[0], *(float32x2_t *)&v29.f64[0]);
            v30.i32[0] = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
            float32x2_t v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
            float32x2_t v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
            *(float32x2_t *)&v29.f64[0] = vmul_n_f32(*(float32x2_t *)&v29.f64[0], vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
            v30.f32[0] = -*(float *)v29.f64;
            LODWORD(v29.f64[0]) = vdup_lane_s32(*(int32x2_t *)&v29.f64[0], 1).u32[0];
            HIDWORD(v29.f64[0]) = v30.i32[0];
            *(float32x2_t *)&v29.f64[0] = vmul_n_f32(*(float32x2_t *)&v29.f64[0], v46);
            float32x2_t v19 = vsub_f32(v18, *(float32x2_t *)&v29.f64[0]);
            float32x2_t v20 = vadd_f32(*(float32x2_t *)&v29.f64[0], v18);
            if (v46 >= v45)
            {
              uint32x2_t v33 = (uint32x2_t)vceq_f32(v24, v18);
              if ((vpmin_u32(v33, v33).u32[0] & 0x80000000) == 0)
              {
                unint64_t vertexCount = self->_vertexCount;
                if (vertexCount >> 12 <= 2)
                {
                  *(float32x2_t *)(v5 + 8 * vertexCount) = v23;
                  self->_unint64_t vertexCount = vertexCount + 1;
                  if (vertexCount != 12287)
                  {
                    *(float32x2_t *)(v5 + 8 * (vertexCount + 1)) = v22;
                    self->_unint64_t vertexCount = vertexCount + 2;
                    if (vertexCount <= 0x2FFD)
                    {
                      *(float32x2_t *)(v5 + 8 * (vertexCount + 2)) = v19;
                      self->_unint64_t vertexCount = vertexCount + 3;
                      if (vertexCount != 12285)
                      {
                        *(float32x2_t *)(v5 + 8 * (vertexCount + 3)) = v19;
                        self->_unint64_t vertexCount = vertexCount + 4;
                        if (vertexCount >> 2 <= 0xBFE)
                        {
                          *(float32x2_t *)(v5 + 8 * (vertexCount + 4)) = v22;
                          self->_unint64_t vertexCount = vertexCount + 5;
                          if (vertexCount != 12283)
                          {
                            *(float32x2_t *)(v5 + 8 * (vertexCount + 5)) = v20;
                            self->_unint64_t vertexCount = vertexCount + 6;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            if (v21 + 2 < v13 || v21 == v13 - 1) {
              v21 += 2;
            }
            else {
              unint64_t v21 = v13 - 1;
            }
            if (v21 >= v13 && v46 >= v45)
            {
              float32x2_t v36 = vsub_f32(v20, v18);
              unint64_t v37 = self->_vertexCount;
              uint64_t v38 = 12;
              float32x2_t v39 = v20;
              do
              {
                float32x2_t v40 = v39;
                float32x2_t v36 = vmla_lane_f32(vmul_n_f32((float32x2_t)0x3E8483EE3F7746EALL, v36.f32[0]), (float32x2_t)0x3F7746EABE8483EELL, v36, 1);
                float32x2_t v39 = vadd_f32(v36, v18);
                if (v37 >> 12 <= 2)
                {
                  *(float32x2_t *)(v5 + 8 * v37) = v40;
                  self->_unint64_t vertexCount = v37 + 1;
                  if (v37 == 12287
                    || (*(float32x2_t *)(v5 + 8 * (v37 + 1)) = v18, self->_unint64_t vertexCount = v37 + 2, v37 > 0x2FFD))
                  {
                    unint64_t v37 = 12288;
                  }
                  else
                  {
                    *(float32x2_t *)(v5 + 8 * (v37 + 2)) = v39;
                    v37 += 3;
                    self->_unint64_t vertexCount = v37;
                  }
                }
                --v38;
              }
              while (v38);
            }
          }
          while (v21 < v13);

          uint64_t v9 = v41;
          uint64_t v8 = v42;
        }
        uint64_t v10 = v44 + 1;
      }
      while (v44 + 1 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v8);
  }
}

- (void)setupPipeline
{
  device = self->_device;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v44 = 0;
  uint64_t v5 = (void *)[(MTLDevice *)device newDefaultLibraryWithBundle:v4 error:&v44];
  id v6 = v44;

  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 pathForResource:@"TextInputUI_iOS" ofType:@"pipelinelib"];

    float32x2_t v40 = (void *)v8;
    if (v8 && !self->_generatePipelineDescriptors)
    {
      uint64_t v9 = self->_device;
      id v43 = v6;
      uint64_t v10 = (MTLPipelineLibrarySPI *)[(MTLDevice *)v9 newPipelineLibraryWithFilePath:v8 error:&v43];
      id v11 = v43;

      pipelineLibrary = self->_pipelineLibrary;
      self->_pipelineLibrary = v10;

      id v6 = v11;
    }
    unint64_t v13 = v6;
    uint64x2_t v14 = (void *)[v5 newFunctionWithName:@"pathVertexShader"];
    v15 = (void *)[v5 newFunctionWithName:@"pathFragmentShader"];
    id v16 = objc_alloc_init(MEMORY[0x1E4F35358]);
    float64x2_t v17 = [v16 attributes];
    float32x2_t v18 = [v17 objectAtIndexedSubscript:0];
    [v18 setFormat:29];

    float32x2_t v19 = [v16 attributes];
    float32x2_t v20 = [v19 objectAtIndexedSubscript:0];
    [v20 setOffset:0];

    unint64_t v21 = [v16 attributes];
    float32x2_t v22 = [v21 objectAtIndexedSubscript:0];
    [v22 setBufferIndex:0];

    float32x2_t v23 = [v16 layouts];
    float32x2_t v24 = [v23 objectAtIndexedSubscript:0];
    [v24 setStride:8];

    v25 = [v16 layouts];
    v26 = [v25 objectAtIndexedSubscript:0];
    [v26 setStepRate:1];

    double v27 = [v16 layouts];
    float64_t v28 = [v27 objectAtIndexedSubscript:0];
    [v28 setStepFunction:1];

    id v29 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    [v29 setLabel:@"PathPipeline"];
    [v29 setVertexDescriptor:v16];
    [v29 setVertexFunction:v14];
    [v29 setFragmentFunction:v15];
    unint64_t colorPixelFormat = self->_colorPixelFormat;
    float32x2_t v31 = [v29 colorAttachments];
    float32x2_t v32 = [v31 objectAtIndexedSubscript:0];
    [v32 setPixelFormat:colorPixelFormat];

    [v29 setDepthAttachmentPixelFormat:0];
    [v29 setSampleCount:1];
    [v29 setPipelineLibrary:self->_pipelineLibrary];
    uint32x2_t v33 = self->_device;
    id v42 = v13;
    v34 = (MTLRenderPipelineState *)[(MTLDevice *)v33 newRenderPipelineStateWithDescriptor:v29 error:&v42];
    id v6 = v42;

    pipelineState = self->_pipelineState;
    self->_pipelineState = v34;

    if (!self->_pipelineState) {
      NSLog(&cfstr_FailedToCreate.isa, v6, v40);
    }
    float32x2_t v36 = (MTLCommandQueue *)[(MTLDevice *)self->_device newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v36;

    uint64_t v38 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:98304 options:0];
    vertexBuffer = self->_vertexBuffer;
    self->_vertexBuffer = v38;

    [(MTLBuffer *)self->_vertexBuffer setLabel:@"PathVertices"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__TUIKeyboardPathRenderer_setupPipeline__block_invoke;
    block[3] = &unk_1E55941A8;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    NSLog(&cfstr_FailedToLoadDe.isa, v6);
  }
}

uint64_t __40__TUIKeyboardPathRenderer_setupPipeline__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[3];
  [v3 drawableSize];
  uint64_t result = objc_msgSend(v2, "mtkView:drawableSizeWillChange:", v3);
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  return result;
}

- (void)setupMetal
{
  [(MTKView *)self->_view setSampleCount:1];
  -[MTKView setClearColor:](self->_view, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  [(MTKView *)self->_view setDepthStencilPixelFormat:0];
  self->_unint64_t colorPixelFormat = [(MTKView *)self->_view colorPixelFormat];
  if (self->_generatePipelineDescriptors)
  {
    [(TUIKeyboardPathRenderer *)self setupPipeline];
  }
  else
  {
    BOOL v3 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TUIKeyboardPathRenderer_setupMetal__block_invoke;
    block[3] = &unk_1E55941A8;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __37__TUIKeyboardPathRenderer_setupMetal__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setupPipeline];
  if (![MEMORY[0x1E4FB18E0] isKeyboardProcess])
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:*(void *)(a1 + 32) selector:sel_keyboardDidHide name:*MEMORY[0x1E4FB2C20] object:0];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel_keyboardDidHide name:*MEMORY[0x1E4FB2738] object:0];
}

- (TUIKeyboardPathRenderer)initWithMTKView:(id)a3 generatePipelineDescriptors:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIKeyboardPathRenderer;
  uint64_t v8 = [(TUIKeyboardPathRenderer *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 device];
    device = v8->_device;
    v8->_device = (MTLDevice *)v9;

    objc_storeStrong((id *)&v8->_view, a3);
    [(MTKView *)v8->_view setDelegate:v8];
    [(MTKView *)v8->_view setAutoResizeDrawable:0];
    v8->_generatePipelineDescriptors = a4;
    [(TUIKeyboardPathRenderer *)v8 setupMetal];
  }

  return v8;
}

+ (id)generatePipelineDescriptorsForMTKView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];
  [v4 startCollectingPipelineDescriptors];

  uint64_t v5 = [[TUIKeyboardPathRenderer alloc] initWithMTKView:v3 generatePipelineDescriptors:1];
  id v6 = [v3 device];

  id v7 = [v6 endCollectingPipelineDescriptors];

  return v7;
}

@end