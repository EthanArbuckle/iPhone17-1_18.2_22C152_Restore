@interface VideoDefringingTuningParameters
+ ($6B6A6628744B4DF06B73A717F4EE0DD2)defaultRadialParams:(SEL)a3;
+ ($B5339CD3011AE9733252D32A415F0BF1)defaultCorrectionParams:(SEL)a3;
+ ($E2C29196C7A5C696474C6955C5A9CE06)defaultLUTParams:(unint64_t)a3;
+ (BOOL)_validateTuning:(id)a3 mode:(unint64_t)a4 parameterKey:(id)a5;
+ (id)_tuningHeaderForMode:(unint64_t)a3;
+ (id)defaultTuningDictionary;
- ($6B6A6628744B4DF06B73A717F4EE0DD2)radialParams;
- ($B5339CD3011AE9733252D32A415F0BF1)correctionParams;
- ($E2C29196C7A5C696474C6955C5A9CE06)desaturationParams;
- (BOOL)defringingEnabled;
- (VideoDefringingTuningParameters)initWithTuningParameters:(id)a3;
- (int)_parseCorrectionTuning:(id)a3;
- (int)_parseDesaturateTuning:(id)a3;
- (int)_parseRadialTuning:(id)a3;
- (int)selectParametersForTuningMode:(unint64_t)a3;
- (void)setDefaults;
- (void)setMetadataGain:(float)a3 exposureTime:(float)a4 AWBRGain:(float)a5 AWBBGain:(float)a6;
- (void)setRadialParamsForWidth:(unint64_t)a3 height:(unint64_t)a4;
@end

@implementation VideoDefringingTuningParameters

+ (BOOL)_validateTuning:(id)a3 mode:(unint64_t)a4 parameterKey:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
LABEL_19:
    id v14 = 0;
    goto LABEL_20;
  }
  v9 = +[VideoDefringingTuningParameters _tuningHeaderForMode:a4];
  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  v10 = +[VideoDefringingTuningParameters defaultTuningDictionary];
  v11 = [v10 objectForKeyedSubscript:v9];
  v12 = [v11 objectForKeyedSubscript:v8];
  v13 = [v12 allKeys];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = 0;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];

        if (!v20) {
          int v17 = -12780;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);

    if (v17)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_20:
      BOOL v21 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  BOOL v21 = 0;
LABEL_16:

  return v21;
}

+ (id)defaultTuningDictionary
{
  if (defaultTuningDictionary_onceToken != -1) {
    dispatch_once(&defaultTuningDictionary_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)defaultTuningDictionary_defaultTuning;

  return v2;
}

+ (id)_tuningHeaderForMode:(unint64_t)a3
{
  if (a3 < 3) {
    return off_2655C81D0[a3];
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)_parseRadialTuning:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"RadialParameters"];
  if (+[VideoDefringingTuningParameters _validateTuning:v4 mode:self->_mode parameterKey:@"RadialParameters"]|| self->_mode > 2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = -12780;
  }
  else
  {
    v5 = [v4 objectForKeyedSubscript:@"a0"];
    [v5 floatValue];
    self->_radialParams.a0 = v6;

    id v7 = [v4 objectForKeyedSubscript:@"a1"];
    [v7 floatValue];
    self->_radialParams.a1 = v8;

    v9 = [v4 objectForKeyedSubscript:@"a2"];
    [v9 floatValue];
    self->_radialParams.a2 = v10;

    v11 = [v4 objectForKeyedSubscript:@"a3"];
    [v11 floatValue];
    self->_radialParams.a3 = v12;

    *($9CD6598CF841B8A0CBD7113FC0CCF29C *)self->_anon_40 = self->_radialParams;
    v13 = [v4 objectForKeyedSubscript:@"MinCoefficient"];
    [v13 floatValue];
    *(_DWORD *)&self->_anon_40[36] = v14;

    int v15 = 0;
  }

  return v15;
}

