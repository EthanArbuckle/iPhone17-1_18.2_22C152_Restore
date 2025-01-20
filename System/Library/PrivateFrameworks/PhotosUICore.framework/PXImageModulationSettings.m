@interface PXImageModulationSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)animateGainMapAppearance;
- (BOOL)enableHeadroomMonitoring;
- (BOOL)forceCurrentScreenSupportsHDR;
- (BOOL)gainBoostEnabled;
- (BOOL)isEnabled;
- (BOOL)showGainMapBorder;
- (BOOL)toneMapEnabled;
- (BOOL)useThresholdForVideos;
- (NSString)gainMapAnimationTimingFunction;
- (double)EDRHeadroomRequestHDRThreshold;
- (double)EDRHeadroomRequestSustainDuration;
- (double)HDRModulationIntensity;
- (double)SDRModulationIntensity;
- (double)deviceMaximumEDRHeadroomStops;
- (double)gainMapAnimationActivationThreshold;
- (double)gainMapAnimationDuration;
- (double)highEDRRequestedHeadroomStops;
- (double)lowEDRRequestedHeadroomStops;
- (double)manualEDRHeadroomRequestStops;
- (double)videoComplementModulationIntensity;
- (id)parentSettings;
- (int64_t)EDRHeadroomRequestScheme;
- (int64_t)EDRHeadroomUsageScheme;
- (int64_t)HDRConsideration;
- (int64_t)filterType;
- (void)setAnimateGainMapAppearance:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDeviceMaximumEDRHeadroomStops:(double)a3;
- (void)setEDRHeadroomRequestHDRThreshold:(double)a3;
- (void)setEDRHeadroomRequestScheme:(int64_t)a3;
- (void)setEDRHeadroomRequestSustainDuration:(double)a3;
- (void)setEDRHeadroomUsageScheme:(int64_t)a3;
- (void)setEnableHeadroomMonitoring:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilterType:(int64_t)a3;
- (void)setForceCurrentScreenSupportsHDR:(BOOL)a3;
- (void)setGainBoostEnabled:(BOOL)a3;
- (void)setGainMapAnimationActivationThreshold:(double)a3;
- (void)setGainMapAnimationDuration:(double)a3;
- (void)setGainMapAnimationTimingFunction:(id)a3;
- (void)setHDRConsideration:(int64_t)a3;
- (void)setHDRModulationIntensity:(double)a3;
- (void)setHighEDRRequestedHeadroomStops:(double)a3;
- (void)setLowEDRRequestedHeadroomStops:(double)a3;
- (void)setManualEDRHeadroomRequestStops:(double)a3;
- (void)setSDRModulationIntensity:(double)a3;
- (void)setShowGainMapBorder:(BOOL)a3;
- (void)setToneMapEnabled:(BOOL)a3;
- (void)setUseThresholdForVideos:(BOOL)a3;
- (void)setVideoComplementModulationIntensity:(double)a3;
@end

@implementation PXImageModulationSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageModulationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXImageModulationSettings *)self setEnabled:PXSupportsImageModulation()];
  [(PXImageModulationSettings *)self setFilterType:1];
  [(PXImageModulationSettings *)self setHDRConsideration:0];
  [(PXImageModulationSettings *)self setToneMapEnabled:1];
  [(PXImageModulationSettings *)self setGainBoostEnabled:1];
  [(PXImageModulationSettings *)self setShowGainMapBorder:0];
  [(PXImageModulationSettings *)self setAnimateGainMapAppearance:1];
  [(PXImageModulationSettings *)self setGainMapAnimationDuration:0.25];
  [(PXImageModulationSettings *)self setGainMapAnimationTimingFunction:*MEMORY[0x1E4F3A480]];
  [(PXImageModulationSettings *)self setGainMapAnimationActivationThreshold:0.0];
  [(PXImageModulationSettings *)self setHDRModulationIntensity:1.0];
  [(PXImageModulationSettings *)self setSDRModulationIntensity:0.0];
  [(PXImageModulationSettings *)self setVideoComplementModulationIntensity:0.5];
  [(PXImageModulationSettings *)self setEDRHeadroomRequestScheme:1];
  [(PXImageModulationSettings *)self setUseThresholdForVideos:1];
  [(PXImageModulationSettings *)self setEDRHeadroomUsageScheme:0];
  [(PXImageModulationSettings *)self setManualEDRHeadroomRequestStops:3.0];
  [(PXImageModulationSettings *)self setEDRHeadroomRequestHDRThreshold:0.1];
  [(PXImageModulationSettings *)self setEDRHeadroomRequestSustainDuration:15.0];
  [(PXImageModulationSettings *)self setLowEDRRequestedHeadroomStops:0.0];
  [(PXImageModulationSettings *)self setHighEDRRequestedHeadroomStops:4.0];
  [(PXImageModulationSettings *)self setForceCurrentScreenSupportsHDR:0];
  [(PXImageModulationSettings *)self setDeviceMaximumEDRHeadroomStops:4.0];
  [(PXImageModulationSettings *)self setEnableHeadroomMonitoring:1];
}

