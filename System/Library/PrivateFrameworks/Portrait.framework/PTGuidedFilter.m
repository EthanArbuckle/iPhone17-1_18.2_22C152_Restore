@interface PTGuidedFilter
- (PTGuidedFilter)initWithMetalContext:(id)a3 inputSize:(id *)a4 epsilon:(float)a5;
- (int)guidedFilter:(id)a3 filterMode:(int)a4 image:(id)a5 guideRGBACoefficients:(id)a6 guideRGBAUpscale:(id)a7 upscaledImageArray:(id)a8 sourceColorBitDepth:(int)a9 postModifierBuffer:(id)a10 postModifierPtr:(PTPostModifier *)a11;
- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImage:(id)a7 sourceColorBitDepth:(int)a8 postModifierPtr:(PTPostModifier *)a9;
- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImageArray:(id)a7 sourceColorBitDepth:(int)a8 postModifierBuffer:(id)a9;
- (void)applyUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 coeffTexture:(id)a5 upscaledImageArray:(id)a6 guideMultiplier:(float)a7 postModifierBuffer:(id)a8 postModifierPtr:(PTPostModifier *)a9 filterMode:(int)a10;
- (void)averageUpsamplingCoefficients:(id)a3 coeffTexture:(id)a4 coeffAveragedTexture:(id)a5;
- (void)computeUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 imageTexture:(id)a5 coeffTexture:(id)a6 weights:(id)a7 guideMultiplier:(float)a8;
@end

@implementation PTGuidedFilter

- (PTGuidedFilter)initWithMetalContext:(id)a3 inputSize:(id *)a4 epsilon:(float)a5
{
  id v8 = a3;
  v99.receiver = self;
  v99.super_class = (Class)PTGuidedFilter;
  v9 = [(PTGuidedFilter *)&v99 init];
  v10 = v9;
  if (!v9)
  {
    v30 = 0;
    goto LABEL_33;
  }
  int v97 = 1;
  int v98 = 0;
  char v96 = 0;
  v9->_edgeTolerance = 1.0;
  *(_WORD *)&v9->_useHighresGuideForComputingCoefficients = 0;
  v11 = objc_opt_new();
  *(float *)&double v12 = a5;
  [v11 setConstantFloat:@"kFilterEpsilon_float" withName:v12];
  LODWORD(v13) = 981668463;
  [v11 setConstantFloat:@"kFilterWeightEpsilon_float" withName:v13];
  [v11 setConstantValue:&v97 type:29 withName:@"kFilterRadius"];
  [v11 setConstantValue:&v98 type:29 withName:@"kFilterSamplePattern"];
  [v11 setConstantValue:&v96 type:53 withName:@"kFilterSqrtGuide"];
  uint64_t v14 = [v8 computePipelineStateFor:@"guidedFilterAverageUpsamplingCoefficients" withConstants:v11];
  averageUpsamplingCoefficients = v10->_averageUpsamplingCoefficients;
  v10->_averageUpsamplingCoefficients = (MTLComputePipelineState *)v14;

  if (v10->_averageUpsamplingCoefficients)
  {
    BOOL v16 = (v98 - 5) >= 5;
    v10->_useWeightedSampling = (v98 - 5) < 5;
    if (v16)
    {
      uint64_t v38 = [v8 computePipelineStateFor:@"guidedFilterComputeUpsamplingCoefficients" withConstants:v11];
      computeUpsamplingCoefficients = v10->_computeUpsamplingCoefficients;
      v10->_computeUpsamplingCoefficients = (MTLComputePipelineState *)v38;

      if (v10->_computeUpsamplingCoefficients) {
        goto LABEL_12;
      }
      v22 = _PTLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.8(v22, v66, v67, v68, v69, v70, v71, v72);
      }
    }
    else
    {
      uint64_t v17 = [v8 computePipelineStateFor:@"computeWeightedUpsamplingCoefficients" withConstants:v11];
      computeWeightedUpsamplingCoefficients = v10->_computeWeightedUpsamplingCoefficients;
      v10->_computeWeightedUpsamplingCoefficients = (MTLComputePipelineState *)v17;

      if (v10->_computeWeightedUpsamplingCoefficients)
      {
        v19 = [v8 textureUtil];
        uint64_t v20 = [v19 createWithWidth:a4->var0 height:a4->var1 pixelFormat:10];
        edges = v10->_edges;
        v10->_edges = (MTLTexture *)v20;

        if (!v10->_edges)
        {
          v22 = _PTLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v22, v23, v24, v25, v26, v27, v28, v29);
          }
          goto LABEL_31;
        }
LABEL_12:
        int v95 = 0;
        applyUpsamplingCoefficients = v10->_applyUpsamplingCoefficients;
        do
        {
          [v11 setConstantValue:&v95 type:33 withName:@"kFilterMode"];
          uint64_t v41 = [v8 computePipelineStateFor:@"guidedFilterApplyUpsamplingCoefficients" withConstants:v11];
          v42 = applyUpsamplingCoefficients[v95];
          applyUpsamplingCoefficients[v95] = (MTLComputePipelineState *)v41;

          int v43 = v95;
          if (!applyUpsamplingCoefficients[v95])
          {
            v22 = _PTLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.4(v22, v52, v53, v54, v55, v56, v57, v58);
            }
            goto LABEL_31;
          }
          ++v95;
        }
        while ((v43 + 1) <= 2);
        v44 = [v8 textureUtil];
        uint64_t v45 = [v44 createWithWidth:a4->var0 height:a4->var1 pixelFormat:115];
        coeffTexture = v10->_coeffTexture;
        v10->_coeffTexture = (MTLTexture *)v45;

        if (v10->_coeffTexture)
        {
          v47 = [v8 textureUtil];
          uint64_t v48 = [v47 createWithWidth:a4->var0 height:a4->var1 pixelFormat:115];
          coeffAveragedTexture = v10->_coeffAveragedTexture;
          v10->_coeffAveragedTexture = (MTLTexture *)v48;

          if (v10->_coeffAveragedTexture)
          {
            v50 = [[PTRaytracingUtils alloc] initWithMetalContext:v8];
            utils = v10->_utils;
            v10->_utils = v50;

            if (v10->_utils)
            {
              v30 = v10;
              goto LABEL_32;
            }
            v22 = _PTLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.7(v22, v87, v88, v89, v90, v91, v92, v93);
            }
          }
          else
          {
            v22 = _PTLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.6(v22, v80, v81, v82, v83, v84, v85, v86);
            }
          }
        }
        else
        {
          v22 = _PTLogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:].cold.5(v22, v73, v74, v75, v76, v77, v78, v79);
          }
        }
        goto LABEL_31;
      }
      v22 = _PTLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v22, v59, v60, v61, v62, v63, v64, v65);
      }
    }
  }
  else
  {
    v22 = _PTLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v22, v31, v32, v33, v34, v35, v36, v37);
    }
  }
