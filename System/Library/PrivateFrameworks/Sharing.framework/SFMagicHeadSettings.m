@interface SFMagicHeadSettings
+ (id)settingsControllerModule;
- (BOOL)cozyUpAnimationEnabled;
- (BOOL)guidanceEnabled;
- (BOOL)hapticForCozyUpSelectionEnabled;
- (BOOL)rollEnabled;
- (BOOL)rotationGatedSelectionEnabled;
- (BOOL)selectedPulseEnabled;
- (BOOL)selectionDisabled;
- (BOOL)showRangingValues;
- (BOOL)showSelectionGateLock;
- (BOOL)showSelectionMarkers;
- (double)circlesFadeInDurationS;
- (double)circlesFadeOutDurationS;
- (double)cozyUpSelectDurationS;
- (double)dismissAlphaFriction;
- (double)dismissPositionFriction;
- (double)dismissScaleFriction;
- (double)guidanceContractDotsHapticEnabled;
- (double)guidanceDipSpeed;
- (double)guidanceExpandDotsHapticEnabled;
- (double)guidanceFadeHeadDegrees;
- (double)guidanceGoodAngleThreshold;
- (double)guidanceRecoveredDegreesDelta;
- (double)guidanceRestoreHeadDegreesDelta;
- (double)guidanceRubberbandingStretchiness;
- (double)guidanceSuppressHapticsDurationS;
- (double)guidanceSuppressHapticsEnabled;
- (double)guidanceTiltedTooFarAlpha;
- (double)guidanceTooFarDegrees;
- (double)guidanceWorstAngleDegreesDelta;
- (double)rollMaxDegrees;
- (double)rollRubberbandingStretchiness;
- (double)rotationGateThresholdDegrees;
- (double)selectedPulseDurationS;
- (double)selectedPulseScaleAmount;
- (double)selectionAlphaFriction;
- (double)selectionPositionFriction;
- (double)selectionScaleFriction;
- (double)tapDarkeningAlpha;
- (int64_t)rotationStartBigHeadGatingResponsiveness;
- (int64_t)rotationStartGatingResponsiveness;
- (int64_t)rotationStopBigHeadGatingResponsiveness;
- (int64_t)rotationStopGatingResponsiveness;
- (void)setCirclesFadeInDurationS:(double)a3;
- (void)setCirclesFadeOutDurationS:(double)a3;
- (void)setCozyUpAnimationEnabled:(BOOL)a3;
- (void)setCozyUpSelectDurationS:(double)a3;
- (void)setDefaultValues;
- (void)setDismissAlphaFriction:(double)a3;
- (void)setDismissPositionFriction:(double)a3;
- (void)setDismissScaleFriction:(double)a3;
- (void)setGuidanceContractDotsHapticEnabled:(double)a3;
- (void)setGuidanceDipSpeed:(double)a3;
- (void)setGuidanceEnabled:(BOOL)a3;
- (void)setGuidanceExpandDotsHapticEnabled:(double)a3;
- (void)setGuidanceFadeHeadDegrees:(double)a3;
- (void)setGuidanceGoodAngleThreshold:(double)a3;
- (void)setGuidanceRecoveredDegreesDelta:(double)a3;
- (void)setGuidanceRestoreHeadDegreesDelta:(double)a3;
- (void)setGuidanceRubberbandingStretchiness:(double)a3;
- (void)setGuidanceSuppressHapticsDurationS:(double)a3;
- (void)setGuidanceSuppressHapticsEnabled:(double)a3;
- (void)setGuidanceTiltedTooFarAlpha:(double)a3;
- (void)setGuidanceTooFarDegrees:(double)a3;
- (void)setGuidanceWorstAngleDegreesDelta:(double)a3;
- (void)setHapticForCozyUpSelectionEnabled:(BOOL)a3;
- (void)setRollEnabled:(BOOL)a3;
- (void)setRollMaxDegrees:(double)a3;
- (void)setRollRubberbandingStretchiness:(double)a3;
- (void)setRotationGateThresholdDegrees:(double)a3;
- (void)setRotationGatedSelectionEnabled:(BOOL)a3;
- (void)setRotationStartBigHeadGatingResponsiveness:(int64_t)a3;
- (void)setRotationStartGatingResponsiveness:(int64_t)a3;
- (void)setRotationStopBigHeadGatingResponsiveness:(int64_t)a3;
- (void)setRotationStopGatingResponsiveness:(int64_t)a3;
- (void)setSelectedPulseDurationS:(double)a3;
- (void)setSelectedPulseEnabled:(BOOL)a3;
- (void)setSelectedPulseScaleAmount:(double)a3;
- (void)setSelectionAlphaFriction:(double)a3;
- (void)setSelectionDisabled:(BOOL)a3;
- (void)setSelectionPositionFriction:(double)a3;
- (void)setSelectionScaleFriction:(double)a3;
- (void)setShowRangingValues:(BOOL)a3;
- (void)setShowSelectionGateLock:(BOOL)a3;
- (void)setShowSelectionMarkers:(BOOL)a3;
- (void)setTapDarkeningAlpha:(double)a3;
@end

