@interface VFXCompositorRenderer
+ (Class)rendererClass;
+ (unsigned)frameBufferFeatures;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_usesLayeredRendering;
- (BOOL)_usesMultipleViewportRendering;
- (BOOL)_wantsWorldRendererDelegationMessages;
- (BOOL)additiveWritesToAlpha;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)showsStatistics;
- (CGColorSpace)workingColorSpace;
- (CGRect)currentViewport;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (NSString)description;
- (UIColor)backgroundColor;
- (VFXCompositorRenderer)init;
- (VFXCompositorRenderer)initWithMTKView:(id)a3 options:(id)a4;
- (VFXNode)audioListener;
- (VFXNode)pointOfView;
- (VFXRenderGraph)renderGraph;
- (VFXWorld)world;
- (VFXWorldRendererDelegate)delegate;
- (__n128)viewMatrix0;
- (__n128)viewMatrix1;
- (double)projectPoint:(uint64_t)a3;
- (id)_commandBufferStatusMonitor;
- (id)_resourceManagerMonitor;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)renderer;
- (uint64_t)setViewMatrix0:(__n128)a3;
- (uint64_t)setViewMatrix1:(__n128)a3;
- (uint64_t)unprojectPoint:(uint64_t)a3;
- (unint64_t)antialiasingMode;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)stencilPixelFormat;
- (unint64_t)viewpointCoordinateSpace;
- (void)__CFObject;
- (void)_addGPUFrameCompletedHandler:(id)a3;
- (void)_addGPUFramePresentedHandler:(id)a3;
- (void)_addGPUFrameScheduledHandler:(id)a3;
- (void)_allowGPUBackgroundExecution;
- (void)_discardTextures;
- (void)_drawInRenderingQueueWithDrawable:(id)a3 renderPassDescriptor:(id)a4;
- (void)_initRendererWithOptions:(id)a3;
- (void)_rebuildRasterizationRateMap;
- (void)_rebuildTextures;
- (void)_setAntialiasingMode:(unint64_t)a3 forcingReset:(BOOL)a4;
- (void)dealloc;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAudioListener:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setPointOfView:(id)a3;
- (void)setRenderGraph:(id)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setViewpointCoordinateSpace:(unint64_t)a3;
- (void)setWorld:(id)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3;
@end

@implementation VFXCompositorRenderer

- (VFXCompositorRenderer)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return self;
}

- (VFXCompositorRenderer)initWithMTKView:(id)a3 options:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VFXCompositorRenderer;
  v6 = [(VFXCompositorRenderer *)&v17 init];
  v14 = v6;
  if (v6)
  {
    v6->_mtkView = (MTKView *)a3;
    if (!a3) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v8, v9, v10, v11, v12, v13, (uint64_t)"_mtkView");
    }
    objc_msgSend__initRendererWithOptions_(v14, v7, (uint64_t)a4, v9);
    objc_msgSend__setAntialiasingMode_forcingReset_(v14, v15, 2, 1);
  }
  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_world(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(self, v10, v11, v12);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v14, @"<%@: %p | world=%@ pointOfView=%@>", v15, v5, self, v9, v13);
}

- (void)__CFObject
{
  return 0;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_coalescingSource);
  for (uint64_t i = 48; i != 72; i += 8)

  objc_msgSend__discardTextures(self, v4, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)VFXCompositorRenderer;
  [(VFXCompositorRenderer *)&v7 dealloc];
}

- (void)_discardTextures
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    v4 = (Class *)((char *)&self->super.isa + i * 16);
    uint64_t v5 = self->_msaaDepthTextures[i][0];

    v4[21] = 0;
    v4[27] = 0;
    uint64_t v6 = self->_msaaDepthTextures[i][1];

    v4[22] = 0;
    v4[28] = 0;
  }
  for (uint64_t j = 0; j != 3; ++j)
  {
    uint64_t v8 = (Class *)((char *)&self->super.isa + j * 16);
    uint64_t v9 = self->_depthTextures[j][0];

    v8[33] = 0;
    v8[39] = 0;
    uint64_t v10 = self->_depthTextures[j][1];

    v8[34] = 0;
    v8[40] = 0;
  }
}

