@interface PKAccountBillPaymentController
- (NSArray)fundingSources;
- (NSArray)payments;
- (PKAccount)account;
- (PKAccountBillPaymentController)init;
- (PKAccountBillPaymentController)initWithAccount:(id)a3;
- (PKAccountBillPaymentController)initWithAccount:(id)a3 paymentPass:(id)a4;
- (PKAccountBillPaymentControllerDelegate)delegate;
- (id)_achPaymentWithAmount:(id)a3 bankInformation:(id)a4;
- (id)_apcPaymentWithAmount:(id)a3;
- (id)_bankAccountsForFundingSources:(id)a3;
- (id)_buildTransferRequestForDate:(id)a3;
- (id)_createSchedulePaymentRequestWithSelectedMethods:(unint64_t)a3 bankInformation:(id)a4;
- (id)_paymentSummaryItemsForPaymentAmountACH:(id)a3 apc:(id)a4 bankInformation:(id)a5;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_accountDidChange:(id)a3;
- (void)_addNewBankAccountIfNecessary:(id)a3;
- (void)_billPaymentHasCompletedWithState:(unint64_t)a3 error:(id)a4;
- (void)_completeFetchingFundingSources;
- (void)_fetchFundingSources;
- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4;
- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 completion:(id)a4;
- (void)_updateUseApplePayCashSetting:(BOOL)a3;
- (void)canPerformBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)performBillPaymentActionWithAmount:(id)a3;
- (void)performBillPaymentActionWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4;
- (void)performBillPaymentActionWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFundingSources:(id)a3;
- (void)setPayments:(id)a3;
@end

@implementation PKAccountBillPaymentController

- (PKAccountBillPaymentController)init
{
  return [(PKAccountBillPaymentController *)self initWithAccount:0];
}

- (PKAccountBillPaymentController)initWithAccount:(id)a3
{
  return [(PKAccountBillPaymentController *)self initWithAccount:a3 paymentPass:0];
}

- (PKAccountBillPaymentController)initWithAccount:(id)a3 paymentPass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKAccountBillPaymentController;
  v9 = [(PKAccountBillPaymentController *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    dataFetchingCompletionHandlers = v10->_dataFetchingCompletionHandlers;
    v10->_dataFetchingCompletionHandlers = (NSMutableSet *)v11;

    uint64_t v13 = +[PKAccountService sharedInstance];
    accountService = v10->_accountService;
    v10->_accountService = (PKAccountService *)v13;

    v15 = objc_alloc_init(PKPaymentService);
    paymentService = v10->_paymentService;
    v10->_paymentService = v15;

    uint64_t v17 = +[PKPaymentWebService sharedService];
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28C28] zero];
    totalPaymentAmount = v10->_totalPaymentAmount;
    v10->_totalPaymentAmount = (NSDecimalNumber *)v19;

    [(PKAccountBillPaymentController *)v10 _fetchFundingSources];
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v10 selector:sel__accountDidChange_ name:@"PKAccountServiceAccountsChangedNotification" object:0];
  }
  return v10;
}

