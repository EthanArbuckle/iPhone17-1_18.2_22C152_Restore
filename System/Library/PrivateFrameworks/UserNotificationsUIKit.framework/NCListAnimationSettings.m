@interface NCListAnimationSettings
+ (id)moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- (BOOL)highFrameRateInteractiveAnimations;
- (BOOL)isInternalToolsButtonHidden;
- (BOOL)onlyC2;
- (double)animationFriction;
- (double)animationFrictionVelocityFactor;
- (double)animationInsertionStartAlpha;
- (double)animationScale;
- (double)animationScaleGroupInsertion;
- (double)animationScaleWhileGrouping;
- (double)animationTension;
- (double)animationTensionVelocityFactor;
- (double)animationTranslation;
- (double)animationTranslationWhileGrouping;
- (double)featuredLeadingViewSpacing;
- (double)featuredViewOcclusionMinimumAlpha;
- (double)groupListMaxViewCount;
- (double)headerSpacing;
- (double)headerViewInitialOffsetHeightPercentage;
- (double)headerViewRemoveAnimationTransform;
- (double)headerViewRevealAlphaPercentage;
- (double)headerViewRevealBlurRadiusMax;
- (double)headerViewRevealBlurTranslationDistance;
- (double)hoverViewBottomMarginMinimum;
- (double)hoverViewFadeInsertionMargin;
- (double)hoverViewMovingTopMargin;
- (double)hoverViewTrailingMargin;
- (double)initialLayoutBottomMarginAdjustment;
- (double)insertionFriction;
- (double)insertionTension;
- (double)interactionTranslationCollapseVerticalOffsetFactor;
- (double)interactionTranslationOffsetMax;
- (double)interactionTranslationVerticalOffsetMax;
- (double)notRevealedPlacementOffset;
- (double)overlayFooterViewAnimationScale;
- (double)overlayFooterViewMaxHeight;
- (double)revealGestureAnimationRevealDelayStep;
- (double)revealHintingAnimationFriction;
- (double)revealHintingAnimationFrictionVelocityFactor;
- (double)revealHintingAnimationTension;
- (double)revealHintingAnimationTensionVelocityFactor;
- (double)revealHintingOffset;
- (double)revealHintingTriggerOffset;
- (double)rollUnderLimitHeightMax;
- (double)rollUnderNotRevealedScale;
- (double)rollUnderNotRevealedTranslationY;
- (double)rollUnderNotVisibleTranslation;
- (double)rollUnderScaleMinimum;
- (double)rollUnderTranslationMaximum;
- (double)titleViewHeight;
- (double)titleViewMargin;
- (double)viewOverlap;
- (double)viewSpacing;
- (double)viewVisibilityMargin;
- (void)setAnimationFriction:(double)a3;
- (void)setAnimationFrictionVelocityFactor:(double)a3;
- (void)setAnimationInsertionStartAlpha:(double)a3;
- (void)setAnimationScale:(double)a3;
- (void)setAnimationScaleGroupInsertion:(double)a3;
- (void)setAnimationScaleWhileGrouping:(double)a3;
- (void)setAnimationTension:(double)a3;
- (void)setAnimationTensionVelocityFactor:(double)a3;
- (void)setAnimationTranslation:(double)a3;
- (void)setAnimationTranslationWhileGrouping:(double)a3;
- (void)setDefaultValues;
- (void)setFeaturedLeadingViewSpacing:(double)a3;
- (void)setFeaturedViewOcclusionMinimumAlpha:(double)a3;
- (void)setGroupListMaxViewCount:(double)a3;
- (void)setHeaderSpacing:(double)a3;
- (void)setHeaderViewInitialOffsetHeightPercentage:(double)a3;
- (void)setHeaderViewRemoveAnimationTransform:(double)a3;
- (void)setHeaderViewRevealAlphaPercentage:(double)a3;
- (void)setHeaderViewRevealBlurRadiusMax:(double)a3;
- (void)setHeaderViewRevealBlurTranslationDistance:(double)a3;
- (void)setHighFrameRateInteractiveAnimations:(BOOL)a3;
- (void)setHoverViewBottomMarginMinimum:(double)a3;
- (void)setHoverViewFadeInsertionMargin:(double)a3;
- (void)setHoverViewMovingTopMargin:(double)a3;
- (void)setHoverViewTrailingMargin:(double)a3;
- (void)setInitialLayoutBottomMarginAdjustment:(double)a3;
- (void)setInsertionFriction:(double)a3;
- (void)setInsertionTension:(double)a3;
- (void)setInteractionTranslationCollapseVerticalOffsetFactor:(double)a3;
- (void)setInteractionTranslationOffsetMax:(double)a3;
- (void)setInteractionTranslationVerticalOffsetMax:(double)a3;
- (void)setInternalToolsButtonHidden:(BOOL)a3;
- (void)setNotRevealedPlacementOffset:(double)a3;
- (void)setOnlyC2:(BOOL)a3;
- (void)setOverlayFooterViewAnimationScale:(double)a3;
- (void)setOverlayFooterViewMaxHeight:(double)a3;
- (void)setRevealGestureAnimationRevealDelayStep:(double)a3;
- (void)setRevealHintingAnimationFriction:(double)a3;
- (void)setRevealHintingAnimationFrictionVelocityFactor:(double)a3;
- (void)setRevealHintingAnimationTension:(double)a3;
- (void)setRevealHintingAnimationTensionVelocityFactor:(double)a3;
- (void)setRevealHintingOffset:(double)a3;
- (void)setRevealHintingTriggerOffset:(double)a3;
- (void)setRollUnderLimitHeightMax:(double)a3;
- (void)setRollUnderNotRevealedScale:(double)a3;
- (void)setRollUnderNotRevealedTranslationY:(double)a3;
- (void)setRollUnderNotVisibleTranslation:(double)a3;
- (void)setRollUnderScaleMinimum:(double)a3;
- (void)setRollUnderTranslationMaximum:(double)a3;
- (void)setTitleViewHeight:(double)a3;
- (void)setTitleViewMargin:(double)a3;
- (void)setViewOverlap:(double)a3;
- (void)setViewSpacing:(double)a3;
- (void)setViewVisibilityMargin:(double)a3;
@end

