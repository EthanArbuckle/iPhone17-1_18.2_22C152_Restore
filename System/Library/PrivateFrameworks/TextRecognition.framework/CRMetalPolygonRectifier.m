@interface CRMetalPolygonRectifier
- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4;
- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4 regionOfInterest:(CGRect)a5;
- (id)imageByRectifyingPolygon:(id)a3 imageHeight:(unint64_t)a4;
- (void)_createRenderTargetWithSize:(CGSize)a3;
- (void)_createTextureForInputCRImage:(id)a3;
- (void)_setSourceImage:(id)a3;
- (void)rectifyPolygonAsync:(id)a3 imageHeight:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation CRMetalPolygonRectifier

- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](self, "initWithDevice:sourceImage:regionOfInterest:", v6, v7, 0.0, 0.0, (double)(unint64_t)[v7 width], (double)(unint64_t)objc_msgSend(v7, "height"));

  return v8;
}

- (CRMetalPolygonRectifier)initWithDevice:(id)a3 sourceImage:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  v61.receiver = self;
  v61.super_class = (Class)CRMetalPolygonRectifier;
  v13 = [(CRMetalPolygonRectifier *)&v61 init];
  if (!v13) {
    goto LABEL_19;
  }
  v14 = (MTLDevice *)(v11 ? v11 : MTLCreateSystemDefaultDevice());
  device = v13->_device;
  v13->_device = v14;

  if (v12)
  {
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    v13->_regionOfInterest = NSIntegralRect(v62);
    [v12 size];
    CGFloat v17 = v16;
    [v12 size];
    v65.size.CGFloat height = v18;
    v65.origin.CGFloat x = 0.0;
    v65.origin.CGFloat y = 0.0;
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    v65.size.CGFloat width = v17;
    NSRect v64 = NSIntersectionRect(v63, v65);
    v13->_regionOfInterest = v64;
    if (v64.size.width == 0.0 || v64.size.height == 0.0)
    {
      v53 = CROSLogForCategory(0);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v53, OS_LOG_TYPE_ERROR, "Cannot create rectifier with zero-sized region of interest!", buf, 2u);
      }

      goto LABEL_18;
    }
    dispatch_group_t v19 = dispatch_group_create();
    textureCreationGroup = v13->_textureCreationGroup;
    v13->_textureCreationGroup = (OS_dispatch_group *)v19;

    qos_class_t v21 = qos_class_self();
    v22 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], v21, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.CoreRecognition.metalRectifierTextureQueue", v22);
    textureCreationQueue = v13->_textureCreationQueue;
    v13->_textureCreationQueue = (OS_dispatch_queue *)v23;

    [(CRMetalPolygonRectifier *)v13 _setSourceImage:v12];
    v25 = v13->_device;
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v59 = 0;
    v27 = (void *)[(MTLDevice *)v25 newDefaultLibraryWithBundle:v26 error:&v59];
    id v28 = v59;

    if (v27)
    {
      v57 = (void *)[v27 newFunctionWithName:@"vertexShader"];
      v56 = (void *)[v27 newFunctionWithName:@"samplingShader"];
      id v29 = objc_alloc_init(MEMORY[0x1E4F352F0]);
      [v29 setLabel:@"Texturing Pipeline"];
      [v29 setVertexFunction:v57];
      [v29 setFragmentFunction:v56];
      unint64_t pixelFormat = v13->_pixelFormat;
      v31 = [v29 colorAttachments];
      v32 = [v31 objectAtIndexedSubscript:0];
      [v32 setPixelFormat:pixelFormat];

      v33 = v13->_device;
      id v58 = v28;
      uint64_t v34 = [(MTLDevice *)v33 newRenderPipelineStateWithDescriptor:v29 error:&v58];
      id v35 = v58;

      pipelineState = v13->_pipelineState;
      v13->_pipelineState = (MTLRenderPipelineState *)v34;

      if (v13->_pipelineState)
      {
        v37 = (MTLRenderPassDescriptor *)objc_alloc_init(MEMORY[0x1E4F352E0]);
        renderPassDescriptor = v13->_renderPassDescriptor;
        v13->_renderPassDescriptor = v37;

        v39 = [(MTLRenderPassDescriptor *)v13->_renderPassDescriptor colorAttachments];
        v40 = [v39 objectAtIndexedSubscript:0];
        [v40 setLoadAction:0];

        v41 = [(MTLRenderPassDescriptor *)v13->_renderPassDescriptor colorAttachments];
        v42 = [v41 objectAtIndexedSubscript:0];
        objc_msgSend(v42, "setClearColor:", 0.5, 0.5, 0.5, 1.0);

        v43 = [(MTLRenderPassDescriptor *)v13->_renderPassDescriptor colorAttachments];
        v44 = [v43 objectAtIndexedSubscript:0];
        [v44 setStoreAction:1];

        uint64_t v45 = [(MTLDevice *)v13->_device newCommandQueue];
        commandQueue = v13->_commandQueue;
        v13->_commandQueue = (MTLCommandQueue *)v45;

        dispatch_semaphore_t v47 = dispatch_semaphore_create(1);
        renderDestinationSem = v13->_renderDestinationSem;
        v13->_renderDestinationSem = (OS_dispatch_semaphore *)v47;

        renderDestination = v13->_renderDestination;
        v13->_renderDestination = 0;

        managedBlitTexture = v13->_managedBlitTexture;
        *(void *)v13->_viewportSize = 0;
        v13->_managedBlitTexture = 0;

        vertices = v13->_vertices;
        v13->_vertices = 0;

        int v52 = 0;
        v13->_numVertices = 0;
      }
      else
      {
        int v52 = 1;
      }
    }
    else
    {
      int v52 = 1;
      id v35 = v28;
    }

    if (!v52)
    {
LABEL_19:
      v54 = v13;
      goto LABEL_20;
    }
  }
