@interface VFXMTLRenderContext
+ (void)registerBindings;
- (BOOL)canRecycleParticleBuffers;
- (BOOL)collectsCompilationErrors;
- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6;
- (BOOL)depthOnly;
- (BOOL)enableARMode;
- (BOOL)forceAsyncShaderCompilation;
- (BOOL)isDrawingBlur;
- (BOOL)isLayeredRendering;
- (BOOL)isOpaque;
- (BOOL)mapVolatileMesh:(__CFXMesh *)a3 verticesCount:(int64_t)a4;
- (BOOL)outputsNormal;
- (BOOL)renderInGBuffer;
- (BOOL)requireLoadFinalTexture;
- (BOOL)shouldDelegateARCompositing;
- (BOOL)shouldPresentAfterMinimumDuration;
- (BOOL)showsAuthoringEnvironment;
- (BOOL)simulateCommandBufferFailure;
- (BOOL)supportsMTLFeatureSet:(unint64_t)a3;
- (BOOL)wantsWideGamut;
- (CAMetalLayer)layerTarget;
- (CFXVFXRenderTargetInfo)renderTargetInfo;
- (MTLCommandBuffer)clientCommandBuffer;
- (MTLCommandBuffer)currentCommandBuffer;
- (MTLCommandBuffer)resourceCommandBuffer;
- (MTLCommandQueue)clientCommandQueue;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)clientRenderCommandEncoder;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)clientRenderPassDescriptor;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (MTLTexture)textureTarget;
- (NSMutableDictionary)compilationErrors;
- (NSString)generatedTexturePath;
- (OS_dispatch_group)resourceGroup;
- (OS_dispatch_queue)resourceQueue;
- (VFXMTLBlitCommandEncoder)resourceBlitEncoder;
- (VFXMTLComputeCommandEncoder)resourceComputeEncoder;
- (VFXMTLRenderContext)initWithDevice:(id)a3 engineContext:(__CFXEngineContext *)a4;
- (VFXMTLRenderContextCommandBufferStatusMonitor)commandBufferStatusMonitor;
- (VFXMTLRenderContextResourceManagerMonitor)resourceManagerMonitor;
- (VFXMTLResourceManager)resourceManager;
- (VFXTextureAttachmentProvider)attachmentProvider;
- (__CFXEngineContext)engineContext;
- (__CFXEngineStats)stats;
- (__CFXMaterial)getCurrentPassMaterial;
- (__CFXMeshElement)createVolatileMeshElementOfType:(VFXMTLRenderContext *)self primitiveCount:(unsigned int)a2 bytesPerIndex:;
- (__n128)screenTransform;
- (__n128)setScreenTransform:(__n128)a3;
- (const)constantData:(int)a3;
- (double)renderSize;
- (float)_zFarForSkyboxRenderingProjectionMatrix:(id *)a3 defaultZFar:(float)result;
- (float)renderTime;
- (float)superSamplingFactor;
- (id).cxx_construct;
- (id)_finalRenderTexture;
- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3;
- (id)_reflectionProbeArrayTexture;
- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6;
- (id)irradianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3;
- (id)radianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3;
- (id)sampler:(int)a3 :(id)a4;
- (id)texture:(int)a3 :(id)a4;
- (id)textureForMaterialProperty:(__CFXMaterialProperty *)a3;
- (int)profile;
- (int64_t)currentFrameIndex;
- (int64_t)pendingGPUFrameCount;
- (int64_t)preferredFramesPerSecond;
- (int64_t)renderMode;
- (int64_t)sampleCount;
- (uint64_t)drawWireframeOverlayForElements:(unint64_t)a3 range:(uint64_t)a4 store:(int)a5 passInstance:(uint64_t)a6;
- (uint64_t)unmapVolatileMeshElement:(uint64_t)a3;
- (unint64_t)cubeArrayTypeIfSupported;
- (unint64_t)debugOptions;
- (unint64_t)getCurrentPassHash;
- (unsigned)features;
- (void)_VFXWorldRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(id)a3 commandBuffer:(id)a4 renderPassDescriptor:(id)a5;
- (void)_allowGPUBackgroundExecution;
- (void)_clearRenderCaches;
- (void)_clearUnusedBindingPoints;
- (void)_clusterInfo;
- (void)_createResourceCommandBufferIfNeeded;
- (void)_drawFullScreenTexture:(id)a3;
- (void)_drawMeshElement:(id)a3 instanceCount:(unint64_t)a4;
- (void)_drawPBRTextures;
- (void)_drawPatchForMeshElement:(id)a3 instanceCount:(unint64_t)a4;
- (void)_drawShadowMaps;
- (void)_executeDrawCommand:(id *)a3;
- (void)_logLightingInformation;
- (void)_prepareMaterialTextures:(__CFXMaterial *)a3;
- (void)_recycleMTLBufferToPool:(id)a3;
- (void)_reduceStatsOfConstantBuffer:(id)a3;
- (void)_setMeshBuffers:(id)a3;
- (void)_setReflectionProbeArrayTexture:(id)a3;
- (void)_setWorldBufferAtVertexIndex:(int64_t)a3 fragmentIndex:(int64_t)a4;
- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(id *)a3;
- (void)addCommandBufferCompletedHandler:(id)a3;
- (void)addCommandBufferScheduledHandler:(id)a3;
- (void)addDrawablePresentedHandler:(id)a3;
- (void)beginFrame:(id)a3;
- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4;
- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4 parameters:(id)a5;
- (void)captureNextFrame;
- (void)dealloc;
- (void)drawFullScreenQuadForPass:(__CFXFXPass *)a3;
- (void)drawRenderElement:(__CFXRendererElement *)a3 withPass:(__CFXFXPass *)a4;
- (void)endFrameWaitingUntilCompleted:(BOOL)a3 status:(unint64_t *)a4 error:(id *)a5;
- (void)endFrameWorldSpecifics;
- (void)endRenderPass;
- (void)frameConstantBufferPool;
- (void)frameTexturePool;
- (void)popDebugGroup;
- (void)processRendererElements:(id *)a3 count:(unsigned int)a4 engineIterationContext:(id *)a5;
- (void)pushDebugGroup:(id)a3;
- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:(uint64_t)a5;
- (void)renderEncoder;
- (void)renderMesh:(__n128)a3 meshElement:(__n128)a4 withProgram:(__n128)a5 engineContext:(uint64_t)a6 transform:(uint64_t)a7 color:(uint64_t)a8 rasterizerStates:(uint64_t)a9 blendState:(uint64_t)a10 texture:(long long *)a11 depthBias:(uint64_t)a12;
- (void)renderVideoBackground:(__CFXImageProxy *)a3 engineContext:(__CFXEngineContext *)a4 materialProperty:(__CFXMaterialProperty *)a5;
- (void)resetVolatileMeshElements;
- (void)resetVolatileMeshes;
- (void)setAttachmentProvider:(id)a3;
- (void)setCanRecycleParticleBuffers:(BOOL)a3;
- (void)setClientCommandBuffer:(id)a3;
- (void)setClientCommandQueue:(id)a3;
- (void)setClientRenderCommandEncoder:(id)a3;
- (void)setClientRenderPassDescriptor:(id)a3;
- (void)setCollectsCompilationErrors:(BOOL)a3;
- (void)setCommandBufferStatusMonitor:(id)a3;
- (void)setCurrentPassHash:(unint64_t)a3;
- (void)setCurrentPassMaterial:(__CFXMaterial *)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setEnableARMode:(BOOL)a3;
- (void)setForceAsyncShaderCompilation:(BOOL)a3;
- (void)setGeneratedTexturePath:(id)a3;
- (void)setIsOpaque:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRasterizerStates:(__CFXRasterizerStates *)a3;
- (void)setRenderPassParameters:(id)a3;
- (void)setRequireLoadFinalTexture:(BOOL)a3;
- (void)setResourceManagerMonitor:(id)a3;
- (void)setSampleCount:(int64_t)a3;
- (void)setShouldDelegateARCompositing:(BOOL)a3;
- (void)setShouldPresentAfterMinimumDuration:(BOOL)a3;
- (void)setShowsAuthoringEnvironment:(BOOL)a3;
- (void)setSimulateCommandBufferFailure:(BOOL)a3;
- (void)setSuperSamplingFactor:(float)a3;
- (void)setWantsWideGamut:(BOOL)a3;
- (void)startProcessingRendererElementsWithEngineIterationContext:(id *)a3;
- (void)stopProcessingRendererElements:(BOOL)a3;
- (void)unmapVolatileMesh:(__CFXMesh *)a3 modifiedVerticesCount:(int64_t)a4;
- (void)viewports:(const void *)a3 :(int64_t *)a4;
- (void)writeBytes:(const void *)a3 length:(unint64_t)a4;
@end

@implementation VFXMTLRenderContext

- (void)_reduceStatsOfConstantBuffer:(id)a3
{
  --self->__engineStats->cboCount;
  self->__engineStats->cboMemory -= objc_msgSend_length(a3, a2, (uint64_t)a3, v3);
}

- (VFXMTLRenderContext)initWithDevice:(id)a3 engineContext:(__CFXEngineContext *)a4
{
  if (!a3)
  {
    v63 = @"Error: VFXMTLRenderContext initWithDevice : device should not be nil";
LABEL_36:
    sub_1B63F2F54(16, (uint64_t)v63, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v65);
    return 0;
  }
  v66.receiver = self;
  v66.super_class = (Class)VFXMTLRenderContext;
  v10 = [(VFXMTLRenderContext *)&v66 init];
  v11 = v10;
  if (v10)
  {
    v10->_device = (MTLDevice *)a3;
    if (sub_1B63CC5CC()) {
      goto LABEL_6;
    }
    v15 = (MTLCommandQueue *)objc_msgSend_newCommandQueue(a3, v12, v13, v14);
    v11->_ownedCommandQueue = v15;
    if (v15)
    {
      objc_msgSend_setLabel_(v15, v16, @"com.apple.vfx", (uint64_t)a4);
LABEL_6:
      v11->_isValidationEnabled = MTLValidationEnabled();
      v11->_superSamplingFactor = 1.0;
      *(_OWORD *)&v11->_anon_20[4] = VFXMatrix4Identity;
      *(_OWORD *)&v11->_anon_20[20] = unk_1B6E51E70;
      *(_OWORD *)&v11->_anon_20[36] = xmmword_1B6E51E80;
      *(_OWORD *)&v11->_anon_20[52] = unk_1B6E51E90;
      v11->_needSuperSampling = 0;
      v11->_engineContext = a4;
      int v17 = v11->_features | 3;
      v11->_profile = 0;
      v11->_features = v17;
      if (j__objc_msgSend_supportsMSAADepthResolve(v11->_device, v18, v19, v20)) {
        v11->_features |= 4u;
      }
      if (j__objc_msgSend_supportsMSAAStencilResolve(v11->_device, v21, v22, v23)) {
        v11->_features |= 0x4000u;
      }
      if (j__objc_msgSend_supportsNonUniformThreadgroupSize(v11->_device, v24, v25, v26)) {
        v11->_features |= 0x40u;
      }
      if (sub_1B62C91B0()) {
        v11->_features |= 8u;
      }
      if (j__objc_msgSend_supportsLayeredRendering(v11->_device, v27, v28, v29)) {
        v11->_features |= 0x20u;
      }
      if (sub_1B64D96B4(v11->_device, v30, v31, v32)) {
        v11->_features |= 0x80u;
      }
      if (sub_1B64D9848((uint64_t)v11->_device, v33, v34, v35)) {
        v11->_features |= 0x2000u;
      }
      if (j__objc_msgSend_supportsTessellation(v11->_device, v36, v37, v38)) {
        v11->_features |= 0x10u;
      }
      if (j__objc_msgSend_supportsTextureCubeArray(v11->_device, v39, v40, v41)) {
        v11->_features |= 0x100u;
      }
      if (j__objc_msgSend_supportsReadWriteTextureCubeArguments(v11->_device, v42, v43, v44)) {
        v11->_features |= 0x200u;
      }
      if (j__objc_msgSend_supportsBaseVertexInstanceDrawing(v11->_device, v45, v46, v47)) {
        v11->_features |= 0x400u;
      }
      if (j__objc_msgSend_supportsProgrammableBlending(v11->_device, v48, v49, v50)) {
        v11->_features |= 0x800u;
      }
      if (j__objc_msgSend_supportsDepthClipMode(v11->_device, v51, v52, v53)) {
        v11->_features |= 0x1000u;
      }
      if (j__objc_msgSend_supportsTextureSwizzle(v11->_device, v54, v55, v56)) {
        v11->_features |= 0x8000u;
      }
      v11->_resourceManager = (VFXMTLResourceManager *)sub_1B653A10C((uint64_t)VFXMTLResourceManager, (uint64_t)a3);
      v11->_resourceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.vfx.resourceCPUQueue", 0);
      v11->_resourceGroup = (OS_dispatch_group *)dispatch_group_create();
      v11->__engineStats = (__CFXEngineStats *)malloc_type_calloc(0x358uLL, 1uLL, 0x6DFE3DAFuLL);
      v11->_currentStreamBufferIndices = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
      int v62 = sub_1B6446934((uint64_t)v11->_engineContext, @"maxInFlightFrameCount", 3, v57, v58, v59, v60, v61);
      v11->_maxInFlightFrameCount = v62;
      v11->_inFlightSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(v62);
      operator new[]();
    }
    v63 = @"Error: VFXMTLRenderContext initWithDevice : cannot create a command queue. Bailing out.";
    goto LABEL_36;
  }
  return v11;
}

- (void)dealloc
{
  objc_msgSend_setGeneratedTexturePath_(self, v3, 0, v4);
  objc_msgSend_setClientCommandBuffer_(self, v5, 0, v6);
  objc_msgSend_setClientRenderPassDescriptor_(self, v7, 0, v8);
  objc_msgSend_setClientRenderCommandEncoder_(self, v9, 0, v10);
  objc_msgSend_setClientCommandQueue_(self, v11, 0, v12);
  dispatch_release((dispatch_object_t)self->_resourceQueue);
  dispatch_release((dispatch_object_t)self->_resourceGroup);
  dispatch_release((dispatch_object_t)self->_inFlightSemaphore);
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v14 = (char *)self + i * 8;
    v15 = self->_background2DProgram[i];
    if (v15)
    {
      CFRelease(v15);
      *((void *)v14 + 52) = 0;
    }
    v16 = (const void *)*((void *)v14 + 55);
    if (v16)
    {
      CFRelease(v16);
      *((void *)v14 + 55) = 0;
    }
  }
  backgroundVideoProgram = self->_backgroundVideoProgram;
  if (backgroundVideoProgram)
  {
    CFRelease(backgroundVideoProgram);
    self->_backgroundVideoProgram = 0;
  }
  backgroundVideoAlpha0Program = self->_backgroundVideoAlpha0Program;
  if (backgroundVideoAlpha0Program)
  {
    CFRelease(backgroundVideoAlpha0Program);
    self->_backgroundVideoAlpha0Program = 0;
  }
  sub_1B64516BC(self->_backgroundRasterizerStates);

  if (self->_maxInFlightFrameCount >= 1)
  {
    int64_t v19 = 0;
    do
    {
      if (self->_constantBufferPools[v19])
      {
        uint64_t v20 = sub_1B649F14C();
        MEMORY[0x1BA9B6D80](v20, 0x10B0C4030928402);
      }
      if (self->_volatileBufferPools[v19])
      {
        uint64_t v21 = sub_1B649F14C();
        MEMORY[0x1BA9B6D80](v21, 0x10B0C4030928402);
      }
      ++v19;
    }
    while (v19 < self->_maxInFlightFrameCount);
  }
  constantBufferPools = self->_constantBufferPools;
  if (constantBufferPools) {
    MEMORY[0x1BA9B6D60](constantBufferPools, 0x20C8093837F09);
  }
  volatileBufferPools = self->_volatileBufferPools;
  if (volatileBufferPools) {
    MEMORY[0x1BA9B6D60](volatileBufferPools, 0x20C8093837F09);
  }
  if (self->_frameTexturePool)
  {
    uint64_t v24 = sub_1B650EC14();
    MEMORY[0x1BA9B6D80](v24, 0x10A0C400A278675);
  }
  renderEncoder = self->_renderEncoder;
  if (renderEncoder)
  {

    MEMORY[0x1BA9B6D80](renderEncoder, 0x10A0C40F855BF67);
  }

  free(self->__engineStats);
  v26.receiver = self;
  v26.super_class = (Class)VFXMTLRenderContext;
  [(VFXMTLRenderContext *)&v26 dealloc];
}

- (MTLDevice)device
{
  return self->_device;
}

- (__CFXEngineContext)engineContext
{
  return self->_engineContext;
}

- (MTLCommandQueue)commandQueue
{
  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
  {
    return (MTLCommandQueue *)objc_msgSend_commandQueue(clientCommandBuffer, a2, v2, v3);
  }
  else if (objc_msgSend_clientCommandQueue(self, a2, v2, v3))
  {
    return self->_clientCommandQueue;
  }
  else
  {
    result = self->_ownedCommandQueue;
    if (!result)
    {
      resourceManager = self->_resourceManager;
      return (MTLCommandQueue *)sub_1B653EFC4((uint64_t)resourceManager);
    }
  }
  return result;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = objc_msgSend_mainScreen(MEMORY[0x1E4FB1BA8], a2, 0, v3);
    a3 = objc_msgSend_maximumFramesPerSecond(v5, v6, v7, v8);
    if (!a3)
    {
      sub_1B63F2F54(16, @"Unreachable code: setPreferredFramesPerSecond - no screen", 0, v9, v10, v11, v12, v13, v14);
      a3 = 120;
    }
  }
  self->_targetedFrameInterval = 1.0 / (float)a3;
}

- (int64_t)preferredFramesPerSecond
{
  float targetedFrameInterval = self->_targetedFrameInterval;
  if (targetedFrameInterval == 0.0) {
    return 0;
  }
  else {
    return (uint64_t)(float)(1.0 / targetedFrameInterval);
  }
}

- (void)frameConstantBufferPool
{
  return self->_frameConstantBufferPool;
}

- (__n128)setScreenTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (__n128)screenTransform
{
  return a1[2];
}

- (unsigned)features
{
  return self->_features;
}

- (int)profile
{
  return self->_profile;
}

- (BOOL)supportsMTLFeatureSet:(unint64_t)a3
{
  return objc_msgSend_supportsFeatureSet_(self->_device, a2, a3, v3);
}

- (void)setWantsWideGamut:(BOOL)a3
{
  char v8 = *((unsigned char *)self + 152);
  if (((((v8 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 152) = v8 & 0xFE | a3;
    uint64_t v9 = (const void *)sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
    sub_1B6595A0C(@"kCFXNotificationEngineContextInvalidatePasses", v9, 0, 1u);
  }
}

- (BOOL)wantsWideGamut
{
  return *((unsigned char *)self + 152) & 1;
}

- (int64_t)pendingGPUFrameCount
{
  return (int)atomic_load((unsigned int *)&self->_pendingGPUFrameCount);
}

- (void)setEnableARMode:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 152);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 152) = v3 & 0xFB | v4;
  }
}

- (BOOL)enableARMode
{
  return (*((unsigned __int8 *)self + 152) >> 2) & 1;
}

- (void)setShouldDelegateARCompositing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 152);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 152) = v3 & 0xF7 | v4;
  }
}

- (BOOL)shouldDelegateARCompositing
{
  return (*((unsigned __int8 *)self + 152) >> 3) & 1;
}

- (void)setIsOpaque:(BOOL)a3
{
  char v8 = *((unsigned char *)self + 152);
  if (((((v8 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)self + 152) = v8 & 0xFD | v9;
    uint64_t v10 = (const void *)sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
    sub_1B6595A0C(@"kCFXNotificationEngineContextInvalidatePasses", v10, 0, 1u);
  }
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = sub_1B64D97B8(self->_device, (const char *)a3, a3, v3);
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (BOOL)isOpaque
{
  return (*((unsigned __int8 *)self + 152) >> 1) & 1;
}

- (void)_clearUnusedBindingPoints
{
  uint64_t v3 = *(_DWORD **)&self->_anon_4730[128];
  if (v3)
  {
    objc_msgSend_pushDebugGroup_(self->_renderEncoder->var3, a2, @"Clear binding points", v2);
    __int16 v8 = 0;
    for (uint64_t i = 0; i != 31; ++i)
    {
      renderEncoder = self->_renderEncoder;
      if ((v3[30] & (1 << i)) != 0) {
        __int16 v11 = 255;
      }
      else {
        __int16 v11 = i;
      }
      if ((v3[31] & (1 << i)) != 0) {
        __int16 v12 = -256;
      }
      else {
        __int16 v12 = v8;
      }
      if ((_BYTE)v11 != 0xFF) {
        objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v5, 0, 0, (char)v11);
      }
      if ((~((unsigned __int16)v12 | (unsigned __int16)v11) & 0xFF00) != 0) {
        objc_msgSend_setFragmentBuffer_offset_atIndex_(renderEncoder->var3, v5, 0, 0, (uint64_t)(__int16)(v12 | v11) >> 8);
      }
      v8 += 256;
    }
    __int16 v13 = 0;
    for (uint64_t j = 0; j != 31; ++j)
    {
      v15 = self->_renderEncoder;
      if ((v3[32] & (1 << j)) != 0) {
        __int16 v16 = 255;
      }
      else {
        __int16 v16 = j;
      }
      if ((v3[33] & (1 << j)) != 0) {
        __int16 v17 = -256;
      }
      else {
        __int16 v17 = v13;
      }
      if ((_BYTE)v16 != 0xFF)
      {
        uint64_t v20 = 0;
        sub_1B64D95D4((__IOSurface *)v15->var2, (const char *)&v20, 1, v7);
        objc_msgSend_setVertexTexture_atIndex_(v15->var3, v18, v20, (char)v16);
      }
      if ((~((unsigned __int16)v17 | (unsigned __int16)v16) & 0xFF00) != 0)
      {
        uint64_t v20 = 0;
        sub_1B64D95D4((__IOSurface *)v15->var2, (const char *)&v20, 1, v7);
        objc_msgSend_setFragmentTexture_atIndex_(v15->var3, v19, v20, (uint64_t)(__int16)(v17 | v16) >> 8);
      }
      v13 += 256;
    }
    objc_msgSend_popDebugGroup(self->_renderEncoder->var3, v5, v6, v7);
  }
}

- (__CFXEngineStats)stats
{
  return self->__engineStats;
}

- (int64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (OS_dispatch_group)resourceGroup
{
  return self->_resourceGroup;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)captureNextFrame
{
  self->_shouldCaptureNextFrame = 1;
}

- (void)beginFrame:(id)a3
{
  unint64_t v10 = self->_currentFrameIndex + 1;
  self->_currentFrameIndex = v10;
  uint64_t v11 = sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v11)
  {
    uint64_t v19 = sub_1B64B393C(v11, v12, v13, v14, v15, v16, v17, v18);
    vfx_counters_push_frame(v19, v10);
  }
  prof_beginFlameSmallData((uint64_t)"-[VFXMTLRenderContext beginFrame:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1052, LODWORD(self->_currentFrameIndex) | 0x300000000);
  if (self->_shouldCaptureNextFrame && !self->_captureStarted)
  {
    *(_WORD *)&self->_shouldCaptureNextFrame = 256;
    id v23 = objc_alloc_init(MEMORY[0x1E4F351D8]);
    uint64_t v27 = objc_msgSend_commandQueue(self, v24, v25, v26);
    objc_msgSend_setCaptureObject_(v23, v28, v27, v29);
    uint64_t v32 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v30, @"/tmp/vfx-capture.gputrace", v31);
    objc_msgSend_setOutputURL_(v23, v33, v32, v34);
    uint64_t v38 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v35, v36, v37);
    uint64_t v42 = objc_msgSend_outputURL(v23, v39, v40, v41);
    objc_msgSend_removeItemAtURL_error_(v38, v43, v42, 0);
    objc_msgSend_setDestination_(v23, v44, 2, v45);
    uint64_t v49 = objc_msgSend_sharedCaptureManager(MEMORY[0x1E4F351E0], v46, v47, v48);
    objc_msgSend_startCaptureWithDescriptor_error_(v49, v50, (uint64_t)v23, 0);
  }
  self->_counters = 0u;
  objc_msgSend_reloadPipelinesIfNeeded(self->_resourceManager, v20, v21, v22);
  prof_beginFlameSmallData((uint64_t)"Wait inFlightSemaphore", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1087, LODWORD(self->_currentFrameIndex) | 0x300000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_inFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  atomic_fetch_add(&self->_pendingGPUFrameCount.__a_.__a_value, 1u);
  prof_endFlame();

  self->_textureTarget = 0;
  self->_layerTarget = 0;
  self->_shouldPresentWithTransaction = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = (CAMetalLayer *)a3;
    self->_layerTarget = v51;
    self->_shouldPresentWithTransaction = objc_msgSend_presentsWithTransaction(v51, v52, v53, v54);
  }
  else
  {
    self->_textureTarget = (MTLTexture *)a3;
  }
  uint64_t v55 = self->_constantBufferPools[self->_currentFrameIndex % self->_maxInFlightFrameCount];
  self->_frameConstantBufferPool = v55;
  sub_1B649F0B4((uint64_t)v55);
  uint64_t v56 = self->_volatileBufferPools[self->_currentFrameIndex % self->_maxInFlightFrameCount];
  self->_frameVolatileBufferPool = v56;
  sub_1B649F0B4((uint64_t)v56);
  sub_1B650F1F8((uint64_t)self->_frameTexturePool);
  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
  {
    self->_currentCommandBuffer = clientCommandBuffer;
    prof_eventSmallData(0, (uint64_t)"Current CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1138, v10 | 0x300000000);
  }
  else
  {
    os_variant_has_internal_diagnostics();
    v64 = objc_msgSend_commandQueue(self, v61, v62, v63);
    self->_currentCommandBuffer = (MTLCommandBuffer *)objc_msgSend_commandBuffer(v64, v65, v66, v67);
    prof_eventSmallData(0, (uint64_t)"Current CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1164, v10 | 0x300000000);
  }
  if (self->_compilationIssues.collectEnabled) {
    objc_msgSend_removeAllObjects(self->_compilationIssues.errors, v58, v59, v60);
  }
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3052000000;
  v71[3] = sub_1B6485BC8;
  inFlightSemaphore = self->_inFlightSemaphore;
  v71[4] = sub_1B6485BD8;
  v71[5] = inFlightSemaphore;
  currentCommandBuffer = self->_currentCommandBuffer;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1B6485BE4;
  v70[3] = &unk_1E61427D0;
  v70[5] = v71;
  v70[6] = v10;
  v70[4] = self;
  objc_msgSend_addCompletedHandler_(currentCommandBuffer, v58, (uint64_t)v70, v60);
  _Block_object_dispose(v71, 8);
  prof_endFlame();
}

- (void)endFrameWorldSpecifics
{
  objc_msgSend_resetVolatileMeshes(self, a2, v2, v3);

  MEMORY[0x1F4181798](self, sel_resetVolatileMeshElements, v5, v6);
}

- (void)endFrameWaitingUntilCompleted:(BOOL)a3 status:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7 = a3;
  unint64_t currentFrameIndex = self->_currentFrameIndex;
  prof_beginFlameSmallData((uint64_t)"-[VFXMTLRenderContext endFrameWaitingUntilCompleted:status:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1244, currentFrameIndex | 0x300000000);
  if (self->_resourceCommandBuffer)
  {
    if (self->_resourceBlitEncoder._encoder) {
      sub_1B6486178((uint64_t)&self->_resourceBlitEncoder, v10, v11, v12, v13, v14, v15, v16);
    }
    if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, v10, v11, v12)) {
      sub_1B63BE98C((uint64_t)&self->_resourceComputeEncoder, v17, v18, v19, v20, v21, v22, v23);
    }
    resourceCommandBuffer = self->_resourceCommandBuffer;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = sub_1B64861D0;
    v63[3] = &unk_1E61427F0;
    v63[4] = currentFrameIndex;
    objc_msgSend_addCompletedHandler_(resourceCommandBuffer, v17, (uint64_t)v63, v19);
    objc_msgSend_commit(self->_resourceCommandBuffer, v25, v26, v27);
    self->_resourceCommandBuffer = 0;
  }
  id commandBufferScheduledHandlers = self->_commandBufferScheduledHandlers;
  if (commandBufferScheduledHandlers)
  {
    currentCommandBuffer = self->_currentCommandBuffer;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = sub_1B64862C8;
    v62[3] = &unk_1E6142818;
    v62[4] = commandBufferScheduledHandlers;
    objc_msgSend_addScheduledHandler_(currentCommandBuffer, v10, (uint64_t)v62, v12);

    self->_id commandBufferScheduledHandlers = 0;
  }
  v30 = self->_currentCommandBuffer;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = sub_1B6486424;
  v61[3] = &unk_1E6142840;
  v61[4] = self;
  v61[5] = currentFrameIndex;
  objc_msgSend_addCompletedHandler_(v30, v10, (uint64_t)v61, v12);
  id commandBufferCompletedHandlers = self->_commandBufferCompletedHandlers;
  if (commandBufferCompletedHandlers)
  {
    uint64_t v35 = self->_currentCommandBuffer;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = sub_1B6486534;
    v60[3] = &unk_1E6142818;
    v60[4] = commandBufferCompletedHandlers;
    objc_msgSend_addCompletedHandler_(v35, v31, (uint64_t)v60, v33);

    self->_id commandBufferCompletedHandlers = 0;
  }
  drawable = self->_drawable;
  if (drawable)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = sub_1B6486690;
    v59[3] = &unk_1E6142860;
    v59[4] = currentFrameIndex;
    objc_msgSend_addPresentedHandler_(drawable, v31, (uint64_t)v59, v33);
    id drawablePresentedHandlers = self->_drawablePresentedHandlers;
    if (drawablePresentedHandlers)
    {
      uint64_t v41 = self->_drawable;
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = sub_1B6486744;
      v58[3] = &unk_1E6142888;
      v58[4] = drawablePresentedHandlers;
      objc_msgSend_addPresentedHandler_(v41, v37, (uint64_t)v58, v39);

      self->_id drawablePresentedHandlers = 0;
    }
    if (self->_shouldPresentWithTransaction)
    {
      objc_msgSend_begin(MEMORY[0x1E4F39CF8], v37, v38, v39);
      if (!pthread_main_np()) {
        objc_msgSend_activateBackground_(MEMORY[0x1E4F39CF8], v37, 1, v39);
      }
    }
    if (self->_shouldPresentAfterMinimumDuration
      && objc_msgSend_maximumDrawableCount(self->_layerTarget, v37, v38, v39) == 3)
    {
      objc_msgSend_presentDrawable_afterMinimumDuration_(self->_currentCommandBuffer, v37, (uint64_t)self->_drawable, v39, self->_targetedFrameInterval);
    }
    else
    {
      objc_msgSend_presentDrawable_(self->_currentCommandBuffer, v37, (uint64_t)self->_drawable, v39);
    }
    if (self->_shouldPresentWithTransaction) {
      objc_msgSend_commit(MEMORY[0x1E4F39CF8], v42, v43, v44);
    }

    self->_drawable = 0;
  }
  clientCommandBuffer = self->_clientCommandBuffer;
  if (clientCommandBuffer)
  {
    if (v7)
    {
      objc_msgSend_waitUntilCompleted(clientCommandBuffer, v31, v32, v33);
      if (a4) {
        *a4 = objc_msgSend_status(self->_clientCommandBuffer, v31, v46, v33);
      }
      if (a5) {
        *a5 = 0;
      }
    }
    objc_msgSend_setClientCommandBuffer_(self, v31, 0, v33);
  }
  else
  {
    dispatch_group_wait((dispatch_group_t)self->_resourceGroup, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_commit(self->_currentCommandBuffer, v49, v50, v51);
    if (v7)
    {
      objc_msgSend_waitUntilCompleted(self->_currentCommandBuffer, v47, v52, v48);
      if (a4) {
        *a4 = objc_msgSend_status(self->_currentCommandBuffer, v47, v53, v48);
      }
      if (a5) {
        *a5 = (id)objc_msgSend_error(self->_currentCommandBuffer, v47, v53, v48);
      }
    }
  }
  objc_msgSend_setClientRenderCommandEncoder_(self, v47, 0, v48);
  objc_msgSend_setClientRenderPassDescriptor_(self, v54, 0, v55);
  objc_msgSend_setClientCommandQueue_(self, v56, 0, v57);
  self->_currentCommandBuffer = 0;
  *(void *)&self->_anon_4100[704] = 0;

  self->_textureTarget = 0;
  self->_layerTarget = 0;

  self->_drawable = 0;
  prof_endFlame();
}

- (MTLTexture)textureTarget
{
  return self->_textureTarget;
}

- (CAMetalLayer)layerTarget
{
  return self->_layerTarget;
}

- (id)_finalRenderTexture
{
  attachmentProvider = self->_attachmentProvider;
  uint64_t v4 = RGResourceIdentifierFinalColor((CFX::RG::ResourceIdentifier *)self);
  id Path = RGResourceIdentifierGetPath(v4);
  id result = (id)objc_msgSend_textureForAttachment_withDescriptor_(attachmentProvider, v6, (uint64_t)Path, 0);
  if (!result)
  {
    if (self->_layerTarget)
    {
      drawable = self->_drawable;
      if (!drawable)
      {
        double v12 = CACurrentMediaTime();
        prof_beginFlame((uint64_t)"waitDrawable", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1609);
        id v31 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        uint64_t v13 = -3;
        do
        {
          uint64_t v14 = v13;
          os_signpost_id_t v15 = sub_1B64454CC((uint64_t)self->_engineContext);
          uint64_t v16 = sub_1B63F2EE0();
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            uint64_t v20 = v16;
            if (os_signpost_enabled(v16))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6287000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v15, "WaitDrawable", "", buf, 2u);
            }
          }
          uint64_t v21 = objc_msgSend_nextDrawable(self->_layerTarget, v17, v18, v19);
          uint64_t v22 = sub_1B63F2EE0();
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            uint64_t v29 = v22;
            if (os_signpost_enabled(v22))
            {
              *(_WORD *)uint64_t v32 = 0;
              _os_signpost_emit_with_name_impl(&dword_1B6287000, v29, OS_SIGNPOST_INTERVAL_END, v15, "WaitDrawable", "", v32, 2u);
            }
          }
          if (v21) {
            break;
          }
          uint64_t v13 = v14 + 1;
        }
        while (v14);
        if (!v21) {
          sub_1B63F2F54(0, @"Warning: Failed getting a valid drawable. Skipping this frame.", v23, v24, v25, v26, v27, v28, v30);
        }
        self->__engineStats->drawableWaitTime = CACurrentMediaTime() - v12 + self->__engineStats->drawableWaitTime;
        prof_endFlame();
        self->_drawable = (CAMetalDrawable *)v21;

        drawable = self->_drawable;
      }
      return (id)objc_msgSend_texture(drawable, v8, v9, v10);
    }
    else
    {
      return self->_textureTarget;
    }
  }
  return result;
}

