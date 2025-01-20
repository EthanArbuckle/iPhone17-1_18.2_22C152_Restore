@interface ACM2SVCodeVerificationViewController
- (ACM2SVCodeVerificationViewController)initWithDelegate:(id)a3;
- (ACM2SVCodeVerificationViewControllerDelegate)delegate;
- (BOOL)canResendTheCode;
- (BOOL)shouldAutorotate;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (NSArray)digitViews;
- (NSLayoutConstraint)digitPanelWidthConstraint;
- (UIButton)sendAnotherCodeButton;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (UILabel)promptLabel;
- (UINavigationController)navigationController;
- (UITextField)verificationCodeTextField;
- (UIView)contentView;
- (UIView)digitPanel;
- (float)navigationBarHeight;
- (id)applicationActivationObserver;
- (id)completionBlock;
- (int64_t)keyboardAppearance;
- (int64_t)suggestedStatusBarStyle;
- (unint64_t)passcodeLength;
- (unint64_t)supportedInterfaceOrientations;
- (void)buildConstraints;
- (void)buildDigitViews;
- (void)buildHorizontalConstraints;
- (void)buildVerticalConstraints;
- (void)cancelAction:(id)a3;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)focus;
- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)loadView;
- (void)presentWithParentViewController:(id)a3 completion:(id)a4;
- (void)reset;
- (void)sendAnotherCode:(id)a3;
- (void)setApplicationActivationObserver:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanResendTheCode:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitPanel:(id)a3;
- (void)setDigitPanelWidthConstraint:(id)a3;
- (void)setDigitViews:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setNavigationController:(id)a3;
- (void)setPasscodeLength:(unint64_t)a3;
- (void)setPromptLabel:(id)a3;
- (void)setSendAnotherCodeButton:(id)a3;
- (void)setSuggestedStatusBarStyle:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setVerificationCodeTextField:(id)a3;
- (void)verificationCodeDidChange:(id)a3;
- (void)verifyCode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACM2SVCodeVerificationViewController

- (ACM2SVCodeVerificationViewController)initWithDelegate:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ACM2SVCodeVerificationViewController;
  v4 = [(ACM2SVCodeVerificationViewController *)&v11 init];
  v5 = v4;
  if (v4)
  {
    [(ACM2SVCodeVerificationViewController *)v4 setDelegate:a3];
    [(ACM2SVCodeVerificationViewController *)v5 setPasscodeLength:4];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *MEMORY[0x263F1D038];
    uint64_t v8 = [MEMORY[0x263F08A48] mainQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__ACM2SVCodeVerificationViewController_initWithDelegate___block_invoke;
    v10[3] = &unk_265043F88;
    v10[4] = v5;
    -[ACM2SVCodeVerificationViewController setApplicationActivationObserver:](v5, "setApplicationActivationObserver:", [v6 addObserverForName:v7 object:0 queue:v8 usingBlock:v10]);
  }
  return v5;
}

