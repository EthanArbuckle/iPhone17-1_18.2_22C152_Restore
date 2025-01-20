@interface SBAttentionAwarenessSettings
+ (BOOL)attentionSensorSupported;
+ (id)settingsControllerModule;
- (BOOL)shouldUseAttentionSensor;
- (double)dimInterval;
- (double)sampleInterval;
- (double)sleepInterval;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDefaultValues;
- (void)setDimInterval:(double)a3;
- (void)setSampleInterval:(double)a3;
- (void)setShouldUseAttentionSensor:(BOOL)a3;
- (void)setSleepInterval:(double)a3;
@end

@implementation SBAttentionAwarenessSettings

- (BOOL)shouldUseAttentionSensor
{
  return self->_allowsAttentionAwareAutoLock && self->_supportsAttentionSensor && self->_shouldUseAttentionSensor;
}

+ (BOOL)attentionSensorSupported
{
  return ((unint64_t)[MEMORY[0x1E4F4E708] supportedEvents] >> 7) & 1;
}

+ (id)settingsControllerModule
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Attention Sensor(s)" valueKeyPath:@"shouldUseAttentionSensor"];
  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Sample Interval" valueKeyPath:@"sampleInterval"];
  v4 = [v3 between:0.0 and:300.0];
  v5 = [v4 precision:2];

  v6 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dim Interval" valueKeyPath:@"dimInterval"];
  v7 = [v6 between:0.0 and:300.0];
  v8 = [v7 precision:2];

  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"Sleep Interval" valueKeyPath:@"sleepInterval"];
  v10 = [v9 between:0.0 and:300.0];
  v11 = [v10 precision:2];

  v12 = (void *)MEMORY[0x1E4F94168];
  v20[0] = v2;
  v20[1] = v5;
  v20[2] = v8;
  v20[3] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x1E4F94168];
  v19 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v17 = [v15 moduleWithTitle:@"Attention Awareness" contents:v16];

  return v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 unregisterObserver:self];

  [MEMORY[0x1E4F4E708] cancelNotification:self->_attentionAwarenessToken];
  v4.receiver = self;
  v4.super_class = (Class)SBAttentionAwarenessSettings;
  [(PTSettings *)&v4 dealloc];
}

- (void)setShouldUseAttentionSensor:(BOOL)a3
{
  self->_shouldUseAttentionSensor = a3;
}

- (void)setDefaultValues
{
  self->_supportsAttentionSensor = [(id)objc_opt_class() attentionSensorSupported];
  self->_shouldUseAttentionSensor = 1;
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [(SBAttentionAwarenessSettings *)self profileConnectionDidReceiveEffectiveSettingsChangedNotification:v3 userInfo:0];

  if (!self->_isObservingDataSources)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__SBAttentionAwarenessSettings_setDefaultValues__block_invoke;
    v5[3] = &unk_1E6AF4AC0;
    v5[4] = self;
    self->_attentionAwarenessToken = (AWNotification_s *)[MEMORY[0x1E4F4E708] notifySupportedEventsChangedWithQueue:MEMORY[0x1E4F14428] block:v5];
    objc_super v4 = [MEMORY[0x1E4F74230] sharedConnection];
    [v4 registerObserver:self];

    self->_isObservingDataSources = 1;
  }
  [(SBAttentionAwarenessSettings *)self setSampleInterval:4.0];
  [(SBAttentionAwarenessSettings *)self setDimInterval:20.0];
  [(SBAttentionAwarenessSettings *)self setSleepInterval:30.0];
}

uint64_t __48__SBAttentionAwarenessSettings_setDefaultValues__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)objc_opt_class() attentionSensorSupported];
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = result;
  return result;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  self->_allowsAttentionAwareAutoLock = objc_msgSend(a3, "effectiveBoolValueForSetting:", *MEMORY[0x1E4F73F48], a4) != 2;
}

- (double)sampleInterval
{
  return self->_sampleInterval;
}

- (void)setSampleInterval:(double)a3
{
  self->_sampleInterval = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(double)a3
{
  self->_sleepInterval = a3;
}

@end