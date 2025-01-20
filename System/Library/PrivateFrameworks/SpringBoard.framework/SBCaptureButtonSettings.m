@interface SBCaptureButtonSettings
+ (id)settingsControllerModule;
- (BOOL)dosidoUsesHomeScreenBlur;
- (BOOL)enableZoomUpBlur;
- (BOOL)enablesStationaryDetectionForUnlocked;
- (BOOL)visionIntelligenceKeylineRimIsSoft;
- (BOOL)visionIntelligenceKeylineScreenBlendMode;
- (SBFFluidBehaviorSettings)dosidoLayoutAndPositionSettings;
- (SBFFluidBehaviorSettings)dosidoScaleSettings;
- (SBFFluidBehaviorSettings)preludePresentationTranslationSettings;
- (SBFFluidBehaviorSettings)visionIntelligenceBehaviorSettings;
- (SBFFluidBehaviorSettings)visionIntelligenceHintBehaviorSettings;
- (SBFFluidBehaviorSettings)zoomUpBackgroundDimAnimationSettings;
- (SBFFluidBehaviorSettings)zoomUpCornerRadiusSettings;
- (SBFFluidBehaviorSettings)zoomUpDisableDropletEffectFiltersSettings;
- (SBFFluidBehaviorSettings)zoomUpDropletRadiusAnimationSettings;
- (SBFFluidBehaviorSettings)zoomUpPositionXSettings;
- (SBFFluidBehaviorSettings)zoomUpPositionYSettings;
- (SBFFluidBehaviorSettings)zoomUpScaleSettings;
- (double)accidentalPreventionPickUpBuffer;
- (double)accidentalPreventionStationaryThreshold;
- (double)coachingUIDismissalInterval;
- (double)directLaunchAfterUnsuppressGracePeriod;
- (double)disableDropletEffectDelay;
- (double)dosidoTargetScale;
- (double)ignoreFaceDownAfterDuration;
- (double)launchAfterButtonUpGracePeriod;
- (double)longPressVisionIntelligenceDelay;
- (double)preludeCornerRadius;
- (double)preludeDropletRadius;
- (double)preludeScreenEdgeInset;
- (double)stationaryDetectionDebounceInterval;
- (double)visionIntelligenceKeylineAlpha;
- (double)visionIntelligenceKeylineEDRGain;
- (double)visionIntelligenceKeylineFadeEnd;
- (double)visionIntelligenceKeylineFadeLength;
- (double)visionIntelligenceKeylineFadeStart;
- (double)visionIntelligenceKeylineLargeAmount;
- (double)visionIntelligenceKeylineLargeBlurRadius;
- (double)visionIntelligenceKeylineLargeEnd;
- (double)visionIntelligenceKeylineLargeStart;
- (double)visionIntelligenceKeylineSmallWidth;
- (double)zoomUpBackgroundDimStartProgress;
- (double)zoomUpBlurStartProgress;
- (double)zoomUpDropletRadius;
- (double)zoomUpYAndScaleDelay;
- (void)_configureSettings:(id)a3 withDamping:(double)a4 mass:(double)a5 stiffness:(double)a6;
- (void)setAccidentalPreventionPickUpBuffer:(double)a3;
- (void)setAccidentalPreventionStationaryThreshold:(double)a3;
- (void)setCoachingUIDismissalInterval:(double)a3;
- (void)setDefaultValues;
- (void)setDirectLaunchAfterUnsuppressGracePeriod:(double)a3;
- (void)setDisableDropletEffectDelay:(double)a3;
- (void)setDosidoLayoutAndPositionSettings:(id)a3;
- (void)setDosidoScaleSettings:(id)a3;
- (void)setDosidoTargetScale:(double)a3;
- (void)setDosidoUsesHomeScreenBlur:(BOOL)a3;
- (void)setEnableZoomUpBlur:(BOOL)a3;
- (void)setEnablesStationaryDetectionForUnlocked:(BOOL)a3;
- (void)setIgnoreFaceDownAfterDuration:(double)a3;
- (void)setLaunchAfterButtonUpGracePeriod:(double)a3;
- (void)setLongPressVisionIntelligenceDelay:(double)a3;
- (void)setPreludeCornerRadius:(double)a3;
- (void)setPreludeDropletRadius:(double)a3;
- (void)setPreludePresentationTranslationSettings:(id)a3;
- (void)setPreludeScreenEdgeInset:(double)a3;
- (void)setStationaryDetectionDebounceInterval:(double)a3;
- (void)setVisionIntelligenceBehaviorSettings:(id)a3;
- (void)setVisionIntelligenceHintBehaviorSettings:(id)a3;
- (void)setVisionIntelligenceKeylineAlpha:(double)a3;
- (void)setVisionIntelligenceKeylineEDRGain:(double)a3;
- (void)setVisionIntelligenceKeylineFadeEnd:(double)a3;
- (void)setVisionIntelligenceKeylineFadeLength:(double)a3;
- (void)setVisionIntelligenceKeylineFadeStart:(double)a3;
- (void)setVisionIntelligenceKeylineLargeAmount:(double)a3;
- (void)setVisionIntelligenceKeylineLargeBlurRadius:(double)a3;
- (void)setVisionIntelligenceKeylineLargeEnd:(double)a3;
- (void)setVisionIntelligenceKeylineLargeStart:(double)a3;
- (void)setVisionIntelligenceKeylineRimIsSoft:(BOOL)a3;
- (void)setVisionIntelligenceKeylineScreenBlendMode:(BOOL)a3;
- (void)setVisionIntelligenceKeylineSmallWidth:(double)a3;
- (void)setZoomUpBackgroundDimAnimationSettings:(id)a3;
- (void)setZoomUpBackgroundDimStartProgress:(double)a3;
- (void)setZoomUpBlurStartProgress:(double)a3;
- (void)setZoomUpCornerRadiusSettings:(id)a3;
- (void)setZoomUpDisableDropletEffectFiltersSettings:(id)a3;
- (void)setZoomUpDropletRadius:(double)a3;
- (void)setZoomUpDropletRadiusAnimationSettings:(id)a3;
- (void)setZoomUpPositionXSettings:(id)a3;
- (void)setZoomUpPositionYSettings:(id)a3;
- (void)setZoomUpScaleSettings:(id)a3;
- (void)setZoomUpYAndScaleDelay:(double)a3;
@end