- (void)_fetchFundingSources
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!self->_fetchingData)
  {
    v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Fetching funding sources in PKAccountBillPaymentController", (uint8_t *)buf, 2u);
    }

    self->_fetchingData = 1;
    if (PKUIOnlyDemoModeEnabled())
    {
      v4 = [[PKAccountPaymentFundingSource alloc] initWithType:1];
      v5 = [MEMORY[0x1E4F29128] UUID];
      v6 = [v5 UUIDString];
      [(PKAccountPaymentFundingSource *)v4 setIdentifier:v6];

      [(PKAccountPaymentFundingSource *)v4 setAccountSuffix:@"12345"];
      v13[0] = v4;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(PKAccountBillPaymentController *)self setFundingSources:v7];

      [(PKAccountBillPaymentController *)self _completeFetchingFundingSources];
    }
    else
    {
      objc_initWeak(buf, self);
      id v8 = +[PKAccountService sharedInstance];
      v9 = [(PKAccount *)self->_account accountIdentifier];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke;
      v10[3] = &unk_1E56DD060;
      objc_copyWeak(&v11, buf);
      [v8 updatePaymentFundingSourcesForAccountIdentifier:v9 force:1 completion:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

void __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke_2;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __54__PKAccountBillPaymentController__fetchFundingSources__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(const char **)(a1 + 32);
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Completed fetching funding sources in PKAccountBillPaymentController with error %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong(WeakRetained + 13, *(id *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        id v7 = "-[PKAccountBillPaymentController _fetchFundingSources]_block_invoke";
        __int16 v8 = 2048;
        v9 = WeakRetained;
        __int16 v10 = 2112;
        uint64_t v11 = v5;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "%s %p: Error: Get funding sources failed with error: %@.", (uint8_t *)&v6, 0x20u);
      }
    }
    else
    {
      [WeakRetained setFundingSources:*(void *)(a1 + 40)];
    }
    [WeakRetained _completeFetchingFundingSources];
  }
}

- (void)_completeFetchingFundingSources
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_fetchingData = 0;
  v3 = [(NSMutableSet *)self->_dataFetchingCompletionHandlers allObjects];
  v4 = (void *)[v3 copy];

  [(NSMutableSet *)self->_dataFetchingCompletionHandlers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_updateUseApplePayCashSetting:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(PKObject *)self->_pass settings];
  if (((v5 >> 9) & 1) != v3)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFDFFLL;
    uint64_t v7 = 512;
    if (!v3) {
      uint64_t v7 = 0;
    }
    pass = self->_pass;
    [(PKObject *)pass setSettings:v6 | v7];
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_schedulePaymentAuthorizationCoordinator == v4)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v9 = "-[PKAccountBillPaymentController paymentAuthorizationCoordinatorDidFinish:]";
      __int16 v10 = 2048;
      long long v11 = self;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v6[3] = &unk_1E56D8A90;
    v6[4] = self;
    uint64_t v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v8[3] = &unk_1E56D8AE0;
  unint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  return [v6 dismissWithCompletion:v8];
}

