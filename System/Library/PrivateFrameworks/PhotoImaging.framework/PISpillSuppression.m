@interface PISpillSuppression
+ (id)applySpillMatteKernel;
+ (id)customAttributes;
+ (id)prepareSpillMatteKernel;
+ (id)spillSuppressionKernels;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (CIImage)inputTargetBackgroundImage;
- (CIVector)inputExtent;
- (NSNumber)inputAlphaEdge;
- (NSNumber)inputAlphaThresholdLog10;
- (NSNumber)inputConstrainToAlpha;
- (NSNumber)inputDebugSpillOnly;
- (NSNumber)inputEdgeRadius;
- (NSNumber)inputEpsilonLog10;
- (NSNumber)inputErosionRadius;
- (NSNumber)inputIterations;
- (NSNumber)inputRadius;
- (NSString)inputDebugChannels;
- (id)outputImage;
- (void)setInputAlphaEdge:(id)a3;
- (void)setInputAlphaThresholdLog10:(id)a3;
- (void)setInputConstrainToAlpha:(id)a3;
- (void)setInputDebugChannels:(id)a3;
- (void)setInputDebugSpillOnly:(id)a3;
- (void)setInputEdgeRadius:(id)a3;
- (void)setInputEpsilonLog10:(id)a3;
- (void)setInputErosionRadius:(id)a3;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputIterations:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputTargetBackgroundImage:(id)a3;
@end

@implementation PISpillSuppression

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDebugSpillOnly, 0);
  objc_storeStrong((id *)&self->_inputDebugChannels, 0);
  objc_storeStrong((id *)&self->_inputEdgeRadius, 0);
  objc_storeStrong((id *)&self->_inputAlphaEdge, 0);
  objc_storeStrong((id *)&self->_inputErosionRadius, 0);
  objc_storeStrong((id *)&self->_inputEpsilonLog10, 0);
  objc_storeStrong((id *)&self->_inputAlphaThresholdLog10, 0);
  objc_storeStrong((id *)&self->_inputConstrainToAlpha, 0);
  objc_storeStrong((id *)&self->_inputIterations, 0);
  objc_storeStrong((id *)&self->_inputRadius, 0);
  objc_storeStrong((id *)&self->_inputExtent, 0);
  objc_storeStrong((id *)&self->_inputTargetBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputDebugSpillOnly:(id)a3
{
}

- (NSNumber)inputDebugSpillOnly
{
  return self->_inputDebugSpillOnly;
}

- (void)setInputDebugChannels:(id)a3
{
}

- (NSString)inputDebugChannels
{
  return self->_inputDebugChannels;
}

- (void)setInputEdgeRadius:(id)a3
{
}

- (NSNumber)inputEdgeRadius
{
  return self->_inputEdgeRadius;
}

- (void)setInputAlphaEdge:(id)a3
{
}

- (NSNumber)inputAlphaEdge
{
  return self->_inputAlphaEdge;
}

- (void)setInputErosionRadius:(id)a3
{
}

- (NSNumber)inputErosionRadius
{
  return self->_inputErosionRadius;
}

- (void)setInputEpsilonLog10:(id)a3
{
}

- (NSNumber)inputEpsilonLog10
{
  return self->_inputEpsilonLog10;
}

- (void)setInputAlphaThresholdLog10:(id)a3
{
}

- (NSNumber)inputAlphaThresholdLog10
{
  return self->_inputAlphaThresholdLog10;
}

- (void)setInputConstrainToAlpha:(id)a3
{
}

- (NSNumber)inputConstrainToAlpha
{
  return self->_inputConstrainToAlpha;
}

- (void)setInputIterations:(id)a3
{
}

- (NSNumber)inputIterations
{
  return self->_inputIterations;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->_inputRadius;
}

- (void)setInputExtent:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->_inputExtent;
}

- (void)setInputTargetBackgroundImage:(id)a3
{
}