@implementation SBCaptureButtonSettings

- (void)setDefaultValues
{
  v72.receiver = self;
  v72.super_class = (Class)SBCaptureButtonSettings;
  [(PTSettings *)&v72 setDefaultValues];
  [(SBCaptureButtonSettings *)self setLaunchAfterButtonUpGracePeriod:0.65];
  [(SBCaptureButtonSettings *)self setIgnoreFaceDownAfterDuration:1.0];
  [(SBCaptureButtonSettings *)self setDirectLaunchAfterUnsuppressGracePeriod:2.0];
  [(SBCaptureButtonSettings *)self setLongPressVisionIntelligenceDelay:0.65];
  [(SBCaptureButtonSettings *)self setPreludeDropletRadius:8.33333333];
  [(SBCaptureButtonSettings *)self setPreludeCornerRadius:33.3333333];
  [(SBCaptureButtonSettings *)self setPreludeScreenEdgeInset:13.3333333];
  v3 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  [v3 setDefaultValues];

  v4 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  [v4 setBehaviorType:1];

  v5 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  [v5 setResponse:0.484];

  v6 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  [v6 setDampingRatio:0.845];

  v7 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  [v7 setName:@"Droplet Presentation"];

  v8 = [(SBCaptureButtonSettings *)self preludePresentationTranslationSettings];
  CAFrameRateRange v73 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114147, *(double *)&v73.minimum, *(double *)&v73.maximum, *(double *)&v73.preferred);

  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineScreenBlendMode:0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineRimIsSoft:0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineAlpha:1.0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineLargeBlurRadius:1.0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineLargeAmount:0.5];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineLargeStart:0.32];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineLargeEnd:0.465];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineSmallWidth:0.0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineFadeLength:50.0];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineFadeStart:0.28];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineFadeEnd:0.8];
  [(SBCaptureButtonSettings *)self setVisionIntelligenceKeylineEDRGain:4.5];
  v9 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  [v9 setDefaultValues];

  v10 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  [v10 setBehaviorType:1];

  v11 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  [v11 setResponse:0.531];

  v12 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  [v12 setDampingRatio:1.0];

  v13 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  [v13 setName:@"Droplet Settings"];

  v14 = [(SBCaptureButtonSettings *)self visionIntelligenceBehaviorSettings];
  CAFrameRateRange v74 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v14, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v74.minimum, *(double *)&v74.maximum, *(double *)&v74.preferred);

  v15 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  [v15 setDefaultValues];

  v16 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  [v16 setBehaviorType:1];

  v17 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  [v17 setResponse:0.224];

  v18 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  [v18 setDampingRatio:3.2];

  v19 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  [v19 setName:@"Droplet Hint Settings"];

  v20 = [(SBCaptureButtonSettings *)self visionIntelligenceHintBehaviorSettings];
  CAFrameRateRange v75 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v20, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v75.minimum, *(double *)&v75.maximum, *(double *)&v75.preferred);

  [(SBCaptureButtonSettings *)self setEnableZoomUpBlur:1];
  [(SBCaptureButtonSettings *)self setZoomUpDropletRadius:0.0];
  [(SBCaptureButtonSettings *)self setDisableDropletEffectDelay:0.1];
  [(SBCaptureButtonSettings *)self setZoomUpYAndScaleDelay:0.024];
  v21 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v21 setDefaultValues];

  v22 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v22 setBehaviorType:1];

  v23 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v23 setResponse:0.412];

  v24 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v24 setDampingRatio:0.816];

  v25 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v25 setRetargetImpulse:0.016];

  v26 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  [v26 setName:@"Droplet Zoom Up Position X"];

  v27 = [(SBCaptureButtonSettings *)self zoomUpPositionXSettings];
  CAFrameRateRange v76 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v27, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v76.minimum, *(double *)&v76.maximum, *(double *)&v76.preferred);

  v28 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  [v28 setDefaultValues];

  v29 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  [v29 setBehaviorType:1];

  v30 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  [v30 setResponse:0.412];

  v31 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  [v31 setDampingRatio:1.1];

  v32 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  [v32 setName:@"Droplet Zoom Up Position Y"];

  v33 = [(SBCaptureButtonSettings *)self zoomUpPositionYSettings];
  CAFrameRateRange v77 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v33, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v77.minimum, *(double *)&v77.maximum, *(double *)&v77.preferred);

  v34 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  [v34 setDefaultValues];

  v35 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  [v35 setBehaviorType:1];

  v36 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  [v36 setResponse:0.424];

  v37 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  [v37 setDampingRatio:1.1];

  v38 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  [v38 setName:@"Droplet Zoom Up Scale"];

  v39 = [(SBCaptureButtonSettings *)self zoomUpScaleSettings];
  CAFrameRateRange v78 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v39, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v78.minimum, *(double *)&v78.maximum, *(double *)&v78.preferred);

  v40 = [(SBCaptureButtonSettings *)self zoomUpCornerRadiusSettings];
  [v40 setDefaultValues];

  v41 = [(SBCaptureButtonSettings *)self zoomUpCornerRadiusSettings];
  [v41 setBehaviorType:1];

  v42 = [(SBCaptureButtonSettings *)self zoomUpCornerRadiusSettings];
  [(SBCaptureButtonSettings *)self _configureSettings:v42 withDamping:36.0328 mass:1.0 stiffness:324.591];

  v43 = [(SBCaptureButtonSettings *)self zoomUpCornerRadiusSettings];
  [v43 setName:@"Droplet Zoom Up Corner Radius"];

  v44 = [(SBCaptureButtonSettings *)self zoomUpCornerRadiusSettings];
  CAFrameRateRange v79 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v44, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v79.minimum, *(double *)&v79.maximum, *(double *)&v79.preferred);

  v45 = [(SBCaptureButtonSettings *)self zoomUpDropletRadiusAnimationSettings];
  [v45 setDefaultValues];

  v46 = [(SBCaptureButtonSettings *)self zoomUpDropletRadiusAnimationSettings];
  [v46 setBehaviorType:1];

  v47 = [(SBCaptureButtonSettings *)self zoomUpDropletRadiusAnimationSettings];
  [(SBCaptureButtonSettings *)self _configureSettings:v47 withDamping:50.0 mass:2.0 stiffness:300.0];

  v48 = [(SBCaptureButtonSettings *)self zoomUpDropletRadiusAnimationSettings];
  [v48 setName:@"Droplet Zoom Up Droplet Radius"];

  v49 = [(SBCaptureButtonSettings *)self zoomUpDropletRadiusAnimationSettings];
  CAFrameRateRange v80 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v49, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v80.minimum, *(double *)&v80.maximum, *(double *)&v80.preferred);

  v50 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  [v50 setDefaultValues];

  v51 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  [v51 setBehaviorType:1];

  v52 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  [v52 setResponse:0.28];

  v53 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  [v53 setDampingRatio:1.0];

  v54 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  [v54 setName:@"Droplet Zoom Up Background Dim"];

  v55 = [(SBCaptureButtonSettings *)self zoomUpBackgroundDimAnimationSettings];
  CAFrameRateRange v81 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v55, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v81.minimum, *(double *)&v81.maximum, *(double *)&v81.preferred);

  v56 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  [v56 setDefaultValues];

  v57 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  [v57 setBehaviorType:1];

  v58 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  [v58 setResponse:0.128];

  v59 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  [v59 setDampingRatio:1.0];

  v60 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  [v60 setName:@"Droplet Zoom Up Disable Dropletting"];

  v61 = [(SBCaptureButtonSettings *)self zoomUpDisableDropletEffectFiltersSettings];
  CAFrameRateRange v82 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v61, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v82.minimum, *(double *)&v82.maximum, *(double *)&v82.preferred);

  [(SBCaptureButtonSettings *)self setDosidoTargetScale:0.5];
  v62 = [(SBCaptureButtonSettings *)self dosidoLayoutAndPositionSettings];
  [v62 setDefaultValues];

  v63 = [(SBCaptureButtonSettings *)self dosidoLayoutAndPositionSettings];
  [v63 setBehaviorType:1];

  v64 = [(SBCaptureButtonSettings *)self dosidoLayoutAndPositionSettings];
  [(SBCaptureButtonSettings *)self _configureSettings:v64 withDamping:50.0 mass:2.0 stiffness:300.0];

  v65 = [(SBCaptureButtonSettings *)self dosidoLayoutAndPositionSettings];
  [v65 setName:@"Droplet Do-si-do Layout and Position"];

  v66 = [(SBCaptureButtonSettings *)self dosidoLayoutAndPositionSettings];
  CAFrameRateRange v83 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v66, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v83.minimum, *(double *)&v83.maximum, *(double *)&v83.preferred);

  v67 = [(SBCaptureButtonSettings *)self dosidoScaleSettings];
  [v67 setDefaultValues];

  v68 = [(SBCaptureButtonSettings *)self dosidoScaleSettings];
  [v68 setBehaviorType:1];

  v69 = [(SBCaptureButtonSettings *)self dosidoScaleSettings];
  [(SBCaptureButtonSettings *)self _configureSettings:v69 withDamping:50.0 mass:2.0 stiffness:300.0];

  v70 = [(SBCaptureButtonSettings *)self dosidoScaleSettings];
  [v70 setName:@"Droplet Do-si-do Scale"];

  v71 = [(SBCaptureButtonSettings *)self dosidoScaleSettings];
  CAFrameRateRange v84 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v71, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v84.minimum, *(double *)&v84.maximum, *(double *)&v84.preferred);

  [(SBCaptureButtonSettings *)self setZoomUpBlurStartProgress:0.0];
  [(SBCaptureButtonSettings *)self setZoomUpBackgroundDimStartProgress:0.85];
  [(SBCaptureButtonSettings *)self setDosidoUsesHomeScreenBlur:1];
  [(SBCaptureButtonSettings *)self setEnablesStationaryDetectionForUnlocked:1];
  [(SBCaptureButtonSettings *)self setAccidentalPreventionStationaryThreshold:0.1];
  [(SBCaptureButtonSettings *)self setAccidentalPreventionPickUpBuffer:0.2];
  [(SBCaptureButtonSettings *)self setCoachingUIDismissalInterval:3.0];
  [(SBCaptureButtonSettings *)self setStationaryDetectionDebounceInterval:4.0];
}

