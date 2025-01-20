@interface PBUICALocalRenderer
- (BOOL)archiveRenderingOfRequest:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)usesCoreImageForState:(PBUIRenderState *)a3;
- (CGColorSpace)colorSpace;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (NSString)identifier;
- (OS_os_log)logger;
- (PBUICALocalRenderer)init;
- (PBUICALocalRenderer)initWithColorSpace:(CGColorSpace *)a3;
- (PBUICALocalRenderer)initWithDevice:(id)a3 colorSpace:(CGColorSpace *)a4;
- (PBUICALocalRenderer)initWithDevice:(id)a3 commmandQueue:(id)a4 colorSpace:(CGColorSpace *)a5;
- (id)CIContext;
- (id)newCommandBufferWithCompletion:(id)a3;
- (id)newSurfaceWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 outOptions:(unint64_t *)a5;
- (id)newTextureWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4;
- (id)nextFrameHandlerWithCompletion:(id)a3;
- (id)renderCIImage:(id)a3 toSurface:(id)a4 completionHandler:(id)a5;
- (id)renderFrameToTexture:(id)a3 configureWithTransaction:(id)a4 completionHandler:(id)a5;
- (id)renderRequest:(id)a3 error:(id *)a4;
- (id)renderState:(PBUIRenderState *)a3 error:(id *)a4;
- (id)rendererForDestination:(id)a3;
- (unint64_t)pixelFormatForBSIOSurfaceOptions:(unint64_t)a3;
- (void)configureWithTransaction:(id)a3;
- (void)dealloc;
- (void)renderRequest:(id)a3 completionHandler:(id)a4;
- (void)renderState:(PBUIRenderState *)a3 completionHandler:(id)a4;
- (void)resetState;
- (void)setIdentifier:(id)a3;
- (void)setLogger:(id)a3;
- (void)setRenderState:(PBUIRenderState *)a3;
- (void)updateStateWithTransaction:(PBUIRenderState *)a3;
@end

@implementation PBUICALocalRenderer

- (PBUICALocalRenderer)init
{
  return [(PBUICALocalRenderer *)self initWithColorSpace:0];
}

- (PBUICALocalRenderer)initWithColorSpace:(CGColorSpace *)a3
{
  id v5 = MTLCreateSystemDefaultDevice();
  if (v5)
  {
    self = [(PBUICALocalRenderer *)self initWithDevice:v5 colorSpace:a3];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PBUICALocalRenderer)initWithDevice:(id)a3 colorSpace:(CGColorSpace *)a4
{
  id v6 = a3;
  v7 = (void *)[v6 newCommandQueue];
  if (v7)
  {
    self = [(PBUICALocalRenderer *)self initWithDevice:v6 commmandQueue:v7 colorSpace:a4];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PBUICALocalRenderer)initWithDevice:(id)a3 commmandQueue:(id)a4 colorSpace:(CGColorSpace *)a5
{
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PBUICALocalRenderer;
  v11 = [(PBUICALocalRenderer *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a3);
    objc_storeStrong((id *)&v12->_commandQueue, a4);
    uint64_t v13 = PBUIRenderingLogLocalRenderer();
    logger = v12->_logger;
    v12->_logger = (OS_os_log *)v13;

    v15 = [[PBUIViewportLayer alloc] initWithScale:1.0];
    viewportLayer = v12->_viewportLayer;
    v12->_viewportLayer = v15;

    v12->_encodingLock._os_unfair_lock_opaque = 0;
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)@"PBUICALocalRenderer";

    commandQueue = v12->_commandQueue;
    v19 = [NSString stringWithFormat:@"%@.command-queue", v12->_identifier];
    [(MTLCommandQueue *)commandQueue setLabel:v19];

    if (a5)
    {
      CGColorSpaceRef v20 = CGColorSpaceRetain(a5);
    }
    else
    {
      int v21 = MGGetBoolAnswer();
      v22 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
      if (!v21) {
        v22 = (CFStringRef *)MEMORY[0x1E4F1DC98];
      }
      CGColorSpaceRef v20 = CGColorSpaceCreateWithName(*v22);
    }
    v12->_colorSpace = v20;
  }

  return v12;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  self->_colorSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)PBUICALocalRenderer;
  [(PBUICALocalRenderer *)&v3 dealloc];
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setLogger:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = (OS_os_log *)v4;
  }
  else
  {
    PBUIRenderingLogLocalRenderer();
    id v5 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
  }
  logger = self->_logger;
  self->_logger = v5;
}

