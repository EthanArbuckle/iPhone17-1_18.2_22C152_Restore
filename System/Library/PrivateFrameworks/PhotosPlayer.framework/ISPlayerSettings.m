@interface ISPlayerSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)allowFrameBlending;
- (BOOL)allowVideoPreRoll;
- (BOOL)audioEnabled;
- (BOOL)crossfadeEnabled;
- (BOOL)easingEnabled;
- (BOOL)longExposureVitality;
- (BOOL)loopingEnabled;
- (BOOL)playDuringHint;
- (BOOL)playIsSticky;
- (BOOL)prerollBeforePlaying;
- (BOOL)scaleDuringPlayback;
- (BOOL)showStateOverlay;
- (BOOL)useDedicatedQueues;
- (double)forceScrubMaximumInteractiveRate;
- (double)forceScrubMinRateChange;
- (double)forceScrubMinimumRate;
- (double)forceScrubRewindFactor;
- (double)vitalityEaseDuration;
- (float)vitalityEaseMinRate;
- (int64_t)startBehavior;
- (void)setAllowFrameBlending:(BOOL)a3;
- (void)setAllowVideoPreRoll:(BOOL)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setCrossfadeEnabled:(BOOL)a3;
- (void)setDefaultValues;
- (void)setEasingEnabled:(BOOL)a3;
- (void)setForceScrubMaximumInteractiveRate:(double)a3;
- (void)setForceScrubMinRateChange:(double)a3;
- (void)setForceScrubMinimumRate:(double)a3;
- (void)setForceScrubRewindFactor:(double)a3;
- (void)setLongExposureVitality:(BOOL)a3;
- (void)setLoopingEnabled:(BOOL)a3;
- (void)setPlayDuringHint:(BOOL)a3;
- (void)setPlayIsSticky:(BOOL)a3;
- (void)setPrerollBeforePlaying:(BOOL)a3;
- (void)setScaleDuringPlayback:(BOOL)a3;
- (void)setShowStateOverlay:(BOOL)a3;
- (void)setStartBehavior:(int64_t)a3;
- (void)setUseDedicatedQueues:(BOOL)a3;
- (void)setVitalityEaseDuration:(double)a3;
- (void)setVitalityEaseMinRate:(float)a3;
@end

@implementation ISPlayerSettings

- (void)setDefaultValues
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)ISPlayerSettings;
  [(PTSettings *)&v9 setDefaultValues];
  [(ISPlayerSettings *)self setVitalityEaseDuration:0.25];
  LODWORD(v3) = 1045220557;
  [(ISPlayerSettings *)self setVitalityEaseMinRate:v3];
  [(ISPlayerSettings *)self setLoopingEnabled:0];
  [(ISPlayerSettings *)self setCrossfadeEnabled:0];
  uint64_t v4 = 1;
  [(ISPlayerSettings *)self setAudioEnabled:1];
  [(ISPlayerSettings *)self setPrerollBeforePlaying:0];
  [(ISPlayerSettings *)self setUseDedicatedQueues:1];
  v5 = (void *)MGGetStringAnswer();
  int v6 = [v5 isEqualToString:@"iPad"];

  if (v6)
  {
    int v13 = -1157300313;
    long long v12 = xmmword_1DB24DF38;
    int v11 = -2132668294;
    long long v10 = xmmword_1DB24DF4C;
    v7 = &v10;
    uint64_t v8 = 0;
    uint64_t v4 = MGIsDeviceOneOfType();
  }
  -[ISPlayerSettings setAllowFrameBlending:](self, "setAllowFrameBlending:", v4, v7, v8);
  [(ISPlayerSettings *)self setAllowVideoPreRoll:1];
  [(ISPlayerSettings *)self setShowStateOverlay:0];
  [(ISPlayerSettings *)self setForceScrubRewindFactor:2.0];
  [(ISPlayerSettings *)self setForceScrubMinRateChange:0.01];
  [(ISPlayerSettings *)self setForceScrubMinimumRate:0.5];
  [(ISPlayerSettings *)self setForceScrubMaximumInteractiveRate:2.0];
  [(ISPlayerSettings *)self setPlayDuringHint:1];
  [(ISPlayerSettings *)self setPlayIsSticky:0];
  [(ISPlayerSettings *)self setScaleDuringPlayback:1];
  [(ISPlayerSettings *)self setEasingEnabled:0];
  [(ISPlayerSettings *)self setLongExposureVitality:1];
}

