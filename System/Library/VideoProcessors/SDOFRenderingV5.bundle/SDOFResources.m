@interface SDOFResources
+ (id)sharedInstance;
- (BOOL)activateResources;
- (FigMetalContext)metalContext;
- (MTLBuffer)rendering_xhlrbProcessList_buf;
- (MTLBuffer)slm_mapping_buf;
- (MTLTexture)blurMapRefinement_alphaMaskDelta;
- (MTLTexture)blurMapRefinement_hairMaskDelta;
- (MTLTexture)blurMapRefinement_intermediate;
- (MTLTexture)blurMapSmoothing_intermediate_tex;
- (MTLTexture)blurMapSmoothing_result_tex;
- (MTLTexture)disparityRefinement_blurmap_tex;
- (MTLTexture)disparityRefinement_preproc_tex;
- (MTLTexture)disparityRefinement_sampledD_tex;
- (MTLTexture)disparityRefinement_weightsX_tex;
- (MTLTexture)disparityRefinement_weightsY_tex;
- (MTLTexture)faceMask_adjBlurmap_tex;
- (MTLTexture)rendering_halfResRGBA1_tex;
- (MTLTexture)rendering_halfResRGBA2_tex;
- (MTLTexture)rendering_halfResRGBAsRGB1_texalias;
- (MTLTexture)rendering_halfResRGBAsRGB2_texalias;
- (MTLTexture)rendering_halfResRG_tex;
- (id)initInstance;
- (int)activeCount;
- (int)allocateResourcesUsingMetalContext:(id)a3 inputImageWidth:(unint64_t)a4 inputImageHeight:(unint64_t)a5 shiftMapWidth:(unint64_t)a6 shiftMapHeight:(unint64_t)a7 enableForegroundBlur:(BOOL)a8;
- (int)referenceCount;
- (unint64_t)inputImageHeight;
- (unint64_t)inputImageWidth;
- (unint64_t)shiftMapHeight;
- (unint64_t)shiftMapWidth;
- (void)clearInstance;
- (void)deactivateResources;
- (void)deallocateResources;
@end

@implementation SDOFResources

- (void)clearInstance
{
  metalContext = self->_metalContext;
  self->_metalContext = 0;

  *(void *)&self->_referenceCount = 0;
  *(_OWORD *)&self->_inputImageWidth = 0u;
  *(_OWORD *)&self->_shiftMapWidth = 0u;
  disparityRefinement_weightsX_tex = self->_disparityRefinement_weightsX_tex;
  self->_disparityRefinement_weightsX_tex = 0;

  disparityRefinement_weightsY_tex = self->_disparityRefinement_weightsY_tex;
  self->_disparityRefinement_weightsY_tex = 0;

  disparityRefinement_sampledD_tex = self->_disparityRefinement_sampledD_tex;
  self->_disparityRefinement_sampledD_tex = 0;

  disparityRefinement_preproc_tex = self->_disparityRefinement_preproc_tex;
  self->_disparityRefinement_preproc_tex = 0;

  disparityRefinement_blurmap_tex = self->_disparityRefinement_blurmap_tex;
  self->_disparityRefinement_blurmap_tex = 0;

  faceMask_adjBlurmap_tex = self->_faceMask_adjBlurmap_tex;
  self->_faceMask_adjBlurmap_tex = 0;

  blurMapSmoothing_intermediate_tex = self->_blurMapSmoothing_intermediate_tex;
  self->_blurMapSmoothing_intermediate_tex = 0;

  blurMapSmoothing_result_tex = self->_blurMapSmoothing_result_tex;
  self->_blurMapSmoothing_result_tex = 0;

  blurMapRefinement_alphaMaskDelta = self->_blurMapRefinement_alphaMaskDelta;
  self->_blurMapRefinement_alphaMaskDelta = 0;

  blurMapRefinement_hairMaskDelta = self->_blurMapRefinement_hairMaskDelta;
  self->_blurMapRefinement_hairMaskDelta = 0;

  blurMapRefinement_intermediate = self->_blurMapRefinement_intermediate;
  self->_blurMapRefinement_intermediate = 0;

  rendering_halfResRGBA1_tex = self->_rendering_halfResRGBA1_tex;
  self->_rendering_halfResRGBA1_tex = 0;

  rendering_halfResRGBA2_tex = self->_rendering_halfResRGBA2_tex;
  self->_rendering_halfResRGBA2_tex = 0;

  rendering_halfResRGBAsRGB1_texalias = self->_rendering_halfResRGBAsRGB1_texalias;
  self->_rendering_halfResRGBAsRGB1_texalias = 0;

  rendering_halfResRGBAsRGB2_texalias = self->_rendering_halfResRGBAsRGB2_texalias;
  self->_rendering_halfResRGBAsRGB2_texalias = 0;

  rendering_halfResRG_tex = self->_rendering_halfResRG_tex;
  self->_rendering_halfResRG_tex = 0;

  halfResRGBABuffer1 = self->_halfResRGBABuffer1;
  self->_halfResRGBABuffer1 = 0;

  halfResRGBABuffer2 = self->_halfResRGBABuffer2;
  self->_halfResRGBABuffer2 = 0;

  slm_mapping_buf = self->_slm_mapping_buf;
  self->_slm_mapping_buf = 0;

  rendering_xhlrbProcessList_buf = self->_rendering_xhlrbProcessList_buf;
  self->_rendering_xhlrbProcessList_buf = 0;
}

