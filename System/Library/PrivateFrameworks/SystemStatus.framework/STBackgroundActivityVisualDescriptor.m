@interface STBackgroundActivityVisualDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)_defaultVisualDescriptors;
+ (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3;
- (BOOL)canCrossfadeToBackgroundActivityWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersToKeepContentVisible;
- (BOOL)prefersToPulse;
- (BOOL)prefersToRing;
- (BOOL)prefersToSuppressPulse;
- (NSSet)crossfadableActivities;
- (NSString)description;
- (NSString)imageName;
- (NSString)packageName;
- (NSString)preferredContinuousAnimationName;
- (NSString)preferredVisualEffectName;
- (NSString)systemImageName;
- (NSString)textLabel;
- (STBackgroundActivityVisualDescriptor)init;
- (STBackgroundActivityVisualDescriptor)initWithCoder:(id)a3;
- (STBackgroundActivityVisualDescriptor)initWithPlistRepresentation:(id)a3;
- (STBackgroundActivityVisualDescriptorColorRepresentation)backgroundColorRepresentation;
- (double)fontSizeAdjustment;
- (double)verticalOffsetInPixels;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STBackgroundActivityVisualDescriptor

+ (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__STBackgroundActivityVisualDescriptor_BuiltIns__visualDescriptorForBackgroundActivityWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = _MergedGlobals_14;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_14, block);
  }
  v5 = [(id)qword_1EB5A35D8 objectForKey:v4];

  return v5;
}

