@interface SHUDPairedUnlockUtilities
+ (id)deviceSpecificViewControllerWithWatchName:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5;
+ (id)leadingImage;
+ (id)trailingButton;
@end

@implementation SHUDPairedUnlockUtilities

+ (id)leadingImage
{
  return +[UIImage imageNamed:@"paired-unlock"];
}

+ (id)trailingButton
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"LOCK" value:0 table:@"Localization"];

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

+ (id)deviceSpecificViewControllerWithWatchName:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  int v8 = SBUIIsSystemApertureEnabled();
  v9 = paired_unlock_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using Jindo", buf, 2u);
    }
    v11 = off_1000142E0;
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using BannerKit", v14, 2u);
    }
    v11 = &off_1000142E8;
  }

  id v12 = [objc_alloc(*v11) initWithWatchName:v7 withLockButton:v6 withUpdate:v5];
  return v12;
}

@end