- (int)_parseCorrectionTuning:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"CorrectionParameters"];
  int v5 = +[VideoDefringingTuningParameters _validateTuning:v4 mode:self->_mode parameterKey:@"CorrectionParameters"];
  if (v5) {
    goto LABEL_9;
  }
  unint64_t mode = self->_mode;
  if (mode)
  {
    if (mode == 1)
    {
      int v5 = 0;
      goto LABEL_15;
    }
    if (mode == 2)
    {
      id v7 = [v4 objectForKeyedSubscript:@"MaxChroma"];
      [v7 floatValue];
      self->_correctionParams.max_chroma = v8;

      v9 = [v4 objectForKeyedSubscript:@"BlueTh0"];
      [v9 floatValue];
      self->_correctionParams.blueTh0 = v10;

      v11 = [v4 objectForKeyedSubscript:@"BlueTh1"];
      [v11 floatValue];
      self->_correctionParams.blueTh1 = v12;

      v13 = [v4 objectForKeyedSubscript:@"BlueCrTh0"];
      [v13 floatValue];
      self->_correctionParams.blueCrTh0 = v14;

      int v15 = [v4 objectForKeyedSubscript:@"ContrastTh0"];
      [v15 floatValue];
      self->_correctionParams.contrastTh0 = v16;

      int v17 = [v4 objectForKeyedSubscript:@"ContrastTh1"];
      [v17 floatValue];
      self->_correctionParams.contrastTh1 = v18;

      v19 = [v4 objectForKeyedSubscript:@"DarknessTh0"];
      [v19 floatValue];
      self->_correctionParams.darknessTh0 = v20;

      BOOL v21 = [v4 objectForKeyedSubscript:@"DarknessTh1"];
      [v21 floatValue];
      self->_correctionParams.darknessTh1 = v22;

      long long v23 = [v4 objectForKeyedSubscript:@"PbrightnessTh0"];
      [v23 floatValue];
      self->_correctionParams.pbrightnessTh0 = v24;

      long long v25 = [v4 objectForKeyedSubscript:@"PbrightnessTh1"];
      [v25 floatValue];
      self->_correctionParams.pbrightnessTh1 = v26;

      v27 = [v4 objectForKeyedSubscript:@"BlueBrightThr0"];
      [v27 floatValue];
      self->_correctionParams.blueBrightThr0 = v28;

      v29 = [v4 objectForKeyedSubscript:@"BlueBrightThr1"];
      [v29 floatValue];
      self->_correctionParams.blueBrightThr1 = v30;

      v31 = [v4 objectForKeyedSubscript:@"ColorfullThr0"];
      [v31 floatValue];
      self->_correctionParams.colorfullThr0 = v32;

      v33 = [v4 objectForKeyedSubscript:@"ColorfullThr1"];
      [v33 floatValue];
      self->_correctionParams.colorfullThr1 = v34;

      v35 = [v4 objectForKeyedSubscript:@"ColorfullPThr0"];
      [v35 floatValue];
      self->_correctionParams.colorfull_PThr0 = v36;

      v37 = [v4 objectForKeyedSubscript:@"ColorfullPThr1"];
      [v37 floatValue];
      self->_correctionParams.colorfull_PThr1 = v38;

      v39 = [v4 objectForKeyedSubscript:@"BlueCrThr0"];
      [v39 floatValue];
      self->_correctionParams.blueCrThr0 = v40;

      v41 = [v4 objectForKeyedSubscript:@"BlueCrThr1"];
      [v41 floatValue];
      self->_correctionParams.blueCrThr1 = v42;

      v43 = [v4 objectForKeyedSubscript:@"DarkBlueCbThr0"];
      [v43 floatValue];
      self->_correctionParams.darkBlue_CbThr0 = v44;

      v45 = [v4 objectForKeyedSubscript:@"DarkBlueCbThr1"];
      [v45 floatValue];
      self->_correctionParams.darkBlue_CbThr1 = v46;

      v47 = [v4 objectForKeyedSubscript:@"SkyBlueYThr0"];
      [v47 floatValue];
      self->_correctionParams.skyBlue_YThr0 = v48;

      v49 = [v4 objectForKeyedSubscript:@"SkyBlueYThr1"];
      [v49 floatValue];
      self->_correctionParams.skyBlue_YThr1 = v50;

      v51 = [v4 objectForKeyedSubscript:@"SkyBlueCbThr0"];
      [v51 floatValue];
      self->_correctionParams.skyBlue_CbThr0 = v52;

      v53 = [v4 objectForKeyedSubscript:@"SkyBlueCbThr1"];
      [v53 floatValue];
      self->_correctionParams.skyBlue_CbThr1 = v54;

      v55 = [v4 objectForKeyedSubscript:@"SkyBluePThr0"];
      [v55 floatValue];
      self->_correctionParams.skyBlue_PThr0 = v56;

      v57 = [v4 objectForKeyedSubscript:@"SkyBluePThr1"];
      [v57 floatValue];
      self->_correctionParams.skyBlue_PThr1 = v58;

      v59 = [v4 objectForKeyedSubscript:@"FiltThr"];
      [v59 floatValue];
      self->_correctionParams.filtThr = v60;

      goto LABEL_6;
    }
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v5 = -12780;
    goto LABEL_15;
  }
