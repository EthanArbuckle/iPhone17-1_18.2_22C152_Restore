@interface UIViewController
- (void)_showInternalSettings;
- (void)is_addGestureRecognizer;
@end

@implementation UIViewController

- (void)is_addGestureRecognizer
{
  if (PBIsInternalInstall())
  {
    v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Internal build: Adding LongPress gesture recognizer.", v6, 2u);
    }

    id v4 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_showInternalSettings"];
    [v4 setNumberOfTouchesRequired:2];
    [v4 setMinimumPressDuration:5.0];
    v5 = [(UIViewController *)self view];
    [v5 addGestureRecognizer:v4];
  }
}

- (void)_showInternalSettings
{
  id v3 = +[COSInternalSettingsViewController internalSettingsViewController];
  [(UIViewController *)self presentViewController:v3 animated:1 completion:&stru_100247D60];
}

@end