uint64_t __102__STBackgroundActivityVisualDescriptor_BuiltIns__visualDescriptorForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _defaultVisualDescriptors];
  uint64_t v2 = qword_1EB5A35D8;
  qword_1EB5A35D8 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)_defaultVisualDescriptors
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = objc_opt_new();
  [v3 setSystemImageName:@"phone.down.fill"];
  objc_msgSend(v3, "setPreferredContinuousAnimationName:");
  [v3 setPreferredVisualEffectName:@"darkBlur"];
  id v4 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"clearColor"];
  [v3 setBackgroundColorRepresentation:v4];

  [v3 setPrefersToKeepContentVisible:1];
  [v2 setObject:v3 forKey:@"com.apple.systemstatus.background-activity.CallRinging"];

  v5 = objc_opt_new();
  [v5 setSystemImageName:@"phone.fill"];
  [v5 setVerticalOffsetInPixels:1.0];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.CallRecording"];
  [v5 setCrossfadableActivities:v6];

  v7 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGreenColor"];
  [v5 setBackgroundColorRepresentation:v7];

  [v2 setObject:v5 forKey:@"com.apple.systemstatus.background-activity.InCall"];
  v8 = objc_opt_new();
  [v8 setSystemImageName:@"phone.fill"];
  [v8 setVerticalOffsetInPixels:1.0];
  v9 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemRedColor"];
  [v8 setBackgroundColorRepresentation:v9];

  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.InCall"];
  [v8 setCrossfadableActivities:v10];

  [v2 setObject:v8 forKey:@"com.apple.systemstatus.background-activity.CallRecording"];
  v11 = objc_opt_new();
  [v11 setSystemImageName:@"phone.fill"];
  [v11 setPreferredVisualEffectName:@"darkBlur"];
  v12 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"clearColor"];
  [v11 setBackgroundColorRepresentation:v12];

  [v11 setPrefersToKeepContentVisible:1];
  [v2 setObject:v11 forKey:@"com.apple.systemstatus.background-activity.CallHandoff"];

  v13 = objc_opt_new();
  [v13 setSystemImageName:@"recordingtape"];
  [v13 setPreferredVisualEffectName:@"darkBlur"];
  v14 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"clearColor"];
  [v13 setBackgroundColorRepresentation:v14];

  [v13 setPrefersToKeepContentVisible:1];
  [v2 setObject:v13 forKey:@"com.apple.systemstatus.background-activity.CallScreening"];

  v15 = objc_opt_new();
  [v15 setSystemImageName:@"video.fill"];
  [v15 setFontSizeAdjustment:-1.0];
  [v15 setPreferredContinuousAnimationName:@"ringing"];
  [v15 setPreferredVisualEffectName:@"darkBlur"];
  v16 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"clearColor"];
  [v15 setBackgroundColorRepresentation:v16];

  [v15 setPrefersToKeepContentVisible:1];
  [v2 setObject:v15 forKey:@"com.apple.systemstatus.background-activity.VideoConferenceRinging"];

  v17 = objc_opt_new();
  [v17 setSystemImageName:@"video.fill"];
  v18 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGreenColor"];
  [v17 setBackgroundColorRepresentation:v18];

  [v2 setObject:v17 forKey:@"com.apple.systemstatus.background-activity.InVideoConference"];
  v19 = objc_opt_new();
  [v19 setSystemImageName:@"video.fill"];
  [v19 setPreferredVisualEffectName:@"darkBlur"];
  v20 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"clearColor"];
  [v19 setBackgroundColorRepresentation:v20];

  [v19 setPrefersToKeepContentVisible:1];
  [v2 setObject:v19 forKey:@"com.apple.systemstatus.background-activity.VideoConferenceHandoff"];

  v21 = objc_opt_new();
  [v21 setSystemImageName:@"waveform"];
  v22 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v21 setBackgroundColorRepresentation:v22];

  [v21 setPrefersToKeepContentVisible:1];
  [v2 setObject:v21 forKey:@"com.apple.systemstatus.background-activity.ActivePushToTalkCall"];

  v23 = objc_opt_new();
  [v23 setSystemImageName:@"waveform"];
  [v23 setPrefersToSuppressPulse:1];
  v24 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v23 setBackgroundColorRepresentation:v24];

  [v2 setObject:v23 forKey:@"com.apple.systemstatus.background-activity.IdlePushToTalkCall"];
  v25 = objc_opt_new();
  [v25 setSystemImageName:@"video.fill"];
  v26 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemRedColor"];
  [v25 setBackgroundColorRepresentation:v26];

  [v2 setObject:v25 forKey:@"com.apple.systemstatus.background-activity.WebRTCCapture"];
  v27 = objc_opt_new();
  [v27 setSystemImageName:@"mic.fill"];
  v28 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemOrangeColor"];
  [v27 setBackgroundColorRepresentation:v28];

  [v2 setObject:v27 forKey:@"com.apple.systemstatus.background-activity.WebRTCAudioCapture"];
  v29 = objc_opt_new();
  [v29 setSystemImageName:@"video.fill"];
  v30 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemRedColor"];
  [v29 setBackgroundColorRepresentation:v30];

  [v2 setObject:v29 forKey:@"com.apple.systemstatus.background-activity.FullScreenWebRTCCapture"];
  v31 = objc_opt_new();
  [v31 setSystemImageName:@"mic.fill"];
  v32 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemOrangeColor"];
  [v31 setBackgroundColorRepresentation:v32];

  [v2 setObject:v31 forKey:@"com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture"];
  v33 = objc_opt_new();
  [v33 setSystemImageName:@"location.north.circle.fill"];
  v34 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v33 setBackgroundColorRepresentation:v34];

  [v2 setObject:v33 forKey:@"com.apple.systemstatus.background-activity.Navigation"];
  v35 = objc_opt_new();
  [v35 setSystemImageName:@"location.north.circle.fill"];
  v36 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v35 setBackgroundColorRepresentation:v36];

  [v2 setObject:v35 forKey:@"com.apple.systemstatus.background-activity.Navigation"];
  v37 = objc_opt_new();
  [v37 setSystemImageName:@"location.north.circle.fill"];
  v38 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v37 setBackgroundColorRepresentation:v38];

  [v2 setObject:v37 forKey:@"com.apple.systemstatus.background-activity.BackgroundLocation"];
  v39 = objc_opt_new();
  [v39 setSystemImageName:@"nearby.interactions"];
  v40 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v39 setBackgroundColorRepresentation:v40];

  [v2 setObject:v39 forKey:@"com.apple.systemstatus.background-activity.NearbyInteractions"];
  v41 = objc_opt_new();
  [v41 setSystemImageName:@"mic.fill"];
  v42 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemOrangeColor"];
  [v41 setBackgroundColorRepresentation:v42];

  [v2 setObject:v41 forKey:@"com.apple.systemstatus.background-activity.Recording"];
  v43 = objc_opt_new();
  [v43 setSystemImageName:@"mic.fill"];
  v44 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemOrangeColor"];
  [v43 setBackgroundColorRepresentation:v44];

  [v2 setObject:v43 forKey:@"com.apple.systemstatus.background-activity.HearingAidRecording"];
  v45 = objc_opt_new();
  [v45 setSystemImageName:@"record.circle"];
  v46 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemRedColor"];
  [v45 setBackgroundColorRepresentation:v46];

  [v2 setObject:v45 forKey:@"com.apple.systemstatus.background-activity.ScreenReplayRecording"];
  v47 = objc_opt_new();
  [v47 setSystemImageName:@"shareplay"];
  v48 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGray4Color"];
  [v47 setBackgroundColorRepresentation:v48];

  v49 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.SharePlay"];
  [v47 setCrossfadableActivities:v49];

  [v2 setObject:v47 forKey:@"com.apple.systemstatus.background-activity.SharePlayInactive"];
  v50 = objc_opt_new();
  [v50 setSystemImageName:@"shareplay"];
  v51 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGreenColor"];
  [v50 setBackgroundColorRepresentation:v51];

  v52 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.SharePlayInactive"];
  [v50 setCrossfadableActivities:v52];

  [v2 setObject:v50 forKey:@"com.apple.systemstatus.background-activity.SharePlay"];
  v53 = objc_opt_new();
  [v53 setSystemImageName:@"rectangle.inset.filled.and.person.filled"];
  v54 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemIndigoColor"];
  [v53 setBackgroundColorRepresentation:v54];

  [v2 setObject:v53 forKey:@"com.apple.systemstatus.background-activity.SharePlayScreenSharing"];
  v55 = objc_opt_new();
  [v55 setSystemImageName:@"airplayvideo"];
  v56 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v55 setBackgroundColorRepresentation:v56];

  [v2 setObject:v55 forKey:@"com.apple.systemstatus.background-activity.ScreenSharing"];
  v57 = objc_opt_new();
  [v57 setSystemImageName:@"airplayvideo"];
  [v57 setPrefersToSuppressPulse:1];
  [v57 setPrefersToKeepContentVisible:1];
  v58 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v57 setBackgroundColorRepresentation:v58];

  [v2 setObject:v57 forKey:@"com.apple.systemstatus.background-activity.AutoAirPlayReady"];
  v59 = objc_opt_new();
  [v59 setSystemImageName:@"airplayvideo"];
  [v59 setPrefersToKeepContentVisible:1];
  v60 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v59 setBackgroundColorRepresentation:v60];

  [v2 setObject:v59 forKey:@"com.apple.systemstatus.background-activity.AutoAirPlayPlaying"];
  v61 = objc_opt_new();
  [v61 setSystemImageName:@"cable.connector.horizontal"];
  v62 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v61 setBackgroundColorRepresentation:v62];

  [v2 setObject:v61 forKey:@"com.apple.systemstatus.background-activity.VideoOut"];
  v63 = objc_opt_new();
  [v63 setSystemImageName:@"rectangle.inset.filled.and.person.filled"];
  v64 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemIndigoColor"];
  [v63 setBackgroundColorRepresentation:v64];

  [v2 setObject:v63 forKey:@"com.apple.systemstatus.background-activity.ScreenSharingServer"];
  v65 = objc_opt_new();
  [v65 setSystemImageName:@"gear"];
  v66 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v65 setBackgroundColorRepresentation:v66];

  [v2 setObject:v65 forKey:@"com.apple.systemstatus.background-activity.Sysdiagnose"];
  v67 = objc_opt_new();
  [v67 setSystemImageName:@"wrench.and.screwdriver.fill"];
  [v67 setFontSizeAdjustment:-1.0];
  v68 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGrayColor"];
  [v67 setBackgroundColorRepresentation:v68];

  [v2 setObject:v67 forKey:@"com.apple.systemstatus.background-activity.DeveloperTools"];
  v69 = objc_opt_new();
  [v69 setSystemImageName:@"waveform.path.ecg"];
  v70 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v69 setBackgroundColorRepresentation:v70];

  [v2 setObject:v69 forKey:@"com.apple.systemstatus.background-activity.Diagnostics"];
  v71 = objc_opt_new();
  [v71 setSystemImageName:@"waveform.path.ecg"];
  v72 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v71 setBackgroundColorRepresentation:v72];

  [v71 setPrefersToKeepContentVisible:1];
  [v2 setObject:v71 forKey:@"com.apple.systemstatus.background-activity.LoggingCapture"];

  v73 = objc_opt_new();
  [v73 setTextLabel:@"SOS"];
  v74 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemRedColor"];
  [v73 setBackgroundColorRepresentation:v74];

  [v2 setObject:v73 forKey:@"com.apple.systemstatus.background-activity.CellularSOS"];
  v75 = objc_opt_new();
  [v75 setImageName:@"BackgroundTask_satellite"];
  [v75 setPrefersToSuppressPulse:1];
  v76 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGreenColor"];
  [v75 setBackgroundColorRepresentation:v76];

  [v75 setPrefersToKeepContentVisible:1];
  v77 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.SatelliteSOSDisconnected"];
  [v75 setCrossfadableActivities:v77];

  [v2 setObject:v75 forKey:@"com.apple.systemstatus.background-activity.SatelliteSOS"];
  v78 = objc_opt_new();
  [v78 setImageName:@"BackgroundTask_satellite-disconnected"];
  [v78 setPrefersToSuppressPulse:1];
  v79 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGray4Color"];
  [v78 setBackgroundColorRepresentation:v79];

  [v78 setPrefersToKeepContentVisible:1];
  v80 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.systemstatus.background-activity.SatelliteSOS"];
  [v78 setCrossfadableActivities:v80];

  [v2 setObject:v78 forKey:@"com.apple.systemstatus.background-activity.SatelliteSOSDisconnected"];
  v81 = objc_opt_new();
  [v81 setSystemImageName:@"carplay"];
  v82 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v81 setBackgroundColorRepresentation:v82];

  [v2 setObject:v81 forKey:@"com.apple.systemstatus.background-activity.CarPlay"];
  v83 = objc_opt_new();
  [v83 setSystemImageName:@"swift"];
  v84 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"_swiftColor"];
  [v83 setBackgroundColorRepresentation:v84];

  [v2 setObject:v83 forKey:@"com.apple.systemstatus.background-activity.Playgrounds"];
  v85 = objc_opt_new();
  [v2 setObject:v85 forKey:@"com.apple.systemstatus.background-activity.InWorkout"];

  v86 = objc_opt_new();
  [v86 setSystemImageName:@"personalhotspot"];
  v87 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemGreenColor"];
  [v86 setBackgroundColorRepresentation:v87];

  [v2 setObject:v86 forKey:@"com.apple.systemstatus.background-activity.Tethering"];
  v88 = objc_opt_new();
  [v88 setSystemImageName:@"siri"];
  v89 = [MEMORY[0x1E4F4F6E0] colorWithRed:0.28627451 green:0.0901960784 blue:0.439215686 alpha:1.0];
  v90 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithBSColor:v89];
  [v88 setBackgroundColorRepresentation:v90];

  [v2 setObject:v88 forKey:@"com.apple.systemstatus.background-activity.AssistantEyesFree"];
  v91 = objc_opt_new();
  [v91 setSystemImageName:@"printer.fill"];
  v92 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithSystemColorName:@"systemBlueColor"];
  [v91 setBackgroundColorRepresentation:v92];

  [v2 setObject:v91 forKey:@"com.apple.systemstatus.background-activity.AirPrint"];
  v93 = [MEMORY[0x1E4F1CA60] dictionary];
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __75__STBackgroundActivityVisualDescriptor_BuiltIns___defaultVisualDescriptors__block_invoke;
  v96[3] = &unk_1E6B64230;
  id v94 = v93;
  id v97 = v94;
  [v2 enumerateKeysAndObjectsUsingBlock:v96];

  return v94;
}

