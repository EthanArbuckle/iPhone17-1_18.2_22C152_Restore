@interface PTSpillCorrection
- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5;
- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5 refinementSteps:(unint64_t)a6 minFilterKernelWidth:(unint64_t)a7 minFilterKernelHeight:(unint64_t)a8 maxFilterKernelWidth:(unint64_t)a9 maxFilterKernelHeight:(unint64_t)a10 gaussianBlurSigma:(float)a11;
- (id)coeffXTexture;
- (id)coeffYTexture;
- (id)coeffZTexture;
- (id)diffusionTexture;
- (id)guideLowRes;
- (id)segmentationLowRes;
- (id)segmentationMax;
- (id)segmentationMin;
- (int)encodeToCommandBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 normChromaOffset:(id)a6 segmentationTexture:;
- (int)encodeToCommandBuffer:(id)a3 rgbTexture:(id)a4 segmentationTexture:(id)a5;
- (int)encodeToCommandBuffer:(id)a3 segmentationTexture:(id)a4;
- (unint64_t)refinementHeight;
- (unint64_t)refinementWidth;
- (void)diffusion:(id)a3;
- (void)initConstraints:(id)a3;
@end

@implementation PTSpillCorrection

- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5
{
  LODWORD(v5) = 2.0;
  return [(PTSpillCorrection *)self initWithMetalContext:a3 refinementWidth:a4 refinementHeight:a5 refinementSteps:2 minFilterKernelWidth:3 minFilterKernelHeight:3 maxFilterKernelWidth:v5 maxFilterKernelHeight:5 gaussianBlurSigma:5];
}

- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5 refinementSteps:(unint64_t)a6 minFilterKernelWidth:(unint64_t)a7 minFilterKernelHeight:(unint64_t)a8 maxFilterKernelWidth:(unint64_t)a9 maxFilterKernelHeight:(unint64_t)a10 gaussianBlurSigma:(float)a11
{
  id v19 = a3;
  v221.receiver = self;
  v221.super_class = (Class)PTSpillCorrection;
  v20 = [(PTSpillCorrection *)&v221 init];
  v21 = v20;
  if (!v20) {
    goto LABEL_63;
  }
  objc_storeStrong((id *)&v20->_metalContext, a3);
  v21->_refinementSteps = a6;
  uint64_t v22 = [v19 computePipelineStateFor:@"PTSpillCorrection_initConstraintsPart1" withConstants:0];
  initConstraintsPart1 = v21->_initConstraintsPart1;
  v21->_initConstraintsPart1 = (MTLComputePipelineState *)v22;

  if (!v21->_initConstraintsPart1)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:](v86, v87, v88, v89, v90, v91, v92, v93);
    }
    goto LABEL_62;
  }
  uint64_t v24 = [v19 computePipelineStateFor:@"PTSpillCorrection_initConstraintsPart2" withConstants:0];
  initConstraintsPart2 = v21->_initConstraintsPart2;
  v21->_initConstraintsPart2 = (MTLComputePipelineState *)v24;

  if (!v21->_initConstraintsPart2)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:](v86, v94, v95, v96, v97, v98, v99, v100);
    }
    goto LABEL_62;
  }
  uint64_t v26 = [v19 computePipelineStateFor:@"PTSpillCorrection_initDiffusion" withConstants:0];
  initDiffusion = v21->_initDiffusion;
  v21->_initDiffusion = (MTLComputePipelineState *)v26;

  if (!v21->_initDiffusion)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:](v86, v101, v102, v103, v104, v105, v106, v107);
    }
    goto LABEL_62;
  }
  uint64_t v28 = [v19 computePipelineStateFor:@"PTSpillCorrection_constrainDiffusion" withConstants:0];
  constrainDiffusion = v21->_constrainDiffusion;
  v21->_constrainDiffusion = (MTLComputePipelineState *)v28;

  if (!v21->_constrainDiffusion)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.4(v86, v108, v109, v110, v111, v112, v113, v114);
    }
    goto LABEL_62;
  }
  uint64_t v30 = [v19 computePipelineStateFor:@"PTSpillCorrection_computeUpsamplingCoefficients" withConstants:0];
  computeUpsamplingCoefficients = v21->_computeUpsamplingCoefficients;
  v21->_computeUpsamplingCoefficients = (MTLComputePipelineState *)v30;

  if (!v21->_computeUpsamplingCoefficients)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.5(v86, v115, v116, v117, v118, v119, v120, v121);
    }
    goto LABEL_62;
  }
  uint64_t v32 = [v19 computePipelineStateFor:@"PTSpillCorrection_averageUpsamplingCoefficients" withConstants:0];
  averageUpsamplingCoefficients = v21->_averageUpsamplingCoefficients;
  v21->_averageUpsamplingCoefficients = (MTLComputePipelineState *)v32;

  if (!v21->_averageUpsamplingCoefficients)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.6(v86, v122, v123, v124, v125, v126, v127, v128);
    }
    goto LABEL_62;
  }
  uint64_t v34 = [v19 computePipelineStateFor:@"PTSpillCorrection_applyUpsamplingCoefficients" withConstants:0];
  applyUpsamplingCoefficients = v21->_applyUpsamplingCoefficients;
  v21->_applyUpsamplingCoefficients = (MTLComputePipelineState *)v34;

  if (!v21->_applyUpsamplingCoefficients)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.7(v86, v129, v130, v131, v132, v133, v134, v135);
    }
    goto LABEL_62;
  }
  v36 = [v19 textureUtil];
  uint64_t v37 = [v36 createWithWidth:a4 height:a5 pixelFormat:115];
  guideTexture = v21->_guideTexture;
  v21->_guideTexture = (MTLTexture *)v37;

  if (!v21->_guideTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.8(v86, v136, v137, v138, v139, v140, v141, v142);
    }
    goto LABEL_62;
  }
  v39 = [v19 textureUtil];
  uint64_t v40 = [v39 createWithWidth:a4 height:a5 pixelFormat:115];
  diffusionTexture = v21->_diffusionTexture;
  v21->_diffusionTexture = (MTLTexture *)v40;

  if (!v21->_diffusionTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.9(v86, v143, v144, v145, v146, v147, v148, v149);
    }
    goto LABEL_62;
  }
  v42 = [v19 textureUtil];
  uint64_t v43 = [v42 createWithWidth:a4 height:a5 pixelFormat:115];
  constraintsTexture = v21->_constraintsTexture;
  v21->_constraintsTexture = (MTLTexture *)v43;

  if (!v21->_constraintsTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]0(v86, v150, v151, v152, v153, v154, v155, v156);
    }
    goto LABEL_62;
  }
  v45 = [v19 textureUtil];
  uint64_t v46 = [v45 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffXTexture = v21->_coeffXTexture;
  v21->_coeffXTexture = (MTLTexture *)v46;

  if (!v21->_coeffXTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]1(v86, v157, v158, v159, v160, v161, v162, v163);
    }
    goto LABEL_62;
  }
  v48 = [v19 textureUtil];
  uint64_t v49 = [v48 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffYTexture = v21->_coeffYTexture;
  v21->_coeffYTexture = (MTLTexture *)v49;

  if (!v21->_coeffYTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]2(v86, v164, v165, v166, v167, v168, v169, v170);
    }
    goto LABEL_62;
  }
  v51 = [v19 textureUtil];
  uint64_t v52 = [v51 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffZTexture = v21->_coeffZTexture;
  v21->_coeffZTexture = (MTLTexture *)v52;

  if (!v21->_coeffZTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]3(v86, v171, v172, v173, v174, v175, v176, v177);
    }
    goto LABEL_62;
  }
  v54 = [v19 textureUtil];
  uint64_t v55 = [v54 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffXFilteredTexture = v21->_coeffXFilteredTexture;
  v21->_coeffXFilteredTexture = (MTLTexture *)v55;

  if (!v21->_coeffXFilteredTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]4(v86, v178, v179, v180, v181, v182, v183, v184);
    }
    goto LABEL_62;
  }
  v57 = [v19 textureUtil];
  uint64_t v58 = [v57 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffYFilteredTexture = v21->_coeffYFilteredTexture;
  v21->_coeffYFilteredTexture = (MTLTexture *)v58;

  if (!v21->_coeffYFilteredTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]5(v86, v185, v186, v187, v188, v189, v190, v191);
    }
    goto LABEL_62;
  }
  v60 = [v19 textureUtil];
  uint64_t v61 = [v60 createWithWidth:a4 height:a5 pixelFormat:115];
  coeffZFilteredTexture = v21->_coeffZFilteredTexture;
  v21->_coeffZFilteredTexture = (MTLTexture *)v61;

  if (!v21->_coeffZFilteredTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]6(v86, v192, v193, v194, v195, v196, v197, v198);
    }
    goto LABEL_62;
  }
  v63 = [v19 textureUtil];
  uint64_t v64 = [v63 createWithWidth:a4 height:a5 pixelFormat:25];
  segmentationTexture = v21->_segmentationTexture;
  v21->_segmentationTexture = (MTLTexture *)v64;

  if (!v21->_segmentationTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]7(v86, v199, v200, v201, v202, v203, v204, v205);
    }
    goto LABEL_62;
  }
  v66 = [v19 textureUtil];
  uint64_t v67 = [v66 createWithWidth:a4 height:a5 pixelFormat:25];
  segmentationMinTexture = v21->_segmentationMinTexture;
  v21->_segmentationMinTexture = (MTLTexture *)v67;

  if (!v21->_segmentationMinTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]8(v86, v206, v207, v208, v209, v210, v211, v212);
    }
    goto LABEL_62;
  }
  v69 = [v19 textureUtil];
  uint64_t v70 = [v69 createWithWidth:a4 height:a5 pixelFormat:25];
  segmentationMaxTexture = v21->_segmentationMaxTexture;
  v21->_segmentationMaxTexture = (MTLTexture *)v70;

  if (!v21->_segmentationMaxTexture)
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:]9(v86, v213, v214, v215, v216, v217, v218, v219);
    }
