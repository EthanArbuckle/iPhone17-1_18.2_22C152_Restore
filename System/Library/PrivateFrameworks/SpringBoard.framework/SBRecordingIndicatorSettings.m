@interface SBRecordingIndicatorSettings
+ (id)settingsControllerModule;
- (double)delayBeforeFadeIn180;
- (double)delayBeforeFadeIn90;
- (double)delayBeforeFadeOut180;
- (double)delayBeforeFadeOut90;
- (double)fadeInDuration180;
- (double)fadeInDuration90;
- (double)fadeOutDuration180;
- (double)fadeOutDuration90;
- (double)rateLimitPeriod;
- (int64_t)sensorType;
- (unint64_t)rateLimitNumber;
- (void)setDefaultValues;
- (void)setDelayBeforeFadeIn180:(double)a3;
- (void)setDelayBeforeFadeIn90:(double)a3;
- (void)setDelayBeforeFadeOut180:(double)a3;
- (void)setDelayBeforeFadeOut90:(double)a3;
- (void)setFadeInDuration180:(double)a3;
- (void)setFadeInDuration90:(double)a3;
- (void)setFadeOutDuration180:(double)a3;
- (void)setFadeOutDuration90:(double)a3;
- (void)setRateLimitNumber:(unint64_t)a3;
- (void)setRateLimitPeriod:(double)a3;
- (void)setSensorType:(int64_t)a3;
@end

@implementation SBRecordingIndicatorSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBRecordingIndicatorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBRecordingIndicatorSettings *)self setSensorType:0];
  [(SBRecordingIndicatorSettings *)self setDelayBeforeFadeOut90:0.01];
  [(SBRecordingIndicatorSettings *)self setFadeOutDuration90:0.03];
  [(SBRecordingIndicatorSettings *)self setDelayBeforeFadeIn90:0.25];
  [(SBRecordingIndicatorSettings *)self setFadeInDuration90:0.2];
  [(SBRecordingIndicatorSettings *)self setDelayBeforeFadeOut180:0.01];
  [(SBRecordingIndicatorSettings *)self setFadeOutDuration180:0.03];
  [(SBRecordingIndicatorSettings *)self setDelayBeforeFadeIn180:0.65];
  [(SBRecordingIndicatorSettings *)self setFadeInDuration180:0.2];
  [(SBRecordingIndicatorSettings *)self setRateLimitPeriod:60.0];
  [(SBRecordingIndicatorSettings *)self setRateLimitNumber:5];
}