- (void)_rebuildRasterizationRateMap
{
  uint64_t v5 = objc_msgSend_device(self->_renderer, a2, v2, v3);
  uint64_t v8 = v5;
  if (self->_layout == 2)
  {
    uint64_t v9 = 2;
    char v10 = objc_msgSend_supportsRasterizationRateMapWithLayerCount_(v5, v6, 2, v7);
  }
  else
  {
    uint64_t v9 = 1;
    char v10 = objc_msgSend_supportsRasterizationRateMapWithLayerCount_(v5, v6, 1, v7);
  }
  if ((v10 & 1) == 0) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Variable rasterization rate is not supported on this device", v11, v12, v13, v14, v15, v16, (uint64_t)"[device supportsRasterizationRateMapWithLayerCount:layerCount]");
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F352D0]);
  uint64_t v18 = *(void *)&self->_logicalWidth;
  *(void *)&long long v19 = v18;
  *((void *)&v19 + 1) = HIDWORD(v18);
  long long v69 = v19;
  uint64_t v70 = 0;
  objc_msgSend_setScreenSize_(v17, v20, (uint64_t)&v69, v21);
  CACurrentMediaTime();
  uint64_t v22 = 0;
  int64x2_t v66 = vdupq_n_s64(9uLL);
  float v23 = 0.125;
  do
  {
    id v24 = objc_alloc(MEMORY[0x1E4F352C8]);
    int64x2_t v67 = v66;
    uint64_t v68 = 1;
    v27 = objc_msgSend_initWithSampleCount_(v24, v25, (uint64_t)&v67, v26);
    unint64_t v28 = 0;
    float v29 = -1.0;
    do
    {
      float v30 = (float)((float)((float)v28 + (float)v28) * v23) + v29;
      float v31 = (float)(fminf(fmaxf((float)(expf(v30 * (float)(v30 * -5.0)) + -0.0067379) / 0.99326, 0.0), 1.0) * 0.95)
          + 0.05;
      uint64_t v35 = objc_msgSend_horizontalSampleStorage(v27, v32, v33, v34);
      float v29 = -1.0;
      *(float *)(v35 + 4 * v28) = v31;
      float v23 = 0.125;
      ++v28;
    }
    while (v28 != 9);
    for (unint64_t i = 0; i != 9; ++i)
    {
      float v37 = (float)((float)((float)i + (float)i) * v23) + v29;
      float v38 = (float)(fminf(fmaxf((float)(expf(v37 * (float)(v37 * -5.0)) + -0.0067379) / 0.99326, 0.0), 1.0) * 0.95)
          + 0.05;
      uint64_t v42 = objc_msgSend_verticalSampleStorage(v27, v39, v40, v41);
      float v29 = -1.0;
      *(float *)(v42 + 4 * i) = v38;
      float v23 = 0.125;
    }
    objc_msgSend_setLayer_atIndex_(v17, v43, (uint64_t)v27, v22);

    ++v22;
  }
  while (v22 != v9);
  rasterizationRateMap = self->_rasterizationRateMap;
  if (rasterizationRateMap) {
    objc_msgSend_resetUsingDescriptor_(rasterizationRateMap, v44, (uint64_t)v17, v45);
  }
  else {
    self->_rasterizationRateMap = (MTLRasterizationRateMap *)objc_msgSend_newRasterizationRateMapWithDescriptor_(v8, v44, (uint64_t)v17, v45);
  }

  unint64_t v53 = objc_msgSend_parameterBufferSizeAndAlign(self->_rasterizationRateMap, v47, v48, v49);
  uint64_t v54 = 0;
  rasterizationRateMapDataBuffer = self->_rasterizationRateMapDataBuffer;
  do
  {
    v56 = rasterizationRateMapDataBuffer[v54];
    if (objc_msgSend_length(v56, v50, v51, v52) < v53)
    {

      uint64_t v60 = objc_msgSend_parameterBufferSizeAndAlign(self->_rasterizationRateMap, v57, v58, v59);
      rasterizationRateMapDataBuffer[v54] = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v8, v61, v60, 0);
    }
    ++v54;
  }
  while (v54 != 3);
  if (!self->_rasterizationRateMapBlitPipeline)
  {
    v62 = sub_1B653A10C((uint64_t)VFXMTLResourceManager, (uint64_t)v8);
    if (self->_layout == 2) {
      uint64_t v65 = objc_msgSend_computePipelineStateForKernel_(v62, v63, @"vrr_blit_physical_to_screen_layered", v64);
    }
    else {
      uint64_t v65 = objc_msgSend_computePipelineStateForKernel_(v62, v63, @"vrr_blit_physical_to_screen", v64);
    }
    self->_rasterizationRateMapBlitPipeline = (MTLComputePipelineState *)(id)sub_1B653EFB8(v65);
  }
}

- (void)_rebuildTextures
{
  if (self->_logicalWidth && self->_logicalHeight)
  {
    objc_msgSend__rebuildRasterizationRateMap(self, a2, v2, v3);
    if (objc_msgSend_layerCount(self->_rasterizationRateMap, v5, v6, v7))
    {
      unint64_t v11 = 0;
      do
      {
        rasterizationRateMap = self->_rasterizationRateMap;
        if (rasterizationRateMap)
        {
          objc_msgSend_physicalSizeForLayer_(rasterizationRateMap, v8, v11, v10);
          rasterizationRateMap = self->_rasterizationRateMap;
        }
        ++v11;
      }
      while (v11 < objc_msgSend_layerCount(rasterizationRateMap, v8, v9, v10));
    }
    objc_msgSend__discardTextures(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_device(self->_renderer, v13, v14, v15);
    unint64_t layout = self->_layout;
    if (layout < 2)
    {
      objc_msgSend_setSampleCount_(self->_mtkView, v17, self->_sampleCount, v19);
    }
    else
    {
      uint64_t v21 = v16;
      if (layout == 2)
      {
        if ((j__objc_msgSend_supportsLayeredRendering(v16, v17, v18, v19) & 1) == 0) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Layered rendering is not supported", v74, v75, v76, v77, v78, v79, (uint64_t)"VFXMTLDeviceSupportsLayeredRendering(device)");
        }
        v80 = (void *)MEMORY[0x1E4F35330];
        uint64_t v81 = objc_msgSend_colorPixelFormat(self->_mtkView, v73, v74, v75);
        v83 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v80, v82, v81, 0, 0, 0);
        objc_msgSend_setArrayLength_(v83, v84, 2, v85);
        objc_msgSend_setTextureType_(v83, v86, 3, v87);
        objc_msgSend_setStorageMode_(v83, v88, 2, v89);
        objc_msgSend_setUsage_(v83, v90, 5, v91);
        v93 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v92, 252, 0, 0, 0);
        objc_msgSend_setArrayLength_(v93, v94, 2, v95);
        objc_msgSend_setTextureType_(v93, v96, 3, v97);
        objc_msgSend_setStorageMode_(v93, v98, 2, v99);
        objc_msgSend_setUsage_(v93, v100, 4, v101);
        for (uint64_t i = 0; i != 48; i += 16)
        {
          uint64_t v105 = objc_msgSend_newTextureWithDescriptor_(v21, v102, (uint64_t)v83, v103);
          uint64_t v108 = objc_msgSend_newTextureWithDescriptor_(v21, v106, (uint64_t)v93, v107);
          v110 = (char *)self + i;
          *((void *)v110 + 33) = v105;
          *((void *)v110 + 39) = v108;
        }
        if (self->_sampleCount > 1)
        {
          int v111 = j__objc_msgSend_supportsMemorylessRenderTargets(v21, v102, v109, v103);
          objc_msgSend_setSampleCount_(v83, v112, self->_sampleCount, v113);
          objc_msgSend_setTextureType_(v83, v114, 8, v115);
          if (v111)
          {
            uint64_t v118 = 3;
            objc_msgSend_setStorageMode_(v83, v116, 3, v117);
          }
          else
          {
            uint64_t v118 = 2;
            objc_msgSend_setStorageMode_(v83, v116, 2, v117);
          }
          objc_msgSend_setSampleCount_(v93, v119, self->_sampleCount, v120);
          objc_msgSend_setTextureType_(v93, v121, 8, v122);
          objc_msgSend_setStorageMode_(v93, v123, v118, v124);
          for (uint64_t j = 0; j != 48; j += 16)
          {
            uint64_t v128 = objc_msgSend_newTextureWithDescriptor_(v21, v125, (uint64_t)v83, v126);
            uint64_t v131 = objc_msgSend_newTextureWithDescriptor_(v21, v129, (uint64_t)v93, v130);
            v132 = (char *)self + j;
            *((void *)v132 + 21) = v128;
            *((void *)v132 + 27) = v131;
          }
        }
      }
      else if (layout == 3)
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F35330];
        uint64_t v23 = objc_msgSend_colorPixelFormat(self->_mtkView, v17, v18, v19);
        v25 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v22, v24, v23, 0, 0, 0);
        objc_msgSend_setStorageMode_(v25, v26, 2, v27);
        objc_msgSend_setUsage_(v25, v28, 5, v29);
        float v31 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v30, 252, 0, 0, 0);
        objc_msgSend_setStorageMode_(v31, v32, 2, v33);
        objc_msgSend_setUsage_(v31, v34, 4, v35);
        for (uint64_t k = 0; k != 48; k += 16)
        {
          uint64_t v39 = objc_msgSend_newTextureWithDescriptor_(v21, v36, (uint64_t)v25, v37);
          uint64_t v42 = objc_msgSend_newTextureWithDescriptor_(v21, v40, (uint64_t)v31, v41);
          v43 = (Class *)((char *)&self->super.isa + k);
          v43[33] = v39;
          v43[39] = v42;
          uint64_t v46 = objc_msgSend_newTextureWithDescriptor_(v21, v44, (uint64_t)v25, v45);
          uint64_t v49 = objc_msgSend_newTextureWithDescriptor_(v21, v47, (uint64_t)v31, v48);
          v43[34] = v46;
          v43[40] = v49;
        }
        if (self->_sampleCount >= 2)
        {
          int v51 = j__objc_msgSend_supportsMemorylessRenderTargets(v21, v36, v50, v37);
          objc_msgSend_setSampleCount_(v25, v52, self->_sampleCount, v53);
          objc_msgSend_setTextureType_(v25, v54, 8, v55);
          if (v51)
          {
            uint64_t v58 = 3;
            objc_msgSend_setStorageMode_(v25, v56, 3, v57);
          }
          else
          {
            uint64_t v58 = 2;
            objc_msgSend_setStorageMode_(v25, v56, 2, v57);
          }
          objc_msgSend_setSampleCount_(v31, v59, self->_sampleCount, v60);
          objc_msgSend_setTextureType_(v31, v61, 8, v62);
          objc_msgSend_setStorageMode_(v31, v63, v58, v64);
          for (uint64_t m = 0; m != 48; m += 16)
          {
            uint64_t v68 = objc_msgSend_newTextureWithDescriptor_(v21, v65, (uint64_t)v25, v66);
            uint64_t v71 = objc_msgSend_newTextureWithDescriptor_(v21, v69, (uint64_t)v31, v70);
            v72 = (char *)self + m;
            *((void *)v72 + 21) = v68;
            *((void *)v72 + 27) = v71;
          }
        }
      }
    }
  }
}

