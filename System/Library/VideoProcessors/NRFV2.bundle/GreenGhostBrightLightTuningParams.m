@interface GreenGhostBrightLightTuningParams
- (BrightLightTuning)tuningParams;
- (GreenGhostBrightLightTuningParams)init;
- (int)readPlist:(id)a3;
- (void)setDefaultTuningParams;
- (void)setTuningParams:(BrightLightTuning)a3;
@end

@implementation GreenGhostBrightLightTuningParams

- (void)setDefaultTuningParams
{
  long long v26 = *(_OWORD *)"fff?";
  *(_OWORD *)&v27[8] = xmmword_263118320;
  *(void *)v27 = 0x3B03126F3CF5C28FLL;
  *(void *)&v27[56] = 0x3A03126F00000000;
  *(_OWORD *)&v27[40] = unk_2631182E0;
  *(_OWORD *)&v27[24] = xmmword_2631182D0;
  long long v22 = *(_OWORD *)&v27[16];
  long long v23 = *(_OWORD *)&v27[32];
  long long v20 = *(_OWORD *)"fff?";
  long long v21 = *(_OWORD *)v27;
  long long v24 = *(_OWORD *)&v27[48];
  long long v25 = xmmword_263118340;
  long long v9 = xmmword_263118330;
  long long v10 = *(_OWORD *)"fff?";
  long long v14 = *(_OWORD *)&v27[48];
  long long v13 = *(_OWORD *)&v27[32];
  long long v11 = *(_OWORD *)v27;
  long long v12 = *(_OWORD *)&v27[16];
  long long v17 = unk_263118308;
  long long v15 = xmmword_263118340;
  long long v16 = xmmword_2631182F8;
  v8[0] = 0x3C23D70A00000100;
  __asm { FMOV            V0.2S, #1.0 }
  v8[1] = _D0;
  int v18 = 990057071;
  int v19 = 0;
  objc_msgSend_setTuningParams_(self, a2, (uint64_t)v8, v2);
}

- (GreenGhostBrightLightTuningParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)GreenGhostBrightLightTuningParams;
  uint64_t v2 = [(GreenGhostBrightLightTuningParams *)&v7 init];
  objc_msgSend_setDefaultTuningParams(v2, v3, v4, v5);
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"faceBoundaryPaddingRatio", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_50;
  }
  if (objc_msgSend_count(v7, v8, v9, v10) != 2) {
    goto LABEL_50;
  }
  long long v13 = objc_msgSend_objectAtIndexedSubscript_(v7, v11, 0, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  LODWORD(self[1].super.isa) = v17;

  long long v20 = objc_msgSend_objectAtIndexedSubscript_(v7, v18, 1, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  HIDWORD(self[1].super.isa) = v24;

  v27 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"enabled", v26);

  if (!v27) {
    goto LABEL_50;
  }
  v30 = objc_msgSend_objectForKeyedSubscript_(v4, v28, @"enabled", v29);
  self->_tuningParams.enabled = objc_msgSend_BOOLValue(v30, v31, v32, v33);

  v36 = objc_msgSend_objectForKeyedSubscript_(v4, v34, @"eitThreshold", v35);

  if (!v36) {
    goto LABEL_50;
  }
  v39 = objc_msgSend_objectForKeyedSubscript_(v4, v37, @"eitThreshold", v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  self->_tuningParams.eitThreshold = v43;

  v46 = objc_msgSend_objectForKeyedSubscript_(v4, v44, @"useClippingData", v45);

  if (!v46
    || (objc_msgSend_objectForKeyedSubscript_(v4, v47, @"useClippingData", v48),
        v49 = objc_claimAutoreleasedReturnValue(),
        self->_tuningParams.useClippingData = objc_msgSend_BOOLValue(v49, v50, v51, v52),
        v49,
        objc_msgSend_objectForKeyedSubscript_(v4, v53, @"clipping", v54),
        (v55 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_50:
    FigDebugAssert3();
LABEL_70:
    int v402 = -1;
    goto LABEL_45;
  }
  v58 = v55;
  v59 = objc_msgSend_objectForKeyedSubscript_(v55, v56, @"paddingRatio", v57);

  if (!v59) {
    goto LABEL_51;
  }
  v62 = objc_msgSend_objectForKeyedSubscript_(v58, v60, @"paddingRatio", v61);
  objc_msgSend_floatValue(v62, v63, v64, v65);
  *(_DWORD *)&self[1]._tuningParams.enabled = v66;

  v69 = objc_msgSend_objectForKeyedSubscript_(v58, v67, @"minClippedPixelRatio", v68);

  if (!v69) {
    goto LABEL_51;
  }
  v72 = objc_msgSend_objectForKeyedSubscript_(v58, v70, @"minClippedPixelRatio", v71);
  objc_msgSend_floatValue(v72, v73, v74, v75);
  self[1]._tuningParams.eitThreshold = v76;

  v79 = objc_msgSend_objectForKeyedSubscript_(v58, v77, @"clippedPixelRatio", v78);

  if (!v79) {
    goto LABEL_51;
  }
  v82 = objc_msgSend_objectForKeyedSubscript_(v58, v80, @"clippedPixelRatio", v81);
  objc_msgSend_floatValue(v82, v83, v84, v85);
  LODWORD(self[2].super.isa) = v86;

  v89 = objc_msgSend_objectForKeyedSubscript_(v58, v87, @"maxClippedTilesCount", v88);

  if (!v89
    || (objc_msgSend_objectForKeyedSubscript_(v58, v90, @"maxClippedTilesCount", v91),
        v92 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_floatValue(v92, v93, v94, v95),
        HIDWORD(self[2].super.isa) = v96,
        v92,
        objc_msgSend_objectForKeyedSubscript_(v4, v97, @"detection", v98),
        (v99 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_51:
    FigDebugAssert3();
LABEL_69:

    goto LABEL_70;
  }
  v102 = v99;
  v103 = objc_msgSend_objectForKeyedSubscript_(v99, v100, @"brightness", v101);
  v106 = v103;
  if (!v103) {
    goto LABEL_66;
  }
  v107 = objc_msgSend_objectForKeyedSubscript_(v103, v104, @"threshold", v105);

  if (!v107) {
    goto LABEL_66;
  }
  v110 = objc_msgSend_objectForKeyedSubscript_(v106, v108, @"threshold", v109);
  objc_msgSend_floatValue(v110, v111, v112, v113);
  *(_DWORD *)&self[2]._tuningParams.enabled = v114;

  v117 = objc_msgSend_objectForKeyedSubscript_(v106, v115, @"dilationNormalizedRadius", v116);

  if (!v117) {
    goto LABEL_66;
  }
  v120 = objc_msgSend_objectForKeyedSubscript_(v106, v118, @"dilationNormalizedRadius", v119);
  objc_msgSend_floatValue(v120, v121, v122, v123);
  *(_DWORD *)&self[3]._tuningParams.enabled = v124;

  v127 = objc_msgSend_objectForKeyedSubscript_(v106, v125, @"erosionNormalizedRadius", v126);

  if (!v127) {
    goto LABEL_66;
  }
  v130 = objc_msgSend_objectForKeyedSubscript_(v106, v128, @"erosionNormalizedRadius", v129);
  objc_msgSend_floatValue(v130, v131, v132, v133);
  self[3]._tuningParams.eitThreshold = v134;

  v137 = objc_msgSend_objectForKeyedSubscript_(v106, v135, @"normalizedOpticalCenter", v136);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v137, v138, v139, v140) != 2) {
    goto LABEL_59;
  }
  v143 = objc_msgSend_objectAtIndexedSubscript_(v137, v141, 0, v142);
  objc_msgSend_floatValue(v143, v144, v145, v146);
  LODWORD(self[3].super.isa) = v147;

  v150 = objc_msgSend_objectAtIndexedSubscript_(v137, v148, 1, v149);
  objc_msgSend_floatValue(v150, v151, v152, v153);
  HIDWORD(self[3].super.isa) = v154;

  v157 = objc_msgSend_objectForKeyedSubscript_(v102, v155, @"blob", v156);
  v106 = v157;
  if (!v157) {
    goto LABEL_66;
  }
  v160 = objc_msgSend_objectForKeyedSubscript_(v157, v158, @"threshold", v159);

  if (!v160) {
    goto LABEL_66;
  }
  v163 = objc_msgSend_objectForKeyedSubscript_(v106, v161, @"threshold", v162);
  objc_msgSend_floatValue(v163, v164, v165, v166);
  *(_DWORD *)&self[4]._tuningParams.enabled = v167;

  v137 = objc_msgSend_objectForKeyedSubscript_(v106, v168, @"radius", v169);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v137, v170, v171, v172) != 2) {
    goto LABEL_59;
  }
  v175 = objc_msgSend_objectAtIndexedSubscript_(v137, v173, 0, v174);
  LODWORD(self[4].super.isa) = objc_msgSend_intValue(v175, v176, v177, v178);

  v181 = objc_msgSend_objectAtIndexedSubscript_(v137, v179, 1, v180);
  HIDWORD(self[4].super.isa) = objc_msgSend_intValue(v181, v182, v183, v184);

  v187 = objc_msgSend_objectForKeyedSubscript_(v102, v185, @"green", v186);
  v106 = v187;
  if (!v187)
  {
LABEL_66:
    FigDebugAssert3();
    goto LABEL_67;
  }
  v190 = objc_msgSend_objectForKeyedSubscript_(v187, v188, @"hueThreshold", v189);
  objc_msgSend_floatValue(v190, v191, v192, v193);
  *(_DWORD *)&self[5]._tuningParams.enabled = v194;

  v197 = objc_msgSend_objectForKeyedSubscript_(v106, v195, @"openingNormalizedRadius", v196);
  objc_msgSend_floatValue(v197, v198, v199, v200);
  LODWORD(self[7].super.isa) = v201;

  v204 = objc_msgSend_objectForKeyedSubscript_(v106, v202, @"dilationNormalizedRadius", v203);
  objc_msgSend_floatValue(v204, v205, v206, v207);
  HIDWORD(self[7].super.isa) = v208;

  v137 = objc_msgSend_objectForKeyedSubscript_(v106, v209, @"hueRange", v210);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_59;
  }
  if (objc_msgSend_count(v137, v211, v212, v213) != 2) {
    goto LABEL_59;
  }
  v216 = objc_msgSend_objectAtIndexedSubscript_(v137, v214, 0, v215);
  objc_msgSend_floatValue(v216, v217, v218, v219);
  LODWORD(self[5].super.isa) = v220;

  v223 = objc_msgSend_objectAtIndexedSubscript_(v137, v221, 1, v222);
  objc_msgSend_floatValue(v223, v224, v225, v226);
  HIDWORD(self[5].super.isa) = v227;

  v137 = objc_msgSend_objectForKeyedSubscript_(v106, v228, @"saturationThresholds", v229);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_59;
  }
  if (objc_msgSend_count(v137, v230, v231, v232) != 2) {
    goto LABEL_59;
  }
  v235 = objc_msgSend_objectAtIndexedSubscript_(v137, v233, 0, v234);
  objc_msgSend_floatValue(v235, v236, v237, v238);
  LODWORD(self[6].super.isa) = v239;

  v242 = objc_msgSend_objectAtIndexedSubscript_(v137, v240, 1, v241);
  objc_msgSend_floatValue(v242, v243, v244, v245);
  HIDWORD(self[6].super.isa) = v246;

  v137 = objc_msgSend_objectForKeyedSubscript_(v106, v247, @"valueThresholds", v248);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v137, v249, v250, v251) != 2)
  {
LABEL_59:
    FigDebugAssert3();

LABEL_67:
    goto LABEL_68;
  }
  v254 = objc_msgSend_objectAtIndexedSubscript_(v137, v252, 0, v253);
  objc_msgSend_floatValue(v254, v255, v256, v257);
  *(_DWORD *)&self[6]._tuningParams.enabled = v258;

  v261 = objc_msgSend_objectAtIndexedSubscript_(v137, v259, 1, v260);
  objc_msgSend_floatValue(v261, v262, v263, v264);
  self[6]._tuningParams.eitThreshold = v265;

  v268 = objc_msgSend_objectForKeyedSubscript_(v102, v266, @"refinement", v267);
  v106 = v268;
  if (!v268) {
    goto LABEL_66;
  }
  v271 = objc_msgSend_objectForKeyedSubscript_(v268, v269, @"openingNormalizedRadius", v270);

  if (!v271) {
    goto LABEL_66;
  }
  v274 = objc_msgSend_objectForKeyedSubscript_(v106, v272, @"openingNormalizedRadius", v273);
  objc_msgSend_floatValue(v274, v275, v276, v277);
  *(_DWORD *)&self[7]._tuningParams.enabled = v278;

  v281 = objc_msgSend_objectForKeyedSubscript_(v106, v279, @"dilationNormalizedRadius", v280);

  if (!v281) {
    goto LABEL_66;
  }
  v284 = objc_msgSend_objectForKeyedSubscript_(v106, v282, @"dilationNormalizedRadius", v283);
  objc_msgSend_floatValue(v284, v285, v286, v287);
  self[7]._tuningParams.eitThreshold = v288;

  v291 = objc_msgSend_objectForKeyedSubscript_(v106, v289, @"threshold", v290);

  if (!v291) {
    goto LABEL_66;
  }
  v294 = objc_msgSend_objectForKeyedSubscript_(v106, v292, @"threshold", v293);
  objc_msgSend_floatValue(v294, v295, v296, v297);
  LODWORD(self[8].super.isa) = v298;

  v301 = objc_msgSend_objectForKeyedSubscript_(v106, v299, @"maskSurroundThreshold", v300);

  if (!v301) {
    goto LABEL_66;
  }
  v304 = objc_msgSend_objectForKeyedSubscript_(v106, v302, @"maskSurroundThreshold", v303);
  objc_msgSend_floatValue(v304, v305, v306, v307);
  HIDWORD(self[8].super.isa) = v308;

  v311 = objc_msgSend_objectForKeyedSubscript_(v4, v309, @"repair", v310);
  if (!v311)
  {
    FigDebugAssert3();
LABEL_68:

    goto LABEL_69;
  }
  v106 = v311;
  v314 = objc_msgSend_objectForKeyedSubscript_(v311, v312, @"surroundMaskDilationNormalizedRadius", v313);

  if (!v314) {
    goto LABEL_66;
  }
  v317 = objc_msgSend_objectForKeyedSubscript_(v106, v315, @"surroundMaskDilationNormalizedRadius", v316);
  objc_msgSend_floatValue(v317, v318, v319, v320);
  *(_DWORD *)&self[8]._tuningParams.enabled = v321;

  v324 = objc_msgSend_objectForKeyedSubscript_(v106, v322, @"narrowSurroundMaskDilationNormalizedRadius", v323);

  if (!v324) {
    goto LABEL_66;
  }
  v327 = objc_msgSend_objectForKeyedSubscript_(v106, v325, @"narrowSurroundMaskDilationNormalizedRadius", v326);
  objc_msgSend_floatValue(v327, v328, v329, v330);
  self[8]._tuningParams.eitThreshold = v331;

  v334 = objc_msgSend_objectForKeyedSubscript_(v106, v332, @"inpaintingDisplacement", v333);

  if (!v334) {
    goto LABEL_66;
  }
  v337 = objc_msgSend_objectForKeyedSubscript_(v106, v335, @"inpaintingDisplacement", v336);
  objc_msgSend_floatValue(v337, v338, v339, v340);
  LODWORD(self[9].super.isa) = v341;

  v344 = objc_msgSend_objectForKeyedSubscript_(v106, v342, @"inpaintingConfidenceThreshold", v343);

  if (!v344) {
    goto LABEL_66;
  }
  v347 = objc_msgSend_objectForKeyedSubscript_(v106, v345, @"inpaintingConfidenceThreshold", v346);
  objc_msgSend_floatValue(v347, v348, v349, v350);
  HIDWORD(self[9].super.isa) = v351;

  v354 = objc_msgSend_objectForKeyedSubscript_(v106, v352, @"inpaintingStrength", v353);

  if (!v354) {
    goto LABEL_66;
  }
  v357 = objc_msgSend_objectForKeyedSubscript_(v106, v355, @"inpaintingStrength", v356);
  objc_msgSend_floatValue(v357, v358, v359, v360);
  *(_DWORD *)&self[9]._tuningParams.enabled = v361;

  v364 = objc_msgSend_objectForKeyedSubscript_(v106, v362, @"sharpening", v363);

  if (!v364) {
    goto LABEL_66;
  }
  v367 = objc_msgSend_objectForKeyedSubscript_(v106, v365, @"sharpening", v366);
  objc_msgSend_floatValue(v367, v368, v369, v370);
  self[9]._tuningParams.eitThreshold = v371;

  v374 = objc_msgSend_objectForKeyedSubscript_(v106, v372, @"brightnessOffset", v373);

  if (!v374) {
    goto LABEL_66;
  }
  v377 = objc_msgSend_objectForKeyedSubscript_(v106, v375, @"brightnessOffset", v376);
  objc_msgSend_floatValue(v377, v378, v379, v380);
  LODWORD(self[10].super.isa) = v381;

  v384 = objc_msgSend_objectForKeyedSubscript_(v106, v382, @"lumaSimilarityBoost", v383);

  if (!v384) {
    goto LABEL_66;
  }
  v387 = objc_msgSend_objectForKeyedSubscript_(v106, v385, @"lumaSimilarityBoost", v386);
  objc_msgSend_floatValue(v387, v388, v389, v390);
  HIDWORD(self[10].super.isa) = v391;

  v394 = objc_msgSend_objectForKeyedSubscript_(v106, v392, @"normalizedMaxMaskSize", v393);

  if (!v394) {
    goto LABEL_66;
  }
  v397 = objc_msgSend_objectForKeyedSubscript_(v106, v395, @"normalizedMaxMaskSize", v396);
  objc_msgSend_floatValue(v397, v398, v399, v400);
  *(_DWORD *)&self[10]._tuningParams.enabled = v401;

  int v402 = 0;
