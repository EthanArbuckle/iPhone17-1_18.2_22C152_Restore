@interface DeepFusionLaplacianPyramid
- (DeepFusionLaplacianPyramid)initWithMetalContext:(id)a3;
- (int)_performLaplacianPyramid:(id)a3 inputTextures:(id)a4 destinationTextures:(id)a5 upsamplingFilter:(int)a6;
- (int)_validateInputs:(id)a3 gaussianPyramid:(id)a4;
- (int)computeUsing:(id)a3 gaussianPyramid:(id)a4 upsamplingFilter:(int)a5;
- (int)upsampleUsing:(id)a3 inputTex:(id)a4 outputTexUpsampled:(id)a5 upsamplingFilter:(int)a6;
@end

@implementation DeepFusionLaplacianPyramid

- (DeepFusionLaplacianPyramid)initWithMetalContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DeepFusionLaplacianPyramid;
  return [(DeepFusionPyramidBaseClass *)&v4 initWithMetalContext:a3];
}

- (int)upsampleUsing:(id)a3 inputTex:(id)a4 outputTexUpsampled:(id)a5 upsamplingFilter:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == 1)
  {
    uint64_t v13 = [v11 width];
    if ([v12 width] != 2 * v13
      || (uint64_t v14 = [v11 height], objc_msgSend(v12, "height") != 2 * v14)
      || ([v10 computeCommandEncoder], (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      FigDebugAssert3();
      int v17 = FigSignalErrorAt();
      goto LABEL_7;
    }
    v16 = v15;
    [v15 setImageblockWidth:32 height:32];
    [v16 setComputePipelineState:self->super._shaders->_krnLaplacianGaussian];
    [v16 setTexture:v11 atIndex:0];
    [v16 setTexture:v12 atIndex:1];
    v21[0] = (unint64_t)([v11 width] + 15) >> 4;
    v21[1] = (unint64_t)([v11 height] + 15) >> 4;
    v21[2] = 1;
    long long v19 = xmmword_263380250;
    uint64_t v20 = 1;
    [v16 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
    [v16 endEncoding];
  }
  else
  {
    FigDebugAssert3();
  }
  int v17 = 0;
LABEL_7:

  return v17;
}

- (int)_performLaplacianPyramid:(id)a3 inputTextures:(id)a4 destinationTextures:(id)a5 upsamplingFilter:(int)a6
{
  id v31 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6 == 1)
  {
    unint64_t v12 = 0;
    int v29 = 0;
    do
    {
      if (v12 >= self->super._numLevels) {
        break;
      }
      uint64_t v13 = [v10 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v10 objectAtIndexedSubscript:v12 + 1];
      v15 = [v11 objectAtIndexedSubscript:v12];
      v16 = [v31 computeCommandEncoder];
      int v17 = v16;
      if (v16)
      {
        [v16 setImageblockWidth:32 height:32];
        [v17 setComputePipelineState:self->super._shaders->_krnLaplacianGaussianLap];
        [v17 setTexture:v13 atIndex:0];
        [v17 setTexture:v14 atIndex:1];
        [v17 setTexture:v15 atIndex:2];
        unint64_t v18 = (unint64_t)([v14 width] + 15) >> 4;
        uint64_t v19 = [v14 height];
        v37[0] = v18;
        v37[1] = (unint64_t)(v19 + 15) >> 4;
        v37[2] = 1;
        long long v35 = xmmword_263380250;
        uint64_t v36 = 1;
        [v17 dispatchThreadgroups:v37 threadsPerThreadgroup:&v35];
        [v17 endEncoding];
      }
      else
      {
        FigDebugAssert3();
        int v29 = FigSignalErrorAt();
      }

      ++v12;
    }
    while (v17);
  }
  else
  {
    v30 = self->super._shaders->_krnLaplacianPyramidSubtractionPass;
    unint64_t v20 = 0;
    int v29 = 0;
    do
    {
      if (v20 >= self->super._numLevels) {
        break;
      }
      v21 = [v10 objectAtIndexedSubscript:v20];
      v22 = [v10 objectAtIndexedSubscript:v20 + 1];
      v23 = [v11 objectAtIndexedSubscript:v20];
      v24 = [v31 computeCommandEncoder];
      v25 = v24;
      if (v24)
      {
        [v24 insertCompressedTextureReinterpretationFlush];
        [v25 setComputePipelineState:v30];
        [v25 setTexture:v21 atIndex:0];
        [v25 setTexture:v22 atIndex:1];
        [v25 setTexture:v23 atIndex:2];
        uint64_t v26 = [v21 width];
        uint64_t v27 = [v21 height];
        v34[0] = v26;
        v34[1] = v27;
        v34[2] = 1;
        long long v32 = xmmword_263380150;
        uint64_t v33 = 1;
        [v25 dispatchThreads:v34 threadsPerThreadgroup:&v32];
        [v25 endEncoding];
      }
      else
      {
        FigDebugAssert3();
        int v29 = FigSignalErrorAt();
      }

      ++v20;
    }
    while (v25);
  }
  return v29;
}

- (int)_validateInputs:(id)a3 gaussianPyramid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6) {
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_12;
  }
  outputTextures = self->super._outputTextures;
  if (!outputTextures) {
    goto LABEL_12;
  }
  if ([(NSMutableArray *)outputTextures count] != self->super._numLevels) {
    goto LABEL_12;
  }
  id v10 = [v8 outputTextureArray];

  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = [(NSMutableArray *)self->super._outputTextures count] + 1;
  unint64_t v12 = [v8 outputTextureArray];
  uint64_t v13 = [v12 count];

  if (v11 != v13) {
    goto LABEL_12;
  }
  uint64_t v14 = [(NSMutableArray *)self->super._outputTextures objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 width];
  v16 = [v8 outputTextureArray];
  int v17 = [v16 objectAtIndexedSubscript:0];
  uint64_t v18 = [v17 width];

  if (v15 != v18) {
    goto LABEL_12;
  }
  uint64_t v19 = [(NSMutableArray *)self->super._outputTextures objectAtIndexedSubscript:0];
  uint64_t v20 = [v19 height];
  v21 = [v8 outputTextureArray];
  v22 = [v21 objectAtIndexedSubscript:0];
  uint64_t v23 = [v22 height];

  if (v20 != v23) {
    goto LABEL_12;
  }
  if (self->super._shaders)
  {
    int v24 = 0;
  }
  else
  {
LABEL_12:
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
  }

  return v24;
}

- (int)computeUsing:(id)a3 gaussianPyramid:(id)a4 upsamplingFilter:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if ([(DeepFusionLaplacianPyramid *)self _validateInputs:v8 gaussianPyramid:v9]
    || ([v9 outputTextureArray],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(DeepFusionLaplacianPyramid *)self _performLaplacianPyramid:v8 inputTextures:v10 destinationTextures:self->super._outputTextures upsamplingFilter:v5], v10, v11))
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }

  return v11;
}

@end