@implementation NCListAnimationSettings

+ (id)moduleWithSectionTitle:(id)a3
{
  v164[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Internal Tools Button Hidden" valueKeyPath:@"internalToolsButtonHidden"];
  [v5 addObject:v6];

  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"C2 only animations" valueKeyPath:@"onlyC2"];
  [v5 addObject:v7];

  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"High frame rate animations" valueKeyPath:@"highFrameRateInteractiveAnimations"];
  [v5 addObject:v8];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"viewVisibilityMargin" valueKeyPath:@"viewVisibilityMargin"];
  v10 = [v9 between:0.0 and:500.0];
  v11 = [v10 precision:1];
  [v5 addObject:v11];

  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"viewSpacing" valueKeyPath:@"viewSpacing"];
  v13 = [v12 between:-320.0 and:320.0];
  v14 = [v13 precision:1];
  [v5 addObject:v14];

  v15 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerSpacing" valueKeyPath:@"headerSpacing"];
  v16 = [v15 between:0.0 and:320.0];
  v17 = [v16 precision:1];
  [v5 addObject:v17];

  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"viewOverlap" valueKeyPath:@"viewOverlap"];
  v19 = [v18 between:-20.0 and:20.0];
  v20 = [v19 precision:1];
  [v5 addObject:v20];

  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"featuredLeadingViewSpacing" valueKeyPath:@"featuredLeadingViewSpacing"];
  v22 = [v21 between:-32.0 and:32.0];
  v23 = [v22 precision:1];
  [v5 addObject:v23];

  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"titleViewMargin" valueKeyPath:@"titleViewMargin"];
  v25 = [v24 between:0.0 and:100.0];
  v26 = [v25 precision:1];
  [v5 addObject:v26];

  v27 = [MEMORY[0x1E4F94148] rowWithTitle:@"titleViewHeight" valueKeyPath:@"titleViewHeight"];
  v28 = [v27 between:0.0 and:500.0];
  v29 = [v28 precision:1];
  [v5 addObject:v29];

  v30 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationTension" valueKeyPath:@"animationTension"];
  v31 = [v30 between:0.0 and:1450.0];
  v32 = [v31 precision:1];
  [v5 addObject:v32];

  v33 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationFriction" valueKeyPath:@"animationFriction"];
  v34 = [v33 between:0.0 and:220.0];
  v35 = [v34 precision:1];
  [v5 addObject:v35];

  v36 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationTensionVelocityFactor" valueKeyPath:@"animationTensionVelocityFactor"];
  v37 = [v36 between:0.0 and:0.25];
  v38 = [v37 precision:0];
  [v5 addObject:v38];

  v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationFrictionVelocityFactor" valueKeyPath:@"animationFrictionVelocityFactor"];
  v40 = [v39 between:0.0002 and:0.2];
  v41 = [v40 precision:4];
  [v5 addObject:v41];

  v42 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationScale" valueKeyPath:@"animationScale"];
  v43 = [v42 between:0.03 and:3.0];
  v44 = [v43 precision:3];
  [v5 addObject:v44];

  v45 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationScaleGroupInsertion" valueKeyPath:@"animationScaleGroupInsertion"];
  v46 = [v45 between:0.11 and:11.1];
  v47 = [v46 precision:2];
  [v5 addObject:v47];

  v48 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationScaleWhileGrouping" valueKeyPath:@"animationScaleWhileGrouping"];
  v49 = [v48 between:0.01 and:1.0];
  v50 = [v49 precision:3];
  [v5 addObject:v50];

  v51 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationTranslation" valueKeyPath:@"animationTranslation"];
  v52 = [v51 between:0.0 and:200.0];
  v53 = [v52 precision:1];
  [v5 addObject:v53];

  v54 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationTranslationWhileGrouping" valueKeyPath:@"animationTranslationWhileGrouping"];
  v55 = [v54 between:0.0 and:400.0];
  v56 = [v55 precision:1];
  [v5 addObject:v56];

  v57 = [MEMORY[0x1E4F94148] rowWithTitle:@"animationInsertionStartAlpha" valueKeyPath:@"animationInsertionStartAlpha"];
  v58 = [v57 between:0.02 and:2.0];
  v59 = [v58 precision:3];
  [v5 addObject:v59];

  v60 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingAnimationTension" valueKeyPath:@"revealHintingAnimationTension"];
  v61 = [v60 between:0.0 and:1450.0];
  v62 = [v61 precision:1];
  [v5 addObject:v62];

  v63 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingAnimationFriction" valueKeyPath:@"revealHintingAnimationFriction"];
  v64 = [v63 between:0.0 and:240.0];
  v65 = [v64 precision:1];
  [v5 addObject:v65];

  v66 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingAnimationTensionVelocityFactor" valueKeyPath:@"revealHintingAnimationTensionVelocityFactor"];
  v67 = [v66 between:0.0 and:250.0];
  v68 = [v67 precision:1];
  [v5 addObject:v68];

  v69 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingAnimationFrictionVelocityFactor" valueKeyPath:@"revealHintingAnimationFrictionVelocityFactor"];
  v70 = [v69 between:0.0 and:20.0];
  v71 = [v70 precision:2];
  [v5 addObject:v71];

  v72 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealGestureAnimationRevealDelayStep" valueKeyPath:@"revealGestureAnimationRevealDelayStep"];
  v73 = [v72 between:0.003 and:0.3];
  v74 = [v73 precision:3];
  [v5 addObject:v74];

  v75 = [MEMORY[0x1E4F94148] rowWithTitle:@"insertionTension" valueKeyPath:@"insertionTension"];
  v76 = [v75 between:0.0 and:700.0];
  v77 = [v76 precision:2];
  [v5 addObject:v77];

  v78 = [MEMORY[0x1E4F94148] rowWithTitle:@"insertionFriction" valueKeyPath:@"insertionFriction"];
  v79 = [v78 between:0.0 and:120.0];
  v80 = [v79 precision:1];
  [v5 addObject:v80];

  v81 = [MEMORY[0x1E4F94148] rowWithTitle:@"groupListMaxViewCount" valueKeyPath:@"groupListMaxViewCount"];
  v82 = [v81 between:0.0 and:20.0];
  v83 = [v82 precision:1];
  [v5 addObject:v83];

  v84 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingTriggerOffset" valueKeyPath:@"revealHintingTriggerOffset"];
  v85 = [v84 between:0.0 and:500.0];
  v86 = [v85 precision:1];
  [v5 addObject:v86];

  v87 = [MEMORY[0x1E4F94148] rowWithTitle:@"revealHintingOffset" valueKeyPath:@"revealHintingOffset"];
  v88 = [v87 between:0.0 and:700.0];
  v89 = [v88 precision:1];
  [v5 addObject:v89];

  v90 = [MEMORY[0x1E4F94148] rowWithTitle:@"hoverViewMovingTopMargin" valueKeyPath:@"hoverViewMovingTopMargin"];
  v91 = [v90 between:0.0 and:50.0];
  v92 = [v91 precision:1];
  [v5 addObject:v92];

  v93 = [MEMORY[0x1E4F94148] rowWithTitle:@"hoverViewTrailingMargin" valueKeyPath:@"hoverViewTrailingMargin"];
  v94 = [v93 between:0.0 and:60.0];
  v95 = [v94 precision:1];
  [v5 addObject:v95];

  v96 = [MEMORY[0x1E4F94148] rowWithTitle:@"hoverViewFadeInsertionMargin" valueKeyPath:@"hoverViewFadeInsertionMargin"];
  v97 = [v96 between:0.0 and:250.0];
  v98 = [v97 precision:1];
  [v5 addObject:v98];

  v99 = [MEMORY[0x1E4F94148] rowWithTitle:@"hoverViewBottomMarginMinimum" valueKeyPath:@"hoverViewBottomMarginMinimum"];
  v100 = [v99 between:0.0 and:2000.0];
  v101 = [v100 precision:1];
  [v5 addObject:v101];

  v102 = [MEMORY[0x1E4F94148] rowWithTitle:@"featuredViewOcclusionMinimumAlpha" valueKeyPath:@"featuredViewOcclusionMinimumAlpha"];
  v103 = [v102 between:0.0 and:1.0];
  v104 = [v103 precision:2];
  [v5 addObject:v104];

  v105 = [MEMORY[0x1E4F94148] rowWithTitle:@"overlayFooterViewMaxHeight" valueKeyPath:@"overlayFooterViewMaxHeight"];
  v106 = [v105 between:100.0 and:100.0];
  v107 = [v106 precision:3];
  [v5 addObject:v107];

  v108 = [MEMORY[0x1E4F94148] rowWithTitle:@"overlayFooterViewAnimationScale" valueKeyPath:@"overlayFooterViewAnimationScale"];
  v109 = [v108 between:0.0 and:0.5];
  v110 = [v109 precision:3];
  [v5 addObject:v110];

  v111 = [MEMORY[0x1E4F94148] rowWithTitle:@"interactionTranslationOffsetMax" valueKeyPath:@"interactionTranslationOffsetMax"];
  v112 = [v111 between:0.0 and:300.0];
  v113 = [v112 precision:1];
  [v5 addObject:v113];

  v114 = [MEMORY[0x1E4F94148] rowWithTitle:@"interactionTranslationVerticalOffsetMax" valueKeyPath:@"interactionTranslationVerticalOffsetMax"];
  v115 = [v114 between:0.0 and:500.0];
  v116 = [v115 precision:1];
  [v5 addObject:v116];

  v117 = [MEMORY[0x1E4F94148] rowWithTitle:@"interactionTranslationCollapseVerticalOffsetFactor" valueKeyPath:@"interactionTranslationCollapseVerticalOffsetFactor"];
  v118 = [v117 between:0.05 and:5.0];
  v119 = [v118 precision:3];
  [v5 addObject:v119];

  v120 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderScaleMinimum" valueKeyPath:@"rollUnderScaleMinimum"];
  v121 = [v120 between:0.065 and:6.5];
  v122 = [v121 precision:3];
  [v5 addObject:v122];

  v123 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderTranslationMaximum" valueKeyPath:@"rollUnderTranslationMaximum"];
  v124 = [v123 between:0.0 and:1500.0];
  v125 = [v124 precision:2];
  [v5 addObject:v125];

  v126 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderLimitHeightMax" valueKeyPath:@"rollUnderLimitHeightMax"];
  v127 = [v126 between:135.0 and:135.0];
  v128 = [v127 precision:3];
  [v5 addObject:v128];

  v129 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderNotVisibleTranslation" valueKeyPath:@"rollUnderNotVisibleTranslation"];
  v130 = [v129 between:0.0 and:2200.0];
  v131 = [v130 precision:2];
  [v5 addObject:v131];

  v132 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderNotRevealedScale" valueKeyPath:@"rollUnderNotRevealedScale"];
  v133 = [v132 between:0.005 and:0.5];
  v134 = [v133 precision:3];
  [v5 addObject:v134];

  v135 = [MEMORY[0x1E4F94148] rowWithTitle:@"rollUnderNotRevealedTranslationY" valueKeyPath:@"rollUnderNotRevealedTranslationY"];
  v136 = [v135 between:-1200.0 and:1200.0];
  v137 = [v136 precision:2];
  [v5 addObject:v137];

  v138 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerViewInitialOffsetHeightPercentage" valueKeyPath:@"headerViewInitialOffsetHeightPercentage"];
  v139 = [v138 between:0.05 and:5.0];
  v140 = [v139 precision:3];
  [v5 addObject:v140];

  v141 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerViewRevealAlphaPercentage" valueKeyPath:@"headerViewRevealAlphaPercentage"];
  v142 = [v141 between:0.08 and:8.0];
  v143 = [v142 precision:3];
  [v5 addObject:v143];

  v144 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerViewRemoveAnimationTransform" valueKeyPath:@"headerViewRemoveAnimationTransform"];
  v145 = [v144 between:0.02 and:2.0];
  v146 = [v145 precision:3];
  [v5 addObject:v146];

  v147 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerViewRevealBlurRadiusMax" valueKeyPath:@"headerViewRevealBlurRadiusMax"];
  v148 = [v147 between:0.0 and:100.0];
  v149 = [v148 precision:2];
  [v5 addObject:v149];

  v150 = [MEMORY[0x1E4F94148] rowWithTitle:@"headerViewRevealBlurTranslationDistance" valueKeyPath:@"headerViewRevealBlurTranslationDistance"];
  v151 = [v150 between:0.0 and:1000.0];
  v152 = [v151 precision:2];
  [v5 addObject:v152];

  v153 = [MEMORY[0x1E4F94148] rowWithTitle:@"notRevealedPlacementOffset" valueKeyPath:@"notRevealedPlacementOffset"];
  v154 = [v153 between:0.0 and:800.0];
  v155 = [v154 precision:2];
  [v5 addObject:v155];

  v156 = [MEMORY[0x1E4F94148] rowWithTitle:@"initialLayoutBottomMarginAdjustment" valueKeyPath:@"initialLayoutBottomMarginAdjustment"];
  v157 = [v156 between:0.0 and:200.0];
  v158 = [v157 precision:2];
  [v5 addObject:v158];

  v159 = (void *)MEMORY[0x1E4F94160];
  v160 = [MEMORY[0x1E4F94160] sectionWithRows:v5 title:v4];

  v164[0] = v160;
  v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:1];
  v162 = [v159 moduleWithTitle:0 contents:v161];

  return v162;
}

