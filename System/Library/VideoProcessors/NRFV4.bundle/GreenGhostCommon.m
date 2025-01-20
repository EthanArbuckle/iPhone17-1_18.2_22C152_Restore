@interface GreenGhostCommon
- (GreenGhostCommon)initWithMetalContext:(id)a3;
- (SidecarWriter)sidecarWriter;
- (id)functionNameForProgram:(int)a3;
- (int)blobDetection:(id)a3 output:(id)a4 params:(BlobTuning)a5;
- (int)boxFilter:(id)a3 withRadius:(unsigned int)a4 output:(id)a5;
- (int)brightnessDetectionInput:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6;
- (int)combineBrightnessMask:(id)a3 blobMask:(id)a4 greenMask:(id)a5 output:(id)a6;
- (int)compileDilateVerticalShaders;
- (int)compileShaders;
- (int)detectionWithLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7;
- (int)downscaleInput:(id)a3 output:(id)a4;
- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)extractFaceBodyBoundariesFromFaceLandMarks:(GreenGhostCommon *)self ev0FrameMetadata:(SEL)a2 imgSize:(id)a3 faceBoundaryPaddingRatio:(id)a4 bodyBoundaryPaddingRatio:(CGSize)a5 output:(FaceBodyBoundaries *)a6;
- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7;
- (void)setSidecarWriter:(id)a3;
@end

@implementation GreenGhostCommon

- (GreenGhostCommon)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GreenGhostCommon;
  v6 = [(GreenGhostCommon *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    if ([(GreenGhostCommon *)v7 compileShaders])
    {
      FigDebugAssert3();
      v8 = 0;
      goto LABEL_4;
    }
  }
  else
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    v8 = 0;
    if (v11) {
      goto LABEL_4;
    }
  }
  v8 = v7;
LABEL_4:
  v9 = v8;

  return v9;
}

