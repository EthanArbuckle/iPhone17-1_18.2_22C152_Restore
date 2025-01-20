@interface SBRingerHardwareButtonSettings
+ (id)settingsControllerModule;
- (SBRingerButtonParameters)ringerButtonParameters;
- (double)longPressTime;
- (double)longPressTimeWhenSuppressed;
- (void)setDefaultValues;
- (void)setLongPressTime:(double)a3;
- (void)setLongPressTimeWhenSuppressed:(double)a3;
- (void)setRingerButtonParameters:(id)a3;
@end

@implementation SBRingerHardwareButtonSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBRingerHardwareButtonSettings;
  [(PTSettings *)&v4 setDefaultValues];
  v3 = objc_alloc_init(SBRingerButtonParameters);
  [(SBRingerHardwareButtonSettings *)self setRingerButtonParameters:v3];
}

+ (id)settingsControllerModule
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94140] rowWithTitle:@"Long press time" valueKeyPath:@"longPressTime"];
  v17 = [v2 between:0.0 and:10.0];

  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"In-pocket long press time" valueKeyPath:@"longPressTimeWhenSuppressed"];
  objc_super v4 = [v3 between:0.0 and:10.0];

  v5 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:v17];
  [v5 addObject:v4];
  v6 = [MEMORY[0x1E4F94168] sectionWithRows:v5];
  v7 = (void *)MEMORY[0x1E4F94168];
  v8 = (void *)MEMORY[0x1E4F94100];
  v9 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v19[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v12 = [v7 sectionWithRows:v11];

  v13 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v6;
  v18[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v15 = [v13 moduleWithTitle:@"Ringer Button" contents:v14];

  return v15;
}

- (SBRingerButtonParameters)ringerButtonParameters
{
  v3 = objc_alloc_init(SBRingerButtonParameters);
  -[SBRingerButtonParameters setLongPressTime:]((uint64_t)v3, self->_longPressTime);
  -[SBRingerButtonParameters setLongPressTimeWhenSuppressed:]((uint64_t)v3, self->_longPressTimeWhenSuppressed);
  return v3;
}

- (void)setRingerButtonParameters:(id)a3
{
  id v4 = a3;
  self->_longPressTime = -[SBRingerButtonParameters longPressTime]((uint64_t)v4);
  double v5 = -[SBRingerButtonParameters longPressTimeWhenSuppressed]((uint64_t)v4);

  self->_longPressTimeWhenSuppressed = v5;
}

- (double)longPressTime
{
  return self->_longPressTime;
}

- (void)setLongPressTime:(double)a3
{
  self->_longPressTime = a3;
}

- (double)longPressTimeWhenSuppressed
{
  return self->_longPressTimeWhenSuppressed;
}

- (void)setLongPressTimeWhenSuppressed:(double)a3
{
  self->_longPressTimeWhenSuppressed = a3;
}

@end