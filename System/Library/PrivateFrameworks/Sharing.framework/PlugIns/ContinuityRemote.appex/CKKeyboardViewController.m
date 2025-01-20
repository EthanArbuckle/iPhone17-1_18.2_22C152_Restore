@interface CKKeyboardViewController
- (UITextField)textField;
- (void)doneButtonPressed;
- (void)updatePrompt:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKKeyboardViewController

- (void)doneButtonPressed
{
  if (gLogCategory_ContinuityKeyboard <= 30
    && (gLogCategory_ContinuityKeyboard != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  SFRemoteTextInputPayloadFromLegacyAPI();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = SFTextInputDataForRTIDataPayload();
  v4 = [self->super._mainController riSession];
  [v4 sendPayload:v3];
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
  v5.super_class = (Class)CKKeyboardViewController;
  [(CKKeyboardViewController *)&v5 viewDidAppear:v3];
  [(CRTextField *)self->_textField becomeFirstResponder];
  [self->super._mainController refreshRTI];
  [(CRTextField *)self->_textField reloadInputViews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKKeyboardViewController;
  [(CKKeyboardViewController *)&v7 viewWillAppear:a3];
  [(CRTextField *)self->_textField setKeyboardAppearance:1];
  v4 = [self->super._mainController rtiClient];
  [(CRTextField *)self->_textField setRtiClient:v4];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005FAC;
  v6[3] = &unk_10000C2A0;
  v6[4] = self;
  [(CRTextField *)self->_textField setDoneButtonPressedHandler:v6];
  objc_super v5 = [(CKKeyboardViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRTextField *)self->_textField setRtiClient:0];
  [(CRTextField *)self->_textField setDoneButtonPressedHandler:0];
  v5.receiver = self;
  v5.super_class = (Class)CKKeyboardViewController;
  [(CKKeyboardViewController *)&v5 viewWillDisappear:v3];
}

- (void)updatePrompt:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = v4;
  if (gLogCategory_ContinuityKeyboard <= 30)
  {
    if (gLogCategory_ContinuityKeyboard != -1 || (v4 = (id)_LogCategory_Initialize(), id v5 = v6, v4))
    {
      id v4 = (id)LogPrintF();
      id v5 = v6;
    }
  }
  if (v5) {
    id v4 = [(CRTextField *)self->_textField setPlaceholder:v6];
  }

  _objc_release_x2(v4);
}

- (UITextField)textField
{
  return (UITextField *)self->_textField;
}

- (void).cxx_destruct
{
}

@end