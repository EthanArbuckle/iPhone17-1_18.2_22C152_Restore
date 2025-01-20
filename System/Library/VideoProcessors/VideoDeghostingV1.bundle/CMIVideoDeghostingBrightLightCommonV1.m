@interface CMIVideoDeghostingBrightLightCommonV1
- (CMIVideoDeghostingBrightLightCommonV1)initWithMetalContext:(id)a3;
- (id)_functionNameForProgram:(int)a3;
- (int)_compileDilateVerticalShaders;
- (int)_compileShaders;
- (int)brightnessDetectionInputReflectedLuma:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6;
- (int)combineBrightnessMask:(id)a3 greenMask:(id)a4 output:(id)a5;
- (int)detectionWithReflectedLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8 inputIsHDR:(BOOL)a9;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7;
- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5;
- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7 inputIsHDR:(BOOL)a8;
@end

@implementation CMIVideoDeghostingBrightLightCommonV1

- (id)_functionNameForProgram:(int)a3
{
  if (a3 < 0xB) {
    return off_2C810[a3];
  }
  FigDebugAssert3();
  return 0;
}

- (int)_compileDilateVerticalShaders
{
  v3 = objc_opt_new();
  if (v3)
  {
    pipelineStates = self->_pipelineStates;
    int v16 = 0;
    while (2)
    {
      int v5 = 0;
      int v15 = 0;
      do
      {
        if (!v5 || !v16)
        {
          [v3 setConstantValue:&v15 type:53 atIndex:1];
          [v3 setConstantValue:&v16 type:53 atIndex:2];
          int v6 = v15 + 2 * v16 + 1;
          metal = self->_metal;
          v8 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:v6];
          uint64_t v9 = [(FigMetalContext *)metal computePipelineStateFor:v8 constants:v3];
          v10 = pipelineStates[v6];
          pipelineStates[v6] = (MTLComputePipelineState *)v9;

          if (!pipelineStates[v6])
          {
            FigDebugAssert3();
            goto LABEL_12;
          }
          int v5 = v15;
        }
        int v15 = v5 + 1;
      }
      while (v5++ < 1);
      int v12 = v16++;
      if (v12 < 1) {
        continue;
      }
      break;
    }
    int v13 = 0;
  }
  else
  {
LABEL_12:
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)_compileShaders
{
  char v41 = 0;
  metal = self->_metal;
  v4 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:0];
  int v5 = [(FigMetalContext *)metal computePipelineStateFor:v4 constants:0];
  int v6 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v5;

  if (!self->_pipelineStates[0]) {
    goto LABEL_15;
  }
  unsigned int v7 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _compileDilateVerticalShaders];
  if (v7)
  {
    int v38 = v7;
    FigDebugAssert3();
LABEL_16:
    v25 = 0;
    goto LABEL_12;
  }
  v8 = self->_metal;
  uint64_t v9 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:4];
  v10 = [(FigMetalContext *)v8 computePipelineStateFor:v9 constants:0];
  v11 = self->_pipelineStates[4];
  self->_pipelineStates[4] = v10;

  if (!self->_pipelineStates[4]) {
    goto LABEL_15;
  }
  int v12 = self->_metal;
  int v13 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:5];
  v14 = [(FigMetalContext *)v12 computePipelineStateFor:v13 constants:0];
  int v15 = self->_pipelineStates[5];
  self->_pipelineStates[5] = v14;

  if (!self->_pipelineStates[5]) {
    goto LABEL_15;
  }
  int v16 = self->_metal;
  v17 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:6];
  v18 = [(FigMetalContext *)v16 computePipelineStateFor:v17 constants:0];
  v19 = self->_pipelineStates[6];
  self->_pipelineStates[6] = v18;

  if (!self->_pipelineStates[6]) {
    goto LABEL_15;
  }
  v20 = self->_metal;
  v21 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:7];
  v22 = [(FigMetalContext *)v20 computePipelineStateFor:v21 constants:0];
  v23 = self->_pipelineStates[7];
  self->_pipelineStates[7] = v22;

  if (!self->_pipelineStates[7])
  {
LABEL_15:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
    goto LABEL_16;
  }
  char v40 = 0;
  v24 = objc_opt_new();
  v25 = v24;
  if (!v24) {
    goto LABEL_17;
  }
  [v24 setConstantValue:&v41 type:53 atIndex:3];
  [v25 setConstantValue:&v40 type:53 atIndex:0];
  v26 = self->_metal;
  v27 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:8];
  v28 = [(FigMetalContext *)v26 computePipelineStateFor:v27 constants:v25];
  v29 = self->_pipelineStates[8];
  self->_pipelineStates[8] = v28;

  if (!self->_pipelineStates[8]) {
    goto LABEL_17;
  }
  char v40 = 1;
  [v25 setConstantValue:&v40 type:53 atIndex:0];
  v30 = self->_metal;
  v31 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:9];
  v32 = [(FigMetalContext *)v30 computePipelineStateFor:v31 constants:v25];
  v33 = self->_pipelineStates[9];
  self->_pipelineStates[9] = v32;

  if (!self->_pipelineStates[9]) {
    goto LABEL_17;
  }
  v34 = self->_metal;
  v35 = [(CMIVideoDeghostingBrightLightCommonV1 *)self _functionNameForProgram:10];
  v36 = [(FigMetalContext *)v34 computePipelineStateFor:v35 constants:0];
  v37 = self->_pipelineStates[10];
  self->_pipelineStates[10] = v36;

  if (self->_pipelineStates[10])
  {
    int v38 = 0;
  }
  else
  {
LABEL_17:
    FigDebugAssert3();
    int v38 = FigSignalErrorAt();
  }
