@interface COSPasskeyEntryViewController
- (COSPasskeyEntryViewController)init;
- (COSPinKeyView)pinKeyView;
- (NSTimer)textChangedTimer;
- (UIActivityIndicatorView)activityView;
- (UILabel)instructionLabel;
- (UITextField)passkeyField;
- (void)returnToPasskeyEntry;
- (void)setActivityView:(id)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setPasskeyField:(id)a3;
- (void)setPinKeyView:(id)a3;
- (void)setTextChangedTimer:(id)a3;
- (void)textDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation COSPasskeyEntryViewController

- (COSPasskeyEntryViewController)init
{
  v26.receiver = self;
  v26.super_class = (Class)COSPasskeyEntryViewController;
  v2 = [(COSPasskeyEntryViewController *)&v26 init];
  if (v2)
  {
    v3 = -[COSPinKeyView initWithFrame:]([COSPinKeyView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    pinKeyView = v2->_pinKeyView;
    v2->_pinKeyView = v3;

    v5 = (UITextField *)objc_alloc_init((Class)UITextField);
    passkeyField = v2->_passkeyField;
    v2->_passkeyField = v5;

    v7 = v2->_passkeyField;
    v8 = BPSTextColor();
    [(UITextField *)v7 setTextColor:v8];

    v9 = v2->_passkeyField;
    v10 = +[UIFont systemFontOfSize:20.0];
    [(UITextField *)v9 setFont:v10];

    [(UITextField *)v2->_passkeyField setDelegate:v2];
    [(UITextField *)v2->_passkeyField setSecureTextEntry:1];
    [(UITextField *)v2->_passkeyField setKeyboardType:4];
    [(UITextField *)v2->_passkeyField setHidden:1];
    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    instructionLabel = v2->_instructionLabel;
    v2->_instructionLabel = v11;

    [(UILabel *)v2->_instructionLabel setNumberOfLines:0];
    v13 = v2->_instructionLabel;
    v14 = BPSTextColor();
    [(UILabel *)v13 setTextColor:v14];

    v15 = v2->_instructionLabel;
    v16 = +[UIFont systemFontOfSize:20.0];
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v2->_instructionLabel setTextAlignment:1];
    v17 = v2->_instructionLabel;
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"PINKEY_INSTRUCTIONS_%@" value:&stru_100249230 table:@"Localizable"];
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v21);
    [(UILabel *)v17 setText:v22];

    v23 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    activityView = v2->_activityView;
    v2->_activityView = v23;

    [(UIActivityIndicatorView *)v2->_activityView setAlpha:0.0];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSPasskeyEntryViewController;
  [(COSPasskeyEntryViewController *)&v5 viewWillAppear:a3];
  [(UITextField *)self->_passkeyField becomeFirstResponder];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"textDidChange:" name:UITextFieldTextDidChangeNotification object:self->_passkeyField];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSPasskeyEntryViewController;
  [(COSPasskeyEntryViewController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UITextFieldTextDidChangeNotification object:self->_passkeyField];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)COSPasskeyEntryViewController;
  [(COSPasskeyEntryViewController *)&v9 viewDidLoad];
  v3 = [(COSPasskeyEntryViewController *)self view];
  [v3 addSubview:self->_instructionLabel];

  v4 = [(COSPasskeyEntryViewController *)self view];
  [v4 addSubview:self->_passkeyField];

  objc_super v5 = [(COSPasskeyEntryViewController *)self view];
  [v5 addSubview:self->_pinKeyView];

  v6 = [(COSPasskeyEntryViewController *)self view];
  [v6 addSubview:self->_activityView];

  v7 = [(COSPasskeyEntryViewController *)self view];
  v8 = BPSBackgroundColor();
  [v7 setBackgroundColor:v8];
}