LABEL_18:
  v54 = 0;
LABEL_20:

  return v54;
}

- (void)_setSourceImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  self->_imageSize.CGFloat width = v5;
  self->_imageSize.CGFloat height = v6;
  self->_ioColorSpace = [v4 colorSpace];
  if (![v4 colorSpace])
  {
    unint64_t v7 = 13;
    goto LABEL_5;
  }
  if ([v4 colorSpace] == 1)
  {
    unint64_t v7 = 73;
LABEL_5:
    self->_unint64_t pixelFormat = v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && CVPixelBufferGetIOSurface((CVPixelBufferRef)[v4 pixelBuffer]))
  {
    unint64_t v8 = [v4 width];
    unint64_t v9 = [v4 height];
    self->_regionOfInterest.origin.CGFloat x = 0.0;
    self->_regionOfInterest.origin.CGFloat y = 0.0;
    self->_regionOfInterest.size.CGFloat width = (double)v8;
    self->_regionOfInterest.size.CGFloat height = (double)v9;
  }
  dispatch_group_enter((dispatch_group_t)self->_textureCreationGroup);
  textureCreationQueue = self->_textureCreationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CRMetalPolygonRectifier__setSourceImage___block_invoke;
  v12[3] = &unk_1E6CDB820;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(textureCreationQueue, v12);
}

void __43__CRMetalPolygonRectifier__setSourceImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createTextureForInputCRImage:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  dispatch_group_leave(v2);
}

- (void)_createTextureForInputCRImage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F35330]);
  [v5 setPixelFormat:self->_pixelFormat];
  [v5 setAllowGPUOptimizedContents:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v4 pixelBuffer]);
    unint64_t v7 = IOSurface;
    if (IOSurface)
    {
      [v5 setWidth:IOSurfaceGetWidth(IOSurface)];
      [v5 setHeight:IOSurfaceGetHeight(v7)];
      unint64_t v8 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v5 iosurface:v7 plane:0];
      texture = self->_texture;
      self->_texture = v8;
    }
    else
    {
      [v5 setWidth:(unint64_t)self->_regionOfInterest.size.width];
      [v5 setHeight:(unint64_t)self->_regionOfInterest.size.height];
      CGFloat v17 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v5];
      CGFloat v18 = self->_texture;
      self->_texture = v17;

      uint64_t v19 = [v5 width];
      uint64_t v20 = [v5 height];
      CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v4 pixelBuffer], 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v4 pixelBuffer]);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v4 pixelBuffer]);
      CVPixelBufferGetPlaneCount((CVPixelBufferRef)[v4 pixelBuffer]);
      dispatch_queue_t v23 = self->_texture;
      memset(v29, 0, 24);
      v29[3] = v19;
      v29[4] = v20;
      v29[5] = 1;
      [(MTLTexture *)v23 replaceRegion:v29 mipmapLevel:0 withBytes:BaseAddress bytesPerRow:BytesPerRow];
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v4 pixelBuffer], 1uLL);
    }
  }
  else
  {
    [v5 setWidth:(unint64_t)self->_regionOfInterest.size.width];
    [v5 setHeight:(unint64_t)self->_regionOfInterest.size.height];
    v10 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v5];
    id v11 = self->_texture;
    self->_texture = v10;

    uint64_t v12 = [v5 width];
    uint64_t v13 = [v5 height];
    v14 = self->_texture;
    memset(v28, 0, 24);
    v28[3] = v12;
    v28[4] = v13;
    v28[5] = 1;
    if (v4)
    {
      [v4 vImage];
      uint64_t v15 = v26;
      [v4 vImage];
      uint64_t v16 = *((void *)&v25 + 1);
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v15 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
    }
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v14, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v28, 0, v15, v16, v24, v25, v26, v27);
  }
}

