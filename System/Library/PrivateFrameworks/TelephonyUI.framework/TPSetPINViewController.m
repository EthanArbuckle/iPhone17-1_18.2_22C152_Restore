@interface TPSetPINViewController
- (BOOL)confirmPIN;
- (BOOL)wantsFullScreenLayout;
- (NSString)oldPIN;
- (NSString)promptTextForConfirmingNewPIN;
- (NSString)promptTextForNewPIN;
- (NSString)promptTextForOldPIN;
- (NSString)promptTextForSavingPIN;
- (NSString)unconfirmedPIN;
- (TPPasscodeView)passcodeView;
- (TPSetPINViewController)init;
- (TPSetPINViewControllerDelegate)delegate;
- (TPSimpleNumberPad)numberPad;
- (UILabel)statusLabel;
- (UIView)customBackgroundView;
- (double)numberPadTopConstraintConstant;
- (id)_initForMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5;
- (id)initForChangePINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5;
- (id)initForNewPINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5;
- (int)initialState;
- (int)state;
- (unsigned)maxPINLength;
- (unsigned)minPINLength;
- (void)_cancelButtonTapped;
- (void)_doneButtonTapped;
- (void)_updateDeleteAllowed;
- (void)_updateNavBarButtons;
- (void)_updateStatusLabel;
- (void)_updateUIForStateChange;
- (void)dealloc;
- (void)loadView;
- (void)resetWithErrorPrompt:(id)a3;
- (void)resetWithErrorPrompt:(id)a3 title:(id)a4;
- (void)setConfirmPIN:(BOOL)a3;
- (void)setCustomBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialState:(int)a3;
- (void)setMaxPINLength:(unsigned int)a3;
- (void)setMinPINLength:(unsigned int)a3;
- (void)setNumberPad:(id)a3;
- (void)setOldPIN:(id)a3;
- (void)setPasscodeView:(id)a3;
- (void)setPromptTextForConfirmingNewPIN:(id)a3;
- (void)setPromptTextForNewPIN:(id)a3;
- (void)setPromptTextForOldPIN:(id)a3;
- (void)setPromptTextForSavingPIN:(id)a3;
- (void)setState:(int)a3;
- (void)setStatusLabel:(id)a3;
- (void)setUnconfirmedPIN:(id)a3;
- (void)simpleNumberPad:(id)a3 buttonPressedWithCharacter:(id)a4;
- (void)simpleNumberPadDeletePressed:(id)a3;
@end

@implementation TPSetPINViewController

- (TPSetPINViewController)init
{
  v4 = [NSString stringWithFormat:@"Please don't call -[PHVoicemailSetupPinViewController init]"];
  NSLog(&cfstr_TuassertionFai.isa, v4);

  if (_TUAssertShouldCrashApplication())
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"TPSetPINViewController.m" lineNumber:72 description:@"Please don't call -[PHVoicemailSetupPinViewController init]"];
  }
  return 0;
}

- (id)_initForMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  if (a3 <= a4)
  {
    BOOL v12 = a5;
    v21.receiver = self;
    v21.super_class = (Class)TPSetPINViewController;
    v11 = [(TPSetPINViewController *)&v21 init];
    if (v11)
    {
      v13 = TelephonyUIBundle();
      v14 = [v13 localizedStringForKey:@"PASSWORD" value:&stru_1F1E807C8 table:@"General"];
      v15 = [(TPSetPINViewController *)v11 navigationItem];
      [v15 setTitle:v14];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v11 action:sel__doneButtonTapped];
      v17 = [(TPSetPINViewController *)v11 navigationItem];
      [v17 setRightBarButtonItem:v16];

      v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v11 action:sel__cancelButtonTapped];
      v19 = [(TPSetPINViewController *)v11 navigationItem];
      [v19 setLeftBarButtonItem:v18];

      [(TPSetPINViewController *)v11 setMinPINLength:v6];
      [(TPSetPINViewController *)v11 setMaxPINLength:v5];
      [(TPSetPINViewController *)v11 setConfirmPIN:v12];
    }
  }
  else
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Min PIN length of %u exceeds max PIN length of %u.", *(void *)&a3, *(void *)&a4);
    NSLog(&cfstr_TuassertionFai.isa, v9);

    if (_TUAssertShouldCrashApplication())
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TPSetPINViewController.m", 77, @"Min PIN length of %u exceeds max PIN length of %u.", v6, v5);
    }
    return 0;
  }
  return v11;
}

