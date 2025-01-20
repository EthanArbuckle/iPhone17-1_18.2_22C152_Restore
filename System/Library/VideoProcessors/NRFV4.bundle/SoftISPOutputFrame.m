@interface SoftISPOutputFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts;
- ($FA854DD5444320DDC86C81E6605CE88F)frameID;
- (BOOL)allCommandBuffersEnqueued;
- (BOOL)enableCMIResource;
- (BOOL)hasValidRegistration;
- (CMIResource)resource;
- (FigMetalExecutionStatus)metalExecutionStatus;
- (MTLCommandBuffer)commandBuffer;
- (NSArray)textures;
- (NSDictionary)lscParameters;
- (NSDictionary)metadata;
- (NSDictionary)processingOptions;
- (NSMutableDictionary)auxiliaryPixelBuffers;
- (SoftISPOutputFrame)initWithInputFrame:(id)a3 maximumOutputDimensions:(id)a4 outputDownscaleFactor:(unsigned int)a5 parentProcessor:(id)a6;
- (SoftISPProcessor)parentProcessor;
- (__CVBuffer)flashLSCPixelBuffer;
- (__CVBuffer)getAuxiliaryPixelBufferForAuxiliaryType:(int)a3;
- (__CVBuffer)lscPixelBuffer;
- (__CVBuffer)pixelBuffer;
- (__n128)regHomography;
- (__n128)setRegHomography:(__n128)a3;
- (id)description;
- (id)getAuxiliaryPixelBuffers;
- (int)allocateTexturesForConfig:(id)a3 metalContext:(id)a4;
- (int)bindTexturesForConfig:(id)a3 metalContext:(id)a4;
- (int)error;
- (int)numberOfCalledCompletionHandlers;
- (int)numberOfCompletionHandlers;
- (uint64_t)outputBufferRectWithinSensorCropRect;
- (uint64_t)outputDownscaleFactor;
- (unint64_t)gpuError;
- (unint64_t)gpuStatus;
- (unint64_t)uniqueID;
- (void)addCompletionHandlerToCommandBuffer:(id)a3;
- (void)dealloc;
- (void)releaseAuxiliaryPixelBuffers;
- (void)releasePixelBuffer;
- (void)releaseTextures;
- (void)setAuxiliaryPixelBuffer:(__CVBuffer *)a3 auxiliaryType:(int)a4;
- (void)setAuxiliaryPixelBuffers:(id)a3;
- (void)setCommandBuffer:(id)a3;
- (void)setEnableCMIResource:(BOOL)a3;
- (void)setError:(int)a3;
- (void)setFlashLSCPixelBuffer:(__CVBuffer *)a3;
- (void)setGpuError:(unint64_t)a3;
- (void)setGpuStatus:(unint64_t)a3;
- (void)setHasValidRegistration:(BOOL)a3;
- (void)setLscParameters:(id)a3;
- (void)setLscPixelBuffer:(__CVBuffer *)a3;
- (void)setMetadata:(id)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)signalAllCommandBuffersEnqueued;
- (void)waitForCompletion;
@end

@implementation SoftISPOutputFrame