+ (id)settingsControllerModule
{
  return (id)[a1 moduleWithSectionTitle:@"Animation List Settings"];
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)NCListAnimationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(NCListAnimationSettings *)self setInternalToolsButtonHidden:1];
  [(NCListAnimationSettings *)self setOnlyC2:1];
  [(NCListAnimationSettings *)self setHighFrameRateInteractiveAnimations:1];
  [(NCListAnimationSettings *)self setViewVisibilityMargin:100.0];
  [(NCListAnimationSettings *)self setViewSpacing:8.0];
  [(NCListAnimationSettings *)self setHeaderSpacing:0.0];
  [(NCListAnimationSettings *)self setViewOverlap:8.0];
  [(NCListAnimationSettings *)self setFeaturedLeadingViewSpacing:10.0];
  [(NCListAnimationSettings *)self setTitleViewMargin:20.0];
  [(NCListAnimationSettings *)self setTitleViewHeight:50.0];
  [(NCListAnimationSettings *)self setAnimationTension:145.0];
  [(NCListAnimationSettings *)self setAnimationFriction:22.0];
  [(NCListAnimationSettings *)self setAnimationTensionVelocityFactor:0.25];
  [(NCListAnimationSettings *)self setAnimationFrictionVelocityFactor:0.02];
  [(NCListAnimationSettings *)self setAnimationScale:0.3];
  [(NCListAnimationSettings *)self setAnimationScaleGroupInsertion:1.1];
  [(NCListAnimationSettings *)self setAnimationScaleWhileGrouping:0.1];
  [(NCListAnimationSettings *)self setAnimationTranslation:20.0];
  [(NCListAnimationSettings *)self setAnimationTranslationWhileGrouping:40.0];
  [(NCListAnimationSettings *)self setAnimationInsertionStartAlpha:0.2];
  [(NCListAnimationSettings *)self setRevealHintingAnimationTension:145.0];
  [(NCListAnimationSettings *)self setRevealHintingAnimationFriction:24.0];
  [(NCListAnimationSettings *)self setRevealHintingAnimationTensionVelocityFactor:25.0];
  [(NCListAnimationSettings *)self setRevealHintingAnimationFrictionVelocityFactor:2.0];
  [(NCListAnimationSettings *)self setRevealGestureAnimationRevealDelayStep:0.03];
  [(NCListAnimationSettings *)self setInsertionTension:70.0];
  [(NCListAnimationSettings *)self setInsertionFriction:12.0];
  [(NCListAnimationSettings *)self setGroupListMaxViewCount:3.0];
  [(NCListAnimationSettings *)self setRevealHintingTriggerOffset:50.0];
  [(NCListAnimationSettings *)self setRevealHintingOffset:70.0];
  [(NCListAnimationSettings *)self setHoverViewMovingTopMargin:5.0];
  [(NCListAnimationSettings *)self setHoverViewTrailingMargin:6.0];
  [(NCListAnimationSettings *)self setHoverViewFadeInsertionMargin:25.0];
  [(NCListAnimationSettings *)self setHoverViewBottomMarginMinimum:200.0];
  [(NCListAnimationSettings *)self setFeaturedViewOcclusionMinimumAlpha:0.5];
  [(NCListAnimationSettings *)self setOverlayFooterViewMaxHeight:100.0];
  [(NCListAnimationSettings *)self setOverlayFooterViewAnimationScale:0.05];
  [(NCListAnimationSettings *)self setInteractionTranslationOffsetMax:30.0];
  [(NCListAnimationSettings *)self setInteractionTranslationVerticalOffsetMax:50.0];
  [(NCListAnimationSettings *)self setInteractionTranslationCollapseVerticalOffsetFactor:0.5];
  [(NCListAnimationSettings *)self setRollUnderScaleMinimum:0.65];
  [(NCListAnimationSettings *)self setRollUnderTranslationMaximum:150.0];
  [(NCListAnimationSettings *)self setRollUnderLimitHeightMax:135.0];
  [(NCListAnimationSettings *)self setRollUnderNotVisibleTranslation:220.0];
  [(NCListAnimationSettings *)self setRollUnderNotRevealedScale:0.05];
  [(NCListAnimationSettings *)self setRollUnderNotRevealedTranslationY:-600.0];
  [(NCListAnimationSettings *)self setHeaderViewInitialOffsetHeightPercentage:0.5];
  [(NCListAnimationSettings *)self setHeaderViewRevealAlphaPercentage:0.8];
  [(NCListAnimationSettings *)self setHeaderViewRemoveAnimationTransform:0.2];
  [(NCListAnimationSettings *)self setHeaderViewRevealBlurRadiusMax:10.0];
  [(NCListAnimationSettings *)self setHeaderViewRevealBlurTranslationDistance:100.0];
  [(NCListAnimationSettings *)self setNotRevealedPlacementOffset:80.0];
  [(NCListAnimationSettings *)self setInitialLayoutBottomMarginAdjustment:20.0];
}