- (void)setIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = (NSString *)[a3 copy];
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  else
  {
    identifier = self->_identifier;
    self->_identifier = (NSString *)@"PBUICALocalRenderer";
  }

  commandQueue = self->_commandQueue;
  id v7 = [NSString stringWithFormat:@"%@.command-queue", self->_identifier];
  [(MTLCommandQueue *)commandQueue setLabel:v7];
}

- (id)renderState:(PBUIRenderState *)a3 error:(id *)a4
{
  CGSize outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  double scale = a3->scale;
  id v7 = layer;
  objc_super v24 = v7;
  v8 = a3->image;
  v25 = v8;
  if (self)
  {
    if ([(PBUICALocalRenderer *)self usesCoreImageForState:&outputPixelSize])
    {
      uint64_t v21 = 0;
      id v9 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", self->_colorSpace, &v21, a3->outputPixelSize.width, a3->outputPixelSize.height);
      id v10 = [(PBUICALocalRenderer *)self renderCIImage:a3->image toSurface:v9 completionHandler:0];
      [v10 waitUntilCompleted];

      goto LABEL_6;
    }
  }
  else
  {
    v11 = v8;
  }
  id v12 = -[PBUICALocalRenderer newTextureWithSize:colorSpace:](self, "newTextureWithSize:colorSpace:", self->_colorSpace, a3->outputPixelSize.width, a3->outputPixelSize.height);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __41__PBUICALocalRenderer_renderState_error___block_invoke;
  v16[3] = &unk_1F16053C8;
  v16[4] = self;
  CGSize v17 = a3->outputPixelSize;
  uint64_t v13 = a3->layer;
  double v18 = a3->scale;
  v19 = v13;
  CGColorSpaceRef v20 = a3->image;
  v14 = [(PBUICALocalRenderer *)self renderFrameToTexture:v12 configureWithTransaction:v16 completionHandler:0];
  [v14 waitUntilCompleted];
  [(PBUICALocalRenderer *)self resetState];
  id v9 = (id)[v12 iosurface];
  [v12 setPurgeableState:4];

LABEL_6:
  return v9;
}

void __41__PBUICALocalRenderer_renderState_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  objc_super v3 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = v3;
  id v9 = v4;
  id v5 = *(id *)(a1 + 72);
  id v10 = v5;
  if (v2)
  {
    [v2 setRenderState:&v7];
  }
  else
  {
    id v6 = v5;
  }
}

- (void)renderState:(PBUIRenderState *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  CGSize outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  double scale = a3->scale;
  uint64_t v8 = layer;
  v34 = v8;
  id v9 = a3->image;
  v35 = v9;
  if (!self)
  {
    v15 = v9;

    goto LABEL_5;
  }
  if (![(PBUICALocalRenderer *)self usesCoreImageForState:&outputPixelSize])
  {
LABEL_5:
    id v16 = -[PBUICALocalRenderer newTextureWithSize:colorSpace:](self, "newTextureWithSize:colorSpace:", self->_colorSpace, a3->outputPixelSize.width, a3->outputPixelSize.height);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3254779904;
    v23[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_2;
    v23[3] = &unk_1F16053C8;
    v23[4] = self;
    CGSize v24 = a3->outputPixelSize;
    CGSize v17 = a3->layer;
    double v25 = a3->scale;
    v26 = v17;
    v27 = a3->image;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_3;
    v19[3] = &unk_1E62B42F0;
    id v12 = v16;
    id v20 = v12;
    uint64_t v21 = self;
    id v22 = v6;
    id v18 = [(PBUICALocalRenderer *)self renderFrameToTexture:v12 configureWithTransaction:v23 completionHandler:v19];

    v14 = v27;
    goto LABEL_6;
  }
  uint64_t v31 = 0;
  id v10 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", self->_colorSpace, &v31, a3->outputPixelSize.width, a3->outputPixelSize.height);
  image = a3->image;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke;
  v28[3] = &unk_1E62B29D8;
  v30 = (CIImage *)v6;
  id v12 = v10;
  id v29 = v12;
  id v13 = [(PBUICALocalRenderer *)self renderCIImage:image toSurface:v12 completionHandler:v28];

  v14 = v30;
LABEL_6:
}

uint64_t __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  objc_super v3 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = v3;
  id v9 = v4;
  id v5 = *(id *)(a1 + 72);
  id v10 = v5;
  if (v2)
  {
    [v2 setRenderState:&v7];
  }
  else
  {
    id v6 = v5;
  }
}

