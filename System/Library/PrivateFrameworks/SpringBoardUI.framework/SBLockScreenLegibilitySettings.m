@interface SBLockScreenLegibilitySettings
+ (id)defaultSettings;
- (BOOL)vibrancyDisabled;
- (UIColor)backgroundColorHint;
- (void)setBackgroundColorHint:(id)a3;
- (void)setVibrancyDisabled:(BOOL)a3;
@end

@implementation SBLockScreenLegibilitySettings

+ (id)defaultSettings
{
  if (defaultSettings_onceToken != -1) {
    dispatch_once(&defaultSettings_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)defaultSettings___DefaultSettings;

  return v2;
}

uint64_t __49__SBLockScreenLegibilitySettings_defaultSettings__block_invoke()
{
  v0 = [[SBLockScreenLegibilitySettings alloc] initWithStyle:2];
  uint64_t v1 = defaultSettings___DefaultSettings;
  defaultSettings___DefaultSettings = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (UIColor)backgroundColorHint
{
  return self->_backgroundColorHint;
}

- (void)setBackgroundColorHint:(id)a3
{
}

- (BOOL)vibrancyDisabled
{
  return self->_vibrancyDisabled;
}

- (void)setVibrancyDisabled:(BOOL)a3
{
  self->_vibrancyDisabled = a3;
}

- (void).cxx_destruct
{
}

@end