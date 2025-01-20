@interface PLCompositionHelper(PUPhotoEditAggregateSession)
+ (__CFString)_classificationForIntensityValue:()PUPhotoEditAggregateSession min:default:max:;
+ (id)compositionController:()PUPhotoEditAggregateSession aggregateKeysForPreviousComposition:;
+ (id)pl_aggregateDepthIntensityForCompositionController:()PUPhotoEditAggregateSession;
+ (id)pl_aggregateFilterIntensityForCompositionController:()PUPhotoEditAggregateSession;
+ (id)pl_aggregateNameForEffectFilterForCompositionController:()PUPhotoEditAggregateSession;
+ (id)pl_aggregateNameForPortraitFilterWithCompositionController:()PUPhotoEditAggregateSession;
+ (id)pl_aggregatePortraitIntensityForCompositionController:()PUPhotoEditAggregateSession;
@end

@implementation PLCompositionHelper(PUPhotoEditAggregateSession)

+ (id)compositionController:()PUPhotoEditAggregateSession aggregateKeysForPreviousComposition:
{
  v142[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 composition];
  uint64_t v128 = [v8 mediaType];

  v9 = [a1 adjustmentConstants];
  v10 = [MEMORY[0x1E4F1CA48] array];
  LODWORD(a4) = [MEMORY[0x1E4F8A748] compositionControllerHasAnyAutoEnhancement:v6];
  int v11 = [MEMORY[0x1E4F8A748] compositionControllerHasAnyAutoEnhancement:v7];
  int v132 = v11 ^ 1;
  int v134 = (int)a4;
  unsigned int v12 = v11 & (a4 ^ 1);
  v13 = [v6 smartToneAdjustmentController];
  v14 = [v7 smartToneAdjustmentController];
  v122 = v6;
  v15 = [v6 smartColorAdjustmentController];
  v131 = v7;
  v136 = [v7 smartColorAdjustmentController];
  v16 = [v9 PISmartToneAdjustmentKey];
  v17 = [(id)objc_opt_class() inputLightKey];
  v18 = [a1 defaultValueForAdjustmentKey:v16 settingKey:v17];
  [v18 doubleValue];
  double v20 = v19;

  v138 = v9;
  v21 = [v9 PISmartColorAdjustmentKey];
  v22 = [(id)objc_opt_class() inputColorKey];
  v137 = a1;
  v23 = [a1 defaultValueForAdjustmentKey:v21 settingKey:v22];
  [v23 doubleValue];
  double v25 = v24;

  [v13 inputLight];
  double v27 = v26;
  [v14 inputLight];
  double v29 = v28;
  int v30 = [v13 isAuto];
  if (v12 == 1)
  {
    [v13 inputLight];
    BOOL v32 = v31 == v20;
  }
  else
  {
    BOOL v32 = 0;
  }
  unsigned int v126 = v134 & v132;
  int v33 = (v30 | v32) ^ 1;
  if (v27 == v29) {
    int v34 = 0;
  }
  else {
    int v34 = v33;
  }
  unsigned int v124 = v34;
  objc_msgSend(v10, "pu_valuesChanged:forKey:");
  [v15 inputColor];
  double v36 = v35;
  [v136 inputColor];
  double v38 = v37;
  int v39 = [v15 isAuto] ^ 1;
  if (v36 == v38) {
    int v40 = 0;
  }
  else {
    int v40 = v39;
  }
  v133 = v13;
  v130 = v15;
  if (v12)
  {
    [v15 inputColor];
    BOOL v42 = v41 != v25;
  }
  else
  {
    BOOL v42 = 1;
  }
  uint64_t v43 = v40 & v42;
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v43, *MEMORY[0x1E4F8B3B8]);
  v44 = [v131 composition];
  v45 = [v9 PISmartToneAdjustmentKey];
  v142[0] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:1];
  uint64_t v47 = [v122 isEqual:v44 forKeys:v46 visualChangesOnly:1] ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v47, *MEMORY[0x1E4F8B3D0]);
  v48 = [v131 composition];
  v49 = [v138 PISmartColorAdjustmentKey];
  v141 = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
  uint64_t v51 = [v122 isEqual:v48 forKeys:v50 visualChangesOnly:1] ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v51, *MEMORY[0x1E4F8B3C0]);
  if (v134)
  {
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v124, *MEMORY[0x1E4F8B308]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v47, *MEMORY[0x1E4F8B310]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v43, *MEMORY[0x1E4F8B2F8]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v51, *MEMORY[0x1E4F8B300]);
  }
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v126, *MEMORY[0x1E4F8B2D0]);
  v52 = [v131 composition];
  v53 = [v138 PIRedEyeAdjustmentKey];
  v140 = v53;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v140 count:1];
  uint64_t v55 = [v122 isEqual:v52 forKeys:v54 visualChangesOnly:1] ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v55, *MEMORY[0x1E4F8B380]);
  v56 = [v122 cropAdjustmentController];
  v57 = [v131 cropAdjustmentController];
  [v56 cropRect];
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  v135 = v57;
  [v57 cropRect];
  v145.origin.x = v66;
  v145.origin.y = v67;
  v145.size.width = v68;
  v145.size.height = v69;
  v144.origin.x = v59;
  v144.origin.y = v61;
  v144.size.width = v63;
  v144.size.height = v65;
  BOOL v70 = CGRectEqualToRect(v144, v145);
  v71 = (void *)MEMORY[0x1E4F8B328];
  if (v128 != 2) {
    v71 = (void *)MEMORY[0x1E4F8B320];
  }
  objc_msgSend(v10, "pu_valuesChanged:forKey:", !v70, *v71);
  v72 = [v122 orientationAdjustmentController];
  v73 = [v131 orientationAdjustmentController];
  if (v72) {
    [v72 orientation];
  }
  v125 = v73;
  v127 = v72;
  if (v73) {
    [v73 orientation];
  }
  unint64_t v74 = PLOrientationBetweenOrientations();
  v75 = (void *)MEMORY[0x1E4F8B398];
  if (v128 == 2)
  {
    v75 = (void *)MEMORY[0x1E4F8B390];
    v76 = (void *)MEMORY[0x1E4F8B348];
  }
  else
  {
    v76 = (void *)MEMORY[0x1E4F8B340];
  }
  if (v128 == 2) {
    v77 = (void *)MEMORY[0x1E4F8B3E8];
  }
  else {
    v77 = (void *)MEMORY[0x1E4F8B3E0];
  }
  if (v128 == 2) {
    v78 = (void *)MEMORY[0x1E4F8B368];
  }
  else {
    v78 = (void *)MEMORY[0x1E4F8B360];
  }
  if (v128 == 2) {
    v79 = (void *)MEMORY[0x1E4F8B400];
  }
  else {
    v79 = (void *)MEMORY[0x1E4F8B3F8];
  }
  if (v128 == 2) {
    v80 = (void *)MEMORY[0x1E4F8B358];
  }
  else {
    v80 = (void *)MEMORY[0x1E4F8B350];
  }
  objc_msgSend(v10, "pu_valuesChanged:forKey:", (v74 < 9) & (0x1E8u >> v74), *v75);
  objc_msgSend(v10, "pu_valuesChanged:forKey:", (v74 < 8) & (0xB4u >> v74), *v76);
  [v56 angle];
  double v82 = v81;
  [v135 angle];
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v82 != v83, *v77);
  [v56 pitchRadians];
  double v85 = v84;
  [v135 pitchRadians];
  LODWORD(v74) = v85 != v86;
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v85 != v86, *v78);
  [v56 yawRadians];
  double v88 = v87;
  [v135 yawRadians];
  if (v88 == v89) {
    unint64_t v74 = v74;
  }
  else {
    unint64_t v74 = 1;
  }
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v88 != v89, *v79);
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v74, *v80);
  v90 = v137;
  int v91 = [v137 compositionController:v122 isCropConstraintEqualToCompositionController:v131];
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v91 ^ 1u, *MEMORY[0x1E4F8B2C8]);
  v92 = [v122 smartBWAdjustmentController];
  v93 = [v131 smartBWAdjustmentController];
  if ([v92 enabled])
  {
    [v92 hue];
    double v95 = v94;
    [v93 hue];
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v95 != v96, *MEMORY[0x1E4F8B3A8]);
    v97 = [v131 composition];
    v98 = [v138 PISmartBWAdjustmentKey];
    v139 = v98;
    v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
    uint64_t v100 = [v122 isEqual:v97 forKeys:v99 visualChangesOnly:1] ^ 1;

    uint64_t v101 = v100;
    v90 = v137;
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v101, *MEMORY[0x1E4F8B3B0]);
  }
  v123 = v93;
  v129 = v92;
  v102 = objc_msgSend(v90, "pl_aggregateNameForEffectFilterForCompositionController:", v122);
  v103 = v133;
  if (v102)
  {
    objc_msgSend(v10, "pu_valuesChanged:forKey:", objc_msgSend(v90, "compositionController:isEffectFilterEqualToCompositionController:", v122, v131) ^ 1, PLSAggregateDictionaryKeyForEditPhotoWithFilterName());
    uint64_t v104 = [v90 compositionController:v122 isEffectFilterIntensityEqualToCompositionController:v131] ^ 1;
    v105 = objc_msgSend(v90, "pl_aggregateFilterIntensityForCompositionController:", v122);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v104, PLSAggregateDictionaryKeyForEditPhotoWithFilterIntensity());
  }
  v106 = objc_msgSend(v90, "pl_aggregateNameForPortraitFilterWithCompositionController:", v122);
  v107 = [v90 activeEffectAdjustmentForCompositionController:v122];
  v108 = v107;
  if (v107)
  {
    v109 = [v107 kind];
    BOOL v110 = v109 != 0;

    if (!v106) {
      goto LABEL_53;
    }
  }
  else
  {
    BOOL v110 = 0;
    if (!v106) {
      goto LABEL_53;
    }
  }
  if (!v110)
  {
    v121 = v56;
    v111 = [v90 activeEffectAdjustmentForCompositionController:v131];
    v112 = v111;
    if (v111
      && ([v111 kind], v113 = objc_claimAutoreleasedReturnValue(), v113, v113))
    {
      uint64_t v114 = 1;
      v90 = v137;
    }
    else
    {
      v90 = v137;
      uint64_t v114 = [v137 compositionController:v122 isPortraitEqualToCompositionController:v131] ^ 1;
    }
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v114, PLSAggregateDictionaryKeyForEditPhotoWithPortraitName());
    uint64_t v115 = [v90 compositionController:v122 isPortraitIntensityEqualToCompositionController:v131] ^ 1;
    v116 = objc_msgSend(v90, "pl_aggregatePortraitIntensityForCompositionController:", v122);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v115, PLSAggregateDictionaryKeyForEditPhotoWithPortraitIntensity());

    v103 = v133;
    v56 = v121;
  }