+ (unsigned)frameBufferFeatures
{
  return sub_1B63CC4D8();
}

+ (Class)rendererClass
{
  return (Class)objc_opt_class();
}

- (id)renderer
{
  return self->_renderer;
}

- (BOOL)_usesLayeredRendering
{
  return self->_layout > 3 || (self->_layout & 0xF) == 2;
}

- (BOOL)_usesMultipleViewportRendering
{
  return self->_layout > 3 || (self->_layout & 0xF) == 1;
}

- (void)_initRendererWithOptions:(id)a3
{
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"VFXCompositorRendererLayoutKey", v3);
  if (v6) {
    unint64_t v10 = objc_msgSend_unsignedIntegerValue(v6, v7, v8, v9);
  }
  else {
    unint64_t v10 = 2;
  }
  self->_unint64_t layout = v10;
  unint64_t v11 = objc_opt_class();
  char v22 = objc_msgSend_frameBufferFeatures(v11, v12, v13, v14);
  mtkView = self->_mtkView;
  if (!mtkView)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v16, v17, v18, v19, v20, v21, (uint64_t)"_mtkView");
    mtkView = self->_mtkView;
  }
  objc_msgSend_setFramebufferOnly_(mtkView, v15, 1, v17);
  uint64_t v24 = sub_1B64D7C2C(v22);
  objc_msgSend_setColorPixelFormat_(self->_mtkView, v25, v24, v26);
  objc_msgSend_setSampleCount_(self->_mtkView, v27, 1, v28);
  objc_msgSend_setFramebufferOnly_(self->_mtkView, v29, self->_layout < 2, v30);
  objc_msgSend_setDelegate_(self->_mtkView, v31, (uint64_t)self, v32);
  uint64_t v38 = objc_msgSend_device(self->_mtkView, v33, v34, v35);
  if (!v38)
  {
    uint64_t v38 = objc_msgSend_deviceForOptions_(VFXView, v36, (uint64_t)a3, v37);
    objc_msgSend_setDevice_(self->_mtkView, v39, v38, v40);
  }
  uint64_t v41 = objc_opt_class();
  id v45 = objc_alloc((Class)objc_msgSend_rendererClass(v41, v42, v43, v44));
  self->_renderer = (VFXRenderer *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v45, v46, v38, (uint64_t)a3, 1, self, 0);
  uint64_t v50 = objc_msgSend_clearColor(MEMORY[0x1E4FB1618], v47, v48, v49);
  objc_msgSend_setBackgroundColor_(self->_renderer, v51, v50, v52);
  objc_msgSend_setVertexAmplificationEnabled_(self->_renderer, v53, 1, v54);
  uint64_t v58 = objc_msgSend__renderingQueue(self->_renderer, v55, v56, v57);
  self->_coalescingSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, v58);
  objc_initWeak(&location, self);
  coalescingSource = self->_coalescingSource;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1B658215C;
  handler[3] = &unk_1E6144358;
  objc_copyWeak(&v90, &location);
  dispatch_source_set_event_handler(coalescingSource, handler);
  dispatch_resume((dispatch_object_t)self->_coalescingSource);
  self->_viewpointCoordinateSpace = 1;
  *(_OWORD *)self->_anon_170 = xmmword_1B6E4F300;
  *(_OWORD *)&self->_anon_170[16] = xmmword_1B6E4F320;
  *(_OWORD *)&self->_anon_170[32] = xmmword_1B6E4F2E0;
  *(_OWORD *)&self->_anon_170[48] = xmmword_1B6E72390;
  *(_OWORD *)&self[1].super.isa = xmmword_1B6E4F300;
  *(_OWORD *)&self[1]._coalescingSource = xmmword_1B6E4F320;
  *(_OWORD *)&self[1]._viewpointCoordinateSpace = xmmword_1B6E4F2E0;
  *(_OWORD *)self[1]._rasterizationRateMapDataBuffer = xmmword_1B6E723A0;
  renderer = self->_renderer;
  uint64_t v64 = objc_msgSend_layer(self->_mtkView, v61, v62, v63);
  objc_msgSend_contentsScale(v64, v65, v66, v67);
  *(float *)&double v68 = v68;
  objc_msgSend__setContentsScaleFactor_(renderer, v69, v70, v71, v68);
  v72 = self->_mtkView;
  objc_msgSend_drawableSize(v72, v73, v74, v75);
  objc_msgSend_mtkView_drawableSizeWillChange_(self, v76, (uint64_t)v72, v77);
  v88 = objc_msgSend__renderContextMetal(self->_renderer, v78, v79, v80);
  if (!v88) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v82, v83, v84, v85, v86, v87, (uint64_t)"renderContext");
  }
  objc_msgSend_setIsOpaque_(v88, v81, 1, v83);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&location);
}