- (SoftISPOutputFrame)initWithInputFrame:(id)a3 maximumOutputDimensions:(id)a4 outputDownscaleFactor:(unsigned int)a5 parentProcessor:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = v11;
  if (!v10 || !a5 || !v11) {
    goto LABEL_20;
  }
  v40.receiver = self;
  v40.super_class = (Class)SoftISPOutputFrame;
  v13 = [(SoftISPOutputFrame *)&v40 init];
  self = v13;
  if (!v13)
  {
    FigDebugAssert3();
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v13->_parentProcessor, a6);
  self->_outputDownscaleFactor = a5;
  self->_hasValidRegistration = 0;
  uint64_t v14 = MEMORY[0x263EF89A0];
  long long v15 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self[1]._outputDownscaleFactor = v15;
  *(_OWORD *)&self[1]._resource = *(_OWORD *)(v14 + 32);
  self->_uniqueID = -[SoftISPInputFrame uniqueID]((uint64_t)v10);
  self->_frameID.frameID = -[SoftISPInputFrame frameID]((uint64_t)v10);
  [(SoftISPInputFrame *)(uint64_t)v10 pts];
  *(_OWORD *)&self->_pts.value = v38;
  self->_pts.epoch = v39;
  -[SoftISPInputFrame processingOptions]((uint64_t)v10);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  processingOptions = self->_processingOptions;
  self->_processingOptions = v16;

  *($F61E096109CF133FD2477F48C7D0CEE7 *)self->_anon_88 = a4;
  self->_error = 0;
  self->_gpuStatus = 0;
  self->_gpuError = 0;
  v18 = (FigMetalExecutionStatus *)objc_opt_new();
  metalExecutionStatus = self->_metalExecutionStatus;
  self->_metalExecutionStatus = v18;

  if (!self->_metalExecutionStatus)
  {
LABEL_20:
    FigDebugAssert3();

    self = 0;
    goto LABEL_15;
  }
  v20 = (NSMutableDictionary *)objc_opt_new();
  auxiliaryPixelBuffers = self->_auxiliaryPixelBuffers;
  self->_auxiliaryPixelBuffers = v20;

  self->_enableCMIResource = 0;
  int32x2_t v37 = vmul_s32(vdup_n_s32(-[SoftISPInputFrame quadraBinningFactor]((uint64_t)v10) * a5), (int32x2_t)a4);
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v10);
  int v23 = v22 - v37.i32[0];
  if (v22 < v37.i32[0]) {
    ++v23;
  }
  double v24 = (double)(v23 >> 1);
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v10);
  int v26 = v25 - v37.i32[1];
  if (v25 < v37.i32[1]) {
    ++v26;
  }
  [(NSDictionary *)self->_processingOptions cmi_cgRectForKey:@"OutputBufferRectWithinSensorCropRect", 0, v24, (double)(v26 >> 1), (double)v37.u32[0], (double)v37.u32[1] defaultValue found];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  int v35 = -4;
  if (-[SoftISPInputFrame cfaLayout]((uint64_t)v10) != 3)
  {
    if (-[SoftISPInputFrame cfaLayout]((uint64_t)v10) == 2) {
      int v35 = -4;
    }
    else {
      int v35 = -2;
    }
  }
  *(_DWORD *)self->_anon_a8 = v35 & (int)v28;
  *(_DWORD *)&self->_anon_a8[4] = v35 & (int)v30;
  *(_DWORD *)&self->_anon_a8[8] = v35 & v32;
  *(_DWORD *)&self->_anon_a8[12] = v35 & v34;
LABEL_15:

  return self;
}

- (void)dealloc
{
  [(SoftISPOutputFrame *)self releaseTextures];
  resource = self->_resource;
  self->_resource = 0;

  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_lscPixelBuffer);
  CVPixelBufferRelease(self->_flashLSCPixelBuffer);
  [(SoftISPOutputFrame *)self releaseAuxiliaryPixelBuffers];
  v4.receiver = self;
  v4.super_class = (Class)SoftISPOutputFrame;
  [(SoftISPOutputFrame *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t gpuStatus = self->_gpuStatus;
  pixelBuffer = self->_pixelBuffer;
  unint64_t uniqueID = self->_uniqueID;
  uint64_t error = self->_error;
  CMTime time = (CMTime)self->_pts;
  id v10 = [v3 stringWithFormat:@"%@(error=%d, gpuStatus=%d, pixelBuffer=0x%p, uniqueID=%llu pts=%f, captureIdx=%u, sensorIdx=0x%x, tmIdx=%d, bracketIdx=%d, isSIFR=%u, isPB=%u, hasValidRegistration=%u)", v5, error, gpuStatus, pixelBuffer, uniqueID, CMTimeGetSeconds(&time), self->_frameID.var0.captureIndex, self->_frameID.var0.sensorIndex, self->_frameID.var0.timeMachineIndex, self->_frameID.var0.bracketedCaptureIndex, self->_frameID.var0.isSIFR, self->_frameID.var0.isPB, self->_hasValidRegistration];

  return v10;
}

- (void)setLscPixelBuffer:(__CVBuffer *)a3
{
  self->_lscPixelBuffer = a3;
}

- (void)setFlashLSCPixelBuffer:(__CVBuffer *)a3
{
  self->_flashLSCPixelBuffer = a3;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (void)releasePixelBuffer
{
  textures = self->_textures;
  self->_textures = 0;

  CVPixelBufferRelease(self->_pixelBuffer);
  self->_pixelBuffer = 0;
}

- (void)releaseTextures
{
  if ([(NSArray *)self->_textures count])
  {
    objc_super v4 = [(NSArray *)self->_textures objectAtIndexedSubscript:0];
    FigMetalDecRef();
  }
  if ([(NSArray *)self->_textures count] == 2)
  {
    v5 = [(NSArray *)self->_textures objectAtIndexedSubscript:1];
    FigMetalDecRef();
  }
  textures = self->_textures;
  self->_textures = 0;
}

- (id)getAuxiliaryPixelBuffers
{
  return self->_auxiliaryPixelBuffers;
}

- (__CVBuffer)getAuxiliaryPixelBufferForAuxiliaryType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  auxiliaryPixelBuffers = self->_auxiliaryPixelBuffers;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v7 = [(NSMutableDictionary *)auxiliaryPixelBuffers objectForKey:v6];

  if (!v7) {
    return 0;
  }
  v8 = self->_auxiliaryPixelBuffers;
  v9 = [NSNumber numberWithUnsignedInt:v3];
  id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];

  return (__CVBuffer *)v10;
}

