@interface MotionDetection
+ (int)prewarmShaders:(id)a3;
+ (unint64_t)scratchBufferBytesRequiredForWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5;
- (MotionDetection)initWithMetalContext:(id)a3;
- (float)getMotionDetectionResultSync;
- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 scratchBuffer:(id)a5;
- (int)runMotionDetection:(float *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(const frameProperties_t *)a6 ev0Properties:(const frameProperties_t *)a7 nrfPlist:(id)a8;
- (int)runMotionDetectionLL:(BOOL)a3 image:(id)a4 imgProperties:(frameProperties_t *)a5 refProperties:(frameProperties_t *)a6;
- (int)startMotionDetection:(id)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(const frameProperties_t *)a6 ev0Properties:(const frameProperties_t *)a7;
- (void)dealloc;
- (void)releaseResources;
@end

@implementation MotionDetection

- (MotionDetection)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MotionDetection;
  v6 = [(MotionDetection *)&v28 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(MotionDetectionShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);
    v15 = (void *)v7[2];
    v7[2] = v14;

    if (v7[2]
      && (objc_msgSend_device((void *)v7[1], v16, v17, v18),
          v19 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = objc_msgSend_newBufferWithLength_options_(v19, v20, 4, 0),
          v22 = (void *)v7[3],
          v7[3] = v21,
          v22,
          v19,
          v7[3]))
    {
      v23 = (void *)v7[4];
      v7[4] = 0;
    }
    else
    {
      FigDebugAssert3();
      int v27 = FigSignalErrorAt();
      v24 = 0;
      if (v27) {
        goto LABEL_6;
      }
    }
  }
  v24 = v7;
LABEL_6:
  v25 = v24;

  return v25;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [MotionDetectionShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)MotionDetection;
  [(MotionDetection *)&v5 dealloc];
}