@implementation SFMagicHeadSettings

- (void)setDefaultValues
{
  [(SFMagicHeadSettings *)self setShowRangingValues:0];
  [(SFMagicHeadSettings *)self setShowSelectionGateLock:0];
  [(SFMagicHeadSettings *)self setShowSelectionMarkers:0];
  [(SFMagicHeadSettings *)self setSelectionDisabled:0];
  [(SFMagicHeadSettings *)self setTapDarkeningAlpha:0.2];
  [(SFMagicHeadSettings *)self setCirclesFadeInDurationS:0.3];
  [(SFMagicHeadSettings *)self setCirclesFadeOutDurationS:0.7];
  [(SFMagicHeadSettings *)self setRollEnabled:1];
  [(SFMagicHeadSettings *)self setRollMaxDegrees:1.0];
  [(SFMagicHeadSettings *)self setRollRubberbandingStretchiness:5.0];
  [(SFMagicHeadSettings *)self setGuidanceEnabled:1];
  [(SFMagicHeadSettings *)self setGuidanceGoodAngleThreshold:15.0];
  [(SFMagicHeadSettings *)self setGuidanceWorstAngleDegreesDelta:15.0];
  [(SFMagicHeadSettings *)self setGuidanceDipSpeed:10.0];
  [(SFMagicHeadSettings *)self setGuidanceRubberbandingStretchiness:90.0];
  [(SFMagicHeadSettings *)self setGuidanceFadeHeadDegrees:15.0];
  [(SFMagicHeadSettings *)self setGuidanceRestoreHeadDegreesDelta:10.0];
  [(SFMagicHeadSettings *)self setGuidanceTooFarDegrees:4.0];
  [(SFMagicHeadSettings *)self setGuidanceRecoveredDegreesDelta:5.0];
  [(SFMagicHeadSettings *)self setGuidanceTiltedTooFarAlpha:0.42];
  [(SFMagicHeadSettings *)self setGuidanceSuppressHapticsEnabled:0.0];
  [(SFMagicHeadSettings *)self setGuidanceSuppressHapticsDurationS:5.0];
  [(SFMagicHeadSettings *)self setGuidanceContractDotsHapticEnabled:1.0];
  [(SFMagicHeadSettings *)self setGuidanceExpandDotsHapticEnabled:1.0];
  [(SFMagicHeadSettings *)self setRotationGatedSelectionEnabled:0];
  [(SFMagicHeadSettings *)self setRotationGateThresholdDegrees:0.1];
  [(SFMagicHeadSettings *)self setRotationStartGatingResponsiveness:5];
  [(SFMagicHeadSettings *)self setRotationStopGatingResponsiveness:20];
  [(SFMagicHeadSettings *)self setRotationStartBigHeadGatingResponsiveness:60];
  [(SFMagicHeadSettings *)self setRotationStopBigHeadGatingResponsiveness:200];
  [(SFMagicHeadSettings *)self setSelectionScaleFriction:40.0];
  [(SFMagicHeadSettings *)self setSelectionAlphaFriction:70.17];
  [(SFMagicHeadSettings *)self setSelectionPositionFriction:30.17];
  [(SFMagicHeadSettings *)self setDismissScaleFriction:40.0];
  [(SFMagicHeadSettings *)self setDismissAlphaFriction:60.17];
  [(SFMagicHeadSettings *)self setDismissPositionFriction:40.0];
  [(SFMagicHeadSettings *)self setHapticForCozyUpSelectionEnabled:0];
  [(SFMagicHeadSettings *)self setCozyUpAnimationEnabled:1];
  [(SFMagicHeadSettings *)self setCozyUpSelectDurationS:0.65];
  [(SFMagicHeadSettings *)self setSelectedPulseEnabled:1];
  [(SFMagicHeadSettings *)self setSelectedPulseDurationS:0.4];

  [(SFMagicHeadSettings *)self setSelectedPulseScaleAmount:1.04];
}