void __75__STBackgroundActivityVisualDescriptor_BuiltIns___defaultVisualDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)prefersToRing
{
  return [@"ringing" isEqualToString:self->_preferredContinuousAnimationName];
}

- (BOOL)prefersToPulse
{
  return [@"pulseBackground" isEqualToString:self->_preferredContinuousAnimationName];
}

- (BOOL)prefersToSuppressPulse
{
  return ![(STBackgroundActivityVisualDescriptor *)self prefersToPulse];
}

- (BOOL)canCrossfadeToBackgroundActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STBackgroundActivityVisualDescriptor *)self crossfadableActivities];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (STBackgroundActivityVisualDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)STBackgroundActivityVisualDescriptor;
  uint64_t v2 = [(STBackgroundActivityVisualDescriptor *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_preferredVisualEffectName, @"none");
    objc_storeStrong((id *)&v3->_preferredContinuousAnimationName, @"pulseBackground");
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[(STBackgroundActivityVisualDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  char v6 = [(STBackgroundActivityVisualDescriptor *)self packageName];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke;
  v62[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v63 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v62];

  v9 = [(STBackgroundActivityVisualDescriptor *)self systemImageName];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_2;
  v60[3] = &unk_1E6B630A8;
  id v10 = v7;
  id v61 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v60];

  v12 = [(STBackgroundActivityVisualDescriptor *)self imageName];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_3;
  v58[3] = &unk_1E6B630A8;
  id v13 = v10;
  id v59 = v13;
  id v14 = (id)[v5 appendString:v12 counterpart:v58];

  v15 = [(STBackgroundActivityVisualDescriptor *)self textLabel];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_4;
  v56[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v57 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v56];

  v18 = [(STBackgroundActivityVisualDescriptor *)self backgroundColorRepresentation];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_5;
  v54[3] = &unk_1E6B63058;
  id v19 = v16;
  id v55 = v19;
  id v20 = (id)[v5 appendObject:v18 counterpart:v54];

  [(STBackgroundActivityVisualDescriptor *)self verticalOffsetInPixels];
  double v22 = v21;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_6;
  v52[3] = &unk_1E6B63DB0;
  id v23 = v19;
  id v53 = v23;
  id v24 = (id)[v5 appendDouble:v52 counterpart:v22];
  [(STBackgroundActivityVisualDescriptor *)self fontSizeAdjustment];
  double v26 = v25;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_7;
  v50[3] = &unk_1E6B63DB0;
  id v27 = v23;
  id v51 = v27;
  id v28 = (id)[v5 appendDouble:v50 counterpart:v26];
  BOOL v29 = [(STBackgroundActivityVisualDescriptor *)self prefersToKeepContentVisible];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_8;
  v48[3] = &unk_1E6B630D0;
  id v30 = v27;
  id v49 = v30;
  id v31 = (id)[v5 appendBool:v29 counterpart:v48];
  v32 = [(STBackgroundActivityVisualDescriptor *)self preferredVisualEffectName];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_9;
  v46[3] = &unk_1E6B630A8;
  id v33 = v30;
  id v47 = v33;
  id v34 = (id)[v5 appendString:v32 counterpart:v46];

  v35 = [(STBackgroundActivityVisualDescriptor *)self preferredContinuousAnimationName];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_10;
  v44[3] = &unk_1E6B630A8;
  id v36 = v33;
  id v45 = v36;
  id v37 = (id)[v5 appendString:v35 counterpart:v44];

  v38 = [(STBackgroundActivityVisualDescriptor *)self crossfadableActivities];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_11;
  v42[3] = &unk_1E6B63058;
  id v43 = v36;
  id v39 = v36;
  id v40 = (id)[v5 appendObject:v38 counterpart:v42];

  LOBYTE(v36) = [v5 isEqual];
  return (char)v36;
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) packageName];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemImageName];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageName];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) textLabel];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundColorRepresentation];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) verticalOffsetInPixels];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) fontSizeAdjustment];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) prefersToKeepContentVisible];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredVisualEffectName];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredContinuousAnimationName];
}