LABEL_53:
  v117 = [v122 depthAdjustmentController];

  if (v117)
  {
    uint64_t v118 = [v90 compositionController:v122 isDepthIntensityEqualToCompositionController:v131] ^ 1;
    v119 = objc_msgSend(v90, "pl_aggregateDepthIntensityForCompositionController:", v122);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v118, PLSAggregateDictionaryKeyForEditPhotoWithApertureIntensity());
  }
  return v10;
}

+ (id)pl_aggregateNameForPortraitFilterWithCompositionController:()PUPhotoEditAggregateSession
{
  id v3 = a3;
  v4 = [v3 portraitAdjustmentController];
  v5 = [v4 kind];
  int64_t v6 = +[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:v5];

  if (!v6)
  {
    id v7 = [v4 portraitInfo];
    int64_t v6 = v7 != 0;
  }
  v8 = [MEMORY[0x1E4F57D58] aggdNameForLightingType:v6];

  return v8;
}

+ (id)pl_aggregateDepthIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  v4 = [a3 depthAdjustmentController];
  [v4 aperture];
  v5 = objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");

  return v5;
}

+ (id)pl_aggregatePortraitIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  v4 = [a3 portraitAdjustmentController];
  [v4 strength];
  v5 = objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");

  return v5;
}

+ (id)pl_aggregateFilterIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  v2 = objc_msgSend(a1, "activeEffectAdjustmentForCompositionController:");
  [v2 intensity];
  id v3 = objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");

  return v3;
}

+ (__CFString)_classificationForIntensityValue:()PUPhotoEditAggregateSession min:default:max:
{
  if (a2 >= a1) {
    a1 = a2;
  }
  if (a1 > a4) {
    a1 = a4;
  }
  double v4 = (a4 - a2) * 0.01;
  if (v4 + a2 >= a1) {
    return @"min";
  }
  if (a4 - v4 <= a1) {
    return @"max";
  }
  if (a3 - v4 > a1) {
    return @"low";
  }
  if (v4 + a3 >= a1) {
    return @"default";
  }
  return @"high";
}

+ (id)pl_aggregateNameForEffectFilterForCompositionController:()PUPhotoEditAggregateSession
{
  v1 = objc_msgSend(a1, "activeEffectAdjustmentForCompositionController:");
  v2 = [v1 kind];
  id v3 = [v2 lowercaseString];

  return v3;
}

@end