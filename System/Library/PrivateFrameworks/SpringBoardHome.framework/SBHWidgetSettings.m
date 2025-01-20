@interface SBHWidgetSettings
+ (id)settingsControllerModule;
- (BOOL)configurationBlursBackground;
- (BOOL)configurationEnforcesMaxCardHeight;
- (BOOL)configurationEqualizesMinCardToCameraDistance;
- (BOOL)configurationMaximizesCardHeight;
- (BOOL)configurationScalesHomeScreenRelativeToCardPosition;
- (BOOL)configurationUsesPercentVerticalMargin;
- (BOOL)configurationUsesSidebarAsContainer;
- (BOOL)isHitTestingDisabled;
- (BOOL)stackAlwaysShowsBorder;
- (BOOL)stackAlwaysShowsPageControl;
- (BOOL)stackConfigurationBlursBackground;
- (BOOL)stackConfigurationShouldScaleWidgets;
- (BOOL)stackConfigurationUsesFolderBlur;
- (BOOL)stackFlashesPageControlOnAppearance;
- (SBFFluidBehaviorSettings)dropInsertionAnimationSettings;
- (SBFFluidBehaviorSettings)toggleEditingOrPinnedAnimationSettings;
- (SBHPeopleWidgetPersonDetailInteractionSettings)personDetailInteractionSettings;
- (double)animatedInsertionImpactDelay;
- (double)animatedInsertionImpactScale;
- (double)animatedInsertionJumpDampingRatio;
- (double)animatedInsertionJumpDuration;
- (double)animatedInsertionJumpScale;
- (double)animatedInsertionPositionDampingRatio;
- (double)animatedInsertionPositionDuration;
- (double)animatedInsertionScaleResetDampingRatio;
- (double)animatedInsertionScaleResetDelay;
- (double)animatedInsertionScaleResetDuration;
- (double)animatedInsertionSlamDampingRatio;
- (double)animatedInsertionSlamDelay;
- (double)animatedInsertionSlamDuration;
- (double)configurationAbsoluteVerticalMargin;
- (double)configurationDarkeningTintAlpha;
- (double)configurationFractionBetweenSourceAndContainerX;
- (double)configurationFractionBetweenSourceAndContainerY;
- (double)configurationHomeScreenAlpha;
- (double)configurationHomeScreenScale;
- (double)configurationMaxCardHeight;
- (double)configurationMinCardToCameraDistance;
- (double)configurationPercentVerticalMargin;
- (double)configurationPerspectiveCameraDistance;
- (double)configurationWidgetTintColorAlpha;
- (double)dropInsertionImpactDelay;
- (double)dropInsertionImpactScale;
- (double)dropInsertionScaleResetDampingRatio;
- (double)dropInsertionScaleResetDelay;
- (double)dropInsertionScaleResetDuration;
- (double)dropInsertionSlamDampingRatio;
- (double)dropInsertionSlamDelay;
- (double)dropInsertionSlamDuration;
- (double)stackConfigurationContentHeightRatio;
- (double)stackConfigurationDimmingAlpha;
- (double)stackConfigurationExtraLargeIconScale;
- (double)stackConfigurationLargeIconScale;
- (double)stackConfigurationMediumIconScale;
- (double)stackConfigurationNoBlurDimmingAlpha;
- (double)stackConfigurationZoomTransitionDuration;
- (unint64_t)maximumWidgetsInAStack;
- (void)setAnimatedInsertionImpactDelay:(double)a3;
- (void)setAnimatedInsertionImpactScale:(double)a3;
- (void)setAnimatedInsertionJumpDampingRatio:(double)a3;
- (void)setAnimatedInsertionJumpDuration:(double)a3;
- (void)setAnimatedInsertionJumpScale:(double)a3;
- (void)setAnimatedInsertionPositionDampingRatio:(double)a3;
- (void)setAnimatedInsertionPositionDuration:(double)a3;
- (void)setAnimatedInsertionScaleResetDampingRatio:(double)a3;
- (void)setAnimatedInsertionScaleResetDelay:(double)a3;
- (void)setAnimatedInsertionScaleResetDuration:(double)a3;
- (void)setAnimatedInsertionSlamDampingRatio:(double)a3;
- (void)setAnimatedInsertionSlamDelay:(double)a3;
- (void)setAnimatedInsertionSlamDuration:(double)a3;
- (void)setConfigurationAbsoluteVerticalMargin:(double)a3;
- (void)setConfigurationBlursBackground:(BOOL)a3;
- (void)setConfigurationDarkeningTintAlpha:(double)a3;
- (void)setConfigurationEnforcesMaxCardHeight:(BOOL)a3;
- (void)setConfigurationEqualizesMinCardToCameraDistance:(BOOL)a3;
- (void)setConfigurationFractionBetweenSourceAndContainerX:(double)a3;
- (void)setConfigurationFractionBetweenSourceAndContainerY:(double)a3;
- (void)setConfigurationHomeScreenAlpha:(double)a3;
- (void)setConfigurationHomeScreenScale:(double)a3;
- (void)setConfigurationMaxCardHeight:(double)a3;
- (void)setConfigurationMaximizesCardHeight:(BOOL)a3;
- (void)setConfigurationMinCardToCameraDistance:(double)a3;
- (void)setConfigurationPercentVerticalMargin:(double)a3;
- (void)setConfigurationPerspectiveCameraDistance:(double)a3;
- (void)setConfigurationScalesHomeScreenRelativeToCardPosition:(BOOL)a3;
- (void)setConfigurationUsesPercentVerticalMargin:(BOOL)a3;
- (void)setConfigurationUsesSidebarAsContainer:(BOOL)a3;
- (void)setConfigurationWidgetTintColorAlpha:(double)a3;
- (void)setDefaultValues;
- (void)setDropInsertionAnimationSettings:(id)a3;
- (void)setDropInsertionImpactDelay:(double)a3;
- (void)setDropInsertionImpactScale:(double)a3;
- (void)setDropInsertionScaleResetDampingRatio:(double)a3;
- (void)setDropInsertionScaleResetDelay:(double)a3;
- (void)setDropInsertionScaleResetDuration:(double)a3;
- (void)setDropInsertionSlamDampingRatio:(double)a3;
- (void)setDropInsertionSlamDelay:(double)a3;
- (void)setDropInsertionSlamDuration:(double)a3;
- (void)setHitTestingDisabled:(BOOL)a3;
- (void)setMaximumWidgetsInAStack:(unint64_t)a3;
- (void)setPersonDetailInteractionSettings:(id)a3;
- (void)setStackAlwaysShowsBorder:(BOOL)a3;
- (void)setStackAlwaysShowsPageControl:(BOOL)a3;
- (void)setStackConfigurationBlursBackground:(BOOL)a3;
- (void)setStackConfigurationContentHeightRatio:(double)a3;
- (void)setStackConfigurationDimmingAlpha:(double)a3;
- (void)setStackConfigurationExtraLargeIconScale:(double)a3;
- (void)setStackConfigurationLargeIconScale:(double)a3;
- (void)setStackConfigurationMediumIconScale:(double)a3;
- (void)setStackConfigurationNoBlurDimmingAlpha:(double)a3;
- (void)setStackConfigurationShouldScaleWidgets:(BOOL)a3;
- (void)setStackConfigurationUsesFolderBlur:(BOOL)a3;
- (void)setStackConfigurationZoomTransitionDuration:(double)a3;
- (void)setStackFlashesPageControlOnAppearance:(BOOL)a3;
- (void)setToggleEditingOrPinnedAnimationSettings:(id)a3;
@end