- (int)compileDilateVerticalShaders
{
  v3 = objc_opt_new();
  if (v3)
  {
    pipelineStates = self->_pipelineStates;
    int v16 = 0;
    do
    {
      int v5 = 0;
      int v15 = 0;
      do
      {
        if (!v5 || !v16)
        {
          [v3 setConstantValue:&v15 type:53 atIndex:1];
          [v3 setConstantValue:&v16 type:53 atIndex:2];
          int v6 = v15 + 2 * v16 + 2;
          metal = self->_metal;
          v8 = [(GreenGhostCommon *)self functionNameForProgram:v6];
          uint64_t v9 = [(FigMetalContext *)metal computePipelineStateFor:v8 constants:v3];
          v10 = pipelineStates[v6];
          pipelineStates[v6] = (MTLComputePipelineState *)v9;

          if (!pipelineStates[v6]) {
            goto LABEL_11;
          }
          int v5 = v15;
        }
        int v15 = v5 + 1;
      }
      while (v5++ < 1);
      int v12 = v16++;
    }
    while (v12 < 1);
    int v13 = 0;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)compileShaders
{
  metal = self->_metal;
  v4 = [(GreenGhostCommon *)self functionNameForProgram:0];
  int v5 = [(FigMetalContext *)metal computePipelineStateFor:v4 constants:0];
  int v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (self->_pipelineStates[0])
  {
    v7 = self->_metal;
    v8 = [(GreenGhostCommon *)self functionNameForProgram:1];
    uint64_t v9 = [(FigMetalContext *)v7 computePipelineStateFor:v8 constants:0];
    v10 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v9;

    if (self->_pipelineStates[1])
    {
      int v11 = [(GreenGhostCommon *)self compileDilateVerticalShaders];
      if (v11)
      {
        int v44 = v11;
        FigDebugAssert3();
        return v44;
      }
      int v12 = self->_metal;
      int v13 = [(GreenGhostCommon *)self functionNameForProgram:5];
      v14 = [(FigMetalContext *)v12 computePipelineStateFor:v13 constants:0];
      int v15 = self->_pipelineStates[5];
      self->_pipelineStates[5] = v14;

      if (self->_pipelineStates[5])
      {
        int v16 = self->_metal;
        v17 = [(GreenGhostCommon *)self functionNameForProgram:6];
        v18 = [(FigMetalContext *)v16 computePipelineStateFor:v17 constants:0];
        v19 = self->_pipelineStates[6];
        self->_pipelineStates[6] = v18;

        if (self->_pipelineStates[6])
        {
          v20 = self->_metal;
          v21 = [(GreenGhostCommon *)self functionNameForProgram:7];
          v22 = [(FigMetalContext *)v20 computePipelineStateFor:v21 constants:0];
          v23 = self->_pipelineStates[7];
          self->_pipelineStates[7] = v22;

          if (self->_pipelineStates[7])
          {
            v24 = self->_metal;
            v25 = [(GreenGhostCommon *)self functionNameForProgram:8];
            v26 = [(FigMetalContext *)v24 computePipelineStateFor:v25 constants:0];
            v27 = self->_pipelineStates[8];
            self->_pipelineStates[8] = v26;

            if (self->_pipelineStates[8])
            {
              v28 = self->_metal;
              v29 = [(GreenGhostCommon *)self functionNameForProgram:9];
              v30 = [(FigMetalContext *)v28 computePipelineStateFor:v29 constants:0];
              v31 = self->_pipelineStates[9];
              self->_pipelineStates[9] = v30;

              if (self->_pipelineStates[9])
              {
                v32 = self->_metal;
                v33 = [(GreenGhostCommon *)self functionNameForProgram:10];
                v34 = [(FigMetalContext *)v32 computePipelineStateFor:v33 constants:0];
                v35 = self->_pipelineStates[10];
                self->_pipelineStates[10] = v34;

                if (self->_pipelineStates[10])
                {
                  v36 = self->_metal;
                  v37 = [(GreenGhostCommon *)self functionNameForProgram:11];
                  v38 = [(FigMetalContext *)v36 computePipelineStateFor:v37 constants:0];
                  v39 = self->_pipelineStates[11];
                  self->_pipelineStates[11] = v38;

                  if (self->_pipelineStates[11])
                  {
                    v40 = self->_metal;
                    v41 = [(GreenGhostCommon *)self functionNameForProgram:12];
                    v42 = [(FigMetalContext *)v40 computePipelineStateFor:v41 constants:0];
                    v43 = self->_pipelineStates[12];
                    self->_pipelineStates[12] = v42;

                    if (self->_pipelineStates[12]) {
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)functionNameForProgram:(int)a3
{
  if (a3 < 0xD) {
    return (id)*((void *)&off_2655C7CC8 + a3);
  }
  FigDebugAssert3();
  return 0;
}

- (void)setSidecarWriter:(id)a3
{
}

- (int)downscaleInput:(id)a3 output:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v9 = [v8 commandBuffer];

  if (v9 && ([v9 computeCommandEncoder], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v11 = v10;
    [v10 setComputePipelineState:self->_pipelineStates[0]];
    [v11 setImageblockWidth:32 height:32];
    [v11 setTexture:v6 atIndex:0];
    [v11 setTexture:v7 atIndex:1];
    v16[0] = [v7 width];
    v16[1] = [v7 height];
    v16[2] = 1;
    int64x2_t v14 = vdupq_n_s64(0x20uLL);
    uint64_t v15 = 1;
    [v11 dispatchThreads:v16 threadsPerThreadgroup:&v14];
    [v11 endEncoding];
    [v9 commit];

    int v12 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v48 = a7;
  unint64_t v15 = [v12 width];
  if (v15 <= [v12 height]) {
    unint64_t v16 = [v12 height];
  }
  else {
    unint64_t v16 = [v12 width];
  }
  v55[0] = (float)((float)v16 * a4);
  id v54 = 0;
  v17 = v48;
  if (([v48 width] & 1) != 0 || (objc_msgSend(v48, "height") & 1) != 0 || v13 && v14)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    id v40 = 0;
    v20 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  v18 = [(FigMetalContext *)self->_metal commandQueue];
  v19 = [v18 commandBuffer];

  if (!v19)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    id v40 = 0;
    v20 = 0;
    goto LABEL_19;
  }
  v20 = [v19 computeCommandEncoder];
  if (!v20)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    id v40 = 0;
    goto LABEL_19;
  }
  v21 = v13;
  v22 = [(FigMetalContext *)self->_metal allocator];
  v23 = (void *)[v22 newTextureDescriptor];

  if (!v23)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
LABEL_25:
    id v40 = 0;
    id v13 = v21;
    goto LABEL_19;
  }
  v24 = [v23 desc];
  [v24 setCompressionMode:2];

  v25 = [v23 desc];
  [v25 setCompressionFootprint:0];

  v26 = [v23 desc];
  [v26 setUsage:7];

  uint64_t v27 = [v12 pixelFormat];
  v28 = [v23 desc];
  [v28 setPixelFormat:v27];

  uint64_t v29 = [v12 width];
  v30 = [v23 desc];
  [v30 setWidth:v29];

  uint64_t v31 = [v12 height];
  v32 = [v23 desc];
  [v32 setHeight:v31];

  [v23 setLabel:0];
  v33 = [(FigMetalContext *)self->_metal allocator];
  v34 = (void *)[v33 newTextureWithDescriptor:v23];
  id v54 = v34;

  if (!v34)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();

    goto LABEL_25;
  }
  v47 = v19;
  id v35 = v14;
  uint64_t v36 = 2;
  if (v14) {
    uint64_t v36 = 4;
  }
  v37 = (id *)(&self->super.isa + (v36 | (v21 != 0)));
  [v20 setComputePipelineState:self->_pipelineStates[1]];
  [v20 setTexture:v12 atIndex:0];
  [v20 setTexture:v34 atIndex:1];
  [v20 setBytes:v55 length:4 atIndex:0];
  unint64_t v38 = [(MTLComputePipelineState *)self->_pipelineStates[1] threadExecutionWidth];
  unint64_t v39 = [(MTLComputePipelineState *)self->_pipelineStates[1] maxTotalThreadsPerThreadgroup]/ v38;
  v53[0] = (unint64_t)[v48 width] >> 1;
  v53[1] = (unint64_t)[v48 height] >> 1;
  v17 = v48;
  v53[2] = 1;
  v52[0] = v38;
  v52[1] = v39;
  v52[2] = 1;
  [v20 dispatchThreads:v53 threadsPerThreadgroup:v52];
  id v40 = v37[2];
  [v20 setComputePipelineState:v40];
  v41 = v34;
  id v13 = v21;
  [v20 setTexture:v41 atIndex:0];
  [v20 setTexture:v48 atIndex:2];
  [v20 setBytes:v55 length:4 atIndex:0];
  if (v21)
  {
    [v21 floatValue];
    int v51 = v42;
    [v20 setBytes:&v51 length:4 atIndex:1];
  }
  if (v35) {
    [v20 setTexture:v35 atIndex:1];
  }
  unint64_t v43 = [v40 threadExecutionWidth];
  unint64_t v44 = [v40 maxTotalThreadsPerThreadgroup] / v43;
  v50[0] = (unint64_t)[v48 width] >> 1;
  v50[1] = (unint64_t)[v48 height] >> 1;
  id v14 = v35;
  v50[2] = 1;
  v49[0] = v43;
  v49[1] = v44;
  v49[2] = 1;
  [v20 dispatchThreads:v50 threadsPerThreadgroup:v49];
  [v20 endEncoding];
  v19 = v47;
  [v47 commit];
  FigMetalDecRef();

  int v45 = 0;
LABEL_19:

  return v45;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  return -[GreenGhostCommon dilateTexture:withNormalizedRadius:withThreshold:subtractTexture:output:](self, "dilateTexture:withNormalizedRadius:withThreshold:subtractTexture:output:", a3, 0, 0, a5);
}

- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 width];
  if (v10 <= [v8 height]) {
    unint64_t v11 = [v8 height];
  }
  else {
    unint64_t v11 = [v8 width];
  }
  v42[0] = (float)((float)v11 * a4);
  id v41 = 0;
  if (([v9 width] & 1) != 0
    || ([v9 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandQueue],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 commandBuffer],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
    goto LABEL_11;
  }
  uint64_t v14 = [v13 computeCommandEncoder];
  if (!v14)
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
LABEL_17:

    goto LABEL_11;
  }
  unint64_t v15 = (void *)v14;
  unint64_t v16 = [(FigMetalContext *)self->_metal allocator];
  v17 = (void *)[v16 newTextureDescriptor];

  if (!v17)
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
LABEL_16:

    goto LABEL_17;
  }
  v18 = [v17 desc];
  [v18 setCompressionMode:2];

  v19 = [v17 desc];
  [v19 setCompressionFootprint:0];

  v20 = [v17 desc];
  [v20 setUsage:7];

  uint64_t v21 = [v8 pixelFormat];
  v22 = [v17 desc];
  [v22 setPixelFormat:v21];

  uint64_t v23 = [v8 width];
  v24 = [v17 desc];
  [v24 setWidth:v23];

  uint64_t v25 = [v8 height];
  v26 = [v17 desc];
  [v26 setHeight:v25];

  [v17 setLabel:0];
  uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureWithDescriptor:v17];
  id v41 = v28;

  if (!v28)
  {
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();

    goto LABEL_16;
  }
  [v15 setComputePipelineState:self->_pipelineStates[5]];
  [v15 setTexture:v8 atIndex:0];
  [v15 setTexture:v28 atIndex:1];
  [v15 setBytes:v42 length:4 atIndex:0];
  unint64_t v29 = [(MTLComputePipelineState *)self->_pipelineStates[5] threadExecutionWidth];
  unint64_t v30 = [(MTLComputePipelineState *)self->_pipelineStates[5] maxTotalThreadsPerThreadgroup]/ v29;
  id v36 = v8;
  uint64_t v31 = v13;
  v40[0] = (unint64_t)[v9 width] >> 1;
  v40[1] = (unint64_t)[v9 height] >> 1;
  v40[2] = 1;
  v39[0] = v29;
  v39[1] = v30;
  v39[2] = 1;
  [v15 dispatchThreads:v40 threadsPerThreadgroup:v39];
  [v15 setComputePipelineState:self->_pipelineStates[6]];
  [v15 setTexture:v28 atIndex:0];
  [v15 setTexture:v9 atIndex:1];
  [v15 setBytes:v42 length:4 atIndex:0];
  unint64_t v32 = [(MTLComputePipelineState *)self->_pipelineStates[6] threadExecutionWidth];
  unint64_t v33 = [(MTLComputePipelineState *)self->_pipelineStates[6] maxTotalThreadsPerThreadgroup]/ v32;
  v38[0] = (unint64_t)[v9 width] >> 1;
  v38[1] = (unint64_t)[v9 height] >> 1;
  v38[2] = 1;
  v37[0] = v32;
  v37[1] = v33;
  v37[2] = 1;
  [v15 dispatchThreads:v38 threadsPerThreadgroup:v37];
  [v15 endEncoding];
  [v31 commit];
  FigMetalDecRef();

  id v8 = v36;
  int v34 = 0;
LABEL_11:

  return v34;
}

- (int)boxFilter:(id)a3 withRadius:(unsigned int)a4 output:(id)a5
{
  id v8 = a3;
  unsigned int v39 = a4;
  id v9 = a5;
  id v38 = 0;
  if (([v9 width] & 1) != 0
    || ([v9 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandQueue],
        unint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 commandBuffer],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_8;
  }
  uint64_t v12 = [v11 computeCommandEncoder];
  if (!v12)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
LABEL_14:

    goto LABEL_8;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v15 = (void *)[v14 newTextureDescriptor];

  if (!v15)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_14;
  }
  unint64_t v16 = [v15 desc];
  [v16 setCompressionMode:2];

  v17 = [v15 desc];
  [v17 setCompressionFootprint:0];

  v18 = [v15 desc];
  [v18 setUsage:7];

  uint64_t v19 = [v8 pixelFormat];
  v20 = [v15 desc];
  [v20 setPixelFormat:v19];

  uint64_t v21 = [v8 width];
  v22 = [v15 desc];
  [v22 setWidth:v21];

  uint64_t v23 = [v8 height];
  v24 = [v15 desc];
  [v24 setHeight:v23];

  [v15 setLabel:0];
  uint64_t v25 = [(FigMetalContext *)self->_metal allocator];
  v26 = (void *)[v25 newTextureWithDescriptor:v15];
  id v38 = v26;

  if (!v26)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();

    goto LABEL_13;
  }
  [v13 setComputePipelineState:self->_pipelineStates[7]];
  [v13 setTexture:v8 atIndex:0];
  [v13 setTexture:v26 atIndex:1];
  [v13 setBytes:&v39 length:4 atIndex:0];
  unint64_t v27 = [(MTLComputePipelineState *)self->_pipelineStates[7] threadExecutionWidth];
  unint64_t v28 = [(MTLComputePipelineState *)self->_pipelineStates[7] maxTotalThreadsPerThreadgroup]/ v27;
  id v29 = v8;
  v37[0] = (unint64_t)[v9 width] >> 1;
  v37[1] = (unint64_t)[v9 height] >> 1;
  v37[2] = 1;
  v36[0] = v27;
  v36[1] = v28;
  v36[2] = 1;
  [v13 dispatchThreads:v37 threadsPerThreadgroup:v36];
  [v13 setComputePipelineState:self->_pipelineStates[8]];
  [v13 setTexture:v26 atIndex:0];
  [v13 setTexture:v9 atIndex:1];
  [v13 setBytes:&v39 length:4 atIndex:0];
  unint64_t v30 = [(MTLComputePipelineState *)self->_pipelineStates[8] threadExecutionWidth];
  unint64_t v31 = [(MTLComputePipelineState *)self->_pipelineStates[8] maxTotalThreadsPerThreadgroup]/ v30;
  v35[0] = (unint64_t)[v9 width] >> 1;
  v35[1] = (unint64_t)[v9 height] >> 1;
  v35[2] = 1;
  v34[0] = v30;
  v34[1] = v31;
  id v8 = v29;
  v34[2] = 1;
  [v13 dispatchThreads:v35 threadsPerThreadgroup:v34];
  [v13 endEncoding];
  [v11 commit];
  FigMetalDecRef();

  int v32 = 0;
LABEL_8:

  return v32;
}

- (int)extractFaceBodyBoundariesFromFaceLandMarks:(GreenGhostCommon *)self ev0FrameMetadata:(SEL)a2 imgSize:(id)a3 faceBoundaryPaddingRatio:(id)a4 bodyBoundaryPaddingRatio:(CGSize)a5 output:(FaceBodyBoundaries *)a6
{
  float v9 = v7;
  float v10 = v6;
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = a4;
  memset(&v58, 0, sizeof(v58));
  unsigned int v16 = [v14 count];
  v17 = [v15 faces];
  unsigned int v18 = [v17 count];

  if (v16) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  int v20 = !v19;
  if (!a6)
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
    goto LABEL_29;
  }
  if (v20) {
    unsigned int v21 = v18;
  }
  else {
    unsigned int v21 = v16;
  }
  if (v21 >= 0xA) {
    unsigned int v21 = 10;
  }
  a6->nFaces = v21;
  v22 = [v15 bodies];
  a6[44].nFaces = [v22 count];

  if (!(a6->nFaces + a6[44].nFaces)) {
    goto LABEL_28;
  }
  if (v20)
  {
    if (a6->nFaces)
    {
      unint64_t v23 = 0;
      do
      {
        v24 = [v15 faces];
        uint64_t v25 = [v24 objectAtIndexedSubscript:v23];
        [v25 rect];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        *(float32x2_t *)&long long v34 = computeBoundaryCoordinates(v27, v29, v31, v33, width, height, v10);
        *(_OWORD *)&a6[4 * v23++ + 4].nFaces = v34;
      }
      while (v23 < a6->nFaces);
    }
    goto LABEL_25;
  }
  double AffineTransformFromExifOrientation = getAffineTransformFromExifOrientation([v15 exifOrientation], (uint64_t)&v58);
  if (!a6->nFaces)
  {
LABEL_25:
    if (a6[44].nFaces)
    {
      unint64_t v43 = 0;
      do
      {
        unint64_t v44 = [v15 bodies];
        int v45 = [v44 objectAtIndexedSubscript:v43];
        [v45 rect];
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        double v53 = v52;

        *(float32x2_t *)&long long v54 = computeBoundaryCoordinates(v47, v49, v51, v53, width, height, v9);
        *(_OWORD *)&a6[4 * v43++ + 48].nFaces = v54;
      }
      while (v43 < a6[44].nFaces);
    }
LABEL_28:
    int v55 = 0;
    goto LABEL_29;
  }
  uint64_t v36 = 0;
  while (1)
  {
    v37 = objc_msgSend(v14, "objectAtIndexedSubscript:", v36, AffineTransformFromExifOrientation);
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    id v38 = (void *)getVNFaceObservationClass_softClass;
    uint64_t v62 = getVNFaceObservationClass_softClass;
    if (!getVNFaceObservationClass_softClass)
    {
      *(void *)&v57.a = MEMORY[0x263EF8330];
      *(void *)&v57.b = 3221225472;
      *(void *)&v57.c = __getVNFaceObservationClass_block_invoke;
      *(void *)&v57.d = &unk_2655C7BC0;
      *(void *)&v57.tx = &v59;
      __getVNFaceObservationClass_block_invoke((uint64_t)&v57);
      id v38 = (void *)v60[3];
    }
    id v39 = v38;
    _Block_object_dispose(&v59, 8);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    id v41 = [v14 objectAtIndexedSubscript:v36];
    [v41 boundingBox];
    CGAffineTransform v57 = v58;
    CGRect v64 = CGRectApplyAffineTransform(v63, &v57);
    *(float32x2_t *)&long long v42 = computeBoundaryCoordinates(v64.origin.x, v64.origin.y, v64.size.width, v64.size.height, width, height, v10);
    *(_OWORD *)&a6[4 * v36 + 4].nFaces = v42;

    if (++v36 >= (unint64_t)a6->nFaces) {
      goto LABEL_25;
    }
  }
  FigDebugAssert3();
  int v55 = -12780;
LABEL_29:

  return v55;
}

