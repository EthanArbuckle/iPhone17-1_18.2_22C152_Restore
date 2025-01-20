@interface VFXView
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)displayLinkCallbackShouldReturnImmediately;
+ (BOOL)displayLinkPolicy;
+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess;
+ (BOOL)usesSeparateWorkGroup;
+ (Class)layerClass;
+ (id)_currentVFXViewFocusEnvironment;
+ (id)_kvoKeysForwardedToRenderer;
+ (id)deviceForOptions:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (uint64_t)_isMetalSupported;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_canJitter;
- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded;
- (BOOL)_controlsOwnScaleFactor;
- (BOOL)_enableARMode;
- (BOOL)_isEditor;
- (BOOL)_shouldDelegateARCompositing;
- (BOOL)_showsAuthoringEnvironment;
- (BOOL)_wantsWorldRendererDelegationMessages;
- (BOOL)additiveWritesToAlpha;
- (BOOL)allowsCameraControl;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)framebufferOnly;
- (BOOL)isEmulatingStereo;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isOpaque;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)lowLatency;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)rendersContinuously;
- (BOOL)showsDebugUI;
- (BOOL)showsStatistics;
- (BOOL)skipFramesIfNoDrawableAvailable;
- (BOOL)triggersEnabled;
- (BOOL)vfx_inLiveResize;
- (BOOL)wantsExtendedDynamicRange;
- (BOOL)wantsHDR;
- (CGColorSpace)colorSpace;
- (CGColorSpace)workingColorSpace;
- (CGRect)currentViewport;
- (CGSize)_updateBackingSize;
- (CGSize)backingSizeForBoundSize:(CGSize)a3;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (NSString)description;
- (VFXCameraController)defaultCameraController;
- (VFXNode)audioListener;
- (VFXNode)pointOfView;
- (VFXRenderGraph)renderGraph;
- (VFXView)init;
- (VFXView)initWithCoder:(id)a3;
- (VFXView)initWithFrame:(CGRect)a3;
- (VFXView)initWithFrame:(CGRect)a3 options:(id)a4;
- (VFXWorld)world;
- (VFXWorldRendererDelegate)delegate;
- (double)_renderThreadPriority;
- (double)_viewport;
- (double)contentScaleFactor;
- (double)projectPoint:(uint64_t)a3;
- (double)scaleFactor;
- (float)_flipY:(float)a3;
- (float)_runFPSTestWithDuration:(double)a3;
- (float)_superSamplingFactor;
- (id)_authoringEnvironment;
- (id)_commandBufferStatusMonitor;
- (id)_defaultBackgroundColor;
- (id)_legacyView;
- (id)_renderingQueue;
- (id)_resourceManagerMonitor;
- (id)backgroundColor;
- (id)displayLink;
- (id)effect;
- (id)eventHandler;
- (id)focusItemsInRect:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTestWithSegmentFromPoint:(VFXView *)self toPoint:(SEL)a2 options:(id)a3;
- (id)legacyView;
- (id)navigationCameraController;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)pointOfCulling;
- (id)postRenderCallback;
- (id)renderer;
- (id)scene;
- (id)setupLegacyView;
- (id)snapshot;
- (id)vfx_backingLayer;
- (int64_t)_preferredFocusMovementStyle;
- (int64_t)preferredFramesPerSecond;
- (uint64_t)_screenTransform;
- (uint64_t)set_screenTransform:(uint64_t)a3;
- (uint64_t)unprojectPoint:(uint64_t)a3;
- (unint64_t)antialiasingMode;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)debugUIOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)pixelFormat;
- (unint64_t)renderMode;
- (unint64_t)rendererKind;
- (unint64_t)stencilPixelFormat;
- (unsigned)resizingMode;
- (void)VFX_displayLinkCallback:(double)a3;
- (void)__CFObject;
- (void)_addGPUFrameCompletedHandler:(id)a3;
- (void)_addGPUFramePresentedHandler:(id)a3;
- (void)_addGPUFrameScheduledHandler:(id)a3;
- (void)_adjustBackingLayerPixelFormat;
- (void)_allowGPUBackgroundExecution;
- (void)_backgroundDidChange;
- (void)_commonInit:(id)a3;
- (void)_createDisplayLinkIfNeeded;
- (void)_drawAtTime:(double)a3;
- (void)_enterBackground:(id)a3;
- (void)_enterForeground:(id)a3;
- (void)_flushDisplayLink;
- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5;
- (void)_jitterRedisplay;
- (void)_resizeIfNeeded;
- (void)_setNeedsDisplay;
- (void)_systemTimeAnimationStarted:(id)a3;
- (void)_updateContentsScaleFactor;
- (void)_updateOpacity;
- (void)_updateProbes:(id)a3 progress:(id)a4;
- (void)_worldDidUpdate:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eventHandlerWantsRedraw;
- (void)invalidateDisplayLink;
- (void)layoutSubviews;
- (void)lock;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseDisplayLink;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)renderWithCompletion:(id)a3;
- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4;
- (void)resumeDisplayLink;
- (void)safeAreaInsetsDidChange;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setAllowsCameraControl:(BOOL)a3;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAudioListener:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDebugUIOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setEffect:(id)a3;
- (void)setEmulateStereo:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setFramebufferOnly:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setLowLatency:(BOOL)a3;
- (void)setNavigationCameraController:(id)a3;
- (void)setNeedsDisplay;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setPointOfCulling:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setPointOfView:(id)a3 animate:(BOOL)a4;
- (void)setPostRenderCallback:(id)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRenderGraph:(id)a3;
- (void)setRenderMode:(unint64_t)a3;
- (void)setRendererKind:(unint64_t)a3;
- (void)setRendersContinuously:(BOOL)a3;
- (void)setResizingMode:(unsigned __int8)a3;
- (void)setScaleFactor:(double)a3;
- (void)setScene:(id)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setTriggersEnabled:(BOOL)a3;
- (void)setWantsExtendedDynamicRange:(BOOL)a3;
- (void)setWantsHDR:(BOOL)a3;
- (void)setWorld:(id)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_enableARMode:(BOOL)a3;
- (void)set_legacyView:(id)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_shouldDelegateARCompositing:(BOOL)a3;
- (void)set_superSamplingFactor:(float)a3;
- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3;
- (void)switchToCameraNamed:(id)a3;
- (void)switchToNextCamera;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unlock;
- (void)updateAtTime:(double)a3;
- (void)updateLayerLatency;
- (void)vfx_setBackingLayer:(id)a3;
- (void)vfx_setGestureRecognizers:(id)a3;
- (void)vfx_updateGestureRecognizers;
- (void)willMoveToWindow:(id)a3;
@end

@implementation VFXView

+ (uint64_t)_isMetalSupported
{
  if (qword_1E9DDA5F8 != -1) {
    dispatch_once(&qword_1E9DDA5F8, &unk_1F0FB5528);
  }
  return byte_1E9DDA5F4;
}

- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1B64828EC;
  aBlock[3] = &unk_1E6142718;
  objc_copyWeak(v25, &location);
  id v10 = v8;
  id v23 = v10;
  v25[1] = (id)a4;
  id v11 = v9;
  id v24 = v11;
  v12 = _Block_copy(aBlock);
  objc_msgSend__renderThreadPriority(self, v13, v14, v15);
  double v17 = v16;
  memset(&v30, 0, sizeof(v30));
  pthread_attr_init(&v30);
  pthread_attr_setschedpolicy(&v30, 2);
  int v18 = (int)v17;
  if (v17 == 0.0) {
    int v18 = 45;
  }
  v21.sched_priority = v18;
  *(_DWORD *)v21.__opaque = 0;
  pthread_attr_setschedparam(&v30, &v21);
  v19 = _Block_copy(v12);
  dispatch_time_t v20 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B6482AE8;
  block[3] = &unk_1E6142738;
  pthread_attr_t v28 = v30;
  v29 = v19;
  dispatch_after(v20, MEMORY[0x1E4F14428], block);
  pthread_attr_destroy(&v30);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

+ (id)deviceForOptions:(id)a3
{
  id v9 = MTLCreateSystemDefaultDevice();
  if (!v9 && (byte_1E9DDB0D8 & 1) == 0)
  {
    byte_1E9DDB0D8 = 1;
    sub_1B63F2F54(16, @"Error: Failed to create default Metal device.", v3, v4, v5, v6, v7, v8, v11);
  }
  return v9;
}

