@interface STUIItemSettings
+ (id)settingsControllerModule;
- (BOOL)batteryCondensedPercentageForceEnabled;
- (BOOL)batteryPercentageAlwaysEnabled;
- (BOOL)secondarySIMUnderBaseline;
- (BOOL)showBothDualCarrierNames;
- (BOOL)showRingerOffLockScreen;
- (BOOL)showRingerOnAODLockScreen;
- (BOOL)showRingerWhenSilenced;
- (void)setBatteryCondensedPercentageForceEnabled:(BOOL)a3;
- (void)setBatteryPercentageAlwaysEnabled:(BOOL)a3;
- (void)setDefaultValues;
- (void)setSecondarySIMUnderBaseline:(BOOL)a3;
- (void)setShowBothDualCarrierNames:(BOOL)a3;
- (void)setShowRingerOffLockScreen:(BOOL)a3;
- (void)setShowRingerOnAODLockScreen:(BOOL)a3;
- (void)setShowRingerWhenSilenced:(BOOL)a3;
@end

@implementation STUIItemSettings

- (BOOL)batteryPercentageAlwaysEnabled
{
  return *(&self->super.__isObservingChildren + 1);
}

- (BOOL)showRingerOffLockScreen
{
  return self->_batteryCondensedPercentageForceEnabled;
}

- (BOOL)secondarySIMUnderBaseline
{
  return *(&self->super.__isObservingChildren + 4);
}

- (BOOL)showRingerOnAODLockScreen
{
  return self->_batteryPercentageAlwaysEnabled;
}

- (BOOL)showRingerWhenSilenced
{
  return *(&self->super.__isObservingChildren + 5);
}

- (BOOL)batteryCondensedPercentageForceEnabled
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)STUIItemSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(STUIItemSettings *)self setBatteryPercentageAlwaysEnabled:0];
  [(STUIItemSettings *)self setBatteryCondensedPercentageForceEnabled:0];
  [(STUIItemSettings *)self setShowBothDualCarrierNames:0];
  [(STUIItemSettings *)self setSecondarySIMUnderBaseline:0];
  [(STUIItemSettings *)self setShowRingerWhenSilenced:1];
  [(STUIItemSettings *)self setShowRingerOnAODLockScreen:0];
  [(STUIItemSettings *)self setShowRingerOffLockScreen:1];
}

+ (id)settingsControllerModule
{
  v32[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v19 = (void *)MEMORY[0x1E4F94160];
  v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Percentage" valueKeyPath:@"batteryPercentageAlwaysEnabled"];
  v31[0] = v27;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Condensed Percentage" valueKeyPath:@"batteryCondensedPercentageForceEnabled"];
  v31[1] = v26;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v24 = [v2 sectionWithRows:v25 title:@"Battery"];
  v32[0] = v24;
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v23 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Both Carrier Names" valueKeyPath:@"showBothDualCarrierNames"];
  v30[0] = v23;
  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Second SIM Under Baseline" valueKeyPath:@"secondarySIMUnderBaseline"];
  v30[1] = v22;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v20 = [v3 sectionWithRows:v21 title:@"Cellular"];
  v32[1] = v20;
  v4 = (void *)MEMORY[0x1E4F94160];
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Ringer When Silenced" valueKeyPath:@"showRingerWhenSilenced"];
  v29[0] = v18;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Ringer On AOD" valueKeyPath:@"showRingerOnAODLockScreen"];
  v29[1] = v5;
  v6 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Ringer Everywhere" valueKeyPath:@"showRingerOffLockScreen"];
  v29[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  v8 = [v4 sectionWithRows:v7 title:@"Ringer"];
  v32[2] = v8;
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];
  v28 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v14 = [v9 sectionWithRows:v13];
  v32[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v16 = [v19 moduleWithTitle:0 contents:v15];

  return v16;
}

- (void)setBatteryPercentageAlwaysEnabled:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (void)setBatteryCondensedPercentageForceEnabled:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)showBothDualCarrierNames
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setShowBothDualCarrierNames:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (void)setSecondarySIMUnderBaseline:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (void)setShowRingerWhenSilenced:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (void)setShowRingerOnAODLockScreen:(BOOL)a3
{
  self->_batteryPercentageAlwaysEnabled = a3;
}

- (void)setShowRingerOffLockScreen:(BOOL)a3
{
  self->_batteryCondensedPercentageForceEnabled = a3;
}

@end