@implementation SBHWidgetSettings

- (void)setDefaultValues
{
  [(SBHWidgetSettings *)self setHitTestingDisabled:0];
  [(SBHWidgetSettings *)self setMaximumWidgetsInAStack:10];
  [(SBHWidgetSettings *)self setStackAlwaysShowsBorder:0];
  [(SBHWidgetSettings *)self setStackAlwaysShowsPageControl:0];
  [(SBHWidgetSettings *)self setStackFlashesPageControlOnAppearance:1];
  v3 = [(SBHWidgetSettings *)self toggleEditingOrPinnedAnimationSettings];
  [v3 setDefaultValues];

  v4 = [(SBHWidgetSettings *)self toggleEditingOrPinnedAnimationSettings];
  [v4 setDampingRatio:0.845];

  v5 = [(SBHWidgetSettings *)self toggleEditingOrPinnedAnimationSettings];
  [v5 setResponse:0.45];

  [(SBHWidgetSettings *)self setAnimatedInsertionJumpScale:1.4];
  [(SBHWidgetSettings *)self setAnimatedInsertionImpactScale:0.8];
  [(SBHWidgetSettings *)self setAnimatedInsertionImpactDelay:0.5];
  [(SBHWidgetSettings *)self setAnimatedInsertionJumpDuration:0.7];
  [(SBHWidgetSettings *)self setAnimatedInsertionJumpDampingRatio:1.0];
  [(SBHWidgetSettings *)self setAnimatedInsertionSlamDuration:0.8];
  [(SBHWidgetSettings *)self setAnimatedInsertionSlamDelay:0.3];
  [(SBHWidgetSettings *)self setAnimatedInsertionSlamDampingRatio:1.0];
  [(SBHWidgetSettings *)self setAnimatedInsertionScaleResetDuration:0.8];
  [(SBHWidgetSettings *)self setAnimatedInsertionScaleResetDelay:0.6];
  [(SBHWidgetSettings *)self setAnimatedInsertionScaleResetDampingRatio:0.8];
  [(SBHWidgetSettings *)self setAnimatedInsertionPositionDuration:1.0];
  [(SBHWidgetSettings *)self setAnimatedInsertionPositionDampingRatio:1.0];
  v6 = [(SBHWidgetSettings *)self dropInsertionAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(SBHWidgetSettings *)self dropInsertionAnimationSettings];
  [v7 setDampingRatio:0.7];

  v8 = [(SBHWidgetSettings *)self dropInsertionAnimationSettings];
  [v8 setResponse:0.36];

  v9 = [(SBHWidgetSettings *)self dropInsertionAnimationSettings];
  [v9 setTrackingDampingRatio:0.7];

  v10 = [(SBHWidgetSettings *)self dropInsertionAnimationSettings];
  [v10 setTrackingResponse:0.36];

  [(SBHWidgetSettings *)self setDropInsertionImpactScale:0.8];
  [(SBHWidgetSettings *)self setDropInsertionImpactDelay:0.0333333333];
  [(SBHWidgetSettings *)self setDropInsertionSlamDuration:0.3];
  [(SBHWidgetSettings *)self setDropInsertionSlamDelay:0.0];
  [(SBHWidgetSettings *)self setDropInsertionSlamDampingRatio:1.0];
  [(SBHWidgetSettings *)self setDropInsertionScaleResetDuration:0.6];
  [(SBHWidgetSettings *)self setDropInsertionScaleResetDelay:0.1];
  [(SBHWidgetSettings *)self setDropInsertionScaleResetDampingRatio:0.8];
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  [(SBHWidgetSettings *)self setConfigurationBlursBackground:(v12 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  [(SBHWidgetSettings *)self setConfigurationUsesPercentVerticalMargin:1];
  [(SBHWidgetSettings *)self setConfigurationPercentVerticalMargin:0.2];
  [(SBHWidgetSettings *)self setConfigurationAbsoluteVerticalMargin:24.0];
  [(SBHWidgetSettings *)self setConfigurationHomeScreenScale:0.9];
  [(SBHWidgetSettings *)self setConfigurationHomeScreenAlpha:0.9];
  [(SBHWidgetSettings *)self setConfigurationEqualizesMinCardToCameraDistance:1];
  [(SBHWidgetSettings *)self setConfigurationPerspectiveCameraDistance:-1000.0];
  [(SBHWidgetSettings *)self setConfigurationMinCardToCameraDistance:800.0];
  [(SBHWidgetSettings *)self setConfigurationDarkeningTintAlpha:0.6];
  [(SBHWidgetSettings *)self setConfigurationWidgetTintColorAlpha:0.0];
  [(SBHWidgetSettings *)self setConfigurationMaximizesCardHeight:0];
  [(SBHWidgetSettings *)self setConfigurationEnforcesMaxCardHeight:0];
  [(SBHWidgetSettings *)self setConfigurationMaxCardHeight:600.0];
  [(SBHWidgetSettings *)self setConfigurationUsesSidebarAsContainer:1];
  [(SBHWidgetSettings *)self setConfigurationFractionBetweenSourceAndContainerX:0.0];
  [(SBHWidgetSettings *)self setConfigurationFractionBetweenSourceAndContainerY:0.0];
  [(SBHWidgetSettings *)self setStackConfigurationContentHeightRatio:1.7];
  [(SBHWidgetSettings *)self setStackConfigurationZoomTransitionDuration:0.475];
  [(SBHWidgetSettings *)self setStackConfigurationBlursBackground:1];
  v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  [(SBHWidgetSettings *)self setStackConfigurationUsesFolderBlur:(v14 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  [(SBHWidgetSettings *)self setStackConfigurationDimmingAlpha:0.1728];
  [(SBHWidgetSettings *)self setStackConfigurationNoBlurDimmingAlpha:0.6];
  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  [(SBHWidgetSettings *)self setStackConfigurationShouldScaleWidgets:(v16 & 0xFFFFFFFFFFFFFFFBLL) != 1];
  [(SBHWidgetSettings *)self setStackConfigurationMediumIconScale:0.86];
  [(SBHWidgetSettings *)self setStackConfigurationLargeIconScale:0.82];
  [(SBHWidgetSettings *)self setStackConfigurationExtraLargeIconScale:0.88];
}

+ (id)settingsControllerModule
{
  v172[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F940F8];
  v3 = [MEMORY[0x1E4F94170] action];
  v164 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94160];
  v172[0] = v164;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:1];
  v163 = [v4 sectionWithRows:v5];

  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Maximum Widgets in a Stack" valueKeyPath:@"maximumWidgetsInAStack"];
  v8 = [v7 between:1.0 and:100.0];
  v9 = [v8 precision:0];
  v171[0] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Stack Always Shows Border" valueKeyPath:@"stackAlwaysShowsBorder"];
  v171[1] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Stack Always Shows Page Control" valueKeyPath:@"stackAlwaysShowsPageControl"];
  v171[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Stack Flashes Page Control On Appearance" valueKeyPath:@"stackFlashesPageControlOnAppearance"];
  v171[3] = v12;
  v13 = [MEMORY[0x1E4F94130] rowWithTitle:@"Toggle Editing / Pinned Animation Settings" childSettingsKeyPath:@"toggleEditingOrPinnedAnimationSettings"];
  v171[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hit Testing Disabled" valueKeyPath:@"hitTestingDisabled"];
  v171[5] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:6];
  v162 = [v6 sectionWithRows:v15];

  v160 = (void *)MEMORY[0x1E4F94160];
  v157 = [MEMORY[0x1E4F94148] rowWithTitle:@"Jump Scale" valueKeyPath:@"animatedInsertionJumpScale"];
  v153 = [v157 between:0.0 and:5.0];
  v149 = [v153 precision:2];
  v170[0] = v149;
  v145 = [MEMORY[0x1E4F94148] rowWithTitle:@"Impact Scale" valueKeyPath:@"animatedInsertionImpactScale"];
  v141 = [v145 between:0.0 and:5.0];
  v137 = [v141 precision:2];
  v170[1] = v137;
  v133 = [MEMORY[0x1E4F94148] rowWithTitle:@"Impact Delay" valueKeyPath:@"animatedInsertionImpactDelay"];
  v129 = [v133 between:0.0 and:10.0];
  v125 = [v129 precision:3];
  v170[2] = v125;
  v121 = [MEMORY[0x1E4F94148] rowWithTitle:@"Jump Duration" valueKeyPath:@"animatedInsertionJumpDuration"];
  v116 = [v121 between:0.0 and:10.0];
  v112 = [v116 precision:2];
  v170[3] = v112;
  v108 = [MEMORY[0x1E4F94148] rowWithTitle:@"Jump Damping Ratio" valueKeyPath:@"animatedInsertionJumpDampingRatio"];
  v104 = [v108 between:0.0 and:1.0];
  v100 = [v104 precision:2];
  v170[4] = v100;
  v96 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Duration" valueKeyPath:@"animatedInsertionSlamDuration"];
  v92 = [v96 between:0.0 and:10.0];
  v90 = [v92 precision:2];
  v170[5] = v90;
  v88 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Delay" valueKeyPath:@"animatedInsertionSlamDelay"];
  v86 = [v88 between:0.0 and:10.0];
  v84 = [v86 precision:3];
  v170[6] = v84;
  v82 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Damping Ratio" valueKeyPath:@"animatedInsertionSlamDampingRatio"];
  v80 = [v82 between:0.0 and:1.0];
  v78 = [v80 precision:2];
  v170[7] = v78;
  v76 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Duration" valueKeyPath:@"animatedInsertionScaleResetDuration"];
  v74 = [v76 between:0.0 and:10.0];
  v72 = [v74 precision:2];
  v170[8] = v72;
  v70 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Delay" valueKeyPath:@"animatedInsertionScaleResetDelay"];
  v68 = [v70 between:0.0 and:10.0];
  v66 = [v68 precision:3];
  v170[9] = v66;
  uint64_t v16 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Damping Ratio" valueKeyPath:@"animatedInsertionScaleResetDampingRatio"];
  v17 = [v16 between:0.0 and:1.0];
  v18 = [v17 precision:2];
  v170[10] = v18;
  v19 = [MEMORY[0x1E4F94148] rowWithTitle:@"Position Duration" valueKeyPath:@"animatedInsertionPositionDuration"];
  v20 = [v19 between:0.0 and:10.0];
  v21 = [v20 precision:2];
  v170[11] = v21;
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Position Damping Ratio" valueKeyPath:@"animatedInsertionPositionDampingRatio"];
  v23 = [v22 between:0.0 and:1.0];
  v24 = [v23 precision:2];
  v170[12] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:13];
  v161 = [v160 sectionWithRows:v25 title:@"Animated Insertion"];

  v158 = (void *)MEMORY[0x1E4F94160];
  v154 = [MEMORY[0x1E4F94130] rowWithTitle:@"Animation Settings" childSettingsKeyPath:@"dropInsertionAnimationSettings"];
  v169[0] = v154;
  v150 = [MEMORY[0x1E4F94148] rowWithTitle:@"Impact Scale" valueKeyPath:@"dropInsertionImpactScale"];
  v146 = [v150 between:0.0 and:10.0];
  v142 = [v146 precision:2];
  v169[1] = v142;
  v138 = [MEMORY[0x1E4F94148] rowWithTitle:@"Impact Delay" valueKeyPath:@"dropInsertionImpactDelay"];
  v134 = [v138 between:0.0 and:10.0];
  v130 = [v134 precision:3];
  v169[2] = v130;
  v126 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Duration" valueKeyPath:@"dropInsertionSlamDuration"];
  v122 = [v126 between:0.0 and:10.0];
  v117 = [v122 precision:2];
  v169[3] = v117;
  v113 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Delay" valueKeyPath:@"dropInsertionSlamDelay"];
  v109 = [v113 between:0.0 and:10.0];
  v105 = [v109 precision:3];
  v169[4] = v105;
  v101 = [MEMORY[0x1E4F94148] rowWithTitle:@"Slam Damping Ratio" valueKeyPath:@"dropInsertionSlamDampingRatio"];
  v97 = [v101 between:0.0 and:1.0];
  v93 = [v97 precision:2];
  v169[5] = v93;
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Duration" valueKeyPath:@"dropInsertionScaleResetDuration"];
  v27 = [v26 between:0.0 and:10.0];
  v28 = [v27 precision:2];
  v169[6] = v28;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Delay" valueKeyPath:@"dropInsertionScaleResetDelay"];
  v30 = [v29 between:0.0 and:10.0];
  v31 = [v30 precision:3];
  v169[7] = v31;
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Scale Reset Damping Ratio" valueKeyPath:@"dropInsertionScaleResetDampingRatio"];
  v33 = [v32 between:0.0 and:1.0];
  v34 = [v33 precision:2];
  v169[8] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:9];
  v159 = [v158 sectionWithRows:v35 title:@"Drop Insertion"];

  v155 = (void *)MEMORY[0x1E4F94160];
  v151 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Blurs Background" valueKeyPath:@"configurationBlursBackground"];
  v168[0] = v151;
  v147 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Vertical Margin as Percent of Screen Height" valueKeyPath:@"configurationUsesPercentVerticalMargin"];
  v168[1] = v147;
  v143 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical Margin Percentage" valueKeyPath:@"configurationPercentVerticalMargin"];
  v139 = [v143 between:0.0 and:1.0];
  v135 = [v139 precision:2];
  v168[2] = v135;
  v131 = [MEMORY[0x1E4F94148] rowWithTitle:@"Absolute Vertical Margin" valueKeyPath:@"configurationAbsoluteVerticalMargin"];
  v127 = [v131 between:0.0 and:100.0];
  v123 = [v127 precision:0];
  v168[3] = v123;
  v118 = [MEMORY[0x1E4F94148] rowWithTitle:@"Home Screen Scale" valueKeyPath:@"configurationHomeScreenScale"];
  v114 = [v118 between:0.0 and:1.0];
  v110 = [v114 precision:2];
  v168[4] = v110;
  v106 = [MEMORY[0x1E4F94148] rowWithTitle:@"Home Screen Alpha" valueKeyPath:@"configurationHomeScreenAlpha"];
  v102 = [v106 between:0.0 and:1.0];
  v98 = [v102 precision:2];
  v168[5] = v98;
  v94 = [MEMORY[0x1E4F94148] rowWithTitle:@"Darkening Tint Alpha" valueKeyPath:@"configurationDarkeningTintAlpha"];
  v91 = [v94 between:0.0 and:1.0];
  v89 = [v91 precision:2];
  v168[6] = v89;
  v87 = [MEMORY[0x1E4F94148] rowWithTitle:@"Widget Tint Color Alpha" valueKeyPath:@"configurationWidgetTintColorAlpha"];
  v85 = [v87 between:0.0 and:1.0];
  v83 = [v85 precision:2];
  v168[7] = v83;
  v81 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Equalize Min Card to Camera Distance" valueKeyPath:@"configurationEqualizesMinCardToCameraDistance"];
  v168[8] = v81;
  v79 = [MEMORY[0x1E4F94148] rowWithTitle:@"Perspective Camera Distance" valueKeyPath:@"configurationPerspectiveCameraDistance"];
  v77 = [v79 between:-2000.0 and:-500.0];
  v75 = [v77 precision:0];
  v168[9] = v75;
  v73 = [MEMORY[0x1E4F94148] rowWithTitle:@"Min Card to Camera Distance" valueKeyPath:@"configurationMinCardToCameraDistance"];
  v71 = [v73 between:0.0 and:2000.0];
  v69 = [v71 precision:0];
  v168[10] = v69;
  v67 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Maximize Card Height" valueKeyPath:@"configurationMaximizesCardHeight"];
  v168[11] = v67;
  v65 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enforce Max Card Height" valueKeyPath:@"configurationEnforcesMaxCardHeight"];
  v168[12] = v65;
  v64 = [MEMORY[0x1E4F94148] rowWithTitle:@"Max Card Height" valueKeyPath:@"configurationMaxCardHeight"];
  v36 = [v64 between:1.0 and:3000.0];
  v37 = [v36 precision:0];
  v168[13] = v37;
  v38 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Sidebar as Container" valueKeyPath:@"configurationUsesSidebarAsContainer"];
  v168[14] = v38;
  v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"Center Fraction X" valueKeyPath:@"configurationFractionBetweenSourceAndContainerX"];
  v40 = [v39 between:0.0 and:1.0];
  v41 = [v40 precision:2];
  v168[15] = v41;
  v42 = [MEMORY[0x1E4F94148] rowWithTitle:@"Center Fraction Y" valueKeyPath:@"configurationFractionBetweenSourceAndContainerY"];
  v43 = [v42 between:0.0 and:1.0];
  v44 = [v43 precision:2];
  v168[16] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:17];
  v156 = [v155 sectionWithRows:v45 title:@"Configuration"];

  v119 = (void *)MEMORY[0x1E4F94160];
  v152 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Blurs Background" valueKeyPath:@"stackConfigurationBlursBackground"];
  v167[0] = v152;
  v148 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Folder Background" valueKeyPath:@"stackConfigurationUsesFolderBlur"];
  v167[1] = v148;
  v144 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dimming Tint Alpha" valueKeyPath:@"stackConfigurationDimmingAlpha"];
  v140 = [v144 between:0.0 and:1.0];
  v136 = [v140 precision:2];
  v167[2] = v136;
  v132 = [MEMORY[0x1E4F94148] rowWithTitle:@"No-Blur Dimming Alpha" valueKeyPath:@"stackConfigurationNoBlurDimmingAlpha"];
  v128 = [v132 between:0.0 and:1.0];
  v124 = [v128 precision:2];
  v167[3] = v124;
  v115 = [MEMORY[0x1E4F94148] rowWithTitle:@"iPad Content Height Ratio" valueKeyPath:@"stackConfigurationContentHeightRatio"];
  v111 = [v115 between:1.0 and:2.0];
  v107 = [v111 precision:2];
  v167[4] = v107;
  v103 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Zoom Duration" valueKeyPath:@"stackConfigurationZoomTransitionDuration"];
  v99 = [v103 minValue:0.0 maxValue:2.0];
  v167[5] = v99;
  v95 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Should Scale Widgets" valueKeyPath:@"stackConfigurationShouldScaleWidgets"];
  v167[6] = v95;
  v46 = [MEMORY[0x1E4F94148] rowWithTitle:@"Medium Widget Scale" valueKeyPath:@"stackConfigurationMediumIconScale"];
  v47 = [v46 between:0.1 and:1.0];
  v48 = [v47 precision:2];
  v167[7] = v48;
  v49 = [MEMORY[0x1E4F94148] rowWithTitle:@"Large Widget Scale" valueKeyPath:@"stackConfigurationLargeIconScale"];
  v50 = [v49 between:0.1 and:1.0];
  v51 = [v50 precision:2];
  v167[8] = v51;
  v52 = [MEMORY[0x1E4F94148] rowWithTitle:@"Extra Large Widget Scale" valueKeyPath:@"stackConfigurationExtraLargeIconScale"];
  v53 = [v52 between:0.1 and:1.0];
  v54 = [v53 precision:2];
  v167[9] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:10];
  v120 = [v119 sectionWithRows:v55 title:@"Stack Configuration"];

  v56 = (void *)MEMORY[0x1E4F94160];
  v57 = [MEMORY[0x1E4F94130] rowWithTitle:@"Person Detail Interaction" childSettingsKeyPath:@"personDetailInteractionSettings"];
  v166 = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:1];
  v59 = [v56 sectionWithRows:v58];

  v60 = (void *)MEMORY[0x1E4F94160];
  v165[0] = v163;
  v165[1] = v162;
  v165[2] = v120;
  v165[3] = v161;
  v165[4] = v159;
  v165[5] = v156;
  v165[6] = v59;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:7];
  v62 = [v60 moduleWithTitle:@"Icon Editing" contents:v61];

  return v62;
}