void __53__PBUICALocalRenderer_renderState_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) iosurface];
  [*(id *)(a1 + 32) setPurgeableState:4];
  [*(id *)(a1 + 40) resetState];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)renderRequest:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = renderRequest_error__count++;
  uint64_t v8 = PBUILogCommon();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  double Current = CFAbsoluteTimeGetCurrent();
  v11 = PBUILogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "-[PBUICALocalRenderer renderRequest:error:]";
    _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_INFO, "(%d) start %{public}s", buf, 0x12u);
  }

  id v12 = PBUILogCommon();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BC4B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "sync render request", (const char *)&unk_1BC5491D9, buf, 2u);
  }

  v14 = (void *)os_transaction_create();
  *(_OWORD *)buf = *MEMORY[0x1E4F1DB30];
  id v39 = 0;
  id v40 = 0;
  *(void *)&buf[16] = 0x3FF0000000000000;
  id v31 = 0;
  char v15 = [v6 configureState:buf error:&v31];
  id v16 = v31;
  CGSize v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (a4)
    {
      id v20 = 0;
      *a4 = v16;
      goto LABEL_13;
    }
LABEL_12:
    id v20 = 0;
    goto LABEL_13;
  }
  long long v27 = *(_OWORD *)buf;
  uint64_t v28 = *(void *)&buf[16];
  id v18 = v39;
  id v29 = v18;
  id v19 = v40;
  id v30 = v19;
  if (!self)
  {
    uint64_t v21 = v19;

    goto LABEL_12;
  }
  id v20 = [(PBUICALocalRenderer *)self renderState:&v27 error:a4];
LABEL_13:
  id v22 = PBUILogCommon();
  v23 = v22;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v32 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BC4B3000, v23, OS_SIGNPOST_INTERVAL_END, v9, "sync render request", (const char *)&unk_1BC5491D9, v32, 2u);
  }

  CGSize v24 = PBUILogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v25 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)v32 = 67109634;
    int v33 = v7;
    __int16 v34 = 2082;
    v35 = "-[PBUICALocalRenderer renderRequest:error:]";
    __int16 v36 = 2048;
    double v37 = v25 - Current;
    _os_log_impl(&dword_1BC4B3000, v24, OS_LOG_TYPE_INFO, "(%d) end %{public}s; completed in %.4f", v32, 0x1Cu);
  }

  return v20;
}

- (void)renderRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, id))a4;
  long long v18 = *MEMORY[0x1E4F1DB30];
  id v20 = 0;
  id v21 = 0;
  uint64_t v19 = 0x3FF0000000000000;
  id v17 = 0;
  char v8 = [v6 configureState:&v18 error:&v17];
  id v9 = v17;
  if (v8)
  {
    long long v13 = v18;
    uint64_t v14 = v19;
    id v10 = v20;
    id v15 = v10;
    id v11 = v21;
    id v16 = v11;
    if (self)
    {
      [(PBUICALocalRenderer *)self renderState:&v13 completionHandler:v7];
    }
    else
    {
      id v12 = v11;
    }
  }
  else
  {
    v7[2](v7, 0, v9);
  }
}

- (BOOL)archiveRenderingOfRequest:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 path];
  if (v10)
  {
    long long v29 = *MEMORY[0x1E4F1DB30];
    id v31 = 0;
    id v32 = 0;
    uint64_t v30 = 0x3FF0000000000000;
    id v28 = 0;
    char v11 = [v8 configureState:&v29 error:&v28];
    id v12 = v28;
    long long v13 = v12;
    if (v11)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3254779904;
      v23[2] = __61__PBUICALocalRenderer_archiveRenderingOfRequest_toURL_error___block_invoke;
      v23[3] = &unk_1F16053C8;
      v23[4] = self;
      long long v24 = v29;
      uint64_t v25 = v30;
      id v26 = v31;
      id v27 = v32;
      [(PBUICALocalRenderer *)self configureWithTransaction:v23];
      uint64_t v35 = *MEMORY[0x1E4F39E08];
      uint64_t v14 = [(id)*MEMORY[0x1E4F443E0] identifier];
      __int16 v36 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

      char v16 = CAMLEncodeLayerTreeToPathWithOptions();
      [(PBUICALocalRenderer *)self resetState];
      if (a5) {
        char v17 = v16;
      }
      else {
        char v17 = 1;
      }
      if ((v17 & 1) == 0)
      {
        long long v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F285A0];
        v33[0] = *MEMORY[0x1E4F28578];
        v33[1] = v19;
        v34[0] = @"CoreAnimation failed to write .ca file to URL.";
        v34[1] = @"Check CoreAnimation logs.";
        v33[2] = *MEMORY[0x1E4F289D0];
        v34[2] = v9;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
        *a5 = [v18 errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:v20];
      }
    }
    else
    {
      char v16 = 0;
      if (a5) {
        *a5 = v12;
      }
    }

    goto LABEL_15;
  }
  if (a5)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F289D0];
    v38[0] = v9;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v21 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v13];
    char v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  char v16 = 0;