- (id)initInstance
{
  v8.receiver = self;
  v8.super_class = (Class)SDOFResources;
  v2 = [(SDOFResources *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend_clearInstance(v2, v3, v4, v5);
  }
  return v6;
}

+ (id)sharedInstance
{
  if (qword_26B431260 != -1) {
    dispatch_once(&qword_26B431260, &unk_270E99558);
  }
  v2 = (void *)qword_26B431268;

  return v2;
}

- (int)allocateResourcesUsingMetalContext:(id)a3 inputImageWidth:(unint64_t)a4 inputImageHeight:(unint64_t)a5 shiftMapWidth:(unint64_t)a6 shiftMapHeight:(unint64_t)a7 enableForegroundBlur:(BOOL)a8
{
  uint64_t v9 = v8;
  BOOL v10 = a8;
  id v16 = a3;
  v20 = v16;
  if (self->_referenceCount) {
    goto LABEL_65;
  }
  id obj = a3;
  unint64_t v244 = a5;
  unint64_t v248 = a5 >> 1;
  unint64_t v251 = a6;
  unint64_t v252 = a7;
  BOOL v22 = a4 >> 1 == a6 && a5 >> 1 == a7;
  BOOL v255 = v22;
  v23 = objc_msgSend_device(v16, v17, v18, v19);
  BOOL v253 = v10;
  unint64_t v26 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v23, v24, 25, v25);

  v30 = objc_msgSend_device(v20, v27, v28, v29);
  unint64_t v33 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v30, v31, 65, v32);

  v37 = objc_msgSend_device(v20, v34, v35, v36);
  v40 = v20;
  unint64_t v41 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v37, v38, 30, v39);

  v45 = objc_msgSend_device(v40, v42, v43, v44);
  unint64_t v48 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v45, v46, 10, v47);

  v52 = objc_msgSend_device(v40, v49, v50, v51);
  unint64_t v55 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v52, v53, 70, v54);

  if (v26 <= v33) {
    unint64_t v59 = v33;
  }
  else {
    unint64_t v59 = v26;
  }
  if (v59 <= v41) {
    unint64_t v59 = v41;
  }
  if (v48 <= v55) {
    unint64_t v60 = v55;
  }
  else {
    unint64_t v60 = v48;
  }
  if (v59 <= v60) {
    unint64_t v61 = v60;
  }
  else {
    unint64_t v61 = v59;
  }
  unint64_t v62 = (v61 - 1 + (a4 >> 1)) / v61 * v61;
  unint64_t v63 = a4 >> 1;
  unint64_t v64 = 2 * (v61 - 1 + (a4 & 0xFFFFFFFFFFFFFFFELL)) / v61 * v61;
  unint64_t v254 = (v61 - 1 + (a4 & 0xFFFFFFFFFFFFFFFELL)) / v61 * v61;
  if ((v61 - 1 + 4 * (a4 >> 1)) / v61 * v61 > v64) {
    unint64_t v64 = (v61 - 1 + 4 * (a4 >> 1)) / v61 * v61;
  }
  uint64_t v65 = 4;
  if (v253) {
    uint64_t v65 = 6;
  }
  unint64_t v66 = v62 * v65;
  if (v64 <= v66) {
    unint64_t v64 = v66;
  }
  uint64_t v67 = v64 * v248;
  v68 = objc_msgSend_device(v40, v56, v57, v58);
  v70 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v68, v69, v67, 32);
  halfResRGBABuffer1 = self->_halfResRGBABuffer1;
  self->_halfResRGBABuffer1 = v70;

  if (!self->_halfResRGBABuffer1) {
    goto LABEL_73;
  }
  v75 = objc_msgSend_device(v40, v72, v73, v74);
  v77 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v75, v76, v67, 32);
  halfResRGBABuffer2 = self->_halfResRGBABuffer2;
  self->_halfResRGBABuffer2 = v77;

  if (!self->_halfResRGBABuffer2
    || (objc_msgSend_device(v40, v79, v80, v81),
        v82 = objc_claimAutoreleasedReturnValue(),
        v84 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v82, v83, 16, 32),
        slm_mapping_buf = self->_slm_mapping_buf,
        self->_slm_mapping_buf = v84,
        slm_mapping_buf,
        v82,
        !self->_slm_mapping_buf))
  {
LABEL_73:
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();
    v20 = v40;
    goto LABEL_100;
  }
  v247 = v40;
  v89 = objc_msgSend_device(v40, v86, v87, v88);
  v91 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v89, v90, (((v248 + 7) >> 1) & 0x7FFFFFFFFFFFFFFCLL) * (((v63 + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 16, 0);
  rendering_xhlrbProcessList_buf = self->_rendering_xhlrbProcessList_buf;
  self->_rendering_xhlrbProcessList_buf = v91;

  if (!self->_rendering_xhlrbProcessList_buf)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();
LABEL_99:
    v20 = v247;
LABEL_100:
    if (!v236) {
      goto LABEL_71;
    }
    goto LABEL_101;
  }
  unint64_t v243 = (v61 - 1 + 4 * (a4 >> 1)) / v61 * v61;
  if (v255)
  {
    v94 = 0;
    unint64_t v95 = a4 >> 1;
    unint64_t v96 = v248;
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v93, 25, v63, v248, 0);
  }
  else
  {
    v97 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v93, 65, v251, v252, 0);
    if (!v97)
    {
      fig_log_get_emitter();
      uint64_t v241 = v8;
      FigDebugAssert3();
      goto LABEL_94;
    }
    v94 = v97;
    unint64_t v95 = a4 >> 1;
    unint64_t v96 = v248;
    objc_msgSend_setUsage_(v97, v98, 19, v99);
    objc_msgSend_setResourceOptions_(v94, v100, 32, v101);
    objc_msgSend_setCompressionFootprint_(v94, v102, 0, v103);
    objc_msgSend_setCompressionMode_(v94, v104, 0, v105);
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v106, 25, v63, v248, 0);
  v107 = };
  if (!v107)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