- (unint64_t)antialiasingMode
{
  return objc_msgSend_antialiasingMode(self->_renderer, a2, v2, v3);
}

- (void)setAntialiasingMode:(unint64_t)a3
{
}

- (void)_setAntialiasingMode:(unint64_t)a3 forcingReset:(BOOL)a4
{
  if (a4 || objc_msgSend_antialiasingMode(self->_renderer, a2, a3, a4) != a3)
  {
    objc_msgSend_lock(self->_renderer, a2, a3, a4);
    uint64_t v13 = (const char *)sub_1B64D976C(a3, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_device(self->_renderer, v14, v15, v16);
    self->_sampleCount = sub_1B64D97B8(v17, v13, v18, v19);
    objc_msgSend_setAntialiasingMode_(self->_renderer, v20, a3, v21);
    objc_msgSend__rebuildTextures(self, v22, v23, v24);
    renderer = self->_renderer;
    objc_msgSend_unlock(renderer, v25, v26, v27);
  }
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend_backgroundColor(self->_renderer, a2, v2, v3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_msgSend_setBackgroundColor_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (__n128)viewMatrix0
{
  return a1[23];
}

- (uint64_t)setViewMatrix0:(__n128)a3
{
  double v16 = a6.n128_f64[0];
  double v14 = a4.n128_f64[0];
  double v15 = a5.n128_f64[0];
  double v13 = a3.n128_f64[0];
  *(__n128 *)(a1 + 368) = a3;
  *(__n128 *)(a1 + 384) = a4;
  *(__n128 *)(a1 + 400) = a5;
  *(__n128 *)(a1 + 416) = a6;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 152), a2, 0, a8);

  return objc_msgSend_setViewMatrix_(v8, v9, v10, v11, v13, v14, v15, v16);
}

- (__n128)viewMatrix1
{
  return a1[27];
}

- (uint64_t)setViewMatrix1:(__n128)a3
{
  double v16 = a6.n128_f64[0];
  double v14 = a4.n128_f64[0];
  double v15 = a5.n128_f64[0];
  double v13 = a3.n128_f64[0];
  *(__n128 *)(a1 + 432) = a3;
  *(__n128 *)(a1 + 448) = a4;
  *(__n128 *)(a1 + 464) = a5;
  *(__n128 *)(a1 + 480) = a6;
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 152), a2, 1, a8);

  return objc_msgSend_setViewMatrix_(v8, v9, v10, v11, v13, v14, v15, v16);
}

- (unint64_t)viewpointCoordinateSpace
{
  return self->_viewpointCoordinateSpace;
}

- (void)setViewpointCoordinateSpace:(unint64_t)a3
{
  self->_viewpointCoordinateSpace = a3;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
}

- (void)_allowGPUBackgroundExecution
{
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  v6.f64[0] = a4.width * 0.5;
  v6.f64[1] = a4.height;
  *(uint32x2_t *)&self->_logicalWidth = vcvt_u32_f32(vrndp_f32(vcvt_f32_f64(v6)));
  renderer = self->_renderer;
  uint64_t v8 = objc_msgSend_layer(self->_mtkView, a2, (uint64_t)a3, v4);
  objc_msgSend_contentsScale(v8, v9, v10, v11);
  *(float *)&double v12 = v12;
  objc_msgSend__setContentsScaleFactor_(renderer, v13, v14, v15, v12);
  LODWORD(v16) = self->_logicalWidth;
  LODWORD(v17) = self->_logicalHeight;
  objc_msgSend__setBackingSize_(self->_renderer, v18, v19, v20, (double)v16, (double)v17);
  objc_msgSend_set_viewport_(self->_renderer, v21, v22, v23, 0.0);
  objc_msgSend__rebuildTextures(self, v24, v25, v26);

  self->_viewpoints = 0;
}

- (void)drawInMTKView:(id)a3
{
}