- (void)_adjustBackingLayerPixelFormat
{
  if (self->_legacyView) {
    return;
  }
  objc_msgSend_lock(self, a2, v2, v3);
  objc_msgSend_lock(self->_renderer, v5, v6, v7);
  uint64_t isOpaque = objc_msgSend_isOpaque(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend__renderContextMetal(self->_renderer, v12, v13, v14);
  objc_msgSend_setIsOpaque_(v15, v16, isOpaque, v17);
  if (sub_1B63CC4D8())
  {
    sched_param v21 = objc_msgSend_window(self, v18, v19, v20);
    v25 = objc_msgSend_screen(v21, v22, v23, v24);
    if (objc_msgSend_gamut(v25, v26, v27, v28) == 1)
    {
      uint64_t v29 = 1;
LABEL_6:
      char v32 = 1;
      uint64_t v31 = v29;
      goto LABEL_7;
    }
  }
  int v30 = objc_msgSend_wantsExtendedDynamicRange(self, v18, v19, v20);
  uint64_t v29 = 0;
  uint64_t v31 = 0;
  char v32 = 0;
  if (v30) {
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v33 = objc_msgSend_antialiasingMode(self->_renderer, v18, v19, v20);
  v37 = objc_msgSend__renderContextMetal(self->_renderer, v34, v35, v36);
  objc_msgSend_setWantsWideGamut_(v37, v38, v31, v39);
  objc_msgSend_colorSpace(self, v40, v41, v42);
  v48 = objc_msgSend_layer(self, v43, v44, v45);
  if ((*((unsigned char *)self + 425) & 0x10) == 0)
  {
    char v49 = v32 | 8;
    if (!v33) {
      char v49 = v32;
    }
    if (isOpaque) {
      char v50 = v49;
    }
    else {
      char v50 = v49 | 0x10;
    }
    uint64_t v51 = sub_1B64D7C2C(v50);
    objc_msgSend_setPixelFormat_(v48, v52, v51, v53);
  }
  objc_msgSend_setWantsExtendedDynamicRangeContent_(v48, v46, (*((unsigned __int8 *)self + 424) >> 2) & 1, v47);
  objc_msgSend_unlock(self->_renderer, v54, v55, v56);

  objc_msgSend_unlock(self, v57, v58, v59);
}

- (unint64_t)pixelFormat
{
  if (self->_legacyView) {
    legacyView = self->_legacyView;
  }
  else {
    legacyView = objc_msgSend_layer(self, a2, v2, v3);
  }

  return objc_msgSend_pixelFormat(legacyView, a2, v2, v3);
}

- (void)setPixelFormat:(unint64_t)a3
{
  legacyView = self->_legacyView;
  if (legacyView)
  {
    objc_msgSend_setPixelFormat_(legacyView, a2, a3, v3);
  }
  else
  {
    objc_msgSend_lock(self, a2, a3, v3);
    uint64_t v10 = objc_msgSend_colorSpace(self, v7, v8, v9);
    *((unsigned char *)self + 425) |= 0x10u;
    uint64_t v14 = objc_msgSend_layer(self, v11, v12, v13);
    objc_msgSend_setPixelFormat_(v14, v15, a3, v16);
    if ((*((unsigned char *)self + 425) & 0x20) != 0) {
      objc_msgSend_setColorSpace_(self, v17, v10, v19);
    }
    objc_msgSend_unlock(self, v17, v18, v19);
    objc_msgSend__setNeedsDisplay(self, v20, v21, v22);
  }
}

- (CGColorSpace)colorSpace
{
  uint64_t v4 = objc_msgSend_layer(self, a2, v2, v3);

  return (CGColorSpace *)MEMORY[0x1F4181798](v4, sel_colorspace, v5, v6);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  objc_msgSend_lock(self, a2, (uint64_t)a3, v3);
  *((unsigned char *)self + 425) |= 0x20u;
  uint64_t v9 = objc_msgSend_layer(self, v6, v7, v8);
  objc_msgSend_setColorspace_(v9, v10, (uint64_t)a3, v11);
  objc_msgSend_unlock(self, v12, v13, v14);

  objc_msgSend__setNeedsDisplay(self, v15, v16, v17);
}

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 1;
}

- (void)_commonInit:(id)a3
{
  sub_1B64F42F4();
  *((unsigned char *)self + 424) |= 1u;
  *((unsigned char *)self + 424) |= 0x20u;
  self->_currentSystemTime = CACurrentMediaTime();
  self->_lock = objc_alloc_init(VFXRecursiveLock);
  uint64_t v8 = objc_msgSend_layer(self, v5, v6, v7);
  sub_1B64E58F0(v8);
  objc_msgSend_vfx_setBackingLayer_(self, v9, (uint64_t)v8, v10);
  self->_device = (MTLDevice *)objc_msgSend_device(v8, v11, v12, v13);
  uint64_t v14 = objc_opt_class();
  if (objc_msgSend_shouldObserveApplicationStateToPreventBackgroundGPUAccess(v14, v15, v16, v17))
  {
    if (_UIApplicationIsExtension())
    {
      uint64_t v24 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v21, v22, v23);
      objc_msgSend_addObserver_selector_name_object_(v24, v25, (uint64_t)self, (uint64_t)sel__enterForeground_, *MEMORY[0x1E4F28270], 0);
      uint64_t v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v26, v27, v28);
      uint64_t v31 = (void *)MEMORY[0x1E4F28288];
    }
    else
    {
      char v32 = objc_msgSend__applicationKeyWindow(MEMORY[0x1E4FB1F48], v21, v22, v23);
      int isHostedInAnotherProcess = objc_msgSend__isHostedInAnotherProcess(v32, v33, v34, v35);
      v40 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v37, v38, v39);
      if (isHostedInAnotherProcess)
      {
        objc_msgSend_addObserver_selector_name_object_(v40, v41, (uint64_t)self, (uint64_t)sel__enterForeground_, @"_UIViewServiceHostDidBecomeActiveNotification", 0);
        uint64_t v45 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v42, v43, v44);
        objc_msgSend_addObserver_selector_name_object_(v45, v46, (uint64_t)self, (uint64_t)sel__enterBackground_, @"_UIViewServiceHostWillResignActiveNotification", 0);
        goto LABEL_8;
      }
      objc_msgSend_addObserver_selector_name_object_(v40, v41, (uint64_t)self, (uint64_t)sel__enterForeground_, *MEMORY[0x1E4FB2628], 0);
      uint64_t v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v47, v48, v49);
      uint64_t v31 = (void *)MEMORY[0x1E4FB2738];
    }
    objc_msgSend_addObserver_selector_name_object_(v29, v30, (uint64_t)self, (uint64_t)sel__enterBackground_, *v31, 0);
  }
LABEL_8:
  char v50 = objc_msgSend_mainScreen(MEMORY[0x1E4FB1BA8], v18, v19, v20);
  objc_msgSend_nativeScale(v50, v51, v52, v53);
  objc_msgSend_setContentScaleFactor_(self, v54, v55, v56);
  objc_msgSend_setContentMode_(self, v57, 4, v58);
  objc_msgSend_setMultipleTouchEnabled_(self, v59, 1, v60);
  v61 = [VFXRenderer alloc];
  self->_renderer = (VFXRenderer *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v61, v62, (uint64_t)self->_device, (uint64_t)a3, 1, self, 1);
  v63 = [VFXJitterer alloc];
  self->_jitterer = (VFXJitterer *)objc_msgSend_initWithDelegate_(v63, v64, (uint64_t)self, v65);
  uint64_t v69 = objc_msgSend__defaultBackgroundColor(self, v66, v67, v68);
  objc_msgSend_setBackgroundColor_(self, v70, v69, v71);
  if (sub_1B63F3214(1)) {
    objc_msgSend_setAllowsCameraControl_(self, v72, 1, v73);
  }
  if (sub_1B63F3214(0)) {
    objc_msgSend_setShowsStatistics_(self, v74, 1, v75);
  }
  if ((MGGetBoolAnswer() & 1) != 0 || !NSClassFromString(&cfstr_Arvfxview.isa)) {
    char v79 = 1;
  }
  else {
    char v79 = objc_opt_isKindOfClass() ^ 1;
  }
  v80 = objc_msgSend__renderContextMetal(self->_renderer, v76, v77, v78);
  objc_msgSend_setShouldPresentAfterMinimumDuration_(v80, v81, v79 & 1, v82);
  v86 = objc_msgSend__renderContextMetal(self->_renderer, v83, v84, v85);
  objc_msgSend_setPreferredFramesPerSecond_(v86, v87, 0, v88);
  if (_UIApplicationIsExtension()) {
    objc_msgSend__runningInExtension(self->_renderer, v89, v90, v91);
  }
  v92 = [VFXCameraNavigationController alloc];
  id v96 = (id)objc_msgSend_initWithView_(v92, v93, (uint64_t)self, v94);

  objc_msgSend_setNavigationCameraController_(self, v95, (uint64_t)v96, v97);
}

- (VFXView)initWithFrame:(CGRect)a3
{
  return (VFXView *)((uint64_t (*)(VFXView *, char *, void))MEMORY[0x1F4181798])(self, sel_initWithFrame_options_, 0);
}

- (VFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)VFXView;
  uint64_t v7 = -[VFXView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  uint64_t v10 = v7;
  if (v7)
  {
    v7->_boundsSize.CGFloat width = width;
    v7->_boundsSize.CGFloat height = height;
    objc_msgSend__commonInit_(v7, v8, (uint64_t)a4, v9);
  }
  return v10;
}

- (VFXView)init
{
  return (VFXView *)((uint64_t (*)(VFXView *, char *, void))MEMORY[0x1F4181798])(self, sel_initWithFrame_options_, 0);
}

