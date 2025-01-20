@interface PTPyramid
- (BOOL)bicubic;
- (MTLTexture)mipmapTexture;
- (NSArray)mipmapLevels;
- (PTPyramid)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 pixelFormat:(unint64_t)a5 skipFullSizeLayer:(BOOL)a6 doFirstLevelGaussianDownsample:(BOOL)a7 mipmapLevelCount:(int)a8;
- (id)findMipmapLevelLargerThan:(id *)a3;
- (id)findMipmapLevelLargerThan:(id *)a3 fromLevel:(int)a4;
- (int)updateLevel0FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5;
- (int)updateLevel0FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5;
- (int)updateLevel0and1FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4;
- (int)updateLevel0and1FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4;
- (int)updatePyramid:(id)a3 offset:(int)a4;
- (int)updatePyramid:(id)a3 offset:(int)a4 samplingRadius:(float)a5;
- (int)updatePyramidFromPTTexture:(id)a3 inPTTexture:(id)a4;
- (void)setBicubic:(BOOL)a3;
- (void)setMipmapLevels:(id)a3;
- (void)setMipmapTexture:(id)a3;
@end

@implementation PTPyramid

- (PTPyramid)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 pixelFormat:(unint64_t)a5 skipFullSizeLayer:(BOOL)a6 doFirstLevelGaussianDownsample:(BOOL)a7 mipmapLevelCount:(int)a8
{
  BOOL v10 = a6;
  double height = a4.height;
  double width = a4.width;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v139.receiver = self;
  v139.super_class = (Class)PTPyramid;
  v17 = [(PTPyramid *)&v139 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_29;
  }
  p_metalContext = (id *)&v17->_metalContext;
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v18->_skipFullSizeLayer = v10;
  v18->_doFirstLevelGaussianDownsample = a7;
  v20 = [(PTMetalContext *)v18->_metalContext textureUtil];
  v21 = v20;
  if (v10)
  {
    unint64_t v22 = (unint64_t)((width + 1.0) * 0.5);
    unint64_t v23 = (unint64_t)((height + 1.0) * 0.5);
  }
  else
  {
    unint64_t v22 = (unint64_t)width;
    unint64_t v23 = (unint64_t)height;
  }
  uint64_t v24 = [v20 createWithWidth:v22 height:v23 pixelFormat:a5 mipmapLevelCount:a8];
  mipmapTexture = v18->_mipmapTexture;
  v18->_mipmapTexture = (MTLTexture *)v24;

  if (!v18->_mipmapTexture)
  {
    v46 = _PTLogSystem();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      [(PTPyramid *)v46 initWithMetalContext:v71 colorSize:v72 pixelFormat:v73 skipFullSizeLayer:v74 doFirstLevelGaussianDownsample:v75 mipmapLevelCount:v76];
    }
    goto LABEL_50;
  }
  v26 = [(PTMetalContext *)v18->_metalContext textureUtil];
  uint64_t v27 = [v26 mipmapLevelsUsingTextureView:v18->_mipmapTexture];
  mipmapLevels = v18->_mipmapLevels;
  v18->_mipmapLevels = (NSArray *)v27;

  if (!v18->_mipmapLevels)
  {
    v46 = _PTLogSystem();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      [(PTPyramid *)v46 initWithMetalContext:v78 colorSize:v79 pixelFormat:v80 skipFullSizeLayer:v81 doFirstLevelGaussianDownsample:v82 mipmapLevelCount:v83];
    }