- (id)_reflectionProbeArrayTexture
{
  return *(id *)&self->_anon_4100[704];
}

- (void)_setReflectionProbeArrayTexture:(id)a3
{
  *(void *)&self->_anon_4100[704] = a3;
}

- (void)_clusterInfo
{
  return &self->_anon_4100[336];
}

- (void)_clearRenderCaches
{
  *(_OWORD *)&self->_anon_4730[128] = 0u;
  *(_OWORD *)&self->_anon_4730[112] = 0u;
  *(_OWORD *)&self->_anon_4730[96] = 0u;
  *(_OWORD *)&self->_anon_4730[80] = 0u;
  *(_OWORD *)&self->_anon_4730[64] = 0u;
  *(_OWORD *)&self->_anon_4730[48] = 0u;
  *(_OWORD *)&self->_anon_4730[32] = 0u;
  *(_OWORD *)&self->_anon_4730[16] = 0u;
  *(_OWORD *)self->_anon_4730 = 0u;
  *(_OWORD *)&self->_cache.tessellationPipelineStateHash = 0u;
  *(_OWORD *)&self->_cache.deformers = 0u;
  *(_OWORD *)&self->_cache.node = 0u;
  *(_OWORD *)&self->_cache.blendStates = 0u;
  *(_OWORD *)&self->_cache.metalShadable = 0u;
  *(_OWORD *)&self->_cache.material = 0u;
  *(_OWORD *)&self->_cache.metalMeshElement = 0u;
  *(_OWORD *)&self->_cache.metalMesh = 0u;
  *(_OWORD *)&self->_cache.rasterizerStates = 0u;
}

- (void)_createResourceCommandBufferIfNeeded
{
  if (!self->_resourceCommandBuffer)
  {
    os_variant_has_internal_diagnostics();
    uint64_t v6 = objc_msgSend_commandQueue(self, v3, v4, v5);
    self->_resourceCommandBuffer = (MTLCommandBuffer *)objc_msgSend_commandBuffer(v6, v7, v8, v9);
    prof_eventSmallData(0, (uint64_t)"Resource CB creation to completion", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 1702, LODWORD(self->_currentFrameIndex) | 0x300000000);
    resourceCommandBuffer = self->_resourceCommandBuffer;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B6486BB8;
    v16[3] = &unk_1E6142818;
    v16[4] = self;
    objc_msgSend_addCompletedHandler_(resourceCommandBuffer, v11, (uint64_t)v16, v12);
    objc_msgSend_enqueue(self->_resourceCommandBuffer, v13, v14, v15);
  }
}

- (MTLCommandBuffer)resourceCommandBuffer
{
  if (!self->_resourceCommandBuffer) {
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  }
  if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3)) {
    sub_1B63BE98C((uint64_t)&self->_resourceComputeEncoder, v5, v6, v7, v8, v9, v10, v11);
  }
  if (self->_resourceBlitEncoder._encoder) {
    sub_1B6486178((uint64_t)&self->_resourceBlitEncoder, v5, v6, v7, v8, v9, v10, v11);
  }
  return self->_resourceCommandBuffer;
}

- (VFXMTLBlitCommandEncoder)resourceBlitEncoder
{
  if (!self->_resourceCommandBuffer) {
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  }
  if (objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3)) {
    sub_1B63BE98C((uint64_t)&self->_resourceComputeEncoder, v5, v6, v7, v8, v9, v10, v11);
  }
  if (!self->_resourceBlitEncoder._encoder) {
    sub_1B63BE63C(&self->_resourceBlitEncoder._encoder, self->_resourceCommandBuffer, 0, v7, v8, v9, v10, v11);
  }
  return &self->_resourceBlitEncoder;
}

- (VFXMTLComputeCommandEncoder)resourceComputeEncoder
{
  if (!self->_resourceCommandBuffer) {
    objc_msgSend__createResourceCommandBufferIfNeeded(self, a2, v2, v3);
  }
  if (self->_resourceBlitEncoder._encoder) {
    sub_1B6486178((uint64_t)&self->_resourceBlitEncoder, a2, v2, v3, v4, v5, v6, v7);
  }
  if ((objc_msgSend_isEncoding(self->_resourceComputeEncoder._encoder, a2, v2, v3) & 1) == 0)
  {
    resourceCommandBuffer = self->_resourceCommandBuffer;
    frameConstantBufferPool = (VFXMTLBufferPool *)self->_frameConstantBufferPool;
    self->_resourceComputeEncoder._features = self->_features;
    self->_resourceComputeEncoder._commandBuffer = resourceCommandBuffer;
    objc_msgSend_loadWithCommandBuffer_label_(self->_resourceComputeEncoder._encoder, v9, (uint64_t)resourceCommandBuffer, @"ResourceComputeEncoder");
    self->_resourceComputeEncoder._bufferPool = frameConstantBufferPool;
    objc_msgSend_setLabel_(self->_resourceComputeEncoder._encoder, v12, @"ResourceComputeEncoder", v13);
  }
  return &self->_resourceComputeEncoder;
}

- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4
{
  self->_renderEncoder = (VFXMTLRenderCommandEncoder *)a4;
  uint64_t v6 = objc_msgSend_colorAttachments(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  uint64_t v16 = objc_msgSend_texture(v9, v10, v11, v12);
  if (!v16)
  {
    uint64_t v17 = objc_msgSend_depthAttachment(a3, v13, v14, v15);
    uint64_t v16 = objc_msgSend_texture(v17, v18, v19, v20);
  }
  *(float *)self->_renderSize = (float)(unint64_t)objc_msgSend_width(v16, v13, v14, v15);
  *(float *)&self->_renderSize[4] = (float)(unint64_t)objc_msgSend_height(v16, v21, v22, v23);
  objc_msgSend__clearRenderCaches(self, v24, v25, v26);
  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  self->_currentRenderPassDescriptor = (MTLRenderPassDescriptor *)a3;
  self->_originalRenderPassDescriptor = currentRenderPassDescriptor;
}

- (void)beginRenderPass:(id)a3 renderEncoder:(void *)a4 parameters:(id)a5
{
  uint64_t v5 = *(void *)&a5.var0;
  objc_msgSend_beginRenderPass_renderEncoder_(self, a2, (uint64_t)a3, (uint64_t)a4);

  objc_msgSend_setRenderPassParameters_(self, v7, v5 & 0xFFFFFFFFFFLL, v8);
}

- (void)setRenderPassParameters:(id)a3
{
  self->_renderPassParameters = ($A377741CE82F7EFB2C85CC9BE95A1EAA)a3;
}

- (void)endRenderPass
{
  self->_renderEncoder = 0;
  self->_renderGraph = 0u;
  self->_currentRenderPassDescriptor = self->_originalRenderPassDescriptor;
}

- (VFXTextureAttachmentProvider)attachmentProvider
{
  return self->_attachmentProvider;
}

- (void)setAttachmentProvider:(id)a3
{
  id v5 = a3;

  self->_attachmentProvider = (VFXTextureAttachmentProvider *)a3;
}

- (id)textureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  return (id)objc_msgSend_renderResourceForMaterialProperty_withEngineContext_didFallbackToDefaultTexture_isDynamic_(self->_resourceManager, a2, (uint64_t)a3, (uint64_t)self->_engineContext, 0, 0);
}

- (id)irradianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  uint64_t v10 = sub_1B647761C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v10)
  {
    uint64_t v13 = v10;
    resourceManager = self->_resourceManager;
    return (id)MEMORY[0x1F4181798](resourceManager, sel_irradianceTextureForPrecomputedLightingEnvironment_, v13, v12);
  }
  else
  {
    id result = (id)objc_msgSend_textureForMaterialProperty_(self, v11, (uint64_t)a3, v12);
    if (result)
    {
      id v18 = result;
      if (objc_msgSend_textureType(result, v15, v16, v17) == 5)
      {
        uint64_t lightingSystem = (uint64_t)self->_processingContext.lightingSystem;
        if (lightingSystem) {
          uint64_t lightingSystem = sub_1B63C2948(lightingSystem, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
        }
        uint64_t v27 = self->_resourceManager;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = sub_1B6487024;
        v29[3] = &unk_1E61428A8;
        v29[4] = lightingSystem;
        return (id)objc_msgSend_irradianceTextureForEnvironmentTexture_renderContext_applySH_(v27, v19, (uint64_t)v18, (uint64_t)self, v29);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (id)radianceTextureForMaterialProperty:(__CFXMaterialProperty *)a3
{
  uint64_t v10 = sub_1B647761C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v10)
  {
    uint64_t v13 = v10;
    resourceManager = self->_resourceManager;
    return (id)MEMORY[0x1F4181798](resourceManager, sel_radianceTextureForPrecomputedLightingEnvironment_, v13, v12);
  }
  else
  {
    uint64_t v15 = objc_msgSend_textureForMaterialProperty_(self, v11, (uint64_t)a3, v12);
    if (v15 && (uint64_t v19 = v15, objc_msgSend_textureType(v15, v16, v17, v18) == 5))
    {
      uint64_t v23 = self->_resourceManager;
      engineContext = self->_engineContext;
      objc_msgSend_resourceCommandBuffer(self, v20, v21, v22);
      return (id)MEMORY[0x1F4181798](v23, sel_radianceTextureForEnvironmentTexture_engineContext_commandBuffer_, v19, engineContext);
    }
    else
    {
      return 0;
    }
  }
}

- (void)_logLightingInformation
{
  NSLog(&cfstr_LightingsetUpl.isa, a2, self->_lighting.frameLightingSetDatas.__table_.__p2_.__value_);
  next = self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_;
  if (next)
  {
    LODWORD(v4) = 0;
    do
    {
      uint64_t v4 = (v4 + next[10]);
      next = *(_DWORD **)next;
    }
    while (next);
  }
  else
  {
    uint64_t v4 = 0;
  }
  NSLog(&cfstr_LightingsetUpl_0.isa, v4);
}

- (void)setRasterizerStates:(__CFXRasterizerStates *)a3
{
  uint64_t v8 = a3;
  if (!a3) {
    uint64_t v8 = (__CFXRasterizerStates *)sub_1B645179C();
  }
  if (self->_cache.rasterizerStates != v8)
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    int v40 = 0;
    uint64_t v39 = 0;
    sub_1B6451740((uint64_t)v8, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&v37);
    rasterizerStates = self->_cache.rasterizerStates;
    if (!rasterizerStates)
    {
      LOBYTE(v20) = -1;
      int v18 = v37;
      goto LABEL_29;
    }
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    int v36 = 0;
    uint64_t v35 = 0;
    sub_1B6451740((uint64_t)rasterizerStates, v11, v12, v13, v14, v15, v16, (uint64_t)&v33);
    int v18 = v37;
    if (HIDWORD(v33) == HIDWORD(v37)) {
      int v19 = v33 != v37;
    }
    else {
      int v19 = (v33 != v37) | 2;
    }
    if (v34 == v38) {
      int v20 = v19;
    }
    else {
      int v20 = v19 | 4;
    }
    if ((_BYTE)v38)
    {
      if (BYTE2(v34) != BYTE2(v38) || v34 == 0) {
        v20 |= 8u;
      }
      if ((_BYTE)v34 && BYTE1(v34) == BYTE1(v38))
      {
LABEL_24:
        if (BYTE3(v38) | BYTE3(v34))
        {
          LOBYTE(v20) = v20 | 0x20;
        }
        else if (!v20)
        {
          sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v11, v12, v13, v14, v15, v16, (uint64_t)"setMask");
LABEL_34:
          self->_cache.rasterizerStates = v8;
          return;
        }
        if ((v20 & 1) == 0)
        {
LABEL_30:
          if ((v20 & 2) != 0)
          {
            renderEncoder = self->_renderEncoder;
            uint64_t v27 = sub_1B64D79F0(HIDWORD(v37), v10, v11, v12, v13, v14, v15, v16);
            objc_msgSend_setTriangleFillMode_(renderEncoder->var3, v28, v27, v29);
          }
          if ((v20 & 0x3C) != 0)
          {
            uint64_t v30 = sub_1B653B9C4((uint64_t)self->_resourceManager, (uint64_t)v8);
            objc_msgSend_setDepthStencilState_(self->_renderEncoder->var3, v31, (uint64_t)v30, v32);
          }
          goto LABEL_34;
        }
LABEL_29:
        uint64_t v22 = self->_renderEncoder;
        uint64_t v23 = sub_1B64D7998(v18, v10, v11, v12, v13, v14, v15, v16);
        objc_msgSend_setCullMode_(v22->var3, v24, v23, v25);
        goto LABEL_30;
      }
    }
    else
    {
      if ((_BYTE)v34) {
        goto LABEL_24;
      }
      v20 |= 8u;
    }
    v20 |= 0x10u;
    goto LABEL_24;
  }
}

- (void)pushDebugGroup:(id)a3
{
  objc_msgSend_pushDebugGroup_(self->_renderEncoder->var3, a2, (uint64_t)a3, v3);
}

- (void)popDebugGroup
{
  objc_msgSend_popDebugGroup(self->_renderEncoder->var3, a2, v2, v3);
}

- (void)_setWorldBufferAtVertexIndex:(int64_t)a3 fragmentIndex:(int64_t)a4
{
  if (a3 != -1) {
    objc_msgSend_setVertexBuffer_offset_atIndex_(self->_renderEncoder->var3, a2, (uint64_t)self->_worldUniforms.buffer, self->_worldUniforms.offset, a3);
  }
  if (a4 != -1)
  {
    buffer = self->_worldUniforms.buffer;
    unint64_t offset = self->_worldUniforms.offset;
    id var3 = self->_renderEncoder->var3;
    objc_msgSend_setFragmentBuffer_offset_atIndex_(var3, a2, (uint64_t)buffer, offset, a4);
  }
}

- (void)_setMeshBuffers:(id)a3
{
  v16[14] = *MEMORY[0x1E4F143B8];
  memset(v15, 0, sizeof(v15));
  uint64_t v5 = (void *)sub_1B659C6D8((uint64_t)a3);
  unint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);
  if (v9 >= 0xE) {
    uint64_t v10 = 14;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = (void *)sub_1B659C6D8((uint64_t)a3);
  objc_msgSend_getObjects_range_(v11, v12, (uint64_t)v16, 0, v10);
  if (sub_1B659C718((uint64_t)a3))
  {
    *((void *)v15 + v10) = sub_1B659C738((uint64_t)a3);
    v16[v10++] = sub_1B659C718((uint64_t)a3);
  }
  renderEncoder = self->_renderEncoder;
  if (v10 == 1) {
    objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v13, v16[0], *(uint64_t *)&v15[0], 18);
  }
  else {
    objc_msgSend_setVertexBuffers_offsets_withRange_(renderEncoder->var3, v13, (uint64_t)v16, (uint64_t)v15, 18, v10);
  }
}

- (void)_drawMeshElement:(id)a3 instanceCount:(unint64_t)a4
{
  ++self->__engineStats->drawCount;
  if (sub_1B659C6D8((uint64_t)a3))
  {
    renderEncoder = self->_renderEncoder;
    uint64_t v8 = sub_1B653EFB8((uint64_t)a3);
    uint64_t v9 = sub_1B659C6F8((uint64_t)a3);
    uint64_t v10 = (void *)sub_1B659CBE8((uint64_t)a3);
    uint64_t v14 = objc_msgSend_buffer(v10, v11, v12, v13);
    uint64_t v15 = sub_1B659C8F8((uint64_t)a3);
    uint64_t v16 = (void *)sub_1B659CBE8((uint64_t)a3);
    uint64_t v20 = objc_msgSend_offset(v16, v17, v18, v19);
    uint64_t v21 = v20 + v15 + sub_1B653EFAC((uint64_t)a3);
    uint64_t v22 = sub_1B659C6D8((uint64_t)a3);
    uint64_t v23 = sub_1B659C738((uint64_t)a3);
    objc_msgSend_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_(renderEncoder->var3, v24, v8, v9, v14, v21, v22, v23);
  }
  else
  {
    uint64_t v29 = sub_1B659CBE8((uint64_t)a3);
    uint64_t v30 = self->_renderEncoder;
    uint64_t v31 = sub_1B653EFB8((uint64_t)a3);
    if (v29)
    {
      uint64_t v32 = sub_1B659C718((uint64_t)a3);
      uint64_t v33 = sub_1B659C6F8((uint64_t)a3);
      uint64_t v34 = (void *)sub_1B659CBE8((uint64_t)a3);
      uint64_t v38 = objc_msgSend_buffer(v34, v35, v36, v37);
      uint64_t v39 = sub_1B659C8F8((uint64_t)a3);
      int v40 = (void *)sub_1B659CBE8((uint64_t)a3);
      uint64_t v44 = objc_msgSend_offset(v40, v41, v42, v43);
      uint64_t v46 = v44 + v39 + sub_1B653EFAC((uint64_t)a3);
      id var3 = v30->var3;
      if (v30->var0 * a4 < 2) {
        objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_(var3, v45, v31, v32, v33, v38, v46);
      }
      else {
        objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(var3, v45, v31, v32, v33, v38, v46);
      }
    }
    else
    {
      uint64_t v48 = sub_1B659C8F8((uint64_t)a3);
      uint64_t v50 = sub_1B659C718((uint64_t)a3);
      id v51 = v30->var3;
      if (v30->var0 * a4 < 2) {
        objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v51, v49, v31, v48, v50);
      }
      else {
        objc_msgSend_drawPrimitives_vertexStart_vertexCount_instanceCount_(v51, v49, v31, v48, v50);
      }
    }
  }
  int v25 = sub_1B659CB2C((uint64_t)a3);
  engineStats = self->__engineStats;
  engineStats->primitivesProcessed += v25 * a4;
  metalMesh = self->_cache.metalMesh;
  if (metalMesh)
  {
    int v28 = sub_1B64A6B40((uint64_t)metalMesh) * a4;
    engineStats = self->__engineStats;
  }
  else
  {
    int v28 = 0;
  }
  engineStats->verticesProcessed += v28;
}

- (void)_drawPatchForMeshElement:(id)a3 instanceCount:(unint64_t)a4
{
  if (sub_1B659C6F8((uint64_t)a3) != 1 && sub_1B659C6F8((uint64_t)a3)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Control point indices must be 16-bit or 32-bit", v7, v8, v9, v10, v11, v12, (uint64_t)"element.indexType == MTLIndexTypeUInt32 || element.indexType == MTLIndexTypeUInt16");
  }
  if (sub_1B653EFB8((uint64_t)a3) != 3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Only triangle arrays are supported for tessellation", v13, v14, v15, v16, v17, v18, (uint64_t)"element.primitiveType == MTLPrimitiveTypeTriangle");
  }
  ++self->__engineStats->drawCount;
  renderEncoder = self->_renderEncoder;
  uint64_t v20 = sub_1B659CA94((uint64_t)a3);
  uint64_t v21 = (void *)sub_1B659CBE8((uint64_t)a3);
  uint64_t v25 = objc_msgSend_buffer(v21, v22, v23, v24);
  uint64_t v26 = (void *)sub_1B659CBE8((uint64_t)a3);
  uint64_t v30 = objc_msgSend_offset(v26, v27, v28, v29);
  uint64_t v31 = sub_1B653EFAC((uint64_t)a3);
  objc_msgSend_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_(renderEncoder->var3, v32, 3, 0, v20, 0, 0, v25, v31 + v30, renderEncoder->var0 * a4, 0);
  int v33 = sub_1B659CA94((uint64_t)a3);
  engineStats = self->__engineStats;
  engineStats->primitivesProcessed += v33 * a4;
  metalMesh = self->_cache.metalMesh;
  if (metalMesh)
  {
    int v36 = sub_1B64A6B40((uint64_t)metalMesh) * a4;
    engineStats = self->__engineStats;
  }
  else
  {
    int v36 = 0;
  }
  engineStats->verticesProcessed += v36;
}

- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(id *)a3
{
  long long v3 = *((_OWORD *)a3 + 2);
  if (*((float *)&v3 + 3) == 0.0)
  {
    float v5 = *((float *)a3 + 14);
    double v6 = (v5 + -1.0) / *((float *)&v3 + 2);
    *(float *)&double v6 = v6;
    *(float *)v7.i32 = v5 / *((float *)&v3 + 2);
    *(float *)&long long v3 = *(float *)v7.i32;
    v7.i32[1] = LODWORD(v6);
    int8x8_t v23 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(*(float32x2_t *)&v3, *(float32x2_t *)&v6), 0), (int8x8_t)vrev64_s32(v7), (int8x8_t)v7);
    __n128 v8 = sub_1B64479C4((__n128 *)self->_engineContext);
    if (v8.n128_f32[3] == 0.0) {
      float v9 = 1.0;
    }
    else {
      float v9 = v8.n128_f32[2] / v8.n128_f32[3];
    }
    double v10 = *(float *)v23.i32;
    double v11 = __tanpi(0.166666667);
    uint64_t v12 = 0;
    if (v11 == 0.0) {
      double v13 = 1.0;
    }
    else {
      double v13 = 1.0 / v11;
    }
    float v14 = v13;
    double v15 = v10 + 1.0;
    if (*(float *)&v23.i32[1] > *(float *)v23.i32) {
      double v15 = *(float *)&v23.i32[1];
    }
    double v16 = v15 / (v10 - v15);
    *(float *)&unsigned int v17 = v16;
    *(float *)&double v16 = v16 * v10;
    *(void *)&long long v18 = 0;
    *((void *)&v18 + 1) = __PAIR64__(-1.0, v17);
    *(void *)&long long v19 = 0;
    *((void *)&v19 + 1) = LODWORD(v16);
    LODWORD(v16) = 0;
    *((float *)&v16 + 1) = v9 * v14;
    v24[0] = LODWORD(v14);
    v24[1] = *(unint64_t *)&v16;
    v24[2] = v18;
    v24[3] = v19;
    do
    {
      v25[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6E4F300, COERCE_FLOAT(v24[v12])), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)&v24[v12], 1), (float32x4_t)xmmword_1B6E4F340, (float32x4_t)v24[v12], 2), (float32x4_t)xmmword_1B6E4F360, (float32x4_t)v24[v12], 3);
      ++v12;
    }
    while (v12 != 4);
    long long v20 = v25[1];
    long long v21 = v25[2];
    long long v22 = v25[3];
    *(_OWORD *)a3 = v25[0];
    *((_OWORD *)a3 + 1) = v20;
    *((_OWORD *)a3 + 2) = v21;
    *((_OWORD *)a3 + 3) = v22;
  }
}

