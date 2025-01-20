@interface PKApplyCannotResumeIDVViewController
- (void)_restartApplyFlow;
- (void)explanationViewDidSelectSetupLater:(id)a3;
@end

@implementation PKApplyCannotResumeIDVViewController

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v4 = [(PKApplyExplanationViewController *)self controller];
  [v4 endApplyFlow];

  [(PKApplyExplanationViewController *)self handleNextStep];
}

- (void)_restartApplyFlow
{
  [(PKApplyExplanationViewController *)self showNavigationBarSpinner:1];
  v3 = [(PKApplyExplanationViewController *)self controller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke;
  v4[3] = &unk_1E59CB6B0;
  v4[4] = self;
  [v3 withdrawApplicationWithCompletion:v4];
}

void __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) navigationController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_2;
    v12[3] = &unk_1E59CB6D8;
    v12[4] = *(void *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);
  }
  else
  {
    if (!v6)
    {
      [*(id *)(a1 + 32) showNavigationBarSpinner:0];
      v10 = [*(id *)(a1 + 32) navigationController];
      objc_msgSend(v10, "_pk_popToViewControllerPresentationMarker:animated:", 3, 1);

      goto LABEL_6;
    }
    id v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_3;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = v9;
    [v9 presentViewController:v8 animated:1 completion:v11];
  }

LABEL_6:
}

uint64_t __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_2(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 showNavigationBarSpinner:0];
  }
  else {
    return [v2 terminateSetupFlow];
  }
}

uint64_t __57__PKApplyCannotResumeIDVViewController__restartApplyFlow__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) showNavigationBarSpinner:0];
}

@end