LABEL_6:
  v61 = [v4 objectForKeyedSubscript:@"RadialScale"];
  [v61 floatValue];
  self->_correctionParams.radialScale = v62;

  v63 = [v4 objectForKeyedSubscript:@"RadialR0"];
  [v63 floatValue];
  self->_correctionParams.radialR0 = v64;

  v65 = [v4 objectForKeyedSubscript:@"RadialR1"];
  [v65 floatValue];
  self->_correctionParams.radialR1 = v66;

  v67 = [v4 objectForKeyedSubscript:@"RadialF0"];
  [v67 floatValue];
  self->_correctionParams.radialF0 = v68;

  v69 = [v4 objectForKeyedSubscript:@"RadialF1"];
  [v69 floatValue];
  self->_correctionParams.radialF1 = v70;

  v71 = [v4 objectForKeyedSubscript:@"RadialF2"];
  [v71 floatValue];
  self->_correctionParams.radialF2 = v72;

  v73 = [v4 objectForKeyedSubscript:@"RadialFXScaleFactorByQuadraBinningFactor"];
  if (v73)
  {
    v74 = [v4 objectForKeyedSubscript:@"RadialFXScaleFactorByQuadraBinningFactor"];
  }
  else
  {
    v74 = &unk_270E97E70;
  }

  if ([v74 count])
  {
    unint64_t v75 = 0;
    do
    {
      v76 = [v74 objectAtIndexedSubscript:v75];
      [v76 floatValue];
      self->_correctionParams.radialFXScaleFactorByQuadraBinningFactor[v75] = v77;

      ++v75;
    }
    while (v75 < [v74 count]);
  }

  v78 = [v4 objectForKeyedSubscript:@"MaxChroma"];
  [v78 floatValue];
  self->_correctionParams.max_chroma = v79;

  v80 = [v4 objectForKeyedSubscript:@"BlueTh0"];
  [v80 floatValue];
  self->_correctionParams.blueTh0 = v81;

  v82 = [v4 objectForKeyedSubscript:@"BlueTh1"];
  [v82 floatValue];
  self->_correctionParams.blueTh1 = v83;

  v84 = [v4 objectForKeyedSubscript:@"BlueCrTh0"];
  [v84 floatValue];
  self->_correctionParams.blueCrTh0 = v85;

  v86 = [v4 objectForKeyedSubscript:@"BrightnessTh0"];
  [v86 floatValue];
  self->_correctionParams.brightnessTh0 = v87;

  v88 = [v4 objectForKeyedSubscript:@"BrightnessTh1"];
  [v88 floatValue];
  self->_correctionParams.brightnessTh1 = v89;

  v90 = [v4 objectForKeyedSubscript:@"ContrastTh0"];
  [v90 floatValue];
  self->_correctionParams.contrastTh0 = v91;

  v92 = [v4 objectForKeyedSubscript:@"ContrastTh1"];
  [v92 floatValue];
  self->_correctionParams.contrastTh1 = v93;

  v94 = [v4 objectForKeyedSubscript:@"DarknessTh0"];
  [v94 floatValue];
  self->_correctionParams.darknessTh0 = v95;

  v96 = [v4 objectForKeyedSubscript:@"DarknessTh1"];
  [v96 floatValue];
  self->_correctionParams.darknessTh1 = v97;

  v98 = [v4 objectForKeyedSubscript:@"LumaKnee"];
  [v98 floatValue];
  self->_correctionParams.luma_knee = v99;

  v100 = [v4 objectForKeyedSubscript:@"LumaAmp"];
  [v100 floatValue];
  self->_correctionParams.luma_amp = v101;

  v102 = [v4 objectForKeyedSubscript:@"PbrightnessTh0"];
  [v102 floatValue];
  self->_correctionParams.pbrightnessTh0 = v103;

  v104 = [v4 objectForKeyedSubscript:@"PbrightnessTh1"];
  [v104 floatValue];
  self->_correctionParams.pbrightnessTh1 = v105;

  v106 = [v4 objectForKeyedSubscript:@"BlueBrightThr0"];
  [v106 floatValue];
  self->_correctionParams.blueBrightThr0 = v107;

  v108 = [v4 objectForKeyedSubscript:@"BlueBrightThr1"];
  [v108 floatValue];
  self->_correctionParams.blueBrightThr1 = v109;

  v110 = [v4 objectForKeyedSubscript:@"ColorfullThr0"];
  [v110 floatValue];
  self->_correctionParams.colorfullThr0 = v111;

  v112 = [v4 objectForKeyedSubscript:@"ColorfullThr1"];
  [v112 floatValue];
  self->_correctionParams.colorfullThr1 = v113;

  v114 = [v4 objectForKeyedSubscript:@"ColorfullPThr0"];
  [v114 floatValue];
  self->_correctionParams.colorfull_PThr0 = v115;

  v116 = [v4 objectForKeyedSubscript:@"ColorfullPThr1"];
  [v116 floatValue];
  self->_correctionParams.colorfull_PThr1 = v117;

  v118 = [v4 objectForKeyedSubscript:@"BlueCrThr0"];
  [v118 floatValue];
  self->_correctionParams.blueCrThr0 = v119;

  v120 = [v4 objectForKeyedSubscript:@"BlueCrThr1"];
  [v120 floatValue];
  self->_correctionParams.blueCrThr1 = v121;

  v122 = [v4 objectForKeyedSubscript:@"DarkAchromThr0"];
  [v122 floatValue];
  self->_correctionParams.darkAchromThr0 = v123;

  v124 = [v4 objectForKeyedSubscript:@"DarkAchromThr1"];
  [v124 floatValue];
  self->_correctionParams.darkAchromThr1 = v125;

  v126 = [v4 objectForKeyedSubscript:@"DarkAchromCThr"];
  [v126 floatValue];
  self->_correctionParams.darkAchromCThr = v127;

  v128 = [v4 objectForKeyedSubscript:@"DarkAchromYThr"];
  [v128 floatValue];
  self->_correctionParams.darkAchromYThr = v129;

  v130 = [v4 objectForKeyedSubscript:@"DarkBlueYThr0"];
  [v130 floatValue];
  self->_correctionParams.darkBlue_YThr0 = v131;

  v132 = [v4 objectForKeyedSubscript:@"DarkBlueYThr1"];
  [v132 floatValue];
  self->_correctionParams.darkBlue_YThr1 = v133;

  v134 = [v4 objectForKeyedSubscript:@"DarkBlueCbThr0"];
  [v134 floatValue];
  self->_correctionParams.darkBlue_CbThr0 = v135;

  v136 = [v4 objectForKeyedSubscript:@"DarkBlueCbThr1"];
  [v136 floatValue];
  self->_correctionParams.darkBlue_CbThr1 = v137;

  v138 = [v4 objectForKeyedSubscript:@"SkyBlueYThr0"];
  [v138 floatValue];
  self->_correctionParams.skyBlue_YThr0 = v139;

  v140 = [v4 objectForKeyedSubscript:@"SkyBlueYThr1"];
  [v140 floatValue];
  self->_correctionParams.skyBlue_YThr1 = v141;

  v142 = [v4 objectForKeyedSubscript:@"SkyBlueCbThr0"];
  [v142 floatValue];
  self->_correctionParams.skyBlue_CbThr0 = v143;

  v144 = [v4 objectForKeyedSubscript:@"SkyBlueCbThr1"];
  [v144 floatValue];
  self->_correctionParams.skyBlue_CbThr1 = v145;

  v146 = [v4 objectForKeyedSubscript:@"SkyBluePThr0"];
  [v146 floatValue];
  self->_correctionParams.skyBlue_PThr0 = v147;

  v148 = [v4 objectForKeyedSubscript:@"SkyBluePThr1"];
  [v148 floatValue];
  self->_correctionParams.skyBlue_PThr1 = v149;

  v150 = [v4 objectForKeyedSubscript:@"FiltThr"];
  [v150 floatValue];
  self->_correctionParams.filtThr = v151;

  v152 = [v4 objectForKeyedSubscript:@"MixFiltLUT"];
  [v152 floatValue];
  self->_correctionParams.mixFiltLUT = v153;

  v154 = [v4 objectForKeyedSubscript:@"EITThr0"];
  [v154 floatValue];
  self->_correctionParams.eitThr0 = v155;

  v156 = [v4 objectForKeyedSubscript:@"EITThr1"];
  [v156 floatValue];
  self->_correctionParams.eitThr1 = v157;

  v158 = [v4 objectForKeyedSubscript:@"AwbRatioThr0"];
  [v158 floatValue];
  self->_correctionParams.awbRatioThr0 = v159;

  v160 = [v4 objectForKeyedSubscript:@"AwbRatioThr1"];
  [v160 floatValue];
  self->_correctionParams.awbRatioThr1 = v161;

LABEL_15:
  return v5;
}

