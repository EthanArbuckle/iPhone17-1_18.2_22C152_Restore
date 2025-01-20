@interface CKPINEntryViewController
- (void)_handlePairingSucceededWithCompletion:(id)a3;
- (void)handlePINEntered:(id)a3;
- (void)handlePasscodeFieldTextChanged;
- (void)handleTap:(id)a3;
- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKPINEntryViewController

- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  [(UIImageView *)self->_checkmarkView setAlpha:0.0];
  [(UIView *)self->_pinEntryView setAlpha:1.0];
  if ((a3 & 0x10000) != 0)
  {
    [(UIView *)self->_pinEntryView size];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000062D8;
    v13[3] = &unk_10000C4A8;
    v13[4] = self;
    *(double *)&v13[5] = v8 * 0.5;
    id v9 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v13 dampingRatio:0.7 animations:0.12];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006338;
    v12[3] = &unk_10000C2A0;
    v12[4] = self;
    [v9 addAnimations:v12 delayFactor:0.01];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006398;
    v10[3] = &unk_10000C4D0;
    v10[4] = self;
    int v11 = a4;
    [v9 addCompletion:v10];
    [v9 startAnimation];
  }
  else
  {
    passcodeField = self->_passcodeField;
    [(TVRPasscodeField *)passcodeField clear];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)CKPINEntryViewController;
  [(CKPINEntryViewController *)&v14 viewWillAppear:v3];
  v5 = SFLocalizedStringForKey();
  [(UILabel *)self->_infoLabel setText:v5];

  v6 = (TVRPasscodeField *)objc_alloc_init(off_1000121B0());
  passcodeField = self->_passcodeField;
  self->_passcodeField = v6;

  [(TVRPasscodeField *)self->_passcodeField setAutoresizingMask:2];
  [(TVRPasscodeField *)self->_passcodeField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TVRPasscodeField *)self->_passcodeField setUseSystemColors:1];
  [(UIView *)self->_pinEntryView addSubview:self->_passcodeField];
  pinEntryView = self->_pinEntryView;
  id v9 = +[NSLayoutConstraint constraintWithItem:self->_passcodeField attribute:3 relatedBy:0 toItem:pinEntryView attribute:3 multiplier:1.0 constant:0.0];
  v15[0] = v9;
  v10 = +[NSLayoutConstraint constraintWithItem:self->_passcodeField attribute:4 relatedBy:0 toItem:self->_pinEntryView attribute:4 multiplier:1.0 constant:0.0];
  v15[1] = v10;
  int v11 = +[NSLayoutConstraint constraintWithItem:self->_passcodeField attribute:1 relatedBy:0 toItem:self->_pinEntryView attribute:1 multiplier:1.0 constant:0.0];
  v15[2] = v11;
  v12 = +[NSLayoutConstraint constraintWithItem:self->_passcodeField attribute:2 relatedBy:0 toItem:self->_pinEntryView attribute:2 multiplier:1.0 constant:0.0];
  v15[3] = v12;
  v13 = +[NSArray arrayWithObjects:v15 count:4];
  [(UIView *)pinEntryView addConstraints:v13];

  [(TVRPasscodeField *)self->_passcodeField addTarget:self action:"handlePasscodeFieldTextChanged" forControlEvents:0x20000];
  [(CKPINEntryViewController *)self showWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  [(TVRPasscodeField *)self->_passcodeField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(TVRPasscodeField *)self->_passcodeField removeTarget:self forEvents:0x20000];
  v5.receiver = self;
  v5.super_class = (Class)CKPINEntryViewController;
  [(CKPINEntryViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)CKPINEntryViewController;
  [(CKPINEntryViewController *)&v5 viewDidAppear:v3];
}

- (void)handlePasscodeFieldTextChanged
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = [(TVRPasscodeField *)self->_passcodeField text];
  if ([v3 length] == (id)4) {
    [(CKPINEntryViewController *)self handlePINEntered:v3];
  }
}

- (void)handlePINEntered:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    id v6 = v4;
    LogPrintF();
  }
  if (objc_msgSend(self->super._mainController, "testFlags", v6))
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006A44;
    handler[3] = &unk_10000C4F8;
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    id v9 = v4;
    v10 = self;
    objc_super v5 = v8;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet();
    dispatch_resume(v5);
  }
  else
  {
    objc_super v5 = [self->super._mainController rafHelper];
    [v5 serverTryPIN:v4];
  }
}

- (void)_handlePairingSucceededWithCompletion:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006C04;
  v8[3] = &unk_10000C2A0;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006C60;
  v6[3] = &unk_10000C520;
  id v7 = v4;
  id v5 = v4;
  +[UIView animateWithDuration:v8 animations:v6 completion:0.4];
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(TVRPasscodeField *)self->_passcodeField becomeFirstResponder];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_pinEntryView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);

  objc_storeStrong((id *)&self->_checkmarkView, 0);
}

@end