- (VFXView)initWithCoder:(id)a3
{
  v42.receiver = self;
  v42.super_class = (Class)VFXView;
  uint64_t v4 = -[VFXView initWithCoder:](&v42, sel_initWithCoder_);
  uint64_t v8 = v4;
  if (v4)
  {
    p_boundsSize = &v4->_boundsSize;
    objc_msgSend_bounds(v4, v5, v6, v7);
    *(void *)&p_boundsSize->CGFloat width = v10;
    v8->_boundsSize.CGFloat height = v11;
    objc_msgSend__commonInit_(v8, v12, 0, v13);
    if (objc_msgSend_containsValueForKey_(a3, v14, @"autoenablesDefaultLighting", v15))
    {
      uint64_t v18 = objc_msgSend_decodeBoolForKey_(a3, v16, @"autoenablesDefaultLighting", v17);
      objc_msgSend_setAutoenablesDefaultLighting_(v8, v19, v18, v20);
    }
    if (objc_msgSend_containsValueForKey_(a3, v16, @"jitteringEnabled", v17))
    {
      uint64_t v23 = objc_msgSend_decodeBoolForKey_(a3, v21, @"jitteringEnabled", v22);
      objc_msgSend_setJitteringEnabled_(v8, v24, v23, v25);
    }
    if (objc_msgSend_containsValueForKey_(a3, v21, @"temporalAntialiasingEnabled", v22))
    {
      uint64_t v28 = objc_msgSend_decodeBoolForKey_(a3, v26, @"temporalAntialiasingEnabled", v27);
      objc_msgSend_setTemporalAntialiasingEnabled_(v8, v29, v28, v30);
    }
    if (objc_msgSend_containsValueForKey_(a3, v26, @"allowsCameraControl", v27))
    {
      uint64_t v33 = objc_msgSend_decodeBoolForKey_(a3, v31, @"allowsCameraControl", v32);
      objc_msgSend_setAllowsCameraControl_(v8, v34, v33, v35);
    }
    if (objc_msgSend_containsValueForKey_(a3, v31, @"backgroundColor", v32))
    {
      uint64_t v36 = objc_opt_class();
      uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, @"backgroundColor");
      objc_msgSend_setBackgroundColor_(v8, v39, v38, v40);
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VFXView;
  -[VFXView encodeWithCoder:](&v30, sel_encodeWithCoder_);
  uint64_t v8 = objc_msgSend_autoenablesDefaultLighting(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(a3, v9, v8, @"autoenablesDefaultLighting");
  uint64_t isJitteringEnabled = objc_msgSend_isJitteringEnabled(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(a3, v14, isJitteringEnabled, @"jitteringEnabled");
  uint64_t isTemporalAntialiasingEnabled = objc_msgSend_isTemporalAntialiasingEnabled(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(a3, v19, isTemporalAntialiasingEnabled, @"temporalAntialiasingEnabled");
  uint64_t v23 = objc_msgSend_allowsCameraControl(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(a3, v24, v23, @"allowsCameraControl");
  uint64_t v28 = objc_msgSend_backgroundColor(self, v25, v26, v27);
  objc_msgSend_encodeObject_forKey_(a3, v29, v28, @"backgroundColor");
}

- (void)dealloc
{
  *((unsigned char *)self + 424) |= 0x20u;
  *((unsigned char *)self + 424) |= 0x80u;
  objc_msgSend__flushDisplayLink(self, a2, v2, v3);
  objc_msgSend_vfx_setGestureRecognizers_(self, v5, 0, v6);
  if ((VFXView *)qword_1EB988708 == self) {
    qword_1EB988708 = 0;
  }
  objc_msgSend_invalidateDisplayLink(self, v7, v8, v9);
  objc_msgSend_delegateWillDie(self->_jitterer, v10, v11, v12);

  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
  objc_msgSend_removeObserver_(v16, v17, (uint64_t)self, v18);

  objc_msgSend_worldWillChange(self->_navigationCameraController, v19, v20, v21);
  objc_msgSend_setDelegate_(self->_navigationCameraController, v22, 0, v23);

  objc_msgSend_removeObserver_forKeyPath_(self->_world, v24, (uint64_t)self, @"background.contents");
  v25.receiver = self;
  v25.super_class = (Class)VFXView;
  [(VFXView *)&v25 dealloc];
}

- (id)_legacyView
{
  return self->_legacyView;
}

- (void)set_legacyView:(id)a3
{
  self->_legacyView = (_TtC3VFX13VFXViewLegacy *)a3;
  objc_msgSend_delegateWillDie(self->_jitterer, v5, v6, v7);

  self->_jitterer = 0;
  uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self, v13);

  self->_backgroundColor = 0;
  self->_backingLayer = 0;

  self->_navigationCameraController = 0;

  objc_msgSend_invalidateDisplayLink(self, v14, v15, v16);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_setHidden_(self->_legacyView, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)VFXView;
  [(VFXView *)&v6 setHidden:v4];
  self->_isHidden = v4;
}

- (void)setWorld:(id)a3
{
  if (self->_world != a3)
  {
    objc_msgSend_lock(self, a2, (uint64_t)a3, v3);
    uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
    objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, @"kCFXWorldDidUpdateNotification", 0);
    objc_msgSend_removeObserver_forKeyPath_(self->_world, v11, (uint64_t)self, @"background.contents");
    objc_msgSend_worldWillChange(self->_navigationCameraController, v12, v13, v14);

    uint64_t v15 = (VFXWorld *)a3;
    self->_world = v15;
    if (v15)
    {
      uint64_t v19 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
      uint64_t v23 = objc_msgSend_worldRef(self->_world, v20, v21, v22);
      objc_msgSend_addObserver_selector_name_object_(v19, v24, (uint64_t)self, (uint64_t)sel__worldDidUpdate_, @"kCFXWorldDidUpdateNotification", v23);
      objc_msgSend_addObserver_forKeyPath_options_context_(self->_world, v25, (uint64_t)self, @"background.contents", 0, @"kVFXViewObservingContext");
    }
    renderer = self->_renderer;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1B64E669C;
    v39[3] = &unk_1E61422C0;
    v39[4] = self;
    objc_msgSend_setWorld_completionHandler_(renderer, v16, (uint64_t)a3, (uint64_t)v39);
    objc_msgSend_worldDidChange(self->_navigationCameraController, v27, v28, v29);
    objc_msgSend_startRuntimeThread(self->_world, v30, v31, v32);
    objc_msgSend_unlock(self, v33, v34, v35);
    objc_msgSend__updateOpacity(self, v36, v37, v38);
  }
}

- (VFXWorld)world
{
  return self->_world;
}

- (BOOL)skipFramesIfNoDrawableAvailable
{
  return self->_skipFramesIfNoDrawableAvailable;
}

- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3
{
  self->_skipFramesIfNoDrawableAvailable = a3;
}

- (void)set_superSamplingFactor:(float)a3
{
  objc_msgSend_set_superSamplingFactor_(self->_renderer, a2, v3, v4);
}

- (float)_superSamplingFactor
{
  objc_msgSend__superSamplingFactor(self->_renderer, a2, v2, v3);
  return result;
}

- (uint64_t)set_screenTransform:(uint64_t)a3
{
  return objc_msgSend_set_screenTransform_(*(void **)(a1 + 440), a2, a3, a4);
}

- (uint64_t)_screenTransform
{
  return objc_msgSend__screenTransform(*(void **)(a1 + 440), a2, a3, a4);
}

- (void)setRenderMode:(unint64_t)a3
{
  objc_msgSend_setRenderMode_(self->_renderer, a2, a3, v3);

  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (unint64_t)renderMode
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_renderMode);
}

- (void)setRendererKind:(unint64_t)a3
{
  objc_msgSend_setRendererKind_(self->_renderer, a2, a3, v3);

  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (unint64_t)rendererKind
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_rendererKind);
}

- (BOOL)isEmulatingStereo
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_isEmulatingStereo);
}

- (void)setEmulateStereo:(BOOL)a3
{
}

- (id)renderer
{
  return self->_renderer;
}

- (id)vfx_backingLayer
{
  return self->_backingLayer;
}

- (void)vfx_setBackingLayer:(id)a3
{
  backingLayer = self->_backingLayer;
  if (backingLayer != a3)
  {

    self->_backingLayer = (CAMetalLayer *)a3;
  }
}

- (BOOL)additiveWritesToAlpha
{
  return objc_msgSend_additiveWritesToAlpha(self->_renderer, a2, v2, v3);
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
}

- (BOOL)isJitteringEnabled
{
  return objc_msgSend_isEnabled(self->_jitterer, a2, v2, v3);
}

- (void)setJitteringEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_setEnabled_(self->_jitterer, a2, a3, v3);
  objc_msgSend_setJitteringEnabled_(self->_renderer, v6, v4, v7);

  objc_msgSend__setNeedsDisplay(self, v8, v9, v10);
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return objc_msgSend_isTemporalAntialiasingEnabled(self->_renderer, a2, v2, v3);
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  objc_msgSend_setTemporalAntialiasingEnabled_(self->_renderer, a2, a3, v3);
}

- (void)_jitterRedisplay
{
  objc_msgSend__presentFramebuffer(self->_renderer, a2, v2, v3);
}

- (BOOL)_canJitter
{
  BOOL v4 = (__n128 *)objc_msgSend__engineContext(self->_renderer, a2, v2, v3);
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    __n128 v13 = sub_1B64479C4(v4);
    v13.n128_u64[0] = (unint64_t)vmvn_s8((int8x8_t)vclez_f32((float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL))));
    if (v13.n128_u32[1] & v13.n128_u32[0])
    {
      sub_1B6445900(v5, v6, v7, v8, v9, v10, v11, v12);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)vfx_inLiveResize
{
  return 0;
}

- (void)updateLayerLatency
{
  uint64_t v7 = objc_msgSend_lowLatency(self, a2, v2, v3);
  backingLayer = self->_backingLayer;
  if (v7) {
    objc_msgSend_setMaximumDrawableCount_(backingLayer, v5, 2, v6);
  }
  else {
    objc_msgSend_setMaximumDrawableCount_(backingLayer, v5, 3, v6);
  }

  objc_msgSend_setLowLatency_(backingLayer, v9, v7, v10);
}

