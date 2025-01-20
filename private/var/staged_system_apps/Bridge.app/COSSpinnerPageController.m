@interface COSSpinnerPageController
- (BOOL)_showInternalTTRPrompt;
- (COSBuddyController)heldPane;
- (COSBuddyControllerDelegate)delegate;
- (COSSpinnerPageController)initWithLabel:(id)a3;
- (NSDate)radarPromptWaitStartDate;
- (NSString)message;
- (NSTimer)radarPromptTimer;
- (UIActivityIndicatorView)spinner;
- (UIAlertController)alertController;
- (UILabel)label;
- (UIView)radarPromptView;
- (void)_radarButtonTapped;
- (void)_showRadarUI;
- (void)back:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeldPane:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRadarPromptTimer:(id)a3;
- (void)setRadarPromptView:(id)a3;
- (void)setRadarPromptWaitStartDate:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSSpinnerPageController

- (COSSpinnerPageController)initWithLabel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSSpinnerPageController;
  v6 = [(COSSpinnerPageController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)COSSpinnerPageController;
  [(COSSpinnerPageController *)&v23 viewDidLoad];
  v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setTextAlignment:1];
  id v5 = self->_label;
  v6 = [(COSSpinnerPageController *)self message];
  [(UILabel *)v5 setText:v6];

  v7 = self->_label;
  v8 = BPSTextColor();
  [(UILabel *)v7 setTextColor:v8];

  objc_super v9 = [(COSSpinnerPageController *)self view];
  [v9 addSubview:self->_label];

  v10 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v10;

  v12 = [(COSSpinnerPageController *)self view];
  [v12 addSubview:self->_spinner];

  if (PBIsInternalInstall()
    && [(COSSpinnerPageController *)self _showInternalTTRPrompt])
  {
    v13 = [(COSSpinnerPageController *)self radarPromptTimer];

    if (v13)
    {
      v14 = [(COSSpinnerPageController *)self radarPromptTimer];
      [v14 invalidate];

      [(COSSpinnerPageController *)self setRadarPromptTimer:0];
    }
    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000BC430;
    v20 = &unk_100246530;
    objc_copyWeak(&v21, &location);
    v15 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v17 block:180.0];
    -[COSSpinnerPageController setRadarPromptTimer:](self, "setRadarPromptTimer:", v15, v17, v18, v19, v20);

    v16 = +[NSDate date];
    [(COSSpinnerPageController *)self setRadarPromptWaitStartDate:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)COSSpinnerPageController;
  [(COSSpinnerPageController *)&v9 viewDidDisappear:a3];
  if (([(COSSpinnerPageController *)self isMovingFromParentViewController] & 1) == 0)
  {
    v4 = [(COSSpinnerPageController *)self navigationController];

    if (v4)
    {
      id v5 = [(COSSpinnerPageController *)self navigationController];
      v6 = [v5 viewControllers];
      id v7 = [v6 mutableCopy];

      if ([v7 containsObject:self])
      {
        [v7 removeObjectIdenticalTo:self];
        v8 = [(COSSpinnerPageController *)self navigationController];
        [v8 setViewControllers:v7 animated:0];
      }
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = [(COSSpinnerPageController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UILabel setFrame:](self->_label, "setFrame:", v5, v7, v9, v11);
  [(UILabel *)self->_label frame];
  [(UILabel *)self->_label setFrame:45.0];
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label frame];
  double v13 = v12;
  double v15 = v14;
  -[UILabel setFrame:](self->_label, "setFrame:");
  [(UIActivityIndicatorView *)self->_spinner frame];
  double v17 = v16;
  double v19 = v18;
  float v20 = v15 + 10.0 + v18;
  float v21 = v11 * 0.5 + (float)(v20 * -0.5);
  double v22 = roundf(v21);
  -[UILabel setFrame:](self->_label, "setFrame:", v13, v18 + v22 + 10.0, v9 + -90.0, v15);
  float v23 = v9 * 0.5 - v17 * 0.5;
  spinner = self->_spinner;
  double v25 = roundf(v23);

  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v25, v22, v17, v19);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  v5.receiver = self;
  v5.super_class = (Class)COSSpinnerPageController;
  [(COSSpinnerPageController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  v5.receiver = self;
  v5.super_class = (Class)COSSpinnerPageController;
  [(COSSpinnerPageController *)&v5 viewWillDisappear:v3];
}

- (void)back:(id)a3
{
  double v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User Backed Out Past a Spinner Waiting Page", buf, 2u);
  }

  double v19 = +[NSBundle mainBundle];
  objc_super v5 = [v19 localizedStringForKey:@"RESET_BUDDY_TITLE" value:&stru_100249230 table:@"Localizable"];
  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"RESET_BUDDY_MESSAGE_%@" value:&stru_100249230 table:@"Localizable"];
  double v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
  double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  double v11 = +[UIAlertController alertControllerWithTitle:v5 message:v10 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v11;

  double v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  double v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&stru_100246550];

  [(UIAlertController *)self->_alertController addAction:v15];
  double v16 = +[NSBundle mainBundle];
  double v17 = [v16 localizedStringForKey:@"CANCEL_RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  double v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:&stru_100246590];

  [(UIAlertController *)self->_alertController addAction:v18];
  [(COSSpinnerPageController *)self presentViewController:self->_alertController animated:1 completion:0];
}

- (BOOL)_showInternalTTRPrompt
{
  return [UIApp isUpdatingGizmoInSetupFlow] ^ 1;
}

- (void)_showRadarUI
{
  BOOL v3 = objc_opt_new();
  [v3 setText:@"Internal: Stuck on this screen?"];
  double v4 = +[UIColor whiteColor];
  v24 = v3;
  [v3 setTextColor:v4];

  objc_super v5 = +[UIButton buttonWithType:1];
  [v5 setTitle:@"File a Radar" forState:0];
  double v6 = +[UIColor systemOrangeColor];
  [v5 setTintColor:v6];

  double v7 = v5;
  float v23 = v5;
  [v5 addTarget:self action:"_radarButtonTapped" forEvents:64];
  double v8 = objc_opt_new();
  [v8 setAxis:1];
  [v8 setAlignment:3];
  [v8 setDistribution:0];
  [v8 setSpacing:8.0];
  [v8 addArrangedSubview:v3];
  [v8 addArrangedSubview:v7];
  [(COSSpinnerPageController *)self setRadarPromptView:v8];
  double v9 = [(COSSpinnerPageController *)self view];
  [v9 addSubview:v8];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  float v21 = [v8 bottomAnchor];
  double v22 = [(COSSpinnerPageController *)self view];
  float v20 = [v22 bottomAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20 constant:-32.0];
  v25[0] = v19;
  double v10 = [v8 leftAnchor];
  double v11 = [(COSSpinnerPageController *)self view];
  double v12 = [v11 leftAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  v25[1] = v13;
  double v14 = [v8 rightAnchor];
  double v15 = [(COSSpinnerPageController *)self view];
  double v16 = [v15 rightAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];
  v25[2] = v17;
  double v18 = +[NSArray arrayWithObjects:v25 count:3];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (void)_radarButtonTapped
{
  v2 = self;
  p_heldPane = &self->_heldPane;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldPane);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_heldPane);
    id v7 = [v6 tapToRadarMetadata];
  }
  else
  {
    id v7 = [objc_alloc((Class)BPSTTRMetadata) initWithComponent:0];
  }
  double v8 = [(COSSpinnerPageController *)v2 radarPromptWaitStartDate];
  [v8 timeIntervalSinceNow];
  double v10 = -v9;

  id v11 = objc_loadWeakRetained((id *)p_heldPane);
  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_heldPane);
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);

    double v15 = +[NSString stringWithFormat:@"Bridge stuck waiting (%.0f sec) for %@ on hold-wait screen", *(void *)&v10, v14];
    [v7 setTitle:v15];

    double v16 = pbb_bridge_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v41 = v10;
      __int16 v42 = 2112;
      v43 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Hold wait TTR button tapped after waiting %.0f seconds for %@", buf, 0x16u);
    }
  }
  else
  {
    double v17 = +[NSString stringWithFormat:@"Bridge stuck waiting (%.0f sec) on hold-wait screen", *(void *)&v10];
    [v7 setTitle:v17];

    double v14 = pbb_bridge_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Hold wait TTR button tapped after waiting %.0f seconds for an unknown pane", buf, 0xCu);
    }
  }

  double v18 = [UIApp setupController];
  double v19 = [v18 internalDashboardController];
  float v20 = [v19 dashboardData];

  float v21 = objc_opt_new();
  double v22 = [v20 pairingEvents];
  if (v22)
  {
    id v33 = v7;
    v34 = v2;
    [v21 appendString:@"———— Pairing metadata:\n"];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v29 = [v28 dashboardKey];
          v30 = [v28 eventValue];
          [v21 appendFormat:@"- %@ : %@\n", v29, v30];
        }
        id v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v25);
    }

    id v7 = v33;
    v2 = v34;
  }
  v31 = [(UILabel *)v2->_label text];
  v32 = +[NSString stringWithFormat:@"Wait message: %@\n\nPlease describe what steps you’ve taken in setup prior to getting stuck on this pane:\n\n%@\n\nIMPORTANT: Please manually grab and attach a sysdiagnose from the Watch you are pairing!", v31, v21];
  [v7 setRadarDescription:v32];

  +[BPSTapToRadarCoordinator openTapToRadarWithInitialMetadata:v7];
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COSBuddyController)heldPane
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldPane);

  return (COSBuddyController *)WeakRetained;
}

- (void)setHeldPane:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (NSTimer)radarPromptTimer
{
  return self->_radarPromptTimer;
}

- (void)setRadarPromptTimer:(id)a3
{
}

- (UIView)radarPromptView
{
  return self->_radarPromptView;
}

- (void)setRadarPromptView:(id)a3
{
}

- (NSDate)radarPromptWaitStartDate
{
  return self->_radarPromptWaitStartDate;
}

- (void)setRadarPromptWaitStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarPromptWaitStartDate, 0);
  objc_storeStrong((id *)&self->_radarPromptView, 0);
  objc_storeStrong((id *)&self->_radarPromptTimer, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_heldPane);

  objc_destroyWeak((id *)&self->_delegate);
}

@end