LABEL_45:

  return v402;
}

- (BrightLightTuning)tuningParams
{
  long long v3 = *(_OWORD *)&self[7]._tuningParams.enabled;
  long long v4 = *(_OWORD *)&self[9]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)(v2 + 128) = *(GreenGhostBrightLightTuningParams *)((char *)self + 136);
  *(_OWORD *)(v2 + 144) = v4;
  *(BrightLightTuning *)(v2 + 160) = self[10]._tuningParams;
  long long v5 = *(_OWORD *)&self[3]._tuningParams.enabled;
  long long v6 = *(_OWORD *)&self[5]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)(v2 + 64) = *(GreenGhostBrightLightTuningParams *)((char *)self + 72);
  *(_OWORD *)(v2 + 80) = v6;
  *(GreenGhostBrightLightTuningParams *)(v2 + 96) = *(GreenGhostBrightLightTuningParams *)((char *)self + 104);
  *(_OWORD *)(v2 + 112) = v3;
  long long v7 = *(_OWORD *)&self[1]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)uint64_t v2 = *(GreenGhostBrightLightTuningParams *)&self->_tuningParams.enabled;
  *(_OWORD *)(v2 + 16) = v7;
  *(GreenGhostBrightLightTuningParams *)(v2 + 32) = *(GreenGhostBrightLightTuningParams *)((char *)self + 40);
  *(_OWORD *)(v2 + 48) = v5;
  return (BrightLightTuning)self;
}