- (BOOL)isInternalToolsButtonHidden
{
  return self->_internalToolsButtonHidden;
}

- (void)setInternalToolsButtonHidden:(BOOL)a3
{
  self->_internalToolsButtonHidden = a3;
}

- (BOOL)onlyC2
{
  return self->_onlyC2;
}

- (void)setOnlyC2:(BOOL)a3
{
  self->_onlyC2 = a3;
}

- (BOOL)highFrameRateInteractiveAnimations
{
  return self->_highFrameRateInteractiveAnimations;
}

- (void)setHighFrameRateInteractiveAnimations:(BOOL)a3
{
  self->_highFrameRateInteractiveAnimations = a3;
}

- (double)viewVisibilityMargin
{
  return self->_viewVisibilityMargin;
}

- (void)setViewVisibilityMargin:(double)a3
{
  self->_viewVisibilityMargin = a3;
}

- (double)viewSpacing
{
  return self->_viewSpacing;
}

- (void)setViewSpacing:(double)a3
{
  self->_viewSpacing = a3;
}

- (double)headerSpacing
{
  return self->_headerSpacing;
}

- (void)setHeaderSpacing:(double)a3
{
  self->_headerSpacing = a3;
}

- (double)viewOverlap
{
  return self->_viewOverlap;
}