- (float)_zFarForSkyboxRenderingProjectionMatrix:(id *)a3 defaultZFar:(float)result
{
  if (result <= 0.0) {
    return 1.0;
  }
  return result;
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:(uint64_t)a5
{
  v246 = 0;
  uint64_t v12 = sub_1B6477464(a3, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v13 = sub_1B644778C(a4);
  long long v21 = (const void *)v13;
  if (v13 && sub_1B6451F14(v13) != v12)
  {
    sub_1B6447738(a4, 0);
    long long v21 = 0;
  }
  if (!v12)
  {
    uint64_t v28 = objc_msgSend_textureForMaterialProperty_((void *)a1, v14, a3, v16);
    goto LABEL_12;
  }
  uint64_t v27 = sub_1B64765F4(a3, (uint64_t)v14, v15, v16, v17, v18, v19, v20);
  if (v27)
  {
    if (!v21)
    {
LABEL_10:
      long long v21 = (const void *)sub_1B6451A24(v12, v27, a4, v22, v23, v24, v25, v26);
      sub_1B6447738(a4, v21);
      CFRelease(v21);
      if (!v21) {
        return;
      }
    }
  }
  else
  {
    uint64_t v27 = sub_1B643DF24();
    if (!v21) {
      goto LABEL_10;
    }
  }
  uint64_t v28 = (void *)sub_1B6451DFC((uint64_t)v21, a4, v27, (uint64_t)&v223, v23, v24, v25, v26);
LABEL_12:
  int v36 = v28;
  v246 = v28;
  if (!v28) {
    return;
  }
  uint64_t v37 = sub_1B644558C(a4, v29, v30, v31, v32, v33, v34, v35);
  if (objc_msgSend_textureType(v36, v38, v39, v40) == 5)
  {
    uint64_t v41 = sub_1B6445668(a4);
    uint64_t v42 = *(void *)(a1 + 8 * *(unsigned __int8 *)(a1 + 314) + 440);
    uint64_t v43 = (float32x4_t *)sub_1B6447988(a4, 1);
    BOOL v44 = sub_1B6477268(a3);
    float32x4_t v213 = v43[2];
    float32x4_t v216 = *v43;
    float32x4_t v210 = v43[1];
    if (v44)
    {
      float32x4_t v207 = v43[3];
      uint64_t v52 = (float32x4_t *)sub_1B647721C(a3, v45, v46, v47, v48, v49, v50, v51);
      unint64_t v53 = 0;
      float32x4_t v54 = v52[1];
      float32x4_t v55 = v52[2];
      long long v56 = (__int128)v52[3];
      float32x4_t v251 = *v52;
      float32x4_t v252 = v54;
      float32x4_t v253 = v55;
      long long v254 = v56;
      do
      {
        *(long long *)((char *)&v223 + v53) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v216, COERCE_FLOAT(*(_OWORD *)((char *)&v251 + v53))), v210, *(float32x2_t *)&v251.f32[v53 / 4], 1), v213, *(float32x4_t *)((char *)&v251 + v53), 2), v207, *(float32x4_t *)((char *)&v251 + v53), 3);
        v53 += 16;
      }
      while (v53 != 64);
      float32x4_t v210 = (float32x4_t)v224;
      float32x4_t v213 = (float32x4_t)v225;
      float32x4_t v216 = (float32x4_t)v223;
    }
    uint64_t v57 = (float32x4_t *)sub_1B6447988(*(void *)(a1 + 144), 0);
    float32x4_t v58 = v57[3];
    float32x4_t v60 = *v57;
    float32x4_t v59 = v57[1];
    float32x4_t v249 = v57[2];
    float32x4_t v250 = v58;
    float32x4_t v247 = v60;
    float32x4_t v248 = v59;
    objc_msgSend__updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded_((void *)a1, v61, (uint64_t)&v247, v62);
    unint64_t v65 = 0;
    float32x4_t v66 = v247;
    float32x4_t v67 = v248;
    float32x4_t v68 = v249;
    float32x4_t v69 = v250;
    float32x4_t v251 = v216;
    float32x4_t v252 = v210;
    float32x4_t v253 = v213;
    long long v254 = xmmword_1B6E4F370;
    do
    {
      *(long long *)((char *)&v223 + v65) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, COERCE_FLOAT(*(_OWORD *)((char *)&v251 + v65))), v67, *(float32x2_t *)&v251.f32[v65 / 4], 1), v68, *(float32x4_t *)((char *)&v251 + v65), 2), v69, *(float32x4_t *)((char *)&v251 + v65), 3);
      v65 += 16;
    }
    while (v65 != 64);
    long long v208 = v223;
    long long v211 = v224;
    long long v214 = v225;
    long long v70 = v226;
  }
  else
  {
    uint64_t v41 = sub_1B6447794(a4);
    uint64_t v42 = *(void *)(a1 + 8 * *(unsigned __int8 *)(a1 + 314) + 416);
    if (!sub_1B6477268(a3))
    {
      long long v217 = xmmword_1B6E4F370;
      long long v214 = xmmword_1B6E4F2E0;
      long long v211 = xmmword_1B6E4F320;
      long long v208 = xmmword_1B6E4F300;
      goto LABEL_25;
    }
    v76 = (long long *)sub_1B647721C(a3, (uint64_t)v63, v71, v64, v72, v73, v74, v75);
    long long v208 = *v76;
    long long v211 = v76[1];
    long long v214 = v76[2];
    long long v70 = v76[3];
  }
  long long v217 = v70;
LABEL_25:
  objc_msgSend_pushDebugGroup_((void *)a1, v63, @"VFX - Draw world background", v64);
  v77 = sub_1B653C844(*(void *)(a1 + 112), v41, 1);
  v81 = objc_msgSend_colorAttachments(*(void **)(a1 + 216), v78, v79, v80);
  v84 = objc_msgSend_objectAtIndexedSubscript_(v81, v82, 0, v83);
  objc_msgSend_clearColor(v84, v85, v86, v87);
  if (v88 == 1.0) {
    uint64_t v89 = sub_1B64E3664();
  }
  else {
    uint64_t v89 = sub_1B64E35DC();
  }
  char v91 = *(unsigned char *)(a1 + 313);
  char v92 = *(unsigned char *)(a1 + 314);
  if (*(unsigned char *)(a1 + 315) == 2) {
    char v93 = 2;
  }
  else {
    char v93 = 1;
  }
  v94 = *(void **)(a1 + 112);
  long long v235 = 0u;
  long long v236 = 0u;
  uint64_t v234 = v42;
  v237 = v77;
  uint64_t v238 = v89;
  uint64_t v239 = 0;
  __int16 v240 = 783;
  char v241 = v91;
  char v242 = v93;
  char v243 = v92;
  long long v244 = 0u;
  memset(v245, 0, sizeof(v245));
  v95 = objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(v94, v90, (uint64_t)&v234, *(void *)(a1 + 216));
  uint64_t v96 = *(void *)(a1 + 248);
  uint64_t v100 = objc_msgSend_state(v95, v97, v98, v99);
  objc_msgSend_setRenderPipelineState_(*(void **)(v96 + 16), v101, v100, v102);
  objc_msgSend_setRasterizerStates_((void *)a1, v103, *(void *)(a1 + 480), v104);
  float v233 = sub_1B64763AC(a3, v105, v106, v107, v108, v109, v110, v111);
  uint64_t v112 = *(void *)(a1 + 248);
  long long v223 = 0uLL;
  *(void *)&long long v224 = 0;
  sub_1B649F334(*(void *)(v112 + 24), &v233, 4uLL, (void **)&v223);
  objc_msgSend_setFragmentBuffer_offset_atIndex_(*(void **)(v112 + 16), v113, *((uint64_t *)&v223 + 1), v224, 0);
  uint64_t v121 = sub_1B64765F4(a3, v114, v115, v116, v117, v118, v119, v120);
  if (!v121) {
    uint64_t v121 = sub_1B643DF24();
  }
  v122 = sub_1B653E820(*(void *)(a1 + 112), v121);
  if (objc_msgSend_pixelFormat(v36, v123, v124, v125) == 520 || objc_msgSend_pixelFormat(v36, v126, v127, v128) == 500)
  {
    v129 = *(void **)(*(void *)(a1 + 248) + 16);
    sub_1B64D95D4(*(__IOSurface **)(a1 + 240), (const char *)&v246, 1, v128);
    objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(v129, v130, (uint64_t)v246, 0, v122, 0);
  }
  else
  {
    sub_1B63C6ED0(*(void *)(a1 + 248), v36, 0, v128);
    objc_msgSend_setFragmentSamplerState_atIndex_(*(void **)(*(void *)(a1 + 248) + 16), v138, (uint64_t)v122, 0);
  }
  if (*(unsigned char *)(a1 + 314))
  {
    v206 = v77;
    if (!a5) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v132, v133, v134, v135, v136, v137, (uint64_t)"currentPassInstance");
    }
    if (*(unsigned char *)(a1 + 313))
    {
      unint64_t v139 = 0;
      do
      {
        if (v139 >= 6) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. invalid index", v132, v133, v134, v135, v136, v137, (uint64_t)"i < 6");
        }
        v140 = (float32x4_t *)(a5 + (v139 << 6));
        BOOL v141 = sub_1B6477268(a3);
        float32x4_t v215 = v140[524];
        float32x4_t v218 = v140[523];
        float32x4_t v209 = v140[526];
        float32x4_t v212 = v140[525];
        if (v141)
        {
          v149 = (float32x4_t *)sub_1B647721C(a3, (uint64_t)v142, v143, v144, v145, v146, v147, v148);
          unint64_t v150 = 0;
          float32x4_t v151 = v149[1];
          float32x4_t v152 = v149[2];
          float32x4_t v153 = v149[3];
          float32x4_t v247 = *v149;
          float32x4_t v248 = v151;
          float32x4_t v249 = v152;
          float32x4_t v250 = v153;
          do
          {
            *(float32x4_t *)((char *)&v251 + v150) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v218, COERCE_FLOAT(*(_OWORD *)((char *)&v247 + v150))), v215, *(float32x2_t *)&v247.f32[v150 / 4], 1), v212, *(float32x4_t *)((char *)&v247 + v150), 2), v209, *(float32x4_t *)((char *)&v247 + v150), 3);
            v150 += 16;
          }
          while (v150 != 64);
          float32x4_t v215 = v252;
          float32x4_t v218 = v251;
          float32x4_t v209 = (float32x4_t)v254;
          float32x4_t v212 = v253;
        }
        float32x4_t v154 = v140[588];
        float32x4_t v219 = v140[587];
        float32x4_t v220 = v154;
        float32x4_t v155 = v140[590];
        float32x4_t v221 = v140[589];
        float32x4_t v222 = v155;
        objc_msgSend__updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded_((void *)a1, v142, (uint64_t)&v219, v144);
        unint64_t v163 = 0;
        float32x4_t v164 = v219;
        float32x4_t v165 = v220;
        float32x4_t v166 = v221;
        float32x4_t v167 = v222;
        float32x4_t v247 = v218;
        float32x4_t v248 = v215;
        float32x4_t v249 = v212;
        float32x4_t v250 = v209;
        do
        {
          *(float32x4_t *)((char *)&v251 + v163) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v164, COERCE_FLOAT(*(_OWORD *)((char *)&v247 + v163))), v165, *(float32x2_t *)&v247.f32[v163 / 4], 1), v166, *(float32x4_t *)((char *)&v247 + v163), 2), v167, *(float32x4_t *)((char *)&v247 + v163), 3);
          v163 += 16;
        }
        while (v163 != 64);
        float32x4_t v168 = v252;
        float32x4_t v169 = v253;
        long long v170 = v254;
        v171 = (float32x4_t *)(&v223 + 4 * v139);
        float32x4_t *v171 = v251;
        v171[1] = v168;
        v171[2] = v169;
        v171[3] = (float32x4_t)v170;
        *(double *)v172.i64 = sub_1B64B33CC(v37, v156, v157, v158, v159, v160, v161, v162);
        v171[24] = v172;
        v171[25] = v173;
        v171[26] = v174;
        v171[27] = v175;
        ++v139;
      }
      while (v139 < *(unsigned __int8 *)(a1 + 313));
    }
    uint64_t v176 = sub_1B6447988(*(void *)(a1 + 144), 0);
    double v177 = *(double *)(a5 + 12824);
    *(float *)&double v177 = v177;
    objc_msgSend__zFarForSkyboxRenderingProjectionMatrix_defaultZFar_((void *)a1, v178, v176, v179, v177);
    int v232 = v180;
    uint64_t v181 = *(void *)(a1 + 248);
    float32x4_t v251 = 0uLL;
    v252.i64[0] = 0;
    sub_1B649F334(*(void *)(v181 + 24), &v223, 0x310uLL, (void **)&v251);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v181 + 16), v182, v251.i64[1], v252.i64[0], 0);
    v77 = v206;
  }
  else
  {
    long long v223 = v208;
    long long v224 = v211;
    long long v225 = v214;
    long long v226 = v217;
    *(double *)&long long v186 = sub_1B64B33CC(v37, v131, v132, v133, v134, v135, v136, v137);
    long long v227 = v186;
    long long v228 = v187;
    long long v229 = v188;
    long long v230 = v189;
    uint64_t v190 = sub_1B6447988(*(void *)(a1 + 144), 0);
    double v191 = *(double *)(a5 + 12824);
    *(float *)&double v191 = v191;
    objc_msgSend__zFarForSkyboxRenderingProjectionMatrix_defaultZFar_((void *)a1, v192, v190, v193, v191);
    int v231 = v194;
    uint64_t v195 = *(void *)(a1 + 248);
    float32x4_t v251 = 0uLL;
    v252.i64[0] = 0;
    sub_1B649F334(*(void *)(v195 + 24), &v223, 0x90uLL, (void **)&v251);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v195 + 16), v196, v251.i64[1], v252.i64[0], 0);
  }
  if (*(void *)(a1 + 18088) != v41)
  {
    *(void *)(a1 + 18088) = v41;
    objc_msgSend__setMeshBuffers_((void *)a1, v183, (uint64_t)v77, v185);
  }
  if (objc_msgSend_textureType(v246, v183, v184, v185) == 5)
  {
    v198 = (void *)sub_1B659C6F8((uint64_t)v77);
    uint64_t v201 = objc_msgSend_objectAtIndexedSubscript_(v198, v199, 0, v200);
    objc_msgSend__drawMeshElement_instanceCount_((void *)a1, v202, v201, 1);
  }
  else
  {
    sub_1B63C6F54(*(void *)(a1 + 248), v197);
  }
  objc_msgSend_popDebugGroup((void *)a1, v203, v204, v205);
}

- (void)renderVideoBackground:(__CFXImageProxy *)a3 engineContext:(__CFXEngineContext *)a4 materialProperty:(__CFXMaterialProperty *)a5
{
  objc_msgSend_pushDebugGroup_(self, a2, @"VFX - Draw video background", (uint64_t)a4);
  int v16 = sub_1B6451C0C((uint64_t)a3, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v17 = sub_1B644778C((uint64_t)a4);
  if (!v17) {
    goto LABEL_4;
  }
  uint64_t v18 = (const void *)v17;
  if ((__CFXImageProxy *)sub_1B6451F14(v17) != a3)
  {
    sub_1B6447738((uint64_t)a4, 0);
LABEL_4:
    uint64_t v19 = sub_1B643DF24();
    uint64_t v18 = (const void *)sub_1B6451A24((uint64_t)a3, v19, (uint64_t)a4, v20, v21, v22, v23, v24);
    sub_1B6447738((uint64_t)a4, v18);
    CFRelease(v18);
    goto LABEL_6;
  }
  uint64_t v19 = sub_1B643DF24();
LABEL_6:
  uint64_t v29 = sub_1B6451DFC((uint64_t)v18, (uint64_t)a4, v19, (uint64_t)v132, v25, v26, v27, v28);
  uint64_t v131 = v29;
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = (__CFXMesh *)sub_1B6447794((uint64_t)a4);
    v113 = sub_1B653C844((uint64_t)self->_resourceManager, (uint64_t)v31, 1);
    uint64_t v39 = sub_1B6446564((uint64_t *)self->_engineContext, v32, v33, v34, v35, v36, v37, v38);
    if (v39) {
      CFDictionaryRef v47 = sub_1B64A3B48((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);
    }
    else {
      CFDictionaryRef v47 = 0;
    }
    uint64_t v48 = sub_1B649A8B0((uint64_t)v47, v40, v41, v42, v43, v44, v45, v46);
    if ((*((unsigned char *)self + 152) & 4) != 0
      && v47
      && self->_renderPassParameters.isMainPass
      && v48
      && sub_1B6529470(v48, (uint64_t)v49, v50, v51, v52, v53, v54, v55))
    {
      uint64_t v56 = 472;
    }
    else
    {
      uint64_t v56 = 464;
    }
    uint64_t v57 = *(uint64_t *)((char *)&self->super.isa + v56);
    unsigned __int8 eyeCount = self->_renderPassParameters.eyeCount;
    unsigned __int8 viewMapping = self->_renderPassParameters.viewMapping;
    if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2) {
      char v60 = 2;
    }
    else {
      char v60 = 1;
    }
    resourceManager = self->_resourceManager;
    uint64_t v119 = v57;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    v122 = v113;
    __int16 v125 = 783;
    unsigned __int8 v126 = eyeCount;
    char v127 = v60;
    unsigned __int8 v128 = viewMapping;
    long long v129 = 0u;
    memset(v130, 0, sizeof(v130));
    uint64_t v62 = objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(resourceManager, v49, (uint64_t)&v119, (uint64_t)self->_currentRenderPassDescriptor);
    renderEncoder = self->_renderEncoder;
    uint64_t v67 = objc_msgSend_state(v62, v64, v65, v66);
    objc_msgSend_setRenderPipelineState_(renderEncoder->var3, v68, v67, v69);
    objc_msgSend_setRasterizerStates_(self, v70, (uint64_t)self->_backgroundRasterizerStates, v71);
    uint64_t v72 = sub_1B653E820((uint64_t)self->_resourceManager, v19);
    if (objc_msgSend_pixelFormat(v30, v73, v74, v75) == 520 || objc_msgSend_pixelFormat(v30, v76, v77, v78) == 500)
    {
      id var3 = self->_renderEncoder->var3;
      sub_1B64D95D4(self->_currentCommandBuffer, (const char *)&v131, 1, v78);
      objc_msgSend_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex_(var3, v80, v131, 0, v72, 0);
    }
    else
    {
      sub_1B63C6ED0((uint64_t)self->_renderEncoder, v30, 0, v78);
      objc_msgSend_setFragmentSamplerState_atIndex_(self->_renderEncoder->var3, v87, (uint64_t)v72, 0);
    }
    switch(v16)
    {
      case 0:
        sub_1B63F2F54(16, @"Unreachable code: Cannot render video background with an unspecified source type.", v81, v82, v83, v84, v85, v86, v112);
        break;
      case 1:
        __asm { FMOV            V1.2S, #1.0 }
        unint64_t v115 = 0x3F80000000000000;
        uint64_t v116 = _D1;
        uint64_t v117 = 0;
        uint64_t v118 = 1065353216;
        break;
      case 2:
        sub_1B648852C((uint64_t)a3, (__n128 *)a4, v81, v82, v83, v84, v85, v86);
        goto LABEL_28;
      case 3:
LABEL_28:
        unint64_t v115 = sub_1B648852C((uint64_t)a3, (__n128 *)a4, v81, v82, v83, v84, v85, v86).n128_u64[0];
        uint64_t v116 = v93;
        uint64_t v117 = v94;
        uint64_t v118 = v95;
        break;
      default:
        break;
    }
    uint64_t v96 = self->_renderEncoder;
    uint64_t v133 = 0;
    uint64_t v134 = 0;
    uint64_t v135 = 0;
    sub_1B649F334((uint64_t)v96->var4, &v115, 0x20uLL, &v133);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v96->var3, v97, v134, v135, 0);
    float v114 = sub_1B64763AC((uint64_t)a5, v98, v99, v100, v101, v102, v103, v104);
    uint64_t v105 = self->_renderEncoder;
    uint64_t v133 = 0;
    uint64_t v134 = 0;
    uint64_t v135 = 0;
    sub_1B649F334((uint64_t)v105->var4, &v114, 4uLL, &v133);
    objc_msgSend_setFragmentBuffer_offset_atIndex_(v105->var3, v106, v134, v135, 0);
    if (self->_cache.mesh != v31)
    {
      self->_cache.mesh = v31;
      objc_msgSend__setMeshBuffers_(self, v107, (uint64_t)v113, v108);
    }
    sub_1B63F0064((uint64_t)self->_renderEncoder, v107);
    objc_msgSend_popDebugGroup(self, v109, v110, v111);
  }
}

- (void)renderMesh:(__n128)a3 meshElement:(__n128)a4 withProgram:(__n128)a5 engineContext:(uint64_t)a6 transform:(uint64_t)a7 color:(uint64_t)a8 rasterizerStates:(uint64_t)a9 blendState:(uint64_t)a10 texture:(long long *)a11 depthBias:(uint64_t)a12
{
  if (*(void *)(a1 + 216))
  {
    uint64_t v21 = sub_1B653C844(*(void *)(a1 + 112), a7, 1);
    if (sub_1B64AD9B8(a7, v22, v23, v24, v25, v26, v27, v28) && !sub_1B659C718((uint64_t)v21)) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Volatile mesh must have been mapped already", v29, v30, v31, v32, v33, v34, (uint64_t)"!CFXMeshIsVolatile(mesh) || (renderMesh.volatileBuffer != nil)");
    }
    uint64_t v35 = sub_1B653C040(*(void *)(a1 + 112), a8);
    uint64_t v36 = a8;
    uint64_t v37 = v35;
    uint64_t v38 = sub_1B63D0F4C(v36);
    sub_1B659C9F8(v37, v38, v39);
    if (*(unsigned char *)(a1 + 315) == 2) {
      char v41 = 2;
    }
    else {
      char v41 = 1;
    }
    char v42 = *(unsigned char *)(a1 + 313);
    char v43 = *(unsigned char *)(a1 + 314);
    uint64_t v44 = *(void **)(a1 + 112);
    uint64_t v76 = a9;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v79 = v21;
    uint64_t v80 = a13;
    uint64_t v81 = 0;
    __int16 v82 = 15;
    char v83 = v42;
    char v84 = v41;
    char v85 = v43;
    long long v86 = 0u;
    memset(v87, 0, sizeof(v87));
    uint64_t v45 = objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(v44, v40, (uint64_t)&v76, *(void *)(a1 + 216));
    uint64_t v46 = *(void *)(a1 + 248);
    uint64_t v50 = objc_msgSend_state(v45, v47, v48, v49);
    objc_msgSend_setRenderPipelineState_(*(void **)(v46 + 16), v51, v50, v52);
    *(void *)(a1 + 18352) = 0;
    objc_msgSend_setRasterizerStates_((void *)a1, v53, a12, v54);
    if (a15)
    {
      LODWORD(v58) = -2.0;
      LODWORD(v59) = -2.0;
      objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(*(void *)(a1 + 248) + 16), v55, v56, v57, v58, v59, 0.0);
    }
    if (a14)
    {
      char v60 = objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(*(void **)(a1 + 112), v55, a14, 0, 0, a10, 0);
      sub_1B63C6ED0(*(void *)(a1 + 248), v60, 0, v61);
    }
    v75[0] = a2;
    v75[1] = a3;
    v75[2] = a4;
    v75[3] = a5;
    if (a11) {
      long long v62 = *a11;
    }
    else {
      long long v62 = 0uLL;
    }
    v75[4] = v62;
    uint64_t v63 = *(void *)(a1 + 248);
    double v88 = 0;
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    sub_1B649F334(*(void *)(v63 + 24), v75, 0x50uLL, &v88);
    objc_msgSend_setVertexBuffer_offset_atIndex_(*(void **)(v63 + 16), v64, v89, v90, 1);
    if (*(void *)(a1 + 18088) != a7)
    {
      *(void *)(a1 + 18088) = a7;
      objc_msgSend__setMeshBuffers_((void *)a1, v65, (uint64_t)v21, v66);
    }
    objc_msgSend__drawMeshElement_instanceCount_((void *)a1, v65, (uint64_t)v37, 1);
    if (a15) {
      objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(*(void *)(a1 + 248) + 16), v67, v68, v69, 0.0, 0.0, 0.0);
    }
  }
  else if ((byte_1E9DDAF28 & 1) == 0)
  {
    byte_1E9DDAF28 = 1;
    sub_1B63F2F54(16, @"Error: cannot renderMesh without a vaid passDescriptor", a7, a8, a9, a10, (uint64_t)a11, a12, a13);
  }
}