- (void)setAuxiliaryPixelBuffer:(__CVBuffer *)a3 auxiliaryType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  CVPixelBufferRetain(a3);
  auxiliaryPixelBuffers = self->_auxiliaryPixelBuffers;
  v7 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)auxiliaryPixelBuffers setObject:a3 forKeyedSubscript:v7];
}

- (void)releaseAuxiliaryPixelBuffers
{
}

- (int)bindTexturesForConfig:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && !self->_textures
    && ([v6 outputMTLPixelFormatForPlane],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        (uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10]) != 0))
  {
    v12 = (NSArray *)v11;
    if (v10)
    {
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [v6 outputMTLPixelFormatForPlane];
        long long v15 = [v14 objectAtIndexedSubscript:v13];
        uint64_t v16 = [v15 unsignedIntegerValue];

        uint64_t v17 = [v8 bindPixelBufferToMTL2DTexture:self->_pixelBuffer pixelFormat:v16 usage:23 plane:v13];
        if (!v17) {
          break;
        }
        v18 = (void *)v17;
        [(NSArray *)v12 addObject:v17];

        if (v10 == ++v13) {
          goto LABEL_9;
        }
      }
      int v21 = FigSignalErrorAt();
    }
    else
    {
LABEL_9:
      textures = self->_textures;
      self->_textures = v12;
      v20 = v12;

      int v21 = 0;
    }
  }
  else
  {
    int v21 = FigSignalErrorAt();
  }

  return v21;
}

- (int)allocateTexturesForConfig:(id)a3 metalContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && !self->_textures
    && ([v6 outputMTLPixelFormatForPlane],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        (uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10]) != 0))
  {
    v12 = (NSArray *)v11;
    double v31 = self;
    if (v10)
    {
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [v8 allocator];
        long long v15 = (void *)[v14 newTextureDescriptor];

        uint64_t v16 = [v6 outputMTLPixelFormatForPlane];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v13];
        uint64_t v18 = [v17 unsignedIntegerValue];
        v19 = [v15 desc];
        [v19 setPixelFormat:v18];

        v20 = [v15 desc];
        [v20 setUsage:7];

        uint64_t v21 = [v6 maximumOutputDimensions];
        int v22 = [v15 desc];
        [v22 setWidth:v21];

        unint64_t v23 = (unint64_t)[v6 maximumOutputDimensions] >> 32;
        double v24 = [v15 desc];
        [v24 setHeight:v23];

        [v15 setLabel:0];
        int v25 = [v8 allocator];
        int v26 = (void *)[v25 newTextureWithDescriptor:v15];

        if (!v26) {
          break;
        }
        [(NSArray *)v12 addObject:v26];

        if (v10 == ++v13) {
          goto LABEL_9;
        }
      }
      int v29 = FigSignalErrorAt();
    }
    else
    {
LABEL_9:
      textures = v31->_textures;
      v31->_textures = v12;
      double v28 = v12;

      int v29 = 0;
    }
  }
  else
  {
    int v29 = FigSignalErrorAt();
  }

  return v29;
}