uint64_t __48__STBackgroundActivityVisualDescriptor_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) crossfadableActivities];
}

- (unint64_t)hash
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STBackgroundActivityVisualDescriptor *)self packageName];
  id v5 = (id)[v3 appendString:v4];

  char v6 = [(STBackgroundActivityVisualDescriptor *)self systemImageName];
  id v7 = (id)[v3 appendString:v6];

  id v8 = [(STBackgroundActivityVisualDescriptor *)self imageName];
  id v9 = (id)[v3 appendString:v8];

  id v10 = [(STBackgroundActivityVisualDescriptor *)self textLabel];
  id v11 = (id)[v3 appendString:v10];

  v12 = [(STBackgroundActivityVisualDescriptor *)self backgroundColorRepresentation];
  id v13 = (id)[v3 appendObject:v12];

  [(STBackgroundActivityVisualDescriptor *)self verticalOffsetInPixels];
  id v14 = (id)objc_msgSend(v3, "appendDouble:");
  [(STBackgroundActivityVisualDescriptor *)self fontSizeAdjustment];
  id v15 = (id)objc_msgSend(v3, "appendDouble:");
  id v16 = (id)objc_msgSend(v3, "appendBool:", -[STBackgroundActivityVisualDescriptor prefersToKeepContentVisible](self, "prefersToKeepContentVisible"));
  id v17 = [(STBackgroundActivityVisualDescriptor *)self preferredVisualEffectName];
  id v18 = (id)[v3 appendString:v17];

  id v19 = [(STBackgroundActivityVisualDescriptor *)self preferredContinuousAnimationName];
  id v20 = (id)[v3 appendString:v19];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v21 = [(STBackgroundActivityVisualDescriptor *)self crossfadableActivities];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = (id)[v3 appendString:*(void *)(*((void *)&v29 + 1) + 8 * v25++)];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v23);
  }

  unint64_t v27 = [v3 hash];
  return v27;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  _copyValuesFromDescriptorToDescriptor(self, v4);
  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(STBackgroundActivityVisualDescriptor *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STBackgroundActivityVisualDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STBackgroundActivityVisualDescriptor *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STBackgroundActivityVisualDescriptor *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STBackgroundActivityVisualDescriptor *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__STBackgroundActivityVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6B63080;
  id v9 = v7;
  id v13 = v9;
  id v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __88__STBackgroundActivityVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) packageName];
  [v2 appendString:v3 withName:@"packageName" skipIfEmpty:1];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) systemImageName];
  [v4 appendString:v5 withName:@"systemImageName" skipIfEmpty:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) imageName];
  [v6 appendString:v7 withName:@"imageName" skipIfEmpty:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) textLabel];
  [v8 appendString:v9 withName:@"textLabel" skipIfEmpty:1];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) backgroundColorRepresentation];
  id v12 = (id)[v10 appendObject:v11 withName:@"backgroundColorRepresentation" skipIfNil:1];

  [*(id *)(a1 + 40) verticalOffsetInPixels];
  if ((BSFloatIsZero() & 1) == 0)
  {
    id v13 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) verticalOffsetInPixels];
    id v14 = (id)objc_msgSend(v13, "appendDouble:withName:decimalPrecision:", @"verticalOffsetInPixels", 1);
  }
  [*(id *)(a1 + 40) fontSizeAdjustment];
  if ((BSFloatIsZero() & 1) == 0)
  {
    id v15 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) fontSizeAdjustment];
    id v16 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", @"fontSizeAdjustment", 1);
  }
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "prefersToKeepContentVisible"), @"prefersToKeepContentVisible", 1);
  id v18 = [*(id *)(a1 + 40) preferredVisualEffectName];
  char v19 = BSEqualObjects();

  if ((v19 & 1) == 0)
  {
    id v20 = *(void **)(a1 + 32);
    double v21 = [*(id *)(a1 + 40) preferredVisualEffectName];
    [v20 appendString:v21 withName:@"preferredVisualEffectName"];
  }
  uint64_t v22 = [*(id *)(a1 + 40) preferredContinuousAnimationName];
  char v23 = BSEqualObjects();

  if ((v23 & 1) == 0)
  {
    uint64_t v24 = *(void **)(a1 + 32);
    uint64_t v25 = [*(id *)(a1 + 40) preferredContinuousAnimationName];
    [v24 appendString:v25 withName:@"preferredContinuousAnimationName"];
  }
  id v26 = *(void **)(a1 + 32);
  id v28 = [*(id *)(a1 + 40) crossfadableActivities];
  unint64_t v27 = [v28 allObjects];
  [v26 appendArraySection:v27 withName:@"crossfadableActivities" skipIfEmpty:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STBackgroundActivityVisualDescriptor *)self packageName];
  [v4 encodeObject:v5 forKey:@"packageName"];

  id v6 = [(STBackgroundActivityVisualDescriptor *)self systemImageName];
  [v4 encodeObject:v6 forKey:@"systemImageName"];

  id v7 = [(STBackgroundActivityVisualDescriptor *)self imageName];
  [v4 encodeObject:v7 forKey:@"imageName"];

  id v8 = [(STBackgroundActivityVisualDescriptor *)self textLabel];
  [v4 encodeObject:v8 forKey:@"textLabel"];

  id v9 = [(STBackgroundActivityVisualDescriptor *)self backgroundColorRepresentation];
  [v4 encodeObject:v9 forKey:@"backgroundColorRepresentation"];

  [(STBackgroundActivityVisualDescriptor *)self verticalOffsetInPixels];
  objc_msgSend(v4, "encodeDouble:forKey:", @"verticalOffsetInPixels");
  [(STBackgroundActivityVisualDescriptor *)self fontSizeAdjustment];
  objc_msgSend(v4, "encodeDouble:forKey:", @"fontSizeAdjustment");
  objc_msgSend(v4, "encodeBool:forKey:", -[STBackgroundActivityVisualDescriptor prefersToKeepContentVisible](self, "prefersToKeepContentVisible"), @"prefersToKeepContentVisible");
  id v10 = [(STBackgroundActivityVisualDescriptor *)self preferredVisualEffectName];
  [v4 encodeObject:v10 forKey:@"preferredVisualEffectName"];

  id v11 = [(STBackgroundActivityVisualDescriptor *)self preferredContinuousAnimationName];
  [v4 encodeObject:v11 forKey:@"preferredContinuousAnimationName"];

  id v12 = [(STBackgroundActivityVisualDescriptor *)self crossfadableActivities];
  [v4 encodeObject:v12 forKey:@"crossfadableActivities"];
}