LABEL_62:

LABEL_63:
    v85 = 0;
    goto LABEL_64;
  }
  if ((PTDefaultsPublicGetBool(@"harvesting.enabled", 0) & 1) == 0)
  {
    id v72 = objc_alloc(MEMORY[0x1E4F35540]);
    v73 = [v19 device];
    uint64_t v74 = [v72 initWithDevice:v73 kernelWidth:a7 kernelHeight:a8];
    minFilter = v21->_minFilter;
    v21->_minFilter = (MPSImageAreaMin *)v74;

    id v76 = objc_alloc(MEMORY[0x1E4F35538]);
    v77 = [v19 device];
    uint64_t v78 = [v76 initWithDevice:v77 kernelWidth:a9 kernelHeight:a10];
    maxFilter = v21->_maxFilter;
    v21->_maxFilter = (MPSImageAreaMax *)v78;

    id v80 = objc_alloc(MEMORY[0x1E4F35588]);
    v81 = [v19 device];
    *(float *)&double v82 = a11;
    uint64_t v83 = [v80 initWithDevice:v81 sigma:v82];
    gaussianBlur = v21->_gaussianBlur;
    v21->_gaussianBlur = (MPSImageGaussianBlur *)v83;
  }
  v85 = v21;
LABEL_64:

  return v85;
}

- (int)encodeToCommandBuffer:(id)a3 rgbTexture:(id)a4 segmentationTexture:(id)a5
{
  metalContext = self->_metalContext;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PTMetalContext *)metalContext textureUtil];
  [v12 copy:v11 inTex:v10 outTex:self->_guideTexture];

  LODWORD(v10) = [(PTSpillCorrection *)self encodeToCommandBuffer:v11 segmentationTexture:v9];
  return (int)v10;
}

- (int)encodeToCommandBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 normChromaOffset:(id)a6 segmentationTexture:
{
  metalContext = self->_metalContext;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(PTMetalContext *)metalContext textureUtil];
  [v15 resample420To444:v14 inLuma:v13 inChroma:v12 outYUV:self->_guideTexture];

  LODWORD(v12) = [(PTSpillCorrection *)self encodeToCommandBuffer:v14 segmentationTexture:v11];
  return (int)v12;
}

- (int)encodeToCommandBuffer:(id)a3 segmentationTexture:(id)a4
{
  metalContext = self->_metalContext;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PTMetalContext *)metalContext textureUtil];
  [v9 copy:v8 inTex:v7 outTex:self->_segmentationTexture];

  [(PTSpillCorrection *)self updateFromDefaults];
  [(PTSpillCorrection *)self initConstraints:v8];
  [(PTSpillCorrection *)self diffusion:v8];

  return 0;
}

