@interface ICStartupDeviceListViewController
- (UIActivityIndicatorView)activityIndicatorView;
- (double)standardFontSize;
- (id)attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5;
- (id)choiceLabels;
- (id)disclaimerStringForCurrentDevice;
- (id)redAsteriskAttributedString;
- (id)redColor;
- (void)applyAccessibilityInfo;
- (void)choiceSelected:(unint64_t)a3;
- (void)didCompleteAction;
- (void)setActivityIndicatorView:(id)a3;
- (void)startIndicatorAnimation;
- (void)stopIndicatorAnimation;
- (void)updateDeviceList;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICStartupDeviceListViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)ICStartupDeviceListViewController;
  [(ICStartupBaseViewController *)&v20 viewDidLoad];
  [(ICStartupDeviceListViewController *)self applyAccessibilityInfo];
  [(ICStartupDeviceListViewController *)self updateDeviceList];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(ICStartupDeviceListViewController *)self setActivityIndicatorView:v3];

  v4 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(ICStartupDeviceListViewController *)self view];
  v6 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  [v5 addSubview:v6];

  v7 = +[NSMutableArray array];
  v8 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  v9 = [v8 centerYAnchor];
  v10 = [(ICStartupDeviceListViewController *)self view];
  v11 = [v10 layoutMarginsGuide];
  v12 = [v11 centerYAnchor];
  v13 = [v9 constraintEqualToAnchor:v12];
  [v7 addObject:v13];

  v14 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  v15 = [v14 centerXAnchor];
  v16 = [(ICStartupDeviceListViewController *)self view];
  v17 = [v16 layoutMarginsGuide];
  v18 = [v17 centerXAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  [v7 addObject:v19];

  +[NSLayoutConstraint activateConstraints:v7];
}

- (double)standardFontSize
{
  v2 = [(ICStartupDeviceListViewController *)self traitCollection];
  if ([v2 horizontalSizeClass] == (id)1) {
    double v3 = 17.0;
  }
  else {
    double v3 = 20.0;
  }

  return v3;
}

- (id)disclaimerStringForCurrentDevice
{
  if (+[UIDevice ic_isiPhone])
  {
    v2 = +[NSBundle mainBundle];
    double v3 = v2;
    CFStringRef v4 = @"Upgraded notes may look different. Notes on this iPhone will also be upgraded.";
  }
  else if (+[UIDevice ic_isiPad])
  {
    v2 = +[NSBundle mainBundle];
    double v3 = v2;
    CFStringRef v4 = @"Upgraded notes may look different. Notes on this iPad will also be upgraded.";
  }
  else
  {
    unsigned int v5 = +[UIDevice ic_isVision];
    v2 = +[NSBundle mainBundle];
    double v3 = v2;
    if (v5) {
      CFStringRef v4 = @"Upgraded notes may look different. Notes on this Vision Pro will also be upgraded.";
    }
    else {
      CFStringRef v4 = @"Upgraded notes may look different. Notes on this device will also be upgraded.";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_10063F3D8 table:0];

  return v6;
}

- (void)updateDeviceList
{
  v2 = [(ICStartupBaseViewController *)self startupNavigationController];
  double v3 = [v2 primaryAccountDevices];

  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableAttributedString);
  unsigned int v5 = +[ICStartupController importantDisclaimerAttributedString];
  [v4 appendAttributedString:v5];

  [v4 ic_appendString:@"\n"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    char v27 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v12 = [v11 name];
        if ([v12 length]
          && ((unint64_t)[v11 notesVersion] & 0x8000000000000000) != 0)
        {
          [v28 addObject:v11];
          v13 = [v11 name];
          v14 = [(ICStartupDeviceListViewController *)self attributedStringWithString:v13 font:0 color:0];
          id v15 = [v14 mutableCopy];

          if (((unint64_t)[v11 maximumNotesVersion] & 0x8000000000000000) != 0)
          {
            id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
            [v15 appendAttributedString:v16];
            v17 = [(ICStartupDeviceListViewController *)self redAsteriskAttributedString];
            [v15 appendAttributedString:v17];

            char v27 = 1;
          }
          if ([v4 length])
          {
            id v18 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
            [v4 appendAttributedString:v18];
          }
          [v4 appendAttributedString:v15];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }
  else
  {
    char v27 = 0;
  }

  v19 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "All Devices Received: %@", buf, 0xCu);
  }

  objc_super v20 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v28;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Non-Upgraded Devices: %@", buf, 0xCu);
  }

  [v4 ic_appendString:@"\n"];
  if (v27)
  {
    v21 = [(ICStartupDeviceListViewController *)self redAsteriskAttributedString];
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@" Device can’t be upgraded." value:&stru_10063F3D8 table:0];
    v24 = [(ICStartupDeviceListViewController *)self attributedStringWithString:v23 font:0 color:0];

    [v21 appendAttributedString:v24];
    [v4 ic_appendString:@"\n"];
    [v4 appendAttributedString:v21];
  }
  v25 = [(ICStartupDeviceListViewController *)self headerView];
  v26 = [v4 string];
  [v25 setDetailText:v26];
}