- (void)setViewOverlap:(double)a3
{
  self->_viewOverlap = a3;
}

- (double)featuredLeadingViewSpacing
{
  return self->_featuredLeadingViewSpacing;
}

- (void)setFeaturedLeadingViewSpacing:(double)a3
{
  self->_featuredLeadingViewSpacing = a3;
}

- (double)titleViewMargin
{
  return self->_titleViewMargin;
}

- (void)setTitleViewMargin:(double)a3
{
  self->_titleViewMargin = a3;
}

- (double)titleViewHeight
{
  return self->_titleViewHeight;
}

- (void)setTitleViewHeight:(double)a3
{
  self->_titleViewHeight = a3;
}

- (double)animationTension
{
  return self->_animationTension;
}

- (void)setAnimationTension:(double)a3
{
  self->_animationTension = a3;
}

- (double)animationFriction
{
  return self->_animationFriction;
}

- (void)setAnimationFriction:(double)a3
{
  self->_animationFriction = a3;
}

- (double)animationTensionVelocityFactor
{
  return self->_animationTensionVelocityFactor;
}

- (void)setAnimationTensionVelocityFactor:(double)a3
{
  self->_animationTensionVelocityFactor = a3;
}

- (double)animationFrictionVelocityFactor
{
  return self->_animationFrictionVelocityFactor;
}