- (void)initConstraints:(id)a3
{
  minFilter = self->_minFilter;
  segmentationTexture = self->_segmentationTexture;
  segmentationMinTexture = self->_segmentationMinTexture;
  id v7 = a3;
  [(MPSImageAreaMin *)minFilter encodeToCommandBuffer:v7 sourceTexture:segmentationTexture destinationTexture:segmentationMinTexture];
  [(MPSImageAreaMax *)self->_maxFilter encodeToCommandBuffer:v7 sourceTexture:self->_segmentationTexture destinationTexture:self->_segmentationMaxTexture];
  id v8 = [v7 computeCommandEncoder];
  [v8 setComputePipelineState:self->_initConstraintsPart1];
  [v8 setTexture:self->_guideTexture atIndex:0];
  [v8 setTexture:self->_segmentationMinTexture atIndex:1];
  p_constraintsTexture = &self->_constraintsTexture;
  [v8 setTexture:self->_constraintsTexture atIndex:2];
  uint64_t v10 = [(MTLTexture *)self->_constraintsTexture width];
  uint64_t v11 = [(MTLTexture *)self->_constraintsTexture height];
  v18[0] = v10;
  v18[1] = v11;
  v18[2] = 1;
  long long v16 = xmmword_1D081F8F0;
  uint64_t v17 = 1;
  [v8 dispatchThreads:v18 threadsPerThreadgroup:&v16];
  [v8 endEncoding];

  [(MPSImageGaussianBlur *)self->_gaussianBlur encodeToCommandBuffer:v7 inPlaceTexture:&self->_constraintsTexture fallbackCopyAllocator:0];
  id v12 = [v7 computeCommandEncoder];

  [v12 setComputePipelineState:self->_initConstraintsPart2];
  [v12 setTexture:self->_guideTexture atIndex:0];
  [v12 setTexture:self->_segmentationMinTexture atIndex:1];
  [v12 setTexture:self->_segmentationMaxTexture atIndex:2];
  [v12 setTexture:self->_constraintsTexture atIndex:3];
  uint64_t v13 = [(MTLTexture *)self->_constraintsTexture width];
  uint64_t v14 = [(MTLTexture *)*p_constraintsTexture height];
  v15[0] = v13;
  v15[1] = v14;
  v15[2] = 1;
  long long v16 = xmmword_1D081F8F0;
  uint64_t v17 = 1;
  [v12 dispatchThreads:v15 threadsPerThreadgroup:&v16];
  [v12 endEncoding];
}

