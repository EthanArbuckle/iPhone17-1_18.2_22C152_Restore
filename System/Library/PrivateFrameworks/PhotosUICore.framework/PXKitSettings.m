@interface PXKitSettings
+ (PXKitSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowCapitalization;
- (BOOL)allowFontFallback;
- (BOOL)defaultAsyncTextRenderingEnabled;
- (BOOL)defaultTextAutoscalingEnabled;
- (BOOL)defaultTextTruncationEnabled;
- (BOOL)defaultUseShapeLayerForText;
- (BOOL)drawTypographicGuidelines;
- (BOOL)honorSilentMode;
- (BOOL)simulateDroppedFramesDuringPPT;
- (BOOL)simulateSilentMode;
- (BOOL)simulateSlowTextTypesetting;
- (BOOL)useFancyDarkening;
- (double)defaultTextMinimumScaleFactor;
- (double)defaultTruncatedTextMinimumScaleFactor;
- (double)downGesturesAngularToleranceInDegrees;
- (double)horizontalGesturesAngularToleranceInDegrees;
- (double)simulatedDroppedFramesDurationInMilliseconds;
- (double)simulatedPeripheryExtraBottomInset;
- (double)simulatedPeripheryExtraLeftInset;
- (double)simulatedPeripheryExtraRightInset;
- (double)simulatedPeripheryExtraTopInset;
- (double)simulatedSafeAreaHorizontalInsets;
- (double)smallestSignificantScrollVelocity;
- (double)textAutoscalingPrecision;
- (double)uncontestedGesturesAngularToleranceInDegrees;
- (double)upGesturesAngularToleranceInDegrees;
- (double)viewResetTimeoutDuration;
- (id)parentSettings;
- (int64_t)defaultLabelTypesettingMode;
- (int64_t)deviceGraphicsQuality;
- (int64_t)simulatedDroppedFramesPeriod;
- (void)setAllowCapitalization:(BOOL)a3;
- (void)setAllowFontFallback:(BOOL)a3;
- (void)setDefaultAsyncTextRenderingEnabled:(BOOL)a3;
- (void)setDefaultLabelTypesettingMode:(int64_t)a3;
- (void)setDefaultTextAutoscalingEnabled:(BOOL)a3;
- (void)setDefaultTextMinimumScaleFactor:(double)a3;
- (void)setDefaultTextTruncationEnabled:(BOOL)a3;
- (void)setDefaultTruncatedTextMinimumScaleFactor:(double)a3;
- (void)setDefaultUseShapeLayerForText:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDeviceGraphicsQuality:(int64_t)a3;
- (void)setDownGesturesAngularToleranceInDegrees:(double)a3;
- (void)setDrawTypographicGuidelines:(BOOL)a3;
- (void)setHonorSilentMode:(BOOL)a3;
- (void)setHorizontalGesturesAngularToleranceInDegrees:(double)a3;
- (void)setSimulateDroppedFramesDuringPPT:(BOOL)a3;
- (void)setSimulateSilentMode:(BOOL)a3;
- (void)setSimulateSlowTextTypesetting:(BOOL)a3;
- (void)setSimulatedDroppedFramesDurationInMilliseconds:(double)a3;
- (void)setSimulatedDroppedFramesPeriod:(int64_t)a3;
- (void)setSimulatedPeripheryExtraBottomInset:(double)a3;
- (void)setSimulatedPeripheryExtraLeftInset:(double)a3;
- (void)setSimulatedPeripheryExtraRightInset:(double)a3;
- (void)setSimulatedPeripheryExtraTopInset:(double)a3;
- (void)setSimulatedSafeAreaHorizontalInsets:(double)a3;
- (void)setSmallestSignificantScrollVelocity:(double)a3;
- (void)setTextAutoscalingPrecision:(double)a3;
- (void)setUncontestedGesturesAngularToleranceInDegrees:(double)a3;
- (void)setUpGesturesAngularToleranceInDegrees:(double)a3;
- (void)setUseFancyDarkening:(BOOL)a3;
- (void)setViewResetTimeoutDuration:(double)a3;
@end

@implementation PXKitSettings

+ (PXKitSettings)sharedInstance
{
  if (sharedInstance_onceToken_166841 != -1) {
    dispatch_once(&sharedInstance_onceToken_166841, &__block_literal_global_166842);
  }
  v2 = (void *)sharedInstance_sharedInstance_166843;
  return (PXKitSettings *)v2;
}

- (BOOL)useFancyDarkening
{
  return self->_useFancyDarkening;
}

- (double)simulatedSafeAreaHorizontalInsets
{
  return self->_simulatedSafeAreaHorizontalInsets;
}

- (double)simulatedPeripheryExtraTopInset
{
  return self->_simulatedPeripheryExtraTopInset;
}

- (double)simulatedPeripheryExtraRightInset
{
  return self->_simulatedPeripheryExtraRightInset;
}

- (double)simulatedPeripheryExtraLeftInset
{
  return self->_simulatedPeripheryExtraLeftInset;
}

- (double)simulatedPeripheryExtraBottomInset
{
  return self->_simulatedPeripheryExtraBottomInset;
}

- (double)viewResetTimeoutDuration
{
  return self->_viewResetTimeoutDuration;
}

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)PXKitSettings;
  [(PTSettings *)&v7 setDefaultValues];
  [(PXKitSettings *)self setDownGesturesAngularToleranceInDegrees:30.0];
  [(PXKitSettings *)self setUpGesturesAngularToleranceInDegrees:30.0];
  [(PXKitSettings *)self setHorizontalGesturesAngularToleranceInDegrees:30.0];
  [(PXKitSettings *)self setUncontestedGesturesAngularToleranceInDegrees:60.0];
  [(PXKitSettings *)self setSmallestSignificantScrollVelocity:100.0];
  [(PXKitSettings *)self setHonorSilentMode:0];
  [(PXKitSettings *)self setSimulateSilentMode:0];
  [(PXKitSettings *)self setDefaultAsyncTextRenderingEnabled:1];
  [(PXKitSettings *)self setDefaultLabelTypesettingMode:2];
  [(PXKitSettings *)self setDefaultUseShapeLayerForText:1];
  [(PXKitSettings *)self setDefaultTextAutoscalingEnabled:1];
  [(PXKitSettings *)self setDefaultTextMinimumScaleFactor:0.600000024];
  [(PXKitSettings *)self setDefaultTextTruncationEnabled:1];
  [(PXKitSettings *)self setDefaultTruncatedTextMinimumScaleFactor:0.649999976];
  [(PXKitSettings *)self setTextAutoscalingPrecision:5.0];
  [(PXKitSettings *)self setAllowCapitalization:1];
  [(PXKitSettings *)self setAllowFontFallback:1];
  [(PXKitSettings *)self setSimulateSlowTextTypesetting:0];
  [(PXKitSettings *)self setDrawTypographicGuidelines:0];
  v3 = (void *)MGCopyAnswer();
  if ([v3 isEqualToString:@"s5l8960x"])
  {
    v4 = (void *)MGCopyAnswer();
    int v5 = [v4 containsString:@"iPad"];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {

    uint64_t v6 = 1;
  }
  -[PXKitSettings setDeviceGraphicsQuality:](self, "setDeviceGraphicsQuality:");
  [(PXKitSettings *)self setUseFancyDarkening:v6];
  [(PXKitSettings *)self setSimulatedSafeAreaHorizontalInsets:0.0];
  [(PXKitSettings *)self setSimulatedPeripheryExtraTopInset:0.0];
  [(PXKitSettings *)self setSimulatedPeripheryExtraLeftInset:0.0];
  [(PXKitSettings *)self setSimulatedPeripheryExtraBottomInset:0.0];
  [(PXKitSettings *)self setSimulatedPeripheryExtraRightInset:0.0];
  [(PXKitSettings *)self setSimulateDroppedFramesDuringPPT:0];
  [(PXKitSettings *)self setSimulatedDroppedFramesDurationInMilliseconds:20.0];
  [(PXKitSettings *)self setSimulatedDroppedFramesPeriod:10];
  [(PXKitSettings *)self setViewResetTimeoutDuration:480.0];
}