LABEL_93:

    goto LABEL_94;
  }
  v110 = v107;
  objc_msgSend_setUsage_(v107, v108, 19, v109);
  objc_msgSend_setResourceOptions_(v110, v111, 32, v112);
  objc_msgSend_setCompressionFootprint_(v110, v113, 0, v114);
  objc_msgSend_setCompressionMode_(v110, v115, 0, v116);
  v118 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v117, 30, v95, v96, 0);
  if (!v118)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();

    goto LABEL_93;
  }
  v121 = v118;
  v249 = v110;
  v122 = v94;
  objc_msgSend_setUsage_(v118, v119, 19, v120);
  objc_msgSend_setResourceOptions_(v121, v123, 32, v124);
  objc_msgSend_setCompressionFootprint_(v121, v125, 0, v126);
  v250 = v121;
  objc_msgSend_setCompressionMode_(v121, v127, 0, v128);
  v130 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v129, 10, v63, v96, 0);
  if (!v130)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
LABEL_79:

LABEL_94:
    int v236 = -12786;
    goto LABEL_99;
  }
  v133 = v130;
  objc_msgSend_setUsage_(v130, v131, 19, v132);
  objc_msgSend_setResourceOptions_(v133, v134, 32, v135);
  objc_msgSend_setCompressionFootprint_(v133, v136, 0, v137);
  v246 = v133;
  objc_msgSend_setCompressionMode_(v133, v138, 0, v139);
  v141 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v140, 70, v63, v96, 0);
  if (!v141)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();

    goto LABEL_79;
  }
  v144 = v141;
  objc_msgSend_setUsage_(v141, v142, 19, v143);
  objc_msgSend_setResourceOptions_(v144, v145, 32, v146);
  objc_msgSend_setCompressionFootprint_(v144, v147, 0, v148);
  v245 = v144;
  objc_msgSend_setCompressionMode_(v144, v149, 0, v150);
  v152 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], v151, 30, v63, v96, 0);
  v94 = v122;
  if (!v152)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
