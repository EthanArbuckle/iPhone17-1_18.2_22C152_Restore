@interface VFXRenderer
+ (VFXRenderer)rendererWithDevice:(id)a3 options:(id)a4;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_collectCompilationErrors;
- (BOOL)_enableARMode;
- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:;
- (BOOL)_legacyAdditiveWritesToAlpha;
- (BOOL)_needsRedrawAsap;
- (BOOL)_needsRepetitiveRedraw;
- (BOOL)_shouldDelegateARCompositing;
- (BOOL)_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner;
- (BOOL)_showsAuthoringEnvironment;
- (BOOL)_triggersEnabled;
- (BOOL)_viewportDidChange;
- (BOOL)_wantsWorldRendererDelegationMessages;
- (BOOL)additiveWritesToAlpha;
- (BOOL)autoAdjustCamera;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)canRecycleParticleBuffers;
- (BOOL)enableDeferredRendering;
- (BOOL)forceAsyncShaderCompilation;
- (BOOL)frozen;
- (BOOL)hasImGuiFrameStarted;
- (BOOL)hasRenderableObjects;
- (BOOL)isEmulatingStereo;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)isVertexAmplificationEnabled;
- (BOOL)jitteringEnabled;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7;
- (BOOL)shouldLoadFinalTexture;
- (BOOL)showsDebugUI;
- (BOOL)showsStatistics;
- (BOOL)temporalAntialiasingEnabled;
- (BOOL)vertexAmplificationEnabled;
- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3;
- (CGImage)_createSnapshotWithSize:(CGSize)a3 error:(id *)a4;
- (CGImage)createSnapshot:(id *)a3;
- (CGRect)currentViewport;
- (CGRect)viewport;
- (CGSize)_backingSize;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (MTLTexture)depthTexture;
- (MTLTexture)texture;
- (NSString)description;
- (UIColor)backgroundColor;
- (VFXNode)audioListener;
- (VFXNode)pointOfView;
- (VFXRenderGraph)renderGraph;
- (VFXRenderer)init;
- (VFXRenderer)initWithCommandQueue:(id)a3;
- (VFXWorld)world;
- (VFXWorldRendererDelegate)delegate;
- (_TtC3VFX8VFXScene)scene;
- (_TtC3VFX9VFXEffect)effect;
- (__CFXEngineContext)_engineContext;
- (__n128)_drawableSafeAreaInsets;
- (__n128)_projectPoint:(uint64_t)a3 viewport:(uint64_t)a4;
- (__n128)_unprojectPoint:(uint64_t)a3 viewport:(uint64_t)a4;
- (__n128)_viewport;
- (double)_computeNextFrameTime;
- (double)nextFrameTime;
- (float)_aspectRatio;
- (float)_contentsScaleFactor;
- (float)_superSamplingFactor;
- (id)MTLTexture;
- (id)_authoringEnvironment;
- (id)_commandBufferStatusMonitor;
- (id)_compilationErrors;
- (id)_computedLightingEnvironmentMapsPath;
- (id)_copyPerformanceStatistics;
- (id)_defaultPOVForWorld:(id)a3;
- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5;
- (id)_initWithDevice:(id)a3 options:(id)a4 isPrivateRenderer:(BOOL)a5 privateRendererOwner:(id)a6 clearsOnDraw:(BOOL)a7;
- (id)_legacyRenderer;
- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:;
- (id)_readSubdivCacheForHash:(id)a3;
- (id)_renderContextMetal;
- (id)_renderingQueue;
- (id)_resourceManagerMonitor;
- (id)currentCommandBuffer;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)hitTestWithSegmentFromPoint:(VFXRenderer *)self toPoint:(SEL)a2 options:(id)a3;
- (id)legacyRenderer;
- (id)metalDevice;
- (id)metalLayer;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)pointOfCulling;
- (id)postRenderCallback;
- (id)privateRendererOwner;
- (id)programWithNode:(id)a3 withMaterial:(id)a4;
- (id)setupLegacyRendererWithCommandQueue:(id)a3;
- (id)snapshot;
- (id)snapshotImageWithSize:(CGSize)a3;
- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4;
- (id)snapshotRendererWithSize:(CGSize)a3;
- (id)snapshotWithSize:(CGSize)a3;
- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4;
- (uint64_t)_screenTransform;
- (uint64_t)set_screenTransform:(uint64_t)a3;
- (uint64_t)unprojectPoint:(uint64_t)a3;
- (uint64_t)workingColorSpace;
- (unint64_t)antialiasingMode;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)debugUIOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)pixelFormat;
- (unint64_t)renderMode;
- (unint64_t)rendererKind;
- (unint64_t)stencilPixelFormat;
- (void)__CFObject;
- (void)_addGPUFrameCompletedHandler:(id)a3;
- (void)_addGPUFramePresentedHandler:(id)a3;
- (void)_addGPUFrameScheduledHandler:(id)a3;
- (void)_allowGPUBackgroundExecution;
- (void)_beginFrame;
- (void)_cfxBackgroundColorDidChange;
- (void)_clearBackBuffer;
- (void)_createOffscreenFramebufferIfNeeded;
- (void)_didRenderWorld:(id)a3;
- (void)_displayLinkStatsTack;
- (void)_displayLinkStatsTick;
- (void)_endFrame;
- (void)_endImGuiFrameAndRender;
- (void)_installViewport;
- (void)_interfaceOrientationDidChange;
- (void)_invalidateFramebuffer;
- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6;
- (void)_prepareRenderTarget;
- (void)_presentFramebuffer;
- (void)_projectPoints:(VFXRenderer *)self count:(SEL)a2 viewport:;
- (void)_render;
- (void)_renderWithViewport:(CGRect)a3 encoder:(id)a4 passDescriptor:(id)a5 commandQueue:(id)a6 commandBuffer:(id)a7;
- (void)_renderWorldWithEngineContext:(__CFXEngineContext *)a3;
- (void)_runningInExtension;
- (void)_setBackingSize:(CGSize)a3;
- (void)_setContentsScaleFactor:(float)a3;
- (void)_setInterfaceOrientation:(int64_t)a3;
- (void)_setLegacyAdditiveWritesToAlpha:(BOOL)a3;
- (void)_setupOffscreenRendererWithSize:(CGSize)a3;
- (void)_updateEngineCallbacks;
- (void)_updateProbes:(id)a3 progress:(id)a4 completionHandler:(id)a5;
- (void)_willRenderWorld:(id)a3;
- (void)_worldDidChange;
- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4;
- (void)dealloc;
- (void)drawStatisticsIfNeeded;
- (void)encodeWithCommandBuffer:(id)a3;
- (void)finalizeEncoding;
- (void)lock;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)projectPoint:(uint64_t)a3;
- (void)render;
- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4;
- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5;
- (void)renderToTexture:(id)a3;
- (void)renderToTexture:(id)a3 options:(id)a4;
- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4 mode:(unint64_t)a5;
- (void)renderWithTextureAttachmentProvider:(id)a3 options:(id)a4;
- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5;
- (void)resolvedBackgroundColorDidChange;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAudioListener:(id)a3;
- (void)setAutoAdjustCamera:(BOOL)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanRecycleParticleBuffers:(BOOL)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDebugUIOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDepthTexture:(id)a3;
- (void)setEffect:(id)a3;
- (void)setEmulateStereo:(BOOL)a3;
- (void)setEnableDeferredRendering:(BOOL)a3;
- (void)setForceAsyncShaderCompilation:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setPointOfCulling:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setPostRenderCallback:(id)a3;
- (void)setRenderGraph:(id)a3;
- (void)setRenderMode:(unint64_t)a3;
- (void)setRendererKind:(unint64_t)a3;
- (void)setRendersContinuously:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setShouldLoadFinalTexture:(BOOL)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setTexture:(id)a3;
- (void)setVertexAmplificationEnabled:(BOOL)a3;
- (void)setWorld:(id)a3;
- (void)setWorld:(id)a3 completionHandler:(id)a4;
- (void)set_aspectRatio:(float)a3;
- (void)set_collectCompilationErrors:(BOOL)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_computedLightingEnvironmentMapsPath:(id)a3;
- (void)set_drawableSafeAreaInsets:(VFXRenderer *)self;
- (void)set_enableARMode:(BOOL)a3;
- (void)set_legacyRenderer:(id)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_shouldDelegateARCompositing:(BOOL)a3;
- (void)set_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3;
- (void)set_superSamplingFactor:(float)a3;
- (void)set_triggersEnabled:(BOOL)a3;
- (void)set_viewport:(VFXRenderer *)self;
- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3;
- (void)setupAuthoringEnvironment;
- (void)startManipulatingPointOfView;
- (void)stopManipulatingPointOfView;
- (void)unlock;
- (void)updateAtTime:(double)a3;
- (void)updateProbes:(id)a3 atTime:(double)a4 completionHandler:(id)a5;
@end

@implementation VFXRenderer

- (uint64_t)workingColorSpace
{
  if (sub_1B63CC4D8())
  {
    if (qword_1E9DDA588 != -1) {
      dispatch_once(&qword_1E9DDA588, &unk_1F0FB64C8);
    }
    v0 = &qword_1E9DDA580;
  }
  else
  {
    if (qword_1EB9953B8 != -1) {
      dispatch_once(&qword_1EB9953B8, &unk_1F0FB6108);
    }
    v0 = &qword_1EB9953B0;
  }
  return *v0;
}

- (VFXRenderer)init
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return self;
}

- (void)_setupOffscreenRendererWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v8 = objc_msgSend_clearColor(MEMORY[0x1E4FB1618], a2, v3, v4);
  objc_msgSend_setBackgroundColor_(self, v9, v8, v10);
  *((unsigned char *)self + 121) |= 0x20u;
  self->_framebufferInfo.drawableSize.CGFloat width = width;
  self->_framebufferInfo.drawableSize.CGFloat height = height;
}

- (id)_initWithDevice:(id)a3 options:(id)a4 isPrivateRenderer:(BOOL)a5 privateRendererOwner:(id)a6 clearsOnDraw:(BOOL)a7
{
  BOOL v9 = a5;
  v103.receiver = self;
  v103.super_class = (Class)VFXRenderer;
  v11 = [(VFXRenderer *)&v103 init];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_world = 0;
    v11->_viewpoints = 0;
    v11->_contentScaleFactor = 1.0;
    v11->_lastWorldTime = -1.0;
    v11->_engineContext = (__CFXEngineContext *)sub_1B644597C();
    *(void *)(v12 + 32) = objc_alloc_init(VFXRecursiveLock);
    objc_msgSend__updateEngineCallbacks((void *)v12, v13, v14, v15);
    sub_1B64472AC(*(void *)(v12 + 184), @"frustumCulling", (void *)*MEMORY[0x1E4F1CFD0], v16, v17, v18, v19, v20);
    sub_1B6447368(*(void *)(v12 + 184), a7, v21, v22, v23, v24, v25, v26);
    uint64_t v33 = *(void *)(v12 + 184);
    if (v33) {
      sub_1B644684C(v33, v12, v27, v28, v29, v30, v31, v32);
    }
    else {
      sub_1B63F2F54(16, @"Error: VFXRenderer::init - no engine context", v27, v28, v29, v30, v31, v32, v102);
    }
    if (v9) {
      char v34 = 8;
    }
    else {
      char v34 = 0;
    }
    *(unsigned char *)(v12 + 121) = *(unsigned char *)(v12 + 121) & 0xF7 | v34;
    *(void *)(v12 + 296) = a6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      char v39 = 16;
    }
    else {
      char v39 = 0;
    }
    char v40 = *(unsigned char *)(v12 + 121) & 0xEF | v39;
    *(unsigned char *)(v12 + 121) = v40;
    if (isKindOfClass)
    {
      v41 = objc_msgSend_metalLayer((void *)v12, v36, v37, v38);
      *(void *)(v12 + 56) = objc_msgSend_pixelFormat(v41, v42, v43, v44);
      char v40 = *(unsigned char *)(v12 + 121);
    }
    if ((v40 & 8) != 0)
    {
      v45 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v36, v37, v38);
      objc_msgSend_addObserver_selector_name_object_(v45, v46, v12, (uint64_t)sel__UIOrientationDidChangeNotification_, *MEMORY[0x1E4FB2638], 0);
      if ((*(unsigned char *)(v12 + 121) & 0x10) != 0)
      {
        v55 = objc_msgSend_window(*(void **)(v12 + 296), v47, v48, v49);
        v59 = objc_msgSend_windowScene(v55, v56, v57, v58);
        int v54 = objc_msgSend_interfaceOrientation(v59, v60, v61, v62);
      }
      else
      {
        v50 = objc_msgSend_sharedApplication(MEMORY[0x1E4FB1438], v47, v48, v49);
        int v54 = objc_msgSend_statusBarOrientation(v50, v51, v52, v53);
      }
      sub_1B64479EC(*(void *)(v12 + 184), v54);
    }
    *(void *)(v12 + 48) = 2;
    if (v9)
    {
      if ((byte_1EB995F50 & 1) == 0)
      {
        byte_1EB995F50 = 1;
        getpid();
        proc_disable_wakemon();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Private renderer only supports VFXView", v63, v64, v65, v66, v67, v68, (uint64_t)"[privateRendererOwner isKindOfClass:[VFXView class]] || [privateRendererOwner isKindOfClass:[VFXCompositorRenderer class]]");
        }
      }
      v69 = NSString;
      v70 = (objc_class *)objc_opt_class();
      v71 = NSStringFromClass(v70);
      v74 = objc_msgSend_stringWithFormat_(v69, v72, @"com.apple.vfx.renderingQueue.%@%p", v73, v71, *(void *)(v12 + 296));
      v77 = (const char *)objc_msgSend_cStringUsingEncoding_(v74, v75, 1, v76);
      v78 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      *(void *)(v12 + 40) = dispatch_queue_create(v77, v78);
    }
    v79 = [VFXMTLRenderContext alloc];
    *(void *)(v12 + 240) = objc_msgSend_initWithDevice_engineContext_(v79, v80, (uint64_t)a3, *(void *)(v12 + 184));
    unint64_t v84 = objc_msgSend_antialiasingMode((void *)v12, v81, v82, v83);
    uint64_t v92 = sub_1B64D976C(v84, v85, v86, v87, v88, v89, v90, v91);
    objc_msgSend_setSampleCount_(*(void **)(v12 + 240), v93, v92, v94);
    sub_1B6445BB8(*(void *)(v12 + 184), *(void **)(v12 + 240), v95, v96, v97, v98, v99, v100);
  }
  return (id)v12;
}

+ (VFXRenderer)rendererWithDevice:(id)a3 options:(id)a4
{
  v5 = a3;
  if (a3
    || (result = (VFXRenderer *)objc_msgSend_deviceForOptions_(VFXView, a2, (uint64_t)a4, (uint64_t)a4),
        (v5 = result) != 0))
  {
    id v8 = objc_alloc((Class)a1);
    isPrivateRenderer_privateRendererOwner_clearsOnDraw = objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v8, v9, (uint64_t)v5, (uint64_t)a4, 0, 0, 0);
    return (VFXRenderer *)isPrivateRenderer_privateRendererOwner_clearsOnDraw;
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_world(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pointOfView(self, v10, v11, v12);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v14, @"<%@ %p: world = %@, pointOfView = %@>", v15, v5, self, v9, v13);
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);
  objc_storeWeak(&self->_delegate, 0);

  self->_preloadRenderer = 0;
  self->_offScreenFramebuffer = 0;

  engineContext = self->_engineContext;
  if (engineContext)
  {
    sub_1B64476A4((uint64_t)engineContext, v8, v9, v10, v11, v12, v13, v14);
    CFRelease(self->_engineContext);
  }
  renderingQueue = self->__renderingQueue;
  if (renderingQueue) {
    dispatch_release(renderingQueue);
  }

  v17.receiver = self;
  v17.super_class = (Class)VFXRenderer;
  [(VFXRenderer *)&v17 dealloc];
}

- (id)currentCommandBuffer
{
  return (id)objc_msgSend_currentCommandBuffer(self->_renderContext, a2, v2, v3);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return (MTLRenderPassDescriptor *)objc_msgSend_currentRenderPassDescriptor(self->_renderContext, a2, v2, v3);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return (MTLRenderCommandEncoder *)objc_msgSend_currentRenderCommandEncoder(self->_renderContext, a2, v2, v3);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_msgSend_device(self->_renderContext, a2, v2, v3);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_msgSend_commandQueue(self->_renderContext, a2, v2, v3);
}

- (unint64_t)colorPixelFormat
{
  if ((*((unsigned char *)self + 121) & 0x20) != 0) {
    offScreenFramebuffer = self->_offScreenFramebuffer;
  }
  else {
    offScreenFramebuffer = objc_msgSend_metalLayer(self, a2, v2, v3);
  }

  return objc_msgSend_pixelFormat(offScreenFramebuffer, a2, v2, v3);
}

- (unint64_t)depthPixelFormat
{
  return 252;
}

- (unint64_t)stencilPixelFormat
{
  return 0;
}

- (void)lock
{
  prof_beginFlame((uint64_t)"-[VFXRenderer lock]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 626);
  objc_msgSend_lock(self->_lock, v3, v4, v5);

  prof_endFlame();
}

- (void)unlock
{
  objc_msgSend_unlock(self->_lock, a2, v2, v3);
}

- (id)_renderingQueue
{
  return self->__renderingQueue;
}

- (void)_installViewport
{
  CGSize drawableSize = self->_framebufferInfo.drawableSize;
  if ((*((unsigned char *)self + 121) & 8) == 0)
  {
    CGSize v11 = self->_framebufferInfo.drawableSize;
    sub_1B63F2F54(17, @"Assertion '%s' failed. invalid renderer", v2, v3, v4, v5, v6, v7, (uint64_t)"_isPrivateRenderer");
    CGSize drawableSize = v11;
  }
  __n128 v12 = (__n128)vcvt_hight_f32_f64(0, (float64x2_t)drawableSize);
  sub_1B64479DC((uint64_t)self->_engineContext, COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)drawableSize)));
  engineContext = self->_engineContext;

  sub_1B64479CC((__n128 *)engineContext, v12);
}

