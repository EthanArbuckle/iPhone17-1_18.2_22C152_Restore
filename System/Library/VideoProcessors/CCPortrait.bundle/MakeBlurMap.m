@interface MakeBlurMap
+ (CGSize)blurMapSize:(CGSize)a3;
+ (unint64_t)maxBlurMapSize;
- (MakeBlurMap)init;
- (MakeBlurMap)initWithMetalQueue:(id)a3;
- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 device:(id)a5 useBoxFiltering:(BOOL)a6 outputImage:(id)a7 context:(id)a8;
- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 sourceSize:(CGSize)a5 device:(id)a6 outputImage:(id)a7 context:(id)a8;
- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5;
- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6;
- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6 pixelFormat:(unint64_t)a7;
- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 pixelFormat:(unint64_t)a6;
- (id)createBlurMapUsingMetadata:(id)a3 simulatedAperture:(float)a4 focusWindow:(CGRect)a5 focalLengthInPixels:(float)a6 normalizedFocalLength:(float)a7 facePoints:(CGPoint *)a8 maxBlur:(float)a9 inputScale:(float)a10 inputsAlreadyScaled:(BOOL)a11 inputShiftMap:(id)a12 inputSegmentation:(id)a13 inputHair:(id)a14 inputGlasses:(id)a15 inputImageLuma:(id)a16 inputImageChroma:(id)a17 inputFaceMaskAdjBlur:(id)a18 inputWeightsX:(id)a19 inputWeightsY:(id)a20 inputPreproc:(id)a21 inputSampledD:(id)a22 inputDisparityRefineBlur:(id)a23 inputAlphaMaskDelta:(id)a24 inputHairMaskDelta:(id)a25 inputBlurRefineIntermediate:(id)a26 resultAdjBlurMap:(id)a27 coreImageRender:(BOOL)a28 context:(id)a29 captureFolderMiscPath:(id)a30;
- (id)enqueueBoundaryMaskPassForInputTex:(id)a3 inputSecondaryTex:(id)a4 intermediateTex:(id)a5 thresholdValue:(float)a6 boundaryScalingFactor:(float)a7 outputTex:(id)a8 blurRadius:(float)a9 passName:(id)a10 scale:(float)a11 context:(id)a12;
- (id)enqueueRefinementUsingParams:(const blurmap_refinement_params *)a3 maskParams:(const face_mask_params *)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputHair:(id)a7 inputGlasses:(id)a8 inputAlphaMaskDelta:(id)a9 inputHairMaskDelta:(id)a10 inputBlurRefineIntermediate:(id)a11 outputBlurMap:(id)a12 scale:(float)a13 inputsAlreadyScaled:(BOOL)a14 context:(id)a15;
- (id)imageUsingArgs:(id)a3;
- (id)performBlurmapSmoothingUsingSmoothingConfig:(const blurmap_smoothing_params *)a3 inputBlurMap:(id)a4 inputIntermediateTex:(id)a5 outputSmoothedBlurmap:(id)a6 scale:(float)a7 version:(int)a8 context:(id)a9;
- (id)performCrispHairRefinementWithParams:(const crisp_hair_params *)a3 alpha:(id)a4 disparity:(id)a5 tmpImage0:(id)a6 tmpImage1:(id)a7 tmpImage2:(id)a8 editTimeRender:(BOOL)a9 context:(id)a10;
- (id)performDisparityRefinementUsingParams:(const disparity_refinement_params *)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 inputImageLuma:(id)a6 inputImageChroma:(id)a7 inputSlmParams:(id)a8 inputWeightsX:(id)a9 inputWeightsY:(id)a10 inputPreproc:(id)a11 inputSampledD:(id)a12 outputBlurMap:(id)a13 scale:(float)a14 havePerformedMatting:(BOOL)a15 editTimeRender:(BOOL)a16 context:(id)a17 enableFGBlur:(BOOL)a18;
- (id)performDisparityRefinementViaMatting:(id)a3 inputShiftmap:(id)a4 focusRect:(CGRect)a5 inputLuma:(id)a6 inputChroma:(id)a7 simpleLensModelCalculatorImage:(id)a8 disparityConfigIndex:(int)a9 outputRefinedImage:(id)a10 tmpRGB:(id)a11 tmpDisparity:(id)a12 tmpRGBA:(id)a13 SDOFVersion:(int)a14 mattingParams:(id *)a15 context:(id)a16;
- (id)performSLMCalculatorUsingParams:(const simple_lens_model_params *)a3 inputShiftMap:(id)a4 faceMaskParams:(const face_mask_params *)a5 version:(int)a6 context:(id)a7 isFGBlurEnabled:(BOOL)a8;
- (int)allocateFakeResources;
- (int)allocateResourcesForShiftMapWidth:(unint64_t)a3 shiftMapHeight:(unint64_t)a4;
- (int)enqueueBlurMapGenerationUsingArgs:(id)a3;
- (int)loadShaders;
- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4;
- (unint64_t)calcShaderParamsFromConfigParams:(float *)a3;
- (void)dealloc;
- (void)deallocateResources;
@end

@implementation MakeBlurMap

- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4
{
  if (!a3) {
    sub_262E49458();
  }
  long long v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&self->_disparity_refinement_config_params.radius = *(_OWORD *)a3;
  *(_OWORD *)&self->_disparity_refinement_config_params.outerSamplingRadius = v4;
  long long v5 = *((_OWORD *)a3 + 2);
  long long v6 = *((_OWORD *)a3 + 3);
  long long v7 = *((_OWORD *)a3 + 4);
  self->_disparity_refinement_config_params.fgBgDilationSize = *((_DWORD *)a3 + 20);
  *(_OWORD *)&self->_disparity_refinement_config_params.aaLumaSigma = v6;
  *(_OWORD *)&self->_disparity_refinement_config_params.fgBlurScale = v7;
  *(_OWORD *)&self->_disparity_refinement_config_params.segmentationSigma = v5;

  return objc_msgSend_loadShaders(self, a2, (uint64_t)a3, a4);
}

+ (unint64_t)maxBlurMapSize
{
  if (qword_26B425328 != -1) {
    dispatch_once(&qword_26B425328, &unk_270E12898);
  }
  return qword_26A9974B0;
}

+ (CGSize)blurMapSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = fmin((double)(unint64_t)objc_msgSend_maxBlurMapSize(MakeBlurMap, a2, v3)/ (double)(unint64_t)fmax(a3.height, a3.width), 0.5);
  double v7 = ceil(v6 * width + -0.001);
  double v8 = ceil(v6 * height + -0.001);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (MakeBlurMap)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = uni_logger_api();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = objc_opt_class();
    int v6 = 136446466;
    double v7 = "-[MakeBlurMap init]";
    __int16 v8 = 2080;
    uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
    _os_log_error_impl(&dword_262E0F000, v2, OS_LOG_TYPE_ERROR, "%{public}s invalid initialization method for %s", (uint8_t *)&v6, 0x16u);
  }

  abort();
}

- (MakeBlurMap)initWithMetalQueue:(id)a3
{
  id v5 = a3;
  __int16 v8 = v5;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_device(v5, v6, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }
  v242.receiver = self;
  v242.super_class = (Class)MakeBlurMap;
  uint64_t v10 = [(MakeBlurMap *)&v242 init];
  if (!v10) {
    sub_262E49484();
  }
  v11 = v10;
  p_mtlQueue = (void **)&v10->_mtlQueue;
  objc_storeStrong((id *)&v10->_mtlQueue, a3);
  v13 = (void *)MEMORY[0x263F086E0];
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
  if (!v16) {
    sub_262E494B0();
  }
  v17 = (void *)v16;
  v18 = [UniLibrary alloc];
  uint64_t v20 = objc_msgSend_initWithDevice_metalOnly_(v18, v19, (uint64_t)v9, v8 != 0);
  library = v11->_library;
  v11->_library = (UniLibrary *)v20;

  if (!v11->_library) {
    sub_262E494DC();
  }
  v22 = [UniKernel alloc];
  uint64_t v24 = objc_msgSend_initWithName_library_(v22, v23, @"slm_shiftmap_calcminmax", v11->_library);
  slmMinMax = v11->_slmMinMax;
  v11->_slmMinMax = (UniKernel *)v24;

  v27 = v11->_slmMinMax;
  if (!v27) {
    sub_262E49508();
  }
  objc_msgSend_setPreferredOutputFormat_(v27, v26, (uint64_t)&unk_270E1E600);
  objc_msgSend_setRoiCallback_(v11->_slmMinMax, v28, (uint64_t)&unk_270E128B8);
  v29 = [UniKernel alloc];
  uint64_t v31 = objc_msgSend_initWithName_library_(v29, v30, @"slm_calc", v11->_library);
  slmCalc = v11->_slmCalc;
  v11->_slmCalc = (UniKernel *)v31;

  v34 = v11->_slmCalc;
  if (!v34) {
    sub_262E49534();
  }
  objc_msgSend_setPreferredOutputFormat_(v34, v33, (uint64_t)&unk_270E1E600);
  objc_msgSend_setRoiCallback_(v11->_slmCalc, v35, (uint64_t)&unk_270E128D8);
  v36 = [UniKernel alloc];
  uint64_t v38 = objc_msgSend_initWithName_library_(v36, v37, @"slm_calc_eyes", v11->_library);
  slmCalcEyes = v11->_slmCalcEyes;
  v11->_slmCalcEyes = (UniKernel *)v38;

  if (!v11->_slmCalcEyes) {
    sub_262E49560();
  }
  v42 = objc_msgSend_preferredOutputFormat(v11->_slmCalc, v40, v41);
  objc_msgSend_setPreferredOutputFormat_(v11->_slmCalcEyes, v43, (uint64_t)v42);

  objc_msgSend_setRoiCallback_(v11->_slmCalcEyes, v44, (uint64_t)&unk_270E128F8);
  v11->_disparity_refinement_config_params.radius = 3;
  *(_OWORD *)&v11->_disparity_refinement_config_params.weightScaling = xmmword_262E51640;
  v11->_disparity_refinement_config_params.nSamples = 20;
  *(_OWORD *)&v11->_disparity_refinement_config_params.lumaSigma = xmmword_262E51650;
  *(_OWORD *)&v11->_disparity_refinement_config_params.accumulatedWeightT0 = xmmword_262E51660;
  *(void *)&v11->_disparity_refinement_config_params.aaSegmentationSigma = 0x3FB33333447A0000;
  *(void *)&v11->_disparity_refinement_config_params.fgBlurScale = 0;
  *(void *)&v11->_disparity_refinement_config_params.fgDeadZoneOffset = 0;
  v11->_disparity_refinement_config_params.fgBgDilationSize = 0;
  v45 = [UniKernel alloc];
  uint64_t v47 = objc_msgSend_initWithName_library_(v45, v46, @"disparity_refinement_slm_passthrough", v11->_library);
  passthrough = v11->_passthrough;
  v11->_passthrough = (UniKernel *)v47;

  v50 = v11->_passthrough;
  if (!v50) {
    sub_262E4958C();
  }
  objc_msgSend_setPreferredOutputFormat_(v50, v49, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_passthrough, v51, (uint64_t)&unk_270E12918);
  v52 = [UniKernel alloc];
  uint64_t v54 = objc_msgSend_initWithName_library_(v52, v53, @"disparity_refinement_extract_positive_blur_values", v11->_library);
  extractPositiveBlurValues = v11->_extractPositiveBlurValues;
  v11->_extractPositiveBlurValues = (UniKernel *)v54;

  v57 = v11->_extractPositiveBlurValues;
  if (!v57) {
    sub_262E495B8();
  }
  objc_msgSend_setPreferredOutputFormat_(v57, v56, (uint64_t)&unk_270E1E618);
  v58 = [UniKernel alloc];
  uint64_t v60 = objc_msgSend_initWithName_library_(v58, v59, @"disparity_refinement_insert_positive_blur_values", v11->_library);
  insertPositiveBlurValues = v11->_insertPositiveBlurValues;
  v11->_insertPositiveBlurValues = (UniKernel *)v60;

  v63 = v11->_insertPositiveBlurValues;
  if (!v63) {
    sub_262E495E4();
  }
  objc_msgSend_setPreferredOutputFormat_(v63, v62, (uint64_t)&unk_270E1E630);
  v64 = [UniKernel alloc];
  uint64_t v66 = objc_msgSend_initWithName_library_(v64, v65, @"threshold_hard_apply", v11->_library);
  thresholdHard = v11->_thresholdHard;
  v11->_thresholdHard = (UniKernel *)v66;

  v69 = v11->_thresholdHard;
  if (!v69) {
    sub_262E49610();
  }
  objc_msgSend_setPreferredOutputFormat_(v69, v68, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_thresholdHard, v70, (uint64_t)&unk_270E12938);
  v71 = [UniGaussianBlur alloc];
  v74 = objc_msgSend_device(v11->_mtlQueue, v72, v73);
  uint64_t v76 = objc_msgSend_initWithDevice_(v71, v75, (uint64_t)v74);
  gaussian = v11->_gaussian;
  v11->_gaussian = (UniGaussianBlur *)v76;

  if (!v11->_gaussian) {
    sub_262E4963C();
  }
  v78 = [UniKernel alloc];
  uint64_t v80 = objc_msgSend_initWithName_library_(v78, v79, @"map_linear_apply", v11->_library);
  mapLinear = v11->_mapLinear;
  v11->_mapLinear = (UniKernel *)v80;

  v83 = v11->_mapLinear;
  if (!v83) {
    sub_262E49668();
  }
  objc_msgSend_setPreferredOutputFormat_(v83, v82, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_mapLinear, v84, (uint64_t)&unk_270E12958);
  v85 = [UniKernel alloc];
  uint64_t v87 = objc_msgSend_initWithName_library_(v85, v86, @"map_linear_no_secondary_tex_apply", v11->_library);
  mapLinearNoSecondary = v11->_mapLinearNoSecondary;
  v11->_mapLinearNoSecondary = (UniKernel *)v87;

  v90 = v11->_mapLinearNoSecondary;
  if (!v90) {
    sub_262E49694();
  }
  objc_msgSend_setPreferredOutputFormat_(v90, v89, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_mapLinearNoSecondary, v91, (uint64_t)&unk_270E12978);
  if (qword_26B425320 != -1) {
    dispatch_once(&qword_26B425320, &unk_270E12998);
  }
  v92 = [UniKernel alloc];
  uint64_t v94 = objc_msgSend_initWithName_library_(v92, v93, @"eye_protection_face_calc", v11->_library);
  eyeProtectionFace = v11->_eyeProtectionFace;
  v11->_eyeProtectionFace = (UniKernel *)v94;

  if (!v11->_eyeProtectionFace) {
    sub_262E496C0();
  }
  v96 = [UniKernel alloc];
  uint64_t v98 = objc_msgSend_initWithName_library_(v96, v97, @"eye_protection_glasses_face_calc", v11->_library);
  eyeProtectionGlassesFace = v11->_eyeProtectionGlassesFace;
  v11->_eyeProtectionGlassesFace = (UniKernel *)v98;

  if (!v11->_eyeProtectionGlassesFace) {
    sub_262E496EC();
  }
  objc_msgSend_setPreferredOutputFormat_(v11->_eyeProtectionFace, v100, (uint64_t)&unk_270E1E600);
  objc_msgSend_setPreferredOutputFormat_(v11->_eyeProtectionGlassesFace, v101, (uint64_t)&unk_270E1E600);
  objc_msgSend_setRoiCallback_(v11->_eyeProtectionFace, v102, (uint64_t)&unk_270E129B8);
  v105 = objc_msgSend_roiCallback(v11->_eyeProtectionFace, v103, v104);
  objc_msgSend_setRoiCallback_(v11->_eyeProtectionGlassesFace, v106, (uint64_t)v105);

  v107 = [UniKernel alloc];
  uint64_t v109 = objc_msgSend_initWithName_library_(v107, v108, @"modify_blurmap_apply", v11->_library);
  modifyBlurmap = v11->_modifyBlurmap;
  v11->_modifyBlurmap = (UniKernel *)v109;

  v112 = v11->_modifyBlurmap;
  if (!v112) {
    sub_262E49718();
  }
  objc_msgSend_setPreferredOutputFormat_(v112, v111, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_modifyBlurmap, v113, (uint64_t)&unk_270E129D8);
  v114 = [UniKernel alloc];
  uint64_t v116 = objc_msgSend_initWithName_library_(v114, v115, @"modify_blurmap_glasses_apply", v11->_library);
  modifyBlurmapGlasses = v11->_modifyBlurmapGlasses;
  v11->_modifyBlurmapGlasses = (UniKernel *)v116;

  v119 = v11->_modifyBlurmapGlasses;
  if (!v119) {
    sub_262E49744();
  }
  objc_msgSend_setPreferredOutputFormat_(v119, v118, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_modifyBlurmapGlasses, v120, (uint64_t)&unk_270E129F8);
  v121 = [UniKernel alloc];
  uint64_t v123 = objc_msgSend_initWithName_library_(v121, v122, @"segmentation_fusion_apply", v11->_library);
  segmentationFusion = v11->_segmentationFusion;
  v11->_segmentationFusion = (UniKernel *)v123;

  v126 = v11->_segmentationFusion;
  if (!v126) {
    sub_262E49770();
  }
  objc_msgSend_setPreferredOutputFormat_(v126, v125, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_segmentationFusion, v127, (uint64_t)&unk_270E12A18);
  v128 = [UniKernel alloc];
  uint64_t v130 = objc_msgSend_initWithName_library_(v128, v129, @"facemask_calc", v11->_library);
  faceMaskCalc = v11->_faceMaskCalc;
  v11->_faceMaskCalc = (UniKernel *)v130;

  v133 = v11->_faceMaskCalc;
  if (!v133) {
    sub_262E4979C();
  }
  objc_msgSend_setPreferredOutputFormat_(v133, v132, (uint64_t)&unk_270E1E600);
  objc_msgSend_setRoiCallback_(v11->_faceMaskCalc, v134, (uint64_t)&unk_270E12A38);
  v135 = [UniKernel alloc];
  uint64_t v137 = objc_msgSend_initWithName_library_(v135, v136, @"facemask_apply", v11->_library);
  faceMaskApply = v11->_faceMaskApply;
  v11->_faceMaskApply = (UniKernel *)v137;

  v140 = v11->_faceMaskApply;
  if (!v140) {
    sub_262E497C8();
  }
  objc_msgSend_setPreferredOutputFormat_(v140, v139, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_faceMaskApply, v141, (uint64_t)&unk_270E12A58);
  v142 = [UniKernel alloc];
  uint64_t v144 = objc_msgSend_initWithName_library_(v142, v143, @"sparserendering_preprocess_scaled", v11->_library);
  sparseRenderingPreprocessingScaled = v11->_sparseRenderingPreprocessingScaled;
  v11->_sparseRenderingPreprocessingScaled = (UniKernel *)v144;

  v147 = v11->_sparseRenderingPreprocessingScaled;
  if (!v147) {
    sub_262E497F4();
  }
  objc_msgSend_setRoiCallback_(v147, v146, (uint64_t)&unk_270E12A78);
  v150 = objc_msgSend_device(*p_mtlQueue, v148, v149);

  if (v150)
  {
    v151 = [UniGuidedFilter alloc];
    v154 = objc_msgSend_device(v11->_mtlQueue, v152, v153);
    uint64_t v156 = objc_msgSend_initWithDevice_(v151, v155, (uint64_t)v154);
    guidedFilter = v11->_guidedFilter;
    v11->_guidedFilter = (UniKernel *)v156;

    if (!v11->_guidedFilter) {
      sub_262E49A5C();
    }
  }
  else
  {
    v158 = objc_alloc_init(UniGuidedFilter);
    v159 = v11->_guidedFilter;
    v11->_guidedFilter = &v158->super;

    if (!v11->_guidedFilter) {
      sub_262E49820();
    }
  }
  v160 = [UniKernel alloc];
  uint64_t v162 = objc_msgSend_initWithName_library_(v160, v161, @"fpDisparityRefinementPreprocessing", v11->_library);
  fpDisparityRefinementPreprocessing = v11->_fpDisparityRefinementPreprocessing;
  v11->_fpDisparityRefinementPreprocessing = (UniKernel *)v162;

  if (!v11->_fpDisparityRefinementPreprocessing) {
    sub_262E4984C();
  }
  v164 = [UniKernel alloc];
  uint64_t v166 = objc_msgSend_initWithName_library_(v164, v165, @"crispHair_BlurX", v11->_library);
  crispHairBlurX = v11->_crispHairBlurX;
  v11->_crispHairBlurX = (UniKernel *)v166;

  v169 = v11->_crispHairBlurX;
  if (!v169) {
    sub_262E49878();
  }
  objc_msgSend_setPreferredOutputFormat_(v169, v168, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurX, v170, (uint64_t)&unk_270E12A98);
  v171 = [UniKernel alloc];
  uint64_t v173 = objc_msgSend_initWithName_library_(v171, v172, @"crispHair_BlurY", v11->_library);
  crispHairBlurY = v11->_crispHairBlurY;
  v11->_crispHairBlurY = (UniKernel *)v173;

  v176 = v11->_crispHairBlurY;
  if (!v176) {
    sub_262E498A4();
  }
  objc_msgSend_setPreferredOutputFormat_(v176, v175, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurY, v177, (uint64_t)&unk_270E12AB8);
  v178 = [UniKernel alloc];
  uint64_t v180 = objc_msgSend_initWithName_library_(v178, v179, @"crispHair_BlurSingleX", v11->_library);
  crispHairBlurSingleX = v11->_crispHairBlurSingleX;
  v11->_crispHairBlurSingleX = (UniKernel *)v180;

  v183 = v11->_crispHairBlurSingleX;
  if (!v183) {
    sub_262E498D0();
  }
  objc_msgSend_setPreferredOutputFormat_(v183, v182, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurSingleX, v184, (uint64_t)&unk_270E12AD8);
  v185 = [UniKernel alloc];
  uint64_t v187 = objc_msgSend_initWithName_library_(v185, v186, @"crispHair_BlurSingleY", v11->_library);
  crispHairBlurSingleY = v11->_crispHairBlurSingleY;
  v11->_crispHairBlurSingleY = (UniKernel *)v187;

  v190 = v11->_crispHairBlurSingleY;
  if (!v190) {
    sub_262E498FC();
  }
  objc_msgSend_setPreferredOutputFormat_(v190, v189, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurSingleY, v191, (uint64_t)&unk_270E12AF8);
  v192 = [UniKernel alloc];
  uint64_t v194 = objc_msgSend_initWithName_library_(v192, v193, @"crispHair_expandedDispX", v11->_library);
  crispHairExpandedDisparityX = v11->_crispHairExpandedDisparityX;
  v11->_crispHairExpandedDisparityX = (UniKernel *)v194;

  v197 = v11->_crispHairExpandedDisparityX;
  if (!v197) {
    sub_262E49928();
  }
  objc_msgSend_setPreferredOutputFormat_(v197, v196, (uint64_t)&unk_270E1E648);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparityX, v198, (uint64_t)&unk_270E12B18);
  v199 = [UniKernel alloc];
  uint64_t v201 = objc_msgSend_initWithName_library_(v199, v200, @"crispHair_expandedDispY", v11->_library);
  crispHairExpandedDisparityY = v11->_crispHairExpandedDisparityY;
  v11->_crispHairExpandedDisparityY = (UniKernel *)v201;

  v204 = v11->_crispHairExpandedDisparityY;
  if (!v204) {
    sub_262E49954();
  }
  objc_msgSend_setPreferredOutputFormat_(v204, v203, (uint64_t)&unk_270E1E648);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparityY, v205, (uint64_t)&unk_270E12B38);
  v206 = [UniKernel alloc];
  uint64_t v208 = objc_msgSend_initWithName_library_(v206, v207, @"crispHair_expandedDispSingleY", v11->_library);
  crispHairExpandedDisparitySingleY = v11->_crispHairExpandedDisparitySingleY;
  v11->_crispHairExpandedDisparitySingleY = (UniKernel *)v208;

  v211 = v11->_crispHairExpandedDisparitySingleY;
  if (!v211) {
    sub_262E49980();
  }
  objc_msgSend_setPreferredOutputFormat_(v211, v210, (uint64_t)&unk_270E1E648);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparitySingleY, v212, (uint64_t)&unk_270E12B58);
  v213 = [UniKernel alloc];
  uint64_t v215 = objc_msgSend_initWithName_library_(v213, v214, @"crispHairDownsamplingSingle", v11->_library);
  crispHairDownsamplingSingle = v11->_crispHairDownsamplingSingle;
  v11->_crispHairDownsamplingSingle = (UniKernel *)v215;

  v218 = v11->_crispHairDownsamplingSingle;
  if (!v218) {
    sub_262E499AC();
  }
  objc_msgSend_setPreferredOutputFormat_(v218, v217, (uint64_t)&unk_270E1E648);
  objc_msgSend_setRoiCallback_(v11->_crispHairDownsamplingSingle, v219, (uint64_t)&unk_270E12B78);
  v220 = [UniKernel alloc];
  uint64_t v222 = objc_msgSend_initWithName_library_(v220, v221, @"blendBackgroundBlur", v11->_library);
  blendBackgroundBlur = v11->_blendBackgroundBlur;
  v11->_blendBackgroundBlur = (UniKernel *)v222;

  v225 = v11->_blendBackgroundBlur;
  if (!v225) {
    sub_262E499D8();
  }
  objc_msgSend_setPreferredOutputFormat_(v225, v224, (uint64_t)&unk_270E1E660);
  v226 = [UniKernel alloc];
  uint64_t v228 = objc_msgSend_initWithName_library_(v226, v227, @"sobel_yChannel_Thresholded", v11->_library);
  thresholdedSobel = v11->_thresholdedSobel;
  v11->_thresholdedSobel = (UniKernel *)v228;

  v231 = v11->_thresholdedSobel;
  if (!v231) {
    sub_262E49A04();
  }
  objc_msgSend_setRoiCallback_(v231, v230, (uint64_t)&unk_270E12B98);
  objc_msgSend_setPreferredOutputFormat_(v11->_thresholdedSobel, v232, (uint64_t)&unk_270E1E660);
  v233 = [UniMorphology alloc];
  uint64_t v235 = objc_msgSend_initWithDevice_(v233, v234, (uint64_t)v9);
  morphology = v11->_morphology;
  v11->_morphology = (UniKernel *)v235;

  v238 = v11->_morphology;
  if (!v238) {
    sub_262E49A30();
  }
  objc_msgSend_setPreferredOutputFormat_(v238, v237, (uint64_t)&unk_270E1E660);
  v239 = [UniScaleImage alloc];

  return v11;
}