LABEL_50:

    v69 = 0;
    goto LABEL_51;
  }
  float v29 = 0.0;
  uint64_t v30 = -1;
  v31 = v140;
  do
  {
    uint64_t v32 = 0;
    int v33 = -1;
    do
    {
      float v34 = pow(2.71828183, (float)((float)((float)((float)v33 * (float)v33) + (float)((float)(int)v30 * (float)(int)v30)) * -0.5))* 0.159154943;
      float v29 = v29 + v34;
      *(float *)&v31[v32] = v34;
      v32 += 3;
      ++v33;
    }
    while (v32 != 9);
    ++v30;
    ++v31;
  }
  while (v30 != 2);
  for (uint64_t i = 0; i != 9; ++i)
    *(float *)&v140[i] = *(float *)&v140[i] / v29;
  _S0 = v140[0];
  _S1 = v140[1];
  __asm { FCVT            H0, S0 }
  v138[0] = _S0;
  __asm { FCVT            H0, S1 }
  v138[1] = _S0;
  _S0 = v140[2];
  _S1 = v140[3];
  __asm { FCVT            H0, S0 }
  v138[2] = _S0;
  __asm { FCVT            H0, S1 }
  v137[0] = _S0;
  _S0 = v140[4];
  _S1 = v140[5];
  __asm { FCVT            H0, S0 }
  v137[1] = _S0;
  __asm { FCVT            H0, S1 }
  v137[2] = _S0;
  v46 = objc_opt_new();
  [v46 setConstantHalf3:v138 withName:@"kWeights2DRow0_half3"];
  [v46 setConstantHalf3:v137 withName:@"kWeights2DRow1_half3"];
  uint64_t v47 = [(PTMetalContext *)v18->_metalContext computePipelineStateFor:@"downscaleGaussian3x3" withConstants:v46];
  downscaleGaussian3x3 = v18->_downscaleGaussian3x3;
  v18->_downscaleGaussian3x3 = (MTLComputePipelineState *)v47;

  if (!v18->_downscaleGaussian3x3)
  {
    v84 = _PTLogSystem();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      [(PTPyramid *)v84 initWithMetalContext:v86 colorSize:v87 pixelFormat:v88 skipFullSizeLayer:v89 doFirstLevelGaussianDownsample:v90 mipmapLevelCount:v91];
    }
LABEL_49:

    goto LABEL_50;
  }
  id v135 = v16;
  uint64_t v49 = 0;
  updateLevel0Box2x2FromRGBA = v18->_updateLevel0Box2x2FromRGBA;
  updateLevel0Box2x2FromYUV = v18->_updateLevel0Box2x2FromYUV;
  updateLevel0Gaussian3x3FromRGBA = v18->_updateLevel0Gaussian3x3FromRGBA;
  updateLevel0Gaussian3x3FromYUV = v18->_updateLevel0Gaussian3x3FromYUV;
  updateLevel0and1Gaussian3x3FromRGBA = v18->_updateLevel0and1Gaussian3x3FromRGBA;
  updateLevel0and1Gaussian3x3FromYUV = v18->_updateLevel0and1Gaussian3x3FromYUV;
  do
  {
    unsigned int v136 = supportedColorTransferFunctions_1[v49];
    [v46 setConstantValue:&v136 type:29 withName:@"kColorTransferFunctionToLinear"];
    uint64_t v56 = [*p_metalContext computePipelineStateFor:@"updateLevel0Box2x2FromRGBA" withConstants:v46];
    v57 = updateLevel0Box2x2FromRGBA[v136];
    updateLevel0Box2x2FromRGBA[v136] = (MTLComputePipelineState *)v56;

    if (!updateLevel0Box2x2FromRGBA[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v93 colorSize:v94 pixelFormat:v95 skipFullSizeLayer:v96 doFirstLevelGaussianDownsample:v97 mipmapLevelCount:v98];
      }
      goto LABEL_48;
    }
    uint64_t v58 = [*p_metalContext computePipelineStateFor:@"updateLevel0Box2x2FromYUV" withConstants:v46];
    v59 = updateLevel0Box2x2FromYUV[v136];
    updateLevel0Box2x2FromYUV[v136] = (MTLComputePipelineState *)v58;

    if (!updateLevel0Box2x2FromYUV[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v100 colorSize:v101 pixelFormat:v102 skipFullSizeLayer:v103 doFirstLevelGaussianDownsample:v104 mipmapLevelCount:v105];
      }
      goto LABEL_48;
    }
    uint64_t v60 = [*p_metalContext computePipelineStateFor:@"updateLevel0Gaussian3x3FromRGBA" withConstants:v46];
    v61 = updateLevel0Gaussian3x3FromRGBA[v136];
    updateLevel0Gaussian3x3FromRGBA[v136] = (MTLComputePipelineState *)v60;

    if (!updateLevel0Gaussian3x3FromRGBA[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v107 colorSize:v108 pixelFormat:v109 skipFullSizeLayer:v110 doFirstLevelGaussianDownsample:v111 mipmapLevelCount:v112];
      }
      goto LABEL_48;
    }
    uint64_t v62 = [*p_metalContext computePipelineStateFor:@"updateLevel0Gaussian3x3FromYUV" withConstants:v46];
    v63 = updateLevel0Gaussian3x3FromYUV[v136];
    updateLevel0Gaussian3x3FromYUV[v136] = (MTLComputePipelineState *)v62;

    if (!updateLevel0Gaussian3x3FromYUV[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v114 colorSize:v115 pixelFormat:v116 skipFullSizeLayer:v117 doFirstLevelGaussianDownsample:v118 mipmapLevelCount:v119];
      }
      goto LABEL_48;
    }
    uint64_t v64 = [*p_metalContext computePipelineStateFor:@"updateLevel0and1Gaussian3x3FromRGBA" withConstants:v46];
    v65 = updateLevel0and1Gaussian3x3FromRGBA[v136];
    updateLevel0and1Gaussian3x3FromRGBA[v136] = (MTLComputePipelineState *)v64;

    if (!updateLevel0and1Gaussian3x3FromRGBA[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v121 colorSize:v122 pixelFormat:v123 skipFullSizeLayer:v124 doFirstLevelGaussianDownsample:v125 mipmapLevelCount:v126];
      }
      goto LABEL_48;
    }
    uint64_t v66 = [*p_metalContext computePipelineStateFor:@"updateLevel0and1Gaussian3x3FromYUV" withConstants:v46];
    v67 = updateLevel0and1Gaussian3x3FromYUV[v136];
    updateLevel0and1Gaussian3x3FromYUV[v136] = (MTLComputePipelineState *)v66;

    if (!updateLevel0and1Gaussian3x3FromYUV[v136])
    {
      v84 = _PTLogSystem();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        [(PTPyramid *)v84 initWithMetalContext:v128 colorSize:v129 pixelFormat:v130 skipFullSizeLayer:v131 doFirstLevelGaussianDownsample:v132 mipmapLevelCount:v133];
      }