- (void)setAnimationFrictionVelocityFactor:(double)a3
{
  self->_animationFrictionVelocityFactor = a3;
}

- (double)animationScale
{
  return self->_animationScale;
}

- (void)setAnimationScale:(double)a3
{
  self->_animationScale = a3;
}

- (double)animationScaleGroupInsertion
{
  return self->_animationScaleGroupInsertion;
}

- (void)setAnimationScaleGroupInsertion:(double)a3
{
  self->_animationScaleGroupInsertion = a3;
}

- (double)animationScaleWhileGrouping
{
  return self->_animationScaleWhileGrouping;
}

- (void)setAnimationScaleWhileGrouping:(double)a3
{
  self->_animationScaleWhileGrouping = a3;
}

- (double)animationTranslation
{
  return self->_animationTranslation;
}

- (void)setAnimationTranslation:(double)a3
{
  self->_animationTranslation = a3;
}

- (double)animationTranslationWhileGrouping
{
  return self->_animationTranslationWhileGrouping;
}

- (void)setAnimationTranslationWhileGrouping:(double)a3
{
  self->_animationTranslationWhileGrouping = a3;
}

- (double)animationInsertionStartAlpha
{
  return self->_animationInsertionStartAlpha;
}

- (void)setAnimationInsertionStartAlpha:(double)a3
{
  self->_animationInsertionStartAlpha = a3;
}

