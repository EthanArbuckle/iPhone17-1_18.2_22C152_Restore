@interface DenoiseAndSharpeningPlist
+ (void)initialize;
- (DenoiseAndSharpeningPlist)init;
- (int)readBandData:(id)a3;
- (int)readPlist:(id)a3;
- (void)applyOverrides;
@end

@implementation DenoiseAndSharpeningPlist

+ (void)initialize
{
  dword_26B429790 = 2;
  dword_26B429794 = 2;
}

- (DenoiseAndSharpeningPlist)init
{
  v6.receiver = self;
  v6.super_class = (Class)DenoiseAndSharpeningPlist;
  v2 = [(DenoiseAndSharpeningPlist *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tuningParameters = v2->tuningParameters;
    v2->tuningParameters = (DenoiseAndSharpeningTuning *)v3;
  }
  return v2;
}

- (int)readBandData:(id)a3
{
  uint64_t v258 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_valueForKey_(a3, a2, @"Bands", v3);
  v5 = v4;
  if (v4)
  {
    long long v254 = 0u;
    long long v255 = 0u;
    long long v252 = 0u;
    long long v253 = 0u;
    id obj = v4;
    uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v252, (uint64_t)v257, 16);
    if (v243)
    {
      v242 = v5;
      uint64_t v245 = *(void *)v253;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v253 != v245) {
            objc_enumerationMutation(obj);
          }
          uint64_t v247 = v7;
          v8 = *(void **)(*((void *)&v252 + 1) + 8 * v7);
          v9 = objc_opt_new();
          long long v248 = 0u;
          long long v249 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          id v10 = v8;
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v248, (uint64_t)v256, 16);
          if (v12)
          {
            uint64_t v15 = v12;
            uint64_t v16 = *(void *)v249;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v249 != v16) {
                  objc_enumerationMutation(v10);
                }
                v18 = *(void **)(*((void *)&v248 + 1) + 8 * i);
                v19 = objc_msgSend_objectForKeyedSubscript_(v10, v13, (uint64_t)v18, v14);
                if (objc_msgSend_isEqualToString_(v18, v20, @"ChromaDenoiseLumaThresholdGain", v21))
                {
                  v24 = [GainValueArray alloc];
                  uint64_t v27 = objc_msgSend_initWithArray_(v24, v25, (uint64_t)v19, v26);
                  v28 = (void *)v9[1];
                  v9[1] = v27;

                  if (!v27) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v22, @"ChromaDenoiseChromaThresholdGain", v23))
                {
                  v31 = [GainValueArray alloc];
                  uint64_t v34 = objc_msgSend_initWithArray_(v31, v32, (uint64_t)v19, v33);
                  v35 = (void *)v9[2];
                  v9[2] = v34;

                  if (!v34) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v29, @"ChromaDenoiseMixingCoeff", v30))
                {
                  v38 = [GainValueArray alloc];
                  uint64_t v41 = objc_msgSend_initWithArray_(v38, v39, (uint64_t)v19, v40);
                  v42 = (void *)v9[3];
                  v9[3] = v41;

                  if (!v41) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v36, @"LumaDenoiseThresholdGain", v37))
                {
                  v45 = [GainValueArray alloc];
                  uint64_t v48 = objc_msgSend_initWithArray_(v45, v46, (uint64_t)v19, v47);
                  v49 = (void *)v9[4];
                  v9[4] = v48;

                  if (!v48) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v43, @"LumaDenoiseMixingCoeff", v44))
                {
                  v52 = [GainValueArray alloc];
                  uint64_t v55 = objc_msgSend_initWithArray_(v52, v53, (uint64_t)v19, v54);
                  v56 = (void *)v9[5];
                  v9[5] = v55;

                  if (!v55) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v50, @"LumaSharpeningScalingOnSkin", v51))
                {
                  v59 = [GainValueArray alloc];
                  uint64_t v62 = objc_msgSend_initWithArray_(v59, v60, (uint64_t)v19, v61);
                  v63 = (void *)v9[6];
                  v9[6] = v62;

                  if (!v62) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v57, @"LumaDenoisingScalingOnSkin", v58))
                {
                  v66 = [GainValueArray alloc];
                  uint64_t v69 = objc_msgSend_initWithArray_(v66, v67, (uint64_t)v19, v68);
                  v70 = (void *)v9[7];
                  v9[7] = v69;

                  if (!v69) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v64, @"LumaSharpeningScalingOnSky", v65))
                {
                  v73 = [GainValueArray alloc];
                  uint64_t v76 = objc_msgSend_initWithArray_(v73, v74, (uint64_t)v19, v75);
                  v77 = (void *)v9[8];
                  v9[8] = v76;

                  if (!v76) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v71, @"LumaDenoisingScalingOnSky", v72))
                {
                  v80 = [GainValueArray alloc];
                  uint64_t v83 = objc_msgSend_initWithArray_(v80, v81, (uint64_t)v19, v82);
                  v84 = (void *)v9[9];
                  v9[9] = v83;

                  if (!v83) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v78, @"Luma3x3SharpeningStrength", v79))
                {
                  v87 = [GainValueArray alloc];
                  uint64_t v90 = objc_msgSend_initWithArray_(v87, v88, (uint64_t)v19, v89);
                  v91 = (void *)v9[10];
                  v9[10] = v90;

                  if (!v90) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v85, @"LumaLowVarSharpeningStrength", v86))
                {
                  v94 = [GainValueArray alloc];
                  uint64_t v97 = objc_msgSend_initWithArray_(v94, v95, (uint64_t)v19, v96);
                  v98 = (void *)v9[11];
                  v9[11] = v97;

                  if (!v97) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v92, @"LumaLowVarDetailsLevel", v93))
                {
                  v101 = [GainValueArray alloc];
                  uint64_t v104 = objc_msgSend_initWithArray_(v101, v102, (uint64_t)v19, v103);
                  v105 = (void *)v9[12];
                  v9[12] = v104;

                  if (!v104) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v99, @"LumaDenoiseThresholdGainStaticScene", v100))
                {
                  v108 = [GainValueArray alloc];
                  uint64_t v111 = objc_msgSend_initWithArray_(v108, v109, (uint64_t)v19, v110);
                  v112 = (void *)v9[13];
                  v9[13] = v111;

                  if (!v111) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v106, @"LumaDenoiseMixingCoeffStaticScene", v107))
                {
                  v115 = [GainValueArray alloc];
                  uint64_t v118 = objc_msgSend_initWithArray_(v115, v116, (uint64_t)v19, v117);
                  v119 = (void *)v9[14];
                  v9[14] = v118;

                  if (!v118) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v113, @"LumaSharpeningScalingOnSkinStaticScene", v114))
                {
                  v122 = [GainValueArray alloc];
                  uint64_t v125 = objc_msgSend_initWithArray_(v122, v123, (uint64_t)v19, v124);
                  v126 = (void *)v9[15];
                  v9[15] = v125;

                  if (!v125) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v120, @"LumaDenoisingScalingOnSkinStaticScene", v121))
                {
                  v129 = [GainValueArray alloc];
                  uint64_t v132 = objc_msgSend_initWithArray_(v129, v130, (uint64_t)v19, v131);
                  v133 = (void *)v9[16];
                  v9[16] = v132;

                  if (!v132) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v127, @"Luma3x3SharpeningStrengthStaticScene", v128))
                {
                  v136 = [GainValueArray alloc];
                  uint64_t v139 = objc_msgSend_initWithArray_(v136, v137, (uint64_t)v19, v138);
                  v140 = (void *)v9[10];
                  v9[10] = v139;

                  if (!v139) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v134, @"LumaLowVarSharpeningStrengthStaticScene", v135))
                {
                  v143 = [GainValueArray alloc];
                  uint64_t v146 = objc_msgSend_initWithArray_(v143, v144, (uint64_t)v19, v145);
                  v147 = (void *)v9[18];
                  v9[18] = v146;

                  if (!v146) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v141, @"LumaLowVarDetailsLevelStaticScene", v142))
                {
                  v150 = [GainValueArray alloc];
                  uint64_t v153 = objc_msgSend_initWithArray_(v150, v151, (uint64_t)v19, v152);
                  v154 = (void *)v9[19];
                  v9[19] = v153;

                  if (!v153) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v148, @"FlatnessBoost", v149))
                {
                  v157 = [GainValueArray alloc];
                  uint64_t v160 = objc_msgSend_initWithArray_(v157, v158, (uint64_t)v19, v159);
                  v161 = (void *)v9[20];
                  v9[20] = v160;

                  if (!v160) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v155, @"FlatnessThreshold", v156))
                {
                  v164 = [GainValueArray alloc];
                  uint64_t v167 = objc_msgSend_initWithArray_(v164, v165, (uint64_t)v19, v166);
                  v168 = (void *)v9[21];
                  v9[21] = v167;

                  if (!v167) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v162, @"GdFlatnessBoostMidtone", v163))
                {
                  v171 = [GainValueArray alloc];
                  uint64_t v174 = objc_msgSend_initWithArray_(v171, v172, (uint64_t)v19, v173);
                  v175 = (void *)v9[22];
                  v9[22] = v174;

                  if (!v174) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v169, @"GdFlatnessMidtoneValue", v170))
                {
                  v178 = [GainValueArray alloc];
                  uint64_t v181 = objc_msgSend_initWithArray_(v178, v179, (uint64_t)v19, v180);
                  v182 = (void *)v9[23];
                  v9[23] = v181;

                  if (!v181) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v176, @"GdFlatnessBoostShadow", v177))
                {
                  v185 = [GainValueArray alloc];
                  uint64_t v188 = objc_msgSend_initWithArray_(v185, v186, (uint64_t)v19, v187);
                  v189 = (void *)v9[24];
                  v9[24] = v188;

                  if (!v188) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v183, @"GdFlatnessBoostHighlight", v184))
                {
                  v192 = [GainValueArray alloc];
                  uint64_t v195 = objc_msgSend_initWithArray_(v192, v193, (uint64_t)v19, v194);
                  v196 = (void *)v9[25];
                  v9[25] = v195;

                  if (!v195) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v190, @"GdTexturenessThresholdLow", v191))
                {
                  v199 = [GainValueArray alloc];
                  uint64_t v202 = objc_msgSend_initWithArray_(v199, v200, (uint64_t)v19, v201);
                  v203 = (void *)v9[26];
                  v9[26] = v202;

                  if (!v202) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v197, @"GdTexturenessThresholdHigh", v198))
                {
                  v206 = [GainValueArray alloc];
                  uint64_t v209 = objc_msgSend_initWithArray_(v206, v207, (uint64_t)v19, v208);
                  v210 = (void *)v9[27];
                  v9[27] = v209;

                  if (!v209) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v204, @"GdTexturenessShadingFactor", v205))
                {
                  v213 = [GainValueArray alloc];
                  uint64_t v216 = objc_msgSend_initWithArray_(v213, v214, (uint64_t)v19, v215);
                  v217 = (void *)v9[28];
                  v9[28] = v216;

                  if (!v216) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v211, @"RadialFlatnessBoost", v212))
                {
                  v220 = [GainValueArray alloc];
                  uint64_t v223 = objc_msgSend_initWithArray_(v220, v221, (uint64_t)v19, v222);
                  v224 = (void *)v9[29];
                  v9[29] = v223;

                  if (!v223) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v218, @"RadialSharpnessBoost", v219))
                {
                  v227 = [GainValueArray alloc];
                  uint64_t v230 = objc_msgSend_initWithArray_(v227, v228, (uint64_t)v19, v229);
                  v231 = (void *)v9[30];
                  v9[30] = v230;

                  if (!v230) {
                    goto LABEL_111;
                  }
                }
                else if (objc_msgSend_isEqualToString_(v18, v225, @"BlueBoost", v226))
                {
                  v232 = [GainValueArray alloc];
                  uint64_t v235 = objc_msgSend_initWithArray_(v232, v233, (uint64_t)v19, v234);
                  v236 = (void *)v9[31];
                  v9[31] = v235;

                  if (!v235)
                  {
LABEL_111:
                    FigDebugAssert3();

                    int v240 = -1;
                    v5 = v242;
                    goto LABEL_112;
                  }
                }
              }
              uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v248, (uint64_t)v256, 16);
              if (v15) {
                continue;
              }
              break;
            }
          }

          objc_msgSend_addObject_(self->tuningParameters->bands, v237, (uint64_t)v9, v238);
          uint64_t v7 = v247 + 1;
        }
        while (v247 + 1 != v243);
        int v240 = 0;
        v5 = v242;
        uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v239, (uint64_t)&v252, (uint64_t)v257, 16);
      }
      while (v243);
    }
    else
    {
      int v240 = 0;
    }