- (int)allocateResourcesForShiftMapWidth:(unint64_t)a3 shiftMapHeight:(unint64_t)a4
{
  id v5 = objc_msgSend_device(self->_mtlQueue, a2, a3, a4);
  sub_262E1E0DC(1, v5);
  int v6 = (UniImage *)objc_claimAutoreleasedReturnValue();
  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = v6;

  if (!self->_minMaxTex) {
    sub_262E49F98();
  }
  uint64_t v10 = objc_msgSend_device(self->_mtlQueue, v8, v9);
  sub_262E1E0DC(1, v10);
  v11 = (UniImage *)objc_claimAutoreleasedReturnValue();
  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = v11;

  if (!self->_outputParamsImage) {
    sub_262E49FC4();
  }
  v15 = objc_msgSend_device(self->_mtlQueue, v13, v14);
  sub_262E1E0DC(9, v15);
  uint64_t v16 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = v16;

  if (!self->_faceParamsTex) {
    sub_262E49FF0();
  }
  uint64_t v20 = objc_msgSend_device(self->_mtlQueue, v18, v19);
  sub_262E1E0DC(8, v20);
  v21 = (UniImage *)objc_claimAutoreleasedReturnValue();
  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = v21;

  if (!self->_eyeProtectionFacesTex) {
    sub_262E4A01C();
  }
  v25 = objc_msgSend_device(self->_mtlQueue, v23, v24);
  sub_262E1E0DC(9, v25);
  v26 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = v26;

  if (!self->_faceMaskOutputParamsTex) {
    sub_262E4A048();
  }
  return 0;
}

- (int)allocateFakeResources
{
  long long v4 = (void *)MEMORY[0x263F00650];
  id v5 = objc_msgSend_whiteColor(MEMORY[0x263F00608], a2, v2);
  uint64_t v7 = objc_msgSend_imageWithColor_(v4, v6, (uint64_t)v5);

  uint64_t v10 = objc_msgSend_imageByCroppingToRect_(v7, v8, v9, 0.0, 0.0, 1.0, 1.0);
  objc_msgSend_imageWithCIImage_(UniImage, v11, (uint64_t)v10);
  v12 = (UniImage *)objc_claimAutoreleasedReturnValue();
  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = v12;

  uint64_t v16 = objc_msgSend_imageByCroppingToRect_(v7, v14, v15, 0.0, 0.0, 1.0, 1.0);
  objc_msgSend_imageWithCIImage_(UniImage, v17, (uint64_t)v16);
  v18 = (UniImage *)objc_claimAutoreleasedReturnValue();
  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = v18;

  v22 = objc_msgSend_imageByCroppingToRect_(v7, v20, v21, 0.0, 0.0, 9.0, 1.0);
  objc_msgSend_imageWithCIImage_(UniImage, v23, (uint64_t)v22);
  uint64_t v24 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = v24;

  v28 = objc_msgSend_imageByCroppingToRect_(v7, v26, v27, 0.0, 0.0, 8.0, 1.0);
  objc_msgSend_imageWithCIImage_(UniImage, v29, (uint64_t)v28);
  v30 = (UniImage *)objc_claimAutoreleasedReturnValue();
  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = v30;

  v34 = objc_msgSend_imageByCroppingToRect_(v7, v32, v33, 0.0, 0.0, 9.0, 1.0);
  objc_msgSend_imageWithCIImage_(UniImage, v35, (uint64_t)v34);
  v36 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = v36;

  return 0;
}

- (int)loadShaders
{
  v229[1] = *MEMORY[0x263EF8340];
  _S8 = -1.0
      / (float)(self->_disparity_refinement_config_params.weightScaling
              * (float)(self->_disparity_refinement_config_params.weightScaling
                      + self->_disparity_refinement_config_params.weightScaling));
  _S15 = -1.0
       / (float)(self->_disparity_refinement_config_params.lumaSigma
               * (float)(self->_disparity_refinement_config_params.lumaSigma
                       + self->_disparity_refinement_config_params.lumaSigma));
  _S14 = -1.0
       / (float)(self->_disparity_refinement_config_params.chromaSigma
               * (float)(self->_disparity_refinement_config_params.chromaSigma
                       + self->_disparity_refinement_config_params.chromaSigma));
  _S13 = -1.0
       / (float)(self->_disparity_refinement_config_params.segmentationSigma
               * (float)(self->_disparity_refinement_config_params.segmentationSigma
                       + self->_disparity_refinement_config_params.segmentationSigma));
  _S12 = -1.0
       / (float)(self->_disparity_refinement_config_params.disparitySigma
               * (float)(self->_disparity_refinement_config_params.disparitySigma
                       + self->_disparity_refinement_config_params.disparitySigma));
  _S11 = -1.0
       / (float)(self->_disparity_refinement_config_params.aaLumaSigma
               * (float)(self->_disparity_refinement_config_params.aaLumaSigma
                       + self->_disparity_refinement_config_params.aaLumaSigma));
  _S10 = -1.0
       / (float)(self->_disparity_refinement_config_params.aaChromaSigma
               * (float)(self->_disparity_refinement_config_params.aaChromaSigma
                       + self->_disparity_refinement_config_params.aaChromaSigma));
  float aaSpatialSigma = self->_disparity_refinement_config_params.aaSpatialSigma;
  _S9 = -1.0
      / (float)(self->_disparity_refinement_config_params.aaSegmentationSigma
              * (float)(self->_disparity_refinement_config_params.aaSegmentationSigma
                      + self->_disparity_refinement_config_params.aaSegmentationSigma));
  uint64_t v228 = @"DisparityRefinement::kRadius";
  float v218 = -1.0 / (float)(aaSpatialSigma * (float)(aaSpatialSigma + aaSpatialSigma));
  v12 = objc_msgSend_numberWithInt_(NSNumber, a2, self->_disparity_refinement_config_params.radius);
  v229[0] = v12;
  v219 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v229, &v228, 1);

  v226[0] = @"DisparityRefinement::kRadius";
  uint64_t v15 = objc_msgSend_numberWithInt_(NSNumber, v14, self->_disparity_refinement_config_params.radius);
  v226[1] = @"DisparityRefinement::kWeightScaling_ushort";
  v227[0] = v15;
  __asm { FCVT            H0, S8 }
  v22 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v21, _S0);
  v227[1] = v22;
  v212 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v227, v226, 2);

  v224[0] = @"DisparityRefinement::kNumSamples";
  v217 = objc_msgSend_numberWithInt_(NSNumber, v24, self->_disparity_refinement_config_params.nSamples);
  v225[0] = v217;
  v224[1] = @"DisparityRefinement::kInnerSamplingRadius_ushort";
  _S0 = self->_disparity_refinement_config_params.innerSamplingRadius;
  __asm { FCVT            H0, S0 }
  v216 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v26, LODWORD(_S0));
  v225[1] = v216;
  v224[2] = @"DisparityRefinement::kOuterSamplingRadius_ushort";
  _S0 = self->_disparity_refinement_config_params.outerSamplingRadius;
  __asm { FCVT            H0, S0 }
  uint64_t v215 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v28, LODWORD(_S0));
  v225[2] = v215;
  v224[3] = @"DisparityRefinement::kColorSegScaling_ushort";
  __asm { FCVT            H0, S15 }
  v214 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v30, _S0);
  v223[0] = v214;
  __asm { FCVT            H0, S14 }
  uint64_t v32 = _S0;
  v213 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v33, _S0);
  v223[1] = v213;
  v35 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v34, v32);
  v223[2] = v35;
  __asm { FCVT            H0, S13 }
  uint64_t v38 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v37, _S0);
  v223[3] = v38;
  v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v39, (uint64_t)v223, 4);
  v225[3] = v40;
  v224[4] = @"DisparityRefinement::kDisparityVarianceScaling_ushort";
  __asm { FCVT            H0, S12 }
  v43 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v42, _S0);
  v225[4] = v43;
  v224[5] = @"DisparityRefinement::kAccumulatedWeightT0_ushort";
  _S0 = self->_disparity_refinement_config_params.accumulatedWeightT0;
  __asm { FCVT            H0, S0 }
  v46 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v45, LODWORD(_S0));
  v225[5] = v46;
  v224[6] = @"DisparityRefinement::kAccumulatedWeightT1_ushort";
  _S0 = self->_disparity_refinement_config_params.accumulatedWeightT1;
  __asm { FCVT            H0, S0 }
  v49 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v48, LODWORD(_S0));
  v225[6] = v49;
  v224[7] = @"DisparityRefinement::kRadius";
  v51 = objc_msgSend_numberWithInt_(NSNumber, v50, self->_disparity_refinement_config_params.radius);
  v225[7] = v51;
  v224[8] = @"DisparityRefinement::kMaxReconstructionWeight_ushort";
  _S0 = self->_disparity_refinement_config_params.maxReconstructionWeight;
  __asm { FCVT            H0, S0 }
  uint64_t v54 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v53, LODWORD(_S0));
  v224[9] = @"CoreImageMetalAbstraction::kEmulateBicubic";
  v225[8] = v54;
  v225[9] = &unk_270E1E678;
  v211 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v225, v224, 10);

  v221[0] = @"DisparityRefinement::kMaxReconstructionWeight_ushort";
  _S0 = self->_disparity_refinement_config_params.maxReconstructionWeight;
  __asm { FCVT            H0, S0 }
  v58 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v57, LODWORD(_S0));
  v222[0] = v58;
  v221[1] = @"DisparityRefinement::kAAColorSegScaling_ushort";
  __asm { FCVT            H0, S11 }
  v61 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v60, _S0);
  v220[0] = v61;
  __asm { FCVT            H0, S10 }
  uint64_t v63 = _S0;
  v65 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v64, _S0);
  v220[1] = v65;
  v67 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v66, v63);
  v220[2] = v67;
  __asm { FCVT            H0, S9 }
  v70 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v69, _S0);
  v220[3] = v70;
  v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v71, (uint64_t)v220, 4);
  v222[1] = v72;
  v221[2] = @"DisparityRefinement::kAASpatialScaling_ushort";
  _S0 = v218;
  __asm { FCVT            H0, S0 }
  v75 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v74, LODWORD(_S0));
  v221[3] = @"CoreImageMetalAbstraction::kEmulateBicubic";
  v222[2] = v75;
  v222[3] = &unk_270E1E678;
  v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v76, (uint64_t)v222, v221, 4);

  v79 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v78, (uint64_t)v77);
  _S0 = self->_disparity_refinement_config_params.fgBlurScale;
  __asm { FCVT            H0, S0 }
  v82 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v81, LODWORD(_S0));
  objc_msgSend_setObject_forKeyedSubscript_(v79, v83, (uint64_t)v82, @"DisparityRefinement::kFgBlurScale_ushort");

  _S0 = self->_disparity_refinement_config_params.fgBlurClamp;
  __asm { FCVT            H0, S0 }
  v86 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v85, LODWORD(_S0));
  objc_msgSend_setObject_forKeyedSubscript_(v79, v87, (uint64_t)v86, @"DisparityRefinement::kFgBlurClamp_ushort");

  _S0 = self->_disparity_refinement_config_params.fgDeadZoneOffset;
  __asm { FCVT            H0, S0 }
  v90 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v89, LODWORD(_S0));
  objc_msgSend_setObject_forKeyedSubscript_(v79, v91, (uint64_t)v90, @"DisparityRefinement::kFgDeadZoneOffset_ushort");

  v92 = [UniKernel alloc];
  uint64_t v94 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v92, v93, @"disparity_refinement_calcweightsX", self->_library, v219);
  calcWeightsX = self->_calcWeightsX;
  self->_calcWeightsX = v94;

  v97 = self->_calcWeightsX;
  if (!v97) {
    sub_262E4A074();
  }
  objc_msgSend_setPreferredOutputFormat_(v97, v96, (uint64_t)&unk_270E1E660);
  objc_msgSend_setRoiCallback_(self->_calcWeightsX, v98, (uint64_t)&unk_270E12BB8);
  v99 = [UniKernel alloc];
  v101 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v99, v100, @"disparity_refinement_calcweightsY", self->_library, v212);
  calcWeightsY = self->_calcWeightsY;
  self->_calcWeightsY = v101;

  uint64_t v104 = self->_calcWeightsY;
  if (!v104) {
    sub_262E4A0A0();
  }
  objc_msgSend_setPreferredOutputFormat_(v104, v103, (uint64_t)&unk_270E1E660);
  objc_msgSend_setRoiCallback_(self->_calcWeightsY, v105, (uint64_t)&unk_270E12BD8);
  v106 = [UniKernel alloc];
  v108 = (UniKernel *)objc_msgSend_initWithName_library_(v106, v107, @"disparity_refinement_preproc", self->_library);
  preprocessing = self->_preprocessing;
  self->_preprocessing = v108;

  v111 = self->_preprocessing;
  if (!v111) {
    sub_262E4A0CC();
  }
  objc_msgSend_setPreferredOutputFormat_(v111, v110, (uint64_t)&unk_270E1E690);
  objc_msgSend_setRoiCallback_(self->_preprocessing, v112, (uint64_t)&unk_270E12BF8);
  v113 = [UniKernel alloc];
  v115 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v113, v114, @"disparity_refinement_sample", self->_library, v211);
  sample = self->_sample;
  self->_sample = v115;

  v118 = self->_sample;
  if (!v118) {
    sub_262E4A0F8();
  }
  objc_msgSend_setPreferredOutputFormat_(v118, v117, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(self->_sample, v119, (uint64_t)&unk_270E12C18);
  v120 = [UniKernel alloc];
  v122 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v120, v121, @"disparity_refinement_antialias", self->_library, v77);
  antialias = self->_antialias;
  self->_antialias = v122;

  v125 = self->_antialias;
  if (!v125) {
    sub_262E4A124();
  }
  objc_msgSend_setPreferredOutputFormat_(v125, v124, (uint64_t)&unk_270E1E618);
  objc_msgSend_setRoiCallback_(self->_antialias, v126, (uint64_t)&unk_270E12C38);
  v127 = [UniKernel alloc];
  v129 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v127, v128, @"disparity_refinement_antialias_with_foreground_blur", self->_library, v79);
  antialiasWithForegroundBlur = self->_antialiasWithForegroundBlur;
  self->_antialiasWithForegroundBlur = v129;

  v132 = self->_antialiasWithForegroundBlur;
  if (!v132) {
    sub_262E4A150();
  }
  objc_msgSend_setPreferredOutputFormat_(v132, v131, (uint64_t)&unk_270E1E630);
  objc_msgSend_setRoiCallback_(self->_antialiasWithForegroundBlur, v133, (uint64_t)&unk_270E12C58);
  v134 = [UniKernel alloc];
  v136 = (UniKernel *)objc_msgSend_initWithName_library_(v134, v135, @"blurmap_x_smoothing", self->_library);
  blurmap_x_smoothing = self->_blurmap_x_smoothing;
  self->_blurmap_x_smoothing = v136;

  v139 = self->_blurmap_x_smoothing;
  if (!v139) {
    sub_262E4A17C();
  }
  objc_msgSend_setPreferredOutputFormat_(v139, v138, (uint64_t)&unk_270E1E630);
  v140 = [UniKernel alloc];
  v142 = (UniKernel *)objc_msgSend_initWithName_library_(v140, v141, @"blurmap_y_smoothing", self->_library);
  blurmap_y_smoothing = self->_blurmap_y_smoothing;
  self->_blurmap_y_smoothing = v142;

  v145 = self->_blurmap_y_smoothing;
  if (!v145) {
    sub_262E4A1A8();
  }
  objc_msgSend_setPreferredOutputFormat_(v145, v144, (uint64_t)&unk_270E1E618);
  v146 = [UniKernel alloc];
  v148 = (UniKernel *)objc_msgSend_initWithName_library_(v146, v147, @"blurmap_x_smoothing_scaled", self->_library);
  blurmap_x_smoothing_scaled = self->_blurmap_x_smoothing_scaled;
  self->_blurmap_x_smoothing_scaled = v148;

  v151 = self->_blurmap_x_smoothing_scaled;
  if (!v151) {
    sub_262E4A1D4();
  }
  objc_msgSend_setPreferredOutputFormat_(v151, v150, (uint64_t)&unk_270E1E630);
  v152 = [UniKernel alloc];
  v154 = (UniKernel *)objc_msgSend_initWithName_library_(v152, v153, @"blurmap_y_smoothing_scaled", self->_library);
  blurmap_y_smoothing_scaled = self->_blurmap_y_smoothing_scaled;
  self->_blurmap_y_smoothing_scaled = v154;

  v157 = self->_blurmap_y_smoothing_scaled;
  if (!v157) {
    sub_262E4A200();
  }
  objc_msgSend_setPreferredOutputFormat_(v157, v156, (uint64_t)&unk_270E1E618);
  v158 = [UniKernel alloc];
  v160 = (UniKernel *)objc_msgSend_initWithName_library_(v158, v159, @"blurmap_x_smoothing_unbiased", self->_library);
  blurmap_x_smoothing_unbiased = self->_blurmap_x_smoothing_unbiased;
  self->_blurmap_x_smoothing_unbiased = v160;

  if (!self->_blurmap_x_smoothing_unbiased) {
    sub_262E4A22C();
  }
  v164 = objc_msgSend_preferredOutputFormat(self->_blurmap_x_smoothing, v162, v163);
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_x_smoothing_unbiased, v165, (uint64_t)v164);

  uint64_t v166 = [UniKernel alloc];
  v168 = (UniKernel *)objc_msgSend_initWithName_library_(v166, v167, @"blurmap_y_smoothing_unbiased", self->_library);
  blurmap_y_smoothing_unbiased = self->_blurmap_y_smoothing_unbiased;
  self->_blurmap_y_smoothing_unbiased = v168;

  if (!self->_blurmap_y_smoothing_unbiased) {
    sub_262E4A258();
  }
  v172 = objc_msgSend_preferredOutputFormat(self->_blurmap_y_smoothing, v170, v171);
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_y_smoothing_unbiased, v173, (uint64_t)v172);

  v174 = [UniKernel alloc];
  v176 = (UniKernel *)objc_msgSend_initWithName_library_(v174, v175, @"blurmap_x_smoothing_scaled_unbiased", self->_library);
  blurmap_x_smoothing_scaled_unbiased = self->_blurmap_x_smoothing_scaled_unbiased;
  self->_blurmap_x_smoothing_scaled_unbiased = v176;

  if (!self->_blurmap_x_smoothing_scaled_unbiased) {
    sub_262E4A284();
  }
  uint64_t v180 = objc_msgSend_preferredOutputFormat(self->_blurmap_x_smoothing_scaled, v178, v179);
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_x_smoothing_scaled_unbiased, v181, (uint64_t)v180);

  v182 = [UniKernel alloc];
  v184 = (UniKernel *)objc_msgSend_initWithName_library_(v182, v183, @"blurmap_y_smoothing_scaled_unbiased", self->_library);
  blurmap_y_smoothing_scaled_unbiased = self->_blurmap_y_smoothing_scaled_unbiased;
  self->_blurmap_y_smoothing_scaled_unbiased = v184;

  if (!self->_blurmap_y_smoothing_scaled_unbiased) {
    sub_262E4A2B0();
  }
  v188 = objc_msgSend_preferredOutputFormat(self->_blurmap_y_smoothing_scaled, v186, v187);
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_y_smoothing_scaled_unbiased, v189, (uint64_t)v188);

  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing, v190, (uint64_t)&unk_270E12C78);
  v193 = objc_msgSend_roiCallback(self->_blurmap_x_smoothing, v191, v192);
  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_unbiased, v194, (uint64_t)v193);

  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing, v195, (uint64_t)&unk_270E12C98);
  v198 = objc_msgSend_roiCallback(self->_blurmap_y_smoothing, v196, v197);
  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_unbiased, v199, (uint64_t)v198);

  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_scaled, v200, (uint64_t)&unk_270E12CB8);
  v203 = objc_msgSend_roiCallback(self->_blurmap_x_smoothing_scaled, v201, v202);
  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_scaled_unbiased, v204, (uint64_t)v203);

  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_scaled, v205, (uint64_t)&unk_270E12CD8);
  uint64_t v208 = objc_msgSend_roiCallback(self->_blurmap_y_smoothing_scaled, v206, v207);
  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_scaled_unbiased, v209, (uint64_t)v208);

  return 0;
}