+ (id)settingsControllerModule
{
  v145[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F940F8];
  v3 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v124 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94160];
  v145[0] = v124;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:1];
  v133 = [v4 sectionWithRows:v5];

  v123 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Ranging Values" valueKeyPath:@"showRangingValues"];
  v122 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Selection Lock" valueKeyPath:@"showSelectionGateLock"];
  v121 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Selection Markers" valueKeyPath:@"showSelectionMarkers"];
  v120 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Selection Disabled" valueKeyPath:@"selectionDisabled"];
  v119 = [MEMORY[0x1E4F94148] rowWithTitle:@"Tap Darkening Alpha" valueKeyPath:@"tapDarkeningAlpha"];
  v6 = (void *)MEMORY[0x1E4F94160];
  v144[0] = v123;
  v144[1] = v122;
  v144[2] = v121;
  v144[3] = v120;
  v144[4] = v119;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:5];
  v132 = [v6 sectionWithRows:v7 title:@"UI Settings"];

  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Circles Fade In S" valueKeyPath:@"circlesFadeInDurationS"];
  v118 = [v8 minValue:0.1 maxValue:1.0];

  v9 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Circles Fade Out S" valueKeyPath:@"circlesFadeOutDurationS"];
  v117 = [v9 minValue:0.1 maxValue:1.0];

  v10 = (void *)MEMORY[0x1E4F94160];
  v143[0] = v118;
  v143[1] = v117;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];
  v131 = [v10 sectionWithRows:v11 title:@"Little Head Settings"];

  v116 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Roll Enabled" valueKeyPath:@"rollEnabled"];
  v12 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Max °" valueKeyPath:@"rollMaxDegrees"];
  v13 = [v12 minValue:0.0 maxValue:15.0];
  v115 = [v13 valueValidator:&__block_literal_global_2];

  v14 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Rubber stretch" valueKeyPath:@"rollRubberbandingStretchiness"];
  v15 = [v14 minValue:0.0 maxValue:10.0];
  v114 = [v15 valueValidator:&__block_literal_global_2];

  v16 = (void *)MEMORY[0x1E4F94160];
  v142[0] = v116;
  v142[1] = v115;
  v142[2] = v114;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:3];
  v130 = [v16 sectionWithRows:v17 title:@"Roll Settings"];

  v129 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Guidance Enabled" valueKeyPath:@"guidanceEnabled"];
  v18 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Good ° Threshold" valueKeyPath:@"guidanceGoodAngleThreshold"];
  v19 = [v18 minValue:10.0 maxValue:50.0];
  v128 = [v19 valueValidator:&__block_literal_global_2];

  v20 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Worst ° Delta" valueKeyPath:@"guidanceWorstAngleDegreesDelta"];
  v21 = [v20 minValue:10.0 maxValue:50.0];
  v127 = [v21 valueValidator:&__block_literal_global_2];

  v22 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Dip Speed" valueKeyPath:@"guidanceDipSpeed"];
  v23 = [v22 minValue:0.0 maxValue:5.0];
  v113 = [v23 valueValidator:&__block_literal_global_2];

  v24 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Rubber Stretch" valueKeyPath:@"guidanceRubberbandingStretchiness"];
  v25 = [v24 minValue:10.0 maxValue:150.0];
  v112 = [v25 valueValidator:&__block_literal_global_4];

  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Fade Head °" valueKeyPath:@"guidanceFadeHeadDegrees"];
  v27 = [v26 minValue:10.0 maxValue:50.0];
  v111 = [v27 valueValidator:&__block_literal_global_2];

  v28 = [MEMORY[0x1E4F941D8] rowWithTitle:@"RestoreHead ° Delta" valueKeyPath:@"guidanceRestoreHeadDegreesDelta"];
  v29 = [v28 minValue:0.0 maxValue:40.0];
  v110 = [v29 valueValidator:&__block_literal_global_2];

  v30 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Too Far °" valueKeyPath:@"guidanceTooFarDegrees"];
  v31 = [v30 minValue:-10.0 maxValue:30.0];
  v109 = [v31 valueValidator:&__block_literal_global_2];

  v32 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Recovered °" valueKeyPath:@"guidanceRecoveredDegreesDelta"];
  v33 = [v32 minValue:0.0 maxValue:30.0];
  v108 = [v33 valueValidator:&__block_literal_global_2];

  v34 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Too Far Alpha" valueKeyPath:@"guidanceTiltedTooFarAlpha"];
  v107 = [v34 minValue:0.1 maxValue:1.0];

  v35 = (void *)MEMORY[0x1E4F94160];
  v141[0] = v129;
  v141[1] = v128;
  v141[2] = v127;
  v141[3] = v113;
  v141[4] = v112;
  v141[5] = v111;
  v141[6] = v110;
  v141[7] = v109;
  v141[8] = v108;
  v141[9] = v107;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:10];
  v126 = [v35 sectionWithRows:v36 title:@"Guidance Settings"];

  v106 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Timed Suppression" valueKeyPath:@"guidanceSuppressHapticsEnabled"];
  v37 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Suppress Dur Sec" valueKeyPath:@"guidanceSuppressHapticsDurationS"];
  v38 = [v37 minValue:0.5 maxValue:20.0];
  v105 = [v38 valueValidator:&__block_literal_global_4];

  v104 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Dots Contract Haptic" valueKeyPath:@"guidanceContractDotsHapticEnabled"];
  v103 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Dots Expand Haptic" valueKeyPath:@"guidanceExpandDotsHapticEnabled"];
  v39 = (void *)MEMORY[0x1E4F94160];
  v140[0] = v106;
  v140[1] = v105;
  v140[2] = v104;
  v140[3] = v103;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:4];
  v125 = [v39 sectionWithRows:v40 title:@"Guidance Haptic Settings"];

  v102 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enabled" valueKeyPath:@"rotationGatedSelectionEnabled"];
  v41 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Threshold °" valueKeyPath:@"rotationGateThresholdDegrees"];
  v101 = [v41 minValue:0.01 maxValue:1.0];

  v42 = [MEMORY[0x1E4F941D8] rowWithTitle:@"MH Start" valueKeyPath:@"rotationStartGatingResponsiveness"];
  v43 = [v42 minValue:1.0 maxValue:40.0];
  v100 = [v43 valueValidator:&__block_literal_global_4];

  v44 = [MEMORY[0x1E4F941D8] rowWithTitle:@"MH Stop" valueKeyPath:@"rotationStopGatingResponsiveness"];
  v45 = [v44 minValue:1.0 maxValue:100.0];
  v99 = [v45 valueValidator:&__block_literal_global_4];

  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"BigHead Start" valueKeyPath:@"rotationStartBigHeadGatingResponsiveness"];
  v47 = [v46 minValue:1.0 maxValue:100.0];
  v98 = [v47 valueValidator:&__block_literal_global_4];

  v48 = [MEMORY[0x1E4F941D8] rowWithTitle:@"BigHead Stop" valueKeyPath:@"rotationStopBigHeadGatingResponsiveness"];
  v49 = [v48 minValue:1.0 maxValue:400.0];
  v97 = [v49 valueValidator:&__block_literal_global_4];

  v50 = (void *)MEMORY[0x1E4F94160];
  v139[0] = v102;
  v139[1] = v101;
  v139[2] = v100;
  v139[3] = v99;
  v139[4] = v98;
  v139[5] = v97;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:6];
  v96 = [v50 sectionWithRows:v51 title:@"Selection Gating Settings"];

  v52 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Scale" valueKeyPath:@"selectionScaleFriction"];
  v53 = [v52 minValue:20.0 maxValue:100.0];
  v95 = [v53 valueValidator:&__block_literal_global_4];

  v54 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Alpha" valueKeyPath:@"selectionAlphaFriction"];
  v55 = [v54 minValue:20.0 maxValue:100.0];
  v94 = [v55 valueValidator:&__block_literal_global_4];

  v56 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Position" valueKeyPath:@"selectionPositionFriction"];
  v57 = [v56 minValue:20.0 maxValue:100.0];
  v93 = [v57 valueValidator:&__block_literal_global_4];

  v58 = (void *)MEMORY[0x1E4F94160];
  v138[0] = v95;
  v138[1] = v94;
  v138[2] = v93;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:3];
  v92 = [v58 sectionWithRows:v59 title:@"Selection Animation Friction"];

  v60 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Scale" valueKeyPath:@"dismissScaleFriction"];
  v61 = [v60 minValue:20.0 maxValue:100.0];
  v91 = [v61 valueValidator:&__block_literal_global_4];

  v62 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Alpha" valueKeyPath:@"dismissAlphaFriction"];
  v63 = [v62 minValue:20.0 maxValue:100.0];
  v90 = [v63 valueValidator:&__block_literal_global_4];

  v64 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Position" valueKeyPath:@"dismissPositionFriction"];
  v65 = [v64 minValue:20.0 maxValue:100.0];
  v89 = [v65 valueValidator:&__block_literal_global_4];

  v66 = (void *)MEMORY[0x1E4F94160];
  v137[0] = v91;
  v137[1] = v90;
  v137[2] = v89;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:3];
  v85 = [v66 sectionWithRows:v67 title:@"Dismiss Animation Friction"];

  v88 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Haptic for CozyUp" valueKeyPath:@"hapticForCozyUpSelectionEnabled"];
  v87 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enabled" valueKeyPath:@"cozyUpAnimationEnabled"];
  v68 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Select Dur Sec" valueKeyPath:@"cozyUpSelectDurationS"];
  v86 = [v68 minValue:0.1 maxValue:1.0];

  v69 = (void *)MEMORY[0x1E4F94160];
  v136[0] = v88;
  v136[1] = v87;
  v136[2] = v86;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:3];
  v84 = [v69 sectionWithRows:v70 title:@"Cozy Up Animation Settings"];

  v71 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enabled" valueKeyPath:@"selectedPulseEnabled"];
  v72 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Pulse Duration Sec" valueKeyPath:@"selectedPulseDurationS"];
  v73 = [v72 minValue:0.1 maxValue:1.0];
  v74 = [v73 valueValidator:&__block_literal_global_4];

  v75 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Pulse Scale Amount" valueKeyPath:@"selectedPulseScaleAmount"];
  v76 = [v75 minValue:1.01 maxValue:1.5];

  v77 = (void *)MEMORY[0x1E4F94160];
  v135[0] = v71;
  v135[1] = v74;
  v135[2] = v76;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:3];
  v79 = [v77 sectionWithRows:v78 title:@"Re-select Pulse Settings"];

  v80 = (void *)MEMORY[0x1E4F94160];
  v134[0] = v133;
  v134[1] = v132;
  v134[2] = v131;
  v134[3] = v130;
  v134[4] = v126;
  v134[5] = v125;
  v134[6] = v96;
  v134[7] = v92;
  v134[8] = v85;
  v134[9] = v84;
  v134[10] = v79;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:11];
  v82 = [v80 moduleWithTitle:@"Settings" contents:v81];

  return v82;
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 integerValue];

  return [v2 numberWithInteger:v3];
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 floatValue];
  double v4 = round(v3 + v3) * 0.5;

  return [v2 numberWithDouble:v4];
}