- (BOOL)lowLatency
{
  return self->_lowLatency;
}

- (void)setLowLatency:(BOOL)a3
{
  if (self->_legacyView)
  {
    self->_lowLatency = a3;
    objc_msgSend_setLowLatency_(self->_legacyView, a2, a3, v3);
  }
  else if (self->_lowLatency != a3)
  {
    self->_lowLatency = a3;
    ((void (*)(VFXView *, char *, BOOL))MEMORY[0x1F4181798])(self, sel_updateLayerLatency, a3);
  }
}

+ (BOOL)usesSeparateWorkGroup
{
  BOOL v4 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], a2, v2, v3);

  return objc_msgSend_BOOLForKey_(v4, v5, @"com.apple.vfx.forceSeparateWorkGroup", v6);
}

- (id)_renderingQueue
{
  return (id)objc_msgSend__renderingQueue(self->_renderer, a2, v2, v3);
}

- (void)VFX_displayLinkCallback:(double)a3
{
  uint64_t v7 = objc_msgSend_world(self, a2, v3, v4);
  uint64_t v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v19 = (void *)sub_1B64B2054(v11, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    if (v19)
    {
      unint64_t v23 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (void)self) ^ ((0x9DDFEA08EB382D69 * (unint64_t)self) >> 47));
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = sub_1B64E6BE8;
      v39[3] = &unk_1E6143468;
      v39[4] = self;
      *(double *)&void v39[5] = a3;
      objc_msgSend_triggerRenderWith_renderer_(v19, v20, (uint64_t)v39, 0x9DDFEA08EB382D69 * (v23 ^ (v23 >> 47)));
    }
    else
    {
      objc_msgSend__drawAtTime_(self, v20, v21, v22, a3);
    }
  }
  else
  {
    objc_msgSend__backingSize(self->_renderer, v12, v13, v14);
    double v29 = v28;
    if (v28 >= 1.0 && v27 >= 1.0)
    {
      double v31 = v27;
      objc_msgSend_drawableSize(self->_backingLayer, v24, v25, v26);
      if (v29 != v35 || v31 != v36) {
        objc_msgSend_setDrawableSize_(self->_backingLayer, v32, v33, v34, v29, v31);
      }
      renderer = self->_renderer;
      objc_msgSend__clearBackBuffer(renderer, v32, v33, v34);
    }
  }
}

- (void)updateAtTime:(double)a3
{
  objc_msgSend_updateAtTime_(self->_renderer, a2, v3, v4, a3);
}

- (void)_updateContentsScaleFactor
{
  objc_msgSend_contentScaleFactor(self, a2, v2, v3);
  *(float *)&double v8 = v8;
  renderer = self->_renderer;

  objc_msgSend__setContentsScaleFactor_(renderer, v5, v6, v7, v8);
}

- (CGSize)backingSizeForBoundSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend_contentScaleFactor(self, a2, v3, v4);
  double v9 = width * v8;
  objc_msgSend_contentScaleFactor(self, v10, v11, v12);
  double v14 = height * v13;
  double v15 = v9;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (CGSize)_updateBackingSize
{
  objc_msgSend_lock(self, a2, v2, v3);
  objc_msgSend__updateContentsScaleFactor(self, v5, v6, v7);
  objc_msgSend_bounds(self, v8, v9, v10);
  self->_boundsSize.double width = v11;
  self->_boundsSize.double height = v12;
  objc_msgSend_backingSizeForBoundSize_(self, v13, v14, v15, v11, v12);
  float64_t v30 = v16;
  float64_t v31 = v17;
  objc_msgSend__setBackingSize_(self->_renderer, v18, v19, v20);
  v21.f64[0] = v30;
  v21.f64[1] = v31;
  objc_msgSend_set_viewport_(self->_renderer, v22, v23, v24, *(double *)vcvt_hight_f32_f64(0, v21).i64);
  objc_msgSend_unlock(self, v25, v26, v27);
  double v28 = v30;
  double v29 = v31;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)_drawAtTime:(double)a3
{
  if (!self->_legacyView)
  {
    if (*((char *)self + 424) < 0 || (*((unsigned char *)self + 424) & 0x20) != 0)
    {
      if ((*((unsigned char *)self + 424) & 0x40) == 0) {
        return;
      }
      *((unsigned char *)self + 424) &= ~0x40u;
    }
    if (!self->_skipFramesIfNoDrawableAvailable && !objc_msgSend_lowLatency(self, a2, v3, v4)
      || objc_msgSend_isDrawableAvailable(self->_backingLayer, a2, v3, v4))
    {
      self->_didTriggerRedrawWhileRendering = 0;
      objc_msgSend_stopIfNeeded(self->_jitterer, a2, v3, v4);
      objc_msgSend__displayLinkStatsTick(self->_renderer, v7, v8, v9);
      objc_msgSend_lock(self, v10, v11, v12);
      objc_msgSend__backingSize(self->_renderer, v13, v14, v15);
      if (v19 == 0.0 || (double v21 = v20, v20 == 0.0))
      {
        objc_msgSend_unlock(self, v16, v17, v18);
      }
      else
      {
        double v22 = v19;
        navigationCameraController = self->_navigationCameraController;
        CFTimeInterval v24 = CACurrentMediaTime();
        objc_msgSend_viewWillDrawAtTime_(navigationCameraController, v25, v26, v27, v24);
        uint64_t v31 = objc_msgSend_lock(self->_renderer, v28, v29, v30);
        uint64_t v32 = (void *)MEMORY[0x1BA9B76E0](v31);
        objc_msgSend_drawableSize(self->_backingLayer, v33, v34, v35);
        if (v22 != v40 || v21 != v39)
        {
          uint64_t v42 = objc_msgSend__engineContext(self->_renderer, v36, v37, v38);
          unsigned int v46 = sub_1B6447B50(v42, v43, v44, v45);
          prof_beginFlameSmallData((uint64_t)"Set drawableSize", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/Views/VFXView.m", 1157, v46 | 0x300000000);
          objc_msgSend_setDrawableSize_(self->_backingLayer, v47, v48, v49, v22, v21);
          prof_endFlame();
        }
        objc_msgSend_lock(self->_world, v36, v37, v38);
        uint64_t v53 = objc_msgSend_worldRef(self->_world, v50, v51, v52);
        uint64_t v61 = sub_1B64B20C4(v53, v54, v55, v56, v57, v58, v59, v60);
        if (v61)
        {
          uint64_t v65 = (void *)sub_1B6355ECC(v61);
          uint64_t v69 = objc_msgSend__engineContext(self->_renderer, v66, v67, v68);
          objc_msgSend_beginTransaction_(v65, v70, v69, v71);
        }
        else
        {
          uint64_t v65 = 0;
        }
        objc_msgSend__beginFrame(self->_renderer, v62, v63, v64);
        uint64_t v75 = objc_msgSend__engineContext(self->_renderer, v72, v73, v74);
        os_signpost_id_t v76 = sub_1B64454CC(v75);
        uint64_t v77 = sub_1B63F2EE0();
        if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v78 = v77;
          if (os_signpost_enabled(v77))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6287000, v78, OS_SIGNPOST_INTERVAL_BEGIN, v76, "RenderFrame (View)", "", buf, 2u);
          }
        }
        CFTimeInterval v82 = CACurrentMediaTime();
        if (a3 != 0.0) {
          CFTimeInterval v82 = a3;
        }
        self->_currentSystemTime = v82;
        objc_msgSend_updateAtTime_(self->_renderer, v79, v80, v81);
        objc_msgSend__render(self->_renderer, v83, v84, v85);
        objc_msgSend__presentFramebuffer(self->_renderer, v86, v87, v88);
        objc_msgSend_endTransaction(v65, v89, v90, v91);
        objc_msgSend_unlock(self->_world, v92, v93, v94);
        v95 = sub_1B63F2EE0();
        if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          id v96 = v95;
          if (os_signpost_enabled(v95))
          {
            *(_WORD *)v119 = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6287000, v96, OS_SIGNPOST_INTERVAL_END, v76, "RenderFrame (View)", "", v119, 2u);
          }
        }
        objc_msgSend_nextFrameTime(self->_renderer, v97, v98, v99);
        double v101 = v100;
        double v102 = CACurrentMediaTime();
        objc_msgSend_unlock(self->_renderer, v103, v104, v105);
        objc_msgSend_viewDidDrawAtTime_(self->_navigationCameraController, v106, v107, v108, self->_currentSystemTime);
        if (objc_msgSend__checkAndUpdateDisplayLinkStateIfNeeded(self, v109, v110, v111))
        {
          double v115 = v101 - v102;
          if (v101 - v102 > 2.0) {
            objc_msgSend_restart(self->_jitterer, v112, v113, v114, v115);
          }
        }
        objc_msgSend_unlock(self, v112, v113, v114, v115);
        objc_msgSend__displayLinkStatsTack(self->_renderer, v116, v117, v118);
      }
    }
  }
}

