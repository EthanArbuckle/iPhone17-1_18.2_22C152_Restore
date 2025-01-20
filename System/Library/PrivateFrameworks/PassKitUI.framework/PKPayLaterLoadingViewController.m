@interface PKPayLaterLoadingViewController
- (PKPayLaterLoadingViewController)initWithSetupFlowController:(id)a3;
- (void)_updateHeaderSubtitleWithAltTextIfNecessary;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPayLaterLoadingViewController

- (PKPayLaterLoadingViewController)initWithSetupFlowController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterLoadingViewController;
  result = [(PKPayLaterSetupViewController *)&v4 initWithSetupFlowController:a3 dynamicContentPageType:3];
  if (result) {
    result->_minimumDelayNanoSeconds = 1500000000.0;
  }
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterLoadingViewController;
  [(PKPayLaterSetupViewController *)&v7 viewDidLoad];
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  objc_super v4 = [v3 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  v6 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  [(PKPayLaterSetupViewController *)self setRightBarButton:0];
  [(PKPayLaterSetupViewController *)self setLeftBarButton:3];
  [(PKPaymentSetupOptionsViewController *)self setShowHeaderSpinner:1];
  [(PKPayLaterLoadingViewController *)self _updateHeaderSubtitleWithAltTextIfNecessary];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterLoadingViewController;
  [(PKPayLaterSetupViewController *)&v11 viewWillAppear:a3];
  if (!self->_didRequestNextViewController)
  {
    self->_didRequestNextViewController = 1;
    objc_super v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    double v6 = v5;

    objc_initWeak(&location, self);
    objc_super v7 = [(PKPayLaterSetupViewController *)self setupController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke;
    v8[3] = &unk_1E59DEAF0;
    objc_copyWeak(v9, &location);
    *(double *)&v9[1] = v6 * 1000000000.0;
    v8[4] = self;
    [v7 nextViewControllerFromState:1 parentViewController:self completion:v8];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSince1970];
      double v11 = v10 * 1000000000.0;

      double v12 = fmax(*(double *)(*(void *)(a1 + 32) + 1360) - vabdd_f64(v11, *(double *)(a1 + 48)), 0.0);
      [v8 setNextStepButtonTapped:1];
      id v13 = [v8 navigationController];
      objc_msgSend(v13, "pk_presentPaymentSetupViewController:animated:delay:completion:", v5, 1, (uint64_t)v12, 0);
    }
    else
    {
      if (!v6)
      {
        [WeakRetained dismissSetupFlowWithCompletion:0];
        goto LABEL_5;
      }
      v14 = PKAccountDisplayableError();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke_2;
      v15[3] = &unk_1E59CA7D0;
      v15[4] = v8;
      id v13 = PKAlertForDisplayableErrorWithHandlers(v14, 0, v15, 0);

      if (v13) {
        [v8 presentViewController:v13 animated:1 completion:0];
      }
    }
  }
LABEL_5:
}

uint64_t __50__PKPayLaterLoadingViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissSetupFlowWithCompletion:0];
}

- (void)_updateHeaderSubtitleWithAltTextIfNecessary
{
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  objc_super v4 = [v3 altHeaderSubtitle];

  id v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  uint64_t v6 = [v5 altHeaderSubtitleTimeInterval];

  if (v4 && v6 >= 1)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * v6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKPayLaterLoadingViewController__updateHeaderSubtitleWithAltTextIfNecessary__block_invoke;
    block[3] = &unk_1E59CB010;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __78__PKPayLaterLoadingViewController__updateHeaderSubtitleWithAltTextIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setSubtitleText:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

@end