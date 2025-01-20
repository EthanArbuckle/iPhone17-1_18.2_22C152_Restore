@interface COSUnlockPlaceholderViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)isMandatory;
- (BOOL)controllerAllowsNavigatingBackTo;
- (COSUnlockPlaceholderViewController)init;
- (UIButton)acceptButton;
- (UIButton)declineButton;
- (UILabel)footerLabel;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)okayButtonTitle;
- (id)titleString;
- (void)okayButtonPressed:(id)a3;
- (void)setAcceptButton:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setFooterLabel:(id)a3;
- (void)unlockPairingComplete:(id)a3;
@end

@implementation COSUnlockPlaceholderViewController

+ (BOOL)isMandatory
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];

  if (v3) {
    return 0;
  }
  v5 = +[MCProfileConnection sharedConnection];
  unsigned int v6 = [v5 BOOLRestrictionForFeature:MCFeatureAlphanumericPasscodeRequired];
  BOOL v4 = v6 == 1;
  v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[NSNumber numberWithBool:v6 == 1];
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "COSUnlockPlaceholderViewController isMandatory %@", (uint8_t *)&v10, 0xCu);
  }
  return v4;
}

+ (BOOL)controllerNeedsToRun
{
  if (([(id)objc_opt_class() isMandatory] & 1) != 0
    || +[COSPasscodeAdvancedViewController isMandatory])
  {
    uint64_t v2 = 1;
  }
  else
  {
    unsigned __int8 v3 = [UIApp activeWatch];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CFD76F6A-B79A-475D-BCD7-7EB10AC33956"];
    id v5 = [v3 supportsCapability:v4];

    unsigned int v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = +[NSNumber numberWithBool:v5];
      int v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "COSUnlockPlaceholderViewController hasAutolockCapability %@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v2 = v5 ^ 1;
  }
  v8 = pbb_bridge_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSNumber numberWithBool:v2];
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "COSUnlockPlaceholderViewController controllerNeedsToRun %@", (uint8_t *)&v11, 0xCu);
  }
  return v2;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (COSUnlockPlaceholderViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSUnlockPlaceholderViewController;
  uint64_t v2 = [(COSOptinViewController *)&v8 init];
  if (v2)
  {
    if ([(id)objc_opt_class() isMandatory]) {
      uint64_t v3 = 96;
    }
    else {
      uint64_t v3 = 64;
    }
    [(COSUnlockPlaceholderViewController *)v2 setStyle:v3];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"unlockPairingComplete:" name:PBBridgeDidCompleteUnlockPairingNotification object:0];

    id v5 = +[UIApplication sharedApplication];
    unsigned int v6 = [v5 bridgeController];
    [v6 sendGizmoPasscodeRestrictions];
  }
  return v2;
}

- (id)titleString
{
  uint64_t v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"UNLOCK_OPTION_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  unsigned int v2 = [(id)objc_opt_class() isMandatory];
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"UNLOCK_OPTION_MANDATORY_TEXT";
  }
  else {
    CFStringRef v5 = @"UNLOCK_OPTION_TEXT";
  }
  unsigned int v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

  return v6;
}

- (id)imageResource
{
  unsigned int v2 = sub_1000328FC(@"Screen-Passcode");
  uint64_t v3 = [UIApp activeWatch];
  int v4 = BPSIsDeviceCompatibleWithVersions();

  if (v4)
  {
    uint64_t v5 = [v2 stringByAppendingString:@"-v2"];

    unsigned int v2 = (void *)v5;
  }

  return v2;
}

- (void)unlockPairingComplete:(id)a3
{
  id v4 = [(COSUnlockPlaceholderViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (id)okayButtonTitle
{
  unsigned int v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"UNLOCK_MANDATORY_BUTTON_TEXT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  unsigned int v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"WHAT_IS_THIS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)okayButtonPressed:(id)a3
{
  id v4 = [(COSUnlockPlaceholderViewController *)self delegate];
  [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (UIButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);

  objc_storeStrong((id *)&self->_acceptButton, 0);
}

@end