- (id)initForNewPINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  id v5 = [(TPSetPINViewController *)self _initForMinLength:*(void *)&a3 maxLength:*(void *)&a4 confirmPIN:a5];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setInitialState:1];
  }
  return v6;
}

- (id)initForChangePINWithMinLength:(unsigned int)a3 maxLength:(unsigned int)a4 confirmPIN:(BOOL)a5
{
  id v5 = [(TPSetPINViewController *)self _initForMinLength:*(void *)&a3 maxLength:*(void *)&a4 confirmPIN:a5];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setInitialState:0];
  }
  return v6;
}

- (void)dealloc
{
  [(TPSimpleNumberPad *)self->_numberPad setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)TPSetPINViewController;
  [(TPSetPINViewController *)&v3 dealloc];
}

- (void)loadView
{
  v42.receiver = self;
  v42.super_class = (Class)TPSetPINViewController;
  [(TPSetPINViewController *)&v42 loadView];
  objc_super v3 = [(TPSetPINViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] dynamicBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [TPSetPINKeyPadNumberPad alloc];
  uint64_t v6 = [(TPSetPINViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  BOOL v12 = -[TPSimpleNumberPad initWithFrame:style:](v5, "initWithFrame:style:", v7, *MEMORY[0x1E4F1DB28], v9, v10, v11);

  [(TPSetPINKeyPadNumberPad *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [(TPSetPINKeyPadNumberPad *)v12 setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(TPSetPINKeyPadNumberPad *)v12 setContentCompressionResistancePriority:1 forAxis:v14];
  LODWORD(v15) = 1148846080;
  [(TPSetPINKeyPadNumberPad *)v12 setContentHuggingPriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(TPSetPINKeyPadNumberPad *)v12 setContentHuggingPriority:1 forAxis:v16];
  [(TPSimpleNumberPad *)v12 setDelegate:self];
  [v3 addSubview:v12];
  [(TPSetPINViewController *)self setNumberPad:v12];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
  [v17 setNumberOfLines:2];
  [v17 setTextAlignment:1];
  v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [v17 setFont:v18];

  v19 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
  [v17 setTextColor:v19];

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v20) = 1132068864;
  [v17 setContentCompressionResistancePriority:0 forAxis:v20];
  LODWORD(v21) = 1148846080;
  [v17 setContentCompressionResistancePriority:1 forAxis:v21];
  [v3 addSubview:v17];
  [(TPSetPINViewController *)self setStatusLabel:v17];
  v22 = -[TPPasscodeView initWithFrame:]([TPPasscodeView alloc], "initWithFrame:", v8, v9, v10, v11);
  [(TPPasscodeView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v23) = 1148846080;
  [(TPPasscodeView *)v22 setContentCompressionResistancePriority:0 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [(TPPasscodeView *)v22 setContentCompressionResistancePriority:1 forAxis:v24];
  v25 = [MEMORY[0x1E4FB1618] blackColor];
  [(TPPasscodeView *)v22 setBackgroundColor:v25];

  [v3 addSubview:v22];
  [(TPSetPINViewController *)self setPasscodeView:v22];
  v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v17 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v26];

  v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:v17 attribute:5 relatedBy:1 toItem:v3 attribute:5 multiplier:1.0 constant:27.0];
  [v3 addConstraint:v27];

  v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:v17 attribute:6 relatedBy:-1 toItem:v3 attribute:6 multiplier:1.0 constant:-27.0];
  [v3 addConstraint:v28];

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
  int v31 = [v30 isUserInterfaceIdiomPad];
  double v33 = 79.0;
  if (!v31) {
    double v33 = 109.0;
  }
  LODWORD(v32) = 1144750080;
  v34 = [v29 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:v33 priority:v32];
  [v3 addConstraint:v34];

  v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v35];

  LODWORD(v36) = 1148846080;
  v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:3 relatedBy:0 toItem:v17 attribute:11 multiplier:1.0 constant:14.0 priority:v36];
  [v3 addConstraint:v37];

  v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v38];

  v39 = (void *)MEMORY[0x1E4F28DC8];
  [(TPSetPINViewController *)self numberPadTopConstraintConstant];
  v41 = [v39 constraintWithItem:v12 attribute:3 relatedBy:0 toItem:v22 attribute:4 multiplier:1.0 constant:v40];
  [v3 addConstraint:v41];

  [(TPSetPINViewController *)self setState:[(TPSetPINViewController *)self initialState]];
  [(TPSetPINViewController *)self _updateUIForStateChange];
}