LABEL_92:

    goto LABEL_93;
  }
  v155 = v152;
  objc_msgSend_setUsage_(v152, v153, 19, v154);
  objc_msgSend_setResourceOptions_(v155, v156, 32, v157);
  objc_msgSend_setCompressionFootprint_(v155, v158, 0, v159);
  v160 = v155;
  objc_msgSend_setCompressionMode_(v155, v161, 0, v162);
  if (v255) {
    goto LABEL_47;
  }
  unint64_t v166 = (v61 - 1 + 4 * v251) / v61 * v61;
  unint64_t v167 = v254 * v96;
  unint64_t v168 = v166 * v252;
  if (v166 * v252 <= v62 * v96) {
    uint64_t v169 = v62 * v96;
  }
  else {
    uint64_t v169 = v166 * v252;
  }
  if (v167 < 2 * v168 || v169 + v168 >= v167)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();

    goto LABEL_92;
  }
  v170 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v163, (uint64_t)v122, 0, v166);
  disparityRefinement_weightsX_tex = self->_disparityRefinement_weightsX_tex;
  self->_disparityRefinement_weightsX_tex = v170;

  if (!self->_disparityRefinement_weightsX_tex)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();

    goto LABEL_99;
  }
  v173 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v172, (uint64_t)v122, v169, v166);
  disparityRefinement_weightsY_tex = self->_disparityRefinement_weightsY_tex;
  self->_disparityRefinement_weightsY_tex = v173;

  if (!self->_disparityRefinement_weightsY_tex)
  {
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();

LABEL_98:
    goto LABEL_99;
  }
  v176 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v175, (uint64_t)v249, v167, v254);
  disparityRefinement_sampledD_tex = self->_disparityRefinement_sampledD_tex;
  self->_disparityRefinement_sampledD_tex = v176;

  v121 = v250;
  if (!self->_disparityRefinement_sampledD_tex)
  {
LABEL_97:
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();

    goto LABEL_98;
  }