uint64_t __57__ACM2SVCodeVerificationViewController_initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)dealloc
{
  [(ACM2SVCodeVerificationViewController *)self setContentView:0];
  [(ACM2SVCodeVerificationViewController *)self setDigitPanel:0];
  [(ACM2SVCodeVerificationViewController *)self setVerificationCodeTextField:0];
  [(ACM2SVCodeVerificationViewController *)self setPromptLabel:0];
  [(ACM2SVCodeVerificationViewController *)self setSendAnotherCodeButton:0];
  [(ACM2SVCodeVerificationViewController *)self setDigitViews:0];
  [(ACM2SVCodeVerificationViewController *)self setTextColor:0];
  [(ACM2SVCodeVerificationViewController *)self setBackgroundColor:0];
  [(ACM2SVCodeVerificationViewController *)self setCompletionBlock:0];
  [(ACM2SVCodeVerificationViewController *)self setDigitPanelWidthConstraint:0];
  [(UINavigationController *)[(ACM2SVCodeVerificationViewController *)self navigationController] setDelegate:0];
  [(ACM2SVCodeVerificationViewController *)self setNavigationController:0];
  [[(id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter") removeObserver:-[ACM2SVCodeVerificationViewController applicationActivationObserver](self, "applicationActivationObserver")];
  [(ACM2SVCodeVerificationViewController *)self setApplicationActivationObserver:0];
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVCodeVerificationViewController;
  [(ACM2SVCodeVerificationViewController *)&v3 dealloc];
}

- (BOOL)canResendTheCode
{
  return [(UIButton *)[(ACM2SVCodeVerificationViewController *)self sendAnotherCodeButton] isHidden] ^ 1;
}

- (void)setCanResendTheCode:(BOOL)a3
{
  BOOL v3 = !a3;
  v4 = [(ACM2SVCodeVerificationViewController *)self sendAnotherCodeButton];

  [(UIButton *)v4 setHidden:v3];
}

- (void)setPasscodeLength:(unint64_t)a3
{
  if (self->_passcodeLength != a3)
  {
    self->_passcodeLength = a3;
    [(ACM2SVCodeVerificationViewController *)self buildDigitViews];
  }
}

- (void)presentWithParentViewController:(id)a3 completion:(id)a4
{
  if ([(ACM2SVCodeVerificationViewController *)self completionBlock])
  {
    if (a4)
    {
      uint64_t v7 = (void (*)(id, void))*((void *)a4 + 2);
      v7(a4, 0);
    }
  }
  else
  {
    [(ACM2SVCodeVerificationViewController *)self setCompletionBlock:a4];
    -[ACM2SVCodeVerificationViewController setNavigationController:](self, "setNavigationController:", [objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self]);
    [(UINavigationController *)[(ACM2SVCodeVerificationViewController *)self navigationController] setDelegate:self];
    [(UINavigationBar *)[(UINavigationController *)[(ACM2SVCodeVerificationViewController *)self navigationController] navigationBar] setTranslucent:0];
    uint64_t v8 = [(ACM2SVCodeVerificationViewController *)self navigationController];
    [a3 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v5 = a3;
  [(ACM2SVCodeVerificationViewController *)self setCompletionBlock:0];
  uint64_t v7 = (void *)[(ACM2SVCodeVerificationViewController *)self presentingViewController];

  [v7 dismissViewControllerAnimated:v5 completion:a4];
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)ACM2SVCodeVerificationViewController;
  [(ACM2SVCodeVerificationViewController *)&v14 loadView];
  [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = (objc_opt_respondsToSelector() & 1) == 0
    || [[[MEMORY[0x263F1C5C0] currentDevice] userInterfaceIdiom] == 0;
  [(ACM2SVCodeVerificationViewController *)self setTitle:+[ACMBaseLocale localizedString:@"Verification Code"]];
  [(ACM2SVCodeVerificationViewController *)self setEdgesForExtendedLayout:0];
  [((id)-[ACM2SVCodeVerificationViewController navigationItem](self, "navigationItem")) setLeftBarButtonItem:[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction_]];
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v4 setBackgroundColor:[self backgroundColor]];
  [(ACM2SVCodeVerificationViewController *)self setContentView:v4];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addSubview:v4];
  id v5 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v5 setText:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Enter verification code")];
  [v5 setTextAlignment:1];
  v6 = (void *)MEMORY[0x263F1C658];
  double v7 = 17.0;
  if (v3) {
    [MEMORY[0x263F1C658] systemFontSize:17.0];
  }
  [v5 setFont:[v6 boldSystemFontOfSize:v7]];
  [v5 setTextColor:-[ACM2SVCodeVerificationViewController textColor](self, "textColor")];
  [v5 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  [v5 setAdjustsFontSizeToFitWidth:1];
  [(ACM2SVCodeVerificationViewController *)self setPromptLabel:v5];
  [v4 addSubview:v5];
  uint64_t v8 = (double *)MEMORY[0x263F080F8];
  v9 = (void *)[MEMORY[0x263F1C488] buttonWithType:floor(*MEMORY[0x263F080F8]) > 993.0];
  if (floor(*v8) <= 993.0)
  {
    [v9 setTitleColor:[MEMORY[0x263F1C550] colorWithRed:0.09 green:0.52 blue:1.0 alpha:1.0] forState:0];
    [v9 setTitleColor:[MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0] forState:1];
  }
  [v9 addTarget:self action:sel_sendAnotherCode_ forControlEvents:64];
  [v9 setTitle:[+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Send a new code")] forState:0];
  [v9 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  [((id)objc_msgSend(v9, "titleLabel")) setTextAlignment:1];
  v10 = (void *)MEMORY[0x263F1C658];
  double v11 = 17.0;
  if (v3) {
    [MEMORY[0x263F1C658] systemFontSize:17.0];
  }
  [((id)objc_msgSend(v9, "titleLabel")) setFont:objc_msgSend(v10, "systemFontOfSize:", v11)];
  [(ACM2SVCodeVerificationViewController *)self setSendAnotherCodeButton:v9];
  [v4 addSubview:v9];
  id v12 = objc_alloc_init(MEMORY[0x263F1CA98]);
  [v12 setHidden:1];
  [v12 setBorderStyle:0];
  [v12 setSecureTextEntry:1];
  [v12 setKeyboardType:4];
  [v12 setKeyboardAppearance:-[ACM2SVCodeVerificationViewController keyboardAppearance](self, "keyboardAppearance")];
  [v12 setDelegate:self];
  [v12 addTarget:self action:sel_verificationCodeDidChange_ forControlEvents:0x20000];
  [(ACM2SVCodeVerificationViewController *)self setVerificationCodeTextField:v12];
  [v4 addSubview:v12];
  id v13 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v13 setBackgroundColor:[MEMORY[0x263F1C550] clearColor]];
  [(ACM2SVCodeVerificationViewController *)self setDigitPanel:v13];
  [v4 addSubview:v13];
  [(ACM2SVCodeVerificationViewController *)self buildDigitViews];
  [(ACM2SVCodeVerificationViewController *)self buildConstraints];
}

- (void)buildDigitViews
{
  if ([(ACM2SVCodeVerificationViewController *)self digitPanel])
  {
    NSUInteger v3 = [(NSArray *)[(ACM2SVCodeVerificationViewController *)self digitViews] count];
    if (v3 != [(ACM2SVCodeVerificationViewController *)self passcodeLength])
    {
      [(NSArray *)[(ACM2SVCodeVerificationViewController *)self digitViews] makeObjectsPerformSelector:sel_removeFromSuperview];
      id v4 = (void *)[MEMORY[0x263EFF980] array];
      if ([(ACM2SVCodeVerificationViewController *)self passcodeLength])
      {
        unint64_t v5 = 0;
        double MaxX = 0.0;
        do
        {
          double v7 = [ACM2SVDigitCodeView alloc];
          if ((unint64_t)([(ACM2SVCodeVerificationViewController *)self interfaceOrientation]- 1) >= 2)double v8 = 30.0; {
          else
          }
            double v8 = 40.0;
          v9 = -[ACM2SVDigitCodeView initWithFrame:](v7, "initWithFrame:", MaxX, 0.0, 30.0, v8);
          -[ACM2SVDigitCodeView setBackgroundColor:](v9, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
          [(ACM2SVDigitCodeView *)v9 setFillType:0];
          [(ACM2SVDigitCodeView *)v9 setFillColor:[(ACM2SVCodeVerificationViewController *)self textColor]];
          [(UIView *)[(ACM2SVCodeVerificationViewController *)self digitPanel] addSubview:v9];
          [v4 addObject:v9];
          [(ACM2SVDigitCodeView *)v9 frame];
          double MaxX = CGRectGetMaxX(v12);
          ++v5;
        }
        while (v5 < [(ACM2SVCodeVerificationViewController *)self passcodeLength]);
      }
      if ([(ACM2SVCodeVerificationViewController *)self digitPanelWidthConstraint]) {
        [(NSLayoutConstraint *)[(ACM2SVCodeVerificationViewController *)self digitPanelWidthConstraint] setConstant:(double)(30 * [(ACM2SVCodeVerificationViewController *)self passcodeLength])];
      }
      id v10 = (id)[v4 copy];
      [(ACM2SVCodeVerificationViewController *)self setDigitViews:v10];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACM2SVCodeVerificationViewController;
  [(ACM2SVCodeVerificationViewController *)&v4 viewWillAppear:a3];
  [(ACM2SVCodeVerificationViewController *)self reset];
}

- (float)navigationBarHeight
{
  v2 = &kACMNavigationBarHeightPortrait;
  if (floor(*MEMORY[0x263F080F8]) <= 993.0) {
    v2 = &kACMNavigationBarHeightLegacyOS;
  }
  return *(double *)v2;
}

- (void)buildConstraints
{
  [(UIView *)[(ACM2SVCodeVerificationViewController *)self contentView] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)[(ACM2SVCodeVerificationViewController *)self promptLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)[(ACM2SVCodeVerificationViewController *)self sendAnotherCodeButton] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)[(ACM2SVCodeVerificationViewController *)self digitPanel] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ACM2SVCodeVerificationViewController *)self buildHorizontalConstraints];

  [(ACM2SVCodeVerificationViewController *)self buildVerticalConstraints];
}

- (void)buildHorizontalConstraints
{
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController contentView](self, "contentView") attribute:7 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController view](self, "view") attribute:7 multiplier:1.0 constant:0.0])];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 1, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 1, 1.0, 0.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 9, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 9, 1.0, 0.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel") attribute:7 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController contentView](self, "contentView") attribute:7 multiplier:1.0 constant:0.0])];
  double v3 = (double)(30 * [(ACM2SVCodeVerificationViewController *)self passcodeLength]);
  -[ACM2SVCodeVerificationViewController setDigitPanelWidthConstraint:](self, "setDigitPanelWidthConstraint:", [MEMORY[0x263F08938] constraintWithItem: -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel") attribute:7 relatedBy:0 toItem:0 attribute:7 multiplier:0.0 constant:v3]);
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:-[ACM2SVCodeVerificationViewController digitPanelWidthConstraint](self, "digitPanelWidthConstraint")];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 9, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 9, 1.0, 0.0)];
  [[-[ACM2SVCodeVerificationViewController view](self, "view") addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 7, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 7, 1.0, 0.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 9, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 9, 1.0, 0.0)];
  uint64_t v4 = [MEMORY[0x263F08938] constraintWithItem:self.sendAnotherCodeButton attribute:9 relatedBy:0 toItem:self.contentView attribute:9 multiplier:1.0 constant:0.0];
  unint64_t v5 = (void *)[(ACM2SVCodeVerificationViewController *)self view];

  [v5 addConstraint:v4];
}

- (void)buildVerticalConstraints
{
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController contentView](self, "contentView") attribute:3 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController view](self, "view") attribute:3 multiplier:1.0 constant:0.0])];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 4, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 4, 1.0, 0.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 3, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 3, 1.0, 40.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel") attribute:3 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel") attribute:4 multiplier:1.0 constant:25.0]);
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 8, 0, 0, 8, 0.0, 40.0)];
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:([MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField") attribute:8 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel") attribute:8 multiplier:1.0 constant:0.0]);
  [(-[ACM2SVCodeVerificationViewController view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField") attribute:10 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel") attribute:10 multiplier:1.0 constant:0.0]];
  uint64_t v3 = [MEMORY[0x263F08938] constraintWithItem:-[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton") attribute:3 relatedBy:0 toItem:-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel") attribute:4 multiplier:1.0 constant:20.0];
  uint64_t v4 = (void *)[(ACM2SVCodeVerificationViewController *)self view];

  [v4 addConstraint:v3];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)reset
{
  [(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] setText:&stru_26F261788];
  [(ACM2SVCodeVerificationViewController *)self disableControls:0];
  uint64_t v3 = [(ACM2SVCodeVerificationViewController *)self verificationCodeTextField];

  [(ACM2SVCodeVerificationViewController *)self verificationCodeDidChange:v3];
}