- (double)numberPadTopConstraintConstant
{
  double result = *(double *)&numberPadTopConstraintConstant_topConstraintConstant;
  if (*(double *)&numberPadTopConstraintConstant_topConstraintConstant == 0.0)
  {
    numberPadTopConstraintConstant_topConstraintConstant = 0x404E000000000000;
    objc_super v3 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", result);
    if ([v3 screenSizeCategory] == 1)
    {

LABEL_5:
      numberPadTopConstraintConstant_topConstraintConstant = 0x4034000000000000;
      return 20.0;
    }
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    char v5 = [v4 isUserInterfaceIdiomPad];

    if (v5) {
      goto LABEL_5;
    }
    return *(double *)&numberPadTopConstraintConstant_topConstraintConstant;
  }
  return result;
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (void)resetWithErrorPrompt:(id)a3
{
}

- (void)resetWithErrorPrompt:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6)
  {
    double v9 = (void *)MEMORY[0x1E4FB1418];
    if ([v7 length])
    {
      double v10 = [v9 alertControllerWithTitle:v8 message:v6 preferredStyle:1];
    }
    else
    {
      double v11 = TelephonyUIBundle();
      BOOL v12 = [v11 localizedStringForKey:@"ERROR" value:&stru_1F1E807C8 table:@"General"];
      double v10 = [v9 alertControllerWithTitle:v12 message:v6 preferredStyle:1];
    }
    double v13 = (void *)MEMORY[0x1E4FB1410];
    double v14 = TelephonyUIBundle();
    double v15 = [v14 localizedStringForKey:@"OK" value:&stru_1F1E807C8 table:@"General"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__TPSetPINViewController_resetWithErrorPrompt_title___block_invoke;
    v17[3] = &unk_1E647C410;
    v17[4] = self;
    double v16 = [v13 actionWithTitle:v15 style:0 handler:v17];
    [v10 addAction:v16];

    [(TPSetPINViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    [(TPSetPINViewController *)self setState:[(TPSetPINViewController *)self initialState]];
  }
}

uint64_t __53__TPSetPINViewController_resetWithErrorPrompt_title___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) initialState];
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 setState:v2];
}

- (void)setPromptTextForOldPIN:(id)a3
{
  char v5 = (NSString *)a3;
  if (!v5
    || ([(TPSetPINViewController *)self promptTextForOldPIN],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(TPSetPINViewController *)self promptTextForOldPIN];
    int v6 = [v7 isEqualToString:v5] ^ 1;

    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 1;
  }

LABEL_6:
  promptTextForOldPIN = self->_promptTextForOldPIN;
  self->_promptTextForOldPIN = v5;

  if (v6)
  {
    [(TPSetPINViewController *)self _updateStatusLabel];
  }
}

- (void)setPromptTextForNewPIN:(id)a3
{
  char v5 = (NSString *)a3;
  if (!v5
    || ([(TPSetPINViewController *)self promptTextForNewPIN],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(TPSetPINViewController *)self promptTextForNewPIN];
    int v6 = [v7 isEqualToString:v5] ^ 1;

    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 1;
  }

LABEL_6:
  promptTextForNewPIN = self->_promptTextForNewPIN;
  self->_promptTextForNewPIN = v5;

  if (v6)
  {
    [(TPSetPINViewController *)self _updateStatusLabel];
  }
}

- (void)setPromptTextForConfirmingNewPIN:(id)a3
{
  char v5 = (NSString *)a3;
  if (!v5
    || ([(TPSetPINViewController *)self promptTextForConfirmingNewPIN],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(TPSetPINViewController *)self promptTextForConfirmingNewPIN];
    int v6 = [v7 isEqualToString:v5] ^ 1;

    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 1;
  }

LABEL_6:
  promptTextForConfirmingNewPIN = self->_promptTextForConfirmingNewPIN;
  self->_promptTextForConfirmingNewPIN = v5;

  if (v6)
  {
    [(TPSetPINViewController *)self _updateStatusLabel];
  }
}

