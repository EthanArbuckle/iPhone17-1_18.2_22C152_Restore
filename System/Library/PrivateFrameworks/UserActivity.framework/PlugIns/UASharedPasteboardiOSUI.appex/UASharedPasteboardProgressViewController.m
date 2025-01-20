@interface UASharedPasteboardProgressViewController
+ (void)initialize;
- (SFProgressAlertView)progressView;
- (void)_configureProgressView;
- (void)loadView;
- (void)setProgressView:(id)a3;
@end

@implementation UASharedPasteboardProgressViewController

+ (void)initialize
{
  v2 = os_log_create("com.apple.useractivity", "SPBProgressUI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Initalize iOS progress view controller", v3, 2u);
  }
}

- (void)_configureProgressView
{
  v3 = [SFProgressAlertView alloc];
  v4 = [(UASharedPasteboardProgressViewController *)self view];
  [v4 frame];
  v5 = -[SFProgressAlertView initWithFrame:](v3, "initWithFrame:");

  v6 = [(UASharedPasteboardProgressViewController *)self view];
  [v6 addSubview:v5];

  [(SFProgressAlertView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(UASharedPasteboardProgressViewController *)self view];
  [v7 addSubview:v5];

  v8 = [(UASharedPasteboardProgressViewController *)self view];
  v9 = _NSDictionaryOfVariableBindings(@"progressView", v5, 0);
  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[progressView]|" options:0 metrics:0 views:v9];
  [v8 addConstraints:v10];

  v11 = [(UASharedPasteboardProgressViewController *)self view];
  CFStringRef v20 = @"padding";
  v21 = &off_1000084F8;
  v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v13 = _NSDictionaryOfVariableBindings(@"progressView", v5, 0);
  v14 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[progressView]-padding-|" options:0 metrics:v12 views:v13];
  [v11 addConstraints:v14];

  [(SFProgressAlertView *)v5 bounds];
  double v16 = v15;
  [(SFProgressAlertView *)v5 bounds];
  double v18 = v17;
  [&off_1000084F8 floatValue];
  -[UASharedPasteboardProgressViewController setPreferredContentSize:](self, "setPreferredContentSize:", v16, v18 + v19);
  [(UASharedPasteboardProgressViewController *)self setProgressView:v5];
}

- (void)loadView
{
  v3 = os_log_create("com.apple.useractivity", "SPBProgressUI");
  v6.receiver = self;
  v6.super_class = (Class)UASharedPasteboardProgressViewController;
  [(UASharedPasteboardProgressViewController *)&v6 loadView];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating iOS progress UI", v5, 2u);
  }
  id v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(UASharedPasteboardProgressViewController *)self setView:v4];
  [(UASharedPasteboardProgressViewController *)self _configureProgressView];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Added iOS progress UI view", v5, 2u);
  }
}

- (SFProgressAlertView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end