void __75__PKAccountBillPaymentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 120))
  {
    if (!*(unsigned char *)(v1 + 97))
    {
      *(unsigned char *)(v1 + 97) = 1;
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 120));
    }
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = [WeakRetained presentationSceneIdentifierForAccountBillPaymentController:self];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  aBlock[3] = &unk_1E56DD0B0;
  id v9 = v7;
  id v17 = v9;
  v18 = self;
  id v10 = v8;
  id v19 = v10;
  long long v11 = _Block_copy(aBlock);
  uint64_t v12 = [(PKPaymentWebService *)self->_webService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    webService = self->_webService;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4;
    v14[3] = &unk_1E56D8DF0;
    id v15 = v11;
    [v12 paymentWebService:webService deviceMetadataWithFields:251 completion:v14];
  }
  else
  {
    (*((void (**)(void *, void))v11 + 2))(v11, 0);
  }
}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  unint64_t v5 = [v3 bankAccountInformation];
  [a1[5] _addNewBankAccountIfNecessary:v5];
  unint64_t v6 = [a1[4] peerPaymentBalance];
  uint64_t v7 = [v6 amount];
  id v8 = a1[5];
  id v9 = (void *)v8[9];
  v8[9] = v7;

  unint64_t v10 = [a1[4] selectedMethods];
  [a1[5] _updateUseApplePayCashSetting:(v10 >> 1) & 1];
  long long v11 = [*((id *)a1[5] + 10) paymentSummaryItemsWithFundingSources:v10 bankAccount:v5];
  uint64_t v12 = [a1[5] _createSchedulePaymentRequestWithSelectedMethods:v10 bankInformation:v5];
  long long v13 = a1[5];
  v14 = (void *)v13[3];
  v13[3] = v12;

  [*((id *)a1[5] + 3) setDeviceMetadata:v4];
  id v15 = a1[5];
  v16 = (void *)v15[1];
  uint64_t v17 = v15[3];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2;
  v19[3] = &unk_1E56DD088;
  v19[4] = v15;
  id v20 = v11;
  id v21 = a1[6];
  id v18 = v11;
  [v16 schedulePaymentWithRequest:v17 completion:v19];
}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3;
  block[3] = &unk_1E56D8C20;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && !*(void *)(a1 + 40))
  {
    id v3 = *(void **)(*(void *)(a1 + 48) + 24);
    id v4 = [v2 referenceIdentifier];
    id v5 = [v3 manifestHashWithReferenceIdentifier:v4];

    id v6 = [PKApplePayTrustSignatureRequest alloc];
    uint64_t v7 = [*(id *)(a1 + 32) nonce];
    id v9 = [(PKApplePayTrustSignatureRequest *)v6 initWithKeyIdentifier:@"com.apple.wallet.applepaytrust" manifestHash:v5 nonce:v7];
  }
  else
  {
    id v9 = 0;
  }
  id v8 = [[PKPaymentRequestPaymentMethodUpdate alloc] initWithPaymentSummaryItems:*(void *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_5;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __111__PKAccountBillPaymentController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)canPerformBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke;
  aBlock[3] = &unk_1E56DD0D8;
  objc_copyWeak(&v26, &location);
  id v11 = v8;
  id v24 = v11;
  id v12 = v9;
  id v25 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v13;
  if (self->_fetchingData || !self->_fundingSources)
  {
    dataFetchingCompletionHandlers = self->_dataFetchingCompletionHandlers;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke_2;
    id v20 = &unk_1E56DD100;
    id v21 = v13;
    id v22 = v10;
    v16 = _Block_copy(&v17);
    -[NSMutableSet addObject:](dataFetchingCompletionHandlers, "addObject:", v16, v17, v18, v19, v20);

    if (!self->_fetchingData) {
      [(PKAccountBillPaymentController *)self _fetchFundingSources];
    }
  }
  else
  {
    (*((void (**)(void *, id))v13 + 2))(v13, v10);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
      id v4 = [WeakRetained _buildTransferRequestForDate:*(void *)(a1 + 40)];
      ((void (**)(id, BOOL, id))v5)[2](v5, v4 != 0, WeakRetained[13]);
    }
  }
  else if (v5)
  {
    v5[2](v5, 0, 0);
  }
}

uint64_t __91__PKAccountBillPaymentController_canPerformBillPaymentWithAmount_scheduledDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)performBillPaymentActionWithAmount:(id)a3
{
}

- (void)performBillPaymentActionWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4
{
}

- (void)performBillPaymentActionWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke;
  id v22 = &unk_1E56DB988;
  objc_super v23 = self;
  id v11 = v8;
  id v24 = v11;
  id v12 = v9;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  id v14 = (void (**)(void))_Block_copy(&v19);
  id v15 = v14;
  if (self->_performingAction)
  {
    v16 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:]";
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", buf, 0xCu);
    }

    -[PKAccountBillPaymentController _billPaymentHasCompletedWithState:error:](self, "_billPaymentHasCompletedWithState:error:", 2, 0, v19, v20, v21, v22, v23, v24, v25);
  }
  else if (self->_fetchingData)
  {
    dataFetchingCompletionHandlers = self->_dataFetchingCompletionHandlers;
    uint64_t v18 = _Block_copy(v14);
    -[NSMutableSet addObject:](dataFetchingCompletionHandlers, "addObject:", v18, v19, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    v14[2](v14);
  }
}