+ (unint64_t)scratchBufferBytesRequiredForWidth:(unint64_t)a3 height:(unint64_t)a4 metal:(id)a5
{
  return 0;
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 scratchBuffer:(id)a5
{
  return 0;
}

- (int)runMotionDetection:(float *)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(const frameProperties_t *)a6 ev0Properties:(const frameProperties_t *)a7 nrfPlist:(id)a8
{
  int started = objc_msgSend_startMotionDetection_evm_ev0_evmProperties_ev0Properties_(self, a2, (uint64_t)a8, (uint64_t)a4, a5, a6, a7);
  if (started)
  {
    FigDebugAssert3();
  }
  else
  {
    objc_msgSend_getMotionDetectionResultSync(self, v10, v11, v12);
    *(_DWORD *)a3 = v14;
  }
  return started;
}

- (int)startMotionDetection:(id)a3 evm:(id)a4 ev0:(id)a5 evmProperties:(const frameProperties_t *)a6 ev0Properties:(const frameProperties_t *)a7
{
  uint64_t v11 = a3;
  id v12 = a4;
  id v440 = a5;
  id v466 = 0;
  id v467 = 0;
  id v464 = 0;
  id v465 = 0;
  id v462 = 0;
  id v463 = 0;
  id v460 = 0;
  id v461 = 0;
  v16 = objc_msgSend_allocator(self->_metal, v13, v14, v15);
  v20 = objc_msgSend_newTextureDescriptor(v16, v17, v18, v19);

  if (!v20) {
    goto LABEL_33;
  }
  v24 = objc_msgSend_desc(v20, v21, v22, v23);
  objc_msgSend_setUsage_(v24, v25, 7, v26);

  v30 = objc_msgSend_allocator(self->_metal, v27, v28, v29);
  v34 = objc_msgSend_newTextureDescriptor(v30, v31, v32, v33);

  if (!v34)
  {
LABEL_33:
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();
LABEL_35:
    v95 = 0;
    goto LABEL_32;
  }
  v38 = objc_msgSend_desc(v34, v35, v36, v37);
  objc_msgSend_setUsage_(v38, v39, 7, v40);

  v44 = objc_msgSend_desc(v34, v41, v42, v43);
  objc_msgSend_setCompressionMode_(v44, v45, 2, v46);

  v50 = objc_msgSend_desc(v34, v47, v48, v49);
  objc_msgSend_setCompressionFootprint_(v50, v51, 0, v52);

  if (self->_pendingResultCommandBuffer) {
    goto LABEL_34;
  }
  uint64_t v56 = objc_msgSend_width(v12, v53, v54, v55);
  v60 = objc_msgSend_desc(v20, v57, v58, v59);
  objc_msgSend_setWidth_(v60, v61, v56, v62);

  uint64_t v66 = objc_msgSend_height(v12, v63, v64, v65);
  v70 = objc_msgSend_desc(v20, v67, v68, v69);
  objc_msgSend_setHeight_(v70, v71, v66, v72);

  v76 = objc_msgSend_desc(v20, v73, v74, v75);
  objc_msgSend_setPixelFormat_(v76, v77, 10, v78);

  objc_msgSend_setLabel_(v20, v79, 0, v80);
  v84 = objc_msgSend_allocator(self->_metal, v81, v82, v83);
  v87 = objc_msgSend_newTextureWithDescriptor_(v84, v85, (uint64_t)v20, v86);
  id v460 = v87;

  if (!v87)
  {
LABEL_34:
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_35;
  }
  v91 = objc_msgSend_commandQueue(self->_metal, v88, v89, v90);
  v95 = objc_msgSend_commandBuffer(v91, v92, v93, v94);

  if (!v95
    || (v441 = v34,
        objc_msgSend_computeCommandEncoder(v95, v96, v97, v98),
        (v99 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_32;
  }
  v102 = v99;
  objc_msgSend_setComputePipelineState_(v99, v100, (uint64_t)self->_shaders->_motionDetectWarp, v101);
  id v437 = v12;
  objc_msgSend_setTexture_atIndex_(v102, v103, (uint64_t)v12, 0);
  objc_msgSend_setTexture_atIndex_(v102, v104, (uint64_t)v87, 1);
  long long v105 = *(_OWORD *)&a6[1].meta.exposureParams.luxLevel;
  v459[0] = *(_OWORD *)&a6[1].meta.exposureParams.conversion_gain;
  v459[1] = v105;
  v459[2] = *(_OWORD *)&a6[1].meta.exposureParams.CCT;
  objc_msgSend_setBytes_length_atIndex_(v102, v106, (uint64_t)v459, 48, 0);
  v458[0] = objc_msgSend_width(v87, v107, v108, v109);
  v458[1] = objc_msgSend_height(v87, v110, v111, v112);
  v458[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v102, v113, (uint64_t)v458, (uint64_t)&v456);
  objc_msgSend_endEncoding(v102, v114, v115, v116);
  objc_msgSend_commit(v95, v117, v118, v119);
  uint64_t v455 = 0;
  uint64_t v453 = 0;
  uint64_t v454 = 0;
  v120 = (float *)v11[3];
  v452[0] = 1.0 - (float)(v120[12] / 255.0);
  v452[1] = v120[13] / 255.0;
  v452[2] = v120[16];
  v452[3] = sub_262F98A00((uint64_t)&a6->meta.exposureParams, (uint64_t)&a7->meta.exposureParams, (uint64_t)a6);
  LODWORD(v453) = *(_DWORD *)(v11[3] + 68);
  v438 = v11;
  BOOL v436 = LODWORD(a7[1].meta.ROI.origin.y) == 2 && a7[1].meta.ltmCurves.ltmLut.bytes[176] != 0;
  v124 = objc_msgSend_desc(v20, v121, v122, v123);
  unint64_t v128 = objc_msgSend_width(v124, v125, v126, v127);
  objc_msgSend_setWidth_(v124, v129, v128 >> 2, v130);

  v134 = objc_msgSend_desc(v20, v131, v132, v133);
  unint64_t v138 = objc_msgSend_height(v134, v135, v136, v137);
  objc_msgSend_setHeight_(v134, v139, v138 >> 2, v140);

  v144 = objc_msgSend_desc(v441, v141, v142, v143);
  objc_msgSend_setPixelFormat_(v144, v145, 13, v146);

  v150 = objc_msgSend_desc(v20, v147, v148, v149);
  uint64_t v154 = objc_msgSend_width(v150, v151, v152, v153);
  v158 = objc_msgSend_desc(v441, v155, v156, v157);
  objc_msgSend_setWidth_(v158, v159, v154, v160);

  v164 = objc_msgSend_desc(v20, v161, v162, v163);
  uint64_t v168 = objc_msgSend_height(v164, v165, v166, v167);
  v172 = objc_msgSend_desc(v441, v169, v170, v171);
  objc_msgSend_setHeight_(v172, v173, v168, v174);

  objc_msgSend_setLabel_(v441, v175, 0, v176);
  v180 = objc_msgSend_allocator(self->_metal, v177, v178, v179);
  v183 = objc_msgSend_newTextureWithDescriptor_(v180, v181, (uint64_t)v441, v182);
  id v467 = v183;

  if (!v183) {
    goto LABEL_38;
  }
  v187 = objc_msgSend_desc(v20, v184, v185, v186);
  objc_msgSend_setPixelFormat_(v187, v188, 10, v189);

  objc_msgSend_setLabel_(v20, v190, 0, v191);
  v195 = objc_msgSend_allocator(self->_metal, v192, v193, v194);
  v198 = objc_msgSend_newTextureWithDescriptor_(v195, v196, (uint64_t)v20, v197);
  id v465 = v198;

  if (!v198
    || (objc_msgSend_setLabel_(v20, v199, 0, v200),
        objc_msgSend_allocator(self->_metal, v201, v202, v203),
        v204 = objc_claimAutoreleasedReturnValue(),
        v207 = objc_msgSend_newTextureWithDescriptor_(v204, v205, (uint64_t)v20, v206),
        id v464 = v207,
        v204,
        !v207))
  {
LABEL_38:
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

LABEL_50:
    id v12 = v437;
    uint64_t v11 = v438;
    goto LABEL_32;
  }
  v211 = objc_msgSend_commandQueue(self->_metal, v208, v209, v210);
  v215 = objc_msgSend_commandBuffer(v211, v212, v213, v214);

  if (!v215)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    v95 = 0;
    goto LABEL_50;
  }
  v219 = objc_msgSend_computeCommandEncoder(v215, v216, v217, v218);

  if (!v219) {
    goto LABEL_42;
  }
  uint64_t v222 = 16;
  if (!v436) {
    uint64_t v222 = 8;
  }
  objc_msgSend_setComputePipelineState_(v219, v220, *(uint64_t *)((char *)&self->_shaders->super.isa + v222), v221);
  objc_msgSend_setTexture_atIndex_(v219, v223, (uint64_t)v440, 0);
  objc_msgSend_setTexture_atIndex_(v219, v224, (uint64_t)v87, 1);
  objc_msgSend_setTexture_atIndex_(v219, v225, (uint64_t)v198, 2);
  objc_msgSend_setTexture_atIndex_(v219, v226, (uint64_t)v207, 3);
  objc_msgSend_setTexture_atIndex_(v219, v227, (uint64_t)v183, 4);
  objc_msgSend_setBytes_length_atIndex_(v219, v228, (uint64_t)v452, 40, 0);
  v451[0] = objc_msgSend_width(v198, v229, v230, v231);
  v451[1] = objc_msgSend_height(v198, v232, v233, v234);
  v451[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v219, v235, (uint64_t)v451, (uint64_t)&v456);
  objc_msgSend_endEncoding(v219, v236, v237, v238);
  FigMetalDecRef();
  objc_msgSend_setLabel_(v441, v239, 0, v240);
  v244 = objc_msgSend_allocator(self->_metal, v241, v242, v243);
  v247 = objc_msgSend_newTextureWithDescriptor_(v244, v245, (uint64_t)v441, v246);
  id v466 = v247;

  if (!v247)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

LABEL_44:
    v95 = v215;
    goto LABEL_50;
  }
  v251 = objc_msgSend_computeCommandEncoder(v215, v248, v249, v250);

  if (!v251)
  {
LABEL_42:
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_44;
  }
  objc_msgSend_setComputePipelineState_(v251, v252, (uint64_t)self->_shaders->_motionDetectDilate, v253);
  objc_msgSend_setTexture_atIndex_(v251, v254, (uint64_t)v183, 0);
  objc_msgSend_setTexture_atIndex_(v251, v255, (uint64_t)v247, 1);
  objc_msgSend_setBytes_length_atIndex_(v251, v256, (uint64_t)v452, 40, 0);
  v450[0] = (unint64_t)objc_msgSend_width(v183, v257, v258, v259) >> 1;
  v450[1] = (unint64_t)objc_msgSend_height(v183, v260, v261, v262) >> 1;
  v450[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v251, v263, (uint64_t)v450, (uint64_t)&v456);
  objc_msgSend_endEncoding(v251, v264, v265, v266);
  objc_msgSend_commit(v215, v267, v268, v269);
  FigMetalDecRef();
  v273 = objc_msgSend_desc(v20, v270, v271, v272);
  objc_msgSend_setPixelFormat_(v273, v274, 25, v275);

  objc_msgSend_setLabel_(v20, v276, 0, v277);
  v281 = objc_msgSend_allocator(self->_metal, v278, v279, v280);
  v284 = objc_msgSend_newTextureWithDescriptor_(v281, v282, (uint64_t)v20, v283);
  id v463 = v284;

  if (!v284)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_44;
  }
  v288 = objc_msgSend_commandQueue(self->_metal, v285, v286, v287);
  v95 = objc_msgSend_commandBuffer(v288, v289, v290, v291);

  if (!v95)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_50;
  }
  v295 = objc_msgSend_computeCommandEncoder(v95, v292, v293, v294);

  if (!v295) {
    goto LABEL_48;
  }
  objc_msgSend_setComputePipelineState_(v295, v296, (uint64_t)self->_shaders->_motionDetectGradient, v297);
  objc_msgSend_setTexture_atIndex_(v295, v298, (uint64_t)v198, 0);
  objc_msgSend_setTexture_atIndex_(v295, v299, (uint64_t)v284, 1);
  v449[0] = (unint64_t)objc_msgSend_width(v198, v300, v301, v302) >> 1;
  v449[1] = objc_msgSend_height(v198, v303, v304, v305);
  v449[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v295, v306, (uint64_t)v449, (uint64_t)&v456);
  objc_msgSend_endEncoding(v295, v307, v308, v309);
  FigMetalDecRef();
  v313 = objc_msgSend_desc(v20, v310, v311, v312);
  objc_msgSend_setPixelFormat_(v313, v314, 25, v315);

  objc_msgSend_setLabel_(v20, v316, 0, v317);
  v321 = objc_msgSend_allocator(self->_metal, v318, v319, v320);
  v324 = objc_msgSend_newTextureWithDescriptor_(v321, v322, (uint64_t)v20, v323);
  id v462 = v324;

  if (!v324)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_50;
  }
  v328 = objc_msgSend_computeCommandEncoder(v95, v325, v326, v327);

  if (!v328)
  {
LABEL_48:
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_50;
  }
  v332 = objc_msgSend_allocator(self->_metal, v329, v330, v331);
  int v336 = objc_msgSend_allocatorType(v332, v333, v334, v335);

  if (v336 == 2) {
    objc_msgSend_insertCompressedTextureReinterpretationFlush(v328, v337, v338, v339);
  }
  objc_msgSend_setComputePipelineState_(v328, v337, (uint64_t)self->_shaders->_motionDetectGradient, v339);
  objc_msgSend_setTexture_atIndex_(v328, v340, (uint64_t)v207, 0);
  objc_msgSend_setTexture_atIndex_(v328, v341, (uint64_t)v324, 1);
  v448[0] = (unint64_t)objc_msgSend_width(v207, v342, v343, v344) >> 1;
  v448[1] = objc_msgSend_height(v207, v345, v346, v347);
  v448[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v328, v348, (uint64_t)v448, (uint64_t)&v456);
  objc_msgSend_endEncoding(v328, v349, v350, v351);
  FigMetalDecRef();
  v355 = objc_msgSend_desc(v20, v352, v353, v354);
  objc_msgSend_setPixelFormat_(v355, v356, 25, v357);

  objc_msgSend_setLabel_(v20, v358, 0, v359);
  v363 = objc_msgSend_allocator(self->_metal, v360, v361, v362);
  v366 = objc_msgSend_newTextureWithDescriptor_(v363, v364, (uint64_t)v20, v365);
  id v461 = v366;

  if (!v366)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    goto LABEL_50;
  }
  v370 = objc_msgSend_computeCommandEncoder(v95, v367, v368, v369);

  uint64_t v11 = v438;
  if (!v370)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