- (BOOL)isHitTestingDisabled
{
  return self->_hitTestingDisabled;
}

- (void)setHitTestingDisabled:(BOOL)a3
{
  self->_hitTestingDisabled = a3;
}

- (unint64_t)maximumWidgetsInAStack
{
  return self->_maximumWidgetsInAStack;
}

- (void)setMaximumWidgetsInAStack:(unint64_t)a3
{
  self->_maximumWidgetsInAStack = a3;
}

- (BOOL)stackAlwaysShowsBorder
{
  return self->_stackAlwaysShowsBorder;
}

- (void)setStackAlwaysShowsBorder:(BOOL)a3
{
  self->_stackAlwaysShowsBorder = a3;
}

- (BOOL)stackAlwaysShowsPageControl
{
  return self->_stackAlwaysShowsPageControl;
}

- (void)setStackAlwaysShowsPageControl:(BOOL)a3
{
  self->_stackAlwaysShowsPageControl = a3;
}

- (BOOL)stackFlashesPageControlOnAppearance
{
  return self->_stackFlashesPageControlOnAppearance;
}

- (void)setStackFlashesPageControlOnAppearance:(BOOL)a3
{
  self->_stackFlashesPageControlOnAppearance = a3;
}

- (SBFFluidBehaviorSettings)toggleEditingOrPinnedAnimationSettings
{
  return self->_toggleEditingOrPinnedAnimationSettings;
}

