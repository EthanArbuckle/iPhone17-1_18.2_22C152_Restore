@interface StepperViewController
- (StepperViewController)initWithStepperController:(id)a3;
- (_SFSettingsAlertStepperController)stepperController;
- (id)_buttonForStepperButton:(int64_t)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)loadView;
- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4;
- (void)setImage:(id)a3 forButton:(int64_t)a4;
- (void)setStepperController:(id)a3;
- (void)setText:(id)a3 forButton:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation StepperViewController

- (StepperViewController)initWithStepperController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StepperViewController;
  v6 = [(StepperViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stepperController, a3);
    [(StepperViewController *)v7 setModalPresentationStyle:4];
    [(StepperViewController *)v7 setTransitioningDelegate:v7];
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F78390]);
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  v9 = (SFStepperView *)objc_msgSend(v3, "initWithFrame:includingResetButton:", objc_opt_respondsToSelector() & 1, v5, v6, v7, v8);
  stepperView = self->_stepperView;
  self->_stepperView = v9;

  [(SFStepperView *)self->_stepperView setAutoresizingMask:18];
  v11 = self->_stepperView;
  [(StepperViewController *)self setView:v11];
}

- (void)viewDidLoad
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)StepperViewController;
  [(StepperViewController *)&v38 viewDidLoad];
  objc_initWeak(&location, self);
  id v3 = [(SFStepperView *)self->_stepperView decrementButton];
  v4 = (void *)MEMORY[0x1E4FB13F0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __36__StepperViewController_viewDidLoad__block_invoke;
  v35[3] = &unk_1E6D78C18;
  objc_copyWeak(&v36, &location);
  double v5 = [v4 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v35];
  [v3 addAction:v5 forControlEvents:0x2000];

  v24 = [(SFStepperView *)self->_stepperView resetButton];
  if (v24)
  {
    double v6 = (void *)MEMORY[0x1E4FB13F0];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __36__StepperViewController_viewDidLoad__block_invoke_2;
    v33[3] = &unk_1E6D78C18;
    objc_copyWeak(&v34, &location);
    double v7 = [v6 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v33];
    [v24 addAction:v7 forControlEvents:0x2000];

    objc_destroyWeak(&v34);
  }
  double v8 = [(SFStepperView *)self->_stepperView incrementButton];
  v9 = (void *)MEMORY[0x1E4FB13F0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __36__StepperViewController_viewDidLoad__block_invoke_3;
  v31[3] = &unk_1E6D78C18;
  objc_copyWeak(&v32, &location);
  objc_super v10 = [v9 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v31];
  [v8 addAction:v10 forControlEvents:0x2000];

  v23 = [(SFStepperView *)self->_stepperView doneButton];
  v11 = _WBSLocalizedString();
  [v23 setTitle:v11 forState:0];

  v12 = (void *)MEMORY[0x1E4FB13F0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __36__StepperViewController_viewDidLoad__block_invoke_4;
  v29[3] = &unk_1E6D78C18;
  objc_copyWeak(&v30, &location);
  v13 = [v12 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:v29];
  [v23 addAction:v13 forControlEvents:0x2000];

  char v14 = objc_opt_respondsToSelector();
  v15 = &unk_1F3C73F20;
  if (!v24) {
    v15 = &unk_1F3C73F38;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) integerValue];
        v21 = [(StepperViewController *)self _buttonForStepperButton:v20];
        if (v14)
        {
          v22 = [(_SFSettingsAlertStepperController *)self->_stepperController longestTextForButton:v20];
        }
        else
        {
          v22 = 0;
        }
        [(SFStepperView *)self->_stepperView setLongestTitle:v22 forButton:v21];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v39 count:16];
    }
    while (v17);
  }

  [(_SFSettingsAlertStepperController *)self->_stepperController prepareStepper:self];
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __36__StepperViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[123] decrementValue:WeakRetained];
}

void __36__StepperViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[123] resetValue:WeakRetained];
}

void __36__StepperViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[123] incrementValue:WeakRetained];
}

void __36__StepperViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)_buttonForStepperButton:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(SFStepperView *)self->_stepperView resetButton];
  }
  else if (a3 == 1)
  {
    id v3 = [(SFStepperView *)self->_stepperView decrementButton];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(SFStepperView *)self->_stepperView incrementButton];
  }
  return v3;
}

- (void)setImage:(id)a3 forButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(StepperViewController *)self _buttonForStepperButton:a4];
  [v7 setImage:v6 forState:0];
}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(StepperViewController *)self _buttonForStepperButton:a4];
  [v7 setTitle:v6 forState:0];
}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  BOOL v4 = a3;
  id v5 = [(StepperViewController *)self _buttonForStepperButton:a4];
  [v5 setEnabled:v4];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [[InteractablePresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (_SFSettingsAlertStepperController)stepperController
{
  return self->_stepperController;
}

- (void)setStepperController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepperController, 0);
  objc_storeStrong((id *)&self->_stepperView, 0);
}

@end