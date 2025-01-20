@interface SBProximitySettings
+ (id)settingsControllerModule;
- (BOOL)allowTouchesInJindoWhenObjectInProximity;
- (BOOL)colorScreenEdgeWhenObjectInProximity;
- (double)initialBacklightDebounceDuration;
- (double)nonTelephonyTouchAllowanceGracePeriodDuration;
- (double)subsequentBacklightDebounceDuration;
- (void)setAllowTouchesInJindoWhenObjectInProximity:(BOOL)a3;
- (void)setColorScreenEdgeWhenObjectInProximity:(BOOL)a3;
- (void)setDefaultValues;
- (void)setInitialBacklightDebounceDuration:(double)a3;
- (void)setNonTelephonyTouchAllowanceGracePeriodDuration:(double)a3;
- (void)setSubsequentBacklightDebounceDuration:(double)a3;
@end

@implementation SBProximitySettings

- (void)setDefaultValues
{
  int v4 = __sb__runningInSpringBoard();
  if (!v4)
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v2 userInterfaceIdiom] && SBFEffectiveHomeButtonType() == 2)
    {
      char v9 = SBUIIsSystemApertureEnabled();

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
LABEL_13:
      double v7 = 0.5;
      double v8 = 0.5;
      goto LABEL_14;
    }
LABEL_12:

    goto LABEL_13;
  }
  char v5 = v4;
  if (!SBFEffectiveDeviceClass() || (int v6 = SBFEffectiveDeviceClass(), v7 = 0.5, v8 = 0.5, v6 == 1))
  {
    if (SBFEffectiveHomeButtonType() == 2)
    {
      if (SBUIIsSystemApertureEnabled()) {
        goto LABEL_13;
      }
LABEL_10:
      double v8 = 0.375;
      double v7 = 0.75;
      goto LABEL_14;
    }
    double v7 = 0.5;
    double v8 = 0.5;
    if (v5) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
  [(SBProximitySettings *)self setInitialBacklightDebounceDuration:v7];
  [(SBProximitySettings *)self setSubsequentBacklightDebounceDuration:v8];
  [(SBProximitySettings *)self setColorScreenEdgeWhenObjectInProximity:0];
  [(SBProximitySettings *)self setAllowTouchesInJindoWhenObjectInProximity:0];
  int v10 = SBUIIsSystemApertureEnabled();
  double v11 = 0.0;
  if (v10) {
    double v11 = 5.0;
  }
  [(SBProximitySettings *)self setNonTelephonyTouchAllowanceGracePeriodDuration:v11];
}

+ (id)settingsControllerModule
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  int v4 = [v2 rowWithTitle:@"Restore Defaults" action:v3];
  v23[0] = v4;
  char v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Initial Backlight Debounce" valueKeyPath:@"initialBacklightDebounceDuration"];
  int v6 = [v5 minValue:0.0 maxValue:5.0];
  v23[1] = v6;
  double v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Subsequent Backlight Debounce" valueKeyPath:@"subsequentBacklightDebounceDuration"];
  double v8 = [v7 minValue:0.0 maxValue:5.0];
  v23[2] = v8;
  char v9 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Color Screen Edge" valueKeyPath:@"colorScreenEdgeWhenObjectInProximity"];
  v23[3] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  double v11 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow Touches In Jindo" valueKeyPath:@"allowTouchesInJindoWhenObjectInProximity"];
  v22[0] = v11;
  v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Non-Telephony Touch Allowance Grace Period" valueKeyPath:@"nonTelephonyTouchAllowanceGracePeriodDuration"];
  v13 = [v12 minValue:0.0 maxValue:10.0];
  v22[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v15 = [v10 arrayByAddingObjectsFromArray:v14];

  v16 = (void *)MEMORY[0x1E4F94168];
  v17 = [MEMORY[0x1E4F94168] sectionWithRows:v15 title:@"Parameters"];
  v21 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v19 = [v16 moduleWithTitle:@"Prox" contents:v18];

  return v19;
}

- (double)initialBacklightDebounceDuration
{
  return self->_initialBacklightDebounceDuration;
}

- (void)setInitialBacklightDebounceDuration:(double)a3
{
  self->_initialBacklightDebounceDuration = a3;
}

- (double)subsequentBacklightDebounceDuration
{
  return self->_subsequentBacklightDebounceDuration;
}

- (void)setSubsequentBacklightDebounceDuration:(double)a3
{
  self->_subsequentBacklightDebounceDuration = a3;
}

- (BOOL)colorScreenEdgeWhenObjectInProximity
{
  return self->_colorScreenEdgeWhenObjectInProximity;
}

- (void)setColorScreenEdgeWhenObjectInProximity:(BOOL)a3
{
  self->_colorScreenEdgeWhenObjectInProximity = a3;
}

- (BOOL)allowTouchesInJindoWhenObjectInProximity
{
  return self->_allowTouchesInJindoWhenObjectInProximity;
}

- (void)setAllowTouchesInJindoWhenObjectInProximity:(BOOL)a3
{
  self->_allowTouchesInJindoWhenObjectInProximity = a3;
}

- (double)nonTelephonyTouchAllowanceGracePeriodDuration
{
  return self->_nonTelephonyTouchAllowanceGracePeriodDuration;
}

- (void)setNonTelephonyTouchAllowanceGracePeriodDuration:(double)a3
{
  self->_nonTelephonyTouchAllowanceGracePeriodDuration = a3;
}

@end