- (void)setToggleEditingOrPinnedAnimationSettings:(id)a3
{
}

- (double)animatedInsertionJumpScale
{
  return self->_animatedInsertionJumpScale;
}

- (void)setAnimatedInsertionJumpScale:(double)a3
{
  self->_animatedInsertionJumpScale = a3;
}

- (double)animatedInsertionImpactScale
{
  return self->_animatedInsertionImpactScale;
}

- (void)setAnimatedInsertionImpactScale:(double)a3
{
  self->_animatedInsertionImpactScale = a3;
}

- (double)animatedInsertionImpactDelay
{
  return self->_animatedInsertionImpactDelay;
}

- (void)setAnimatedInsertionImpactDelay:(double)a3
{
  self->_animatedInsertionImpactDelay = a3;
}

- (double)animatedInsertionJumpDuration
{
  return self->_animatedInsertionJumpDuration;
}

- (void)setAnimatedInsertionJumpDuration:(double)a3
{
  self->_animatedInsertionJumpDuration = a3;
}

- (double)animatedInsertionJumpDampingRatio
{
  return self->_animatedInsertionJumpDampingRatio;
}

- (void)setAnimatedInsertionJumpDampingRatio:(double)a3
{
  self->_animatedInsertionJumpDampingRatio = a3;
}