- (void)setViewResetTimeoutDuration:(double)a3
{
  self->_viewResetTimeoutDuration = a3;
}

- (void)setUseFancyDarkening:(BOOL)a3
{
  self->_useFancyDarkening = a3;
}

- (void)setUpGesturesAngularToleranceInDegrees:(double)a3
{
  self->_upGesturesAngularToleranceInDegrees = a3;
}

- (void)setUncontestedGesturesAngularToleranceInDegrees:(double)a3
{
  self->_uncontestedGesturesAngularToleranceInDegrees = a3;
}

- (void)setTextAutoscalingPrecision:(double)a3
{
  self->_textAutoscalingPrecision = a3;
}

- (void)setSmallestSignificantScrollVelocity:(double)a3
{
  self->_smallestSignificantScrollVelocity = a3;
}

- (void)setSimulatedSafeAreaHorizontalInsets:(double)a3
{
  self->_simulatedSafeAreaHorizontalInsets = a3;
}

- (void)setSimulatedPeripheryExtraTopInset:(double)a3
{
  self->_simulatedPeripheryExtraTopInset = a3;
}

- (void)setSimulatedPeripheryExtraRightInset:(double)a3
{
  self->_simulatedPeripheryExtraRightInset = a3;
}

- (void)setSimulatedPeripheryExtraLeftInset:(double)a3
{
  self->_simulatedPeripheryExtraLeftInset = a3;
}