- (int)selectParametersForTuningMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
  v4 = +[VideoDefringingTuningParameters _tuningHeaderForMode:](VideoDefringingTuningParameters, "_tuningHeaderForMode:");
  int v5 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v4];
  float v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  id v7 = [v5 objectForKeyedSubscript:@"CorrectionEnabled"];

  if (!v7) {
    goto LABEL_17;
  }
  float v8 = [v6 objectForKeyedSubscript:@"CorrectionEnabled"];
  self->_defringingEnabled = [v8 BOOLValue];

  unint64_t mode = self->_mode;
  if (!mode)
  {
    int v10 = [(VideoDefringingTuningParameters *)self _parseCorrectionTuning:v6];
    if (!v10)
    {
      int v10 = [(VideoDefringingTuningParameters *)self _parseDesaturateTuning:v6];
      if (!v10)
      {
        int v11 = [(VideoDefringingTuningParameters *)self _parseRadialTuning:v6];
        if (v11) {
          goto LABEL_16;
        }
        goto LABEL_18;
      }
    }
    goto LABEL_21;
  }
  if (mode != 2)
  {
    if (mode == 1)
    {
      int v10 = [(VideoDefringingTuningParameters *)self _parseDesaturateTuning:v6];
      if (!v10)
      {
        int v11 = [(VideoDefringingTuningParameters *)self _parseRadialTuning:v6];
        if (v11) {
          goto LABEL_16;
        }
        goto LABEL_18;
      }
LABEL_21:
      int v11 = v10;
      fig_log_get_emitter();
      goto LABEL_22;
    }
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = -12780;
    goto LABEL_18;
  }
  int v10 = [(VideoDefringingTuningParameters *)self _parseCorrectionTuning:v6];
  if (v10) {
    goto LABEL_21;
  }
  int v10 = [(VideoDefringingTuningParameters *)self _parseDesaturateTuning:v6];
  if (v10) {
    goto LABEL_21;
  }
  int v11 = [(VideoDefringingTuningParameters *)self _parseRadialTuning:v6];
  if (v11)
  {
LABEL_16:
    fig_log_get_emitter();
LABEL_22:
    FigDebugAssert3();
  }
LABEL_18:

  return v11;
}

- (VideoDefringingTuningParameters)initWithTuningParameters:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VideoDefringingTuningParameters;
  int v5 = [(VideoDefringingTuningParameters *)&v10 init];
  if (v5
    && (!v4
      ? (+[VideoDefringingTuningParameters defaultTuningDictionary], float v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue()): (float v6 = (NSDictionary *)v4), tuningParameters = v5->_tuningParameters, v5->_tuningParameters = v6, tuningParameters, !v5->_tuningParameters))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    float v8 = 0;
  }
  else
  {
    float v8 = v5;
  }

  return v8;
}

- (int)_parseDesaturateTuning:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"DesaturateParameters"];
  if (+[VideoDefringingTuningParameters _validateTuning:v4 mode:self->_mode parameterKey:@"DesaturateParameters"]|| self->_mode > 2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = -12780;
  }
  else
  {
    int v5 = [v4 objectForKeyedSubscript:@"Amount"];
    [v5 floatValue];
    self->_desaturationParams.amount = v6;

    id v7 = [v4 objectForKeyedSubscript:@"Angle"];
    [v7 floatValue];
    self->_desaturationParams.angle = v8;

    v9 = [v4 objectForKeyedSubscript:@"Cutoff"];
    [v9 floatValue];
    self->_desaturationParams.cutoff = v10;

    int v11 = 0;
  }

  return v11;
}

+ ($6B6A6628744B4DF06B73A717F4EE0DD2)defaultRadialParams:(SEL)a3
{
  *retstr = *($6B6A6628744B4DF06B73A717F4EE0DD2 *)ymmword_263480640;
  retstr[1] = *($6B6A6628744B4DF06B73A717F4EE0DD2 *)ymmword_263480660;
  return result;
}