LABEL_112:
  }
  else
  {
    int v240 = FigSignalErrorAt();
  }

  return v240;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"TuningParameters", v6);
  if (objc_msgSend_readBandData_(self, v8, (uint64_t)v7, v9))
  {
    FigDebugAssert3();
  }
  else
  {
    id v10 = [GainValueArray alloc];
    v13 = objc_msgSend_objectForKeyedSubscript_(v7, v11, @"EV0FrameDenoiseBoost", v12);
    uint64_t v16 = objc_msgSend_initWithArray_(v10, v14, (uint64_t)v13, v15);
    tuningParameters = self->tuningParameters;
    ev0FrameDenoiseBoost = tuningParameters->ev0FrameDenoiseBoost;
    tuningParameters->ev0FrameDenoiseBoost = (GainValueArray *)v16;

    if (!v16) {
      goto LABEL_21;
    }
    v19 = [GainValueArray alloc];
    v22 = objc_msgSend_objectForKeyedSubscript_(v7, v20, @"ShortFrameDenoiseBoost", v21);
    uint64_t v25 = objc_msgSend_initWithArray_(v19, v23, (uint64_t)v22, v24);
    uint64_t v26 = self->tuningParameters;
    shortFrameDenoiseBoost = v26->shortFrameDenoiseBoost;
    v26->shortFrameDenoiseBoost = (GainValueArray *)v25;

    if (!v25) {
      goto LABEL_21;
    }
    v28 = [GainValueArray alloc];
    v31 = objc_msgSend_objectForKeyedSubscript_(v7, v29, @"LowFusionNoiseBoost", v30);
    uint64_t v34 = objc_msgSend_initWithArray_(v28, v32, (uint64_t)v31, v33);
    v35 = self->tuningParameters;
    lowFusionNoiseBoost = v35->lowFusionNoiseBoost;
    v35->lowFusionNoiseBoost = (GainValueArray *)v34;

    if (!v34) {
      goto LABEL_21;
    }
    uint64_t v37 = [GainValueArray alloc];
    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v7, v38, @"LowFusionNoiseBoostPerFrame", v39);
    uint64_t v43 = objc_msgSend_initWithArray_(v37, v41, (uint64_t)v40, v42);
    uint64_t v44 = self->tuningParameters;
    lowFusionNoiseBoostPerFrame = v44->lowFusionNoiseBoostPerFrame;
    v44->lowFusionNoiseBoostPerFrame = (GainValueArray *)v43;

    if (!v43) {
      goto LABEL_21;
    }
    v46 = [GainValueArray alloc];
    v49 = objc_msgSend_objectForKeyedSubscript_(v7, v47, @"LensShadeFactor", v48);
    uint64_t v52 = objc_msgSend_initWithArray_(v46, v50, (uint64_t)v49, v51);
    v53 = self->tuningParameters;
    lensShadeFactor = v53->lensShadeFactor;
    v53->lensShadeFactor = (GainValueArray *)v52;

    if (!v52) {
      goto LABEL_21;
    }
    uint64_t v55 = [GainValueArray alloc];
    uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v7, v56, @"LoGOffsetRangeMax", v57);
    uint64_t v61 = objc_msgSend_initWithArray_(v55, v59, (uint64_t)v58, v60);
    uint64_t v62 = self->tuningParameters;
    loGOffsetRangeMax = v62->loGOffsetRangeMax;
    v62->loGOffsetRangeMax = (GainValueArray *)v61;

    if (!v61) {
      goto LABEL_21;
    }
    v64 = [GainValueArray alloc];
    v67 = objc_msgSend_objectForKeyedSubscript_(v7, v65, @"LoGOffsetScale", v66);
    uint64_t v70 = objc_msgSend_initWithArray_(v64, v68, (uint64_t)v67, v69);
    v71 = self->tuningParameters;
    loGOffsetScale = v71->loGOffsetScale;
    v71->loGOffsetScale = (GainValueArray *)v70;

    if (!v70)
    {
LABEL_21:
      FigDebugAssert3();
      LODWORD(v127) = -1;
      goto LABEL_19;
    }
    LODWORD(v74) = 1036831949;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v73, @"RadialDenoiseKneeStart", 0, v74);
    self->tuningParameters->radialDenoiseKneeStart = v75;
    LODWORD(v76) = 1061997773;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v77, @"RadialDenoiseKneeEnd", 0, v76);
    self->tuningParameters->radialDenoiseKneeEnd = v78;
    LODWORD(v79) = 1036831949;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v80, @"RadialSharpnessKneeStart", 0, v79);
    self->tuningParameters->radialSharpnessKneeStart = v81;
    LODWORD(v82) = 1061997773;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v83, @"RadialSharpnessKneeEnd", 0, v82);
    self->tuningParameters->radialSharpnessKneeEnd = v84;
    LODWORD(v85) = 1036831949;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v86, @"RadialTexturenessKneeStart", 0, v85);
    self->tuningParameters->radialTexturenessKneeStart = v87;
    LODWORD(v88) = 1061997773;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v7, v89, @"RadialTexturenessKneeEnd", 0, v88);
    self->tuningParameters->radialTexturenessKneeEnd = v90;
    self->enableLumaDenoiseSharpening = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v91, @"EnableLumaDenoiseSharpening", 0, 0);
    self->enableChromaDenoiseSharpening = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v92, @"EnableChromaDenoiseSharpening", 0, 0);
    self->enableBilateralRegression = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v93, @"EnableBilateralRegression", 0, 0);
    self->enableLowVarSharpening = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v94, @"EnableLowVarSharpening", 0, 0);
    self->enableGdFlatness = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v95, @"EnableGdFlatness", 0, 0);
    self->gdNumDir = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v4, v96, @"GDNumDir", 0, 0);
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v97, @"GDFlatnessThreshold", 0, 0.0);
    self->gdFlatnessThreshold = v98;
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v99, @"GDFilterSigma", 0, 0.0);
    self->gdFilterSigma = (int)v100;
    self->enableLoGOffset = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v101, @"EnableLoGOffset", 0, 0);
    self->enableOPC = objc_msgSend_cmi_BOOLValueForKey_defaultValue_found_(v4, v102, @"EnableOPC", 0, 0);
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v103, @"OPCThresholdGain", 0, 0.0);
    self->OPCThresholdGain = v104;
    uint64_t v107 = objc_msgSend_objectForKeyedSubscript_(v4, v105, @"SkinMaskDefaultValue", v106);

    if (v107) {
      objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v4, v108, @"SkinMaskDefaultValue", 0, 0.0);
    }
    else {
      float v110 = 1.0;
    }
    self->skinMaskDefaultValue = v110;
    uint64_t v111 = objc_msgSend_objectForKeyedSubscript_(v4, v108, @"BluenessCb", v109);

    if (v111)
    {
      uint64_t v114 = objc_msgSend_objectForKeyedSubscript_(v4, v112, @"BluenessCb", v113);
      objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v114, v115, @"start", 0, 0.0);
      self->bluenessCb.start = v116;

      v119 = objc_msgSend_objectForKeyedSubscript_(v4, v117, @"BluenessCb", v118);
      objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v119, v120, @"end", 0, 0.0);
      self->bluenessCb.end = v121;

      uint64_t v124 = objc_msgSend_objectForKeyedSubscript_(v4, v122, @"BluenessCb", v123);
      objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v124, v125, @"margin", 0, 0.0);
      self->bluenessCb.margin = v126;
    }
    else
    {
      *(void *)&self->bluenessCb.start = 0x3F8000003F266666;
      self->bluenessCb.margin = 0.05;
    }
    v127 = objc_msgSend_objectForKeyedSubscript_(v4, v112, @"BluenessCr", v113);

    if (!v127)
    {
      self->bluenessCr.start = 0.0;
      self->bluenessCr.end = 0.0;
      self->bluenessCr.margin = 0.6;
      goto LABEL_19;
    }
    v130 = objc_msgSend_objectForKeyedSubscript_(v4, v128, @"BluenessCr", v129);
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v130, v131, @"start", 0, 0.0);
    self->bluenessCr.start = v132;

    uint64_t v135 = objc_msgSend_objectForKeyedSubscript_(v4, v133, @"BluenessCr", v134);
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v135, v136, @"end", 0, 0.0);
    self->bluenessCr.end = v137;

    v140 = objc_msgSend_objectForKeyedSubscript_(v4, v138, @"BluenessCr", v139);
    objc_msgSend_cmi_floatValueForKey_defaultValue_found_(v140, v141, @"margin", 0, 0.0);
    self->bluenessCr.margin = v142;
  }
  LODWORD(v127) = 0;
LABEL_19:

  return (int)v127;
}

- (void)applyOverrides
{
  if (dword_26B429790 <= 1) {
    self->enableBilateralRegression = dword_26B429790 == 1;
  }
  if (dword_26B429794 <= 1) {
    self->enableLowVarSharpening = dword_26B429794 == 1;
  }
}

- (void).cxx_destruct
{
}

@end