- (double)revealHintingAnimationTension
{
  return self->_revealHintingAnimationTension;
}

- (void)setRevealHintingAnimationTension:(double)a3
{
  self->_revealHintingAnimationTension = a3;
}

- (double)revealHintingAnimationFriction
{
  return self->_revealHintingAnimationFriction;
}

- (void)setRevealHintingAnimationFriction:(double)a3
{
  self->_revealHintingAnimationFriction = a3;
}

- (double)revealHintingAnimationTensionVelocityFactor
{
  return self->_revealHintingAnimationTensionVelocityFactor;
}

- (void)setRevealHintingAnimationTensionVelocityFactor:(double)a3
{
  self->_revealHintingAnimationTensionVelocityFactor = a3;
}

- (double)revealHintingAnimationFrictionVelocityFactor
{
  return self->_revealHintingAnimationFrictionVelocityFactor;
}

- (void)setRevealHintingAnimationFrictionVelocityFactor:(double)a3
{
  self->_revealHintingAnimationFrictionVelocityFactor = a3;
}

- (double)revealGestureAnimationRevealDelayStep
{
  return self->_revealGestureAnimationRevealDelayStep;
}

- (void)setRevealGestureAnimationRevealDelayStep:(double)a3
{
  self->_revealGestureAnimationRevealDelayStep = a3;
}

- (double)insertionTension
{
  return self->_insertionTension;
}

- (void)setInsertionTension:(double)a3
{
  self->_insertionTension = a3;
}

- (double)insertionFriction
{
  return self->_insertionFriction;
}

- (void)setInsertionFriction:(double)a3
{
  self->_insertionFriction = a3;
}

- (double)groupListMaxViewCount
{
  return self->_groupListMaxViewCount;
}

- (void)setGroupListMaxViewCount:(double)a3
{
  self->_groupListMaxViewCount = a3;
}

- (double)revealHintingTriggerOffset
{
  return self->_revealHintingTriggerOffset;
}

- (void)setRevealHintingTriggerOffset:(double)a3
{
  self->_revealHintingTriggerOffset = a3;
}

- (double)revealHintingOffset
{
  return self->_revealHintingOffset;
}

- (void)setRevealHintingOffset:(double)a3
{
  self->_revealHintingOffset = a3;
}

- (double)hoverViewMovingTopMargin
{
  return self->_hoverViewMovingTopMargin;
}

- (void)setHoverViewMovingTopMargin:(double)a3
{
  self->_hoverViewMovingTopMargin = a3;
}

- (double)hoverViewTrailingMargin
{
  return self->_hoverViewTrailingMargin;
}

- (void)setHoverViewTrailingMargin:(double)a3
{
  self->_hoverViewTrailingMargin = a3;
}

- (double)hoverViewFadeInsertionMargin
{
  return self->_hoverViewFadeInsertionMargin;
}

- (void)setHoverViewFadeInsertionMargin:(double)a3
{
  self->_hoverViewFadeInsertionMargin = a3;
}

- (double)hoverViewBottomMarginMinimum
{
  return self->_hoverViewBottomMarginMinimum;
}

- (void)setHoverViewBottomMarginMinimum:(double)a3
{
  self->_hoverViewBottomMarginMinimum = a3;
}

- (double)featuredViewOcclusionMinimumAlpha
{
  return self->_featuredViewOcclusionMinimumAlpha;
}

- (void)setFeaturedViewOcclusionMinimumAlpha:(double)a3
{
  self->_featuredViewOcclusionMinimumAlpha = a3;
}