uint64_t __47__SFMagicHeadSettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 floatValue];
  double v4 = round(v3 / 0.1) * 0.1;

  return [v2 numberWithDouble:v4];
}

- (BOOL)showRangingValues
{
  return self->_showRangingValues;
}

- (void)setShowRangingValues:(BOOL)a3
{
  self->_showRangingValues = a3;
}

- (BOOL)showSelectionGateLock
{
  return self->_showSelectionGateLock;
}

- (void)setShowSelectionGateLock:(BOOL)a3
{
  self->_showSelectionGateLock = a3;
}

- (BOOL)showSelectionMarkers
{
  return self->_showSelectionMarkers;
}

- (void)setShowSelectionMarkers:(BOOL)a3
{
  self->_showSelectionMarkers = a3;
}

- (BOOL)selectionDisabled
{
  return self->_selectionDisabled;
}

- (void)setSelectionDisabled:(BOOL)a3
{
  self->_selectionDisabled = a3;
}

- (double)tapDarkeningAlpha
{
  return self->_tapDarkeningAlpha;
}

- (void)setTapDarkeningAlpha:(double)a3
{
  self->_tapDarkeningAlpha = a3;
}

- (double)circlesFadeInDurationS
{
  return self->_circlesFadeInDurationS;
}

- (void)setCirclesFadeInDurationS:(double)a3
{
  self->_circlesFadeInDurationS = a3;
}

