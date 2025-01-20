@interface SUSUIFollowUpDDMUpdate
+ (id)uniqueIdentifier;
- (BOOL)allowNotification;
- (NSString)notificationInformativeText;
- (NSString)notificationTitle;
- (id)_goToSUPaneAction;
- (id)notificationActivateAction;
- (id)notificationOptions;
- (unint64_t)displayStyle;
- (void)setNotificationInformativeText:(id)a3;
- (void)setNotificationTitle:(id)a3;
@end

@implementation SUSUIFollowUpDDMUpdate

+ (id)uniqueIdentifier
{
  return @"com.apple.softwareupdateservicesui.followup.postupdate";
}

- (BOOL)allowNotification
{
  return 1;
}

- (unint64_t)displayStyle
{
  return 24;
}

- (NSString)notificationTitle
{
  char v6 = 0;
  char v4 = 0;
  if (self->_notificationTitle)
  {
    v2 = self->_notificationTitle;
  }
  else
  {
    id v7 = sub_22578();
    char v6 = 1;
    id v5 = [v7 localizedStringForKey:@"SOFTWARE_UPDATE_AVAILABLE_ALERT_TITLE" value:&stru_62DF0 table:@"ui_alerts"];
    char v4 = 1;
    v2 = (NSString *)v5;
  }
  v8 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

- (NSString)notificationInformativeText
{
  char v6 = 0;
  char v4 = 0;
  if (self->_notificationInformativeText)
  {
    v2 = self->_notificationInformativeText;
  }
  else
  {
    id v7 = sub_22578();
    char v6 = 1;
    id v5 = [v7 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_FORCED_BODY_FALLBACK" value:&stru_62DF0 table:@"ui_alerts"];
    char v4 = 1;
    v2 = (NSString *)v5;
  }
  v8 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

- (id)notificationOptions
{
  v3[0] = FLNotificationOptionLockscreen;
  v3[1] = FLNotificationOptionKeepOnLockscreen;
  v3[2] = FLNotificationOptionNotificationCenter;
  v3[3] = FLNotificationOptionBannerAlert;
  v3[4] = FLNotificationOptionForce;
  return +[NSArray arrayWithObjects:v3 count:5];
}

- (id)notificationActivateAction
{
  return [(SUSUIFollowUpDDMUpdate *)self _goToSUPaneAction];
}

- (id)_goToSUPaneAction
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = objc_alloc_init((Class)FLFollowUpAction);
  v3 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  objc_msgSend(v5[0], "setUrl:");

  id v4 = v5[0];
  objc_storeStrong(v5, 0);

  return v4;
}

- (void)setNotificationTitle:(id)a3
{
}

- (void)setNotificationInformativeText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end