- (void)setSimulatedPeripheryExtraBottomInset:(double)a3
{
  self->_simulatedPeripheryExtraBottomInset = a3;
}

- (void)setSimulatedDroppedFramesPeriod:(int64_t)a3
{
  self->_simulatedDroppedFramesPeriod = a3;
}

- (void)setSimulatedDroppedFramesDurationInMilliseconds:(double)a3
{
  self->_simulatedDroppedFramesDurationInMilliseconds = a3;
}

- (void)setSimulateSlowTextTypesetting:(BOOL)a3
{
  self->_simulateSlowTextTypesetting = a3;
}

- (void)setSimulateSilentMode:(BOOL)a3
{
  self->_simulateSilentMode = a3;
}

- (void)setSimulateDroppedFramesDuringPPT:(BOOL)a3
{
  self->_simulateDroppedFramesDuringPPT = a3;
}

- (void)setHorizontalGesturesAngularToleranceInDegrees:(double)a3
{
  self->_horizontalGesturesAngularToleranceInDegrees = a3;
}

- (void)setHonorSilentMode:(BOOL)a3
{
  self->_honorSilentMode = a3;
}

- (void)setDrawTypographicGuidelines:(BOOL)a3
{
  self->_drawTypographicGuidelines = a3;
}

- (void)setDownGesturesAngularToleranceInDegrees:(double)a3
{
  self->_downGesturesAngularToleranceInDegrees = a3;
}

- (void)setDeviceGraphicsQuality:(int64_t)a3
{
  self->_deviceGraphicsQuality = a3;
}

- (void)setDefaultUseShapeLayerForText:(BOOL)a3
{
  self->_defaultUseShapeLayerForText = a3;
}

- (void)setDefaultTruncatedTextMinimumScaleFactor:(double)a3
{
  self->_defaultTruncatedTextMinimumScaleFactor = a3;
}

- (void)setDefaultTextTruncationEnabled:(BOOL)a3
{
  self->_defaultTextTruncationEnabled = a3;
}

- (void)setDefaultTextMinimumScaleFactor:(double)a3
{
  self->_defaultTextMinimumScaleFactor = a3;
}