- (void)_configureSettings:(id)a3 withDamping:(double)a4 mass:(double)a5 stiffness:(double)a6
{
  id v6 = a3;
  convertDampingMassAndStiffnessToDampingRatioAndResponse();
  [v6 setDampingRatio:0.0];
  [v6 setResponse:0.0];
}

+ (id)settingsControllerModule
{
  v182[4] = *MEMORY[0x1E4F143B8];
  v174 = [MEMORY[0x1E4F1CA48] array];
  v2 = (void *)MEMORY[0x1E4F94168];
  v168 = [MEMORY[0x1E4F94140] rowWithTitle:@"Grace period (sec) after release" valueKeyPath:@"launchAfterButtonUpGracePeriod"];
  v162 = [v168 between:0.0 and:5.0];
  v157 = [v162 precision:3];
  v182[0] = v157;
  v153 = [MEMORY[0x1E4F94140] rowWithTitle:@"Time to honor face down (sec)" valueKeyPath:@"ignoreFaceDownAfterDuration"];
  v3 = [v153 between:0.0 and:5.0];
  v4 = [v3 precision:3];
  v182[1] = v4;
  v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"Directly Launch after Unsuppress (sec)" valueKeyPath:@"directLaunchAfterUnsuppressGracePeriod"];
  id v6 = [v5 between:0.0 and:10.0];
  v7 = [v6 precision:2];
  v182[2] = v7;
  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Long Press Delay" valueKeyPath:@"longPressVisionIntelligenceDelay"];
  v9 = [v8 between:0.0 and:10.0];
  v10 = [v9 precision:2];
  v182[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:4];
  v12 = [v2 sectionWithRows:v11 title:@"Launch Behavior (VO leniency)"];
  [v174 addObject:v12];

  v13 = (void *)MEMORY[0x1E4F94168];
  v169 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prelude Droplet Radius" valueKeyPath:@"preludeDropletRadius"];
  v163 = [v169 between:0.0 and:100.0];
  v14 = [v163 precision:2];
  v181[0] = v14;
  v15 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prelude Corner Radius" valueKeyPath:@"preludeCornerRadius"];
  v16 = [v15 between:0.0 and:200.0];
  v17 = [v16 precision:2];
  v181[1] = v17;
  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Prelude Droplet Screen Edge Inset" valueKeyPath:@"preludeScreenEdgeInset"];
  v19 = [v18 between:0.0 and:200.0];
  v20 = [v19 precision:2];
  v181[2] = v20;
  v21 = [MEMORY[0x1E4F94138] rowWithTitle:@"Prelude Presentation Animation" childSettingsKeyPath:@"preludePresentationTranslationSettings"];
  v181[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:4];
  v23 = [v13 sectionWithRows:v22 title:@"Launch Prelude (initial droplet)"];
  [v174 addObject:v23];

  v24 = (void *)MEMORY[0x1E4F94168];
  v170 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Composites with Screen Blend Mode" valueKeyPath:@"visionIntelligenceKeylineScreenBlendMode"];
  v180[0] = v170;
  v164 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Rim Is Soft" valueKeyPath:@"visionIntelligenceKeylineRimIsSoft"];
  v180[1] = v164;
  v158 = [MEMORY[0x1E4F94140] rowWithTitle:@"Alpha" valueKeyPath:@"visionIntelligenceKeylineAlpha"];
  v154 = [v158 between:0.0 and:1.0];
  v150 = [v154 precision:3];
  v180[2] = v150;
  v147 = [MEMORY[0x1E4F94140] rowWithTitle:@"Blur Radius" valueKeyPath:@"visionIntelligenceKeylineLargeBlurRadius"];
  v144 = [v147 between:0.0 and:100.0];
  v141 = [v144 precision:2];
  v180[3] = v141;
  v138 = [MEMORY[0x1E4F94140] rowWithTitle:@"Large AST Amount" valueKeyPath:@"visionIntelligenceKeylineLargeAmount"];
  v135 = [v138 between:0.0 and:1.0];
  v132 = [v135 precision:3];
  v180[4] = v132;
  v129 = [MEMORY[0x1E4F94140] rowWithTitle:@"Large AST Start" valueKeyPath:@"visionIntelligenceKeylineLargeStart"];
  v126 = [v129 between:0.0 and:1.0];
  v123 = [v126 precision:3];
  v180[5] = v123;
  v120 = [MEMORY[0x1E4F94140] rowWithTitle:@"Large AST End" valueKeyPath:@"visionIntelligenceKeylineLargeEnd"];
  v117 = [v120 between:0.0 and:1.0];
  v115 = [v117 precision:3];
  v180[6] = v115;
  v113 = [MEMORY[0x1E4F94140] rowWithTitle:@"Small Width" valueKeyPath:@"visionIntelligenceKeylineSmallWidth"];
  v111 = [v113 between:0.0 and:100.0];
  v109 = [v111 precision:2];
  v180[7] = v109;
  v107 = [MEMORY[0x1E4F94140] rowWithTitle:@"Fade Length" valueKeyPath:@"visionIntelligenceKeylineFadeLength"];
  v105 = [v107 between:0.0 and:200.0];
  v104 = [v105 precision:2];
  v180[8] = v104;
  v103 = [MEMORY[0x1E4F94140] rowWithTitle:@"Fade Start" valueKeyPath:@"visionIntelligenceKeylineFadeStart"];
  v102 = [v103 between:0.0 and:1.0];
  v101 = [v102 precision:3];
  v180[9] = v101;
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Fade End" valueKeyPath:@"visionIntelligenceKeylineFadeEnd"];
  v26 = [v25 between:0.0 and:1.0];
  v27 = [v26 precision:3];
  v180[10] = v27;
  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dropet EDR Gain" valueKeyPath:@"visionIntelligenceKeylineEDRGain"];
  v29 = [v28 between:0.0 and:50.0];
  v30 = [v29 precision:2];
  v180[11] = v30;
  v31 = [MEMORY[0x1E4F94138] rowWithTitle:@"Style Settings" valueKeyPath:@"visionIntelligenceBehaviorSettings"];
  v180[12] = v31;
  v32 = [MEMORY[0x1E4F94138] rowWithTitle:@"Style Hint Settings" valueKeyPath:@"visionIntelligenceHintBehaviorSettings"];
  v180[13] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:14];
  v34 = [v24 sectionWithRows:v33 title:@"Vision Intelligence Droplet Keyline"];
  [v174 addObject:v34];

  v35 = (void *)MEMORY[0x1E4F94168];
  v171 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Up Y & Scale Delay" valueKeyPath:@"zoomUpYAndScaleDelay"];
  v165 = [v171 between:0.0 and:1.0];
  v159 = [v165 precision:3];
  v179[0] = v159;
  v155 = [MEMORY[0x1E4F94140] rowWithTitle:@"Zoom Up Droplet Radius" valueKeyPath:@"zoomUpDropletRadius"];
  v151 = [v155 between:0.0 and:100.0];
  v148 = [v151 precision:2];
  v179[1] = v148;
  v145 = [MEMORY[0x1E4F94140] rowWithTitle:@"Disable Droplet Delay" valueKeyPath:@"disableDropletEffectDelay"];
  v142 = [v145 between:0.0 and:1.0];
  v139 = [v142 precision:2];
  v179[2] = v139;
  v136 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position X" childSettingsKeyPath:@"zoomUpPositionXSettings"];
  v179[3] = v136;
  v133 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position Y" childSettingsKeyPath:@"zoomUpPositionYSettings"];
  v179[4] = v133;
  v130 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scale" childSettingsKeyPath:@"zoomUpScaleSettings"];
  v179[5] = v130;
  v127 = [MEMORY[0x1E4F94138] rowWithTitle:@"Corner Radius" childSettingsKeyPath:@"zoomUpCornerRadiusSettings"];
  v179[6] = v127;
  v124 = [MEMORY[0x1E4F94138] rowWithTitle:@"Droplet Radius" childSettingsKeyPath:@"zoomUpDropletRadiusAnimationSettings"];
  v179[7] = v124;
  v121 = [MEMORY[0x1E4F94138] rowWithTitle:@"Background Dim" childSettingsKeyPath:@"zoomUpBackgroundDimAnimationSettings"];
  v179[8] = v121;
  v118 = [MEMORY[0x1E4F94138] rowWithTitle:@"Disable Dropletting Filters" childSettingsKeyPath:@"zoomUpDisableDropletEffectFiltersSettings"];
  v179[9] = v118;
  v36 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Zoom Up Blur" valueKeyPath:@"enableZoomUpBlur"];
  v179[10] = v36;
  v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Start Blur Progress" valueKeyPath:@"zoomUpBlurStartProgress"];
  v38 = [v37 between:0.0 and:1.0];
  v39 = [v38 precision:2];
  v40 = [v39 conditionFormat:@"enableZoomUpBlur != 0"];
  v179[11] = v40;
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Start Background Dim Progress" valueKeyPath:@"zoomUpBackgroundDimStartProgress"];
  v42 = [v41 between:0.0 and:1.0];
  v43 = [v42 precision:2];
  v179[12] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:13];
  v45 = [v35 sectionWithRows:v44 title:@"Launch Zoom Up"];
  [v174 addObject:v45];

  v46 = (void *)MEMORY[0x1E4F94168];
  v47 = [MEMORY[0x1E4F94140] rowWithTitle:@"Do-si-do target scale" valueKeyPath:@"dosidoTargetScale"];
  v48 = [v47 between:0.0 and:1.0];
  v49 = [v48 precision:2];
  v178[0] = v49;
  v50 = [MEMORY[0x1E4F94138] rowWithTitle:@"Do-si-do Translation Animation" childSettingsKeyPath:@"dosidoLayoutAndPositionSettings"];
  v178[1] = v50;
  v51 = [MEMORY[0x1E4F94138] rowWithTitle:@"Do-si-do Scale Animation" childSettingsKeyPath:@"dosidoScaleSettings"];
  v178[2] = v51;
  v52 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Do-si-do Uses Home Screen Blur" valueKeyPath:@"dosidoUsesHomeScreenBlur"];
  v178[3] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:4];
  v54 = [v46 sectionWithRows:v53 title:@"Launch Do-si-do"];
  [v174 addObject:v54];

  v55 = (void *)MEMORY[0x1E4F94168];
  v172 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable when UI Unlocked" valueKeyPath:@"enablesStationaryDetectionForUnlocked"];
  v177[0] = v172;
  v166 = [MEMORY[0x1E4F94140] rowWithTitle:@"Stationary threshold (seconds)" valueKeyPath:@"accidentalPreventionStationaryThreshold"];
  v160 = [v166 between:0.0 and:60.0];
  v56 = [v160 precision:2];
  v177[1] = v56;
  v57 = [MEMORY[0x1E4F94140] rowWithTitle:@"Pick up buffer (seconds)" valueKeyPath:@"accidentalPreventionPickUpBuffer"];
  v58 = [v57 between:0.0 and:4.0];
  v59 = [v58 precision:2];
  v177[2] = v59;
  v60 = [MEMORY[0x1E4F94140] rowWithTitle:@"Stationary detection debounce (sec)" valueKeyPath:@"stationaryDetectionDebounceInterval"];
  v61 = [v60 between:0.0 and:60.0];
  v62 = [v61 precision:2];
  v177[3] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:4];
  v64 = [v55 sectionWithRows:v63 title:@"Device Stationary Detection"];
  [v174 addObject:v64];

  v65 = (void *)MEMORY[0x1E4F94168];
  v66 = (void *)MEMORY[0x1E4F94140];
  v67 = NSStringFromSelector(sel_coachingUIDismissalInterval);
  v68 = [v66 rowWithTitle:@"Coaching UI Dismissal Interval" valueKeyPath:v67];
  v69 = [v68 between:0.0 and:10.0];
  v70 = [v69 precision:2];
  v176 = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v176 count:1];
  objc_super v72 = [v65 sectionWithRows:v71 title:@"Coaching UI"];
  [v174 addObject:v72];

  CAFrameRateRange v73 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v74 = (void *)MEMORY[0x1E4F94100];
  v173 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v167 = [v74 rowWithTitle:@"Restore Defaults" action:v173];
  v175[0] = v167;
  CAFrameRateRange v75 = (void *)MEMORY[0x1E4F94100];
  v161 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v156 = [v75 rowWithTitle:@"Restore Defaults" action:v161];
  v175[1] = v156;
  CAFrameRateRange v76 = (void *)MEMORY[0x1E4F94100];
  v152 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v149 = [v76 rowWithTitle:@"Restore Defaults" action:v152];
  v175[2] = v149;
  CAFrameRateRange v77 = (void *)MEMORY[0x1E4F94100];
  v146 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v143 = [v77 rowWithTitle:@"Restore Defaults" action:v146];
  v175[3] = v143;
  CAFrameRateRange v78 = (void *)MEMORY[0x1E4F94100];
  v140 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v137 = [v78 rowWithTitle:@"Restore Defaults" action:v140];
  v175[4] = v137;
  CAFrameRateRange v79 = (void *)MEMORY[0x1E4F94100];
  v134 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v131 = [v79 rowWithTitle:@"Restore Defaults" action:v134];
  v175[5] = v131;
  CAFrameRateRange v80 = (void *)MEMORY[0x1E4F94100];
  v128 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v125 = [v80 rowWithTitle:@"Restore Defaults" action:v128];
  v175[6] = v125;
  CAFrameRateRange v81 = (void *)MEMORY[0x1E4F94100];
  v122 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v119 = [v81 rowWithTitle:@"Restore Defaults" action:v122];
  v175[7] = v119;
  CAFrameRateRange v82 = (void *)MEMORY[0x1E4F94100];
  v116 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v114 = [v82 rowWithTitle:@"Restore Defaults" action:v116];
  v175[8] = v114;
  CAFrameRateRange v83 = (void *)MEMORY[0x1E4F94100];
  v112 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v110 = [v83 rowWithTitle:@"Restore Defaults" action:v112];
  v175[9] = v110;
  CAFrameRateRange v84 = (void *)MEMORY[0x1E4F94100];
  v108 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v106 = [v84 rowWithTitle:@"Restore Defaults" action:v108];
  v175[10] = v106;
  v85 = (void *)MEMORY[0x1E4F94100];
  v86 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v87 = [v85 rowWithTitle:@"Restore Defaults" action:v86];
  v175[11] = v87;
  v88 = (void *)MEMORY[0x1E4F94100];
  v89 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v90 = [v88 rowWithTitle:@"Restore Defaults" action:v89];
  v175[12] = v90;
  v91 = (void *)MEMORY[0x1E4F94100];
  v92 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v93 = [v91 rowWithTitle:@"Restore Defaults" action:v92];
  v175[13] = v93;
  v94 = (void *)MEMORY[0x1E4F94100];
  v95 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v96 = [v94 rowWithTitle:@"Restore Defaults" action:v95];
  v175[14] = v96;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:15];
  v98 = [v73 sectionWithRows:v97 title:@"Reset"];
  [v174 addObject:v98];

  v99 = [MEMORY[0x1E4F94168] moduleWithTitle:@"Camera Capture Button" contents:v174];

  return v99;
}

