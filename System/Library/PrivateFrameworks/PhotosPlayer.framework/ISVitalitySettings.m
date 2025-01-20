@interface ISVitalitySettings
+ (ISVitalitySettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)shouldPreroll;
- (BOOL)useLegacyBehavior;
- (ISVitalitySpecificSettings)activityViewSettings;
- (ISVitalitySpecificSettings)oneUpSettings;
- (ISVitalitySpecificSettings)orbPreviewSettings;
- (ISVitalitySpecificSettings)shareViewSettings;
- (double)endTimeOffset;
- (double)maxVitalityDelay;
- (double)maximumDelayBeforePlayback;
- (double)minimumPhotoTransitionDuration;
- (double)minimumVisibilityFactor;
- (double)playbackRate;
- (double)postDuration;
- (double)preDuration;
- (float)vitalityTransitionScoreMinimumValueForPlayback;
- (int64_t)behavior;
- (void)setActivityViewSettings:(id)a3;
- (void)setDefaultValues;
- (void)setOneUpSettings:(id)a3;
- (void)setOrbPreviewSettings:(id)a3;
- (void)setShareViewSettings:(id)a3;
- (void)setShouldPreroll:(BOOL)a3;
- (void)setUseLegacyBehavior:(BOOL)a3;
- (void)setVitalityTransitionScoreMinimumValueForPlayback:(float)a3;
@end

@implementation ISVitalitySettings

- (ISVitalitySpecificSettings)activityViewSettings
{
  return self->_activityViewSettings;
}

- (ISVitalitySpecificSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (ISVitalitySpecificSettings)orbPreviewSettings
{
  return self->_orbPreviewSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orbPreviewSettings, 0);
  objc_storeStrong((id *)&self->_activityViewSettings, 0);
  objc_storeStrong((id *)&self->_shareViewSettings, 0);

  objc_storeStrong((id *)&self->_oneUpSettings, 0);
}

- (void)setOrbPreviewSettings:(id)a3
{
}

- (void)setActivityViewSettings:(id)a3
{
}

- (void)setShareViewSettings:(id)a3
{
}

- (ISVitalitySpecificSettings)shareViewSettings
{
  return self->_shareViewSettings;
}

- (void)setOneUpSettings:(id)a3
{
}

- (void)setUseLegacyBehavior:(BOOL)a3
{
  self->_useLegacyBehavior = a3;
}

- (BOOL)useLegacyBehavior
{
  return self->_useLegacyBehavior;
}

- (void)setVitalityTransitionScoreMinimumValueForPlayback:(float)a3
{
  self->_vitalityTransitionScoreMinimumValueForPlayback = a3;
}

- (float)vitalityTransitionScoreMinimumValueForPlayback
{
  return self->_vitalityTransitionScoreMinimumValueForPlayback;
}

- (void)setShouldPreroll:(BOOL)a3
{
  self->_shouldPreroll = a3;
}

- (BOOL)shouldPreroll
{
  return self->_shouldPreroll;
}

- (double)maxVitalityDelay
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 maxVitalityDelay];
  double v4 = v3;

  return v4;
}

- (double)maximumDelayBeforePlayback
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 maximumDelayBeforePlayback];
  double v4 = v3;

  return v4;
}

- (double)minimumVisibilityFactor
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 minimumVisibilityFactor];
  double v4 = v3;

  return v4;
}

- (double)endTimeOffset
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 endTimeOffset];
  double v4 = v3;

  return v4;
}

- (double)playbackRate
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 playbackRate];
  double v4 = v3;

  return v4;
}

- (double)minimumPhotoTransitionDuration
{
  v2 = [(ISVitalitySettings *)self _defaultSettings];
  [v2 minimumPhotoTransitionDuration];
  double v4 = v3;

  return v4;
}

- (double)postDuration
{
  if ([(ISVitalitySettings *)self useLegacyBehavior]) {
    return 1.5;
  }
  double v4 = [(ISVitalitySettings *)self _defaultSettings];
  [v4 postDuration];
  double v6 = v5;

  return v6;
}

- (double)preDuration
{
  if ([(ISVitalitySettings *)self useLegacyBehavior]) {
    return 1.5;
  }
  double v4 = [(ISVitalitySettings *)self _defaultSettings];
  [v4 preDuration];
  double v6 = v5;

  return v6;
}

- (int64_t)behavior
{
  if ([(ISVitalitySettings *)self useLegacyBehavior]) {
    return 0;
  }
  double v4 = [(ISVitalitySettings *)self _defaultSettings];
  int64_t v5 = [v4 behavior];

  return v5;
}

- (void)setDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)ISVitalitySettings;
  [(PTSettings *)&v7 setDefaultValues];
  [(ISVitalitySettings *)self setUseLegacyBehavior:0];
  [(ISVitalitySettings *)self setShouldPreroll:1];
  [(ISVitalitySettings *)self setVitalityTransitionScoreMinimumValueForPlayback:0.0];
  double v3 = [(ISVitalitySettings *)self oneUpSettings];
  [v3 setMinimumVisibilityFactor:0.05];
  double v4 = [(ISVitalitySettings *)self shareViewSettings];
  [v4 setMinimumVisibilityFactor:0.7];
  int64_t v5 = [(ISVitalitySettings *)self activityViewSettings];
  [v5 setPreDuration:0.35];
  [v5 setMinimumVisibilityFactor:0.7];
  double v6 = [(ISVitalitySettings *)self orbPreviewSettings];
  [v6 setPreDuration:0.65];
  [v6 setPlaybackRate:1.0];
}

+ (id)settingsControllerModule
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  double v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Legacy Behavior" valueKeyPath:@"useLegacyBehavior"];
  v29[0] = v3;
  double v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Preroll" valueKeyPath:@"shouldPreroll"];
  v29[1] = v4;
  int64_t v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Vitality Score" valueKeyPath:@"vitalityTransitionScoreMinimumValueForPlayback"];
  double v6 = [v5 minValue:0.0 maxValue:1.0];
  v29[2] = v6;
  objc_super v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Preroll" valueKeyPath:@"shouldPreroll"];
  v29[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v9 = [v2 sectionWithRows:v8];

  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = [MEMORY[0x1E4F94130] rowWithTitle:@"One Up" childSettingsKeyPath:@"oneUpSettings"];
  v28[0] = v11;
  v12 = [MEMORY[0x1E4F94130] rowWithTitle:@"Share View" childSettingsKeyPath:@"shareViewSettings"];
  v28[1] = v12;
  v13 = [MEMORY[0x1E4F94130] rowWithTitle:@"Activity View" childSettingsKeyPath:@"activityViewSettings"];
  v28[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v15 = [v10 sectionWithRows:v14 title:@"Specific Settings" conditionFormat:@"useLegacyBehavior == 0"];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = (void *)MEMORY[0x1E4F940F8];
  v18 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v19 = [v17 rowWithTitle:@"Restore Defaults" action:v18];
  v27 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v21 = [v16 sectionWithRows:v20];

  v22 = (void *)MEMORY[0x1E4F94160];
  v26[0] = v9;
  v26[1] = v15;
  v26[2] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v24 = [v22 moduleWithTitle:@"Vitality" contents:v23];

  return v24;
}

+ (ISVitalitySettings)sharedInstance
{
  v2 = +[ISRootSettings sharedInstance];
  double v3 = [v2 vitalitySettings];

  return (ISVitalitySettings *)v3;
}

@end