LABEL_12:

  return v38;
}

- (CMIVideoDeghostingBrightLightCommonV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMIVideoDeghostingBrightLightCommonV1;
  int v6 = [(CMIVideoDeghostingBrightLightCommonV1 *)&v12 init];
  unsigned int v7 = v6;
  if (!v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  unsigned int v8 = [(CMIVideoDeghostingBrightLightCommonV1 *)v7 _compileShaders];
  uint64_t v9 = v7;
  if (v8)
  {
    FigDebugAssert3();
    goto LABEL_6;
  }
LABEL_3:
  v10 = v9;

  return v10;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 withThreshold:(id)a5 subtractTexture:(id)a6 output:(id)a7
{
  id v12 = a3;
  id v51 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [v12 width];
  if (v15 <= [v12 height]) {
    id v16 = [v12 height];
  }
  else {
    id v16 = [v12 width];
  }
  v58[0] = (float)((float)(unint64_t)v16 * a4);
  id v57 = 0;
  v17 = v51;
  if ([v14 width] & 1) != 0 || (objc_msgSend(v14, "height")) {
    goto LABEL_27;
  }
  if (v51 && v13)
  {
    FigDebugAssert3();
LABEL_27:
    int v46 = FigSignalErrorAt();
    char v40 = 0;
    v20 = 0;
    v19 = 0;
    goto LABEL_24;
  }
  v18 = [(FigMetalContext *)self->_metal commandQueue];
  v19 = [v18 commandBuffer];

  if (!v19)
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
    char v40 = 0;
    v20 = 0;
    goto LABEL_24;
  }
  v20 = [v19 computeCommandEncoder];
  if (!v20)
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
    char v40 = 0;
    goto LABEL_24;
  }
  v50 = v14;
  v21 = [(FigMetalContext *)self->_metal allocator];
  id v22 = [v21 newTextureDescriptor];

  if (!v22)
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();
LABEL_32:
    char v40 = 0;
    id v14 = v50;
    goto LABEL_24;
  }
  v23 = [v22 desc];
  [v23 setCompressionMode:2];

  v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  v25 = [v22 desc];
  [v25 setUsage:7];

  id v26 = [v12 pixelFormat];
  v27 = [v22 desc];
  [v27 setPixelFormat:v26];

  id v28 = [v12 width];
  v29 = [v22 desc];
  [v29 setWidth:v28];

  id v30 = [v12 height];
  v31 = [v22 desc];
  [v31 setHeight:v30];

  [v22 setLabel:0];
  v32 = [(FigMetalContext *)self->_metal allocator];
  id v33 = [v32 newTextureWithDescriptor:v22];
  id v57 = v33;

  if (!v33)
  {
    FigDebugAssert3();
    int v46 = FigSignalErrorAt();

    goto LABEL_32;
  }
  v48 = v19;
  v35 = self->_pipelineStates[0];
  pipelineStates = self->_pipelineStates;
  [v20 setComputePipelineState:v35];
  id v49 = v12;
  [v20 setTexture:v12 atIndex:0];
  [v20 setTexture:v33 atIndex:1];
  [v20 setBytes:v58 length:4 atIndex:0];
  unint64_t v36 = (unint64_t)[(MTLComputePipelineState *)*pipelineStates threadExecutionWidth];
  unint64_t v37 = (unint64_t)[(MTLComputePipelineState *)*pipelineStates maxTotalThreadsPerThreadgroup]/ v36;
  id v14 = v50;
  v56[0] = (unint64_t)[v50 width] >> 1;
  v56[1] = (unint64_t)[v50 height] >> 1;
  v56[2] = 1;
  v55[0] = v36;
  v55[1] = v37;
  v55[2] = 1;
  v17 = v51;
  [v20 dispatchThreads:v56 threadsPerThreadgroup:v55];
  uint64_t v38 = 3;
  if (v51) {
    uint64_t v38 = 4;
  }
  if (v13) {
    uint64_t v39 = v38;
  }
  else {
    uint64_t v39 = (v51 != 0) + 1;
  }
  char v40 = pipelineStates[v39];
  [v20 setComputePipelineState:v40];
  [v20 setTexture:v33 atIndex:0];
  [v20 setTexture:v50 atIndex:2];
  [v20 setBytes:v58 length:4 atIndex:0];
  if (v51)
  {
    [v51 floatValue];
    int v54 = v41;
    [v20 setBytes:&v54 length:4 atIndex:1];
  }
  v19 = v48;
  if (v13) {
    [v20 setTexture:v13 atIndex:1];
  }
  unint64_t v42 = (unint64_t)[(MTLComputePipelineState *)v40 threadExecutionWidth];
  unint64_t v43 = (unint64_t)[(MTLComputePipelineState *)v40 maxTotalThreadsPerThreadgroup]
      / v42;
  v53[0] = (unint64_t)[v50 width] >> 1;
  v53[1] = (unint64_t)[v50 height] >> 1;
  v53[2] = 1;
  v52[0] = v42;
  v52[1] = v43;
  v52[2] = 1;
  [v20 dispatchThreads:v53 threadsPerThreadgroup:v52];
  [v20 endEncoding];
  if (gGMFigKTraceEnabled)
  {
    v44 = [v48 commandQueue];
    v45 = [v44 commandBuffer];

    [v45 setLabel:@"KTRACE_MTLCMDBUF"];
    [v45 addCompletedHandler:&stru_2C6D0];
    [v45 commit];
    [v48 addCompletedHandler:&stru_2C6F0];

    id v14 = v50;
  }
  [v48 commit];

  int v46 = 0;
  id v12 = v49;