- (STBackgroundActivityVisualDescriptor)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v5, 0);
  id v8 = [v4 decodeObjectOfClass:v5 forKey:@"packageName"];
  id v9 = [v4 decodeObjectOfClass:v5 forKey:@"systemImageName"];
  id v10 = [v4 decodeObjectOfClass:v5 forKey:@"imageName"];
  id v11 = [v4 decodeObjectOfClass:v5 forKey:@"textLabel"];
  id v12 = [v4 decodeObjectOfClass:v6 forKey:@"backgroundColorRepresentation"];
  [v4 decodeDoubleForKey:@"verticalOffsetInPixels"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"fontSizeAdjustment"];
  double v16 = v15;
  char v37 = [v4 decodeBoolForKey:@"prefersToKeepContentVisible"];
  id v17 = [v4 decodeObjectOfClass:v5 forKey:@"preferredVisualEffectName"];
  id v18 = [v4 decodeObjectOfClass:v5 forKey:@"preferredContinuousAnimationName"];
  v38 = (void *)v7;
  char v19 = [v4 decodeObjectOfClasses:v7 forKey:@"crossfadableActivities"];

  id v20 = [(STBackgroundActivityVisualDescriptor *)self init];
  if (v20)
  {
    uint64_t v21 = [v8 copy];
    packageName = v20->_packageName;
    v20->_packageName = (NSString *)v21;

    uint64_t v23 = [v9 copy];
    systemImageName = v20->_systemImageName;
    v20->_systemImageName = (NSString *)v23;

    uint64_t v25 = [v10 copy];
    imageName = v20->_imageName;
    v20->_imageName = (NSString *)v25;

    uint64_t v27 = [v11 copy];
    textLabel = v20->_textLabel;
    v20->_textLabel = (NSString *)v27;

    objc_storeStrong((id *)&v20->_backgroundColorRepresentation, v12);
    v20->_verticalOffsetInPixels = v14;
    v20->_fontSizeAdjustment = v16;
    v20->_prefersToKeepContentVisible = v37;
    if (STBackgroundActivityIsVisualEffect(v17))
    {
      uint64_t v29 = [v17 copy];
      preferredVisualEffectName = v20->_preferredVisualEffectName;
      v20->_preferredVisualEffectName = (NSString *)v29;
    }
    else
    {
      long long v31 = STSystemStatusLogBundleLoading();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v17;
        _os_log_error_impl(&dword_1D9514000, v31, OS_LOG_TYPE_ERROR, "Expected a visual effect name, got: %@", buf, 0xCu);
      }
    }
    if (STBackgroundActivityIsContinuousAnimation(v18))
    {
      uint64_t v32 = [v18 copy];
      preferredContinuousAnimationName = v20->_preferredContinuousAnimationName;
      v20->_preferredContinuousAnimationName = (NSString *)v32;
    }
    else
    {
      preferredContinuousAnimationName = STSystemStatusLogBundleLoading();
      if (os_log_type_enabled(preferredContinuousAnimationName, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v18;
        _os_log_error_impl(&dword_1D9514000, preferredContinuousAnimationName, OS_LOG_TYPE_ERROR, "Expected a continuous animation name, got: %@", buf, 0xCu);
      }
    }

    uint64_t v34 = [v19 copy];
    crossfadableActivities = v20->_crossfadableActivities;
    v20->_crossfadableActivities = (NSSet *)v34;
  }
  return v20;
}

