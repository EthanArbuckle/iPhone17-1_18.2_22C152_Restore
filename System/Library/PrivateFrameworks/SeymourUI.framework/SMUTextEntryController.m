@interface SMUTextEntryController
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_enableAutomaticKeyboardPressDone;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)textFieldAllowsFocus;
- (NSString)doneText;
- (NSString)message;
- (NSString)text;
- (NSString)title;
- (SMUTextEntryController)init;
- (SMUTextEntryController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)doneButton;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UISystemInputViewController)systemInputViewController;
- (UITextField)textField;
- (id)onCompletion;
- (id)preferredFocusEnvironments;
- (unint64_t)maxLength;
- (void)_cancelButtonPressed:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setDoneText:(id)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMessage:(id)a3;
- (void)setOnCompletion:(id)a3;
- (void)setText:(id)a3;
- (void)setTextFieldAllowsFocus:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)systemInputViewController:(id)a3 didChangeAccessoryVisibility:(BOOL)a4;
- (void)systemInputViewControllerDidAcceptRecentInput:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SMUTextEntryController

- (SMUTextEntryController)initWithNibName:(id)a3 bundle:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)SMUTextEntryController;
  v4 = [(SMUTextEntryController *)&v25 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    title = v4->_title;
    v4->_title = (NSString *)&stru_26EDB5FC8;

    doneText = v5->_doneText;
    v5->_doneText = (NSString *)&stru_26EDB5FC8;

    v8 = [SMUTextEntryTextField alloc];
    uint64_t v9 = -[SMUTextEntryTextField initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textField = v5->_textField;
    v5->_textField = (SMUTextEntryTextField *)v9;

    [(SMUTextEntryTextField *)v5->_textField _setBlurEnabled:0];
    v11 = v5->_textField;
    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83628]];
    [(SMUTextEntryTextField *)v11 setFont:v12];

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v13;

    v15 = v5->_titleLabel;
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83618]];
    [(UILabel *)v15 setFont:v16];

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    messageLabel = v5->_messageLabel;
    v5->_messageLabel = v17;

    v19 = v5->_messageLabel;
    v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)v5->_messageLabel setNumberOfLines:2];
    uint64_t v21 = [MEMORY[0x263F824E8] buttonWithType:1];
    doneButton = v5->_doneButton;
    v5->_doneButton = (UIButton *)v21;

    [(UIButton *)v5->_doneButton addTarget:v5 action:sel__doneButtonPressed_ forControlEvents:0x2000];
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v5 selector:sel_textFieldDidChange_ name:*MEMORY[0x263F83AC8] object:v5->_textField];
  }
  return v5;
}

- (SMUTextEntryController)init
{
  return [(SMUTextEntryController *)self initWithNibName:0 bundle:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v4 dealloc];
}

- (unint64_t)maxLength
{
  return [(SMUTextEntryTextField *)self->_textField maxLength];
}

- (void)setMaxLength:(unint64_t)a3
{
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v4 loadView];
  v3 = [(SMUTextEntryController *)self view];
  [(SMUTextEntryTextField *)self->_textField setText:self->_text];
  [v3 addSubview:self->_textField];
  [(UILabel *)self->_titleLabel setText:self->_title];
  [v3 addSubview:self->_titleLabel];
  [(UILabel *)self->_messageLabel setText:self->_message];
  [v3 addSubview:self->_messageLabel];
  [(UIButton *)self->_doneButton setTitle:self->_doneText forState:0];
  [v3 addSubview:self->_doneButton];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v5 viewDidLoad];
  v3 = [(SMUTextEntryController *)self view];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__cancelButtonPressed_];
  [v4 setAllowedPressTypes:&unk_26EE05F28];
  [v3 addGestureRecognizer:v4];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v9 didMoveToParentViewController:v4];
  if (v4 && !self->_systemInputViewController)
  {
    objc_super v5 = [MEMORY[0x263F82C48] systemInputViewControllerForResponder:self->_textField editorView:0 containingResponder:self];
    systemInputViewController = self->_systemInputViewController;
    self->_systemInputViewController = v5;

    [(UISystemInputViewController *)self->_systemInputViewController setSupportsRecentInputsIntegration:1];
    [(UISystemInputViewController *)self->_systemInputViewController setSystemInputViewControllerDelegate:self];
    if (!self->_systemInputViewController) {
      -[SMUTextEntryController didMoveToParentViewController:]();
    }
    -[SMUTextEntryController addChildViewController:](self, "addChildViewController:");
    v7 = [(SMUTextEntryController *)self view];
    v8 = [(UISystemInputViewController *)self->_systemInputViewController view];
    [v7 addSubview:v8];

    [(UISystemInputViewController *)self->_systemInputViewController willMoveToParentViewController:self];
    self->_isTouchEnabled = [(UISystemInputViewController *)self->_systemInputViewController supportsTouchInput];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v3 viewWillLayoutSubviews];
  [(UISystemInputViewController *)self->_systemInputViewController reloadInputViewsForPersistentDelegate];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v4 viewWillAppear:a3];
  [(SMUTextEntryTextField *)self->_textField setUserInteractionEnabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v4 viewWillDisappear:a3];
  [(SMUTextEntryTextField *)self->_textField setUserInteractionEnabled:0];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  objc_super v4 = [a3 nextFocusedView];
  LOBYTE(self) = [v4 isDescendantOfView:self->_textField] ^ 1;

  return (char)self;
}

