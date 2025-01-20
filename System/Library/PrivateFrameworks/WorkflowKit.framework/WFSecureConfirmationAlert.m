@interface WFSecureConfirmationAlert
- (WFAlertButton)cancelButton;
- (WFAlertButton)continueButton;
- (WFDialogAttribution)attribution;
- (WFSecureConfirmationAlert)init;
- (id)buttons;
- (id)cancellationHandler;
- (id)configuredCancelButton;
- (id)configuredContinueButton;
- (id)failureHandler;
- (id)successHandler;
- (void)setAttribution:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setFailureHandler:(id)a3;
- (void)setSuccessHandler:(id)a3;
@end

@implementation WFSecureConfirmationAlert

- (void).cxx_destruct
{
  objc_storeStrong(&self->_successHandler, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

- (id)successHandler
{
  return self->_successHandler;
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (WFAlertButton)continueButton
{
  return self->_continueButton;
}

- (WFAlertButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setAttribution:(id)a3
{
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (id)configuredContinueButton
{
  v3 = (void *)MEMORY[0x1E4F5A770];
  v4 = WFLocalizedStringWithKey(@"AlertContinue", @"Continue");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke;
  v7[3] = &unk_1E6558B28;
  v7[4] = self;
  v5 = [v3 buttonWithTitle:v4 style:0 preferred:1 handler:v7];

  return v5;
}

void __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke_2;
  v4[3] = &unk_1E6555928;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  [v3 requestUnlockIfNeeded:v4];
}

void __53__WFSecureConfirmationAlert_configuredContinueButton__block_invoke_2(uint64_t a1, int a2)
{
  if (a2
    && ([*(id *)(a1 + 32) successHandler],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = [*(id *)(a1 + 32) successHandler];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) failureHandler];

    if (!v5) {
      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) failureHandler];
  }
  id v6 = (id)v4;
  (*(void (**)(void))(v4 + 16))();
}

- (id)configuredCancelButton
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__WFSecureConfirmationAlert_configuredCancelButton__block_invoke;
  v4[3] = &unk_1E6558B28;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F5A770] cancelButtonWithHandler:v4];
  return v2;
}

void __51__WFSecureConfirmationAlert_configuredCancelButton__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cancellationHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cancellationHandler];
    v3[2]();
  }
}

- (id)buttons
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFSecureConfirmationAlert *)self cancelButton];
  v7[0] = v3;
  uint64_t v4 = [(WFSecureConfirmationAlert *)self continueButton];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)setSuccessHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id successHandler = self->_successHandler;
  self->_id successHandler = v4;

  id v6 = [(WFSecureConfirmationAlert *)self configuredContinueButton];
  continueButton = self->_continueButton;
  self->_continueButton = v6;
}

- (void)setFailureHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id failureHandler = self->_failureHandler;
  self->_id failureHandler = v4;

  id v6 = [(WFSecureConfirmationAlert *)self configuredContinueButton];
  continueButton = self->_continueButton;
  self->_continueButton = v6;
}

- (void)setCancellationHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id cancellationHandler = self->_cancellationHandler;
  self->_id cancellationHandler = v4;

  id v6 = [(WFSecureConfirmationAlert *)self configuredCancelButton];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v6;
}

- (WFSecureConfirmationAlert)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFSecureConfirmationAlert;
  v2 = [(WFSecureConfirmationAlert *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(WFSecureConfirmationAlert *)v2 configuredCancelButton];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (WFAlertButton *)v4;

    uint64_t v6 = [(WFSecureConfirmationAlert *)v3 configuredContinueButton];
    continueButton = v3->_continueButton;
    v3->_continueButton = (WFAlertButton *)v6;

    v8 = v3;
  }

  return v3;
}

@end