LABEL_24:
  FigMetalDecRef();

  return v46;
}

- (int)dilateTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  return -[CMIVideoDeghostingBrightLightCommonV1 dilateTexture:withNormalizedRadius:withThreshold:subtractTexture:output:](self, "dilateTexture:withNormalizedRadius:withThreshold:subtractTexture:output:", a3, 0, 0, a5);
}

- (int)erodeTexture:(id)a3 withNormalizedRadius:(float)a4 output:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 width];
  if (v10 <= [v8 height]) {
    id v11 = [v8 height];
  }
  else {
    id v11 = [v8 width];
  }
  v44[0] = (float)((float)(unint64_t)v11 * a4);
  id v43 = 0;
  if ([v9 width] & 1) != 0 || (objc_msgSend(v9, "height")) {
    goto LABEL_16;
  }
  id v12 = [(FigMetalContext *)self->_metal commandQueue];
  id v13 = [v12 commandBuffer];

  if (!v13)
  {
    FigDebugAssert3();
LABEL_16:
    int v36 = FigSignalErrorAt();
    goto LABEL_13;
  }
  uint64_t v14 = [v13 computeCommandEncoder];
  if (!v14)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
LABEL_21:

    goto LABEL_13;
  }
  id v15 = (void *)v14;
  id v16 = [(FigMetalContext *)self->_metal allocator];
  id v17 = [v16 newTextureDescriptor];

  if (!v17)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
