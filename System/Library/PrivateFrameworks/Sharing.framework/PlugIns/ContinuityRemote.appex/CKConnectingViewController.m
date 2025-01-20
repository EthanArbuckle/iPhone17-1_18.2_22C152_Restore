@interface CKConnectingViewController
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CKConnectingViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11.receiver = self;
  v11.super_class = (Class)CKConnectingViewController;
  [(CKConnectingViewController *)&v11 viewDidAppear:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectingLabel);
  v6 = SFLocalizedStringForKey();
  [WeakRetained setText:v6];

  if ([self->super._mainController testFlags])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005C40;
    v8[3] = &unk_10000C480;
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v10 = self;
    v7 = v9;
    dispatch_source_set_event_handler(v7, v8);
    SFDispatchTimerSet();
    dispatch_resume(v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_destroyWeak((id *)&self->_connectingLabel);
}

@end