- (double)launchAfterButtonUpGracePeriod
{
  return self->_launchAfterButtonUpGracePeriod;
}

- (void)setLaunchAfterButtonUpGracePeriod:(double)a3
{
  self->_launchAfterButtonUpGracePeriod = a3;
}

- (double)ignoreFaceDownAfterDuration
{
  return self->_ignoreFaceDownAfterDuration;
}

- (void)setIgnoreFaceDownAfterDuration:(double)a3
{
  self->_ignoreFaceDownAfterDuration = a3;
}

- (double)longPressVisionIntelligenceDelay
{
  return self->_longPressVisionIntelligenceDelay;
}

- (void)setLongPressVisionIntelligenceDelay:(double)a3
{
  self->_longPressVisionIntelligenceDelay = a3;
}

- (double)directLaunchAfterUnsuppressGracePeriod
{
  return self->_directLaunchAfterUnsuppressGracePeriod;
}

- (void)setDirectLaunchAfterUnsuppressGracePeriod:(double)a3
{
  self->_directLaunchAfterUnsuppressGracePeriod = a3;
}

- (double)preludeDropletRadius
{
  return self->_preludeDropletRadius;
}

- (void)setPreludeDropletRadius:(double)a3
{
  self->_preludeDropletRadius = a3;
}