- (void)processRendererElements:(id *)a3 count:(unsigned int)a4 engineIterationContext:(id *)a5
{
  float v5 = a5;
  unint64_t var1 = (unint64_t)a5->var1;
  var2 = a5->var2;
  uint64_t v83 = *((void *)a5->var0 + 12);
  uint64_t v11 = sub_1B6447980(var1);
  uint64_t v82 = sub_1B6446190(var1, v12, v13, v14, v15, v16, v17, v18);
  if (self->_debugOptions & 2) != 0 && (BYTE2(var2[75].var8[11]))
  {
    int v21 = 1;
    objc_msgSend_setTriangleFillMode_(self->_renderEncoder->var3, v19, 1, v20);
    objc_msgSend_setLockFillMode_(self->_renderEncoder->var3, v22, 1, v23);
  }
  else
  {
    int v21 = 0;
  }
  objc_msgSend_startProcessingRendererElementsWithEngineIterationContext_(self, v19, (uint64_t)v5, v20);
  int v24 = sub_1B6447730(var1);
  uint64_t v81 = (void *)sub_1B64B2948((uint64_t)var2[76].var8[0], v25, v26, v27, v28, v29, v30, v31);
  if (!a4) {
    goto LABEL_35;
  }
  int v76 = v21;
  long long v78 = v5;
  uint64_t v79 = a3;
  uint64_t v39 = 0;
  uint64_t v80 = 0;
  unsigned int v77 = a4;
  uint64_t v40 = a4;
  char v41 = a3;
  do
  {
    unsigned int v42 = *v41++;
    unint64_t var1 = var1 & 0xFFFFFFFF00000000 | v42;
    uint64_t v43 = sub_1B661BF3C(v83, var1, v33, v34, v35, v36, v37, v38);
    uint64_t CurrentPassHash = objc_msgSend_getCurrentPassHash(self, v44, v45, v46);
    uint64_t v55 = sub_1B65F917C((uint64_t)var2, v48, v49, v50, v51, v52, v53, v54);
    uint64_t v56 = sub_1B63F6BFC(v82, (char *)v43, v55, CurrentPassHash);
    if (!v39) {
      goto LABEL_13;
    }
    if (sub_1B63F1400((uint64_t)v39)
      || sub_1B63F1400(v43)
      || v39[2] != *(void *)(v43 + 16)
      || v39[3] != *(void *)(v43 + 24)
      || v80 != v56
      || v39[6] != *(void *)(v43 + 48)
      || v39[8] != *(void *)(v43 + 64)
      || !sub_1B6561AD0(v81, *(void *)(v43 + 8), v57, v34, v35, v36, v37, v38))
    {
      sub_1B6488D80((uint64_t)self, (uint64_t)v39, (uint64_t)var2, v34, v35, v36, v37, v38);
      sub_1B6561AC8((uint64_t)v81);
      uint64_t v80 = 0;
LABEL_13:
      if (!sub_1B63F1400(v43)
        && !v24
        && v56
        && sub_1B659D93C(v56)
        && (uint64_t v63 = *(void *)(v43 + 16)) != 0
        && sub_1B63CEFD8(v63))
      {
        if ((sub_1B659D93C(v56) & 1) == 0) {
          sub_1B63F2F54(17, @"Assertion '%s' failed. shader does not support batching!", v64, v65, v66, v67, v68, v69, (uint64_t)"!programHashCode || CFXProgramHashCodeUseDynamicBatching(programHashCode)");
        }
        sub_1B6561AD0(v81, *(void *)(v43 + 8), v64, v65, v66, v67, v68, v69);
        uint64_t v80 = v56;
        if (!v11) {
          goto LABEL_25;
        }
      }
      else
      {
        sub_1B6488D80((uint64_t)self, v43, (uint64_t)var2, v58, v59, v60, v61, v62);
        uint64_t v43 = 0;
        if (!v11)
        {
LABEL_25:
          ++self->__engineStats->drawStep;
          uint64_t v39 = (void *)v43;
          goto LABEL_26;
        }
      }
      if ((*(uint64_t (**)(uint64_t))(v11 + 16))(v11)) {
        break;
      }
      goto LABEL_25;
    }
    uint64_t v43 = (uint64_t)v39;
LABEL_26:
    --v40;
  }
  while (v40);
  float v5 = v78;
  a3 = v79;
  a4 = v77;
  int v21 = v76;
  if (v43)
  {
    sub_1B6488D80((uint64_t)self, v43, (uint64_t)var2, v34, v35, v36, v37, v38);
    sub_1B6561AC8((uint64_t)v81);
  }
LABEL_35:
  BOOL isMainPass = self->_processingContext.isMainPass;
  char v71 = objc_msgSend_debugOptions(self, v32, v33, v34);
  if (isMainPass && (v71 & 4) != 0) {
    objc_msgSend_drawWireframeOverlayForElements_range_store_passInstance_(self, v72, (uint64_t)a3, 0, a4, v83, v5->var2);
  }
  if (v21)
  {
    objc_msgSend_setLockFillMode_(self->_renderEncoder->var3, v72, 0, v73);
    objc_msgSend_setTriangleFillMode_(self->_renderEncoder->var3, v74, 0, v75);
  }

  MEMORY[0x1F4181798](self, sel_stopProcessingRendererElements_, isMainPass, v73);
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(id *)a3
{
  uint64_t v245 = *MEMORY[0x1E4F143B8];
  var2 = a3->var2;
  self->_processingContext.passInstance = var2;
  long long v236 = var2;
  if (!var2) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_processingContext.passInstance");
  }
  uint64_t v18 = sub_1B644558C((uint64_t)a3->var1, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (a3->var1 != self->_engineContext) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. unexpected engine context", v12, v13, v14, v15, v16, v17, (uint64_t)"engineIterationContext->engineContext == _engineContext");
  }
  self->_processingContext.uint64_t lightingSystem = (__CFXLightingSystem *)sub_1B64B28B0(v18, v11, v12, v13, v14, v15, v16, v17);
  self->_processingContext.transformTree = (__CFXTransformTree *)sub_1B64B29E0(v18, v19, v20, v21, v22, v23, v24, v25);
  self->_processingContext.dynamicBatchingSystem = (__CFXDynamicBatchingSystem *)sub_1B64B2948(v18, v26, v27, v28, v29, v30, v31, v32);
  self->_processingContext.pass = (__CFXFXPass *)sub_1B65F917C((uint64_t)self->_processingContext.passInstance, v33, v34, v35, v36, v37, v38, v39);
  self->_processingContext.renderGraphPass = a3->var3;
  self->_processingContext.passRequiresLighting = a3->var6;
  self->_processingContext.BOOL isMainPass = a3->var9;
  self->_processingContext.programHashCodeStoreKey = a3->var4;
  uint64_t v40 = sub_1B63C1DE0((uint64_t)self->_processingContext.lightingSystem);
  *(void *)&self->_anon_250[396] = v41;
  *(void *)&self->_anon_250[388] = v40;
  unint64_t v47 = sub_1B6446D74((uint64_t)self->_engineContext, 0, 0, v42, v43, v44, v45, v46);
  long long v237 = *(_OWORD *)(v47 + 48);
  long long v240 = *(_OWORD *)(v47 + 32);
  sub_1B64462BC((uint64_t)self->_engineContext, v48, v49, v50, v51, v52, v53, v54);
  *(_OWORD *)&self->_anon_250[404] = *(_OWORD *)sub_1B64B2C6C(v18, v55, v56, v57, v58, v59, v60, v61);
  if (*((float *)&v240 + 3) == 0.0 && sub_1B63CC6D0()) {
    long long v69 = xmmword_1B6E4F2E0;
  }
  else {
    sub_1B64B2CB8(v18, v62, v63, v64, v65, v66, v67, v68);
  }
  *(_OWORD *)&self->_anon_250[420] = v69;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&self->_anon_250[436] = vdiv_f32(_D1, *(float32x2_t *)self->_renderSize);
  uint64_t v75 = sub_1B64B2810(v18, 0);
  if (v75)
  {
    uint64_t v83 = v75;
    if (sub_1B6475F88(v75, v76, v77, v78, v79, v80, v81, v82)
      || (BOOL v91 = sub_1B6477598(v83, v84, v85, v86, v87, v88, v89, v90), v92 = 1.0, v91))
    {
      float v92 = sub_1B64763AC(v83, v84, v85, v86, v87, v88, v89, v90);
    }
    *(float *)&self->_anon_250[464] = v92;
    uint64_t v75 = sub_1B647721C(v83, v84, v85, v86, v87, v88, v89, v90);
  }
  else
  {
    *(_DWORD *)&self->_anon_250[464] = 1065353216;
  }
  uint64_t v93 = (_OWORD *)MEMORY[0x1E4F149A0];
  uint64_t v94 = &self->_anon_250[4];
  if (v75) {
    uint64_t v93 = (_OWORD *)v75;
  }
  long long v95 = v93[1];
  long long v96 = v93[2];
  long long v97 = v93[3];
  *(_OWORD *)&self->_anon_250[468] = *v93;
  *(_OWORD *)&self->_anon_250[484] = v95;
  *(_OWORD *)&self->_anon_250[500] = v96;
  *(_OWORD *)&self->_anon_250[516] = v97;
  float v98 = sub_1B6447728((uint64_t)self->_engineContext);
  *(float *)&self->_anon_250[444] = v98;
  *(__float2 *)&self->_anon_250[448] = __sincosf_stret(v98);
  unsigned int v99 = 214013 * self->_seed + 2531011;
  self->_seed = v99;
  *(float *)&self->_anon_250[456] = (float)HIWORD(v99) * 0.000015259;
  *(_DWORD *)&self->_anon_250[772] = sub_1B6447B50((uint64_t)self->_engineContext, v100, v101, v102);
  v103.i32[1] = DWORD1(v240);
  *(float *)v103.i32 = *((float *)&v237 + 2) / *((float *)&v240 + 2);
  double v104 = (*((float *)&v237 + 2) + -1.0) / *((float *)&v240 + 2);
  if (*((float *)&v240 + 3) != 0.0) {
    double v104 = *((float *)&v237 + 2) / (*((float *)&v240 + 2) + 1.0);
  }
  *(float *)&double v104 = v104;
  int32x2_t v105 = vcgt_f32((float32x2_t)v103, *(float32x2_t *)&v104);
  v103.i32[1] = LODWORD(v104);
  *(int8x8_t *)&self->_anon_250[660] = vbsl_s8((int8x8_t)vdup_lane_s32(v105, 0), (int8x8_t)vrev64_s32(v103), (int8x8_t)v103);
  if (self->_processingContext.passRequiresLighting)
  {
    sub_1B6447C0C((uint64_t)self->_engineContext);
    sub_1B63FFCB8((uint64_t)&self->_anon_4100[144], (uint64_t)&self->_processingContext.passInstance->var9);
    memcpy(&self->_anon_4100[336], __src, 0x170uLL);
    *(_OWORD *)&self->_anon_250[756] = *(_OWORD *)&self->_anon_4100[400];
  }
  if (self->_renderPassParameters.viewMapping)
  {
    unsigned int eyeCount = self->_renderPassParameters.eyeCount;
    if (!self->_renderPassParameters.eyeCount)
    {
      unsigned int v234 = 0;
      float32x4_t v241 = 0u;
      goto LABEL_34;
    }
  }
  else
  {
    unsigned int eyeCount = 1;
  }
  uint64_t v107 = 0;
  unsigned int v234 = eyeCount;
  uint64_t v108 = eyeCount;
  uint64_t v109 = &self->_anon_250[84];
  float32x4_t v241 = 0u;
  __asm { FMOV            V0.4S, #1.0 }
  float32x4_t v235 = _Q0;
  do
  {
    int renderSliceIndex = self->_renderPassParameters.renderSliceIndex;
    if (v107) {
      memcpy(v109 - 80, &self->_anon_250[4], 0x310uLL);
    }
    uint64_t v112 = (v107 + renderSliceIndex);
    v113 = (float32x4_t *)((char *)v236 + 64 * v112);
    *(float32x4_t *)__src = v113[523];
    *(float32x4_t *)&__src[16] = v113[524];
    *(float32x4_t *)&__src[32] = v113[525];
    *(float32x4_t *)&__src[48] = v113[526];
    float32x4_t v114 = v113[524];
    float32x4_t v115 = v113[525];
    float32x4_t v116 = v113[526];
    *((float32x4_t *)v109 - 5) = v113[523];
    *((float32x4_t *)v109 - 4) = v114;
    *((float32x4_t *)v109 - 3) = v115;
    *((float32x4_t *)v109 - 2) = v116;
    float32x4_t v117 = v113[460];
    float32x4_t v118 = v113[461];
    float32x4_t v119 = v113[462];
    *((float32x4_t *)v109 - 1) = v113[459];
    *(float32x4_t *)uint64_t v109 = v117;
    *((float32x4_t *)v109 + 1) = v118;
    *((float32x4_t *)v109 + 2) = v119;
    float32x4_t v238 = v113[462];
    simd_float4x4 v243 = *(simd_float4x4 *)__src;
    sub_1B64B3020(v18, &v243);
    simd_float4 v120 = v243.columns[1];
    simd_float4 v121 = v243.columns[2];
    simd_float4 v122 = v243.columns[3];
    *((_OWORD *)v109 + 11) = v243.columns[0];
    *((simd_float4 *)v109 + 12) = v120;
    *((simd_float4 *)v109 + 13) = v121;
    *((simd_float4 *)v109 + 14) = v122;
    float32x4_t v123 = v113[588];
    float32x4_t v124 = v113[589];
    float32x4_t v125 = v113[590];
    *((float32x4_t *)v109 + 3) = v113[587];
    *((float32x4_t *)v109 + 4) = v123;
    *((float32x4_t *)v109 + 5) = v124;
    *((float32x4_t *)v109 + 6) = v125;
    float32x4_t v126 = v113[652];
    float32x4_t v127 = v113[653];
    float32x4_t v128 = v113[654];
    *((float32x4_t *)v109 + 7) = v113[651];
    *((float32x4_t *)v109 + 8) = v126;
    *((float32x4_t *)v109 + 9) = v127;
    *((float32x4_t *)v109 + 10) = v128;
    float32x4_t v129 = *((float32x4_t *)v109 - 5);
    float32x4_t v130 = *((float32x4_t *)v109 - 4);
    float32x4_t v131 = *((float32x4_t *)v109 - 3);
    long long v132 = *((_OWORD *)v109 - 2);
    int32x4_t v133 = (int32x4_t)vmulq_f32(v129, v129);
    int32x4_t v134 = (int32x4_t)vmulq_f32(v130, v130);
    int32x4_t v135 = (int32x4_t)vmulq_f32(v131, v131);
    int32x4_t v136 = vzip1q_s32(v133, v135);
    int32x4_t v137 = vzip2q_s32(v133, v135);
    float32x4_t v138 = (float32x4_t)vtrn2q_s32(v133, v134);
    v138.i32[2] = v135.i32[1];
    float32x4_t v139 = vaddq_f32((float32x4_t)vzip1q_s32(v137, vdupq_laneq_s32(v134, 2)), vaddq_f32((float32x4_t)vzip1q_s32(v136, v134), v138));
    int32x4_t v140 = vceqzq_f32(v139);
    v140.i32[3] = 0;
    float32x4_t v141 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v140), (int8x16_t)v139, (int8x16_t)vdivq_f32(v235, v139));
    *((float32x4_t *)v109 + 38) = vmulq_n_f32(v129, v141.f32[0]);
    *((float32x4_t *)v109 + 39) = vmulq_lane_f32(v130, *(float32x2_t *)v141.f32, 1);
    *((float32x4_t *)v109 + 40) = vmulq_laneq_f32(v131, v141, 2);
    *((_OWORD *)v109 + 41) = v132;
    if (sub_1B64479BC((uint64_t)self->_engineContext))
    {
      float32x4_t v149 = v113[732];
      float32x4_t v150 = v113[733];
      float32x4_t v151 = v113[734];
      *((float32x4_t *)v109 + 15) = v113[731];
      *((float32x4_t *)v109 + 16) = v149;
      *((float32x4_t *)v109 + 17) = v150;
      *((float32x4_t *)v109 + 18) = v151;
      float32x4_t v152 = sub_1B6446564((uint64_t *)a3->var1, v142, v143, v144, v145, v146, v147, v148);
      if (v152)
      {
        CFDictionaryRef v160 = sub_1B64A3B48((uint64_t)v152, v153, v154, v155, v156, v157, v158, v159);
        if (v160)
        {
          uint64_t v168 = (uint64_t)v160;
          if (sub_1B649B548((uint64_t)v160, v161, v162, v163, v164, v165, v166, v167))
          {
            uint64_t v176 = sub_1B649A798(v168, v169, v170, v171, v172, v173, v174, v175);
            *((float *)v109 + 94) = sub_1B6529330(v176, v177, v178, v179, v180, v181, v182, v183) * 0.5;
          }
        }
      }
    }
    float32x4_t v241 = vaddq_f32(v241, v238);
    uint64_t v184 = (simd_float4x4 *)&v94[784 * v112];
    *((simd_float4x4 *)v109 + 7) = __invert_f4(v184[2]);
    *((simd_float4x4 *)v109 + 8) = __invert_f4(v184[3]);
    *((int8x16_t *)v109 + 37) = vextq_s8(*((int8x16_t *)&v236[68].var2 + v107), *((int8x16_t *)&v236[68].var2 + v107), 8uLL);
    ++v107;
    v109 += 784;
  }
  while (v108 != v107);
LABEL_34:
  if (sub_1B644805C((uint64_t)self->_engineContext))
  {
    *(float *)v191.i32 = (float)v234;
    float32x4_t v192 = vdivq_f32(v241, (float32x4_t)vdupq_lane_s32(v191, 0));
    if (v234 >= 2) {
      uint64_t v193 = 2;
    }
    else {
      uint64_t v193 = v234;
    }
    uint64_t v242 = v193;
    if (v234 >= 3 && (byte_1E9DDAF29 & 1) == 0)
    {
      byte_1E9DDAF29 = 1;
      float32x4_t v239 = v192;
      sub_1B63F2F54(16, @"Error: VFXCore can render a maximum of %d pov - %d were asked", v185, v186, v187, v188, v189, v190, 2);
      float32x4_t v192 = v239;
    }
    *(float32x4_t *)&self->_anon_43d0[544] = v192;
    *(void *)&long long v194 = *(void *)self->_renderSize;
    *((void *)&v194 + 1) = *(void *)&self->_anon_250[436];
    *(_OWORD *)&self->_anon_43d0[560] = v194;
    BOOL v195 = self->_renderPassParameters.multiVertexOutputStreamGenerator == 2;
    *(_DWORD *)&self->_anon_43d0[576] = v242;
    *(_DWORD *)&self->_anon_43d0[580] = v195;
    if (v242)
    {
      for (uint64_t i = 0; i != v242; ++i)
      {
        uint64_t v198 = 0;
        v199 = (float32x4_t *)&v94[784 * i];
        float32x4_t v200 = *v199;
        float32x4_t v201 = v199[1];
        float32x4_t v202 = v199[2];
        float32x4_t v203 = v199[3];
        simd_float4 v204 = *(simd_float4 *)&self->_anon_43d0[544];
        v204.i32[3] = 1.0;
        v243.columns[0] = (simd_float4)xmmword_1B6E4F300;
        v243.columns[1] = (simd_float4)xmmword_1B6E4F320;
        v243.columns[2] = (simd_float4)xmmword_1B6E4F2E0;
        v243.columns[3] = v204;
        do
        {
          *(float32x4_t *)&__src[v198 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v200, COERCE_FLOAT(*(_OWORD *)&v243.columns[v198])), v201, *(float32x2_t *)v243.columns[v198].f32, 1), v202, (float32x4_t)v243.columns[v198], 2), v203, (float32x4_t)v243.columns[v198], 3);
          ++v198;
        }
        while (v198 != 4);
        uint64_t v205 = 0;
        simd_float4 v206 = *(simd_float4 *)__src;
        simd_float4 v207 = *(simd_float4 *)&__src[16];
        simd_float4 v208 = *(simd_float4 *)&__src[32];
        simd_float4 v209 = *(simd_float4 *)&__src[48];
        float32x4_t v210 = &self->_anon_43d0[64 * i];
        *(_OWORD *)float32x4_t v210 = *(_OWORD *)__src;
        *((simd_float4 *)v210 + 1) = v207;
        *((simd_float4 *)v210 + 2) = v208;
        *((simd_float4 *)v210 + 3) = v209;
        long long v211 = (float32x4_t *)&v94[784 * i];
        float32x4_t v213 = v211[8];
        float32x4_t v214 = v211[9];
        float32x4_t v212 = v211 + 8;
        float32x4_t v215 = v212[2];
        float32x4_t v216 = v212[3];
        v243.columns[0] = v206;
        v243.columns[1] = v207;
        v243.columns[2] = v208;
        v243.columns[3] = v209;
        do
        {
          *(float32x4_t *)&__src[v205 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v213, COERCE_FLOAT(*(_OWORD *)&v243.columns[v205])), v214, *(float32x2_t *)v243.columns[v205].f32, 1), v215, (float32x4_t)v243.columns[v205], 2), v216, (float32x4_t)v243.columns[v205], 3);
          ++v205;
        }
        while (v205 != 4);
        long long v217 = *(_OWORD *)&__src[16];
        long long v218 = *(_OWORD *)&__src[32];
        long long v219 = *(_OWORD *)&__src[48];
        float32x4_t v220 = &self->_anon_43d0[64 * i + 128];
        *(_OWORD *)float32x4_t v220 = *(_OWORD *)__src;
        *((_OWORD *)v220 + 1) = v217;
        *((_OWORD *)v220 + 2) = v218;
        *((_OWORD *)v220 + 3) = v219;
        float32x4_t v221 = &self->_anon_43d0[64 * i + 256];
        float32x4_t v222 = *v212;
        float32x4_t v223 = v212[1];
        float32x4_t v224 = v212[3];
        *((float32x4_t *)v221 + 2) = v212[2];
        *((float32x4_t *)v221 + 3) = v224;
        *(float32x4_t *)float32x4_t v221 = v222;
        *((float32x4_t *)v221 + 1) = v223;
        long long v225 = &v94[784 * i];
        long long v226 = &self->_anon_43d0[64 * i + 384];
        long long v227 = *((_OWORD *)v225 + 33);
        long long v228 = *((_OWORD *)v225 + 34);
        long long v229 = *((_OWORD *)v225 + 36);
        *((_OWORD *)v226 + 2) = *((_OWORD *)v225 + 35);
        *((_OWORD *)v226 + 3) = v229;
        *(_OWORD *)long long v226 = v227;
        *((_OWORD *)v226 + 1) = v228;
        *(float32x4_t *)&self->_anon_43d0[16 * i + 512] = vsubq_f32(*((float32x4_t *)&v236[44].var0 + 4 * i), *(float32x4_t *)&self->_anon_43d0[544]);
        v197 = (const double *)&self->_anon_43d0[560];
        float32x4_t v230 = (float32x4_t)vld1q_dup_f64(v197);
        *(float32x4_t *)&self->_anon_43d0[16 * i + 592] = vdivq_f32(*((float32x4_t *)&v236[68].var2 + i), v230);
        __n128 v231 = sub_1B64471F4((uint64_t)self->_engineContext, i, v185, v186, v187, v188, v189, v190);
        int v232 = &self->_vfxCoreViewports[i];
        *(float64x2_t *)&v232->originX = vcvtq_f64_f32((float32x2_t)v231.n128_u64[0]);
        *(float64x2_t *)&v232->width = vcvt_hight_f64_f32((float32x4_t)v231);
        *(_OWORD *)&v232->znear = xmmword_1B6E500C0;
      }
    }
  }
  memset(__src, 0, 24);
  sub_1B649F334((uint64_t)self->_frameConstantBufferPool, &self->_anon_250[4], 784 * v234, (void **)__src);
  unint64_t v233 = *(void *)&__src[16];
  self->_worldUniforms.buffer = *(MTLBuffer **)&__src[8];
  self->_worldUniforms.unint64_t offset = v233;
}

- (void)stopProcessingRendererElements:(BOOL)a3
{
  if (a3)
  {
    if (self->_processingContext.passRequiresLighting
      && sub_1B6446254((uint64_t)self->_engineContext, 0, a3, v3, v4, v5, v6, v7)
      && (sub_1B6446228((uint64_t)self->_engineContext) & 0x100000) != 0
      && !self->_processingContext.passInstance[75].var8[15])
    {
      sub_1B640164C((uint64_t)&self->_anon_4100[144], (uint64_t)self->_renderEncoder);
    }
    unint64_t debugOptions = self->_debugOptions;
    if ((debugOptions & 0x10) != 0)
    {
      objc_msgSend__drawPBRTextures(self, a2, a3, v3);
      unint64_t debugOptions = self->_debugOptions;
    }
    if ((debugOptions & 8) != 0) {
      objc_msgSend__drawShadowMaps(self, a2, a3, v3);
    }
  }
  *(_OWORD *)&self->_processingContext.renderGraphPass = 0u;
  *(_OWORD *)&self->_processingContext.transformTree = 0u;
  *(_OWORD *)&self->_processingContext.passInstance = 0u;
  *(_OWORD *)&self->_processingContext.dynamicBatchingSystem = 0u;
}