- (void)_clearBackBuffer
{
  if (self->_renderContext)
  {
    uint64_t v2 = sub_1B6445BA0((uint64_t)self->_engineContext);
    sub_1B65F4A30(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_setContentsScaleFactor:(float)a3
{
  self->_contentScaleFactor = a3;
}

- (float)_contentsScaleFactor
{
  return self->_contentScaleFactor;
}

- (CGSize)_backingSize
{
  double width = self->_framebufferInfo.drawableSize.width;
  double height = self->_framebufferInfo.drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setBackingSize:(CGSize)a3
{
  if (a3.width != self->_framebufferInfo.drawableSize.width || a3.height != self->_framebufferInfo.drawableSize.height)
  {
    self->_framebufferInfo.CGSize drawableSize = a3;
    objc_msgSend__invalidateFramebuffer(self, a2, v3, v4);
  }
}

- (void)_invalidateFramebuffer
{
  *((unsigned char *)self + 121) |= 3u;
}

- (void)_beginFrame
{
  objc_msgSend__prepareRenderTarget(self, a2, v2, v3);
  if (self->_renderContext)
  {
    engineContext = self->_engineContext;
    objc_msgSend__contentsScaleFactor(self, v5, v6, v7);
    sub_1B6447BF8((uint64_t)engineContext, v9);
    char v13 = *((unsigned char *)self + 121);
    if ((v13 & 2) != 0)
    {
      *((unsigned char *)self + 121) = v13 & 0xFD;
      sub_1B6445BB0((uint64_t)self->_engineContext);
      sub_1B6445BA8((uint64_t)self->_engineContext);
      char v13 = *((unsigned char *)self + 121);
    }
    renderContext = self->_renderContext;
    if ((v13 & 0x20) != 0)
    {
      objc_msgSend_beginFrame_(renderContext, v10, (uint64_t)self->_offScreenFramebuffer, v12);
    }
    else
    {
      uint64_t v15 = objc_msgSend_metalLayer(self, v10, v11, v12);
      objc_msgSend_beginFrame_(renderContext, v16, v15, v17);
    }
    uint64_t v21 = objc_msgSend_world(self, v18, v19, v20);
    uint64_t v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
    uint64_t v26 = sub_1B644805C((uint64_t)self->_engineContext);
    if (v25)
    {
      if (v26)
      {
        char v34 = (void *)sub_1B64B2054(v25, v27, v28, v29, v30, v31, v32, v33);
        if (objc_msgSend_showsDebugUI(self, v35, v36, v37))
        {
          double v40 = sub_1B64479D4((uint64_t)self->_engineContext);
          double v41 = *(float *)&v40;
          double v42 = *((float *)&v40 + 1);
          objc_msgSend__contentsScaleFactor(self, v43, v44, v45);
          if (!objc_msgSend_beginImgUIFrameWithViewportSize_backingScaleFactor_(v34, v47, v48, v49, v41 / v46, v42 / v46))return; {
          char v50 = *((unsigned char *)self + 248) | 0x10;
          }
        }
        else
        {
          objc_msgSend_setImGUIEnabled_(v34, v38, 0, v39);
          char v50 = *((unsigned char *)self + 248) & 0xEF;
        }
        *((unsigned char *)self + 248) = v50;
      }
    }
  }
}

- (void)_endImGuiFrameAndRender
{
  uint64_t v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_worldRef(v5, v6, v7, v8);
  if ((*((unsigned char *)self + 248) & 0x10) != 0 && v9)
  {
    uint64_t v17 = (void *)sub_1B64B2054(v9, v10, v11, v12, v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_currentCommandBuffer(self, v18, v19, v20);
    uint64_t v25 = objc_msgSend_currentRenderCommandEncoder(self, v22, v23, v24);
    uint64_t v29 = objc_msgSend_currentRenderPassDescriptor(self, v26, v27, v28);
    if (objc_msgSend_endImgUIFrameWithCommandBuffer_encoder_renderPassDescriptor_(v17, v30, v21, v25, v29))*((unsigned char *)self + 248) &= ~0x10u; {
  }
    }
}

- (void)_endFrame
{
  if (!self->_renderContext) {
    return;
  }
  uint64_t v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_worldRef(v5, v6, v7, v8);
  if (v9)
  {
    if ((*((unsigned char *)self + 248) & 0x10) != 0)
    {
      uint64_t v17 = (void *)sub_1B64B2054(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
      if (objc_msgSend_endImgUIFrame(v17, v18, v19, v20)) {
        *((unsigned char *)self + 248) &= ~0x10u;
      }
    }
  }
  if ((*(_WORD *)&self->_selfDelegationConformance & 0x40) != 0)
  {
    double v27 = sub_1B6447718((uint64_t)self->_engineContext);
    objc_msgSend__renderer_inputTimeForCurrentFrameWithTime_(self, v28, (uint64_t)self, v29, v27);
LABEL_16:
    double v34 = v33;
    v35 = objc_msgSend_metalLayer(self, v30, v31, v32);
    objc_msgSend_setInputTime_(v35, v36, v37, v38, v34);
    goto LABEL_17;
  }
  if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x40) != 0)
  {
    privateRendererOwner = self->_privateRendererOwner;
    double v25 = sub_1B6447718((uint64_t)self->_engineContext);
    uint64_t v26 = privateRendererOwner;
LABEL_15:
    objc_msgSend__renderer_inputTimeForCurrentFrameWithTime_(v26, v23, (uint64_t)privateRendererOwner, v24, v25);
    goto LABEL_16;
  }
  if ((*(_WORD *)&self->_delegationConformance & 0x40) != 0)
  {
    privateRendererOwner = self;
    if ((*((unsigned char *)self + 121) & 8) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    id delegate = self->_delegate;
    double v25 = sub_1B6447718((uint64_t)self->_engineContext);
    uint64_t v26 = delegate;
    goto LABEL_15;
  }
LABEL_17:
  renderContext = self->_renderContext;
  uint64_t v40 = (*((unsigned __int8 *)self + 121) >> 5) & 1;

  objc_msgSend_endFrameWaitingUntilCompleted_status_error_(renderContext, v10, v40, 0, 0);
}

- (void)_prepareRenderTarget
{
  char v5 = *((unsigned char *)self + 121);
  if (v5)
  {

    self->_offScreenFramebuffer = 0;
    char v5 = *((unsigned char *)self + 121) & 0xFE;
    *((unsigned char *)self + 121) = v5;
  }
  if ((v5 & 0x20) != 0)
  {
    MEMORY[0x1F4181798](self, sel__createOffscreenFramebufferIfNeeded, v2, v3);
  }
}

- (void)_createOffscreenFramebufferIfNeeded
{
  offScreenFramebuffer = self->_offScreenFramebuffer;
  if (*((unsigned char *)self + 121))
  {

    self->_offScreenFramebuffer = 0;
    *((unsigned char *)self + 121) &= ~1u;
  }
  else if (offScreenFramebuffer)
  {
    return;
  }
  uint64_t width = self->_framebufferInfo.drawableSize.width;
  if (!width)
  {
    sub_1B63F2F54(16, @"Error: framebuffer width must be > 0", v2, v3, v4, v5, v6, v7, v51);
    uint64_t width = 8;
  }
  uint64_t v11 = objc_msgSend_metalDevice(self, a2, v2, v3);
  unsigned int v22 = objc_msgSend_maxTextureWidth2D(v11, v12, v13, v14);
  if (width <= v22) {
    unsigned int v22 = width;
  }
  else {
    sub_1B63F2F54(16, @"Error: framebuffer width (%d) exceeds device's limit (%d), clamping", v16, v17, v18, v19, v20, v21, width);
  }
  uint64_t height = self->_framebufferInfo.drawableSize.height;
  if (!height)
  {
    sub_1B63F2F54(16, @"Error: framebuffer height must be > 0", v16, v17, v18, v19, v20, v21, v51);
    uint64_t height = 8;
  }
  uint64_t v24 = objc_msgSend_metalDevice(self, v15, v16, v17);
  unsigned int v35 = objc_msgSend_maxTextureHeight2D(v24, v25, v26, v27);
  if (height <= v35) {
    unsigned int v35 = height;
  }
  else {
    sub_1B63F2F54(16, @"Error: framebuffer height (%d) exceeds device's limit (%d), clamping", v29, v30, v31, v32, v33, v34, height);
  }
  char v36 = objc_msgSend_wantsWideGamut(self->_renderContext, v28, v29, v30);
  if (self->__antialiasingMode) {
    char v37 = v36 | 8;
  }
  else {
    char v37 = v36;
  }
  uint64_t v38 = sub_1B64D7C2C(v37 | 0x10u);
  uint64_t v40 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], v39, v38, v22, v35, 0);
  objc_msgSend_setUsage_(v40, v41, 5, v42);
  objc_msgSend_setStorageMode_(v40, v43, 0, v44);
  uint64_t v48 = objc_msgSend_metalDevice(self, v45, v46, v47);
  self->_offScreenFramebuffer = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v48, v49, (uint64_t)v40, v50);
}

- (unint64_t)antialiasingMode
{
  if (sub_1B63F3214(3)) {
    return 0;
  }
  else {
    return self->__antialiasingMode;
  }
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  if (self->__antialiasingMode != a3)
  {
    self->__antialiasingMode = a3;
    objc_msgSend__invalidateFramebuffer(self, a2, a3, v3);
    unint64_t v8 = objc_msgSend_antialiasingMode(self, v5, v6, v7);
    uint64_t v17 = sub_1B64D976C(v8, v9, v10, v11, v12, v13, v14, v15);
    renderContext = self->_renderContext;
    if (renderContext) {
      objc_msgSend_setSampleCount_(renderContext, v16, v17, v18);
    }
    engineContext = self->_engineContext;
    sub_1B6445BA8((uint64_t)engineContext);
  }
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (void)set_superSamplingFactor:(float)a3
{
}

- (float)_superSamplingFactor
{
  return sub_1B6447C30((uint64_t)self->_engineContext);
}

- (void)set_aspectRatio:(float)a3
{
  self->__aspectRatio = a3;
}

- (float)_aspectRatio
{
  return self->__aspectRatio;
}

- (uint64_t)set_screenTransform:(uint64_t)a3
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 240), sel_setScreenTransform_, a3, a4);
}

- (uint64_t)_screenTransform
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 240), sel_screenTransform, a3, a4);
}

- (__CFXEngineContext)_engineContext
{
  return self->_engineContext;
}

- (id)_renderContextMetal
{
  return self->_renderContext;
}

- (void)__CFObject
{
  return self->_engineContext;
}

- (BOOL)autoenablesDefaultLighting
{
  objc_msgSend_lock(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__engineContext(self, v5, v6, v7);
  if (v8)
  {
    BOOL v18 = sub_1B64464A0(v8, @"defaultLight", v9, v10, v11, v12, v13, v14) == (const __CFDictionary *)*MEMORY[0x1E4F1CFD0];
  }
  else
  {
    sub_1B63F2F54(16, @"Error: autoenablesDefaultLighting: renderer has no context", v9, v10, v11, v12, v13, v14, v20);
    BOOL v18 = 0;
  }
  objc_msgSend_unlock(self, v15, v16, v17);
  return v18;
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  uint64_t v9 = objc_msgSend__engineContext(self, v6, v7, v8);
  if (v9)
  {
    uint64_t v17 = v9;
    uint64_t v18 = sub_1B644558C(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v26 = v18;
      sub_1B64B0C28(v18, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v32 = (void **)MEMORY[0x1E4F1CFC8];
      if (v4) {
        uint64_t v32 = (void **)MEMORY[0x1E4F1CFD0];
      }
      sub_1B64472AC(v17, @"defaultLight", *v32, v27, v28, v29, v30, v31);
      sub_1B64B0CB4(v26, v33, v34, v35, v36, v37, v38, v39);
    }
    else
    {
      uint64_t v43 = (void **)MEMORY[0x1E4F1CFC8];
      if (v4) {
        uint64_t v43 = (void **)MEMORY[0x1E4F1CFD0];
      }
      sub_1B64472AC(v17, @"defaultLight", *v43, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: setAutoenablesDefaultLighting: renderer has no context", v11, v12, v13, v14, v15, v16, v44);
  }

  objc_msgSend_unlock(self, v40, v41, v42);
}

- (VFXNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
  uint64_t v375 = *MEMORY[0x1E4F143B8];
  if (self->_pointOfView != a3)
  {
    id v4 = a3;
    self->_pointOfViewWasSet = 1;
    if (objc_msgSend_isPresentationObject(a3, a2, (uint64_t)a3, v3)) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. can't set a presentation instance as a point of view", v7, v8, v9, v10, v11, v12, (uint64_t)"[pov isPresentationObject] == 0");
    }
    uint64_t v13 = objc_msgSend_pointOfView(self, v6, v7, v8);
    uint64_t v17 = objc_msgSend_presentationNode(v13, v14, v15, v16);
    uint64_t v18 = self->_pointOfView;
    self->_pointOfView = (VFXNode *)v4;
    objc_msgSend_animationDuration(VFXTransaction, v19, v20, v21);
    double v23 = v22;
    uint64_t v31 = sub_1B644558C((uint64_t)self->_engineContext, v24, v25, v26, v27, v28, v29, v30);
    uint64_t v35 = objc_msgSend_world(self, v32, v33, v34);
    uint64_t v39 = objc_msgSend_clock(v35, v36, v37, v38);
    int isPaused = objc_msgSend_isPaused(v39, v40, v41, v42);
    if (objc_msgSend_immediateMode(VFXTransaction, v44, v45, v46))
    {
      int v50 = 0;
    }
    else
    {
      int v50 = (v23 > 0.0) & ~isPaused;
      objc_msgSend_begin(VFXTransaction, v47, v48, v49);
      if (!v17) {
        int v50 = 0;
      }
    }
    v369[0] = MEMORY[0x1E4F143A8];
    v369[1] = 3221225472;
    v369[2] = sub_1B64EE1B4;
    v369[3] = &unk_1E6143008;
    v369[5] = self;
    v369[6] = v31;
    v369[4] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v47, v31, (uint64_t)self, v369);
    if (!v50) {
      goto LABEL_74;
    }
    uint64_t v362 = objc_msgSend_animationTimingFunction(VFXTransaction, v51, v52, v53);
    if (!v362) {
      uint64_t v362 = sub_1B64FF64C(0, v54, v55, v56);
    }
    if (objc_msgSend_parentNode(v4, v54, v55, v56))
    {
      v60 = objc_msgSend_parentNode(v4, v57, v58, v59);
      uint64_t v64 = objc_msgSend_presentationNode(v60, v61, v62, v63);
      objc_msgSend_convertTransform_fromNode_(v64, v65, (uint64_t)v17, v66, *(double *)&VFXMatrix4Identity, 0.0078125, 0.0, 0.0);
    }
    else
    {
      objc_msgSend_worldTransform(v17, v57, v58, v59);
    }
    long long v354 = v71;
    long long v356 = v70;
    long long v358 = v73;
    long long v360 = v72;
    v74 = objc_msgSend_presentationNode(v4, v67, v68, v69);
    objc_msgSend_transform(v74, v75, v76, v77);
    simd_float4x4 v377 = __invert_f4(v376);
    uint64_t v80 = 0;
    *(_OWORD *)&v370.double a = v356;
    *(_OWORD *)&v370.double c = v354;
    *(_OWORD *)&v370.double tx = v360;
    long long v371 = v358;
    do
    {
      *(float32x4_t *)((char *)&v372.a + v80) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v377.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v370.a + v80))), (float32x4_t)v377.columns[1], *(float32x2_t *)((char *)&v370.a + v80), 1), (float32x4_t)v377.columns[2], *(float32x4_t *)((char *)&v370.a + v80), 2), (float32x4_t)v377.columns[3], *(float32x4_t *)((char *)&v370.a + v80), 3);
      v80 += 16;
    }
    while (v80 != 64);
    double tx = v372.tx;
    double v361 = *(double *)&v373;
    double a = v372.a;
    double c = v372.c;
    v81 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v78, @"transform", v79);
    objc_msgSend_setDuration_(v81, v82, v83, v84, v23);
    objc_msgSend_setTimingFunction_(v81, v85, v362, v86);
    objc_msgSend_setAdditive_(v81, v87, 1, v88);
    uint64_t v92 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E4F29238], v89, v90, v91, a, c, tx, v361);
    objc_msgSend_setFromValue_(v81, v93, v92, v94);
    uint64_t v98 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E4F29238], v95, v96, v97, *(double *)&VFXMatrix4Identity, 0.0078125, 0.0, 0.0);
    objc_msgSend_setToValue_(v81, v99, v98, v100);
    objc_msgSend_addAnimation_forKey_(v4, v101, (uint64_t)v81, 0);
    v105 = objc_msgSend_camera(v17, v102, v103, v104);
    v109 = objc_msgSend_presentationNode(v4, v106, v107, v108);
    v113 = objc_msgSend_camera(v109, v110, v111, v112);
    if ((objc_msgSend_hasCustomProjectionTransform(v105, v114, v115, v116) & 1) != 0
      || (objc_msgSend_hasCustomProjectionTransform(v113, v117, v118, v119) & 1) != 0)
    {
LABEL_58:
      long long v365 = 0u;
      long long v366 = 0u;
      long long v363 = 0u;
      long long v364 = 0u;
      uint64_t v302 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BFD8, v117, (uint64_t)&v363, (uint64_t)v374, 16);
      if (v302)
      {
        uint64_t v303 = v302;
        uint64_t v304 = *(void *)v364;
        do
        {
          for (uint64_t i = 0; i != v303; ++i)
          {
            if (*(void *)v364 != v304) {
              objc_enumerationMutation(&unk_1F103BFD8);
            }
            uint64_t v306 = *(void *)(*((void *)&v363 + 1) + 8 * i);
            v307 = objc_msgSend_valueForKeyPath_(v105, v51, v306, v53);
            uint64_t v310 = objc_msgSend_valueForKeyPath_(v105, v308, v306, v309);
            if (v310) {
              BOOL v311 = v307 == 0;
            }
            else {
              BOOL v311 = 1;
            }
            if (!v311)
            {
              v312 = (void *)v310;
              if ((objc_msgSend_isEqual_(v307, v51, v310, v53) & 1) == 0)
              {
                v313 = v4;
                v314 = (void *)MEMORY[0x1E4F39B48];
                uint64_t v315 = objc_msgSend_stringByAppendingString_(@"camera.", v51, v306, v53);
                v318 = objc_msgSend_animationWithKeyPath_(v314, v316, v315, v317);
                objc_msgSend_setDuration_(v318, v319, v320, v321, v23);
                objc_msgSend_setTimingFunction_(v318, v322, v362, v323);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v327 = NSNumber;
                  objc_msgSend_doubleValue(v307, v324, v325, v326);
                  double v329 = v328;
                  objc_msgSend_doubleValue(v312, v330, v331, v332);
                  uint64_t v337 = objc_msgSend_numberWithDouble_(v327, v334, v335, v336, v329 - v333);
                  objc_msgSend_setFromValue_(v318, v338, v337, v339);
                  uint64_t v343 = objc_msgSend_numberWithDouble_(NSNumber, v340, v341, v342, 0.0);
                  objc_msgSend_setToValue_(v318, v344, v343, v345);
                  objc_msgSend_setAdditive_(v318, v346, 1, v347);
                }
                else
                {
                  objc_msgSend_setFromValue_(v318, v324, (uint64_t)v307, v326);
                  objc_msgSend_setToValue_(v318, v349, (uint64_t)v312, v350);
                }
                id v4 = v313;
                objc_msgSend_addAnimation_forKey_(v313, v348, (uint64_t)v318, 0);
              }
            }
          }
          uint64_t v303 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1F103BFD8, v51, (uint64_t)&v363, (uint64_t)v374, 16);
        }
        while (v303);
      }