- (double)circlesFadeOutDurationS
{
  return self->_circlesFadeOutDurationS;
}

- (void)setCirclesFadeOutDurationS:(double)a3
{
  self->_circlesFadeOutDurationS = a3;
}

- (BOOL)rollEnabled
{
  return self->_rollEnabled;
}

- (void)setRollEnabled:(BOOL)a3
{
  self->_rollEnabled = a3;
}

- (double)rollMaxDegrees
{
  return self->_rollMaxDegrees;
}

- (void)setRollMaxDegrees:(double)a3
{
  self->_rollMaxDegrees = a3;
}

- (double)rollRubberbandingStretchiness
{
  return self->_rollRubberbandingStretchiness;
}

- (void)setRollRubberbandingStretchiness:(double)a3
{
  self->_rollRubberbandingStretchiness = a3;
}

- (BOOL)guidanceEnabled
{
  return self->_guidanceEnabled;
}

- (void)setGuidanceEnabled:(BOOL)a3
{
  self->_guidanceEnabled = a3;
}

- (double)guidanceGoodAngleThreshold
{
  return self->_guidanceGoodAngleThreshold;
}

- (void)setGuidanceGoodAngleThreshold:(double)a3
{
  self->_guidanceGoodAngleThreshold = a3;
}

- (double)guidanceWorstAngleDegreesDelta
{
  return self->_guidanceWorstAngleDegreesDelta;
}