- (void)_drawInRenderingQueueWithDrawable:(id)a3 renderPassDescriptor:(id)a4
{
  if (self->_viewpoints) {
    goto LABEL_39;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  self->_viewpoints = (NSArray *)objc_msgSend_initWithCapacity_(v5, v6, 2, v7);
  self->_attachmentCount = 0;
  uint64_t v11 = objc_msgSend_pointOfView(self->_renderer, v8, v9, v10);
  uint64_t v15 = objc_msgSend_camera(v11, v12, v13, v14);
  LODWORD(v16) = self->_logicalWidth;
  LODWORD(v17) = self->_logicalHeight;
  objc_msgSend_projectionTransformWithViewportSize_(v15, v18, v19, v20, (double)v16, (double)v17);
  unint64_t layout = self->_layout;
  double v394 = v23;
  double v396 = v22;
  double v390 = v25;
  double v392 = v24;
  switch(layout)
  {
    case 1uLL:
      id v74 = objc_alloc_init(MEMORY[0x1E4F352E0]);
      objc_msgSend_setRasterizationRateMap_(v74, v75, (uint64_t)self->_rasterizationRateMap, v76);
      uint64_t v80 = objc_msgSend_colorAttachments(v74, v77, v78, v79);
      uint64_t v83 = (MTLRenderPassColorAttachmentDescriptor *)objc_msgSend_objectAtIndexedSubscript_(v80, v81, 0, v82);
      char v84 = 1;
      objc_msgSend_setStoreAction_(v83, v85, 1, v86);
      id v90 = (MTLRenderPassDepthAttachmentDescriptor *)objc_msgSend_depthAttachment(v74, v87, v88, v89);
      objc_msgSend_setLoadAction_(v90, v91, 2, v92);
      objc_msgSend_setStoreAction_(v90, v93, 0, v94);
      objc_msgSend_setClearDepth_(v90, v95, v96, v97, 0.0);
      self->_attachments[0].colorAttachment = v83;
      self->_attachments[0].depthAttachment = v90;
      ++self->_attachmentCount;
      self->_attachments[0].drawableIndex = 0;
      do
      {
        v98 = objc_alloc_init(VFXRendererViewPoint);
        objc_msgSend_setPassDescriptor_(v98, v99, (uint64_t)v74, v100);
        uint64_t v104 = 432;
        if (v84) {
          uint64_t v104 = 368;
        }
        uint64_t v105 = 448;
        if (v84)
        {
          uint64_t v105 = 384;
          uint64_t v106 = 400;
        }
        else
        {
          uint64_t v106 = 464;
        }
        if (v84) {
          uint64_t v107 = 416;
        }
        else {
          uint64_t v107 = 480;
        }
        objc_msgSend_setViewMatrix_(v98, v101, v102, v103, *(double *)((char *)&self->super.isa + v104), *(double *)((char *)&self->super.isa + v105), *(double *)((char *)&self->super.isa + v106), *(double *)((char *)&self->super.isa + v107));
        objc_msgSend_setProjectionMatrix_(v98, v108, v109, v110, v396, v394, v392, v390);
        int v113 = v84 & 1;
        v413[1] = 0;
        uint64_t v114 = *(void *)&self->_logicalWidth;
        v115.i64[0] = v114;
        v115.i64[1] = HIDWORD(v114);
        uint64x2_t v116 = v115;
        double v117 = (float)v114;
        if (v84) {
          double v117 = 0.0;
        }
        *(double *)v413 = v117;
        float64x2_t v414 = vcvtq_f64_u64(v116);
        long long v415 = xmmword_1B6E723B0;
        objc_msgSend_setViewport_(v98, v111, (uint64_t)v413, v112);
        objc_msgSend_addObject_(self->_viewpoints, v118, (uint64_t)v98, v119);

        char v84 = 0;
      }
      while (v113);
      goto LABEL_38;
    case 2uLL:
      id v74 = objc_alloc_init(MEMORY[0x1E4F352E0]);
      objc_msgSend_setRasterizationRateMap_(v74, v120, (uint64_t)self->_rasterizationRateMap, v121);
      objc_msgSend_setRenderTargetArrayLength_(v74, v122, 2, v123);
      v127 = objc_msgSend_colorAttachments(v74, v124, v125, v126);
      uint64_t v130 = (MTLRenderPassColorAttachmentDescriptor *)objc_msgSend_objectAtIndexedSubscript_(v127, v128, 0, v129);
      char v131 = 1;
      objc_msgSend_setStoreAction_(v130, v132, 1, v133);
      v137 = (MTLRenderPassDepthAttachmentDescriptor *)objc_msgSend_depthAttachment(v74, v134, v135, v136);
      objc_msgSend_setLoadAction_(v137, v138, 2, v139);
      objc_msgSend_setStoreAction_(v137, v140, 0, v141);
      objc_msgSend_setClearDepth_(v137, v142, v143, v144, 0.0);
      self->_attachments[0].colorAttachment = v130;
      self->_attachments[0].depthAttachment = v137;
      ++self->_attachmentCount;
      self->_attachments[0].drawableIndex = 0;
      do
      {
        v145 = objc_alloc_init(VFXRendererViewPoint);
        objc_msgSend_setPassDescriptor_(v145, v146, (uint64_t)v74, v147);
        int v151 = v131 & 1;
        uint64_t v152 = 432;
        if (v131) {
          uint64_t v152 = 368;
        }
        uint64_t v153 = 448;
        if (v131)
        {
          uint64_t v153 = 384;
          uint64_t v154 = 400;
        }
        else
        {
          uint64_t v154 = 464;
        }
        if (v131) {
          uint64_t v155 = 416;
        }
        else {
          uint64_t v155 = 480;
        }
        objc_msgSend_setViewMatrix_(v145, v148, v149, v150, *(double *)((char *)&self->super.isa + v152), *(double *)((char *)&self->super.isa + v153), *(double *)((char *)&self->super.isa + v154), *(double *)((char *)&self->super.isa + v155));
        objc_msgSend_setProjectionMatrix_(v145, v156, v157, v158, v396, v394, v392, v390);
        v410[0] = 0;
        v410[1] = 0;
        uint64_t v159 = *(void *)&self->_logicalWidth;
        v160.i64[0] = v159;
        v160.i64[1] = HIDWORD(v159);
        float64x2_t v411 = vcvtq_f64_u64(v160);
        long long v412 = xmmword_1B6E723B0;
        objc_msgSend_setViewport_(v145, v161, (uint64_t)v410, v162);
        objc_msgSend_addObject_(self->_viewpoints, v163, (uint64_t)v145, v164);

        char v131 = 0;
      }
      while (v151);
LABEL_38:

      break;
    case 3uLL:
      uint64_t v26 = 0;
      char v27 = 1;
      do
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F352E0]);
        objc_msgSend_setRasterizationRateMap_(v28, v29, (uint64_t)self->_rasterizationRateMap, v30);
        objc_msgSend_setRenderTargetArrayLength_(v28, v31, 0, v32);
        v36 = objc_msgSend_colorAttachments(v28, v33, v34, v35);
        uint64_t v39 = (MTLRenderPassColorAttachmentDescriptor *)objc_msgSend_objectAtIndexedSubscript_(v36, v37, 0, v38);
        objc_msgSend_setStoreAction_(v39, v40, 1, v41);
        id v45 = (MTLRenderPassDepthAttachmentDescriptor *)objc_msgSend_depthAttachment(v28, v42, v43, v44);
        objc_msgSend_setLoadAction_(v45, v46, 2, v47);
        objc_msgSend_setStoreAction_(v45, v48, 0, v49);
        objc_msgSend_setClearDepth_(v45, v50, v51, v52, 0.0);
        uint64_t v53 = &self->_attachments[v26];
        v53->drawableIndex = v26;
        v53->colorAttachment = v39;
        v53->depthAttachment = v45;
        ++self->_attachmentCount;
        uint64_t v54 = objc_alloc_init(VFXRendererViewPoint);
        objc_msgSend_setPassDescriptor_(v54, v55, (uint64_t)v28, v56);
        int v60 = v27 & 1;
        uint64_t v61 = 432;
        if (v27) {
          uint64_t v61 = 368;
        }
        uint64_t v62 = 448;
        if (v27) {
          uint64_t v62 = 384;
        }
        uint64_t v63 = 464;
        if (v27)
        {
          uint64_t v63 = 400;
          uint64_t v64 = 416;
        }
        else
        {
          uint64_t v64 = 480;
        }
        objc_msgSend_setViewMatrix_(v54, v57, v58, v59, *(double *)((char *)&self->super.isa + v61), *(double *)((char *)&self->super.isa + v62), *(double *)((char *)&self->super.isa + v63), *(double *)((char *)&self->super.isa + v64));
        objc_msgSend_setProjectionMatrix_(v54, v65, v66, v67, v396, v394, v392, v390);
        v407[0] = 0;
        v407[1] = 0;
        uint64_t v68 = *(void *)&self->_logicalWidth;
        v69.i64[0] = v68;
        v69.i64[1] = HIDWORD(v68);
        float64x2_t v408 = vcvtq_f64_u64(v69);
        long long v409 = xmmword_1B6E723B0;
        objc_msgSend_setViewport_(v54, v70, (uint64_t)v407, v71);
        objc_msgSend_addObject_(self->_viewpoints, v72, (uint64_t)v54, v73);

        char v27 = 0;
        uint64_t v26 = 1;
      }
      while (v60);
      break;
  }