- (int)brightnessDetectionInput:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6
{
  float v7 = v6;
  id v11 = a3;
  id v12 = a4;
  float var0 = a6->var0;
  id v41 = a6;
  float32x2_t v13 = vadd_f32(*(float32x2_t *)&a6[2].var0, *(float32x2_t *)&a6[2].var0);
  float v42 = (float)(unint64_t)[v11 width];
  unint64_t v14 = [v11 height];
  v15.f32[0] = v42;
  v15.f32[1] = (float)v14;
  uint64_t v47 = *(void *)v7;
  float32x2_t v48 = vmul_f32(v13, v15);
  float v16 = v7[4];
  id v46 = 0;
  v17 = [(FigMetalContext *)self->_metal commandQueue];
  unsigned int v18 = [v17 commandBuffer];

  if (!v18 || ([v18 computeCommandEncoder], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_9;
  }
  int v20 = (void *)v19;
  unsigned int v21 = [(FigMetalContext *)self->_metal allocator];
  v22 = (void *)[v21 newTextureDescriptor];

  if (!v22)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_9;
  }
  unint64_t v23 = [v22 desc];
  [v23 setCompressionMode:2];

  v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  uint64_t v25 = [v22 desc];
  [v25 setUsage:7];

  uint64_t v26 = [v11 pixelFormat];
  double v27 = [v22 desc];
  [v27 setPixelFormat:v26];

  uint64_t v28 = [v12 width];
  double v29 = [v22 desc];
  [v29 setWidth:v28];

  uint64_t v30 = [v12 height];
  double v31 = [v22 desc];
  [v31 setHeight:v30];

  [v22 setLabel:0];
  double v32 = [(FigMetalContext *)self->_metal allocator];
  double v33 = (void *)[v32 newTextureWithDescriptor:v22];
  id v46 = v33;

  if (!v33)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();

    goto LABEL_13;
  }
  [v20 setComputePipelineState:self->_pipelineStates[10]];
  id v43 = v11;
  [v20 setTexture:v11 atIndex:0];
  [v20 setTexture:v12 atIndex:1];
  [v20 setBytes:&var0 length:4 atIndex:0];
  [v20 setBytes:&v48 length:8 atIndex:1];
  [v20 setBytes:&v47 length:8 atIndex:2];
  unint64_t v34 = [(MTLComputePipelineState *)self->_pipelineStates[10] threadExecutionWidth];
  unint64_t v35 = [(MTLComputePipelineState *)self->_pipelineStates[10] maxTotalThreadsPerThreadgroup]/ v34;
  v45[0] = [v12 width];
  v45[1] = [v12 height];
  v45[2] = 1;
  v44[0] = v34;
  v44[1] = v35;
  v44[2] = 1;
  [v20 dispatchThreads:v45 threadsPerThreadgroup:v44];
  [v20 endEncoding];
  [v18 commit];
  *(float *)&double v36 = v16 * v41[5].var0;
  int v37 = [(GreenGhostCommon *)self erodeTexture:v12 withNormalizedRadius:v33 output:v36];
  if (v37)
  {
    int v39 = v37;
    goto LABEL_15;
  }
  *(float *)&double v38 = v16 * v41[4].var0;
  int v39 = [(GreenGhostCommon *)self dilateTexture:v33 withNormalizedRadius:v12 output:v38];
  if (v39)
  {
LABEL_15:
    FigDebugAssert3();
    goto LABEL_8;
  }
  FigMetalDecRef();
