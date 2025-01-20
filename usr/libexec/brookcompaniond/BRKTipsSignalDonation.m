@interface BRKTipsSignalDonation
- (BRKTipsSignalDonation)init;
- (void)_makeTipsSignalDonationUpdate;
@end

@implementation BRKTipsSignalDonation

- (BRKTipsSignalDonation)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRKTipsSignalDonation;
  v2 = [(BRKTipsSignalDonation *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[BRKSettings settingsForActiveDevice];
    settings = v2->_settings;
    v2->_settings = (BRKSettings *)v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_makeTipsSignalDonationUpdate" name:BRKSettingsDidUpdateNotification object:0];

    [(BRKTipsSignalDonation *)v2 _makeTipsSignalDonationUpdate];
  }
  return v2;
}

- (void)_makeTipsSignalDonationUpdate
{
  uint64_t v3 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[BRKTipsSignalDonation _makeTipsSignalDonationUpdate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v4 = +[BMStreams discoverabilitySignal];
  v5 = [v4 source];
  id v6 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  if ([(BRKSettings *)self->_settings isEnabled]) {
    CFStringRef v7 = @"on";
  }
  else {
    CFStringRef v7 = @"off";
  }
  id v8 = [v6 initWithIdentifier:@"com.apple.health.handwashing" bundleID:@"com.apple.brook" context:v7];
  [v5 sendEvent:v8];
  id v9 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  if ([(BRKSettings *)self->_settings areRemindersEnabled]) {
    CFStringRef v10 = @"on";
  }
  else {
    CFStringRef v10 = @"off";
  }
  id v11 = [v9 initWithIdentifier:@"com.apple.health.handwashing.home-reminders" bundleID:@"com.apple.brook" context:v10];
  [v5 sendEvent:v11];
}

- (void).cxx_destruct
{
}

@end