- (void)setTuningParams:(BrightLightTuning)a3
{
  long long v3 = *(_OWORD *)*(void *)&a3;
  long long v4 = *(_OWORD *)(*(void *)&a3 + 16);
  *(GreenGhostBrightLightTuningParams *)((char *)self + 40) = *(GreenGhostBrightLightTuningParams *)(*(void *)&a3 + 32);
  *(_OWORD *)&self[1]._tuningParams.enabled = v4;
  *(_OWORD *)&self->_tuningParams.enabled = v3;
  long long v5 = *(_OWORD *)(*(void *)&a3 + 48);
  long long v6 = *(_OWORD *)(*(void *)&a3 + 64);
  long long v7 = *(_OWORD *)(*(void *)&a3 + 80);
  *(GreenGhostBrightLightTuningParams *)((char *)self + 104) = *(GreenGhostBrightLightTuningParams *)(*(void *)&a3 + 96);
  *(_OWORD *)&self[5]._tuningParams.enabled = v7;
  *(_OWORD *)&self[4]._tuningParams.enabled = v6;
  *(_OWORD *)&self[3]._tuningParams.enabled = v5;
  long long v8 = *(_OWORD *)(*(void *)&a3 + 112);
  long long v9 = *(_OWORD *)(*(void *)&a3 + 128);
  long long v10 = *(_OWORD *)(*(void *)&a3 + 144);
  self[10]._tuningParams = *(BrightLightTuning *)(*(void *)&a3 + 160);
  *(_OWORD *)&self[9]._tuningParams.enabled = v10;
  *(_OWORD *)&self[8]._tuningParams.enabled = v9;
  *(_OWORD *)&self[7]._tuningParams.enabled = v8;
}

@end