@interface NCOnboardingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)nextButtonEnabled;
- (NCOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5;
- (NCOnboardingViewControllerDelegate)delegate;
- (NSString)nextButtonText;
- (void)_nextButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNextButtonEnabled:(BOOL)a3;
- (void)setNextButtonText:(id)a3;
- (void)viewDidLoad;
@end

@implementation NCOnboardingViewController

- (NCOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NCOnboardingViewController;
  result = [(NCOnboardingViewController *)&v6 initWithTitle:a3 detailText:a4 icon:0 contentLayout:a5];
  if (result) {
    result->_nextButtonEnabled = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)NCOnboardingViewController;
  [(OBBaseWelcomeController *)&v6 viewDidLoad];
  v3 = [MEMORY[0x1E4F83A80] boldButton];
  nextButton = self->_nextButton;
  self->_nextButton = v3;

  [(OBTrayButton *)self->_nextButton setEnabled:self->_nextButtonEnabled];
  [(OBTrayButton *)self->_nextButton setTitle:self->_nextButtonText forState:0];
  [(OBTrayButton *)self->_nextButton addTarget:self action:sel__nextButtonPressed_ forControlEvents:64];
  v5 = [(NCOnboardingViewController *)self buttonTray];
  [v5 addButton:self->_nextButton];
}

- (void)setNextButtonText:(id)a3
{
  p_nextButtonText = &self->_nextButtonText;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_nextButtonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_nextButtonText, a3);
    [(OBTrayButton *)self->_nextButton setTitle:*p_nextButtonText forState:0];
  }
}

- (void)setNextButtonEnabled:(BOOL)a3
{
  if (self->_nextButtonEnabled != a3)
  {
    self->_nextButtonEnabled = a3;
    -[OBTrayButton setEnabled:](self->_nextButton, "setEnabled:");
  }
}

- (void)_nextButtonPressed:(id)a3
{
  id v4 = [(NCOnboardingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 onboardingViewControllerNextButtonTapped:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCOnboardingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCOnboardingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)nextButtonText
{
  return self->_nextButtonText;
}

- (BOOL)nextButtonEnabled
{
  return self->_nextButtonEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButtonText, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_nextButton, 0);
}

@end