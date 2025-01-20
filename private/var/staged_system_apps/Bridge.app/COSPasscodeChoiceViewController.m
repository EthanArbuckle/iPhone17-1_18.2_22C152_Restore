@interface COSPasscodeChoiceViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)legacyButtonStyles;
- (BOOL)passcodeSkipChallenged;
- (BOOL)wantsLightenBlendedScreen;
- (COSPasscodeChoiceViewController)init;
- (UIButton)acceptButton;
- (UIButton)declineButton;
- (UILabel)footerLabel;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)detailTitleString;
- (id)imageResource;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)okayButtonPressed:(id)a3;
- (void)setAcceptButton:(id)a3;
- (void)setDeclineButton:(id)a3;
- (void)setFooterLabel:(id)a3;
- (void)setPasscodeSkipChallenged:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation COSPasscodeChoiceViewController

- (COSPasscodeChoiceViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSPasscodeChoiceViewController;
  v2 = [(COSOptinViewController *)&v10 init];
  if (v2)
  {
    v3 = [UIApp bridgeController];
    unsigned __int8 v4 = [v3 isTinkerPairing];

    if (v4)
    {
      uint64_t v5 = 74;
    }
    else
    {
      v6 = +[UIApplication sharedApplication];
      v7 = [v6 bridgeController];
      [v7 sendGizmoPasscodeRestrictions];

      v8 = +[MCProfileConnection sharedConnection];
      if ([v8 BOOLRestrictionForFeature:MCFeaturePasscodeRequired] == 1) {
        uint64_t v5 = 74;
      }
      else {
        uint64_t v5 = 106;
      }
    }
    [(COSPasscodeChoiceViewController *)v2 setStyle:v5];
  }
  return v2;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PASSCODE_OPTIONS_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = [UIApp bridgeController];
  unsigned int v3 = [v2 isTinkerPairing];

  unsigned __int8 v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[COSPasscodeChoiceViewController detailString]";
    __int16 v13 = 1024;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: queried isSatellitePairing (%{BOOL}d)", (uint8_t *)&v11, 0x12u);
  }

  uint64_t v5 = +[NSBundle mainBundle];
  v6 = v5;
  if (v3)
  {
    CFStringRef v7 = @"PASSCODE_DESCRIPTION_TINKER";
    CFStringRef v8 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v7 = @"PASSCODE_DESCRIPTION";
    CFStringRef v8 = @"Localizable";
  }
  v9 = [v5 localizedStringForKey:v7 value:&stru_100249230 table:v8];

  return v9;
}

- (id)imageResource
{
  v2 = sub_1000328FC(@"Screen-Passcode");
  unsigned int v3 = [UIApp activeWatch];
  int v4 = BPSIsDeviceCompatibleWithVersions();

  if (v4)
  {
    uint64_t v5 = [v2 stringByAppendingString:@"-v4"];

    v2 = (void *)v5;
  }

  return v2;
}

- (void)suggestedButtonPressed:(id)a3
{
  +[PBBridgeCAReporter recordPasscodeCreatedWithType:1 wasChallenged:self->_passcodeSkipChallenged];
  id v4 = [(COSPasscodeChoiceViewController *)self delegate];
  [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (void)alternateButtonPressed:(id)a3
{
  +[PBBridgeCAReporter recordPasscodeCreatedWithType:2 wasChallenged:self->_passcodeSkipChallenged];
  id v4 = [(COSPasscodeChoiceViewController *)self delegate];
  [v4 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  if (a3)
  {
    +[PBBridgeCAReporter recordPasscodeChallenge:2];
    uint64_t v4 = objc_opt_class();
    id v5 = [(COSPasscodeChoiceViewController *)self delegate];
    [v5 buddyControllerDone:self nextControllerClass:v4];
  }
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"ADD_PASSCODE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"PASSCODE_MORE_OPTIONS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"DO_NOT_ADD_PASSCODE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"WHAT_IS_THIS" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)okayButtonPressed:(id)a3
{
  self->_passcodeSkipChallenged = 1;
  +[PBBridgeCAReporter recordPasscodeChallenge:1];

  [(COSPasscodeChoiceViewController *)self showOptinConfirmationAlert:@"PASSCODE" optinChoice:1];
}

- (BOOL)legacyButtonStyles
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = [UIApp bridgeController];
  unsigned int v3 = [v2 isTinkerPairing];

  if (v3)
  {
    uint64_t v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tinker Setup Requires Passcode Creation.", v6, 2u);
    }
  }
  else if (+[COSUnlockPlaceholderViewController isMandatory](COSUnlockPlaceholderViewController, "isMandatory")|| +[COSPasscodeAdvancedViewController isMandatory])
  {
    +[PBBridgeCAReporter recordPasscodeCreatedWithType:3 wasChallenged:0];
    return 0;
  }
  return 1;
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

- (BOOL)passcodeSkipChallenged
{
  return self->_passcodeSkipChallenged;
}

- (void)setPasscodeSkipChallenged:(BOOL)a3
{
  self->_passcodeSkipChallenged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);

  objc_storeStrong((id *)&self->_acceptButton, 0);
}

@end