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
  long long v36 = *(_OWORD *)"fff?";
  *(_OWORD *)&v37[8] = xmmword_263480930;
  *(_OWORD *)&v37[24] = xmmword_2634808B0;
  *(_OWORD *)&v37[40] = unk_2634808C0;
  *(void *)v37 = 1022739087;
  *(void *)&v37[56] = 0x3A03126F00000000;
  long long v16 = *(_OWORD *)&v37[32];
  long long v17 = *(_OWORD *)&v37[48];
  long long v15 = *(_OWORD *)&v37[16];
  long long v13 = *(_OWORD *)"fff?";
  long long v14 = *(_OWORD *)v37;
  uint64_t v35 = 1045220557;
  long long v34 = xmmword_263480918;
  char v9 = 0;
  __int16 v8 = 0;
  long long v19 = xmmword_2634808D8;
  int v20 = 953267991;
  int v21 = 0;
  uint64_t v24 = 0x3EA8F5C33B449BA6;
  long long v23 = unk_263480900;
  long long v22 = xmmword_2634808F0;
  char v7 = 0;
  uint64_t v10 = 0x3A83126F3F000000;
  int v11 = 1036831949;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v12 = _D0;
  uint64_t v18 = 0x3CA3D70A3C23D70ALL;
  uint64_t v25 = 0x3ECCCCCD3E4CCCCDLL;
  uint64_t v26 = 0x300000001;
  uint64_t v28 = 0x3F0000003DCCCCCDLL;
  int v27 = 1;
  int v29 = 0;
  uint64_t v30 = 0x3B449BA63B03126FLL;
  uint64_t v31 = 0x3C23D70A3CA3D70ALL;
  uint64_t v32 = 0x3B03126F3A83126FLL;
  uint64_t v33 = 0x3D4CCCCD3D23D70ALL;
  [(GreenGhostLowLightTuningParams *)self setTuningParams:&v7];
}