LABEL_20:

    goto LABEL_21;
  }
  v18 = [v17 desc];
  [v18 setCompressionMode:2];

  v19 = [v17 desc];
  [v19 setCompressionFootprint:0];

  v20 = [v17 desc];
  [v20 setUsage:7];

  id v21 = [v8 pixelFormat];
  id v22 = [v17 desc];
  [v22 setPixelFormat:v21];

  id v23 = [v8 width];
  v24 = [v17 desc];
  [v24 setWidth:v23];

  id v25 = [v8 height];
  id v26 = [v17 desc];
  [v26 setHeight:v25];

  [v17 setLabel:0];
  v27 = [(FigMetalContext *)self->_metal allocator];
  id v28 = [v27 newTextureWithDescriptor:v17];
  id v43 = v28;

  if (!v28)
  {
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();

    goto LABEL_20;
  }
  [v15 setComputePipelineState:self->_pipelineStates[4]];
  id v38 = v8;
  [v15 setTexture:v8 atIndex:0];
  [v15 setTexture:v28 atIndex:1];
  [v15 setBytes:v44 length:4 atIndex:0];
  unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[4] threadExecutionWidth];
  unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[4] maxTotalThreadsPerThreadgroup]/ v29;
  v31 = v13;
  v42[0] = (unint64_t)[v9 width] >> 1;
  v42[1] = (unint64_t)[v9 height] >> 1;
  v42[2] = 1;
  v41[0] = v29;
  v41[1] = v30;
  v41[2] = 1;
  [v15 dispatchThreads:v42 threadsPerThreadgroup:v41];
  [v15 setComputePipelineState:self->_pipelineStates[5]];
  [v15 setTexture:v28 atIndex:0];
  [v15 setTexture:v9 atIndex:1];
  [v15 setBytes:v44 length:4 atIndex:0];
  unint64_t v32 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[5] threadExecutionWidth];
  unint64_t v33 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[5] maxTotalThreadsPerThreadgroup]/ v32;
  v40[0] = (unint64_t)[v9 width] >> 1;
  v40[1] = (unint64_t)[v9 height] >> 1;
  v40[2] = 1;
  v39[0] = v32;
  v39[1] = v33;
  v39[2] = 1;
  [v15 dispatchThreads:v40 threadsPerThreadgroup:v39];
  [v15 endEncoding];
  if (gGMFigKTraceEnabled)
  {
    v34 = [v31 commandQueue];
    v35 = [v34 commandBuffer];

    [v35 setLabel:@"KTRACE_MTLCMDBUF"];
    [v35 addCompletedHandler:&stru_2C710];
    [v35 commit];
    [v31 addCompletedHandler:&stru_2C730];
  }
  [v31 commit];

  int v36 = 0;
  id v8 = v38;
LABEL_13:
  FigMetalDecRef();

  return v36;
}