LABEL_8:

  id v11 = v43;
LABEL_9:

  return v39;
}

- (int)blobDetection:(id)a3 output:(id)a4 params:(BlobTuning)a5
{
  unint64_t v7 = v5;
  unint64_t v41 = v5;
  uint64_t v42 = v6;
  id v10 = a3;
  id v11 = a4;
  id v39 = 0;
  id v40 = 0;
  if (([v11 width] & 1) != 0
    || ([v11 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal allocator],
        id v12 = objc_claimAutoreleasedReturnValue(),
        float32x2_t v13 = (void *)[v12 newTextureDescriptor],
        v12,
        !v13))
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    goto LABEL_11;
  }
  unint64_t v14 = [v13 desc];
  [v14 setCompressionMode:2];

  float32x2_t v15 = [v13 desc];
  [v15 setCompressionFootprint:0];

  uint64_t v16 = [v10 pixelFormat];
  v17 = [v13 desc];
  [v17 setPixelFormat:v16];

  unsigned int v18 = [v13 desc];
  [v18 setUsage:7];

  uint64_t v19 = [v10 width];
  int v20 = [v13 desc];
  [v20 setWidth:v19];

  uint64_t v21 = [v10 height];
  v22 = [v13 desc];
  [v22 setHeight:v21];

  [v13 setLabel:0];
  unint64_t v23 = [(FigMetalContext *)self->_metal allocator];
  v24 = (void *)[v23 newTextureWithDescriptor:v13];
  id v40 = v24;

  if (!v24) {
    goto LABEL_18;
  }
  int v25 = [(GreenGhostCommon *)self boxFilter:v10 withRadius:v7 output:v24];
  if (v25)
  {
    int v35 = v25;
LABEL_17:
    FigDebugAssert3();
LABEL_19:

    goto LABEL_11;
  }
  [v13 setLabel:0];
  uint64_t v26 = [(FigMetalContext *)self->_metal allocator];
  double v27 = (void *)[v26 newTextureWithDescriptor:v13];
  id v39 = v27;

  if (!v27) {
    goto LABEL_18;
  }
  int v28 = [(GreenGhostCommon *)self boxFilter:v10 withRadius:HIDWORD(v7) output:v27];
  if (v28)
  {
    int v35 = v28;
    goto LABEL_17;
  }
  double v29 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v30 = [v29 commandBuffer];

  if (!v30)
  {
LABEL_18:
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    goto LABEL_19;
  }
  double v31 = [v30 computeCommandEncoder];
  if (v31)
  {
    double v32 = v31;
    [v31 setComputePipelineState:self->_pipelineStates[9]];
    [v32 setTexture:v24 atIndex:0];
    [v32 setTexture:v27 atIndex:1];
    [v32 setTexture:v11 atIndex:2];
    [v32 setBytes:&v42 length:4 atIndex:0];
    unint64_t v33 = [(MTLComputePipelineState *)self->_pipelineStates[9] threadExecutionWidth];
    unint64_t v34 = [(MTLComputePipelineState *)self->_pipelineStates[9] maxTotalThreadsPerThreadgroup]/ v33;
    v38[0] = (unint64_t)[v11 width] >> 1;
    v38[1] = (unint64_t)[v11 height] >> 1;
    v38[2] = 1;
    v37[0] = v33;
    v37[1] = v34;
    v37[2] = 1;
    [v32 dispatchThreads:v38 threadsPerThreadgroup:v37];
    [v32 endEncoding];
    [v30 commit];
    FigMetalDecRef();
    FigMetalDecRef();

    int v35 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
  }
