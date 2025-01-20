@interface PHThumperSetupController
+ (BOOL)_userHasAlreadyBeenPrompted;
+ (void)_removeHasShownPromptDefaultIfNecessary;
+ (void)showThumperAvailableDialogIfNecessary;
@end

@implementation PHThumperSetupController

+ (void)showThumperAvailableDialogIfNecessary
{
  if ((+[TUCallCapabilities supportsPrimaryCalling] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027DFC;
    block[3] = &unk_1000A20B0;
    block[4] = a1;
    if (qword_1000BBFD8 != -1) {
      dispatch_once(&qword_1000BBFD8, block);
    }
    if (!+[TUCallCapabilities supportsThumperCalling](TUCallCapabilities, "supportsThumperCalling")|| (+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled") & 1) != 0|| ([a1 _userHasAlreadyBeenPrompted] & 1) != 0)
    {
      [a1 _removeHasShownPromptDefaultIfNecessary];
    }
    else
    {
      v3 = sub_100012C68();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing upgrade-to-Thumper prompt because Thumper can be enabled but is not enabled already, and we haven't shown a prompt to the user already.", buf, 2u);
      }

      v4 = +[NSBundle mainBundle];
      v5 = TUStringKeyForNetworkAndProduct();
      v6 = [v4 localizedStringForKey:v5 value:&stru_1000A3488 table:@"General"];
      v7 = [v4 localizedStringForKey:@"THUMPER_UPGRADE_MESSAGE" value:&stru_1000A3488 table:@"General"];
      v8 = [v4 localizedStringForKey:@"NOT_NOW" value:&stru_1000A3488 table:@"General"];
      v9 = [v4 localizedStringForKey:@"TURN_ON" value:&stru_1000A3488 table:@"General"];
      v10 = +[IMUserNotification userNotificationWithIdentifier:@"ThumperServiceAvailableNotification" title:v6 message:v7 defaultButton:v9 alternateButton:v8 otherButton:0];
      v11 = v10;
      if (v10)
      {
        [v10 setUsesNotificationCenter:0];
        v12 = [v4 bundleIdentifier];
        [v11 setRepresentedApplicationBundle:v12];

        v13 = +[IMUserNotificationCenter sharedInstance];
        [v13 addUserNotification:v11 listener:0 completionHandler:&stru_1000A20F0];
      }
      v14 = sub_100012C68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v17 = @"HasOfferedTHMPUpgrade";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting %@ default because we are prompting the user", buf, 0xCu);
      }

      sub_10003D970(@"HasOfferedTHMPUpgrade", &__kCFBooleanTrue);
    }
  }
}

+ (BOOL)_userHasAlreadyBeenPrompted
{
  v2 = sub_100011338(@"HasOfferedTHMPUpgrade");
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (void)_removeHasShownPromptDefaultIfNecessary
{
  if (+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled")&& [a1 _userHasAlreadyBeenPrompted])
  {
    unsigned __int8 v3 = sub_100012C68();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      CFStringRef v5 = @"HasOfferedTHMPUpgrade";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing %@ default because Thumper is now enabled", (uint8_t *)&v4, 0xCu);
    }

    sub_10003D970(@"HasOfferedTHMPUpgrade", &__kCFBooleanFalse);
  }
}

@end