@interface DisparityDiagnostics
+ (id)dictFromAdaptiveCorrectionStatus:(const AdaptiveCorrectionStatus *)a3;
+ (id)dictFromCalModel:(const CalModel *)a3;
+ (id)dictFromDistortionModel:(const DistortionModel *)a3;
- (DisparityDiagnostics)init;
- (id)createDiagnosticsDictionary;
- (void)addAdaptiveCorrectionStatus:(const AdaptiveCorrectionStatus *)a3;
- (void)addDisparityDebugStatus:(id *)a3;
- (void)addMinShift:(float)a3 maxShift:(float)a4;
- (void)addShiftmapJPEG:(id)a3;
- (void)addShiftmapRaw:(id)a3;
- (void)clearDiagnostics;
@end

@implementation DisparityDiagnostics

- (DisparityDiagnostics)init
{
  v6.receiver = self;
  v6.super_class = (Class)DisparityDiagnostics;
  v2 = [(DisparityDiagnostics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    diagDict = v2->_diagDict;
    v2->_diagDict = v3;
  }
  return v2;
}

- (void)clearDiagnostics
{
}

- (id)createDiagnosticsDictionary
{
  v9 = objc_msgSend_copy(self->_diagDict, a2, v2, v3, v4, v5, v6, v7, v8);

  return v9;
}

- (void)addAdaptiveCorrectionStatus:(const AdaptiveCorrectionStatus *)a3
{
  if (a3)
  {
    objc_msgSend_dictFromAdaptiveCorrectionStatus_(DisparityDiagnostics, a2, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, v10, (uint64_t)v16, @"ADC", v11, v12, v13, v14, v15);
  }
}

- (void)addDisparityDebugStatus:(id *)a3
{
  if (a3)
  {
    id v151 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v12 = objc_msgSend_numberWithChar_(NSNumber, v5, a3->var0, v6, v7, v8, v9, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v13, (uint64_t)v12, @"focusWindowIsValid", v14, v15, v16, v17, v18);

    v26 = objc_msgSend_numberWithChar_(NSNumber, v19, a3->var1, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v27, (uint64_t)v26, @"pflTeleOutOfRange", v28, v29, v30, v31, v32);

    v40 = objc_msgSend_numberWithChar_(NSNumber, v33, a3->var2, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v41, (uint64_t)v40, @"pflWideOutOfRange", v42, v43, v44, v45, v46);

    v54 = objc_msgSend_numberWithChar_(NSNumber, v47, a3->var3, v48, v49, v50, v51, v52, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v55, (uint64_t)v54, @"extrinsicOutOfRange", v56, v57, v58, v59, v60);

    v68 = objc_msgSend_numberWithFloat_(NSNumber, v61, v62, v63, v64, v65, v66, v67, a3->var4);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v69, (uint64_t)v68, @"oisShiftWideX", v70, v71, v72, v73, v74);

    v82 = objc_msgSend_numberWithFloat_(NSNumber, v75, v76, v77, v78, v79, v80, v81, a3->var5);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v83, (uint64_t)v82, @"oisShiftWideY", v84, v85, v86, v87, v88);

    v96 = objc_msgSend_numberWithFloat_(NSNumber, v89, v90, v91, v92, v93, v94, v95, a3->var6);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v97, (uint64_t)v96, @"oisShiftTeleX", v98, v99, v100, v101, v102);

    v110 = objc_msgSend_numberWithFloat_(NSNumber, v103, v104, v105, v106, v107, v108, v109, a3->var7);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v111, (uint64_t)v110, @"oisShiftTeleY", v112, v113, v114, v115, v116);

    v117 = sub_262ECE8D0((uint64_t)a3->var8);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v118, (uint64_t)v117, @"gdcCoeffsTeleDistortCoordinates", v119, v120, v121, v122, v123);

    v124 = sub_262ECE8D0((uint64_t)a3->var9);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v125, (uint64_t)v124, @"gdcCoeffsTeleUndistortCoordinates", v126, v127, v128, v129, v130);

    v131 = sub_262ECE8D0((uint64_t)a3->var10);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v132, (uint64_t)v131, @"gdcCoeffsWideDistortCoordinates", v133, v134, v135, v136, v137);

    v138 = sub_262ECE8D0((uint64_t)a3->var11);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v139, (uint64_t)v138, @"gdcCoeffsWideUndistortCoordinates", v140, v141, v142, v143, v144);

    objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, v145, (uint64_t)v151, @"DisparityDebugStatus", v146, v147, v148, v149, v150);
  }
}