LABEL_39:
  v172 = (float32x4_t *)objc_msgSend__engineContext(self->_renderer, a2, (uint64_t)a3, (uint64_t)a4);
  if (!v172) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v166, v167, v168, v169, v170, v171, (uint64_t)"engineContext");
  }
  v173 = objc_msgSend__renderContextMetal(self->_renderer, v165, v166, v167);
  uint64_t v177 = objc_msgSend_currentFrameIndex(v173, v174, v175, v176);
  int v185 = sub_1B64478B0((uint64_t)v172, v178, v179, v180, v181, v182, v183, v184);
  if (v185) {
    uint64_t v189 = 0;
  }
  else {
    uint64_t v189 = 2;
  }
  if (v185)
  {
    float64x2_t v397 = (float64x2_t)xmmword_1B6E500C0;
    float64x2_t v190 = 0uLL;
  }
  else
  {
    *(double *)v191.i64 = sub_1B644780C(v172);
    float64x2_t v397 = vcvt_hight_f64_f32(v191);
    float64x2_t v190 = vcvtq_f64_f32(*(float32x2_t *)v191.f32);
  }
  float64x2_t v395 = v190;
  uint64_t v192 = v177 % 3;
  id v193 = a4;
  if (self->_attachmentCount)
  {
    unint64_t v194 = 0;
    colorTextures = self->_colorTextures;
    depthTextures = self->_depthTextures;
    p_depthAttachment = &self->_attachments[0].depthAttachment;
    v393 = self->_msaaColorTextures[v192];
    v391 = self->_msaaDepthTextures[v192];
    uint64_t v389 = v177 % 3;
    while (1)
    {
      v199 = *(p_depthAttachment - 1);
      v198 = *p_depthAttachment;
      unint64_t v200 = self->_layout;
      if (v200 - 2 < 2) {
        break;
      }
      if (v200 == 1)
      {
        v218 = depthTextures;
        v219 = colorTextures;
        uint64_t v220 = v189;
        objc_msgSend_setClearColor_(self->_mtkView, v186, v187, v188, *(_OWORD *)&v395, *(_OWORD *)&v397);
        v224 = objc_msgSend_colorAttachments(v193, v221, v222, v223);
        v227 = v193;
        v228 = objc_msgSend_objectAtIndexedSubscript_(v224, v225, 0, v226);
        uint64_t v232 = objc_msgSend_texture(v228, v229, v230, v231);
        objc_msgSend_setTexture_(v199, v233, v232, v234);
        v238 = objc_msgSend_depthAttachment(v227, v235, v236, v237);
        uint64_t v242 = objc_msgSend_texture(v238, v239, v240, v241);
        objc_msgSend_setTexture_(v198, v243, v242, v244);
        if (self->_sampleCount < 2)
        {
          uint64_t v213 = 0;
          uint64_t v261 = 1;
        }
        else
        {
          uint64_t v248 = objc_msgSend_resolveTexture(v228, v245, v246, v247);
          objc_msgSend_setResolveTexture_(v199, v249, v248, v250);
          v254 = objc_msgSend_depthAttachment(v227, v251, v252, v253);
          uint64_t v258 = objc_msgSend_resolveTexture(v254, v255, v256, v257);
          objc_msgSend_setResolveTexture_(v198, v259, v258, v260);
          uint64_t v261 = 2;
          uint64_t v213 = 2;
        }
        uint64_t v189 = v220;
        colorTextures = v219;
        depthTextures = v218;
        uint64_t v192 = v389;
        objc_msgSend_setStoreAction_(v199, v245, v261, v247);
        goto LABEL_58;
      }
LABEL_59:
      ++v194;
      p_depthAttachment += 3;
      if (v194 >= self->_attachmentCount) {
        goto LABEL_60;
      }
    }
    uint64_t v201 = (uint64_t)*(p_depthAttachment - 2);
    objc_msgSend_setLoadAction_(*(p_depthAttachment - 1), v186, v189, v188);
    objc_msgSend_setClearColor_(v199, v202, v203, v204, *(_OWORD *)&v395, *(_OWORD *)&v397);
    if (self->_sampleCount < 2)
    {
      objc_msgSend_setTexture_(v199, v205, (uint64_t)colorTextures[v192][v201], v206);
      objc_msgSend_setTexture_(v198, v262, (uint64_t)depthTextures[v192][v201], v263);
      uint64_t v213 = 0;
      objc_msgSend_setStoreAction_(v199, v264, 1, v265);
    }
    else
    {
      objc_msgSend_setTexture_(v199, v205, (uint64_t)v393[v201], v206);
      objc_msgSend_setTexture_(v198, v207, (uint64_t)v391[v201], v208);
      objc_msgSend_setResolveTexture_(v199, v209, (uint64_t)colorTextures[v192][v201], v210);
      objc_msgSend_setResolveTexture_(v198, v211, (uint64_t)depthTextures[v192][v201], v212);
      uint64_t v213 = 2;
      objc_msgSend_setStoreAction_(v199, v214, 2, v215);
    }
LABEL_58:
    objc_msgSend_setStoreAction_(v198, v216, v213, v217);
    id v193 = a4;
    goto LABEL_59;
  }