- (void)_prepareMaterialTextures:(__CFXMaterial *)a3
{
  uint64_t v9 = sub_1B64AF43C((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (v9)
  {
    uint64_t v17 = v9;
    int v20 = sub_1B64757A4(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v20 == 3) {
      objc_msgSend_specularDFGDiffuseHammonTextureWithRenderContext_(self->_resourceManager, v18, (uint64_t)self, v19);
    }
    char v21 = sub_1B6489B18();
    if (v21)
    {
      char v22 = v21;
      char v23 = 0;
      do
      {
        if (sub_1B6475064(v20, v23))
        {
          uint64_t v29 = sub_1B6475290(v17, v23, 0, v24, v25, v26, v27, v28);
          if (v29) {
            objc_msgSend_textureForMaterialProperty_(self, v30, v29, v31);
          }
        }
        ++v23;
      }
      while (v23 != v22);
    }
  }
}

- (void)_executeDrawCommand:(id *)a3
{
  uint64_t v615 = *MEMORY[0x1E4F143B8];
  var0 = a3->var0;
  var2 = a3->var2;
  unint64_t var1 = a3->var1;
  id var3 = a3->var3;
  var4 = a3->var4;
  var5 = a3->var5;
  var7 = a3->var7;
  var8 = a3->var8;
  uint64_t v509 = (uint64_t)var3;
  BOOL var9 = a3->var9;
  v499 = a3;
  LODWORD(p_resourceManagerMonitor) = a3->var10;
  if (var2
    && sub_1B63CF088((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7)
    && (self->_features & 0x10) != 0)
  {
    BOOL v15 = (*((unsigned char *)v499 + 77) & 7) != 0;
    unsigned int v501 = 1;
  }
  else
  {
    unsigned int v501 = 0;
    BOOL v15 = 0;
  }
  if (var0)
  {
    if (!var2) {
      goto LABEL_14;
    }
  }
  else
  {
    if ((byte_1E9DDAF2A & 1) == 0)
    {
      byte_1E9DDAF2A = 1;
      sub_1B63F2F54(16, @"Error: can not render without programs, using default", (uint64_t)a3, v3, v4, v5, v6, v7, v495);
    }
    var0 = (__CFXFXProgram *)objc_msgSend_defaultProgramUsingTessellation_(self->_resourceManager, a2, v501, v3);
    if (!var2) {
      goto LABEL_14;
    }
  }
  if (sub_1B65849C8((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7) || sub_1B63CD09C((uint64_t)var2))
  {
    v507 = var2;
    goto LABEL_15;
  }
LABEL_14:
  v507 = 0;
LABEL_15:
  v513 = &self->_anon_3378[3248];
  program = self->_cache.program;
  uint64_t v17 = var0;
  self->_cache.program = var0;
  mesh = self->_cache.mesh;
  v500 = program;
  BOOL v20 = mesh != var4 || program != v17;
  if (var2) {
    v516.i32[0] = sub_1B63CF130((uint64_t)var2, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  else {
    v516.i32[0] = 1;
  }
  v517.i64[0] = (uint64_t)var7;
  v515.i32[0] = var9;
  if (!v509)
  {
    if (self->_cache.deformers) {
      char v29 = 1;
    }
    else {
      char v29 = v20;
    }
    self->_cache.deformers = 0;
    if (v29)
    {
      v514.i32[0] = 0;
      uint64_t v505 = 0;
      BOOL v30 = 0;
      int v510 = -1;
      goto LABEL_42;
    }
    int v496 = 0;
    v514.i32[0] = 0;
    uint64_t v505 = 0;
    uint64_t v35 = 0;
    LOBYTE(v30) = 0;
    int v510 = -1;
    goto LABEL_49;
  }
  uint64_t v21 = sub_1B64A16A0(v509, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v514.i32[0] = v21 != 0;
  uint64_t v505 = v21;
  if (v21) {
    int v510 = sub_1B6524E80(v21);
  }
  else {
    int v510 = -1;
  }
  uint64_t v31 = (__CFXDeformerStack *)sub_1B649F5A8(v509, v22, v23, v24, v25, v26, v27, v28);
  char v32 = self->_cache.deformers != v31 || v20;
  self->_cache.deformers = v31;
  if (!v31 || (uint64_t v33 = (uint64_t)v31, !sub_1B65E1B38(v31, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7)))
  {
    if (v32)
    {
      BOOL v30 = 0;
      goto LABEL_42;
    }
    int v496 = 0;
    uint64_t v35 = 0;
    LOBYTE(v30) = 0;
LABEL_49:
    if (v501) {
      goto LABEL_113;
    }
LABEL_70:
    __int32 v69 = 0;
    v498 = 0;
    BOOL v70 = v513[1920] == 0;
    v513[1920] = 0;
    goto LABEL_116;
  }
  unsigned __int8 v34 = v499->var11 || sub_1B63DEEAC((uint64_t)var2, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
  uint64_t v71 = objc_msgSend_renderResourceForDeformerStack_node_dataKind_(self->_resourceManager, a2, v33, v509, v516.u32[0]);
  if (sub_1B64A8F70(v71))
  {
    BOOL v546 = 0;
    sub_1B6561B20((uint64_t)self->_processingContext.dynamicBatchingSystem, &v546);
    if (v546 >= 2) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. CFXDeformerTransforms is not supported when instancing is active", v72, v73, v74, v75, v76, v77, (uint64_t)"dynamicBatchCount < 2");
    }
    uint64_t v78 = (long long *)sub_1B651004C((uint64_t)self->_processingContext.transformTree, *(_DWORD *)(v509 + 88), v72, v73, v74, v75, v76, v77);
    long long v79 = *v78;
    long long v80 = v78[1];
    long long v81 = v78[2];
    long long v82 = v78[3];
    *(_OWORD *)&self->_nodeUniforms.instanceNode = *v78;
    *(_OWORD *)&self->_nodeUniforms.probeCacheIndex = v80;
    *(_OWORD *)&self->_anon_3378[8] = v81;
    *(_OWORD *)&self->_anon_3378[24] = v82;
    uint64_t eyeCount = self->_renderPassParameters.eyeCount;
    uint64_t v84 = v513;
    *(_DWORD *)v513 = 2;
    if (eyeCount)
    {
      uint64_t v85 = 0;
      uint64_t v86 = &self->_anon_250[4];
      do
      {
        uint64_t v87 = 0;
        uint64_t v88 = (float32x4_t *)&v86[784 * v85];
        float32x4_t v89 = *v88;
        float32x4_t v90 = v88[1];
        float32x4_t v91 = v88[2];
        float32x4_t v92 = v88[3];
        long long v589 = v79;
        long long v590 = v80;
        long long v591 = v81;
        long long v592 = v82;
        do
        {
          *(long long *)((char *)&v597 + v87) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(*(long long *)((char *)&v589 + v87))), v90, *(float32x2_t *)((char *)&v589 + v87), 1), v91, *(float32x4_t *)((char *)&v589 + v87), 2), v92, *(float32x4_t *)((char *)&v589 + v87), 3);
          v87 += 16;
        }
        while (v87 != 64);
        long long v93 = v598;
        long long v94 = v599;
        long long v95 = v600;
        long long v96 = &self->_anon_3378[64 * v85 + 1128];
        *(_OWORD *)long long v96 = v597;
        *((_OWORD *)v96 + 1) = v93;
        *((_OWORD *)v96 + 2) = v94;
        *((_OWORD *)v96 + 3) = v95;
        ++v85;
      }
      while (v85 != eyeCount);
      if ((*(_DWORD *)v513 & 4) == 0)
      {
        uint64_t v97 = 0;
        *(_DWORD *)v513 |= 4u;
        do
        {
          uint64_t v98 = 0;
          unsigned int v99 = (float32x4_t *)&v86[784 * v97];
          float32x4_t v100 = v99[12];
          float32x4_t v101 = v99[13];
          float32x4_t v102 = v99[14];
          float32x4_t v103 = v99[15];
          long long v589 = v79;
          long long v590 = v80;
          long long v591 = v81;
          long long v592 = v82;
          do
          {
            *(long long *)((char *)&v597 + v98) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, COERCE_FLOAT(*(long long *)((char *)&v589 + v98))), v101, *(float32x2_t *)((char *)&v589 + v98), 1), v102, *(float32x4_t *)((char *)&v589 + v98), 2), v103, *(float32x4_t *)((char *)&v589 + v98), 3);
            v98 += 16;
          }
          while (v98 != 64);
          long long v104 = v598;
          long long v105 = v599;
          long long v106 = v600;
          uint64_t v107 = &self->_anon_3378[64 * v97 + 2152];
          *(_OWORD *)uint64_t v107 = v597;
          *((_OWORD *)v107 + 1) = v104;
          *((_OWORD *)v107 + 2) = v105;
          *((_OWORD *)v107 + 3) = v106;
          ++v97;
        }
        while (v97 != eyeCount);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v84 = 6;
    }
    long long v108 = *(_OWORD *)&self->_anon_3378[1144];
    long long v589 = *(_OWORD *)&self->_anon_3378[1128];
    long long v590 = v108;
    long long v109 = *(_OWORD *)&self->_anon_3378[1176];
    long long v591 = *(_OWORD *)&self->_anon_3378[1160];
    long long v592 = v109;
    long long v110 = *(_OWORD *)&self->_anon_3378[2168];
    long long v593 = *(_OWORD *)&self->_anon_3378[2152];
    long long v594 = v110;
    long long v111 = *(_OWORD *)&self->_anon_3378[2200];
    long long v595 = *(_OWORD *)&self->_anon_3378[2184];
    long long v596 = v111;
    long long v112 = *(_OWORD *)&self->_anon_250[132];
    long long v113 = *(_OWORD *)&self->_anon_250[148];
    long long v114 = *(_OWORD *)&self->_anon_250[164];
    long long v608 = *(_OWORD *)&self->_anon_250[180];
    long long v607 = v114;
    long long v606 = v113;
    long long v605 = v112;
    long long v600 = v592;
    long long v599 = v591;
    long long v598 = v590;
    long long v597 = v589;
    long long v604 = v596;
    long long v603 = v595;
    long long v602 = v594;
    long long v601 = v593;
  }
  if (sub_1B64A8F84(v71))
  {
    objc_msgSend_renderSize(self, v115, v116, v117);
    uint64_t v118 = 0;
    *(void *)&long long v589 = v119;
    long long v120 = *(_OWORD *)&self->_anon_3378[2152];
    long long v121 = *(_OWORD *)&self->_anon_3378[2168];
    long long v122 = *(_OWORD *)&self->_anon_3378[2184];
    long long v123 = *(_OWORD *)&self->_anon_3378[2200];
    do
    {
      uint64_t v124 = 0;
      float32x4_t v125 = (float *)((unint64_t)&v519 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      long long v518 = v120;
      float v126 = *(float *)((unint64_t)&v518 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      long long v519 = v121;
      float v127 = *((float *)&v121 + 3) - *v125;
      float v128 = *((float *)&v121 + 3) + *v125;
      long long v520 = v122;
      float v129 = *(float *)((unint64_t)&v520 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      long long v521 = v123;
      float v130 = *(float *)((unint64_t)&v521 & 0xFFFFFFFFFFFFFFF3 | (4 * (v118 & 3)));
      float v131 = *((float *)&v122 + 3) - v129;
      float v132 = *((float *)&v122 + 3) + v129;
      char v133 = 1;
      do
      {
        int v134 = v133 & 1;
        if (v133) {
          float v135 = v126;
        }
        else {
          float v135 = -v126;
        }
        int32x4_t v136 = (float32x4_t *)(&v589 + (v124 | (2 * v118)));
        float32x4_t v137 = v136[1];
        v137.f32[0] = *((float *)&v120 + 3) + v135;
        if (v133) {
          float v138 = v128;
        }
        else {
          float v138 = v127;
        }
        v137.f32[1] = v138;
        if (v133) {
          float v139 = v132;
        }
        else {
          float v139 = v131;
        }
        v137.f32[2] = v139;
        float32x4_t v140 = vmulq_f32(v137, v137);
        float32x4_t v141 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v140.f32, 1);
        if (v133) {
          float v142 = v130;
        }
        else {
          float v142 = -v130;
        }
        v137.f32[3] = *((float *)&v123 + 3) + v142;
        v136[1] = vmulq_n_f32(v137, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v140, 2), vaddq_f32(v140, v141)).f32[0]));
        uint64_t v124 = 1;
        char v133 = 0;
      }
      while (v134);
      ++v118;
    }
    while (v118 != 3);
  }
  double v143 = CACurrentMediaTime();
  prof_beginFlame((uint64_t)"Deformer", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/CFX/NewRenderer/VFXMTLRenderContext.mm", 3329);
  BOOL v546 = 0;
  v588[8] = v605;
  v588[9] = v606;
  v588[10] = v607;
  v588[11] = v608;
  v588[4] = v601;
  v588[5] = v602;
  v588[6] = v603;
  v588[7] = v604;
  v588[0] = v597;
  v588[1] = v598;
  v588[2] = v599;
  v588[3] = v600;
  v587[4] = v593;
  v587[5] = v594;
  v587[6] = v595;
  v587[0] = v589;
  v587[1] = v590;
  v587[3] = v592;
  v587[2] = v591;
  uint64_t v35 = (VFXMTLMesh *)sub_1B64A8F98(v71, (uint64_t)self, v34, v588, v587, &v546);
  self->__engineStats->mrphTime = CACurrentMediaTime() - v143 + self->__engineStats->mrphTime;
  prof_endFlame();
  BOOL v30 = v546;
  if (v32)
  {
    var7 = (__CFXFXPass *)v517.i64[0];
    if (v35)
    {
      *((void *)v513 + 208) = var4;
      uint64_t v36 = v35;
LABEL_53:
      self->_cache.metalMesh = v35;
      int v496 = 1;
      uint64_t v35 = v36;
      goto LABEL_54;
    }
LABEL_42:
    if (v499->var11 && (v501 & v15 & 1) == 0) {
      sub_1B63DEF50((uint64_t)var4, v516.u32[0], (uint64_t)a3, v3, v4, v5, v6, v7);
    }
    *((void *)v513 + 208) = var4;
    if (var4) {
      uint64_t v35 = sub_1B653C844((uint64_t)self->_resourceManager, (uint64_t)var4, v516.u32[0]);
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v36 = 0;
    goto LABEL_53;
  }
  int v496 = 0;
  var7 = (__CFXFXPass *)v517.i64[0];
LABEL_54:
  if ((v501 & 1) == 0) {
    goto LABEL_70;
  }
  if (v30)
  {
    uint64_t v37 = self->_renderPassParameters.eyeCount;
    int v38 = *(_DWORD *)v513;
    if ((*(_DWORD *)v513 & 2) == 0)
    {
      *(_DWORD *)v513 = v38 | 2;
      if (!v37)
      {
        if ((v38 & 4) == 0) {
          *(_DWORD *)v513 = v38 | 6;
        }
        goto LABEL_112;
      }
      uint64_t v39 = 0;
      long long v40 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
      long long v41 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
      long long v42 = *(_OWORD *)&self->_anon_3378[8];
      long long v43 = *(_OWORD *)&self->_anon_3378[24];
      do
      {
        uint64_t v44 = 0;
        uint64_t v45 = &self->_anon_250[784 * v39 + 4];
        float32x4_t v46 = *(float32x4_t *)v45;
        float32x4_t v47 = *((float32x4_t *)v45 + 1);
        float32x4_t v48 = *((float32x4_t *)v45 + 2);
        float32x4_t v49 = *((float32x4_t *)v45 + 3);
        long long v589 = v40;
        long long v590 = v41;
        long long v591 = v42;
        long long v592 = v43;
        do
        {
          *(long long *)((char *)&v597 + v44) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(long long *)((char *)&v589 + v44))), v47, *(float32x2_t *)((char *)&v589 + v44), 1), v48, *(float32x4_t *)((char *)&v589 + v44), 2), v49, *(float32x4_t *)((char *)&v589 + v44), 3);
          v44 += 16;
        }
        while (v44 != 64);
        long long v50 = v598;
        long long v51 = v599;
        long long v52 = v600;
        uint64_t v53 = &self->_anon_3378[64 * v39 + 1128];
        *(_OWORD *)uint64_t v53 = v597;
        *((_OWORD *)v53 + 1) = v50;
        *((_OWORD *)v53 + 2) = v51;
        *((_OWORD *)v53 + 3) = v52;
        ++v39;
      }
      while (v39 != v37);
      int v38 = *(_DWORD *)v513;
    }
    if ((v38 & 4) == 0)
    {
      *(_DWORD *)v513 = v38 | 4;
      if (v37)
      {
        uint64_t v54 = 0;
        long long v55 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
        long long v56 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
        long long v57 = *(_OWORD *)&self->_anon_3378[8];
        long long v58 = *(_OWORD *)&self->_anon_3378[24];
        do
        {
          uint64_t v59 = 0;
          uint64_t v60 = &self->_anon_250[784 * v54 + 4];
          float32x4_t v61 = *((float32x4_t *)v60 + 12);
          float32x4_t v62 = *((float32x4_t *)v60 + 13);
          float32x4_t v63 = *((float32x4_t *)v60 + 14);
          float32x4_t v64 = *((float32x4_t *)v60 + 15);
          long long v589 = v55;
          long long v590 = v56;
          long long v591 = v57;
          long long v592 = v58;
          do
          {
            *(long long *)((char *)&v597 + v59) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(long long *)((char *)&v589 + v59))), v62, *(float32x2_t *)((char *)&v589 + v59), 1), v63, *(float32x4_t *)((char *)&v589 + v59), 2), v64, *(float32x4_t *)((char *)&v589 + v59), 3);
            v59 += 16;
          }
          while (v59 != 64);
          long long v65 = v598;
          long long v66 = v599;
          long long v67 = v600;
          uint64_t v68 = &self->_anon_3378[64 * v54 + 2152];
          *(_OWORD *)uint64_t v68 = v597;
          *((_OWORD *)v68 + 1) = v65;
          *((_OWORD *)v68 + 2) = v66;
          *((_OWORD *)v68 + 3) = v67;
          ++v54;
        }
        while (v54 != v37);
      }
    }
LABEL_112:
    LOBYTE(v30) = 1;
  }
LABEL_113:
  long long v144 = *(_OWORD *)&self->_anon_3378[1144];
  long long v597 = *(_OWORD *)&self->_anon_3378[1128];
  long long v598 = v144;
  long long v145 = *(_OWORD *)&self->_anon_3378[1176];
  long long v599 = *(_OWORD *)&self->_anon_3378[1160];
  long long v600 = v145;
  long long v146 = *(_OWORD *)&self->_anon_3378[2168];
  long long v601 = *(_OWORD *)&self->_anon_3378[2152];
  long long v602 = v146;
  long long v147 = *(_OWORD *)&self->_anon_3378[2200];
  long long v603 = *(_OWORD *)&self->_anon_3378[2184];
  long long v604 = v147;
  long long v148 = *(_OWORD *)&self->_anon_250[132];
  long long v149 = *(_OWORD *)&self->_anon_250[148];
  long long v150 = *(_OWORD *)&self->_anon_250[164];
  long long v608 = *(_OWORD *)&self->_anon_250[180];
  long long v607 = v150;
  long long v606 = v149;
  long long v605 = v148;
  metalMesh = self->_cache.metalMesh;
  unint64_t currentFrameIndex = self->_currentFrameIndex;
  uint64_t v153 = sub_1B653D388((uint64_t)self->_resourceManager, (uint64_t)var2);
  v582[0] = metalMesh;
  v582[1] = self;
  v582[2] = &v597;
  int v583 = currentFrameIndex;
  BOOL v584 = v30;
  __int16 v585 = 0;
  char v586 = 0;
  objc_msgSend_update_(v153, v154, (uint64_t)v582, v155);
  metalMeshElement = self->_cache.metalMeshElement;
  uint64_t v157 = *((unsigned char *)v499 + 77) & 7;
  v498 = v153;
  __int32 v69 = objc_msgSend_pipelineStateHashForMeshElement_patchType_(v153, v158, (uint64_t)metalMeshElement, v157);
  BOOL v70 = v513[1920] == v69;
  v513[1920] = v69;
  if (v15)
  {
    self->_cache.meshElement = var5;
    self->_cache.metalMeshElement = 0;
    uint64_t v159 = v513;
    var7 = (__CFXFXPass *)v517.i64[0];
    goto LABEL_132;
  }
  var7 = (__CFXFXPass *)v517.i64[0];
LABEL_116:
  if (self->_cache.meshElement == var5) {
    goto LABEL_128;
  }
  if (v35) {
    char v160 = v15;
  }
  else {
    char v160 = 1;
  }
  if ((v160 & 1) == 0)
  {
    CFIndex v171 = sub_1B64AD260((uint64_t)var4, var5, v516.u32[0], v3, v4, v5, v6, v7);
    if (v171 != -1)
    {
      uint64_t v172 = v171;
      uint64_t v173 = (void *)sub_1B659C6F8((uint64_t)v35);
      uint64_t v176 = (VFXMTLMeshElement *)objc_msgSend_objectAtIndexedSubscript_(v173, v174, v172, v175);
      self->_cache.meshElement = var5;
      self->_cache.metalMeshElement = v176;
      uint64_t v159 = v513;
      if (sub_1B659C6D8((uint64_t)v176)) {
        goto LABEL_132;
      }
      uint64_t v177 = sub_1B63D0F4C((uint64_t)var5);
      sub_1B659C9F8(v176, v177, v178);
      uint64_t v179 = (uint64_t)v176;
      goto LABEL_131;
    }
LABEL_128:
    uint64_t v159 = v513;
    goto LABEL_132;
  }
  self->_cache.meshElement = var5;
  if (var5)
  {
    uint64_t v161 = sub_1B653C040((uint64_t)self->_resourceManager, (uint64_t)var5);
    p_metalMeshElement = &self->_cache.metalMeshElement;
    self->_cache.metalMeshElement = v161;
    uint64_t v159 = v513;
    if (!v161) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v162, v163, v164, v165, v166, v167, (uint64_t)"_cache.metalMeshElement");
    }
    uint64_t v169 = sub_1B63D0F4C((uint64_t)var5);
    sub_1B659C9F8(*p_metalMeshElement, v169, v170);
  }
  else
  {
    p_metalMeshElement = &self->_cache.metalMeshElement;
    self->_cache.metalMeshElement = 0;
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_cache.metalMeshElement");
    uint64_t v159 = v513;
  }
  uint64_t v179 = (uint64_t)*p_metalMeshElement;
LABEL_131:
  if (!sub_1B659C718(v179)) {
    return;
  }