- (void)setDefaultTextAutoscalingEnabled:(BOOL)a3
{
  self->_defaultTextAutoscalingEnabled = a3;
}

- (void)setDefaultLabelTypesettingMode:(int64_t)a3
{
  self->_defaultLabelTypesettingMode = a3;
}

- (void)setDefaultAsyncTextRenderingEnabled:(BOOL)a3
{
  self->_defaultAsyncTextRenderingEnabled = a3;
}

- (void)setAllowFontFallback:(BOOL)a3
{
  self->_allowFontFallback = a3;
}

- (void)setAllowCapitalization:(BOOL)a3
{
  self->_allowCapitalization = a3;
}

void __31__PXKitSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 kit];
  v1 = (void *)sharedInstance_sharedInstance_166843;
  sharedInstance_sharedInstance_166843 = v0;
}

- (BOOL)simulateDroppedFramesDuringPPT
{
  return self->_simulateDroppedFramesDuringPPT;
}

- (int64_t)simulatedDroppedFramesPeriod
{
  return self->_simulatedDroppedFramesPeriod;
}

- (double)simulatedDroppedFramesDurationInMilliseconds
{
  return self->_simulatedDroppedFramesDurationInMilliseconds;
}

- (int64_t)deviceGraphicsQuality
{
  return self->_deviceGraphicsQuality;
}

- (BOOL)drawTypographicGuidelines
{
  return self->_drawTypographicGuidelines;
}

- (BOOL)simulateSlowTextTypesetting
{
  return self->_simulateSlowTextTypesetting;
}

- (BOOL)allowFontFallback
{
  return self->_allowFontFallback;
}

- (BOOL)allowCapitalization
{
  return self->_allowCapitalization;
}

- (double)textAutoscalingPrecision
{
  return self->_textAutoscalingPrecision;
}

- (double)defaultTruncatedTextMinimumScaleFactor
{
  return self->_defaultTruncatedTextMinimumScaleFactor;
}

- (BOOL)defaultTextTruncationEnabled
{
  return self->_defaultTextTruncationEnabled;
}

- (double)defaultTextMinimumScaleFactor
{
  return self->_defaultTextMinimumScaleFactor;
}

- (BOOL)defaultTextAutoscalingEnabled
{
  return self->_defaultTextAutoscalingEnabled;
}

- (BOOL)defaultUseShapeLayerForText
{
  return self->_defaultUseShapeLayerForText;
}

- (int64_t)defaultLabelTypesettingMode
{
  return self->_defaultLabelTypesettingMode;
}

- (BOOL)defaultAsyncTextRenderingEnabled
{
  return self->_defaultAsyncTextRenderingEnabled;
}

- (BOOL)simulateSilentMode
{
  return self->_simulateSilentMode;
}

- (BOOL)honorSilentMode
{
  return self->_honorSilentMode;
}

- (double)smallestSignificantScrollVelocity
{
  return self->_smallestSignificantScrollVelocity;
}

- (double)uncontestedGesturesAngularToleranceInDegrees
{
  return self->_uncontestedGesturesAngularToleranceInDegrees;
}

- (double)horizontalGesturesAngularToleranceInDegrees
{
  return self->_horizontalGesturesAngularToleranceInDegrees;
}

- (double)upGesturesAngularToleranceInDegrees
{
  return self->_upGesturesAngularToleranceInDegrees;
}

