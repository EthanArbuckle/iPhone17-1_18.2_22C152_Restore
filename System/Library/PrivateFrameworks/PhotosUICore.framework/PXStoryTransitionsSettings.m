@interface PXStoryTransitionsSettings
+ (NSArray)supportedTransitions;
+ (PXStoryTransitionsSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)disableUnsupportedTransitionsAtChapterBoundary;
- (BOOL)suppressInterruptedTransitionErrors;
- (BOOL)suppressInvalidTransitionErrors;
- (BOOL)suppressUnsupportedTransitionErrors;
- (BOOL)useSplitWipeTransitionsFromOneUp;
- (char)forcedTransitionKindAtChapterBoundary;
- (double)crossfadeTransitionCueAlignment;
- (double)cueAlignmentForTransitionKind:(char)a3;
- (double)dividerAnimationDurationFraction;
- (double)exposureBleedTransitionBlurRadius;
- (double)exposureBleedTransitionCueAlignment;
- (double)exposureBleedTransitionExposure;
- (double)exposureBleedTransitionMidpoint;
- (double)fadeToBlackTransitionBlackRelativeDuration;
- (double)fadeToBlackTransitionCueAlignment;
- (double)panTransitionBlurMidpoint;
- (double)panTransitionBlurOffset;
- (double)panTransitionCueAlignment;
- (double)panTransitionMaxIntensity;
- (double)reverseDividerAnimationDurationFraction;
- (double)rotateTransitionAngle;
- (double)rotateTransitionBlurAnimationRelativeDuration;
- (double)rotateTransitionBlurMidpoint;
- (double)rotateTransitionCueAlignment;
- (double)rotateTransitionMaxBlurIntensity;
- (double)scaleTransitionBlurMidpoint;
- (double)scaleTransitionCueAlignment;
- (double)scaleTransitionMaxBlurIntensity;
- (double)scaleTransitionRelativeFactor;
- (double)wipeTransitionCueAlignment;
- (double)zoomTransitionCueAlignment;
- (double)zoomTransitionRelativeFactor;
- (id)parentSettings;
- (unint64_t)transitionQuality;
- (void)setCrossfadeTransitionCueAlignment:(double)a3;
- (void)setDefaultValues;
- (void)setDisableUnsupportedTransitionsAtChapterBoundary:(BOOL)a3;
- (void)setDividerAnimationDurationFraction:(double)a3;
- (void)setExposureBleedTransitionBlurRadius:(double)a3;
- (void)setExposureBleedTransitionCueAlignment:(double)a3;
- (void)setExposureBleedTransitionExposure:(double)a3;
- (void)setExposureBleedTransitionMidpoint:(double)a3;
- (void)setFadeToBlackTransitionBlackRelativeDuration:(double)a3;
- (void)setFadeToBlackTransitionCueAlignment:(double)a3;
- (void)setForcedTransitionKindAtChapterBoundary:(char)a3;
- (void)setPanTransitionBlurMidpoint:(double)a3;
- (void)setPanTransitionBlurOffset:(double)a3;
- (void)setPanTransitionCueAlignment:(double)a3;
- (void)setPanTransitionMaxIntensity:(double)a3;
- (void)setReverseDividerAnimationDurationFraction:(double)a3;
- (void)setRotateTransitionAngle:(double)a3;
- (void)setRotateTransitionBlurAnimationRelativeDuration:(double)a3;
- (void)setRotateTransitionBlurMidpoint:(double)a3;
- (void)setRotateTransitionCueAlignment:(double)a3;
- (void)setRotateTransitionMaxBlurIntensity:(double)a3;
- (void)setScaleTransitionBlurMidpoint:(double)a3;
- (void)setScaleTransitionCueAlignment:(double)a3;
- (void)setScaleTransitionMaxBlurIntensity:(double)a3;
- (void)setScaleTransitionRelativeFactor:(double)a3;
- (void)setSuppressInterruptedTransitionErrors:(BOOL)a3;
- (void)setSuppressInvalidTransitionErrors:(BOOL)a3;
- (void)setSuppressUnsupportedTransitionErrors:(BOOL)a3;
- (void)setTransitionQuality:(unint64_t)a3;
- (void)setUseSplitWipeTransitionsFromOneUp:(BOOL)a3;
- (void)setWipeTransitionCueAlignment:(double)a3;
- (void)setZoomTransitionCueAlignment:(double)a3;
- (void)setZoomTransitionRelativeFactor:(double)a3;
@end