- (void)viewWillLayoutSubviews
{
  v3 = [(COSPasskeyEntryViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat rect_16 = v8;
  CGFloat v11 = v10;

  v12 = [(COSPasskeyEntryViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = v13;

  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  CGFloat v15 = CGRectGetWidth(v32) + -36.0;
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", v15, 0.0);
  CGFloat v17 = v16;
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:", 18.0, v14 + 80.0, v15, v16);
  passkeyField = self->_passkeyField;
  v33.origin.x = 18.0;
  v33.origin.y = v14 + 80.0;
  v33.size.width = v15;
  v33.size.height = v17;
  CGFloat v19 = CGRectGetMaxY(v33) + 30.0;
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = rect_16;
  v34.size.height = v11;
  -[UITextField setFrame:](passkeyField, "setFrame:", 18.0, v19, CGRectGetWidth(v34) + -36.0);
  v35.origin.x = 18.0;
  v35.origin.y = v14 + 80.0;
  v35.size.width = v15;
  v35.size.height = v17;
  CGFloat v20 = CGRectGetMaxY(v35) + 30.0;
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = rect_16;
  v36.size.height = v11;
  CGFloat v21 = CGRectGetWidth(v36) + -50.0;
  -[COSPinKeyView setFrame:](self->_pinKeyView, "setFrame:", 25.0, v20, v21, 50.0);
  -[UIActivityIndicatorView sizeThatFits:](self->_activityView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v23 = v22;
  double v25 = v24;
  activityView = self->_activityView;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = rect_16;
  v37.size.height = v11;
  float v27 = (CGRectGetWidth(v37) - v23) * 0.5;
  double v28 = floorf(v27);
  v38.origin.x = 25.0;
  v38.origin.y = v20;
  v38.size.width = v21;
  v38.size.height = 50.0;
  double MinY = CGRectGetMinY(v38);

  -[UIActivityIndicatorView setFrame:](activityView, "setFrame:", v28, MinY, v23, v25);
}

- (void)textDidChange:(id)a3
{
  double v4 = [(UITextField *)self->_passkeyField text];
  id v5 = [v4 length];

  pinKeyView = self->_pinKeyView;
  CGFloat v7 = [(UITextField *)self->_passkeyField text];
  [(COSPinKeyView *)pinKeyView setDigits:v7];

  [(COSPinKeyView *)self->_pinKeyView setCodeLength:v5];
  double v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v9 = [(UITextField *)self->_passkeyField text];
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passkey Text Did Change: (%@)", buf, 0xCu);
  }
  if (v5 == (id)6)
  {
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:UITextFieldTextDidChangeNotification object:self->_passkeyField];

    CGFloat v11 = [(UITextField *)self->_passkeyField text];
    [(COSPasskeyEntryViewController *)self enteredPasskey:v11];

    v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = [(UITextField *)self->_passkeyField text];
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Passkey Entered: (%@)", buf, 0xCu);
    }
    [(UITextField *)self->_passkeyField resignFirstResponder];
    [(UITextField *)self->_passkeyField setEnabled:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100072914;
    v16[3] = &unk_1002438A0;
    v16[4] = self;
    +[UIView animateWithDuration:v16 animations:0.25];
    double v14 = [(COSPasskeyEntryViewController *)self navigationItem];
    CGFloat v15 = [v14 rightBarButtonItem];
    [v15 setEnabled:0];
  }
}

- (void)returnToPasskeyEntry
{
  [(UITextField *)self->_passkeyField setText:&stru_100249230];
  [(COSPasskeyEntryViewController *)self textDidChange:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100072A6C;
  v4[3] = &unk_1002438A0;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100072AC8;
  v3[3] = &unk_100244CE0;
  v3[4] = self;
  +[UIView animateWithDuration:v4 animations:v3 completion:0.25];
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (COSPinKeyView)pinKeyView
{
  return self->_pinKeyView;
}

- (void)setPinKeyView:(id)a3
{
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UITextField)passkeyField
{
  return self->_passkeyField;
}

- (void)setPasskeyField:(id)a3
{
}

- (NSTimer)textChangedTimer
{
  return self->_textChangedTimer;
}

- (void)setTextChangedTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textChangedTimer, 0);
  objc_storeStrong((id *)&self->_passkeyField, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_pinKeyView, 0);

  objc_storeStrong((id *)&self->_instructionLabel, 0);
}

@end