- (double)preludeCornerRadius
{
  return self->_preludeCornerRadius;
}

- (void)setPreludeCornerRadius:(double)a3
{
  self->_preludeCornerRadius = a3;
}

- (double)preludeScreenEdgeInset
{
  return self->_preludeScreenEdgeInset;
}

- (void)setPreludeScreenEdgeInset:(double)a3
{
  self->_preludeScreenEdgeInset = a3;
}

- (SBFFluidBehaviorSettings)preludePresentationTranslationSettings
{
  return self->_preludePresentationTranslationSettings;
}

- (void)setPreludePresentationTranslationSettings:(id)a3
{
}

- (BOOL)visionIntelligenceKeylineScreenBlendMode
{
  return self->_visionIntelligenceKeylineScreenBlendMode;
}

- (void)setVisionIntelligenceKeylineScreenBlendMode:(BOOL)a3
{
  self->_visionIntelligenceKeylineScreenBlendMode = a3;
}

- (BOOL)visionIntelligenceKeylineRimIsSoft
{
  return self->_visionIntelligenceKeylineRimIsSoft;
}

- (void)setVisionIntelligenceKeylineRimIsSoft:(BOOL)a3
{
  self->_visionIntelligenceKeylineRimIsSoft = a3;
}

- (double)visionIntelligenceKeylineAlpha
{
  return self->_visionIntelligenceKeylineAlpha;
}