uint64_t __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) _buildTransferRequestForDate:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 56));
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_2;
  v8[3] = &unk_1E56DD150;
  v8[4] = v5;
  return [v5 _presentPaymentAuthorizationWithPaymentRequest:v6 completion:v8];
}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_3;
  block[3] = &unk_1E56DD128;
  char v9 = a2;
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    if (!*(void *)(*(void *)(a1 + 32) + 120))
    {
      dispatch_group_t v2 = dispatch_group_create();
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 120);
      *(void *)(v3 + 120) = v2;

      dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 120));
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(NSObject **)(v5 + 120);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_4;
      block[3] = &unk_1E56D8AE0;
      void block[4] = v5;
      dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
    }
    id v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmount"
            "DataEvent:]_block_invoke_3";
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", buf, 0x16u);
    }
  }
  else
  {
    char v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmount"
            "DataEvent:]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%s %p: Failed to present PKPaymentAuthorizationCoordinator.", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _billPaymentHasCompletedWithState:0 error:*(void *)(a1 + 40)];
  }
}

void __119__PKAccountBillPaymentController_performBillPaymentActionWithAmount_scheduledDate_billPaymentSuggestedAmountDataEvent___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 98))
  {
    id v3 = 0;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 40);
    if (v5)
    {
      id v3 = v5;
      uint64_t v4 = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      id v3 = 0;
      uint64_t v4 = 2;
    }
  }
  id v6 = v3;
  [(id)v2 _billPaymentHasCompletedWithState:v4 error:v3];
}

- (id)_createSchedulePaymentRequestWithSelectedMethods:(unint64_t)a3 bankInformation:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28C28];
  id v7 = a4;
  uint64_t v8 = [v6 zero];
  char v9 = [MEMORY[0x1E4F28C28] zero];
  paymentRequest = self->_paymentRequest;
  id v26 = v9;
  id v27 = v8;
  [(PKAccountServiceTransferRequest *)paymentRequest paymentAmountsWithFundingSources:a3 apc:&v27 ach:&v26];
  id v11 = v27;

  id v12 = v26;
  id v13 = objc_alloc_init(PKAccountScheduledPaymentList);
  __int16 v14 = [(PKAccountBillPaymentController *)self _achPaymentWithAmount:v12 bankInformation:v7];

  [(PKAccountScheduledPaymentList *)v13 addScheduledPayment:v14];
  uint64_t v15 = [(PKAccountBillPaymentController *)self _apcPaymentWithAmount:v11];
  [(PKAccountScheduledPaymentList *)v13 addScheduledPayment:v15];

  uint64_t v16 = objc_alloc_init(PKAccountPaymentScheduleDetails);
  [(PKAccountPaymentScheduleDetails *)v16 setFrequency:[(PKPaymentRequest *)self->_paymentRequest paymentFrequency]];
  [(PKAccountPaymentScheduleDetails *)v16 setPreset:1];
  uint64_t v17 = [(PKAccount *)self->_account creditDetails];
  uint64_t v18 = [v17 productTimeZone];
  [(PKAccountPaymentScheduleDetails *)v16 setScheduleTimeZone:v18];

  if ([(PKPaymentRequest *)self->_paymentRequest paymentFrequency] != 1)
  {
    uint64_t v19 = [(PKPaymentRequest *)self->_paymentRequest paymentDate];
    [(PKAccountPaymentScheduleDetails *)v16 setScheduledDate:v19];
  }
  if (v14)
  {
    uint64_t v20 = [(PKAccount *)self->_account schedulePaymentFeatureDescriptor];
    id v21 = [v20 paymentTermsIdentifier];

    [(PKAccountPaymentScheduleDetails *)v16 setPaymentTermsIdentifier:v21];
  }
  id v22 = objc_alloc_init(PKAccountWebServiceSchedulePaymentRequest);
  [(PKAccountWebServiceSchedulePaymentRequest *)v22 setScheduledPayments:v13];
  [(PKAccountWebServiceSchedulePaymentRequest *)v22 setScheduleDetails:v16];
  objc_super v23 = [(PKAccount *)self->_account accountIdentifier];
  [(PKAccountWebServiceSchedulePaymentRequest *)v22 setAccountIdentifier:v23];

  id v24 = [(PKAccount *)self->_account accountBaseURL];
  [(PKAccountWebServiceSchedulePaymentRequest *)v22 setBaseURL:v24];

  [(PKAccountWebServiceSchedulePaymentRequest *)v22 setCertificatesResponse:0];
  return v22;
}