LABEL_60:
  objc_msgSend_lock(self->_renderer, v186, v187, v188);
  objc_msgSend_lock(VFXTransaction, v266, v267, v268);
  CFTimeInterval v269 = CACurrentMediaTime();
  objc_msgSend_updateAtTime_(self->_renderer, v270, v271, v272, v269);
  v276 = objc_msgSend_commandQueue(self->_renderer, v273, v274, v275);
  v283 = objc_msgSend_commandBuffer(v276, v277, v278, v279);
  if (!self->_layout)
  {
    double v331 = *MEMORY[0x1E4F1DAD8];
    double v332 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend__backingSize(self->_renderer, v280, v281, v282);
    double v334 = v333;
    double v336 = v335;
    objc_msgSend_setRasterizationRateMap_(a4, v337, (uint64_t)self->_rasterizationRateMap, v338);
    objc_msgSend_renderWithViewport_commandBuffer_passDescriptor_(self->_renderer, v339, (uint64_t)v283, (uint64_t)a4, v331, v332, v334, v336);
LABEL_75:
    id v288 = a3;
    goto LABEL_76;
  }
  objc_msgSend_renderWithCommandBuffer_viewPoints_mode_(self->_renderer, v280, (uint64_t)v283, (uint64_t)self->_viewpoints, self->_viewpointCoordinateSpace);
  unint64_t v287 = self->_layout;
  if (v287 == 3)
  {
    v340 = objc_msgSend_texture(a3, v284, v285, v286);
    v341 = &self->super.isa + v192;
    objc_msgSend_copyParameterDataToBuffer_offset_(self->_rasterizationRateMap, v342, (uint64_t)v341[6], 0);
    v346 = objc_msgSend_computeCommandEncoder(v283, v343, v344, v345);
    objc_msgSend_setLabel_(v346, v347, @"VFX - Blit for VFXCompositorRendererLayoutDedicated", v348);
    objc_msgSend_setComputePipelineState_(v346, v349, (uint64_t)self->_rasterizationRateMapBlitPipeline, v350);
    objc_msgSend_setBuffer_offset_atIndex_(v346, v351, (uint64_t)v341[6], 0, 0);
    objc_msgSend_setTexture_atIndex_(v346, v352, (uint64_t)v340, 1);
    if (self->_attachmentCount)
    {
      unint64_t v356 = 0;
      p_colorAttachment = (void **)&self->_attachments[0].colorAttachment;
      int64x2_t v399 = vdupq_n_s64(1uLL);
      do
      {
        v358 = *p_colorAttachment;
        uint64_t v360 = objc_msgSend_resolveTexture(*p_colorAttachment, v353, v354, v355);
        if (!v360) {
          uint64_t v360 = objc_msgSend_texture(v358, v359, 0, v361);
        }
        objc_msgSend_setTexture_atIndex_(v346, v359, v360, 0);
        uint64_t v406 = 0;
        uint64_t v406 = ((unint64_t)objc_msgSend_width(v340, v362, v363, v364) >> 1) * v356;
        objc_msgSend_setBytes_length_atIndex_(v346, v365, (uint64_t)&v406, 8, 1);
        uint64_t v369 = objc_msgSend_threadExecutionWidth(self->_rasterizationRateMapBlitPipeline, v366, v367, v368);
        unint64_t v373 = (unint64_t)objc_msgSend_width(v340, v370, v371, v372) >> 1;
        uint64_t v377 = objc_msgSend_height(v340, v374, v375, v376);
        unint64_t v402 = v373;
        uint64_t v403 = v377;
        uint64_t v404 = 1;
        uint64_t v400 = v369;
        int64x2_t v401 = v399;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v346, v378, (uint64_t)&v402, (uint64_t)&v400);
        ++v356;
        p_colorAttachment += 3;
      }
      while (v356 < self->_attachmentCount);
    }
    objc_msgSend_endEncoding(v346, v353, v354, v355);
    goto LABEL_75;
  }
  id v288 = a3;
  if (v287 == 2)
  {
    v289 = objc_msgSend_texture(a3, v284, v285, v286);
    colorAttachment = self->_attachments[0].colorAttachment;
    uint64_t v297 = objc_msgSend_resolveTexture(colorAttachment, v291, v292, v293);
    if (!v297) {
      uint64_t v297 = objc_msgSend_texture(colorAttachment, v294, v295, v296);
    }
    v298 = &self->super.isa + v192;
    objc_msgSend_copyParameterDataToBuffer_offset_(self->_rasterizationRateMap, v294, (uint64_t)v298[6], 0);
    v302 = objc_msgSend_computeCommandEncoder(v283, v299, v300, v301);
    objc_msgSend_setLabel_(v302, v303, @"VFX - Blit for VFXCompositorRendererLayoutLayered", v304);
    objc_msgSend_setComputePipelineState_(v302, v305, (uint64_t)self->_rasterizationRateMapBlitPipeline, v306);
    objc_msgSend_setBuffer_offset_atIndex_(v302, v307, (uint64_t)v298[6], 0, 0);
    objc_msgSend_setTexture_atIndex_(v302, v308, v297, 0);
    objc_msgSend_setTexture_atIndex_(v302, v309, (uint64_t)v289, 1);
    int v313 = 0;
    char v314 = 1;
    do
    {
      char v315 = v314;
      uint64_t v406 = 0;
      uint64_t v406 = ((unint64_t)objc_msgSend_width(v289, v310, v311, v312) >> 1) * v313;
      objc_msgSend_setBytes_length_atIndex_(v302, v316, (uint64_t)&v406, 8, 1);
      int v405 = v313;
      objc_msgSend_setBytes_length_atIndex_(v302, v317, (uint64_t)&v405, 4, 2);
      uint64_t v321 = objc_msgSend_threadExecutionWidth(self->_rasterizationRateMapBlitPipeline, v318, v319, v320);
      unint64_t v325 = (unint64_t)objc_msgSend_width(v289, v322, v323, v324) >> 1;
      uint64_t v329 = objc_msgSend_height(v289, v326, v327, v328);
      unint64_t v402 = v325;
      uint64_t v403 = v329;
      uint64_t v404 = 1;
      uint64_t v400 = v321;
      int64x2_t v401 = vdupq_n_s64(1uLL);
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v302, v330, (uint64_t)&v402, (uint64_t)&v400);
      char v314 = 0;
      int v313 = 1;
    }
    while ((v315 & 1) != 0);
    objc_msgSend_endEncoding(v302, v310, v311, v312);
  }