@implementation PXStoryTransitionsSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  if (PXStoryIsSlowDevice_onceToken != -1) {
    dispatch_once(&PXStoryIsSlowDevice_onceToken, &__block_literal_global_1658);
  }
  [(PXStoryTransitionsSettings *)self setTransitionQuality:3];
  [(PXStoryTransitionsSettings *)self setSuppressUnsupportedTransitionErrors:1];
  [(PXStoryTransitionsSettings *)self setSuppressInvalidTransitionErrors:1];
  [(PXStoryTransitionsSettings *)self setSuppressInterruptedTransitionErrors:1];
  [(PXStoryTransitionsSettings *)self setFadeToBlackTransitionBlackRelativeDuration:0.2];
  [(PXStoryTransitionsSettings *)self setFadeToBlackTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setExposureBleedTransitionMidpoint:0.375];
  [(PXStoryTransitionsSettings *)self setExposureBleedTransitionExposure:2.0];
  [(PXStoryTransitionsSettings *)self setExposureBleedTransitionBlurRadius:20.0];
  [(PXStoryTransitionsSettings *)self setExposureBleedTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setUseSplitWipeTransitionsFromOneUp:1];
  [(PXStoryTransitionsSettings *)self setDividerAnimationDurationFraction:0.1];
  [(PXStoryTransitionsSettings *)self setReverseDividerAnimationDurationFraction:0.18];
  [(PXStoryTransitionsSettings *)self setWipeTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setPanTransitionMaxIntensity:0.07];
  [(PXStoryTransitionsSettings *)self setPanTransitionBlurMidpoint:0.16];
  [(PXStoryTransitionsSettings *)self setPanTransitionBlurOffset:0.35];
  [(PXStoryTransitionsSettings *)self setPanTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setScaleTransitionRelativeFactor:1.15];
  [(PXStoryTransitionsSettings *)self setScaleTransitionBlurMidpoint:0.2];
  [(PXStoryTransitionsSettings *)self setScaleTransitionMaxBlurIntensity:0.4];
  [(PXStoryTransitionsSettings *)self setScaleTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setRotateTransitionAngle:15.0];
  [(PXStoryTransitionsSettings *)self setRotateTransitionBlurMidpoint:0.5];
  [(PXStoryTransitionsSettings *)self setRotateTransitionMaxBlurIntensity:0.1];
  [(PXStoryTransitionsSettings *)self setRotateTransitionBlurAnimationRelativeDuration:0.68];
  [(PXStoryTransitionsSettings *)self setRotateTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setZoomTransitionRelativeFactor:2.0];
  [(PXStoryTransitionsSettings *)self setZoomTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setCrossfadeTransitionCueAlignment:1.0];
  [(PXStoryTransitionsSettings *)self setDisableUnsupportedTransitionsAtChapterBoundary:1];
  [(PXStoryTransitionsSettings *)self setForcedTransitionKindAtChapterBoundary:0];
}

- (void)setZoomTransitionRelativeFactor:(double)a3
{
  self->_zoomTransitionRelativeFactor = a3;
}

- (void)setZoomTransitionCueAlignment:(double)a3
{
  self->_zoomTransitionCueAlignment = a3;
}

- (void)setWipeTransitionCueAlignment:(double)a3
{
  self->_wipeTransitionCueAlignment = a3;
}

- (void)setUseSplitWipeTransitionsFromOneUp:(BOOL)a3
{
  self->_useSplitWipeTransitionsFromOneUp = a3;
}

- (void)setTransitionQuality:(unint64_t)a3
{
  self->_transitionQuality = a3;
}

- (void)setSuppressUnsupportedTransitionErrors:(BOOL)a3
{
  self->_suppressUnsupportedTransitionErrors = a3;
}

- (void)setSuppressInvalidTransitionErrors:(BOOL)a3
{
  self->_suppressInvalidTransitionErrors = a3;
}

- (void)setSuppressInterruptedTransitionErrors:(BOOL)a3
{
  self->_suppressInterruptedTransitionErrors = a3;
}