- (CMIResource)resource
{
  v21[1] = *MEMORY[0x263EF8340];
  if (self->_enableCMIResource)
  {
    resource = self->_resource;
    if (resource)
    {
      uint64_t v4 = 0;
      v5 = 0;
    }
    else
    {
      uint64_t v6 = *MEMORY[0x263F04238];
      uint64_t v4 = (void *)CVBufferCopyAttachment(self->_pixelBuffer, (CFStringRef)*MEMORY[0x263F04238], 0);
      v5 = objc_opt_new();
      [v5 setMetadata:self->_metadata];
      [v5 setMatchingPixelBufferFormat:CVPixelBufferGetPixelFormatType(self->_pixelBuffer)];
      uint64_t v20 = v6;
      v21[0] = v4;
      id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v5 setAttachments:v7];

      size_t PlaneCount = CVPixelBufferGetPlaneCount(self->_pixelBuffer);
      v9 = [(NSArray *)self->_textures objectAtIndexedSubscript:0];
      FigMetalDetachFromAllocator();

      if (PlaneCount < 2)
      {
        id v16 = objc_alloc(MEMORY[0x263F2EDA8]);
        v12 = [(NSArray *)self->_textures objectAtIndexedSubscript:0];
        uint64_t v17 = (CMIResource *)[v16 initWithTexture:v12 descriptor:v5];
        uint64_t v13 = self->_resource;
        self->_resource = v17;
      }
      else
      {
        uint64_t v10 = [(NSArray *)self->_textures objectAtIndexedSubscript:1];
        FigMetalDetachFromAllocator();

        id v11 = objc_alloc(MEMORY[0x263F2EDB0]);
        v12 = [(NSArray *)self->_textures objectAtIndexedSubscript:0];
        uint64_t v13 = [(NSArray *)self->_textures objectAtIndexedSubscript:1];
        uint64_t v14 = (CMIResource *)[v11 initWithTextureY:v12 textureUV:v13 descriptor:v5];
        long long v15 = self->_resource;
        self->_resource = v14;
      }
      [(SoftISPOutputFrame *)self releaseTextures];
      resource = self->_resource;
      if (!resource)
      {
        FigSignalErrorAt();
        uint64_t v18 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v18 = resource;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v18 = 0;
LABEL_10:

  return v18;
}

- (void)addCompletionHandlerToCommandBuffer:(id)a3
{
  id v5 = a3;
  int v6 = self->_numberOfCompletionHandlers + 1;
  self->_numberOfCompletionHandlers = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SoftISPOutputFrame_addCompletionHandlerToCommandBuffer___block_invoke;
  v8[3] = &unk_2655C7338;
  v8[4] = self;
  int v9 = v6;
  id v7 = (void *)MEMORY[0x263E64CF0](v8);
  if (v5)
  {
    objc_storeStrong((id *)&self->_commandBuffer, a3);
    [(MTLCommandBuffer *)self->_commandBuffer addCompletedHandler:v7];
  }
}

void __58__SoftISPOutputFrame_addCompletionHandlerToCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 24);
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
  objc_sync_exit(v3);

  if ([v15 status] != 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setGpuStatus:", objc_msgSend(v15, "status"));
    id v11 = [v15 error];
    objc_msgSend(*(id *)(a1 + 32), "setGpuError:", objc_msgSend(v11, "code"));

    v12 = [*(id *)(a1 + 32) parentProcessor];
    uint64_t v13 = [v12 delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
    int v9 = [*(id *)(a1 + 32) parentProcessor];
    uint64_t v10 = [v9 delegate];
    [v10 outputFrameGPUFailure:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  if (v4)
  {
    int v5 = *(_DWORD *)(a1 + 40);
    if (v5 == [*(id *)(a1 + 32) numberOfCompletionHandlers])
    {
      int v6 = [*(id *)(a1 + 32) parentProcessor];
      id v7 = [v6 delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        int v9 = [*(id *)(a1 + 32) parentProcessor];
        uint64_t v10 = [v9 delegate];
        [v10 outputFrameCompleted:*(void *)(a1 + 32)];
LABEL_8:
      }
    }
  }
LABEL_9:
}

- (void)signalAllCommandBuffersEnqueued
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_allCommandBuffersEnqueued = 1;
  int numberOfCompletionHandlers = v2->_numberOfCompletionHandlers;
  int numberOfCalledCompletionHandlers = v2->_numberOfCalledCompletionHandlers;
  objc_sync_exit(v2);

  if (numberOfCompletionHandlers == numberOfCalledCompletionHandlers)
  {
    int v5 = [(SoftISPOutputFrame *)v2 parentProcessor];
    int v6 = [v5 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [(SoftISPOutputFrame *)v2 parentProcessor];
      char v8 = [v9 delegate];
      [v8 outputFrameCompleted:v2];
    }
  }
}

- (void)waitForCompletion
{
  [(MTLCommandBuffer *)self->_commandBuffer waitUntilCompleted];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;
}

- (BOOL)enableCMIResource
{
  return self->_enableCMIResource;
}

- (void)setEnableCMIResource:(BOOL)a3
{
  self->_enableCMIResource = a3;
}

- (SoftISPProcessor)parentProcessor
{
  return self->_parentProcessor;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)processingOptions
{
  return self->_processingOptions;
}

- (BOOL)hasValidRegistration
{
  return self->_hasValidRegistration;
}

- (void)setHasValidRegistration:(BOOL)a3
{
  self->_hasValidRegistration = a3;
}

- (__n128)regHomography
{
  return a1[13];
}

- (__n128)setRegHomography:(__n128)a3
{
  result[13] = a2;
  result[14] = a3;
  result[15] = a4;
  return result;
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- ($FA854DD5444320DDC86C81E6605CE88F)frameID
{
  return ($FA854DD5444320DDC86C81E6605CE88F)self->_frameID.frameID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_uint64_t error = a3;
}

- (unint64_t)gpuStatus
{
  return self->_gpuStatus;
}

- (void)setGpuStatus:(unint64_t)a3
{
  self->_unint64_t gpuStatus = a3;
}

- (unint64_t)gpuError
{
  return self->_gpuError;
}

- (void)setGpuError:(unint64_t)a3
{
  self->_gpuError = a3;
}

- (FigMetalExecutionStatus)metalExecutionStatus
{
  return self->_metalExecutionStatus;
}

- (__CVBuffer)lscPixelBuffer
{
  return self->_lscPixelBuffer;
}

- (__CVBuffer)flashLSCPixelBuffer
{
  return self->_flashLSCPixelBuffer;
}

- (NSDictionary)lscParameters
{
  return self->_lscParameters;
}

- (void)setLscParameters:(id)a3
{
}

- (uint64_t)outputBufferRectWithinSensorCropRect
{
  if (result) {
    return *(void *)(result + 168);
  }
  return result;
}

- (uint64_t)outputDownscaleFactor
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

- (NSMutableDictionary)auxiliaryPixelBuffers
{
  return self->_auxiliaryPixelBuffers;
}

- (void)setAuxiliaryPixelBuffers:(id)a3
{
}

- (NSArray)textures
{
  return self->_textures;
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
}

- (int)numberOfCompletionHandlers
{
  return self->_numberOfCompletionHandlers;
}

- (int)numberOfCalledCompletionHandlers
{
  return self->_numberOfCalledCompletionHandlers;
}

- (BOOL)allCommandBuffersEnqueued
{
  return self->_allCommandBuffersEnqueued;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_auxiliaryPixelBuffers, 0);
  objc_storeStrong((id *)&self->_lscParameters, 0);
  objc_storeStrong((id *)&self->_metalExecutionStatus, 0);
  objc_storeStrong((id *)&self->_processingOptions, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parentProcessor, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

@end