- (void)setPromptTextForSavingPIN:(id)a3
{
  char v5 = (NSString *)a3;
  if (!v5
    || ([(TPSetPINViewController *)self promptTextForSavingPIN],
        (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(TPSetPINViewController *)self promptTextForSavingPIN];
    int v6 = [v7 isEqualToString:v5] ^ 1;

    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 1;
  }

LABEL_6:
  promptTextForSavingPIN = self->_promptTextForSavingPIN;
  self->_promptTextForSavingPIN = v5;

  if (v6)
  {
    [(TPSetPINViewController *)self _updateStatusLabel];
  }
}

- (void)_doneButtonTapped
{
  int v3 = [(TPSetPINViewController *)self state];
  if (v3 == 2)
  {
    double v8 = [(TPSetPINViewController *)self passcodeView];
    id v20 = [v8 passcodeString];

    double v9 = [(TPSetPINViewController *)self unconfirmedPIN];
    int v10 = [v20 isEqualToString:v9];

    if (v10)
    {
      [(TPSetPINViewController *)self setState:3];
      double v11 = [(TPSetPINViewController *)self delegate];

      if (!v11) {
        goto LABEL_19;
      }
      BOOL v12 = [(TPSetPINViewController *)self delegate];
      double v13 = [(TPSetPINViewController *)self oldPIN];
      double v14 = [(TPSetPINViewController *)self unconfirmedPIN];
      [v12 setPINViewControllerFinished:self success:1 oldPIN:v13 newPIN:v14];
    }
    else
    {
      BOOL v12 = TelephonyUIBundle();
      double v13 = [v12 localizedStringForKey:@"MISMATCH" value:&stru_1F1E807C8 table:@"General"];
      double v14 = TelephonyUIBundle();
      v18 = [v14 localizedStringForKey:@"ERROR" value:&stru_1F1E807C8 table:@"General"];
      [(TPSetPINViewController *)self resetWithErrorPrompt:v13 title:v18];
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    v4 = [(TPSetPINViewController *)self passcodeView];
    char v5 = [v4 passcodeString];
    [(TPSetPINViewController *)self setOldPIN:v5];

    int v6 = self;
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  BOOL v15 = [(TPSetPINViewController *)self confirmPIN];
  double v16 = [(TPSetPINViewController *)self passcodeView];
  uint64_t v17 = [v16 passcodeString];
  id v20 = (id)v17;
  if (v15)
  {
    [(TPSetPINViewController *)self setUnconfirmedPIN:v17];

    int v6 = self;
    uint64_t v7 = 2;
LABEL_10:
    [(TPSetPINViewController *)v6 setState:v7];
    return;
  }

  [(TPSetPINViewController *)self setState:3];
  v19 = [(TPSetPINViewController *)self delegate];

  if (v19)
  {
    BOOL v12 = [(TPSetPINViewController *)self delegate];
    double v13 = [(TPSetPINViewController *)self oldPIN];
    [v12 setPINViewControllerFinished:self success:1 oldPIN:v13 newPIN:v20];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_cancelButtonTapped
{
  int v3 = [(TPSetPINViewController *)self delegate];

  if (v3)
  {
    id v4 = [(TPSetPINViewController *)self delegate];
    [v4 setPINViewControllerFinished:self success:0 oldPIN:0 newPIN:0];
  }
}

- (void)simpleNumberPad:(id)a3 buttonPressedWithCharacter:(id)a4
{
  id v13 = a4;
  char v5 = [(TPSetPINViewController *)self passcodeView];
  int v6 = [v5 passcodeString];
  unint64_t v7 = [v6 length];
  unsigned int v8 = [(TPSetPINViewController *)self maxPINLength];

  if (v7 < v8)
  {
    double v9 = [(TPSetPINViewController *)self passcodeView];
    [v9 appendCharacter:v13];

    [(TPSetPINViewController *)self _updateDeleteAllowed];
    [(TPSetPINViewController *)self _updateNavBarButtons];
  }
  int v10 = [(TPSetPINViewController *)self numberPad];
  double v11 = [(TPSetPINViewController *)self passcodeView];
  BOOL v12 = [v11 passcodeString];
  objc_msgSend(v10, "setNumberButtonsEnabled:", objc_msgSend(v12, "length") < (unint64_t)-[TPSetPINViewController maxPINLength](self, "maxPINLength"));
}

- (void)simpleNumberPadDeletePressed:(id)a3
{
  id v4 = [(TPSetPINViewController *)self passcodeView];
  [v4 deleteLastCharacter];

  char v5 = [(TPSetPINViewController *)self numberPad];
  int v6 = [(TPSetPINViewController *)self passcodeView];
  unint64_t v7 = [v6 passcodeString];
  objc_msgSend(v5, "setNumberButtonsEnabled:", objc_msgSend(v7, "length") < (unint64_t)-[TPSetPINViewController maxPINLength](self, "maxPINLength"));

  [(TPSetPINViewController *)self _updateDeleteAllowed];
  [(TPSetPINViewController *)self _updateNavBarButtons];
}

- (void)setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(TPSetPINViewController *)self _updateUIForStateChange];
  }
}

- (void)_updateDeleteAllowed
{
  id v6 = [(TPSetPINViewController *)self passcodeView];
  int v3 = [v6 passcodeString];
  BOOL v4 = [v3 length] != 0;
  char v5 = [(TPSetPINViewController *)self numberPad];
  [v5 setShowsDeleteButton:v4];
}

- (void)_updateNavBarButtons
{
  int v3 = [(TPSetPINViewController *)self passcodeView];
  BOOL v4 = [v3 passcodeString];
  unint64_t v5 = [v4 length];
  BOOL v6 = v5 >= [(TPSetPINViewController *)self minPINLength];
  unint64_t v7 = [(TPSetPINViewController *)self navigationItem];
  unsigned int v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];

  BOOL v9 = [(TPSetPINViewController *)self state] != 3;
  id v11 = [(TPSetPINViewController *)self navigationItem];
  int v10 = [v11 leftBarButtonItem];
  [v10 setEnabled:v9];
}

- (void)_updateStatusLabel
{
  if ([(TPSetPINViewController *)self isViewLoaded])
  {
    switch([(TPSetPINViewController *)self state])
    {
      case 0:
        BOOL v4 = [(TPSetPINViewController *)self promptTextForOldPIN];

        if (!v4)
        {
          unint64_t v5 = [NSString stringWithFormat:@"Asked to show UI for requesting old PIN, but promptTextForOldPIN is nil"];
          NSLog(&cfstr_TuassertionFai.isa, v5);

          if (_TUAssertShouldCrashApplication())
          {
            BOOL v6 = [(TPSetPINViewController *)self promptTextForOldPIN];

            if (!v6)
            {
              double v23 = [MEMORY[0x1E4F28B00] currentHandler];
              [v23 handleFailureInMethod:a2, self, @"TPSetPINViewController.m", 387, @"Asked to show UI for requesting old PIN, but promptTextForOldPIN is nil" object file lineNumber description];
            }
          }
        }
        uint64_t v7 = [(TPSetPINViewController *)self promptTextForOldPIN];
        goto LABEL_19;
      case 1:
        unsigned int v8 = [(TPSetPINViewController *)self promptTextForNewPIN];

        if (!v8)
        {
          BOOL v9 = [NSString stringWithFormat:@"Asked to show UI for requesting new PIN, but promptTextForNewPIN is nil"];
          NSLog(&cfstr_TuassertionFai.isa, v9);

          if (_TUAssertShouldCrashApplication())
          {
            int v10 = [(TPSetPINViewController *)self promptTextForNewPIN];

            if (!v10)
            {
              double v24 = [MEMORY[0x1E4F28B00] currentHandler];
              [v24 handleFailureInMethod:a2, self, @"TPSetPINViewController.m", 392, @"Asked to show UI for requesting new PIN, but promptTextForNewPIN is nil" object file lineNumber description];
            }
          }
        }
        uint64_t v7 = [(TPSetPINViewController *)self promptTextForNewPIN];
        goto LABEL_19;
      case 2:
        id v11 = [(TPSetPINViewController *)self promptTextForConfirmingNewPIN];

        if (!v11)
        {
          BOOL v12 = [NSString stringWithFormat:@"Asked to show UI for confirming new PIN, but promptTextForConfirmingNewPIN is nil"];
          NSLog(&cfstr_TuassertionFai.isa, v12);

          if (_TUAssertShouldCrashApplication())
          {
            id v13 = [(TPSetPINViewController *)self promptTextForConfirmingNewPIN];

            if (!v13)
            {
              v25 = [MEMORY[0x1E4F28B00] currentHandler];
              [v25 handleFailureInMethod:a2, self, @"TPSetPINViewController.m", 397, @"Asked to show UI for confirming new PIN, but promptTextForConfirmingNewPIN is nil" object file lineNumber description];
            }
          }
        }
        uint64_t v7 = [(TPSetPINViewController *)self promptTextForConfirmingNewPIN];
LABEL_19:
        double v14 = (void *)v7;
        BOOL v15 = [(TPSetPINViewController *)self statusLabel];
        [v15 setText:v14];

        double v16 = [(TPSetPINViewController *)self view];
        id v27 = v16;
        uint64_t v17 = 1;
        goto LABEL_25;
      case 3:
        v18 = [(TPSetPINViewController *)self promptTextForSavingPIN];

        if (!v18)
        {
          v19 = [NSString stringWithFormat:@"Asked to show UI for saving new PIN, but promptTextForSavingPIN is nil"];
          NSLog(&cfstr_TuassertionFai.isa, v19);

          if (_TUAssertShouldCrashApplication())
          {
            id v20 = [(TPSetPINViewController *)self promptTextForSavingPIN];

            if (!v20)
            {
              v26 = [MEMORY[0x1E4F28B00] currentHandler];
              [v26 handleFailureInMethod:a2, self, @"TPSetPINViewController.m", 402, @"Asked to show UI for saving new PIN, but promptTextForSavingPIN is nil" object file lineNumber description];
            }
          }
        }
        double v21 = [(TPSetPINViewController *)self promptTextForSavingPIN];
        v22 = [(TPSetPINViewController *)self statusLabel];
        [v22 setText:v21];

        double v16 = [(TPSetPINViewController *)self view];
        id v27 = v16;
        uint64_t v17 = 0;
LABEL_25:
        [v16 setUserInteractionEnabled:v17];

        break;
      default:
        return;
    }
  }
}

- (void)_updateUIForStateChange
{
  int v3 = [(TPSetPINViewController *)self passcodeView];
  [v3 clear];

  BOOL v4 = [(TPSetPINViewController *)self numberPad];
  [v4 setNumberButtonsEnabled:1];

  [(TPSetPINViewController *)self _updateDeleteAllowed];
  [(TPSetPINViewController *)self _updateNavBarButtons];
  [(TPSetPINViewController *)self _updateStatusLabel];
}

- (TPSetPINViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSetPINViewControllerDelegate *)a3;
}

