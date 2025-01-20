@interface CLDaemonSettingsManager
- (CLDaemonSettingsManager)init;
- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5;
- (void)beginService;
- (void)endService;
- (void)flush;
- (void)refresh;
@end

@implementation CLDaemonSettingsManager

- (CLDaemonSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonSettingsManager;
  return [(CLDaemonSettingsManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSettingsManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLSettingsManagerClientProtocol];
}

- (void)beginService
{
  v5.receiver = self;
  v5.super_class = (Class)CLDaemonSettingsManager;
  [(CLDaemonSettingsManager *)&v5 beginService];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1005DA26C;
  handler[3] = &unk_1022B4250;
  handler[4] = self;
  notify_register_dispatch((const char *)[@"com.apple.locationd/Prefs" UTF8String], &self->_fDaemonPreferencesChangedNotificationToken, (dispatch_queue_t)[objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo") queue], handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005DA274;
  v3[3] = &unk_1022B4250;
  v3[4] = self;
  notify_register_dispatch((const char *)[@"com.apple.ManagedConfiguration.profileListChanged" UTF8String], &self->_fMCProfileListChangedForDaemonSettingsNotificationToken, (dispatch_queue_t)[objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo") queue], v3);
  [(CLDaemonSettingsManager *)self refresh];
}

- (void)endService
{
  notify_cancel(self->_fDaemonPreferencesChangedNotificationToken);
  self->_fDaemonPreferencesChangedNotificationToken = -1;
  notify_cancel(self->_fMCProfileListChangedForDaemonSettingsNotificationToken);
  self->_fMCProfileListChangedForDaemonSettingsNotificationToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonSettingsManager;
  [(CLDaemonSettingsManager *)&v3 endService];
}

- (void)refresh
{
  sub_1000C7F88(&v3);
  [(CLDaemonSettingsManager *)self setSettingsDictionary:sub_100520A18(v3)];
  if (v4) {
    sub_1000DB0A0(v4);
  }
  [(CLDaemonSettingsManager *)self updateClientsWithDictionary:+[NSDictionary dictionaryWithDictionary:[(CLDaemonSettingsManager *)self settingsDictionary]]];
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  sub_1000C7F88(&v11);
  sub_1000EA8A4(v11, (const char *)[a4 UTF8String], (uint64_t)a3);
  if (v12) {
    sub_1000DB0A0(v12);
  }
  v10.receiver = self;
  v10.super_class = (Class)CLDaemonSettingsManager;
  return [(CLDaemonSettingsManager *)&v10 syncgetSetValue:a3 forKey:a4 withoutNotifying:a5];
}

- (void)flush
{
  sub_1000C7F88(&v3);
  sub_10051F604(v3);
  if (v4) {
    sub_1000DB0A0(v4);
  }
  [(CLDaemonSettingsManager *)self refresh];
}

@end