LABEL_47:
  v178 = self->_halfResRGBABuffer1;
  if (v253)
  {
    v179 = objc_msgSend_device(v178, v163, v164, v165);
    v182 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v179, v180, (uint64_t)v160, v181);
    disparityRefinement_blurmap_tex = self->_disparityRefinement_blurmap_tex;
    self->_disparityRefinement_blurmap_tex = v182;
  }
  else
  {
    v184 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(v178, v163, (uint64_t)v246, 0, v62);
    v179 = self->_disparityRefinement_blurmap_tex;
    self->_disparityRefinement_blurmap_tex = v184;
  }

  if (!self->_disparityRefinement_blurmap_tex) {
    goto LABEL_97;
  }
  v186 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v185, (uint64_t)v121, 0, v254);
  blurMapSmoothing_intermediate_tex = self->_blurMapSmoothing_intermediate_tex;
  self->_blurMapSmoothing_intermediate_tex = v186;

  if (!self->_blurMapSmoothing_intermediate_tex) {
    goto LABEL_97;
  }
  unint64_t v189 = v62 * v96;
  v190 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v188, (uint64_t)v246, v62 * v96, v62);
  blurMapRefinement_alphaMaskDelta = self->_blurMapRefinement_alphaMaskDelta;
  self->_blurMapRefinement_alphaMaskDelta = v190;

  if (!self->_blurMapRefinement_alphaMaskDelta) {
    goto LABEL_97;
  }
  v193 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v192, (uint64_t)v246, 2 * v189, v62);
  blurMapRefinement_hairMaskDelta = self->_blurMapRefinement_hairMaskDelta;
  self->_blurMapRefinement_hairMaskDelta = v193;

  if (!self->_blurMapRefinement_hairMaskDelta) {
    goto LABEL_97;
  }
  v196 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v195, (uint64_t)v246, 3 * v189, v62);
  blurMapRefinement_intermediate = self->_blurMapRefinement_intermediate;
  self->_blurMapRefinement_intermediate = v196;

  if (!self->_blurMapRefinement_intermediate) {
    goto LABEL_97;
  }
  v199 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v198, (uint64_t)v245, 0, v243);
  rendering_halfResRGBA1_tex = self->_rendering_halfResRGBA1_tex;
  self->_rendering_halfResRGBA1_tex = v199;

  if (!self->_rendering_halfResRGBA1_tex) {
    goto LABEL_97;
  }
  v202 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer1, v201, (uint64_t)v160, 0, v254);
  rendering_halfResRG_tex = self->_rendering_halfResRG_tex;
  self->_rendering_halfResRG_tex = v202;

  if (!self->_rendering_halfResRG_tex) {
    goto LABEL_97;
  }
  if (!v255)
  {
    v205 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer2, v204, (uint64_t)v245, 0, v243);
    disparityRefinement_preproc_tex = self->_disparityRefinement_preproc_tex;
    self->_disparityRefinement_preproc_tex = v205;

    if (!self->_disparityRefinement_preproc_tex) {
      goto LABEL_97;
    }
  }
  v207 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer2, v204, (uint64_t)v246, 0, v62);
  faceMask_adjBlurmap_tex = self->_faceMask_adjBlurmap_tex;
  self->_faceMask_adjBlurmap_tex = v207;

  a5 = v244;
  if (!self->_faceMask_adjBlurmap_tex) {
    goto LABEL_97;
  }
  v210 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer2, v209, (uint64_t)v246, 0, v62);
  blurMapSmoothing_result_tex = self->_blurMapSmoothing_result_tex;
  self->_blurMapSmoothing_result_tex = v210;

  if (!self->_blurMapSmoothing_result_tex) {
    goto LABEL_97;
  }
  v213 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(self->_halfResRGBABuffer2, v212, (uint64_t)v245, 0, v243);
  rendering_halfResRGBA2_tex = self->_rendering_halfResRGBA2_tex;
  self->_rendering_halfResRGBA2_tex = v213;

  v20 = v247;
  if (!self->_rendering_halfResRGBA2_tex) {
    goto LABEL_89;
  }
  v217 = (MTLTexture *)objc_msgSend_newTextureViewWithPixelFormat_(self->_rendering_halfResRGBA1_tex, v215, 71, v216);
  rendering_halfResRGBAsRGB1_texalias = self->_rendering_halfResRGBAsRGB1_texalias;
  self->_rendering_halfResRGBAsRGB1_texalias = v217;

  if (!self->_rendering_halfResRGBAsRGB1_texalias
    || (v221 = (MTLTexture *)objc_msgSend_newTextureViewWithPixelFormat_(self->_rendering_halfResRGBA2_tex, v219, 71, v220), rendering_halfResRGBAsRGB2_texalias = self->_rendering_halfResRGBAsRGB2_texalias, self->_rendering_halfResRGBAsRGB2_texalias = v221, rendering_halfResRGBAsRGB2_texalias, !self->_rendering_halfResRGBAsRGB2_texalias))
  {
LABEL_89:
    fig_log_get_emitter();
    uint64_t v241 = v8;
    FigDebugAssert3();
    int v236 = FigSignalErrorAt();

    goto LABEL_100;
  }
  objc_storeStrong((id *)&self->_metalContext, obj);
  self->_inputImageWidth = a4;
  self->_inputImageHeight = v244;
  self->_shiftMapWidth = v251;
  self->_shiftMapHeight = v252;

  a7 = v252;
  a6 = v251;

  uint64_t v9 = v8;