LABEL_76:
  objc_msgSend_presentDrawable_(v283, v284, (uint64_t)v288, v286);
  objc_msgSend_commit(v283, v379, v380, v381);
  objc_msgSend_unlock(VFXTransaction, v382, v383, v384);
  objc_msgSend_unlock(self->_renderer, v385, v386, v387);
}

- (VFXWorld)world
{
  return (VFXWorld *)objc_msgSend_world(self->_renderer, a2, v2, v3);
}

- (void)setWorld:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  objc_msgSend_setDelegate_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXWorldRendererDelegate)delegate
{
  return (VFXWorldRendererDelegate *)objc_msgSend_delegate(self->_renderer, a2, v2, v3);
}

- (BOOL)_wantsWorldRendererDelegationMessages
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel__shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner);
}

- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3
{
}

- (id)_resourceManagerMonitor
{
  return (id)objc_msgSend__resourceManagerMonitor(self->_renderer, a2, v2, v3);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  objc_msgSend_set_resourceManagerMonitor_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (id)_commandBufferStatusMonitor
{
  return (id)objc_msgSend__commandBufferStatusMonitor(self->_renderer, a2, v2, v3);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  objc_msgSend_set_commandBufferStatusMonitor_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  objc_msgSend__backingSize(self->_renderer, a2, (uint64_t)a4, v4);
  renderer = self->_renderer;

  return (id)MEMORY[0x1F4181798](renderer, sel__hitTest_viewport_options_, a4, v7);
}

- (CGRect)currentViewport
{
  ((void (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_currentViewport);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  renderer = self->_renderer;
  objc_msgSend__viewport(renderer, a2, (uint64_t)a3, (uint64_t)a4);

  return MEMORY[0x1F4181798](renderer, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  renderer = self->_renderer;
  objc_msgSend__viewport(renderer, a2, (uint64_t)a3, v3);

  return (id)MEMORY[0x1F4181798](renderer, sel__nodesInsideFrustumWithPointOfView_viewport_, a3, v6);
}

- (double)projectPoint:(uint64_t)a3
{
  objc_msgSend__viewport(*(void **)(a1 + 80), a2, a3, a4);
  objc_msgSend__projectPoint_viewport_(*(void **)(a1 + 80), v6, v7, v8, a5, v9, *(void *)&v9, v10);
  LODWORD(v12) = v11;
  *((float *)&v12 + 1) = v15 - v13;
  return v12;
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  objc_msgSend__viewport(*(void **)(a1 + 80), a2, a3, a4);
  uint64_t v7 = *(void *)(a1 + 80);

  return MEMORY[0x1F4181798](v7, sel__unprojectPoint_viewport_, v5, v6);
}

- (VFXNode)pointOfView
{
  return (VFXNode *)objc_msgSend_pointOfView(self->_renderer, a2, v2, v3);
}

- (void)setPointOfView:(id)a3
{
  objc_msgSend_setPointOfView_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (void)setRenderGraph:(id)a3
{
  objc_msgSend_setRenderGraph_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXRenderGraph)renderGraph
{
  return (VFXRenderGraph *)objc_msgSend_renderGraph(self->_renderer, a2, v2, v3);
}

- (BOOL)autoenablesDefaultLighting
{
  return objc_msgSend_autoenablesDefaultLighting(self->_renderer, a2, v2, v3);
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  objc_msgSend_setAutoenablesDefaultLighting_(self->_renderer, a2, a3, v3);
}

- (BOOL)isJitteringEnabled
{
  return 0;
}

- (void)setJitteringEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    double v4 = NSStringFromClass(v3);
    sub_1B63F2F54(16, @"Error: %@ does not support jittering", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
}

- (BOOL)additiveWritesToAlpha
{
  return objc_msgSend_additiveWritesToAlpha(self->_renderer, a2, v2, v3);
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return objc_msgSend_isTemporalAntialiasingEnabled(self->_renderer, a2, v2, v3);
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  objc_msgSend_setTemporalAntialiasingEnabled_(self->_renderer, a2, a3, v3);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  return objc_msgSend_prepareObject_shouldAbortBlock_(self->_renderer, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)showsStatistics
{
  return objc_msgSend_showsStatistics(self->_renderer, a2, v2, v3);
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v5 = sub_1B63F3214(0) | a3;
  renderer = self->_renderer;

  objc_msgSend_setShowsStatistics_(renderer, v4, v5, v6);
}

- (unint64_t)debugOptions
{
  return objc_msgSend_debugOptions(self->_renderer, a2, v2, v3);
}

- (void)setDebugOptions:(unint64_t)a3
{
  objc_msgSend_setDebugOptions_(self->_renderer, a2, a3, v3);
}

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_workingColorSpace);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return (MTLRenderPassDescriptor *)objc_msgSend_currentRenderPassDescriptor(self->_renderer, a2, v2, v3);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return (MTLRenderCommandEncoder *)objc_msgSend_currentRenderCommandEncoder(self->_renderer, a2, v2, v3);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_msgSend_device(self->_renderer, a2, v2, v3);
}

- (unint64_t)colorPixelFormat
{
  return objc_msgSend_colorPixelFormat(self->_renderer, a2, v2, v3);
}

- (unint64_t)depthPixelFormat
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_depthPixelFormat);
}

- (unint64_t)stencilPixelFormat
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_stencilPixelFormat);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_msgSend_commandQueue(self->_renderer, a2, v2, v3);
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_audioEngine);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return (AVAudioEnvironmentNode *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_audioEnvironmentNode);
}

- (VFXNode)audioListener
{
  return (VFXNode *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_audioListener);
}

- (void)setAudioListener:(id)a3
{
}

@end