- (double)animatedInsertionSlamDuration
{
  return self->_animatedInsertionSlamDuration;
}

- (void)setAnimatedInsertionSlamDuration:(double)a3
{
  self->_animatedInsertionSlamDuration = a3;
}

- (double)animatedInsertionSlamDelay
{
  return self->_animatedInsertionSlamDelay;
}

- (void)setAnimatedInsertionSlamDelay:(double)a3
{
  self->_animatedInsertionSlamDelay = a3;
}

- (double)animatedInsertionSlamDampingRatio
{
  return self->_animatedInsertionSlamDampingRatio;
}

- (void)setAnimatedInsertionSlamDampingRatio:(double)a3
{
  self->_animatedInsertionSlamDampingRatio = a3;
}

- (double)animatedInsertionScaleResetDuration
{
  return self->_animatedInsertionScaleResetDuration;
}

- (void)setAnimatedInsertionScaleResetDuration:(double)a3
{
  self->_animatedInsertionScaleResetDuration = a3;
}

- (double)animatedInsertionScaleResetDelay
{
  return self->_animatedInsertionScaleResetDelay;
}

- (void)setAnimatedInsertionScaleResetDelay:(double)a3
{
  self->_animatedInsertionScaleResetDelay = a3;
}

- (double)animatedInsertionScaleResetDampingRatio
{
  return self->_animatedInsertionScaleResetDampingRatio;
}