+ (id)dictFromAdaptiveCorrectionStatus:(const AdaptiveCorrectionStatus *)a3
{
  if (a3)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v10)
    {
      uint64_t v12 = objc_msgSend_numberWithInt_(NSNumber, v4, a3->var0, v5, v6, v7, v8, v9, v11);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v13, (uint64_t)v12, @"initialNumPoints", v14, v15, v16, v17, v18);

      v26 = objc_msgSend_numberWithBool_(NSNumber, v19, a3->var1, v20, v21, v22, v23, v24, v25);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v26, @"initialSufficientPoints", v28, v29, v30, v31, v32);

      v40 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v33, (uint64_t)&a3->var2, v34, v35, v36, v37, v38, v39);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v41, (uint64_t)v40, @"initialCal", v42, v43, v44, v45, v46);

      v54 = objc_msgSend_dictFromDistortionModel_(DisparityDiagnostics, v47, (uint64_t)&a3->var22, v48, v49, v50, v51, v52, v53);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v55, (uint64_t)v54, @"initialDistortionTele", v56, v57, v58, v59, v60);

      v68 = objc_msgSend_dictFromDistortionModel_(DisparityDiagnostics, v61, (uint64_t)&a3->var23, v62, v63, v64, v65, v66, v67);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v69, (uint64_t)v68, @"initialDistortionWide", v70, v71, v72, v73, v74);

      v82 = objc_msgSend_numberWithInt_(NSNumber, v75, a3->var3, v76, v77, v78, v79, v80, v81);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v83, (uint64_t)v82, @"pass1NumPoints", v84, v85, v86, v87, v88);

      v96 = objc_msgSend_numberWithBool_(NSNumber, v89, a3->var4, v90, v91, v92, v93, v94, v95);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v97, (uint64_t)v96, @"pass1SufficientPoints", v98, v99, v100, v101, v102);

      v110 = objc_msgSend_numberWithBool_(NSNumber, v103, a3->var5, v104, v105, v106, v107, v108, v109);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v111, (uint64_t)v110, @"pass1AnalyticalPrecond", v112, v113, v114, v115, v116);

      v124 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v117, (uint64_t)&a3->var6, v118, v119, v120, v121, v122, v123);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v125, (uint64_t)v124, @"pass1PrecondCal", v126, v127, v128, v129, v130);

      v138 = objc_msgSend_numberWithDouble_(NSNumber, v131, v132, v133, v134, v135, v136, v137, COERCE_FLOAT(*(void *)&a3->var7));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v139, (uint64_t)v138, @"pass1SPGEvalPre", v140, v141, v142, v143, v144);

      v152 = objc_msgSend_numberWithInt_(NSNumber, v145, a3->var8, v146, v147, v148, v149, v150, v151);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v153, (uint64_t)v152, @"pass1SPGNumIterations", v154, v155, v156, v157, v158);

      v166 = objc_msgSend_numberWithBool_(NSNumber, v159, a3->var9, v160, v161, v162, v163, v164, v165);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v167, (uint64_t)v166, @"pass1SPGConverged", v168, v169, v170, v171, v172);

      v180 = objc_msgSend_numberWithDouble_(NSNumber, v173, v174, v175, v176, v177, v178, v179, COERCE_FLOAT(*(void *)&a3->var10));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v181, (uint64_t)v180, @"pass1SPGEvalPost", v182, v183, v184, v185, v186);

      v194 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v187, (uint64_t)&a3->var11, v188, v189, v190, v191, v192, v193);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v195, (uint64_t)v194, @"pass1Cal", v196, v197, v198, v199, v200);

      v208 = objc_msgSend_numberWithInt_(NSNumber, v201, a3->var12, v202, v203, v204, v205, v206, v207);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v209, (uint64_t)v208, @"pass2NumPoints", v210, v211, v212, v213, v214);

      v222 = objc_msgSend_numberWithBool_(NSNumber, v215, a3->var13, v216, v217, v218, v219, v220, v221);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v223, (uint64_t)v222, @"pass2SufficientPoints", v224, v225, v226, v227, v228);

      v236 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v229, (uint64_t)&a3->var14, v230, v231, v232, v233, v234, v235);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v237, (uint64_t)v236, @"pass2ParallelCal", v238, v239, v240, v241, v242);

      v250 = objc_msgSend_numberWithDouble_(NSNumber, v243, v244, v245, v246, v247, v248, v249, COERCE_FLOAT(*(void *)&a3->var15));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v251, (uint64_t)v250, @"pass2ParallelShiftInf", v252, v253, v254, v255, v256);

      v264 = objc_msgSend_numberWithDouble_(NSNumber, v257, v258, v259, v260, v261, v262, v263, COERCE_FLOAT(*(void *)&a3->var16));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v265, (uint64_t)v264, @"pass2ParallelPctNegative", v266, v267, v268, v269, v270);

      v278 = objc_msgSend_numberWithDouble_(NSNumber, v271, v272, v273, v274, v275, v276, v277, COERCE_FLOAT(*(void *)&a3->var17));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v279, (uint64_t)v278, @"pass2SPGEvalPre", v280, v281, v282, v283, v284);

      v292 = objc_msgSend_numberWithInt_(NSNumber, v285, a3->var18, v286, v287, v288, v289, v290, v291);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v293, (uint64_t)v292, @"pass2SPGNumIterations", v294, v295, v296, v297, v298);

      v306 = objc_msgSend_numberWithBool_(NSNumber, v299, a3->var19, v300, v301, v302, v303, v304, v305);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v307, (uint64_t)v306, @"pass2SPGConverged", v308, v309, v310, v311, v312);

      v320 = objc_msgSend_numberWithDouble_(NSNumber, v313, v314, v315, v316, v317, v318, v319, COERCE_FLOAT(*(void *)&a3->var20));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v321, (uint64_t)v320, @"pass2SPGEvalPost", v322, v323, v324, v325, v326);

      v334 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v327, (uint64_t)&a3->var21, v328, v329, v330, v331, v332, v333);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v335, (uint64_t)v334, @"pass2Cal", v336, v337, v338, v339, v340);

      v348 = objc_msgSend_numberWithInt_(NSNumber, v341, a3->var24, v342, v343, v344, v345, v346, v347);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v349, (uint64_t)v348, @"passDistNumPoints", v350, v351, v352, v353, v354);

      v362 = objc_msgSend_numberWithBool_(NSNumber, v355, a3->var25, v356, v357, v358, v359, v360, v361);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v363, (uint64_t)v362, @"passDistSufficientPoints", v364, v365, v366, v367, v368);

      v376 = objc_msgSend_numberWithDouble_(NSNumber, v369, v370, v371, v372, v373, v374, v375, COERCE_FLOAT(*(void *)&a3->var26));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v377, (uint64_t)v376, @"passDistSPGEvalPre", v378, v379, v380, v381, v382);

      v390 = objc_msgSend_numberWithInt_(NSNumber, v383, a3->var27, v384, v385, v386, v387, v388, v389);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v391, (uint64_t)v390, @"passDistSPGNumIterations", v392, v393, v394, v395, v396);

      v404 = objc_msgSend_numberWithBool_(NSNumber, v397, a3->var28, v398, v399, v400, v401, v402, v403);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v405, (uint64_t)v404, @"passDistSPGConverged", v406, v407, v408, v409, v410);

      v418 = objc_msgSend_numberWithDouble_(NSNumber, v411, v412, v413, v414, v415, v416, v417, COERCE_FLOAT(*(void *)&a3->var29));
      objc_msgSend_setObject_forKeyedSubscript_(v10, v419, (uint64_t)v418, @"passDistSPGEvalPost", v420, v421, v422, v423, v424);

      v432 = objc_msgSend_dictFromCalModel_(DisparityDiagnostics, v425, (uint64_t)&a3->var30, v426, v427, v428, v429, v430, v431);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v433, (uint64_t)v432, @"passDistCal", v434, v435, v436, v437, v438);

      v446 = objc_msgSend_dictFromDistortionModel_(DisparityDiagnostics, v439, (uint64_t)&a3->var31, v440, v441, v442, v443, v444, v445);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v447, (uint64_t)v446, @"passDistModelTele", v448, v449, v450, v451, v452);

      v460 = objc_msgSend_dictFromDistortionModel_(DisparityDiagnostics, v453, (uint64_t)&a3->var32, v454, v455, v456, v457, v458, v459);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v461, (uint64_t)v460, @"passDistModelWide", v462, v463, v464, v465, v466);
    }
    else
    {
      FigDebugAssert3();
    }
  }
  else
  {
    FigDebugAssert3();
    id v10 = 0;
  }

  return v10;
}