- (void)setVideoComplementModulationIntensity:(double)a3
{
  self->_videoComplementModulationIntensity = a3;
}

- (void)setUseThresholdForVideos:(BOOL)a3
{
  self->_useThresholdForVideos = a3;
}

- (void)setToneMapEnabled:(BOOL)a3
{
  self->_toneMapEnabled = a3;
}

- (void)setShowGainMapBorder:(BOOL)a3
{
  self->_showGainMapBorder = a3;
}

- (void)setSDRModulationIntensity:(double)a3
{
  self->_SDRModulationIntensity = a3;
}

- (void)setManualEDRHeadroomRequestStops:(double)a3
{
  self->_manualEDRHeadroomRequestStops = a3;
}

- (void)setLowEDRRequestedHeadroomStops:(double)a3
{
  self->_lowEDRRequestedHeadroomStops = a3;
}

- (void)setHighEDRRequestedHeadroomStops:(double)a3
{
  self->_highEDRRequestedHeadroomStops = a3;
}

- (void)setHDRModulationIntensity:(double)a3
{
  self->_HDRModulationIntensity = a3;
}

- (void)setHDRConsideration:(int64_t)a3
{
  self->_HDRConsideration = a3;
}

- (void)setGainMapAnimationTimingFunction:(id)a3
{
}

- (void)setGainMapAnimationDuration:(double)a3
{
  self->_gainMapAnimationDuration = a3;
}

- (void)setGainMapAnimationActivationThreshold:(double)a3
{
  self->_gainMapAnimationActivationThreshold = a3;
}

- (void)setGainBoostEnabled:(BOOL)a3
{
  self->_gainBoostEnabled = a3;
}

- (void)setForceCurrentScreenSupportsHDR:(BOOL)a3
{
  self->_forceCurrentScreenSupportsHDR = a3;
}