- (void)setGuidanceWorstAngleDegreesDelta:(double)a3
{
  self->_guidanceWorstAngleDegreesDelta = a3;
}

- (double)guidanceDipSpeed
{
  return self->_guidanceDipSpeed;
}

- (void)setGuidanceDipSpeed:(double)a3
{
  self->_guidanceDipSpeed = a3;
}

- (double)guidanceRubberbandingStretchiness
{
  return self->_guidanceRubberbandingStretchiness;
}

- (void)setGuidanceRubberbandingStretchiness:(double)a3
{
  self->_guidanceRubberbandingStretchiness = a3;
}

- (double)guidanceFadeHeadDegrees
{
  return self->_guidanceFadeHeadDegrees;
}

- (void)setGuidanceFadeHeadDegrees:(double)a3
{
  self->_guidanceFadeHeadDegrees = a3;
}

- (double)guidanceRestoreHeadDegreesDelta
{
  return self->_guidanceRestoreHeadDegreesDelta;
}

- (void)setGuidanceRestoreHeadDegreesDelta:(double)a3
{
  self->_guidanceRestoreHeadDegreesDelta = a3;
}

- (double)guidanceTooFarDegrees
{
  return self->_guidanceTooFarDegrees;
}

- (void)setGuidanceTooFarDegrees:(double)a3
{
  self->_guidanceTooFarDegrees = a3;
}

- (double)guidanceRecoveredDegreesDelta
{
  return self->_guidanceRecoveredDegreesDelta;
}

- (void)setGuidanceRecoveredDegreesDelta:(double)a3
{
  self->_guidanceRecoveredDegreesDelta = a3;
}

- (double)guidanceTiltedTooFarAlpha
{
  return self->_guidanceTiltedTooFarAlpha;
}

- (void)setGuidanceTiltedTooFarAlpha:(double)a3
{
  self->_guidanceTiltedTooFarAlpha = a3;
}

- (double)guidanceSuppressHapticsEnabled
{
  return self->_guidanceSuppressHapticsEnabled;
}

- (void)setGuidanceSuppressHapticsEnabled:(double)a3
{
  self->_guidanceSuppressHapticsEnabled = a3;
}

- (double)guidanceSuppressHapticsDurationS
{
  return self->_guidanceSuppressHapticsDurationS;
}

- (void)setGuidanceSuppressHapticsDurationS:(double)a3
{
  self->_guidanceSuppressHapticsDurationS = a3;
}

- (double)guidanceContractDotsHapticEnabled
{
  return self->_guidanceContractDotsHapticEnabled;
}

- (void)setGuidanceContractDotsHapticEnabled:(double)a3
{
  self->_guidanceContractDotsHapticEnabled = a3;
}

- (double)guidanceExpandDotsHapticEnabled
{
  return self->_guidanceExpandDotsHapticEnabled;
}

