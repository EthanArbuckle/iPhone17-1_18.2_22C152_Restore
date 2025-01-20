@interface PKApplyDocumentSubmissionController
- (PKApplyDocumentSubmissionController)initWithController:(id)a3 setupDelegate:(id)a4 documentPage:(id)a5;
- (id)nextViewController;
- (void)_cancelledConfirmed;
- (void)_featureApplicationUpdated;
- (void)contactApplePressed;
- (void)dealloc;
- (void)removeApplicationUpdateObserver;
- (void)reportAnalyticsEvent:(id)a3 pageTag:(id)a4;
- (void)uploadID;
- (void)userWantsToCancel;
@end

@implementation PKApplyDocumentSubmissionController

- (PKApplyDocumentSubmissionController)initWithController:(id)a3 setupDelegate:(id)a4 documentPage:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 context];
  v20 = v10;
  v13 = [v10 acceptableDocuments];
  uint64_t v14 = [v9 featureIdentifier];
  v15 = [v9 localizationBundle];
  v16 = [v9 preferredLanguage];
  v21.receiver = self;
  v21.super_class = (Class)PKApplyDocumentSubmissionController;
  v17 = [(PKPaymentDocumentSubmissionController *)&v21 initWithSetupDelegate:v11 context:v12 acceptableDocuments:v13 featureIdentifier:v14 localizationBundle:v15 preferredLanguage:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_applyController, a3);
    objc_storeStrong((id *)&v17->_documentPage, a5);
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v17 selector:sel__featureApplicationUpdated name:@"PKApplyControllerUpdatedNotification" object:0];
  }
  return v17;
}

- (void)dealloc
{
  [(PKApplyDocumentSubmissionController *)self removeApplicationUpdateObserver];
  v3.receiver = self;
  v3.super_class = (Class)PKApplyDocumentSubmissionController;
  [(PKApplyDocumentSubmissionController *)&v3 dealloc];
}

- (void)removeApplicationUpdateObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"PKApplyControllerUpdatedNotification" object:0];
}

- (id)nextViewController
{
  id v3 = self->_nextViewController;
  nextViewController = self->_nextViewController;
  self->_nextViewController = 0;

  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKApplyDocumentSubmissionController;
    id v3 = [(PKPaymentDocumentSubmissionController *)&v6 nextViewController];
  }

  return v3;
}

- (void)uploadID
{
  if ([(PKPaymentDocumentSubmissionController *)self state] != 5)
  {
    [(PKPaymentDocumentSubmissionController *)self setState:5];
    self->_isLoading = 1;
    objc_initWeak(&location, self);
    applyController = self->_applyController;
    documentPage = self->_documentPage;
    v5 = [(PKPaymentDocumentSubmissionController *)self selectedDocument];
    objc_super v6 = [(PKPaymentDocumentSubmissionController *)self frontID];
    v7 = [(PKPaymentDocumentSubmissionController *)self backID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PKApplyDocumentSubmissionController_uploadID__block_invoke;
    v8[3] = &unk_1E59CCD58;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    [(PKApplyController *)applyController submitDocumentPage:documentPage selectedDocument:v5 frontImage:v6 backImage:v7 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__PKApplyDocumentSubmissionController_uploadID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained state];
    id v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v10 setIdleTimerDisabled:0];

    if (v6)
    {
      id v11 = [v6 userInfo];
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13 = [v11 objectForKey:*MEMORY[0x1E4F28A50]];

      uint64_t v14 = [v13 domain];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F5C158]];

      if (v15)
      {
        uint64_t v16 = [v13 code];
        if (v16 == 40102)
        {
          v17 = v8;
          uint64_t v18 = 8;
        }
        else if (v16 == 40101)
        {
          v17 = v8;
          uint64_t v18 = 4;
        }
        else
        {
          v17 = v8;
          uint64_t v18 = 11;
        }
        [v17 setState:v18];
      }
      else
      {
        objc_super v21 = [v6 userInfo];
        v22 = [v21 objectForKey:v12];

        uint64_t v23 = [v22 code];
        uint64_t v24 = 11;
        if (v23 == 60059) {
          uint64_t v24 = 8;
        }
        if (v23 == 60058) {
          uint64_t v25 = 4;
        }
        else {
          uint64_t v25 = v24;
        }
        [v8 setState:v25];
      }
    }
    else
    {
      if (v26)
      {
        [v8 removeApplicationUpdateObserver];
        objc_storeStrong(v8 + 13, a2);
        v19 = v8;
        uint64_t v20 = 7;
      }
      else
      {
        v19 = v8;
        uint64_t v20 = 6;
      }
      [v19 setState:v20];
    }
    if (v9 != [v8 state]) {
      [v8 stateChanged];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
  }
}