+ ($E2C29196C7A5C696474C6955C5A9CE06)defaultLUTParams:(unint64_t)a3
{
  float v3 = 0.8;
  float v4 = 0.4;
  float v5 = 0.5;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ ($B5339CD3011AE9733252D32A415F0BF1)defaultCorrectionParams:(SEL)a3
{
  if (!a4)
  {
    *(void *)&retstr->var54 = 0;
    float v4 = (long long *)"fff?";
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    *(void *)&retstr->var54 = 0;
    float v4 = &xmmword_263480680;
LABEL_5:
    long long v5 = v4[11];
    *(_OWORD *)&retstr->var38 = v4[10];
    *(_OWORD *)&retstr->var42 = v5;
    long long v6 = v4[13];
    *(_OWORD *)&retstr->var46 = v4[12];
    *(_OWORD *)&retstr->var50 = v6;
    long long v7 = v4[7];
    *(_OWORD *)&retstr->var22 = v4[6];
    *(_OWORD *)&retstr->var26 = v7;
    long long v8 = v4[9];
    *(_OWORD *)&retstr->var30 = v4[8];
    *(_OWORD *)&retstr->var34 = v8;
    long long v9 = v4[3];
    *(_OWORD *)&retstr->var6[2] = v4[2];
    *(_OWORD *)&retstr->var10 = v9;
    long long v10 = v4[5];
    *(_OWORD *)&retstr->var14 = v4[4];
    *(_OWORD *)&retstr->var18 = v10;
    long long v11 = v4[1];
    *(_OWORD *)&retstr->var0 = *v4;
    *(_OWORD *)&retstr->var4 = v11;
    return result;
  }
  *(void *)&retstr->var54 = 0;
  *(_OWORD *)&retstr->var46 = 0u;
  *(_OWORD *)&retstr->var50 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var42 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var6[2] = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  return result;
}

void __58__VideoDefringingTuningParameters_defaultTuningDictionary__block_invoke()
{
  v252[3] = *MEMORY[0x263EF8340];
  +[VideoDefringingTuningParameters defaultRadialParams:1];
  +[VideoDefringingTuningParameters defaultLUTParams:1];
  int v1 = v0;
  int v3 = v2;
  int v5 = v4;
  v252[0] = MEMORY[0x263EFFA88];
  v251[0] = @"CorrectionEnabled";
  v251[1] = @"RadialParameters";
  v249[0] = @"a0";
  LODWORD(v6) = 0;
  v226 = [NSNumber numberWithFloat:v6];
  v250[0] = v226;
  v249[1] = @"a1";
  LODWORD(v7) = 0;
  v223 = [NSNumber numberWithFloat:v7];
  v250[1] = v223;
  v249[2] = @"a2";
  LODWORD(v8) = 0;
  long long v9 = [NSNumber numberWithFloat:v8];
  v250[2] = v9;
  v249[3] = @"a3";
  LODWORD(v10) = 0;
  long long v11 = [NSNumber numberWithFloat:v10];
  v250[3] = v11;
  v249[4] = @"MinCoefficient";
  LODWORD(v12) = 0;
  v13 = [NSNumber numberWithFloat:v12];
  v250[4] = v13;
  float v14 = [NSDictionary dictionaryWithObjects:v250 forKeys:v249 count:5];
  v252[1] = v14;
  v251[2] = @"DesaturateParameters";
  v247[0] = @"Amount";
  LODWORD(v15) = v1;
  float v16 = [NSNumber numberWithFloat:v15];
  v248[0] = v16;
  v247[1] = @"Angle";
  LODWORD(v17) = v3;
  float v18 = [NSNumber numberWithFloat:v17];
  v248[1] = v18;
  v247[2] = @"Cutoff";
  LODWORD(v19) = v5;
  float v20 = [NSNumber numberWithFloat:v19];
  v248[2] = v20;
  BOOL v21 = [NSDictionary dictionaryWithObjects:v248 forKeys:v247 count:3];
  v252[2] = v21;
  v228 = [NSDictionary dictionaryWithObjects:v252 forKeys:v251 count:3];

  +[VideoDefringingTuningParameters defaultCorrectionParams:2];
  +[VideoDefringingTuningParameters defaultRadialParams:2];
  +[VideoDefringingTuningParameters defaultLUTParams:2];
  int v23 = v22;
  int v25 = v24;
  int v27 = v26;
  v246[0] = MEMORY[0x263EFFA88];
  v245[0] = @"CorrectionEnabled";
  v245[1] = @"RadialParameters";
  v243[0] = @"a0";
  LODWORD(v28) = 0;
  v224 = [NSNumber numberWithFloat:v28];
  v244[0] = v224;
  v243[1] = @"a1";
  LODWORD(v29) = 0;
  v221 = [NSNumber numberWithFloat:v29];
  v244[1] = v221;
  v243[2] = @"a2";
  LODWORD(v30) = 0;
  v219 = [NSNumber numberWithFloat:v30];
  v244[2] = v219;
  v243[3] = @"a3";
  LODWORD(v31) = 0;
  v217 = [NSNumber numberWithFloat:v31];
  v244[3] = v217;
  v243[4] = @"MinCoefficient";
  LODWORD(v32) = 0;
  v215 = [NSNumber numberWithFloat:v32];
  v244[4] = v215;
  v213 = [NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:5];
  v246[1] = v213;
  v245[2] = @"DesaturateParameters";
  v241[0] = @"Amount";
  LODWORD(v33) = v23;
  v211 = [NSNumber numberWithFloat:v33];
  v242[0] = v211;
  v241[1] = @"Angle";
  LODWORD(v34) = v25;
  v209 = [NSNumber numberWithFloat:v34];
  v242[1] = v209;
  v241[2] = @"Cutoff";
  LODWORD(v35) = v27;
  v207 = [NSNumber numberWithFloat:v35];
  v242[2] = v207;
  v205 = [NSDictionary dictionaryWithObjects:v242 forKeys:v241 count:3];
  v246[2] = v205;
  v245[3] = @"CorrectionParameters";
  v239[0] = @"MaxChroma";
  LODWORD(v36) = 0;
  v203 = [NSNumber numberWithFloat:v36];
  v240[0] = v203;
  v239[1] = @"BlueTh0";
  LODWORD(v37) = 0;
  v201 = [NSNumber numberWithFloat:v37];
  v240[1] = v201;
  v239[2] = @"BlueTh1";
  LODWORD(v38) = 0;
  v199 = [NSNumber numberWithFloat:v38];
  v240[2] = v199;
  v239[3] = @"BlueCrTh0";
  LODWORD(v39) = 0;
  v197 = [NSNumber numberWithFloat:v39];
  v240[3] = v197;
  v239[4] = @"ContrastTh0";
  LODWORD(v40) = 0;
  v195 = [NSNumber numberWithFloat:v40];
  v240[4] = v195;
  v239[5] = @"ContrastTh1";
  LODWORD(v41) = 0;
  v193 = [NSNumber numberWithFloat:v41];
  v240[5] = v193;
  v239[6] = @"DarknessTh0";
  LODWORD(v42) = 0;
  v191 = [NSNumber numberWithFloat:v42];
  v240[6] = v191;
  v239[7] = @"DarknessTh1";
  LODWORD(v43) = 0;
  v189 = [NSNumber numberWithFloat:v43];
  v240[7] = v189;
  v239[8] = @"PbrightnessTh0";
  LODWORD(v44) = 0;
  v187 = [NSNumber numberWithFloat:v44];
  v240[8] = v187;
  v239[9] = @"PbrightnessTh1";
  LODWORD(v45) = 0;
  v185 = [NSNumber numberWithFloat:v45];
  v240[9] = v185;
  v239[10] = @"BlueBrightThr0";
  LODWORD(v46) = 0;
  v183 = [NSNumber numberWithFloat:v46];
  v240[10] = v183;
  v239[11] = @"BlueBrightThr1";
  LODWORD(v47) = 0;
  v181 = [NSNumber numberWithFloat:v47];
  v240[11] = v181;
  v239[12] = @"ColorfullThr0";
  LODWORD(v48) = 0;
  v179 = [NSNumber numberWithFloat:v48];
  v240[12] = v179;
  v239[13] = @"ColorfullThr1";
  LODWORD(v49) = 0;
  v177 = [NSNumber numberWithFloat:v49];
  v240[13] = v177;
  v239[14] = @"ColorfullPThr0";
  LODWORD(v50) = 0;
  v175 = [NSNumber numberWithFloat:v50];
  v240[14] = v175;
  v239[15] = @"ColorfullPThr1";
  LODWORD(v51) = 0;
  v173 = [NSNumber numberWithFloat:v51];
  v240[15] = v173;
  v239[16] = @"BlueCrThr0";
  LODWORD(v52) = 0;
  v171 = [NSNumber numberWithFloat:v52];
  v240[16] = v171;
  v239[17] = @"BlueCrThr1";
  LODWORD(v53) = 0;
  v169 = [NSNumber numberWithFloat:v53];
  v240[17] = v169;
  v239[18] = @"DarkBlueCbThr0";
  LODWORD(v54) = 0;
  v167 = [NSNumber numberWithFloat:v54];
  v240[18] = v167;
  v239[19] = @"DarkBlueCbThr1";
  LODWORD(v55) = 0;
  v165 = [NSNumber numberWithFloat:v55];
  v240[19] = v165;
  v239[20] = @"SkyBlueYThr0";
  LODWORD(v56) = 0;
  v57 = [NSNumber numberWithFloat:v56];
  v240[20] = v57;
  v239[21] = @"SkyBlueYThr1";
  LODWORD(v58) = 0;
  v59 = [NSNumber numberWithFloat:v58];
  v240[21] = v59;
  v239[22] = @"SkyBlueCbThr0";
  LODWORD(v60) = 0;
  v61 = [NSNumber numberWithFloat:v60];
  v240[22] = v61;
  v239[23] = @"SkyBlueCbThr1";
  LODWORD(v62) = 0;
  v63 = [NSNumber numberWithFloat:v62];
  v240[23] = v63;
  v239[24] = @"SkyBluePThr0";
  LODWORD(v64) = 0;
  v65 = [NSNumber numberWithFloat:v64];
  v240[24] = v65;
  v239[25] = @"SkyBluePThr1";
  LODWORD(v66) = 0;
  v67 = [NSNumber numberWithFloat:v66];
  v240[25] = v67;
  v239[26] = @"FiltThr";
  LODWORD(v68) = 0;
  v69 = [NSNumber numberWithFloat:v68];
  v240[26] = v69;
  float v70 = [NSDictionary dictionaryWithObjects:v240 forKeys:v239 count:27];
  v246[3] = v70;
  v227 = [NSDictionary dictionaryWithObjects:v246 forKeys:v245 count:4];

  +[VideoDefringingTuningParameters defaultCorrectionParams:2];
  +[VideoDefringingTuningParameters defaultRadialParams:2];
  +[VideoDefringingTuningParameters defaultLUTParams:2];
  int v72 = v71;
  int v74 = v73;
  int v76 = v75;
  v238[0] = MEMORY[0x263EFFA88];
  v237[0] = @"CorrectionEnabled";
  v237[1] = @"RadialParameters";
  v235[0] = @"a0";
  LODWORD(v77) = 0;
  v225 = [NSNumber numberWithFloat:v77];
  v236[0] = v225;
  v235[1] = @"a1";
  LODWORD(v78) = 0;
  v222 = [NSNumber numberWithFloat:v78];
  v236[1] = v222;
  v235[2] = @"a2";
  LODWORD(v79) = 0;
  v220 = [NSNumber numberWithFloat:v79];
  v236[2] = v220;
  v235[3] = @"a3";
  LODWORD(v80) = 0;
  v218 = [NSNumber numberWithFloat:v80];
  v236[3] = v218;
  v235[4] = @"MinCoefficient";
  LODWORD(v81) = 0;
  v216 = [NSNumber numberWithFloat:v81];
  v236[4] = v216;
  v214 = [NSDictionary dictionaryWithObjects:v236 forKeys:v235 count:5];
  v238[1] = v214;
  v237[2] = @"DesaturateParameters";
  v233[0] = @"Amount";
  LODWORD(v82) = v72;
  v212 = [NSNumber numberWithFloat:v82];
  v234[0] = v212;
  v233[1] = @"Angle";
  LODWORD(v83) = v74;
  v210 = [NSNumber numberWithFloat:v83];
  v234[1] = v210;
  v233[2] = @"Cutoff";
  LODWORD(v84) = v76;
  v208 = [NSNumber numberWithFloat:v84];
  v234[2] = v208;
  v206 = [NSDictionary dictionaryWithObjects:v234 forKeys:v233 count:3];
  v238[2] = v206;
  v237[3] = @"CorrectionParameters";
  v231[0] = @"RadialScale";
  LODWORD(v85) = 0;
  v204 = [NSNumber numberWithFloat:v85];
  v232[0] = v204;
  v231[1] = @"RadialR0";
  LODWORD(v86) = 0;
  v202 = [NSNumber numberWithFloat:v86];
  v232[1] = v202;
  v231[2] = @"RadialR1";
  LODWORD(v87) = 0;
  v200 = [NSNumber numberWithFloat:v87];
  v232[2] = v200;
  v231[3] = @"RadialF0";
  LODWORD(v88) = 0;
  v198 = [NSNumber numberWithFloat:v88];
  v232[3] = v198;
  v231[4] = @"RadialF1";
  LODWORD(v89) = 0;
  v196 = [NSNumber numberWithFloat:v89];
  v232[4] = v196;
  v231[5] = @"RadialF2";
  LODWORD(v90) = 0;
  v194 = [NSNumber numberWithFloat:v90];
  v232[5] = v194;
  v231[6] = @"MaxChroma";
  LODWORD(v91) = 0;
  v192 = [NSNumber numberWithFloat:v91];
  v232[6] = v192;
  v231[7] = @"BlueTh0";
  LODWORD(v92) = 0;
  v190 = [NSNumber numberWithFloat:v92];
  v232[7] = v190;
  v231[8] = @"BlueTh1";
  LODWORD(v93) = 0;
  v188 = [NSNumber numberWithFloat:v93];
  v232[8] = v188;
  v231[9] = @"BlueCrTh0";
  LODWORD(v94) = 0;
  v186 = [NSNumber numberWithFloat:v94];
  v232[9] = v186;
  v231[10] = @"BrightnessTh0";
  LODWORD(v95) = 0;
  v184 = [NSNumber numberWithFloat:v95];
  v232[10] = v184;
  v231[11] = @"BrightnessTh1";
  LODWORD(v96) = 0;
  v182 = [NSNumber numberWithFloat:v96];
  v232[11] = v182;
  v231[12] = @"ContrastTh0";
  LODWORD(v97) = 0;
  v180 = [NSNumber numberWithFloat:v97];
  v232[12] = v180;
  v231[13] = @"ContrastTh1";
  LODWORD(v98) = 0;
  v178 = [NSNumber numberWithFloat:v98];
  v232[13] = v178;
  v231[14] = @"DarknessTh0";
  LODWORD(v99) = 0;
  v176 = [NSNumber numberWithFloat:v99];
  v232[14] = v176;
  v231[15] = @"DarknessTh1";
  LODWORD(v100) = 0;
  v174 = [NSNumber numberWithFloat:v100];
  v232[15] = v174;
  v231[16] = @"LumaKnee";
  LODWORD(v101) = 0;
  v172 = [NSNumber numberWithFloat:v101];
  v232[16] = v172;
  v231[17] = @"LumaAmp";
  LODWORD(v102) = 0;
  v170 = [NSNumber numberWithFloat:v102];
  v232[17] = v170;
  v231[18] = @"PbrightnessTh0";
  LODWORD(v103) = 0;
  v168 = [NSNumber numberWithFloat:v103];
  v232[18] = v168;
  v231[19] = @"PbrightnessTh1";
  LODWORD(v104) = 0;
  v166 = [NSNumber numberWithFloat:v104];
  v232[19] = v166;
  v231[20] = @"BlueBrightThr0";
  LODWORD(v105) = 0;
  v164 = [NSNumber numberWithFloat:v105];
  v232[20] = v164;
  v231[21] = @"BlueBrightThr1";
  LODWORD(v106) = 0;
  v163 = [NSNumber numberWithFloat:v106];
  v232[21] = v163;
  v231[22] = @"ColorfullThr0";
  LODWORD(v107) = 0;
  v162 = [NSNumber numberWithFloat:v107];
  v232[22] = v162;
  v231[23] = @"ColorfullThr1";
  LODWORD(v108) = 0;
  float v161 = [NSNumber numberWithFloat:v108];
  v232[23] = v161;
  v231[24] = @"ColorfullPThr0";
  LODWORD(v109) = 0;
  v160 = [NSNumber numberWithFloat:v109];
  v232[24] = v160;
  v231[25] = @"ColorfullPThr1";
  LODWORD(v110) = 0;
  float v159 = [NSNumber numberWithFloat:v110];
  v232[25] = v159;
  v231[26] = @"BlueCrThr0";
  LODWORD(v111) = 0;
  v158 = [NSNumber numberWithFloat:v111];
  v232[26] = v158;
  v231[27] = @"BlueCrThr1";
  LODWORD(v112) = 0;
  float v157 = [NSNumber numberWithFloat:v112];
  v232[27] = v157;
  v231[28] = @"DarkAchromThr0";
  LODWORD(v113) = 0;
  v156 = [NSNumber numberWithFloat:v113];
  v232[28] = v156;
  v231[29] = @"DarkAchromThr1";
  LODWORD(v114) = 0;
  float v155 = [NSNumber numberWithFloat:v114];
  v232[29] = v155;
  v231[30] = @"DarkAchromCThr";
  LODWORD(v115) = 0;
  v154 = [NSNumber numberWithFloat:v115];
  v232[30] = v154;
  v231[31] = @"DarkAchromYThr";
  LODWORD(v116) = 0;
  float v153 = [NSNumber numberWithFloat:v116];
  v232[31] = v153;
  v231[32] = @"DarkBlueYThr0";
  LODWORD(v117) = 0;
  v152 = [NSNumber numberWithFloat:v117];
  v232[32] = v152;
  v231[33] = @"DarkBlueYThr1";
  LODWORD(v118) = 0;
  float v151 = [NSNumber numberWithFloat:v118];
  v232[33] = v151;
  v231[34] = @"DarkBlueCbThr0";
  LODWORD(v119) = 0;
  v150 = [NSNumber numberWithFloat:v119];
  v232[34] = v150;
  v231[35] = @"DarkBlueCbThr1";
  LODWORD(v120) = 0;
  float v149 = [NSNumber numberWithFloat:v120];
  v232[35] = v149;
  v231[36] = @"SkyBlueYThr0";
  LODWORD(v121) = 0;
  v148 = [NSNumber numberWithFloat:v121];
  v232[36] = v148;
  v231[37] = @"SkyBlueYThr1";
  LODWORD(v122) = 0;
  float v147 = [NSNumber numberWithFloat:v122];
  v232[37] = v147;
  v231[38] = @"SkyBlueCbThr0";
  LODWORD(v123) = 0;
  v146 = [NSNumber numberWithFloat:v123];
  v232[38] = v146;
  v231[39] = @"SkyBlueCbThr1";
  LODWORD(v124) = 0;
  float v145 = [NSNumber numberWithFloat:v124];
  v232[39] = v145;
  v231[40] = @"SkyBluePThr0";
  LODWORD(v125) = 0;
  v126 = [NSNumber numberWithFloat:v125];
  v232[40] = v126;
  v231[41] = @"SkyBluePThr1";
  LODWORD(v127) = 0;
  v128 = [NSNumber numberWithFloat:v127];
  v232[41] = v128;
  v231[42] = @"FiltThr";
  LODWORD(v129) = 0;
  v130 = [NSNumber numberWithFloat:v129];
  v232[42] = v130;
  v231[43] = @"MixFiltLUT";
  LODWORD(v131) = 0;
  v132 = [NSNumber numberWithFloat:v131];
  v232[43] = v132;
  v231[44] = @"EITThr0";
  LODWORD(v133) = 0;
  v134 = [NSNumber numberWithFloat:v133];
  v232[44] = v134;
  v231[45] = @"EITThr1";
  LODWORD(v135) = 0;
  v136 = [NSNumber numberWithFloat:v135];
  v232[45] = v136;
  v231[46] = @"AwbRatioThr0";
  LODWORD(v137) = 0;
  v138 = [NSNumber numberWithFloat:v137];
  v232[46] = v138;
  v231[47] = @"AwbRatioThr1";
  LODWORD(v139) = 0;
  v140 = [NSNumber numberWithFloat:v139];
  v232[47] = v140;
  float v141 = [NSDictionary dictionaryWithObjects:v232 forKeys:v231 count:48];
  v238[3] = v141;
  v142 = [NSDictionary dictionaryWithObjects:v238 forKeys:v237 count:4];

  v229[0] = @"Slomo";
  v229[1] = @"Video";
  v230[0] = v228;
  v230[1] = v227;
  v229[2] = @"Still";
  v230[2] = v142;
  uint64_t v143 = [NSDictionary dictionaryWithObjects:v230 forKeys:v229 count:3];
  v144 = (void *)defaultTuningDictionary_defaultTuning;
  defaultTuningDictionary_defaultTuning = v143;
}

- (void)setDefaults
{
  +[VideoDefringingTuningParameters defaultLUTParams:self->_mode];
  self->_desaturationParams.amount = v3;
  self->_desaturationParams.angle = v4;
  self->_desaturationParams.cutoff = v5;
  +[VideoDefringingTuningParameters defaultCorrectionParams:self->_mode];
  self->_correctionParams = v6;
  +[VideoDefringingTuningParameters defaultRadialParams:self->_mode];
  self->_radialParams = *($9CD6598CF841B8A0CBD7113FC0CCF29C *)&v6.radialScale;
  *(_OWORD *)self->_anon_40 = *(_OWORD *)&v6.radialF1;
  *(_OWORD *)&self->_anon_40[16] = *(_OWORD *)&v6.radialFXScaleFactorByQuadraBinningFactor[2];
  *(_OWORD *)&self->_anon_40[32] = *(_OWORD *)&v6.blueCrTh0;
}

- (void)setRadialParamsForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  *(float *)&self->_anon_40[32] = sqrtf((float)(a3 * a3 + a4 * a4)) * 0.5;
  v4.i64[0] = a3;
  v4.i64[1] = a4;
  *(float32x2_t *)v4.i8 = vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(v4)), (float32x2_t)0x3F0000003F000000);
  *(void *)&self->_anon_40[16] = v4.i64[0];
  *(void *)&self->_anon_40[24] = v4.i64[0];
}

