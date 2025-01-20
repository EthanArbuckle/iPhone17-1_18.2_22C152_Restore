@interface SBIdleTimerSettings
+ (id)settingsControllerModule;
- (BOOL)disableIdleTimer;
- (double)unlockedIdleTimerCap;
- (void)setDefaultValues;
- (void)setDisableIdleTimer:(BOOL)a3;
- (void)setUnlockedIdleTimerCap:(double)a3;
@end

@implementation SBIdleTimerSettings

- (BOOL)disableIdleTimer
{
  return self->_disableIdleTimer;
}

- (void)setDefaultValues
{
  [(SBIdleTimerSettings *)self setDisableIdleTimer:0];
  [(SBIdleTimerSettings *)self setUnlockedIdleTimerCap:300.0];
}

+ (id)settingsControllerModule
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Disable Idle Timer" valueKeyPath:@"disableIdleTimer"];
  v11[0] = v2;
  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Unlocked Max Idle Timer" valueKeyPath:@"unlockedIdleTimerCap"];
  v11[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  v5 = [MEMORY[0x1E4F94168] sectionWithRows:v4 title:@"Features"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v10 = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = [v6 moduleWithTitle:0 contents:v7];

  return v8;
}

- (void)setDisableIdleTimer:(BOOL)a3
{
  self->_disableIdleTimer = a3;
}

- (double)unlockedIdleTimerCap
{
  return self->_unlockedIdleTimerCap;
}

- (void)setUnlockedIdleTimerCap:(double)a3
{
  self->_unlockedIdleTimerCap = a3;
}

@end