- (void)deallocateResources
{
  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = 0;

  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = 0;

  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = 0;

  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = 0;

  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = 0;
}

- (void)dealloc
{
  objc_msgSend_deallocateResources(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)MakeBlurMap;
  [(MakeBlurMap *)&v4 dealloc];
}

- (id)performBlurmapSmoothingUsingSmoothingConfig:(const blurmap_smoothing_params *)a3 inputBlurMap:(id)a4 inputIntermediateTex:(id)a5 outputSmoothedBlurmap:(id)a6 scale:(float)a7 version:(int)a8 context:(id)a9
{
  v125[5] = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = v16;
  v23 = v20;
  id v24 = v20;
  if (a3->var0 >= 1)
  {
    id v108 = v19;
    objc_msgSend_extent(v20, v21, v22);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    int v34 = objc_msgSend_conformsToProtocol_(v17, v33, (uint64_t)&unk_270E2A1A0);
    id v35 = v17;
    uint64_t v38 = v35;
    id v114 = v18;
    int v115 = a8;
    if (v34)
    {
      uint64_t v39 = objc_msgSend_pixelFormat(v35, v36, v37);
      v40 = tmpTexturesFromTexture(v38, 1u, v39);

      v42 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0);
      uint64_t v117 = objc_msgSend_texture(v42, v43, v44);
    }
    else
    {
      uint64_t v117 = (uint64_t)v35;
    }
    v124[0] = @"nIterations";
    v45 = objc_msgSend_numberWithInt_(NSNumber, v36, a3->var0);
    v125[0] = v45;
    v124[1] = @"originalBlurValueT0";
    *(float *)&double v46 = a3->var1;
    v49 = objc_msgSend_numberWithFloat_(NSNumber, v47, v48, v46);
    v125[1] = v49;
    v124[2] = @"originalBlurValueT1";
    *(float *)&double v50 = a3->var2;
    v53 = objc_msgSend_numberWithFloat_(NSNumber, v51, v52, v50);
    v125[2] = v53;
    v124[3] = @"localMinimumBlurValueT0";
    *(float *)&double v54 = a3->var3;
    v57 = objc_msgSend_numberWithFloat_(NSNumber, v55, v56, v54);
    v125[3] = v57;
    v124[4] = @"localMinimumBlurValueT1";
    v58 = a3;
    *(float *)&double v59 = a3->var4;
    v62 = objc_msgSend_numberWithFloat_(NSNumber, v60, v61, v59);
    v125[4] = v62;
    v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)v125, v124, 5);

    id v24 = v23;
    uint64_t v64 = 464;
    if (a7 >= 1.0) {
      uint64_t v64 = 448;
    }
    v65 = *(Class *)((char *)&self->super.isa + v64);
    if (a7 < 1.0) {
      uint64_t v66 = 472;
    }
    else {
      uint64_t v66 = 456;
    }
    id v67 = v65;
    id v68 = *(id *)((char *)&self->super.isa + v66);
    if (v115 >= 4)
    {
      uint64_t v69 = 496;
      if (a7 >= 1.0) {
        uint64_t v69 = 480;
      }
      v70 = *(Class *)((char *)&self->super.isa + v69);
      if (a7 < 1.0) {
        uint64_t v71 = 504;
      }
      else {
        uint64_t v71 = 488;
      }
      id v72 = v70;

      id v73 = *(id *)((char *)&self->super.isa + v71);
      id v67 = v72;
      id v68 = v73;
    }
    v74 = [UniRunInfo alloc];
    v119[0] = (unint64_t)(v30 * 0.5);
    v119[1] = (unint64_t)(v32 * 0.5);
    v119[2] = 1;
    uint64_t v76 = objc_msgSend_initWithGridSize_kernel_(v74, v75, (uint64_t)v119, v67);
    objc_msgSend_setCoreImageOutputExtent_(v76, v77, v78, v26, v28, v30, v32);
    v79 = [UniRunInfo alloc];
    v118[0] = (unint64_t)(v30 * 0.5);
    v118[1] = (unint64_t)(v32 * 0.5);
    v118[2] = 1;
    v81 = objc_msgSend_initWithGridSize_kernel_(v79, v80, (uint64_t)v118, v68);
    objc_msgSend_setCoreImageOutputExtent_(v81, v82, v83, v26, v28, v30, v32);
    uint64_t v109 = v23;
    id v87 = v67;
    if (a7 > 1.0)
    {

      uint64_t v76 = 0;
      v81 = 0;
    }
    v111 = v81;
    v112 = v68;
    int var0 = v58->var0;
    uint64_t v116 = v24;
    id v19 = v108;
    v89 = v58;
    v90 = (void *)v117;
    v91 = v87;
    v92 = v76;
    if (var0 >= 1)
    {
      int v93 = 0;
      v110 = v89;
      do
      {
        v122[0] = @"inputTex";
        v122[1] = @"outputTex";
        v123[0] = v24;
        v123[1] = v90;
        v123[2] = v108;
        v122[2] = @"_renderContext";
        v122[3] = @"_kernelScale";
        *(float *)&double v86 = a7;
        uint64_t v94 = objc_msgSend_numberWithFloat_(NSNumber, v84, v85, v86);
        v123[3] = v94;
        v96 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v95, (uint64_t)v123, v122, 4);
        objc_msgSend_imageByApplyingParameters_runInfo_(v91, v97, (uint64_t)v96, v92);
        v99 = uint64_t v98 = v91;

        v120[0] = @"params";
        v120[1] = @"referenceTex";
        v121[0] = v113;
        v121[1] = v116;
        v120[2] = @"inputTex";
        v120[3] = @"outputTex";
        v121[2] = v99;
        v121[3] = v114;
        v121[4] = v108;
        v120[4] = @"_renderContext";
        v120[5] = @"_kernelScale";
        *(float *)&double v100 = a7;
        v103 = objc_msgSend_numberWithFloat_(NSNumber, v101, v102, v100);
        v121[5] = v103;
        v105 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v104, (uint64_t)v121, v120, 6);
        objc_msgSend_imageByApplyingParameters_runInfo_(v112, v106, (uint64_t)v105, v111);
        id v24 = (id)objc_claimAutoreleasedReturnValue();

        v91 = v98;
        v90 = (void *)v117;

        ++v93;
      }
      while (v93 < v110->var0);
    }

    v23 = v109;
    id v18 = v114;
  }

  return v24;
}

- (id)performDisparityRefinementViaMatting:(id)a3 inputShiftmap:(id)a4 focusRect:(CGRect)a5 inputLuma:(id)a6 inputChroma:(id)a7 simpleLensModelCalculatorImage:(id)a8 disparityConfigIndex:(int)a9 outputRefinedImage:(id)a10 tmpRGB:(id)a11 tmpDisparity:(id)a12 tmpRGBA:(id)a13 SDOFVersion:(int)a14 mattingParams:(id *)a15 context:(id)a16
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v195[7] = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = a7;
  id v28 = a8;
  id v185 = a10;
  id v29 = a11;
  id v30 = a12;
  id v31 = a13;
  id v32 = a16;
  if (!v24)
  {
    id v41 = v25;
    v36 = v25;
    goto LABEL_42;
  }
  id v176 = v27;
  id v177 = v25;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v187 = xmmword_262E516C8;
  long long v188 = unk_262E516D8;
  long long v189 = xmmword_262E516E8;
  id v178 = v30;
  id v179 = v28;
  if (a9 == 5 && a14 >= 4)
  {
    DWORD2(v189) = 1051931443;
    float v35 = 4.0;
    v36 = v25;
    uint64_t v37 = v185;
    uint64_t v38 = a15;
LABEL_5:
    *(float *)&long long v189 = v35;
    goto LABEL_6;
  }
  uint64_t v38 = a15;
  if (a9 == 4 && a14 <= 3)
  {
    DWORD2(v189) = 1051931443;
    v36 = v25;
    uint64_t v37 = v185;
    goto LABEL_14;
  }
  v36 = v25;
  uint64_t v37 = v185;
  if (a9 == 7)
  {
    DWORD2(v189) = 1048576000;
    LODWORD(v188) = 1065353216;
    HIDWORD(v188) = 1084227584;
    float v35 = 1.0;
    goto LABEL_5;
  }
  if (a9 == 6)
  {
    DWORD2(v189) = 1036831949;
    float v35 = 8.0;
    goto LABEL_5;
  }
LABEL_6:
  if (a14 > 4)
  {
    if (!v38)
    {
      uint64_t v39 = v24;
      v40 = uni_logger_api();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_262E4A608(v40, v113, v114, v115, v116, v117, v118, v119);
      }
      goto LABEL_40;
    }
    if (a9 != 0xFFFF)
    {
      uint64_t v39 = v24;
      v40 = uni_logger_api();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_262E4A680(v40, v163, v164, v165, v166, v167, v168, v169);
      }
      goto LABEL_40;
    }
    goto LABEL_18;
  }
  if ((a9 - 7) > 0xFFFFFFF9)
  {
LABEL_14:
    if (!v38)
    {
      char v171 = isKindOfClass;
      id v181 = v31;
      id v42 = v29;
      float v43 = 0.75;
LABEL_19:
      float v45 = x;
      float v46 = y;
      *(float *)v186 = v45;
      *(float *)&v186[1] = v46;
      float v47 = width;
      float v48 = height;
      *(float *)&v186[2] = v47;
      *(float *)&v186[3] = v48;
      *(float *)&v186[4] = v43;
      uint64_t v49 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v34, (uint64_t)&v187, 48);
      uint64_t v51 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v50, (uint64_t)v186, 20);
      fpDisparityRefinementPreprocessing = self->_fpDisparityRefinementPreprocessing;
      v194[0] = @"alpha";
      v194[1] = @"inputDisparity";
      v195[1] = v36;
      v195[2] = v178;
      v194[2] = @"outputDisparity";
      v194[3] = @"focusRect";
      v174 = (void *)v51;
      v175 = (void *)v49;
      v195[3] = v51;
      v195[4] = v49;
      v194[4] = @"config";
      v194[5] = @"zeroShiftTex";
      v194[6] = @"_renderContext";
      v195[0] = v24;
      v195[5] = v179;
      v195[6] = v32;
      double v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)v195, v194, 7);
      uint64_t v56 = objc_msgSend_imageByApplyingParameters_(fpDisparityRefinementPreprocessing, v55, (uint64_t)v54);

      if (!v56) {
        sub_262E4A584();
      }
      sparseRenderingPreprocessingScaled = self->_sparseRenderingPreprocessingScaled;
      v192[0] = @"inputChromaTex";
      v192[1] = @"inputLumaTex";
      v193[0] = v176;
      v193[1] = v26;
      id v173 = v26;
      v193[2] = v24;
      uint64_t v60 = v42;
      v192[2] = @"inputBlurMapTex";
      v192[3] = @"outputTex";
      if (!v42)
      {
        uint64_t v60 = objc_msgSend_null(MEMORY[0x263EFF9D0], v57, v58);
      }
      v192[4] = @"_renderContext";
      v193[3] = v60;
      v193[4] = v32;
      uint64_t v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v193, v192, 5);
      uint64_t v63 = objc_msgSend_imageByApplyingParameters_(sparseRenderingPreprocessingScaled, v62, (uint64_t)v61);

      v172 = v42;
      if (!v42) {

      }
      objc_msgSend_extent(v63, v64, v65);
      CGFloat v67 = v66;
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      CGFloat v73 = v72;
      objc_msgSend_extent(v37, v74, v75);
      v199.origin.double x = v76;
      v199.origin.double y = v77;
      v199.size.double width = v78;
      v199.size.double height = v79;
      v197.origin.double x = v67;
      v197.origin.double y = v69;
      v197.size.double width = v71;
      v197.size.double height = v73;
      if (!CGRectEqualToRect(v197, v199)) {
        sub_262E4A5DC();
      }
      objc_msgSend_extent(v24, v80, v81);
      CGFloat v83 = v82;
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      CGFloat v89 = v88;
      objc_msgSend_extent(v37, v90, v91);
      v200.origin.double x = v92;
      v200.origin.double y = v93;
      v200.size.double width = v94;
      v200.size.double height = v95;
      v198.origin.double x = v83;
      v198.origin.double y = v85;
      v198.size.double width = v87;
      v198.size.double height = v89;
      v182 = v63;
      v183 = (void *)v56;
      if (CGRectEqualToRect(v198, v200))
      {
        id v99 = v32;
        uint64_t v39 = v24;
        double v100 = self;
      }
      else
      {
        if (v171)
        {
          v101 = (void *)MEMORY[0x263F00650];
          uint64_t v102 = objc_msgSend_blackColor(MEMORY[0x263F00608], v96, v97);
          uint64_t v104 = objc_msgSend_imageWithColor_(v101, v103, (uint64_t)v102);
          objc_msgSend_extent(v37, v105, v106);
          uint64_t v109 = objc_msgSend_imageByCroppingToRect_(v104, v107, v108);

          v110 = [UniFakeImage alloc];
          v112 = objc_msgSend_initWithCIImage_format_(v110, v111, (uint64_t)v109, 10);
          double v100 = self;
        }
        else
        {
          v120 = (void *)MEMORY[0x263F12A50];
          objc_msgSend_extent(v37, v96, v97);
          unint64_t v122 = (unint64_t)v121;
          objc_msgSend_extent(v37, v123, v124);
          uint64_t v109 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v120, v126, 10, v122, (unint64_t)v125, 0);
          objc_msgSend_setUsage_(v109, v127, 19);
          double v100 = self;
          uint64_t v130 = objc_msgSend_device(self->_mtlQueue, v128, v129);
          v132 = objc_msgSend_newTextureWithDescriptor_(v130, v131, (uint64_t)v109);

          v112 = objc_msgSend_imageWithMTLTexture_(UniImage, v133, (uint64_t)v132);
        }
        objc_msgSend_extent(v37, v134, v135);
        double v137 = v136;
        double v139 = v138;
        v142 = objc_msgSend_device(v100->_mtlQueue, v140, v141);
        id v99 = v32;
        uint64_t v39 = objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(v100, v143, (uint64_t)v24, v142, 0, v112, v32, v137, v139);

        if (!v39) {
          sub_262E4A5B0();
        }

        uint64_t v63 = v182;
      }
      guidedFilter = v100->_guidedFilter;
      v190[0] = @"source";
      v190[1] = @"guidance";
      v191[0] = v183;
      v191[1] = v63;
      v190[2] = @"weights";
      v190[3] = @"destinationCoefficients";
      v191[2] = v39;
      v191[3] = v37;
      v190[4] = @"spatialDiameter";
      *(float *)&double v98 = (float)(*((float *)&v188 + 3) * 2.0) + 1.0;
      v145 = objc_msgSend_numberWithFloat_(NSNumber, v96, v97, v98);
      v191[4] = v145;
      v190[5] = @"subsampleFactor";
      LODWORD(v146) = v189;
      uint64_t v149 = objc_msgSend_numberWithFloat_(NSNumber, v147, v148, v146);
      v191[5] = v149;
      v190[6] = @"epsilon";
      LODWORD(v150) = DWORD1(v189);
      uint64_t v153 = objc_msgSend_numberWithFloat_(NSNumber, v151, v152, v150);
      v191[6] = v153;
      v190[7] = @"iterations";
      v155 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v154, HIDWORD(v189));
      v191[7] = v155;
      v191[8] = v99;
      id v32 = v99;
      v190[8] = @"_renderContext";
      v190[9] = @"rgbWeight";
      LODWORD(v156) = DWORD2(v189);
      v159 = objc_msgSend_numberWithFloat_(NSNumber, v157, v158, v156);
      v191[9] = v159;
      v161 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v160, (uint64_t)v191, v190, 10);
      objc_msgSend_imageByApplyingParameters_(guidedFilter, v162, (uint64_t)v161);
      id v41 = (id)objc_claimAutoreleasedReturnValue();

      id v27 = v176;
      v36 = v177;
      id v29 = v172;
      id v26 = v173;
      id v30 = v178;
      id v31 = v181;
      goto LABEL_41;
    }
LABEL_18:
    char v171 = isKindOfClass;
    id v181 = v31;
    id v42 = v29;
    long long v44 = *(_OWORD *)&v38->var4;
    long long v187 = *(_OWORD *)&v38->var0;
    long long v188 = v44;
    long long v189 = *(_OWORD *)&v38->var8;
    float v43 = *(float *)&v187;
    goto LABEL_19;
  }
  uint64_t v39 = v24;
  v40 = uni_logger_api();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    sub_262E4A4D4(a9, v40);
  }
LABEL_40:

  id v41 = 0;
  id v30 = v178;
LABEL_41:

  id v28 = v179;
LABEL_42:

  return v41;
}