LABEL_48:
      id v16 = v135;
      goto LABEL_49;
    }
    ++v49;
  }
  while (v49 != 5);
  id v16 = v135;
  if (!v18->_mipmapTexture || !v18->_mipmapLevels || !v18->_downscaleGaussian3x3)
  {
    v68 = _PTLogSystem();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]0(v68);
    }
  }
LABEL_29:
  v69 = v18;
LABEL_51:

  return v69;
}

- (MTLTexture)mipmapTexture
{
  return self->_mipmapTexture;
}

- (int)updatePyramidFromPTTexture:(id)a3 inPTTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL skipFullSizeLayer = self->_skipFullSizeLayer;
  int v9 = [v7 isRGB];
  if (skipFullSizeLayer)
  {
    BOOL doFirstLevelGaussianDownsample = self->_doFirstLevelGaussianDownsample;
    if (v9) {
      int v11 = [(PTPyramid *)self updateLevel0FromPTTextureRGBA:v6 inPTTextureRGBA:v7 doFirstLevelGaussianDownsample:doFirstLevelGaussianDownsample];
    }
    else {
      int v11 = [(PTPyramid *)self updateLevel0FromPTTextureYUV:v6 inPTTextureYUV:v7 doFirstLevelGaussianDownsample:doFirstLevelGaussianDownsample];
    }
  }
  else if (v9)
  {
    int v11 = [(PTPyramid *)self updateLevel0and1FromPTTextureRGBA:v6 inPTTextureRGBA:v7];
  }
  else
  {
    int v11 = [(PTPyramid *)self updateLevel0and1FromPTTextureYUV:v6 inPTTextureYUV:v7];
  }
  int v12 = v11;
  [(PTPyramid *)self updatePyramid:v6 offset:!self->_skipFullSizeLayer];

  return v12;
}

- (int)updateLevel0FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [v8 transferFunction];
  unsigned int v11 = +[PTColorConversion getTransferFunction:v10 toLinear:1];

  int v12 = [v9 computeCommandEncoder];

  if (!v12)
  {
    v13 = _PTLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  uint64_t v21 = 312;
  if (v5) {
    uint64_t v21 = 24;
  }
  [v12 setComputePipelineState:*(Class *)((char *)&self->super.isa + 8 * v11 + v21)];
  unint64_t v22 = [v8 texRGBA];
  [v12 setTexture:v22 atIndex:0];

  unint64_t v23 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
  [v12 setTexture:v23 atIndex:1];

  unint64_t v24 = (unint64_t)[v8 width] >> 1;
  unint64_t v25 = [v8 height];

  v29[0] = v24;
  v29[1] = v25 >> 1;
  v29[2] = 1;
  int64x2_t v27 = vdupq_n_s64(8uLL);
  uint64_t v28 = 1;
  [v12 dispatchThreads:v29 threadsPerThreadgroup:&v27];
  [v12 endEncoding];

  return 0;
}