- (id)_achPaymentWithAmount:(id)a3 bankInformation:(id)a4
{
  id v6 = (NSDecimalNumber *)a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v9 = [v8 compare:v6];

  if (v9 == -1)
  {
    id v11 = [[PKAccountPaymentFundingSource alloc] initWithType:1];
    id v12 = [(PKAccountPaymentFundingSource *)v11 fundingDetails];
    id v13 = [v7 identifier];
    if (v13)
    {
      [(PKAccountPaymentFundingSource *)v11 setIdentifier:v13];
    }
    else
    {
      __int16 v14 = [(PKAccount *)self->_account accountIdentifier];
      [v12 setAccountIdentifier:v14];

      uint64_t v15 = [v7 accountNumber];
      [v12 setAccountNumber:v15];

      uint64_t v16 = [v7 routingNumber];
      [v12 setRoutingNumber:v16];

      uint64_t v17 = [v7 bankName];
      [v12 setName:v17];
    }
    uint64_t v18 = [(PKAccount *)self->_account creditDetails];
    uint64_t v19 = [v18 currencyCode];
    uint64_t v20 = PKCurrencyAmountCreate(v6, v19, 0);

    uint64_t v10 = [[PKAccountScheduledPayment alloc] initWithCurrencyAmount:v20 fundingSource:v11];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_apcPaymentWithAmount:(id)a3
{
  uint64_t v4 = (NSDecimalNumber *)a3;
  uint64_t v5 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v6 = [v5 compare:v4];

  if (v6 == -1)
  {
    uint64_t v8 = [[PKAccountPaymentFundingSource alloc] initWithType:2];
    uint64_t v9 = [(PKAccount *)self->_account creditDetails];
    uint64_t v10 = [v9 currencyCode];
    id v11 = PKCurrencyAmountCreate(v4, v10, 0);

    id v7 = [[PKAccountScheduledPayment alloc] initWithCurrencyAmount:v11 fundingSource:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_buildTransferRequestForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PKPeerPaymentService sharedInstance];
  uint64_t v6 = [v5 account];

  id v7 = +[PKPassLibrary sharedInstance];
  uint64_t v8 = [v6 associatedPassUniqueID];
  uint64_t v9 = [v7 passWithUniqueID:v8];
  uint64_t v10 = [v9 paymentPass];

  totalPaymentAmount = self->_totalPaymentAmount;
  id v12 = [(PKAccount *)self->_account creditDetails];
  id v13 = [v12 currencyCode];
  __int16 v14 = PKCurrencyAmountCreate(totalPaymentAmount, v13, 0);

  uint64_t v15 = [[PKAccountServiceTransferRequest alloc] initWithAccount:self->_account peerPaymentAccount:v6 peerPaymentPass:v10 transferType:1 fundingSources:self->_fundingSources currencyAmount:v14 paymentDate:v4 objectSettings:self->_pass];
  [(PKPaymentRequest *)v15 setConfirmationStyle:0];
  [(PKPaymentRequest *)v15 setApplePayTrustSignatureRequest:0];

  return v15;
}

- (id)_bankAccountsForFundingSources:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bankAccountRepresentation", (void)v13);
          [v4 safelyAddObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  id v11 = objc_msgSend(v4, "copy", (void)v13);

  return v11;
}

- (void)_addNewBankAccountIfNecessary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = self->_fundingSources;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "identifier", (void)v25);
          id v11 = [v4 identifier];
          fundingSources = v10;
          long long v13 = v11;
          if (fundingSources == v13)
          {

            id v21 = (PKAccountPaymentFundingSource *)fundingSources;
            goto LABEL_19;
          }
          long long v14 = v13;
          if (fundingSources) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
          }
          else
          {
            char v16 = [(NSArray *)fundingSources isEqualToString:v13];

            if (v16) {
              goto LABEL_20;
            }
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v5 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
    uint64_t v17 = [(PKAccount *)self->_account accountIdentifier];
    [(NSArray *)v5 setAccountIdentifier:v17];

    uint64_t v18 = [v4 bankName];
    [(NSArray *)v5 setName:v18];

    -[NSArray setStatus:](v5, "setStatus:", [v4 status]);
    uint64_t v19 = [v4 routingNumber];
    [(NSArray *)v5 setRoutingNumber:v19];

    uint64_t v20 = [v4 accountNumber];
    [(NSArray *)v5 setAccountNumber:v20];

    id v21 = [[PKAccountPaymentFundingSource alloc] initWithType:1];
    id v22 = [v4 identifier];
    [(PKAccountPaymentFundingSource *)v21 setIdentifier:v22];

    objc_super v23 = [v4 accountSuffix];
    [(PKAccountPaymentFundingSource *)v21 setAccountSuffix:v23];

    [(PKAccountPaymentFundingSource *)v21 setFundingDetails:v5];
    id v24 = (NSArray *)[(NSArray *)self->_fundingSources mutableCopy];
    [(NSArray *)v24 addObject:v21];
    fundingSources = self->_fundingSources;
    self->_fundingSources = v24;
LABEL_19:

LABEL_20:
  }
}