LABEL_11:

  return v35;
}

- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7
{
  uint64_t v8 = v7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v48 = 0;
  float v16 = *(float *)(v8 + 16);
  v17 = [(FigMetalContext *)self->_metal commandQueue];
  unsigned int v18 = [v17 commandBuffer];

  if (!v18)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    int v20 = v15;
    goto LABEL_12;
  }
  uint64_t v19 = [v18 computeCommandEncoder];
  int v20 = v15;
  if (!v19)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_12;
  }
  uint64_t v21 = (void *)v19;
  int v45 = v18;
  v22 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v23 = (void *)[v22 newTextureDescriptor];

  if (!v23)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v24 = [v23 desc];
  [v24 setCompressionMode:2];

  int v25 = [v23 desc];
  [v25 setCompressionFootprint:0];

  uint64_t v26 = [v23 desc];
  [v26 setUsage:7];

  uint64_t v27 = [v13 pixelFormat];
  int v28 = [v23 desc];
  [v28 setPixelFormat:v27];

  uint64_t v29 = [v13 width];
  uint64_t v30 = [v23 desc];
  [v30 setWidth:v29];

  uint64_t v31 = [v13 height];
  double v32 = [v23 desc];
  [v32 setHeight:v31];

  [v23 setLabel:0];
  unint64_t v33 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v34 = (void *)[v33 newTextureWithDescriptor:v23];
  id v48 = v34;

  if (!v34)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_9;
  }
  [v21 setComputePipelineState:self->_pipelineStates[11]];
  id v44 = v13;
  [v21 setTexture:v13 atIndex:0];
  [v21 setTexture:v14 atIndex:1];
  [v21 setTexture:v34 atIndex:2];
  [v21 setBytes:a7 length:40 atIndex:0];
  unint64_t v35 = [(MTLComputePipelineState *)self->_pipelineStates[11] threadExecutionWidth];
  unint64_t v36 = [(MTLComputePipelineState *)self->_pipelineStates[11] maxTotalThreadsPerThreadgroup]/ v35;
  v47[0] = [v15 width];
  v47[1] = [v15 height];
  v47[2] = 1;
  v46[0] = v35;
  v46[1] = v36;
  v46[2] = 1;
  int v20 = v15;
  [v21 dispatchThreads:v47 threadsPerThreadgroup:v46];
  [v21 endEncoding];
  [v45 commit];
  *(float *)&double v37 = v16 * a7[8].var0;
  int v38 = [(GreenGhostCommon *)self dilateTexture:v34 withNormalizedRadius:v15 output:v37];
  if (v38)
  {
    int v42 = v38;
    FigDebugAssert3();

    id v13 = v44;
    goto LABEL_11;
  }
  *(float *)&double v39 = v16 * a7[8].var0;
  int v40 = [(GreenGhostCommon *)self erodeTexture:v15 withNormalizedRadius:v34 output:v39];
  id v13 = v44;
  if (v40)
  {
    int v42 = v40;
    goto LABEL_19;
  }
  *(float *)&double v41 = v16 * a7[9].var0;
  int v42 = [(GreenGhostCommon *)self dilateTexture:v34 withNormalizedRadius:v15 output:v41];
  if (v42)
  {
LABEL_19:
    FigDebugAssert3();
    goto LABEL_9;
  }
  FigMetalDecRef();
