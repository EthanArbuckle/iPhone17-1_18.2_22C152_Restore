@interface DeepFusionGaussianPyramid
- (DeepFusionGaussianPyramid)initWithMetalContext:(id)a3 withFilter:(int)a4;
- (int)_performGaussianPyramid:(id)a3 inputTex:(id)a4 textureArray:(id)a5;
- (int)_validateInputs:(id)a3 inTex:(id)a4;
- (int)computeUsing:(id)a3 inTex:(id)a4;
@end

@implementation DeepFusionGaussianPyramid

- (DeepFusionGaussianPyramid)initWithMetalContext:(id)a3 withFilter:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DeepFusionGaussianPyramid;
  result = [(DeepFusionPyramidBaseClass *)&v6 initWithMetalContext:a3];
  if (result) {
    result->_filter = a4;
  }
  return result;
}

- (int)_performGaussianPyramid:(id)a3 inputTex:(id)a4 textureArray:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(FigMetalContext *)self->super._metal allocator];
  v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_28;
  }
  unint64_t pixelFormat = self->super._pixelFormat;
  v13 = [v11 desc];
  [v13 setPixelFormat:pixelFormat];

  v14 = [v11 desc];
  [v14 setUsage:7];

  v15 = [v11 desc];
  [v15 setCompressionMode:2];

  v16 = [v11 desc];
  [v16 setCompressionFootprint:0];

  id v17 = [v9 objectAtIndexedSubscript:0];

  if (v17 == v8) {
    goto LABEL_5;
  }
  uint64_t v18 = [v41 blitCommandEncoder];
  if (!v18)
  {
LABEL_28:
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    goto LABEL_26;
  }
  v19 = (void *)v18;
  memset(v48, 0, sizeof(v48));
  v47[0] = [v8 width];
  v47[1] = [v8 height];
  v47[2] = 1;
  v20 = [v9 objectAtIndexedSubscript:0];
  memset(v46, 0, sizeof(v46));
  [v19 copyFromTexture:v8 sourceSlice:0 sourceLevel:0 sourceOrigin:v48 sourceSize:v47 toTexture:v20 destinationSlice:0 destinationLevel:0 destinationOrigin:v46];

  [v19 endEncoding];
LABEL_5:
  int filter = self->_filter;
  if (!filter)
  {
    uint64_t v30 = 8;
    goto LABEL_14;
  }
  if (filter != 1)
  {
    uint64_t v30 = 16;
LABEL_14:
    id v23 = *(id *)((char *)&self->super._shaders->super.isa + v30);
    float v31 = 0.5;
    if (!self->_filter) {
      float v31 = 1.0;
    }
    *(float *)v49 = v31;
    *(float *)&v49[1] = v31;
    if (self->super._numLevels < 2)
    {
      int v29 = 0;
    }
    else
    {
      id v40 = v8;
      uint64_t v32 = 1;
      while (1)
      {
        v33 = [v9 objectAtIndexedSubscript:v32 - 1];
        v34 = [v9 objectAtIndexedSubscript:v32];
        v35 = [v41 computeCommandEncoder];
        if (!v35) {
          break;
        }
        v36 = v35;
        [v35 insertCompressedTextureReinterpretationFlush];
        [v36 setComputePipelineState:v23];
        [v36 setTexture:v33 atIndex:0];
        [v36 setTexture:v34 atIndex:1];
        if (!self->_filter) {
          [v36 setBytes:v49 length:8 atIndex:0];
        }
        uint64_t v37 = [v34 width];
        uint64_t v38 = [v34 height];
        v42[0] = v37;
        v42[1] = v38;
        v42[2] = 1;
        long long v43 = xmmword_263380150;
        uint64_t v44 = 1;
        [v36 dispatchThreads:v42 threadsPerThreadgroup:&v43];
        [v36 endEncoding];

        if (++v32 >= self->super._numLevels)
        {
          int v29 = 0;
          goto LABEL_23;
        }
      }
      FigDebugAssert3();
      int v29 = FigSignalErrorAt();

LABEL_23:
      id v8 = v40;
    }
    goto LABEL_25;
  }
  v22 = [v41 computeCommandEncoder];
  id v23 = v22;
  if (v22)
  {
    [v22 setComputePipelineState:self->super._shaders->_krnGaussianPyramid5_16x18];
    [v23 setImageblockWidth:16 height:16];
    if (self->super._numLevels >= 2)
    {
      unint64_t v24 = 1;
      do
      {
        v25 = [v9 objectAtIndexedSubscript:v24 - 1];
        v26 = [v9 objectAtIndexedSubscript:v24];
        [v23 setTexture:v25 atIndex:0];
        [v23 setTexture:v26 atIndex:1];
        unint64_t v27 = (unint64_t)([v26 width] + 15) >> 4;
        uint64_t v28 = [v26 height];
        v45[0] = v27;
        v45[1] = (unint64_t)(v28 + 15) >> 4;
        v45[2] = 1;
        long long v43 = xmmword_263480620;
        uint64_t v44 = 1;
        [v23 dispatchThreadgroups:v45 threadsPerThreadgroup:&v43];

        ++v24;
      }
      while (v24 < self->super._numLevels);
    }
    [v23 endEncoding];
    int v29 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
  }
LABEL_25:

LABEL_26:
  return v29;
}

- (int)_validateInputs:(id)a3 inTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_10;
  }
  outputTextures = self->super._outputTextures;
  if (!outputTextures) {
    goto LABEL_10;
  }
  id v9 = [(NSMutableArray *)outputTextures objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 width];
  uint64_t v11 = [v7 width];

  if (v10 != v11) {
    goto LABEL_10;
  }
  v12 = [(NSMutableArray *)self->super._outputTextures objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 height];
  uint64_t v14 = [v7 height];

  if (v13 == v14
    && [(NSMutableArray *)self->super._outputTextures count] == self->super._numLevels
    && self->super._shaders)
  {
    int v15 = 0;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
  }

  return v15;
}

- (int)computeUsing:(id)a3 inTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DeepFusionGaussianPyramid *)self _validateInputs:v6 inTex:v7]
    || (int v8 = [(DeepFusionGaussianPyramid *)self _performGaussianPyramid:v6 inputTex:v7 textureArray:self->super._outputTextures]) != 0)
  {
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

@end