LABEL_74:
      if ((objc_msgSend_immediateMode(VFXTransaction, v51, v52, v53) & 1) == 0) {
        objc_msgSend_commit(VFXTransaction, v351, v352, v353);
      }
      return;
    }
    double height = self->_framebufferInfo.drawableSize.height;
    if (height == 0.0) {
      double v123 = 1.0;
    }
    else {
      double v123 = self->_framebufferInfo.drawableSize.width / height;
    }
    objc_msgSend_fieldOfView(v113, v117, v120, v121);
    float v125 = v124;
    int v132 = 0;
    switch(objc_msgSend_fillMode(v113, v126, v127, v128))
    {
      case 0:
        int v132 = v123 < 1.0;
        break;
      case 1:
        int v132 = v123 > 1.0;
        break;
      case 2:
        break;
      default:
        int v132 = 1;
        break;
    }
    uint64_t v133 = objc_msgSend_fillMode(v105, v129, v130, v131);
    if (v133)
    {
      if (v133 != 1)
      {
        if (v133 == 2)
        {
          objc_msgSend_fieldOfView(v105, v134, v135, v136);
          float v141 = v140;
          if ((v132 & 1) == 0) {
            goto LABEL_41;
          }
        }
        else
        {
          objc_msgSend_fieldOfView(v105, v134, v135, v136);
          float v141 = v144;
          if (v132)
          {
LABEL_41:
            if (v141 != v125)
            {
              v146 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v137, @"camera.fieldOfView", v139);
              objc_msgSend_setDuration_(v146, v147, v148, v149, v23);
              objc_msgSend_setTimingFunction_(v146, v150, v362, v151);
              uint64_t v155 = objc_msgSend_numberWithDouble_(NSNumber, v152, v153, v154, (float)(v141 - v125));
              objc_msgSend_setFromValue_(v146, v156, v155, v157);
              uint64_t v161 = objc_msgSend_numberWithDouble_(NSNumber, v158, v159, v160, 0.0);
              objc_msgSend_setToValue_(v146, v162, v161, v163);
              objc_msgSend_setAdditive_(v146, v164, 1, v165);
              objc_msgSend_addAnimation_forKey_(v4, v166, (uint64_t)v146, 0);
            }
            if (objc_msgSend_usesOrthographicProjection(v105, v137, v138, v139))
            {
              if (objc_msgSend_usesOrthographicProjection(v113, v167, v168, v169))
              {
                objc_msgSend_orthographicScale(v105, v167, v168, v169);
                float v171 = v170;
                objc_msgSend_orthographicScale(v113, v172, v173, v174);
                if (v171 != v175)
                {
                  v176 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v167, @"camera.orthographicScale", v169);
                  objc_msgSend_setDuration_(v176, v177, v178, v179, v23);
                  objc_msgSend_setTimingFunction_(v176, v180, v362, v181);
                  v182 = NSNumber;
                  objc_msgSend_orthographicScale(v105, v183, v184, v185);
                  float v187 = v186;
                  objc_msgSend_orthographicScale(v113, v188, v189, v190);
                  *(float *)&double v192 = v187 - v191;
                  uint64_t v196 = objc_msgSend_numberWithFloat_(v182, v193, v194, v195, v192);
                  objc_msgSend_setFromValue_(v176, v197, v196, v198);
                  uint64_t v202 = objc_msgSend_numberWithDouble_(NSNumber, v199, v200, v201, 0.0);
                  objc_msgSend_setToValue_(v176, v203, v202, v204);
                  objc_msgSend_setAdditive_(v176, v205, 1, v206);
                  objc_msgSend_addAnimation_forKey_(v4, v207, (uint64_t)v176, 0);
                }
              }
            }
            objc_msgSend_filmOffset(v105, v167, v168, v169);
            float32x2_t v209 = v208;
            objc_msgSend_filmOffset(v113, v210, v211, v212);
            uint32x2_t v217 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v209, v216));
            if ((vpmax_u32(v217, v217).u32[0] & 0x80000000) != 0)
            {
              objc_msgSend_filmOffset(v105, v213, v214, v215);
              float32x2_t v219 = v218;
              objc_msgSend_filmOffset(v113, v220, v221, v222);
              float32x2_t v224 = vsub_f32(v219, v223);
              v227 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v225, @"camera.filmOffset", v226);
              objc_msgSend_setDuration_(v227, v228, v229, v230, v23);
              objc_msgSend_setTimingFunction_(v227, v231, v362, v232);
              uint64_t v236 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E4F29238], v233, v234, v235, vcvtq_f64_f32(v224));
              objc_msgSend_setFromValue_(v227, v237, v236, v238);
              uint64_t v242 = objc_msgSend_VFX_valueWithCGPoint_(NSNumber, v239, v240, v241, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
              objc_msgSend_setToValue_(v227, v243, v242, v244);
              objc_msgSend_setAdditive_(v227, v245, 1, v246);
              objc_msgSend_addAnimation_forKey_(v4, v247, (uint64_t)v227, 0);
            }
            long long v248 = 0uLL;
            memset(&v372, 0, sizeof(v372));
            if (v105)
            {
              objc_msgSend_postProjectionTransform(v105, v213, v214, v215);
              long long v248 = 0uLL;
            }
            *(_OWORD *)&v370.double c = v248;
            *(_OWORD *)&v370.double tx = v248;
            *(_OWORD *)&v370.double a = v248;
            if (v113) {
              objc_msgSend_postProjectionTransform(v113, v213, v214, v215);
            }
            CGAffineTransform t1 = v372;
            CGAffineTransform t2 = v370;
            if (!CGAffineTransformEqualToTransform(&t1, &t2))
            {
              float32x2_t v250 = vcvt_f32_f64(*(float64x2_t *)&v372.tx);
              float32x2_t v251 = vcvt_f32_f64(*(float64x2_t *)&v370.tx);
              uint32x2_t v252 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v250, v251));
              if ((vpmax_u32(v252, v252).u32[0] & 0x80000000) != 0)
              {
                float32x2_t v253 = vsub_f32(v250, v251);
                v254 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v117, @"camera.postProjectionTransformTranslation", v249);
                objc_msgSend_setDuration_(v254, v255, v256, v257, v23);
                objc_msgSend_setTimingFunction_(v254, v258, v362, v259);
                uint64_t v263 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E4F29238], v260, v261, v262, vcvtq_f64_f32(v253));
                objc_msgSend_setFromValue_(v254, v264, v263, v265);
                uint64_t v269 = objc_msgSend_VFX_valueWithCGPoint_(NSNumber, v266, v267, v268, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
                objc_msgSend_setToValue_(v254, v270, v269, v271);
                objc_msgSend_setAdditive_(v254, v272, 1, v273);
                objc_msgSend_addAnimation_forKey_(v4, v274, (uint64_t)v254, 0);
              }
              v275.f64[0] = v372.a;
              v275.f64[1] = v372.d;
              v276.f64[0] = v370.a;
              v276.f64[1] = v370.d;
              float32x2_t v277 = vcvt_f32_f64(v275);
              float32x2_t v278 = vcvt_f32_f64(v276);
              uint32x2_t v279 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v277, v278));
              if ((vpmax_u32(v279, v279).u32[0] & 0x80000000) != 0)
              {
                float32x2_t v280 = vsub_f32(v277, v278);
                v281 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39B48], v117, @"camera.postProjectionTransformScale", v249);
                objc_msgSend_setDuration_(v281, v282, v283, v284, v23);
                objc_msgSend_setTimingFunction_(v281, v285, v362, v286);
                uint64_t v290 = objc_msgSend_VFX_valueWithCGPoint_(MEMORY[0x1E4F29238], v287, v288, v289, vcvtq_f64_f32(v280));
                objc_msgSend_setFromValue_(v281, v291, v290, v292);
                uint64_t v296 = objc_msgSend_VFX_valueWithCGPoint_(NSNumber, v293, v294, v295, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
                objc_msgSend_setToValue_(v281, v297, v296, v298);
                objc_msgSend_setAdditive_(v281, v299, 1, v300);
                objc_msgSend_addAnimation_forKey_(v4, v301, (uint64_t)v281, 0);
              }
            }
            goto LABEL_58;
          }
        }
LABEL_35:
        if (objc_msgSend_fillMode(v113, v137, v138, v139) != 4 && objc_msgSend_fillMode(v105, v137, v138, v139) != 4)
        {
          if (v132) {
            float v145 = sub_1B64EE358(v141, v123);
          }
          else {
            float v145 = sub_1B64EE3C8(v141, v123);
          }
          float v141 = v145;
        }
        goto LABEL_41;
      }
      int v142 = v123 > 1.0;
    }
    else
    {
      int v142 = v123 < 1.0;
    }
    objc_msgSend_fieldOfView(v105, v134, v135, v136);
    float v141 = v143;
    if (v132 == v142) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
}

- (void)setPointOfCulling:(id)a3
{
  pointOfCulling = self->_pointOfCulling;
  if (pointOfCulling != a3)
  {
    uint64_t v6 = pointOfCulling;
    self->_pointOfCulling = (VFXNode *)a3;
    uint64_t v14 = sub_1B644558C((uint64_t)self->_engineContext, v7, v8, v9, v10, v11, v12, v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B64EE4E4;
    v16[3] = &unk_1E6141230;
    v16[4] = a3;
    v16[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (id)pointOfCulling
{
  return self->_pointOfCulling;
}

- (BOOL)_viewportDidChange
{
  return self->_framebufferInfo.drawableSize.width != COERCE_FLOAT(*(void *)&self->__viewport[8])
      || self->_framebufferInfo.drawableSize.height != COERCE_FLOAT(HIDWORD(*(_OWORD *)self->__viewport));
}

- (void)_projectPoints:(VFXRenderer *)self count:(SEL)a2 viewport:
{
  __n128 v29 = v4;
  uint64_t v5 = v3;
  uint64_t v6 = (float32x4_t *)v2;
  uint64_t v8 = (uint64_t *)objc_msgSend__engineContext(self, a2, v2, v3);
  if (v8)
  {
    uint64_t v16 = sub_1B6446564(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v16)
    {
      if (v5)
      {
        uint64_t v20 = (uint64_t)v16;
        do
        {
          float32x4_t v30 = *v6;
          uint64_t v21 = objc_msgSend_world(self, v17, v18, v19);
          uint64_t v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
          if (sub_1B63D4F14(&v30, 1, v20, v25, (uint64_t)&v30, v26, v27, v28, v29)) {
            float32x4_t *v6 = v30;
          }
          ++v6;
          --v5;
        }
        while (v5);
      }
    }
  }
}

- (__n128)_projectPoint:(uint64_t)a3 viewport:(uint64_t)a4
{
  uint64_t v7 = (uint64_t *)objc_msgSend__engineContext(a1, a2, a3, a4);
  if (v7)
  {
    uint64_t v15 = sub_1B6446564(v7, v8, v9, v10, v11, v12, v13, v14);
    if (v15)
    {
      uint64_t v19 = (uint64_t)v15;
      __n128 v45 = (__n128)a5;
      uint64_t v20 = objc_msgSend_world(a1, v16, v17, v18);
      uint64_t v24 = objc_msgSend_worldRef(v20, v21, v22, v23);
      sub_1B64B0C28(v24, v25, v26, v27, v28, v29, v30, v31);
      LOBYTE(v19) = sub_1B63D4F14((float32x4_t *)&v45, 1, v19, v24, (uint64_t)&v45, v32, v33, v34, a6);
      sub_1B64B0CB4(v24, v35, v36, v37, v38, v39, v40, v41);
      if (v19) {
        return v45;
      }
    }
  }
  return (__n128)a5;
}

- (__n128)_unprojectPoint:(uint64_t)a3 viewport:(uint64_t)a4
{
  uint64_t v7 = (uint64_t *)objc_msgSend__engineContext(a1, a2, a3, a4);
  if (v7)
  {
    uint64_t v15 = sub_1B6446564(v7, v8, v9, v10, v11, v12, v13, v14);
    if (v15)
    {
      uint64_t v19 = (uint64_t)v15;
      __n128 v45 = a5;
      uint64_t v20 = objc_msgSend_world(a1, v16, v17, v18);
      uint64_t v24 = objc_msgSend_worldRef(v20, v21, v22, v23);
      sub_1B64B0C28(v24, v25, v26, v27, v28, v29, v30, v31);
      LOBYTE(v19) = sub_1B63D5100((uint64_t)&v45, 1, v19, v24, (uint64_t)&v45, v32, v33, v34, a6);
      sub_1B64B0CB4(v24, v35, v36, v37, v38, v39, v40, v41);
      if (v19) {
        return v45;
      }
    }
  }
  return a5;
}

- (void)projectPoint:(uint64_t)a3
{
  v5.f64[0] = *((float64_t *)a1 + 10);
  if (v5.f64[0] != 0.0)
  {
    v5.f64[1] = *((float64_t *)a1 + 11);
    return objc_msgSend__projectPoint_viewport_(a1, a2, a3, a4, a5, *(double *)vcvt_hight_f32_f64(0, v5).i64);
  }
  return a1;
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  if (*(double *)(result + 80) != 0.0) {
    return MEMORY[0x1F4181798](result, sel__unprojectPoint_viewport_, a3, a4);
  }
  return result;
}

- (void)_didRenderWorld:(id)a3
{
  if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
  {
    objc_msgSend_setImmediateMode_(VFXTransaction, a2, 1, v3);
    uint64_t v9 = objc_msgSend_worldRef(a3, v6, v7, v8);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v10, v9, v11);
    uint64_t v19 = sub_1B6445480((uint64_t)self->_engineContext, v12, v13, v14, v15, v16, v17, v18);
    double v20 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Did render delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 1454);
    os_signpost_id_t v21 = sub_1B64454CC((uint64_t)self->_engineContext);
    uint64_t v22 = sub_1B63F2EE0();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v26 = v22;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Delegate (didRender)", "", buf, 2u);
      }
    }
    if (!objc_msgSend_clientCommandBuffer(self->_renderContext, v23, v24, v25))
    {
      uint64_t v30 = objc_msgSend_currentCommandBuffer(self->_renderContext, v27, v28, v29);
      objc_msgSend_enqueue(v30, v31, v32, v33);
    }
    if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0)
    {
      privateRendererOwner = self;
      if ((*((unsigned char *)self + 121) & 8) != 0) {
        privateRendererOwner = self->_privateRendererOwner;
      }
      objc_msgSend_renderer_didRenderWorld_atTime_(self->_delegate, v27, (uint64_t)privateRendererOwner, (uint64_t)a3, self->_time);
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0) {
      objc_msgSend__renderer_didRenderWorld_atTime_(self, v27, (uint64_t)self, (uint64_t)a3, self->_time);
    }
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0) {
      objc_msgSend__renderer_didRenderWorld_atTime_(self->_privateRendererOwner, v27, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, self->_time);
    }
    uint64_t v35 = sub_1B63F2EE0();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v36 = v35;
      if (os_signpost_enabled(v35))
      {
        *(_WORD *)uint64_t v41 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v36, OS_SIGNPOST_INTERVAL_END, v21, "Delegate (didRender)", "", v41, 2u);
      }
    }
    *(double *)(v19 + 168) = *(double *)(v19 + 168) + CACurrentMediaTime() - v20;
    prof_endFlame();
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v37, 0, v38);
    objc_msgSend_setImmediateMode_(VFXTransaction, v39, 0, v40);
  }
}

- (void)_willRenderWorld:(id)a3
{
  if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
  {
    objc_msgSend_setImmediateMode_(VFXTransaction, a2, 1, v3);
    uint64_t v9 = objc_msgSend_worldRef(a3, v6, v7, v8);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v10, v9, v11);
    uint64_t v19 = sub_1B6445480((uint64_t)self->_engineContext, v12, v13, v14, v15, v16, v17, v18);
    double v20 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"will render delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 1491);
    os_signpost_id_t v21 = sub_1B64454CC((uint64_t)self->_engineContext);
    uint64_t v22 = sub_1B63F2EE0();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v24 = v22;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Delegate (willRender)", "", buf, 2u);
      }
    }
    double time = self->_time;
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0) {
      objc_msgSend__renderer_willRenderWorld_atTime_(self->_privateRendererOwner, v23, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, self->_time);
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0) {
      objc_msgSend__renderer_willRenderWorld_atTime_(self, v23, (uint64_t)self, (uint64_t)a3, time);
    }
    if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0)
    {
      privateRendererOwner = self;
      if ((*((unsigned char *)self + 121) & 8) != 0) {
        privateRendererOwner = self->_privateRendererOwner;
      }
      objc_msgSend_renderer_willRenderWorld_atTime_(self->_delegate, v23, (uint64_t)privateRendererOwner, (uint64_t)a3, time);
    }
    uint64_t v27 = sub_1B63F2EE0();
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v28 = v27;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v28, OS_SIGNPOST_INTERVAL_END, v21, "Delegate (willRender)", "", v33, 2u);
      }
    }
    *(double *)(v19 + 168) = *(double *)(v19 + 168) + CACurrentMediaTime() - v20;
    prof_endFlame();
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v29, 0, v30);
    objc_msgSend_setImmediateMode_(VFXTransaction, v31, 0, v32);
  }
}

- (id)_readSubdivCacheForHash:(id)a3
{
  if (((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) == 0
     || (id result = (id)objc_msgSend__renderer_subdivDataForHash_(self->_privateRendererOwner, a2, (uint64_t)self->_privateRendererOwner, (uint64_t)a3)) == 0)&& ((*(_WORD *)&self->_selfDelegationConformance & 0x80) == 0|| (id result = (id)objc_msgSend__renderer_subdivDataForHash_(self, a2, (uint64_t)self, (uint64_t)a3)) == 0))
  {
    if ((*(_WORD *)&self->_delegationConformance & 0x80) == 0) {
      return 0;
    }
    privateRendererOwner = self;
    if ((*((unsigned char *)self + 121) & 8) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    id result = (id)objc_msgSend__renderer_subdivDataForHash_(self->_delegate, a2, (uint64_t)privateRendererOwner, (uint64_t)a3);
    if (!result) {
      return 0;
    }
  }
  return result;
}

- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4
{
  if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0) {
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(self->_privateRendererOwner, a2, (uint64_t)self->_privateRendererOwner, (uint64_t)a3, a4);
  }
  if ((*(_WORD *)&self->_selfDelegationConformance & 0x100) != 0) {
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(self, a2, (uint64_t)self, (uint64_t)a3, a4);
  }
  if ((*(_WORD *)&self->_delegationConformance & 0x100) != 0)
  {
    privateRendererOwner = self;
    if ((*((unsigned char *)self + 121) & 8) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    id delegate = self->_delegate;
    objc_msgSend__renderer_didBuildSubdivDataForHash_dataProvider_(delegate, a2, (uint64_t)privateRendererOwner, (uint64_t)a3, a4);
  }
}

- (void)setAutoAdjustCamera:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend__engineContext(self, a2, a3, v3);
  if (v5)
  {
    sub_1B64473B8(v5, v4, v6, v7, v8, v9, v10, v11);
  }
}

