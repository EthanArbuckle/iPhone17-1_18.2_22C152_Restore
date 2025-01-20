@interface COSActivationViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (COSActivationViewController)init;
- (COSBuddyControllerDelegate)delegate;
- (UIActivityIndicatorView)spinner;
- (UILabel)infoLabel;
- (void)back:(id)a3;
- (void)checkActivationState;
- (void)completedActivation:(id)a3;
- (void)enteredCompatibilityState:(id)a3;
- (void)postProcessActivation;
- (void)setDelegate:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setSpinner:(id)a3;
- (void)startActivating;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)waitForCompatibilityUpdateState;
@end

@implementation COSActivationViewController

- (COSActivationViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSActivationViewController;
  v2 = [(COSActivationViewController *)&v6 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v4 = [v3 compatibilityState];

    if (v4 == 2) {
      [(COSActivationViewController *)v2 startActivating];
    }
    else {
      [(COSActivationViewController *)v2 waitForCompatibilityUpdateState];
    }
  }
  return v2;
}

- (void)postProcessActivation
{
  v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[COSActivationViewController postProcessActivation]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = [UIApp setupController];
  unsigned int v4 = [UIApp setupController];
  v5 = [v4 activationManager];

  if ([v5 awaitingActivation] && objc_msgSend(v5, "didPresentFlow"))
  {
    [v3 popRUIObject:0 animated:0];
    [v5 setAwaitingActivation:0];
  }
  [v3 popControllerAnimated:0];
}

- (void)waitForCompatibilityUpdateState
{
  v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting for compatibility state", v5, 2u);
  }

  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
}

- (void)startActivating
{
  v2 = pbb_activation_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting activation", v4, 2u);
  }

  v3 = [UIApp bridgeController];
  [v3 tellGizmoToBeginActivation];
}

- (void)completedActivation:(id)a3
{
  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  [(COSActivationViewController *)self postProcessActivation];
}

- (void)checkActivationState
{
  if ([UIApp isActivated])
  {
    [(COSActivationViewController *)self postProcessActivation];
  }
  else
  {
    v3 = pbb_activation_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Awaiting activation", v7, 2u);
    }

    unsigned int v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"completedActivation:" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

    v5 = [UIApp setupController];
    int v6 = [v5 activationManager];
    [v6 awaitActivationWhileHoldingFlow:0];
  }
}

- (void)enteredCompatibilityState:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned __int16 v6 = (unsigned __int16)[v5 unsignedIntValue];

  v7 = pbb_activation_log();
  int v8 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entered compatibility state: %lu", (uint8_t *)&v13, 0xCu);
  }

  if (v6 == 2
    || (([UIApp setupController],
         v9 = objc_claimAutoreleasedReturnValue(),
         unsigned int v10 = [v9 shouldForceSoftwareUpdateCheck],
         v9,
         v8 == 3)
      ? (BOOL v11 = v10 == 0)
      : (BOOL v11 = 1),
        !v11))
  {
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    [(COSActivationViewController *)self startActivating];
  }
}

- (void)back:(id)a3
{
  v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User Backed Out of Activation pane", buf, 2u);
  }

  unsigned int v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"RESET_BUDDY_TITLE" value:&stru_100249230 table:@"Localizable"];
  unsigned __int16 v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"RESET_BUDDY_MESSAGE_%@" value:&stru_100249230 table:@"Localizable"];
  int v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
  unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  BOOL v11 = +[UIAlertController alertControllerWithTitle:v5 message:v10 preferredStyle:1];

  v12 = +[NSBundle mainBundle];
  int v13 = [v12 localizedStringForKey:@"RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:&stru_100247450];

  [v11 addAction:v14];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"CANCEL_RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:&stru_100247470];

  [v11 addAction:v17];
  v18 = pbb_activation_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "'Reset buddy?' alert presented", v20, 2u);
  }

  [(COSActivationViewController *)self presentViewController:v11 animated:1 completion:0];
}

+ (BOOL)controllerNeedsToRun
{
  return [UIApp isActivated] ^ 1;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)COSActivationViewController;
  [(COSActivationViewController *)&v34 viewDidLoad];
  v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  infoLabel = self->_infoLabel;
  self->_infoLabel = v3;

  v5 = self->_infoLabel;
  unsigned __int16 v6 = +[UIColor clearColor];
  [(UILabel *)v5 setBackgroundColor:v6];

  v7 = self->_infoLabel;
  int v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"ACTIVATION_TIME" value:&stru_100249230 table:@"Localizable"];
  [(UILabel *)v7 setText:v9];

  unsigned int v10 = self->_infoLabel;
  BOOL v11 = BPSTextColor();
  [(UILabel *)v10 setTextColor:v11];

  [(UILabel *)self->_infoLabel setTextAlignment:1];
  [(UILabel *)self->_infoLabel setNumberOfLines:0];
  v35 = &off_10025C2E0;
  v36 = &off_10025C450;
  v12 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  __asm
  {
    FMOV            V0.2D, #14.0
    FMOV            V1.2D, #16.0
  }
  *(_OWORD *)location = _Q0;
  long long v31 = _Q1;
  long long v32 = _Q1;
  long long v33 = _Q1;
  BPSScreenValueGetRelevantZoomValue();
  double v20 = v19;

  v21 = self->_infoLabel;
  v22 = +[UIFont systemFontOfSize:v20];
  [(UILabel *)v21 setFont:v22];

  v23 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v23;

  v25 = [(COSActivationViewController *)self view];
  [v25 addSubview:self->_spinner];

  v26 = [(COSActivationViewController *)self view];
  [v26 addSubview:self->_infoLabel];

  objc_initWeak(location, self);
  dispatch_time_t v27 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109D3C;
  block[3] = &unk_1002439E0;
  objc_copyWeak(&v29, location);
  dispatch_after(v27, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSActivationViewController;
  [(COSActivationViewController *)&v4 viewWillAppear:a3];
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)COSActivationViewController;
  [(COSActivationViewController *)&v21 viewDidLayoutSubviews];
  v3 = [(COSActivationViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(UIActivityIndicatorView *)self->_spinner frame];
  double v11 = v10;
  double v13 = v12;
  -[UILabel setFrame:](self->_infoLabel, "setFrame:", 50.0, v5, v7 + -100.0, v9);
  [(UILabel *)self->_infoLabel sizeToFit];
  [(UILabel *)self->_infoLabel frame];
  float v15 = v13 + v14 + 10.0;
  float v16 = v9 * 0.5 + (float)(v15 * -0.5);
  *(float *)&double v9 = roundf(v16);
  double v17 = v7 * 0.5;
  float v19 = v17 - v18 * 0.5;
  -[UILabel setFrame:](self->_infoLabel, "setFrame:", roundf(v19), v13 + (float)(*(float *)&v9 + 10.0));
  float v20 = v17 - v11 * 0.5;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", roundf(v20), *(float *)&v9, v11, v13);
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end