- (GreenGhostLowLightTuningParams)init
{
  v4.receiver = self;
  v4.super_class = (Class)GreenGhostLowLightTuningParams;
  v2 = [(CMITuningPlist *)&v4 init];
  [(GreenGhostLowLightTuningParams *)v2 setDefaultTuningParams];
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v160.receiver = self;
  v160.super_class = (Class)GreenGhostLowLightTuningParams;
  [(CMITuningPlist *)&v160 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"faceBoundaryPaddingRatio"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 count] != 2)
  {
    int v157 = -73364;
LABEL_88:
    FigDebugAssert3();
    goto LABEL_70;
  }
  v6 = [v5 objectAtIndexedSubscript:0];
  [v6 floatValue];
  p_tuningParams = &self->_tuningParams;
  LODWORD(self[1].super.super.isa) = v8;

  char v9 = [v5 objectAtIndexedSubscript:1];
  [v9 floatValue];
  p_tuningParams[1].blurThreshold = v10;

  int v11 = [v4 objectForKeyedSubscript:@"enabled"];

  if (!v11)
  {
    int v157 = -73364;
    goto LABEL_88;
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"enabled"];
  p_tuningParams->enabled = [v12 BOOLValue];

  long long v13 = [v4 objectForKeyedSubscript:@"blurThreshold"];

  if (!v13)
  {
    int v157 = -73364;
    goto LABEL_88;
  }
  long long v14 = [v4 objectForKeyedSubscript:@"blurThreshold"];
  [v14 floatValue];
  p_tuningParams->blurThreshold = v15;

  long long v16 = [v4 objectForKeyedSubscript:@"maxMaskAverage"];

  if (!v16)
  {
    int v157 = -73364;
    goto LABEL_88;
  }
  long long v17 = [v4 objectForKeyedSubscript:@"maxMaskAverage"];
  [v17 floatValue];
  p_tuningParams->maxMaskAverage = v18;

  long long v19 = [v4 objectForKeyedSubscript:@"greenGhostThreshold"];

  if (!v19)
  {
    int v157 = -73364;
    goto LABEL_88;
  }
  int v20 = [v4 objectForKeyedSubscript:@"greenGhostThreshold"];
  [v20 floatValue];
  p_tuningParams->greenGhostThreshold = v21;

  long long v22 = [v4 objectForKeyedSubscript:@"detection"];
  if (!v22)
  {
    FigDebugAssert3();
LABEL_118:
    int v157 = -73362;
    goto LABEL_70;
  }
  long long v23 = v22;
  uint64_t v24 = [v22 objectForKeyedSubscript:@"brightness"];
  uint64_t v25 = v24;
  if (!v24) {
    goto LABEL_96;
  }
  uint64_t v26 = [v24 objectForKeyedSubscript:@"threshold"];

  if (!v26)
  {
    int v157 = -73364;
LABEL_108:
    FigDebugAssert3();
    goto LABEL_131;
  }
  int v27 = [v25 objectForKeyedSubscript:@"threshold"];
  [v27 floatValue];
  p_tuningParams[1].maxMaskAverage = v28;

  int v29 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v29)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  uint64_t v30 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v30 floatValue];
  p_tuningParams[2].maxMaskAverage = v31;

  uint64_t v32 = [v25 objectForKeyedSubscript:@"erosionNormalizedRadius"];

  if (!v32)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  uint64_t v33 = [v25 objectForKeyedSubscript:@"erosionNormalizedRadius"];
  [v33 floatValue];
  p_tuningParams[2].greenGhostThreshold = v34;

  uint64_t v35 = [v25 objectForKeyedSubscript:@"normalizedOpticalCenter"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
LABEL_114:
    FigDebugAssert3();
LABEL_130:

    goto LABEL_131;
  }
  long long v36 = [v35 objectAtIndexedSubscript:0];
  [v36 floatValue];
  *(_DWORD *)&p_tuningParams[2].enabled = v37;

  v38 = [v35 objectAtIndexedSubscript:1];
  [v38 floatValue];
  p_tuningParams[2].blurThreshold = v39;

  v40 = [v23 objectForKeyedSubscript:@"blob"];
  uint64_t v25 = v40;
  if (!v40) {
    goto LABEL_96;
  }
  v41 = [v40 objectForKeyedSubscript:@"threshold"];

  if (!v41)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v42 = [v25 objectForKeyedSubscript:@"threshold"];
  [v42 floatValue];
  p_tuningParams[3].maxMaskAverage = v43;

  uint64_t v35 = [v25 objectForKeyedSubscript:@"radius"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v44 = [v35 objectAtIndexedSubscript:0];
  *(_DWORD *)&p_tuningParams[3].enabled = [v44 intValue];

  v45 = [v35 objectAtIndexedSubscript:1];
  LODWORD(p_tuningParams[3].blurThreshold) = [v45 intValue];

  v46 = [v23 objectForKeyedSubscript:@"green"];
  uint64_t v25 = v46;
  if (!v46)
  {
LABEL_96:
    FigDebugAssert3();
    int v157 = -73362;
LABEL_131:

    goto LABEL_70;
  }
  v47 = [v46 objectForKeyedSubscript:@"hueThreshold"];

  if (!v47)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v48 = [v25 objectForKeyedSubscript:@"hueThreshold"];
  [v48 floatValue];
  p_tuningParams[4].maxMaskAverage = v49;

  v50 = [v25 objectForKeyedSubscript:@"openingNormalizedRadius"];

  if (!v50)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v51 = [v25 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v51 floatValue];
  *(_DWORD *)&p_tuningParams[6].enabled = v52;

  v53 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v53)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v54 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v54 floatValue];
  p_tuningParams[6].blurThreshold = v55;

  uint64_t v35 = [v25 objectForKeyedSubscript:@"hueRange"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v56 = [v35 objectAtIndexedSubscript:0];
  [v56 floatValue];
  *(_DWORD *)&p_tuningParams[4].enabled = v57;

  v58 = [v35 objectAtIndexedSubscript:1];
  [v58 floatValue];
  p_tuningParams[4].blurThreshold = v59;

  uint64_t v35 = [v25 objectForKeyedSubscript:@"saturationThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v60 = [v35 objectAtIndexedSubscript:0];
  [v60 floatValue];
  *(_DWORD *)&p_tuningParams[5].enabled = v61;

  v62 = [v35 objectAtIndexedSubscript:1];
  [v62 floatValue];
  p_tuningParams[5].blurThreshold = v63;

  uint64_t v35 = [v25 objectForKeyedSubscript:@"valueThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v64 = [v35 objectAtIndexedSubscript:0];
  [v64 floatValue];
  p_tuningParams[5].maxMaskAverage = v65;

  v66 = [v35 objectAtIndexedSubscript:1];
  [v66 floatValue];
  p_tuningParams[5].greenGhostThreshold = v67;

  v68 = [v23 objectForKeyedSubscript:@"multiBandDetection"];
  if (!v68)
  {
LABEL_102:
    FigDebugAssert3();
LABEL_117:

    goto LABEL_118;
  }
  uint64_t v25 = v68;
  uint64_t v35 = [v68 objectForKeyedSubscript:@"tmpVarThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v35 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v69 = [v35 objectAtIndexedSubscript:0];
  [v69 floatValue];
  p_tuningParams[6].maxMaskAverage = v70;

  v71 = [v35 objectAtIndexedSubscript:1];
  [v71 floatValue];
  p_tuningParams[6].greenGhostThreshold = v72;

  v73 = [v4 objectForKeyedSubscript:@"refinement"];
  if (!v73) {
    goto LABEL_102;
  }
  uint64_t v25 = v73;
  v74 = [v73 objectForKeyedSubscript:@"guidedFilterRadius"];

  if (!v74)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v75 = [v25 objectForKeyedSubscript:@"guidedFilterRadius"];
  *(_DWORD *)&p_tuningParams[7].enabled = [v75 unsignedIntValue];

  v76 = [v25 objectForKeyedSubscript:@"guidedFilterGuideRange"];

  if (!v76)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v77 = [v25 objectForKeyedSubscript:@"guidedFilterGuideRange"];
  [v77 floatValue];
  p_tuningParams[7].blurThreshold = v78;

  v79 = [v25 objectForKeyedSubscript:@"guidedFilterThreshold"];

  if (!v79)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v80 = [v25 objectForKeyedSubscript:@"guidedFilterThreshold"];
  [v80 floatValue];
  p_tuningParams[7].maxMaskAverage = v81;

  v82 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v82)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v83 = [v25 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v83 floatValue];
  p_tuningParams[7].greenGhostThreshold = v84;

  v85 = [v25 objectForKeyedSubscript:@"maskSurroundThreshold"];

  if (!v85)
  {
    int v157 = -73364;
    goto LABEL_108;
  }
  v86 = [v25 objectForKeyedSubscript:@"maskSurroundThreshold"];
  [v86 floatValue];
  *(_DWORD *)&p_tuningParams[8].enabled = v87;

  v88 = [v4 objectForKeyedSubscript:@"fusion"];
  if (!v88)
  {
    FigDebugAssert3();
LABEL_116:

    goto LABEL_117;
  }
  uint64_t v35 = v88;
  v89 = [v88 objectForKeyedSubscript:@"neighborDiffFilterRadius"];
  LODWORD(p_tuningParams[8].maxMaskAverage) = [v89 unsignedIntValue];

  v90 = [v35 objectForKeyedSubscript:@"neighborDifferenceThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v90 count] != 2)
  {
    int v157 = -73364;
LABEL_124:
    FigDebugAssert3();
LABEL_129:

    goto LABEL_130;
  }
  v91 = [v90 objectAtIndexedSubscript:0];
  [v91 floatValue];
  *(_DWORD *)&p_tuningParams[9].enabled = v92;

  v93 = [v90 objectAtIndexedSubscript:1];
  [v93 floatValue];
  p_tuningParams[9].blurThreshold = v94;

  v90 = [v35 objectForKeyedSubscript:@"greenProbabilityThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v90 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v95 = [v90 objectAtIndexedSubscript:0];
  [v95 floatValue];
  p_tuningParams[9].maxMaskAverage = v96;

  v97 = [v90 objectAtIndexedSubscript:1];
  [v97 floatValue];
  p_tuningParams[9].greenGhostThreshold = v98;

  v99 = [v35 objectForKeyedSubscript:@"fusionWeightErosionNormalizedRadius"];

  if (!v99)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v100 = [v35 objectForKeyedSubscript:@"fusionWeightErosionNormalizedRadius"];
  [v100 floatValue];
  *(_DWORD *)&p_tuningParams[10].enabled = v101;

  v102 = [v35 objectForKeyedSubscript:@"fusionWeightBlurRadius"];

  if (!v102)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v103 = [v35 objectForKeyedSubscript:@"fusionWeightBlurRadius"];
  LODWORD(p_tuningParams[10].blurThreshold) = [v103 unsignedIntValue];

  v104 = [v35 objectForKeyedSubscript:@"postFusionErosionNormalizedRadius"];

  if (!v104)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v105 = [v35 objectForKeyedSubscript:@"postFusionErosionNormalizedRadius"];
  [v105 floatValue];
  p_tuningParams[10].maxMaskAverage = v106;

  v107 = [v35 objectForKeyedSubscript:@"postFusionReferenceWeight"];

  if (!v107)
  {
    int v157 = -73364;
    goto LABEL_114;
  }
  v108 = [v35 objectForKeyedSubscript:@"postFusionReferenceWeight"];
  [v108 floatValue];
  p_tuningParams[10].greenGhostThreshold = v109;

  v110 = [v4 objectForKeyedSubscript:@"inpaint"];
  if (!v110)
  {
    FigDebugAssert3();

    goto LABEL_116;
  }
  v90 = v110;
  v111 = [v110 objectForKeyedSubscript:@"postFusionMaskThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v111 count] != 2)
  {
    int v157 = -73364;
LABEL_127:
    FigDebugAssert3();
    goto LABEL_128;
  }
  v112 = [v111 objectAtIndexedSubscript:0];
  [v112 floatValue];
  *(_DWORD *)&p_tuningParams[11].enabled = v113;

  v114 = [v111 objectAtIndexedSubscript:1];
  [v114 floatValue];
  p_tuningParams[11].blurThreshold = v115;

  v116 = [v90 objectForKeyedSubscript:@"postFusionMaskDilateRadius"];

  if (!v116)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v117 = [v90 objectForKeyedSubscript:@"postFusionMaskDilateRadius"];
  LODWORD(p_tuningParams[11].maxMaskAverage) = [v117 unsignedIntValue];

  v118 = [v90 objectForKeyedSubscript:@"propagatedLumaBlurRadius"];

  if (!v118)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v119 = [v90 objectForKeyedSubscript:@"propagatedLumaBlurRadius"];
  LODWORD(p_tuningParams[11].greenGhostThreshold) = [v119 unsignedIntValue];

  v120 = [v90 objectForKeyedSubscript:@"maskBlurRadius"];

  if (!v120)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v121 = [v90 objectForKeyedSubscript:@"maskBlurRadius"];
  *(_DWORD *)&p_tuningParams[12].enabled = [v121 unsignedIntValue];

  v122 = [v90 objectForKeyedSubscript:@"darknessTolerance"];

  if (!v122)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v123 = [v90 objectForKeyedSubscript:@"darknessTolerance"];
  [v123 floatValue];
  p_tuningParams[12].blurThreshold = v124;

  v125 = [v90 objectForKeyedSubscript:@"lumaScale"];

  if (!v125)
  {
    int v157 = -73364;
    goto LABEL_124;
  }
  v126 = [v90 objectForKeyedSubscript:@"lumaScale"];
  [v126 floatValue];
  p_tuningParams[12].maxMaskAverage = v127;

  v111 = [v90 objectForKeyedSubscript:@"gradientThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v111 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_127;
  }
  v128 = [v111 objectAtIndexedSubscript:0];
  [v128 floatValue];
  *(_DWORD *)&p_tuningParams[13].enabled = v129;

  v130 = [v111 objectAtIndexedSubscript:1];
  [v130 floatValue];
  p_tuningParams[13].blurThreshold = v131;

  v111 = [v90 objectForKeyedSubscript:@"detailScales"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v111 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_127;
  }
  v132 = [v111 objectAtIndexedSubscript:0];
  [v132 floatValue];
  p_tuningParams[13].maxMaskAverage = v133;

  v134 = [v111 objectAtIndexedSubscript:1];
  [v134 floatValue];
  p_tuningParams[13].greenGhostThreshold = v135;

  v111 = [v90 objectForKeyedSubscript:@"detailBiases"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v111 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_127;
  }
  v136 = [v111 objectAtIndexedSubscript:0];
  [v136 floatValue];
  *(_DWORD *)&p_tuningParams[14].enabled = v137;

  v138 = [v111 objectAtIndexedSubscript:1];
  [v138 floatValue];
  p_tuningParams[14].blurThreshold = v139;

  v111 = [v90 objectForKeyedSubscript:@"detailThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v111 count] != 2)
  {
    int v157 = -73364;
    goto LABEL_127;
  }
  v140 = [v111 objectAtIndexedSubscript:0];
  [v140 floatValue];
  p_tuningParams[14].maxMaskAverage = v141;

  v142 = [v111 objectAtIndexedSubscript:1];
  [v142 floatValue];
  p_tuningParams[14].greenGhostThreshold = v143;

  v144 = [v90 objectForKeyedSubscript:@"sharpening"];
  v111 = v144;
  if (!v144)
  {
    FigDebugAssert3();
    int v157 = -73362;
LABEL_128:

    goto LABEL_129;
  }
  v145 = [v144 objectForKeyedSubscript:@"strength"];

  if (!v145)
  {
    int v157 = -73364;
    goto LABEL_127;
  }
  id v159 = v4;
  v146 = v5;
  v147 = [v111 objectForKeyedSubscript:@"strength"];
  [v147 floatValue];
  *(_DWORD *)&p_tuningParams[16].enabled = v148;

  v149 = [v111 objectForKeyedSubscript:@"shift"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v149 count] != 2)
  {
    int v157 = -73364;
    FigDebugAssert3();

    v5 = v146;
    id v4 = v159;
    goto LABEL_128;
  }
  v150 = [v149 objectAtIndexedSubscript:0];
  *(_DWORD *)&p_tuningParams[15].enabled = [v150 intValue];

  v151 = [v149 objectAtIndexedSubscript:1];
  LODWORD(p_tuningParams[15].blurThreshold) = [v151 intValue];

  v152 = [v111 objectForKeyedSubscript:@"thresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v152 count] == 2)
  {
    v153 = [v152 objectAtIndexedSubscript:0];
    [v153 floatValue];
    p_tuningParams[15].maxMaskAverage = v154;

    v155 = [v152 objectAtIndexedSubscript:1];
    [v155 floatValue];
    p_tuningParams[15].greenGhostThreshold = v156;

    int v157 = 0;
  }
  else
  {
    int v157 = -73364;
    FigDebugAssert3();
  }
  v5 = v146;
  id v4 = v159;
LABEL_70:

  return v157;
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