LABEL_132:
  v516.i32[0] = v69;
  if (var5)
  {
    unsigned int v180 = sub_1B63D0C08((uint64_t)var5, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
    uint64_t v181 = (__CFXNode *)v509;
    if (v180 > 5) {
      LOBYTE(v182) = 0;
    }
    else {
      unint64_t v182 = 0x30001020303uLL >> (8 * v180);
    }
  }
  else
  {
    LOBYTE(v182) = 0;
    uint64_t v181 = (__CFXNode *)v509;
  }
  int v183 = v159[1745];
  v159[1745] = v182;
  uint64_t v184 = (__CFXCommonProfile *)var1;
  BOOL v186 = self->_cache.material != var1 || v500 != var0;
  LODWORD(v506) = v186;
  self->_cache.material = var1;
  if (v184) {
    uint64_t v184 = (__CFXCommonProfile *)sub_1B64AF43C((uint64_t)v184, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
  __int32 v187 = v515.i32[0];
  self->_cache.commonProfile = v184;
  geometry = self->_cache.geometry;
  self->_cache.geometry = v507;
  uint64_t v188 = sub_1B6534800((uint64_t)self->_processingContext.dynamicBatchingSystem);
  int v196 = v514.i32[0];
  if (v510 != 1) {
    int v196 = 0;
  }
  if (self->_cache.node == v181 && v500 == var0) {
    int v198 = v196;
  }
  else {
    int v198 = 1;
  }
  if (v188 > 1) {
    int v198 = 1;
  }
  HIDWORD(v495) = v198;
  self->_cache.node = v181;
  passInstance = (float32x4_t *)self->_processingContext.passInstance;
  float32x4_t v200 = (__CFXNode *)passInstance[797].i64[1];
  if (self->_cache.pointOfView == v200
    && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_4730, passInstance[524]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_cache.tessellationPipelineStateHash, passInstance[523])), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[16], passInstance[525]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[32], passInstance[526])))) & 0x80000000) != 0)
  {
    LODWORD(v495) = 0;
  }
  else
  {
    self->_cache.pointOfView = v200;
    float32x4_t v201 = passInstance[523];
    float32x4_t v202 = passInstance[524];
    float32x4_t v203 = passInstance[525];
    *(float32x4_t *)&self->_anon_4730[32] = passInstance[526];
    *(float32x4_t *)&self->_anon_4730[16] = v203;
    *(float32x4_t *)self->_anon_4730 = v202;
    *(float32x4_t *)&self->_cache.tessellationPipelineStateHash = v201;
    LODWORD(v495) = 1;
  }
  unsigned int v497 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[64], passInstance[588]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[48], passInstance[587])), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[80], passInstance[589]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_4730[96], passInstance[590]))));
  if ((v497 & 0x80000000) == 0)
  {
    simd_float4 v204 = (long long *)&passInstance[587];
    long long v205 = *v204;
    long long v206 = v204[1];
    long long v207 = v204[3];
    *(_OWORD *)&self->_anon_4730[80] = v204[2];
    *(_OWORD *)&self->_anon_4730[96] = v207;
    *(_OWORD *)&self->_anon_4730[48] = v205;
    *(_OWORD *)&self->_anon_4730[64] = v206;
  }
  simd_float4 v208 = self->_cache.metalMesh;
  if (v501) {
    uint64_t v209 = (uint64_t)sub_1B659C3E0(v208, v189, v190, v191);
  }
  else {
    uint64_t v209 = sub_1B659C2C4((uint64_t)v208, (uint64_t)v189, v190, v191, v192, v193, v194, v195);
  }
  uint64_t v217 = v209;
  uint64_t v218 = *(void *)&self->_anon_4730[112];
  *(void *)&self->_anon_4730[112] = v209;
  if (v181 && !v187) {
    sub_1B64A2F68((uint64_t)v181, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  }
  uint64_t v581 = 0;
  uint64_t v580 = 0;
  if (var7) {
    long long v219 = (__CFXBlendStates *)sub_1B65F90E4((uint64_t)var7, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  }
  else {
    long long v219 = 0;
  }
  if (var1 && !v219)
  {
    uint64_t v220 = objc_msgSend_enableARMode(self, v210, v211, v212);
    long long v219 = (__CFXBlendStates *)sub_1B64AFAB4((uint64_t)var1, v187 != 0, p_resourceManagerMonitor != 0, v220, (uint64_t)&v580, v221, v222, v223);
  }
  if (v219 && sub_1B64E3404((uint64_t)v219, (uint64_t)v210, v211, v212, v213, v214, v215, v216))
  {
    LODWORD(v225) = HIDWORD(v580);
    LODWORD(v224) = v580;
    LODWORD(v227) = HIDWORD(v581);
    LODWORD(v226) = v581;
    objc_msgSend_setBlendColorRed_green_blue_alpha_(self->_renderEncoder->var3, v210, v211, v212, v224, v225, v226, v227);
  }
  if (var1) {
    int v228 = sub_1B64AF894((uint64_t)var1, (uint64_t)v210, v211, v212, v213, v214, v215, v216);
  }
  else {
    int v228 = 15;
  }
  long long v229 = v500;
  if (v499->var13) {
    int v230 = 0;
  }
  else {
    int v230 = v228;
  }
  int v231 = v513[1744];
  v513[1744] = v230;
  blendStates = self->_cache.blendStates;
  self->_cache.blendStates = v219;
  if (v229 == var0 && v218 == v217 && blendStates == v219 && v231 == v230 && v70 && v183 == v182)
  {
LABEL_203:
    uint64_t v566 = 1;
    v258 = *(void **)&self->_anon_4730[128];
    if (!v258 || !objc_msgSend_state(v258, v210, v211, v212)) {
      return;
    }
    long long v564 = 0u;
    long long v565 = 0u;
    long long v562 = 0u;
    long long v563 = 0u;
    v262 = objc_msgSend_frameBufferBindings(*(void **)&self->_anon_4730[128], v259, v260, v261);
    uint64_t v264 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v263, (uint64_t)&v562, (uint64_t)v614, 16);
    if (v264)
    {
      uint64_t v268 = v264;
      uint64_t v269 = *(void *)v563;
      do
      {
        for (uint64_t i = 0; i != v268; ++i)
        {
          if (*(void *)v563 != v269) {
            objc_enumerationMutation(v262);
          }
          v271 = *(void **)(*((void *)&v562 + 1) + 8 * i);
          uint64_t v272 = objc_msgSend_bindBlock(v271, v265, v266, v267, v495);
          (*(void (**)(uint64_t, void *, VFXMTLRenderContext *))(v272 + 16))(v272, v271, self);
        }
        uint64_t v268 = objc_msgSend_countByEnumeratingWithState_objects_count_(v262, v265, (uint64_t)&v562, (uint64_t)v614, 16);
      }
      while (v268);
    }
    if (objc_msgSend_passBufferBindings(*(void **)&self->_anon_4730[128], v265, v266, v267, v495))
    {
      uint64_t v280 = sub_1B65F7078(v517.i64[0], (uint64_t)v273, v274, v275, v276, v277, v278, v279);
      long long v558 = 0u;
      long long v559 = 0u;
      long long v560 = 0u;
      long long v561 = 0u;
      v514.i64[0] = objc_msgSend_passBufferBindings(*(void **)&self->_anon_4730[128], v281, v282, v283);
      v517.i64[0] = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v514.i64[0], v284, (uint64_t)&v558, (uint64_t)v613, 16);
      if (v517.i64[0])
      {
        v516.i64[0] = *(void *)v559;
        p_resourceManagerMonitor = (id *)&self->_resourceManagerMonitor;
        do
        {
          uint64_t v285 = 0;
          do
          {
            if (*(void *)v559 != v516.i64[0]) {
              objc_enumerationMutation((id)v514.i64[0]);
            }
            uint64_t v286 = *(void *)(*((void *)&v558 + 1) + 8 * v285);
            if (objc_msgSend_type((void *)v286, v273, v274, v275))
            {
              if (objc_msgSend_type((void *)v286, v287, v288, v289) != 2) {
                goto LABEL_266;
              }
              id Weak = objc_loadWeak(p_resourceManagerMonitor);
              v295 = Weak;
              uint64_t v296 = *(void *)(v286 + 56);
              if (*(_DWORD *)(v296 + 16) == 1)
              {
                v297 = *(void **)(v296 + 72);
                if (!v297) {
                  v297 = *(void **)(v296 + 56);
                }
                uint64_t v298 = sub_1B6445BA0((uint64_t)self->_engineContext);
                uint64_t v301 = *(void *)(v296 + 64);
                if (v301)
                {
                  unint64_t v302 = 0x9DDFEA08EB382D69
                       * (v301 ^ ((0x9DDFEA08EB382D69 * (v301 ^ v509)) >> 47) ^ (0x9DDFEA08EB382D69 * (v301 ^ v509)));
                  id v303 = sub_1B65F46D8(v298, -348639895 * ((v302 >> 47) ^ v302));
                }
                else
                {
                  id v303 = sub_1B65F46E0(v298, v297, v299, v300);
                }
                v330 = v303;
                if (!v303)
                {
                  if (v295)
                  {
                    uint64_t v338 = objc_msgSend_stringWithFormat_(NSString, v273, @"No registered texture for binding %@ and symbol \"%@\" in pass or render graph.\nPass: (%p)\n", v275, v286, v297, self->_processingContext.renderGraphPass, v493);
                    goto LABEL_249;
                  }
LABEL_259:
                  v297 = 0;
                  uint64_t v339 = 0;
                  goto LABEL_260;
                }
                goto LABEL_262;
              }
              if (v280)
              {
                uint64_t v317 = *(void *)(v296 + 96);
                uint64_t v318 = *(void *)(v280 + v317);
                if (v318)
                {
                  v297 = (void *)sub_1B6564F18(*(void *)(v280 + v317), (uint64_t)v273, v274, v275, v291, v292, v293, v294);
                  v330 = (void *)sub_1B656502C(v318, v319, v320, v321, v322, v323, v324, v325);
                  if (v330
                    || (uint64_t v348 = sub_1B6564FE0(v318, (uint64_t)v273, v274, v275, v326, v327, v328, v329)) != 0
                    && (v330 = objc_msgSend_renderResourceForImage_sampler_options_engineContext_didFallbackToDefaultTexture_(self->_resourceManager, v273, v348, (uint64_t)v297, 0, self->_engineContext, 0)) != 0)
                  {
                    if (*(unsigned __int8 *)(v286 + 12) != 255 || *(unsigned __int8 *)(v286 + 11) != 255)
                    {
                      v331 = sub_1B653E820((uint64_t)self->_resourceManager, (uint64_t)v297);
                      renderEncoder = self->_renderEncoder;
                      int v333 = *(unsigned __int16 *)(v286 + 9);
                      if (*(unsigned char *)(v286 + 9) != 0xFF) {
                        objc_msgSend_setVertexSamplerState_atIndex_(renderEncoder->var3, v273, (uint64_t)v331, (char)v333);
                      }
                      if ((~v333 & 0xFF00) != 0) {
                        objc_msgSend_setFragmentSamplerState_atIndex_(renderEncoder->var3, v273, (uint64_t)v331, (uint64_t)(__int16)v333 >> 8);
                      }
                    }
                  }
                  else
                  {
                    if (!v295) {
                      goto LABEL_259;
                    }
                    v353 = NSString;
                    uint64_t v354 = sub_1B656502C(v318, (uint64_t)v273, v274, v275, v349, v350, v351, v352);
                    uint64_t v494 = sub_1B6564FE0(v318, v355, v356, v357, v358, v359, v360, v361);
                    uint64_t v338 = objc_msgSend_stringWithFormat_(v353, v362, @"No texture or image provided for binding %@ by sampler %@.\nTexture: %@\nImage: %@", v363, v286, v297, v354, v494);
LABEL_249:
                    uint64_t v339 = v338;
LABEL_260:
                    v364 = objc_msgSend_binding((void *)v286, v273, v274, v275);
                    uint64_t v368 = objc_msgSend_textureType(v364, v365, v366, v367);
                    v330 = objc_msgSend_defaultTextureForTextureType_(self->_resourceManager, v369, v368, v370);
                    if (v295) {
                      objc_msgSend_renderContext_didFallbackToDefaultTextureForSource_message_(v295, v273, (uint64_t)self, (uint64_t)v297, v339);
                    }
                  }
LABEL_262:
                  v371 = self->_renderEncoder;
                  __int16 v372 = *(_WORD *)(v286 + 9);
                  if ((_BYTE)v372 != 0xFF) {
                    sub_1B6491380((uint64_t)self->_renderEncoder, v330, (char)v372, v275);
                  }
                  if ((~v372 & 0xFF00) != 0) {
                    sub_1B63C6ED0((uint64_t)v371, v330, (uint64_t)v372 >> 8, v275);
                  }
                  goto LABEL_266;
                }
                if (!Weak) {
                  goto LABEL_259;
                }
                uint64_t v347 = objc_msgSend_stringWithFormat_(NSString, v273, @"No sampler found for binding %@ and input %@", v275, v286, v296);
              }
              else
              {
                uint64_t v340 = objc_msgSend_name((void *)v286, v273, v274, v275);
                sub_1B63F2F54(16, @"Error: pass has no storage for input %@", v341, v342, v343, v344, v345, v346, v340);
                if (!v295) {
                  goto LABEL_259;
                }
                uint64_t v347 = objc_msgSend_stringWithFormat_(NSString, v273, @"No pass storage for binding %@", v275, v286, v493);
              }
              uint64_t v339 = v347;
              v297 = (void *)v286;
              goto LABEL_260;
            }
            size_t v304 = objc_msgSend_bufferSize((void *)v286, v287, v288, v289);
            v515.i64[0] = (uint64_t)&v495;
            double v310 = MEMORY[0x1F4188790](v304, v305);
            v311 = (char *)&v495 - v309;
            if (v280)
            {
              if (objc_msgSend_inputsCount((void *)v286, v306, v307, v308, v310) >= 1)
              {
                uint64_t v312 = 0;
                uint64_t v313 = 0;
                do
                {
                  memcpy(&v311[*(unsigned int *)(*(void *)(v286 + 48) + v312 + 8)], (const void *)(v280 + *(void *)(*(void *)(*(void *)(v286 + 48) + v312) + 96)), *(unsigned int *)(*(void *)(v286 + 48) + v312 + 12));
                  ++v313;
                  v312 += 16;
                }
                while (v313 < objc_msgSend_inputsCount((void *)v286, v314, v315, v316));
              }
            }
            else
            {
              bzero((char *)&v495 - v309, v304);
            }
            int v334 = *(unsigned __int16 *)(v286 + 9);
            v335 = self->_renderEncoder;
            long long v597 = 0uLL;
            *(void *)&long long v598 = 0;
            sub_1B649F334((uint64_t)v335->var4, v311, v304, (void **)&v597);
            uint64_t v336 = *((void *)&v597 + 1);
            uint64_t v337 = v598;
            if ((_BYTE)v334 != 0xFF) {
              objc_msgSend_setVertexBuffer_offset_atIndex_(v335->var3, v273, *((uint64_t *)&v597 + 1), v598, (char)v334);
            }
            if ((~v334 & 0xFF00) != 0) {
              objc_msgSend_setFragmentBuffer_offset_atIndex_(v335->var3, v273, v336, v337, (uint64_t)(__int16)v334 >> 8);
            }
LABEL_266:
            ++v285;
          }
          while (v285 != v517.i64[0]);
          v517.i64[0] = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v514.i64[0], v273, (uint64_t)&v558, (uint64_t)v613, 16);
        }
        while (v517.i64[0]);
      }
    }
    char v373 = (char)v506;
    if (geometry != v507) {
      char v373 = 1;
    }
    if ((v373 & 1) != 0 || v500 != var0)
    {
      v374 = self->_cache.material
           ? sub_1B653D840((uint64_t)self->_resourceManager, var1, v507, *(VFXMTLRenderPipeline **)&self->_anon_4730[128], (uint64_t)self->_engineContext, v277, v278, v279): 0;
      self->_cache.metalShadable = v374;
      long long v554 = 0u;
      long long v555 = 0u;
      long long v556 = 0u;
      long long v557 = 0u;
      v375 = objc_msgSend_shadableBufferBindings(*(void **)&self->_anon_4730[128], v273, v274, v275);
      uint64_t v377 = objc_msgSend_countByEnumeratingWithState_objects_count_(v375, v376, (uint64_t)&v554, (uint64_t)v612, 16);
      if (v377)
      {
        uint64_t v378 = v377;
        uint64_t v379 = *(void *)v555;
        do
        {
          for (uint64_t j = 0; j != v378; ++j)
          {
            if (*(void *)v555 != v379) {
              objc_enumerationMutation(v375);
            }
            v381 = *(void **)(*((void *)&v554 + 1) + 8 * j);
            uint64_t v382 = objc_msgSend_bindBlock(v381, v273, v274, v275);
            if (v382) {
              (*(void (**)(uint64_t, void *, VFXMTLRenderContext *))(v382 + 16))(v382, v381, self);
            }
          }
          uint64_t v378 = objc_msgSend_countByEnumeratingWithState_objects_count_(v375, v273, (uint64_t)&v554, (uint64_t)v612, 16);
        }
        while (v378);
      }
    }
    if (v499->var12)
    {
      v383 = self->_processingContext.passInstance;
      v616.columns[3] = *(simd_float4 *)&v383[50].var2;
      v616.columns[2] = *(simd_float4 *)&v383[50].var0;
      v616.columns[1] = *(simd_float4 *)&v383[49].var8[15];
      p_resourceManagerMonitor = (id *)&v383->var0;
      v616.columns[0] = *(simd_float4 *)&v383[49].var8[13];
      simd_float4x4 v617 = __invert_f4(v616);
      simd_float4 v516 = v617.columns[1];
      simd_float4 v517 = v617.columns[0];
      simd_float4 v514 = v617.columns[3];
      simd_float4 v515 = v617.columns[2];
      uint64_t p_var6 = (uint64_t)&v499->var6;
      unint64_t v385 = *(void *)&self->_anon_4730[128];
      unint64_t v386 = *(void *)&v499->var6 ^ v385 ^ self->_renderPassParameters.eyeCount ^ (unint64_t)self->_renderPassParameters.viewMapping;
      unint64_t v553 = v386;
      if (self->_lighting.currentLightingHashKey != v386)
      {
        self->_lighting.currentLightingHashKey = v386;
        v506 = objc_msgSend_lightBufferBindings((void *)v385, v273, v274, v275);
        if (v506)
        {
          sub_1B63C2100((uint64_t)self->_processingContext.lightingSystem, p_var6, (unint64_t *)&self->_lighting.currentLightingDesc, v275, v387, v388, v389, v390);
          *(void *)&long long v597 = &v553;
          unint64_t var1 = (__CFXMaterial *)sub_1B6491450((uint64_t)&self->_lighting, &v553, (uint64_t)&unk_1B6E4FDF8, (void **)&v597);
          if (*((void *)var1 + 3))
          {
            long long v544 = 0u;
            long long v545 = 0u;
            long long v542 = 0u;
            long long v543 = 0u;
            uint64_t v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v391, (uint64_t)&v542, (uint64_t)v610, 16);
            if (v392)
            {
              uint64_t v393 = v392;
              uint64_t v394 = *(void *)v543;
              do
              {
                for (uint64_t k = 0; k != v393; ++k)
                {
                  if (*(void *)v543 != v394) {
                    objc_enumerationMutation(v506);
                  }
                  v396 = self->_renderEncoder;
                  uint64_t v397 = *((void *)var1 + 3);
                  uint64_t v398 = *((void *)var1 + 4);
                  int v399 = *(unsigned __int16 *)(*(void *)(*((void *)&v542 + 1) + 8 * k) + 9);
                  if (*(unsigned char *)(*(void *)(*((void *)&v542 + 1) + 8 * k) + 9) != 0xFF) {
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v396->var3, v273, *((void *)var1 + 3), *((void *)var1 + 4), (char)v399);
                  }
                  if ((~v399 & 0xFF00) != 0) {
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v396->var3, v273, v397, v398, (uint64_t)(__int16)v399 >> 8);
                  }
                }
                uint64_t v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v273, (uint64_t)&v542, (uint64_t)v610, 16);
              }
              while (v393);
            }
          }
          else
          {
            long long v551 = 0u;
            long long v552 = 0u;
            long long v549 = 0u;
            long long v550 = 0u;
            geometry = (__CFXGeometry *)objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v391, (uint64_t)&v549, (uint64_t)v611, 16);
            if (geometry)
            {
              uint64_t v503 = *(void *)v550;
              do
              {
                v400 = 0;
                do
                {
                  if (*(void *)v550 != v503) {
                    objc_enumerationMutation(v506);
                  }
                  v507 = v400;
                  uint64_t v401 = *(void *)(*((void *)&v549 + 1) + 8 * (void)v400);
                  if (objc_msgSend_semanticsCount((void *)v401, v273, v274, v275) >= 1)
                  {
                    uint64_t v402 = objc_msgSend_bufferSize((void *)v401, v273, v274, v275)
                         * self->_renderPassParameters.eyeCount;
                    v403 = var1;
                    *((void *)var1 + 5) = v402;
                    uint64_t v547 = 0;
                    BOOL v546 = 0;
                    uint64_t v548 = 0;
                    sub_1B649F150((uint64_t)self->_frameConstantBufferPool, v402, &v546);
                    uint64_t v404 = v548;
                    *((void *)v403 + 3) = v547;
                    *((void *)v403 + 4) = v404;
                    if (self->_renderPassParameters.eyeCount)
                    {
                      unint64_t v405 = 0;
                      do
                      {
                        uint64_t v406 = 0;
                        v407 = &p_resourceManagerMonitor[8 * v405];
                        float32x4_t v408 = *((float32x4_t *)v407 + 523);
                        float32x4_t v409 = *((float32x4_t *)v407 + 524);
                        float32x4_t v410 = *((float32x4_t *)v407 + 525);
                        float32x4_t v411 = *((float32x4_t *)v407 + 526);
                        long long v589 = (__int128)v517;
                        long long v590 = (__int128)v516;
                        long long v591 = (__int128)v515;
                        long long v592 = (__int128)v514;
                        do
                        {
                          *(long long *)((char *)&v597 + v406) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(long long *)((char *)&v589 + v406))), v409, *(float32x2_t *)((char *)&v589 + v406), 1), v410, *(float32x4_t *)((char *)&v589 + v406), 2), v411, *(float32x4_t *)((char *)&v589 + v406), 3);
                          v406 += 16;
                        }
                        while (v406 != 64);
                        uint64_t v412 = 0;
                        long long v413 = v598;
                        long long v414 = v599;
                        long long v415 = v600;
                        *(_OWORD *)self->_anon_4100 = v597;
                        *(_OWORD *)&self->_anon_4100[16] = v413;
                        *(_OWORD *)&self->_anon_4100[32] = v414;
                        *(_OWORD *)&self->_anon_4100[48] = v415;
                        long long v589 = (__int128)v517;
                        long long v590 = (__int128)v516;
                        long long v591 = (__int128)v515;
                        long long v592 = (__int128)v514;
                        v416 = v513;
                        do
                        {
                          *(long long *)((char *)&v597 + v412) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(long long *)((char *)&v589 + v412))), v409, *(float32x2_t *)((char *)&v589 + v412), 1), v410, *(float32x4_t *)((char *)&v589 + v412), 2), v411, *(float32x4_t *)((char *)&v589 + v412), 3);
                          v412 += 16;
                        }
                        while (v412 != 64);
                        long long v417 = v598;
                        long long v418 = v599;
                        long long v419 = v600;
                        *(_OWORD *)&self->_anon_4100[64] = v597;
                        *(_OWORD *)&self->_anon_4100[80] = v417;
                        *(_OWORD *)&self->_anon_4100[96] = v418;
                        *(_OWORD *)&self->_anon_4100[112] = v419;
                        v416[344] = 1;
                        if (objc_msgSend_semanticsCount((void *)v401, v273, v274, v275) >= 1)
                        {
                          uint64_t v423 = 0;
                          uint64_t v424 = 0;
                          do
                          {
                            (*(void (**)(void))(*(void *)(*(void *)(v401 + 48) + v423) + 16))();
                            ++v424;
                            v423 += 16;
                          }
                          while (v424 < objc_msgSend_semanticsCount((void *)v401, v425, v426, v427));
                        }
                        uint64_t v428 = objc_msgSend_bufferSize((void *)v401, v420, v421, v422);
                        v546 += v428;
                        ++v405;
                      }
                      while (v405 < self->_renderPassParameters.eyeCount);
                    }
                  }
                  v429 = self->_renderEncoder;
                  uint64_t v430 = *((void *)var1 + 3);
                  uint64_t v431 = *((void *)var1 + 4);
                  int v432 = *(unsigned __int16 *)(v401 + 9);
                  if ((_BYTE)v432 != 0xFF) {
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v429->var3, v273, *((void *)var1 + 3), *((void *)var1 + 4), (char)v432);
                  }
                  if ((~v432 & 0xFF00) != 0) {
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v429->var3, v273, v430, v431, (uint64_t)(__int16)v432 >> 8);
                  }
                  v400 = (__CFXGeometry *)((char *)&v507->var0.var0.var0 + 1);
                }
                while ((__CFXGeometry *)((char *)&v507->var0.var0.var0 + 1) != geometry);
                geometry = (__CFXGeometry *)objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v273, (uint64_t)&v549, (uint64_t)v611, 16);
              }
              while (geometry);
            }
          }
        }
      }
    }
    uint64_t v433 = v505;
    if (((HIDWORD(v495) | v495) & 1) != 0 || (v497 & 0x80000000) == 0)
    {
      long long v540 = 0u;
      long long v541 = 0u;
      long long v538 = 0u;
      long long v539 = 0u;
      v517.i64[0] = objc_msgSend_nodeBufferBindings(*(void **)&self->_anon_4730[128], v273, v274, v275);
      uint64_t v435 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v517.i64[0], v434, (uint64_t)&v538, (uint64_t)v609, 16);
      if (v435)
      {
        uint64_t v436 = v435;
        uint64_t v437 = *(void *)v539;
        v515.i64[0] = *(void *)v539;
        do
        {
          uint64_t v438 = 0;
          v516.i64[0] = v436;
          do
          {
            if (*(void *)v539 != v437) {
              objc_enumerationMutation((id)v517.i64[0]);
            }
            uint64_t v439 = *(void *)(*((void *)&v538 + 1) + 8 * v438);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (objc_msgSend_semanticsCount((void *)v439, v440, v441, v442) < 1)
              {
                sub_1B63F2F54(16, @"Error: binding is broken : neither block or semantic", v444, v445, v446, v447, v448, v449, v495);
              }
              else
              {
                uint64_t v450 = objc_msgSend_bufferSize((void *)v439, v443, v444, v445);
                uint64_t v451 = self->_renderPassParameters.eyeCount;
                v528[0] = MEMORY[0x1E4F143A8];
                v528[1] = 3221225472;
                v529 = sub_1B648BB64;
                v530 = &unk_1E61428D0;
                uint64_t v533 = v433;
                v534 = var8;
                int v536 = v510;
                int v537 = v451;
                uint64_t v535 = v450;
                v531 = self;
                uint64_t v532 = v439;
                uint64_t v452 = sub_1B6561B20((uint64_t)self->_processingContext.dynamicBatchingSystem, &v566);
                size_t v454 = v450 * v451;
                if (v566 < 2)
                {
                  v514.i64[0] = (uint64_t)&v495;
                  double v471 = MEMORY[0x1F4188790](v452, v453);
                  ((void (*)(void *, uint64_t, char *, double))v529)(v528, v509, (char *)&v495 - ((v454 + 15) & 0xFFFFFFFFFFFFFFF0), v471);
                  int v472 = *(unsigned __int16 *)(v439 + 9);
                  v473 = self->_renderEncoder;
                  long long v597 = 0uLL;
                  *(void *)&long long v598 = 0;
                  sub_1B649F334((uint64_t)v473->var4, (char *)&v495 - ((v454 + 15) & 0xFFFFFFFFFFFFFFF0), v454, (void **)&v597);
                  uint64_t v474 = *((void *)&v597 + 1);
                  uint64_t v475 = v598;
                  if ((_BYTE)v472 != 0xFF) {
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v473->var3, v456, *((uint64_t *)&v597 + 1), v598, (char)v472);
                  }
                  if ((~v472 & 0xFF00) != 0) {
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v473->var3, v456, v474, v475, (uint64_t)(__int16)v472 >> 8);
                  }
                  uint64_t v433 = v505;
                  uint64_t v437 = v515.i64[0];
                  uint64_t v436 = v516.i64[0];
                }
                else
                {
                  uint64_t v455 = v452;
                  long long v597 = 0uLL;
                  *(void *)&long long v598 = 0;
                  sub_1B649F150((uint64_t)self->_frameConstantBufferPool, v566 * v454, &v597);
                  if (v566 >= 1)
                  {
                    uint64_t v457 = 0;
                    uint64_t v458 = v597;
                    do
                    {
                      ((void (*)(void *, void, uint64_t))v529)(v528, *(void *)(v455 + 8 * v457), v458);
                      v458 += v454;
                      ++v457;
                    }
                    while (v457 < v566);
                  }
                  v459 = self->_renderEncoder;
                  uint64_t v460 = *((void *)&v597 + 1);
                  uint64_t v461 = v598;
                  int v462 = *(unsigned __int16 *)(v439 + 9);
                  if ((_BYTE)v462 != 0xFF) {
                    objc_msgSend_setVertexBuffer_offset_atIndex_(v459->var3, v456, *((uint64_t *)&v597 + 1), v598, (char)v462);
                  }
                  if ((~v462 & 0xFF00) != 0) {
                    objc_msgSend_setFragmentBuffer_offset_atIndex_(v459->var3, v456, v460, v461, (uint64_t)(__int16)v462 >> 8);
                  }
                  uint64_t v437 = v515.i64[0];
                  uint64_t v436 = v516.i64[0];
                }
              }
            }
            else
            {
              if (!objc_msgSend_bindBlock((void *)v439, v440, v441, v442)) {
                sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v464, v465, v466, v467, v468, v469, (uint64_t)"resourceBinding.bindBlock");
              }
              uint64_t v470 = objc_msgSend_bindBlock((void *)v439, v463, v464, v465);
              (*(void (**)(uint64_t, uint64_t, VFXMTLRenderContext *))(v470 + 16))(v470, v439, self);
            }
            ++v438;
          }
          while (v438 != v436);
          uint64_t v436 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v517.i64[0], v456, (uint64_t)&v538, (uint64_t)v609, 16);
        }
        while (v436);
      }
    }
    v476 = v513;
    if (v500 != var0 || (v497 & 0x80000000) == 0)
    {
      v477 = self->_renderEncoder;
      buffer = self->_worldUniforms.buffer;
      unint64_t offset = self->_worldUniforms.offset;
      uint64_t v480 = *(void *)&self->_anon_4730[128];
      int v481 = *(unsigned __int16 *)(v480 + 8);
      if (*(unsigned char *)(v480 + 8) != 0xFF) {
        objc_msgSend_setVertexBuffer_offset_atIndex_(v477->var3, v273, (uint64_t)self->_worldUniforms.buffer, self->_worldUniforms.offset, (char)v481);
      }
      if ((~v481 & 0xFF00) != 0) {
        objc_msgSend_setFragmentBuffer_offset_atIndex_(v477->var3, v273, (uint64_t)buffer, offset, (uint64_t)(__int16)v481 >> 8);
      }
    }
    if (v509 && v566 <= 1)
    {
      int8x16_t v482 = *(int8x16_t *)&self->_nodeUniforms.probeCacheIndex;
      int8x16_t v483 = *(int8x16_t *)&self->_anon_3378[8];
      float32x4_t v484 = vmulq_f32(*(float32x4_t *)&self->_nodeUniforms.instanceNode, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v483, v483, 0xCuLL), v483, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v482, (int32x4_t)v482), v482, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v483, (int32x4_t)v483), v483, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8(v482, v482, 0xCuLL), v482, 8uLL)));
      BOOL v485 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v484, 2), vaddq_f32(v484, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v484.f32, 1))).f32[0] > 0.0;
      v486 = self->_renderEncoder;
      if (v486->var5)
      {
        objc_msgSend_setFrontFacingWinding_(v486->var3, v273, *((void *)&xmmword_1B6E50D30 + v485), v275);
LABEL_369:
        if (v496) {
          objc_msgSend__setMeshBuffers_(self, v487, (uint64_t)self->_cache.metalMesh, v488);
        }
        uint64_t v489 = v566;
        if (v566 <= 1) {
          uint64_t v489 = sub_1B653EE30((uint64_t)self->_cache.metalMeshElement);
        }
        if (v501)
        {
          *(_DWORD *)((char *)v527 + 3) = 0;
          v527[0] = 0;
          if (v489 <= 1) {
            int v490 = 1;
          }
          else {
            int v490 = v489;
          }
          char v491 = *((unsigned char *)v499 + 77) & 7;
          long long v492 = *((_OWORD *)v476 + 105);
          v522[0] = *((_OWORD *)v476 + 104);
          v522[1] = v492;
          int v523 = v490;
          int v524 = 0;
          v525 = self;
          char v526 = v491;
          objc_msgSend_draw_(v498, v487, (uint64_t)v522, v489);
        }
        else
        {
          objc_msgSend__drawMeshElement_instanceCount_(self, v487, (uint64_t)self->_cache.metalMeshElement, v489);
        }
        return;
      }
    }
    else
    {
      v486 = self->_renderEncoder;
      BOOL v485 = !v486->var5;
    }
    objc_msgSend_setFrontFacingWinding_(v486->var3, v273, v485, v275);
    goto LABEL_369;
  }
  if (v501) {
    unint64_t v233 = (const void *)objc_msgSend_newPipelineStateConfiguratorForMeshElement_patchType_device_(v498, v210, (uint64_t)self->_cache.metalMeshElement, *((unsigned char *)v499 + 77) & 7, self->_device);
  }
  else {
    unint64_t v233 = 0;
  }
  int v234 = sub_1B6447978((uint64_t)self->_engineContext);
  int v236 = v234;
  if ((*((unsigned char *)self + 152) & 0x10) != 0) {
    char v237 = 2;
  }
  else {
    char v237 = v234;
  }
  if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2) {
    char v238 = 2;
  }
  else {
    char v238 = 1;
  }
  float32x4_t v239 = self->_cache.metalMesh;
  unsigned __int8 v240 = self->_renderPassParameters.eyeCount;
  unsigned __int8 viewMapping = self->_renderPassParameters.viewMapping;
  if (v513[2024]) {
    errors = self->_compilationIssues.errors;
  }
  else {
    errors = 0;
  }
  resourceManager = self->_resourceManager;
  v567[0] = var0;
  v567[1] = var1;
  v567[2] = v507;
  v567[3] = v517.i64[0];
  v567[4] = v517.i64[0];
  v567[5] = v239;
  v567[6] = v219;
  v567[7] = v509;
  char v568 = v230;
  char v569 = v182;
  unsigned __int8 v570 = v240;
  char v571 = v238;
  unsigned __int8 v572 = viewMapping;
  char v573 = v237;
  __int16 v574 = 0;
  v575 = errors;
  __int8 v576 = v516.i8[0];
  memset(v577, 0, sizeof(v577));
  v578 = v233;
  uint64_t v579 = 0;
  long long v244 = objc_msgSend_renderResourceForProgramDesc_renderPassDescriptor_(resourceManager, v235, (uint64_t)v567, (uint64_t)self->_currentRenderPassDescriptor, v495);
  *(void *)&self->_anon_4730[128] = v244;
  if (v233)
  {
    _Block_release(v233);
    long long v244 = *(void **)&self->_anon_4730[128];
  }
  if (objc_msgSend_state(v244, v245, v246, v247))
  {
    uint64_t v255 = objc_msgSend_state(*(void **)&self->_anon_4730[128], v248, v249, v250);
    objc_msgSend_setRenderPipelineState_(self->_renderEncoder->var3, v256, v255, v257);
    goto LABEL_203;
  }
  *(void *)&self->_anon_4730[128] = 0;
  self->_cache.program = 0;
  if (v236)
  {
    if (var1) {
      objc_msgSend__prepareMaterialTextures_(self, v248, (uint64_t)var1, v250);
    }
  }
  else if ((byte_1E9DDAF2B & 1) == 0)
  {
    byte_1E9DDAF2B = 1;
    sub_1B63F2F54(16, @"Error: _executeProgram - no pipeline state", v249, v250, v251, v252, v253, v254, v495);
  }
}

- (void)drawRenderElement:(__CFXRendererElement *)a3 withPass:(__CFXFXPass *)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  if (!self->_engineContext) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"_engineContext");
  }
  uint64_t v11 = sub_1B63F1678((uint64_t)a3);
  uint64_t v12 = sub_1B63F16EC((uint64_t)a3);
  uint64_t v13 = sub_1B63F1730((uint64_t)a3);
  uint64_t v21 = sub_1B63F1750((uint64_t)a3);
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  uint64_t v87 = 0;
  if (a4)
  {
    int v22 = sub_1B65F6CFC((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
    pass = a4;
    if (v22 == 2)
    {
      pass = a4;
      if ((*(unsigned char *)(v11 + 221) & 0x10) != 0) {
        pass = self->_processingContext.pass;
      }
    }
  }
  else
  {
    pass = 0;
  }
  sub_1B6453DD0((uint64_t)a3, (uint64_t)pass, (uint64_t)self->_engineContext, &v89, &v87, &v88, 0, v20, v74);
  int v31 = sub_1B63F16E0((uint64_t)a3);
  char v32 = v87;
  if (!v31 || !v87)
  {
    if (v31)
    {
      int v33 = 0;
      char v34 = 1;
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if ((sub_1B659D898((uint64_t)v87) & 1) == 0)
  {
LABEL_14:
    if (v11)
    {
      sub_1B64A2F68(v11, v24, v25, v26, v27, v28, v29, v30);
      if (v35 <= 0.0) {
        return;
      }
    }
    if (!v87)
    {
      uint64_t v82 = 0;
      uint64_t v83 = v13;
      char v34 = 0;
      goto LABEL_27;
    }
    uint64_t v36 = sub_1B64AF43C(v89, v24, v25, v26, v27, v28, v29, v30);
    if (v36)
    {
      int v33 = sub_1B6476BAC(v36, v24, v25, v26, v27, v28, v29, v30);
      char v34 = 0;
    }
    else
    {
      char v34 = 0;
      int v33 = 0;
    }
    goto LABEL_21;
  }
  int v33 = 0;
  char v34 = 1;
LABEL_21:
  char v32 = v87;
LABEL_22:
  LODWORD(v82) = v33;
  uint64_t v83 = v13;
  if (!v32)
  {
    BYTE4(v82) = 0;
LABEL_27:
    char v84 = 0;
    if (!a4) {
      goto LABEL_29;
    }
LABEL_28:
    uint64_t v39 = sub_1B65F9130((uint64_t)a4, v24, v25, v26, v27, v28, v29, v30);
    if (v39) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  BYTE4(v82) = sub_1B659D8F4((uint64_t)v32);
  if (!v87) {
    goto LABEL_27;
  }
  char v84 = sub_1B659D90C((uint64_t)v87);
  if (a4) {
    goto LABEL_28;
  }
LABEL_29:
  uint64_t v39 = sub_1B63F17A8((uint64_t)a3);
  if (!v39)
  {
    char v40 = 1;
    goto LABEL_32;
  }
LABEL_30:
  objc_msgSend_setRasterizerStates_(self, v37, v39, v38);
  char v40 = 0;
LABEL_32:
  long long v41 = (char *)a3 + 76;
  unsigned int var0_low = LOWORD(a3[1].var0);
  char v43 = v34;
  BOOL v44 = (var0_low & 0x40) != 0 && self->_processingContext.passRequiresLighting;
  uint64_t v45 = v88;
  uint64_t v46 = v89;
  int v47 = (var0_low >> 14) & 1;
  uint64_t v48 = *(void *)&a3->var4;
  if ((v43 & 1) != 0 || BYTE1(self->_processingContext.passInstance[76].var0)) {
    goto LABEL_37;
  }
  if (v82 == 1)
  {
    v106[0] = v88;
    v106[1] = v89;
    v106[2] = v12;
    v106[3] = v11;
    v106[4] = v83;
    v106[5] = v21;
    v106[6] = v48;
    v106[7] = a4;
    v106[8] = v41;
    char v107 = v43;
    char v108 = BYTE4(v82);
    char v109 = v84;
    BOOL v110 = v44;
    char v111 = 1;
    char v112 = (var0_low >> 11) & 7;
    __int16 v113 = 0;
    char v81 = v112;
    LOBYTE(v82) = v43;
    BOOL v79 = v44;
    uint64_t v77 = v41;
    objc_msgSend__executeDrawCommand_(self, v37, (uint64_t)v106, v38);
    v98[0] = v45;
    v98[1] = v46;
    v98[2] = v12;
    v98[3] = v11;
    v98[4] = v83;
    v98[5] = v21;
    v98[6] = v48;
    v98[7] = a4;
    v98[8] = v77;
    char v99 = v82;
    char v100 = BYTE4(v82);
    char v101 = v84;
    BOOL v102 = v79;
    char v103 = 0;
    char v104 = v81;
    __int16 v105 = 0;
    objc_msgSend__executeDrawCommand_(self, v72, (uint64_t)v98, v73);
    return;
  }
  if (v82 != 2)
  {
LABEL_37:
    v90[0] = v88;
    v90[1] = v89;
    v90[2] = v12;
    v90[3] = v11;
    v90[4] = v83;
    v90[5] = v21;
    v90[6] = v48;
    v90[7] = a4;
    v90[8] = v41;
    char v91 = v43;
    char v92 = BYTE4(v82);
    char v93 = v84;
    BOOL v94 = v44;
    BOOL v95 = (var0_low & 0x4000) != 0;
    char v96 = (var0_low >> 11) & 7;
    __int16 v97 = 0;
    objc_msgSend__executeDrawCommand_(self, v37, (uint64_t)v90, v38);
  }
  else
  {
    char v80 = (var0_low >> 11) & 7;
    LOBYTE(v82) = v43;
    BOOL v78 = v44;
    uint64_t v76 = v41;
    char v75 = v40;
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v37, 1, v38);
    v122[0] = v45;
    v122[1] = v46;
    v122[2] = v12;
    v122[3] = v11;
    v122[4] = v83;
    v122[5] = v21;
    v122[6] = v48;
    v122[7] = a4;
    v122[8] = v76;
    char v123 = v82;
    char v124 = BYTE4(v82);
    char v125 = v84;
    BOOL v126 = v78;
    char v127 = v47;
    char v128 = v80;
    __int16 v129 = 0;
    objc_msgSend__executeDrawCommand_(self, v49, (uint64_t)v122, v50);
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v51, 2, v52);
    v114[0] = v45;
    v114[1] = v46;
    v114[2] = v12;
    v114[3] = v11;
    v114[4] = v83;
    v114[5] = v21;
    v114[6] = v48;
    v114[7] = a4;
    v114[8] = v76;
    char v115 = v82;
    char v116 = BYTE4(v82);
    char v117 = v84;
    BOOL v118 = v78;
    char v119 = v47;
    char v120 = v80;
    __int16 v121 = 0;
    objc_msgSend__executeDrawCommand_(self, v53, (uint64_t)v114, v54);
    if ((v75 & 1) == 0)
    {
      memset(v85, 0, sizeof(v85));
      int v86 = 0;
      sub_1B6451740(v39, v55, v56, v57, v58, v59, v60, (uint64_t)v85);
      renderEncoder = self->_renderEncoder;
      uint64_t v69 = sub_1B64D7998(v85[0], v62, v63, v64, v65, v66, v67, v68);
      objc_msgSend_setCullMode_(renderEncoder->var3, v70, v69, v71);
    }
  }
}

- (BOOL)showsAuthoringEnvironment
{
  return self->_showsAuthoringEnvironment;
}

- (void)setShowsAuthoringEnvironment:(BOOL)a3
{
  self->_showsAuthoringEnvironment = a3;
}

- (BOOL)forceAsyncShaderCompilation
{
  return (*((unsigned __int8 *)self + 152) >> 4) & 1;
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 152) = *((unsigned char *)self + 152) & 0xEF | v3;
}

- (BOOL)collectsCompilationErrors
{
  return self->_compilationIssues.collectEnabled;
}

- (void)setCollectsCompilationErrors:(BOOL)a3
{
  self->_compilationIssues.collectEnabled = a3;
  errors = self->_compilationIssues.errors;
  if (a3)
  {
    if (!errors)
    {
      errors = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_compilationIssues.errors = errors;
    }
    objc_msgSend_removeAllObjects(errors, a2, a3, v3);
  }
  else
  {

    self->_compilationIssues.errors = 0;
  }
}

- (NSMutableDictionary)compilationErrors
{
  return self->_compilationIssues.errors;
}

- (uint64_t)drawWireframeOverlayForElements:(unint64_t)a3 range:(uint64_t)a4 store:(int)a5 passInstance:(uint64_t)a6
{
  unsigned int v9 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  objc_msgSend_pushDebugGroup_(a1, a2, @"VFX - Draw wireframe", a4);
  LODWORD(v12) = -1138501878;
  LODWORD(v13) = -1194215657;
  LODWORD(v14) = -10.0;
  objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(a1[31] + 16), v15, v16, v17, v14, v12, v13);
  if (v9 < v9 + a5)
  {
    uint64_t v26 = (unsigned int *)(a3 + 4 * v9);
    *(void *)&long long v25 = 257;
    long long v48 = v25;
    unint64_t v27 = v9 + a5 - (unint64_t)v9;
    uint64_t v49 = a6;
    do
    {
      unsigned int v28 = *v26++;
      a3 = a3 & 0xFFFFFFFF00000000 | v28;
      uint64_t v29 = sub_1B661BF3C(a6, a3, v19, v20, v21, v22, v23, v24);
      uint64_t v30 = sub_1B63F1678(v29);
      uint64_t v31 = sub_1B63F16EC(v29);
      uint64_t v32 = sub_1B63F1730(v29);
      if (v32)
      {
        uint64_t v33 = v32;
        char v34 = sub_1B63F1750(v29);
        if (v34)
        {
          float v35 = v34;
          uint64_t v36 = sub_1B653D440(a1[14], v29, a1[18], a7, a1[72], v22, v23, v24);
          if (v36)
          {
            uint64_t material = (uint64_t)v36->material;
            program = v36->program;
            uint64_t v38 = sub_1B641E308(material);
            objc_msgSend_setRasterizerStates_(a1, v39, v38, v40);
            int v41 = (*(unsigned __int16 *)(v29 + 80) >> 11) & 7;
            v52[0] = program;
            v52[1] = material;
            a6 = v49;
            v52[2] = v31;
            v52[3] = v30;
            v52[4] = v33;
            v52[5] = v35;
            memset(&v52[6], 0, 24);
            int v53 = v48;
            char v54 = 0;
            char v55 = v41;
            __int16 v56 = 0;
            objc_msgSend__executeDrawCommand_(a1, v42, (uint64_t)v52, v43);
          }
        }
      }
      --v27;
    }
    while (v27);
  }
  objc_msgSend_setDepthBias_slopeScale_clamp_(*(void **)(a1[31] + 16), v18, v19, v20, 0.0, 0.0, 0.0, v48);
  return objc_msgSend_popDebugGroup(a1, v44, v45, v46);
}