- (id)preferredFocusEnvironments
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = v3;
  if (self->_preferredFocusedView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_systemInputViewController) {
    objc_msgSend(v4, "addObject:");
  }
  v7.receiver = self;
  v7.super_class = (Class)SMUTextEntryController;
  objc_super v5 = [(SMUTextEntryController *)&v7 preferredFocusEnvironments];
  [v4 addObjectsFromArray:v5];

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  id v9 = [(SMUTextEntryController *)self view];
  v6 = [v5 nextFocusedView];

  if ([v6 isDescendantOfView:v9])
  {
    objc_super v7 = [(UISystemInputViewController *)self->_systemInputViewController view];
    char v8 = [v6 isDescendantOfView:v7];

    if ((v8 & 1) == 0) {
      objc_storeStrong((id *)&self->_preferredFocusedView, v6);
    }
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v3 = [(SMUTextEntryController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)SMUTextEntryController;
  [(SMUTextEntryController *)&v39 viewDidLayoutSubviews];
  id v3 = [(UISystemInputViewController *)self->_systemInputViewController view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v38 = v4;
  id v5 = [(SMUTextEntryController *)self view];
  [v5 bounds];
  double v37 = v7;
  if (self->_isTouchEnabled) {
    double v8 = v6;
  }
  else {
    double v8 = v6 + -838.0 + -90.0;
  }
  double v10 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *MEMORY[0x263F001B0], v9);
  double v12 = v11;
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v8, 360.0);
  double v14 = v13;
  double v15 = v13 + 100.0;
  if (v14 <= 0.0) {
    double v15 = 0.0;
  }
  double v16 = v12 + v15 + 100.0;
  v17 = [(SMUTextEntryTextField *)self->_textField attributedText];
  objc_msgSend(v17, "boundingRectWithSize:options:context:", 8, 0, v10, v9);
  CGRect v41 = CGRectIntegral(v40);
  double width = v41.size.width;

  if (width + 40.0 > v8 * 0.9) {
    double v19 = v8 * 0.9;
  }
  else {
    double v19 = width + 40.0;
  }
  if (width + 40.0 > 600.0) {
    double v20 = v19;
  }
  else {
    double v20 = 600.0;
  }
  double v36 = v20;
  double v21 = v38 + 30.0 + 70.0;
  if (!self->_isTouchEnabled) {
    double v21 = 70.0;
  }
  -[UIButton sizeThatFits:](self->_doneButton, "sizeThatFits:", v8, v37 - (v16 + v21), v19, *(void *)&v36);
  titleLabel = self->_titleLabel;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  [(UILabel *)self->_titleLabel frame];
  CGRectGetMaxY(v42);
  messageLabel = self->_messageLabel;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](messageLabel, "setFrame:");
  if (v14 > 0.0)
  {
    [(UILabel *)self->_messageLabel frame];
    CGRectGetMaxY(v43);
  }
  textField = self->_textField;
  UIRectCenteredXInRect();
  -[SMUTextEntryTextField setFrame:](textField, "setFrame:");
  if (self->_isTouchEnabled)
  {
    [(SMUTextEntryTextField *)self->_textField frame];
    CGFloat v25 = CGRectGetMaxY(v44) + 30.0;
    v26 = [(SMUTextEntryController *)self view];
    [v26 bounds];
    double v27 = CGRectGetWidth(v45);
    [v3 bounds];
    objc_msgSend(v3, "setFrame:", 0.0, v25, v27, CGRectGetHeight(v46));
  }
  else
  {
    [v3 bounds];
    v28 = [(SMUTextEntryController *)self view];
    [v28 frame];
    UIRectCenteredYInRect();
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;

    objc_msgSend(v3, "setFrame:", 194.0, v30, v32, v34);
  }
  doneButton = self->_doneButton;
  UIRectCenteredXInRect();
  -[UIButton setFrame:](doneButton, "setFrame:");
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (BOOL)_enableAutomaticKeyboardPressDone
{
  return 1;
}

- (void)systemInputViewController:(id)a3 didChangeAccessoryVisibility:(BOOL)a4
{
  BOOL v5 = !a4;
  self->_hideAccessoryViews = !a4;
  [(UILabel *)self->_titleLabel setHidden:v5];
  [(UILabel *)self->_messageLabel setHidden:v5];
  [(SMUTextEntryTextField *)self->_textField setHidden:v5];
  doneButton = self->_doneButton;

  [(UIButton *)doneButton setHidden:v5];
}

- (void)systemInputViewControllerDidAcceptRecentInput:(id)a3
{
}

- (void)_doneButtonPressed:(id)a3
{
  double v4 = [(SMUTextEntryTextField *)self->_textField text];
  text = self->_text;
  self->_text = v4;

  id onCompletion = self->_onCompletion;
  if (onCompletion)
  {
    double v7 = (void (*)(void))*((void *)onCompletion + 2);
    v7();
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  text = self->_text;
  self->_text = 0;

  id onCompletion = self->_onCompletion;
  if (onCompletion)
  {
    double v6 = (void (*)(void))*((void *)onCompletion + 2);
    v6();
  }
}

- (BOOL)textFieldAllowsFocus
{
  return [(SMUTextEntryTextField *)self->_textField allowsFocus];
}

- (void)setTextFieldAllowsFocus:(BOOL)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)doneText
{
  return self->_doneText;
}

- (void)setDoneText:(id)a3
{
}

- (id)onCompletion
{
  return self->_onCompletion;
}

- (void)setOnCompletion:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UITextField)textField
{
  return &self->_textField->super;
}

- (UISystemInputViewController)systemInputViewController
{
  return self->_systemInputViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_onCompletion, 0);
  objc_storeStrong((id *)&self->_doneText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_preferredFocusedView, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

- (void)didMoveToParentViewController:.cold.1()
{
}

@end