- (NSString)promptTextForOldPIN
{
  return self->_promptTextForOldPIN;
}

- (NSString)promptTextForNewPIN
{
  return self->_promptTextForNewPIN;
}

- (NSString)promptTextForConfirmingNewPIN
{
  return self->_promptTextForConfirmingNewPIN;
}

- (NSString)promptTextForSavingPIN
{
  return self->_promptTextForSavingPIN;
}

- (UIView)customBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setCustomBackgroundView:(id)a3
{
}

- (int)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(int)a3
{
  self->_initialState = a3;
}

- (int)state
{
  return self->_state;
}

- (unsigned)minPINLength
{
  return self->_minPINLength;
}

- (void)setMinPINLength:(unsigned int)a3
{
  self->_minPINLength = a3;
}

- (unsigned)maxPINLength
{
  return self->_maxPINLength;
}

- (void)setMaxPINLength:(unsigned int)a3
{
  self->_maxPINLength = a3;
}

- (BOOL)confirmPIN
{
  return self->_confirmPIN;
}

- (void)setConfirmPIN:(BOOL)a3
{
  self->_confirmPIN = a3;
}

- (UILabel)statusLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setStatusLabel:(id)a3
{
}

- (TPPasscodeView)passcodeView
{
  return (TPPasscodeView *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setPasscodeView:(id)a3
{
}

- (TPSimpleNumberPad)numberPad
{
  return (TPSimpleNumberPad *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setNumberPad:(id)a3
{
}

- (NSString)oldPIN
{
  return (NSString *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setOldPIN:(id)a3
{
}

- (NSString)unconfirmedPIN
{
  return (NSString *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setUnconfirmedPIN:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconfirmedPIN, 0);
  objc_storeStrong((id *)&self->_oldPIN, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_promptTextForSavingPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForConfirmingNewPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForNewPIN, 0);
  objc_storeStrong((id *)&self->_promptTextForOldPIN, 0);
}

@end