- (id)_paymentSummaryItemsForPaymentAmountACH:(id)a3 apc:(id)a4 bankInformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = [(PKAccount *)self->_account feature];
  if (v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v19 = [v18 compare:v9];
    if (!v8 || v19 != -1) {
      goto LABEL_7;
    }
    uint64_t v20 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v21 = [v20 compare:v8];

    if (v10 && v21 == -1)
    {
      uint64_t v18 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_APC_ITEM", v17, 0, v12, v13, v14, v15, v16, v35);
      id v22 = [v10 bankName];
      long long v28 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ACH_ITEM_FORMAT", v17, @"%@", v23, v24, v25, v26, v27, (uint64_t)v22);

      uint64_t v29 = +[PKPaymentSummaryItem summaryItemWithLabel:v28 amount:v8];
      uint64_t v30 = +[PKPaymentSummaryItem summaryItemWithLabel:v18 amount:v9];
      [v11 safelyAddObject:v30];
      [v11 safelyAddObject:v29];

LABEL_7:
    }
  }
  v31 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_SCHEDULE_PAYMENT_ITEM_TOTAL", v17, 0, v12, v13, v14, v15, v16, v35);
  v32 = +[PKPaymentSummaryItem summaryItemWithLabel:v31 amount:self->_totalPaymentAmount];
  [v11 addObject:v32];

  v33 = (void *)[v11 copy];
  return v33;
}

- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[PKPaymentAuthorizationCoordinator alloc] initWithPaymentRequest:v6];
  schedulePaymentAuthorizationCoordinator = self->_schedulePaymentAuthorizationCoordinator;
  self->_schedulePaymentAuthorizationCoordinator = v8;

  [(PKPaymentAuthorizationCoordinator *)self->_schedulePaymentAuthorizationCoordinator setDelegate:self];
  [(PKPaymentAuthorizationCoordinator *)self->_schedulePaymentAuthorizationCoordinator _setPrivateDelegate:self];
  id v10 = self->_schedulePaymentAuthorizationCoordinator;
  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__PKAccountBillPaymentController__presentPaymentAuthorizationWithPaymentRequest_completion___block_invoke;
    v16[3] = &unk_1E56D86A8;
    id v17 = v6;
    id v18 = v7;
    [(PKPaymentAuthorizationCoordinator *)v10 presentWithCompletion:v16];

    id v11 = v17;
  }
  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v22 = "-[PKAccountBillPaymentController _presentPaymentAuthorizationWithPaymentRequest:completion:]";
      __int16 v23 = 2048;
      uint64_t v24 = self;
      __int16 v25 = 2048;
      id v26 = v6;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }

    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithFormat:@"PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %@.", v6];
    uint64_t v20 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v11 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:v15];

    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