- (void)setGuidanceExpandDotsHapticEnabled:(double)a3
{
  self->_guidanceExpandDotsHapticEnabled = a3;
}

- (BOOL)rotationGatedSelectionEnabled
{
  return self->_rotationGatedSelectionEnabled;
}

- (void)setRotationGatedSelectionEnabled:(BOOL)a3
{
  self->_rotationGatedSelectionEnabled = a3;
}

- (double)rotationGateThresholdDegrees
{
  return self->_rotationGateThresholdDegrees;
}

- (void)setRotationGateThresholdDegrees:(double)a3
{
  self->_rotationGateThresholdDegrees = a3;
}

- (int64_t)rotationStartGatingResponsiveness
{
  return self->_rotationStartGatingResponsiveness;
}

- (void)setRotationStartGatingResponsiveness:(int64_t)a3
{
  self->_rotationStartGatingResponsiveness = a3;
}

- (int64_t)rotationStopGatingResponsiveness
{
  return self->_rotationStopGatingResponsiveness;
}

- (void)setRotationStopGatingResponsiveness:(int64_t)a3
{
  self->_rotationStopGatingResponsiveness = a3;
}

- (int64_t)rotationStartBigHeadGatingResponsiveness
{
  return self->_rotationStartBigHeadGatingResponsiveness;
}

- (void)setRotationStartBigHeadGatingResponsiveness:(int64_t)a3
{
  self->_rotationStartBigHeadGatingResponsiveness = a3;
}

- (int64_t)rotationStopBigHeadGatingResponsiveness
{
  return self->_rotationStopBigHeadGatingResponsiveness;
}

- (void)setRotationStopBigHeadGatingResponsiveness:(int64_t)a3
{
  self->_rotationStopBigHeadGatingResponsiveness = a3;
}

- (double)selectionScaleFriction
{
  return self->_selectionScaleFriction;
}

- (void)setSelectionScaleFriction:(double)a3
{
  self->_selectionScaleFriction = a3;
}

- (double)selectionAlphaFriction
{
  return self->_selectionAlphaFriction;
}

- (void)setSelectionAlphaFriction:(double)a3
{
  self->_selectionAlphaFriction = a3;
}

- (double)selectionPositionFriction
{
  return self->_selectionPositionFriction;
}

- (void)setSelectionPositionFriction:(double)a3
{
  self->_selectionPositionFriction = a3;
}

- (double)dismissScaleFriction
{
  return self->_dismissScaleFriction;
}

- (void)setDismissScaleFriction:(double)a3
{
  self->_dismissScaleFriction = a3;
}

- (double)dismissAlphaFriction
{
  return self->_dismissAlphaFriction;
}

- (void)setDismissAlphaFriction:(double)a3
{
  self->_dismissAlphaFriction = a3;
}

- (double)dismissPositionFriction
{
  return self->_dismissPositionFriction;
}

- (void)setDismissPositionFriction:(double)a3
{
  self->_dismissPositionFriction = a3;
}

- (BOOL)hapticForCozyUpSelectionEnabled
{
  return self->_hapticForCozyUpSelectionEnabled;
}

- (void)setHapticForCozyUpSelectionEnabled:(BOOL)a3
{
  self->_hapticForCozyUpSelectionEnabled = a3;
}

- (BOOL)cozyUpAnimationEnabled
{
  return self->_cozyUpAnimationEnabled;
}

- (void)setCozyUpAnimationEnabled:(BOOL)a3
{
  self->_cozyUpAnimationEnabled = a3;
}

- (double)cozyUpSelectDurationS
{
  return self->_cozyUpSelectDurationS;
}

- (void)setCozyUpSelectDurationS:(double)a3
{
  self->_cozyUpSelectDurationS = a3;
}

- (BOOL)selectedPulseEnabled
{
  return self->_selectedPulseEnabled;
}

- (void)setSelectedPulseEnabled:(BOOL)a3
{
  self->_selectedPulseEnabled = a3;
}

- (double)selectedPulseScaleAmount
{
  return self->_selectedPulseScaleAmount;
}

- (void)setSelectedPulseScaleAmount:(double)a3
{
  self->_selectedPulseScaleAmount = a3;
}

- (double)selectedPulseDurationS
{
  return self->_selectedPulseDurationS;
}

- (void)setSelectedPulseDurationS:(double)a3
{
  self->_selectedPulseDurationS = a3;
}

@end