- (STBackgroundActivityVisualDescriptor)initWithPlistRepresentation:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(STBackgroundActivityVisualDescriptor *)self init];
  if (!v5) {
    goto LABEL_27;
  }
  uint64_t v6 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"BackgroundColor");
  uint64_t v7 = objc_msgSend(v4, "bs_safeStringForKey:", @"PreferredVisualEffectName");
  id v8 = objc_msgSend(v4, "bs_safeStringForKey:", @"PreferredContinuousAnimationName");
  id v9 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"SystemImage");
  uint64_t v10 = objc_msgSend(v9, "bs_safeStringForKey:", @"InternalSymbolName");
  systemImageName = v5->_systemImageName;
  v5->_systemImageName = (NSString *)v10;

  uint64_t v12 = objc_msgSend(v4, "bs_safeStringForKey:", @"TextLabel");
  textLabel = v5->_textLabel;
  v5->_textLabel = (NSString *)v12;

  double v14 = [[STBackgroundActivityVisualDescriptorColorRepresentation alloc] initWithPlistRepresentation:v6];
  backgroundColorRepresentation = v5->_backgroundColorRepresentation;
  v5->_backgroundColorRepresentation = v14;

  v5->_prefersToKeepContentVisible = objc_msgSend(v4, "bs_BOOLForKey:", @"PrefersToKeepContentVisible");
  double v16 = objc_msgSend(v4, "bs_safeNumberForKey:", @"FontSizeAdjustment");
  [v16 doubleValue];
  v5->_fontSizeAdjustment = v17;

  id v18 = objc_msgSend(v4, "bs_safeNumberForKey:", @"VerticalOffsetInPixels");
  [v18 doubleValue];
  v5->_verticalOffsetInPixels = v19;

  if (STBackgroundActivityIsVisualEffect(v7))
  {
    uint64_t v20 = [v7 copy];
    preferredVisualEffectName = v5->_preferredVisualEffectName;
    v5->_preferredVisualEffectName = (NSString *)v20;
  }
  else if (v7)
  {
    uint64_t v22 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412290;
      id v33 = v7;
      _os_log_error_impl(&dword_1D9514000, v22, OS_LOG_TYPE_ERROR, "Expected a visual effect name, got: %@", (uint8_t *)&v32, 0xCu);
    }
  }
  if (STBackgroundActivityIsContinuousAnimation(v8))
  {
    uint64_t v23 = [v8 copy];
    preferredContinuousAnimationName = v5->_preferredContinuousAnimationName;
    v5->_preferredContinuousAnimationName = (NSString *)v23;
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    preferredContinuousAnimationName = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(preferredContinuousAnimationName, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412290;
      id v33 = v8;
      _os_log_error_impl(&dword_1D9514000, preferredContinuousAnimationName, OS_LOG_TYPE_ERROR, "Expected a continuous animation name, got: %@", (uint8_t *)&v32, 0xCu);
    }
  }