+ (void)registerBindings
{
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, a2, @"modelTransform", (uint64_t)&unk_1F0FB58A8);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v2, @"inverseModelTransform", (uint64_t)&unk_1F0FB6628);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v3, @"modelViewTransform", (uint64_t)&unk_1F0FB6688);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v4, @"inverseModelViewTransform", (uint64_t)&unk_1F0FB66A8);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v5, @"normalTransform", (uint64_t)&unk_1F0FB66E8);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v6, @"modelViewProjectionTransform", (uint64_t)&unk_1F0FB6708);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v7, @"lastFrameModelTransform", (uint64_t)&unk_1F0FB6748);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v8, @"motionBlurIntensity", (uint64_t)&unk_1F0FB6768);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v9, @"inverseModelViewProjectionTransform", (uint64_t)&unk_1F0FB67E8);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v10, @"boundingBox", (uint64_t)&unk_1F0FB6808);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v11, @"worldBoundingBox", (uint64_t)&unk_1F0FB6848);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v12, @"nodeOpacity", (uint64_t)&unk_1F0FB6888);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v13, @"shCoefficients", (uint64_t)&unk_1F0FB68C8);
  objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v14, @"categoryBitmask", (uint64_t)&unk_1F0FB6908);
  objc_msgSend_registerShadableArgumentBindingBlockForBuffers_textures_samplers_(VFXMTLShaderBindingsGenerator, v15, (uint64_t)&unk_1F0FB6928, (uint64_t)&unk_1F0FB6948, &unk_1F0FB6988);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v16, @"vfx_lights", 0, 1, &unk_1F0FB69A8);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v17, @"vfx_lights_count", 0, 1, &unk_1F0FB6A08);
  objc_msgSend_registerArgument_frequency_needsRenderResource_block_(VFXMTLShaderBindingsGenerator, v18, @"vfx_commonprofile", 2, 1, &unk_1F0FB6928);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v19, @"vfx_pointSize", 2, &unk_1F0FB6A48);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v20, @"u_clusterTexture", 0, &unk_1F0FB6A68);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v21, @"u_lightIndicesTexture", 0, &unk_1F0FB6B08);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v22, @"u_areaLightBakedDataTexture", 0, &unk_1F0FB6B28);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v23, @"u_shadowKernel", 0, &unk_1F0FB6B88);
  char v133 = 0;
  unsigned __int8 v24 = sub_1B6489B18();
  if (v24)
  {
    unsigned __int8 v32 = v24;
    int v33 = 0;
    do
    {
      char v34 = NSString;
      float v35 = sub_1B644CB60((char)v33, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
      uint64_t v38 = objc_msgSend_stringWithFormat_(v34, v36, @"u_%@Texture", v37, v35);
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = sub_1B648E3C8;
      v131[3] = &unk_1E6142958;
      v131[4] = &unk_1F0FB6BA8;
      char v132 = v33;
      objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v39, v38, 2, v131);
      ++v33;
    }
    while (v33 != v32);
  }
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v25, @"u_shadowTexture", 1, &unk_1F0FB6C08);
  uint64_t v42 = 0;
  uint64_t v115 = MEMORY[0x1E4F143A8];
  do
  {
    v130[0] = v115;
    v130[1] = 3221225472;
    v130[2] = sub_1B648E47C;
    v130[3] = &unk_1E6142978;
    v130[4] = v42;
    uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v40, @"u_goboTexture%d", v41, v42);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v44, v43, 1, v130);
    uint64_t v47 = objc_msgSend_stringWithFormat_(NSString, v45, @"u_iesTexture%d", v46, v42);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v48, v47, 1, v130);
    uint64_t v51 = objc_msgSend_stringWithFormat_(NSString, v49, @"u_iesCubeTexture%d", v50, v42);
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v52, v51, 1, v130);
    uint64_t v55 = objc_msgSend_stringWithFormat_(NSString, v53, @"color%d", v54, v42);
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = sub_1B648E628;
    v129[3] = &unk_1E6142998;
    v129[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v56, v55, (uint64_t)v129);
    uint64_t v59 = objc_msgSend_stringWithFormat_(NSString, v57, @"position%d", v58, v42);
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = sub_1B648E640;
    v128[3] = &unk_1E6142998;
    v128[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v60, v59, (uint64_t)v128);
    uint64_t v63 = objc_msgSend_stringWithFormat_(NSString, v61, @"direction%d", v62, v42);
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = sub_1B648E698;
    v127[3] = &unk_1E6142998;
    v127[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v64, v63, (uint64_t)v127);
    uint64_t v67 = objc_msgSend_stringWithFormat_(NSString, v65, @"right%d", v66, v42);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = sub_1B648E6F4;
    v126[3] = &unk_1E6142998;
    v126[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v68, v67, (uint64_t)v126);
    uint64_t v71 = objc_msgSend_stringWithFormat_(NSString, v69, @"up%d", v70, v42);
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = sub_1B648E70C;
    v125[3] = &unk_1E6142998;
    v125[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v72, v71, (uint64_t)v125);
    uint64_t v75 = objc_msgSend_stringWithFormat_(NSString, v73, @"iesMatrix%d", v74, v42);
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = sub_1B648E724;
    v124[3] = &unk_1E6142998;
    v124[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v76, v75, (uint64_t)v124);
    uint64_t v79 = objc_msgSend_stringWithFormat_(NSString, v77, @"attenuation%d", v78, v42);
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = sub_1B648E744;
    v123[3] = &unk_1E6142998;
    v123[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v80, v79, (uint64_t)v123);
    uint64_t v83 = objc_msgSend_stringWithFormat_(NSString, v81, @"spotAttenuation%d", v82, v42);
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = sub_1B648E75C;
    v122[3] = &unk_1E6142998;
    v122[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v84, v83, (uint64_t)v122);
    uint64_t v87 = objc_msgSend_stringWithFormat_(NSString, v85, @"shadowMatrix%d", v86, v42);
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = sub_1B648E774;
    v121[3] = &unk_1E6142998;
    v121[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v88, v87, (uint64_t)v121);
    uint64_t v91 = objc_msgSend_stringWithFormat_(NSString, v89, @"shadowRadius%d", v90, v42);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = sub_1B648E93C;
    v120[3] = &unk_1E6142998;
    v120[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v92, v91, (uint64_t)v120);
    uint64_t v95 = objc_msgSend_stringWithFormat_(NSString, v93, @"shadowColor%d", v94, v42);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = sub_1B648E954;
    v119[3] = &unk_1E6142998;
    v119[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v96, v95, (uint64_t)v119);
    uint64_t v99 = objc_msgSend_stringWithFormat_(NSString, v97, @"goboMatrix%d", v98, v42);
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = sub_1B648E96C;
    v118[3] = &unk_1E6142998;
    v118[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v100, v99, (uint64_t)v118);
    uint64_t v103 = objc_msgSend_stringWithFormat_(NSString, v101, @"projectorColor%d", v102, v42);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = sub_1B648E98C;
    v117[3] = &unk_1E6142998;
    v117[4] = v42;
    objc_msgSend_registerSemantic_withBlock_(VFXMTLShaderBindingsGenerator, v104, v103, (uint64_t)v117);
    uint64_t v107 = objc_msgSend_stringWithFormat_(NSString, v105, @"u_areaPolygonPositions%d", v106, v42);
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = sub_1B648E9A4;
    v116[3] = &unk_1E6142978;
    v116[4] = v42;
    objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v108, v107, 1, v116);
    ++v42;
  }
  while (v42 != 8);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v40, @"u_specularDFGDiffuseHammonTexture", 0, &unk_1F0FB6C88);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v109, @"u_radianceTexture", 0, &unk_1F0FB6CA8);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v110, @"u_irradianceTexture", 0, &unk_1F0FB6D08);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v111, @"u_reflectionProbeTexture", 0, &unk_1F0FB6D48);
  objc_msgSend_registerArgument_frequency_block_(VFXMTLShaderBindingsGenerator, v112, @"u_ssaoTexture", 0, &unk_1F0FB6D68);
  objc_msgSend_registerUserBlockTrampoline_(VFXMTLShaderBindingsGenerator, v113, (uint64_t)&unk_1F0FB6E08, v114);
}

- (BOOL)mapVolatileMesh:(__CFXMesh *)a3 verticesCount:(int64_t)a4
{
  char v17 = sub_1B64AD9B8((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7);
  if (v17)
  {
    uint64_t v18 = sub_1B653C844((uint64_t)self->_resourceManager, (uint64_t)a3, 1);
    if (!sub_1B659C750((uint64_t)v18)) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Mesh should have volatile data to allocate", v19, v20, v21, v22, v23, v24, (uint64_t)"metalMesh.volatileStride != 0");
    }
    sub_1B659C718((uint64_t)v18);
    uint64_t v25 = sub_1B659C750((uint64_t)v18) * a4;
    uint64_t v35 = 0;
    id newValue = 0;
    uint64_t v37 = 0;
    sub_1B649F150((uint64_t)self->_frameVolatileBufferPool, v25, &v35);
    sub_1B659C774((uint64_t)v18, v25);
    sub_1B659C724(v18, (char *)newValue);
    sub_1B659C744((uint64_t)v18, v37);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1B648F178;
    v34[3] = &unk_1E6142A00;
    v34[4] = a4;
    v34[5] = v35;
    sub_1B64AAFB4((uint64_t)a3, 1, (uint64_t)v34, v26, v27, v28, v29, v30);
    objc_msgSend_addObject_(self->_volatileMeshes, v31, (uint64_t)v18, v32);
  }
  else
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can only map volatile mesh", v11, v12, v13, v14, v15, v16, (uint64_t)"0");
  }
  return v17;
}

- (void)unmapVolatileMesh:(__CFXMesh *)a3 modifiedVerticesCount:(int64_t)a4
{
  if (sub_1B64AD9B8((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7))
  {
    char v17 = sub_1B653C844((uint64_t)self->_resourceManager, (uint64_t)a3, 1);
    sub_1B659C768((uint64_t)v17);
    if ((a4 & 0x8000000000000000) == 0) {
      sub_1B659C750((uint64_t)v17);
    }
    uint64_t v18 = sub_1B659C718((uint64_t)v17);
    sub_1B659C738((uint64_t)v17);
    if (!v18) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Mesh should be mapped", v19, v20, v21, v22, v23, v24, (uint64_t)"sub.buffer != nil");
    }
    sub_1B64AAFB4((uint64_t)a3, 1, (uint64_t)&unk_1F0FB6EA8, v20, v21, v22, v23, v24);
  }
  else
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. You can only map volatile mesh", v11, v12, v13, v14, v15, v16, (uint64_t)"0");
  }
}

- (void)resetVolatileMeshes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  volatileMeshes = self->_volatileMeshes;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(volatileMeshes, a2, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(volatileMeshes);
        }
        sub_1B659C724(*(void **)(*((void *)&v12 + 1) + 8 * i), 0);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(volatileMeshes, v11, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v8);
  }
  objc_msgSend_removeAllObjects(self->_volatileMeshes, v5, v6, v7);
}

- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3
{
  Object = (VFXMTLBuffer *)objc_msgSend_lastObject(self->_bufferPool, a2, a3, v3);
  if (Object)
  {
    uint64_t v7 = Object;
    uint64_t v8 = Object;
    objc_msgSend_removeLastObject(self->_bufferPool, v9, v10, v11);
  }
  else
  {
    uint64_t v7 = objc_alloc_init(VFXMTLBuffer);
  }
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  sub_1B649F150((uint64_t)self->_frameVolatileBufferPool, a3, &v20);
  objc_msgSend_setBuffer_(v7, v12, v21, v13);
  objc_msgSend_setOffset_(v7, v14, v22, v15);
  if (!objc_msgSend_buffer(v7, v16, v17, v18))
  {

    return 0;
  }
  return v7;
}

- (void)_recycleMTLBufferToPool:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. MeshElement should be mapped", 0, v3, v4, v5, v6, v7, (uint64_t)"mtlBuffer != nil");
  }
  objc_msgSend_addObject_(self->_bufferPool, a2, (uint64_t)a3, v3);
  objc_msgSend_setUsedCount_(a3, v10, 0, v11);
  objc_msgSend_setBuffer_(a3, v12, 0, v13);
  objc_msgSend_setOffset_(a3, v14, 0, v15);

  objc_msgSend_setDataSource_(a3, v16, 0, v17);
}

- (__CFXMeshElement)createVolatileMeshElementOfType:(VFXMTLRenderContext *)self primitiveCount:(unsigned int)a2 bytesPerIndex:
{
  uint64_t v5 = v4;
  int v6 = v3;
  char v7 = v2;
  if (objc_msgSend_count(self->_freeVolatileMeshElements, *(const char **)&a2, v2, v3))
  {
    Object = (__CFXMeshElement *)objc_msgSend_lastObject(self->_freeVolatileMeshElements, v9, v10, v11);
    objc_msgSend_addObject_(self->_usedVolatileMeshElements, v13, (uint64_t)Object, v14);
    objc_msgSend_removeLastObject(self->_freeVolatileMeshElements, v15, v16, v17);
    if (Object) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  Object = (__CFXMeshElement *)sub_1B63D1A90();
  objc_msgSend_addObject_(self->_usedVolatileMeshElements, v55, (uint64_t)Object, v56);
  CFRelease(Object);
  if (!Object) {
LABEL_3:
  }
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v18, v19, v20, v21, v22, v23, (uint64_t)"meshElement");
LABEL_4:
  sub_1B63D04D0((uint64_t)Object, v7, v18, v19, v20, v21, v22, v23);
  sub_1B63D0E24((uint64_t)Object, v6, 0, v5);
  uint64_t v24 = sub_1B653C040((uint64_t)self->_resourceManager, (uint64_t)Object);
  if (sub_1B659CBE8((uint64_t)v24)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Mesh should not be already mapped", v25, v26, v27, v28, v29, v30, (uint64_t)"metalMeshElement.indexBuffer == nil");
  }
  sub_1B659C904(v24, (uint64_t)Object, v25, v26, v27, v28, v29, v30);
  uint64_t v31 = sub_1B653EFC4((uint64_t)v24);
  char v34 = (char *)objc_msgSend__newMTLBufferFromPoolWithLength_(self, v32, v31 * v5, v33);
  sub_1B659C870(v24, v34);

  uint64_t v38 = objc_msgSend_buffer(v34, v35, v36, v37);
  uint64_t v42 = objc_msgSend_contents(v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_offset(v34, v43, v44, v45);
  uint64_t v47 = sub_1B653EFAC((uint64_t)v24);
  sub_1B63D1B04((uint64_t)Object, v42 + v46 + v47, v48, v49, v50, v51, v52, v53);
  return Object;
}

- (uint64_t)unmapVolatileMeshElement:(uint64_t)a3
{
  uint64_t v4 = sub_1B653C040(*(void *)(a1 + 112), a3);
  uint64_t v5 = (void *)sub_1B659CBE8((uint64_t)v4);
  objc_msgSend_buffer(v5, v6, v7, v8);
  uint64_t v9 = (void *)sub_1B659CBE8((uint64_t)v4);
  objc_msgSend_offset(v9, v10, v11, v12);
  sub_1B63D1BA0(a3, v13, v14, v15, v16, v17, v18, v19);

  return sub_1B653EFC4((uint64_t)v4);
}

- (void)resetVolatileMeshElements
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  usedVolatileMeshElements = self->_usedVolatileMeshElements;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(usedVolatileMeshElements, a2, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(usedVolatileMeshElements);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = sub_1B653C040((uint64_t)self->_resourceManager, v10);
        uint64_t v12 = sub_1B659CBE8((uint64_t)v11);
        objc_msgSend__recycleMTLBufferToPool_(self, v13, v12, v14);
        sub_1B659C870(v11, 0);
        sub_1B659CBDC((uint64_t)v11, 0);
        sub_1B63D1B04(v10, 0, v15, v16, v17, v18, v19, v20);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(usedVolatileMeshElements, v21, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v7);
  }
  objc_msgSend_addObjectsFromArray_(self->_freeVolatileMeshElements, v5, (uint64_t)self->_usedVolatileMeshElements, v6);
  objc_msgSend_removeAllObjects(self->_usedVolatileMeshElements, v22, v23, v24);
}

- (void)drawFullScreenQuadForPass:(__CFXFXPass *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  engineContext = self->_engineContext;
  if (!engineContext)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_engineContext");
    engineContext = self->_engineContext;
  }
  uint64_t v11 = sub_1B6447794((uint64_t)engineContext);
  v33[0] = sub_1B65F6BF8((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  v33[1] = sub_1B65F6D48((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = v11;
  v33[5] = sub_1B64ABD78(v11, 0, 1, v26, v27, v28, v29, v30);
  v33[6] = 0;
  v33[7] = a3;
  v33[8] = 0;
  __int16 v34 = 257;
  int v35 = 0;
  __int16 v36 = 0;
  objc_msgSend__executeDrawCommand_(self, v31, (uint64_t)v33, v32);
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  renderEncoder = self->_renderEncoder;
  if (renderEncoder) {
    return (MTLRenderCommandEncoder *)renderEncoder->var3;
  }
  else {
    return 0;
  }
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  uint64_t v2 = sub_1B6445BA0((uint64_t)self->_engineContext);

  return (MTLRenderPassDescriptor *)sub_1B65312B8(v2);
}

- (MTLCommandBuffer)currentCommandBuffer
{
  return self->_currentCommandBuffer;
}

- (void)_drawPBRTextures
{
  uint64_t v5 = objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_colorAttachments(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  uint64_t v16 = objc_msgSend_texture(v12, v13, v14, v15);
  unint64_t v20 = objc_msgSend_pixelFormat(v16, v17, v18, v19);
  uint64_t v24 = objc_msgSend_currentRenderPassDescriptor(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_colorAttachments(v24, v25, v26, v27);
  uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v28, v29, 0, v30);
  int v35 = objc_msgSend_texture(v31, v32, v33, v34);
  unint64_t v39 = objc_msgSend_sampleCount(v35, v36, v37, v38);
  if (v20)
  {
    if (self->_debug.pixelFormat != v20 || self->_debug.sampleCount != v39)
    {
      self->_debug.pixelFormat = v20;
      self->_debug.sampleCount = v39;
      uint64_t v42 = (void *)sub_1B653EFAC((uint64_t)self->_resourceManager);
      memset(&__src[19], 0, 24);
      memset(&__src[13], 0, 88);
      memset(&__src[7], 0, 88);
      memset(__src, 0, 104);
      *((void *)&__src[6] + 1) = objc_msgSend_frameworkLibrary(v42, v43, v44, v45);
      *((void *)&__src[12] + 1) = sub_1B64E35DC();
      *((void *)&__src[18] + 1) = @"quad_vertex";
      *(void *)&__src[19] = @"quad_display_cube_equirectangular";
      uint64_t v49 = objc_msgSend_currentRenderPassDescriptor(self, v46, v47, v48);
      sub_1B659B6B0((uint64_t)&__src[7], v49, v50, v51);

      resourceManager = self->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      self->_debug.displayCubemapPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v53, (uint64_t)__dst, v54);
      *((void *)&__src[12] + 1) = sub_1B64E3664();
      *(void *)&__src[19] = @"quad_display_texture2D";

      uint64_t v55 = self->_resourceManager;
      memcpy(v197, __src, sizeof(v197));
      self->_debug.displayTexture2DPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(v55, v56, (uint64_t)v197, v57);
    }
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v40, 0, v41);
    renderEncoder = self->_renderEncoder;
    uint64_t v59 = sub_1B653EE3C((uint64_t)self->_resourceManager);
    objc_msgSend_setDepthStencilState_(renderEncoder->var3, v60, v59, v61);
    uint64_t v72 = sub_1B644558C((uint64_t)self->_engineContext, v62, v63, v64, v65, v66, v67, v68);
    uint64_t v73 = *(void **)&self->_anon_4100[704];
    if (v73)
    {
      uint64_t v74 = objc_msgSend_arrayLength(v73, v69, v70, v71);
      uint64_t v78 = objc_msgSend_mipmapLevelCount(*(void **)&self->_anon_4100[704], v75, v76, v77);
      uint64_t v82 = objc_msgSend_pixelFormat(*(void **)&self->_anon_4100[704], v79, v80, v81);
      __n128 v86 = sub_1B64479C4((__n128 *)self->_engineContext);
      unint64_t v87 = v86.n128_u64[1];
      float v88 = v86.n128_f32[2] / v86.n128_f32[3];
      float v89 = 1.0 / (float)(unint64_t)v74;
      float v90 = 4.0 / v86.n128_f32[3];
      float v91 = (float)(v89 + (float)((float)(4.0 / v86.n128_f32[3]) * -2.0)) * 2.5;
      float v195 = v89 + (float)((float)(4.0 / v86.n128_f32[3]) * -2.0);
      unint64_t v191 = v86.n128_u64[0];
      if ((float)(v86.n128_f32[2] / v86.n128_f32[3]) <= 1.0) {
        float v92 = v88 * v91;
      }
      else {
        float v92 = v91 / v88;
      }
      float v194 = v92;
      uint64_t v122 = objc_msgSend_textureType(*(void **)&self->_anon_4100[704], v83, v84, v85, v191);
      BOOL IsCube = VFXMTLTextureTypeIsCube(v122);
      char v127 = self->_renderEncoder;
      if (IsCube)
      {
        uint64_t v128 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v124, v125, v126);
        objc_msgSend_setRenderPipelineState_(v127->var3, v129, v128, v130);
        if (v74)
        {
          uint64_t v133 = 0;
          float v134 = (float)-*((float *)&v192 + 1) / *((float *)&v87 + 1);
          *(float *)&long long v132 = *(float *)&v192 / *(float *)&v87;
          long long v193 = v132;
          do
          {
            id v135 = (id)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(*(void **)&self->_anon_4100[704], v131, v82, 5, 0, v78, v133, 6, v193);
            sub_1B63C6ED0((uint64_t)self->_renderEncoder, v135, 0, v136);
            LODWORD(v137) = v193;
            *((float *)&v137 + 1) = v90 + v134;
            *((void *)&v137 + 1) = __PAIR64__(LODWORD(v195), LODWORD(v194));
            long long v196 = v137;
            float v138 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B649F334((uint64_t)v138->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v138->var3, v139, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v140, 4, 0, 4);
            float v134 = v89 + v134;
            v133 += 6;
            --v74;
          }
          while (v74);
        }
      }
      else
      {
        uint64_t v141 = objc_msgSend_state(self->_debug.displayTexture2DPipeline, v124, v125, v126);
        objc_msgSend_setRenderPipelineState_(v127->var3, v142, v141, v143);
        if (v74)
        {
          uint64_t v145 = 0;
          float v146 = 0.0;
          do
          {
            id v147 = (id)objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(*(void **)&self->_anon_4100[704], v144, v82, 2, 0, v78, v145, 1);
            sub_1B63C6ED0((uint64_t)self->_renderEncoder, v147, 0, v148);
            LODWORD(v149) = 0;
            *((float *)&v149 + 1) = v90 + v146;
            *((void *)&v149 + 1) = __PAIR64__(LODWORD(v195), LODWORD(v194));
            long long v196 = v149;
            long long v150 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B649F334((uint64_t)v150->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v150->var3, v151, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v152, 4, 0, 4);
            ++v145;
            float v146 = v89 + v146;
          }
          while (v74 != v145);
        }
      }
    }
    else
    {
      uint64_t v93 = sub_1B64B2810(v72, 0);
      if (v93)
      {
        uint64_t v101 = v93;
        if (sub_1B6475F88(v93, v94, v95, v96, v97, v98, v99, v100)
          || sub_1B6477598(v101, (uint64_t)v102, v103, v104, v105, v106, v107, v108))
        {
          uint64_t v109 = objc_msgSend_radianceTextureForMaterialProperty_(self, v102, v101, v104);
          if (v109)
          {
            __int16 v113 = (void *)v109;
            uint64_t v114 = self->_renderEncoder;
            uint64_t v115 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v110, v111, v112);
            objc_msgSend_setRenderPipelineState_(v114->var3, v116, v115, v117);
            sub_1B63C6ED0((uint64_t)self->_renderEncoder, v113, 0, v118);
            long long v196 = xmmword_1B6E50FC0;
            char v119 = self->_renderEncoder;
            memset(__src, 0, 24);
            sub_1B649F334((uint64_t)v119->var4, &v196, 0x10uLL, (void **)__src);
            objc_msgSend_setVertexBuffer_offset_atIndex_(v119->var3, v120, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
            objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v121, 4, 0, 4);
          }
        }
      }
    }
    uint64_t v153 = sub_1B64B2810(v72, 0);
    if (v153)
    {
      uint64_t v161 = v153;
      if (sub_1B6475F88(v153, (uint64_t)v154, v155, v156, v157, v158, v159, v160)
        || sub_1B6477598(v161, (uint64_t)v154, v162, v156, v163, v164, v165, v166))
      {
        uint64_t v167 = objc_msgSend_irradianceTextureForMaterialProperty_(self, v154, v161, v156);
        if (v167)
        {
          uint64_t v169 = (void *)v167;
          uint64_t v170 = self->_renderEncoder;
          uint64_t v171 = objc_msgSend_state(self->_debug.displayCubemapPipeline, v154, v168, v156);
          objc_msgSend_setRenderPipelineState_(v170->var3, v172, v171, v173);
          sub_1B63C6ED0((uint64_t)self->_renderEncoder, v169, 0, v174);
          long long v196 = xmmword_1B6E50FD0;
          uint64_t v175 = self->_renderEncoder;
          memset(__src, 0, 24);
          sub_1B649F334((uint64_t)v175->var4, &v196, 0x10uLL, (void **)__src);
          objc_msgSend_setVertexBuffer_offset_atIndex_(v175->var3, v176, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
          objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v177, 4, 0, 4);
        }
      }
    }
    uint64_t v178 = objc_msgSend_specularDFGDiffuseHammonTextureWithRenderContext_(self->_resourceManager, v154, (uint64_t)self, v156);
    if (v178)
    {
      unint64_t v182 = (void *)v178;
      int v183 = self->_renderEncoder;
      uint64_t v184 = objc_msgSend_state(self->_debug.displayTexture2DPipeline, v179, v180, v181);
      objc_msgSend_setRenderPipelineState_(v183->var3, v185, v184, v186);
      sub_1B63C6ED0((uint64_t)self->_renderEncoder, v182, 0, v187);
      long long v196 = xmmword_1B6E50FE0;
      uint64_t v188 = self->_renderEncoder;
      memset(__src, 0, 24);
      sub_1B649F334((uint64_t)v188->var4, &v196, 0x10uLL, (void **)__src);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v188->var3, v189, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v190, 4, 0, 4);
    }
  }
}

