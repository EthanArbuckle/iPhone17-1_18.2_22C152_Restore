@interface RegWarpStage
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (RegWarpStage)initWithMetalContext:(id)a3 staticParameters:(id)a4;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6;
- (int)allocateResources:(id)a3;
- (int)runWithArgs:(id)a3;
- (int)setReferenceFrameByUniqueID:(unint64_t)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
- (void)dealloc;
- (void)downscaleRoi:(CGRect *)a3;
@end

@implementation RegWarpStage

- (RegWarpStage)initWithMetalContext:(id)a3 staticParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RegWarpStage;
  v9 = [(RegWarpStage *)&v23 init];
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_metal, a3), !v10->_metal)
    || !v8
    || (objc_storeStrong((id *)&v10->_staticParameters, a4),
        v11 = [[RegWarpShaders alloc] initWithMetalContext:v10->_metal], shaders = v10->_shaders, v10->_shaders = v11, shaders, !v10->_shaders))
  {
    FigDebugAssert3();
LABEL_12:
    v21 = 0;
    goto LABEL_9;
  }
  v10->_referenceFrameProcessed = 0;
  v10->_referenceFrameUniqueID = -1;
  [MEMORY[0x263F2EE70] getDefaults:&v10->_regWarpPPConfig];
  v10->_regWarpPPConfig.skipInitialDownsample = 1;
  uint64_t v13 = [objc_alloc(MEMORY[0x263F2EE70]) initWithConfig:&v10->_regWarpPPConfig];
  regWarpPP = v10->_regWarpPP;
  v10->_regWarpPP = (RegWarpPP *)v13;

  v15 = v10->_regWarpPP;
  if (!v15) {
    goto LABEL_11;
  }
  v10->_gdcMode = 1;
  [(RegWarpPP *)v15 setApplyGDC:1];
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    id v16 = objc_alloc(MEMORY[0x263F2EE00]);
    v17 = [(FigMetalContext *)v10->_metal commandQueue];
    v18 = [(FigMetalContext *)v10->_metal allocator];
    uint64_t v19 = [v16 initWithOptionalCommandQueue:v17 allocator:v18];
    warpStage = v10->_warpStage;
    v10->_warpStage = (CMIWarpStage *)v19;

    if (!v10->_warpStage)
    {
LABEL_11:
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_12;
    }
  }
  v10->_outputDownscaleFactor = 1;
  v21 = v10;
LABEL_9:

  return v21;
}