LABEL_53:
    id v12 = v437;
    goto LABEL_32;
  }
  objc_msgSend_setComputePipelineState_(v370, v371, (uint64_t)self->_shaders->_motionDetectDiffGradient, v372);
  objc_msgSend_setTexture_atIndex_(v370, v373, (uint64_t)v284, 0);
  objc_msgSend_setTexture_atIndex_(v370, v374, (uint64_t)v324, 1);
  objc_msgSend_setTexture_atIndex_(v370, v375, (uint64_t)v247, 2);
  objc_msgSend_setTexture_atIndex_(v370, v376, (uint64_t)v366, 3);
  objc_msgSend_setBytes_length_atIndex_(v370, v377, (uint64_t)v452, 40, 0);
  long long v378 = *(_OWORD *)&a7[1].meta.exposureParams.luxLevel;
  v447[0] = *(_OWORD *)&a7[1].meta.exposureParams.conversion_gain;
  v447[1] = v378;
  v447[2] = *(_OWORD *)&a7[1].meta.exposureParams.CCT;
  objc_msgSend_setBytes_length_atIndex_(v370, v379, (uint64_t)v447, 48, 1);
  objc_msgSend_setBytes_length_atIndex_(v370, v380, (uint64_t)v447, 48, 2);
  v446[0] = objc_msgSend_width(v284, v381, v382, v383);
  v446[1] = objc_msgSend_height(v284, v384, v385, v386);
  v446[2] = 1;
  int64x2_t v456 = vdupq_n_s64(8uLL);
  uint64_t v457 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v370, v387, (uint64_t)v446, (uint64_t)&v456);
  objc_msgSend_endEncoding(v370, v388, v389, v390);
  objc_msgSend_commit(v95, v391, v392, v393);
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  *(_DWORD *)objc_msgSend_contents(self->_motionDetectScore, v394, v395, v396) = 0;
  LODWORD(v454) = objc_msgSend_width(v366, v397, v398, v399) >> 2;
  HIDWORD(v454) = objc_msgSend_height(v366, v400, v401, v402) >> 2;
  LODWORD(v455) = ((unint64_t)objc_msgSend_width(v366, v403, v404, v405) >> 1) / 3;
  HIDWORD(v455) = ((unint64_t)objc_msgSend_height(v366, v406, v407, v408) >> 2) & 0x7FFFFFFF;
  WORD2(v453) = 1000;
  v412 = objc_msgSend_commandQueue(self->_metal, v409, v410, v411);
  v416 = objc_msgSend_commandBuffer(v412, v413, v414, v415);

  if (!v416)
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();

    v95 = 0;
    goto LABEL_53;
  }
  v420 = objc_msgSend_computeCommandEncoder(v416, v417, v418, v419);

  id v12 = v437;
  if (v420)
  {
    objc_msgSend_setComputePipelineState_(v420, v421, (uint64_t)self->_shaders->_motionDetectMaxTileAvg, v422);
    objc_msgSend_setTexture_atIndex_(v420, v423, (uint64_t)v366, 0);
    objc_msgSend_setBytes_length_atIndex_(v420, v424, (uint64_t)v452, 40, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v420, v425, (uint64_t)self->_motionDetectScore, 0, 1);
    long long v444 = xmmword_263117CF0;
    uint64_t v445 = 1;
    int64x2_t v442 = vdupq_n_s64(2uLL);
    uint64_t v443 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v420, v426, (uint64_t)&v444, (uint64_t)&v442);
    objc_msgSend_endEncoding(v420, v427, v428, v429);
    objc_msgSend_commit(v416, v430, v431, v432);
    FigMetalDecRef();
    objc_storeStrong((id *)&self->_pendingResultCommandBuffer, v416);
    float v433 = 1.0 / *(float *)&v453;
    self->_tileScoreScale = 1.0 / (float)(v455 * WORD2(v453) * HIDWORD(v455));
    self->_scorePower = v433;

    int v434 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v434 = FigSignalErrorAt();
  }
  v95 = v416;