- (id)performDisparityRefinementUsingParams:(const disparity_refinement_params *)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 inputImageLuma:(id)a6 inputImageChroma:(id)a7 inputSlmParams:(id)a8 inputWeightsX:(id)a9 inputWeightsY:(id)a10 inputPreproc:(id)a11 inputSampledD:(id)a12 outputBlurMap:(id)a13 scale:(float)a14 havePerformedMatting:(BOOL)a15 editTimeRender:(BOOL)a16 context:(id)a17 enableFGBlur:(BOOL)a18
{
  v193[4] = *MEMORY[0x263EF8340];
  id v165 = a4;
  id v162 = a5;
  id v24 = a6;
  id v170 = a7;
  id v25 = a8;
  id v164 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a17;
  uint64_t v169 = v27;
  char v171 = v30;
  if (!objc_msgSend_setOptions_isPrewarm_(self, v31, (uint64_t)a3, 0))
  {
    id v163 = v28;
    objc_msgSend_extent(v29, v32, v33);
    double v35 = v34;
    double v37 = v36;
    objc_msgSend_extent(v165, v38, v39);
    double v41 = v40;
    double v43 = v42;
    objc_msgSend_extent(v27, v44, v45);
    BOOL v51 = v41 != v35;
    if (v43 != v37) {
      BOOL v51 = 1;
    }
    BOOL v52 = (v51 || a16) && !a15;
    v53 = v165;
    if (!v52)
    {
      passthrough = self->_passthrough;
      v192[0] = @"slmParamsTex";
      id v55 = v25;
      v193[0] = v25;
      v192[1] = @"inputShiftMapTex";
      v193[1] = v165;
      v192[2] = @"outputBlurmapTex";
      uint64_t v56 = v29;
      if (!v29)
      {
        uint64_t v56 = objc_msgSend_null(MEMORY[0x263EFF9D0], v46, v47);
      }
      v193[2] = v56;
      v192[3] = @"_renderContext";
      v193[3] = v30;
      v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)v193, v192, 4);
      double v59 = objc_msgSend_imageByApplyingParameters_(passthrough, v58, (uint64_t)v57);

      if (!v29) {
      uint64_t v60 = v162;
      }
      id v25 = v55;
LABEL_65:
      id v28 = v163;
      uint64_t v153 = v164;
      goto LABEL_66;
    }
    double v61 = v49;
    double v62 = v50;
    id v155 = v26;
    id v156 = v25;
    id v157 = v24;
    calcWeightsX = self->_calcWeightsX;
    v191[0] = v165;
    v190[0] = @"inputDisparityTex";
    v190[1] = @"outputMinMaxTex";
    uint64_t v64 = v164;
    uint64_t v60 = v162;
    if (!v164)
    {
      uint64_t v64 = objc_msgSend_null(MEMORY[0x263EFF9D0], v46, v47);
    }
    v191[1] = v64;
    v190[2] = @"_renderContext";
    v191[2] = v30;
    v190[3] = @"_kernelScale";
    *(float *)&double v48 = a14;
    uint64_t v65 = objc_msgSend_numberWithFloat_(NSNumber, v46, v47, v48);
    v191[3] = v65;
    CGFloat v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v66, (uint64_t)v191, v190, 4);
    CGFloat v69 = objc_msgSend_imageByApplyingParameters_(calcWeightsX, v68, (uint64_t)v67);

    if (!v164) {
    calcWeightsY = self->_calcWeightsY;
    }
    v188[0] = @"inputDisparityTex";
    v188[1] = @"inputMinMaxTex";
    v189[0] = v165;
    v189[1] = v69;
    v188[2] = @"outputDisparityWeightTex";
    v74 = v155;
    if (!v155)
    {
      v74 = objc_msgSend_null(MEMORY[0x263EFF9D0], v70, v71);
    }
    v189[2] = v74;
    v189[3] = v171;
    v188[3] = @"_renderContext";
    v188[4] = @"_kernelScale";
    *(float *)&double v72 = a14;
    uint64_t v75 = objc_msgSend_numberWithFloat_(NSNumber, v70, v71, v72);
    v189[4] = v75;
    CGFloat v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v76, (uint64_t)v189, v188, 5);
    v161 = objc_msgSend_imageByApplyingParameters_(calcWeightsY, v78, (uint64_t)v77);

    if (!v155) {
    preprocessing = self->_preprocessing;
    }
    v186[0] = @"inputSegmentationTex";
    double v82 = v162;
    if (!v162)
    {
      double v82 = objc_msgSend_null(MEMORY[0x263EFF9D0], v79, v80);
    }
    v187[0] = v82;
    v187[1] = v157;
    v186[1] = @"inputLumaTex";
    v186[2] = @"inputChromaTex";
    v187[2] = v170;
    v186[3] = @"outputCombinedTex";
    CGFloat v83 = v169;
    if (!v169)
    {
      CGFloat v83 = objc_msgSend_null(MEMORY[0x263EFF9D0], v79, v80);
    }
    v186[4] = @"_renderContext";
    v187[3] = v83;
    v187[4] = v171;
    double v84 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v79, (uint64_t)v187, v186, 5);
    v160 = objc_msgSend_imageByApplyingParameters_(preprocessing, v85, (uint64_t)v84);

    if (v169)
    {
      if (v162)
      {
LABEL_27:
        v172[0] = (int)v61;
        v172[1] = (int)v62;
        sample = self->_sample;
        v184[0] = @"outputDimension";
        v90 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v86, (uint64_t)v172, 4);
        v185[0] = v90;
        v185[1] = v160;
        v184[1] = @"inputPreprocTex";
        v184[2] = @"inputDisparityWeightTex";
        v185[2] = v161;
        v184[3] = @"outputDisparityTex";
        uint64_t v91 = v28;
        if (!v28)
        {
          uint64_t v91 = objc_msgSend_null(MEMORY[0x263EFF9D0], v88, v89);
        }
        v184[4] = @"_renderContext";
        v185[3] = v91;
        v185[4] = v171;
        CGFloat v92 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)v185, v184, 5);
        CGFloat v94 = objc_msgSend_imageByApplyingParameters_(sample, v93, (uint64_t)v92);

        if (!v28) {
        uint64_t v95 = 184;
        }
        if (a18) {
          uint64_t v95 = 192;
        }
        id v158 = *(id *)((char *)&self->super.isa + v95);
        float fgFgBgThreshold = a3->fgFgBgThreshold;
        int fgBgDilationSize = a3->fgBgDilationSize;
        BOOL v100 = fgFgBgThreshold > 0.0 && a18;
        int v167 = a3->fgBgDilationSize;
        BOOL v101 = fgBgDilationSize > 0 && v100;
        id v181 = 0;
        v182 = 0;
        v183 = 0;
        uint64_t v102 = v29;
        if (v101)
        {
          for (uint64_t i = 0; i != 24; i += 8)
          {
            objc_msgSend_extent(v29, v96, v97);
            uint64_t v107 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, v104, (uint64_t)v29, v29, 65, v105, v106);
            uint64_t v108 = *(void **)((char *)&v181 + i);
            *(void **)((char *)&v181 + i) = (void *)v107;
          }
          uint64_t v102 = v181;
        }
        id v111 = v102;
        v179[0] = @"slmParamsTex";
        v179[1] = @"inputDisparityWeightTex";
        v180[0] = v156;
        v180[1] = v161;
        v179[2] = @"inputPreprocTex";
        v179[3] = @"inputSampledDisparityTex";
        v180[2] = v160;
        v180[3] = v94;
        uint64_t v113 = v111;
        v179[4] = @"outputBlurMapTex";
        if (!v111)
        {
          uint64_t v113 = objc_msgSend_null(MEMORY[0x263EFF9D0], v109, v110);
        }
        v180[4] = v113;
        v180[5] = v171;
        v179[5] = @"_renderContext";
        v179[6] = @"_kernelScale";
        *(float *)&double v112 = a14;
        uint64_t v114 = objc_msgSend_numberWithFloat_(NSNumber, v109, v110, v112);
        v180[6] = v114;
        uint64_t v116 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v115, (uint64_t)v180, v179, 7);
        double v59 = objc_msgSend_imageByApplyingParameters_(v158, v117, (uint64_t)v116);

        if (!v111) {
        if (v101)
        }
        {
          id v118 = v59;
          thresholdedSobel = self->_thresholdedSobel;
          id v159 = v118;
          v178[0] = v118;
          v177[0] = @"inputTex";
          v177[1] = @"threshold";
          *(float *)&double v120 = fgFgBgThreshold;
          double v125 = objc_msgSend_numberWithFloat_(NSNumber, v121, v122, v120);
          v178[1] = v125;
          v177[2] = @"outputTex";
          v127 = v182;
          v128 = v182;
          if (!v182)
          {
            v128 = objc_msgSend_null(MEMORY[0x263EFF9D0], v123, v124);
          }
          v178[2] = v128;
          v178[3] = v171;
          v177[3] = @"_renderContext";
          v177[4] = @"_kernelScale";
          *(float *)&double v126 = a14;
          uint64_t v129 = objc_msgSend_numberWithFloat_(NSNumber, v123, v124, v126);
          v178[4] = v129;
          v131 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v130, (uint64_t)v178, v177, 5);
          uint64_t v133 = objc_msgSend_imageByApplyingParameters_(thresholdedSobel, v132, (uint64_t)v131);

          if (!v127) {
          morphologdouble y = self->_morphology;
          }
          v175[0] = *MEMORY[0x263F00980];
          double v138 = objc_msgSend_numberWithInt_(NSNumber, v135, v167 | 1u);
          uint64_t v139 = *MEMORY[0x263F00968];
          v176[0] = v138;
          v176[1] = v133;
          uint64_t v168 = (void *)v133;
          v175[1] = v139;
          v175[2] = @"inputDoMin";
          v176[2] = &unk_270E1E678;
          v176[3] = v171;
          uint64_t v140 = *MEMORY[0x263F009D0];
          v175[3] = @"_renderContext";
          v175[4] = v140;
          uint64_t v141 = v183;
          v142 = v183;
          if (!v183)
          {
            v142 = objc_msgSend_null(MEMORY[0x263EFF9D0], v136, v137);
          }
          v176[4] = v142;
          v143 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v136, (uint64_t)v176, v175, 5);
          v145 = objc_msgSend_imageByApplyingParameters_(morphology, v144, (uint64_t)v143);

          id v25 = v156;
          if (!v141) {

          }
          blendBackgroundBlur = self->_blendBackgroundBlur;
          v173[0] = @"disparityRefinementTex";
          v173[1] = @"modifiedBackgroundTex";
          v174[0] = v159;
          v174[1] = v145;
          v173[2] = @"dstTex";
          uint64_t v149 = v29;
          if (!v29)
          {
            uint64_t v149 = objc_msgSend_null(MEMORY[0x263EFF9D0], v146, v147);
          }
          v173[3] = @"_renderContext";
          v174[2] = v149;
          v174[3] = v171;
          double v150 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v146, (uint64_t)v174, v173, 4);
          double v59 = objc_msgSend_imageByApplyingParameters_(blendBackgroundBlur, v151, (uint64_t)v150);

          if (!v29) {
          uint64_t v60 = v162;
          }
          id v24 = v157;
        }
        else
        {
          id v25 = v156;
          id v24 = v157;
        }
        id v26 = v155;
        for (uint64_t j = 16; j != -8; j -= 8)

        v53 = v165;
        goto LABEL_65;
      }
    }
    else
    {

      if (v162) {
        goto LABEL_27;
      }
    }

    goto LABEL_27;
  }
  syslog(3, "err error, (%s) at %s:%d", "-[MakeBlurMap performDisparityRefinementUsingParams:inputDisparity:inputSegmentation:inputImageLuma:inputImageChroma:inputSlmParams:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:outputBlurMap:scale:havePerformedMatting:editTimeRender:context:enableFGBlur:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/MakeBlurMap.m", 2079);
  double v59 = 0;
  uint64_t v153 = v164;
  v53 = v165;
  uint64_t v60 = v162;
LABEL_66:

  return v59;
}

- (id)performSLMCalculatorUsingParams:(const simple_lens_model_params *)a3 inputShiftMap:(id)a4 faceMaskParams:(const face_mask_params *)a5 version:(int)a6 context:(id)a7 isFGBlurEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  v79[3] = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a7;
  if (!v14) {
    sub_262E4A6F8();
  }
  if (!a3) {
    sub_262E4A724();
  }
  id v16 = v15;
  BOOL v60 = v8;
  id v17 = [UniRunInfo alloc];
  int64x2_t v74 = vdupq_n_s64(1uLL);
  uint64_t v75 = 1;
  long long v72 = xmmword_262E51670;
  uint64_t v73 = 1;
  id v19 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v17, v18, (uint64_t)&v74, &v72);
  slmMinMadouble x = self->_slmMinMax;
  v78[0] = @"inputBlurMapTex";
  v78[1] = @"outputMinMaxParamsTex";
  minMaxTedouble x = self->_minMaxTex;
  v79[0] = v14;
  v79[1] = minMaxTex;
  v78[2] = @"_renderContext";
  v79[2] = v16;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)v79, v78, 3);
  id v25 = objc_msgSend_imageByApplyingParameters_runInfo_(slmMinMax, v24, (uint64_t)v23, v19);

  if (!v25) {
    sub_262E4A750();
  }
  id v26 = [UniRunInfo alloc];
  int64x2_t v70 = vdupq_n_s64(1uLL);
  uint64_t v71 = 1;
  long long v68 = xmmword_262E51680;
  uint64_t v69 = 1;
  double v61 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v26, v27, (uint64_t)&v70, &v68);
  id v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v28, (uint64_t)a3, 56);
  if (qword_26B4252A8 != -1) {
    dispatch_once(&qword_26B4252A8, &unk_270E12CF8);
  }
  BOOL v31 = 0;
  uint64_t v67 = 0;
  memset(v66, 0, sizeof(v66));
  if (byte_26A9975E8) {
    BOOL v32 = byte_26A9975E9 == 0;
  }
  else {
    BOOL v32 = a6 < 4;
  }
  if (a5 && !v32)
  {
    uint64_t v33 = 0;
    long long v34 = *(_OWORD *)&a5->var12;
    long long v35 = *(_OWORD *)&a5[1].var1;
    long long v36 = *(_OWORD *)&a5[1].var5;
    long long v37 = *(_OWORD *)&a5[1].var9;
    do
    {
      long long v62 = v34;
      LODWORD(v38) = *(_DWORD *)((unint64_t)&v62 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      long long v63 = v35;
      float v39 = *(float *)((unint64_t)&v63 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      BOOL v43 = *(float *)&v38 == -1.0;
      *((float *)&v38 + 1) = v39;
      double v40 = (void *)v66 + v33;
      void *v40 = v38;
      long long v64 = v36;
      float v41 = *(float *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      long long v65 = v37;
      float v42 = *(float *)((unint64_t)&v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      v40[4] = __PAIR64__(LODWORD(v42), LODWORD(v41));
      BOOL v43 = v43 || v39 == -1.0;
      if (!v43 || (v41 != -1.0 ? (BOOL v44 = v42 == -1.0) : (BOOL v44 = 1), !v44)) {
        LODWORD(v67) = v67 + 1;
      }
      ++v33;
    }
    while (v33 != 4);
    BOOL v31 = (int)v67 > 0;
  }
  v76[0] = @"inputParams";
  v76[1] = @"minMaxParamsTex";
  v77[0] = v30;
  v77[1] = v25;
  v76[2] = @"inputShiftMapTex";
  v76[3] = @"outputParamTexture";
  outputParamsImage = self->_outputParamsImage;
  v77[2] = v14;
  v77[3] = outputParamsImage;
  v76[4] = @"_renderContext";
  v77[4] = v16;
  float v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v77, v76, 5);
  double v48 = self->_slmCalc;
  if (v31)
  {
    double v49 = self->_slmCalcEyes;

    BOOL v51 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v50, (uint64_t)v46);

    v53 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v52, (uint64_t)v66, 72);
    objc_msgSend_setObject_forKeyedSubscript_(v51, v54, (uint64_t)v53, @"inputEyes");

    if (v60) {
      objc_msgSend_setObject_forKeyedSubscript_(v51, v55, (uint64_t)&unk_270E1F0C8, @"nearestEyeWeight");
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v51, v55, (uint64_t)&unk_270E1F0D8, @"nearestEyeWeight");
    }
    float v46 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v56, (uint64_t)v51);

    double v48 = v49;
  }
  uint64_t v57 = objc_msgSend_imageByApplyingParameters_runInfo_(v48, v47, (uint64_t)v46, v61);
  if (!v57) {
    sub_262E4A77C();
  }
  uint64_t v58 = (void *)v57;

  return v58;
}

- (id)enqueueBoundaryMaskPassForInputTex:(id)a3 inputSecondaryTex:(id)a4 intermediateTex:(id)a5 thresholdValue:(float)a6 boundaryScalingFactor:(float)a7 outputTex:(id)a8 blurRadius:(float)a9 passName:(id)a10 scale:(float)a11 context:(id)a12
{
  v109[5] = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v98 = a4;
  id v22 = a5;
  id v23 = a8;
  id v24 = a12;
  objc_msgSend_extent(v23, v25, v26);
  double v28 = v27;
  double v30 = v29;
  BOOL v31 = [UniRunInfo alloc];
  v101[0] = (unint64_t)(v28 * 0.5);
  v101[1] = (unint64_t)(v30 * 0.5);
  v101[2] = 1;
  uint64_t v33 = objc_msgSend_initWithGridSize_kernel_(v31, v32, (uint64_t)v101, self->_thresholdHard);
  objc_msgSend_setCoreImageOutputExtent_(v33, v34, v35, 0.0, 0.0, v28, v30);
  thresholdHard = self->_thresholdHard;
  v108[0] = @"inputTex";
  v108[1] = @"outputTex";
  uint64_t v97 = v21;
  v109[0] = v21;
  v109[1] = v23;
  CGFloat v93 = v23;
  v108[2] = @"value";
  *(float *)&double v37 = a6;
  double v40 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v37);
  v109[2] = v40;
  v109[3] = v24;
  v108[3] = @"_renderContext";
  v108[4] = @"_scale";
  *(float *)&double v41 = a11;
  BOOL v44 = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v41);
  v109[4] = v44;
  float v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v109, v108, 5);
  CGFloat v94 = v33;
  double v48 = objc_msgSend_imageByApplyingParameters_runInfo_(thresholdHard, v47, (uint64_t)v46, v33);

  gaussian = self->_gaussian;
  v107[0] = v48;
  v106[0] = @"inputImage";
  v106[1] = @"outputImage";
  v53 = v22;
  if (!v22)
  {
    v53 = objc_msgSend_null(MEMORY[0x263EFF9D0], v49, v50);
  }
  v107[1] = v53;
  v106[2] = @"inputRadius";
  *(float *)&double v51 = a9;
  double v54 = objc_msgSend_numberWithFloat_(NSNumber, v49, v50, v51);
  v107[2] = v54;
  v107[3] = v24;
  id v95 = v24;
  v106[3] = @"_renderContext";
  v106[4] = @"_scale";
  *(float *)&double v55 = a11;
  uint64_t v58 = objc_msgSend_numberWithFloat_(NSNumber, v56, v57, v55);
  v107[4] = v58;
  BOOL v60 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)v107, v106, 5);
  long long v62 = objc_msgSend_imageByApplyingParameters_(gaussian, v61, (uint64_t)v60);

  v96 = v22;
  if (!v22) {

  }
  long long v63 = [UniRunInfo alloc];
  if (v98)
  {
    v100[0] = (unint64_t)(v28 * 0.5);
    v100[1] = (unint64_t)(v30 * 0.5);
    v100[2] = 1;
    long long v65 = objc_msgSend_initWithGridSize_kernel_(v63, v64, (uint64_t)v100, self->_mapLinear);
    objc_msgSend_setCoreImageOutputExtent_(v65, v66, v67, 0.0, 0.0, v28, v30);
    mapLinear = self->_mapLinear;
    v104[0] = @"inputTex0";
    v104[1] = @"inputTex1";
    v105[0] = v62;
    v105[1] = v98;
    v104[2] = @"outputTex";
    long long v72 = v93;
    uint64_t v73 = v95;
    if (!v93)
    {
      long long v72 = objc_msgSend_null(MEMORY[0x263EFF9D0], v68, v69);
    }
    v105[2] = v72;
    v104[3] = @"scalingFactor";
    *(float *)&double v70 = a7;
    int64x2_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v68, v69, v70);
    v105[3] = v74;
    v105[4] = v95;
    v104[4] = @"_renderContext";
    v104[5] = @"_scale";
    *(float *)&double v75 = a11;
    CGFloat v78 = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v75);
    v105[5] = v78;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v79, (uint64_t)v105, v104, 6);
  }
  else
  {
    v99[0] = (unint64_t)(v28 * 0.5);
    v99[1] = (unint64_t)(v30 * 0.5);
    v99[2] = 1;
    long long v65 = objc_msgSend_initWithGridSize_kernel_(v63, v64, (uint64_t)v99, self->_mapLinearNoSecondary);
    objc_msgSend_setCoreImageOutputExtent_(v65, v80, v81, 0.0, 0.0, v28, v30);
    mapLinear = self->_mapLinearNoSecondary;
    v103[0] = v62;
    v102[0] = @"inputTex0";
    v102[1] = @"outputTex";
    long long v72 = v93;
    uint64_t v73 = v95;
    if (!v93)
    {
      long long v72 = objc_msgSend_null(MEMORY[0x263EFF9D0], v82, v83);
    }
    v103[1] = v72;
    v102[2] = @"scalingFactor";
    *(float *)&double v84 = a7;
    int64x2_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v82, v83, v84);
    v103[2] = v74;
    v103[3] = v95;
    v102[3] = @"_renderContext";
    v102[4] = @"_scale";
    *(float *)&double v85 = a11;
    CGFloat v78 = objc_msgSend_numberWithFloat_(NSNumber, v86, v87, v85);
    v103[4] = v78;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)v103, v102, 5);
  uint64_t v89 = };
  uint64_t v91 = objc_msgSend_imageByApplyingParameters_runInfo_(mapLinear, v90, (uint64_t)v89, v65);

  if (!v93) {

  }
  return v91;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6 pixelFormat:(unint64_t)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v15 = objc_msgSend__mtlTextureForImage_(UniKernel, v14, (uint64_t)v13);
  id v17 = objc_msgSend__mtlTextureForImage_(UniKernel, v16, (uint64_t)v12);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v104 = v17;
    id v20 = (void *)MEMORY[0x263F00650];
    id v21 = objc_msgSend_blackColor(MEMORY[0x263F00608], v18, v19);
    id v23 = objc_msgSend_imageWithColor_(v20, v22, (uint64_t)v21);

    uint64_t v26 = objc_msgSend_imageByCroppingToRect_(v23, v24, v25, 0.0, 0.0, width, height);

    uint64_t v27 = a6;
    BOOL v31 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v28, a6);
    if (!a7)
    {
      objc_msgSend_fakeFormat(v13, v29, v30);
      uint64_t v33 = v32 = v15;
      a7 = objc_msgSend_unsignedIntValue(v33, v34, v35);

      id v15 = v32;
    }
    long long v36 = [UniFakeImage alloc];
    uint64_t v39 = objc_msgSend_initWithCIImage_format_(v36, v37, (uint64_t)v26, a7);
    if (a6)
    {
      do
      {
        objc_msgSend_addObject_(v31, v38, (uint64_t)v39);
        --v27;
      }
      while (v27);
    }
    double v40 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v38, (uint64_t)v31);

    id v17 = v104;
  }
  else
  {
    if (v15) {
      BOOL v41 = v17 == 0;
    }
    else {
      BOOL v41 = 1;
    }
    if (v41)
    {
      float v42 = uni_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_262E4A7A8(v42, v43, v44, v45, v46, v47, v48, v49);
      }

      double v40 = 0;
    }
    else
    {
      double v106 = objc_msgSend_device(v17, v18, v19);
      BOOL v52 = objc_msgSend_buffer(v17, v50, v51);
      uint64_t v55 = objc_msgSend_bufferOffset(v17, v53, v54);
      uint64_t v58 = v55;
      if (!a7) {
        a7 = objc_msgSend_pixelFormat(v15, v56, v57);
      }
      v103 = v15;
      double v59 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v56, a7, (unint64_t)width, (unint64_t)height, 0);
      objc_msgSend_setUsage_(v59, v60, 19);
      id v102 = v13;
      double v105 = v17;
      if (v52)
      {
        uint64_t v63 = objc_msgSend_resourceOptions(v52, v61, v62);
        objc_msgSend_setResourceOptions_(v59, v64, v63);
      }
      else
      {
        objc_msgSend_setResourceOptions_(v59, v61, 0);
      }
      uint64_t v66 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v106, v65, a7);
      MTLPixelFormatGetInfoForDevice();
      uint64_t v67 = (v66 - 1) & -v66;
      unint64_t v68 = v67 * (unint64_t)height;
      uint64_t v69 = a6;
      if (v68 * a6 > objc_msgSend_allocatedSize(v105, v70, v71))
      {
        uint64_t v73 = uni_logger_performance();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446722;
          uint64_t v108 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
          __int16 v109 = 2048;
          uint64_t v110 = objc_msgSend_allocatedSize(v105, v74, v75);
          __int16 v111 = 2048;
          unint64_t v112 = v68 * a6;
          _os_log_impl(&dword_262E0F000, v73, OS_LOG_TYPE_INFO, "%{public}s Insufficient backing size = %ld need %ld", buf, 0x20u);
        }

        BOOL v52 = 0;
      }
      uint64_t v77 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v72, a6);
      if (a6)
      {
        while (1)
        {
          CGFloat v78 = uni_logger_performance();
          CGFloat v79 = v78;
          if (v52)
          {
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_description(v59, v80, v81);
              id v82 = objc_claimAutoreleasedReturnValue();
              uint64_t v85 = objc_msgSend_UTF8String(v82, v83, v84);
              *(_DWORD *)buf = 136446466;
              uint64_t v108 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
              __int16 v109 = 2080;
              uint64_t v110 = v85;
              _os_log_impl(&dword_262E0F000, v79, OS_LOG_TYPE_INFO, "%{public}s Creating texture at runtime from existing buffer %s", buf, 0x16u);
            }
            uint64_t v87 = objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(v52, v86, (uint64_t)v59, v58, v67);
          }
          else
          {
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_description(v59, v89, v90);
              id v95 = objc_claimAutoreleasedReturnValue();
              uint64_t v98 = objc_msgSend_UTF8String(v95, v96, v97);
              *(_DWORD *)buf = 136446466;
              uint64_t v108 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
              __int16 v109 = 2080;
              uint64_t v110 = v98;
              _os_log_debug_impl(&dword_262E0F000, v79, OS_LOG_TYPE_DEBUG, "%{public}s Creating texture at runtime %s", buf, 0x16u);
            }
            uint64_t v87 = objc_msgSend_newTextureWithDescriptor_(v106, v91, (uint64_t)v59);
          }
          CGFloat v92 = (void *)v87;
          if (!v87) {
            break;
          }
          CGFloat v93 = objc_msgSend_imageWithMTLTexture_(UniImage, v88, v87);
          objc_msgSend_addObject_(v77, v94, (uint64_t)v93);

          v58 += v68;
          if (!--v69) {
            goto LABEL_35;
          }
        }
        uni_logger_performance();
        id v99 = (char *)objc_claimAutoreleasedReturnValue();
        id v13 = v102;
        id v17 = v105;
        if (os_log_type_enabled((os_log_t)v99, OS_LOG_TYPE_DEBUG)) {
          sub_262E4A820(v59, v99, v100);
        }

        double v40 = (void *)MEMORY[0x263EFFA68];
      }
      else
      {
LABEL_35:
        double v40 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v76, (uint64_t)v77);
        id v13 = v102;
        id v17 = v105;
      }

      id v15 = v103;
    }
  }

  return v40;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 pixelFormat:(unint64_t)a6
{
  int v6 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_pixelFormat_(self, a2, (uint64_t)a3, a4, 1, a6, a5.width, a5.height);
  BOOL v8 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0);

  return v8;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5
{
  return (id)objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, a2, (uint64_t)a3, a4, 0, a5.width, a5.height);
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6
{
  return (id)objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_pixelFormat_(self, a2, (uint64_t)a3, a4, *(void *)&a6, 0, a5.width, a5.height);
}

- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 sourceSize:(CGSize)a5 device:(id)a6 outputImage:(id)a7 context:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  double v13 = a4.height;
  double v14 = a4.width;
  v45[4] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v15
    && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v17)
    && (isKindOfClass & 1) != 0
    && ((double v20 = v14 / width, v21 = v13 / height, v20 == 1.0) ? (v22 = v21 == 1.0) : (v22 = 0), !v22))
  {
    id v23 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v25 = objc_msgSend__mtlTextureForImage_(UniKernel, v24, (uint64_t)v17);
      uint64_t v27 = v25;
      if (v25 && objc_msgSend_conformsToProtocol_(v25, v26, (uint64_t)&unk_270E2A1A0))
      {
        uint64_t v30 = objc_msgSend_device(v27, v28, v29);

        id v23 = (id)v30;
      }
    }
    BOOL v31 = [UniScaleImage alloc];
    uint64_t v33 = objc_msgSend_initWithDevice_(v31, v32, (uint64_t)v23);
    v44[0] = *MEMORY[0x263F00990];
    long long v36 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v34, v35, v20, v21);
    uint64_t v37 = *MEMORY[0x263F009D0];
    v44[1] = *MEMORY[0x263F00968];
    v44[2] = v37;
    v45[0] = v36;
    v45[1] = v15;
    v44[3] = @"_renderContext";
    v45[2] = v17;
    v45[3] = v18;
    uint64_t v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v45, v44, 4);
    BOOL v41 = objc_msgSend_imageByApplyingParameters_(v33, v40, (uint64_t)v39);

    id v42 = v41;
  }
  else
  {
    id v42 = v15;
  }

  return v42;
}

- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 device:(id)a5 useBoxFiltering:(BOOL)a6 outputImage:(id)a7 context:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  v84[4] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v15
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ((objc_msgSend_extent(v15, v19, v20),
         double v22 = width / v21,
         objc_msgSend_extent(v15, v23, v24),
         double v26 = height / v25,
         v22 == 1.0)
      ? (BOOL v27 = v26 == 1.0)
      : (BOOL v27 = 0),
        v27))
  {
    id v65 = v15;
    goto LABEL_13;
  }
  id v29 = v16;
  if (v29)
  {
    if (a6)
    {
LABEL_9:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_extent(v15, v30, v31);
        CGFloat v33 = v32;
        CGFloat v35 = v34;
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        CGAffineTransformMakeScale(&v80, v22, v26);
        v86.origin.double x = v33;
        v86.origin.double y = v35;
        v86.size.double width = v37;
        v86.size.double height = v39;
        CGRect v87 = CGRectApplyAffineTransform(v86, &v80);
        double x = v87.origin.x;
        double y = v87.origin.y;
        double v42 = v87.size.width;
        double v43 = v87.size.height;
        uint64_t v44 = (void *)MEMORY[0x263F00650];
        uint64_t v47 = objc_msgSend_blackColor(MEMORY[0x263F00608], v45, v46);
        uint64_t v49 = objc_msgSend_imageWithColor_(v44, v48, (uint64_t)v47);
        BOOL v52 = objc_msgSend_imageByCroppingToRect_(v49, v50, v51, x, y, v42, v43);

        v53 = [UniFakeImage alloc];
        uint64_t v55 = objc_msgSend_initWithCIImage_(v53, v54, (uint64_t)v52);

        id v17 = (id)v55;
      }
      crispHairDownsamplingSingle = self->_crispHairDownsamplingSingle;
      v81[0] = @"inputScaleX";
      uint64_t v57 = objc_msgSend_numberWithDouble_(NSNumber, v30, v31, v22);
      v82[0] = v57;
      v81[1] = @"inputScaleY";
      BOOL v60 = objc_msgSend_numberWithDouble_(NSNumber, v58, v59, v26);
      uint64_t v61 = *MEMORY[0x263F009D0];
      v81[2] = *MEMORY[0x263F00968];
      v81[3] = v61;
      v82[1] = v60;
      v82[2] = v15;
      v81[4] = @"_renderContext";
      v82[3] = v17;
      v82[4] = v18;
      uint64_t v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v62, (uint64_t)v82, v81, 5);
      objc_msgSend_imageByApplyingParameters_(crispHairDownsamplingSingle, v64, (uint64_t)v63);
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v67 = objc_msgSend__mtlTextureForImage_(UniKernel, v28, (uint64_t)v17);
    uint64_t v69 = v67;
    if (v67 && objc_msgSend_conformsToProtocol_(v67, v68, (uint64_t)&unk_270E2A1A0))
    {
      objc_msgSend_device(v69, v70, v71);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v29 = 0;
    }

    if (a6) {
      goto LABEL_9;
    }
  }
  long long v72 = [UniScaleImage alloc];
  uint64_t v57 = objc_msgSend_initWithDevice_(v72, v73, (uint64_t)v29);
  v83[0] = *MEMORY[0x263F00990];
  BOOL v60 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v74, v75, v22, v26);
  uint64_t v76 = *MEMORY[0x263F009D0];
  v83[1] = *MEMORY[0x263F00968];
  v83[2] = v76;
  v84[0] = v60;
  v84[1] = v15;
  v83[3] = @"_renderContext";
  v84[2] = v17;
  v84[3] = v18;
  uint64_t v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, (uint64_t)v84, v83, 4);
  objc_msgSend_imageByApplyingParameters_(v57, v78, (uint64_t)v63);
  CGFloat v79 = LABEL_22:;

  id v65 = v79;
LABEL_13:

  return v65;
}

- (id)enqueueRefinementUsingParams:(const blurmap_refinement_params *)a3 maskParams:(const face_mask_params *)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputHair:(id)a7 inputGlasses:(id)a8 inputAlphaMaskDelta:(id)a9 inputHairMaskDelta:(id)a10 inputBlurRefineIntermediate:(id)a11 outputBlurMap:(id)a12 scale:(float)a13 inputsAlreadyScaled:(BOOL)a14 context:(id)a15
{
  v346[4] = *MEMORY[0x263EF8340];
  id v308 = a5;
  id v21 = a6;
  id v313 = a7;
  id v312 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v303 = a12;
  id v25 = a15;
  id v26 = v22;
  id v27 = v23;
  if (qword_26B425290 != -1) {
    dispatch_once(&qword_26B425290, &unk_270E12D18);
  }
  if (v312) {
    _ZF = byte_26A9974B8 == 0;
  }
  else {
    _ZF = 1;
  }
  int v29 = !_ZF;
  int v311 = v29;
  if (!a3) {
    sub_262E4A8D4();
  }
  if (!a4) {
    sub_262E4A900();
  }
  uint64_t v304 = (uint64_t)v24;
  uint64_t v30 = v21;
  double var15 = a3->var15;
  double v32 = a3->var13 - var15 * 0.5;
  double var16 = a3->var16;
  double v34 = 1.0 - a3->var14 - var16 * 0.5;
  BOOL v35 = sub_262E273C0((uint64_t)a4, 0);
  LOBYTE(v328) = v35;
  BOOL v36 = sub_262E273C0((uint64_t)a4, 1);
  BYTE1(v328) = v36;
  BOOL v37 = sub_262E273C0((uint64_t)a4, 2);
  BYTE2(v328) = v37;
  BOOL v38 = sub_262E273C0((uint64_t)a4, 3);
  uint64_t v43 = 0;
  BYTE3(v328) = v38;
  unsigned int v44 = v36 + v35 + v37 + v38;
  while (!*((unsigned char *)&v328 + v43))
  {
    if (++v43 == 4)
    {
      char v45 = 0;
      goto LABEL_16;
    }
  }
  char v45 = v43;
LABEL_16:
  if (v44 >= 2)
  {
    uint64_t v46 = 0;
    double v47 = 0.0;
    do
    {
      if (*((unsigned char *)&v328 + v46))
      {
        uint64_t v48 = &a4->var0 + (v46 & 3);
        double v49 = (float)(1.0 - v48[32]);
        double v50 = v48[12];
        float v51 = 1.0 - v48[16];
        if ((float)(1.0 - v48[24]) >= v51) {
          float v51 = 1.0 - v48[24];
        }
        double v53 = v51 - v49;
        v348.origin.double x = v32;
        v348.origin.double y = v34;
        v348.size.double width = var15;
        v348.size.double height = var16;
        double v52 = v48[20] - v50;
        CGRect v349 = CGRectIntersection(v348, *(CGRect *)&v50);
        double width = v349.size.width;
        double height = v349.size.height;
        if (!CGRectIsNull(v349))
        {
          double v40 = width * height;
          if (width * height > v47)
          {
            double v47 = width * height;
            char v45 = v46;
          }
        }
      }
      ++v46;
    }
    while (v46 != 4);
  }
  float var0 = a3->var9.var0;
  float var1 = a3->var9.var1;
  uint64_t v58 = (char *)(&a4->var0 + (v45 & 3));
  v59.i32[0] = *((_DWORD *)v58 + 12);
  if (fminf(v59.f32[0], *((float *)v58 + 16)) < 0.0
    || (v60.i32[0] = *((_DWORD *)v58 + 20), fminf(v60.f32[0], *((float *)v58 + 24)) < 0.0)
    || (v61.i32[0] = *((_DWORD *)v58 + 4), fminf(v61.f32[0], *((float *)v58 + 8)) < 0.0)
    || (v62.i32[0] = *((_DWORD *)v58 + 28), fminf(v62.f32[0], *((float *)v58 + 32)) < 0.0))
  {
    double v73 = (float)((float)(var1 + var1) * 0.5);
  }
  else
  {
    v62.i32[1] = *((_DWORD *)v58 + 32);
    v61.i32[1] = *((_DWORD *)v58 + 8);
    v60.i32[1] = *((_DWORD *)v58 + 24);
    v59.i32[1] = *((_DWORD *)v58 + 16);
    float32x2_t v63 = vsub_f32(v59, v60);
    int32x2_t v64 = (int32x2_t)vmul_f32(v63, v63);
    float32x2_t v65 = vsub_f32(v59, v61);
    float32x2_t v66 = vsub_f32(v60, v61);
    float32x2_t v67 = vsub_f32(v61, v62);
    int32x2_t v68 = (int32x2_t)vmul_f32(v67, v67);
    float32x2_t v69 = vmaxnm_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v64, v68), (float32x2_t)vzip2_s32(v64, v68))), (float32x2_t)vdup_n_s32(0x3A83126Fu));
    float32x2_t v70 = vsub_f32(v59, v62);
    float32x2_t v71 = vsub_f32(v60, v62);
    double v72 = fmaxf(sqrtf(vaddv_f32(vmul_f32(v65, v65))), 0.001) * -3.3737
        + v69.f32[0] * -12.1925
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v66, v66))), 0.001) * -3.025
        + v69.f32[1] * -11.9485
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v70, v70))), 0.001) * 1.6734
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v71, v71))), 0.001) * 1.8423
        + vmuls_lane_f32(v69.f32[0], v69, 1) * 47.7061
        + 3.1214;
    double var2 = a3->var9.var2;
    double v73 = var1;
    if (a3->var9.var3 + v72 * var2 < v73) {
      double v73 = a3->var9.var3 + v72 * var2;
    }
    double v41 = var0;
    if (v73 < var0) {
      double v73 = var0;
    }
  }
  int64x2_t v74 = v308;
  uint64_t v75 = (uint64_t)v30;
  uint64_t v76 = (uint64_t)v313;
  float v77 = v73;
  float v78 = fmaxf(fmaxf(var0, v77), 0.00001);
  float v79 = (float)(1.0 / v78) - (float)(1.0 / (float)(a3->var8 + v78));
  v298 = v26;
  v300 = v27;
  v307 = v25;
  if (v30 && (float var3 = a3->var0.var3, var3 > 0.0))
  {
    float v81 = (float)(v79 * var3) * a3->var3;
    if (a13 == 1.0 || a14)
    {
      uint64_t v96 = v304;
      id v97 = v25;
    }
    else
    {
      id v82 = objc_msgSend__mtlTextureForImage_(UniKernel, v39, (uint64_t)v26);
      uint64_t v84 = v82;
      if (v82 && objc_msgSend_conformsToProtocol_(v82, v83, (uint64_t)&unk_270E2A1A0))
      {
        id v87 = v25;
        double v88 = objc_msgSend_device(v84, v85, v86);
      }
      else
      {
        id v87 = v25;
        double v88 = 0;
      }
      uint64_t v98 = [UniScaleImage alloc];
      uint64_t v100 = objc_msgSend_initWithDevice_(v98, v99, (uint64_t)v88);
      v345[0] = *MEMORY[0x263F00990];
      v103 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v101, v102, a13, a13);
      uint64_t v104 = *MEMORY[0x263F00968];
      v346[0] = v103;
      v346[1] = v30;
      uint64_t v105 = *MEMORY[0x263F009D0];
      v345[1] = v104;
      v345[2] = v105;
      uint64_t v108 = objc_msgSend_null(MEMORY[0x263EFF9D0], v106, v107);
      v345[3] = @"_renderContext";
      v346[2] = v108;
      v346[3] = v87;
      uint64_t v110 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v109, (uint64_t)v346, v345, 4);
      uint64_t v112 = objc_msgSend_imageByApplyingParameters_(v100, v111, (uint64_t)v110);

      uint64_t v75 = v112;
      id v97 = v307;
      int64x2_t v74 = v308;
      uint64_t v96 = v304;
      id v26 = v298;
      id v27 = v300;
      uint64_t v76 = (uint64_t)v313;
    }
    *(float *)&double v40 = a3->var0.var2;
    *(float *)&double v41 = (float)a3->var0.var1;
    id v95 = self;
    *(float *)&double v73 = v81;
    *(float *)&double var2 = a13;
    id v89 = v97;
    v309 = objc_msgSend_enqueueBoundaryMaskPassForInputTex_inputSecondaryTex_intermediateTex_thresholdValue_boundaryScalingFactor_outputTex_blurRadius_passName_scale_context_(self, v39, v75, 0, v96, v26, @"Person", v40, v73, v41, var2);
  }
  else
  {
    id v89 = v25;

    v309 = 0;
    id v95 = self;
  }
  v299 = (void *)v75;
  if (v76 && (float v113 = a3->var1.var3, v113 > 0.0))
  {
    float v114 = (float)(v79 * v113) * a3->var3;
    if (a13 == 1.0 || a14)
    {
      uint64_t v121 = v304;
      uint64_t v122 = v95;
      uint64_t v123 = v89;
    }
    else
    {
      uint64_t v115 = objc_msgSend__mtlTextureForImage_(UniKernel, v90, (uint64_t)v27);
      uint64_t v117 = v115;
      if (v115 && objc_msgSend_conformsToProtocol_(v115, v116, (uint64_t)&unk_270E2A1A0))
      {
        uint64_t v120 = objc_msgSend_device(v117, v118, v119);
      }
      else
      {
        uint64_t v120 = 0;
      }
      v315 = (void *)v120;
      uint64_t v124 = [UniScaleImage alloc];
      double v126 = objc_msgSend_initWithDevice_(v124, v125, v120);
      v343[0] = *MEMORY[0x263F00990];
      uint64_t v129 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v127, v128, a13, a13);
      uint64_t v130 = *MEMORY[0x263F00968];
      v344[0] = v129;
      v344[1] = v313;
      uint64_t v131 = *MEMORY[0x263F009D0];
      v343[1] = v130;
      v343[2] = v131;
      v134 = objc_msgSend_null(MEMORY[0x263EFF9D0], v132, v133);
      v343[3] = @"_renderContext";
      v344[2] = v134;
      v344[3] = v89;
      double v136 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v135, (uint64_t)v344, v343, 4);
      uint64_t v138 = objc_msgSend_imageByApplyingParameters_(v126, v137, (uint64_t)v136);

      uint64_t v123 = v307;
      uint64_t v76 = v138;
      int64x2_t v74 = v308;
      uint64_t v121 = v304;
      uint64_t v122 = self;
      id v27 = v300;
      uint64_t v75 = (uint64_t)v299;
    }
    *(float *)&double v91 = a3->var1.var2;
    *(float *)&double v93 = (float)a3->var1.var1;
    id v95 = v122;
    id v313 = (id)v76;
    *(float *)&double v92 = v114;
    *(float *)&double v94 = a13;
    id v89 = v123;
    v302 = objc_msgSend_enqueueBoundaryMaskPassForInputTex_inputSecondaryTex_intermediateTex_thresholdValue_boundaryScalingFactor_outputTex_blurRadius_passName_scale_context_(v122, v90, v76, v75, v121, v27, @"Hair", v123, v91, v92, v93, v94);
  }
  else
  {
    v302 = 0;
  }

  uint64_t v140 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v139, (uint64_t)a4, 192);
  float v141 = a3->var1.var0.var0;
  float v142 = a3->var1.var0.var1 - v141;
  _Q0.f32[0] = 1.0 / v142;
  _Q0.f32[1] = (float)((float)(-1.0 / v142) * v141) + 0.0;
  _Q0.i32[2] = LODWORD(a3->var1.var0.var2);
  float v144 = a3->var1.var0.var3;
  float v145 = a3->var1.var0.var4 - v144;
  *(float *)&_Q1 = -1.0 / v145;
  *((float *)&_Q1 + 1) = (float)((float)(1.0 / v145) * v144) + 1.0;
  DWORD2(_Q1) = LODWORD(a3->var1.var0.var5);
  float v147 = a3->var0.var0.var1 - a3->var0.var0.var0;
  *(float *)&long long v148 = 1.0 / v147;
  *((float *)&v148 + 1) = (float)((float)(-1.0 / v147) * a3->var0.var0.var0) + 0.0;
  DWORD2(v148) = LODWORD(a3->var0.var0.var2);
  float v149 = a3->var0.var0.var3;
  float v150 = a3->var0.var0.var4 - v149;
  *(float *)&long long v151 = -1.0 / v150;
  *((float *)&v151 + 1) = (float)((float)(1.0 / v150) * v149) + 1.0;
  DWORD2(v151) = LODWORD(a3->var0.var0.var5);
  long long v328 = 0u;
  float32x4_t v329 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  memset(v334, 0, sizeof(v334));
  _S6 = a3->var10.var13;
  _S5 = a3->var10.var14;
  __asm { FCVT            H5, S5 }
  LOWORD(v328) = LOWORD(_S5);
  _S5 = a3->var10.var15;
  __asm { FCVT            H5, S5 }
  WORD1(v328) = LOWORD(_S5);
  float32x4_t v329 = _Q0;
  long long v330 = _Q1;
  long long v331 = 0u;
  *(float *)&_Q1 = a3->var1.var2;
  _Q0.f32[0] = (float)a3->var1.var1;
  __asm { FCVT            H0, S0 }
  LOWORD(v331) = _Q0.i16[0];
  __asm { FCVT            H0, S1 }
  WORD1(v331) = _Q0.i16[0];
  _Q0.i32[0] = LODWORD(a3->var1.var3);
  __asm { FCVT            H0, S0 }
  WORD2(v331) = _Q0.i16[0];
  long long v332 = v148;
  long long v333 = v151;
  _Q0.f32[0] = (float)a3->var0.var1;
  __asm { FCVT            H0, S0 }
  LOWORD(v334[0]) = _Q0.i16[0];
  _Q0.i64[0] = *(void *)&a3->var0.var2;
  _Q0.i64[1] = *(void *)&a3->var2;
  *(float16x8_t *)((char *)v334 + 2) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(_Q0), *(float32x4_t *)&a3->var4);
  _Q0.i32[0] = LODWORD(a3->var8);
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  DWORD1(v334[1]) = _Q0.i32[0];
  *((void *)&v334[1] + 1) = *(void *)&a3->var11;
  LODWORD(v334[2]) = a3->var10.var0;
  *(float16x8_t *)((char *)&v334[2] + 4) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(*(float32x4_t *)&a3->var10.var1), *(float32x4_t *)&a3->var10.var5);
  *(float16x4_t *)((char *)&v334[3] + 4) = vcvt_f16_f32(*(float32x4_t *)&a3->var10.var9);
  __asm { FCVT            H0, S6 }
  WORD6(v334[3]) = _Q0.i16[0];
  v310 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v158, (uint64_t)&v328, 160);
  id v159 = [UniRunInfo alloc];
  int64x2_t v316 = vdupq_n_s64(1uLL);
  int64x2_t v326 = v316;
  uint64_t v327 = 1;
  long long v324 = xmmword_262E51690;
  uint64_t v325 = 1;
  uint64_t v161 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v159, v160, (uint64_t)&v326, &v324);
  v341[0] = @"inputBlurMapTex";
  v341[1] = @"outputParamsTex";
  id v162 = v95;
  faceParamsTedouble x = v95->_faceParamsTex;
  v342[0] = v74;
  v342[1] = faceParamsTex;
  faceMaskCalc = v95->_faceMaskCalc;
  v341[2] = @"inputParams";
  v341[3] = @"_renderContext";
  v342[2] = v140;
  v342[3] = v89;
  uint64_t v166 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v165, (uint64_t)v342, v341, 4);
  v297 = (void *)v161;
  v306 = objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskCalc, v167, (uint64_t)v166, v161);

  uint64_t v168 = [UniRunInfo alloc];
  int64x2_t v322 = v316;
  uint64_t v323 = 1;
  long long v320 = xmmword_262E516A0;
  uint64_t v321 = 1;
  uint64_t v170 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v168, v169, (uint64_t)&v322, &v320);
  uint64_t v171 = 256;
  if (v311) {
    uint64_t v171 = 264;
  }
  id v172 = *(id *)((char *)&v95->super.isa + v171);
  v339[0] = @"inputBlurMapTex";
  v339[1] = @"outputEyeProtectionFacesTex";
  eyeProtectionFacesTedouble x = v95->_eyeProtectionFacesTex;
  v340[0] = v74;
  v340[1] = eyeProtectionFacesTex;
  v339[2] = @"faceParams";
  v339[3] = @"tuningParams";
  v340[2] = v140;
  v340[3] = v310;
  v339[4] = @"_renderContext";
  v340[4] = v89;
  v175 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v174, (uint64_t)v340, v339, 5);
  v296 = v172;
  id v176 = v172;
  id v177 = v74;
  uint64_t v179 = objc_msgSend_imageByApplyingParameters_runInfo_(v176, v178, (uint64_t)v175, v170);

  objc_msgSend_extent(v74, v180, v181);
  id v183 = v303;
  double v314 = v184;
  double v317 = v185;
  if (v303)
  {
    objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend_extent(v303, v182, v186);
      if (v188 != v314 || v187 != v317) {
        sub_262E4A958();
      }
    }
  }
  v294 = (void *)v170;
  v295 = (void *)v140;
  v301 = (void *)v179;
  if (a13 == 1.0)
  {
    long long v189 = v299;
    goto LABEL_75;
  }
  long long v189 = v299;
  if (a14)
  {
LABEL_75:
    v210 = v306;
    goto LABEL_97;
  }
  v190 = objc_msgSend__mtlTextureForImage_(UniKernel, v182, (uint64_t)v303);
  v193 = v190;
  if (v190 && objc_msgSend_conformsToProtocol_(v190, v191, (uint64_t)&unk_270E2A1A0))
  {
    uint64_t v194 = v299;
    v195 = objc_msgSend_device(v193, v191, v192);
  }
  else
  {
    uint64_t v194 = v299;
    v195 = 0;
  }
  v196 = (void *)MEMORY[0x263EFF9A0];
  v337[0] = @"inputAlpha";
  CGRect v197 = objc_msgSend_null(MEMORY[0x263EFF9D0], v191, v192);
  v338[0] = v197;
  v337[1] = @"inputGlasses";
  CGRect v200 = objc_msgSend_null(MEMORY[0x263EFF9D0], v198, v199);
  v338[1] = v200;
  v337[2] = @"inputHair";
  v203 = objc_msgSend_null(MEMORY[0x263EFF9D0], v201, v202);
  v338[2] = v203;
  v205 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v204, (uint64_t)v338, v337, 3);
  uint64_t v207 = objc_msgSend_dictionaryWithDictionary_(v196, v206, (uint64_t)v205);

  if (v193)
  {
    if (v194)
    {
      objc_opt_class();
      char v209 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v209 = 0;
    }
    if (v313)
    {
      objc_opt_class();
      char v211 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v211 = 0;
    }
    if (v312)
    {
      objc_opt_class();
      char v212 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v212 = 0;
    }
    int v213 = (v211 & 1) + (v209 & 1);
    int v214 = v213 + (v212 & 1);
    if (v214)
    {
      uint64_t v215 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_(self, v208, v304, v194, v213 + (v212 & 1u), v314, v317);
      if (!v215 || (float v218 = v215, objc_msgSend_count(v215, v216, v217) != v214)) {
        sub_262E4A92C();
      }
      if (v209)
      {
        v220 = objc_msgSend_objectAtIndexedSubscript_(v218, v219, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v207, v221, (uint64_t)v220, @"inputAlpha");

        uint64_t v222 = 1;
        if ((v211 & 1) == 0) {
          goto LABEL_91;
        }
      }
      else
      {
        uint64_t v222 = 0;
        if ((v211 & 1) == 0)
        {
LABEL_91:
          if (v212)
          {
            v226 = objc_msgSend_objectAtIndexedSubscript_(v218, v219, v222);
            objc_msgSend_setObject_forKeyedSubscript_(v207, v227, (uint64_t)v226, @"inputGlasses");
          }
          goto LABEL_94;
        }
      }
      uint64_t v223 = v222 + 1;
      v224 = objc_msgSend_objectAtIndexedSubscript_(v218, v219, v222);
      objc_msgSend_setObject_forKeyedSubscript_(v207, v225, (uint64_t)v224, @"inputHair");

      uint64_t v222 = v223;
      goto LABEL_91;
    }
  }
