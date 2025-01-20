@interface _UILegacyEffectConverter
+ (id)sharedConverter;
- (id)backdropSettingsForBlurStyle:(int64_t)a3;
- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3;
- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3;
- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3;
- (void)applyBackdropSettings:(id)a3 toEffectDescriptor:(id)a4 environment:(id)a5;
- (void)applyVibrancyConfig:(id)a3 toEffectDescriptor:(id)a4;
@end

@implementation _UILegacyEffectConverter

+ (id)sharedConverter
{
  if (qword_1EB25F0E8 != -1) {
    dispatch_once(&qword_1EB25F0E8, &__block_literal_global_41);
  }
  v2 = (void *)_MergedGlobals_954;
  return v2;
}

- (void)applyBackdropSettings:(id)a3 toEffectDescriptor:(id)a4 environment:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 blurRadius];
  double v11 = v10;
  [v7 scale];
  if (v11 > 0.0 || v12 > 0.0) {
    _UIBlurEffectAddBlurFilterEntry(v8, v9, v11, v12);
  }
  if ([v7 usesGrayscaleTintView])
  {
    if (([v7 lightenGrayscaleWithSourceOver] & 1) != 0
      || ([v7 grayscaleTintAlpha], v13 > 0.0))
    {
      if ([v7 lightenGrayscaleWithSourceOver])
      {
        uint64_t v14 = *MEMORY[0x1E4F3A228];
        [v7 grayscaleTintLevel];
        v15 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
        [v7 grayscaleTintAlpha];
      }
      else
      {
        uint64_t v14 = *MEMORY[0x1E4F3A320];
        [v7 grayscaleTintLevel];
        double v18 = v17;
        [v7 grayscaleTintAlpha];
        v15 = +[UIColor colorWithWhite:v18 alpha:v19];
        double v16 = 1.0;
      }
      id v20 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:v14 color:v15 alpha:v16];

      [v8 addOverlay:v20];
    }
  }
  if ([v7 usesColorTintView])
  {
    uint64_t v21 = [v7 colorTint];
    if (v21)
    {
      v22 = (void *)v21;
      [v7 colorTintAlpha];
      double v24 = v23;

      if (v24 > 0.0)
      {
        uint64_t v25 = *MEMORY[0x1E4F3A320];
        v26 = [v7 colorTint];
        [v7 colorTintAlpha];
        id v27 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v25, v26);
        [v8 addOverlay:v27];
      }
    }
  }
  if ([v7 usesColorBurnTintView])
  {
    [v7 colorBurnTintAlpha];
    if (v28 > 0.0)
    {
      uint64_t v29 = *MEMORY[0x1E4F3A008];
      [v7 colorBurnTintLevel];
      v30 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
      [v7 colorBurnTintAlpha];
      id v31 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v29, v30);
      [v8 addOverlay:v31];
    }
  }
  if ([v7 usesDarkeningTintView])
  {
    [v7 darkeningTintAlpha];
    if (v32 > 0.0)
    {
      int v33 = [v7 darkenWithSourceOver];
      v34 = (uint64_t *)MEMORY[0x1E4F3A078];
      if (!v33) {
        v34 = (uint64_t *)MEMORY[0x1E4F3A070];
      }
      uint64_t v35 = *v34;
      [v7 darkeningTintHue];
      double v37 = v36;
      [v7 darkeningTintSaturation];
      double v39 = v38;
      [v7 darkeningTintBrightness];
      v41 = +[UIColor colorWithHue:v37 saturation:v39 brightness:v40 alpha:1.0];
      [v7 darkeningTintAlpha];
      id v42 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", v35, v41);
      [v8 addOverlay:v42];
    }
  }
  [v7 saturationDeltaFactor];
  if (v43 != 1.0)
  {
    [v7 saturationDeltaFactor];
    v44 = +[UIColorEffect colorEffectSaturate:](UIColorEffect, "colorEffectSaturate:");
    v45 = [v44 _filterEntry];
    [v8 addFilterEntry:v45];
  }
  v46 = [v7 colorOffsetMatrix];

  if (v46)
  {
    v47 = [v7 colorOffsetMatrix];
    v48 = v47;
    if (v47)
    {
      [v47 CAColorMatrixValue];
      int v83 = v101;
      float v85 = v102;
      float v49 = v104;
      float v50 = v105;
      float v51 = v106;
      float v91 = v107;
      float v92 = v100;
      float v86 = v103;
      int v88 = v108;
      int v89 = v109;
      float v52 = v112;
      float v94 = v110;
      float v95 = v111;
      float v53 = v114;
      float v97 = v113;
      unint64_t v98 = v115;
      unsigned int v54 = v116;
      float v55 = v117;
      unsigned int v56 = v118;
    }
    else
    {
      unsigned int v56 = 0;
      float v55 = 0.0;
      unsigned int v54 = 0;
      unint64_t v98 = 0;
      float v53 = 0.0;
      float v95 = 0.0;
      float v97 = 0.0;
      float v52 = 0.0;
      float v92 = 0.0;
      float v94 = 0.0;
      int v88 = 0;
      int v89 = 0;
      float v91 = 0.0;
      float v51 = 0.0;
      float v50 = 0.0;
      float v49 = 0.0;
      float v85 = 0.0;
      float v86 = 0.0;
      int v83 = 0;
    }

    float v60 = v91;
    float v58 = v92;
    unsigned int v61 = HIDWORD(v98);
    unsigned int v62 = v98;
    float v64 = v95;
    float v63 = v97;
    float v65 = v94;
    int v67 = v88;
    int v66 = v89;
    float v69 = v85;
    float v68 = v86;
    int v70 = v83;
  }
  else
  {
    [v7 colorOffsetAlpha];
    float v58 = v57 * 0.8 + 1.0 - v57;
    double v59 = (1.0 - v57) * 0.0;
    float v49 = v59 - v57 * 0.5;
    float v53 = v57 * 0.5 + v59;
    float v50 = v57 * 0.9 + v59;
    float v51 = v57 + 1.0 - v57;
    float v60 = v57 * 0.1 + v59;
    float v52 = v57 * 0.5 + 1.0 - v57;
    unsigned int v56 = 0;
    float v55 = 1.0;
    unsigned int v54 = 0;
    unsigned int v61 = 0;
    unsigned int v62 = 0;
    float v63 = v53;
    float v64 = v53;
    float v65 = v53;
    int v66 = 0;
    int v67 = 0;
    float v68 = v53;
    float v69 = v49;
    int v70 = 0;
  }
  unint64_t v96 = __PAIR64__(LODWORD(v63), LODWORD(v64));
  unint64_t v84 = __PAIR64__(LODWORD(v50), LODWORD(v51));
  unint64_t v99 = __PAIR64__(v61, v62);
  unint64_t v87 = __PAIR64__(LODWORD(v53), LODWORD(v52));
  float v100 = v58;
  unint64_t v90 = __PAIR64__(v56, v54);
  unint64_t v93 = __PAIR64__(LODWORD(v65), LODWORD(v55));
  int v101 = v70;
  float v102 = v69;
  float v103 = v68;
  float v104 = v49;
  float v105 = v50;
  float v106 = v51;
  float v107 = v60;
  int v108 = v67;
  int v109 = v66;
  float v110 = v65;
  float v111 = v64;
  float v112 = v52;
  float v113 = v63;
  float v114 = v53;
  unint64_t v115 = __PAIR64__(v61, v62);
  unsigned int v116 = v54;
  float v117 = v55;
  unsigned int v118 = v56;
  float v71 = v58;
  float v72 = v60;
  int v73 = v66;
  int v74 = v67;
  float v75 = v68;
  float v76 = v69;
  int v77 = v70;
  if (!_UICAColorMatrixIsIdentity(&v100))
  {
    float v100 = v71;
    int v101 = v77;
    float v102 = v76;
    float v103 = v75;
    float v104 = v49;
    float v105 = *((float *)&v84 + 1);
    float v106 = *(float *)&v84;
    float v107 = v72;
    int v108 = v74;
    int v109 = v73;
    float v110 = *((float *)&v93 + 1);
    float v111 = *(float *)&v96;
    float v112 = *(float *)&v87;
    float v113 = *((float *)&v96 + 1);
    float v114 = *((float *)&v87 + 1);
    unint64_t v115 = v99;
    unsigned int v116 = v90;
    float v117 = *(float *)&v93;
    unsigned int v118 = HIDWORD(v90);
    v78 = +[UIColorEffect _colorEffectCAMatrix:&v100];
    v79 = [v78 _filterEntry];
    [v8 addFilterEntry:v79];
  }
  objc_msgSend(v7, "zoom", v84, v87, v90, v93, v96, v99);
  if (v80 > 0.0)
  {
    [v7 zoom];
    v81 = +[_UIZoomEffect zoomEffectWithMagnitude:](_UIZoomEffect, "zoomEffectWithMagnitude:");
    v82 = [v81 _viewEntry];
    [v8 addViewEffect:v82];
  }
}

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (void)applyVibrancyConfig:(id)a3 toEffectDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 contentConfig];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [v8 setTextShouldRenderWithTintColor:1];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke;
    v16[3] = &unk_1E52DD658;
    id v17 = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_2;
    v14[3] = &unk_1E52DD680;
    id v15 = v17;
    _UILegacyEffectConvertLayerConfig(v9, v16, v14);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_3;
  v11[3] = &unk_1E52DD6D0;
  id v12 = v8;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v8;
  [v7 enumerateLayerConfigs:v11];
}

@end