- (void)_resizeIfNeeded
{
  objc_msgSend_contentScaleFactor(self, a2, v2, v3);
  double v6 = v5;
  objc_msgSend_bounds(self, v7, v8, v9);
  BOOL v15 = self->_boundsSize.width == v14 && self->_boundsSize.height == v13;
  if (!v15 || (float v16 = v6, objc_msgSend__contentsScaleFactor(self->_renderer, v10, v11, v12), v17 != v16))
  {
    objc_msgSend__updateBackingSize(self, v10, v11, v12);
    objc_msgSend__setNeedsDisplay(self, v18, v19, v20);
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VFXView;
  [(VFXView *)&v6 layoutSubviews];
  objc_msgSend__resizeIfNeeded(self, v3, v4, v5);
}

- (void)setPointOfView:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, a4);
  if (v4) {
    objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.75);
  }
  else {
    objc_msgSend_setAnimationDuration_(VFXTransaction, v7, v8, v9, 0.0);
  }
  objc_msgSend_setPointOfView_(self, v10, (uint64_t)a3, v11);

  objc_msgSend_commit(VFXTransaction, v12, v13, v14);
}

- (void)setPointOfView:(id)a3
{
  if ((id)objc_msgSend_pointOfView(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend_cameraWillChange(self->_navigationCameraController, v6, v7, v8);
    objc_msgSend_setPointOfView_(self->_renderer, v9, (uint64_t)a3, v10);
    navigationCameraController = self->_navigationCameraController;
    objc_msgSend_cameraDidChange(navigationCameraController, v11, v12, v13);
  }
}

- (VFXNode)pointOfView
{
  return (VFXNode *)objc_msgSend_pointOfView(self->_renderer, a2, v2, v3);
}

- (CGRect)currentViewport
{
  ((void (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_currentViewport);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPointOfCulling:(id)a3
{
  if ((id)objc_msgSend_pointOfCulling(self, a2, (uint64_t)a3, v3) != a3)
  {
    renderer = self->_renderer;
    objc_msgSend_setPointOfCulling_(renderer, v6, (uint64_t)a3, v7);
  }
}

- (id)pointOfCulling
{
  return (id)objc_msgSend_pointOfCulling(self->_renderer, a2, v2, v3);
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

- (void)setAllowsCameraControl:(BOOL)a3
{
  uint64_t v4 = sub_1B63F3214(1) | a3;
  if (v4 != objc_msgSend_enabled(self->_navigationCameraController, v5, v6, v7))
  {
    navigationCameraController = self->_navigationCameraController;
    objc_msgSend_setEnabled_(navigationCameraController, v8, v4, v9);
  }
}

- (BOOL)allowsCameraControl
{
  return objc_msgSend_enabled(self->_navigationCameraController, a2, v2, v3);
}

- (VFXCameraController)defaultCameraController
{
  uint64_t v4 = objc_msgSend_navigationCameraController(self, a2, v2, v3);

  return (VFXCameraController *)objc_msgSend_cameraController(v4, v5, v6, v7);
}

- (BOOL)wantsExtendedDynamicRange
{
  return (*((unsigned __int8 *)self + 424) >> 2) & 1;
}

- (void)setWantsExtendedDynamicRange:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 424);
  if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 424) = v4 & 0xFB | v5;
    *((unsigned char *)self + 425) &= ~0x20u;
    *((unsigned char *)self + 425) &= ~0x10u;
    objc_msgSend__adjustBackingLayerPixelFormat(self, a2, a3, v3);
  }
}

- (BOOL)wantsHDR
{
  return (*((unsigned __int8 *)self + 424) >> 2) & 1;
}

- (void)setWantsHDR:(BOOL)a3
{
}

- (BOOL)rendersContinuously
{
  return (*((unsigned __int8 *)self + 424) >> 1) & 1;
}

- (void)setRendersContinuously:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 424);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 424) = v4 & 0xFD | v6;
    objc_msgSend_setRendersContinuously_(self->_renderer, a2, a3, v3);
    if ((*((unsigned char *)self + 424) & 2) != 0)
    {
      BOOL v15 = objc_msgSend_displayLink(self, v7, v8, v9);
      objc_msgSend_setPaused_(v15, v16, 0, v17);
    }
    else
    {
      objc_msgSend_nextFrameTime(self->_renderer, v7, v8, v9);
      if (v13 - CACurrentMediaTime() > 2.0)
      {
        jitterer = self->_jitterer;
        objc_msgSend_restart(jitterer, v10, v11, v12);
      }
    }
  }
}

- (float)_flipY:(float)a3
{
  return self->_boundsSize.height - a3;
}

- (double)_viewport
{
  *(void *)&double result = vcvt_hight_f32_f64(0, a1[33]).u64[0];
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  float y = a3.y;
  objc_msgSend__flipY_(self, a2, (uint64_t)a4, v4, a3.x);
  renderer = self->_renderer;

  return (id)MEMORY[0x1F4181798](renderer, sel__hitTest_viewport_options_, a4, v8);
}

- (id)hitTestWithSegmentFromPoint:(VFXView *)self toPoint:(SEL)a2 options:(id)a3
{
  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  renderer = self->_renderer;
  objc_msgSend__viewport(self, a2, (uint64_t)a3, (uint64_t)a4);

  return MEMORY[0x1F4181798](renderer, sel__isNodeInsideFrustum_withPointOfView_viewport_, a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  renderer = self->_renderer;
  objc_msgSend__viewport(self, a2, (uint64_t)a3, v3);

  return (id)MEMORY[0x1F4181798](renderer, sel__nodesInsideFrustumWithPointOfView_viewport_, a3, v6);
}

- (double)projectPoint:(uint64_t)a3
{
  uint64_t v6 = (void *)a1[55];
  objc_msgSend__viewport(a1, a2, a3, a4);
  objc_msgSend__projectPoint_viewport_(v6, v7, v8, v9, a5, v10);
  LODWORD(a5) = v11;
  LODWORD(v12) = HIDWORD(v12);
  objc_msgSend__flipY_(a1, v13, v14, v15, v12);
  return COERCE_DOUBLE(__PAIR64__(v16, LODWORD(a5)));
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  LODWORD(a5) = HIDWORD(a5);
  objc_msgSend__flipY_(a1, a2, a3, a4, a5);
  uint64_t v6 = a1[55];
  objc_msgSend__viewport(a1, v7, v8, v9);

  return MEMORY[0x1F4181798](v6, sel__unprojectPoint_viewport_, v10, v11);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"kVFXViewObservingContext")
  {
    if (objc_msgSend_isEqualToString_(a3, a2, @"background.contents", (uint64_t)a4, a5))
    {
      objc_msgSend__updateOpacity(self, v7, v8, v9);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VFXView;
    -[VFXView observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)_kvoKeysForwardedToRenderer
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"pointOfView", v2, @"loops", @"autoenablesDefaultLighting", @"jitteringEnabled", @"temporalAntialiasingEnabled", @"renderGraph", 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___VFXView;
  id v5 = objc_msgSendSuper2(&v22, sel_keyPathsForValuesAffectingValueForKey_);
  uint64_t v9 = objc_msgSend__kvoKeysForwardedToRenderer(a1, v6, v7, v8);
  if (objc_msgSend_containsObject_(v9, v10, (uint64_t)a3, v11))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, v12, @"renderer.%@", v13, a3);
    uint64_t v18 = objc_msgSend_setWithObject_(v14, v16, v15, v17);
    return (id)objc_msgSend_setByAddingObjectsFromSet_(v18, v19, (uint64_t)v5, v20);
  }
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v6 = objc_msgSend__kvoKeysForwardedToRenderer(a1, a2, (uint64_t)a3, v3);
  if (objc_msgSend_containsObject_(v6, v7, (uint64_t)a3, v8)) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VFXView;
  return objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)setDelegate:(id)a3
{
  objc_msgSend_setDelegate_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXWorldRendererDelegate)delegate
{
  return (VFXWorldRendererDelegate *)objc_msgSend_delegate(self->_renderer, a2, v2, v3);
}

- (void)setEventHandler:(id)a3
{
  objc_msgSend_setNavigationCameraController_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setView_(a3, v6, (uint64_t)self, v7);

  objc_msgSend_setAllowsCameraControl_(self, v8, 1, v9);
}

- (id)eventHandler
{
  return self->_navigationCameraController;
}

- (id)navigationCameraController
{
  return self->_navigationCameraController;
}

- (void)setNavigationCameraController:(id)a3
{
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController != a3)
  {
    objc_msgSend_setDelegate_(navigationCameraController, a2, 0, v3);

    self->_navigationCameraController = (VFXEventHandler *)a3;
    objc_super v10 = objc_msgSend_navigationCameraController(self, v7, v8, v9);
    objc_msgSend_setDelegate_(v10, v11, (uint64_t)self, v12);
    MEMORY[0x1F4181798](self, sel_vfx_updateGestureRecognizers, v13, v14);
  }
}

- (void)eventHandlerWantsRedraw
{
  uint64_t v4 = objc_msgSend_displayLink(self, a2, v2, v3);

  objc_msgSend_setPaused_(v4, v5, 0, v6);
}

- (id)_defaultBackgroundColor
{
  return (id)objc_msgSend_blackColor(MEMORY[0x1E4FB1618], a2, v2, v3);
}

- (void)_backgroundDidChange
{
  objc_msgSend__updateOpacity(self, a2, v2, v3);

  objc_msgSend__adjustBackingLayerPixelFormat(self, v5, v6, v7);
}