LABEL_32:

  return v434;
}

- (float)getMotionDetectionResultSync
{
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  if (pendingResultCommandBuffer)
  {
    objc_msgSend_waitUntilCompleted(pendingResultCommandBuffer, a2, v2, v3);
    uint64_t v6 = self->_pendingResultCommandBuffer;
    self->_pendingResultCommandBuffer = 0;
  }
  v7 = (unsigned int *)objc_msgSend_contents(self->_motionDetectScore, a2, v2, v3);
  float scorePower = self->_scorePower;
  float v9 = self->_tileScoreScale * (float)*v7;

  return powf(v9, scorePower);
}

- (int)runMotionDetectionLL:(BOOL)a3 image:(id)a4 imgProperties:(frameProperties_t *)a5 refProperties:(frameProperties_t *)a6
{
  BOOL v7 = a3;
  id v9 = a4;
  id v327 = 0;
  id v328 = 0;
  id v326 = 0;
  uint64_t v13 = objc_msgSend_allocator(self->_metal, v10, v11, v12);
  uint64_t v17 = objc_msgSend_newTextureDescriptor(v13, v14, v15, v16);

  if (!v17) {
    goto LABEL_30;
  }
  uint64_t v21 = objc_msgSend_desc(v17, v18, v19, v20);
  objc_msgSend_setUsage_(v21, v22, 7, v23);

  uint64_t v325 = 0;
  memset(v324, 0, sizeof(v324));
  if (v7)
  {
    if (self->_llmotionDetectDownsampledRef)
    {
      FigDebugAssert3();
      uint64_t v64 = 0;
      v103 = 0;
      int v191 = 0;
      goto LABEL_25;
    }
    int v27 = objc_msgSend_desc(v17, v24, v25, v26);
    objc_msgSend_setPixelFormat_(v27, v28, 25, v29);

    unint64_t v33 = (unint64_t)objc_msgSend_width(v9, v30, v31, v32) >> 3;
    uint64_t v37 = objc_msgSend_desc(v17, v34, v35, v36);
    objc_msgSend_setWidth_(v37, v38, v33, v39);

    unint64_t v43 = (unint64_t)objc_msgSend_height(v9, v40, v41, v42) >> 3;
    v47 = objc_msgSend_desc(v17, v44, v45, v46);
    objc_msgSend_setHeight_(v47, v48, v43, v49);

    objc_msgSend_setLabel_(v17, v50, 0, v51);
    uint64_t v55 = objc_msgSend_allocator(self->_metal, v52, v53, v54);
    uint64_t v58 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v55, v56, (uint64_t)v17, v57);
    llmotionDetectDownsampledRef = self->_llmotionDetectDownsampledRef;
    self->_llmotionDetectDownsampledRef = v58;

    v63 = 0;
    uint64_t v64 = 0;
    if (!self->_llmotionDetectDownsampledRef) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v65 = objc_msgSend_desc(v17, v24, v25, v26);
    objc_msgSend_setPixelFormat_(v65, v66, 25, v67);

    uint64_t v71 = objc_msgSend_width(v9, v68, v69, v70);
    uint64_t v75 = objc_msgSend_desc(v17, v72, v73, v74);
    objc_msgSend_setWidth_(v75, v76, v71, v77);

    uint64_t v81 = objc_msgSend_height(v9, v78, v79, v80);
    v85 = objc_msgSend_desc(v17, v82, v83, v84);
    objc_msgSend_setHeight_(v85, v86, v81, v87);

    objc_msgSend_setLabel_(v17, v88, 0, v89);
    uint64_t v93 = objc_msgSend_allocator(self->_metal, v90, v91, v92);
    v63 = objc_msgSend_newTextureWithDescriptor_(v93, v94, (uint64_t)v17, v95);
    id v328 = v63;

    if (!v63)
    {
LABEL_30:
      FigDebugAssert3();
      int v191 = FigSignalErrorAt();
      uint64_t v64 = 0;
      v103 = 0;
      goto LABEL_25;
    }
    v99 = objc_msgSend_commandQueue(self->_metal, v96, v97, v98);
    v103 = objc_msgSend_commandBuffer(v99, v100, v101, v102);

    if (!v103) {
      goto LABEL_37;
    }
    v107 = objc_msgSend_computeCommandEncoder(v103, v104, v105, v106);
    uint64_t v64 = v107;
    if (!v107)
    {
LABEL_36:
      FigDebugAssert3();
      int v191 = FigSignalErrorAt();
      goto LABEL_25;
    }
    objc_msgSend_setComputePipelineState_(v107, v108, (uint64_t)self->_shaders->_motionDetectWarp, v109);
    objc_msgSend_setTexture_atIndex_(v64, v110, (uint64_t)v9, 0);
    objc_msgSend_setTexture_atIndex_(v64, v111, (uint64_t)v63, 1);
    long long v112 = *(_OWORD *)&a5[1].meta.exposureParams.luxLevel;
    *(_OWORD *)v322 = *(_OWORD *)&a5[1].meta.exposureParams.conversion_gain;
    *(_OWORD *)&v322[16] = v112;
    long long v323 = *(_OWORD *)&a5[1].meta.exposureParams.CCT;
    objc_msgSend_setBytes_length_atIndex_(v64, v113, (uint64_t)v322, 48, 0);
    v321[0] = objc_msgSend_width(v63, v114, v115, v116);
    v321[1] = objc_msgSend_height(v63, v117, v118, v119);
    v321[2] = 1;
    *(int64x2_t *)uint64_t v320 = vdupq_n_s64(8uLL);
    *(void *)&v320[16] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v64, v120, (uint64_t)v321, (uint64_t)v320);
    objc_msgSend_endEncoding(v64, v121, v122, v123);
    objc_msgSend_commit(v103, v124, v125, v126);
  }
  uint64_t v127 = objc_msgSend_commandQueue(self->_metal, v60, v61, v62);
  v103 = objc_msgSend_commandBuffer(v127, v128, v129, v130);

  if (!v103) {
    goto LABEL_36;
  }
  v134 = objc_msgSend_computeCommandEncoder(v103, v131, v132, v133);

  if (!v134) {
    goto LABEL_37;
  }
  objc_msgSend_setComputePipelineState_(v134, v135, (uint64_t)self->_shaders->_motionDetectLLDownscale, v136);
  if (v7)
  {
    HIDWORD(v324[0]) = 1065353216;
    objc_msgSend_setTexture_atIndex_(v134, v137, (uint64_t)v9, 0);
    objc_msgSend_setTexture_atIndex_(v134, v140, (uint64_t)self->_llmotionDetectDownsampledRef, 1);
    uint64_t v142 = 0;
  }
  else
  {
    uint64_t v143 = objc_msgSend_desc(v17, v137, v138, v139);
    objc_msgSend_setPixelFormat_(v143, v144, 25, v145);

    unint64_t v149 = (unint64_t)objc_msgSend_width(v9, v146, v147, v148) >> 3;
    uint64_t v153 = objc_msgSend_desc(v17, v150, v151, v152);
    objc_msgSend_setWidth_(v153, v154, v149, v155);

    unint64_t v159 = (unint64_t)objc_msgSend_height(v9, v156, v157, v158) >> 3;
    uint64_t v163 = objc_msgSend_desc(v17, v160, v161, v162);
    objc_msgSend_setHeight_(v163, v164, v159, v165);

    objc_msgSend_setLabel_(v17, v166, 0, v167);
    uint64_t v171 = objc_msgSend_allocator(self->_metal, v168, v169, v170);
    uint64_t v142 = objc_msgSend_newTextureWithDescriptor_(v171, v172, (uint64_t)v17, v173);
    id v327 = v142;

    if (!v142) {
      goto LABEL_33;
    }
    HIDWORD(v324[0]) = sub_262F98A00((uint64_t)&a6->meta.exposureParams, (uint64_t)&a5->meta.exposureParams, (uint64_t)a6);
    objc_msgSend_setTexture_atIndex_(v134, v174, (uint64_t)v63, 0);
    objc_msgSend_setTexture_atIndex_(v134, v175, (uint64_t)v142, 1);
  }
  objc_msgSend_setBytes_length_atIndex_(v134, v141, (uint64_t)v324, 40, 0);
  uint64_t v179 = objc_msgSend_width(self->_llmotionDetectDownsampledRef, v176, v177, v178);
  uint64_t v183 = objc_msgSend_height(self->_llmotionDetectDownsampledRef, v180, v181, v182);
  v319[0] = v179;
  v319[1] = v183;
  v319[2] = 1;
  *(int64x2_t *)v322 = vdupq_n_s64(8uLL);
  *(void *)&v322[16] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v134, v184, (uint64_t)v319, (uint64_t)v322);
  objc_msgSend_endEncoding(v134, v185, v186, v187);
  objc_msgSend_commit(v103, v188, v189, v190);
  if (!v7)
  {
    FigMetalDecRef();
    v195 = objc_msgSend_desc(v17, v192, v193, v194);
    objc_msgSend_setPixelFormat_(v195, v196, 55, v197);

    unint64_t v201 = (unint64_t)objc_msgSend_width(v9, v198, v199, v200) >> 3;
    v205 = objc_msgSend_desc(v17, v202, v203, v204);
    objc_msgSend_setWidth_(v205, v206, v201, v207);

    unint64_t v211 = (unint64_t)objc_msgSend_height(v9, v208, v209, v210) >> 3;
    v215 = objc_msgSend_desc(v17, v212, v213, v214);
    objc_msgSend_setHeight_(v215, v216, v211, v217);

    uint64_t v221 = objc_msgSend_desc(v17, v218, v219, v220);
    objc_msgSend_setCompressionMode_(v221, v222, 2, v223);

    v227 = objc_msgSend_desc(v17, v224, v225, v226);
    objc_msgSend_setCompressionFootprint_(v227, v228, 0, v229);

    objc_msgSend_setLabel_(v17, v230, 0, v231);
    v235 = objc_msgSend_allocator(self->_metal, v232, v233, v234);
    uint64_t v238 = objc_msgSend_newTextureWithDescriptor_(v235, v236, (uint64_t)v17, v237);
    id v326 = v238;

    if (v238)
    {
      uint64_t v242 = objc_msgSend_commandQueue(self->_metal, v239, v240, v241);
      uint64_t v246 = objc_msgSend_commandBuffer(v242, v243, v244, v245);

      if (!v246)
      {
        FigDebugAssert3();
        int v191 = FigSignalErrorAt();
        v103 = 0;
        goto LABEL_18;
      }
      uint64_t v64 = objc_msgSend_computeCommandEncoder(v246, v247, v248, v249);

      if (!v64)
      {
        FigDebugAssert3();
        int v191 = FigSignalErrorAt();
        v103 = v246;
        goto LABEL_25;
      }
      objc_msgSend_setComputePipelineState_(v64, v250, (uint64_t)self->_shaders->_motionDetectLL, v251);
      objc_msgSend_setTexture_atIndex_(v64, v252, (uint64_t)self->_llmotionDetectDownsampledRef, 0);
      objc_msgSend_setTexture_atIndex_(v64, v253, (uint64_t)v142, 1);
      objc_msgSend_setTexture_atIndex_(v64, v254, (uint64_t)v238, 2);
      v318[0] = objc_msgSend_width(v238, v255, v256, v257);
      v318[1] = objc_msgSend_height(v238, v258, v259, v260);
      v318[2] = 1;
      *(int64x2_t *)v322 = vdupq_n_s64(8uLL);
      *(void *)&v322[16] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v64, v261, (uint64_t)v318, (uint64_t)v322);
      objc_msgSend_endEncoding(v64, v262, v263, v264);
      objc_msgSend_commit(v246, v265, v266, v267);
      FigMetalDecRef();
      uint64_t v271 = objc_msgSend_commandQueue(self->_metal, v268, v269, v270);
      v103 = objc_msgSend_commandBuffer(v271, v272, v273, v274);

      if (v103)
      {
        v278 = objc_msgSend_computeCommandEncoder(v103, v275, v276, v277);

        if (v278)
        {
          objc_msgSend_setComputePipelineState_(v278, v279, (uint64_t)self->_shaders->_motionDetectLLSumReduce, v280);
          objc_msgSend_setTexture_atIndex_(v278, v281, (uint64_t)v238, 0);
          objc_msgSend_setBuffer_offset_atIndex_(v278, v282, (uint64_t)self->_motionDetectScore, 0, 0);
          uint64_t v286 = 4 * objc_msgSend_height(v238, v283, v284, v285);
          char v290 = objc_msgSend_height(v238, v287, v288, v289);
          objc_msgSend_setThreadgroupMemoryLength_atIndex_(v278, v291, v286 - ((4 * v290 + 8) & 0xC) + 8, 0);
          *(void *)v322 = objc_msgSend_height(v238, v292, v293, v294) - 2;
          *(int64x2_t *)&v322[8] = vdupq_n_s64(1uLL);
          *(void *)uint64_t v320 = *(void *)v322;
          *(_OWORD *)&v320[8] = *(_OWORD *)&v322[8];
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v278, v295, (uint64_t)v322, (uint64_t)v320);
          objc_msgSend_endEncoding(v278, v296, v297, v298);
          objc_msgSend_commit(v103, v299, v300, v301);
          objc_msgSend_waitUntilCompleted(v103, v302, v303, v304);
          float v308 = *(float *)objc_msgSend_contents(self->_motionDetectScore, v305, v306, v307);
          uint64_t v312 = objc_msgSend_width(v238, v309, v310, v311) - 2;
          *(float *)&a5[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].RB.mid = v308
                                                                          / (float)(unint64_t)((objc_msgSend_height(v238, v313, v314, v315) - 2) * v312);
          FigMetalDecRef();
          int v191 = 0;
          uint64_t v64 = v278;
          goto LABEL_25;
        }
LABEL_37:
        FigDebugAssert3();
        int v191 = FigSignalErrorAt();
        uint64_t v64 = 0;
        goto LABEL_25;
      }
      goto LABEL_36;
    }
LABEL_33:
    FigDebugAssert3();
    int v191 = FigSignalErrorAt();
    goto LABEL_18;
  }
  int v191 = 0;
LABEL_18:
  uint64_t v64 = v134;
LABEL_25:

  return v191;
}

- (void)releaseResources
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingResultCommandBuffer, 0);
  objc_storeStrong((id *)&self->_llmotionDetectDownsampledRef, 0);
  objc_storeStrong((id *)&self->_motionDetectScore, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end