- (int)brightnessDetectionInputReflectedLuma:(id)a3 output:(id)a4 params:(BrightnessTuning)a5 processingROIInfo:(ProcessingROIInfo *)a6
{
  uint64_t v7 = v6;
  id v11 = a3;
  id v12 = a4;
  char v40 = a6;
  float var0 = a6->var0;
  float v13 = *(float *)(v7 + 16);
  id v43 = 0;
  uint64_t v14 = [(FigMetalContext *)self->_metal commandQueue];
  id v15 = [v14 commandBuffer];

  if (!v15)
  {
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
    id v16 = 0;
LABEL_12:
    id v18 = 0;
    goto LABEL_9;
  }
  id v16 = [v15 computeCommandEncoder];
  if (!v16)
  {
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
    goto LABEL_12;
  }
  id v17 = [(FigMetalContext *)self->_metal allocator];
  id v18 = [v17 newTextureDescriptor];

  if (!v18) {
    goto LABEL_13;
  }
  v19 = [v18 desc];
  [v19 setCompressionMode:2];

  v20 = [v18 desc];
  [v20 setCompressionFootprint:0];

  id v21 = [v18 desc];
  [v21 setUsage:7];

  id v22 = [v11 pixelFormat];
  id v23 = [v18 desc];
  [v23 setPixelFormat:v22];

  id v24 = [v11 width];
  id v25 = [v18 desc];
  [v25 setWidth:v24];

  id v26 = [v11 height];
  v27 = [v18 desc];
  [v27 setHeight:v26];

  [v18 setLabel:0];
  id v28 = [(FigMetalContext *)self->_metal allocator];
  id v29 = [v28 newTextureWithDescriptor:v18];
  id v43 = v29;

  if (!v29)
  {
LABEL_13:
    FigDebugAssert3();
    int v37 = FigSignalErrorAt();
    goto LABEL_9;
  }
  [v16 setComputePipelineState:self->_pipelineStates[7]];
  id v39 = v11;
  [v16 setTexture:v11 atIndex:0];
  [v16 setTexture:v12 atIndex:1];
  [v16 setBytes:&var0 length:4 atIndex:0];
  unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[7] threadExecutionWidth];
  unint64_t v31 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[7] maxTotalThreadsPerThreadgroup]/ v30;
  v42[0] = (unint64_t)[v12 width] >> 1;
  v42[1] = (unint64_t)[v12 height] >> 1;
  v42[2] = 1;
  v41[0] = v30;
  v41[1] = v31;
  v41[2] = 1;
  [v16 dispatchThreads:v42 threadsPerThreadgroup:v41];
  [v16 endEncoding];
  if (gGMFigKTraceEnabled)
  {
    unint64_t v32 = [v15 commandQueue];
    unint64_t v33 = [v32 commandBuffer];

    [v33 setLabel:@"KTRACE_MTLCMDBUF"];
    [v33 addCompletedHandler:&stru_2C750];
    [v33 commit];
    [v15 addCompletedHandler:&stru_2C770];
  }
  [v15 commit];
  *(float *)&double v34 = v13 * v40[5].var0;
  unsigned int v35 = [(CMIVideoDeghostingBrightLightCommonV1 *)self erodeTexture:v12 withNormalizedRadius:v29 output:v34];
  id v11 = v39;
  if (v35)
  {
    int v37 = v35;
    goto LABEL_15;
  }
  *(float *)&double v36 = v13 * v40[4].var0;
  int v37 = [(CMIVideoDeghostingBrightLightCommonV1 *)self dilateTexture:v29 withNormalizedRadius:v12 output:v36];
  if (v37) {
LABEL_15:
  }
    FigDebugAssert3();
LABEL_9:
  FigMetalDecRef();

  return v37;
}