- (int)updateLevel0FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4 doFirstLevelGaussianDownsample:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [v8 transferFunction];
  unsigned int v11 = +[PTColorConversion getTransferFunction:v10 toLinear:1];

  memset(v34, 0, sizeof(v34));
  +[PTColorConversion getColorMatrix:v8 toRGB:1];
  int v12 = [v8 texLuma];
  v13 = [v8 texChroma];
  +[PTColorConversion getChromaOffsetFromLuma:v12 texChroma:v13];
  uint64_t v15 = v14;

  uint64_t v33 = v15;
  uint64_t v16 = [v9 computeCommandEncoder];

  if (!v16)
  {
    uint64_t v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  uint64_t v25 = 384;
  if (v5) {
    uint64_t v25 = 96;
  }
  [v16 setComputePipelineState:*(Class *)((char *)&self->super.isa + 8 * v11 + v25)];
  v26 = [v8 texLuma];
  [v16 setTexture:v26 atIndex:0];

  int64x2_t v27 = [v8 texChroma];
  [v16 setTexture:v27 atIndex:1];

  uint64_t v28 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
  [v16 setTexture:v28 atIndex:2];

  [v16 setBytes:v34 length:24 atIndex:0];
  [v16 setBytes:&v33 length:8 atIndex:1];
  v32[0] = (unint64_t)[v8 width] >> 1;
  v32[1] = (unint64_t)[v8 height] >> 1;
  v32[2] = 1;
  int64x2_t v30 = vdupq_n_s64(8uLL);
  uint64_t v31 = 1;
  [v16 dispatchThreads:v32 threadsPerThreadgroup:&v30];
  [v16 endEncoding];

  return 0;
}

- (int)updateLevel0and1FromPTTextureRGBA:(id)a3 inPTTextureRGBA:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 transferFunction];
  int v9 = +[PTColorConversion getTransferFunction:v8 toLinear:1];

  BOOL v10 = [v7 computeCommandEncoder];

  if (!v10)
  {
    unsigned int v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [v10 setComputePipelineState:self->_updateLevel0and1Gaussian3x3FromRGBA[v9]];
  uint64_t v19 = [v6 texRGBA];
  [v10 setTexture:v19 atIndex:0];

  uint64_t v20 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
  [v10 setTexture:v20 atIndex:1];

  uint64_t v21 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:1];
  [v10 setTexture:v21 atIndex:2];

  unint64_t v22 = (unint64_t)[v6 width] >> 1;
  unint64_t v23 = [v6 height];

  v27[0] = v22;
  v27[1] = v23 >> 1;
  v27[2] = 1;
  int64x2_t v25 = vdupq_n_s64(8uLL);
  uint64_t v26 = 1;
  [v10 dispatchThreads:v27 threadsPerThreadgroup:&v25];
  [v10 endEncoding];

  return 0;
}

- (int)updateLevel0and1FromPTTextureYUV:(id)a3 inPTTextureYUV:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 transferFunction];
  int v9 = +[PTColorConversion getTransferFunction:v8 toLinear:1];

  memset(v32, 0, sizeof(v32));
  +[PTColorConversion getColorMatrix:v6 toRGB:1];
  BOOL v10 = [v6 texLuma];
  unsigned int v11 = [v6 texChroma];
  +[PTColorConversion getChromaOffsetFromLuma:v10 texChroma:v11];
  uint64_t v13 = v12;

  uint64_t v31 = v13;
  uint64_t v14 = [v7 computeCommandEncoder];

  if (!v14)
  {
    uint64_t v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  [v14 setComputePipelineState:self->_updateLevel0and1Gaussian3x3FromYUV[v9]];
  unint64_t v23 = [v6 texLuma];
  [v14 setTexture:v23 atIndex:0];

  uint64_t v24 = [v6 texChroma];
  [v14 setTexture:v24 atIndex:1];

  int64x2_t v25 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
  [v14 setTexture:v25 atIndex:2];

  uint64_t v26 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:1];
  [v14 setTexture:v26 atIndex:3];

  [v14 setBytes:v32 length:24 atIndex:0];
  [v14 setBytes:&v31 length:8 atIndex:1];
  v30[0] = (unint64_t)[v6 width] >> 1;
  v30[1] = (unint64_t)[v6 height] >> 1;
  v30[2] = 1;
  int64x2_t v28 = vdupq_n_s64(8uLL);
  uint64_t v29 = 1;
  [v14 dispatchThreads:v30 threadsPerThreadgroup:&v28];
  [v14 endEncoding];

  return 0;
}

