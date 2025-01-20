@interface COSVictoryAppCell
+ (unint64_t)didInstallPostSetupEvent;
- (__CFString)partnerAppBundleIdentifier;
- (id)appIcon;
- (id)localizedAppTitle;
- (id)localizedPartnerTitle;
- (id)partnerAppStoreIdentifier;
@end

@implementation COSVictoryAppCell

- (id)appIcon
{
  return +[UIImage imageNamed:@"VictoryPhoneIcon"];
}

- (id)localizedAppTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"VICTORY_APP_NAME" value:&stru_100249230 table:@"VancouverLocalizable-victory"];

  return v3;
}

- (id)localizedPartnerTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"VICTORY_COMPANY_NAME" value:&stru_100249230 table:@"VancouverLocalizable-victory"];

  return v3;
}

- (id)partnerAppStoreIdentifier
{
  id v2 = sub_1000E338C();

  return +[NSNumber numberWithInteger:v2];
}

+ (unint64_t)didInstallPostSetupEvent
{
  return 29;
}

- (__CFString)partnerAppBundleIdentifier
{
  if (PBIsInternalInstall())
  {
    v0 = +[NSUserDefaults standardUserDefaults];
    v1 = [v0 stringForKey:@"BundleID"];

    if (v1)
    {
      id v2 = v1;
      v3 = pbb_bridge_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        v6 = v2;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(NRC) Overriding bundleID %@", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      id v2 = @"com.nike.nikeplus-gps";
    }
  }
  else
  {
    id v2 = @"com.nike.nikeplus-gps";
  }

  return v2;
}

@end