- (void)setFilterType:(int64_t)a3
{
  self->_filterType = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setEnableHeadroomMonitoring:(BOOL)a3
{
  self->_enableHeadroomMonitoring = a3;
}

- (void)setEDRHeadroomUsageScheme:(int64_t)a3
{
  self->_EDRHeadroomUsageScheme = a3;
}

- (void)setEDRHeadroomRequestSustainDuration:(double)a3
{
  self->_EDRHeadroomRequestSustainDuration = a3;
}

- (void)setEDRHeadroomRequestScheme:(int64_t)a3
{
  self->_EDRHeadroomRequestScheme = a3;
}

- (void)setEDRHeadroomRequestHDRThreshold:(double)a3
{
  self->_EDRHeadroomRequestHDRThreshold = a3;
}

- (void)setDeviceMaximumEDRHeadroomStops:(double)a3
{
  self->_deviceMaximumEDRHeadroomStops = a3;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (void).cxx_destruct
{
}

- (BOOL)enableHeadroomMonitoring
{
  return self->_enableHeadroomMonitoring;
}

- (BOOL)forceCurrentScreenSupportsHDR
{
  return self->_forceCurrentScreenSupportsHDR;
}

- (double)deviceMaximumEDRHeadroomStops
{
  return self->_deviceMaximumEDRHeadroomStops;
}

- (double)highEDRRequestedHeadroomStops
{
  return self->_highEDRRequestedHeadroomStops;
}

- (double)lowEDRRequestedHeadroomStops
{
  return self->_lowEDRRequestedHeadroomStops;
}

- (double)EDRHeadroomRequestSustainDuration
{
  return self->_EDRHeadroomRequestSustainDuration;
}

- (double)EDRHeadroomRequestHDRThreshold
{
  return self->_EDRHeadroomRequestHDRThreshold;
}

- (double)manualEDRHeadroomRequestStops
{
  return self->_manualEDRHeadroomRequestStops;
}

- (int64_t)EDRHeadroomUsageScheme
{
  return self->_EDRHeadroomUsageScheme;
}

- (BOOL)useThresholdForVideos
{
  return self->_useThresholdForVideos;
}

- (int64_t)EDRHeadroomRequestScheme
{
  return self->_EDRHeadroomRequestScheme;
}

- (double)videoComplementModulationIntensity
{
  return self->_videoComplementModulationIntensity;
}

- (double)SDRModulationIntensity
{
  return self->_SDRModulationIntensity;
}

- (double)HDRModulationIntensity
{
  return self->_HDRModulationIntensity;
}

- (double)gainMapAnimationActivationThreshold
{
  return self->_gainMapAnimationActivationThreshold;
}

- (NSString)gainMapAnimationTimingFunction
{
  return self->_gainMapAnimationTimingFunction;
}

- (double)gainMapAnimationDuration
{
  return self->_gainMapAnimationDuration;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (BOOL)showGainMapBorder
{
  return self->_showGainMapBorder;
}

- (BOOL)toneMapEnabled
{
  return self->_toneMapEnabled;
}

- (BOOL)gainBoostEnabled
{
  return self->_gainBoostEnabled;
}

- (int64_t)HDRConsideration
{
  return self->_HDRConsideration;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15669 != -1) {
    dispatch_once(&sharedInstance_onceToken_15669, &__block_literal_global_15670);
  }
  v2 = (void *)sharedInstance_sharedInstance_15671;
  return v2;
}

void __43__PXImageModulationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 imageModulationSettings];
  v1 = (void *)sharedInstance_sharedInstance_15671;
  sharedInstance_sharedInstance_15671 = v0;
}