- (CIImage)inputTargetBackgroundImage
{
  return self->_inputTargetBackgroundImage;
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)outputImage
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  v3 = [(PISpillSuppression *)self inputImage];

  if (!v3)
  {
    v5 = 0;
    goto LABEL_46;
  }
  v4 = [(PISpillSuppression *)self inputMatteImage];

  v5 = [(PISpillSuppression *)self inputImage];
  if (!v4) {
    goto LABEL_46;
  }
  v6 = [(PISpillSuppression *)self inputMatteImage];
  v7 = [(PISpillSuppression *)self inputTargetBackgroundImage];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1E050];
    v11 = [MEMORY[0x1E4F1E008] blackColor];
    id v9 = [v10 imageWithColor:v11];
  }
  v12 = [(PISpillSuppression *)self inputExtent];
  v13 = v12;
  if (v12)
  {
    [v12 CGRectValue];
    uint64_t v14 = objc_msgSend(v5, "imageByCroppingToRect:");

    [v13 CGRectValue];
    uint64_t v15 = objc_msgSend(v9, "imageByCroppingToRect:");

    id v9 = (id)v15;
    v5 = (void *)v14;
  }
  [v6 extent];
  if (CGRectIsEmpty(v174) || ([v6 extent], CGRectIsInfinite(v175)))
  {
    v123 = NUAssertLogger_5247();
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
    {
      v124 = [NSString stringWithFormat:@"Invalid input matte"];
      *(_DWORD *)buf = 138543362;
      v169 = v124;
      _os_log_error_impl(&dword_1A9680000, v123, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v81 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v126 = NUAssertLogger_5247();
    BOOL v127 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v127)
      {
        v134 = dispatch_get_specific(*v81);
        v135 = (void *)MEMORY[0x1E4F29060];
        id v136 = v134;
        v81 = [v135 callStackSymbols];
        v137 = [v81 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v169 = (const void **)v134;
        __int16 v170 = 2114;
        v171 = v137;
        _os_log_error_impl(&dword_1A9680000, v126, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v127)
    {
      v128 = [MEMORY[0x1E4F29060] callStackSymbols];
      v81 = [v128 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v169 = v81;
      _os_log_error_impl(&dword_1A9680000, v126, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v132 = _NUAssertFailHandler();
    goto LABEL_62;
  }
  [v5 extent];
  if (CGRectIsEmpty(v176) || ([v5 extent], CGRectIsInfinite(v177)))
  {
    v129 = NUAssertLogger_5247();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      v130 = [NSString stringWithFormat:@"Invalid input image"];
      *(_DWORD *)buf = 138543362;
      v169 = v130;
      _os_log_error_impl(&dword_1A9680000, v129, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v81 = (const void **)MEMORY[0x1E4F7A308];
    v131 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v126 = NUAssertLogger_5247();
    int v132 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
    if (!v131)
    {
      if (v132)
      {
        v133 = [MEMORY[0x1E4F29060] callStackSymbols];
        v81 = [v133 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v169 = v81;
        _os_log_error_impl(&dword_1A9680000, v126, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_64:

      _NUAssertFailHandler();
      goto LABEL_65;
    }
LABEL_62:
    if (v132)
    {
      v138 = dispatch_get_specific(*v81);
      v139 = (void *)MEMORY[0x1E4F29060];
      id v140 = v138;
      v81 = [v139 callStackSymbols];
      v141 = [v81 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v169 = (const void **)v138;
      __int16 v170 = 2114;
      v171 = v141;
      _os_log_error_impl(&dword_1A9680000, v126, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_64;
  }
  [v5 extent];
  double v17 = v16;
  [v6 extent];
  double v19 = v17 / v18;
  [v5 extent];
  double v21 = v20;
  [v6 extent];
  if (v19 >= v21 / v22) {
    double v23 = v19;
  }
  else {
    double v23 = v21 / v22;
  }
  double v24 = 1.0 / v23;
  CGAffineTransformMakeScale(&v158, 1.0 / v23, 1.0 / v23);
  v25 = [v5 imageByApplyingTransform:&v158];
  [v6 extent];
  uint64_t v26 = objc_msgSend(v25, "imageByCroppingToRect:");

  CGAffineTransformMakeScale(&v157, 1.0 / v23, 1.0 / v23);
  id v151 = v9;
  v27 = [v9 imageByApplyingTransform:&v157];
  [v6 extent];
  uint64_t v28 = objc_msgSend(v27, "imageByCroppingToRect:");

  v29 = [(PISpillSuppression *)self inputAlphaThresholdLog10];
  v30 = v29;
  if (!v29) {
    v29 = &unk_1F000A278;
  }
  [v29 floatValue];
  float v153 = __exp10f(v31);

  v32 = [(PISpillSuppression *)self inputEpsilonLog10];
  v33 = v32;
  if (!v32) {
    v32 = &unk_1F000A288;
  }
  [v32 floatValue];
  float v35 = __exp10f(v34);

  v36 = [(PISpillSuppression *)self inputAlphaEdge];
  v37 = v36;
  if (!v36) {
    v36 = &unk_1F000A2A8;
  }
  [v36 floatValue];
  int v142 = v38;

  v39 = [(PISpillSuppression *)self inputEdgeRadius];
  v152 = v5;
  v149 = v13;
  if (v39)
  {
    v40 = [(PISpillSuppression *)self inputEdgeRadius];
    [v40 floatValue];
    double v143 = v41;
  }
  else
  {
    double v143 = 5.0;
  }

  v42 = [(PISpillSuppression *)self inputErosionRadius];
  v43 = v42;
  if (!v42) {
    v42 = &unk_1F000A228;
  }
  [v42 floatValue];
  float v45 = v44;

  v46 = [(PISpillSuppression *)self inputRadius];
  v47 = v46;
  if (!v46) {
    v46 = &unk_1F000A2B8;
  }
  [v46 floatValue];
  float v49 = v48;

  uint64_t v166 = *MEMORY[0x1E4F1E4E0];
  v50 = [NSNumber numberWithDouble:v24 * v45];
  v167 = v50;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v167 forKeys:&v166 count:1];
  uint64_t v52 = [v6 imageByApplyingFilter:@"CIBoxBlur" withInputParameters:v51];

  v53 = +[PISpillSuppression prepareSpillMatteKernel];
  [v6 extent];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  v165[0] = v26;
  v165[1] = v28;
  v144 = (void *)v28;
  v148 = (void *)v52;
  v165[2] = v52;
  *(float *)&double v54 = v153;
  v62 = [NSNumber numberWithFloat:v54];
  v165[3] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:4];
  v147 = v53;
  uint64_t v64 = objc_msgSend(v53, "applyWithExtent:arguments:", v63, v55, v57, v59, v61);

  [v6 extent];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  v145 = (void *)v26;
  v146 = (void *)v64;
  v164[0] = v64;
  v164[1] = v26;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:2];
  v162[0] = @"channels";
  uint64_t v74 = [(PISpillSuppression *)self inputDebugChannels];
  v75 = (void *)v74;
  v76 = @"RGB";
  if (v74) {
    v76 = (__CFString *)v74;
  }
  v163[0] = v76;
  v162[1] = @"radius";
  v77 = [NSNumber numberWithDouble:v24 * v49];
  v163[1] = v77;
  v162[2] = @"epsilon";
  *(float *)&double v78 = v35;
  v79 = [NSNumber numberWithFloat:v78];
  v163[2] = v79;
  v162[3] = @"iterations";
  uint64_t v80 = [(PISpillSuppression *)self inputIterations];
  v81 = (const void **)v6;
  v82 = (void *)v80;
  v83 = &unk_1F0009908;
  if (v80) {
    v83 = (void *)v80;
  }
  v163[3] = v83;
  v162[4] = @"constrainToAlpha";
  uint64_t v84 = [(PISpillSuppression *)self inputConstrainToAlpha];
  v85 = (void *)v84;
  uint64_t v86 = MEMORY[0x1E4F1CC38];
  if (v84) {
    uint64_t v86 = v84;
  }
  v163[4] = v86;
  v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:5];
  id v156 = 0;
  v88 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISpatioTemporalGuidedFilterProcessor, "applyWithExtent:inputs:arguments:error:", v73, v87, &v156, v66, v68, v70, v72);
  v150 = (const void **)v156;

  if (!v88)
  {
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_42:
      v116 = v151;
      v115 = v152;
      v118 = v148;
      v117 = v149;
      v114 = v144;
      v113 = v145;
      v120 = v146;
      v119 = v147;
      v121 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v169 = v150;
        _os_log_error_impl(&dword_1A9680000, v121, OS_LOG_TYPE_ERROR, "Failed to generate spill image: %{public}@", buf, 0xCu);
      }
      id v109 = v152;
      goto LABEL_45;
    }
LABEL_65:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_277);
    goto LABEL_42;
  }
  v89 = [v81 imageByClampingToExtent];
  v90 = [v89 imageByApplyingGaussianBlurWithSigma:v143];

  [v81 extent];
  v91 = objc_msgSend(v90, "imageByCroppingToRect:");

  v160 = @"inputBackgroundImage";
  v161 = v91;
  v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
  v93 = [v81 imageByApplyingFilter:@"CIMultiplyBlendMode" withInputParameters:v92];

  if (v23 > 1.0)
  {
    CGAffineTransformMakeScale(&v155, v23, v23);
    uint64_t v94 = [v93 imageByApplyingTransform:&v155];

    CGAffineTransformMakeScale(&v154, v23, v23);
    uint64_t v95 = [v88 imageByApplyingTransform:&v154];

    v88 = (void *)v95;
    v93 = (void *)v94;
  }
  v96 = +[PISpillSuppression applySpillMatteKernel];
  [v152 extent];
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  v159[0] = v88;
  v159[1] = v152;
  v159[2] = v151;
  v159[3] = v93;
  *(float *)&double v97 = v153;
  v105 = [NSNumber numberWithFloat:v97];
  v159[4] = v105;
  LODWORD(v106) = v142;
  v107 = [NSNumber numberWithFloat:v106];
  v159[5] = v107;
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:6];
  objc_msgSend(v96, "applyWithExtent:arguments:", v108, v98, v100, v102, v104);
  id v109 = (id)objc_claimAutoreleasedReturnValue();

  v110 = [(PISpillSuppression *)self inputDebugSpillOnly];
  int v111 = [v110 BOOLValue];

  if (v111)
  {
    id v112 = v88;

    id v109 = v112;
  }
  v114 = v144;
  v113 = v145;

  v116 = v151;
  v115 = v152;
  v118 = v148;
  v117 = v149;
  v120 = v146;
  v119 = v147;
LABEL_45:

  v5 = v109;
LABEL_46:
  return v5;
}

+ (id)customAttributes
{
  v48[11] = *MEMORY[0x1E4F143B8];
  v47[0] = *MEMORY[0x1E4F1E478];
  uint64_t v45 = *MEMORY[0x1E4F1E0F0];
  uint64_t v2 = v45;
  uint64_t v46 = *MEMORY[0x1E4F1E150];
  double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v48[0] = v22;
  v47[1] = *MEMORY[0x1E4F1E4E0];
  uint64_t v4 = *MEMORY[0x1E4F1E0D0];
  v41[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v3 = v41[0];
  v41[1] = v4;
  v44[0] = &unk_1F000A208;
  v44[1] = &unk_1F000A218;
  uint64_t v42 = *MEMORY[0x1E4F1E098];
  uint64_t v5 = v42;
  uint64_t v43 = v2;
  uint64_t v16 = *MEMORY[0x1E4F1E118];
  v44[2] = &unk_1F000A228;
  v44[3] = v16;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v41 count:4];
  v48[1] = v21;
  v47[2] = @"inputIterations";
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1F000A238;
  v40[1] = &unk_1F000A248;
  v39[2] = v5;
  v39[3] = v2;
  uint64_t v6 = *MEMORY[0x1E4F1E110];
  v40[2] = &unk_1F000A228;
  v40[3] = v6;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
  v48[2] = v20;
  v47[3] = @"inputConstrainToAlpha";
  v37[0] = v5;
  v37[1] = v2;
  uint64_t v17 = *MEMORY[0x1E4F1E100];
  v38[0] = MEMORY[0x1E4F1CC38];
  v38[1] = v17;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v48[3] = v19;
  v47[4] = @"inputAlphaThresholdLog10";
  v35[0] = v3;
  v35[1] = v4;
  v36[0] = &unk_1F000A258;
  v36[1] = &unk_1F000A268;
  v35[2] = v5;
  v35[3] = v2;
  uint64_t v7 = *MEMORY[0x1E4F1E158];
  v36[2] = &unk_1F000A278;
  v36[3] = v7;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
  v48[4] = v18;
  v47[5] = @"inputEpsilonLog10";
  v33[0] = v3;
  v33[1] = v4;
  v34[0] = &unk_1F000A258;
  v34[1] = &unk_1F000A268;
  v33[2] = v5;
  v33[3] = v2;
  v34[2] = &unk_1F000A288;
  v34[3] = v7;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
  v47[6] = @"inputDebugChannels";
  v48[5] = v15;
  v31[0] = @"PIAttributeAvailableModes";
  v31[1] = v5;
  v32[0] = &unk_1F000AA48;
  v32[1] = @"RGB";
  v31[2] = v2;
  v32[2] = @"PIAttributeTypeMode";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v48[6] = v14;
  v47[7] = @"inputErosionRadius";
  v29[0] = v3;
  v29[1] = v4;
  v30[0] = &unk_1F000A208;
  v30[1] = &unk_1F000A218;
  v29[2] = v5;
  v29[3] = v2;
  v30[2] = &unk_1F000A228;
  v30[3] = v16;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  v47[8] = @"inputAlphaEdge";
  v48[7] = v8;
  v28[0] = &unk_1F000A208;
  v28[1] = &unk_1F000A298;
  v27[0] = v3;
  v27[1] = v4;
  v27[2] = v5;
  v27[3] = v2;
  v28[2] = &unk_1F000A2A8;
  v28[3] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v48[8] = v9;
  v47[9] = @"inputEdgeRadius";
  v25[0] = v3;
  v25[1] = v4;
  v26[0] = &unk_1F000A208;
  v26[1] = &unk_1F000A218;
  v25[2] = v5;
  v25[3] = v2;
  v26[2] = &unk_1F000A228;
  v26[3] = v16;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  v48[9] = v10;
  v47[10] = @"inputDebugSpillOnly";
  v23[0] = v5;
  v23[1] = v2;
  v24[0] = MEMORY[0x1E4F1CC28];
  v24[1] = v17;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v48[10] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:11];

  return v12;
}

+ (id)applySpillMatteKernel
{
  uint64_t v2 = [a1 spillSuppressionKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"applySpillMatte"];

  return v3;
}

+ (id)prepareSpillMatteKernel
{
  uint64_t v2 = [a1 spillSuppressionKernels];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"prepareSpillMatte"];

  return v3;
}

+ (id)spillSuppressionKernels
{
  if (spillSuppressionKernels_onceToken != -1) {
    dispatch_once(&spillSuppressionKernels_onceToken, &__block_literal_global_5436);
  }
  uint64_t v2 = (void *)spillSuppressionKernels_kernels;
  return v2;
}

uint64_t __45__PISpillSuppression_spillSuppressionKernels__block_invoke()
{
  spillSuppressionKernels_kernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 prepareSpillMatte(__sample fg, __sample bg, __sample matte, float threshold)\n{\nfloat a = step(threshold, matte.r)\nvec4 pix = mix(bg, fg, a);\npix.a = max(1.0 - step(threshold, matte.r), step(1.0 - threshold, matte.r));\nreturn pix;\n}\nkernel vec4 applySpillMatte(__sample sp, __sample fg, __sample bg, __sample matte, float threshold, float edge)\n{\nfloat m0 = matte.r;\nfloat ba = smoothstep(threshold, threshold + edge, m0);\nsp = mix(bg, sp, ba);\nfloat m1 = 1.0 - m0;\nfloat fa = 1.0 - smoothstep(threshold, threshold + edge, m1);\nsp = mix(sp, fg, fa);\nfloat m2 = m1 * m0;\nsp = mix(sp, bg, m2);\nreturn sp;\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

@end