LABEL_16:

  return v16;
}

void __61__PBUICALocalRenderer_archiveRenderingOfRequest_toURL_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  objc_super v3 = *(void **)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = v3;
  id v9 = v4;
  id v5 = *(id *)(a1 + 72);
  id v10 = v5;
  if (v2)
  {
    [v2 setRenderState:&v7];
  }
  else
  {
    id v6 = v5;
  }
}

- (void)updateStateWithTransaction:(PBUIRenderState *)a3
{
  [MEMORY[0x1E4F39CF8] begin];
  CGSize outputPixelSize = a3->outputPixelSize;
  layer = a3->layer;
  double scale = a3->scale;
  id v6 = layer;
  char v11 = v6;
  long long v7 = a3->image;
  id v12 = v7;
  if (self)
  {
    [(PBUICALocalRenderer *)self setRenderState:&outputPixelSize];
  }
  else
  {
    uint64_t v8 = v7;
  }
  [(PBUIViewportLayer *)self->_viewportLayer setNeedsLayout];
  [(PBUIViewportLayer *)self->_viewportLayer layoutIfNeeded];
  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] flush];
}

- (void)setRenderState:(PBUIRenderState *)a3
{
  id v5 = a3->layer;
  id v6 = self->_currentRenderState.layer;
  if (v6)
  {
    long long v7 = [(PBUIViewportLayer *)self->_viewportLayer contentLayer];
    [v7 replaceSublayer:v6 with:v5];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    long long v7 = [(PBUIViewportLayer *)self->_viewportLayer contentLayer];
    [v7 addSublayer:v5];
  }

LABEL_6:
  [(CALayer *)v5 setNeedsLayout];
  viewportLayer = self->_viewportLayer;
  BSRectWithSize();
  -[PBUIViewportLayer setFrame:](viewportLayer, "setFrame:");
  [(PBUIViewportLayer *)self->_viewportLayer setScale:a3->scale];
  [(PBUIViewportLayer *)self->_viewportLayer setNeedsLayout];
  [(CALayer *)v5 setNeedsLayout];
  __copy_assignment_8_8_t0w24_s24_s32((uint64_t)&self->_currentRenderState, (long long *)a3);

  image = a3->image;
}

- (void)resetState
{
  [MEMORY[0x1E4F39CF8] begin];
  layer = self->_currentRenderState.layer;
  self->_currentRenderState.layer = 0;
  id v4 = layer;

  [(CALayer *)v4 removeFromSuperlayer];
  [MEMORY[0x1E4F39CF8] commit];
  id v5 = (void *)MEMORY[0x1E4F39CF8];
  [v5 flush];
}

- (id)CIContext
{
  void v16[5] = *MEMORY[0x1E4F143B8];
  ciContext = self->_ciContext;
  if (!ciContext)
  {
    id v4 = (void *)MEMORY[0x1E4F1E018];
    commandQueue = self->_commandQueue;
    id v6 = [NSString stringWithFormat:@"%@.CoreImage-Context", self->_identifier, *MEMORY[0x1E4F1E208]];
    uint64_t v7 = *MEMORY[0x1E4F1E230];
    v16[0] = v6;
    v16[1] = MEMORY[0x1E4F1CC38];
    uint64_t v8 = *MEMORY[0x1E4F1E1E8];
    v15[1] = v7;
    v15[2] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1E1E0];
    v16[2] = MEMORY[0x1E4F1CC38];
    v16[3] = MEMORY[0x1E4F1CC28];
    uint64_t v10 = *MEMORY[0x1E4F1E200];
    v15[3] = v9;
    v15[4] = v10;
    v16[4] = &unk_1F162C6C0;
    char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
    id v12 = [v4 contextWithMTLCommandQueue:commandQueue options:v11];
    long long v13 = self->_ciContext;
    self->_ciContext = v12;

    ciContext = self->_ciContext;
  }
  return ciContext;
}

- (id)renderCIImage:(id)a3 toSurface:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = [(PBUICALocalRenderer *)self CIContext];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithIOSurface:v9];

  long long v13 = [v11 startTaskToRender:v10 toDestination:v12 error:0];

  uint64_t v14 = [(PBUICALocalRenderer *)self nextFrameHandlerWithCompletion:v8];

  return v14;
}