- (int)greenDetectionLuma:(id)a3 chroma:(id)a4 output:(id)a5 params:(GreenTuning)a6 processingROIInfo:(ProcessingROIInfo *)a7 inputIsHDR:(BOOL)a8
{
  int v9 = v8;
  uint64_t v10 = a8;
  id v15 = a3;
  id v48 = a4;
  id v16 = a5;
  id v55 = 0;
  float v17 = *(float *)(v10 + 16);
  id v53 = 0;
  id v54 = 0;
  id v51 = 0;
  id v52 = 0;
  id v18 = [(FigMetalContext *)self->_metal commandQueue];
  v19 = [v18 commandBuffer];

  if (!v19)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    id v22 = 0;
    v20 = 0;
    goto LABEL_12;
  }
  v20 = [v19 computeCommandEncoder];
  if (!v20)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    id v22 = 0;
    goto LABEL_12;
  }
  id v21 = [(FigMetalContext *)self->_metal allocator];
  id v22 = [v21 newTextureDescriptor];

  if (!v22)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v47 = v16;
  id v23 = [v22 desc];
  [v23 setCompressionMode:2];

  id v24 = [v22 desc];
  [v24 setCompressionFootprint:0];

  id v25 = [v22 desc];
  [v25 setUsage:7];

  id v26 = [v15 pixelFormat];
  v27 = [v22 desc];
  [v27 setPixelFormat:v26];

  id v28 = [v15 width];
  id v29 = [v22 desc];
  [v29 setWidth:v28];

  id v30 = [v15 height];
  unint64_t v31 = [v22 desc];
  [v31 setHeight:v30];

  [v22 setLabel:0];
  unint64_t v32 = [(FigMetalContext *)self->_metal allocator];
  id v33 = [v32 newTextureWithDescriptor:v22];
  id v55 = v33;

  if (!v33)
  {
    int v45 = FigSignalErrorAt();
    id v16 = v47;
    goto LABEL_12;
  }
  uint64_t v34 = 8;
  if (v9) {
    uint64_t v34 = 9;
  }
  unsigned int v35 = (id *)((char *)&self->super.isa + v34 * 8);
  [v20 setComputePipelineState:self->_pipelineStates[v34]];
  [v20 setTexture:v15 atIndex:0];
  [v20 setTexture:v48 atIndex:1];
  [v20 setTexture:v33 atIndex:2];
  [v20 setTexture:0 atIndex:3];
  [v20 setTexture:0 atIndex:4];
  [v20 setTexture:0 atIndex:5];
  [v20 setTexture:0 atIndex:6];
  [v20 setBytes:a7 length:32 atIndex:0];
  unint64_t v36 = (unint64_t)[v35[2] threadExecutionWidth];
  unint64_t v37 = (unint64_t)[v35[2] maxTotalThreadsPerThreadgroup] / v36;
  v50[0] = [v47 width];
  v50[1] = [v47 height];
  v50[2] = 1;
  v49[0] = v36;
  v49[1] = v37;
  v49[2] = 1;
  [v20 dispatchThreads:v50 threadsPerThreadgroup:v49];
  [v20 endEncoding];
  if (gGMFigKTraceEnabled)
  {
    id v38 = [v19 commandQueue];
    id v39 = [v38 commandBuffer];

    [v39 setLabel:@"KTRACE_MTLCMDBUF"];
    [v39 addCompletedHandler:&stru_2C790];
    [v39 commit];
    [v19 addCompletedHandler:&stru_2C7B0];
  }
  [v19 commit];
  *(float *)&double v40 = v17 * a7[6].var0;
  id v16 = v47;
  unsigned int v41 = [(CMIVideoDeghostingBrightLightCommonV1 *)self dilateTexture:v33 withNormalizedRadius:v47 output:v40];
  if (v41)
  {
    int v45 = v41;
    goto LABEL_19;
  }
  *(float *)&double v42 = v17 * a7[6].var0;
  unsigned int v43 = [(CMIVideoDeghostingBrightLightCommonV1 *)self erodeTexture:v47 withNormalizedRadius:v33 output:v42];
  if (v43)
  {
    int v45 = v43;
    goto LABEL_19;
  }
  *(float *)&double v44 = v17 * a7[7].var0;
  int v45 = [(CMIVideoDeghostingBrightLightCommonV1 *)self dilateTexture:v33 withNormalizedRadius:v47 output:v44];
  if (v45) {
LABEL_19:
  }
    FigDebugAssert3();
LABEL_12:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v45;
}