+ (id)sharedInstance
{
  v2 = +[ISRootSettings sharedInstance];
  double v3 = [v2 playerSettings];

  return v3;
}

- (void)setForceScrubMaximumInteractiveRate:(double)a3
{
  self->_forceScrubMaximumInteractiveRate = a3;
}

- (double)forceScrubMaximumInteractiveRate
{
  return self->_forceScrubMaximumInteractiveRate;
}

- (void)setForceScrubMinimumRate:(double)a3
{
  self->_forceScrubMinimumRate = a3;
}

- (double)forceScrubMinimumRate
{
  return self->_forceScrubMinimumRate;
}

- (void)setForceScrubMinRateChange:(double)a3
{
  self->_forceScrubMinRateChange = a3;
}

- (double)forceScrubMinRateChange
{
  return self->_forceScrubMinRateChange;
}

- (void)setForceScrubRewindFactor:(double)a3
{
  self->_forceScrubRewindFactor = a3;
}

- (double)forceScrubRewindFactor
{
  return self->_forceScrubRewindFactor;
}

- (void)setAllowVideoPreRoll:(BOOL)a3
{
  self->_allowVideoPreRoll = a3;
}

- (BOOL)allowVideoPreRoll
{
  return self->_allowVideoPreRoll;
}

- (void)setAllowFrameBlending:(BOOL)a3
{
  self->_allowFrameBlending = a3;
}

- (BOOL)allowFrameBlending
{
  return self->_allowFrameBlending;
}

- (void)setUseDedicatedQueues:(BOOL)a3
{
  self->_useDedicatedQueues = a3;
}

- (BOOL)useDedicatedQueues
{
  return self->_useDedicatedQueues;
}

- (void)setPrerollBeforePlaying:(BOOL)a3
{
  self->_prerollBeforePlaying = a3;
}

- (BOOL)prerollBeforePlaying
{
  return self->_prerollBeforePlaying;
}

- (void)setShowStateOverlay:(BOOL)a3
{
  self->_showStateOverlay = a3;
}

- (BOOL)showStateOverlay
{
  return self->_showStateOverlay;
}

- (void)setPlayDuringHint:(BOOL)a3
{
  self->_playDuringHint = a3;
}

- (BOOL)playDuringHint
{
  return self->_playDuringHint;
}

- (void)setLongExposureVitality:(BOOL)a3
{
  self->_longExposureVitality = a3;
}

- (BOOL)longExposureVitality
{
  return self->_longExposureVitality;
}

- (void)setPlayIsSticky:(BOOL)a3
{
  self->_playIsSticky = a3;
}