- (void)configureWithTransaction:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F39CF8];
  id v4 = (void (**)(void))a3;
  [v3 begin];
  v4[2](v4);

  [MEMORY[0x1E4F39CF8] commit];
  id v5 = (void *)MEMORY[0x1E4F39CF8];
  [v5 flush];
}

- (id)renderFrameToTexture:(id)a3 configureWithTransaction:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(PBUICALocalRenderer *)self rendererForDestination:a3];
  [(PBUICALocalRenderer *)self configureWithTransaction:v9];

  [(PBUIViewportLayer *)self->_viewportLayer bounds];
  objc_msgSend(v10, "setBounds:");
  [v10 nextFrameTime];
  objc_msgSend(v10, "beginFrameAtTime:timeStamp:", 0);
  [v10 render];
  [v10 endFrame];
  char v11 = [(PBUICALocalRenderer *)self nextFrameHandlerWithCompletion:v8];

  return v11;
}

- (id)nextFrameHandlerWithCompletion:(id)a3
{
  id v4 = [(PBUICALocalRenderer *)self newCommandBufferWithCompletion:a3];
  id v5 = [NSString stringWithFormat:@"%@.next-frame-waiter", self->_identifier];
  [v4 setLabel:v5];

  [v4 enqueue];
  [v4 commit];
  return v4;
}

- (id)newCommandBufferWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__PBUICALocalRenderer_newCommandBufferWithCompletion___block_invoke;
    v7[3] = &unk_1E62B4318;
    id v8 = v4;
    [v5 addCompletedHandler:v7];
  }
  return v5;
}

uint64_t __54__PBUICALocalRenderer_newCommandBufferWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)rendererForDestination:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3A4D0];
  v11[0] = @"kCARendererFlags";
  v11[1] = v4;
  colorSpace = self->_colorSpace;
  v12[0] = &unk_1F162C6D8;
  v12[1] = colorSpace;
  v11[2] = *MEMORY[0x1E4F3A4D8];
  v12[2] = self->_commandQueue;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v9 = [MEMORY[0x1E4F39C60] rendererWithMTLTexture:v7 options:v8];
  [v9 setLayer:self->_viewportLayer];
  [v9 setDestination:v7];

  return v9;
}

- (id)newSurfaceWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4 outOptions:(unint64_t *)a5
{
  double height = a3.height;
  double width = a3.width;
  if (CGColorSpaceIsWideGamutRGB(a4))
  {
    CFStringRef Name = CGColorSpaceGetName(a4);
    uint64_t v10 = 5;
    if (Name == (CFStringRef)*MEMORY[0x1E4F1DBE8]) {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  unint64_t v15 = v10;
  char v11 = (__IOSurface *)objc_msgSend(MEMORY[0x1E4F2EF78], "bs_IOSurfaceWithWidth:height:options:", (unint64_t)width, (unint64_t)height, &v15);
  CFPropertyListRef v12 = CGColorSpaceCopyPropertyList(a4);
  if (v12)
  {
    long long v13 = v12;
    IOSurfaceSetValue(v11, (CFStringRef)*MEMORY[0x1E4F2F068], v12);
    CFRelease(v13);
  }
  if (a5) {
    *a5 = v15;
  }
  return v11;
}

- (id)newTextureWithSize:(CGSize)a3 colorSpace:(CGColorSpace *)a4
{
  uint64_t v10 = 0;
  id v5 = -[PBUICALocalRenderer newSurfaceWithSize:colorSpace:outOptions:](self, "newSurfaceWithSize:colorSpace:outOptions:", a4, &v10, a3.width, a3.height);
  unint64_t v6 = [(PBUICALocalRenderer *)self pixelFormatForBSIOSurfaceOptions:v10];
  id v7 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v6, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"), 0);
  [v7 setAllowGPUOptimizedContents:0];
  [v7 setUsage:4];
  id v8 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v7 iosurface:v5 plane:0];

  return v8;
}

- (unint64_t)pixelFormatForBSIOSurfaceOptions:(unint64_t)a3
{
  unint64_t v3 = 80;
  uint64_t v4 = 554;
  if ((a3 & 1) == 0) {
    uint64_t v4 = 550;
  }
  if ((a3 & 2) != 0) {
    unint64_t v3 = v4;
  }
  if ((a3 & 4) != 0) {
    return 115;
  }
  else {
    return v3;
  }
}

- (BOOL)usesCoreImageForState:(PBUIRenderState *)a3
{
  BOOL v4 = a3->image != 0;

  return v4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_ciContext, 0);
  objc_storeStrong((id *)&self->_viewportLayer, 0);
}

@end