- (BOOL)autoAdjustCamera
{
  uint64_t v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4) {
    LOBYTE(v4) = sub_1B6447410(v4, v5, v6, v7, v8, v9, v10, v11) != 0;
  }
  return v4;
}

- (id)_defaultPOVForWorld:(id)a3
{
  uint64_t v4 = objc_msgSend_rootNode(a3, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_childNodesPassingTest_(v4, v5, (uint64_t)&unk_1F0FB5AE8, v6);
  id result = (id)objc_msgSend_count(v7, v8, v9, v10);
  if (result)
  {
    return (id)objc_msgSend_objectAtIndex_(v7, v12, 0, v13);
  }
  return result;
}

- (VFXWorld)world
{
  return self->_world;
}

- (void)_worldDidChange
{
  world = self->_world;
  if (world)
  {
    if (!self->_pointOfViewWasSet
      || (uint64_t v5 = objc_msgSend_world(self->_pointOfView, a2, (uint64_t)world, v2),
          world = self->_world,
          (VFXWorld *)v5 != world))
    {
      uint64_t v7 = objc_msgSend__defaultPOVForWorld_(self, a2, (uint64_t)world, v2);
      if ((*((unsigned char *)self + 121) & 8) != 0) {
        objc_msgSend_setPointOfView_(self->_privateRendererOwner, v6, v7, v8);
      }
      else {
        objc_msgSend_setPointOfView_(self, v6, v7, v8);
      }
      self->_pointOfViewWasSet = 0;
    }
  }
}

- (void)setWorld:(id)a3 completionHandler:(id)a4
{
  objc_msgSend_lock(self, a2, (uint64_t)a3, (uint64_t)a4);

  uint64_t v7 = (VFXWorld *)a3;
  self->_world = v7;
  uint64_t v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1B64EF0B0;
  v36[3] = &unk_1E61411E0;
  v36[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, 0, v36);
  uint64_t v16 = objc_msgSend_defaultRenderGraph(a3, v13, v14, v15);
  objc_msgSend_setRenderGraph_(self, v17, v16, v18);
  objc_msgSend__worldDidChange(self, v19, v20, v21);
  if (a4)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1B64EF104;
    v35[3] = &unk_1E6143538;
    v35[4] = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, 0, (uint64_t)self, v35);
  }
  engineContext = self->_engineContext;
  if (engineContext)
  {
    uint64_t v30 = sub_1B6446254((uint64_t)engineContext, 0, v23, v24, v25, v26, v27, v28);
    if (v30) {
      sub_1B642993C(v30, (uint64_t)a3, v23, v24, v31, v32, v33, v34);
    }
  }
  objc_msgSend_unlock(self, v22, v23, v24);
}

- (void)setWorld:(id)a3
{
  if (self->_world != a3)
  {
    objc_msgSend_lock(self, a2, (uint64_t)a3, v3);

    uint64_t v6 = (VFXWorld *)a3;
    self->_world = v6;
    uint64_t v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B64EF1F4;
    v24[3] = &unk_1E61411E0;
    v24[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v24);
    uint64_t v15 = objc_msgSend_defaultRenderGraph(a3, v12, v13, v14);
    objc_msgSend_setRenderGraph_(self, v16, v15, v17);
    objc_msgSend__worldDidChange(self, v18, v19, v20);
    objc_msgSend_unlock(self, v21, v22, v23);
  }
}

- (UIColor)backgroundColor
{
  legacyRenderer = self->_legacyRenderer;
  if (legacyRenderer)
  {
    return (UIColor *)objc_msgSend_backgroundColor(legacyRenderer, a2, v2, v3);
  }
  else
  {
    uint64_t v7 = self->_backgroundColor;
    return v7;
  }
}

- (void)setBackgroundColor:(id)a3
{
  legacyRenderer = self->_legacyRenderer;
  if (legacyRenderer)
  {
    objc_msgSend_setBackgroundColor_(legacyRenderer, a2, (uint64_t)a3, v3);
  }
  else
  {
    backgroundColor = self->_backgroundColor;
    if (backgroundColor != a3)
    {

      uint64_t v8 = (UIColor *)a3;
      self->_backgroundColor = v8;
      v12.i64[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v8, v9, 0, 0);
      v12.i64[1] = v13;
      CFXColor4 v14 = (CFXColor4)vmulq_f32(v12, (float32x4_t)vdupq_n_s32(HIDWORD(v13)));
      v14.var0.var0[3] = *((float *)&v13 + 1);
      self->_cfxBackgroundColor = v14;
      MEMORY[0x1F4181798](self, sel__cfxBackgroundColorDidChange, v10, v11);
    }
  }
}

- (void)_cfxBackgroundColorDidChange
{
  uint64_t v11 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (!v11) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v5, v6, v7, v8, v9, v10, (uint64_t)"engineContext");
  }
  uint64_t v12 = *(void *)self->_cfxBackgroundColor.var0.var0;
  uint64_t v13 = *(void *)&self->_cfxBackgroundColor.var0.var1.var2;

  sub_1B6447804(v11, v12, v13);
}

- (void)resolvedBackgroundColorDidChange
{
  v5.i64[0] = objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(self->_backgroundColor, a2, 0, 0);
  v5.i64[1] = v6;
  CFXColor4 v7 = (CFXColor4)vmulq_f32(v5, (float32x4_t)vdupq_n_s32(HIDWORD(v6)));
  v7.var0.var0[3] = *((float *)&v6 + 1);
  self->_cfxBackgroundColor = v7;

  MEMORY[0x1F4181798](self, sel__cfxBackgroundColorDidChange, v3, v4);
}

- (id)metalLayer
{
  if ((*((unsigned char *)self + 121) & 0x10) != 0) {
    return (id)((uint64_t (*)(VFXWorldRenderer *, char *))MEMORY[0x1F4181798])(self->_privateRendererOwner, sel_vfx_backingLayer);
  }
  else {
    return 0;
  }
}

- (id)metalDevice
{
  return (id)objc_msgSend_device(self->_renderContext, a2, v2, v3);
}

- (id)_computedLightingEnvironmentMapsPath
{
  uint64_t v8 = sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);

  return (id)MEMORY[0x1F4181798](v8, sel_generatedTexturePath, v9, v10);
}

- (void)set_computedLightingEnvironmentMapsPath:(id)a3
{
  uint64_t v9 = (void *)sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);

  objc_msgSend_setGeneratedTexturePath_(v9, v10, (uint64_t)a3, v11);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_1B63F2F54(16, @"Error: prepareObject is deprecated, use VFXWorld.prepare instead", v8, v9, v10, v11, v12, v13, v114);
    return 0;
  }
  CFXColor4 v14 = (uint64_t *)objc_msgSend_snapshotRendererWithSize_(self, v7, v8, v9, 16.0, 16.0);
  objc_msgSend_setWorld_(v14, v15, (uint64_t)a3, v16);
  objc_msgSend_set_viewport_(v14, v17, v18, v19, 0.0);
  objc_msgSend_flush(VFXTransaction, v20, v21, v22);
  uint64_t v26 = objc_msgSend_worldRef(a3, v23, v24, v25);
  sub_1B64B0C28(v26, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v37 = objc_msgSend__engineContext(v14, v34, v35, v36);
  sub_1B6447920(v37, (uint64_t)a4, v38, v39, v40, v41, v42, v43);
  uint64_t v47 = objc_msgSend__engineContext(v14, v44, v45, v46);
  int v48 = sub_1B6446D6C((uint64_t)self->_engineContext);
  sub_1B6446DEC(v47, v48);
  if ((*((unsigned char *)self + 121) & 8) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!v48) {
      goto LABEL_11;
    }
LABEL_9:
    char v56 = 1;
    goto LABEL_10;
  }
  privateRendererOwner = self->_privateRendererOwner;
  if (objc_msgSend__usesLayeredRendering(privateRendererOwner, v49, v50, v51)) {
    goto LABEL_9;
  }
  if (objc_msgSend__usesMultipleViewportRendering(privateRendererOwner, v53, v54, v55))
  {
    char v56 = 2;
LABEL_10:
    sub_1B6446E00(v47, 2);
    sub_1B6446DE4(v47, v56);
  }