void __92__PKAccountBillPaymentController__presentPaymentAuthorizationWithPaymentRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [NSString stringWithFormat:@"PKPaymentAuthorizationCoordinator could not be presented with paymentRequest: %@.", *(void *)(a1 + 32), *MEMORY[0x1E4F28568]];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v4 = [v5 errorWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:v7];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v4);
  }
}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
  aBlock[3] = &unk_1E56D8AE0;
  void aBlock[4] = self;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  if (PKUIOnlyDemoModeEnabled())
  {
    uint64_t v9 = [[PKPaymentAuthorizationResult alloc] initWithStatus:0 errors:0];
    self->_completedBillPayment = 1;
    id v10 = (PKAccountWebServiceApplePayTrustRequest *)[(PKAccount *)self->_account copy];
    id v11 = [(PKAccountWebServiceApplePayTrustRequest *)v10 creditDetails];
    uint64_t v24 = [v11 accountSummary];

    uint64_t v12 = [v24 adjustedBalance];
    uint64_t v13 = [v12 decimalNumberBySubtracting:self->_totalPaymentAmount];
    [(PKAccountWebServiceApplePayTrustRequest *)v10 creditDetails];
    uint64_t v15 = v14 = v7;
    [v15 accountSummary];
    id v17 = v16 = v6;
    [v17 setCurrentBalance:v13];

    id v7 = v14;
    v8[2](v8);
    accountService = self->_accountService;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3_91;
    v25[3] = &unk_1E56DD210;
    id v26 = v9;
    id v27 = v14;
    uint64_t v19 = v9;
    uint64_t v20 = accountService;
    id v6 = v16;
    [(PKAccountService *)v20 updateMockAccountWithAccount:v10 completion:v25];

    uint64_t v21 = v24;
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_performBillPaymentGroup);
    id v10 = [[PKAccountWebServiceApplePayTrustRequest alloc] initWithApplePayTrustProtocol:self->_schedulePaymentRequest];
    [(PKAccountWebServiceApplePayTrustRequest *)v10 setSignature:v6];
    webService = self->_webService;
    account = self->_account;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
    v28[3] = &unk_1E56DD1E8;
    v28[4] = self;
    uint64_t v29 = v8;
    id v30 = v7;
    [(PKPaymentWebService *)webService applePayTrustSignatureRequestWithRequest:v10 account:account completion:v28];

    uint64_t v21 = v29;
  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
  char v2 = objc_opt_respondsToSelector();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    id v4 = [*(id *)(v3 + 48) uniqueID];
    [WeakRetained recomputeCategoryVisualizationMangitudesForPassUniqueID:v4 style:2 paymentService:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    id v5 = *(void **)(v3 + 16);
    id v4 = [*(id *)(v3 + 48) uniqueID];
    [v5 recomputeCategoryVisualizationMangitudesForPassUniqueID:v4 style:2];
  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3;
  block[3] = &unk_1E56DD1C0;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    BOOL v2 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  BOOL v3 = !v2;
  id v4 = [[PKPaymentAuthorizationResult alloc] initWithStatus:!v2 errors:0];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 40), *(id *)(a1 + 40));
    uint64_t v20 = *(void *)(a1 + 64);
    if (v20) {
      (*(void (**)(uint64_t, PKPaymentAuthorizationResult *))(v20 + 16))(v20, v4);
    }
    uint64_t v21 = *(NSObject **)(*(void *)(a1 + 48) + 120);
    if (v21) {
      dispatch_group_leave(v21);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) payments];
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(v6 + 152);
    *(void *)(v6 + 152) = v5;

    *(unsigned char *)(*(void *)(a1 + 48) + 98) = 1;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(v8 + 88);
    if (v9)
    {
      id v10 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v9;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Inserting bill payment selected suggested amount data for successful payment: %@", buf, 0xCu);
      }

      id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(*(void *)(a1 + 48) + 88)];
      id v12 = [*(id *)(*(void *)(a1 + 48) + 128) accountIdentifier];
      [*(id *)(*(void *)(a1 + 48) + 56) insertEvents:v11 withAccountidentifier:v12 completion:&__block_literal_global_22];

      uint64_t v8 = *(void *)(a1 + 48);
    }
    uint64_t v13 = [*(id *)(v8 + 24) scheduleDetails];
    uint64_t v14 = [v13 frequency];

    if (v14 == 1) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(v15 + 56);
    uint64_t v17 = *(void *)(v15 + 128);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_88;
    v22[3] = &unk_1E56DD198;
    id v25 = *(id *)(a1 + 64);
    id v18 = v4;
    uint64_t v19 = *(void *)(a1 + 48);
    __int16 v23 = v18;
    uint64_t v24 = v19;
    [v16 updateScheduledPaymentsWithAccount:v17 completion:v22];
  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Error inserting bill payment selected suggested amount data: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_88(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2_89;
  block[3] = &unk_1E56D8428;
  id v7 = *(id *)(a1 + 48);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2_89(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = *(NSObject **)(a1[5] + 120);
  if (v3)
  {
    dispatch_group_leave(v3);
  }
}

uint64_t __96__PKAccountBillPaymentController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3_91(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_billPaymentHasCompletedWithState:(unint64_t)a3 error:(id)a4
{
  id v13 = a4;
  applePayTrustResponseError = self->_applePayTrustResponseError;
  self->_applePayTrustResponseError = 0;

  schedulePaymentRequest = self->_schedulePaymentRequest;
  self->_schedulePaymentRequest = 0;

  billPaymentSuggestedAmountDataEvent = self->_billPaymentSuggestedAmountDataEvent;
  self->_billPaymentSuggestedAmountDataEvent = 0;

  self->_performingAction = 0;
  self->_completedBillPayment = 0;
  performBillPaymentGroup = self->_performBillPaymentGroup;
  self->_performBillPaymentGroup = 0;

  self->_dismissedBillPayment = 0;
  id v10 = [(PKAccountBillPaymentController *)self delegate];
  id v11 = v10;
  if (a3 == 1)
  {
    [v10 accountBillPaymentController:self hasChangedState:1 error:0 updatedAccount:0];

    accountService = self->_accountService;
    id v11 = [(PKAccount *)self->_account accountIdentifier];
    [(PKAccountService *)accountService updateAccountWithIdentifier:v11 extended:0 completion:0];
  }
  else
  {
    [v10 accountBillPaymentController:self hasChangedState:a3 error:v13 updatedAccount:0];
  }
}

- (void)_accountDidChange:(id)a3
{
  account = self->_account;
  if (account)
  {
    accountService = self->_accountService;
    uint64_t v6 = [(PKAccount *)account accountIdentifier];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PKAccountBillPaymentController__accountDidChange___block_invoke;
    v7[3] = &unk_1E56DD238;
    v7[4] = self;
    [(PKAccountService *)accountService accountWithIdentifier:v6 completion:v7];
  }
}

void __52__PKAccountBillPaymentController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PKAccountBillPaymentController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E56D8A90;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __52__PKAccountBillPaymentController__accountDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccount:*(void *)(a1 + 40)];
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKAccountBillPaymentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKAccountBillPaymentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_performBillPaymentGroup, 0);
  objc_storeStrong((id *)&self->_dataFetchingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_fetchingDataError, 0);
  objc_storeStrong((id *)&self->_billPaymentSuggestedAmountDataEvent, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
  objc_storeStrong((id *)&self->_totalPaymentAmount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_applePayTrustResponseError, 0);
  objc_storeStrong((id *)&self->_schedulePaymentAuthorizationCoordinator, 0);
  objc_storeStrong((id *)&self->_schedulePaymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_webService, 0);
}

@end