- (void)_updateOpacity
{
  id v5 = objc_msgSend_background(self->_world, a2, v2, v3);
  uint64_t v9 = (const void *)objc_msgSend_contents(v5, v6, v7, v8);
  objc_super v10 = (void *)sub_1B64BB4BC(v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v10)
  {
    objc_super v10 = objc_msgSend_backgroundColor(self, v11, v12, v13);
    if (!v10) {
      objc_super v10 = objc_msgSend__defaultBackgroundColor(self, v11, v14, v15);
    }
  }
  char v28 = 0;
  objc_msgSend_vfx_CFXColorIgnoringColorSpace_success_(v10, v11, 0, (uint64_t)&v28);
  LODWORD(v19) = HIDWORD(v16);
  char v20 = *((unsigned char *)self + 424);
  BOOL v22 = *((float *)&v16 + 1) == 1.0 || v28 == 0;
  *((unsigned char *)self + 424) = v20 & 0xFE | v22;
  if (((v20 & 1) == 0) == v22)
  {
    uint64_t v23 = objc_msgSend_layer(self, v16, v17, v18, v19);
    objc_msgSend_setOpaque_(v23, v24, v22, v25);
    objc_msgSend_setOpaque_(self, v26, *((unsigned char *)self + 424) & 1, v27);
  }
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v4 = a3;
  legacyView = self->_legacyView;
  if (legacyView)
  {
    objc_msgSend_setBackgroundColor_(legacyView, a2, (uint64_t)a3, v3);
  }
  else
  {
    backgroundColor = self->_backgroundColor;
    if (backgroundColor != a3)
    {

      self->_backgroundColor = (UIColor *)v4;
    }
    if (!v4) {
      uint64_t v4 = objc_msgSend__defaultBackgroundColor(self, a2, (uint64_t)a3, v3);
    }
    v25.receiver = self;
    v25.super_class = (Class)VFXView;
    [(VFXView *)&v25 setBackgroundColor:v4];
    uint64_t v11 = objc_msgSend_traitCollection(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_world(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B64E7DB0;
    v24[3] = &unk_1E61411B8;
    v24[4] = v11;
    v24[5] = self;
    v24[6] = v4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, 0, v24);
    objc_msgSend__backgroundDidChange(self, v21, v22, v23);
  }
}

- (id)backgroundColor
{
  return self->_backgroundColor;
}

- (void)traitCollectionDidChange:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VFXView;
  -[VFXView traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_);
  uint64_t v8 = objc_msgSend_traitCollection(self, v5, v6, v7);
  if (objc_msgSend_hasDifferentColorAppearanceComparedToTraitCollection_(v8, v9, (uint64_t)a3, v10))
  {
    uint64_t v14 = objc_msgSend_world(self, v11, v12, v13);
    uint64_t v18 = objc_msgSend_worldRef(v14, v15, v16, v17);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B64E7F30;
    v20[3] = &unk_1E6141230;
    v20[4] = v8;
    v20[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, 0, v20);
  }
}

- (BOOL)isOpaque
{
  return *((unsigned char *)self + 424) & 1;
}