- (void)setVisionIntelligenceKeylineAlpha:(double)a3
{
  self->_visionIntelligenceKeylineAlpha = a3;
}

- (double)visionIntelligenceKeylineLargeBlurRadius
{
  return self->_visionIntelligenceKeylineLargeBlurRadius;
}

- (void)setVisionIntelligenceKeylineLargeBlurRadius:(double)a3
{
  self->_visionIntelligenceKeylineLargeBlurRadius = a3;
}

- (double)visionIntelligenceKeylineLargeAmount
{
  return self->_visionIntelligenceKeylineLargeAmount;
}

- (void)setVisionIntelligenceKeylineLargeAmount:(double)a3
{
  self->_visionIntelligenceKeylineLargeAmount = a3;
}

- (double)visionIntelligenceKeylineLargeStart
{
  return self->_visionIntelligenceKeylineLargeStart;
}

- (void)setVisionIntelligenceKeylineLargeStart:(double)a3
{
  self->_visionIntelligenceKeylineLargeStart = a3;
}

- (double)visionIntelligenceKeylineLargeEnd
{
  return self->_visionIntelligenceKeylineLargeEnd;
}

- (void)setVisionIntelligenceKeylineLargeEnd:(double)a3
{
  self->_visionIntelligenceKeylineLargeEnd = a3;
}