- (id)attributedStringWithString:(id)a3 font:(id)a4 color:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    [(ICStartupDeviceListViewController *)self standardFontSize];
    id v16 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    [v16 ic_fontWithSingleLineA];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v11) {
      goto LABEL_3;
    }
  }
  v11 = +[UIColor labelColor];
LABEL_3:
  id v12 = objc_alloc((Class)NSAttributedString);
  v17[0] = NSFontAttributeName;
  v17[1] = NSForegroundColorAttributeName;
  v18[0] = v9;
  v18[1] = v11;
  v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v14 = [v12 initWithString:v8 attributes:v13];

  return v14;
}

- (id)redAsteriskAttributedString
{
  double v3 = [(ICStartupDeviceListViewController *)self redColor];
  id v4 = [(ICStartupDeviceListViewController *)self attributedStringWithString:@"*" font:0 color:v3];
  id v5 = [v4 mutableCopy];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICStartupDeviceListViewController;
  [(ICStartupDeviceListViewController *)&v6 viewWillAppear:a3];
  id v4 = [(ICStartupDeviceListViewController *)self navigationItem];
  [v4 setHidesBackButton:1];

  id v5 = [(ICStartupDeviceListViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:0];
}

- (id)redColor
{
  return +[UIColor colorWithRed:1.0 green:0.235294118 blue:0.0784313725 alpha:1.0];
}

- (void)didCompleteAction
{
  id v2 = [(ICStartupBaseViewController *)self startupNavigationController];
  [v2 dismiss];
}

- (void)startIndicatorAnimation
{
  id v2 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  [v2 startAnimating];
}

- (void)stopIndicatorAnimation
{
  [(ICStartupDeviceListViewController *)self updateDeviceList];
  id v3 = [(ICStartupDeviceListViewController *)self activityIndicatorView];
  [v3 stopAnimating];
}

- (void)applyAccessibilityInfo
{
  id v2 = [(ICStartupDeviceListViewController *)self view];
  [v2 setAccessibilityViewIsModal:1];
}

- (id)choiceLabels
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Upgrade Now" value:&stru_10063F3D8 table:0];
  v8[0] = v3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Upgrade Later" value:&stru_10063F3D8 table:0];
  v8[1] = v5;
  objc_super v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)choiceSelected:(unint64_t)a3
{
  id v5 = [(ICStartupBaseViewController *)self startupNavigationController];
  objc_super v6 = v5;
  if (a3)
  {
    [v5 noUpgradeAction];

    id v7 = [(ICStartupBaseViewController *)self startupNavigationController];
    [v7 dismiss];
  }
  else
  {
    [v5 upgradeAction];

    [(ICStartupDeviceListViewController *)self didCompleteAction];
  }
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return *(UIActivityIndicatorView **)(&self->super + 1);
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end