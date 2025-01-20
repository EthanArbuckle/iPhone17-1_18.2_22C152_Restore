@interface COSPasscodeInputViewController
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)isComplex;
- (id)detailText;
- (id)titleText;
- (void)viewDidLoad;
@end

@implementation COSPasscodeInputViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)COSPasscodeInputViewController;
  [(COSPasscodeInputViewController *)&v12 viewDidLoad];
  v3 = [(COSPasscodeInputViewController *)self headerView];
  v4 = [(COSPasscodeInputViewController *)self titleText];
  [v3 setTitle:v4];

  v5 = [(COSPasscodeInputViewController *)self headerView];
  v6 = [(COSPasscodeInputViewController *)self detailText];
  [v5 setDetailText:v6];

  v7 = [(COSPasscodeInputViewController *)self navigationItem];
  [v7 setTitle:&stru_100249230];
  id v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"BACK" value:&stru_100249230 table:@"Localizable"];
  id v11 = [v8 initWithTitle:v10 style:0 target:self action:"back:"];
  [v7 setBackBarButtonItem:v11];
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPasscodeInputViewController controllerAllowsNavigatingBackTo]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)titleText
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPasscodeInputViewController titleText]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)detailText
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPasscodeInputViewController detailText]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)isComplex
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSPasscodeInputViewController isComplex]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

@end