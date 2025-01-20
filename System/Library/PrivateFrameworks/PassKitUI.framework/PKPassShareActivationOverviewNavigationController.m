@interface PKPassShareActivationOverviewNavigationController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (PKPassShareActivationOverviewNavigationController)initWithContext:(id)a3 delegate:(id)a4;
- (void)_showNextScreen;
- (void)loadView;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)shareActivationOverviewViewControllerDidFinish:(id)a3;
- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3;
@end

@implementation PKPassShareActivationOverviewNavigationController

- (PKPassShareActivationOverviewNavigationController)initWithContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationOverviewNavigationController;
  v9 = [(PKNavigationController *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = [v7 composedShare];
    v12 = [v11 activationOptions];

    id v13 = objc_alloc(MEMORY[0x1E4F848C8]);
    v14 = [v12 optionsOfType:3];
    v15 = (void *)[v13 initWithOptions:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F848C8]);
    v17 = PKPassShareActivationOptionActivationCodeTypes();
    v18 = [v12 optionsOfTypes:v17];
    v19 = (void *)[v16 initWithOptions:v18];

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    optionsToShow = v10->_optionsToShow;
    v10->_optionsToShow = v20;

    [(NSMutableArray *)v10->_optionsToShow safelyAddObject:v15];
    [(NSMutableArray *)v10->_optionsToShow safelyAddObject:v19];
  }
  return v10;
}

- (void)loadView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKPassShareActivationOverviewNavigationController;
  [(PKPassShareActivationOverviewNavigationController *)&v7 loadView];
  [(PKPassShareActivationOverviewNavigationController *)self _showNextScreen];
  [(PKPassShareActivationOverviewNavigationController *)self setNavigationBarHidden:1];
  v3 = [(PKPassShareActivationOverviewNavigationController *)self sheetPresentationController];
  v4 = v3;
  if (v3)
  {
    [v3 setDelegate:self];
    v5 = [MEMORY[0x1E4FB1C30] mediumDetent];
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v4 setDetents:v6];
  }
}

- (void)_showNextScreen
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_optionsToShow count])
  {
    v3 = [(NSMutableArray *)self->_optionsToShow firstObject];
    [(NSMutableArray *)self->_optionsToShow removeObjectAtIndex:0];
    v4 = [PKPassShareActivationOverviewViewController alloc];
    v5 = [(PKPassShareInitiationContext *)self->_context recipient];
    v6 = [(PKPassShareActivationOverviewViewController *)v4 initWithActivationOptions:v3 recipient:v5 isFinalScreen:[(NSMutableArray *)self->_optionsToShow count] == 0 delegate:self];

    objc_super v7 = [(PKPassShareActivationOverviewNavigationController *)self viewControllers];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      [(PKPassShareActivationOverviewNavigationController *)self pushViewController:v6 animated:1];
    }
    else
    {
      v11[0] = v6;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [(PKPassShareActivationOverviewNavigationController *)self setViewControllers:v9];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shareActivationOverviewViewControllerDidFinish:0];
  }
}

- (void)shareActivationOverviewViewControllerDidFinish:(id)a3
{
  id v5 = a3;
  if ([(NSMutableArray *)self->_optionsToShow count])
  {
    [(PKPassShareActivationOverviewNavigationController *)self _showNextScreen];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shareActivationOverviewViewControllerDidFinish:v5];
  }
}

- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained shareActivationOverviewViewControllerDidSelectShareCode:v4];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(PKPassShareActivationOverviewNavigationController *)self viewControllers];
  id v5 = [v4 lastObject];
  [WeakRetained shareActivationOverviewViewControllerDidFinish:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsToShow, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_context, 0);
}

@end