LABEL_65:
  v223 = objc_msgSend_device(v20, v17, v18, v19);
  uint64_t v227 = objc_msgSend_hash(v223, v224, v225, v226);
  v231 = objc_msgSend_device(self->_metalContext, v228, v229, v230);
  uint64_t v235 = objc_msgSend_hash(v231, v232, v233, v234);

  if (v227 == v235
    && self->_inputImageWidth == a4
    && self->_inputImageHeight == a5
    && self->_shiftMapWidth == a6
    && self->_shiftMapHeight == a7)
  {
    int v236 = 0;
    ++self->_referenceCount;
    goto LABEL_71;
  }
  fig_log_get_emitter();
  uint64_t v241 = v9;
  FigDebugAssert3();
  int v236 = -12780;
LABEL_101:
  if (!self->_referenceCount) {
    objc_msgSend_clearInstance(self, v238, v239, v240, 0, v241);
  }
LABEL_71:

  return v236;
}

- (void)deallocateResources
{
  int referenceCount = self->_referenceCount;
  BOOL v5 = __OFSUB__(referenceCount--, 1);
  self->_int referenceCount = referenceCount;
  if ((referenceCount < 0) ^ v5 | (referenceCount == 0)) {
    objc_msgSend_clearInstance(self, a2, v2, v3);
  }
}

- (BOOL)activateResources
{
  int activeCount = self->_activeCount;
  if (!activeCount)
  {
    objc_msgSend_setPurgeableState_(self->_halfResRGBABuffer1, a2, 2, v2);
    objc_msgSend_setPurgeableState_(self->_halfResRGBABuffer2, v5, 2, v6);
    objc_msgSend_setPurgeableState_(self->_rendering_xhlrbProcessList_buf, v7, 2, v8);
    objc_msgSend_setPurgeableState_(self->_slm_mapping_buf, v9, 2, v10);
    int activeCount = self->_activeCount;
  }
  self->_int activeCount = activeCount + 1;
  return 1;
}