- (BOOL)playIsSticky
{
  return self->_playIsSticky;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setCrossfadeEnabled:(BOOL)a3
{
  self->_crossfadeEnabled = a3;
}

- (BOOL)crossfadeEnabled
{
  return self->_crossfadeEnabled;
}

- (void)setLoopingEnabled:(BOOL)a3
{
  self->_loopingEnabled = a3;
}

- (BOOL)loopingEnabled
{
  return self->_loopingEnabled;
}

- (void)setScaleDuringPlayback:(BOOL)a3
{
  self->_scaleDuringPlayback = a3;
}

- (BOOL)scaleDuringPlayback
{
  return self->_scaleDuringPlayback;
}

- (void)setStartBehavior:(int64_t)a3
{
  self->_startBehavior = a3;
}

- (int64_t)startBehavior
{
  return self->_startBehavior;
}

- (void)setVitalityEaseMinRate:(float)a3
{
  self->_vitalityEaseMinRate = a3;
}

- (float)vitalityEaseMinRate
{
  return self->_vitalityEaseMinRate;
}

- (void)setVitalityEaseDuration:(double)a3
{
  self->_vitalityEaseDuration = a3;
}

- (double)vitalityEaseDuration
{
  return self->_vitalityEaseDuration;
}

- (void)setEasingEnabled:(BOOL)a3
{
  self->_easingEnabled = a3;
}

- (BOOL)easingEnabled
{
  return self->_easingEnabled;
}

+ (id)settingsControllerModule
{
  v56[20] = *MEMORY[0x1E4F143B8];
  v40 = (void *)MEMORY[0x1E4F94160];
  v53 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Easing Enabled" valueKeyPath:@"easingEnabled"];
  v56[0] = v53;
  v52 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Long Exposure Vitality" valueKeyPath:@"longExposureVitality"];
  v56[1] = v52;
  v51 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Vitality Ease Duration" valueKeyPath:@"vitalityEaseDuration"];
  v50 = [v51 minValue:0.1 maxValue:0.5];
  v49 = objc_msgSend(v50, "is_increment:", 0.05);
  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"easingEnabled == YES"];
  v47 = [v49 condition:v48];
  v56[2] = v47;
  v46 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Vitality Ease Min Rate" valueKeyPath:@"vitalityEaseMinRate"];
  v45 = [v46 minValue:0.100000001 maxValue:1.0];
  v44 = objc_msgSend(v45, "is_increment:", 0.0500000007);
  v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"easingEnabled == YES"];
  v42 = [v44 condition:v43];
  v56[3] = v42;
  v39 = [MEMORY[0x1E4F94108] rowWithTitle:@"Playback Starts…" valueKeyPath:@"startBehavior"];
  v38 = [v39 possibleValues:&unk_1F3554AB0 titles:&unk_1F3554AC8];
  v56[4] = v38;
  v37 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Scale During Playback" valueKeyPath:@"scaleDuringPlayback"];
  v56[5] = v37;
  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Looping Enabled" valueKeyPath:@"loopingEnabled"];
  v56[6] = v36;
  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Crossfade Enabled" valueKeyPath:@"crossfadeEnabled"];
  v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"loopingEnabled == YES"];
  v33 = [v35 condition:v34];
  v56[7] = v33;
  v32 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Audio Enabled" valueKeyPath:@"audioEnabled"];
  v56[8] = v32;
  v31 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sticky Play" valueKeyPath:@"playIsSticky"];
  v56[9] = v31;
  v30 = [MEMORY[0x1E4F941F0] rowWithTitle:@"State Overlay" valueKeyPath:@"showStateOverlay"];
  v56[10] = v30;
  v29 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Live Hint" valueKeyPath:@"playDuringHint"];
  v56[11] = v29;
  v28 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Dedicated Queues" valueKeyPath:@"useDedicatedQueues"];
  v56[12] = v28;
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Preroll Before Playing" valueKeyPath:@"prerollBeforePlaying"];
  v56[13] = v27;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Frame Blending" valueKeyPath:@"allowFrameBlending"];
  v56[14] = v26;
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Video Preroll" valueKeyPath:@"allowVideoPreRoll"];
  v56[15] = v25;
  v24 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Force Scrub Rewind Factor" valueKeyPath:@"forceScrubRewindFactor"];
  v23 = [v24 minValue:0.0 maxValue:10.0];
  v22 = objc_msgSend(v23, "is_increment:", 0.00999999978);
  v56[16] = v22;
  v2 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Force Scrub Min Rate Change" valueKeyPath:@"forceScrubMinRateChange"];
  double v3 = [v2 minValue:0.0 maxValue:0.100000001];
  uint64_t v4 = objc_msgSend(v3, "is_increment:", 0.0000999999975);
  v56[17] = v4;
  v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Force Scrub Minimum Rate" valueKeyPath:@"forceScrubMinimumRate"];
  int v6 = [v5 minValue:0.0 maxValue:1.0];
  v7 = objc_msgSend(v6, "is_increment:", 0.100000001);
  v56[18] = v7;
  uint64_t v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Force Scrub Maximum Interactive Rate" valueKeyPath:@"forceScrubMaximumInteractiveRate"];
  objc_super v9 = [v8 minValue:0.0 maxValue:8.0];
  long long v10 = objc_msgSend(v9, "is_increment:", 0.100000001);
  v56[19] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:20];
  v41 = [v40 sectionWithRows:v11];

  long long v12 = (void *)MEMORY[0x1E4F94160];
  int v13 = (void *)MEMORY[0x1E4F940F8];
  uint64_t v14 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];
  v55 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v17 = [v12 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F94160];
  v54[0] = v41;
  v54[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v20 = [v18 moduleWithTitle:@"Player" contents:v19];

  return v20;
}

@end