LABEL_31:

  v30 = 0;
LABEL_32:

LABEL_33:
  return v30;
}

- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImage:(id)a7 sourceColorBitDepth:(int)a8 postModifierPtr:(PTPostModifier *)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v25[0] = a7;
  v15 = (void *)MEMORY[0x1E4F1C978];
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v15 arrayWithObjects:v25 count:1];

  LODWORD(v24) = a8;
  int v22 = [(PTGuidedFilter *)self guidedFilter:v20 filterMode:a9 != 0 image:v19 guideRGBACoefficients:v18 guideRGBAUpscale:v17 upscaledImageArray:v21 sourceColorBitDepth:v24 postModifierBuffer:0 postModifierPtr:a9];

  return v22;
}

- (int)guidedFilter:(id)a3 image:(id)a4 guideRGBACoefficients:(id)a5 guideRGBAUpscale:(id)a6 upscaledImageArray:(id)a7 sourceColorBitDepth:(int)a8 postModifierBuffer:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v21 = [v19 count];
  if (v20 || v21 != 1)
  {
    if (v20 && (unint64_t)[v19 count] <= 2)
    {
      uint64_t v24 = 3 * [v19 count];
      if ([v20 length] >= (unint64_t)(4 * v24))
      {
        if ([v19 count] == 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2;
        }
        goto LABEL_4;
      }
      uint64_t v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:](v20, 4 * v24, v25);
      }
    }
    else
    {
      uint64_t v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:](v19, v25);
      }
    }

    int v23 = -10;
    goto LABEL_13;
  }
  uint64_t v22 = 0;
LABEL_4:
  LODWORD(v27) = a8;
  int v23 = [(PTGuidedFilter *)self guidedFilter:v15 filterMode:v22 image:v16 guideRGBACoefficients:v17 guideRGBAUpscale:v18 upscaledImageArray:v19 sourceColorBitDepth:v27 postModifierBuffer:v20 postModifierPtr:0];
LABEL_13:

  return v23;
}

- (int)guidedFilter:(id)a3 filterMode:(int)a4 image:(id)a5 guideRGBACoefficients:(id)a6 guideRGBAUpscale:(id)a7 upscaledImageArray:(id)a8 sourceColorBitDepth:(int)a9 postModifierBuffer:(id)a10 postModifierPtr:(PTPostModifier *)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  if (a9 == 8) {
    float v24 = 1.0;
  }
  else {
    float v24 = 0.16667;
  }
  if (self->_useWeightedSampling)
  {
    *(float *)&double v23 = self->_edgeTolerance;
    [(PTRaytracingUtils *)self->_utils sobelEdgeDetection:v17 inImage:v18 outEdges:self->_edges edgeTolerance:v23];
  }
  if (self->_useHighresGuideForComputingCoefficients) {
    id v25 = v20;
  }
  else {
    id v25 = v19;
  }
  *(float *)&double v23 = v24;
  [(PTGuidedFilter *)self computeUpsamplingCoefficients:v17 guideTexture:v25 imageTexture:v18 coeffTexture:self->_coeffTexture weights:self->_edges guideMultiplier:v23];
  if (self->_skipBoxFilter)
  {
    BOOL v27 = 0;
  }
  else
  {
    [(PTGuidedFilter *)self averageUpsamplingCoefficients:v17 coeffTexture:self->_coeffTexture coeffAveragedTexture:self->_coeffAveragedTexture];
    BOOL v27 = !self->_skipBoxFilter;
  }
  BOOL v28 = !v27;
  uint64_t v29 = 56;
  if (!v28) {
    uint64_t v29 = 72;
  }
  LODWORD(v31) = a4;
  *(float *)&double v26 = v24;
  [(PTGuidedFilter *)self applyUpsamplingCoefficients:v17 guideTexture:v20 coeffTexture:*(Class *)((char *)&self->super.isa + v29) upscaledImageArray:v21 guideMultiplier:v22 postModifierBuffer:a11 postModifierPtr:v26 filterMode:v31];

  return 0;
}