- (void)_createRenderTargetWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  LODWORD(v6) = a3.width;
  HIDWORD(v6) = a3.height;
  *(void *)self->_viewportSize = v6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F35330]);
  [v12 setTextureType:2];
  [v12 setPixelFormat:self->_pixelFormat];
  [v12 setWidth:(unint64_t)width];
  [v12 setHeight:(unint64_t)height];
  [v12 setUsage:0];
  [v12 setAllowGPUOptimizedContents:0];
  unint64_t v7 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v12];
  renderDestination = self->_renderDestination;
  self->_renderDestination = v7;

  unint64_t v9 = self->_renderDestination;
  v10 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
  id v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setTexture:v9];
}

- (id)imageByRectifyingPolygon:(id)a3 imageHeight:(unint64_t)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  CGFloat v17 = __Block_byref_object_copy__9;
  CGFloat v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  id v6 = a3;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CRMetalPolygonRectifier_imageByRectifyingPolygon_imageHeight___block_invoke_2;
  v11[3] = &unk_1E6CDB848;
  id v12 = v7;
  uint64_t v13 = &v14;
  id v8 = v7;
  [(CRMetalPolygonRectifier *)self rectifyPolygonAsync:v6 imageHeight:a4 completionHandler:v11];

  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __64__CRMetalPolygonRectifier_imageByRectifyingPolygon_imageHeight___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rectifyPolygonAsync:(id)a3 imageHeight:(unint64_t)a4 completionHandler:(id)a5
{
  id v93 = a3;
  id v92 = a5;
  dispatch_block_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [v93 denormalizedPolyline];
  v10 = [v9 pointValues];

  int v11 = [v10 count];
  if (v11 >= 0) {
    int v12 = v11;
  }
  else {
    int v12 = v11 + 1;
  }
  int v13 = v12 >> 1;
  int v14 = (v12 >> 1) - 1;
  if (v11 >= 4)
  {
    uint64_t v15 = 0;
    if (v14 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v17 = -1;
    do
    {
      CGFloat v18 = [v10 objectAtIndexedSubscript:v15];
      [v7 addObject:v18];

      id v19 = objc_msgSend(v10, "objectAtIndexedSubscript:", v17 + objc_msgSend(v10, "count"));
      [v8 addObject:v19];

      ++v15;
      --v17;
    }
    while (v16 != v15);
  }
  uint64_t v20 = [v10 objectAtIndexedSubscript:v14];
  [v7 addObject:v20];

  qos_class_t v21 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - v13);
  [v8 addObject:v21];

  int v22 = [v7 count] - 1;
  self->_numVertices = 6 * v22;
  dispatch_queue_t v23 = (float32x2_t *)malloc_type_malloc(96 * v22, 0x1000040451B5BE8uLL);
  float v24 = (double)a4 * -0.5;
  float v95 = v24;
  double v91 = (double)a4;
  float v25 = (double)a4 * 0.5;
  float v94 = v25;
  long long v26 = v23 + 6;
  double v27 = 0.0;
  unint64_t v28 = 1;
  id v29 = (double *)MEMORY[0x1E4F1DB30];
  double v30 = 0.0;
  while (v28 < [v7 count])
  {
    unint64_t v31 = v28 - 1;
    v32 = [v7 objectAtIndexedSubscript:v31];
    [v32 pointValue];
    double v102 = v34;
    double v104 = v33;

    id v35 = [v7 objectAtIndexedSubscript:++v31];
    [v35 pointValue];
    double v100 = v37;
    double v101 = v36;

    v38 = [v8 objectAtIndexedSubscript:--v31];
    [v38 pointValue];
    double v98 = v40;
    double v99 = v39;

    unint64_t v41 = v31 + 1;
    v42 = [v8 objectAtIndexedSubscript:v41];
    [v42 pointValue];
    double v96 = v44;
    double v97 = v43;
    double v45 = v104;
    double v46 = v102;
    double v47 = v101;
    double v48 = v100;

    double v49 = *v29;
    double v50 = v29[1];
    BOOL v51 = *v29 > 0.0;
    if (v50 <= 0.0) {
      BOOL v51 = 0;
    }
    double v52 = v101;
    double v53 = v100;
    double v54 = v104;
    double v55 = v102;
    if (v51)
    {
      double v54 = v104 * v49;
      double v55 = v102 * v50;
      double v52 = v101 * v49;
      double v53 = v100 * v50;
    }
    v56.f64[0] = v99;
    double v57 = v99;
    double v58 = v98;
    v59.f64[0] = v97;
    if (v51)
    {
      double v45 = v104 * v49;
      double v46 = v102 * v50;
      double v57 = v99 * v49;
      double v58 = v98 * v50;
    }
    double v60 = v97;
    double v61 = v96;
    if (v51)
    {
      double v47 = v101 * v49;
      double v48 = v100 * v50;
      double v60 = v97 * v49;
      double v61 = v96 * v50;
    }
    double v62 = v97;
    double v63 = v96;
    double v64 = v99;
    double v65 = v98;
    if (v51)
    {
      double v64 = v99 * v49;
      double v65 = v98 * v50;
      double v62 = v97 * v49;
      double v63 = v96 * v50;
    }
    double v66 = sqrt((v55 - v53) * (v55 - v53) + (v54 - v52) * (v54 - v52));
    double v67 = sqrt((v46 - v58) * (v46 - v58) + (v45 - v57) * (v45 - v57));
    double v68 = sqrt((v48 - v61) * (v48 - v61) + (v47 - v60) * (v47 - v60));
    double v69 = sqrt((v65 - v63) * (v65 - v63) + (v64 - v62) * (v64 - v62));
    if (fmax(fmax(v66, v67), fmax(v68, v69)) >= 1.0 && fmin(fmin(v66, v67), fmin(v68, v69)) != 0.0)
    {
      *(double *)&float32x2_t v70 = (v66 + v69) * 0.5;
      double v30 = v30 + *(double *)&v70;
      v71.f32[0] = v30;
      v70.f32[0] = v30 - *(double *)&v70;
      v59.f64[1] = v96;
      v71.f32[1] = v94;
      v70.f32[1] = v94;
      double v72 = v67 + v68;
      CGSize imageSize = self->_imageSize;
      float32x2_t v74 = vcvt_f32_f64(vdivq_f64(v59, (float64x2_t)imageSize));
      v56.f64[1] = v98;
      v75.f64[0] = v101;
      v75.f64[1] = v100;
      v76.f64[0] = v104;
      v76.f64[1] = v102;
      v26[-6] = (float32x2_t)__PAIR64__(LODWORD(v95), v71.u32[0]);
      v26[-5] = v74;
      double v27 = v27 + v72 * 0.5;
      *(float32x2_t *)&v76.f64[0] = vcvt_f32_f64(vdivq_f64(v76, (float64x2_t)imageSize));
      v26[-4] = (float32x2_t)__PAIR64__(LODWORD(v95), v70.u32[0]);
      v26[-3] = vcvt_f32_f64(vdivq_f64(v56, (float64x2_t)imageSize));
      v26[-2] = v70;
      v26[-1] = *(float32x2_t *)&v76.f64[0];
      float32x2_t *v26 = (float32x2_t)__PAIR64__(LODWORD(v95), v71.u32[0]);
      v26[1] = v74;
      v26[2] = v70;
      v26[3] = *(float32x2_t *)&v76.f64[0];
      v26[4] = v71;
      v26[5] = vcvt_f32_f64(vdivq_f64(v75, (float64x2_t)imageSize));
    }
    v26 += 12;
    unint64_t v28 = v41 + 1;
  }
  double v77 = v91 / (v27 / (double)v22);
  double v78 = v30 * v77;
  if (self->_numVertices)
  {
    unint64_t v79 = 0;
    v80 = (float *)&v23[1];
    do
    {
      float v81 = v78 * -0.5 + COERCE_FLOAT(*((void *)v80 - 1)) * v77;
      *(v80 - 2) = v81;
      uint64_t v82 = *(void *)v80;
      *(float *)&uint64_t v83 = (COERCE_FLOAT(*(void *)v80) - self->_regionOfInterest.origin.x)
                     / (self->_regionOfInterest.size.width
                      / self->_imageSize.width);
      *(_DWORD *)v80 = v83;
      *(float *)&uint64_t v82 = (*((float *)&v82 + 1) - self->_regionOfInterest.origin.y)
                     / (self->_regionOfInterest.size.height
                      / self->_imageSize.height);
      HIDWORD(v83) = v82;
      *(void *)v80 = v83;
      v80 += 4;
      ++v79;
    }
    while (v79 < self->_numVertices);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderDestinationSem, 0xFFFFFFFFFFFFFFFFLL);
  -[CRMetalPolygonRectifier _createRenderTargetWithSize:](self, "_createRenderTargetWithSize:", v78, v91);
  v84 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:v23 length:16 * self->_numVertices options:0];
  vertices = self->_vertices;
  self->_vertices = v84;

  free(v23);
  v86 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v86 setLabel:@"CRMetalPolygonRectifier"];
  v87 = [v86 renderCommandEncoderWithDescriptor:self->_renderPassDescriptor];
  [v87 setLabel:@"CRMetalPolygonRectifierOffscreenRenderEncoder"];
  dispatch_group_wait((dispatch_group_t)self->_textureCreationGroup, 0xFFFFFFFFFFFFFFFFLL);
  [v87 pushDebugGroup:@"OffscreenRenderPass"];
  [v87 setCullMode:0];
  uint64_t v88 = *(void *)self->_viewportSize;
  v107[0] = 0;
  v107[1] = 0;
  v89.i64[0] = v88;
  v89.i64[1] = HIDWORD(v88);
  float64x2_t v108 = vcvtq_f64_u64(v89);
  long long v109 = xmmword_1DD8CE680;
  [v87 setViewport:v107];
  [v87 setRenderPipelineState:self->_pipelineState];
  [v87 setVertexBuffer:self->_vertices offset:0 atIndex:0];
  [v87 setVertexBytes:self->_viewportSize length:8 atIndex:1];
  [v87 setFragmentTexture:self->_texture atIndex:0];
  [v87 drawPrimitives:3 vertexStart:0 vertexCount:self->_numVertices];
  [v87 popDebugGroup];
  [v87 endEncoding];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __77__CRMetalPolygonRectifier_rectifyPolygonAsync_imageHeight_completionHandler___block_invoke;
  v105[3] = &unk_1E6CDB870;
  v105[4] = self;
  id v90 = v92;
  id v106 = v90;
  [v86 addCompletedHandler:v105];
  [v86 commit];
}

void __77__CRMetalPolygonRectifier_rectifyPolygonAsync_imageHeight_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [CRImage alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 144);
  if (!v4) {
    uint64_t v4 = *(void *)(v3 + 128);
  }
  id v8 = [(CRImage *)v2 initWithMTLTexture:v4 toColorSpace:*(unsigned int *)(v3 + 16)];
  id v5 = (CRLogger *)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 152));
  CRLogger = CRLogger::getCRLogger(v5);
  if (*CRLogger && (CRLogger[8] & 4) != 0)
  {
    dispatch_block_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"/tmp/rectified_%d.png", rand());
    [(CRImage *)v8 writeToFile:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_renderDestinationSem, 0);
  objc_storeStrong((id *)&self->_managedBlitTexture, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);
  objc_storeStrong((id *)&self->_textureCreationQueue, 0);
  objc_storeStrong((id *)&self->_textureCreationGroup, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end