- (void)setAnimatedInsertionScaleResetDampingRatio:(double)a3
{
  self->_animatedInsertionScaleResetDampingRatio = a3;
}

- (double)animatedInsertionPositionDuration
{
  return self->_animatedInsertionPositionDuration;
}

- (void)setAnimatedInsertionPositionDuration:(double)a3
{
  self->_animatedInsertionPositionDuration = a3;
}

- (double)animatedInsertionPositionDampingRatio
{
  return self->_animatedInsertionPositionDampingRatio;
}

- (void)setAnimatedInsertionPositionDampingRatio:(double)a3
{
  self->_animatedInsertionPositionDampingRatio = a3;
}

- (SBFFluidBehaviorSettings)dropInsertionAnimationSettings
{
  return self->_dropInsertionAnimationSettings;
}

- (void)setDropInsertionAnimationSettings:(id)a3
{
}

- (double)dropInsertionImpactScale
{
  return self->_dropInsertionImpactScale;
}

- (void)setDropInsertionImpactScale:(double)a3
{
  self->_dropInsertionImpactScale = a3;
}

- (double)dropInsertionImpactDelay
{
  return self->_dropInsertionImpactDelay;
}

- (void)setDropInsertionImpactDelay:(double)a3
{
  self->_dropInsertionImpactDelay = a3;
}