- (double)visionIntelligenceKeylineSmallWidth
{
  return self->_visionIntelligenceKeylineSmallWidth;
}

- (void)setVisionIntelligenceKeylineSmallWidth:(double)a3
{
  self->_visionIntelligenceKeylineSmallWidth = a3;
}

- (double)visionIntelligenceKeylineFadeLength
{
  return self->_visionIntelligenceKeylineFadeLength;
}

- (void)setVisionIntelligenceKeylineFadeLength:(double)a3
{
  self->_visionIntelligenceKeylineFadeLength = a3;
}

- (double)visionIntelligenceKeylineFadeStart
{
  return self->_visionIntelligenceKeylineFadeStart;
}

- (void)setVisionIntelligenceKeylineFadeStart:(double)a3
{
  self->_visionIntelligenceKeylineFadeStart = a3;
}

- (double)visionIntelligenceKeylineFadeEnd
{
  return self->_visionIntelligenceKeylineFadeEnd;
}

- (void)setVisionIntelligenceKeylineFadeEnd:(double)a3
{
  self->_visionIntelligenceKeylineFadeEnd = a3;
}

- (double)visionIntelligenceKeylineEDRGain
{
  return self->_visionIntelligenceKeylineEDRGain;
}

- (void)setVisionIntelligenceKeylineEDRGain:(double)a3
{
  self->_visionIntelligenceKeylineEDRGain = a3;
}

- (SBFFluidBehaviorSettings)visionIntelligenceBehaviorSettings
{
  return self->_visionIntelligenceBehaviorSettings;
}

