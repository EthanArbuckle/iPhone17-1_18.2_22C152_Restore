@interface SBLiveActivitySettings
+ (id)settingsControllerModule;
- (BOOL)allowAlertsOnHostApp;
- (BOOL)disableActivityAlertsAsBanners;
- (BOOL)hideActivitiesInAmbient;
- (BOOL)hideActivitiesInDynamicIsland;
- (BOOL)hideActivitiesInLockScreen;
- (SBAmbientLiveActivitiesSettings)ambientSettings;
- (void)setAllowAlertsOnHostApp:(BOOL)a3;
- (void)setAmbientSettings:(id)a3;
- (void)setDefaultValues;
- (void)setDisableActivityAlertsAsBanners:(BOOL)a3;
- (void)setHideActivitiesInAmbient:(BOOL)a3;
- (void)setHideActivitiesInDynamicIsland:(BOOL)a3;
- (void)setHideActivitiesInLockScreen:(BOOL)a3;
@end

@implementation SBLiveActivitySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBLiveActivitySettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_allowAlertsOnHostApp = 0;
  self->_hideActivitiesInLockScreen = 0;
  self->_hideActivitiesInAmbient = 0;
  self->_hideActivitiesInDynamicIsland = 0;
  self->_disableActivityAlertsAsBanners = 0;
  [(SBAmbientLiveActivitiesSettings *)self->_ambientSettings setDefaultValues];
}

+ (id)settingsControllerModule
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v20 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow alerts on host application" valueKeyPath:@"allowAlertsOnHostApp"];
  v19 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Hide in Lock Screen" valueKeyPath:@"hideActivitiesInLockScreen"];
  v18 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Hide in Dynamic Island" valueKeyPath:@"hideActivitiesInDynamicIsland"];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Hide in Ambient" valueKeyPath:@"hideActivitiesInAmbient"];
  objc_super v3 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Disable alerts as banners" valueKeyPath:@"disableActivityAlertsAsBanners"];
  v4 = [MEMORY[0x1E4F94138] rowWithTitle:@"Domino Animation Settings" childSettingsKeyPath:@"ambientSettings"];
  v5 = (void *)MEMORY[0x1E4F94168];
  v23[0] = v20;
  v23[1] = v19;
  v23[2] = v18;
  v23[3] = v2;
  v23[4] = v3;
  v23[5] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];
  v7 = [v5 sectionWithRows:v6 title:@"Activity Presentation Settings"];

  v8 = (void *)MEMORY[0x1E4F94100];
  v9 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];

  v11 = (void *)MEMORY[0x1E4F94168];
  v22 = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v13 = [v11 sectionWithRows:v12];

  v14 = (void *)MEMORY[0x1E4F94168];
  v21[0] = v7;
  v21[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v16 = [v14 moduleWithTitle:@"Live Activities" contents:v15];

  return v16;
}

- (BOOL)allowAlertsOnHostApp
{
  return self->_allowAlertsOnHostApp;
}

- (void)setAllowAlertsOnHostApp:(BOOL)a3
{
  self->_allowAlertsOnHostApp = a3;
}

- (BOOL)hideActivitiesInLockScreen
{
  return self->_hideActivitiesInLockScreen;
}

- (void)setHideActivitiesInLockScreen:(BOOL)a3
{
  self->_hideActivitiesInLockScreen = a3;
}

- (BOOL)hideActivitiesInDynamicIsland
{
  return self->_hideActivitiesInDynamicIsland;
}

- (void)setHideActivitiesInDynamicIsland:(BOOL)a3
{
  self->_hideActivitiesInDynamicIsland = a3;
}

- (BOOL)hideActivitiesInAmbient
{
  return self->_hideActivitiesInAmbient;
}

- (void)setHideActivitiesInAmbient:(BOOL)a3
{
  self->_hideActivitiesInAmbient = a3;
}

- (BOOL)disableActivityAlertsAsBanners
{
  return self->_disableActivityAlertsAsBanners;
}

- (void)setDisableActivityAlertsAsBanners:(BOOL)a3
{
  self->_disableActivityAlertsAsBanners = a3;
}

- (SBAmbientLiveActivitiesSettings)ambientSettings
{
  return self->_ambientSettings;
}

- (void)setAmbientSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end