LABEL_9:

LABEL_10:
LABEL_11:
  unsigned int v18 = v45;
LABEL_12:

  return v42;
}

- (int)combineBrightnessMask:(id)a3 blobMask:(id)a4 greenMask:(id)a5 output:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v13 width] & 1) != 0
    || ([v13 height] & 1) != 0
    || ([(FigMetalContext *)self->_metal commandQueue],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 commandBuffer],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v15))
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
  }
  else
  {
    float v16 = [v15 computeCommandEncoder];
    if (v16)
    {
      v17 = v16;
      [v16 setComputePipelineState:self->_pipelineStates[12]];
      [v17 setTexture:v10 atIndex:0];
      [v17 setTexture:v11 atIndex:1];
      [v17 setTexture:v12 atIndex:2];
      [v17 setTexture:v13 atIndex:3];
      unint64_t v18 = [(MTLComputePipelineState *)self->_pipelineStates[12] threadExecutionWidth];
      unint64_t v19 = [(MTLComputePipelineState *)self->_pipelineStates[12] maxTotalThreadsPerThreadgroup]/ v18;
      v23[0] = (unint64_t)[v13 width] >> 1;
      v23[1] = (unint64_t)[v13 height] >> 1;
      v23[2] = 1;
      v22[0] = v18;
      v22[1] = v19;
      v22[2] = 1;
      [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
      [v17 endEncoding];
      [v15 commit];

      int v20 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v20 = FigSignalErrorAt();
    }
  }

  return v20;
}