- (void)setScaleTransitionRelativeFactor:(double)a3
{
  self->_scaleTransitionRelativeFactor = a3;
}

- (void)setScaleTransitionMaxBlurIntensity:(double)a3
{
  self->_scaleTransitionMaxBlurIntensity = a3;
}

- (void)setScaleTransitionCueAlignment:(double)a3
{
  self->_scaleTransitionCueAlignment = a3;
}

- (void)setScaleTransitionBlurMidpoint:(double)a3
{
  self->_scaleTransitionBlurMidpoint = a3;
}

- (void)setRotateTransitionMaxBlurIntensity:(double)a3
{
  self->_rotateTransitionMaxBlurIntensity = a3;
}

- (void)setRotateTransitionCueAlignment:(double)a3
{
  self->_rotateTransitionCueAlignment = a3;
}

- (void)setRotateTransitionBlurMidpoint:(double)a3
{
  self->_rotateTransitionBlurMidpoint = a3;
}

- (void)setRotateTransitionBlurAnimationRelativeDuration:(double)a3
{
  self->_rotateTransitionBlurAnimationRelativeDuration = a3;
}

- (void)setRotateTransitionAngle:(double)a3
{
  self->_rotateTransitionAngle = a3;
}

- (void)setReverseDividerAnimationDurationFraction:(double)a3
{
  self->_reverseDividerAnimationDurationFraction = a3;
}

- (void)setPanTransitionMaxIntensity:(double)a3
{
  self->_panTransitionMaxIntensity = a3;
}

- (void)setPanTransitionCueAlignment:(double)a3
{
  self->_panTransitionCueAlignment = a3;
}

- (void)setPanTransitionBlurOffset:(double)a3
{
  self->_panTransitionBlurOffset = a3;
}

- (void)setPanTransitionBlurMidpoint:(double)a3
{
  self->_panTransitionBlurMidpoint = a3;
}

- (void)setForcedTransitionKindAtChapterBoundary:(char)a3
{
  self->_forcedTransitionKindAtChapterBoundary = a3;
}

- (void)setFadeToBlackTransitionCueAlignment:(double)a3
{
  self->_fadeToBlackTransitionCueAlignment = a3;
}

- (void)setFadeToBlackTransitionBlackRelativeDuration:(double)a3
{
  self->_fadeToBlackTransitionBlackRelativeDuration = a3;
}

- (void)setExposureBleedTransitionMidpoint:(double)a3
{
  self->_exposureBleedTransitionMidpoint = a3;
}

- (void)setExposureBleedTransitionExposure:(double)a3
{
  self->_exposureBleedTransitionExposure = a3;
}

- (void)setExposureBleedTransitionCueAlignment:(double)a3
{
  self->_exposureBleedTransitionCueAlignment = a3;
}

- (void)setExposureBleedTransitionBlurRadius:(double)a3
{
  self->_exposureBleedTransitionBlurRadius = a3;
}

- (void)setDividerAnimationDurationFraction:(double)a3
{
  self->_dividerAnimationDurationFraction = a3;
}

- (void)setDisableUnsupportedTransitionsAtChapterBoundary:(BOOL)a3
{
  self->_disableUnsupportedTransitionsAtChapterBoundary = a3;
}

- (void)setCrossfadeTransitionCueAlignment:(double)a3
{
  self->_crossfadeTransitionCueAlignment = a3;
}