LABEL_14:
  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  id v26 = objc_msgSend(v4, "bs_safeArrayForKey:", @"CrossfadableActivities");
  uint64_t v27 = [v25 setWithArray:v26];
  crossfadableActivities = v5->_crossfadableActivities;
  v5->_crossfadableActivities = (NSSet *)v27;

  if (!v5->_systemImageName && [@"pulseSymbol" isEqualToString:v8])
  {
    uint64_t v29 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D9514000, v29, OS_LOG_TYPE_ERROR, "It's not valid to specify 'pulseSymbol' for a visualDescriptor without a system image", (uint8_t *)&v32, 2u);
    }
  }
  if (!v5->_textLabel && !v5->_systemImageName && !v5->_imageName && !v5->_packageName)
  {
    long long v30 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D9514000, v30, OS_LOG_TYPE_ERROR, "A visual descriptor should have a systemImage, image, package, or textLabel — but this one doesn't!", (uint8_t *)&v32, 2u);
    }
  }
LABEL_27:

  return v5;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)textLabel
{
  return self->_textLabel;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)backgroundColorRepresentation
{
  return self->_backgroundColorRepresentation;
}

- (double)verticalOffsetInPixels
{
  return self->_verticalOffsetInPixels;
}

- (double)fontSizeAdjustment
{
  return self->_fontSizeAdjustment;
}

- (BOOL)prefersToKeepContentVisible
{
  return self->_prefersToKeepContentVisible;
}

- (NSString)preferredVisualEffectName
{
  return self->_preferredVisualEffectName;
}

- (NSString)preferredContinuousAnimationName
{
  return self->_preferredContinuousAnimationName;
}

- (NSSet)crossfadableActivities
{
  return self->_crossfadableActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadableActivities, 0);
  objc_storeStrong((id *)&self->_preferredContinuousAnimationName, 0);
  objc_storeStrong((id *)&self->_preferredVisualEffectName, 0);
  objc_storeStrong((id *)&self->_backgroundColorRepresentation, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);

  objc_storeStrong((id *)&self->_packageName, 0);
}

@end