- (void)deactivateResources
{
  int v3 = self->_activeCount - 1;
  self->_int activeCount = v3;
  if (!v3)
  {
    objc_msgSend_setPurgeableState_(self->_halfResRGBABuffer1, a2, 3, v2);
    objc_msgSend_setPurgeableState_(self->_halfResRGBABuffer2, v5, 3, v6);
    objc_msgSend_setPurgeableState_(self->_rendering_xhlrbProcessList_buf, v7, 3, v8);
    slm_mapping_buf = self->_slm_mapping_buf;
    objc_msgSend_setPurgeableState_(slm_mapping_buf, v9, 3, v10);
  }
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (int)referenceCount
{
  return self->_referenceCount;
}

- (int)activeCount
{
  return self->_activeCount;
}

- (unint64_t)inputImageWidth
{
  return self->_inputImageWidth;
}

- (unint64_t)inputImageHeight
{
  return self->_inputImageHeight;
}

- (unint64_t)shiftMapWidth
{
  return self->_shiftMapWidth;
}

- (unint64_t)shiftMapHeight
{
  return self->_shiftMapHeight;
}

- (MTLTexture)disparityRefinement_weightsX_tex
{
  return self->_disparityRefinement_weightsX_tex;
}

- (MTLTexture)disparityRefinement_weightsY_tex
{
  return self->_disparityRefinement_weightsY_tex;
}

- (MTLTexture)disparityRefinement_sampledD_tex
{
  return self->_disparityRefinement_sampledD_tex;
}

- (MTLTexture)disparityRefinement_preproc_tex
{
  return self->_disparityRefinement_preproc_tex;
}

- (MTLTexture)disparityRefinement_blurmap_tex
{
  return self->_disparityRefinement_blurmap_tex;
}

- (MTLTexture)faceMask_adjBlurmap_tex
{
  return self->_faceMask_adjBlurmap_tex;
}

- (MTLTexture)blurMapSmoothing_intermediate_tex
{
  return self->_blurMapSmoothing_intermediate_tex;
}

- (MTLTexture)blurMapSmoothing_result_tex
{
  return self->_blurMapSmoothing_result_tex;
}

- (MTLTexture)blurMapRefinement_alphaMaskDelta
{
  return self->_blurMapRefinement_alphaMaskDelta;
}

- (MTLTexture)blurMapRefinement_hairMaskDelta
{
  return self->_blurMapRefinement_hairMaskDelta;
}

- (MTLTexture)blurMapRefinement_intermediate
{
  return self->_blurMapRefinement_intermediate;
}

- (MTLBuffer)slm_mapping_buf
{
  return self->_slm_mapping_buf;
}

- (MTLBuffer)rendering_xhlrbProcessList_buf
{
  return self->_rendering_xhlrbProcessList_buf;
}

- (MTLTexture)rendering_halfResRGBA1_tex
{
  return self->_rendering_halfResRGBA1_tex;
}

- (MTLTexture)rendering_halfResRGBA2_tex
{
  return self->_rendering_halfResRGBA2_tex;
}

- (MTLTexture)rendering_halfResRGBAsRGB1_texalias
{
  return self->_rendering_halfResRGBAsRGB1_texalias;
}

- (MTLTexture)rendering_halfResRGBAsRGB2_texalias
{
  return self->_rendering_halfResRGBAsRGB2_texalias;
}

- (MTLTexture)rendering_halfResRG_tex
{
  return self->_rendering_halfResRG_tex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendering_halfResRG_tex, 0);
  objc_storeStrong((id *)&self->_rendering_halfResRGBAsRGB2_texalias, 0);
  objc_storeStrong((id *)&self->_rendering_halfResRGBAsRGB1_texalias, 0);
  objc_storeStrong((id *)&self->_rendering_halfResRGBA2_tex, 0);
  objc_storeStrong((id *)&self->_rendering_halfResRGBA1_tex, 0);
  objc_storeStrong((id *)&self->_rendering_xhlrbProcessList_buf, 0);
  objc_storeStrong((id *)&self->_slm_mapping_buf, 0);
  objc_storeStrong((id *)&self->_blurMapRefinement_intermediate, 0);
  objc_storeStrong((id *)&self->_blurMapRefinement_hairMaskDelta, 0);
  objc_storeStrong((id *)&self->_blurMapRefinement_alphaMaskDelta, 0);
  objc_storeStrong((id *)&self->_blurMapSmoothing_result_tex, 0);
  objc_storeStrong((id *)&self->_blurMapSmoothing_intermediate_tex, 0);
  objc_storeStrong((id *)&self->_faceMask_adjBlurmap_tex, 0);
  objc_storeStrong((id *)&self->_disparityRefinement_blurmap_tex, 0);
  objc_storeStrong((id *)&self->_disparityRefinement_preproc_tex, 0);
  objc_storeStrong((id *)&self->_disparityRefinement_sampledD_tex, 0);
  objc_storeStrong((id *)&self->_disparityRefinement_weightsY_tex, 0);
  objc_storeStrong((id *)&self->_disparityRefinement_weightsX_tex, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_halfResRGBABuffer2, 0);

  objc_storeStrong((id *)&self->_halfResRGBABuffer1, 0);
}

@end