+ (id)settingsControllerModule
{
  v163[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v112 = (id)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v152 = NSStringFromSelector(sel_suppressUnsupportedTransitionErrors);
  v151 = [v3 rowWithTitle:@"Suppress Unsupported Transition Errors" valueKeyPath:v152];
  v162[0] = v151;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v150 = NSStringFromSelector(sel_suppressInvalidTransitionErrors);
  v149 = [v4 rowWithTitle:@"Suppress Invalid Transition Errors" valueKeyPath:v150];
  v162[1] = v149;
  v5 = (void *)MEMORY[0x1E4F941F0];
  v148 = NSStringFromSelector(sel_suppressInterruptedTransitionErrors);
  v147 = [v5 rowWithTitle:@"Suppress Interrupted Transition Errors" valueKeyPath:v148];
  v162[2] = v147;
  v146 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:3];
  v145 = [v2 sectionWithRows:v146 title:@"Errors"];
  v163[0] = v145;
  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = (void *)MEMORY[0x1E4F941D8];
  v144 = NSStringFromSelector(sel_exposureBleedTransitionMidpoint);
  v143 = [v7 rowWithTitle:@"Midpoint" valueKeyPath:v144];
  v142 = [v143 minValue:0.0 maxValue:1.0];
  v161[0] = v142;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v141 = NSStringFromSelector(sel_exposureBleedTransitionExposure);
  v140 = [v8 rowWithTitle:@"Exposure" valueKeyPath:v141];
  v139 = [v140 minValue:0.0 maxValue:5.0];
  v161[1] = v139;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v138 = NSStringFromSelector(sel_exposureBleedTransitionBlurRadius);
  v137 = [v9 rowWithTitle:@"Blur Radius" valueKeyPath:v138];
  v136 = [v137 minValue:0.0 maxValue:50.0];
  v161[2] = v136;
  v10 = (void *)MEMORY[0x1E4F941D8];
  v135 = NSStringFromSelector(sel_exposureBleedTransitionCueAlignment);
  v134 = [v10 rowWithTitle:@"Alignment" valueKeyPath:v135];
  v133 = [v134 minValue:0.0 maxValue:1.0];
  v161[3] = v133;
  v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:4];
  v131 = [v6 sectionWithRows:v132 title:@"Exposure Bleed Transition"];
  v163[1] = v131;
  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = (void *)MEMORY[0x1E4F941D8];
  v130 = NSStringFromSelector(sel_fadeToBlackTransitionBlackRelativeDuration);
  v129 = [v12 rowWithTitle:@"Fade to Black % of Black" valueKeyPath:v130];
  v128 = [v129 minValue:0.0 maxValue:1.0];
  v160[0] = v128;
  v13 = (void *)MEMORY[0x1E4F941D8];
  v127 = NSStringFromSelector(sel_fadeToBlackTransitionCueAlignment);
  v126 = [v13 rowWithTitle:@"Alignment" valueKeyPath:v127];
  v125 = [v126 minValue:0.0 maxValue:1.0];
  v160[1] = v125;
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:2];
  v123 = [v11 sectionWithRows:v124 title:@"Fade to Black Transition"];
  v163[2] = v123;
  v14 = (void *)MEMORY[0x1E4F94160];
  v15 = (void *)MEMORY[0x1E4F941F0];
  v122 = NSStringFromSelector(sel_useSplitWipeTransitionsFromOneUp);
  v121 = [v15 rowWithTitle:@"Force Split Wipes (1-Up → N-Up)" valueKeyPath:v122];
  v159[0] = v121;
  v16 = (void *)MEMORY[0x1E4F941D8];
  v120 = NSStringFromSelector(sel_dividerAnimationDurationFraction);
  v119 = [v16 rowWithTitle:@"Divider Animation Duration %" valueKeyPath:v120];
  v118 = [v119 minValue:0.00999999978 maxValue:1.0];
  v159[1] = v118;
  v17 = (void *)MEMORY[0x1E4F941D8];
  v117 = NSStringFromSelector(sel_reverseDividerAnimationDurationFraction);
  v116 = [v17 rowWithTitle:@"Reverse Divider Animation Duration %" valueKeyPath:v117];
  v115 = [v116 minValue:0.00999999978 maxValue:1.0];
  v159[2] = v115;
  v18 = (void *)MEMORY[0x1E4F941D8];
  v114 = NSStringFromSelector(sel_wipeTransitionCueAlignment);
  v111 = [v18 rowWithTitle:@"Alignment" valueKeyPath:v114];
  v110 = [v111 minValue:0.0 maxValue:1.0];
  v159[3] = v110;
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:4];
  v108 = [v14 sectionWithRows:v109 title:@"Wipe Transition"];
  v163[3] = v108;
  v19 = (void *)MEMORY[0x1E4F94160];
  v20 = (void *)MEMORY[0x1E4F941D8];
  v107 = NSStringFromSelector(sel_panTransitionMaxIntensity);
  v106 = [v20 rowWithTitle:@"Blur Max Intensity" valueKeyPath:v107];
  v105 = [v106 minValue:0.0 maxValue:1.0];
  v158[0] = v105;
  v21 = (void *)MEMORY[0x1E4F941D8];
  v104 = NSStringFromSelector(sel_panTransitionBlurMidpoint);
  v103 = [v21 rowWithTitle:@"Blur Midpoint" valueKeyPath:v104];
  v102 = [v103 minValue:0.0 maxValue:1.0];
  v158[1] = v102;
  v22 = (void *)MEMORY[0x1E4F941D8];
  v101 = NSStringFromSelector(sel_panTransitionBlurOffset);
  v100 = [v22 rowWithTitle:@"Blur Offset From End" valueKeyPath:v101];
  v99 = [v100 minValue:0.0 maxValue:1.0];
  v158[2] = v99;
  v23 = (void *)MEMORY[0x1E4F941D8];
  v98 = NSStringFromSelector(sel_panTransitionCueAlignment);
  v97 = [v23 rowWithTitle:@"Alignment" valueKeyPath:v98];
  v96 = [v97 minValue:0.0 maxValue:1.0];
  v158[3] = v96;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:4];
  v94 = [v19 sectionWithRows:v95 title:@"Pan Transition"];
  v163[4] = v94;
  v24 = (void *)MEMORY[0x1E4F94160];
  v25 = (void *)MEMORY[0x1E4F941D8];
  v93 = NSStringFromSelector(sel_scaleTransitionRelativeFactor);
  v92 = [v25 rowWithTitle:@"Relative Scale Factor" valueKeyPath:v93];
  v91 = [v92 minValue:0.0 maxValue:5.0];
  v157[0] = v91;
  v26 = (void *)MEMORY[0x1E4F941D8];
  v90 = NSStringFromSelector(sel_scaleTransitionBlurMidpoint);
  v89 = [v26 rowWithTitle:@"Blur Midpoint" valueKeyPath:v90];
  v88 = [v89 minValue:0.0 maxValue:1.0];
  v157[1] = v88;
  v27 = (void *)MEMORY[0x1E4F941D8];
  v87 = NSStringFromSelector(sel_scaleTransitionMaxBlurIntensity);
  v86 = [v27 rowWithTitle:@"Blur Max Intensity" valueKeyPath:v87];
  v85 = [v86 minValue:0.0 maxValue:1.0];
  v157[2] = v85;
  v28 = (void *)MEMORY[0x1E4F941D8];
  v84 = NSStringFromSelector(sel_scaleTransitionCueAlignment);
  v83 = [v28 rowWithTitle:@"Alignment" valueKeyPath:v84];
  v82 = [v83 minValue:0.0 maxValue:1.0];
  v157[3] = v82;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:4];
  v80 = [v24 sectionWithRows:v81 title:@"Scale Transition"];
  v163[5] = v80;
  v29 = (void *)MEMORY[0x1E4F94160];
  v30 = (void *)MEMORY[0x1E4F941D8];
  v79 = NSStringFromSelector(sel_rotateTransitionAngle);
  v78 = [v30 rowWithTitle:@"Angle" valueKeyPath:v79];
  v77 = [v78 minValue:0.0 maxValue:180.0];
  v156[0] = v77;
  v31 = (void *)MEMORY[0x1E4F941D8];
  v76 = NSStringFromSelector(sel_rotateTransitionBlurMidpoint);
  v75 = [v31 rowWithTitle:@"Blur Midpoint" valueKeyPath:v76];
  v74 = [v75 minValue:0.0 maxValue:1.0];
  v156[1] = v74;
  v32 = (void *)MEMORY[0x1E4F941D8];
  v73 = NSStringFromSelector(sel_rotateTransitionMaxBlurIntensity);
  v72 = [v32 rowWithTitle:@"Blur Max Intensity" valueKeyPath:v73];
  v71 = [v72 minValue:0.0 maxValue:1.0];
  v156[2] = v71;
  v33 = (void *)MEMORY[0x1E4F941D8];
  v70 = NSStringFromSelector(sel_rotateTransitionBlurAnimationRelativeDuration);
  v69 = [v33 rowWithTitle:@"Blur Relative Duration" valueKeyPath:v70];
  v68 = [v69 minValue:0.5 maxValue:1.0];
  v156[3] = v68;
  v34 = (void *)MEMORY[0x1E4F941D8];
  v67 = NSStringFromSelector(sel_rotateTransitionCueAlignment);
  v66 = [v34 rowWithTitle:@"Alignment" valueKeyPath:v67];
  v65 = [v66 minValue:0.0 maxValue:1.0];
  v156[4] = v65;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:5];
  v63 = [v29 sectionWithRows:v64 title:@"Rotate Transition"];
  v163[6] = v63;
  v35 = (void *)MEMORY[0x1E4F94160];
  v36 = (void *)MEMORY[0x1E4F941D8];
  v62 = NSStringFromSelector(sel_crossfadeTransitionCueAlignment);
  v61 = [v36 rowWithTitle:@"Alignment" valueKeyPath:v62];
  v60 = [v61 minValue:0.0 maxValue:1.0];
  v155 = v60;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
  v58 = [v35 sectionWithRows:v59 title:@"Crossfade Transition"];
  v163[7] = v58;
  v37 = (void *)MEMORY[0x1E4F94160];
  v38 = (void *)MEMORY[0x1E4F941D8];
  v57 = NSStringFromSelector(sel_zoomTransitionCueAlignment);
  v56 = [v38 rowWithTitle:@"Alignment" valueKeyPath:v57];
  v55 = [v56 minValue:0.0 maxValue:1.0];
  v154 = v55;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
  v53 = [v37 sectionWithRows:v54 title:@"Zoom Transition"];
  v163[8] = v53;
  v39 = (void *)MEMORY[0x1E4F94160];
  v40 = (void *)MEMORY[0x1E4F941F0];
  v41 = NSStringFromSelector(sel_disableUnsupportedTransitionsAtChapterBoundary);
  v42 = [v40 rowWithTitle:@"Disable Unsupported Transitions" valueKeyPath:v41];
  v153[0] = v42;
  v43 = (void *)MEMORY[0x1E4F94108];
  v44 = NSStringFromSelector(sel_forcedTransitionKindAtChapterBoundary);
  v45 = [v43 rowWithTitle:@"Forced Transition Kind" valueKeyPath:v44];
  v46 = objc_msgSend(MEMORY[0x1E4F1C978], "px_integersFrom:to:", 0, 8);
  v47 = objc_msgSend(v45, "px_possibleValues:formatter:", v46, &__block_literal_global_195030);
  v153[1] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:2];
  v49 = [v39 sectionWithRows:v48 title:@"Chapter Boundaries"];
  v163[9] = v49;
  v50 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v163[10] = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:11];
  id v113 = [v112 moduleWithTitle:@"Transitions" contents:v51];

  return v113;
}