LABEL_11:
  objc_msgSend__beginFrame(v14, v49, v50, v51);
  objc_msgSend_updateAtTime_(v14, v58, v59, v60, self->_time);
  objc_msgSend__render(v14, v61, v62, v63);
  sub_1B64B0CB4(v26, v64, v65, v66, v67, v68, v69, v70);
  uint64_t v114 = 0;
  uint64_t v115 = 0;
  v74 = objc_msgSend__renderContextMetal(v14, v71, v72, v73);
  objc_msgSend_endFrameWaitingUntilCompleted_status_error_(v74, v75, 1, (uint64_t)&v114, &v115);
  uint64_t v79 = objc_msgSend__renderContextMetal(v14, v76, v77, v78);
  uint64_t v83 = objc_msgSend_resourceManager(v79, v80, v81, v82);
  uint64_t v84 = (void *)sub_1B653EFAC(v83);
  objc_msgSend_waitForShadersCompilation(v84, v85, v86, v87);
  uint64_t v95 = (void *)sub_1B6445900(v14[23], v88, v89, v90, v91, v92, v93, v94);
  uint64_t v103 = (void *)sub_1B6445900((uint64_t)self->_engineContext, v96, v97, v98, v99, v100, v101, v102);
  if (v95)
  {
    if (v103)
    {
      uint64_t v107 = objc_msgSend_compilationErrors(v103, v104, v105, v106);
      uint64_t v111 = objc_msgSend_compilationErrors(v95, v108, v109, v110);
      objc_msgSend_addEntriesFromDictionary_(v107, v112, v111, v113);
    }
  }
  return v114 == 4;
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  sub_1B63F2F54(16, @"Error: prepareObjects is deprecated", (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v17);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v11, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend_prepareObject_shouldAbortBlock_(self, v13, *(void *)(*((void *)&v17 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v14);
  }
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (id)programWithNode:(id)a3 withMaterial:(id)a4
{
  return 0;
}

- (void)_updateEngineCallbacks
{
  engineContext = self->_engineContext;
  if (engineContext)
  {
    uint64_t v10 = (void *)sub_1B6446800((uint64_t)engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    __int16 delegationConformance = (__int16)self->_delegationConformance;
    if ((delegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
    {
      *uint64_t v10 = sub_1B64EF8D0;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
    {
      v10[1] = sub_1B64EF92C;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) != 0)
    {
      v10[2] = sub_1B64EF988;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x100) != 0
      || (selfDelegationConformance = (__int16)self->_selfDelegationConformance, (selfDelegationConformance & 0x100) != 0)
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    {
      v10[3] = sub_1B64EF9D0;
      selfDelegationConformance = (__int16)self->_selfDelegationConformance;
    }
    if ((selfDelegationConformance & 0x200) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x200) != 0)
    {
      v10[4] = sub_1B64EECA4;
      v10[5] = sub_1B64EECF4;
      v10[6] = sub_1B64EED68;
      v10[7] = sub_1B64EFA20;
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    __int16 v4 = 2;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFD | v4;
  if (objc_opt_respondsToSelector()) {
    __int16 v5 = 4;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFB | v5;
  if (objc_opt_respondsToSelector()) {
    __int16 v6 = 8;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFF7 | v6;
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 16;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFEF | v7;
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 32;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFDF | v8;
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = 64;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFBF | v9;
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 128;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFF7F | v10;
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = 256;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFCFF | v14;

  objc_msgSend__updateEngineCallbacks(self, v11, v12, v13);
}

- (VFXWorldRendererDelegate)delegate
{
  return (VFXWorldRendererDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)_wantsWorldRendererDelegationMessages
{
  return (*((unsigned __int8 *)self + 248) >> 5) & 1;
}

- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3
{
  if (a3) {
    char v5 = 32;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xDF | v5;
  if (!a3 || (*((unsigned char *)self + 121) & 8) != 0)
  {
    __int16 v14 = 0;
    selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFE00;
  }
  else
  {
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFD | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFB | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFF7 | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 16;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFEF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 32;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFDF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFF7F | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFEFF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 64;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFBF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 512;
    }
    else {
      __int16 v14 = 0;
    }
    selfDelegationConformance = (__int16)self->_selfDelegationConformance;
  }
  *(_WORD *)&self->_selfDelegationConformance = selfDelegationConformance & 0xFDFF | v14;

  objc_msgSend__updateEngineCallbacks(self, a2, a3, v3);
}

- (BOOL)_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner
{
  return (*((unsigned __int8 *)self + 248) >> 6) & 1;
}

- (void)set_shouldForwardWorldRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3
{
  if (a3) {
    char v5 = 64;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xBF | v5;
  if (a3 && (*((unsigned char *)self + 121) & 8) != 0)
  {
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 2;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFD | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 4;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFB | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 8;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFF7 | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 16;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFEF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 32;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFDF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFF7F | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 256;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFEFF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 64;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFBF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 512;
    }
    else {
      __int16 v6 = 0;
    }
    __int16 privateRendererOwnerDelegationConformance = (__int16)self->_privateRendererOwnerDelegationConformance;
  }
  else
  {
    __int16 v6 = 0;
    __int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFE00;
  }
  *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = privateRendererOwnerDelegationConformance & 0xFDFF | v6;

  objc_msgSend__updateEngineCallbacks(self, a2, a3, v3);
}

- (id)_resourceManagerMonitor
{
  return objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  p_resourceManagerMonitor = &self->_resourceManagerMonitor;
  if (objc_loadWeak((id *)&self->_resourceManagerMonitor) != a3)
  {
    if (a3) {
      id v6 = a3;
    }
    else {
      id v6 = 0;
    }
    if (a3) {
      __int16 v7 = self;
    }
    else {
      __int16 v7 = 0;
    }
    objc_storeWeak((id *)p_resourceManagerMonitor, v6);
    objc_msgSend_setResourceManagerMonitor_(self->_renderContext, v8, (uint64_t)v7, v9);
    __int16 v13 = objc_msgSend__renderContextMetal(self->_preloadRenderer, v10, v11, v12);
    objc_msgSend_setResourceManagerMonitor_(v13, v14, (uint64_t)v7, v15);
  }
}

- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  privateRendererOwner = self;
  if ((*((unsigned char *)self + 121) & 8) != 0) {
    privateRendererOwner = self->_privateRendererOwner;
  }
  id Weak = objc_loadWeak((id *)&self->_resourceManagerMonitor);

  MEMORY[0x1F4181798](Weak, sel_renderer_didFallbackToDefaultTextureForSource_message_, privateRendererOwner, a4);
}

- (id)_commandBufferStatusMonitor
{
  return objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  p_commandBufferStatusMonitor = &self->_commandBufferStatusMonitor;
  if (objc_loadWeak((id *)&self->_commandBufferStatusMonitor) != a3)
  {
    if (a3) {
      id v6 = a3;
    }
    else {
      id v6 = 0;
    }
    if (a3) {
      __int16 v7 = self;
    }
    else {
      __int16 v7 = 0;
    }
    objc_storeWeak((id *)p_commandBufferStatusMonitor, v6);
    objc_msgSend_setCommandBufferStatusMonitor_(self->_renderContext, v8, (uint64_t)v7, v9);
    __int16 v13 = objc_msgSend__renderContextMetal(self->_preloadRenderer, v10, v11, v12);
    objc_msgSend_setCommandBufferStatusMonitor_(v13, v14, (uint64_t)v7, v15);
  }
}

- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  privateRendererOwner = self;
  if ((*((unsigned char *)self + 121) & 8) != 0) {
    privateRendererOwner = self->_privateRendererOwner;
  }
  id Weak = objc_loadWeak((id *)&self->_commandBufferStatusMonitor);

  MEMORY[0x1F4181798](Weak, sel_renderer_commandBufferDidCompleteWithError_, privateRendererOwner, a4);
}

- (double)nextFrameTime
{
  return self->_nextFrameTime;
}

- (BOOL)_needsRepetitiveRedraw
{
  if (self->_isAnimating) {
    LOBYTE(v2) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 121) >> 2) & 1;
  }
  return v2;
}

- (void)updateAtTime:(double)a3
{
  objc_msgSend_lock(self, a2, v3, v4);
  prof_beginFlame((uint64_t)"-[VFXRenderer updateAtTime:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2145);
  __int16 v10 = objc_msgSend_world(self, v7, v8, v9);
  long long v17 = (id *)objc_msgSend_worldRef(v10, v11, v12, v13);
  if (v17)
  {
    double time = self->_time;
    long long v19 = objc_msgSend_world(self, v14, v15, v16);
    uint64_t v23 = objc_msgSend_clock(v19, v20, v21, v22);
    objc_msgSend_updateWithAbsoluteTime_(v23, v24, v25, v26, a3);
    uint64_t v30 = objc_msgSend_world(self, v27, v28, v29);
    uint64_t v34 = objc_msgSend_clock(v30, v31, v32, v33);
    objc_msgSend_time(v34, v35, v36, v37);
    double v46 = v45;
    double lastWorldTime = self->_lastWorldTime;
    if (lastWorldTime == -1.0) {
      double v48 = 0.0166666667;
    }
    else {
      double v48 = v46 - lastWorldTime;
    }
    self->_double deltaTime = v48;
    sub_1B64B0C28((uint64_t)v17, v38, v39, v40, v41, v42, v43, v44);
    uint64_t v56 = sub_1B64B20C4((uint64_t)v17, v49, v50, v51, v52, v53, v54, v55);
    uint64_t v57 = v56;
    if (v56)
    {
      uint64_t v58 = (void *)sub_1B6355ECC(v56);
      objc_msgSend_beginTransaction_(v58, v59, (uint64_t)self->_engineContext, v60);
    }
    else
    {
      uint64_t v58 = 0;
    }
    if (self->_deltaTime < 0.0) {
      self->_double deltaTime = 0.0166666667;
    }
    self->_double time = a3;
    self->_double lastWorldTime = v46;
    sub_1B6447710((uint64_t)self->_engineContext, time);
    sub_1B6447720((uint64_t)self->_engineContext, v46);
    sub_1B6447708((uint64_t)self->_engineContext, self->_deltaTime);
    double deltaTime = self->_deltaTime;
    uint64_t v65 = objc_msgSend_world(self, v62, v63, v64);
    uint64_t v69 = objc_msgSend_clock(v65, v66, v67, v68);
    uint64_t isPaused = objc_msgSend_isPaused(v69, v70, v71, v72);
    double v76 = 0.0;
    if (deltaTime >= 0.0) {
      double v76 = deltaTime;
    }
    if (v76 <= 1.0 || self->_privateRendererOwner == 0) {
      double v78 = v76;
    }
    else {
      double v78 = 0.0166666667;
    }
    self->_isAnimating = 0;
    objc_msgSend_setImmediateMode_(VFXTransaction, v73, 1, v74);
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v79, (uint64_t)v17, v80);
    os_signpost_id_t v81 = sub_1B64454CC((uint64_t)self->_engineContext);
    context = (void *)MEMORY[0x1BA9B76E0]();
    uint64_t v96 = (CFTimeInterval *)sub_1B6445480((uint64_t)self->_engineContext, v82, v83, v84, v85, v86, v87, v88);
    if ((*(_WORD *)&self->_delegationConformance & 1) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 1) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
    {
      double v97 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"updateAtTime delegate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2230);
      uint64_t v98 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v101 = v98;
        if (os_signpost_enabled(v98))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v101, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (update)", "", buf, 2u);
        }
      }
      if (*(_WORD *)&self->_privateRendererOwnerDelegationConformance) {
        objc_msgSend__renderer_updateAtTime_(self->_privateRendererOwner, v99, (uint64_t)self->_privateRendererOwner, v100, time, context);
      }
      if (*(_WORD *)&self->_selfDelegationConformance) {
        objc_msgSend__renderer_updateAtTime_(self, v99, (uint64_t)self, v100, time);
      }
      if (*(_WORD *)&self->_delegationConformance)
      {
        privateRendererOwner = self;
        if ((*((unsigned char *)self + 121) & 8) != 0) {
          privateRendererOwner = self->_privateRendererOwner;
        }
        objc_msgSend_renderer_updateAtTime_(self->_delegate, v99, (uint64_t)privateRendererOwner, v100, time, context);
      }
      uint64_t v103 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v104 = v103;
        if (os_signpost_enabled(v103))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v104, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (update)", "", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v97 + v96[21];
      prof_endFlame();
    }
    uint64_t v105 = sub_1B64B2770((uint64_t)v17, v89, v90, v91, v92, v93, v94, v95);
    sub_1B6610884(v105, v106, v107, v108, v109, v110, v111, v112);
    double v113 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Animations", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2253);
    uint64_t v121 = sub_1B64B2008((uint64_t)v17, v114, v115, v116, v117, v118, v119, v120);
    if (v121 && !self->_cameraIsManipulated)
    {
      v122 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v130 = v122;
        if (os_signpost_enabled(v122))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v130, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Animations", "", buf, 2u);
        }
      }
      sub_1B64227DC(v121, v46, time, v123, v124, v125, v126, v127, v128, v129);
      uint64_t v131 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        int v132 = v131;
        if (os_signpost_enabled(v131))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v132, OS_SIGNPOST_INTERVAL_END, v81, "Animations", "", buf, 2u);
        }
      }
      sub_1B6424684(v121);
      self->_isAnimating = sub_1B64231E0(v121, isPaused, v133, v134, v135, v136, v137, v138);
    }
    v96[16] = CACurrentMediaTime() - v113 + v96[16];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 2) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 2) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
    {
      double v139 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didApply Animations", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2267);
      float v140 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        float v143 = v140;
        if (os_signpost_enabled(v140))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v143, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didApplyAnimation)", "", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0) {
        objc_msgSend__renderer_didApplyAnimationsAtTime_(self->_privateRendererOwner, v141, (uint64_t)self->_privateRendererOwner, v142, time);
      }
      if ((*(_WORD *)&self->_selfDelegationConformance & 2) != 0) {
        objc_msgSend__renderer_didApplyAnimationsAtTime_(self, v141, (uint64_t)self, v142, time);
      }
      if ((*(_WORD *)&self->_delegationConformance & 2) != 0)
      {
        float v144 = self;
        if ((*((unsigned char *)self + 121) & 8) != 0) {
          float v144 = self->_privateRendererOwner;
        }
        objc_msgSend_renderer_didApplyAnimationsAtTime_(self->_delegate, v141, (uint64_t)v144, v142, time, context);
      }
      float v145 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v146 = v145;
        if (os_signpost_enabled(v145))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v146, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didApplyAnimation)", "", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v139 + v96[21];
      prof_endFlame();
    }
    double v147 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Authoring", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2285);
    uint64_t v150 = sub_1B64B35C0((uint64_t)v17, 0, v148, v149);
    if (v150) {
      sub_1B640D370(v150, (uint64_t)self, v151, v152);
    }
    v96[20] = CACurrentMediaTime() - v147 + v96[20];
    prof_endFlame();
    double v153 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"VFXCore sync", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2294);
    uint64_t v161 = sub_1B64B2864((uint64_t)v17, v154, v155, v156, v157, v158, v159, v160);
    sub_1B645435C(v161, v162, v163, v164, v165, v166, v167, v168);
    v96[12] = CACurrentMediaTime() - v153 + v96[12];
    prof_endFlame();
    double v169 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Physics", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2300);
    float v170 = sub_1B6583674(v17);
    IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v170, v171, 0, v172);
    if (IfNeeded)
    {
      uint64_t v174 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v178 = v174;
        if (os_signpost_enabled(v174))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v178, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Physics", "", buf, 2u);
        }
      }
      objc_msgSend__step_(IfNeeded, v175, v176, v177, v78, context);
      uint64_t v179 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v183 = v179;
        if (os_signpost_enabled(v179))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v183, OS_SIGNPOST_INTERVAL_END, v81, "Physics", "", buf, 2u);
        }
      }
      if ((isPaused & 1) == 0 && !self->_isAnimating) {
        self->_isAnimating = objc_msgSend__needsRedraw(IfNeeded, v180, v181, v182);
      }
    }
    v96[14] = CACurrentMediaTime() - v169 + v96[14];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 4) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 4) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
    {
      double v184 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didSimulate Physics", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2314);
      uint64_t v185 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v188 = v185;
        if (os_signpost_enabled(v185))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v188, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didUpdatePhysics)", "", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0) {
        objc_msgSend__renderer_didSimulatePhysicsAtTime_(self->_privateRendererOwner, v186, (uint64_t)self->_privateRendererOwner, v187, time);
      }
      if ((*(_WORD *)&self->_selfDelegationConformance & 4) != 0) {
        objc_msgSend__renderer_didSimulatePhysicsAtTime_(self, v186, (uint64_t)self, v187, time);
      }
      if ((*(_WORD *)&self->_delegationConformance & 4) != 0)
      {
        uint64_t v189 = self;
        if ((*((unsigned char *)self + 121) & 8) != 0) {
          uint64_t v189 = self->_privateRendererOwner;
        }
        objc_msgSend_renderer_didSimulatePhysicsAtTime_(self->_delegate, v186, (uint64_t)v189, v187, time, context);
      }
      uint64_t v190 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        float v191 = v190;
        if (os_signpost_enabled(v190))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v191, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didUpdatePhysics)", "", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v184 + v96[21];
      prof_endFlame();
    }
    double v192 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Constraints", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2333);
    uint64_t v203 = sub_1B64B0F40((uint64_t)v17, v193, v194, v195, v196, v197, v198, v199);
    if (v203)
    {
      *(void *)(v203 + 32) = objc_msgSend__engineContext(self, v200, v201, v202);
      uint64_t v204 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v212 = v204;
        if (os_signpost_enabled(v204))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v212, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Constraints", "", buf, 2u);
        }
      }
      sub_1B660BFF4(v203, v205, v206, v207, v208, v209, v210, v211);
      v213 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v214 = v213;
        if (os_signpost_enabled(v213))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v214, OS_SIGNPOST_INTERVAL_END, v81, "Constraints", "", buf, 2u);
        }
      }
    }
    v96[13] = CACurrentMediaTime() - v192 + v96[13];
    prof_endFlame();
    if ((*(_WORD *)&self->_delegationConformance & 8) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 8) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
    {
      double v215 = CACurrentMediaTime();
      prof_beginFlame((uint64_t)"didApply constraints", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2345);
      float32x2_t v216 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        float32x2_t v219 = v216;
        if (os_signpost_enabled(v216))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v219, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Delegate (didApplyConstraints)", "", buf, 2u);
        }
      }
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0) {
        objc_msgSend__renderer_didApplyConstraintsAtTime_(self->_privateRendererOwner, v217, (uint64_t)self->_privateRendererOwner, v218, time);
      }
      if ((*(_WORD *)&self->_selfDelegationConformance & 8) != 0) {
        objc_msgSend__renderer_didApplyConstraintsAtTime_(self, v217, (uint64_t)self, v218, time);
      }
      if ((*(_WORD *)&self->_delegationConformance & 8) != 0)
      {
        v220 = self;
        if ((*((unsigned char *)self + 121) & 8) != 0) {
          v220 = self->_privateRendererOwner;
        }
        objc_msgSend_renderer_didApplyConstraintsAtTime_(self->_delegate, v217, (uint64_t)v220, v218, time, context);
      }
      uint64_t v221 = sub_1B63F2EE0();
      if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v222 = v221;
        if (os_signpost_enabled(v221))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6287000, v222, OS_SIGNPOST_INTERVAL_END, v81, "Delegate (didApplyConstraints)", "", buf, 2u);
        }
      }
      v96[21] = CACurrentMediaTime() - v215 + v96[21];
      prof_endFlame();
    }
    double v223 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"VFXCore", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 2365);
    float32x2_t v224 = sub_1B63F2EE0();
    unint64_t v228 = v81 - 1;
    if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v229 = v224;
      if (os_signpost_enabled(v224))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v229, OS_SIGNPOST_INTERVAL_BEGIN, v81, "VFXCore", "", buf, 2u);
      }
    }
    if (v57)
    {
      uint64_t v230 = (uint64_t *)objc_msgSend__engineContext(self, v225, v226, v227);
      uint64_t v234 = (const void *)sub_1B644805C((uint64_t)v230);
      if (!v234)
      {
        uint64_t v234 = (const void *)sub_1B6511564(v57);
        sub_1B6445E9C((uint64_t)v230, v234);
        CFRelease(v234);
      }
      uint64_t v235 = objc_msgSend_additiveWritesToAlpha(self, v231, v232, v233, context);
      sub_1B65121C0((uint64_t)v234, v235, v236, v237);
      uint64_t v241 = objc_msgSend_debugUIOptions(self, v238, v239, v240);
      sub_1B6511A74((uint64_t)v234, v241, v242, v243);
      sub_1B6511A80((uint64_t)v234, v230, v244, v245, v246, v247, v248, v249, v46, v78, (uint64_t)contexta);
    }
    float32x2_t v250 = sub_1B63F2EE0();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      float32x2_t v251 = v250;
      if (os_signpost_enabled(v250))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v251, OS_SIGNPOST_INTERVAL_END, v81, "VFXCore", "", buf, 2u);
      }
    }
    v96[12] = CACurrentMediaTime() - v223 + v96[12];
    prof_endFlame();
    uint32x2_t v252 = sub_1B63F2EE0();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v260 = v252;
      if (os_signpost_enabled(v252))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v260, OS_SIGNPOST_INTERVAL_BEGIN, v81, "Audio", "", buf, 2u);
      }
    }
    sub_1B658F438((unint64_t)self->_engineContext, v253, v254, v255, v256, v257, v258, v259);
    uint64_t v261 = sub_1B63F2EE0();
    if (v228 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v262 = v261;
      if (os_signpost_enabled(v261))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6287000, v262, OS_SIGNPOST_INTERVAL_END, v81, "Audio", "", buf, 2u);
      }
    }
    objc_msgSend_setImmediateModeRestrictedContext_(VFXTransaction, v263, 0, v264);
    objc_msgSend_setImmediateMode_(VFXTransaction, v265, 0, v266);
    objc_msgSend_endTransaction(v58, v267, v268, v269);
    sub_1B64B0CB4((uint64_t)v17, v270, v271, v272, v273, v274, v275, v276);
    objc_msgSend_unlock(self, v277, v278, v279);
  }
  else
  {
    objc_msgSend_unlock(self, v14, v15, v16);
  }
  prof_endFlame();
}

- (void)drawStatisticsIfNeeded
{
  int v3 = sub_1B64F42F4();
  if (self->_showStatistics || v3 != 0)
  {
    int v8 = v3;
    uint64_t v9 = (int *)objc_msgSend_stats(self->_renderContext, v4, v5, v6);
    uint64_t v13 = objc_msgSend_resourceManager(self->_renderContext, v10, v11, v12);
    uint64_t v14 = sub_1B653EE30(v13);
    sub_1B654F75C((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
    double Current = CFAbsoluteTimeGetCurrent();
    double statisticsTimeStamp = self->_statisticsTimeStamp;
    uint64_t v27 = objc_msgSend__authoringEnvironment(self, v24, v25, v26);
    if (statisticsTimeStamp <= Current)
    {
      uint64_t v28 = v27;
      sub_1B654F444(v9, v14, (uint64_t)__src);
      sub_1B654F6EC((uint64_t)v9, v29, v30, v31, v32, v33, v34, v35);
      if (self->_showStatistics) {
        sub_1B642F344(v28, __src, v14);
      }
      if (v8) {
        sub_1B64F4464((uint64_t)__src);
      }
      self->_double statisticsTimeStamp = Current + 1.0;
    }
  }
}

- (void)startManipulatingPointOfView
{
  objc_msgSend_lock(self, a2, v2, v3);
  int v8 = objc_msgSend_pointOfView(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_presentationNode(v8, v9, v10, v11);
  objc_msgSend_transform(v12, v13, v14, v15);
  objc_msgSend_setTransform_(v8, v16, v17, v18);
  uint64_t v22 = objc_msgSend_camera(v8, v19, v20, v21);
  uint64_t v26 = objc_msgSend_presentationCamera(v22, v23, v24, v25);
  objc_msgSend_focalLength(v26, v27, v28, v29);
  int v31 = v30;
  uint64_t v35 = objc_msgSend_camera(v8, v32, v33, v34);
  LODWORD(v36) = v31;
  objc_msgSend_setFocalLength_(v35, v37, v38, v39, v36);
  self->_cameraIsManipulated = 1;

  objc_msgSend_unlock(self, v40, v41, v42);
}

- (void)stopManipulatingPointOfView
{
  objc_msgSend_lock(self, a2, v2, v3);
  self->_cameraIsManipulated = 0;

  objc_msgSend_unlock(self, v5, v6, v7);
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  if (self->_framebufferInfo.drawableSize.width == 0.0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    return (id)((uint64_t (*)(VFXRenderer *, char *, id))MEMORY[0x1F4181798])(self, sel__hitTest_viewport_options_, a4);
  }
}

- (id)hitTestWithSegmentFromPoint:(VFXRenderer *)self toPoint:(SEL)a2 options:(id)a3
{
  double v15 = v4;
  double v16 = v5;
  uint64_t v7 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  uint64_t v11 = objc_msgSend_rootNode(v7, v8, v9, v10);

  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(v11, v12, (uint64_t)a3, v13, v15, v16);
}

- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5
{
  id v6 = a5;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  int v8 = objc_msgSend_world(self, a2, (uint64_t)a5, v5);
  uint64_t v12 = (const void *)objc_msgSend_worldRef(v8, v9, v10, v11);
  if (v12 && (uint64_t v13 = (__n128 *)CFRetain(v12)) != 0)
  {
    uint64_t v21 = v13;
    sub_1B64B0C28((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v25 = (uint64_t *)objc_msgSend__engineContext(self, v22, v23, v24);
    if (!v25) {
      goto LABEL_13;
    }
    uint64_t v33 = (uint64_t)v25;
    uint64_t v34 = sub_1B6446564(v25, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    if (!v34) {
      goto LABEL_13;
    }
    uint64_t v35 = (uint64_t)v34;
    if (v6)
    {
      if (!objc_msgSend_objectForKey_(v6, v26, @"kHitTestRootNode", v28)
        || (uint64_t v37 = objc_msgSend_objectForKey_(v6, v36, @"kHitTestRootNode", v28),
            uint64_t v41 = objc_msgSend_nodeRef(v37, v38, v39, v40),
            id v6 = (id)objc_msgSend_mutableCopy(v6, v42, v43, v44),
            objc_msgSend_setObject_forKey_(v6, v45, v41, @"kHitTestRootNode"),
            v6))
      {
        if (objc_msgSend_objectForKey_(v6, v36, @"kHitTestShowDebugInfo", v28))
        {
          id v6 = (id)objc_msgSend_mutableCopy(v6, v46, v47, v28);
          uint64_t v54 = sub_1B6446254(v33, 0, v48, v49, v50, v51, v52, v53);
          objc_msgSend_setObject_forKey_(v6, v55, v54, @"auth");
        }
      }
    }
    v56.f64[0] = width;
    v57.f64[0] = x;
    v57.f64[1] = y;
    v56.f64[1] = height;
    uint64_t v58 = sub_1B63DA6D0(v21, v35, (const __CFDictionary *)v6, v28, v29, v30, v31, v32, COERCE_DOUBLE(vcvt_f32_f64(v57)), (__n128)vcvt_hight_f32_f64(0, v56));
    if (v58)
    {
      uint64_t v59 = (const void *)v58;
      uint64_t v60 = objc_msgSend_hitTestResultsFromHitTestResultRef_(VFXHitTestResult, v26, v58, v28);
      CFRelease(v59);
    }
    else
    {
LABEL_13:
      uint64_t v60 = 0;
    }
    sub_1B64B0CB4((uint64_t)v21, (uint64_t)v26, v27, v28, v29, v30, v31, v32);
    CFRelease(v21);
  }
  else
  {
    uint64_t v60 = 0;
  }
  if (v60) {
    return v60;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:
{
  if ((a4 || (a4 = (id)objc_msgSend_pointOfView(self, a2, (uint64_t)a3, 0)) != 0)
    && objc_msgSend_getFrustum_withViewport_(a4, a2, (uint64_t)v56, (uint64_t)a4))
  {
    if (objc_msgSend_isPresentationObject(a3, v5, v6, v7))
    {
      uint64_t v11 = objc_msgSend_nodeRef(a3, v8, v9, v10);
      uint64_t v19 = (float32x4_t *)sub_1B64A01D4(v11, v12, v13, v14, v15, v16, v17, v18);
      float32x4_t v47 = v19[1];
      float32x4_t v48 = *v19;
      float32x4_t v49 = v19[2];
      float32x4_t v50 = v19[3];
      uint64_t v23 = (float32x4_t *)objc_msgSend_nodeRef(a3, v20, v21, v22);
      sub_1B64A00F0(v23, 1, &v54, v24, v25, v26, v27, v28);
    }
    else
    {
      objc_msgSend_worldTransform(a3, v8, v9, v10);
      float32x4_t v47 = v31;
      float32x4_t v48 = v30;
      float32x4_t v49 = v32;
      float32x4_t v50 = v33;
      v53.i32[2] = 0;
      v53.i64[0] = 0;
      v52.i32[2] = 0;
      v52.i64[0] = 0;
      objc_msgSend_getBoundingBoxMin_max_(a3, v34, (uint64_t)&v53, (uint64_t)&v52);
      float32x4_t v35 = v53;
      float32x4_t v36 = v52;
      v35.i32[3] = 1.0;
      v36.i32[3] = 1.0;
      v37.i64[0] = 0x3F0000003F000000;
      v37.i64[1] = 0x3F0000003F000000;
      float32x4_t v54 = vmulq_f32(vaddq_f32(v35, v36), v37);
      int32x4_t v55 = (int32x4_t)vmulq_f32(vsubq_f32(v36, v35), v37);
    }
    for (uint64_t i = 0; i != 6; ++i)
      v56[i] = vnegq_f32((float32x4_t)v56[i]);
    unint64_t v39 = 0;
    BOOL v29 = 0;
    v51[2] = v56[2];
    v51[3] = v56[3];
    v51[4] = v56[4];
    v51[5] = v56[5];
    float32x4_t v40 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v50, v49, v54, 2), v47, *(float32x2_t *)v54.f32, 1), v48, v54.f32[0]);
    v40.i32[3] = v54.i32[3];
    v51[0] = v56[0];
    v51[1] = v56[1];
    float32x4_t v41 = (float32x4_t)v55;
    v41.i32[1] = v55.i32[0];
    v41.i32[2] = v55.i32[0];
    float32x4_t v42 = vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v55.i8, 1), v55), vabsq_f32(v47)), v41, vabsq_f32(v48)), (float32x4_t)vzip2q_s32(vtrn1q_s32(v55, v55), v55), vabsq_f32(v49));
    do
    {
      float32x4_t v43 = (float32x4_t)v51[v39];
      int8x16_t v44 = (int8x16_t)vmulq_f32(v40, v43);
      float32x4_t v45 = vmulq_f32(v42, vabsq_f32(v43));
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL))) > vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).f32[0]) {
        break;
      }
      BOOL v29 = v39++ > 4;
    }
    while (v39 != 6);
  }
  else
  {
    return 0;
  }
  return v29;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  if (self->_framebufferInfo.drawableSize.width == 0.0) {
    return 0;
  }
  else {
    return MEMORY[0x1F4181798](self, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
  }
}

- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:
{
  double v4 = a3;
  uint64_t v9 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, v3);
  if ((v4 || (double v4 = objc_msgSend_pointOfView(self, v6, v7, v8)) != 0)
    && objc_msgSend_world(self, v6, v7, v8)
    && objc_msgSend_getFrustum_withViewport_(v4, v10, (uint64_t)v51, v11, 0.0))
  {
    uint64_t v15 = objc_msgSend_worldRef(self->_world, v12, v13, v14);
    sub_1B64B0C28(v15, v16, v17, v18, v19, v20, v21, v22);
    uint64_t v30 = sub_1B64B2994(v15, v23, v24, v25, v26, v27, v28, v29);
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1B64F171C;
    v47[3] = &unk_1E6143560;
    v47[4] = v9;
    double v31 = sub_1B65C4C3C((uint64_t)v47, (uint64_t)&v48);
    float32x4_t v35 = objc_msgSend_camera(v4, v32, v33, v34, v31);
    long long v48 = (unint64_t)objc_msgSend_categoryBitMask(v35, v36, v37, v38);
    DWORD1(v49) = 2;
    sub_1B65C5604(v30, (uint64_t)v51);
    sub_1B64B0CB4(v15, v39, v40, v41, v42, v43, v44, v45);
  }
  return v9;
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  if (self->_framebufferInfo.drawableSize.width == 0.0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    return (id)((uint64_t (*)(VFXRenderer *, char *, id))MEMORY[0x1F4181798])(self, sel__nodesInsideFrustumWithPointOfView_viewport_, a3);
  }
}

- (void)setRendersContinuously:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 121) = *((unsigned char *)self + 121) & 0xFB | v3;
}

- (BOOL)isJitteringEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 1) & 1;
}

- (void)setJitteringEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFD | v3;
}

- (BOOL)hasImGuiFrameStarted
{
  return (*((unsigned __int8 *)self + 248) >> 4) & 1;
}

- (BOOL)jitteringEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 1) & 1;
}

- (BOOL)vertexAmplificationEnabled
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self, sel_isVertexAmplificationEnabled);
}

- (BOOL)isVertexAmplificationEnabled
{
  return sub_1B6446D6C((uint64_t)self->_engineContext);
}

- (BOOL)forceAsyncShaderCompilation
{
  return ((uint64_t (*)(VFXMTLRenderContext *, char *))MEMORY[0x1F4181798])(self->_renderContext, sel_forceAsyncShaderCompilation);
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
}

- (void)setVertexAmplificationEnabled:(BOOL)a3
{
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 2) & 1;
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFB | v3;
}

- (BOOL)temporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 248) >> 2) & 1;
}

- (BOOL)additiveWritesToAlpha
{
  if (self->_legacyRenderer)
  {
    return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self, sel__legacyAdditiveWritesToAlpha);
  }
  else
  {
    objc_msgSend_lock(self, a2, v2, v3);
    BOOL v5 = *((unsigned char *)self + 248) & 1;
    objc_msgSend_unlock(self, v6, v7, v8);
    return v5;
  }
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  if (self->_legacyRenderer)
  {
    ((void (*)(VFXRenderer *, char *, BOOL))MEMORY[0x1F4181798])(self, sel__setLegacyAdditiveWritesToAlpha_, a3);
  }
  else
  {
    objc_msgSend_lock(self, a2, a3, v3);
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFE | a3;
    objc_msgSend_unlock(self, v6, v7, v8);
  }
}