+ (id)settingsControllerModule
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable" valueKeyPath:@"enabled"];
  v76[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
  v70 = [v2 sectionWithRows:v4];

  v68 = (void *)MEMORY[0x1E4F94160];
  v66 = [MEMORY[0x1E4F94108] rowWithTitle:@"Filter" valueKeyPath:@"filterType"];
  v64 = [v66 possibleValues:&unk_1F02D4BB8 titles:&unk_1F02D4BD0];
  v75[0] = v64;
  v62 = [MEMORY[0x1E4F94108] rowWithTitle:@"HDR Consideration" valueKeyPath:@"HDRConsideration"];
  v60 = [v62 possibleValues:&unk_1F02D4BE8 titles:&unk_1F02D4C00];
  v75[1] = v60;
  v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"HDR Modulation Intensity" valueKeyPath:@"HDRModulationIntensity"];
  v6 = [v5 minValue:0.0 maxValue:1.0];
  v7 = objc_msgSend(v6, "px_increment:", 0.0500000007);
  v75[2] = v7;
  v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"SDR Modulation Intensity" valueKeyPath:@"SDRModulationIntensity"];
  v9 = [v8 minValue:0.0 maxValue:1.0];
  v10 = objc_msgSend(v9, "px_increment:", 0.0500000007);
  v75[3] = v10;
  v11 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Video Complement Modulation Intensity" valueKeyPath:@"videoComplementModulationIntensity"];
  v12 = [v11 minValue:0.0 maxValue:1.0];
  v13 = objc_msgSend(v12, "px_increment:", 0.0500000007);
  v75[4] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];
  v69 = [v68 sectionWithRows:v14 title:@"Filtering" conditionFormat:@"enabled != 0"];

  v15 = (void *)MEMORY[0x1E4F94160];
  v16 = (void *)MEMORY[0x1E4F941F0];
  v17 = NSStringFromSelector(sel_gainBoostEnabled);
  v18 = [v16 rowWithTitle:@"Use Gain Boost" valueKeyPath:v17];
  v74[0] = v18;
  v19 = (void *)MEMORY[0x1E4F941F0];
  v20 = NSStringFromSelector(sel_toneMapEnabled);
  v21 = [v19 rowWithTitle:@"Use HLG/PQ Tone Mapping" valueKeyPath:v20];
  v74[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  v67 = [v15 sectionWithRows:v22 title:@"Gain Map Settings"];

  v53 = (void *)MEMORY[0x1E4F94160];
  v65 = [MEMORY[0x1E4F94108] rowWithTitle:@"Headroom Request" valueKeyPath:@"EDRHeadroomRequestScheme"];
  v63 = [v65 possibleValues:&unk_1F02D4C18 titles:&unk_1F02D4C30];
  v73[0] = v63;
  v61 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Threshold For Videos" valueKeyPath:@"useThresholdForVideos"];
  v59 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"EDRHeadroomRequestScheme == %@", &unk_1F02D8EF0];
  v58 = [v61 condition:v59];
  v73[1] = v58;
  v57 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Headroom (Stops)" valueKeyPath:@"manualEDRHeadroomRequestStops"];
  v56 = [v57 minValue:0.0 maxValue:3.0];
  v55 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"EDRHeadroomRequestScheme == %@", &unk_1F02D8ED8];
  v52 = [v56 condition:v55];
  v73[2] = v52;
  v51 = [MEMORY[0x1E4F941D8] rowWithTitle:@"HDR Threshold" valueKeyPath:@"EDRHeadroomRequestHDRThreshold"];
  v50 = [v51 minValue:-1.0 maxValue:1.0];
  v49 = objc_msgSend(v50, "px_increment:", 0.1);
  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"EDRHeadroomRequestScheme == %@", &unk_1F02D8EF0];
  v47 = [v49 condition:v48];
  v73[3] = v47;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Sustain Duration" valueKeyPath:@"EDRHeadroomRequestSustainDuration"];
  v45 = [v46 minValue:0.0 maxValue:30.0];
  v44 = objc_msgSend(v45, "px_increment:", 0.5);
  v73[4] = v44;
  v23 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Low Value (Stops)" valueKeyPath:@"lowEDRRequestedHeadroomStops"];
  v24 = [v23 minValue:0.0 maxValue:2.0];
  v25 = objc_msgSend(v24, "px_increment:", 0.1);
  v73[5] = v25;
  v26 = [MEMORY[0x1E4F941D8] rowWithTitle:@"High Value (Stops)" valueKeyPath:@"highEDRRequestedHeadroomStops"];
  v27 = [v26 minValue:0.0 maxValue:4.0];
  v28 = objc_msgSend(v27, "px_increment:", 0.1);
  v73[6] = v28;
  v29 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Device Max (Stops)" valueKeyPath:@"deviceMaximumEDRHeadroomStops"];
  v30 = [v29 minValue:0.0 maxValue:3.0];
  v31 = objc_msgSend(v30, "px_increment:", 0.1);
  v73[7] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:8];
  v54 = [v53 sectionWithRows:v32 title:@"Headroom Request" conditionFormat:@"enabled != 0"];

  v33 = (void *)MEMORY[0x1E4F94160];
  v34 = (void *)MEMORY[0x1E4F941F0];
  v35 = NSStringFromSelector(sel_enableHeadroomMonitoring);
  v36 = [v34 rowWithTitle:@"Enable Monitoring" valueKeyPath:v35];
  v72 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  v38 = [v33 sectionWithRows:v37 title:@"Headroom Monitoring"];

  v39 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v40 = (void *)MEMORY[0x1E4F94160];
  v71[0] = v70;
  v71[1] = v69;
  v71[2] = v67;
  v71[3] = v54;
  v71[4] = v38;
  v71[5] = v39;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:6];
  v42 = [v40 moduleWithTitle:@"Image Modulation" contents:v41];

  return v42;
}

@end