- (void)contactApplePressed
{
  if (+[PKBusinessChatController deviceSupportsBusinessChat])
  {
    id v3 = [(PKApplyController *)self->_applyController featureApplication];
    v4 = [v3 businessChatIdentifier];

    if (v4)
    {
      if (!self->_businessChatController)
      {
        v5 = objc_alloc_init(PKBusinessChatController);
        businessChatController = self->_businessChatController;
        self->_businessChatController = v5;
      }
      v7 = [[PKBuinessChatApplyContext alloc] initWithIdentifier:v4 intent:2];
      v8 = self->_businessChatController;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke;
      v9[3] = &unk_1E59CD658;
      v9[4] = self;
      [(PKBusinessChatController *)v8 openBusinessChatWithContext:v7 completion:v9];
    }
  }
}

void __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke_2;
    v7[3] = &unk_1E59CA870;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __58__PKApplyDocumentSubmissionController_contactApplePressed__block_invoke_2(uint64_t a1)
{
  id v3 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
  v2 = [*(id *)(a1 + 40) delegate];
  [v2 presentViewController:v3 animated:1 completion:0];
}

- (void)_featureApplicationUpdated
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL isLoading = self->_isLoading;
  v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isLoading)
  {
    if (v5)
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v7;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received but current view controller is loading - skipping update", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v9;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);
    }
    id v10 = [(PKPaymentDocumentSubmissionController *)self delegate];
    applyController = self->_applyController;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke;
    uint64_t v16 = &unk_1E59CA870;
    id v17 = v10;
    uint64_t v18 = self;
    v4 = v10;
    uint64_t v12 = [(PKApplyController *)applyController applicationUpdatedAlertControllerWithHandler:&v13];
    -[NSObject presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", v12, 1, 0, v13, v14, v15, v16);
  }
}

void __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) captureController:*(void *)(a1 + 40) showLoading:1];
  v2 = *(void **)(*(void *)(a1 + 40) + 96);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke_2;
  v5[3] = &unk_1E59D8E48;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 nextViewControllerWithCompletion:v5];
}

void __65__PKApplyDocumentSubmissionController__featureApplicationUpdated__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) captureController:*(void *)(a1 + 40) showLoading:0];
  if (v8)
  {
    id v6 = [*(id *)(a1 + 32) navigationController];
    objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, 0);
  }
  else if (v5)
  {
    id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    [*(id *)(a1 + 40) terminateSetupFlow];
  }
}

- (void)_cancelledConfirmed
{
  v2.receiver = self;
  v2.super_class = (Class)PKApplyDocumentSubmissionController;
  [(PKPaymentDocumentSubmissionController *)&v2 userWantsToCancel];
}

- (void)userWantsToCancel
{
  if (!self->_isCancelling)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke;
    aBlock[3] = &unk_1E59CA7D0;
    aBlock[4] = self;
    id v3 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v4 = [(PKPaymentDocumentSubmissionController *)self delegate];
    id v5 = [(PKApplyController *)self->_applyController cancelAlertWithContinueAction:v3];
    if (v5) {
      [v4 presentViewController:v5 animated:1 completion:0];
    }
    else {
      v3[2](v3);
    }
  }
}

void __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  objc_super v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(void **)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 120);
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v13[0] = *MEMORY[0x1E4F86308];
  v13[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86128];
  v14[0] = *MEMORY[0x1E4F86380];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v3 reportAnalyticsDictionaryForPage:v4 pageTag:*MEMORY[0x1E4F85F58] additionalValues:v7];

  id v8 = [*v2 delegate];
  [v8 captureController:*v2 showLoading:1];

  *((unsigned char *)*v2 + 129) = 1;
  objc_initWeak(&location, *v2);
  uint64_t v9 = (void *)*((void *)*v2 + 12);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke_2;
  v10[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v11, &location);
  [v9 withdrawApplicationWithCompletion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__PKApplyDocumentSubmissionController_userWantsToCancel__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained delegate];
    [v8 captureController:v7 showLoading:0];
    v7[129] = 0;
    if (v10)
    {
      id v9 = [v8 navigationController];
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v10, 1, 0);
    }
    else
    {
      if (!v5)
      {
        [v7 _cancelledConfirmed];
        goto LABEL_7;
      }
      id v9 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      [v8 presentViewController:v9 animated:1 completion:0];
    }

LABEL_7:
  }
}

- (void)reportAnalyticsEvent:(id)a3 pageTag:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPage, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);

  objc_storeStrong((id *)&self->_applyController, 0);
}

@end