LABEL_94:
  uint64_t v228 = objc_msgSend_objectForKeyedSubscript_(v207, v208, @"inputAlpha");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v232 = (void *)MEMORY[0x263F00650];
    v233 = objc_msgSend_blackColor(MEMORY[0x263F00608], v230, v231);
    uint64_t v235 = objc_msgSend_imageWithColor_(v232, v234, (uint64_t)v233);
    v238 = objc_msgSend_imageByCroppingToRect_(v235, v236, v237, 0.0, 0.0, v314, v317);

    v239 = [UniFakeImage alloc];
    v241 = objc_msgSend_initWithCIImage_format_(v239, v240, (uint64_t)v238, 10);
    objc_msgSend_setObject_forKeyedSubscript_(v207, v242, (uint64_t)v241, @"inputAlpha");
  }
  v243 = objc_msgSend_objectForKeyedSubscript_(v207, v230, @"inputAlpha");
  uint64_t v245 = objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v244, (uint64_t)v194, v195, 1, v243, v307, v314, v317);

  id v162 = self;
  v247 = objc_msgSend_objectForKeyedSubscript_(v207, v246, @"inputHair");
  uint64_t v249 = objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v248, (uint64_t)v313, v195, 0, v247, v307, v314, v317);

  v251 = objc_msgSend_objectForKeyedSubscript_(v207, v250, @"inputGlasses");
  uint64_t v253 = objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v252, (uint64_t)v312, v195, 0, v251, v307, v314, v317);

  id v312 = (id)v253;
  id v313 = (id)v249;
  long long v189 = (void *)v245;
  id v177 = v308;
  id v183 = v303;
  v210 = v306;
  uint64_t v179 = (uint64_t)v301;
LABEL_97:
  uint64_t v254 = 272;
  if (v311) {
    uint64_t v254 = 280;
  }
  id v255 = *(id *)((char *)&v162->super.isa + v254);
  v256 = [UniRunInfo alloc];
  v257.f64[0] = v314;
  v257.f64[1] = v317;
  __asm { FMOV            V1.2D, #0.5 }
  uint64x2_t v318 = vcvtq_u64_f64(vmulq_f64(v257, _Q1));
  uint64_t v319 = 1;
  v260 = objc_msgSend_initWithGridSize_kernel_(v256, v259, (uint64_t)&v318, v255);
  objc_msgSend_setCoreImageOutputExtent_(v260, v261, v262, 0.0, 0.0, v314, v317);
  v266 = (void *)MEMORY[0x263EFF9A0];
  v336[0] = v177;
  v335[0] = @"inputBlurMapTex";
  v335[1] = @"inputPersonTex";
  v267 = v189;
  if (!v189)
  {
    v267 = objc_msgSend_null(MEMORY[0x263EFF9D0], v263, v264);
  }
  v336[1] = v267;
  v335[2] = @"inputPersonDeltaTex";
  v268 = v309;
  if (!v309)
  {
    v268 = objc_msgSend_null(MEMORY[0x263EFF9D0], v263, v264);
  }
  v336[2] = v268;
  v335[3] = @"outputHairDeltaTex";
  v269 = v183;
  if (!v183)
  {
    v269 = objc_msgSend_null(MEMORY[0x263EFF9D0], v263, v264);
  }
  v336[3] = v269;
  v336[4] = v179;
  v335[4] = @"eyeProtectionFacesTex";
  v335[5] = @"faceParamsTex";
  v336[5] = v210;
  v336[6] = v310;
  v335[6] = @"params";
  v335[7] = @"_renderContext";
  v336[7] = v307;
  v335[8] = @"_scale";
  *(float *)&double v265 = a13;
  v270 = objc_msgSend_numberWithFloat_(NSNumber, v263, v264, v265);
  v336[8] = v270;
  v272 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v271, (uint64_t)v336, v335, 9);
  v274 = objc_msgSend_dictionaryWithDictionary_(v266, v273, (uint64_t)v272);

  v277 = v183;
  if (!v183) {

  }
  if (!v309) {
  if (!v189)
  }

  if (v311)
  {
    v278 = v312;
    v279 = v313;
    v280 = (void *)v304;
    if (v312)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v274, v275, (uint64_t)v312, @"inputGlassesTex");
    }
    else
    {
      v284 = objc_msgSend_null(MEMORY[0x263EFF9D0], v275, v276);
      objc_msgSend_setObject_forKeyedSubscript_(v274, v285, (uint64_t)v284, @"inputGlassesTex");
    }
    v286 = objc_msgSend_null(MEMORY[0x263EFF9D0], v281, v282);
    objc_msgSend_setObject_forKeyedSubscript_(v274, v287, (uint64_t)v286, @"inputGlassesDeltaTex");
  }
  else
  {
    v278 = v312;
    v279 = v313;
    v280 = (void *)v304;
    if (v313)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v274, v275, (uint64_t)v313, @"inputHairTex");
    }
    else
    {
      v288 = objc_msgSend_null(MEMORY[0x263EFF9D0], v275, v276);
      objc_msgSend_setObject_forKeyedSubscript_(v274, v289, (uint64_t)v288, @"inputHairTex");
    }
    if (v302)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v274, v283, (uint64_t)v302, @"inputHairDeltaTex");
      goto LABEL_123;
    }
    v286 = objc_msgSend_null(MEMORY[0x263EFF9D0], v283, 0);
    objc_msgSend_setObject_forKeyedSubscript_(v274, v291, (uint64_t)v286, @"inputHairDeltaTex");
  }

LABEL_123:
  v292 = objc_msgSend_imageByApplyingParameters_runInfo_(v255, v290, (uint64_t)v274, v260);

  return v292;
}

- (unint64_t)calcShaderParamsFromConfigParams:(float *)a3
{
  float v3 = *a3;
  float v4 = a3[1];
  BOOL v5 = v4 <= 0.0 || v3 <= 0.0;
  float v6 = v4 / v3;
  if (v5) {
    float v6 = 1.0;
  }
  float v7 = a3[2];
  float v8 = a3[3];
  *(float *)&_S1 = (float)(a3[5] * v6) / v7;
  float v10 = a3[4] - v8;
  _S6 = *(float *)&_S1 / v10;
  *(float *)&_S3 = (float)((float)((float)-*(float *)&_S1 / v10) * v8) + 0.0;
  _S0 = (float)(v6 * a3[8]) / v7;
  _S4 = a3[6];
  *(float *)&_S5 = a3[7] - _S4;
  _S7 = (float)(0.0 - _S0) / *(float *)&_S5;
  _S2 = _S0 + (float)((float)((float)-(float)(0.0 - _S0) / *(float *)&_S5) * _S4);
  __asm
  {
    FCVT            H4, S6
    FCVT            H3, S3
    FCVT            H1, S1
    FCVT            H5, S7
    FCVT            H2, S2
    FCVT            H0, S0
  }
  return ((unint64_t)_S1 << 32) | ((unint64_t)_S5 << 48) | ((unint64_t)_S3 << 16) | LODWORD(_S4);
}

- (id)performCrispHairRefinementWithParams:(const crisp_hair_params *)a3 alpha:(id)a4 disparity:(id)a5 tmpImage0:(id)a6 tmpImage1:(id)a7 tmpImage2:(id)a8 editTimeRender:(BOOL)a9 context:(id)a10
{
  v183[5] = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v23 = a10;
  if (!v16) {
    goto LABEL_19;
  }
  if (!v17)
  {
    id v156 = 0;
    goto LABEL_21;
  }
  if (!a3
    || a3->var2 <= 0.0 && a3->var1 <= 0.0
    || ((objc_msgSend_extent(v17, v21, v22),
         float v25 = v24,
         int v26 = (int)(float)(roundf(a3->var1 * v25) + -1.0),
         int v27 = (int)(float)(roundf(a3->var2 * v25) + -1.0),
         v26 <= 0)
      ? (BOOL v28 = v27 <= 0)
      : (BOOL v28 = 0),
        v28))
  {
LABEL_19:
    id v156 = v17;
    goto LABEL_21;
  }
  float var0 = a3->var0;
  float var3 = a3->var3;
  float var4 = a3->var4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v172 = v20;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v169 = objc_msgSend__mtlTextureForImage_(UniKernel, v33, (uint64_t)v17);
    objc_msgSend_extent(v17, v35, v36);
    double v38 = v37;
    double v40 = v39;
    uint64_t v43 = objc_msgSend_pixelFormat(v169, v41, v42);
    uint64_t v165 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, v44, (uint64_t)v172, v172, v43, v38, v40);

    id v172 = (id)v165;
  }
  id v164 = v20;
  id v166 = v19;
  objc_msgSend_extent(v16, v33, v34);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  objc_msgSend_extent(v17, v53, v54);
  v186.origin.double x = v55;
  v186.origin.double y = v56;
  v186.size.double width = v57;
  v186.size.double height = v58;
  v185.origin.double x = v46;
  v185.origin.double y = v48;
  v185.size.double width = v50;
  v185.size.double height = v52;
  if (!CGRectEqualToRect(v185, v186)) {
    sub_262E4A984();
  }
  uint64_t v59 = (2 * v26);
  unsigned int v160 = v59;
  unsigned int v170 = 2 * v27;
  float32x2_t v60 = [UniRunInfo alloc];
  objc_msgSend_extent(v17, v61, v62);
  unint64_t v64 = (unint64_t)(v63 * 0.5);
  objc_msgSend_extent(v17, v65, v66);
  v175[0] = v64;
  v175[1] = (unint64_t)(v67 * 0.5);
  v175[2] = 1;
  float32x2_t v69 = objc_msgSend_initWithGridSize_kernel_(v60, v68, (uint64_t)v175, self->_crispHairBlurX);
  objc_msgSend_extent(v17, v70, v71);
  double v73 = v72;
  objc_msgSend_extent(v17, v74, v75);
  objc_msgSend_setCoreImageOutputExtent_(v69, v76, v77, 0.0, 0.0, v73);
  crispHairBlurX = self->_crispHairBlurX;
  v182[0] = @"inputTex";
  v182[1] = @"outputTex";
  v183[0] = v16;
  v183[1] = v18;
  v182[2] = @"trustedRegionAlphaThreshold";
  *(float *)&double v78 = var0;
  float v81 = objc_msgSend_numberWithFloat_(NSNumber, v79, v80, v78);
  v183[2] = v81;
  v182[3] = @"windowSize";
  uint64_t v83 = objc_msgSend_numberWithInt_(NSNumber, v82, v59);
  v182[4] = @"_renderContext";
  v183[3] = v83;
  v183[4] = v23;
  uint64_t v85 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v84, (uint64_t)v183, v182, 5);
  objc_msgSend_imageByApplyingParameters_runInfo_(crispHairBlurX, v86, (uint64_t)v85, v69);
  id v163 = v167 = self;

  crispHairBlurY = self->_crispHairBlurY;
  v180[0] = @"inputTex";
  v180[1] = @"outputTex";
  v181[0] = v163;
  v181[1] = v166;
  v180[2] = @"trustedRegionAlphaThreshold";
  *(float *)&double v88 = var0;
  double v91 = objc_msgSend_numberWithFloat_(NSNumber, v89, v90, v88);
  v181[2] = v91;
  v180[3] = @"windowSize";
  double v93 = objc_msgSend_numberWithInt_(NSNumber, v92, v160);
  v180[4] = @"_renderContext";
  v181[3] = v93;
  v181[4] = v23;
  id v95 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v94, (uint64_t)v181, v180, 5);
  uint64_t v161 = objc_msgSend_imageByApplyingParameters_runInfo_(crispHairBlurY, v96, (uint64_t)v95, v69);

  id v97 = [UniRunInfo alloc];
  objc_msgSend_extent(v17, v98, v99);
  unint64_t v101 = (unint64_t)(v100 * 0.5);
  objc_msgSend_extent(v17, v102, v103);
  v174[0] = v101;
  v174[1] = (unint64_t)(v104 * 0.5);
  v174[2] = 1;
  double v106 = objc_msgSend_initWithGridSize_kernel_(v97, v105, (uint64_t)v174, v167->_crispHairExpandedDisparityX);

  id v19 = v166;
  objc_msgSend_extent(v17, v107, v108);
  double v110 = v109;
  objc_msgSend_extent(v17, v111, v112);
  float v113 = v106;
  objc_msgSend_setCoreImageOutputExtent_(v106, v114, v115, 0.0, 0.0, v110);
  crispHairExpandedDisparityX = v167->_crispHairExpandedDisparityX;
  v178[0] = @"disparity";
  v178[1] = @"trustedRegion";
  v179[0] = v17;
  v179[1] = v161;
  v178[2] = @"outputTex";
  v178[3] = @"expandingVeryLargeDisparity";
  v179[2] = v18;
  v179[3] = &unk_270E1F0E8;
  v178[4] = @"windowSize";
  id v118 = objc_msgSend_numberWithInt_(NSNumber, v117, v170);
  void v178[5] = @"_renderContext";
  v179[4] = v118;
  v179[5] = v23;
  uint64_t v120 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v119, (uint64_t)v179, v178, 6);
  uint64_t v122 = objc_msgSend_imageByApplyingParameters_runInfo_(crispHairExpandedDisparityX, v121, (uint64_t)v120, v113);
  id v158 = (void *)v122;

  uint64_t v123 = [UniRunInfo alloc];
  objc_msgSend_extent(v17, v124, v125);
  unint64_t v127 = (unint64_t)(v126 * 0.5);
  objc_msgSend_extent(v17, v128, v129);
  v173[0] = v127;
  v173[1] = (unint64_t)(v130 * 0.5);
  v173[2] = 1;
  v132 = objc_msgSend_initWithGridSize_kernel_(v123, v131, (uint64_t)v173, v167->_crispHairExpandedDisparityY);

  objc_msgSend_extent(v17, v133, v134);
  double v136 = v135;
  objc_msgSend_extent(v17, v137, v138);
  id v159 = v132;
  objc_msgSend_setCoreImageOutputExtent_(v132, v139, v140, 0.0, 0.0, v136);
  uint64_t v142 = 424;
  if (a9) {
    uint64_t v142 = 432;
  }
  uint64_t v171 = *(Class *)((char *)&v167->super.isa + v142);
  v176[0] = @"expandedDispXTex";
  v176[1] = @"alphaTex";
  if (a9) {
    v143 = 0;
  }
  else {
    v143 = v132;
  }
  uint64_t v168 = v143;
  v177[0] = v122;
  v177[1] = v16;
  v176[2] = @"disparityTex";
  v176[3] = @"outputTex";
  v177[2] = v17;
  v177[3] = v172;
  v176[4] = @"windowSize";
  float v144 = objc_msgSend_numberWithInt_(NSNumber, v141, v170);
  v177[4] = v144;
  void v177[5] = &unk_270E1F0F8;
  void v176[5] = @"expandingVeryLargeDisparityThreshold";
  v176[6] = @"expandingVerySmallDisparity";
  v177[6] = &unk_270E1F108;
  v177[7] = &unk_270E1F0E8;
  v176[7] = @"expandingVeryLargeDisparity";
  v176[8] = @"compositingThresholdLow";
  *(float *)&double v145 = var3;
  long long v148 = objc_msgSend_numberWithFloat_(NSNumber, v146, v147, v145);
  v177[8] = v148;
  v176[9] = @"compositingThresholdHigh";
  *(float *)&double v149 = var4;
  uint64_t v152 = objc_msgSend_numberWithFloat_(NSNumber, v150, v151, v149);
  v176[10] = @"_renderContext";
  v177[9] = v152;
  v177[10] = v23;
  v154 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v153, (uint64_t)v177, v176, 11);
  objc_msgSend_imageByApplyingParameters_runInfo_(v171, v155, (uint64_t)v154, v168);
  id v156 = (id)objc_claimAutoreleasedReturnValue();

  id v20 = v164;
LABEL_21:

  return v156;
}