- (double)dropInsertionSlamDuration
{
  return self->_dropInsertionSlamDuration;
}

- (void)setDropInsertionSlamDuration:(double)a3
{
  self->_dropInsertionSlamDuration = a3;
}

- (double)dropInsertionSlamDelay
{
  return self->_dropInsertionSlamDelay;
}

- (void)setDropInsertionSlamDelay:(double)a3
{
  self->_dropInsertionSlamDelay = a3;
}

- (double)dropInsertionSlamDampingRatio
{
  return self->_dropInsertionSlamDampingRatio;
}

- (void)setDropInsertionSlamDampingRatio:(double)a3
{
  self->_dropInsertionSlamDampingRatio = a3;
}

- (double)dropInsertionScaleResetDuration
{
  return self->_dropInsertionScaleResetDuration;
}

- (void)setDropInsertionScaleResetDuration:(double)a3
{
  self->_dropInsertionScaleResetDuration = a3;
}

- (double)dropInsertionScaleResetDelay
{
  return self->_dropInsertionScaleResetDelay;
}

- (void)setDropInsertionScaleResetDelay:(double)a3
{
  self->_dropInsertionScaleResetDelay = a3;
}

- (double)dropInsertionScaleResetDampingRatio
{
  return self->_dropInsertionScaleResetDampingRatio;
}

- (void)setDropInsertionScaleResetDampingRatio:(double)a3
{
  self->_dropInsertionScaleResetDampingRatio = a3;
}

- (BOOL)configurationBlursBackground
{
  return self->_configurationBlursBackground;
}

- (void)setConfigurationBlursBackground:(BOOL)a3
{
  self->_configurationBlursBackground = a3;
}

- (BOOL)configurationUsesPercentVerticalMargin
{
  return self->_configurationUsesPercentVerticalMargin;
}

- (void)setConfigurationUsesPercentVerticalMargin:(BOOL)a3
{
  self->_configurationUsesPercentVerticalMargin = a3;
}

- (double)configurationPercentVerticalMargin
{
  return self->_configurationPercentVerticalMargin;
}

- (void)setConfigurationPercentVerticalMargin:(double)a3
{
  self->_configurationPercentVerticalMargin = a3;
}

- (double)configurationAbsoluteVerticalMargin
{
  return self->_configurationAbsoluteVerticalMargin;
}

- (void)setConfigurationAbsoluteVerticalMargin:(double)a3
{
  self->_configurationAbsoluteVerticalMargin = a3;
}

- (BOOL)configurationScalesHomeScreenRelativeToCardPosition
{
  return self->_configurationScalesHomeScreenRelativeToCardPosition;
}

- (void)setConfigurationScalesHomeScreenRelativeToCardPosition:(BOOL)a3
{
  self->_configurationScalesHomeScreenRelativeToCardPosition = a3;
}

- (double)configurationHomeScreenScale
{
  return self->_configurationHomeScreenScale;
}

- (void)setConfigurationHomeScreenScale:(double)a3
{
  self->_configurationHomeScreenScale = a3;
}

- (double)configurationHomeScreenAlpha
{
  return self->_configurationHomeScreenAlpha;
}

- (void)setConfigurationHomeScreenAlpha:(double)a3
{
  self->_configurationHomeScreenAlpha = a3;
}

- (BOOL)configurationEqualizesMinCardToCameraDistance
{
  return self->_configurationEqualizesMinCardToCameraDistance;
}

- (void)setConfigurationEqualizesMinCardToCameraDistance:(BOOL)a3
{
  self->_configurationEqualizesMinCardToCameraDistance = a3;
}

- (double)configurationPerspectiveCameraDistance
{
  return self->_configurationPerspectiveCameraDistance;
}

- (void)setConfigurationPerspectiveCameraDistance:(double)a3
{
  self->_configurationPerspectiveCameraDistance = a3;
}

- (double)configurationMinCardToCameraDistance
{
  return self->_configurationMinCardToCameraDistance;
}

