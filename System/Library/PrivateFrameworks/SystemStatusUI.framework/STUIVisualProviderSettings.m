@interface STUIVisualProviderSettings
+ (id)settingsControllerModule;
- (BOOL)enableActivity;
- (BOOL)fullWidthBackgroundActivity;
- (BOOL)hasBoldTime;
- (BOOL)legacyPhoneUsesiPadLayout;
- (BOOL)promoteThermalWarning;
- (BOOL)redInSpringBoard;
- (BOOL)showVPNDisconnect;
- (BOOL)showsDateBeforeTime;
- (NSString)visualProviderClassName;
- (double)backgroundActivityCoalescingDelay;
- (void)setBackgroundActivityCoalescingDelay:(double)a3;
- (void)setDefaultValues;
- (void)setEnableActivity:(BOOL)a3;
- (void)setFullWidthBackgroundActivity:(BOOL)a3;
- (void)setHasBoldTime:(BOOL)a3;
- (void)setLegacyPhoneUsesiPadLayout:(BOOL)a3;
- (void)setPromoteThermalWarning:(BOOL)a3;
- (void)setRedInSpringBoard:(BOOL)a3;
- (void)setShowVPNDisconnect:(BOOL)a3;
- (void)setShowsDateBeforeTime:(BOOL)a3;
- (void)setVisualProviderClassName:(id)a3;
@end

@implementation STUIVisualProviderSettings

- (BOOL)redInSpringBoard
{
  return self->_redInSpringBoard;
}

- (BOOL)showVPNDisconnect
{
  return self->_showVPNDisconnect;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)STUIVisualProviderSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(STUIVisualProviderSettings *)self setRedInSpringBoard:0];
  [(STUIVisualProviderSettings *)self setPromoteThermalWarning:0];
  [(STUIVisualProviderSettings *)self setEnableActivity:0];
  [(STUIVisualProviderSettings *)self setBackgroundActivityCoalescingDelay:0.0];
  [(STUIVisualProviderSettings *)self setShowVPNDisconnect:0];
  [(STUIVisualProviderSettings *)self setLegacyPhoneUsesiPadLayout:0];
  [(STUIVisualProviderSettings *)self setFullWidthBackgroundActivity:1];
  [(STUIVisualProviderSettings *)self setShowsDateBeforeTime:0];
  [(STUIVisualProviderSettings *)self setHasBoldTime:0];
  [(STUIVisualProviderSettings *)self setVisualProviderClassName:&stru_1F2F86950];
}

+ (id)settingsControllerModule
{
  v41[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v25 = (id)MEMORY[0x1E4F94160];
  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Red In SpringBoard" valueKeyPath:@"redInSpringBoard"];
  v40[0] = v35;
  v34 = [MEMORY[0x1E4F94158] rowWithTitle:@"Visual Provider Class" valueKeyPath:@"visualProviderClassName"];
  v40[1] = v34;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v32 = [v2 sectionWithRows:v33 title:@"All"];
  v41[0] = v32;
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v31 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Promote Thermal Warning" valueKeyPath:@"promoteThermalWarning"];
  v39[0] = v31;
  v30 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Activity" valueKeyPath:@"enableActivity"];
  v39[1] = v30;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"BG Activity Coalescing Delay" valueKeyPath:@"backgroundActivityCoalescingDelay"];
  v28 = [v29 between:0.0 and:20.0];
  v27 = [v28 precision:1];
  v39[2] = v27;
  v24 = [MEMORY[0x1E4F941F0] rowWithTitle:@"VPN Disconnect" valueKeyPath:@"showVPNDisconnect"];
  v39[3] = v24;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v22 = [v3 sectionWithRows:v23 title:@"Split Phone"];
  v41[1] = v22;
  v4 = (void *)MEMORY[0x1E4F94160];
  v21 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use iPad Layout" valueKeyPath:@"legacyPhoneUsesiPadLayout"];
  v38[0] = v21;
  v20 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Full-Width Background Activity" valueKeyPath:@"fullWidthBackgroundActivity"];
  v38[1] = v20;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v5 = [v4 sectionWithRows:v19 title:@"Legacy Phone"];
  v41[2] = v5;
  v6 = (void *)MEMORY[0x1E4F94160];
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Date Before Time" valueKeyPath:@"showsDateBeforeTime"];
  v37[0] = v7;
  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Bold Time" valueKeyPath:@"hasBoldTime"];
  v37[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v10 = [v6 sectionWithRows:v9 title:@"iPad"];
  v41[3] = v10;
  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = (void *)MEMORY[0x1E4F940F8];
  v13 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v14 = [v12 rowWithTitle:@"Restore Defaults" action:v13];
  v36 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v16 = [v11 sectionWithRows:v15];
  v41[4] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
  id v26 = [v25 moduleWithTitle:0 contents:v17];

  return v26;
}

- (void)setRedInSpringBoard:(BOOL)a3
{
  self->_redInSpringBoard = a3;
}

- (NSString)visualProviderClassName
{
  return self->_visualProviderClassName;
}

- (void)setVisualProviderClassName:(id)a3
{
}

- (BOOL)promoteThermalWarning
{
  return self->_promoteThermalWarning;
}

- (void)setPromoteThermalWarning:(BOOL)a3
{
  self->_promoteThermalWarning = a3;
}

- (BOOL)enableActivity
{
  return self->_enableActivity;
}

- (void)setEnableActivity:(BOOL)a3
{
  self->_enableActivity = a3;
}

- (double)backgroundActivityCoalescingDelay
{
  return self->_backgroundActivityCoalescingDelay;
}

- (void)setBackgroundActivityCoalescingDelay:(double)a3
{
  self->_backgroundActivityCoalescingDelay = a3;
}

- (void)setShowVPNDisconnect:(BOOL)a3
{
  self->_showVPNDisconnect = a3;
}

- (BOOL)legacyPhoneUsesiPadLayout
{
  return self->_legacyPhoneUsesiPadLayout;
}

- (void)setLegacyPhoneUsesiPadLayout:(BOOL)a3
{
  self->_legacyPhoneUsesiPadLayout = a3;
}

- (BOOL)fullWidthBackgroundActivity
{
  return self->_fullWidthBackgroundActivity;
}

- (void)setFullWidthBackgroundActivity:(BOOL)a3
{
  self->_fullWidthBackgroundActivity = a3;
}

- (BOOL)showsDateBeforeTime
{
  return self->_showsDateBeforeTime;
}

- (void)setShowsDateBeforeTime:(BOOL)a3
{
  self->_showsDateBeforeTime = a3;
}

- (BOOL)hasBoldTime
{
  return self->_hasBoldTime;
}

- (void)setHasBoldTime:(BOOL)a3
{
  self->_hasBoldTime = a3;
}

- (void).cxx_destruct
{
}

@end