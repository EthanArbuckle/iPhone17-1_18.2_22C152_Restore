@interface COSMigrationConnectionFailed
+ (BOOL)controllerNeedsToRun;
- (BOOL)wantsLightenBlendedScreen;
- (COSMigrationConnectionFailed)init;
- (id)detailString;
- (id)detailTitleString;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSMigrationConnectionFailed

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (COSMigrationConnectionFailed)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSMigrationConnectionFailed;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSMigrationConnectionFailed *)v2 setStyle:66];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(COSMigrationConnectionFailed *)self navigationController];
  [v5 setNavigationBarHidden:1];

  v6.receiver = self;
  v6.super_class = (Class)COSMigrationConnectionFailed;
  [(COSMigrationConnectionFailed *)&v6 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(COSMigrationConnectionFailed *)self navigationController];
  [v5 setNavigationBarHidden:0];

  v6.receiver = self;
  v6.super_class = (Class)COSMigrationConnectionFailed;
  [(COSMigrationConnectionFailed *)&v6 viewWillDisappear:v3];
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"WATCH_IS_OFF_OR_ALREADY_PAIRED_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  return 0;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"MIGRATION_CONNECTION_FAILED_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[COSMigrationConnectionFailed suggestedButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(COSMigrationConnectionFailed *)self dismissViewControllerAnimated:1 completion:0];
}

@end