- (void)computeUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 imageTexture:(id)a5 coeffTexture:(id)a6 weights:(id)a7 guideMultiplier:(float)a8
{
  id v14 = a6;
  id v15 = a7;
  float v31 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a3 computeCommandEncoder];
  if (!v18)
  {
    id v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  uint64_t v27 = 8;
  if (!self->_useWeightedSampling) {
    uint64_t v27 = 16;
  }
  [v18 setComputePipelineState:*(Class *)((char *)&self->super.isa + v27)];
  [v18 setTexture:v17 atIndex:0];

  [v18 setTexture:v16 atIndex:1];
  [v18 setTexture:v14 atIndex:2];
  if (self->_useWeightedSampling) {
    [v18 setTexture:v15 atIndex:3];
  }
  [v18 setBytes:&v31 length:4 atIndex:0];
  v30[0] = [v14 width];
  v30[1] = [v14 height];
  v30[2] = 1;
  long long v28 = xmmword_1D081F8F0;
  uint64_t v29 = 1;
  [v18 dispatchThreads:v30 threadsPerThreadgroup:&v28];
  [v18 endEncoding];
}

- (void)averageUpsamplingCoefficients:(id)a3 coeffTexture:(id)a4 coeffAveragedTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
  if (!v10)
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  [v10 setComputePipelineState:self->_averageUpsamplingCoefficients];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  uint64_t v19 = [v8 width];
  uint64_t v20 = [v8 height];

  v23[0] = v19;
  v23[1] = v20;
  v23[2] = 1;
  long long v21 = xmmword_1D081F8F0;
  uint64_t v22 = 1;
  [v10 dispatchThreads:v23 threadsPerThreadgroup:&v21];
  [v10 endEncoding];
}

- (void)applyUpsamplingCoefficients:(id)a3 guideTexture:(id)a4 coeffTexture:(id)a5 upscaledImageArray:(id)a6 guideMultiplier:(float)a7 postModifierBuffer:(id)a8 postModifierPtr:(PTPostModifier *)a9 filterMode:(int)a10
{
  id v17 = a6;
  float v38 = a7;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  long long v21 = [a3 computeCommandEncoder];
  if (!v21)
  {
    uint64_t v22 = _PTLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  [v21 setComputePipelineState:self->_applyUpsamplingCoefficients[a10]];
  [v21 setTexture:v20 atIndex:0];

  [v21 setTexture:v19 atIndex:1];
  v30 = [v17 objectAtIndexedSubscript:0];
  [v21 setTexture:v30 atIndex:2];

  if ([v17 count] == 2)
  {
    float v31 = [v17 objectAtIndexedSubscript:1];
    [v21 setTexture:v31 atIndex:3];
  }
  [v21 setBytes:&v38 length:4 atIndex:0];
  if (v18)
  {
    [v21 setBuffer:v18 offset:0 atIndex:1];
  }
  else if (a9)
  {
    [v21 setBytes:a9 length:12 atIndex:1];
  }
  uint64_t v32 = [v17 objectAtIndexedSubscript:0];
  uint64_t v33 = [v32 width];
  uint64_t v34 = [v17 objectAtIndexedSubscript:0];
  v37[0] = v33;
  v37[1] = [v34 height];
  v37[2] = 1;
  long long v35 = xmmword_1D081F8F0;
  uint64_t v36 = 1;
  [v21 dispatchThreads:v37 threadsPerThreadgroup:&v35];

  [v21 endEncoding];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_coeffAveragedTexture, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_coeffTexture, 0);
  for (uint64_t i = 48; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_averageUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_computeUpsamplingCoefficients, 0);

  objc_storeStrong((id *)&self->_computeWeightedUpsamplingCoefficients, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 inputSize:(uint64_t)a4 epsilon:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)guidedFilter:(void *)a1 image:(NSObject *)a2 guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = 3;
  __int16 v4 = 2048;
  uint64_t v5 = [a1 count];
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "upscaledImageArray.count must be less than %i. Was %lu", (uint8_t *)v3, 0x12u);
}

- (void)guidedFilter:(NSObject *)a3 image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 length];
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "postModifierBuffer.length expected %zu but was %zu", (uint8_t *)&v4, 0x16u);
}

@end