- (id)createBlurMapUsingMetadata:(id)a3 simulatedAperture:(float)a4 focusWindow:(CGRect)a5 focalLengthInPixels:(float)a6 normalizedFocalLength:(float)a7 facePoints:(CGPoint *)a8 maxBlur:(float)a9 inputScale:(float)a10 inputsAlreadyScaled:(BOOL)a11 inputShiftMap:(id)a12 inputSegmentation:(id)a13 inputHair:(id)a14 inputGlasses:(id)a15 inputImageLuma:(id)a16 inputImageChroma:(id)a17 inputFaceMaskAdjBlur:(id)a18 inputWeightsX:(id)a19 inputWeightsY:(id)a20 inputPreproc:(id)a21 inputSampledD:(id)a22 inputDisparityRefineBlur:(id)a23 inputAlphaMaskDelta:(id)a24 inputHairMaskDelta:(id)a25 inputBlurRefineIntermediate:(id)a26 resultAdjBlurMap:(id)a27 coreImageRender:(BOOL)a28 context:(id)a29 captureFolderMiscPath:(id)a30
{
  double height = a5.size.height;
  double y = a5.origin.y;
  double width = a5.size.width;
  double x = a5.origin.x;
  float v38 = a10;
  uint64_t v571 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v40 = a12;
  id v41 = a13;
  id v42 = a14;
  id v494 = a15;
  unint64_t v43 = (unint64_t)v42;
  id v44 = a16;
  id v506 = a17;
  unint64_t v45 = (unint64_t)v41;
  id v482 = a18;
  id v514 = a19;
  id v502 = a20;
  id v511 = a21;
  id v495 = a22;
  id v505 = a23;
  id v491 = a24;
  id v490 = a25;
  id v46 = a26;
  id v504 = a27;
  id v47 = a29;
  id v481 = a30;
  id v48 = v40;
  v496 = v39;
  RenderingParametersFromMetaData = objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v49, (uint64_t)v39);
  if (!RenderingParametersFromMetaData)
  {
    double v78 = 0;
    float v79 = v48;
    uint64_t v80 = v506;
    goto LABEL_132;
  }
  objc_msgSend_extent(v44, v50, v51);
  v503 = v44;
  id v516 = v47;
  if (a7 == 0.0)
  {
    float v507 = a6;
    double v56 = height;
    double v57 = v55;
    double v58 = v54;
    uint64_t v59 = objc_msgSend_image(v48, v52, v53);
    objc_msgSend_depthData(v59, v60, v61);
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    float32x2_t v65 = v62;
    if (v62)
    {
      uint64_t v66 = objc_msgSend_cameraCalibrationData(v62, v63, v64);
      objc_msgSend_intrinsicMatrixReferenceDimensions(v66, v67, v68);
      float v70 = v69;

      double v73 = objc_msgSend_cameraCalibrationData(v65, v71, v72);
      uint64_t v76 = v73;
      if (v73) {
        objc_msgSend_intrinsicMatrix(v73, v74, v75);
      }
      else {
        float v77 = 0.0;
      }
      float v81 = vabds_f32(0.5, v77 / v70);

      id v47 = v516;
      if (v81 <= 0.1)
      {
        uint64_t v85 = objc_msgSend_cameraCalibrationData(v65, v82, v83, v81);
        double v88 = v85;
        if (v85) {
          objc_msgSend_intrinsicMatrix(v85, v86, v87);
        }
        else {
          float v89 = 0.0;
        }
        float v498 = v89;

        a7 = v498 / v70;
      }
      else
      {
        uint64_t v84 = uni_logger_general();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          sub_262E4AAB8(v84);
        }

        a7 = 0.0;
      }
    }
    else
    {
      a7 = 0.0;
    }

    id v44 = v503;
    double v54 = v58;
    double v55 = v57;
    double height = v56;
    float v38 = a10;
    a6 = v507;
  }
  BOOL v475 = (v45 | v43) != 0;
  if (a7 == 0.0) {
    a7 = (float)(a6 * v38) / (float)(unint64_t)v54;
  }
  double v473 = v55;
  double v474 = v54;
  float v90 = v55;
  float v91 = v54;
  float v508 = v90 / v91;
  objc_msgSend_defaultSimulatedAperture_(SDOFMetadata, v52, (uint64_t)RenderingParametersFromMetaData);
  BOOL v96 = v93 <= 0.0 || a4 <= 0.0;
  float v97 = v93 / a4;
  if (v96) {
    float v97 = 1.0;
  }
  float v499 = v97;
  uint64_t v552 = 0;
  memset(v551, 0, sizeof(v551));
  *(float *)&double v94 = a7;
  *(float *)&double v95 = a9;
  objc_msgSend_loadLensModelParams_simulatedAperture_focusWindow_frameNormalizedFocalLength_maxBlur_(SDOFMetadata, v92, (uint64_t)RenderingParametersFromMetaData, COERCE_DOUBLE((unint64_t)LODWORD(a4)), x, y, width, height, v94, v95);
  uint64_t v549 = 0;
  uint64_t v548 = 0;
  int v550 = 0;
  objc_msgSend_loadCrispHairParams_(SDOFMetadata, v98, (uint64_t)RenderingParametersFromMetaData);
  int v547 = 0;
  memset(v546, 0, sizeof(v546));
  objc_msgSend_loadDisparityRefinementParams_(SDOFMetadata, v99, (uint64_t)RenderingParametersFromMetaData);
  int v545 = 0;
  memset(v544, 0, sizeof(v544));
  *(float *)&double v100 = a9;
  objc_msgSend_loadSegmentationFusionParams_simulatedAperture_maxBlur_(SDOFMetadata, v101, (uint64_t)RenderingParametersFromMetaData, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v100);
  memset(v543, 0, 204);
  *(float *)&double v102 = v38;
  objc_msgSend_loadBlurmapRefinementParams_apertureScaling_inputScale_focusWindow_segmentationFusionParams_(SDOFMetadata, v103, (uint64_t)RenderingParametersFromMetaData, v544, COERCE_DOUBLE((unint64_t)LODWORD(v499)), v102, x, y, width, height);
  long long v541 = 0u;
  long long v542 = 0u;
  long long v539 = 0u;
  long long v540 = 0u;
  long long v537 = 0u;
  long long v538 = 0u;
  long long v535 = 0u;
  long long v536 = 0u;
  long long v534 = 0u;
  memset(v533, 0, sizeof(v533));
  *(float *)&double v104 = v508;
  *(float *)&double v105 = a9;
  objc_msgSend_loadFaceMaskParams_facePoints_simulatedAperture_aspectRatio_maxBlur_(SDOFMetadata, v106, (uint64_t)RenderingParametersFromMetaData, a8, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v104, v105);
  int v108 = objc_msgSend_disparityRefinementVersion_(SDOFMetadata, v107, (uint64_t)RenderingParametersFromMetaData);
  int RenderingVersion = objc_msgSend_getRenderingVersion_(SDOFMetadata, v109, (uint64_t)RenderingParametersFromMetaData);
  int v112 = v108;
  int v113 = RenderingVersion;
  float v114 = 0;
  memset(v532, 0, sizeof(v532));
  BOOL v116 = RenderingVersion > 3 && v108 > 0;
  if (RenderingVersion >= 5 && v112 == 0xFFFF)
  {
    int MattingParams_config = objc_msgSend_loadMattingParams_config_(SDOFMetadata, v111, (uint64_t)RenderingParametersFromMetaData, v532);
    BOOL v116 = MattingParams_config == 0;
    if (MattingParams_config) {
      float v114 = 0;
    }
    else {
      float v114 = v532;
    }
    id v47 = v516;
    if (MattingParams_config) {
      int v112 = 0;
    }
    else {
      int v112 = 0xFFFF;
    }
  }
  v476 = v114;
  int v479 = v112;
  unsigned int v497 = v113;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v118 = (id)v45;
  v493 = v118;
  if (v45)
  {
    id v121 = v118;
    objc_msgSend_extent(v118, v119, v120);
    CGFloat v123 = v122;
    CGFloat v125 = v124;
    CGFloat v127 = v126;
    CGFloat v129 = v128;
    objc_msgSend_extent(v48, v130, v131);
    v575.origin.double x = v132;
    v575.origin.double y = v133;
    v575.size.double width = v134;
    v575.size.double height = v135;
    v573.origin.double x = v123;
    v573.origin.double y = v125;
    v573.size.double width = v127;
    v573.size.double height = v129;
    v483 = v121;
    if (!CGRectEqualToRect(v573, v575))
    {
      if (isKindOfClass)
      {
        uint64_t v137 = (void *)MEMORY[0x263F00650];
        uint64_t v138 = objc_msgSend_blackColor(MEMORY[0x263F00608], v119, v136);
        uint64_t v140 = objc_msgSend_imageWithColor_(v137, v139, (uint64_t)v138);
        objc_msgSend_extent(v48, v141, v142);
        double v145 = objc_msgSend_imageByCroppingToRect_(v140, v143, v144);

        double v146 = [UniFakeImage alloc];
        long long v148 = objc_msgSend_initWithCIImage_format_(v146, v147, (uint64_t)v145, 10);
        double v149 = v493;
      }
      else
      {
        float v150 = (void *)MEMORY[0x263F12A50];
        objc_msgSend_extent(v48, v119, v136);
        unint64_t v152 = (unint64_t)v151;
        objc_msgSend_extent(v48, v153, v154);
        double v145 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v150, v156, 10, v152, (unint64_t)v155, 0);
        objc_msgSend_setUsage_(v145, v157, 19);
        unsigned int v160 = objc_msgSend_device(self->_mtlQueue, v158, v159);
        double v149 = objc_msgSend_newTextureWithDescriptor_(v160, v161, (uint64_t)v145);

        long long v148 = objc_msgSend_imageWithMTLTexture_(UniImage, v162, (uint64_t)v149);
      }
      id v47 = v516;
      if (!v148) {
        sub_262E4AA60();
      }
      objc_msgSend_extent(v48, v163, v164);
      double v166 = v165;
      double v168 = v167;
      uint64_t v171 = objc_msgSend_device(self->_mtlQueue, v169, v170);
      uint64_t v173 = objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v172, (uint64_t)v493, v171, 1, v148, v516, v166, v168);

      id v44 = v503;
      v483 = (void *)v173;
      if (!v173) {
        sub_262E4AA8C();
      }
    }
  }
  else
  {
    v483 = 0;
  }
  int UnifiedRenderingForegroundBlurEnabled = objc_msgSend_getUnifiedRenderingForegroundBlurEnabled_(SDOFMetadata, v119, (uint64_t)v496);
  BOOL v500 = enableFGBlur(UnifiedRenderingForegroundBlurEnabled);
  id v480 = v46;
  unint64_t v477 = v45;
  if (v116)
  {
    if (isKindOfClass)
    {
      id v177 = (void *)MEMORY[0x263F00650];
      id v178 = objc_msgSend_blackColor(MEMORY[0x263F00608], v175, v176);
      uint64_t v180 = objc_msgSend_imageWithColor_(v177, v179, (uint64_t)v178);
      objc_msgSend_extent(v48, v181, v182);
      CGRect v185 = objc_msgSend_imageByCroppingToRect_(v180, v183, v184);

      CGRect v186 = [UniFakeImage alloc];
      double v188 = objc_msgSend_initWithCIImage_format_(v186, v187, (uint64_t)v185, 25);
      long long v189 = self;
    }
    else
    {
      v193 = (void *)MEMORY[0x263F12A50];
      objc_msgSend_extent(v48, v175, v176);
      unint64_t v195 = (unint64_t)v194;
      objc_msgSend_extent(v48, v196, v197);
      CGRect v185 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v193, v199, 25, v195, (unint64_t)v198, 0);
      objc_msgSend_setUsage_(v185, v200, 19);
      long long v189 = self;
      v203 = objc_msgSend_device(self->_mtlQueue, v201, v202);
      v205 = objc_msgSend_newTextureWithDescriptor_(v203, v204, (uint64_t)v185);

      double v188 = objc_msgSend_imageWithMTLTexture_(UniImage, v206, (uint64_t)v205);
    }
    uint64_t v207 = v189;
    uint64_t v208 = v189;
    id v209 = v516;
    uint64_t v211 = objc_msgSend_performSLMCalculatorUsingParams_inputShiftMap_faceMaskParams_version_context_isFGBlurEnabled_(v207, v210, (uint64_t)v551, v48, 0, v497, v516, v500);
    if (!v211) {
      sub_262E4A9B0();
    }
    v190 = (void *)v211;
    objc_msgSend_extent(v48, v212, v213);
    v219 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_(v208, v214, (uint64_t)v511, v511, v215, v216);
    if (isKindOfClass)
    {
      v220 = (void *)MEMORY[0x263F00650];
      v221 = objc_msgSend_blackColor(MEMORY[0x263F00608], v217, v218);
      uint64_t v223 = objc_msgSend_imageWithColor_(v220, v222, (uint64_t)v221);
      objc_msgSend_extent(v48, v224, v225);
      uint64_t v228 = objc_msgSend_imageByCroppingToRect_(v223, v226, v227);

      uint64_t v230 = objc_msgSend_imageWithCIImage_format_(UniFakeImage, v229, (uint64_t)v228, 70);

      v219 = (void *)v230;
      id v209 = v516;
    }
    id v469 = v209;
    v191 = self;
    uint64_t v231 = objc_msgSend_performDisparityRefinementViaMatting_inputShiftmap_focusRect_inputLuma_inputChroma_simpleLensModelCalculatorImage_disparityConfigIndex_outputRefinedImage_tmpRGB_tmpDisparity_tmpRGBA_SDOFVersion_mattingParams_context_(self, v217, (uint64_t)v483, v48, v503, v506, v190, v479, x, y, width, height, v188, v219, v514, 0, v497, v476, v469);

    if (!v231) {
      sub_262E4A9DC();
    }
    id v232 = v231;

    id v48 = v232;
    uint64_t v192 = v497;

    id v44 = v503;
    id v47 = v516;
  }
  else
  {
    v190 = 0;
    v191 = self;
    uint64_t v192 = v497;
  }
  if (qword_26B425280 != -1) {
    dispatch_once(&qword_26B425280, &unk_270E12D38);
  }
  long long v531 = 0u;
  memset(&v530, 0, sizeof(v530));
  objc_msgSend_loadHairnetParams_(SDOFMetadata, v175, (uint64_t)RenderingParametersFromMetaData);
  if (qword_26B425288 != -1) {
    dispatch_once(&qword_26B425288, &unk_270E12D58);
  }
  int v236 = byte_26A9975F8;
  if (byte_26A9975F8 == 121)
  {
    if (*((float *)&v530.b + 1) != 0.0) {
      goto LABEL_68;
    }
    LODWORD(v235) = LODWORD(v530.c);
    if (*(float *)&v530.c != 0.0) {
      goto LABEL_68;
    }
    objc_msgSend_defaultHairnetParams(SDOFMetadata, v233, v234, v235);
    CGAffineTransform v530 = v569;
    HIDWORD(v235) = HIDWORD(v569.tx);
    long long v531 = v570;
    int v236 = byte_26A9975F8;
  }
  if (v236 == 110)
  {
    LODWORD(v530.c) = 0;
    HIDWORD(v530.b) = 0;
    double v235 = 0.0;
    float v237 = 0.0;
    goto LABEL_69;
  }
LABEL_68:
  float v237 = *((float *)&v530.b + 1);
  LODWORD(v235) = LODWORD(v530.c);
LABEL_69:
  BOOL v238 = *(float *)&v235 != 0.0 || v237 != 0.0;
  if (byte_26A9975F0)
  {
    unint64_t v239 = v43;
    v240 = v48;
    if (byte_26A9975F1) {
      goto LABEL_74;
    }
  }
  else
  {
    unint64_t v239 = v43;
    v240 = v48;
    if ((int)v192 >= 4)
    {
      v240 = v48;
      if (v483)
      {
        v240 = v48;
        if (v48)
        {
          LODWORD(v235) = v549;
          if (*(float *)&v549 > 0.0 || (LODWORD(v235) = HIDWORD(v548), v240 = v48, *((float *)&v548 + 1) > 0.0))
          {
LABEL_74:
            if (isKindOfClass)
            {
              v241 = (void *)MEMORY[0x263F00650];
              objc_super v242 = objc_msgSend_blackColor(MEMORY[0x263F00608], v233, v234);
              v244 = objc_msgSend_imageWithColor_(v241, v243, (uint64_t)v242);
              objc_msgSend_extent(v48, v245, v246);
              uint64_t v249 = objc_msgSend_imageByCroppingToRect_(v244, v247, v248);

              v250 = [UniFakeImage alloc];
              v252 = objc_msgSend_initWithCIImage_format_(v250, v251, (uint64_t)v249, 25);
              uint64_t v253 = self;
            }
            else
            {
              uint64_t v254 = (void *)MEMORY[0x263F12A50];
              objc_msgSend_extent(v48, v233, v234, v235);
              unint64_t v256 = (unint64_t)v255;
              objc_msgSend_extent(v48, v257, v258);
              uint64_t v249 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v254, v260, 25, v256, (unint64_t)v259, 0);
              objc_msgSend_setUsage_(v249, v261, 19);
              uint64_t v253 = self;
              uint64_t v264 = objc_msgSend_device(self->_mtlQueue, v262, v263);
              v266 = objc_msgSend_newTextureWithDescriptor_(v264, v265, (uint64_t)v249);

              v252 = objc_msgSend_imageWithMTLTexture_(UniImage, v267, (uint64_t)v266);
            }
            id v47 = v516;
            LOBYTE(v465) = isKindOfClass & 1;
            v240 = objc_msgSend_performCrispHairRefinementWithParams_alpha_disparity_tmpImage0_tmpImage1_tmpImage2_editTimeRender_context_(v253, v268, (uint64_t)&v548, v483, v48, v514, v502, v252, v465, v516);

            if (!v240) {
              sub_262E4AA34();
            }
            v191 = v253;

            id v44 = v503;
            uint64_t v192 = v497;
          }
        }
      }
    }
  }
  uint64_t v269 = objc_msgSend_performSLMCalculatorUsingParams_inputShiftMap_faceMaskParams_version_context_isFGBlurEnabled_(v191, v233, (uint64_t)v551, v240, v533, v192, v47, v500, v235);

  v484 = (void *)v269;
  if (!v269) {
    sub_262E4AA08();
  }
  id v472 = v48;
  unint64_t v271 = -1;
  uint64_t v272 = -2;
  HIDWORD(v273) = DWORD1(v538);
  do
  {
    ++v271;
    long long v523 = v538;
    v272 += 2;
  }
  while (v271 <= 3 && *(float *)((unint64_t)&v523 & 0xFFFFFFFFFFFFFFF3 | (4 * (v271 & 3))) >= 0.0);
  if (v271) {
    BOOL v274 = v238;
  }
  else {
    BOOL v274 = 0;
  }
  BOOL v471 = v274;
  BOOL v276 = (int)v192 > 3 || v479 < 1;
  char v277 = v276 | isKindOfClass ^ 1;
  int v278 = v192;
  uint64_t v80 = v506;
  unint64_t v43 = v239;
  if ((v277 & 1) == 0)
  {
    LODWORD(v466) = v278;
    v279 = objc_msgSend_performDisparityRefinementViaMatting_inputShiftmap_focusRect_inputLuma_inputChroma_simpleLensModelCalculatorImage_disparityConfigIndex_outputRefinedImage_tmpRGB_tmpDisparity_tmpRGBA_SDOFVersion_mattingParams_context_(v191, v270, (uint64_t)v493, v240, v44, v506, v484, x, y, width, height, v505, v511, v514, 0, v466, v476, v47);

    if (v38 != 1.0 && !a11)
    {
      v281 = objc_msgSend_image(v279, v270, v280);
      objc_msgSend_extent(v281, v282, v283);
      CGFloat v285 = v284;
      CGFloat v287 = v286;
      CGFloat v289 = v288;
      CGFloat v291 = v290;
      objc_msgSend_extent(v506, v292, v293);
      v576.origin.double x = v294;
      v576.origin.double y = v295;
      v576.size.double width = v296;
      v576.size.double height = v297;
      v574.origin.double x = v285;
      v574.origin.double y = v287;
      v574.size.double width = v289;
      v574.size.double height = v291;
      if (!CGRectEqualToRect(v574, v576))
      {
        if (isKindOfClass)
        {
          v300 = (void *)MEMORY[0x263F00650];
          v301 = objc_msgSend_blackColor(MEMORY[0x263F00608], v298, v299);
          id v303 = objc_msgSend_imageWithColor_(v300, v302, (uint64_t)v301);
          objc_msgSend_extent(v506, v304, v305);
          id v308 = objc_msgSend_imageByCroppingToRect_(v303, v306, v307);

          id v47 = v516;
          v309 = [UniFakeImage alloc];
          int v311 = objc_msgSend_initWithCIImage_(v309, v310, (uint64_t)v308);

          uint64_t v80 = v506;
          double v314 = self;
        }
        else
        {
          objc_msgSend_extent(v506, v298, v299);
          double v314 = self;
          int v311 = objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_(self, v315, (uint64_t)v279, v506, v316, v317);
        }
        objc_msgSend_extent(v506, v312, v313);
        double v319 = v318;
        double v321 = v320;
        objc_msgSend_extent(v281, v322, v323);
        uint64_t v325 = objc_msgSend__scaleImage_targetSize_sourceSize_device_outputImage_context_(v314, v324, (uint64_t)v279, 0, v311, v47, v319, v321);

        v279 = (void *)v325;
        id v47 = v516;
        id v44 = v503;
      }
    }
    v240 = v279;
    v191 = self;
  }
  BYTE1(v468) = isKindOfClass & 1;
  LOBYTE(v468) = (v277 & 1) == 0;
  *(float *)&double v273 = v38;
  int64x2_t v326 = objc_msgSend_performDisparityRefinementUsingParams_inputDisparity_inputSegmentation_inputImageLuma_inputImageChroma_inputSlmParams_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_outputBlurMap_scale_havePerformedMatting_editTimeRender_context_enableFGBlur_(v191, v270, (uint64_t)v546, v240, v493, v44, v80, v484, v273, v514, v502, v511, v495, v505, v468, v47, v500);
  v510 = v326;
  if (v500)
  {
    extractPositiveBlurValues = v191->_extractPositiveBlurValues;
    v567[0] = @"signedBlurMapTex";
    v567[1] = @"outputBlurMapTex";
    v568[0] = v326;
    v568[1] = v504;
    v567[2] = @"_renderContext";
    v568[2] = v47;
    uint64_t v329 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v327, (uint64_t)v568, v567, 3);
    objc_msgSend_imageByApplyingParameters_(extractPositiveBlurValues, v330, v329);
    id v331 = (id)objc_claimAutoreleasedReturnValue();

    v240 = (void *)v329;
  }
  else
  {
    id v331 = v326;
  }
  id v46 = v480;

  if (v475)
  {
    id v47 = v516;
    LOBYTE(v467) = a11;
    id v334 = v504;
    v335 = self;
    *(float *)&double v333 = v38;
    v336 = objc_msgSend_enqueueRefinementUsingParams_maskParams_inputBlurMap_inputAlpha_inputHair_inputGlasses_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_outputBlurMap_scale_inputsAlreadyScaled_context_(self, v332, (uint64_t)v543, v533, v331, v493, v43, v494, v333, v491, v490, v480, v504, v467, v516);
  }
  else
  {
    v337 = [UniRunInfo alloc];
    int64x2_t v528 = vdupq_n_s64(1uLL);
    uint64_t v529 = 1;
    long long v526 = xmmword_262E51690;
    uint64_t v527 = 1;
    uint64_t v487 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v337, v338, (uint64_t)&v528, &v526);
    v489 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v339, (uint64_t)v533, 192);
    v335 = self;
    faceMaskCalc = self->_faceMaskCalc;
    v565[0] = @"inputBlurMapTex";
    v565[1] = @"inputParams";
    v566[0] = v331;
    v566[1] = v489;
    faceMaskOutputParamsTedouble x = self->_faceMaskOutputParamsTex;
    v565[2] = @"outputParamsTex";
    v565[3] = @"_renderContext";
    v566[2] = faceMaskOutputParamsTex;
    v566[3] = v516;
    v342 = NSDictionary;
    id v343 = v331;
    v345 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v342, v344, (uint64_t)v566, v565, 4);
    v347 = objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskCalc, v346, (uint64_t)v345, v487);

    faceMaskAppldouble y = self->_faceMaskApply;
    v563[0] = @"paramsTex";
    v563[1] = @"inputBlurMapTex";
    v564[0] = v347;
    v564[1] = v343;
    v563[2] = @"outputBlurMapTex";
    v563[3] = @"_renderContext";
    id v334 = v504;
    v564[2] = v504;
    v564[3] = v516;
    v350 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v349, (uint64_t)v564, v563, 4);
    v336 = objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskApply, v351, (uint64_t)v350, 0);

    id v46 = v480;
    id v47 = v516;

    uint64_t v80 = v506;
    id v331 = (id)v487;
  }

  v524[0] = 0;
  v524[1] = 0;
  int v525 = 0;
  objc_msgSend_loadBlurmapSmoothingParams_(SDOFMetadata, v352, (uint64_t)RenderingParametersFromMetaData);
  *(float *)&double v353 = v38;
  v355 = objc_msgSend_performBlurmapSmoothingUsingSmoothingConfig_inputBlurMap_inputIntermediateTex_outputSmoothedBlurmap_scale_version_context_(v335, v354, (uint64_t)v524, v336, v46, v334, v497, v47, v353);

  if (v500)
  {
    id v358 = v334;
    insertPositiveBlurValues = v335->_insertPositiveBlurValues;
    v561[0] = @"signedBlurMapTex";
    v561[1] = @"positiveBlurMapTex";
    v562[0] = v510;
    v562[1] = v355;
    v561[2] = @"outputBlurMapTex";
    v561[3] = @"_renderContext";
    v562[2] = v358;
    v562[3] = v47;
    v360 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v356, (uint64_t)v562, v561, 4);
    uint64_t v362 = objc_msgSend_imageByApplyingParameters_(insertPositiveBlurValues, v361, (uint64_t)v360);

    v355 = (void *)v362;
  }
  objc_msgSend_blurMapSize_(MakeBlurMap, v356, v357, v474, v473);
  if (!a28) {
    goto LABEL_130;
  }
  double v367 = v365;
  double v368 = v366;
  unint64_t v470 = v43;
  objc_msgSend_extent(v355, v363, v364);
  if (v371 != v367 || (objc_msgSend_extent(v355, v369, v370), v372 != v367))
  {
    v373 = (void *)MEMORY[0x263F00650];
    v374 = objc_msgSend_blackColor(MEMORY[0x263F00608], v369, v370);
    v376 = objc_msgSend_imageWithColor_(v373, v375, (uint64_t)v374);
    v379 = objc_msgSend_imageByCroppingToRect_(v376, v377, v378, 0.0, 0.0, v367, v368);

    v380 = [UniFakeImage alloc];
    v382 = objc_msgSend_initWithCIImage_format_(v380, v381, (uint64_t)v379, 115);

    v383 = objc_alloc_init(UniScaleImage);
    objc_msgSend_extent(v355, v384, v385);
    double v387 = v367 / v386;
    objc_msgSend_extent(v355, v388, v389);
    v559[0] = *MEMORY[0x263F00990];
    v393 = objc_msgSend_vectorWithX_Y_(MEMORY[0x263F00680], v391, v392, v387, v368 / v390);
    uint64_t v394 = *MEMORY[0x263F009D0];
    v559[1] = *MEMORY[0x263F00968];
    v559[2] = v394;
    v560[0] = v393;
    v560[1] = v355;
    v559[3] = @"_renderContext";
    v560[2] = v382;
    v560[3] = v516;
    v396 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v395, (uint64_t)v560, v559, 4);
    uint64_t v398 = objc_msgSend_imageByApplyingParameters_(v383, v397, (uint64_t)v396);

    id v47 = v516;
    uint64_t v80 = v506;

    v355 = (void *)v398;
    unint64_t v43 = v470;
    id v46 = v480;
  }
  if (v471
    && (objc_msgSend_image(v503, v369, v370),
        v399 = objc_claimAutoreleasedReturnValue(),
        v399,
        v399))
  {
    v513 = objc_msgSend_image(v503, v400, v401);
    v404 = objc_msgSend_image(v355, v402, v403);
    v501 = objc_msgSend_image(v493, v405, v406);
    v409 = objc_msgSend_image((void *)v43, v407, v408);
    v412 = objc_msgSend_image(v494, v410, v411);
    uint64_t v413 = 0;
    uint64_t v414 = 0;
    long long v570 = 0u;
    memset(&v569, 0, sizeof(v569));
    long long v558 = 0u;
    memset(&v557, 0, sizeof(v557));
    memset(v556, 0, sizeof(v556));
    long long v415 = v534;
    long long v416 = v535;
    long long v417 = v536;
    long long v418 = v537;
    long long v419 = v538;
    long long v420 = v539;
    do
    {
      long long v517 = v415;
      v421 = (double *)((char *)&v569.a + v413 * 16);
      double *v421 = *(float *)((unint64_t)&v517 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414 & 3)));
      long long v518 = v416;
      v421[1] = *(float *)((unint64_t)&v518 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414 & 3)));
      long long v519 = v417;
      v422 = (double *)((char *)&v557.a + v413 * 16);
      double *v422 = *(float *)((unint64_t)&v519 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414 & 3)));
      long long v520 = v418;
      v422[1] = *(float *)((unint64_t)&v520 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414 & 3)));
      long long v521 = v419;
      v423 = (double *)&v556[v413];
      double *v423 = *(float *)((unint64_t)&v521 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414 & 3)));
      long long v522 = v420;
      v423[1] = *(float *)((unint64_t)&v522 & 0xFFFFFFFFFFFFFFF3 | (4 * (v414++ & 3)));
      ++v413;
    }
    while (v271 != v414);
    v554[0] = @"lEye";
    v424 = objc_msgSend_vectorWithValues_count_(MEMORY[0x263F00680], (const char *)v421, (uint64_t)&v569, v272);
    v555[0] = v424;
    v554[1] = @"rEye";
    v426 = objc_msgSend_vectorWithValues_count_(MEMORY[0x263F00680], v425, (uint64_t)&v557, v272);
    v555[1] = v426;
    v554[2] = @"chin";
    v428 = objc_msgSend_vectorWithValues_count_(MEMORY[0x263F00680], v427, (uint64_t)v556, v272);
    v555[2] = v428;
    v430 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v429, (uint64_t)v555, v554, 3);

    v431 = v501;
    if (v501)
    {
      unint64_t v45 = v477;
      id v47 = v516;
      v432 = v513;
      if (v409 && v404 && v430)
      {
        CGAffineTransform v569 = v530;
        long long v570 = v531;
        v433 = createInpaintingMask(v513, v501, v409, v412, v404, v430, (float *)&v569);
        objc_msgSend_extent(v404, v434, v435);
        double v437 = v436;
        objc_msgSend_extent(v433, v438, v439);
        memset(&v569, 0, sizeof(v569));
        CGAffineTransformMakeScale(&v569, v437 / v440, v437 / v440);
        v443 = objc_msgSend_imageBySamplingNearest(v433, v441, v442);

        CGAffineTransform v557 = v569;
        v445 = objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v443, v444, (uint64_t)&v557, 0);

        v447 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v446, @"ccp_insertMask");
        objc_msgSend_extent(v355, v448, v449);
        double v451 = v450;
        double v453 = v452;
        double v455 = v454;
        double v457 = v456;
        v553[0] = v404;
        v553[1] = v445;
        v459 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v458, (uint64_t)v553, 2);
        uint64_t v461 = objc_msgSend_applyWithExtent_arguments_(v447, v460, (uint64_t)v459, v451, v453, v455, v457);

        uint64_t v463 = objc_msgSend_imageWithObject_(UniImage, v462, v461);

        v431 = v501;
        v432 = v513;
        v404 = (void *)v461;
        unint64_t v45 = v477;
        v355 = (void *)v463;
        id v47 = v516;
      }
    }
    else
    {
      unint64_t v45 = v477;
      id v47 = v516;
      v432 = v513;
    }

    unint64_t v43 = v470;
    uint64_t v80 = v506;
  }
  else
  {
LABEL_130:
    unint64_t v45 = v477;
  }
  free(RenderingParametersFromMetaData);
  id v48 = v355;

  double v78 = v48;
  id v44 = v503;
  float v79 = v472;