- (void)_drawShadowMaps
{
  uint64_t v5 = objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_colorAttachments(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0, v11);
  uint64_t v16 = objc_msgSend_texture(v12, v13, v14, v15);
  if (v16)
  {
    unint64_t v20 = v16;
    unint64_t v21 = objc_msgSend_pixelFormat(v16, v17, v18, v19);
    unint64_t v25 = objc_msgSend_sampleCount(v20, v22, v23, v24);
    if (self->_debug.pixelFormat != v21 || self->_debug.sampleCount != v25)
    {
      self->_debug.pixelFormat = v21;
      self->_debug.sampleCount = v25;
      uint64_t v28 = (void *)sub_1B653EFAC((uint64_t)self->_resourceManager);
      *(void *)&__src[20] = 0;
      *((void *)&__src[19] + 1) = 0;
      memset(&__src[7], 0, 184);
      memset(__src, 0, 104);
      *((void *)&__src[6] + 1) = objc_msgSend_frameworkLibrary(v28, v29, v30, v31);
      *((void *)&__src[18] + 1) = @"quad_vertex";
      *(void *)&__src[19] = @"quad_display_depth2D";
      int v35 = objc_msgSend_currentRenderPassDescriptor(self, v32, v33, v34);
      sub_1B659B6B0((uint64_t)&__src[7], v35, v36, v37);

      resourceManager = self->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      self->_debug.displayDepth2DPipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v39, (uint64_t)__dst, v40);
      *(void *)&__src[19] = @"quad_display_depth_cube";

      uint64_t v41 = self->_resourceManager;
      memcpy(v105, __src, sizeof(v105));
      self->_debug.displayDepthCubePipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(v41, v42, (uint64_t)v105, v43);
    }
    objc_msgSend_setCullMode_(self->_renderEncoder->var3, v26, 0, v27);
    renderEncoder = self->_renderEncoder;
    uint64_t v45 = sub_1B653EE3C((uint64_t)self->_resourceManager);
    objc_msgSend_setDepthStencilState_(renderEncoder->var3, v46, v45, v47);
    float v51 = (float)(unint64_t)objc_msgSend_height(v20, v48, v49, v50);
    float v103 = (float)(v51 / (float)(unint64_t)objc_msgSend_width(v20, v52, v53, v54)) * 0.125;
    uint64_t v55 = *(void **)&self->_anon_4100[480];
    if (objc_msgSend_textureType(v55, v56, v57, v58) == 5)
    {
      uint64_t v62 = self->_renderEncoder;
      uint64_t v63 = objc_msgSend_state(self->_debug.displayDepthCubePipeline, v59, v60, v61);
LABEL_9:
      objc_msgSend_setRenderPipelineState_(v62->var3, v64, v63, v65);
      sub_1B63C6ED0((uint64_t)self->_renderEncoder, v55, 0, v69);
      *(void *)&long long v70 = 0x3F5D70A43C23D70ALL;
      *((void *)&v70 + 1) = __PAIR64__(0.125, LODWORD(v103));
      long long v104 = v70;
      uint64_t v71 = self->_renderEncoder;
      memset(__src, 0, 24);
      sub_1B649F334((uint64_t)v71->var4, &v104, 0x10uLL, (void **)__src);
      objc_msgSend_setVertexBuffer_offset_atIndex_(v71->var3, v72, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
      objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v73, 4, 0, 4);
      return;
    }
    if (objc_msgSend_textureType(v55, v59, v60, v61) == 2)
    {
      uint64_t v62 = self->_renderEncoder;
      uint64_t v63 = objc_msgSend_state(self->_debug.displayDepth2DPipeline, v66, v67, v68);
      goto LABEL_9;
    }
    if (objc_msgSend_textureType(v55, v66, v67, v68) == 3)
    {
      uint64_t v77 = self->_renderEncoder;
      uint64_t v78 = objc_msgSend_state(self->_debug.displayDepth2DPipeline, v74, v75, v76);
      objc_msgSend_setRenderPipelineState_(v77->var3, v79, v78, v80);
      if (objc_msgSend_arrayLength(v55, v81, v82, v83))
      {
        unint64_t v87 = 0;
        do
        {
          uint64_t v88 = objc_msgSend_pixelFormat(v55, v84, v85, v86);
          uint64_t v92 = objc_msgSend_mipmapLevelCount(v55, v89, v90, v91);
          uint64_t v94 = objc_msgSend_newTextureViewWithPixelFormat_textureType_levels_slices_(v55, v93, v88, 2, 0, v92, v87, 1);
          sub_1B63C6ED0((uint64_t)self->_renderEncoder, v94, 0, v95);
          *(float *)&long long v96 = (float)((float)v87 * (float)(v103 + 0.01)) + 0.01;
          DWORD1(v96) = 1063088292;
          *((void *)&v96 + 1) = __PAIR64__(0.125, LODWORD(v103));
          long long v104 = v96;
          uint64_t v97 = self->_renderEncoder;
          memset(__src, 0, 24);
          sub_1B649F334((uint64_t)v97->var4, &v104, 0x10uLL, (void **)__src);
          objc_msgSend_setVertexBuffer_offset_atIndex_(v97->var3, v98, *((uint64_t *)&__src[0] + 1), *(uint64_t *)&__src[1], 0);
          objc_msgSend_drawPrimitives_vertexStart_vertexCount_(self->_renderEncoder->var3, v99, 4, 0, 4);

          ++v87;
        }
        while (v87 < objc_msgSend_arrayLength(v55, v100, v101, v102));
      }
    }
  }
}

- (void)_drawFullScreenTexture:(id)a3
{
  uint64_t v6 = objc_msgSend_currentRenderPassDescriptor(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_depthAttachment(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_texture(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_pixelFormat(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_stencilAttachment(v6, v19, v20, v21);
  uint64_t v26 = objc_msgSend_texture(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_pixelFormat(v26, v27, v28, v29);
  uint64_t v34 = 0;
  unint64_t v35 = 0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69
        * (v18 ^ ((0x9DDFEA08EB382D69 * (v30 ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (v30 ^ v18)))) ^ ((0x9DDFEA08EB382D69 * (v18 ^ ((0x9DDFEA08EB382D69 * (v30 ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (v30 ^ v18)))) >> 47));
  do
  {
    uint64_t v36 = objc_msgSend_colorAttachments(v6, v31, v32, v33);
    unint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v36, v37, v34, v38);
    uint64_t v43 = objc_msgSend_texture(v39, v40, v41, v42);
    uint64_t v47 = objc_msgSend_pixelFormat(v43, v44, v45, v46);
    float v51 = objc_msgSend_texture(v39, v48, v49, v50);
    uint64_t v55 = objc_msgSend_sampleCount(v51, v52, v53, v54);
    unint64_t v56 = 0x9DDFEA08EB382D69
        * (v35 ^ ((0x9DDFEA08EB382D69 * (v47 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v47 ^ v35)));
    unint64_t v57 = 0x9DDFEA08EB382D69 * (v56 ^ (v56 >> 47));
    ++v34;
    unint64_t v35 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v57 ^ ((0x9DDFEA08EB382D69 * (v57 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v57 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v57 ^ ((0x9DDFEA08EB382D69 * (v57 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v57 ^ v55)))) >> 47));
  }
  while (v34 != 8);
  if (self->_compositeRendering[0].hash != v35)
  {
    self->_compositeRendering[0].hash = v35;
    uint64_t v58 = (void *)sub_1B653EFAC((uint64_t)self->_resourceManager);
    memset(&__src[38], 0, 24);
    memset(&__src[14], 0, 184);
    memset(__src, 0, 104);
    __src[13] = objc_msgSend_frameworkLibrary(v58, v59, v60, v61);
    __src[37] = @"vfx_draw_fullscreen_triangle_vertex";
    __src[38] = @"vfx_draw_fullscreen_gamma_fragment";
    uint64_t v65 = objc_msgSend_currentRenderPassDescriptor(self, v62, v63, v64);
    sub_1B659B6B0((uint64_t)&__src[14], v65, v66, v67);

    resourceManager = self->_resourceManager;
    memcpy(__dst, __src, sizeof(__dst));
    self->_compositeRendering[0].pipeline = (VFXMTLRenderPipeline *)objc_msgSend_newRenderPipelineStateWithDesc_(resourceManager, v69, (uint64_t)__dst, v70);
  }
  objc_msgSend_setCullMode_(self->_renderEncoder->var3, v31, 0, v33);
  renderEncoder = self->_renderEncoder;
  uint64_t v72 = sub_1B653EE3C((uint64_t)self->_resourceManager);
  objc_msgSend_setDepthStencilState_(renderEncoder->var3, v73, v72, v74);
  uint64_t v75 = self->_renderEncoder;
  uint64_t v79 = objc_msgSend_state(self->_compositeRendering[0].pipeline, v76, v77, v78);
  objc_msgSend_setRenderPipelineState_(v75->var3, v80, v79, v81);
  sub_1B63C6ED0((uint64_t)self->_renderEncoder, a3, 0, v82);
  sub_1B63C6F54((uint64_t)self->_renderEncoder, v83);
}

- (float)renderTime
{
  return *(float *)&self->_anon_250[444];
}

- (double)renderSize
{
  return *(double *)(a1 + 232);
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  renderEncoder = self->_renderEncoder;
  int currentStreamBufferIndices = (unsigned __int16)self->_currentStreamBufferIndices;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  sub_1B649F334((uint64_t)renderEncoder->var4, a3, a4, &v9);
  uint64_t v7 = v10;
  uint64_t v8 = v11;
  if ((_BYTE)currentStreamBufferIndices != 0xFF) {
    objc_msgSend_setVertexBuffer_offset_atIndex_(renderEncoder->var3, v6, v10, v11, (char)currentStreamBufferIndices);
  }
  if ((~currentStreamBufferIndices & 0xFF00) != 0) {
    objc_msgSend_setFragmentBuffer_offset_atIndex_(renderEncoder->var3, v6, v7, v8, (uint64_t)(__int16)currentStreamBufferIndices >> 8);
  }
}

- (void)setCurrentPassHash:(unint64_t)a3
{
  self->_renderGraph.passHash = a3;
}

- (void)setCurrentPassMaterial:(__CFXMaterial *)a3
{
  self->_renderGraph.uint64_t material = a3;
}

- (unint64_t)getCurrentPassHash
{
  return self->_renderGraph.passHash;
}

- (__CFXMaterial)getCurrentPassMaterial
{
  return self->_renderGraph.material;
}

- (unint64_t)cubeArrayTypeIfSupported
{
  if ((self->_features & 0x100) != 0) {
    return 6;
  }
  else {
    return 3;
  }
}

- (void)addCommandBufferScheduledHandler:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_commandBufferScheduledHandlers)
  {
    id v12 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id commandBufferScheduledHandlers = self->_commandBufferScheduledHandlers;
    if (isKindOfClass)
    {
      objc_msgSend_addObject_(self->_commandBufferScheduledHandlers, v7, (uint64_t)v12, v8);
    }
    else
    {
      v13[0] = self->_commandBufferScheduledHandlers;
      v13[1] = v12;
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      self->_id commandBufferScheduledHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);
    }
  }
  else
  {
    self->_id commandBufferScheduledHandlers = v5;
  }
}

- (void)addCommandBufferCompletedHandler:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_commandBufferCompletedHandlers)
  {
    id v12 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id commandBufferCompletedHandlers = self->_commandBufferCompletedHandlers;
    if (isKindOfClass)
    {
      objc_msgSend_addObject_(self->_commandBufferCompletedHandlers, v7, (uint64_t)v12, v8);
    }
    else
    {
      v13[0] = self->_commandBufferCompletedHandlers;
      v13[1] = v12;
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      self->_id commandBufferCompletedHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);
    }
  }
  else
  {
    self->_id commandBufferCompletedHandlers = v5;
  }
}

- (void)addDrawablePresentedHandler:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  if (self->_drawablePresentedHandlers)
  {
    id v12 = v5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id drawablePresentedHandlers = self->_drawablePresentedHandlers;
    if (isKindOfClass)
    {
      objc_msgSend_addObject_(self->_drawablePresentedHandlers, v7, (uint64_t)v12, v8);
    }
    else
    {
      v13[0] = self->_drawablePresentedHandlers;
      v13[1] = v12;
      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      self->_id drawablePresentedHandlers = (id)objc_msgSend_initWithObjects_count_(v10, v11, (uint64_t)v13, 2);
    }
  }
  else
  {
    self->_id drawablePresentedHandlers = v5;
  }
}

- (void)_allowGPUBackgroundExecution
{
  if (!self->_clientCommandBuffer && !objc_msgSend_clientCommandQueue(self, a2, v2, v3))
  {
    ownedCommandQueue = self->_ownedCommandQueue;
    if (ownedCommandQueue)
    {
      if (objc_msgSend_getBackgroundGPUPriority(self->_ownedCommandQueue, v5, v6, v7) != 3) {
        return;
      }
      uint64_t v11 = ownedCommandQueue;
    }
    else
    {
      id v12 = (void *)sub_1B653EFC4((uint64_t)self->_resourceManager);
      if (objc_msgSend_getBackgroundGPUPriority(v12, v13, v14, v15) != 3) {
        return;
      }
      uint64_t v11 = (MTLCommandQueue *)v12;
    }
    objc_msgSend_setBackgroundGPUPriority_(v11, v9, 2, v10);
  }
}

- (void)_VFXWorldRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(id)a3 commandBuffer:(id)a4 renderPassDescriptor:(id)a5
{
  uint64_t v12 = sub_1B644558C((uint64_t)self->_engineContext, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  uint64_t v13 = sub_1B64B27BC(v12, 0);
  if (v13)
  {
    uint64_t v19 = v13;
    renderEncoder = self->_renderEncoder;
    if (renderEncoder->var3 == a3)
    {
      engineContext = self->_engineContext;
      sub_1B64457FC((uint64_t)engineContext, v19, 0, v14, v15, v16, v17, v18);
    }
    else
    {
      currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
      uint64_t v37 = objc_alloc_init(RGCachedRenderCommandEncoder);
      objc_msgSend_setDeferredBindingEnabled_(v37, v22, 1, v23);
      self->_renderEncoder = (VFXMTLRenderCommandEncoder *)v36;
      self->_currentRenderPassDescriptor = (MTLRenderPassDescriptor *)a5;
      sub_1B6490B98((uint64_t)v36, (const char *)a4, (uint64_t)a3, (uint64_t)self->_frameConstantBufferPool, v24, v25, v26, v27);
      objc_msgSend_setFrontFacingWinding_(self->_renderEncoder->var3, v28, !self->_renderEncoder->var5, v29);
      sub_1B64457FC((uint64_t)self->_engineContext, v19, 0, v30, v31, v32, v33, v34);
      self->_renderEncoder = renderEncoder;
      self->_currentRenderPassDescriptor = currentRenderPassDescriptor;
    }
  }
}

- (CFXVFXRenderTargetInfo)renderTargetInfo
{
  uint64_t v5 = objc_msgSend_currentRenderPassDescriptor(self, a2, v2, v3);
  objc_msgSend_setDescriptor_(self->_renderTargetInfo, v6, v5, v7);
  objc_msgSend_renderSize(self, v8, v9, v10);
  unsigned int v32 = v11;
  objc_msgSend_renderSize(self, v12, v13, v14);
  unsigned int v31 = v15;
  objc_msgSend_renderSize(self, v16, v17, v18);
  objc_msgSend_renderSize(self, v19, v20, v21);
  __asm { FMOV            V0.2S, #1.0 }
  objc_msgSend_set_renderTargetSize_(self->_renderTargetInfo, v27, v28, v29, COERCE_DOUBLE(__PAIR64__(v31, v32)));
  return self->_renderTargetInfo;
}

- (MTLRenderPassDescriptor)clientRenderPassDescriptor
{
  return self->_clientRenderPassDescriptor;
}

- (void)setClientRenderPassDescriptor:(id)a3
{
}

- (MTLRenderCommandEncoder)clientRenderCommandEncoder
{
  return self->_clientRenderCommandEncoder;
}

- (void)setClientRenderCommandEncoder:(id)a3
{
}

- (MTLCommandBuffer)clientCommandBuffer
{
  return self->_clientCommandBuffer;
}

- (void)setClientCommandBuffer:(id)a3
{
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(unint64_t)a3
{
  self->_unint64_t debugOptions = a3;
}

- (VFXMTLResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void)frameTexturePool
{
  return self->_frameTexturePool;
}

- (BOOL)shouldPresentAfterMinimumDuration
{
  return self->_shouldPresentAfterMinimumDuration;
}

- (void)setShouldPresentAfterMinimumDuration:(BOOL)a3
{
  self->_shouldPresentAfterMinimumDuration = a3;
}

- (void)renderEncoder
{
  return self->_renderEncoder;
}

- (MTLCommandQueue)clientCommandQueue
{
  return self->_clientCommandQueue;
}

- (void)setClientCommandQueue:(id)a3
{
}

- (VFXMTLRenderContextResourceManagerMonitor)resourceManagerMonitor
{
  return (VFXMTLRenderContextResourceManagerMonitor *)objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)setResourceManagerMonitor:(id)a3
{
}

- (VFXMTLRenderContextCommandBufferStatusMonitor)commandBufferStatusMonitor
{
  return (VFXMTLRenderContextCommandBufferStatusMonitor *)objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)setCommandBufferStatusMonitor:(id)a3
{
}

- (BOOL)canRecycleParticleBuffers
{
  return self->_canRecycleParticleBuffers;
}

- (void)setCanRecycleParticleBuffers:(BOOL)a3
{
  self->_canRecycleParticleBuffers = a3;
}

- (BOOL)requireLoadFinalTexture
{
  return self->_requireLoadFinalTexture;
}

- (void)setRequireLoadFinalTexture:(BOOL)a3
{
  self->_requireLoadFinalTexture = a3;
}

- (BOOL)simulateCommandBufferFailure
{
  return self->_simulateCommandBufferFailure;
}

- (void)setSimulateCommandBufferFailure:(BOOL)a3
{
  self->_simulateCommandBufferFailure = a3;
}

- (float)superSamplingFactor
{
  return self->_superSamplingFactor;
}

- (void)setSuperSamplingFactor:(float)a3
{
  self->_superSamplingFactor = a3;
}

- (NSString)generatedTexturePath
{
  return self->_generatedTexturePath;
}

- (void)setGeneratedTexturePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
  sub_1B63FFCB4((id *)&self->_anon_4100[144]);
  sub_1B6491404((uint64_t)&self->_lighting);
  encoder = self->_resourceComputeEncoder._encoder;
}

- (id).cxx_construct
{
  self->_pendingGPUFrameCount.__a_.__a_value = 0;
  self->_resourceBlitEncoder._encoder = 0;
  self->_resourceBlitEncoder._commandBuffer = 0;
  self->_resourceComputeEncoder._encoder = objc_alloc_init(RGCachedComputeCommandEncoder);
  self->_resourceComputeEncoder._bufferPool = 0;
  uint64_t v3 = -12544;
  do
  {
    uint64_t v4 = (_OWORD *)((char *)self + v3);
    v4[867] = 0uLL;
    v4[866] = 0uLL;
    v4[865] = 0uLL;
    v4[864] = 0uLL;
    v4[821] = 0uLL;
    v4[822] = 0uLL;
    v4[823] = 0uLL;
    v4[824] = 0uLL;
    v4[825] = 0uLL;
    v4[826] = 0uLL;
    v4[827] = 0uLL;
    v4[828] = 0uLL;
    v4[829] = 0uLL;
    v4[830] = 0uLL;
    v4[831] = 0uLL;
    v4[832] = 0uLL;
    v4[833] = 0uLL;
    v4[834] = 0uLL;
    v4[835] = 0uLL;
    v4[836] = 0uLL;
    v4[837] = 0uLL;
    v4[838] = 0uLL;
    v4[839] = 0uLL;
    v4[840] = 0uLL;
    v4[841] = 0uLL;
    v4[842] = 0uLL;
    v4[843] = 0uLL;
    v4[844] = 0uLL;
    v4[861] = 0uLL;
    v4[860] = 0uLL;
    v4[859] = 0uLL;
    v4[858] = 0uLL;
    v4[857] = 0uLL;
    v4[856] = 0uLL;
    v4[855] = 0uLL;
    v4[854] = 0uLL;
    v4[853] = 0uLL;
    v4[852] = 0uLL;
    v4[851] = 0uLL;
    v4[850] = 0uLL;
    v3 += 784;
  }
  while (v3);
  bzero(&self->_nodeUniforms, 0xCC0uLL);
  *(_OWORD *)&self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__bucket_list_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__p3_.__value_ = 1.0;
  sub_1B63FFC10((uint64_t)&self->_anon_4100[144]);
  return self;
}

- (id)texture:(int)a3 :(id)a4
{
  if (!objc_msgSend_isEqualToString_(a4, a2, @"shadowMap", (uint64_t)a4)) {
    return 0;
  }
  uint64_t v5 = sub_1B63C4588((uint64_t)self->_processingContext.lightingSystem);
  if (!v5) {
    return 0;
  }
  uint64_t v12 = (const CFX::RG::Resource *)v5;
  engineContext = self->_engineContext;

  return sub_1B6447A14((uint64_t)engineContext, v12, v6, v7, v8, v9, v10, v11);
}

- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_msgSend_engineContext(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6);
  uint64_t v10 = sub_1B6445BA0(v9);
  if (!v10) {
    return 0;
  }
  uint64_t v13 = v10;
  if (!objc_msgSend_isEqualToString_(a4, v11, @"passConstants", v12))
  {
    objc_msgSend_UTF8String(a4, v14, v15, v16);
    sub_1B63F2F54(16, @"Error: VFXMTLRenderContext::buffer not implemented for scope %d and name %s", v45, v46, v47, v48, v49, v50, v7);
    return 0;
  }
  uint64_t v17 = objc_msgSend_resourceManager(self, v14, v15, v16);
  uint64_t v18 = (void *)sub_1B653EFAC(v17);
  uint64_t v22 = objc_msgSend_frameworkLibrary(v18, v19, v20, v21);
  uint64_t v25 = objc_msgSend_newFunctionWithName_(v22, v23, @"pass_constants_encoder", v24);
  uint64_t v28 = objc_msgSend_newArgumentEncoderWithBufferIndex_(v25, v26, 0, v27);

  unsigned int v32 = objc_msgSend_device(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_encodedLength(v28, v33, v34, v35);
  uint64_t v38 = objc_msgSend_newBufferWithLength_options_(v32, v37, v36, 0);
  objc_msgSend_setArgumentBuffer_offset_(v28, v39, (uint64_t)v38, 0);
  id v42 = sub_1B65F46E0(v13, @"VFX-Depth-Linear", v40, v41);
  objc_msgSend_setTexture_atIndex_(v28, v43, (uint64_t)v42, 30);

  return v38;
}

- (id)sampler:(int)a3 :(id)a4
{
  sub_1B63F2F54(16, @"Error: VFXMTLRenderContext::sampler no implemented", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, vars0);
  return 0;
}

- (const)constantData:(int)a3
{
  anon_43d0 = self->_anon_43d0;
  if (a3 != 8) {
    anon_43d0 = 0;
  }
  if (a3 == 1) {
    return (const char *)self->_anon_43d0;
  }
  else {
    return (const char *)anon_43d0;
  }
}

- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  if (a3 != 1)
  {
    if (a3 == 8)
    {
      if (objc_msgSend_isEqualToString_(a4, a2, @"crWorldToViewArray", (uint64_t)a4))
      {
        *a5 = 0;
LABEL_15:
        int64_t v14 = (unint64_t)self->_renderPassParameters.eyeCount << 6;
LABEL_16:
        BOOL result = 1;
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(a4, v10, @"crWorldToProjArray", v11))
      {
        int64_t v17 = 128;
LABEL_14:
        *a5 = v17;
        goto LABEL_15;
      }
      if (objc_msgSend_isEqualToString_(a4, v15, @"viewToProjArray", v16))
      {
        int64_t v17 = 256;
        goto LABEL_14;
      }
      if (objc_msgSend_isEqualToString_(a4, v18, @"projToViewArray", v19))
      {
        int64_t v17 = 384;
        goto LABEL_14;
      }
      if (objc_msgSend_isEqualToString_(a4, v20, @"crwsCameraPositionArray", v21))
      {
        int64_t v24 = 512;
LABEL_19:
        *a5 = v24;
        int64_t v14 = 16 * self->_renderPassParameters.eyeCount;
        goto LABEL_16;
      }
      if (objc_msgSend_isEqualToString_(a4, v22, @"renderTargetSize", v23))
      {
        int64_t v12 = 560;
        goto LABEL_7;
      }
      if (objc_msgSend_isEqualToString_(a4, v25, @"viewportCount", v26))
      {
        int64_t v29 = 576;
LABEL_26:
        *a5 = v29;
        BOOL result = 1;
        int64_t v14 = 4;
        goto LABEL_30;
      }
      if (objc_msgSend_isEqualToString_(a4, v27, @"useVertexAmplification", v28))
      {
        int64_t v29 = 580;
        goto LABEL_26;
      }
      if (objc_msgSend_isEqualToString_(a4, v30, @"viewportPercentsArray", v31))
      {
        int64_t v24 = 592;
        goto LABEL_19;
      }
    }
LABEL_29:
    int64_t v14 = 0;
    BOOL result = 0;
    *a5 = 0;
    goto LABEL_30;
  }
  if (!objc_msgSend_isEqualToString_(a4, a2, @"crwsReferencePosition", (uint64_t)a4)) {
    goto LABEL_29;
  }
  int64_t v12 = 544;
LABEL_7:
  *a5 = v12;
  BOOL result = 1;
  int64_t v14 = 16;
LABEL_30:
  *a6 = v14;
  return result;
}

- (void)viewports:(const void *)a3 :(int64_t *)a4
{
  *a3 = self->_vfxCoreViewports;
  *a4 = self->_renderPassParameters.eyeCount;
}

- (BOOL)depthOnly
{
  return self->_depthOnly;
}

- (BOOL)renderInGBuffer
{
  return (self->_commonProfileConditioner >> 9) & 1;
}

- (BOOL)outputsNormal
{
  return self->_commonProfileConditioner & 1;
}

- (int64_t)renderMode
{
  return self->_renderMode;
}

- (BOOL)isDrawingBlur
{
  return 0;
}

- (BOOL)isLayeredRendering
{
  return self->_renderPassParameters.viewMapping == 1;
}

@end