- (BOOL)autoenablesDefaultLighting
{
  return objc_msgSend_autoenablesDefaultLighting(self->_renderer, a2, v2, v3);
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  objc_msgSend_setAutoenablesDefaultLighting_(self->_renderer, a2, a3, v3);

  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
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

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  return objc_msgSend_prepareObject_shouldAbortBlock_(self->_renderer, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
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

- (id)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  displayLink = self->_displayLink;
  if (displayLink != a3)
  {

    self->_displayLink = (VFXDisplayLink *)a3;
  }
}

- (void)invalidateDisplayLink
{
  objc_msgSend_invalidate(self->_displayLink, a2, v2, v3);

  self->_displayLink = 0;
}

- (double)_renderThreadPriority
{
  return 0.0;
}

+ (BOOL)displayLinkCallbackShouldReturnImmediately
{
  return 1;
}

+ (BOOL)displayLinkPolicy
{
  return ((uint64_t (*)(id, char *))MEMORY[0x1F4181798])(a1, sel_displayLinkCallbackShouldReturnImmediately);
}

- (void)_createDisplayLinkIfNeeded
{
  if (!self->_legacyView && !self->_displayLink && !self->_displayLinkCreationRequested)
  {
    if (self->_renderer)
    {
      self->_displayLinkCreationRequested = 1;
      objc_initWeak(&location, self);
      uint64_t v6 = objc_msgSend_window(self, v3, v4, v5);
      uint64_t v10 = objc_msgSend_screen(v6, v7, v8, v9);
      uint64_t v11 = objc_opt_class();
      uint64_t v15 = objc_msgSend_displayLinkPolicy(v11, v12, v13, v14);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_1B64E8328;
      v17[3] = &unk_1E61434B8;
      objc_copyWeak(&v18, &location);
      objc_msgSend__initializeDisplayLinkWithScreen_policy_completionHandler_(self, v16, v10, v15, v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  displayLink = self->_displayLink;
  if (!displayLink) {
    return 0;
  }
  if ((*((unsigned char *)self + 424) & 2) != 0 || self->_didTriggerRedrawWhileRendering)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend_eventHandler(self, a2, v2, v3);
    uint64_t v6 = objc_msgSend_wantsRedraw(v8, v9, v10, v11) ^ 1;
    displayLink = self->_displayLink;
  }
  objc_msgSend_nextFrameTime(self->_renderer, a2, v2, v3);

  return MEMORY[0x1F4181798](displayLink, sel_setPaused_nextFrameTimeHint_lastUpdate_, v6, v12);
}

- (int64_t)preferredFramesPerSecond
{
  uint64_t v5 = objc_msgSend_displayLink(self, a2, v2, v3);
  if (v5) {
    objc_msgSend_preferredFrameRate(v5, v6, v7, v8);
  }
  else {
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  }
  return (uint64_t)v9;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  legacyView = self->_legacyView;
  if (!legacyView)
  {
    uint64_t v7 = objc_msgSend_displayLink(self, a2, a3, v3);
    if (v7)
    {
      *(float *)&double v11 = (float)a3;
      objc_msgSend_setPreferredFrameRate_(v7, v8, v9, v10, v11);
    }
    self->_preferredFramePerSeconds = a3;
    uint64_t v12 = objc_msgSend_renderer(self, v8, v9, v10);
    legacyView = objc_msgSend__renderContextMetal(v12, v13, v14, v15);
  }

  objc_msgSend_setPreferredFramesPerSecond_(legacyView, a2, a3, v3);
}

- (void)_setNeedsDisplay
{
  uint64_t v5 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3);
  if (objc_msgSend_isMainThread(v5, v6, v7, v8))
  {
    if ((*((unsigned char *)self + 424) & 0x20) == 0)
    {
      objc_msgSend_stopIfNeeded(self->_jitterer, v9, v10, v11);
      self->_didTriggerRedrawWhileRendering = 1;
      displayLink = self->_displayLink;
      if (displayLink)
      {
        if (objc_msgSend_isPaused(displayLink, v12, v13, v14))
        {
          uint64_t v19 = self->_displayLink;
          objc_msgSend_setNeedsDisplay(v19, v16, v17, v18);
        }
      }
      else
      {
        objc_msgSend__createDisplayLinkIfNeeded(self, v12, v13, v14);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B64E86CC;
    block[3] = &unk_1E61422C0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  uint64_t v4 = objc_msgSend_displayLink(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setPaused_(v4, v5, 0, v6);
}

- (void)_worldDidUpdate:(id)a3
{
  self->_lastUpdate = CACurrentMediaTime();

  objc_msgSend__setNeedsDisplay(self, v4, v5, v6);
}

- (void)setShowsStatistics:(BOOL)a3
{
  uint64_t v4 = sub_1B63F3214(0) | a3;
  objc_msgSend_lock(self->_renderer, v5, v6, v7);
  objc_msgSend_setShowsStatistics_(self->_renderer, v8, v4, v9);
  objc_msgSend_unlock(self->_renderer, v10, v11, v12);

  objc_msgSend__setNeedsDisplay(self, v13, v14, v15);
}

- (BOOL)showsStatistics
{
  return objc_msgSend_showsStatistics(self->_renderer, a2, v2, v3);
}

- (BOOL)showsDebugUI
{
  return objc_msgSend_showsDebugUI(self->_renderer, a2, v2, v3);
}

- (unint64_t)debugUIOptions
{
  return objc_msgSend_debugUIOptions(self->_renderer, a2, v2, v3);
}

- (void)setDebugUIOptions:(unint64_t)a3
{
}

- (id)snapshot
{
  double width = self->_boundsSize.width;
  double height = self->_boundsSize.height;
  objc_msgSend_contentScaleFactor(self, a2, v2, v3);
  double v8 = width * v7;
  objc_msgSend_contentScaleFactor(self, v9, v10, v11);
  renderer = self->_renderer;

  return (id)objc_msgSend_snapshotWithSize_(renderer, v12, v13, v14, v8, height * v15);
}

- (void)lock
{
  objc_msgSend_lock(self->_lock, a2, v2, v3);
}

- (void)unlock
{
  objc_msgSend_unlock(self->_lock, a2, v2, v3);
}

- (CGColorSpace)workingColorSpace
{
  return (CGColorSpace *)((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel_workingColorSpace);
}

- (void)__CFObject
{
  return 0;
}

- (NSString)description
{
  objc_msgSend_frame(self, a2, v2, v3);
  uint64_t v5 = NSStringFromCGRect(v20);
  uint64_t v6 = NSString;
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  uint64_t v12 = objc_msgSend_world(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_pointOfView(self, v13, v14, v15);
  return (NSString *)objc_msgSend_stringWithFormat_(v6, v17, @"<%@: %p | world=%@ frame=%@ pointOfView=%@>", v18, v8, self, v12, v5, v16);
}

- (BOOL)_isEditor
{
  return 0;
}

- (void)switchToCameraNamed:(id)a3
{
  uint64_t v6 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_rootNode(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_childNodeWithName_recursively_(v10, v11, (uint64_t)a3, 1);
  if (v12)
  {
    MEMORY[0x1F4181798](self, sel_setPointOfView_animate_, v12, 1);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: switchToCameraNamed: no camera named %@", v13, v14, v15, v16, v17, v18, (uint64_t)a3);
  }
}

- (void)switchToNextCamera
{
  uint64_t v5 = objc_msgSend_world(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_rootNode(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_childNodesPassingTest_(v9, v10, (uint64_t)&unk_1F0FB5AC8, v11);
  if (objc_msgSend_count(v12, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_pointOfView(self->_renderer, v16, v17, v18);
    uint64_t v22 = objc_msgSend_indexOfObject_(v12, v20, v19, v21);
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t Object = objc_msgSend_firstObject(v12, v23, v24, v25);
    }
    else
    {
      unint64_t v27 = v22 + 1;
      unint64_t v28 = objc_msgSend_count(v12, v23, v24, v25);
      uint64_t Object = objc_msgSend_objectAtIndex_(v12, v29, v27 % v28, v30);
    }
    MEMORY[0x1F4181798](self, sel_setPointOfView_animate_, Object, 1);
  }
}

- (BOOL)_enableARMode
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel__enableARMode);
}

- (void)set_enableARMode:(BOOL)a3
{
}

- (BOOL)_shouldDelegateARCompositing
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel__enableARMode);
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
}

- (void)_updateProbes:(id)a3 progress:(id)a4
{
}

- (void)setDebugOptions:(unint64_t)a3
{
  objc_msgSend_setDebugOptions_(self->_renderer, a2, a3, v3);

  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (unint64_t)debugOptions
{
  return objc_msgSend_debugOptions(self->_renderer, a2, v2, v3);
}

- (BOOL)_showsAuthoringEnvironment
{
  return objc_msgSend__showsAuthoringEnvironment(self->_renderer, a2, v2, v3);
}

- (id)_authoringEnvironment
{
  return (id)objc_msgSend__authoringEnvironment(self->_renderer, a2, v2, v3);
}

- (unint64_t)antialiasingMode
{
  return objc_msgSend_antialiasingMode(self->_renderer, a2, v2, v3);
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  objc_msgSend_setAntialiasingMode_(self->_renderer, a2, a3, v3);

  objc_msgSend__setNeedsDisplay(self, v5, v6, v7);
}

- (float)_runFPSTestWithDuration:(double)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  uint64_t v7 = objc_msgSend__renderingQueue(self->_renderer, a2, v3, v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B64E8C94;
  block[3] = &unk_1E6143500;
  *(double *)&block[6] = a3;
  void block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v7, block);
  LODWORD(a3) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return *(float *)&a3;
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

- (double)contentScaleFactor
{
  v3.receiver = self;
  v3.super_class = (Class)VFXView;
  [(VFXView *)&v3 contentScaleFactor];
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXView;
  [(VFXView *)&v10 setContentScaleFactor:a3];
  if (self->_renderer)
  {
    objc_msgSend__updateBackingSize(self, v4, v5, v6);
    objc_msgSend_setNeedsDisplay(self, v7, v8, v9);
  }
}

- (void)_allowGPUBackgroundExecution
{
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setNeedsDisplay
{
  v6.receiver = self;
  v6.super_class = (Class)VFXView;
  [(VFXView *)&v6 setNeedsDisplay];
  objc_msgSend__setNeedsDisplay(self, v3, v4, v5);
}

- (void)drawRect:(CGRect)a3
{
  if ((*((unsigned char *)self + 424) & 8) == 0)
  {
    objc_super v6 = objc_msgSend__renderingQueue(self->_renderer, a2, v3, v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B64E8EFC;
    block[3] = &unk_1E61422C0;
    void block[4] = self;
    dispatch_sync(v6, block);
  }
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (void)vfx_updateGestureRecognizers
{
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController)
  {
    uint64_t v10 = objc_msgSend_gestureRecognizers(navigationCameraController, v5, v6, v7);
    objc_msgSend_addObjectsFromArray_(v8, v11, v10, v12);
  }

  objc_msgSend_vfx_setGestureRecognizers_(self, v5, (uint64_t)v8, v7);
}

- (void)vfx_setGestureRecognizers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  controllerGestureRecognizers = self->_controllerGestureRecognizers;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(controllerGestureRecognizers, a2, (uint64_t)&v24, (uint64_t)v29, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(controllerGestureRecognizers);
        }
        objc_msgSend_removeGestureRecognizer_(self, v7, *(void *)(*((void *)&v24 + 1) + 8 * i), v8);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(controllerGestureRecognizers, v7, (uint64_t)&v24, (uint64_t)v29, 16);
    }
    while (v9);
  }

  uint64_t v12 = (NSArray *)a3;
  self->_controllerGestureRecognizers = v12;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v28, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addGestureRecognizer_(self, v15, *(void *)(*((void *)&v20 + 1) + 8 * j), v16);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v20, (uint64_t)v28, 16);
    }
    while (v17);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (sub_1B64DF5B8())
  {
    uint64_t v10 = objc_msgSend_hitTest_options_(self, v8, 0, v9, x, y);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v67, (uint64_t)v71, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v68;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v68 != v17) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          long long v20 = objc_msgSend_node(v19, v13, v14, v15);
          long long v24 = objc_msgSend_model(v20, v21, v22, v23);
          unint64_t v28 = objc_msgSend_materials(v24, v25, v26, v27);
          if (objc_msgSend_count(v28, v29, v30, v31))
          {
            uint64_t v35 = objc_msgSend_materials(v24, v32, v33, v34);
            unint64_t v39 = objc_msgSend_geometryIndex(v19, v36, v37, v38);
            uint64_t v43 = objc_msgSend_materials(v24, v40, v41, v42);
            unint64_t v47 = objc_msgSend_count(v43, v44, v45, v46);
            char v50 = objc_msgSend_objectAtIndexedSubscript_(v35, v48, v39 % v47, v49);
            uint64_t v54 = objc_msgSend_diffuse(v50, v51, v52, v53);
          }
          else
          {
            char v50 = 0;
            uint64_t v54 = objc_msgSend_diffuse(0, v32, v33, v34);
          }
          objc_msgSend_contents(v54, v55, v56, v57);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            sub_1B6482478(self);
            v62 = objc_msgSend_diffuse(v50, v59, v60, v61);
            return (id)objc_msgSend_contents(v62, v63, v64, v65);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v67, (uint64_t)v71, 16);
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  v66.receiver = self;
  v66.super_class = (Class)VFXView;
  return -[VFXView hitTest:withEvent:](&v66, sel_hitTest_withEvent_, a4, x, y);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_showsStatistics(self, a2, (uint64_t)a3, (uint64_t)a4)
    || (uint64_t v10 = objc_msgSend_anyObject(a3, v7, v8, v9),
        objc_msgSend_locationInView_(v10, v11, (uint64_t)self, v12),
        double v14 = v13,
        double v16 = v15,
        objc_msgSend_bounds(self, v17, v18, v19),
        double v21 = v20 - v16,
        long long v25 = objc_msgSend__authoringEnvironment(self, v22, v23, v24),
        (objc_msgSend_didTapAtPoint_(v25, v26, v27, v28, v14, v21) & 1) == 0))
  {
    if (objc_msgSend_triggersEnabled(self, v7, v8, v9))
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v31 = objc_msgSend_touchesForView_(a4, v29, (uint64_t)self, v30);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v44, (uint64_t)v48, 16);
      if (v33)
      {
        uint64_t v37 = v33;
        uint64_t v38 = *(void *)v45;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v45 != v38) {
              objc_enumerationMutation(v31);
            }
            uint64_t v40 = *(void *)(*((void *)&v44 + 1) + 8 * v39);
            uint64_t v41 = objc_msgSend_triggerManager(self->_world, v34, v35, v36);
            objc_msgSend_triggerTouch_event_fromView_(v41, v42, @"VFXTriggerTypeMouseDown", v40, self);
            ++v39;
          }
          while (v37 != v39);
          uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v44, (uint64_t)v48, 16);
        }
        while (v37);
      }
    }
    v43.receiver = self;
    v43.super_class = (Class)VFXView;
    [(VFXView *)&v43 touchesBegan:a3 withEvent:a4];
  }
}

- (void)pauseDisplayLink
{
  objc_msgSend_stopIfNeeded(self->_jitterer, a2, v2, v3);
  uint64_t v8 = objc_msgSend_displayLink(self, v5, v6, v7);

  objc_msgSend_setPaused_(v8, v9, 1, v10);
}