- (double)overlayFooterViewMaxHeight
{
  return self->_overlayFooterViewMaxHeight;
}

- (void)setOverlayFooterViewMaxHeight:(double)a3
{
  self->_overlayFooterViewMaxHeight = a3;
}

- (double)overlayFooterViewAnimationScale
{
  return self->_overlayFooterViewAnimationScale;
}

- (void)setOverlayFooterViewAnimationScale:(double)a3
{
  self->_overlayFooterViewAnimationScale = a3;
}

- (double)interactionTranslationOffsetMax
{
  return self->_interactionTranslationOffsetMax;
}

- (void)setInteractionTranslationOffsetMax:(double)a3
{
  self->_interactionTranslationOffsetMax = a3;
}

- (double)interactionTranslationVerticalOffsetMax
{
  return self->_interactionTranslationVerticalOffsetMax;
}

- (void)setInteractionTranslationVerticalOffsetMax:(double)a3
{
  self->_interactionTranslationVerticalOffsetMax = a3;
}

- (double)interactionTranslationCollapseVerticalOffsetFactor
{
  return self->_interactionTranslationCollapseVerticalOffsetFactor;
}

- (void)setInteractionTranslationCollapseVerticalOffsetFactor:(double)a3
{
  self->_interactionTranslationCollapseVerticalOffsetFactor = a3;
}

- (double)rollUnderScaleMinimum
{
  return self->_rollUnderScaleMinimum;
}

- (void)setRollUnderScaleMinimum:(double)a3
{
  self->_rollUnderScaleMinimum = a3;
}

- (double)rollUnderTranslationMaximum
{
  return self->_rollUnderTranslationMaximum;
}

- (void)setRollUnderTranslationMaximum:(double)a3
{
  self->_rollUnderTranslationMaximum = a3;
}

- (double)rollUnderLimitHeightMax
{
  return self->_rollUnderLimitHeightMax;
}

- (void)setRollUnderLimitHeightMax:(double)a3
{
  self->_rollUnderLimitHeightMax = a3;
}

- (double)rollUnderNotVisibleTranslation
{
  return self->_rollUnderNotVisibleTranslation;
}

- (void)setRollUnderNotVisibleTranslation:(double)a3
{
  self->_rollUnderNotVisibleTranslation = a3;
}

- (double)rollUnderNotRevealedScale
{
  return self->_rollUnderNotRevealedScale;
}

- (void)setRollUnderNotRevealedScale:(double)a3
{
  self->_rollUnderNotRevealedScale = a3;
}

- (double)rollUnderNotRevealedTranslationY
{
  return self->_rollUnderNotRevealedTranslationY;
}

- (void)setRollUnderNotRevealedTranslationY:(double)a3
{
  self->_rollUnderNotRevealedTranslationY = a3;
}

- (double)headerViewInitialOffsetHeightPercentage
{
  return self->_headerViewInitialOffsetHeightPercentage;
}

- (void)setHeaderViewInitialOffsetHeightPercentage:(double)a3
{
  self->_headerViewInitialOffsetHeightPercentage = a3;
}

- (double)headerViewRevealAlphaPercentage
{
  return self->_headerViewRevealAlphaPercentage;
}

- (void)setHeaderViewRevealAlphaPercentage:(double)a3
{
  self->_headerViewRevealAlphaPercentage = a3;
}

- (double)headerViewRemoveAnimationTransform
{
  return self->_headerViewRemoveAnimationTransform;
}

- (void)setHeaderViewRemoveAnimationTransform:(double)a3
{
  self->_headerViewRemoveAnimationTransform = a3;
}

- (double)headerViewRevealBlurRadiusMax
{
  return self->_headerViewRevealBlurRadiusMax;
}

- (void)setHeaderViewRevealBlurRadiusMax:(double)a3
{
  self->_headerViewRevealBlurRadiusMax = a3;
}

- (double)headerViewRevealBlurTranslationDistance
{
  return self->_headerViewRevealBlurTranslationDistance;
}

- (void)setHeaderViewRevealBlurTranslationDistance:(double)a3
{
  self->_headerViewRevealBlurTranslationDistance = a3;
}

- (double)notRevealedPlacementOffset
{
  return self->_notRevealedPlacementOffset;
}

- (void)setNotRevealedPlacementOffset:(double)a3
{
  self->_notRevealedPlacementOffset = a3;
}

- (double)initialLayoutBottomMarginAdjustment
{
  return self->_initialLayoutBottomMarginAdjustment;
}

- (void)setInitialLayoutBottomMarginAdjustment:(double)a3
{
  self->_initialLayoutBottomMarginAdjustment = a3;
}

@end