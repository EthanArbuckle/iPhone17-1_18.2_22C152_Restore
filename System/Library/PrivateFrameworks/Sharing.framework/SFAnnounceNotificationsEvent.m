@interface SFAnnounceNotificationsEvent
+ (NSString)eventName;
- (BOOL)customizedApps;
- (BOOL)tappedCustomize;
- (BOOL)tappedDismissButton;
- (BOOL)tappedInitialEnable;
- (BOOL)tappedNotNow;
- (NSDictionary)eventPayload;
- (void)setCustomizedApps:(BOOL)a3;
- (void)setTappedCustomize:(BOOL)a3;
- (void)setTappedDismissButton:(BOOL)a3;
- (void)setTappedInitialEnable:(BOOL)a3;
- (void)setTappedNotNow:(BOOL)a3;
- (void)submitEvent;
@end

@implementation SFAnnounceNotificationsEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.AnnounceNotifications";
}

- (NSDictionary)eventPayload
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"tappedInitialEnable";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceNotificationsEvent tappedInitialEnable](self, "tappedInitialEnable"));
  v11[0] = v3;
  v10[1] = @"tappedCustomize";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceNotificationsEvent tappedCustomize](self, "tappedCustomize"));
  v11[1] = v4;
  v10[2] = @"tappedNotNow";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceNotificationsEvent tappedNotNow](self, "tappedNotNow"));
  v11[2] = v5;
  v10[3] = @"tappedDismissButton";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceNotificationsEvent tappedDismissButton](self, "tappedDismissButton"));
  v11[3] = v6;
  v10[4] = @"customizedApps";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceNotificationsEvent customizedApps](self, "customizedApps"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (void)submitEvent
{
  id v4 = +[SFAnnounceNotificationsEvent eventName];
  v3 = [(SFAnnounceNotificationsEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (BOOL)tappedInitialEnable
{
  return self->_tappedInitialEnable;
}

- (void)setTappedInitialEnable:(BOOL)a3
{
  self->_tappedInitialEnable = a3;
}

- (BOOL)tappedCustomize
{
  return self->_tappedCustomize;
}

- (void)setTappedCustomize:(BOOL)a3
{
  self->_tappedCustomize = a3;
}

- (BOOL)tappedNotNow
{
  return self->_tappedNotNow;
}

- (void)setTappedNotNow:(BOOL)a3
{
  self->_tappedNotNow = a3;
}

- (BOOL)tappedDismissButton
{
  return self->_tappedDismissButton;
}

- (void)setTappedDismissButton:(BOOL)a3
{
  self->_tappedDismissButton = a3;
}

- (BOOL)customizedApps
{
  return self->_customizedApps;
}

- (void)setCustomizedApps:(BOOL)a3
{
  self->_customizedApps = a3;
}

@end