- (void)resumeDisplayLink
{
  objc_msgSend__createDisplayLinkIfNeeded(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_displayLink(self, v5, v6, v7);
  BOOL v9 = (*((unsigned char *)self + 424) & 2) == 0;
  objc_msgSend_nextFrameTime(self->_renderer, v10, v11, v12);

  MEMORY[0x1F4181798](v8, sel_setPaused_nextFrameTimeHint_lastUpdate_, v9, v13);
}

- (void)didMoveToWindow
{
  if (objc_msgSend_window(self, a2, v2, v3))
  {
    qword_1EB988708 = (uint64_t)self;
    *((unsigned char *)self + 424) &= ~0x20u;
    objc_msgSend_resumeDisplayLink(self, v5, v6, v7);
    objc_msgSend__setNeedsDisplay(self, v8, v9, v10);
  }
  v23.receiver = self;
  v23.super_class = (Class)VFXView;
  [(VFXView *)&v23 didMoveToWindow];
  if (objc_msgSend_window(self, v11, v12, v13))
  {
    objc_msgSend__adjustBackingLayerPixelFormat(self, v14, v15, v16);
    objc_msgSend__updateBackingSize(self, v17, v18, v19);
    objc_msgSend__interfaceOrientationDidChange(self->_renderer, v20, v21, v22);
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
  {
    sub_1B64824B8(self);
    objc_msgSend_pauseDisplayLink(self, v5, v6, v7);
    *((unsigned char *)self + 424) |= 0x20u;
  }
  v8.receiver = self;
  v8.super_class = (Class)VFXView;
  [(VFXView *)&v8 willMoveToWindow:a3];
}

- (void)_enterForeground:(id)a3
{
  *((unsigned char *)self + 424) &= ~0x80u;
  if (*((unsigned char *)self + 425))
  {
    *((unsigned char *)self + 425) &= ~1u;
    uint64_t v5 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);
    uint64_t v9 = objc_msgSend_clock(v5, v6, v7, v8);
    objc_msgSend_setPaused_(v9, v10, 0, v11);
  }
  id v12 = sub_1B658F4B0(0, a2, (uint64_t)a3, v3);
  if (v12) {
    objc_msgSend_startAndReturnError_(v12, v13, 0, v15);
  }
  if ((*((unsigned char *)self + 424) & 0x20) == 0) {
    objc_msgSend_resumeDisplayLink(self, v13, v14, v15);
  }
  uint64_t v16 = objc_msgSend_world(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_worldRef(v16, v17, v18, v19);
  if (v20) {
    uint64_t v20 = sub_1B64B2054(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  MEMORY[0x1F4181798](v20, sel_enterForeground, v22, v23);
}

- (void)_flushDisplayLink
{
  uint64_t v5 = objc_msgSend_displayLink(self, a2, v2, v3);
  if ((int)objc_msgSend_queuedFrameCount(v5, v6, v7, v8) >= 1)
  {
    unsigned int v9 = 0;
    do
    {
      usleep(0x2710u);
      unsigned int v10 = v9 + 1;
      uint64_t v14 = objc_msgSend_displayLink(self, v11, v12, v13);
      if ((int)objc_msgSend_queuedFrameCount(v14, v15, v16, v17) < 1) {
        break;
      }
    }
    while (v9++ < 0x12B);
    if (v10 == 300)
    {
      sub_1B63F2F54(16, @"Error: display link thread seems stuck", v18, v19, v20, v21, v22, v23, v26);
    }
  }
}

- (void)_enterBackground:(id)a3
{
  *((unsigned char *)self + 424) |= 0x80u;
  uint64_t v5 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  unsigned int v9 = objc_msgSend_clock(v5, v6, v7, v8);
  if ((objc_msgSend_isPaused(v9, v10, v11, v12) & 1) == 0)
  {
    *((unsigned char *)self + 425) |= 1u;
    uint64_t v16 = objc_msgSend_world(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_clock(v16, v17, v18, v19);
    objc_msgSend_setPaused_(v20, v21, 1, v22);
  }
  objc_msgSend_pauseDisplayLink(self, v13, v14, v15);
  id v26 = sub_1B658F4B0(0, v23, v24, v25);
  if (v26) {
    objc_msgSend_pause(v26, v27, v28, v29);
  }
  uint64_t v30 = objc_msgSend_world(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_worldRef(v30, v31, v32, v33);
  if (v34) {
    uint64_t v42 = sub_1B64B2054(v34, (uint64_t)v35, v36, v37, v38, v39, v40, v41);
  }
  else {
    uint64_t v42 = 0;
  }
  objc_msgSend__flushDisplayLink(self, v35, v36, v37);

  MEMORY[0x1F4181798](v42, sel_enterBackground, v43, v44);
}

- (void)safeAreaInsetsDidChange
{
  v16.receiver = self;
  v16.super_class = (Class)VFXView;
  [(VFXView *)&v16 safeAreaInsetsDidChange];
  objc_msgSend_safeAreaInsets(self, v3, v4, v5);
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  objc_msgSend_set_drawableSafeAreaInsets_(self->_renderer, v10, v11, v12, *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).i64);
  objc_msgSend__interfaceOrientationDidChange(self->_renderer, v13, v14, v15);
}

+ (id)_currentVFXViewFocusEnvironment
{
  return (id)qword_1EB988708;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)VFXView;
  id v8 = -[VFXView focusItemsInRect:](&v27, sel_focusItemsInRect_);
  if (objc_msgSend_count(v8, v9, v10, v11)) {
    id v15 = (id)objc_msgSend_mutableCopy(v8, v12, v13, v14);
  }
  else {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v19 = v15;
  uint64_t v20 = objc_msgSend_world(self, v16, v17, v18);
  uint64_t v24 = objc_msgSend_rootNode(v20, v21, v22, v23);
  objc_msgSend__appendFocusableNodesInRect_ofView_toFocusItems_(v24, v25, (uint64_t)self, (uint64_t)v19, x, y, width, height);
  return v19;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
}

- (void)setRenderGraph:(id)a3
{
  objc_msgSend_setRenderGraph_(self->_renderer, a2, (uint64_t)a3, v3);
}

- (VFXRenderGraph)renderGraph
{
  return (VFXRenderGraph *)objc_msgSend_renderGraph(self->_renderer, a2, v2, v3);
}

- (BOOL)triggersEnabled
{
  return ((uint64_t (*)(VFXRenderer *, char *))MEMORY[0x1F4181798])(self->_renderer, sel__triggersEnabled);
}

- (void)setTriggersEnabled:(BOOL)a3
{
}

- (id)setupLegacyView
{
  uint64_t v3 = [_TtC3VFX13VFXViewLegacy alloc];
  objc_msgSend_bounds(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_initWithFrame_(v3, v7, v8, v9);
  objc_msgSend_addSubview_(self, v11, (uint64_t)v10, v12);
  objc_msgSend_setAutoresizingMask_(v10, v13, 18, v14);
  uint64_t v18 = objc_msgSend_backgroundColor(self, v15, v16, v17);
  objc_msgSend_setBackgroundColor_(v10, v19, v18, v20);
  v32.receiver = self;
  v32.super_class = (Class)VFXView;
  [(VFXView *)&v32 setBackgroundColor:0];
  objc_msgSend_set_legacyView_(self, v21, (uint64_t)v10, v22);
  if (objc_msgSend_lowLatency(self, v23, v24, v25)) {
    objc_msgSend_setLowLatency_(v10, v26, 1, v27);
  }

  return (id)objc_msgSend__legacyView(self, v28, v29, v30);
}

- (id)legacyView
{
  id result = (id)objc_msgSend__legacyView(self, a2, v2, v3);
  if (!result)
  {
    return (id)MEMORY[0x1F4181798](self, sel_setupLegacyView, v6, v7);
  }
  return result;
}

- (id)scene
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return (id)objc_msgSend_scene(v4, v5, v6, v7);
}

- (void)setScene:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);

  objc_msgSend_setScene_(v5, v6, (uint64_t)a3, v7);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return (MTLCommandQueue *)objc_msgSend_commandQueue(v4, v5, v6, v7);
}

- (id)postRenderCallback
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return (id)MEMORY[0x1F4181798](v4, sel_postRenderCallback, v5, v6);
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setPostRenderCallback_, a3, v6);
}

- (void)renderWithCompletion:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_renderWithCompletion_, a3, v6);
}

- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  uint64_t v6 = objc_msgSend_legacyView(self, a2, a3, (uint64_t)a4);

  MEMORY[0x1F4181798](v6, sel_renderWithPresentWithTransaction_completion_, v5, a4);
}

- (id)effect
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return (id)MEMORY[0x1F4181798](v4, sel_effect, v5, v6);
}

- (void)setEffect:(id)a3
{
  uint64_t v5 = objc_msgSend_legacyView(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setEffect_, a3, v6);
}

- (unsigned)resizingMode
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_resizingMode, v5, v6);
}

- (void)setResizingMode:(unsigned __int8)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_msgSend_legacyView(self, a2, a3, v3);

  MEMORY[0x1F4181798](v5, sel_setResizingMode_, v4, v6);
}

- (double)scaleFactor
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  MEMORY[0x1F4181798](v4, sel_scaleFactor, v5, v6);
  return result;
}

- (void)setScaleFactor:(double)a3
{
  uint64_t v5 = objc_msgSend_legacyView(self, a2, v3, v4);

  MEMORY[0x1F4181798](v5, sel_setScaleFactor_, v6, v7);
}

- (BOOL)framebufferOnly
{
  uint64_t v4 = objc_msgSend_legacyView(self, a2, v2, v3);

  return objc_msgSend_framebufferOnly(v4, v5, v6, v7);
}

- (void)setFramebufferOnly:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_legacyView(self, a2, a3, v3);

  objc_msgSend_setFramebufferOnly_(v5, v6, v4, v7);
}

@end