__CFString *__58__PXStoryTransitionsSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = [a2 integerValue];
  if (v2 > 0xAu) {
    return @"??";
  }
  else {
    return off_1E5DC5088[v2];
  }
}

- (char)forcedTransitionKindAtChapterBoundary
{
  return self->_forcedTransitionKindAtChapterBoundary;
}

- (BOOL)disableUnsupportedTransitionsAtChapterBoundary
{
  return self->_disableUnsupportedTransitionsAtChapterBoundary;
}

- (double)crossfadeTransitionCueAlignment
{
  return self->_crossfadeTransitionCueAlignment;
}

- (double)zoomTransitionCueAlignment
{
  return self->_zoomTransitionCueAlignment;
}

- (double)zoomTransitionRelativeFactor
{
  return self->_zoomTransitionRelativeFactor;
}

- (double)rotateTransitionCueAlignment
{
  return self->_rotateTransitionCueAlignment;
}

- (double)rotateTransitionBlurAnimationRelativeDuration
{
  return self->_rotateTransitionBlurAnimationRelativeDuration;
}

- (double)rotateTransitionMaxBlurIntensity
{
  return self->_rotateTransitionMaxBlurIntensity;
}

- (double)rotateTransitionBlurMidpoint
{
  return self->_rotateTransitionBlurMidpoint;
}