- (int)detectionWithLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v42 = a5;
  id v16 = a6;
  id v48 = 0;
  id v46 = 0;
  id v47 = 0;
  v17 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v18 = (void *)[v17 newTextureDescriptor];

  double v41 = v14;
  if (!v18) {
    goto LABEL_17;
  }
  unint64_t v19 = [v18 desc];
  [v19 setCompressionMode:2];

  int v20 = [v18 desc];
  [v20 setCompressionFootprint:0];

  uint64_t v21 = [v18 desc];
  [v21 setUsage:7];

  uint64_t v22 = [v16 pixelFormat];
  unint64_t v23 = [v18 desc];
  [v23 setPixelFormat:v22];

  uint64_t v24 = [v16 width];
  int v25 = [v18 desc];
  [v25 setWidth:v24];

  uint64_t v26 = [v16 height];
  uint64_t v27 = [v18 desc];
  [v27 setHeight:v26];

  [v18 setLabel:0];
  int v28 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v29 = (void *)[v28 newTextureWithDescriptor:v18];
  id v48 = v29;

  if (!v29) {
    goto LABEL_17;
  }
  long long v43 = *(_OWORD *)&a7->var0.var0;
  *(void *)&long long v44 = *(void *)&a7->var2.var0;
  int v30 = [(GreenGhostCommon *)self brightnessDetectionInput:v14 output:v29 params:&v43 processingROIInfo:a8];
  if (v30)
  {
    int v39 = v30;
LABEL_16:
    FigDebugAssert3();
LABEL_18:
    double v37 = v42;
    goto LABEL_10;
  }
  [v18 setLabel:0];
  uint64_t v31 = [(FigMetalContext *)self->_metal allocator];
  double v32 = (void *)[v31 newTextureWithDescriptor:v18];
  id v47 = v32;

  if (!v32) {
    goto LABEL_17;
  }
  int v33 = -[GreenGhostCommon blobDetection:output:params:](self, "blobDetection:output:params:", v15, v32, *(void *)&a7->var2.var2, *(void *)&a7[1].var0.var1);
  if (v33)
  {
    int v39 = v33;
    goto LABEL_16;
  }
  [v18 setLabel:0];
  unint64_t v34 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v35 = (void *)[v34 newTextureWithDescriptor:v18];
  id v46 = v35;

  if (!v35)
  {
LABEL_17:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_18;
  }
  long long v36 = *(_OWORD *)&a7[2].var0.var0;
  long long v43 = *(_OWORD *)&a7[1].var1.var0;
  long long v44 = v36;
  uint64_t v45 = *(void *)&a7[2].var2.var0;
  double v37 = v42;
  int v38 = [(GreenGhostCommon *)self greenDetectionLuma:v15 chroma:v42 output:v35 params:&v43 processingROIInfo:a8];
  if (v38)
  {
    int v39 = v38;
    goto LABEL_20;
  }
  int v39 = [(GreenGhostCommon *)self combineBrightnessMask:v29 blobMask:v32 greenMask:v35 output:v16];
  if (v39)
  {
LABEL_20:
    FigDebugAssert3();
    goto LABEL_10;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_10:

  return v39;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  for (uint64_t i = 112; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end