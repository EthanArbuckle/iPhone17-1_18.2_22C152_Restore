@interface SHUDOnenessUnlockedUtilities
+ (id)deviceSpecificViewController;
+ (id)subtitle;
+ (id)title;
+ (id)trailingButton;
@end

@implementation SHUDOnenessUnlockedUtilities

+ (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"APP_NAME" value:0 table:@"Localization"];

  return v3;
}

+ (id)subtitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"IPHONE_USED_NOTIFICATION_TEXT" value:0 table:@"Localization"];

  return v3;
}

+ (id)trailingButton
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SETTINGS_BUTTON_TEXT" value:0 table:@"Localization"];

  v4 = +[UIButton buttonWithType:1];
  [v4 setTitle:v3 forState:0];
  v5 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline variant:1024];
  v6 = [v4 titleLabel];
  [v6 setFont:v5];

  v7 = +[UIColor systemRedColor];
  [v4 setTintColor:v7];

  v8 = +[UIColor secondarySystemFillColor];
  [v4 setBackgroundColor:v8];

  [v4 _setCornerRadius:17.0];
  [v4 setUserInteractionEnabled:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v4;
}

+ (id)deviceSpecificViewController
{
  int v2 = SBUIIsSystemApertureEnabled();
  v3 = sharingHUDLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Using Jindo", buf, 2u);
    }
    v5 = off_1000142D0;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Using BannerKit", v8, 2u);
    }
    v5 = off_1000142D8;
  }

  id v6 = objc_alloc_init(*v5);
  return v6;
}

@end