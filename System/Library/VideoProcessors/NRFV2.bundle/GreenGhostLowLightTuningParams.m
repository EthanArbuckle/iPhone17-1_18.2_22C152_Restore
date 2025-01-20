@interface GreenGhostLowLightTuningParams
- (GreenGhostLowLightTuningParams)init;
- (LowLightTuning)tuningParams;
- (int)readPlist:(id)a3;
- (void)setDefaultTuningParams;
- (void)setTuningParams:(LowLightTuning)a3;
@end

@implementation GreenGhostLowLightTuningParams

- (void)setDefaultTuningParams
{
  long long v37 = *(_OWORD *)"fff?";
  *(_OWORD *)&v38[8] = xmmword_263117F20;
  *(_OWORD *)&v38[24] = xmmword_263117EA0;
  *(_OWORD *)&v38[40] = unk_263117EB0;
  *(void *)v38 = 1022739087;
  *(void *)&v38[56] = 0x3A03126F00000000;
  long long v17 = *(_OWORD *)&v38[32];
  long long v18 = *(_OWORD *)&v38[48];
  long long v16 = *(_OWORD *)&v38[16];
  long long v14 = *(_OWORD *)"fff?";
  long long v15 = *(_OWORD *)v38;
  uint64_t v36 = 1045220557;
  long long v35 = xmmword_263117F08;
  char v10 = 0;
  __int16 v9 = 0;
  long long v20 = xmmword_263117EC8;
  int v21 = 953267991;
  int v22 = 0;
  uint64_t v25 = 0x3EA8F5C33B449BA6;
  long long v24 = unk_263117EF0;
  long long v23 = xmmword_263117EE0;
  char v8 = 0;
  uint64_t v11 = 0x3A83126F3F000000;
  int v12 = 1036831949;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v13 = _D0;
  uint64_t v19 = 0x3CA3D70A3C23D70ALL;
  uint64_t v26 = 0x3ECCCCCD3E4CCCCDLL;
  uint64_t v27 = 0x300000001;
  uint64_t v29 = 0x3F0000003DCCCCCDLL;
  int v28 = 1;
  int v30 = 0;
  uint64_t v31 = 0x3B449BA63B03126FLL;
  uint64_t v32 = 0x3C23D70A3CA3D70ALL;
  uint64_t v33 = 0x3B03126F3A83126FLL;
  uint64_t v34 = 0x3D4CCCCD3D23D70ALL;
  objc_msgSend_setTuningParams_(self, a2, (uint64_t)&v8, v2);
}

- (GreenGhostLowLightTuningParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)GreenGhostLowLightTuningParams;
  uint64_t v2 = [(GreenGhostLowLightTuningParams *)&v7 init];
  objc_msgSend_setDefaultTuningParams(v2, v3, v4, v5);
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"faceBoundaryPaddingRatio", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_84;
  }
  if (objc_msgSend_count(v7, v8, v9, v10) != 2) {
    goto LABEL_84;
  }
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v7, v11, 0, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  LODWORD(self[1].super.isa) = v17;

  long long v20 = objc_msgSend_objectAtIndexedSubscript_(v7, v18, 1, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  HIDWORD(self[1].super.isa) = v24;

  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"enabled", v26);

  if (!v27) {
    goto LABEL_84;
  }
  int v30 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"enabled", v29);
  self->_tuningParams.enabled = objc_msgSend_BOOLValue(v30, v31, v32, v33);

  uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v4, v34, @"blurThreshold", v35);

  if (!v36) {
    goto LABEL_84;
  }
  v39 = objc_msgSend_objectForKeyedSubscript_(v4, v37, @"blurThreshold", v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  self->_tuningParams.blurThreshold = v43;

  v46 = objc_msgSend_objectForKeyedSubscript_(v4, v44, @"maxMaskAverage", v45);

  if (!v46) {
    goto LABEL_84;
  }
  v49 = objc_msgSend_objectForKeyedSubscript_(v4, v47, @"maxMaskAverage", v48);
  objc_msgSend_floatValue(v49, v50, v51, v52);
  self->_tuningParams.maxMaskAverage = v53;

  v56 = objc_msgSend_objectForKeyedSubscript_(v4, v54, @"greenGhostThreshold", v55);

  if (!v56
    || (objc_msgSend_objectForKeyedSubscript_(v4, v57, @"greenGhostThreshold", v58),
        v59 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_floatValue(v59, v60, v61, v62),
        self->_tuningParams.greenGhostThreshold = v63,
        v59,
        objc_msgSend_objectForKeyedSubscript_(v4, v64, @"detection", v65),
        (v66 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_84:
    FigDebugAssert3();
LABEL_100:
    int v604 = -1;
    goto LABEL_70;
  }
  v69 = v66;
  v70 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"brightness", v68);
  v73 = v70;
  if (!v70) {
    goto LABEL_85;
  }
  v74 = objc_msgSend_objectForKeyedSubscript_(v70, v71, @"threshold", v72);

  if (!v74) {
    goto LABEL_85;
  }
  v77 = objc_msgSend_objectForKeyedSubscript_(v73, v75, @"threshold", v76);
  objc_msgSend_floatValue(v77, v78, v79, v80);
  *(_DWORD *)&self[1]._tuningParams.enabled = v81;

  v84 = objc_msgSend_objectForKeyedSubscript_(v73, v82, @"dilationNormalizedRadius", v83);

  if (!v84) {
    goto LABEL_85;
  }
  v87 = objc_msgSend_objectForKeyedSubscript_(v73, v85, @"dilationNormalizedRadius", v86);
  objc_msgSend_floatValue(v87, v88, v89, v90);
  LODWORD(self[2].super.isa) = v91;

  v94 = objc_msgSend_objectForKeyedSubscript_(v73, v92, @"erosionNormalizedRadius", v93);

  if (!v94) {
    goto LABEL_85;
  }
  v97 = objc_msgSend_objectForKeyedSubscript_(v73, v95, @"erosionNormalizedRadius", v96);
  objc_msgSend_floatValue(v97, v98, v99, v100);
  HIDWORD(self[2].super.isa) = v101;

  v104 = objc_msgSend_objectForKeyedSubscript_(v73, v102, @"normalizedOpticalCenter", v103);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v104, v105, v106, v107) != 2) {
    goto LABEL_86;
  }
  v110 = objc_msgSend_objectAtIndexedSubscript_(v104, v108, 0, v109);
  objc_msgSend_floatValue(v110, v111, v112, v113);
  self[1]._tuningParams.maxMaskAverage = v114;

  v117 = objc_msgSend_objectAtIndexedSubscript_(v104, v115, 1, v116);
  objc_msgSend_floatValue(v117, v118, v119, v120);
  self[1]._tuningParams.greenGhostThreshold = v121;

  v124 = objc_msgSend_objectForKeyedSubscript_(v69, v122, @"blob", v123);
  v73 = v124;
  if (!v124) {
    goto LABEL_85;
  }
  v127 = objc_msgSend_objectForKeyedSubscript_(v124, v125, @"threshold", v126);

  if (!v127) {
    goto LABEL_85;
  }
  v130 = objc_msgSend_objectForKeyedSubscript_(v73, v128, @"threshold", v129);
  objc_msgSend_floatValue(v130, v131, v132, v133);
  self[2]._tuningParams.maxMaskAverage = v134;

  v104 = objc_msgSend_objectForKeyedSubscript_(v73, v135, @"radius", v136);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v104, v137, v138, v139) != 2)
  {
LABEL_86:
    FigDebugAssert3();

    goto LABEL_87;
  }
  v142 = objc_msgSend_objectAtIndexedSubscript_(v104, v140, 0, v141);
  *(_DWORD *)&self[2]._tuningParams.enabled = objc_msgSend_intValue(v142, v143, v144, v145);

  v148 = objc_msgSend_objectAtIndexedSubscript_(v104, v146, 1, v147);
  LODWORD(self[2]._tuningParams.blurThreshold) = objc_msgSend_intValue(v148, v149, v150, v151);

  v154 = objc_msgSend_objectForKeyedSubscript_(v69, v152, @"green", v153);
  v73 = v154;
  if (!v154) {
    goto LABEL_85;
  }
  v157 = objc_msgSend_objectForKeyedSubscript_(v154, v155, @"hueThreshold", v156);

  if (!v157) {
    goto LABEL_85;
  }
  v160 = objc_msgSend_objectForKeyedSubscript_(v73, v158, @"hueThreshold", v159);
  objc_msgSend_floatValue(v160, v161, v162, v163);
  *(_DWORD *)&self[3]._tuningParams.enabled = v164;

  v167 = objc_msgSend_objectForKeyedSubscript_(v73, v165, @"openingNormalizedRadius", v166);

  if (!v167) {
    goto LABEL_85;
  }
  v170 = objc_msgSend_objectForKeyedSubscript_(v73, v168, @"openingNormalizedRadius", v169);
  objc_msgSend_floatValue(v170, v171, v172, v173);
  *(_DWORD *)&self[4]._tuningParams.enabled = v174;

  v177 = objc_msgSend_objectForKeyedSubscript_(v73, v175, @"dilationNormalizedRadius", v176);

  if (!v177)
  {
LABEL_85:
    FigDebugAssert3();
LABEL_87:

LABEL_88:
    goto LABEL_100;
  }
  v180 = objc_msgSend_objectForKeyedSubscript_(v73, v178, @"dilationNormalizedRadius", v179);
  objc_msgSend_floatValue(v180, v181, v182, v183);
  self[4]._tuningParams.blurThreshold = v184;

  v104 = objc_msgSend_objectForKeyedSubscript_(v73, v185, @"hueRange", v186);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_86;
  }
  if (objc_msgSend_count(v104, v187, v188, v189) != 2) {
    goto LABEL_86;
  }
  v192 = objc_msgSend_objectAtIndexedSubscript_(v104, v190, 0, v191);
  objc_msgSend_floatValue(v192, v193, v194, v195);
  LODWORD(self[3].super.isa) = v196;

  v199 = objc_msgSend_objectAtIndexedSubscript_(v104, v197, 1, v198);
  objc_msgSend_floatValue(v199, v200, v201, v202);
  HIDWORD(self[3].super.isa) = v203;

  v104 = objc_msgSend_objectForKeyedSubscript_(v73, v204, @"saturationThresholds", v205);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_86;
  }
  if (objc_msgSend_count(v104, v206, v207, v208) != 2) {
    goto LABEL_86;
  }
  v211 = objc_msgSend_objectAtIndexedSubscript_(v104, v209, 0, v210);
  objc_msgSend_floatValue(v211, v212, v213, v214);
  self[3]._tuningParams.maxMaskAverage = v215;

  v218 = objc_msgSend_objectAtIndexedSubscript_(v104, v216, 1, v217);
  objc_msgSend_floatValue(v218, v219, v220, v221);
  self[3]._tuningParams.greenGhostThreshold = v222;

  v104 = objc_msgSend_objectForKeyedSubscript_(v73, v223, @"valueThresholds", v224);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v104, v225, v226, v227) != 2) {
    goto LABEL_86;
  }
  v230 = objc_msgSend_objectAtIndexedSubscript_(v104, v228, 0, v229);
  objc_msgSend_floatValue(v230, v231, v232, v233);
  LODWORD(self[4].super.isa) = v234;

  v237 = objc_msgSend_objectAtIndexedSubscript_(v104, v235, 1, v236);
  objc_msgSend_floatValue(v237, v238, v239, v240);
  HIDWORD(self[4].super.isa) = v241;

  v244 = objc_msgSend_objectForKeyedSubscript_(v69, v242, @"multiBandDetection", v243);
  if (!v244)
  {
    FigDebugAssert3();
    goto LABEL_88;
  }
  v73 = v244;
  v104 = objc_msgSend_objectForKeyedSubscript_(v244, v245, @"tmpVarThresholds", v246);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v104, v247, v248, v249) != 2) {
    goto LABEL_86;
  }
  v606 = v69;
  v252 = objc_msgSend_objectAtIndexedSubscript_(v104, v250, 0, v251);
  objc_msgSend_floatValue(v252, v253, v254, v255);
  self[4]._tuningParams.maxMaskAverage = v256;

  v259 = objc_msgSend_objectAtIndexedSubscript_(v104, v257, 1, v258);
  objc_msgSend_floatValue(v259, v260, v261, v262);
  self[4]._tuningParams.greenGhostThreshold = v263;

  v266 = objc_msgSend_objectForKeyedSubscript_(v4, v264, @"refinement", v265);
  if (!v266)
  {
    FigDebugAssert3();
LABEL_99:

    goto LABEL_100;
  }
  v269 = v266;
  v270 = objc_msgSend_objectForKeyedSubscript_(v266, v267, @"guidedFilterRadius", v268);

  if (!v270) {
    goto LABEL_91;
  }
  v273 = objc_msgSend_objectForKeyedSubscript_(v269, v271, @"guidedFilterRadius", v272);
  LODWORD(self[5].super.isa) = objc_msgSend_unsignedIntValue(v273, v274, v275, v276);

  v279 = objc_msgSend_objectForKeyedSubscript_(v269, v277, @"guidedFilterGuideRange", v278);

  if (!v279) {
    goto LABEL_91;
  }
  v282 = objc_msgSend_objectForKeyedSubscript_(v269, v280, @"guidedFilterGuideRange", v281);
  objc_msgSend_floatValue(v282, v283, v284, v285);
  HIDWORD(self[5].super.isa) = v286;

  v289 = objc_msgSend_objectForKeyedSubscript_(v269, v287, @"guidedFilterThreshold", v288);

  if (!v289) {
    goto LABEL_91;
  }
  v292 = objc_msgSend_objectForKeyedSubscript_(v269, v290, @"guidedFilterThreshold", v291);
  objc_msgSend_floatValue(v292, v293, v294, v295);
  *(_DWORD *)&self[5]._tuningParams.enabled = v296;

  v299 = objc_msgSend_objectForKeyedSubscript_(v269, v297, @"dilationNormalizedRadius", v298);

  if (!v299) {
    goto LABEL_91;
  }
  v302 = objc_msgSend_objectForKeyedSubscript_(v269, v300, @"dilationNormalizedRadius", v301);
  objc_msgSend_floatValue(v302, v303, v304, v305);
  self[5]._tuningParams.blurThreshold = v306;

  v309 = objc_msgSend_objectForKeyedSubscript_(v269, v307, @"maskSurroundThreshold", v308);

  if (!v309
    || (objc_msgSend_objectForKeyedSubscript_(v269, v310, @"maskSurroundThreshold", v311),
        v312 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_floatValue(v312, v313, v314, v315),
        self[5]._tuningParams.maxMaskAverage = v316,
        v312,
        objc_msgSend_objectForKeyedSubscript_(v4, v317, @"fusion", v318),
        (v319 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_91:
    FigDebugAssert3();
LABEL_98:

    goto LABEL_99;
  }
  v322 = v319;
  v323 = objc_msgSend_objectForKeyedSubscript_(v319, v320, @"neighborDiffFilterRadius", v321);
  LODWORD(self[6].super.isa) = objc_msgSend_unsignedIntValue(v323, v324, v325, v326);

  v329 = objc_msgSend_objectForKeyedSubscript_(v322, v327, @"neighborDifferenceThresholds", v328);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_93;
  }
  if (objc_msgSend_count(v329, v330, v331, v332) != 2) {
    goto LABEL_93;
  }
  v335 = objc_msgSend_objectAtIndexedSubscript_(v329, v333, 0, v334);
  objc_msgSend_floatValue(v335, v336, v337, v338);
  *(_DWORD *)&self[6]._tuningParams.enabled = v339;

  v342 = objc_msgSend_objectAtIndexedSubscript_(v329, v340, 1, v341);
  objc_msgSend_floatValue(v342, v343, v344, v345);
  self[6]._tuningParams.blurThreshold = v346;

  v329 = objc_msgSend_objectForKeyedSubscript_(v322, v347, @"greenProbabilityThresholds", v348);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v329, v349, v350, v351) != 2) {
    goto LABEL_93;
  }
  v354 = objc_msgSend_objectAtIndexedSubscript_(v329, v352, 0, v353);
  objc_msgSend_floatValue(v354, v355, v356, v357);
  self[6]._tuningParams.maxMaskAverage = v358;

  v361 = objc_msgSend_objectAtIndexedSubscript_(v329, v359, 1, v360);
  objc_msgSend_floatValue(v361, v362, v363, v364);
  self[6]._tuningParams.greenGhostThreshold = v365;

  v368 = objc_msgSend_objectForKeyedSubscript_(v322, v366, @"fusionWeightErosionNormalizedRadius", v367);

  if (!v368) {
    goto LABEL_92;
  }
  v371 = objc_msgSend_objectForKeyedSubscript_(v322, v369, @"fusionWeightErosionNormalizedRadius", v370);
  objc_msgSend_floatValue(v371, v372, v373, v374);
  LODWORD(self[7].super.isa) = v375;

  v378 = objc_msgSend_objectForKeyedSubscript_(v322, v376, @"fusionWeightBlurRadius", v377);

  if (!v378) {
    goto LABEL_92;
  }
  v381 = objc_msgSend_objectForKeyedSubscript_(v322, v379, @"fusionWeightBlurRadius", v380);
  HIDWORD(self[7].super.isa) = objc_msgSend_unsignedIntValue(v381, v382, v383, v384);

  v387 = objc_msgSend_objectForKeyedSubscript_(v322, v385, @"postFusionErosionNormalizedRadius", v386);

  if (!v387) {
    goto LABEL_92;
  }
  v390 = objc_msgSend_objectForKeyedSubscript_(v322, v388, @"postFusionErosionNormalizedRadius", v389);
  objc_msgSend_floatValue(v390, v391, v392, v393);
  *(_DWORD *)&self[7]._tuningParams.enabled = v394;

  v397 = objc_msgSend_objectForKeyedSubscript_(v322, v395, @"postFusionReferenceWeight", v396);

  if (!v397
    || (objc_msgSend_objectForKeyedSubscript_(v322, v398, @"postFusionReferenceWeight", v399),
        v400 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_floatValue(v400, v401, v402, v403),
        self[7]._tuningParams.blurThreshold = v404,
        v400,
        objc_msgSend_objectForKeyedSubscript_(v4, v405, @"inpaint", v406),
        (v407 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_92:
    FigDebugAssert3();
LABEL_97:

    goto LABEL_98;
  }
  v329 = v407;
  v410 = objc_msgSend_objectForKeyedSubscript_(v407, v408, @"postFusionMaskThresholds", v409);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v410, v411, v412, v413) != 2) {
    goto LABEL_94;
  }
  v416 = objc_msgSend_objectAtIndexedSubscript_(v410, v414, 0, v415);
  objc_msgSend_floatValue(v416, v417, v418, v419);
  self[7]._tuningParams.maxMaskAverage = v420;

  v423 = objc_msgSend_objectAtIndexedSubscript_(v410, v421, 1, v422);
  objc_msgSend_floatValue(v423, v424, v425, v426);
  self[7]._tuningParams.greenGhostThreshold = v427;

  v430 = objc_msgSend_objectForKeyedSubscript_(v329, v428, @"postFusionMaskDilateRadius", v429);

  if (!v430) {
    goto LABEL_93;
  }
  v433 = objc_msgSend_objectForKeyedSubscript_(v329, v431, @"postFusionMaskDilateRadius", v432);
  LODWORD(self[8].super.isa) = objc_msgSend_unsignedIntValue(v433, v434, v435, v436);

  v439 = objc_msgSend_objectForKeyedSubscript_(v329, v437, @"propagatedLumaBlurRadius", v438);

  if (!v439) {
    goto LABEL_93;
  }
  v442 = objc_msgSend_objectForKeyedSubscript_(v329, v440, @"propagatedLumaBlurRadius", v441);
  HIDWORD(self[8].super.isa) = objc_msgSend_unsignedIntValue(v442, v443, v444, v445);

  v448 = objc_msgSend_objectForKeyedSubscript_(v329, v446, @"maskBlurRadius", v447);

  if (!v448) {
    goto LABEL_93;
  }
  v451 = objc_msgSend_objectForKeyedSubscript_(v329, v449, @"maskBlurRadius", v450);
  *(_DWORD *)&self[8]._tuningParams.enabled = objc_msgSend_unsignedIntValue(v451, v452, v453, v454);

  v457 = objc_msgSend_objectForKeyedSubscript_(v329, v455, @"darknessTolerance", v456);

  if (!v457) {
    goto LABEL_93;
  }
  v460 = objc_msgSend_objectForKeyedSubscript_(v329, v458, @"darknessTolerance", v459);
  objc_msgSend_floatValue(v460, v461, v462, v463);
  self[8]._tuningParams.blurThreshold = v464;

  v467 = objc_msgSend_objectForKeyedSubscript_(v329, v465, @"lumaScale", v466);

  if (!v467)
  {
LABEL_93:
    FigDebugAssert3();
LABEL_96:

    goto LABEL_97;
  }
  v470 = objc_msgSend_objectForKeyedSubscript_(v329, v468, @"lumaScale", v469);
  objc_msgSend_floatValue(v470, v471, v472, v473);
  self[8]._tuningParams.maxMaskAverage = v474;

  v410 = objc_msgSend_objectForKeyedSubscript_(v329, v475, @"gradientThresholds", v476);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_94;
  }
  if (objc_msgSend_count(v410, v477, v478, v479) != 2) {
    goto LABEL_94;
  }
  v482 = objc_msgSend_objectAtIndexedSubscript_(v410, v480, 0, v481);
  objc_msgSend_floatValue(v482, v483, v484, v485);
  LODWORD(self[9].super.isa) = v486;

  v489 = objc_msgSend_objectAtIndexedSubscript_(v410, v487, 1, v488);
  objc_msgSend_floatValue(v489, v490, v491, v492);
  HIDWORD(self[9].super.isa) = v493;

  v410 = objc_msgSend_objectForKeyedSubscript_(v329, v494, @"detailScales", v495);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_94;
  }
  if (objc_msgSend_count(v410, v496, v497, v498) != 2) {
    goto LABEL_94;
  }
  v501 = objc_msgSend_objectAtIndexedSubscript_(v410, v499, 0, v500);
  objc_msgSend_floatValue(v501, v502, v503, v504);
  *(_DWORD *)&self[9]._tuningParams.enabled = v505;

  v508 = objc_msgSend_objectAtIndexedSubscript_(v410, v506, 1, v507);
  objc_msgSend_floatValue(v508, v509, v510, v511);
  self[9]._tuningParams.blurThreshold = v512;

  v410 = objc_msgSend_objectForKeyedSubscript_(v329, v513, @"detailBiases", v514);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_94;
  }
  if (objc_msgSend_count(v410, v515, v516, v517) != 2) {
    goto LABEL_94;
  }
  v520 = objc_msgSend_objectAtIndexedSubscript_(v410, v518, 0, v519);
  objc_msgSend_floatValue(v520, v521, v522, v523);
  self[9]._tuningParams.maxMaskAverage = v524;

  v527 = objc_msgSend_objectAtIndexedSubscript_(v410, v525, 1, v526);
  objc_msgSend_floatValue(v527, v528, v529, v530);
  self[9]._tuningParams.greenGhostThreshold = v531;

  v410 = objc_msgSend_objectForKeyedSubscript_(v329, v532, @"detailThresholds", v533);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_94;
  }
  if (objc_msgSend_count(v410, v534, v535, v536) != 2) {
    goto LABEL_94;
  }
  v539 = objc_msgSend_objectAtIndexedSubscript_(v410, v537, 0, v538);
  objc_msgSend_floatValue(v539, v540, v541, v542);
  LODWORD(self[10].super.isa) = v543;

  v546 = objc_msgSend_objectAtIndexedSubscript_(v410, v544, 1, v545);
  objc_msgSend_floatValue(v546, v547, v548, v549);
  HIDWORD(self[10].super.isa) = v550;

  v553 = objc_msgSend_objectForKeyedSubscript_(v329, v551, @"sharpening", v552);
  v410 = v553;
  if (!v553
    || (objc_msgSend_objectForKeyedSubscript_(v553, v554, @"strength", v555),
        v556 = objc_claimAutoreleasedReturnValue(),
        v556,
        !v556))
  {
LABEL_94:
    FigDebugAssert3();
LABEL_95:

    goto LABEL_96;
  }
  v559 = objc_msgSend_objectForKeyedSubscript_(v410, v557, @"strength", v558);
  objc_msgSend_floatValue(v559, v560, v561, v562);
  LODWORD(self[11].super.isa) = v563;

  v566 = objc_msgSend_objectForKeyedSubscript_(v410, v564, @"shift", v565);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v566, v567, v568, v569) != 2)
  {
    FigDebugAssert3();

    goto LABEL_95;
  }
  id v572 = v4;
  v573 = v7;
  v574 = objc_msgSend_objectAtIndexedSubscript_(v566, v570, 0, v571);
  *(_DWORD *)&self[10]._tuningParams.enabled = objc_msgSend_intValue(v574, v575, v576, v577);

  v580 = objc_msgSend_objectAtIndexedSubscript_(v566, v578, 1, v579);
  LODWORD(self[10]._tuningParams.blurThreshold) = objc_msgSend_intValue(v580, v581, v582, v583);

  v586 = objc_msgSend_objectForKeyedSubscript_(v410, v584, @"thresholds", v585);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v586, v587, v588, v589) == 2)
  {
    v592 = objc_msgSend_objectAtIndexedSubscript_(v586, v590, 0, v591);
    objc_msgSend_floatValue(v592, v593, v594, v595);
    self[10]._tuningParams.maxMaskAverage = v596;

    v599 = objc_msgSend_objectAtIndexedSubscript_(v586, v597, 1, v598);
    objc_msgSend_floatValue(v599, v600, v601, v602);
    self[10]._tuningParams.greenGhostThreshold = v603;

    int v604 = 0;
  }
  else
  {
    FigDebugAssert3();

    int v604 = -1;
  }
  objc_super v7 = v573;
  id v4 = v572;
LABEL_70:

  return v604;
}

- (LowLightTuning)tuningParams
{
  v3 = memcpy(v2, &self->_tuningParams, 0x108uLL);
  result.maxMaskAverage = *(float *)&v4;
  result.greenGhostThreshold = *((float *)&v4 + 1);
  result.enabled = (char)v3;
  result.blurThreshold = *((float *)&v3 + 1);
  return result;
}

- (void)setTuningParams:(LowLightTuning)a3
{
}

@end