- (int)combineBrightnessMask:(id)a3 greenMask:(id)a4 output:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 width] & 1) != 0 || (objc_msgSend(v10, "height")) {
    goto LABEL_11;
  }
  id v11 = [(FigMetalContext *)self->_metal commandQueue];
  id v12 = [v11 commandBuffer];

  if (!v12)
  {
    FigDebugAssert3();
LABEL_11:
    int v19 = FigSignalErrorAt();
    goto LABEL_8;
  }
  float v13 = [v12 computeCommandEncoder];
  if (v13)
  {
    uint64_t v14 = v13;
    [v13 setComputePipelineState:self->_pipelineStates[10]];
    [v14 setTexture:v8 atIndex:0];
    [v14 setTexture:v9 atIndex:1];
    [v14 setTexture:v10 atIndex:2];
    unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[10] threadExecutionWidth];
    unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[10] maxTotalThreadsPerThreadgroup]/ v15;
    v22[0] = (unint64_t)[v10 width] >> 1;
    v22[1] = (unint64_t)[v10 height] >> 1;
    v22[2] = 1;
    v21[0] = v15;
    v21[1] = v16;
    v21[2] = 1;
    [v14 dispatchThreads:v22 threadsPerThreadgroup:v21];
    [v14 endEncoding];
    if (gGMFigKTraceEnabled)
    {
      float v17 = [v12 commandQueue];
      id v18 = [v17 commandBuffer];

      [v18 setLabel:@"KTRACE_MTLCMDBUF"];
      [v18 addCompletedHandler:&stru_2C7D0];
      [v18 commit];
      [v12 addCompletedHandler:&stru_2C7F0];
    }
    [v12 commit];

    int v19 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }
LABEL_8:

  return v19;
}

- (int)detectionWithReflectedLuma:(id)a3 croppedLuma:(id)a4 chroma:(id)a5 outputMask:(id)a6 params:(DetectionTuning *)a7 processingROIInfo:(ProcessingROIInfo *)a8 inputIsHDR:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v47 = 0;
  id v46 = 0;
  int v19 = [(FigMetalContext *)self->_metal allocator];
  id v20 = [v19 newTextureDescriptor];

  unsigned int v41 = v15;
  if (!v20) {
    goto LABEL_13;
  }
  id v21 = [v20 desc];
  [v21 setCompressionMode:2];

  id v22 = [v20 desc];
  [v22 setCompressionFootprint:0];

  id v23 = [v20 desc];
  [v23 setUsage:7];

  id v24 = [v18 pixelFormat];
  id v25 = [v20 desc];
  [v25 setPixelFormat:v24];

  id v26 = [v18 width];
  v27 = [v20 desc];
  [v27 setWidth:v26];

  id v28 = [v18 height];
  id v29 = [v20 desc];
  [v29 setHeight:v28];

  [v20 setLabel:0];
  id v30 = [(FigMetalContext *)self->_metal allocator];
  id v31 = [v30 newTextureWithDescriptor:v20];
  id v47 = v31;

  if (!v31) {
    goto LABEL_13;
  }
  long long v42 = *(_OWORD *)&a7->brightParams.threshold;
  *(void *)&long long v43 = *(void *)&a7->var1;
  unsigned int v32 = [(CMIVideoDeghostingBrightLightCommonV1 *)self brightnessDetectionInputReflectedLuma:v15 output:v31 params:&v42 processingROIInfo:a8];
  if (v32)
  {
    int v39 = v32;
    goto LABEL_15;
  }
  [v20 setLabel:0];
  id v33 = [(FigMetalContext *)self->_metal allocator];
  id v34 = [v33 newTextureWithDescriptor:v20];
  id v46 = v34;

  if (!v34)
  {
LABEL_13:
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v35 = 24;
  if (a9) {
    uint64_t v35 = 56;
  }
  unint64_t v36 = (long long *)((char *)a7 + v35);
  long long v37 = v36[1];
  long long v44 = *v36;
  long long v45 = v37;
  long long v42 = v44;
  long long v43 = v37;
  unsigned int v38 = -[CMIVideoDeghostingBrightLightCommonV1 greenDetectionLuma:chroma:output:params:processingROIInfo:inputIsHDR:](self, "greenDetectionLuma:chroma:output:params:processingROIInfo:inputIsHDR:", v16, v17, v34, &v42, a8);
  if (v38)
  {
    int v39 = v38;
    goto LABEL_15;
  }
  int v39 = [(CMIVideoDeghostingBrightLightCommonV1 *)self combineBrightnessMask:v31 greenMask:v34 output:v18];
  if (v39) {
LABEL_15:
  }
    FigDebugAssert3();
LABEL_9:
  FigMetalDecRef();
  FigMetalDecRef();

  return v39;
}

- (void).cxx_destruct
{
  for (uint64_t i = 96; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end