- (double)rotateTransitionAngle
{
  return self->_rotateTransitionAngle;
}

- (double)scaleTransitionCueAlignment
{
  return self->_scaleTransitionCueAlignment;
}

- (double)scaleTransitionMaxBlurIntensity
{
  return self->_scaleTransitionMaxBlurIntensity;
}

- (double)scaleTransitionBlurMidpoint
{
  return self->_scaleTransitionBlurMidpoint;
}

- (double)scaleTransitionRelativeFactor
{
  return self->_scaleTransitionRelativeFactor;
}

- (double)panTransitionCueAlignment
{
  return self->_panTransitionCueAlignment;
}

- (double)panTransitionBlurOffset
{
  return self->_panTransitionBlurOffset;
}

- (double)panTransitionBlurMidpoint
{
  return self->_panTransitionBlurMidpoint;
}

- (double)panTransitionMaxIntensity
{
  return self->_panTransitionMaxIntensity;
}

- (double)wipeTransitionCueAlignment
{
  return self->_wipeTransitionCueAlignment;
}

- (double)reverseDividerAnimationDurationFraction
{
  return self->_reverseDividerAnimationDurationFraction;
}

- (double)dividerAnimationDurationFraction
{
  return self->_dividerAnimationDurationFraction;
}

- (BOOL)useSplitWipeTransitionsFromOneUp
{
  return self->_useSplitWipeTransitionsFromOneUp;
}

