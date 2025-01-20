@interface VFXHolographicRenderer
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_wantsWorldRendererDelegationMessages;
- (BOOL)additiveWritesToAlpha;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)rawQuilt;
- (BOOL)showsStatistics;
- (CGColorSpace)workingColorSpace;
- (CGRect)currentViewport;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (VFXHolographicRenderer)init;
- (VFXHolographicRenderer)initWithDevice:(id)a3 options:(id)a4;
- (VFXNode)audioListener;
- (VFXNode)pointOfView;
- (VFXRenderer)renderer;
- (VFXWorld)world;
- (VFXWorldRendererDelegate)delegate;
- (double)projectPoint:(uint64_t)a3;
- (id)_commandBufferStatusMonitor;
- (id)_resourceManagerMonitor;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)session;
- (uint64_t)unprojectPoint:(uint64_t)a3;
- (unint64_t)antialiasingMode;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)stencilPixelFormat;
- (void)dealloc;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAudioListener:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setPointOfView:(id)a3;
- (void)setRawQuilt:(BOOL)a3;
- (void)setRenderer:(id)a3;
- (void)setSession:(id)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setWorld:(id)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_wantsWorldRendererDelegationMessages:(BOOL)a3;
- (void)updateAtTime:(double)a3;
@end

@implementation VFXHolographicRenderer

- (VFXHolographicRenderer)init
{
  return (VFXHolographicRenderer *)MEMORY[0x1F4181798](self, sel_initWithDevice_options_, 0, 0);
}

- (VFXHolographicRenderer)initWithDevice:(id)a3 options:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VFXHolographicRenderer;
  v8 = [(VFXHolographicRenderer *)&v22 init];
  if (v8)
  {
    if (a3 || (a3 = (id)objc_msgSend_deviceForOptions_(VFXView, v6, (uint64_t)a4, v7)) != 0)
    {
      if (!objc_msgSend_objectForKeyedSubscript_(a4, v6, @"maxInFlightFrameCount", v7))
      {
        if (a4) {
          v12 = objc_msgSend_mutableCopy(a4, v9, v10, v11);
        }
        else {
          v12 = objc_msgSend_mutableCopy(MEMORY[0x1E4F1CC08], v9, v10, v11);
        }
        a4 = v12;
        objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)&unk_1F103BB28, @"maxInFlightFrameCount");
      }
      v14 = [VFXRenderer alloc];
      isPrivateRenderer_privateRendererOwner_clearsOnDraw = (VFXRenderer *)objc_msgSend__initWithDevice_options_isPrivateRenderer_privateRendererOwner_clearsOnDraw_(v14, v15, (uint64_t)a3, (uint64_t)a4, 1, v8, 0);
      v8->_renderer = isPrivateRenderer_privateRendererOwner_clearsOnDraw;
      objc_msgSend_setRendererKind_(isPrivateRenderer_privateRendererOwner_clearsOnDraw, v17, 2, v18);
      objc_msgSend_setShouldLoadFinalTexture_(v8->_renderer, v19, 1, v20);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXHolographicRenderer;
  [(VFXHolographicRenderer *)&v3 dealloc];
}

- (void)updateAtTime:(double)a3
{
  objc_msgSend_updateAtTime_(self->_renderer, a2, v3, v4, a3);
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
  objc_msgSend__viewport(*(void **)(a1 + 24), a2, a3, a4);
  objc_msgSend__projectPoint_viewport_(*(void **)(a1 + 24), v6, v7, v8, a5, v9, *(void *)&v9, v10);
  LODWORD(v12) = v11;
  *((float *)&v12 + 1) = v15 - v13;
  return v12;
}

- (uint64_t)unprojectPoint:(uint64_t)a3
{
  objc_msgSend__viewport(*(void **)(a1 + 24), a2, a3, a4);
  uint64_t v7 = *(void *)(a1 + 24);

  return MEMORY[0x1F4181798](v7, sel__unprojectPoint_viewport_, v5, v6);
}

- (VFXNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
  id v5 = a3;

  self->_pointOfView = (VFXNode *)a3;
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

- (unint64_t)antialiasingMode
{
  return objc_msgSend_antialiasingMode(self->_renderer, a2, v2, v3);
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  objc_msgSend_setAntialiasingMode_(self->_renderer, a2, a3, v3);
}

- (VFXRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (id)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)rawQuilt
{
  return self->_rawQuilt;
}

- (void)setRawQuilt:(BOOL)a3
{
  self->_rawQuilt = a3;
}

@end