- (void)disableControls:(BOOL)a3
{
  BOOL v5 = !a3;
  [(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] setEnabled:v5];
  [(UIButton *)[(ACM2SVCodeVerificationViewController *)self sendAnotherCodeButton] setEnabled:v5];
  [objc_msgSend((id)objc_msgSend((id)-[ACM2SVCodeVerificationViewController navigationItem](self, "navigationItem"), "leftBarButtonItem"), "setEnabled:", v5];
  if (!a3)
  {
    [(ACM2SVCodeVerificationViewController *)self focus];
  }
}

- (void)focus
{
  v2 = [(ACM2SVCodeVerificationViewController *)self verificationCodeTextField];

  [(UITextField *)v2 becomeFirstResponder];
}

- (void)verificationCodeDidChange:(id)a3
{
  unint64_t v4 = [(NSString *)[(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] text] length];
  if (v4 > [(ACM2SVCodeVerificationViewController *)self passcodeLength]) {
    [(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] setText:[(NSString *)[(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] text] substringToIndex:[(ACM2SVCodeVerificationViewController *)self passcodeLength]]];
  }
  BOOL v5 = [(UITextField *)[(ACM2SVCodeVerificationViewController *)self verificationCodeTextField] text];
  uint64_t v6 = [(NSString *)v5 length];
  double v7 = [(ACM2SVCodeVerificationViewController *)self digitViews];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__ACM2SVCodeVerificationViewController_verificationCodeDidChange___block_invoke;
  v8[3] = &__block_descriptor_40_e36_v32__0__ACM2SVDigitCodeView_8Q16_B24l;
  v8[4] = v6;
  [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  if (v6 == [(ACM2SVCodeVerificationViewController *)self passcodeLength]) {
    [(ACM2SVCodeVerificationViewController *)self verifyCode:v5];
  }
}

uint64_t __66__ACM2SVCodeVerificationViewController_verificationCodeDidChange___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = v3 != 0;
  unint64_t v5 = v3 - 1;
  unsigned int v6 = v4;
  if (v5 >= a3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  return [a2 setFillType:v7];
}

- (void)sendAnotherCode:(id)a3
{
  [(ACM2SVCodeVerificationViewController *)self disableControls:1];
  BOOL v4 = [(ACM2SVCodeVerificationViewController *)self delegate];

  [(ACM2SVCodeVerificationViewControllerDelegate *)v4 codeVerificationViewControllerNeedsResendCode:self];
}

- (void)verifyCode:(id)a3
{
  [(ACM2SVCodeVerificationViewController *)self disableControls:1];
  if ([(ACM2SVCodeVerificationViewController *)self completionBlock])
  {
    BOOL v4 = *(void (**)(void))([(ACM2SVCodeVerificationViewController *)self completionBlock] + 16);
    v4();
  }
}

- (void)cancelAction:(id)a3
{
  if ([(ACM2SVCodeVerificationViewController *)self completionBlock])
  {
    BOOL v4 = [(ACM2SVCodeVerificationViewController *)self completionBlock];
    v4[2](v4, 0);
    [(ACM2SVCodeVerificationViewController *)self setCompletionBlock:0];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return [[self verificationCodeTextField] length] != a3 || [[objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet") invertedSet] rangeOfCharacterFromSet:[[self verificationCodeTextField] rangeOfCharacterFromSet:a3]] == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (ACM2SVCodeVerificationViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACM2SVCodeVerificationViewControllerDelegate *)a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (int64_t)suggestedStatusBarStyle
{
  return self->_suggestedStatusBarStyle;
}

- (void)setSuggestedStatusBarStyle:(int64_t)a3
{
  self->_suggestedStatusBarStyle = a3;
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)digitPanel
{
  return self->_digitPanel;
}

- (void)setDigitPanel:(id)a3
{
}

- (UITextField)verificationCodeTextField
{
  return self->_verificationCodeTextField;
}

- (void)setVerificationCodeTextField:(id)a3
{
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
}

- (UIButton)sendAnotherCodeButton
{
  return self->_sendAnotherCodeButton;
}

- (void)setSendAnotherCodeButton:(id)a3
{
}

- (NSArray)digitViews
{
  return self->_digitViews;
}

- (void)setDigitViews:(id)a3
{
}

- (NSLayoutConstraint)digitPanelWidthConstraint
{
  return self->_digitPanelWidthConstraint;
}

- (void)setDigitPanelWidthConstraint:(id)a3
{
}

- (id)applicationActivationObserver
{
  return self->_applicationActivationObserver;
}

- (void)setApplicationActivationObserver:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

@end