@interface MotionDetection
+ (int)fillMotionDetectionParameters:(id *)a3 withNRFPlist:(id)a4;
+ (int)prewarmShaders:(id)a3;
+ (unint64_t)scratchBufferBytesRequiredForWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5;
- (MotionDetection)initWithMetalContext:(id)a3;
- (float)getMotionDetectionResultSync;
- (float)getRatioOfTilesExceedingMotionThreshold;
- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 scratchBuffer:(id)a5;
- (int)runMotionDetection:(float *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 nrfPlist:(id)a8;
- (int)startMotionDetection:(id)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7;
- (int)startMotionDetectionWithParams:(id *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 evmHomography:(id *)a8 ev0Homography:(id *)a9 useFullImage:(BOOL)a10;
- (int)startMotionDetectionWithParams:(id *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 useFullImage:(BOOL)a8;
- (void)dealloc;
@end

@implementation MotionDetection

- (MotionDetection)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MotionDetection;
  v6 = [(MotionDetection *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[MotionDetectionShared sharedInstance];
    uint64_t v9 = [v8 getShaders:v7->_metal];
    shaders = v7->_shaders;
    v7->_shaders = (MotionDetectionShaders *)v9;

    if (!v7->_shaders) {
      goto LABEL_8;
    }
    v11 = [(FigMetalContext *)v7->_metal device];
    uint64_t v12 = [v11 newBufferWithLength:4 options:0];
    motionDetectScore = v7->_motionDetectScore;
    v7->_motionDetectScore = (MTLBuffer *)v12;

    if (!v7->_motionDetectScore) {
      goto LABEL_8;
    }
    v14 = [(FigMetalContext *)v7->_metal device];
    uint64_t v15 = [v14 newBufferWithLength:4 options:0];
    numTilesOverThreshold = v7->_numTilesOverThreshold;
    v7->_numTilesOverThreshold = (MTLBuffer *)v15;

    if (v7->_numTilesOverThreshold)
    {
      v7->_numberOfTiles = 1.0;
    }
    else
    {
LABEL_8:
      FigDebugAssert3();
      int v20 = FigSignalErrorAt();
      v17 = 0;
      if (v20) {
        goto LABEL_7;
      }
    }
  }
  v17 = v7;
LABEL_7:
  v18 = v17;

  return v18;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[MotionDetectionShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (void)dealloc
{
  [(MotionDetection *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)MotionDetection;
  [(MotionDetection *)&v3 dealloc];
}

+ (unint64_t)scratchBufferBytesRequiredForWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5
{
  return 0;
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 scratchBuffer:(id)a5
{
  return 0;
}

- (int)runMotionDetection:(float *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 nrfPlist:(id)a8
{
  int v10 = [(MotionDetection *)self startMotionDetection:a8 evm:a4 ev0:a5 evmProperties:a6 ev0Properties:a7];
  if (v10)
  {
    FigDebugAssert3();
  }
  else
  {
    [(MotionDetection *)self getMotionDetectionResultSync];
    *(_DWORD *)a3 = v11;
  }
  return v10;
}

- (int)startMotionDetection:(id)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19[0] = 0;
  v19[1] = 0;
  int v20 = 0;
  int v16 = +[MotionDetection fillMotionDetectionParameters:v19 withNRFPlist:a3];
  if (v16)
  {
    int v17 = v16;
    FigDebugAssert3();
  }
  else
  {
    int v17 = [(MotionDetection *)self startMotionDetectionWithParams:v19 evm:v12 ev0:v13 evmProperties:v14 ev0Properties:v15 useFullImage:0];
  }

  return v17;
}

+ (int)fillMotionDetectionParameters:(id *)a3 withNRFPlist:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 && v5 && (uint64_t v7 = *((void *)v5 + 4)) != 0)
  {
    int v8 = 0;
    a3->var0 = *(float *)(v7 + 48);
    a3->var1 = *(float *)(*((void *)v5 + 4) + 52);
    a3->var2 = *(float *)(*((void *)v5 + 4) + 64);
    a3->var3 = *(float *)(*((void *)v5 + 4) + 68);
  }
  else
  {
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

- (int)startMotionDetectionWithParams:(id *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 useFullImage:(BOOL)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  LOBYTE(v20) = a8;
  int v18 = -[MotionDetection startMotionDetectionWithParams:evm:ev0:evmProperties:ev0Properties:evmHomography:ev0Homography:useFullImage:](self, "startMotionDetectionWithParams:evm:ev0:evmProperties:ev0Properties:evmHomography:ev0Homography:useFullImage:", a3, v17, v16, v15, v14, [v15 regHomography], objc_msgSend(v14, "regHomography"), v20);

  return v18;
}

- (int)startMotionDetectionWithParams:(id *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(id)a6 ev0Properties:(id)a7 evmHomography:(id *)a8 ev0Homography:(id *)a9 useFullImage:(BOOL)a10
{
  id v15 = a4;
  id v96 = a5;
  id v16 = a6;
  id v17 = a7;
  id v118 = 0;
  id v119 = 0;
  id v116 = 0;
  id v117 = 0;
  id v114 = 0;
  id v115 = 0;
  id v112 = 0;
  id v113 = 0;
  int v18 = [(FigMetalContext *)self->_metal allocator];
  v19 = (void *)[v18 newTextureDescriptor];

  if (!v19) {
    goto LABEL_39;
  }
  uint64_t v20 = [v19 desc];
  [v20 setUsage:7];

  objc_super v21 = [(FigMetalContext *)self->_metal allocator];
  v22 = (void *)[v21 newTextureDescriptor];

  if (!v22)
  {
LABEL_39:
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();
LABEL_42:
    v34 = 0;
    goto LABEL_38;
  }
  v23 = [v22 desc];
  [v23 setUsage:7];

  v24 = [v22 desc];
  [v24 setCompressionMode:2];

  v25 = [v22 desc];
  [v25 setCompressionFootprint:0];

  if (self->_pendingResultCommandBuffer)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_42;
  }
  v97 = v22;
  uint64_t v26 = [v15 width];
  v27 = [v19 desc];
  [v27 setWidth:v26];

  uint64_t v28 = [v15 height];
  v29 = [v19 desc];
  [v29 setHeight:v28];

  v30 = [v19 desc];
  [v30 setPixelFormat:10];

  [v19 setLabel:0];
  v31 = [(FigMetalContext *)self->_metal allocator];
  v32 = (void *)[v31 newTextureWithDescriptor:v19];
  id v112 = v32;

  if (!v32)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_42;
  }
  v33 = [(FigMetalContext *)self->_metal commandQueue];
  v34 = [v33 commandBuffer];

  if (!v34 || ([v34 computeCommandEncoder], (v35 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_38;
  }
  v36 = v35;
  [v35 setComputePipelineState:self->_shaders->_motionDetectWarp];
  id v95 = v15;
  [v36 setTexture:v15 atIndex:0];
  [v36 setTexture:v32 atIndex:1];
  [v36 setBytes:a8 length:48 atIndex:0];
  v111[0] = [v32 width];
  v111[1] = [v32 height];
  v111[2] = 1;
  int64x2_t v109 = vdupq_n_s64(8uLL);
  uint64_t v110 = 1;
  [v36 dispatchThreads:v111 threadsPerThreadgroup:&v109];
  [v36 endEncoding];
  v98 = v34;
  [v34 commit];
  long long v107 = 0u;
  long long v108 = 0u;
  float var1 = a3->var1;
  v106[0] = 1.0 - (float)(a3->var0 / 255.0);
  v106[1] = var1 / 255.0;
  v106[2] = a3->var2;
  v38 = [v16 meta];
  uint64_t v39 = [v38 exposureParams];
  [v17 meta];
  v41 = v40 = v16;
  v92 = v40;
  v106[3] = getRelativeBrightnessForProperties(v39, [v41 exposureParams], v40);

  *(float *)&long long v107 = a3->var3;
  BOOL v91 = [v17 inputColorSpace] == 2
     && *(unsigned char *)([v17 colorSpaceConversionParameters] + 196) != 0;
  v42 = [v19 desc];
  objc_msgSend(v42, "setWidth:", (unint64_t)objc_msgSend(v42, "width") >> 2);

  v43 = [v19 desc];
  objc_msgSend(v43, "setHeight:", (unint64_t)objc_msgSend(v43, "height") >> 2);

  v44 = [v97 desc];
  [v44 setPixelFormat:13];

  v45 = [v19 desc];
  uint64_t v46 = [v45 width];
  v47 = [v97 desc];
  [v47 setWidth:v46];

  v48 = [v19 desc];
  uint64_t v49 = [v48 height];
  v50 = [v97 desc];
  [v50 setHeight:v49];

  [v97 setLabel:0];
  v51 = [(FigMetalContext *)self->_metal allocator];
  v52 = (void *)[v51 newTextureWithDescriptor:v97];
  id v119 = v52;

  if (!v52)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

LABEL_59:
    id v16 = v92;
    goto LABEL_60;
  }
  id v93 = v17;
  v53 = [v19 desc];
  [v53 setPixelFormat:10];

  [v19 setLabel:0];
  v54 = [(FigMetalContext *)self->_metal allocator];
  v55 = (void *)[v54 newTextureWithDescriptor:v19];
  id v117 = v55;

  v34 = v98;
  if (!v55
    || ([v19 setLabel:0],
        [(FigMetalContext *)self->_metal allocator],
        v56 = objc_claimAutoreleasedReturnValue(),
        v57 = (void *)[v56 newTextureWithDescriptor:v19],
        id v116 = v57,
        v56,
        !v57))
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

LABEL_57:
    id v16 = v92;
    id v17 = v93;
    goto LABEL_38;
  }
  v58 = [(FigMetalContext *)self->_metal commandQueue];
  v59 = [v58 commandBuffer];

  if (!v59)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    v34 = 0;
LABEL_56:
    id v15 = v95;
    goto LABEL_57;
  }
  v60 = [v59 computeCommandEncoder];

  if (!v60) {
    goto LABEL_49;
  }
  uint64_t v61 = 16;
  if (!v91) {
    uint64_t v61 = 8;
  }
  [v60 setComputePipelineState:*(Class *)((char *)&self->_shaders->super.isa + v61)];
  [v60 setTexture:v96 atIndex:0];
  [v60 setTexture:v32 atIndex:1];
  [v60 setTexture:v55 atIndex:2];
  [v60 setTexture:v57 atIndex:3];
  [v60 setTexture:v52 atIndex:4];
  [v60 setBytes:v106 length:48 atIndex:0];
  v105[0] = [v55 width];
  v105[1] = [v55 height];
  v105[2] = 1;
  int64x2_t v109 = vdupq_n_s64(8uLL);
  uint64_t v110 = 1;
  [v60 dispatchThreads:v105 threadsPerThreadgroup:&v109];
  [v60 endEncoding];
  FigMetalDecRef();
  [v97 setLabel:0];
  v62 = [(FigMetalContext *)self->_metal allocator];
  v63 = (void *)[v62 newTextureWithDescriptor:v97];
  id v118 = v63;

  if (!v63)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

LABEL_51:
    v34 = v59;
    goto LABEL_56;
  }
  v64 = [v59 computeCommandEncoder];

  if (!v64)
  {
LABEL_49:
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_51;
  }
  [v64 setComputePipelineState:self->_shaders->_motionDetectDilate];
  [v64 setTexture:v52 atIndex:0];
  [v64 setTexture:v63 atIndex:1];
  [v64 setBytes:v106 length:48 atIndex:0];
  v104[0] = (unint64_t)[v52 width] >> 1;
  v104[1] = (unint64_t)[v52 height] >> 1;
  v104[2] = 1;
  int64x2_t v109 = vdupq_n_s64(8uLL);
  uint64_t v110 = 1;
  [v64 dispatchThreads:v104 threadsPerThreadgroup:&v109];
  [v64 endEncoding];
  [v59 commit];
  FigMetalDecRef();
  v65 = [v19 desc];
  [v65 setPixelFormat:25];

  [v19 setLabel:0];
  v66 = [(FigMetalContext *)self->_metal allocator];
  v67 = (void *)[v66 newTextureWithDescriptor:v19];
  id v115 = v67;

  if (!v67)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_51;
  }
  v68 = [(FigMetalContext *)self->_metal commandQueue];
  v34 = [v68 commandBuffer];

  if (!v34)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_56;
  }
  v69 = [v34 computeCommandEncoder];

  if (!v69) {
    goto LABEL_55;
  }
  v98 = v34;
  [v69 setComputePipelineState:self->_shaders->_motionDetectGradient];
  [v69 setTexture:v55 atIndex:0];
  [v69 setTexture:v67 atIndex:1];
  v103[0] = (unint64_t)[v55 width] >> 1;
  v103[1] = [v55 height];
  v103[2] = 1;
  int64x2_t v109 = vdupq_n_s64(8uLL);
  uint64_t v110 = 1;
  [v69 dispatchThreads:v103 threadsPerThreadgroup:&v109];
  [v69 endEncoding];
  FigMetalDecRef();
  v70 = [v19 desc];
  [v70 setPixelFormat:25];

  [v19 setLabel:0];
  v71 = [(FigMetalContext *)self->_metal allocator];
  v72 = (void *)[v71 newTextureWithDescriptor:v19];
  id v114 = v72;

  if (!v72)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    id v15 = v95;
    id v16 = v92;
    id v17 = v93;
LABEL_60:
    v34 = v98;
    goto LABEL_38;
  }
  v73 = [v34 computeCommandEncoder];

  if (!v73)
  {
LABEL_55:
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    goto LABEL_56;
  }
  v74 = [(FigMetalContext *)self->_metal allocator];
  int v75 = [v74 allocatorType];

  if (v75 == 2) {
    [v73 insertCompressedTextureReinterpretationFlush];
  }
  [v73 setComputePipelineState:self->_shaders->_motionDetectGradient];
  [v73 setTexture:v57 atIndex:0];
  [v73 setTexture:v72 atIndex:1];
  v102[0] = (unint64_t)[v57 width] >> 1;
  v102[1] = [v57 height];
  v102[2] = 1;
  int64x2_t v109 = vdupq_n_s64(8uLL);
  uint64_t v110 = 1;
  [v73 dispatchThreads:v102 threadsPerThreadgroup:&v109];
  [v73 endEncoding];
  FigMetalDecRef();
  v76 = [v19 desc];
  [v76 setPixelFormat:25];

  [v19 setLabel:0];
  v77 = [(FigMetalContext *)self->_metal allocator];
  v78 = (void *)[v77 newTextureWithDescriptor:v19];
  id v113 = v78;

  id v17 = v93;
  if (!v78)
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();

    id v15 = v95;
    goto LABEL_59;
  }
  v79 = [v34 computeCommandEncoder];

  if (v79)
  {
    [v79 setComputePipelineState:self->_shaders->_motionDetectDiffGradient];
    [v79 setTexture:v67 atIndex:0];
    [v79 setTexture:v72 atIndex:1];
    [v79 setTexture:v63 atIndex:2];
    [v79 setTexture:v78 atIndex:3];
    [v79 setBytes:v106 length:48 atIndex:0];
    [v79 setBytes:a9 length:48 atIndex:1];
    [v79 setBytes:a9 length:48 atIndex:2];
    v101[0] = [v67 width];
    v101[1] = [v67 height];
    v101[2] = 1;
    int64x2_t v109 = vdupq_n_s64(8uLL);
    uint64_t v110 = 1;
    [v79 dispatchThreads:v101 threadsPerThreadgroup:&v109];
    [v79 endEncoding];
    [v34 commit];
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();
    *(_DWORD *)[(MTLBuffer *)self->_motionDetectScore contents] = 0;
    if (a10)
    {
      *(void *)&long long v108 = 0;
      DWORD2(v108) = [v78 width] / 6;
      LODWORD(v80) = [v78 height] >> 2;
      float v81 = 24.0;
      uint64_t v82 = 8;
      uint64_t v83 = 12;
    }
    else
    {
      LODWORD(v108) = [v78 width] >> 2;
      DWORD1(v108) = [v78 height] >> 2;
      DWORD2(v108) = ((unint64_t)[v78 width] >> 1) / 3;
      unint64_t v80 = ((unint64_t)[v78 height] >> 2) & 0x7FFFFFFF;
      float v81 = 6.0;
      uint64_t v82 = 4;
      uint64_t v83 = 6;
    }
    HIDWORD(v108) = v80;
    self->_numberOfTiles = v81;
    WORD4(v107) = 1000;
    DWORD1(v107) = 0;
    id v17 = v93;
    float var4 = a3->var4;
    if (var4 > 0.0)
    {
      DWORD1(v107) = vcvtps_u32_f32(powf(var4, *(float *)&v107) * (float)(1000
                                                                                      * DWORD2(v108)
                                                                                      * HIDWORD(v108)));
      *(_DWORD *)[(MTLBuffer *)self->_numTilesOverThreshold contents] = 0;
    }
    v85 = [(FigMetalContext *)self->_metal commandQueue];
    v86 = [v85 commandBuffer];

    if (v86)
    {
      v87 = [v86 computeCommandEncoder];

      if (v87)
      {
        [v87 setComputePipelineState:self->_shaders->_motionDetectMaxTileAvg];
        [v87 setTexture:v78 atIndex:0];
        [v87 setBytes:v106 length:48 atIndex:0];
        [v87 setBuffer:self->_motionDetectScore offset:0 atIndex:1];
        [v87 setBuffer:self->_numTilesOverThreshold offset:0 atIndex:2];
        int64x2_t v99 = vdupq_n_s64(2uLL);
        uint64_t v100 = 1;
        v109.i64[0] = v83;
        v109.i64[1] = v82;
        uint64_t v110 = 1;
        [v87 dispatchThreads:&v109 threadsPerThreadgroup:&v99];
        [v87 endEncoding];
        [v86 commit];
        FigMetalDecRef();
        objc_storeStrong((id *)&self->_pendingResultCommandBuffer, v86);
        float v88 = 1.0 / *(float *)&v107;
        self->_tileScoreScale = 1.0 / (float)(DWORD2(v108) * WORD4(v107) * HIDWORD(v108));
        self->_scorePower = v88;

        int v89 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v89 = FigSignalErrorAt();
      }
      v34 = v86;
    }
    else
    {
      FigDebugAssert3();
      int v89 = FigSignalErrorAt();

      v34 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v89 = FigSignalErrorAt();
  }
  id v15 = v95;
  id v16 = v92;
LABEL_38:

  return v89;
}

- (float)getMotionDetectionResultSync
{
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  if (pendingResultCommandBuffer)
  {
    [(MTLCommandBuffer *)pendingResultCommandBuffer waitUntilCompleted];
    v4 = self->_pendingResultCommandBuffer;
    self->_pendingResultCommandBuffer = 0;
  }
  id v5 = (unsigned int *)[(MTLBuffer *)self->_motionDetectScore contents];
  float scorePower = self->_scorePower;
  float v7 = self->_tileScoreScale * (float)*v5;

  return powf(v7, scorePower);
}

- (float)getRatioOfTilesExceedingMotionThreshold
{
  return (float)*(unsigned int *)[(MTLBuffer *)self->_numTilesOverThreshold contents] / self->_numberOfTiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingResultCommandBuffer, 0);
  objc_storeStrong((id *)&self->_numTilesOverThreshold, 0);
  objc_storeStrong((id *)&self->_motionDetectScore, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end