+ (id)dictFromCalModel:(const CalModel *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, v8, v9, v10, v11, COERCE_FLOAT(*(void *)&a3->focalLengthPix[0]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"focalLengthTelePix", v14, v15, v16, v17, v18);

  v26 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, v21, v22, v23, v24, v25, COERCE_FLOAT(*(void *)&a3->focalLengthPix[1]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v26, @"focalLengthWidePix", v28, v29, v30, v31, v32);

  v40 = objc_msgSend_numberWithDouble_(NSNumber, v33, v34, v35, v36, v37, v38, v39, COERCE_FLOAT(*(void *)&a3->opticalCenterX[0]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v41, (uint64_t)v40, @"opticalCenterTeleX", v42, v43, v44, v45, v46);

  v54 = objc_msgSend_numberWithDouble_(NSNumber, v47, v48, v49, v50, v51, v52, v53, COERCE_FLOAT(*(void *)&a3->opticalCenterY[0]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v55, (uint64_t)v54, @"opticalCenterTeleY", v56, v57, v58, v59, v60);

  v68 = objc_msgSend_numberWithDouble_(NSNumber, v61, v62, v63, v64, v65, v66, v67, COERCE_FLOAT(*(void *)&a3->opticalCenterX[1]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v69, (uint64_t)v68, @"opticalCenterWideX", v70, v71, v72, v73, v74);

  v82 = objc_msgSend_numberWithDouble_(NSNumber, v75, v76, v77, v78, v79, v80, v81, COERCE_FLOAT(*(void *)&a3->opticalCenterY[1]));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v83, (uint64_t)v82, @"opticalCenterWideY", v84, v85, v86, v87, v88);

  id v96 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v97 = 0;
  extrinRotRefefenceToAuxiliary = a3->extrinRotRefefenceToAuxiliary;
  do
  {
    uint64_t v99 = objc_msgSend_numberWithDouble_(NSNumber, v89, v90, v91, v92, v93, v94, v95, COERCE_FLOAT(*(void *)&extrinRotRefefenceToAuxiliary[v97]));
    objc_msgSend_addObject_(v96, v100, (uint64_t)v99, v101, v102, v103, v104, v105, v106);

    ++v97;
  }
  while (v97 != 12);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v89, (uint64_t)v96, @"extrinRotTeleToWide", v92, v93, v94, v95, v107);

  return v4;
}

+ (id)dictFromDistortionModel:(const DistortionModel *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, v8, v9, v10, v11, COERCE_FLOAT(*(void *)&a3->focalLengthPix));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"focalLengthPix", v14, v15, v16, v17, v18);

  v26 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, v21, v22, v23, v24, v25, COERCE_FLOAT(*(void *)&a3->opticalCenterX));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v26, @"opticalCenterX", v28, v29, v30, v31, v32);

  v40 = objc_msgSend_numberWithDouble_(NSNumber, v33, v34, v35, v36, v37, v38, v39, COERCE_FLOAT(*(void *)&a3->opticalCenterY));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v41, (uint64_t)v40, @"opticalCenterY", v42, v43, v44, v45, v46);

  v54 = objc_msgSend_numberWithDouble_(NSNumber, v47, v48, v49, v50, v51, v52, v53, COERCE_FLOAT(*(void *)&a3->pixelSizeMM));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v55, (uint64_t)v54, @"pixelSizeMM", v56, v57, v58, v59, v60);

  id v61 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v76 = objc_msgSend_initWithCapacity_(v61, v62, 8, v63, v64, v65, v66, v67, v68);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v78 = objc_msgSend_numberWithDouble_(NSNumber, v69, v70, v71, v72, v73, v74, v75, COERCE_FLOAT(*(void *)&a3->polyBase[i]));
    objc_msgSend_setObject_atIndexedSubscript_(v76, v79, (uint64_t)v78, i, v80, v81, v82, v83, v84);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v69, (uint64_t)v76, @"polyBase", v72, v73, v74, v75, v85);
  id v86 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v94 = objc_msgSend_initWithCapacity_(v86, v87, 8, v88, v89, v90, v91, v92, v93);

  uint64_t v102 = 0;
  polyDynamic = a3->polyDynamic;
  do
  {
    uint64_t v104 = objc_msgSend_numberWithDouble_(NSNumber, v95, v96, v97, v98, v99, v100, v101, COERCE_FLOAT(*(void *)&polyDynamic[v102]));
    objc_msgSend_setObject_atIndexedSubscript_(v94, v105, (uint64_t)v104, v102, v106, v107, v108, v109, v110);

    ++v102;
  }
  while (v102 != 8);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v95, (uint64_t)v94, @"polyDynamic", v98, v99, v100, v101, v111);

  return v4;
}

- (void)addShiftmapJPEG:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, a2, (uint64_t)a3, @"ShiftmapJPEG", v3, v4, v5, v6, v7);
}

- (void)addShiftmapRaw:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, a2, (uint64_t)a3, @"Shiftmap", v3, v4, v5, v6, v7);
}

- (void)addMinShift:(float)a3 maxShift:(float)a4
{
  uint64_t v12 = objc_msgSend_numberWithFloat_(NSNumber, a2, v4, v5, v6, v7, v8, v9, a3);
  objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, v13, (uint64_t)v12, @"ShiftmapMin", v14, v15, v16, v17, v18);

  objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22, v23, v24, v25, a4);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_diagDict, v26, (uint64_t)v32, @"ShiftmapMax", v27, v28, v29, v30, v31);
}

- (void).cxx_destruct
{
}

@end