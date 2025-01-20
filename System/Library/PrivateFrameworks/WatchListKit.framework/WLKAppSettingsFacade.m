@interface WLKAppSettingsFacade
- (WLKAppSettingsFacade)initWithSettings:(id)a3;
- (id)accessStatus;
- (id)settings;
- (void)setAccessStatus:(id)a3;
@end

@implementation WLKAppSettingsFacade

- (WLKAppSettingsFacade)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKAppSettingsFacade;
  v6 = [(WLKAppSettingsFacade *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (void)setAccessStatus:(id)a3
{
  uint64_t v4 = [a3 unsignedIntegerValue];
  [(WLKAppSettings *)self->_settings setAccessStatus:v4];
  id v5 = +[WLKSettingsStore sharedSettings];
  v6 = [(WLKAppSettings *)self->_settings channelID];
  v7 = [(WLKAppSettings *)self->_settings externalID];
  [v5 setStatus:v4 forChannelID:v6 externalID:v7];

  if (v4)
  {
    settings = self->_settings;
    +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:settings deleteHistory:0 completion:0];
  }
}

- (id)accessStatus
{
  v3 = +[WLKSettingsStore sharedSettings];
  uint64_t v4 = [(WLKAppSettings *)self->_settings channelID];
  id v5 = [(WLKAppSettings *)self->_settings externalID];
  v6 = [v3 settingsForChannelID:v4 externalID:v5];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "accessStatus"));

  return v7;
}

- (id)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end