- (BOOL)frozen
{
  return (*((unsigned __int8 *)self + 248) >> 3) & 1;
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  if (v4) {
    char v9 = 8;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xF7 | v9;

  objc_msgSend_unlock(self, v6, v7, v8);
}

- (id)_copyPerformanceStatistics
{
  objc_msgSend_lock(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__engineContext(self, v5, v6, v7);
  if (v8 && (uint64_t v16 = sub_1B6445480(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15)) != 0)
  {
    sub_1B64F43B0(v16, v21, 0);
    uint64_t v19 = sub_1B64F45DC(v21, 0, v17, v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  objc_msgSend_unlock(self, v9, v10, v11);
  return v19;
}

- (void)_displayLinkStatsTick
{
  uint64_t v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4)
  {
    uint64_t v12 = sub_1B6445480(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12) {
      *(double *)(v12 + 184) = *(double *)(v12 + 184) + CACurrentMediaTime() - *(double *)(v12 + 208);
    }
  }
}

- (void)_displayLinkStatsTack
{
  uint64_t v4 = objc_msgSend__engineContext(self, a2, v2, v3);
  if (v4)
  {
    uint64_t v12 = sub_1B6445480(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12) {
      *(CFTimeInterval *)(v12 + 208) = CACurrentMediaTime();
    }
  }
}

- (void)setShowsStatistics:(BOOL)a3
{
  if (a3) {
    objc_msgSend_setupAuthoringEnvironment(self, a2, a3, v3);
  }
  self->_showStatistics = a3;
}

- (BOOL)showsStatistics
{
  return self->_showStatistics;
}

- (BOOL)showsDebugUI
{
  uint64_t v5 = objc_msgSend__engineContext(self, a2, v2, v3);
  int v13 = sub_1B6446A8C(v5, v6, v7, v8, v9, v10, v11, v12);
  unint64_t debugUIOptions = self->_debugUIOptions;
  if (v13 != 2) {
    debugUIOptions &= ~0x20uLL;
  }
  return debugUIOptions != 0;
}

- (void)_runningInExtension
{
  self->_isRunningInExtension = 1;
}

- (void)_presentFramebuffer
{
  if (self->_renderContext) {
    objc_msgSend__endFrame(self, a2, v2, v3);
  }
}

- (void)setRenderMode:(unint64_t)a3
{
  engineContext = self->_engineContext;
  self->_renderMode = a3;
  uint64_t v6 = objc_msgSend_world(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B64F1BE8;
  v12[3] = &unk_1E6143580;
  v12[4] = engineContext;
  v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (unint64_t)renderMode
{
  return self->_renderMode;
}

- (void)setRendererKind:(unint64_t)a3
{
  engineContext = self->_engineContext;
  self->_rendererKind = a3;
  uint64_t v6 = objc_msgSend_world(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B64F1CA4;
  v12[3] = &unk_1E6143580;
  v12[4] = engineContext;
  v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (unint64_t)rendererKind
{
  return self->_rendererKind;
}

- (BOOL)isEmulatingStereo
{
  return self->_emulateStereo;
}

- (void)setEmulateStereo:(BOOL)a3
{
  engineContext = self->_engineContext;
  self->_emulateStereo = a3;
  uint64_t v6 = objc_msgSend_world(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B64F1D6C;
  v12[3] = &unk_1E61435A0;
  v12[4] = engineContext;
  BOOL v13 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, 0, v12);
}

- (void)setDebugOptions:(unint64_t)a3
{
  if (self->_debugOptions != a3)
  {
    objc_msgSend_setupAuthoringEnvironment(self, a2, a3, v3);
    self->_debugOptions = a3;
    objc_msgSend_lock(self, v6, v7, v8);
    objc_msgSend_debugOptionsDidChange_(self->_authoringEnvironment, v9, a3, v10);
    sub_1B6446230((uint64_t)self->_engineContext, a3);
    uint64_t v18 = (void *)sub_1B6445900((uint64_t)self->_engineContext, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend_setDebugOptions_(v18, v19, (a3 >> 3) & 4 | (a3 >> 5) & 2, v20);
    uint64_t v24 = objc_msgSend__showsAuthoringEnvironment(self, v21, v22, v23);
    objc_msgSend_setShowsAuthoringEnvironment_(v18, v25, v24, v26);
    objc_msgSend_unlock(self, v27, v28, v29);
  }
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (unint64_t)debugUIOptions
{
  objc_msgSend_lock(self, a2, v2, v3);
  unint64_t v5 = sub_1B6438918((uint64_t)self->_engineContext);
  objc_msgSend_unlock(self, v6, v7, v8);
  return v5;
}

- (void)setDebugUIOptions:(unint64_t)a3
{
  objc_msgSend_lock(self, a2, a3, v3);
  self->_unint64_t debugUIOptions = a3;
  sub_1B6446238((uint64_t)self->_engineContext, a3);

  objc_msgSend_unlock(self, v6, v7, v8);
}

- (BOOL)_enableARMode
{
  renderContext = self->_renderContext;
  if (renderContext) {
    LOBYTE(renderContext) = objc_msgSend_enableARMode(renderContext, a2, v2, v3);
  }
  return (char)renderContext;
}

- (void)set_enableARMode:(BOOL)a3
{
  renderContext = self->_renderContext;
  if (renderContext) {
    ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1F4181798])(renderContext, sel_setEnableARMode_, a3);
  }
}

- (BOOL)_shouldDelegateARCompositing
{
  renderContext = self->_renderContext;
  if (renderContext) {
    LOBYTE(renderContext) = ((uint64_t (*)(VFXMTLRenderContext *, char *))MEMORY[0x1F4181798])(renderContext, sel_shouldDelegateARCompositing);
  }
  return (char)renderContext;
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  renderContext = self->_renderContext;
  if (renderContext) {
    ((void (*)(VFXMTLRenderContext *, char *, BOOL))MEMORY[0x1F4181798])(renderContext, sel_setShouldDelegateARCompositing_, a3);
  }
}

- (BOOL)_collectCompilationErrors
{
  uint64_t v9 = sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!self->_renderContext) {
    return 0;
  }

  return MEMORY[0x1F4181798](v9, sel_collectsCompilationErrors, v10, v11);
}

- (void)set_collectCompilationErrors:(BOOL)a3
{
  BOOL v8 = a3;
  uint64_t v10 = sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  if (self->_renderContext)
  {
    MEMORY[0x1F4181798](v10, sel_setCollectsCompilationErrors_, v8, v11);
  }
}

- (id)_compilationErrors
{
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    return (id)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(snapshotRenderer, sel__compilationErrors);
  }
  else
  {
    uint64_t v10 = (void *)sub_1B6445900((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
    if (self->_renderContext)
    {
      return (id)objc_msgSend_compilationErrors(v10, v11, v12, v13);
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)_showsAuthoringEnvironment
{
  return self->_debugOptions != 0;
}

- (void)setupAuthoringEnvironment
{
  if (!self->_authoringEnvironment)
  {
    objc_msgSend_lock(self, a2, v2, v3);
    if (self->_privateRendererOwner) {
      IfNeeded = objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(VFXAuthoringEnvironment, v5, (uint64_t)self->_privateRendererOwner, 1);
    }
    else {
      IfNeeded = objc_msgSend_authoringEnvironmentForWorldRenderer_createIfNeeded_(VFXAuthoringEnvironment, v5, (uint64_t)self, 1);
    }
    self->_authoringEnvironment = (VFXAuthoringEnvironment *)IfNeeded;
    objc_msgSend_unlock(self, v7, v8, v9);
  }
}

- (id)_authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (__n128)_viewport
{
  return a1[12];
}

- (CGRect)currentViewport
{
  float64x2_t v10 = *(float64x2_t *)MEMORY[0x1E4F1DB28];
  float64x2_t v11 = *(float64x2_t *)(MEMORY[0x1E4F1DB28] + 16);
  uint64_t v4 = (__n128 *)objc_msgSend__engineContext(self, a2, v2, v3);
  float64x2_t v5 = v10;
  float64x2_t v6 = v11;
  if (v4)
  {
    __n128 v7 = sub_1B64479C4(v4);
    float64x2_t v6 = vcvt_hight_f64_f32((float32x4_t)v7);
    float64x2_t v5 = vcvtq_f64_f32((float32x2_t)v7.n128_u64[0]);
  }
  double v8 = v5.f64[1];
  double v9 = v6.f64[1];
  result.size.CGFloat width = v6.f64[0];
  result.origin.CGFloat x = v5.f64[0];
  result.size.CGFloat height = v9;
  result.origin.CGFloat y = v8;
  return result;
}

- (CGRect)viewport
{
  ((void (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self, sel_currentViewport);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)set_viewport:(VFXRenderer *)self
{
  __n128 v14 = v4;
  objc_msgSend_lock(self, a2, v2, v3);
  *(__n128 *)self->__viewport = v14;
  uint64_t v9 = objc_msgSend__engineContext(self, v6, v7, v8);
  if (v9)
  {
    uint64_t v13 = (__n128 *)v9;
    sub_1B64479DC(v9, *(double *)vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).i64);
    sub_1B64479CC(v13, v14);
  }

  objc_msgSend_unlock(self, v10, v11, v12);
}

- (__n128)_drawableSafeAreaInsets
{
  return a1[14];
}

- (void)set_drawableSafeAreaInsets:(VFXRenderer *)self
{
  __n128 v6 = v4;
  *(__n128 *)self->__drawableSafeAreaInsets = v4;
  double v5 = (__n128 *)objc_msgSend__engineContext(self, a2, v2, v3);
  if (v5)
  {
    sub_1B64479FC(v5, v6);
  }
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)sub_1B658F4B0(1, a2, v2, v3);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return (AVAudioEnvironmentNode *)sub_1B658F560((unint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (VFXNode)audioListener
{
  uint64_t v9 = sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v9)
  {
    uint64_t v17 = v9;
    sub_1B64B0C28(v9, v10, v11, v12, v13, v14, v15, v16);
    uint64_t v25 = (id *)sub_1B658F3D8((unint64_t)self->_engineContext, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v26 = (VFXNode *)sub_1B6583674(v25);
    sub_1B64B0CB4(v17, v27, v28, v29, v30, v31, v32, v33);
    return v26;
  }
  else
  {
    float32x4_t v35 = (id *)sub_1B658F3D8((unint64_t)self->_engineContext, v10, v11, v12, v13, v14, v15, v16);
    return (VFXNode *)sub_1B6583674(v35);
  }
}

- (void)setAudioListener:(id)a3
{
  uint64_t v10 = sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B64F22E8;
  v12[3] = &unk_1E6141230;
  v12[4] = self;
  void v12[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (id)MTLTexture
{
  return self->_offScreenFramebuffer;
}

- (void)_renderWorldWithEngineContext:(__CFXEngineContext *)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"engineContext");
  }
  sub_1B6446078((uint64_t)a3);
  uint64_t v17 = sub_1B644558C((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  if (v17)
  {
    uint64_t v24 = v17;
    uint64_t v25 = (_DWORD *)sub_1B6446254((uint64_t)a3, 0, v18, v19, v20, v21, v22, v23);
    if (v25) {
      sub_1B64299CC(v25);
    }
    uint64_t v33 = sub_1B6445480((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
    double v34 = CACurrentMediaTime();
    prof_beginFlame((uint64_t)"Apply notification queue", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXRenderer.mm", 3171);
    uint64_t v49 = sub_1B64B2864(v24, v35, v36, v37, v38, v39, v40, v41);
    if (!v49) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v43, v44, v45, v46, v47, v48, (uint64_t)"enginePipeline");
    }
    long long v199 = 0u;
    long long v198 = 0u;
    v197[0] = v49;
    v197[1] = (uint64_t)a3;
    v197[2] = 0;
    sub_1B6453234(v197, v42, v43, v44, v45, v46, v47, v48);
    *(double *)(v33 + 152) = *(double *)(v33 + 152) + CACurrentMediaTime() - v34;
    prof_endFlame();
    sub_1B6445520((uint64_t)a3, v50, v51, v52, v53, v54, v55, v56);
    renderContext = self->_renderContext;
    if (renderContext)
    {
      uint64_t v65 = objc_msgSend_resourceManager(renderContext, v57, v58, v59);
      nullsub_1(v65);
    }
    sub_1B6445310((uint64_t)a3, v49, v58, v59, v60, v61, v62, v63);
    if (self->_viewpoints) {
      char viewpointCoordinateSpace = self->_viewpointCoordinateSpace;
    }
    else {
      char viewpointCoordinateSpace = 2;
    }
    sub_1B6447BE8((uint64_t)a3, viewpointCoordinateSpace);
    *(void *)&double v77 = sub_1B6446E88((uint64_t)self->_engineContext, v67, v68, v69, v70, v71, v72, v73, v74).n128_u64[0];
    viewpoints = self->_viewpoints;
    if (viewpoints)
    {
      uint64_t v79 = objc_msgSend_objectAtIndexedSubscript_(viewpoints, v75, 0, v76, v77);
      uint64_t v83 = objc_msgSend_passDescriptor(v79, v80, v81, v82);
      uint64_t v87 = objc_msgSend_colorAttachments(v83, v84, v85, v86);
      uint64_t v90 = objc_msgSend_objectAtIndexedSubscript_(v87, v88, 0, v89);
      uint64_t v94 = objc_msgSend_texture(v90, v91, v92, v93);
      uint64_t v98 = objc_msgSend_textureType(v94, v95, v96, v97);
      uint64_t v102 = v98;
      BOOL v105 = v98 == 5 || v98 == 3 || v98 == 8;
      unsigned int v106 = v105 & (objc_msgSend_features(self->_renderContext, v99, v100, v101) >> 5);
      unsigned int v110 = (v102 == 2) & (objc_msgSend_features(self->_renderContext, v107, v108, v109) >> 7);
      unint64_t v116 = objc_msgSend_count(self->_viewpoints, v111, v112, v113);
      if (v116)
      {
        uint64_t v117 = 0;
        unsigned int v118 = 0;
        LOBYTE(v119) = 1;
        do
        {
          uint64_t v120 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v114, v117, v115);
          uint64_t v124 = (const void *)objc_msgSend_passDescriptor(v120, v121, v122, v123);
          sub_1B6447B90((uint64_t)a3, v124, v118);
          if (v119)
          {
            uint64_t v125 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v114, v117, v115);
            uint64_t v129 = objc_msgSend_passDescriptor(v125, v126, v127, v128);
            uint64_t v133 = objc_msgSend_colorAttachments(v129, v130, v131, v132);
            uint64_t v136 = objc_msgSend_objectAtIndexedSubscript_(v133, v134, 0, v135);
            BOOL v119 = v94 == objc_msgSend_texture(v136, v137, v138, v139);
          }
          else
          {
            BOOL v119 = 0;
          }
          uint64_t v117 = ++v118;
        }
        while (v116 > v118);
      }
      else
      {
        BOOL v119 = 1;
      }
      BOOL v140 = v116 > 1 && v119;
      if (v110) {
        char v141 = 2;
      }
      else {
        char v141 = v106;
      }
      if ((v140 & (v110 | v106)) != 0) {
        char v142 = v141;
      }
      else {
        char v142 = 0;
      }
      sub_1B6446DE4((uint64_t)a3, v142);
      char v146 = objc_msgSend_count(self->_viewpoints, v143, v144, v145);
      sub_1B6446E00((uint64_t)a3, v146);
      if (v116)
      {
        uint64_t v149 = 0;
        for (i = 0; i < v116; uint64_t v149 = i)
        {
          uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v147, v149, v148);
          if (v151)
          {
            objc_msgSend_viewport(v151, v152, v153, v154);
            float64x2_t v159 = v194;
            float64x2_t v160 = v195;
          }
          else
          {
            float64x2_t v195 = 0u;
            long long v196 = 0u;
            float64x2_t v159 = 0uLL;
            float64x2_t v160 = 0uLL;
            float64x2_t v194 = 0u;
          }
          sub_1B644724C((uint64_t)a3, i, v153, v154, v155, v156, v157, v158, (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v159), v160));
          long long v192 = 0u;
          long long v193 = 0u;
          long long v190 = 0u;
          long long v191 = 0u;
          uint64_t v163 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v161, v149, v162);
          objc_msgSend_viewMatrix(v163, v164, v165, v166);
          long long v190 = v167;
          long long v191 = v168;
          long long v192 = v169;
          long long v193 = v170;
          *(void *)&double v175 = sub_1B6446E08((uint64_t)a3, 1, (uint64_t)&v190, i, v171, v172, v173, v174).n128_u64[0];
          uint64_t v178 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v176, v149, v177, v175);
          objc_msgSend_projectionMatrix(v178, v179, v180, v181);
          long long v190 = v182;
          long long v191 = v183;
          long long v192 = v184;
          long long v193 = v185;
          sub_1B6446E08((uint64_t)a3, 0, (uint64_t)&v190, i++, v186, v187, v188, v189);
        }
      }
    }
    else
    {
      sub_1B64479CC((__n128 *)a3, *(__n128 *)self->__viewport);
    }
    if (self->_renderContext) {
      sub_1B6447CEC((uint64_t)a3);
    }
  }
}

- (BOOL)_needsRedrawAsap
{
  if ((objc_msgSend__needsRepetitiveRedraw(self, a2, v2, v3) & 1) == 0)
  {
    if (sub_1B6446144((uint64_t)self->_engineContext, v5, v6, v7, v8, v9, v10, v11) == INFINITY)
    {
      uint64_t v12 = sub_1B644558C((uint64_t)self->_engineContext, v13, v14, v15, v16, v17, v18, v19);
      if (!v12) {
        return v12;
      }
      uint64_t v27 = v12;
      uint64_t v28 = sub_1B6446564((uint64_t *)self->_engineContext, v20, v21, v22, v23, v24, v25, v26);
      if (v28)
      {
        CFDictionaryRef v36 = sub_1B64A3B48((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);
        if (v36)
        {
          uint64_t v44 = (uint64_t)v36;
          if (sub_1B649BF98((uint64_t)v36, v37, v38, v39, v40, v41, v42, v43)
            && (sub_1B649BF08(v44, v45, v46, v47, v48, v49, v50, v51) & 1) != 0)
          {
            uint64_t v52 = sub_1B649A9C8(v44, v45, v46, v47, v48, v49, v50, v51);
            float v60 = sub_1B6529DF0(v52, v53, v54, v55, v56, v57, v58, v59);
            float v68 = sub_1B6529D4C(v52, v61, v62, v63, v64, v65, v66, v67);
            if (v60 < v68) {
              float v68 = v60;
            }
            double v69 = v68;
            float v70 = v68 + 1.0;
            if (v69 <= 0.01) {
              float v70 = 1.01;
            }
            int v78 = (int)(5.0 / logf(v70) * 60.0);
            if (!v78) {
              goto LABEL_20;
            }
          }
          else
          {
            if ((sub_1B649B548(v44, v45, v46, v47, v48, v49, v50, v51) & 1) == 0) {
              goto LABEL_20;
            }
            int v78 = 2;
          }
          unsigned int adaptativeState0 = self->_adaptativeState0;
          if (adaptativeState0 != sub_1B64B26CC(v27, v71, v72, v73, v74, v75, v76, v77))
          {
            self->_unsigned int adaptativeState0 = sub_1B64B26CC(v27, v80, v81, v82, v83, v84, v85, v86);
            self->_adaptativeEndFrame = sub_1B64B262C(v27, v87, v88, v89, v90, v91, v92, v93) + v78;
          }
          if (sub_1B64B262C(v27, v80, v81, v82, v83, v84, v85, v86) < self->_adaptativeEndFrame) {
            goto LABEL_2;
          }
        }
      }
    }
LABEL_20:
    LOBYTE(v12) = 0;
    return v12;
  }
LABEL_2:
  LOBYTE(v12) = 1;
  return v12;
}

- (double)_computeNextFrameTime
{
  double v9 = sub_1B6446144((uint64_t)self->_engineContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend__needsRedrawAsap(self, v10, v11, v12))
  {
    double v13 = CACurrentMediaTime();
    if (v9 >= v13) {
      return v13;
    }
  }
  return v9;
}

- (void)_render
{
  if ((*((unsigned char *)self + 121) & 8) != 0) {
    objc_msgSend__installViewport(self, a2, v2, v3);
  }
  objc_msgSend_lock(self, a2, v2, v3);
  engineContext = self->_engineContext;
  if (engineContext
    && (uint64_t v13 = sub_1B644558C((uint64_t)engineContext, (uint64_t)v5, v6, v7, v8, v9, v10, v11)) != 0
    && self->_engineContext
    && self->_renderContext)
  {
    uint64_t v18 = v13;
    if ((*((unsigned char *)self + 121) & 0x30) == 0x10) {
      int isJitteringEnabled = 0;
    }
    else {
      int isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v5, v6, v7);
    }
    sub_1B64B0C28(v18, (uint64_t)v5, v6, v7, v14, v15, v16, v17);
    uint64_t v30 = sub_1B64B20C4(v18, v23, v24, v25, v26, v27, v28, v29);
    if (v30)
    {
      uint64_t v34 = (void *)sub_1B6355ECC(v30);
      objc_msgSend_beginTransaction_(v34, v35, (uint64_t)self->_engineContext, v36);
    }
    else
    {
      uint64_t v34 = 0;
    }
    uint64_t v37 = objc_msgSend_stats(self->_renderContext, v31, v32, v33);
    if ((*((unsigned char *)self + 248) & 8) != 0) {
      sub_1B654F6EC(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    else {
      *(_DWORD *)(v37 + 12) = 0;
    }
    sub_1B64B2494(v18, v38, v39, v40, v41, v42, v43, v44);
    if (isJitteringEnabled)
    {
      sub_1B6447D28((uint64_t)self->_engineContext, 1);
      objc_msgSend__renderWorldWithEngineContext_(self, v47, (uint64_t)self->_engineContext, v48);
      sub_1B6447D28((uint64_t)self->_engineContext, 1);
      objc_msgSend__endFrame(self, v49, v50, v51);
      for (int i = 0; ; ++i)
      {
        objc_msgSend__beginFrame(self, v52, v53, v54);
        sub_1B6447D60((uint64_t)self->_engineContext, i == 80);
        sub_1B6447D50((uint64_t)self->_engineContext, i);
        objc_msgSend__renderWorldWithEngineContext_(self, v56, (uint64_t)self->_engineContext, v57);
        if (i == 80) {
          break;
        }
        objc_msgSend__endFrame(self, v58, v59, v60);
      }
      sub_1B6447D28((uint64_t)self->_engineContext, 0);
    }
    else
    {
      objc_msgSend__renderWorldWithEngineContext_(self, v45, (uint64_t)self->_engineContext, v46);
    }
    sub_1B64B2504(v18, v61, v62, v63, v64, v65, v66, v67);
    objc_msgSend__computeNextFrameTime(self, v68, v69, v70);
    self->_nextFrameTime = v71;
    objc_msgSend_endFrameWorldSpecifics(self->_renderContext, v72, v73, v74);
    objc_msgSend_endTransaction(v34, v75, v76, v77);
    sub_1B64B0CB4(v18, v78, v79, v80, v81, v82, v83, v84);
    objc_msgSend_drawStatisticsIfNeeded(self, v85, v86, v87);
  }
  else
  {
    self->_nextFrameTime = INFINITY;
    objc_msgSend__clearBackBuffer(self, v5, v6, v7);
  }

  objc_msgSend_unlock(self, v20, v21, v22);
}

- (void)render
{
  objc_msgSend__beginFrame(self, a2, v2, v3);
  os_signpost_id_t v5 = sub_1B64454CC((uint64_t)self->_engineContext);
  uint64_t v6 = sub_1B63F2EE0();
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v10 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RenderFrame", "", buf, 2u);
    }
  }
  objc_msgSend__render(self, v7, v8, v9);
  uint64_t v11 = sub_1B63F2EE0();
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v15 = v11;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6287000, v15, OS_SIGNPOST_INTERVAL_END, v5, "RenderFrame", "", v16, 2u);
    }
  }
  objc_msgSend__endFrame(self, v12, v13, v14);
}

- (void)renderWithTextureAttachmentProvider:(id)a3 options:(id)a4
{
  objc_msgSend_setAttachmentProvider_(self->_renderContext, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v9 = objc_msgSend_commandBuffer(a4, v6, v7, v8);
  objc_msgSend_setClientCommandBuffer_(self->_renderContext, v10, v9, v11);
  objc_msgSend_beginFrame_(self->_renderContext, v12, 0, v13);
  objc_msgSend__render(self, v14, v15, v16);
  renderContext = self->_renderContext;
  uint64_t v21 = objc_msgSend_waitUntilCompleted(a4, v18, v19, v20);
  objc_msgSend_endFrameWaitingUntilCompleted_status_error_(renderContext, v22, v21, 0, 0);
  uint64_t v25 = self->_renderContext;

  objc_msgSend_setAttachmentProvider_(v25, v23, 0, v24);
}

- (void)renderToTexture:(id)a3 options:(id)a4
{
  CGFloat v7 = (double)(unint64_t)objc_msgSend_width(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v11 = objc_msgSend_height(a3, v8, v9, v10);
  self->_framebufferInfo.drawableSize.CGFloat width = v7;
  self->_framebufferInfo.drawableSize.CGFloat height = (double)(unint64_t)v11;
  *(float *)&unsigned int v12 = v7;
  *(float *)&unsigned int v13 = (float)(unint64_t)v11;
  unsigned int v19 = v13;
  unsigned int v20 = v12;
  v14.n128_u64[0] = 0;
  v14.n128_u64[1] = __PAIR64__(v13, v12);
  *(__n128 *)self->__viewport = v14;
  sub_1B64479CC((__n128 *)self->_engineContext, v14);
  sub_1B64479DC((uint64_t)self->_engineContext, COERCE_DOUBLE(__PAIR64__(v19, v20)));
  uint64_t v15 = [VFXRenderToTextureFinalAttachmentProvider alloc];
  uint64_t v21 = objc_msgSend_initWithTexture_(v15, v16, (uint64_t)a3, v17);
  objc_msgSend_renderWithTextureAttachmentProvider_options_(self, v18, (uint64_t)v21, (uint64_t)a4);
}

- (void)renderToTexture:(id)a3
{
}

- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5
{
  objc_msgSend_commandQueue(a4, a2, (uint64_t)a4, (uint64_t)a5);

  MEMORY[0x1F4181798](self, sel__renderWithViewport_encoder_passDescriptor_commandQueue_commandBuffer_, 0, a5);
}

- (void)_renderWithViewport:(CGRect)a3 encoder:(id)a4 passDescriptor:(id)a5 commandQueue:(id)a6 commandBuffer:(id)a7
{
  float64_t height = a3.size.height;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  float64_t width = a3.size.width;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. can't call renderAtTime:withEncoder:pass:commandQueue: with a GL context", v13, v14, v15, v16, v17, v18, (uint64_t)"[_renderContext isKindOfClass:[VFXMTLRenderContext class]]");
  }
  unsigned int v19 = objc_msgSend_colorAttachments(a5, v12, v13, v14);
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21);
  uint64_t v26 = objc_msgSend_texture(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_sampleCount(v26, v27, v28, v29);
  if (v30 == 2) {
    objc_msgSend_setAntialiasingMode_(self, v31, 1, v32);
  }
  else {
    objc_msgSend_setAntialiasingMode_(self, v31, 2 * (v30 == 4), v32);
  }
  objc_msgSend_setClientRenderPassDescriptor_(self->_renderContext, v33, (uint64_t)a5, v34);
  uint64_t v38 = objc_msgSend_depthAttachment(a5, v35, v36, v37);
  uint64_t v42 = objc_msgSend_texture(v38, v39, v40, v41);
  if (a4)
  {
    if (v42)
    {
      uint64_t v46 = objc_msgSend_depthAttachment(a5, v43, v44, v45);
      objc_msgSend_clearDepth(v46, v47, v48, v49);
      if (v55 == 1.0 && (byte_1E9DDB100 & 1) == 0)
      {
        byte_1E9DDB100 = 1;
        sub_1B63F2F54(16, @"Error: VFX uses reverseZ depth buffer to achieve better precision. You must clear your depth to 0.0 or everything will be discarded.", v50, v45, v51, v52, v53, v54, v103);
      }
    }
  }
  objc_msgSend_setClientCommandQueue_(self->_renderContext, v43, (uint64_t)a6, v45);
  objc_msgSend_setClientRenderCommandEncoder_(self->_renderContext, v56, (uint64_t)a4, v57);
  objc_msgSend_setClientCommandBuffer_(self->_renderContext, v58, (uint64_t)a7, v59);
  v60.f64[0] = width;
  v61.f64[0] = x;
  self->_framebufferInfo.drawableSize.float64_t width = width;
  self->_framebufferInfo.drawableSize.float64_t height = height;
  v60.f64[1] = height;
  v61.f64[1] = y;
  __n128 v62 = (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v60);
  *(__n128 *)self->__viewport = v62;
  int8x16_t v108 = (int8x16_t)v62;
  sub_1B64479CC((__n128 *)self->_engineContext, v62);
  uint64_t v66 = objc_msgSend_colorAttachments(a5, v63, v64, v65);
  uint64_t v69 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, 0, v68);
  uint64_t v76 = objc_msgSend_resolveTexture(v69, v70, v71, v72);
  if (!v76)
  {
    uint64_t v77 = objc_msgSend_colorAttachments(a5, v73, v74, v75);
    uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(v77, v78, 0, v79);
    uint64_t v76 = objc_msgSend_texture(v80, v81, v82, v83);
  }
  engineContext = self->_engineContext;
  if (a5)
  {
    float v109 = (float)(unint64_t)objc_msgSend_width(v76, v73, v74, v75);
    uint64_t v88 = objc_msgSend_height(v76, v85, v86, v87);
    *(float *)&double v89 = v109;
    *((float *)&v89 + 1) = (float)(unint64_t)v88;
    double v90 = v89;
  }
  else
  {
    *(void *)&double v90 = vextq_s8(v108, v108, 8uLL).u64[0];
  }
  sub_1B64479DC((uint64_t)engineContext, v90);
  if (v76)
  {
    objc_msgSend_beginFrame_(self->_renderContext, v91, (uint64_t)v76, v93);
    objc_msgSend__render(self, v98, v99, v100);
    renderContext = self->_renderContext;
    objc_msgSend_endFrameWaitingUntilCompleted_status_error_(renderContext, v101, 0, 0, 0);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: Render pass descriptor misconfigured - missing drawable texture", v92, v93, v94, v95, v96, v97, v111);
  }
}

- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4 mode:(unint64_t)a5
{
  self->_viewpoints = (NSArray *)a4;
  self->_char viewpointCoordinateSpace = a5;
  if (a4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    CGFloat v7 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
    if (v7)
    {
      objc_msgSend_viewport(v7, v8, v9, v10);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(self->_viewpoints, v8, 0, v10, v17, v18, v19);
    uint64_t v15 = objc_msgSend_passDescriptor(v11, v12, v13, v14);
    objc_msgSend_renderWithViewport_commandBuffer_passDescriptor_(self, v16, (uint64_t)a3, v15, 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (CGImage)createSnapshot:(id *)a3
{
  CGRect result = (CGImage *)self->_engineContext;
  if (result)
  {
    CGRect result = (CGImage *)sub_1B644558C((uint64_t)result, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
    if (result)
    {
      long long v18 = result;
      sub_1B64B0C28((uint64_t)result, v11, v12, v13, v14, v15, v16, v17);
      objc_msgSend__beginFrame(self, v19, v20, v21);
      objc_msgSend_updateAtTime_(self, v22, v23, v24, self->_time);
      objc_msgSend__render(self, v25, v26, v27);
      sub_1B64B0CB4((uint64_t)v18, v28, v29, v30, v31, v32, v33, v34);
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      objc_msgSend_endFrameWaitingUntilCompleted_status_error_(self->_renderContext, v35, 1, (uint64_t)&v50, &v51);
      if (v50 == 4)
      {
        uint64_t v39 = objc_msgSend_MTLTexture(self, v36, v37, v38);
        return sub_1B64D9208(v39, v40, v41, v42);
      }
      else
      {
        uint64_t v43 = objc_msgSend_description(v51, v36, v37, v38);
        sub_1B63F2F54(16, @"Error: Failed to create snapshot with error %@", v44, v45, v46, v47, v48, v49, v43);
        CGRect result = 0;
        if (a3) {
          *a3 = v51;
        }
      }
    }
  }
  return result;
}

- (id)snapshot
{
  Snapshot = (CGImage *)objc_msgSend_createSnapshot_(self, a2, 0, v2);
  uint64_t v6 = objc_msgSend_imageWithCGImage_(MEMORY[0x1E4FB1818], v4, (uint64_t)Snapshot, v5);
  CGImageRelease(Snapshot);
  return v6;
}

- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  size_t v6 = (unint64_t)a3.width;
  size_t v7 = (unint64_t)a3.height;
  size_t v8 = 4 * (unint64_t)a3.width;
  uint64_t v9 = malloc_type_malloc(v8 * (unint64_t)a3.height, 0x8911715AuLL);
  uint64_t v10 = (CGColorSpace *)sub_1B63C9388();
  uint64_t v11 = CGBitmapContextCreate(v9, v6, v7, 8uLL, v8, v10, 0x4001u);
  uint64_t v15 = objc_msgSend_backgroundColor(self, v12, v13, v14);
  long long v19 = (CGColor *)objc_msgSend_CGColor(v15, v16, v17, v18);
  CGContextSetFillColorWithColor(v11, v19);
  v22.size.double width = (double)(unint64_t)width;
  v22.size.double height = (double)(unint64_t)height;
  v22.origin.CGFloat x = 0.0;
  v22.origin.CGFloat y = 0.0;
  CGContextFillRect(v11, v22);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  free(v9);
  return Image;
}

- (id)snapshotWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  SnapshotWithSize_error = (CGImage *)objc_msgSend__createSnapshotWithSize_error_(self, a2, 0, v3);
  if (!SnapshotWithSize_error) {
    SnapshotWithSize_error = (CGImage *)objc_msgSend__createBackgroundColorImageWithSize_(self, v7, v8, v9, width, height);
  }
  uint64_t v11 = objc_msgSend_imageWithCGImage_(MEMORY[0x1E4FB1818], v7, (uint64_t)SnapshotWithSize_error, v9);
  CGImageRelease(SnapshotWithSize_error);
  return v11;
}

- (CGImage)_createSnapshotWithSize:(CGSize)a3 error:(id *)a4
{
  CGFloat height = a3.height;
  float64x2_t v8 = vcvtq_f64_f32(vrndx_f32(vcvt_f32_f64((float64x2_t)a3)));
  if ((*((unsigned char *)self + 121) & 8) == 0) {
    objc_msgSend__setBackingSize_(self, a2, (uint64_t)a4, v4, *(_OWORD *)&v8);
  }
  uint64_t v9 = objc_msgSend_snapshotRendererWithSize_(self, a2, (uint64_t)a4, v4);
  uint64_t v13 = objc_msgSend__computedLightingEnvironmentMapsPath(self, v10, v11, v12);
  objc_msgSend_set_computedLightingEnvironmentMapsPath_(v9, v14, v13, v15);
  uint64_t v19 = objc_msgSend_antialiasingMode(self, v16, v17, v18);
  objc_msgSend_setAntialiasingMode_(v9, v20, v19, v21);
  objc_msgSend_set_viewport_(v9, v22, v23, v24, 0.0);
  Snapshot = (CGImage *)objc_msgSend_createSnapshot_(v9, v25, (uint64_t)a4, v26);
  if (!self->_pointOfView)
  {
    uint64_t v31 = objc_msgSend_pointOfView(v9, v27, v28, v29);
    objc_msgSend_setPointOfView_(self, v32, v31, v33);
    self->_pointOfViewWasSet = 0;
  }
  if ((*((unsigned char *)self + 121) & 8) != 0)
  {

    self->_snapshotRenderer = 0;
  }
  return Snapshot;
}

- (id)snapshotRendererWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    objc_msgSend__setBackingSize_(snapshotRenderer, a2, v3, v4, a3.width, a3.height);
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v16 = objc_msgSend_device(self, v13, v14, v15);
    uint64_t v18 = (VFXRenderer *)(id)objc_msgSend_rendererWithDevice_options_(v12, v17, v16, 0);
    self->_snapshotRenderer = v18;
    objc_msgSend__setupOffscreenRendererWithSize_(v18, v19, v20, v21, width, height);
  }
  objc_msgSend_lock(self, v9, v10, v11);
  objc_msgSend_begin(VFXTransaction, v22, v23, v24);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v25, v26, v27, 0.0);
  objc_msgSend_setImmediateMode_(VFXTransaction, v28, 1, v29);
  uint64_t v33 = objc_msgSend_world(self, v30, v31, v32);
  objc_msgSend_lock(v33, v34, v35, v36);
  objc_msgSend__contentsScaleFactor(self, v37, v38, v39);
  self->_snapshotRenderer->_contentScaleFactor = v40;
  uint64_t v44 = objc_msgSend_world(self, v41, v42, v43);
  objc_msgSend_setWorld_(self->_snapshotRenderer, v45, v44, v46);
  uint64_t isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v47, v48, v49);
  objc_msgSend_setJitteringEnabled_(self->_snapshotRenderer, v51, isJitteringEnabled, v52);
  uint64_t v56 = objc_msgSend_renderGraph(self, v53, v54, v55);
  objc_msgSend_setRenderGraph_(self->_snapshotRenderer, v57, v56, v58);
  uint64_t v62 = objc_msgSend_vertexAmplificationEnabled(self, v59, v60, v61);
  objc_msgSend_setVertexAmplificationEnabled_(self->_snapshotRenderer, v63, v62, v64);
  uint64_t v68 = objc_msgSend_pointOfView(self, v65, v66, v67);
  objc_msgSend_setPointOfView_(self->_snapshotRenderer, v69, v68, v70);
  uint64_t v74 = objc_msgSend_autoenablesDefaultLighting(self, v71, v72, v73);
  objc_msgSend_setAutoenablesDefaultLighting_(self->_snapshotRenderer, v75, v74, v76);
  uint64_t v80 = objc_msgSend_autoAdjustCamera(self, v77, v78, v79);
  objc_msgSend_setAutoAdjustCamera_(self->_snapshotRenderer, v81, v80, v82);
  uint64_t v86 = objc_msgSend_delegate(self, v83, v84, v85);
  objc_msgSend_setDelegate_(self->_snapshotRenderer, v87, v86, v88);
  uint64_t v92 = objc_msgSend__wantsWorldRendererDelegationMessages(self, v89, v90, v91);
  objc_msgSend_set_wantsWorldRendererDelegationMessages_(self->_snapshotRenderer, v93, v92, v94);
  uint64_t v98 = objc_msgSend_backgroundColor(self, v95, v96, v97);
  objc_msgSend_setBackgroundColor_(self->_snapshotRenderer, v99, v98, v100);
  uint64_t v104 = objc_msgSend_debugOptions(self, v101, v102, v103);
  objc_msgSend_setDebugOptions_(self->_snapshotRenderer, v105, v104, v106);
  objc_msgSend__superSamplingFactor(self, v107, v108, v109);
  objc_msgSend_set_superSamplingFactor_(self->_snapshotRenderer, v110, v111, v112);
  objc_msgSend__screenTransform(self, v113, v114, v115);
  objc_msgSend_set_screenTransform_(self->_snapshotRenderer, v116, v117, v118);
  uint64_t v122 = objc_msgSend__collectCompilationErrors(self, v119, v120, v121);
  objc_msgSend_set_collectCompilationErrors_(self->_snapshotRenderer, v123, v122, v124);
  uint64_t v128 = objc_msgSend__resourceManagerMonitor(self, v125, v126, v127);
  objc_msgSend_set_resourceManagerMonitor_(self->_snapshotRenderer, v129, v128, v130);
  uint64_t v134 = objc_msgSend__commandBufferStatusMonitor(self, v131, v132, v133);
  objc_msgSend_set_commandBufferStatusMonitor_(self->_snapshotRenderer, v135, v134, v136);
  uint64_t v140 = objc_msgSend_antialiasingMode(self, v137, v138, v139);
  objc_msgSend_setAntialiasingMode_(self->_snapshotRenderer, v141, v140, v142);
  uint64_t v146 = objc_msgSend__engineContext(self->_snapshotRenderer, v143, v144, v145);
  sub_1B6447368(v146, 1, v147, v148, v149, v150, v151, v152);
  uint64_t v156 = objc_msgSend__engineContext(self->_snapshotRenderer, v153, v154, v155);
  int v157 = sub_1B64479E4((uint64_t)self->_engineContext);
  sub_1B64479EC(v156, v157);
  uint64_t v161 = objc_msgSend_world(self, v158, v159, v160);
  objc_msgSend_unlock(v161, v162, v163, v164);
  objc_msgSend_commit(VFXTransaction, v165, v166, v167);
  objc_msgSend_unlock(self, v168, v169, v170);
  return self->_snapshotRenderer;
}

- (void)_updateProbes:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  objc_msgSend_becomeCurrentWithPendingUnitCount_(a4, a2, 1, (uint64_t)a4);
  CFTimeInterval v9 = CACurrentMediaTime();
  objc_msgSend_updateProbes_atTime_completionHandler_(self, v10, (uint64_t)a3, (uint64_t)a5, v9);

  MEMORY[0x1F4181798](a4, sel_resignCurrent, v11, v12);
}

- (void)updateProbes:(id)a3 atTime:(double)a4 completionHandler:(id)a5
{
  if (!objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a5, a4)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v9, v10, v11, v12, v13, v14, (uint64_t)"self.world");
  }
  uint64_t v15 = objc_msgSend_world(self, v8, v9, v10);
  uint64_t v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B64F3750;
  v21[3] = &unk_1E61435F0;
  v21[4] = self;
  v21[5] = a3;
  v21[6] = a5;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, 0, v21);
}

- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6
{
  renderingQueue = self->__renderingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B64F3B64;
  v7[3] = &unk_1E6143618;
  v7[4] = self;
  v7[5] = a6;
  v7[6] = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  dispatch_sync(renderingQueue, v7);
}

- (id)privateRendererOwner
{
  return self->_privateRendererOwner;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1B64F3CEC;
  v3[3] = &unk_1E6143640;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1B64F3D74;
  v3[3] = &unk_1E6143640;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  if ((*((unsigned char *)self + 121) & 8) != 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B64F3E58;
    v11[3] = &unk_1E6143640;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v11);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: %s should only be called on a private renderer, using -[VFXRenderer _addGPUFrameCompletedHandler:] instead", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[VFXRenderer _addGPUFramePresentedHandler:]");
    MEMORY[0x1F4181798](self, sel__addGPUFrameCompletedHandler_, a3, v10);
  }
}

- (void)_allowGPUBackgroundExecution
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1B64F3EE0;
  v2[3] = &unk_1E61411E0;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)_interfaceOrientationDidChange
{
  if ((*((unsigned char *)self + 121) & 0x10) != 0)
  {
    uint64_t v11 = objc_msgSend_window(self->_privateRendererOwner, a2, v2, v3);
    uint64_t v15 = objc_msgSend_windowScene(v11, v12, v13, v14);
    uint64_t v9 = objc_msgSend_interfaceOrientation(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v5 = objc_msgSend_sharedApplication(MEMORY[0x1E4FB1438], a2, v2, v3);
    uint64_t v9 = objc_msgSend_statusBarOrientation(v5, v6, v7, v8);
  }

  MEMORY[0x1F4181798](self, sel__setInterfaceOrientation_, v9, v10);
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  int v4 = a3;
  objc_msgSend_lock(self, a2, a3, v3);
  sub_1B64479EC((uint64_t)self->_engineContext, v4);

  objc_msgSend_unlock(self, v6, v7, v8);
}

- (BOOL)canRecycleParticleBuffers
{
  return objc_msgSend_canRecycleParticleBuffers(self->_renderContext, a2, v2, v3);
}

- (void)setCanRecycleParticleBuffers:(BOOL)a3
{
}

- (BOOL)shouldLoadFinalTexture
{
  return objc_msgSend_requireLoadFinalTexture(self->_renderContext, a2, v2, v3);
}

- (void)setShouldLoadFinalTexture:(BOOL)a3
{
}

- (VFXRenderGraph)renderGraph
{
  return self->_renderGraph;
}

- (void)setRenderGraph:(id)a3
{
  renderGraph = self->_renderGraph;
  if (renderGraph != a3)
  {

    self->_renderGraph = (VFXRenderGraph *)a3;
    objc_msgSend_invalidateCompiledGraph(a3, v6, v7, v8);
    uint64_t v12 = objc_msgSend_graph(self->_renderGraph, v9, v10, v11);
    uint64_t v16 = objc_msgSend_diagnostics(self->_renderGraph, v13, v14, v15);
    engineContext = self->_engineContext;
    uint64_t v21 = objc_msgSend_world(self, v18, v19, v20);
    uint64_t v25 = objc_msgSend_worldRef(v21, v22, v23, v24);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B64F40B0;
    v27[3] = &unk_1E6143008;
    v27[5] = v16;
    v27[6] = engineContext;
    v27[4] = v12;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v26, v25, 0, v27);
  }
}

- (id)_legacyRenderer
{
  return self->_legacyRenderer;
}

- (void)set_legacyRenderer:(id)a3
{
  self->_legacyRenderer = (_TtC3VFX17VFXRendererLegacy *)a3;
}

- (BOOL)_triggersEnabled
{
  objc_msgSend_lock(self, a2, v2, v3);
  char v5 = sub_1B6448070((uint64_t)self->_engineContext);
  objc_msgSend_unlock(self, v6, v7, v8);
  return v5;
}

- (void)set_triggersEnabled:(BOOL)a3
{
  objc_msgSend_lock(self, a2, a3, v3);
  sub_1B6448064((uint64_t)self->_engineContext, a3);

  objc_msgSend_unlock(self, v6, v7, v8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);

  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
}

- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v14 = [VFXMovieExportOperation alloc];
  id v16 = (id)objc_msgSend_initWithRenderer_size_attributes_outputURL_(v14, v15, (uint64_t)self, (uint64_t)a6, a3, width, height);
  objc_msgSend_setAntialiasingMode_(v16, v17, a5, v18);
  objc_msgSend_main(v16, v19, v20, v21);
  uint64_t v25 = objc_msgSend_error(v16, v22, v23, v24);
  uint64_t v29 = v25;
  if (a7 && v25) {
    *a7 = (id)objc_msgSend_error(v16, v26, v27, v28);
  }
  return v29 == 0;
}

- (VFXRenderer)initWithCommandQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXRenderer;
  int v4 = [(VFXRenderer *)&v9 init];
  uint64_t v7 = v4;
  if (v4) {
    objc_msgSend_setupLegacyRendererWithCommandQueue_(v4, v5, (uint64_t)a3, v6);
  }
  return v7;
}

- (id)setupLegacyRendererWithCommandQueue:(id)a3
{
  char v5 = [_TtC3VFX17VFXRendererLegacy alloc];
  uint64_t v8 = objc_msgSend_initWithCommandQueue_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_backgroundColor(self, v9, v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12, v14);
  uint64_t v18 = objc_msgSend_world(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_scene(v18, v19, v20, v21);
  objc_msgSend_setScene_(v8, v23, v22, v24);
  objc_msgSend_set_legacyRenderer_(self, v25, (uint64_t)v8, v26);

  return (id)objc_msgSend__legacyRenderer(self, v27, v28, v29);
}

- (id)legacyRenderer
{
  id result = (id)objc_msgSend__legacyRenderer(self, a2, v2, v3);
  if (!result)
  {
    return (id)objc_msgSend_setupLegacyRendererWithCommandQueue_(self, v6, 0, v7);
  }
  return result;
}

- (_TtC3VFX8VFXScene)scene
{
  int v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return (_TtC3VFX8VFXScene *)objc_msgSend_scene(v4, v5, v6, v7);
}

- (void)setScene:(id)a3
{
  char v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setScene_(v5, v6, (uint64_t)a3, v7);
}

- (_TtC3VFX9VFXEffect)effect
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return (_TtC3VFX9VFXEffect *)MEMORY[0x1F4181798](v4, sel_effect, v5, v6);
}

- (void)setEffect:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setEffect_, a3, v6);
}

- (MTLTexture)texture
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return (MTLTexture *)objc_msgSend_texture(v4, v5, v6, v7);
}

- (void)setTexture:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setTexture_(v5, v6, (uint64_t)a3, v7);
}

- (MTLTexture)depthTexture
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return (MTLTexture *)MEMORY[0x1F4181798](v4, sel_depthTexture, v5, v6);
}

- (void)setDepthTexture:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setDepthTexture_(v5, v6, (uint64_t)a3, v7);
}

- (BOOL)hasRenderableObjects
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_hasRenderableObjects, v5, v6);
}

- (void)encodeWithCommandBuffer:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_encodeWithCommandBuffer_, a3, v6);
}

- (void)finalizeEncoding
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  MEMORY[0x1F4181798](v4, sel_finalizeEncoding, v5, v6);
}

- (BOOL)enableDeferredRendering
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_enableDeferredRendering, v5, v6);
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, a3, v3);

  MEMORY[0x1F4181798](v5, sel_setEnableDeferredRendering_, v4, v6);
}

- (BOOL)_legacyAdditiveWritesToAlpha
{
  BOOL v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return objc_msgSend_additiveWritesToAlpha(v4, v5, v6, v7);
}

- (void)_setLegacyAdditiveWritesToAlpha:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, a3, v3);

  MEMORY[0x1F4181798](v5, sel_setAdditiveWritesToAlpha_, v4, v6);
}

- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4
{
  uint64_t v6 = objc_msgSend_legacyRenderer(self, a2, v4, v5);

  return (id)MEMORY[0x1F4181798](v6, sel_snapshotWithSize_deltaTime_, v7, v8);
}

- (id)snapshotImageWithSize:(CGSize)a3
{
  return (id)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self, sel_snapshotImageWithSize_deltaTime_);
}

- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4
{
  uint64_t v6 = objc_msgSend_legacyRenderer(self, a2, v4, v5);

  return (id)MEMORY[0x1F4181798](v6, sel_snapshotImageWithSize_deltaTime_, v7, v8);
}

- (id)postRenderCallback
{
  uint64_t v4 = objc_msgSend_legacyRenderer(self, a2, v2, v3);

  return (id)MEMORY[0x1F4181798](v4, sel_postRenderCallback, v5, v6);
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyRenderer(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setPostRenderCallback_, a3, v6);
}

@end