LABEL_132:

  return v78;
}

- (int)enqueueBlurMapGenerationUsingArgs:(id)a3
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263E61270]();
  float v6 = objc_alloc_init(UniContext);
  if (objc_msgSend_validateForMetal(v4, v7, v8))
  {
    uint64_t v171 = (uint64_t *)self;
    v11 = objc_msgSend_inputShiftMap(v4, v9, v10);
    uint64_t v13 = objc_msgSend_imageWithObject_(UniImage, v12, (uint64_t)v11);

    id v16 = objc_msgSend_inputSegmentation(v4, v14, v15);
    v175 = objc_msgSend_imageWithObject_(UniImage, v17, (uint64_t)v16);

    id v20 = objc_msgSend_inputHair(v4, v18, v19);
    v174 = objc_msgSend_imageWithObject_(UniImage, v21, (uint64_t)v20);

    double v24 = objc_msgSend_inputGlasses(v4, v22, v23);
    id v172 = objc_msgSend_imageWithObject_(UniImage, v25, (uint64_t)v24);

    BOOL v28 = objc_msgSend_inputImageLuma(v4, v26, v27);
    uint64_t v30 = objc_msgSend_imageWithObject_(UniImage, v29, (uint64_t)v28);

    CGFloat v33 = objc_msgSend_inputImageChroma(v4, v31, v32);
    uint64_t v179 = objc_msgSend_imageWithObject_(UniImage, v34, (uint64_t)v33);

    double v37 = objc_msgSend_outputBlurMap(v4, v35, v36);
    id v178 = objc_msgSend_imageWithObject_(UniImage, v38, (uint64_t)v37);

    id v41 = objc_msgSend_intermediates(v4, v39, v40);
    id v44 = objc_msgSend_inputDisparityRefineBlurTex(v41, v42, v43);
    uint64_t v46 = objc_msgSend_imageWithObject_(UniImage, v45, (uint64_t)v44);

    double v49 = objc_msgSend_intermediates(v4, v47, v48);
    CGFloat v52 = objc_msgSend_inputPreprocTex(v49, v50, v51);
    uint64_t v180 = objc_msgSend_imageWithObject_(UniImage, v53, (uint64_t)v52);

    double v56 = objc_msgSend_intermediates(v4, v54, v55);
    uint64_t v59 = objc_msgSend_inputAlphaMaskDeltaTex(v56, v57, v58);
    id v177 = objc_msgSend_imageWithObject_(UniImage, v60, (uint64_t)v59);

    double v63 = objc_msgSend_intermediates(v4, v61, v62);
    uint64_t v66 = objc_msgSend_inputHairMaskDeltaTex(v63, v64, v65);
    uint64_t v176 = objc_msgSend_imageWithObject_(UniImage, v67, (uint64_t)v66);

    uint64_t v173 = (void *)v13;
    if (!v13) {
      sub_262E4AAFC();
    }
    if (!v46) {
      sub_262E4AB28();
    }
    if (!v180) {
      sub_262E4AB54();
    }
    float v70 = objc_msgSend_intermediates(v4, v68, v69);
    double v73 = objc_msgSend_inputAlphaMaskDeltaTex(v70, v71, v72);

    if (v73 && !v177) {
      sub_262E4AB80();
    }
    uint64_t v76 = objc_msgSend_intermediates(v4, v74, v75);
    float v79 = objc_msgSend_inputHairMaskDeltaTex(v76, v77, v78);

    if (v79 && !v176) {
      sub_262E4ABAC();
    }
    if (!v30) {
      sub_262E4ABD8();
    }
    if (!v179) {
      sub_262E4AC04();
    }
    if (!v178) {
      sub_262E4AC30();
    }
    id v82 = objc_msgSend_inputSegmentation(v4, v80, v81);

    if (v82 && !v175) {
      sub_262E4AC5C();
    }
    uint64_t v85 = objc_msgSend_inputHair(v4, v83, v84);

    if (v85 && !v174) {
      sub_262E4AC88();
    }
    id v163 = v5;
    double v88 = objc_msgSend_facePoints(v4, v86, v87);
    sub_262E267A8((uint64_t)v181, v88);

    uint64_t v169 = objc_msgSend_metadata(v4, v89, v90);
    objc_msgSend_simulatedAperture(v4, v91, v92);
    int v168 = v93;
    objc_msgSend_focusWindow(v4, v94, v95);
    double v97 = v96;
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    objc_msgSend_focalLengthInPixels(v4, v104, v105);
    int v107 = v106;
    objc_msgSend_normalizedFocalLength(v4, v108, v109);
    int v111 = v110;
    objc_msgSend_maxBlur(v4, v112, v113);
    int v115 = v114;
    objc_msgSend_inputScale(v4, v116, v117);
    int v119 = v118;
    uint64_t v170 = objc_msgSend_intermediates(v4, v120, v121);
    double v165 = objc_msgSend_inputFaceMaskAdjBlurTex(v170, v122, v123);
    double v167 = objc_msgSend_intermediates(v4, v124, v125);
    double v128 = objc_msgSend_inputWeightsXTex(v167, v126, v127);
    double v166 = objc_msgSend_intermediates(v4, v129, v130);
    CGFloat v133 = objc_msgSend_inputWeightsYTex(v166, v131, v132);
    uint64_t v164 = objc_msgSend_intermediates(v4, v134, v135);
    objc_msgSend_inputSampledDTex(v164, v136, v137);
    v139 = uint64_t v138 = v30;
    uint64_t v142 = objc_msgSend_intermediates(v4, v140, v141);
    double v145 = objc_msgSend_inputBlurRefineIntermediateTex(v142, v143, v144);
    long long v148 = objc_msgSend_captureFolderMiscPath(v4, v146, v147);
    id v162 = (void *)v138;
    LODWORD(v149) = v168;
    LODWORD(v150) = v107;
    LODWORD(v151) = v111;
    LODWORD(v152) = v115;
    objc_msgSend_createBlurMapUsingMetadata_simulatedAperture_focusWindow_focalLengthInPixels_normalizedFocalLength_facePoints_maxBlur_inputScale_inputsAlreadyScaled_inputShiftMap_inputSegmentation_inputHair_inputGlasses_inputImageLuma_inputImageChroma_inputFaceMaskAdjBlur_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_inputDisparityRefineBlur_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_resultAdjBlurMap_coreImageRender_context_captureFolderMiscPath_(v171, v153, (uint64_t)v169, v181, 1, v173, v175, v174, v149, v97, v99, v101, v103, v150, v151, v152, v119, v172, v138,
      v179,
      v165,
      v128,
      v133,
      v180,
      v139,
      v46,
      v177,
      v176,
      v145,
      v178,
      0,
      v6,
    uint64_t v154 = v148);

    if (v154)
    {
      objc_msgSend_metalRender_waitUntilScheduled_waitUntilCompleted_(v154, v155, v171[1], 0, 0);
      objc_msgSend_empty(v6, v156, v157);

      int v158 = 0;
    }
    else
    {
      int v158 = -1;
    }
    BOOL v5 = v163;
    unsigned int v160 = (void *)v46;
    uint64_t v159 = v162;
  }
  else
  {
    id v172 = 0;
    uint64_t v173 = 0;
    uint64_t v159 = 0;
    id v178 = 0;
    uint64_t v179 = 0;
    unsigned int v160 = 0;
    uint64_t v180 = 0;
    uint64_t v176 = 0;
    id v177 = 0;
    v174 = 0;
    v175 = 0;
    int v158 = -1;
  }

  return v158;
}

- (id)imageUsingArgs:(id)a3
{
  v208[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263E61270]();
  float v6 = objc_alloc_init(UniContext);
  if (objc_msgSend_validateForCoreImage(v4, v7, v8))
  {
    unint64_t v195 = v5;
    v193 = self;
    objc_msgSend_allocateFakeResources(self, v9, v10);
    uint64_t v15 = objc_msgSend_inputImage(v4, v11, v12);
    id v16 = v15;
    if (!v15)
    {
      id v16 = objc_msgSend_inputImageLuma(v4, v13, v14);
    }
    unint64_t v17 = 0x263F00000uLL;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (!v15) {

    }
    double v194 = v6;
    id v20 = objc_msgSend_inputImage(v4, v18, v19);

    if (v20)
    {
      uint64_t v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
      int v26 = objc_msgSend_inputImage(v4, v24, v25);
      BOOL v28 = objc_msgSend_imageYCC444_matrix_fullRange_colorSpace_(MEMORY[0x263F00650], v27, (uint64_t)v26, 601, 1, v23);
      CGColorSpaceRelease(v23);
      objc_msgSend_extent(v28, v29, v30);
      CGFloat v32 = v31;
      double v196 = v31;
      double v198 = v33;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      double v200 = v35;
      double v202 = v37;
      CGFloat v38 = v37;
      uint64_t v40 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v39, @"ccp_chroma", *MEMORY[0x263F008C8]);
      id v42 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v41, @"ccp_luma", *MEMORY[0x263F008D0]);
      memset(&v205, 0, sizeof(v205));
      CGAffineTransformMakeScale(&v205, 0.5, 0.5);
      CGAffineTransform v204 = v205;
      v210.origin.double x = v32;
      v210.origin.double y = v34;
      v210.size.double width = v36;
      v210.size.double height = v38;
      CGRect v211 = CGRectApplyAffineTransform(v210, &v204);
      CGRect v212 = CGRectIntegral(v211);
      double x = v212.origin.x;
      double y = v212.origin.y;
      double width = v212.size.width;
      double height = v212.size.height;
      double v49 = objc_msgSend_imageByClampingToExtent(v28, v47, v48);
      CGAffineTransform v204 = v205;
      uint64_t v51 = objc_msgSend_imageByApplyingTransform_(v49, v50, (uint64_t)&v204);

      objc_msgSend_extent(v51, v52, v53);
      double v55 = v54;
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      v208[0] = v51;
      double v63 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v62, (uint64_t)v208, 1);
      uint64_t v65 = objc_msgSend_applyWithExtent_arguments_(v40, v64, (uint64_t)v63, v55, v57, v59, v61);

      uint64_t v68 = objc_msgSend_imageByCroppingToRect_(v65, v66, v67, x, y, width, height);

      uint64_t v207 = v28;
      float v70 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v69, (uint64_t)&v207, 1);
      uint64_t v201 = objc_msgSend_applyWithExtent_arguments_(v42, v71, (uint64_t)v70, v196, v198, v200, v202);

      unint64_t v17 = 0x263F00000;
    }
    else
    {
      uint64_t v201 = objc_msgSend_inputImageLuma(v4, v21, v22);
      uint64_t v68 = objc_msgSend_inputImageChroma(v4, v74, v75);
    }
    uint64_t v76 = *(void **)(v17 + 1616);
    float v77 = objc_msgSend_blackColor(MEMORY[0x263F00608], v72, v73);
    float v79 = objc_msgSend_imageWithColor_(v76, v78, (uint64_t)v77);
    double v187 = v68;
    objc_msgSend_extent(v68, v80, v81);
    uint64_t v84 = objc_msgSend_imageByCroppingToRect_(v79, v82, v83);

    uint64_t v85 = [UniFakeImage alloc];
    uint64_t v87 = objc_msgSend_initWithCIImage_format_(v85, v86, (uint64_t)v84, 25);
    double v88 = [UniFakeImage alloc];
    v203 = objc_msgSend_initWithCIImage_format_(v88, v89, (uint64_t)v84, 65);
    uint64_t v90 = [UniFakeImage alloc];
    uint64_t v199 = objc_msgSend_initWithCIImage_format_(v90, v91, (uint64_t)v84, 115);
    v191 = objc_msgSend_inputShiftMap(v4, v92, v93);
    double v94 = *(void **)(v17 + 1616);
    double v97 = objc_msgSend_blackColor(MEMORY[0x263F00608], v95, v96);
    double v99 = objc_msgSend_imageWithColor_(v94, v98, (uint64_t)v97);
    objc_msgSend_extent(v191, v100, v101);
    v190 = objc_msgSend_imageByCroppingToRect_(v99, v102, v103);

    double v104 = [UniFakeImage alloc];
    uint64_t v197 = objc_msgSend_initWithCIImage_format_(v104, v105, (uint64_t)v190, 25);
    int v108 = objc_msgSend_facePoints(v4, v106, v107);
    sub_262E267A8((uint64_t)v206, v108);

    double v188 = objc_msgSend_metadata(v4, v109, v110);
    objc_msgSend_simulatedAperture(v4, v111, v112);
    int v186 = v113;
    objc_msgSend_focusWindow(v4, v114, v115);
    double v117 = v116;
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;
    objc_msgSend_focalLengthInPixels(v4, v124, v125);
    int v127 = v126;
    objc_msgSend_normalizedFocalLength(v4, v128, v129);
    int v131 = v130;
    objc_msgSend_maxBlur(v4, v132, v133);
    int v135 = v134;
    objc_msgSend_inputScale(v4, v136, v137);
    int v139 = v138;
    long long v189 = objc_msgSend_inputShiftMap(v4, v140, v141);
    uint64_t v181 = objc_msgSend_imageWithCIImage_(UniImage, v142, (uint64_t)v189);
    CGRect v185 = objc_msgSend_inputSegmentation(v4, v143, v144);
    id v183 = objc_msgSend_imageWithCIImage_(UniImage, v145, (uint64_t)v185);
    uint64_t v184 = objc_msgSend_inputHair(v4, v146, v147);
    double v149 = objc_msgSend_imageWithCIImage_(UniImage, v148, (uint64_t)v184);
    uint64_t v182 = objc_msgSend_inputGlasses(v4, v150, v151);
    uint64_t v153 = objc_msgSend_imageWithCIImage_(UniImage, v152, (uint64_t)v182);
    double v155 = objc_msgSend_imageWithCIImage_(UniImage, v154, (uint64_t)v201);
    uint64_t v157 = objc_msgSend_imageWithCIImage_(UniImage, v156, (uint64_t)v68);
    uint64_t v180 = objc_msgSend_metadata(v4, v158, v159);
    if (objc_msgSend_getUnifiedRenderingForegroundBlurEnabled_(SDOFMetadata, v160, (uint64_t)v180))id v163 = v203; {
    else
    }
      id v163 = v87;
    uint64_t v164 = objc_msgSend_captureFolderMiscPath(v4, v161, v162);
    float v6 = v194;
    LODWORD(v165) = v186;
    LODWORD(v166) = v127;
    LODWORD(v167) = v131;
    LODWORD(v168) = v135;
    objc_msgSend_createBlurMapUsingMetadata_simulatedAperture_focusWindow_focalLengthInPixels_normalizedFocalLength_facePoints_maxBlur_inputScale_inputsAlreadyScaled_inputShiftMap_inputSegmentation_inputHair_inputGlasses_inputImageLuma_inputImageChroma_inputFaceMaskAdjBlur_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_inputDisparityRefineBlur_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_resultAdjBlurMap_coreImageRender_context_captureFolderMiscPath_(v193, v169, (uint64_t)v188, v206, 0, v181, v183, v149, v165, v117, v119, v121, v123, v166, v167, v168, v139, v153, v155,
      v157,
      v87,
      v197,
      v197,
      v199,
      v87,
      v87,
      v87,
      v87,
      v87,
      v163,
      isKindOfClass & 1,
      v194,
    uint64_t v170 = v164);

    uint64_t v173 = objc_msgSend_image(v170, v171, v172);
    objc_msgSend_empty(v194, v174, v175);

    BOOL v5 = v195;
  }
  else
  {
    uint64_t v173 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v9, v10);
  }

  if (v173)
  {
    id v178 = v173;
  }
  else
  {
    objc_msgSend_inputImage(v4, v176, v177);
    id v178 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v178;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_scaled_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_scaled_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_scaled, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_scaled, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing, 0);
  objc_storeStrong((id *)&self->_crispHairDownsamplingSingle, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparitySingleY, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparityY, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparityX, 0);
  objc_storeStrong((id *)&self->_crispHairBlurSingleY, 0);
  objc_storeStrong((id *)&self->_crispHairBlurSingleX, 0);
  objc_storeStrong((id *)&self->_crispHairBlurY, 0);
  objc_storeStrong((id *)&self->_crispHairBlurX, 0);
  objc_storeStrong((id *)&self->_sparseRenderingPreprocessingScaled, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_fpDisparityRefinementPreprocessing, 0);
  objc_storeStrong((id *)&self->_faceMaskOutputParamsTex, 0);
  objc_storeStrong((id *)&self->_faceMaskApply, 0);
  objc_storeStrong((id *)&self->_faceMaskCalc, 0);
  objc_storeStrong((id *)&self->_segmentationFusion, 0);
  objc_storeStrong((id *)&self->_eyeProtectionFacesTex, 0);
  objc_storeStrong((id *)&self->_faceParamsTex, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_blendBackgroundBlur, 0);
  objc_storeStrong((id *)&self->_thresholdedSobel, 0);
  objc_storeStrong((id *)&self->_modifyBlurmapGlasses, 0);
  objc_storeStrong((id *)&self->_modifyBlurmap, 0);
  objc_storeStrong((id *)&self->_eyeProtectionGlassesFace, 0);
  objc_storeStrong((id *)&self->_eyeProtectionFace, 0);
  objc_storeStrong((id *)&self->_mapLinearNoSecondary, 0);
  objc_storeStrong((id *)&self->_mapLinear, 0);
  objc_storeStrong((id *)&self->_gaussian, 0);
  objc_storeStrong((id *)&self->_thresholdHard, 0);
  objc_storeStrong((id *)&self->_insertPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_extractPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_passthrough, 0);
  objc_storeStrong((id *)&self->_antialiasWithForegroundBlur, 0);
  objc_storeStrong((id *)&self->_antialias, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_preprocessing, 0);
  objc_storeStrong((id *)&self->_calcWeightsY, 0);
  objc_storeStrong((id *)&self->_calcWeightsX, 0);
  objc_storeStrong((id *)&self->_outputParamsImage, 0);
  objc_storeStrong((id *)&self->_minMaxTex, 0);
  objc_storeStrong((id *)&self->_slmCalcEyes, 0);
  objc_storeStrong((id *)&self->_slmCalc, 0);
  objc_storeStrong((id *)&self->_slmMinMax, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_mtlQueue, 0);
}

@end