- (void)setMetadataGain:(float)a3 exposureTime:(float)a4 AWBRGain:(float)a5 AWBBGain:(float)a6
{
  if (a6 < 0.000001) {
    a6 = 0.000001;
  }
  float v6 = (float)((float)(a5 / a6) - self->_correctionParams.awbRatioThr0)
     / (float)(self->_correctionParams.awbRatioThr1 - self->_correctionParams.awbRatioThr0);
  BOOL v7 = v6 <= 0.0;
  BOOL v8 = v6 < 1.0 || v6 <= 0.0;
  if (v6 >= 1.0) {
    BOOL v7 = 1;
  }
  if (v8) {
    float v9 = 0.0;
  }
  else {
    float v9 = 1.0;
  }
  if (v7) {
    float v6 = v9;
  }
  float v10 = (float)(v6 * v6) * (float)((float)(v6 * -2.0) + 3.0);
  float v11 = (float)((float)(a3 * a4) - self->_correctionParams.eitThr0)
      / (float)(self->_correctionParams.eitThr1 - self->_correctionParams.eitThr0);
  BOOL v12 = v11 <= 0.0;
  BOOL v13 = v11 < 1.0 || v11 <= 0.0;
  if (v11 >= 1.0) {
    BOOL v12 = 1;
  }
  if (v13) {
    float v14 = 0.0;
  }
  else {
    float v14 = 1.0;
  }
  if (v12) {
    float v11 = v14;
  }
  self->_correctionParams.correctionStrength = v10 * (float)((float)(v11 * v11) * (float)((float)(v11 * -2.0) + 3.0));
}