- (int)updatePyramid:(id)a3 offset:(int)a4
{
  LODWORD(v4) = 1.0;
  return [(PTPyramid *)self updatePyramid:a3 offset:*(void *)&a4 samplingRadius:v4];
}

- (int)updatePyramid:(id)a3 offset:(int)a4 samplingRadius:(float)a5
{
  id v8 = a3;
  float v31 = a5;
  int v9 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
  if ([v9 pixelFormat] != 70)
  {
    BOOL v10 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
    if ([v10 pixelFormat] == 115)
    {
    }
    else
    {
      unsigned int v11 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 pixelFormat];

      if (v12 == 555) {
        goto LABEL_8;
      }
      int v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PTPyramid updatePyramid:offset:samplingRadius:](v9, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }

LABEL_8:
  uint64_t v20 = [v8 computeCommandEncoder];
  [v20 setComputePipelineState:self->_downscaleGaussian3x3];
  [v20 setBytes:&v31 length:4 atIndex:0];
  LODWORD(v21) = a4 + 1;
  if ([(NSArray *)self->_mipmapLevels count] > (int)v21)
  {
    unint64_t v21 = (int)v21;
    long long v27 = xmmword_1D081FE90;
    do
    {
      uint64_t v22 = -[NSArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", v21 - 1, v27);
      unint64_t v23 = [(NSArray *)self->_mipmapLevels objectAtIndexedSubscript:v21];
      [v20 setTexture:v22 atIndex:0];
      [v20 setTexture:v23 atIndex:1];
      uint64_t v24 = [v23 width];
      uint64_t v25 = [v23 height];
      v30[0] = v24;
      v30[1] = v25;
      v30[2] = 1;
      long long v28 = v27;
      uint64_t v29 = 1;
      [v20 dispatchThreads:v30 threadsPerThreadgroup:&v28];

      ++v21;
    }
    while (v21 < [(NSArray *)self->_mipmapLevels count]);
  }
  [v20 endEncoding];

  return 0;
}

- (id)findMipmapLevelLargerThan:(id *)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  v3 = [(PTPyramid *)self findMipmapLevelLargerThan:&v5 fromLevel:0];

  return v3;
}

- (id)findMipmapLevelLargerThan:(id *)a3 fromLevel:(int)a4
{
  mipmapLevels = self->_mipmapLevels;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = +[PTUtil findMipmapLevel:mipmapLevels largerThan:&v7 fromLevel:*(void *)&a4];

  return v5;
}

- (void)setMipmapTexture:(id)a3
{
}

- (NSArray)mipmapLevels
{
  return self->_mipmapLevels;
}

- (void)setMipmapLevels:(id)a3
{
}

- (BOOL)bicubic
{
  return self->_bicubic;
}

- (void)setBicubic:(BOOL)a3
{
  self->_bicubic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mipmapLevels, 0);
  objc_storeStrong((id *)&self->_mipmapTexture, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_updateLevel0Box2x2FromYUV[i + 8], 0);
  for (uint64_t j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_updateLevel0Box2x2FromRGBA[j + 8], 0);
  for (uint64_t k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_updateLevel0and1Gaussian3x3FromYUV[k + 8], 0);
  for (uint64_t m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_updateLevel0and1Gaussian3x3FromRGBA[m + 8], 0);
  for (uint64_t n = 160; n != 88; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n != 16);
  objc_storeStrong((id *)&self->_downscaleGaussian3x3, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 skipFullSizeLayer:(uint64_t)a6 doFirstLevelGaussianDownsample:(uint64_t)a7 mipmapLevelCount:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(os_log_t)log colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:.cold.10(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "PTPyramidRGB init failed", v1, 2u);
}

- (void)updatePyramid:(uint64_t)a3 offset:(uint64_t)a4 samplingRadius:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end