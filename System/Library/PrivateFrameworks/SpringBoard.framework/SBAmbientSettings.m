@interface SBAmbientSettings
+ (id)settingsControllerModule;
- (BOOL)enableSuppression;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerWarnMode;
- (int64_t)suppressedIdleTimerDuration;
- (int64_t)suppressedIdleTimerWarnMode;
- (void)setDefaultValues;
- (void)setEnableSuppression:(BOOL)a3;
- (void)setIdleTimerDuration:(int64_t)a3;
- (void)setIdleTimerWarnMode:(int64_t)a3;
- (void)setSuppressedIdleTimerDuration:(int64_t)a3;
- (void)setSuppressedIdleTimerWarnMode:(int64_t)a3;
@end

@implementation SBAmbientSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBAmbientSettings;
  [(PTSettings *)&v5 setDefaultValues];
  int v3 = MGGetBoolAnswer();
  self->_enableSuppression = v3;
  if (v3)
  {
    self->_idleTimerDuration = 14;
    int64_t idleTimerWarnMode = 1;
    self->_int64_t idleTimerWarnMode = 1;
    self->_suppressedIdleTimerDuration = 7;
  }
  else
  {
    self->_idleTimerDuration = 7;
    self->_int64_t idleTimerWarnMode = 1;
    self->_suppressedIdleTimerDuration = self->_idleTimerDuration;
    int64_t idleTimerWarnMode = self->_idleTimerWarnMode;
  }
  self->_suppressedIdleTimerWarnMode = idleTimerWarnMode;
}

+ (id)settingsControllerModule
{
  v38[5] = *MEMORY[0x1E4F143B8];
  v37[0] = &unk_1F334A208;
  v37[1] = &unk_1F334A220;
  v38[0] = @"Locked";
  v38[1] = @"Ambient Extended";
  v37[2] = &unk_1F334A238;
  v37[3] = &unk_1F334A250;
  v38[2] = @"Deep Interaction";
  v38[3] = @"Unlocked";
  v37[4] = &unk_1F334A268;
  v38[4] = @"Forever";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
  v35[0] = &unk_1F334A280;
  v35[1] = &unk_1F334A208;
  v36[0] = @"Warn";
  v36[1] = @"Disabled";
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v29 = +[SBAmbientChoiceRow rowWithTitle:@"Duration" valueKeyPath:@"idleTimerDuration"];
  [v29 setPossibleChoicesFromDictionary:v2 order:&unk_1F3347E50];
  v28 = +[SBAmbientChoiceRow rowWithTitle:@"Warning" valueKeyPath:@"idleTimerWarnMode"];
  [v28 setPossibleChoicesFromDictionary:v3 order:&unk_1F3347E68];
  v4 = (void *)MEMORY[0x1E4F94168];
  v34[0] = v29;
  v34[1] = v28;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v26 = [v4 sectionWithRows:v5 title:@"Idle Timer Behavior"];

  v27 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enable Suppression" valueKeyPath:@"enableSuppression"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v33 = v27;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", objc_msgSend(MEMORY[0x1E4F22298], "isAvailable"));
  v25 = [v6 sectionWithRows:v7 title:@"Suppression" condition:v8];

  v9 = +[SBAmbientChoiceRow rowWithTitle:@"Duration" valueKeyPath:@"suppressedIdleTimerDuration"];
  [v9 setPossibleChoicesFromDictionary:v2 order:&unk_1F3347E80];
  v10 = +[SBAmbientChoiceRow rowWithTitle:@"Warning" valueKeyPath:@"suppressedIdleTimerWarnMode"];
  [v10 setPossibleChoicesFromDictionary:v3 order:&unk_1F3347E98];
  v11 = (void *)MEMORY[0x1E4F94168];
  v32[0] = v9;
  v32[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"enableSuppression == YES"];
  v14 = [v11 sectionWithRows:v12 title:@"Idle Timer Behavior During Suppression" condition:v13];

  v15 = (void *)MEMORY[0x1E4F94100];
  v16 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v17 = [v15 rowWithTitle:@"Restore Defaults" action:v16];

  v18 = (void *)MEMORY[0x1E4F94168];
  v31 = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v20 = [v18 sectionWithRows:v19];

  v21 = (void *)MEMORY[0x1E4F94168];
  v30[0] = v26;
  v30[1] = v25;
  v30[2] = v14;
  v30[3] = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v23 = [v21 moduleWithTitle:@"Domino" contents:v22];

  return v23;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (void)setIdleTimerDuration:(int64_t)a3
{
  self->_idleTimerDuration = a3;
}

- (int64_t)idleTimerWarnMode
{
  return self->_idleTimerWarnMode;
}

- (void)setIdleTimerWarnMode:(int64_t)a3
{
  self->_int64_t idleTimerWarnMode = a3;
}

- (BOOL)enableSuppression
{
  return self->_enableSuppression;
}

- (void)setEnableSuppression:(BOOL)a3
{
  self->_enableSuppression = a3;
}

- (int64_t)suppressedIdleTimerDuration
{
  return self->_suppressedIdleTimerDuration;
}

- (void)setSuppressedIdleTimerDuration:(int64_t)a3
{
  self->_suppressedIdleTimerDuration = a3;
}

- (int64_t)suppressedIdleTimerWarnMode
{
  return self->_suppressedIdleTimerWarnMode;
}

- (void)setSuppressedIdleTimerWarnMode:(int64_t)a3
{
  self->_suppressedIdleTimerWarnMode = a3;
}

@end