- (void)dealloc
{
  regWarpInput = self->_regWarpInput;
  if (regWarpInput)
  {
    CFRelease(regWarpInput);
    self->_regWarpInput = 0;
  }
  [(RegWarpPP *)self->_regWarpPP releaseResources];
  v4.receiver = self;
  v4.super_class = (Class)RegWarpStage;
  [(RegWarpStage *)&v4 dealloc];
}

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  return 0;
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  return 0;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  id v5 = a3;
  if ([(RegWarpStage *)self allocateResources:v5])
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v6 = 0;
  }
  else
  {
    v6 = [[RegWarpConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v5];
  }

  return v6;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  return ($F61E096109CF133FD2477F48C7D0CEE7)0;
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  return 0;
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (-[SoftISPInputFrame uniqueID]((uint64_t)v6) == self->_referenceFrameUniqueID)
    {
      int v9 = 0;
    }
    else if (self->_referenceFrameProcessed)
    {
      int v9 = 0;
    }
    else
    {
      int v9 = -73675;
    }
  }
  else
  {
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[RegWarpStageArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  id v4 = a3;
  id v68 = 0;
  long long v66 = 0u;
  memset(v67, 0, 112);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v16 = FigSignalErrorAt();
    v18 = 0;
    id v9 = 0;
    id v5 = 0;
LABEL_32:
    id v8 = 0;
    goto LABEL_40;
  }
  id v5 = v4;
  id v6 = [v5 config];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v16 = FigSignalErrorAt();
    v18 = 0;
    id v9 = 0;
    goto LABEL_32;
  }
  id v8 = [v5 config];
  id v9 = [v5 inputTex];

  if (!v9) {
    goto LABEL_37;
  }
  if (!self->_referenceFrameProcessed)
  {
    id v10 = [v5 inputFrame];
    uint64_t v11 = -[SoftISPInputFrame uniqueID]((uint64_t)v10);
    unint64_t referenceFrameUniqueID = self->_referenceFrameUniqueID;

    if (v11 != referenceFrameUniqueID) {
      goto LABEL_18;
    }
  }
  uint64_t v13 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:self->_regWarpInput pixelFormat:10 usage:7 plane:0];
  id v68 = v13;
  if (!v13)
  {
    FigDebugAssert3();
LABEL_18:
    int v16 = FigSignalErrorAt();
LABEL_19:
    v18 = 0;
    id v9 = 0;
    goto LABEL_40;
  }
  v14 = v13;
  v15 = [v5 inputFrame];
  int v16 = [v8 getDemosaicConfigForInputFrame:v15 demosaicConfig:v67];

  if (v16)
  {
    FigDebugAssert3();
    goto LABEL_19;
  }
  v17 = [(FigMetalContext *)self->_metal commandBuffer];
  id v9 = v17;
  if (!v17)
  {
    FigDebugAssert3();
LABEL_37:
    int v16 = FigSignalErrorAt();
LABEL_29:
    v18 = 0;
    goto LABEL_40;
  }
  v18 = [v17 computeCommandEncoder];
  if (!v18)
  {
    int v16 = FigSignalErrorAt();
    goto LABEL_40;
  }
  uint64_t v19 = [(RegWarpShaders *)self->_shaders demosaicQuarterLuma];
  [v18 setComputePipelineState:v19];

  v20 = [v5 inputTex];
  uint64_t v21 = [v20 pixelFormat];

  int v16 = -73640;
  if (v21 <= 53)
  {
    if (v21 == 23)
    {
      v52 = v8;
      id v53 = v4;
      v22 = [v5 inputTex];
      objc_super v23 = v18;
      v24 = v22;
      uint64_t v25 = 1;
      goto LABEL_21;
    }
    if (v21 != 25) {
      goto LABEL_40;
    }
    goto LABEL_17;
  }
  if (v21 == 55)
  {
LABEL_17:
    v52 = v8;
    id v53 = v4;
    v22 = [v5 inputTex];
    objc_super v23 = v18;
    v24 = v22;
    uint64_t v25 = 2;
    goto LABEL_21;
  }
  if (v21 == 54)
  {
    v52 = v8;
    id v53 = v4;
    v22 = [v5 inputTex];
    objc_super v23 = v18;
    v24 = v22;
    uint64_t v25 = 0;
LABEL_21:
    [v23 setTexture:v24 atIndex:v25];

    [v18 setTexture:v14 atIndex:3];
    [v18 setBytes:v67 length:112 atIndex:0];
    v26 = [(RegWarpShaders *)self->_shaders demosaicQuarterLuma];
    unint64_t v27 = [v26 threadExecutionWidth];

    v28 = [(RegWarpShaders *)self->_shaders demosaicQuarterLuma];
    unint64_t v29 = [v28 maxTotalThreadsPerThreadgroup] / v27;

    v59[0] = [v14 width];
    v59[1] = [v14 height];
    v59[2] = 1;
    v58[0] = v27;
    v58[1] = v29;
    v58[2] = 1;
    [v18 dispatchThreads:v59 threadsPerThreadgroup:v58];
    [v18 endEncoding];

    [v5 setInputTex:0];
    v30 = [v5 outputFrame];
    [v30 addCompletionHandlerToCommandBuffer:v9];

    [(FigMetalContext *)self->_metal commit];
    [(FigMetalContext *)self->_metal waitForIdle];
    v31 = (void *)MEMORY[0x263F2ED78];
    v32 = -[RawNightModeInputFrame sampleBuffer]((uint64_t)self->_staticParameters);
    v33 = [v5 inputFrame];
    v34 = -[SoftISPInputFrame portType](v33);
    v35 = [v32 objectForKeyedSubscript:v34];
    v36 = [v5 inputFrame];
    v37 = -[SoftISPInputFrame metadata]((uint64_t)v36);
    int v16 = [v31 getGDCParams:&v60 cameraInfo:v35 metadata:v37];

    if (v16)
    {
      FigDebugAssert3();
      v18 = 0;
      id v8 = v52;
      id v4 = v53;
      goto LABEL_40;
    }
    int v57 = 0;
    memset(v56, 0, sizeof(v56));
    v38 = [v5 inputFrame];
    uint64_t v39 = -[SoftISPInputFrame uniqueID]((uint64_t)v38);
    unint64_t v40 = self->_referenceFrameUniqueID;

    if (v39 == v40)
    {
      long long v41 = v62;
      *(_OWORD *)&self->_anon_68[48] = v63;
      long long v42 = v65;
      *(_OWORD *)&self->_anon_68[64] = v64;
      *(_OWORD *)&self->_anon_68[80] = v42;
      *(_OWORD *)&self->_anon_68[96] = v66;
      long long v43 = v61;
      *(_OWORD *)self->_anon_68 = v60;
      *(_OWORD *)&self->_anon_68[16] = v43;
      *(_OWORD *)&self->_anon_68[32] = v41;
      memset(v55, 0, sizeof(v55));
      v44 = [v5 inputFrame];
      int v16 = objc_msgSend(v52, "getValidBufferRect:forInputFrame:withWidth:andHeight:", v55, v44, objc_msgSend(v52, "maximumOutputDimensions"), (unint64_t)objc_msgSend(v52, "maximumOutputDimensions") >> 32);

      id v4 = v53;
      if (v16)
      {
        FigDebugAssert3();
        v18 = 0;
        id v8 = v52;
        goto LABEL_40;
      }
      [(RegWarpStage *)self downscaleRoi:v55];
      int v54 = 0;
      if ([(RegWarpPP *)self->_regWarpPP processReference:self->_regWarpInput gdcParams:self->_anon_68 regionOfInterest:v55 numKeypoints:&v54])
      {
        FigDebugAssert3();
        int v16 = FigSignalErrorAt();
      }
      else
      {
        self->_referenceFrameProcessed = 1;
        v45 = [v5 outputFrame];
        [v45 setHasValidRegistration:1];

        int v16 = 0;
      }
      id v8 = v52;
    }
    else
    {
      int v16 = [(RegWarpPP *)self->_regWarpPP processNonReference:self->_regWarpInput gdcParams:&v60 outputTransform:v56];
      id v8 = v52;
      id v4 = v53;
      if (!v16)
      {
        double v51 = *((double *)&v56[1] + 1);
        double v50 = *(double *)((char *)v56 + 12);
        double v49 = *(double *)v56;
        v46 = [v5 outputFrame];
        objc_msgSend(v46, "setRegHomography:", v49, v50, v51);

        v47 = [v5 outputFrame];
        [v47 setHasValidRegistration:1];
      }
    }
    goto LABEL_29;
  }