- (void)setVisionIntelligenceBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)visionIntelligenceHintBehaviorSettings
{
  return self->_visionIntelligenceHintBehaviorSettings;
}

- (void)setVisionIntelligenceHintBehaviorSettings:(id)a3
{
}

- (double)zoomUpDropletRadius
{
  return self->_zoomUpDropletRadius;
}

- (void)setZoomUpDropletRadius:(double)a3
{
  self->_zoomUpDropletRadius = a3;
}

- (double)disableDropletEffectDelay
{
  return self->_disableDropletEffectDelay;
}

- (void)setDisableDropletEffectDelay:(double)a3
{
  self->_disableDropletEffectDelay = a3;
}

- (double)zoomUpYAndScaleDelay
{
  return self->_zoomUpYAndScaleDelay;
}

- (void)setZoomUpYAndScaleDelay:(double)a3
{
  self->_zoomUpYAndScaleDelay = a3;
}

- (SBFFluidBehaviorSettings)zoomUpPositionXSettings
{
  return self->_zoomUpPositionXSettings;
}

- (void)setZoomUpPositionXSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpPositionYSettings
{
  return self->_zoomUpPositionYSettings;
}

- (void)setZoomUpPositionYSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpScaleSettings
{
  return self->_zoomUpScaleSettings;
}

- (void)setZoomUpScaleSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpCornerRadiusSettings
{
  return self->_zoomUpCornerRadiusSettings;
}

- (void)setZoomUpCornerRadiusSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpDropletRadiusAnimationSettings
{
  return self->_zoomUpDropletRadiusAnimationSettings;
}

- (void)setZoomUpDropletRadiusAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpBackgroundDimAnimationSettings
{
  return self->_zoomUpBackgroundDimAnimationSettings;
}

- (void)setZoomUpBackgroundDimAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)zoomUpDisableDropletEffectFiltersSettings
{
  return self->_zoomUpDisableDropletEffectFiltersSettings;
}

- (void)setZoomUpDisableDropletEffectFiltersSettings:(id)a3
{
}

- (BOOL)enableZoomUpBlur
{
  return self->_enableZoomUpBlur;
}

- (void)setEnableZoomUpBlur:(BOOL)a3
{
  self->_enableZoomUpBlur = a3;
}

- (double)zoomUpBlurStartProgress
{
  return self->_zoomUpBlurStartProgress;
}

- (void)setZoomUpBlurStartProgress:(double)a3
{
  self->_zoomUpBlurStartProgress = a3;
}

- (double)zoomUpBackgroundDimStartProgress
{
  return self->_zoomUpBackgroundDimStartProgress;
}

- (void)setZoomUpBackgroundDimStartProgress:(double)a3
{
  self->_zoomUpBackgroundDimStartProgress = a3;
}

- (double)dosidoTargetScale
{
  return self->_dosidoTargetScale;
}

- (void)setDosidoTargetScale:(double)a3
{
  self->_dosidoTargetScale = a3;
}

- (SBFFluidBehaviorSettings)dosidoLayoutAndPositionSettings
{
  return self->_dosidoLayoutAndPositionSettings;
}

- (void)setDosidoLayoutAndPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dosidoScaleSettings
{
  return self->_dosidoScaleSettings;
}

- (void)setDosidoScaleSettings:(id)a3
{
}

- (BOOL)dosidoUsesHomeScreenBlur
{
  return self->_dosidoUsesHomeScreenBlur;
}

- (void)setDosidoUsesHomeScreenBlur:(BOOL)a3
{
  self->_dosidoUsesHomeScreenBlur = a3;
}

- (BOOL)enablesStationaryDetectionForUnlocked
{
  return self->_enablesStationaryDetectionForUnlocked;
}

- (void)setEnablesStationaryDetectionForUnlocked:(BOOL)a3
{
  self->_enablesStationaryDetectionForUnlocked = a3;
}

- (double)accidentalPreventionStationaryThreshold
{
  return self->_accidentalPreventionStationaryThreshold;
}

- (void)setAccidentalPreventionStationaryThreshold:(double)a3
{
  self->_accidentalPreventionStationaryThreshold = a3;
}

- (double)accidentalPreventionPickUpBuffer
{
  return self->_accidentalPreventionPickUpBuffer;
}

- (void)setAccidentalPreventionPickUpBuffer:(double)a3
{
  self->_accidentalPreventionPickUpBuffer = a3;
}

- (double)coachingUIDismissalInterval
{
  return self->_coachingUIDismissalInterval;
}

- (void)setCoachingUIDismissalInterval:(double)a3
{
  self->_coachingUIDismissalInterval = a3;
}

- (double)stationaryDetectionDebounceInterval
{
  return self->_stationaryDetectionDebounceInterval;
}

- (void)setStationaryDetectionDebounceInterval:(double)a3
{
  self->_stationaryDetectionDebounceInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dosidoScaleSettings, 0);
  objc_storeStrong((id *)&self->_dosidoLayoutAndPositionSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpDisableDropletEffectFiltersSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpBackgroundDimAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpDropletRadiusAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpCornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpScaleSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpPositionYSettings, 0);
  objc_storeStrong((id *)&self->_zoomUpPositionXSettings, 0);
  objc_storeStrong((id *)&self->_visionIntelligenceHintBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_visionIntelligenceBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_preludePresentationTranslationSettings, 0);
}

@end