- (void)diffusion:(id)a3
{
  id v4 = a3;
  double v5 = [v4 computeCommandEncoder];
  [v5 setComputePipelineState:self->_initDiffusion];
  [v5 setTexture:self->_guideTexture atIndex:0];
  [v5 setTexture:self->_segmentationTexture atIndex:1];
  [v5 setTexture:self->_constraintsTexture atIndex:2];
  [v5 setTexture:self->_diffusionTexture atIndex:3];
  uint64_t v6 = [(MTLTexture *)self->_diffusionTexture width];
  uint64_t v7 = [(MTLTexture *)self->_diffusionTexture height];
  v27[0] = v6;
  v27[1] = v7;
  v27[2] = 1;
  long long v25 = xmmword_1D081F8F0;
  uint64_t v26 = 1;
  [v5 dispatchThreads:v27 threadsPerThreadgroup:&v25];
  [v5 endEncoding];

  if (self->_refinementSteps)
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v4 computeCommandEncoder];
      [v9 setComputePipelineState:self->_computeUpsamplingCoefficients];
      [v9 setTexture:self->_guideTexture atIndex:0];
      [v9 setTexture:self->_diffusionTexture atIndex:1];
      [v9 setTexture:self->_coeffXTexture atIndex:2];
      [v9 setTexture:self->_coeffYTexture atIndex:3];
      [v9 setTexture:self->_coeffZTexture atIndex:4];
      uint64_t v10 = [(MTLTexture *)self->_coeffXTexture width];
      uint64_t v11 = [(MTLTexture *)self->_coeffXTexture height];
      v24[0] = v10;
      v24[1] = v11;
      v24[2] = 1;
      long long v25 = xmmword_1D081F8F0;
      uint64_t v26 = 1;
      [v9 dispatchThreads:v24 threadsPerThreadgroup:&v25];
      [v9 endEncoding];

      id v12 = [v4 computeCommandEncoder];
      [v12 setComputePipelineState:self->_averageUpsamplingCoefficients];
      [v12 setTexture:self->_coeffXTexture atIndex:0];
      [v12 setTexture:self->_coeffYTexture atIndex:1];
      [v12 setTexture:self->_coeffZTexture atIndex:2];
      [v12 setTexture:self->_coeffXFilteredTexture atIndex:3];
      [v12 setTexture:self->_coeffYFilteredTexture atIndex:4];
      [v12 setTexture:self->_coeffZFilteredTexture atIndex:5];
      uint64_t v13 = [(MTLTexture *)self->_coeffXTexture width];
      uint64_t v14 = [(MTLTexture *)self->_coeffXTexture height];
      v23[0] = v13;
      v23[1] = v14;
      v23[2] = 1;
      long long v25 = xmmword_1D081F8F0;
      uint64_t v26 = 1;
      [v12 dispatchThreads:v23 threadsPerThreadgroup:&v25];
      [v12 endEncoding];

      v15 = [v4 computeCommandEncoder];
      [v15 setComputePipelineState:self->_applyUpsamplingCoefficients];
      [v15 setTexture:self->_guideTexture atIndex:0];
      [v15 setTexture:self->_coeffXFilteredTexture atIndex:1];
      [v15 setTexture:self->_coeffYFilteredTexture atIndex:2];
      [v15 setTexture:self->_coeffZFilteredTexture atIndex:3];
      [v15 setTexture:self->_diffusionTexture atIndex:4];
      uint64_t v16 = [(MTLTexture *)self->_diffusionTexture width];
      uint64_t v17 = [(MTLTexture *)self->_diffusionTexture height];
      v22[0] = v16;
      v22[1] = v17;
      v22[2] = 1;
      long long v25 = xmmword_1D081F8F0;
      uint64_t v26 = 1;
      [v15 dispatchThreads:v22 threadsPerThreadgroup:&v25];
      [v15 endEncoding];

      v18 = [v4 computeCommandEncoder];
      [v18 setComputePipelineState:self->_constrainDiffusion];
      [v18 setTexture:self->_constraintsTexture atIndex:0];
      [v18 setTexture:self->_diffusionTexture atIndex:1];
      uint64_t v19 = [(MTLTexture *)self->_diffusionTexture width];
      uint64_t v20 = [(MTLTexture *)self->_diffusionTexture height];
      v21[0] = v19;
      v21[1] = v20;
      v21[2] = 1;
      long long v25 = xmmword_1D081F8F0;
      uint64_t v26 = 1;
      [v18 dispatchThreads:v21 threadsPerThreadgroup:&v25];
      [v18 endEncoding];

      ++v8;
    }
    while (self->_refinementSteps > v8);
  }
}

- (unint64_t)refinementWidth
{
  return [(MTLTexture *)self->_guideTexture width];
}

- (unint64_t)refinementHeight
{
  return [(MTLTexture *)self->_guideTexture height];
}

- (id)guideLowRes
{
  return self->_guideTexture;
}

- (id)segmentationLowRes
{
  return self->_segmentationTexture;
}

- (id)diffusionTexture
{
  return self->_diffusionTexture;
}

- (id)coeffXTexture
{
  return self->_coeffXTexture;
}

- (id)coeffYTexture
{
  return self->_coeffYTexture;
}

- (id)coeffZTexture
{
  return self->_coeffZTexture;
}

- (id)segmentationMin
{
  return self->_segmentationMinTexture;
}

- (id)segmentationMax
{
  return self->_segmentationMaxTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_maxFilter, 0);
  objc_storeStrong((id *)&self->_minFilter, 0);
  objc_storeStrong((id *)&self->_coeffZFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffYFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffXFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffZTexture, 0);
  objc_storeStrong((id *)&self->_coeffYTexture, 0);
  objc_storeStrong((id *)&self->_coeffXTexture, 0);
  objc_storeStrong((id *)&self->_segmentationMaxTexture, 0);
  objc_storeStrong((id *)&self->_segmentationMinTexture, 0);
  objc_storeStrong((id *)&self->_segmentationTexture, 0);
  objc_storeStrong((id *)&self->_constraintsTexture, 0);
  objc_storeStrong((id *)&self->_diffusionTexture, 0);
  objc_storeStrong((id *)&self->_guideTexture, 0);
  objc_storeStrong((id *)&self->_applyUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_averageUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_computeUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_constrainDiffusion, 0);
  objc_storeStrong((id *)&self->_initDiffusion, 0);
  objc_storeStrong((id *)&self->_initConstraintsPart2, 0);

  objc_storeStrong((id *)&self->_initConstraintsPart1, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end