LABEL_40:
  FigMetalDecRef();
  [v18 endEncoding];

  return v16;
}

- (int)setReferenceFrameByUniqueID:(unint64_t)a3
{
  self->_unint64_t referenceFrameUniqueID = a3;
  return 0;
}

- (int)allocateResources:(id)a3
{
  id v4 = a3;
  [v4 maximumWidth];
  [v4 maximumHeight];
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_regWarpInput = PixelBuffer;
  if (!PixelBuffer
    || (v6 = -[RegWarpPP allocateResources:imageHeight:imageFormat:externalMemory:externalMemorySize:](self->_regWarpPP, "allocateResources:imageHeight:imageFormat:externalMemory:externalMemorySize:", [v4 maximumWidth], objc_msgSend(v4, "maximumHeight"), 1278226488, 0, 0), int v7 = 0, v6))
  {
    FigDebugAssert3();
    int v7 = FigSignalErrorAt();
  }

  return v7;
}

- (void)downscaleRoi:(CGRect *)a3
{
  __asm { FMOV            V0.2D, #0.5 }
  CGPoint v8 = (CGPoint)vmulq_f64((float64x2_t)a3->origin, _Q0);
  CGSize v9 = (CGSize)vmulq_f64((float64x2_t)a3->size, _Q0);
  a3->origin = v8;
  a3->size = v9;
}

- (id)createMetalTexture:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  uint64_t v13 = [v11 desc];
  [v13 setWidth:a4];

  v14 = [v11 desc];
  [v14 setHeight:a5];

  v15 = [v11 desc];
  [v15 setUsage:7];

  int v16 = [v11 desc];
  [v16 setPixelFormat:a6];

  [v11 setLabel:0];
  v17 = [(FigMetalContext *)self->_metal allocator];
  v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_regWarpPP, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end