- (double)downGesturesAngularToleranceInDegrees
{
  return self->_downGesturesAngularToleranceInDegrees;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v157[7] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28F60];
  v3 = NSStringFromSelector(sel_simulateDroppedFramesDuringPPT);
  uint64_t v4 = objc_msgSend(v2, "predicateWithFormat:", @"%K != 0", v3);

  int v5 = (void *)MEMORY[0x1E4F94160];
  id v104 = (id)MEMORY[0x1E4F94160];
  uint64_t v6 = (void *)MEMORY[0x1E4F941D8];
  v150 = NSStringFromSelector(sel_downGesturesAngularToleranceInDegrees);
  v149 = [v6 rowWithTitle:@"Down" valueKeyPath:v150];
  v148 = [v149 minValue:0.0 maxValue:90.0];
  v147 = objc_msgSend(v148, "px_increment:", 5.0);
  v156[0] = v147;
  objc_super v7 = (void *)MEMORY[0x1E4F941D8];
  v146 = NSStringFromSelector(sel_upGesturesAngularToleranceInDegrees);
  v145 = [v7 rowWithTitle:@"Up" valueKeyPath:v146];
  v144 = [v145 minValue:0.0 maxValue:90.0];
  v143 = objc_msgSend(v144, "px_increment:", 5.0);
  v156[1] = v143;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v142 = NSStringFromSelector(sel_horizontalGesturesAngularToleranceInDegrees);
  v141 = [v8 rowWithTitle:@"Horizontal" valueKeyPath:v142];
  v140 = [v141 minValue:0.0 maxValue:90.0];
  v139 = objc_msgSend(v140, "px_increment:", 5.0);
  v156[2] = v139;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v138 = NSStringFromSelector(sel_uncontestedGesturesAngularToleranceInDegrees);
  v137 = [v9 rowWithTitle:@"Uncontested" valueKeyPath:v138];
  v136 = [v137 minValue:0.0 maxValue:90.0];
  v135 = objc_msgSend(v136, "px_increment:", 5.0);
  v156[3] = v135;
  v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:4];
  v133 = [v5 sectionWithRows:v134 title:@"Gestures Angular Tolerances"];
  v157[0] = v133;
  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = (void *)MEMORY[0x1E4F941D8];
  v132 = NSStringFromSelector(sel_smallestSignificantScrollVelocity);
  v131 = [v11 rowWithTitle:@"Min Velocity" valueKeyPath:v132];
  v130 = [v131 minValue:0.0 maxValue:1000.0];
  v129 = objc_msgSend(v130, "px_increment:", 50.0);
  v155 = v129;
  v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
  v127 = [v10 sectionWithRows:v128 title:@"Scroll Gestures"];
  v157[1] = v127;
  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = (void *)MEMORY[0x1E4F94108];
  v126 = NSStringFromSelector(sel_viewResetTimeoutDuration);
  v125 = [v13 rowWithTitle:@"View Reset Timeout Duration" valueKeyPath:v126];
  v124 = [v125 possibleValues:&unk_1F02D4C90 titles:&unk_1F02D4CA8];
  v154[0] = v124;
  v14 = (void *)MEMORY[0x1E4F941F0];
  v123 = NSStringFromSelector(sel_honorSilentMode);
  v122 = [v14 rowWithTitle:@"Honour Silent Mode" valueKeyPath:v123];
  v154[1] = v122;
  v15 = (void *)MEMORY[0x1E4F941F0];
  v121 = NSStringFromSelector(sel_simulateSilentMode);
  v120 = [v15 rowWithTitle:@"Simulate Silent Mode" valueKeyPath:v121];
  v154[2] = v120;
  v16 = (void *)MEMORY[0x1E4F941F0];
  v119 = NSStringFromSelector(sel_defaultAsyncTextRenderingEnabled);
  v118 = [v16 rowWithTitle:@"Async Text Rendering" valueKeyPath:v119];
  v154[3] = v118;
  v17 = (void *)MEMORY[0x1E4F94108];
  v117 = NSStringFromSelector(sel_defaultLabelTypesettingMode);
  v116 = [v17 rowWithTitle:@"Typesetting Mode" valueKeyPath:v117];
  v115 = [v116 possibleValues:&unk_1F02D4CC0 titles:&unk_1F02D4CD8];
  v154[4] = v115;
  v18 = (void *)MEMORY[0x1E4F941F0];
  v114 = NSStringFromSelector(sel_defaultUseShapeLayerForText);
  v113 = [v18 rowWithTitle:@"Shape Layer for Text" valueKeyPath:v114];
  v154[5] = v113;
  v19 = (void *)MEMORY[0x1E4F941F0];
  v112 = NSStringFromSelector(sel_defaultTextAutoscalingEnabled);
  v111 = [v19 rowWithTitle:@"Text Autoscaling" valueKeyPath:v112];
  v154[6] = v111;
  v20 = (void *)MEMORY[0x1E4F941D8];
  v110 = NSStringFromSelector(sel_defaultTextMinimumScaleFactor);
  v109 = [v20 rowWithTitle:@"Text Minimum Scale Factor" valueKeyPath:v110];
  v108 = [v109 conditionFormat:@"defaultTextAutoscalingEnabled != 0"];
  v154[7] = v108;
  v21 = (void *)MEMORY[0x1E4F941F0];
  v107 = NSStringFromSelector(sel_defaultTextTruncationEnabled);
  v106 = [v21 rowWithTitle:@"Text Truncation" valueKeyPath:v107];
  v154[8] = v106;
  v22 = (void *)MEMORY[0x1E4F941D8];
  v103 = NSStringFromSelector(sel_defaultTruncatedTextMinimumScaleFactor);
  v102 = [v22 rowWithTitle:@"Truncated Text Minimum Scale Factor" valueKeyPath:v103];
  v101 = [v102 conditionFormat:@"defaultTextTruncationEnabled != 0"];
  v154[9] = v101;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:10];
  v99 = [v12 sectionWithRows:v100 title:@"Default Values"];
  v157[2] = v99;
  v23 = (void *)MEMORY[0x1E4F94160];
  v24 = (void *)MEMORY[0x1E4F94108];
  v98 = NSStringFromSelector(sel_deviceGraphicsQuality);
  v97 = [v24 rowWithTitle:@"Graphics Quality" valueKeyPath:v98];
  v96 = [v97 possibleValues:&unk_1F02D4CF0 titles:&unk_1F02D4D08];
  v153[0] = v96;
  v25 = (void *)MEMORY[0x1E4F941F0];
  v95 = NSStringFromSelector(sel_useFancyDarkening);
  v94 = [v25 rowWithTitle:@"Fancy Darkening (requires app restart)" valueKeyPath:v95];
  v153[1] = v94;
  v26 = (void *)MEMORY[0x1E4F941D8];
  v93 = NSStringFromSelector(sel_textAutoscalingPrecision);
  v92 = [v26 rowWithTitle:@"Text Autoscaling Precision" valueKeyPath:v93];
  v91 = [v92 minValue:1.0 maxValue:50.0];
  v90 = objc_msgSend(v91, "px_increment:", 1.0);
  v153[2] = v90;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:3];
  v88 = [v23 sectionWithRows:v89 title:@"Settings"];
  v157[3] = v88;
  v27 = (void *)MEMORY[0x1E4F94160];
  v28 = (void *)MEMORY[0x1E4F941F0];
  v87 = NSStringFromSelector(sel_allowCapitalization);
  v86 = [v28 rowWithTitle:@"Allow Capitalization" valueKeyPath:v87];
  v152[0] = v86;
  v29 = (void *)MEMORY[0x1E4F941F0];
  v85 = NSStringFromSelector(sel_allowFontFallback);
  v84 = [v29 rowWithTitle:@"Allow Font Fallback" valueKeyPath:v85];
  v152[1] = v84;
  v30 = (void *)MEMORY[0x1E4F941F0];
  v83 = NSStringFromSelector(sel_simulateSlowTextTypesetting);
  v82 = [v30 rowWithTitle:@"Slow Text Typesetting" valueKeyPath:v83];
  v152[2] = v82;
  v31 = (void *)MEMORY[0x1E4F941F0];
  v80 = NSStringFromSelector(sel_drawTypographicGuidelines);
  v79 = [v31 rowWithTitle:@"Typographic Guidelines" valueKeyPath:v80];
  v152[3] = v79;
  v32 = (void *)MEMORY[0x1E4F941D8];
  v78 = NSStringFromSelector(sel_simulatedSafeAreaHorizontalInsets);
  v77 = [v32 rowWithTitle:@"Safe Area Horizontal Insets" valueKeyPath:v78];
  v76 = [v77 minValue:0.0 maxValue:250.0];
  v75 = objc_msgSend(v76, "px_increment:", 10.0);
  v152[4] = v75;
  v33 = (void *)MEMORY[0x1E4F941D8];
  v74 = NSStringFromSelector(sel_simulatedPeripheryExtraTopInset);
  v73 = [v33 rowWithTitle:@"Periphery Extra Top Inset" valueKeyPath:v74];
  v72 = [v73 minValue:0.0 maxValue:150.0];
  v71 = objc_msgSend(v72, "px_increment:", 1.0);
  v152[5] = v71;
  v34 = (void *)MEMORY[0x1E4F941D8];
  v70 = NSStringFromSelector(sel_simulatedPeripheryExtraLeftInset);
  v69 = [v34 rowWithTitle:@"Periphery Extra Left Inset" valueKeyPath:v70];
  v68 = [v69 minValue:0.0 maxValue:150.0];
  v67 = objc_msgSend(v68, "px_increment:", 1.0);
  v152[6] = v67;
  v35 = (void *)MEMORY[0x1E4F941D8];
  v66 = NSStringFromSelector(sel_simulatedPeripheryExtraBottomInset);
  v65 = [v35 rowWithTitle:@"Periphery Extra Bottom Inset" valueKeyPath:v66];
  v64 = [v65 minValue:0.0 maxValue:150.0];
  v63 = objc_msgSend(v64, "px_increment:", 1.0);
  v152[7] = v63;
  v36 = (void *)MEMORY[0x1E4F941D8];
  v62 = NSStringFromSelector(sel_simulatedPeripheryExtraRightInset);
  v61 = [v36 rowWithTitle:@"Periphery Extra Right Inset" valueKeyPath:v62];
  v60 = [v61 minValue:0.0 maxValue:150.0];
  v59 = objc_msgSend(v60, "px_increment:", 1.0);
  v152[8] = v59;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:9];
  v57 = [v27 sectionWithRows:v58 title:@"Debug"];
  v157[4] = v57;
  v51 = (void *)MEMORY[0x1E4F94160];
  v37 = (void *)MEMORY[0x1E4F941F0];
  v56 = NSStringFromSelector(sel_simulateDroppedFramesDuringPPT);
  v55 = [v37 rowWithTitle:@"Simulate Dropped Frames" valueKeyPath:v56];
  v151[0] = v55;
  v38 = (void *)MEMORY[0x1E4F941D8];
  v54 = NSStringFromSelector(sel_simulatedDroppedFramesDurationInMilliseconds);
  v53 = [v38 rowWithTitle:@"Dropped Frames Duration" valueKeyPath:v54];
  v52 = [v53 minValue:1.0 maxValue:100.0];
  v81 = (void *)v4;
  v39 = [v52 condition:v4];
  v151[1] = v39;
  v40 = (void *)MEMORY[0x1E4F941D8];
  v41 = NSStringFromSelector(sel_simulatedDroppedFramesPeriod);
  v42 = [v40 rowWithTitle:@"Dropped Frames Period" valueKeyPath:v41];
  v43 = [v42 minValue:1.0 maxValue:120.0];
  v44 = objc_msgSend(v43, "px_increment:", 1.0);
  v45 = [v44 condition:v4];
  v151[2] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:3];
  v47 = [v51 sectionWithRows:v46 title:@"PPT"];
  v157[5] = v47;
  v48 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v157[6] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:7];
  id v105 = [v104 moduleWithTitle:@"Kit" contents:v49];

  return v105;
}

@end