- (void)setConfigurationMinCardToCameraDistance:(double)a3
{
  self->_configurationMinCardToCameraDistance = a3;
}

- (double)configurationDarkeningTintAlpha
{
  return self->_configurationDarkeningTintAlpha;
}

- (void)setConfigurationDarkeningTintAlpha:(double)a3
{
  self->_configurationDarkeningTintAlpha = a3;
}

- (double)configurationWidgetTintColorAlpha
{
  return self->_configurationWidgetTintColorAlpha;
}

- (void)setConfigurationWidgetTintColorAlpha:(double)a3
{
  self->_configurationWidgetTintColorAlpha = a3;
}

- (BOOL)configurationMaximizesCardHeight
{
  return self->_configurationMaximizesCardHeight;
}

- (void)setConfigurationMaximizesCardHeight:(BOOL)a3
{
  self->_configurationMaximizesCardHeight = a3;
}

- (BOOL)configurationEnforcesMaxCardHeight
{
  return self->_configurationEnforcesMaxCardHeight;
}

- (void)setConfigurationEnforcesMaxCardHeight:(BOOL)a3
{
  self->_configurationEnforcesMaxCardHeight = a3;
}

- (double)configurationMaxCardHeight
{
  return self->_configurationMaxCardHeight;
}

- (void)setConfigurationMaxCardHeight:(double)a3
{
  self->_configurationMaxCardHeight = a3;
}

- (BOOL)configurationUsesSidebarAsContainer
{
  return self->_configurationUsesSidebarAsContainer;
}

- (void)setConfigurationUsesSidebarAsContainer:(BOOL)a3
{
  self->_configurationUsesSidebarAsContainer = a3;
}

- (double)configurationFractionBetweenSourceAndContainerX
{
  return self->_configurationFractionBetweenSourceAndContainerX;
}

- (void)setConfigurationFractionBetweenSourceAndContainerX:(double)a3
{
  self->_configurationFractionBetweenSourceAndContainerX = a3;
}

- (double)configurationFractionBetweenSourceAndContainerY
{
  return self->_configurationFractionBetweenSourceAndContainerY;
}

- (void)setConfigurationFractionBetweenSourceAndContainerY:(double)a3
{
  self->_configurationFractionBetweenSourceAndContainerY = a3;
}

- (double)stackConfigurationZoomTransitionDuration
{
  return self->_stackConfigurationZoomTransitionDuration;
}

- (void)setStackConfigurationZoomTransitionDuration:(double)a3
{
  self->_stackConfigurationZoomTransitionDuration = a3;
}

- (double)stackConfigurationContentHeightRatio
{
  return self->_stackConfigurationContentHeightRatio;
}

- (void)setStackConfigurationContentHeightRatio:(double)a3
{
  self->_stackConfigurationContentHeightRatio = a3;
}

- (double)stackConfigurationNoBlurDimmingAlpha
{
  return self->_stackConfigurationNoBlurDimmingAlpha;
}

- (void)setStackConfigurationNoBlurDimmingAlpha:(double)a3
{
  self->_stackConfigurationNoBlurDimmingAlpha = a3;
}

- (BOOL)stackConfigurationBlursBackground
{
  return self->_stackConfigurationBlursBackground;
}

- (void)setStackConfigurationBlursBackground:(BOOL)a3
{
  self->_stackConfigurationBlursBackground = a3;
}

- (BOOL)stackConfigurationUsesFolderBlur
{
  return self->_stackConfigurationUsesFolderBlur;
}

- (void)setStackConfigurationUsesFolderBlur:(BOOL)a3
{
  self->_stackConfigurationUsesFolderBlur = a3;
}

- (double)stackConfigurationDimmingAlpha
{
  return self->_stackConfigurationDimmingAlpha;
}

- (void)setStackConfigurationDimmingAlpha:(double)a3
{
  self->_stackConfigurationDimmingAlpha = a3;
}

- (BOOL)stackConfigurationShouldScaleWidgets
{
  return self->_stackConfigurationShouldScaleWidgets;
}

- (void)setStackConfigurationShouldScaleWidgets:(BOOL)a3
{
  self->_stackConfigurationShouldScaleWidgets = a3;
}

- (double)stackConfigurationMediumIconScale
{
  return self->_stackConfigurationMediumIconScale;
}

- (void)setStackConfigurationMediumIconScale:(double)a3
{
  self->_stackConfigurationMediumIconScale = a3;
}

- (double)stackConfigurationLargeIconScale
{
  return self->_stackConfigurationLargeIconScale;
}

- (void)setStackConfigurationLargeIconScale:(double)a3
{
  self->_stackConfigurationLargeIconScale = a3;
}

- (double)stackConfigurationExtraLargeIconScale
{
  return self->_stackConfigurationExtraLargeIconScale;
}

- (void)setStackConfigurationExtraLargeIconScale:(double)a3
{
  self->_stackConfigurationExtraLargeIconScale = a3;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)personDetailInteractionSettings
{
  return self->_personDetailInteractionSettings;
}

- (void)setPersonDetailInteractionSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personDetailInteractionSettings, 0);
  objc_storeStrong((id *)&self->_dropInsertionAnimationSettings, 0);
  objc_storeStrong((id *)&self->_toggleEditingOrPinnedAnimationSettings, 0);
}

@end