- ($B5339CD3011AE9733252D32A415F0BF1)correctionParams
{
  long long v3 = *(_OWORD *)&self[1].var20;
  *(_OWORD *)&retstr->var46 = *(_OWORD *)&self[1].var16;
  *(_OWORD *)&retstr->var50 = v3;
  *(void *)&retstr->var54 = *(void *)&self[1].var24;
  long long v4 = *(_OWORD *)self[1].var6;
  *(_OWORD *)&retstr->var30 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var34 = v4;
  long long v5 = *(_OWORD *)&self[1].var12;
  *(_OWORD *)&retstr->var38 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var42 = v5;
  long long v6 = *(_OWORD *)&self->var46;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self->var42;
  *(_OWORD *)&retstr->var18 = v6;
  long long v7 = *(_OWORD *)&self->var54;
  *(_OWORD *)&retstr->var22 = *(_OWORD *)&self->var50;
  *(_OWORD *)&retstr->var26 = v7;
  long long v8 = *(_OWORD *)&self->var30;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var26;
  *(_OWORD *)&retstr->var4 = v8;
  long long v9 = *(_OWORD *)&self->var38;
  *(_OWORD *)&retstr->var6[2] = *(_OWORD *)&self->var34;
  *(_OWORD *)&retstr->var10 = v9;
  return self;
}

- ($6B6A6628744B4DF06B73A717F4EE0DD2)radialParams
{
  long long v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var4 = v3;
  long long v4 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr[1].var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr[1].var4 = v4;
  return self;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)desaturationParams
{
  float amount = self->_desaturationParams.amount;
  float angle = self->_desaturationParams.angle;
  float cutoff = self->_desaturationParams.cutoff;
  result.var2 = cutoff;
  result.var1 = angle;
  result.var0 = amount;
  return result;
}

- (BOOL)defringingEnabled
{
  return self->_defringingEnabled;
}

- (void).cxx_destruct
{
}

@end