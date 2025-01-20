@interface HKSHSleepApneaNotificationsBridgeSettings
+ (id)hiddenSettings;
- (BOOL)settingEnabled;
- (BOOL)settingVisible;
- (BOOL)showOnboarding;
- (HKSHSleepApneaNotificationsBridgeSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 showOnboarding:(BOOL)a5 footer:(id)a6;
- (HKSHSleepApneaNotificationsFooter)footer;
- (void)setFooter:(id)a3;
- (void)setSettingEnabled:(BOOL)a3;
- (void)setSettingVisible:(BOOL)a3;
- (void)setShowOnboarding:(BOOL)a3;
@end

@implementation HKSHSleepApneaNotificationsBridgeSettings

- (HKSHSleepApneaNotificationsBridgeSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 showOnboarding:(BOOL)a5 footer:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)HKSHSleepApneaNotificationsBridgeSettings;
  v11 = [(HKSHSleepApneaNotificationsBridgeSettings *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(HKSHSleepApneaNotificationsBridgeSettings *)v11 setSettingVisible:v8];
    [(HKSHSleepApneaNotificationsBridgeSettings *)v12 setSettingEnabled:v7];
    [(HKSHSleepApneaNotificationsBridgeSettings *)v12 setShowOnboarding:v6];
    [(HKSHSleepApneaNotificationsBridgeSettings *)v12 setFooter:v10];
  }

  return v12;
}

+ (id)hiddenSettings
{
  v2 = [[HKSHSleepApneaNotificationsBridgeSettings alloc] initWithSettingVisible:0 settingEnabled:0 showOnboarding:0 footer:0];
  return v2;
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (void)setSettingVisible:(BOOL)a3
{
  self->_settingVisible = a3;
}

- (BOOL)settingEnabled
{
  return self->_settingEnabled;
}

- (void)setSettingEnabled:(BOOL)a3
{
  self->_settingEnabled = a3;
}

- (BOOL)showOnboarding
{
  return self->_showOnboarding;
}

- (void)setShowOnboarding:(BOOL)a3
{
  self->_showOnboarding = a3;
}

- (HKSHSleepApneaNotificationsFooter)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end