- (double)fadeToBlackTransitionCueAlignment
{
  return self->_fadeToBlackTransitionCueAlignment;
}

- (double)fadeToBlackTransitionBlackRelativeDuration
{
  return self->_fadeToBlackTransitionBlackRelativeDuration;
}

- (double)exposureBleedTransitionCueAlignment
{
  return self->_exposureBleedTransitionCueAlignment;
}

- (double)exposureBleedTransitionBlurRadius
{
  return self->_exposureBleedTransitionBlurRadius;
}

- (double)exposureBleedTransitionExposure
{
  return self->_exposureBleedTransitionExposure;
}

- (double)exposureBleedTransitionMidpoint
{
  return self->_exposureBleedTransitionMidpoint;
}

- (BOOL)suppressInterruptedTransitionErrors
{
  return self->_suppressInterruptedTransitionErrors;
}

- (BOOL)suppressInvalidTransitionErrors
{
  return self->_suppressInvalidTransitionErrors;
}

- (BOOL)suppressUnsupportedTransitionErrors
{
  return self->_suppressUnsupportedTransitionErrors;
}

- (unint64_t)transitionQuality
{
  return self->_transitionQuality;
}

- (double)cueAlignmentForTransitionKind:(char)a3
{
  switch(a3)
  {
    case 2:
      [(PXStoryTransitionsSettings *)self crossfadeTransitionCueAlignment];
      break;
    case 3:
      [(PXStoryTransitionsSettings *)self fadeToBlackTransitionCueAlignment];
      break;
    case 4:
      [(PXStoryTransitionsSettings *)self exposureBleedTransitionCueAlignment];
      break;
    case 5:
      [(PXStoryTransitionsSettings *)self panTransitionCueAlignment];
      break;
    case 6:
      [(PXStoryTransitionsSettings *)self scaleTransitionCueAlignment];
      break;
    case 7:
      [(PXStoryTransitionsSettings *)self rotateTransitionCueAlignment];
      break;
    case 8:
      [(PXStoryTransitionsSettings *)self wipeTransitionCueAlignment];
      break;
    case 9:
      [(PXStoryTransitionsSettings *)self zoomTransitionCueAlignment];
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance];
}

+ (NSArray)supportedTransitions
{
  return (NSArray *)&unk_1F02D55F0;
}

+ (PXStoryTransitionsSettings)sharedInstance
{
  if (sharedInstance_onceToken_267299 != -1) {
    dispatch_once(&sharedInstance_onceToken_267299, &__block_literal_global_267300);
  }
  unsigned __int8 v2 = (void *)sharedInstance_sharedInstance_267301;
  return (PXStoryTransitionsSettings *)v2;
}

void __44__PXStoryTransitionsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXStorySettings sharedInstance];
  uint64_t v0 = [v2 transitionsSettings];
  v1 = (void *)sharedInstance_sharedInstance_267301;
  sharedInstance_sharedInstance_267301 = v0;
}

@end