+ (id)settingsControllerModule
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94110] rowWithTitle:@"Sensor Type" valueKeyPath:@"sensorType"];
  v45 = [v2 possibleValues:&unk_1F3347940 titles:&unk_1F3347928];

  objc_super v3 = (void *)MEMORY[0x1E4F94168];
  v51[0] = v45;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v44 = [v3 sectionWithRows:v4 title:@"Override Sensor State"];

  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Delay Before Fade-out" valueKeyPath:@"delayBeforeFadeOut90"];
  v43 = [v5 minValue:0.0 maxValue:1.5];

  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Fade-out Duration" valueKeyPath:@"fadeOutDuration90"];
  v42 = [v6 minValue:0.0 maxValue:1.5];

  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Delay Before Fade-in" valueKeyPath:@"delayBeforeFadeIn90"];
  v41 = [v7 minValue:0.0 maxValue:1.5];

  v8 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Fade-in Duration" valueKeyPath:@"fadeInDuration90"];
  v40 = [v8 minValue:0.0 maxValue:1.5];

  v9 = (void *)MEMORY[0x1E4F94168];
  v50[0] = v43;
  v50[1] = v42;
  v50[2] = v41;
  v50[3] = v40;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  v39 = [v9 sectionWithRows:v10 title:@"Rotation Crossfade Settings (90º)"];

  v11 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Delay Before Fade-out" valueKeyPath:@"delayBeforeFadeOut180"];
  v38 = [v11 minValue:0.0 maxValue:1.5];

  v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Fade-out Duration" valueKeyPath:@"fadeOutDuration180"];
  v37 = [v12 minValue:0.0 maxValue:1.5];

  v13 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Delay Before Fade-in" valueKeyPath:@"delayBeforeFadeIn180"];
  v36 = [v13 minValue:0.0 maxValue:1.5];

  v14 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Fade-in Duration" valueKeyPath:@"fadeInDuration180"];
  v35 = [v14 minValue:0.0 maxValue:1.5];

  v15 = (void *)MEMORY[0x1E4F94168];
  v49[0] = v38;
  v49[1] = v37;
  v49[2] = v36;
  v49[3] = v35;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  v34 = [v15 sectionWithRows:v16 title:@"Rotation Crossfade Settings (180º)"];

  v17 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rate Limit Period" valueKeyPath:@"rateLimitPeriod"];
  v18 = [v17 minValue:0.0 maxValue:300.0];

  v19 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Rate Limit Number of Rotations" valueKeyPath:@"rateLimitNumber"];
  v20 = [v19 minValue:0.0 maxValue:30.0];

  [v18 setValueValidatator:&__block_literal_global_37];
  [v20 setValueValidatator:&__block_literal_global_37];
  v21 = (void *)MEMORY[0x1E4F94168];
  v48[0] = v18;
  v48[1] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v23 = [v21 sectionWithRows:v22 title:@"Rotation Rate Limiting"];

  v24 = (void *)MEMORY[0x1E4F94100];
  v25 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v26 = [v24 rowWithTitle:@"Restore Defaults" action:v25];

  v27 = (void *)MEMORY[0x1E4F94168];
  v47 = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v29 = [v27 sectionWithRows:v28];

  v30 = (void *)MEMORY[0x1E4F94168];
  v46[0] = v44;
  v46[1] = v39;
  v46[2] = v34;
  v46[3] = v23;
  v46[4] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
  v32 = [v30 moduleWithTitle:0 contents:v31];

  return v32;
}

uint64_t __56__SBRecordingIndicatorSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  objc_super v3 = NSNumber;
  return [v3 numberWithUnsignedInteger:(unint64_t)v2];
}

- (int64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int64_t)a3
{
  self->_sensorType = a3;
}

- (double)delayBeforeFadeOut90
{
  return self->_delayBeforeFadeOut90;
}

- (void)setDelayBeforeFadeOut90:(double)a3
{
  self->_delayBeforeFadeOut90 = a3;
}

- (double)fadeOutDuration90
{
  return self->_fadeOutDuration90;
}

- (void)setFadeOutDuration90:(double)a3
{
  self->_fadeOutDuration90 = a3;
}

- (double)delayBeforeFadeIn90
{
  return self->_delayBeforeFadeIn90;
}

- (void)setDelayBeforeFadeIn90:(double)a3
{
  self->_delayBeforeFadeIn90 = a3;
}

- (double)fadeInDuration90
{
  return self->_fadeInDuration90;
}

- (void)setFadeInDuration90:(double)a3
{
  self->_fadeInDuration90 = a3;
}

- (double)delayBeforeFadeOut180
{
  return self->_delayBeforeFadeOut180;
}

- (void)setDelayBeforeFadeOut180:(double)a3
{
  self->_delayBeforeFadeOut180 = a3;
}

- (double)fadeOutDuration180
{
  return self->_fadeOutDuration180;
}

- (void)setFadeOutDuration180:(double)a3
{
  self->_fadeOutDuration180 = a3;
}

- (double)delayBeforeFadeIn180
{
  return self->_delayBeforeFadeIn180;
}

- (void)setDelayBeforeFadeIn180:(double)a3
{
  self->_delayBeforeFadeIn180 = a3;
}

- (double)fadeInDuration180
{
  return self->_fadeInDuration180;
}

- (void)setFadeInDuration180:(double)a3
{
  self->_fadeInDuration180 = a3;
}

- (double)rateLimitPeriod
{
  return self->_rateLimitPeriod;
}

- (void)setRateLimitPeriod:(double)a3
{
  self->_rateLimitPeriod = a3;
}

- (unint64_t)rateLimitNumber
{
  return self->_rateLimitNumber;
}

- (void)setRateLimitNumber:(unint64_t)a3
{
  self->_rateLimitNumber = a3;
}

@end