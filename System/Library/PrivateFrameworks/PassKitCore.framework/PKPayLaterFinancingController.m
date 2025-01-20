@interface PKPayLaterFinancingController
- (BOOL)_eligibleToFetchFinancingOptionsWithPayLaterAccount:(id)a3 transactionAmount:(id)a4;
- (BOOL)_updateStateWithResponse:(id)a3;
- (BOOL)autoPaymentOn;
- (BOOL)canShowPayLaterTab;
- (BOOL)hasSeenLanguageNotice;
- (NSError)loadingError;
- (NSString)referrerIdentifier;
- (PKAccount)payLaterAccount;
- (PKAccountService)accountService;
- (PKCurrencyAmount)transactionCurrencyAmount;
- (PKPassLibrary)passLibrary;
- (PKPayLaterDynamicContent)dynamicContent;
- (PKPayLaterFinancingController)initWithAccountService:(id)a3 paymentService:(id)a4 peerPaymentService:(id)a5 paymentWebService:(id)a6 passLibrary:(id)a7 payLaterAccount:(id)a8 configuration:(id)a9;
- (PKPayLaterFinancingControllerConfiguration)configuration;
- (PKPayLaterPaymentSource)selectedFundingSource;
- (PKPayLaterProductAssessmentCollection)assessmentCollection;
- (PKPaymentPass)payLaterPass;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (id)availableFundingSourcesForFinancingOption:(id)a3;
- (id)bnplPayLaterTabDynamicContentItem;
- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5;
- (id)dynamicContentPageItemForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5;
- (id)dynamicContentSectionsForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5;
- (unint64_t)languageDisclosureLocation;
- (unint64_t)loadingState;
- (unint64_t)payLaterPassEligibility;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addFinancingOptionRequest:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_informObserversAssessmentCollectionChanged;
- (void)_informObserversFinancingOptionCancelled:(id)a3;
- (void)_payLaterAccountWithCompletion:(id)a3;
- (void)_reportEndSignpostIfNecessary;
- (void)_reportEventSignpostIfNecessary;
- (void)_updateLoadingState:(unint64_t)a3;
- (void)_updatePayLaterPassEligibility;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)dealloc;
- (void)fetchPayLaterDynamicContentForType:(unint64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)refreshAvailableFundingSources;
- (void)registerObserver:(id)a3;
- (void)setAutoPaymentOn:(BOOL)a3;
- (void)setHasSeenLanguageNotice:(BOOL)a3;
- (void)setPayLaterAccount:(id)a3;
- (void)setPayLaterPass:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setSelectedFundingSource:(id)a3;
- (void)stateMachineUpdatedAuthenticationState:(unint64_t)a3 selectedOptionIdentifier:(id)a4 error:(id)a5 cancelReason:(int64_t)a6;
- (void)unregisterObserver:(id)a3;
- (void)updateFinancingOptionsWithCompletion:(id)a3;
@end

@implementation PKPayLaterFinancingController

- (PKPayLaterFinancingController)initWithAccountService:(id)a3 paymentService:(id)a4 peerPaymentService:(id)a5 paymentWebService:(id)a6 passLibrary:(id)a7 payLaterAccount:(id)a8 configuration:(id)a9
{
  id v16 = a3;
  id obj = a4;
  id v40 = a4;
  id v17 = a5;
  id v18 = a6;
  id v41 = a7;
  id v37 = a8;
  id v38 = a8;
  id v19 = a9;
  v20 = 0;
  v39 = v17;
  if (v19 && v17 && v41 && v40 && v16 && v18)
  {
    id v21 = v19;
    v43.receiver = self;
    v43.super_class = (Class)PKPayLaterFinancingController;
    v22 = [(PKPayLaterFinancingController *)&v43 init];
    if (v22)
    {
      id v35 = v16;
      PKLogFacilityTypeGetObject(0x23uLL);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, v22);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_190E10000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "request:paylater:financingOptions", "", buf, 2u);
        }
      }

      objc_storeStrong((id *)&v22->_accountService, a3);
      objc_storeStrong((id *)&v22->_paymentWebService, a6);
      objc_storeStrong((id *)&v22->_peerPaymentService, a5);
      uint64_t v26 = [v39 account];
      peerPaymentAccount = v22->_peerPaymentAccount;
      v22->_peerPaymentAccount = (PKPeerPaymentAccount *)v26;

      objc_storeStrong((id *)&v22->_passLibrary, a7);
      objc_storeStrong((id *)&v22->_paymentService, obj);
      objc_storeStrong((id *)&v22->_configuration, a9);
      objc_storeStrong((id *)&v22->_payLaterAccount, v37);
      v22->_lockObservers._os_unfair_lock_opaque = 0;
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      observers = v22->_observers;
      v22->_observers = (NSHashTable *)v28;

      v30 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      queuedRequests = v22->_queuedRequests;
      v22->_queuedRequests = v30;

      dispatch_queue_t v32 = dispatch_queue_create("com.apple.passkit.PKPayLaterFinancingController.reply", 0);
      replyQueue = v22->_replyQueue;
      v22->_replyQueue = (OS_dispatch_queue *)v32;

      v22->_loadingState = 1;
      v22->_optionFetchIneligibleReason = 0;
      [(PKAccountService *)v22->_accountService registerObserver:v22];
      [(PKPayLaterFinancingController *)v22 _payLaterAccountWithCompletion:0];
      id v16 = v35;
    }
    self = v22;
    v20 = self;
    id v19 = v21;
  }

  return v20;
}

- (void)dealloc
{
  [(PKPayLaterFinancingController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingController;
  [(PKPayLaterFinancingController *)&v3 dealloc];
}

- (id)dynamicContentPageItemForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  v5 = [(PKPayLaterDynamicContent *)self->_dynamicContent dynamicContentPageForPageType:a3 productType:a4 optionIdentifier:a5];
  v6 = [v5 contentItem];

  return v6;
}

- (id)bnplPayLaterTabDynamicContentItem
{
  objc_super v3 = [(PKPayLaterProductAssessmentCollection *)self->_assessmentCollection productAssessmentForProductType:1];
  v4 = [v3 financingOptions];
  v5 = [v4 firstObject];
  v6 = [v5 identifier];

  v7 = [(PKPayLaterFinancingController *)self dynamicContentPageItemForPageType:1 productType:1 optionIdentifier:v6];

  return v7;
}

- (id)dynamicContentSectionsForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  v5 = [(PKPayLaterDynamicContent *)self->_dynamicContent dynamicContentPageForPageType:a3 productType:a4 optionIdentifier:a5];
  v6 = [v5 sections];

  return v6;
}

- (id)dynamicContentPageForPageType:(unint64_t)a3 productType:(unint64_t)a4 optionIdentifier:(id)a5
{
  return [(PKPayLaterDynamicContent *)self->_dynamicContent dynamicContentPageForPageType:a3 productType:a4 optionIdentifier:a5];
}

- (PKPaymentPass)payLaterPass
{
  payLaterPass = self->_payLaterPass;
  if (!payLaterPass)
  {
    passLibrary = self->_passLibrary;
    v5 = [(PKAccount *)self->_payLaterAccount associatedPassUniqueID];
    v6 = [(PKPassLibrary *)passLibrary passWithUniqueID:v5];
    v7 = [v6 paymentPass];
    v8 = self->_payLaterPass;
    self->_payLaterPass = v7;

    payLaterPass = self->_payLaterPass;
  }
  v9 = payLaterPass;
  return v9;
}

- (void)setPayLaterAccount:(id)a3
{
  v5 = (PKAccount *)a3;
  payLaterAccount = self->_payLaterAccount;
  if (v5 && payLaterAccount)
  {
    if ([(PKAccount *)payLaterAccount isEqual:v5]) {
      goto LABEL_14;
    }
  }
  else if (payLaterAccount == v5)
  {
    goto LABEL_14;
  }
  v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Pay later account changed", buf, 2u);
  }

  v8 = [(PKPayLaterFinancingController *)self payLaterPass];
  objc_storeStrong((id *)&self->_payLaterAccount, a3);
  uint64_t v9 = [(PKPayLaterFinancingController *)self payLaterPass];
  v10 = (void *)v9;
  if (!v8 && v9)
  {
    v11 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterFinancingController: The pay later pass is now provisioned", v12, 2u);
    }

    [(PKPayLaterFinancingController *)self _updatePayLaterPassEligibility];
    [(PKPayLaterFinancingController *)self refreshAvailableFundingSources];
    [(PKPayLaterFinancingController *)self _informObserversAssessmentCollectionChanged];
  }

LABEL_14:
}

- (void)updateFinancingOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [PKPayLaterFinancingControllerRequest alloc];
  v6 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration transactionAmount];
  v7 = [(PKPayLaterFinancingControllerRequest *)v5 initWithTransactionAmount:v6 completion:v4];

  [(PKPayLaterFinancingController *)self _addFinancingOptionRequest:v7];
}

- (void)stateMachineUpdatedAuthenticationState:(unint64_t)a3 selectedOptionIdentifier:(id)a4 error:(id)a5 cancelReason:(int64_t)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 5) {
        v13 = @"error";
      }
      else {
        v13 = off_1E56E6018[a3];
      }
      int v25 = 138412802;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Received state machine authentication state: %@, optionIdentifier: %@, error %@", (uint8_t *)&v25, 0x20u);
    }

    v14 = [v11 userInfo];
    v15 = [v14 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v15) {
      id v16 = v15;
    }
    else {
      id v16 = v11;
    }
    id v17 = v16;

    id v18 = [PKPayLaterFinancingControllerRequest alloc];
    id v19 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration transactionAmount];
    v20 = [(PKPayLaterFinancingControllerRequest *)v18 initWithTransactionAmount:v19 optionIdentifierToCancel:v10 authenticationState:a3 stateMachineError:v17 stateMachineCancelReason:a6 completion:0];

    switch(a3)
    {
      case 1uLL:
      case 4uLL:
        objc_storeStrong((id *)&self->_pendingCancellationRequest, v20);
        break;
      case 2uLL:
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          PKPaymentAuthorizationStateMachineCancelReasonToString(a6);
          id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v25 = 138412290;
          uint64_t v26 = v21;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "State machine cancelation reason: %@", (uint8_t *)&v25, 0xCu);
        }
        [(PKPayLaterFinancingController *)self _addFinancingOptionRequest:v20];
        break;
      case 3uLL:
        if (self->_pendingCancellationRequest)
        {
          v22 = self;
          pendingCancellationRequest = v20;
          goto LABEL_19;
        }
        break;
      case 5uLL:
        pendingCancellationRequest = self->_pendingCancellationRequest;
        if (pendingCancellationRequest)
        {
          v22 = self;
LABEL_19:
          [(PKPayLaterFinancingController *)v22 _addFinancingOptionRequest:pendingCancellationRequest];
          os_signpost_id_t v24 = self->_pendingCancellationRequest;
          self->_pendingCancellationRequest = 0;
        }
        break;
      default:
        break;
    }

    id v11 = v17;
  }
}

- (void)fetchPayLaterDynamicContentForType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__30;
  v22[4] = __Block_byref_object_dispose__30;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__30;
  v20[4] = __Block_byref_object_dispose__30;
  id v21 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke;
  v18[3] = &unk_1E56E5CB0;
  objc_copyWeak(&v19, &location);
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_4;
  v16[3] = &unk_1E56E5D28;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  v16[4] = v20;
  v16[5] = v22;
  [(PKAsyncUnaryOperationComposer *)v7 addOperation:v16];
  v8 = [MEMORY[0x1E4F1CA98] null];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_8;
  v11[3] = &unk_1E56E5D78;
  objc_copyWeak(&v15, &location);
  v13 = v22;
  v14 = v20;
  id v9 = v6;
  id v12 = v9;
  id v10 = [(PKAsyncUnaryOperationComposer *)v7 evaluateWithInput:v8 completion:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&v19);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  objc_destroyWeak(&location);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_2;
    v9[3] = &unk_1E56DD210;
    id v11 = v7;
    id v10 = v6;
    [WeakRetained _payLaterAccountWithCompletion:v9];
  }
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v8 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(a1[6] + 16))(a1[6], a1[4], a1[5] == 0);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_5;
  v10[3] = &unk_1E56E5D00;
  objc_copyWeak(v14, (id *)(a1 + 48));
  v14[1] = *(id *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(v14);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(PKAccountWebServicePayLaterContentRequest);
    v5 = [WeakRetained[3] accountIdentifier];
    [(PKAccountWebServicePayLaterContentRequest *)v4 setAccountIdentifier:v5];

    id v6 = [WeakRetained[3] accountBaseURL];
    [(PKAccountWebServicePayLaterContentRequest *)v4 setBaseURL:v6];

    [(PKAccountWebServicePayLaterContentRequest *)v4 setType:*(void *)(a1 + 72)];
    id v7 = WeakRetained[28];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_6;
    v10[3] = &unk_1E56E5CD8;
    objc_copyWeak(&v14, v2);
    uint64_t v13 = *(void *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 40);
    id v8 = (id)v9;
    long long v12 = v9;
    id v11 = *(id *)(a1 + 32);
    [v7 accountPayLaterContentWithRequest:v4 completion:v10];

    objc_destroyWeak(&v14);
  }
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_7;
  block[3] = &unk_1E56E5E90;
  objc_copyWeak(&v17, (id *)(a1 + 64));
  uint64_t v16 = *(void *)(a1 + 56);
  id v12 = v6;
  id v13 = v5;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v10;
  long long v15 = v10;
  id v14 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v17);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    if (!v3)
    {
      uint64_t v4 = [*(id *)(a1 + 40) dynamicContent];
      uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      uint64_t v3 = *(void *)(a1 + 32);
    }
    (*(void (**)(void, void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), v3 != 0);
    id WeakRetained = v7;
  }
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_9;
  block[3] = &unk_1E56E5D50;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v13 = v6;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v9;
  long long v12 = v9;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __79__PKPayLaterFinancingController_fetchPayLaterDynamicContentForType_completion___block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
      || [*(id *)(a1 + 32) isCanceled])
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v4 = *(void **)(v3 + 40);
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void **)(v3 + 40);
        *(void *)(v3 + 40) = v5;
      }
      else
      {
        uint64_t v6 = PKLocalizedPaymentString(&cfstr_GenericErrorTi.isa, 0);
        id v7 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa, 0);
        uint64_t v8 = PKDisplayableErrorCustomWithType(-1, v6, v7, 0, 0);
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        long long v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
    }
    objc_storeStrong(v11 + 24, *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v11;
  }
}

- (void)refreshAvailableFundingSources
{
  [(PKPayLaterAvailableFundingSourcesFilter *)self->_availableFundingSourcesFilter clearCache];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKPayLaterFinancingController_refreshAvailableFundingSources__block_invoke;
  v3[3] = &unk_1E56E5DA0;
  v3[4] = self;
  [(PKPayLaterFinancingController *)self _accessObserversWithHandler:v3];
}

void __63__PKPayLaterFinancingController_refreshAvailableFundingSources__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 payLaterAvailableFundingSourcesDidChange:*(void *)(a1 + 32)];
  }
}

- (void)invalidate
{
  pendingCancellationRequest = self->_pendingCancellationRequest;
  self->_pendingCancellationRequest = 0;

  accountService = self->_accountService;
  [(PKAccountService *)accountService unregisterObserver:self];
}

- (id)availableFundingSourcesForFinancingOption:(id)a3
{
  id v4 = a3;
  if (([v4 supportedRepaymentTypes] & 8) != 0)
  {
    uint64_t v6 = [v4 supportedRepaymentFundingSourceIdentifiers];
    bankFundingSources = self->_bankFundingSources;
    uint64_t v8 = [v6 allObjects];
    uint64_t v9 = [(NSDictionary *)bankFundingSources dictionaryWithValuesForKeys:v8];
    id v5 = [v9 allValues];
  }
  else
  {
    id v5 = 0;
  }
  long long v10 = [(PKPayLaterAvailableFundingSourcesFilter *)self->_availableFundingSourcesFilter availableFundingSourcesForFinancingOption:v4 eligibleBankSources:v5 lastUsedFundingSources:self->_lastUsedFundingSources];

  return v10;
}

- (PKCurrencyAmount)transactionCurrencyAmount
{
  id v3 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration transactionAmount];
  id v4 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration currencyCode];
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = PKCurrencyAmountCreate(v3, v4, 0);
  }

  return (PKCurrencyAmount *)v7;
}

- (void)setSelectedFundingSource:(id)a3
{
  id v11 = a3;
  id v4 = [v11 identifier];
  id v5 = [(PKPayLaterPaymentSource *)self->_selectedFundingSource identifier];
  selectedFundingSource = v4;
  id v7 = v5;
  if (selectedFundingSource == v7)
  {

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  if (!selectedFundingSource || !v7)
  {

    goto LABEL_8;
  }
  char v9 = [(PKPayLaterPaymentSource *)selectedFundingSource isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    long long v10 = (PKPayLaterPaymentSource *)v11;
    selectedFundingSource = self->_selectedFundingSource;
    self->_selectedFundingSource = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)canShowPayLaterTab
{
  v2 = self;
  payLaterAccount = self->_payLaterAccount;
  id v4 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration transactionAmount];
  LOBYTE(v2) = [(PKPayLaterFinancingController *)v2 _eligibleToFetchFinancingOptionsWithPayLaterAccount:payLaterAccount transactionAmount:v4];

  return (char)v2;
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKPayLaterFinancingController_accountChanged___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__PKPayLaterFinancingController_accountChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) feature] != 3) {
    return;
  }
  v2 = [*(id *)(a1 + 32) accountIdentifier];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) accountIdentifier];
  id v8 = v2;
  id v4 = v3;
  if (v8 == v4)
  {

LABEL_8:
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(a1 + 40);
    [v6 setPayLaterAccount:v7];
    return;
  }
  if (v8 && v4)
  {
    char v5 = [v8 isEqualToString:v4];

    if ((v5 & 1) == 0) {
      return;
    }
    goto LABEL_8;
  }
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPayLaterFinancingController_accountAdded___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __46__PKPayLaterFinancingController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) feature];
  if (result == 3)
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pay later account added", v4, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), *(id *)(a1 + 32));
    return [*(id *)(a1 + 40) updateFinancingOptionsWithCompletion:0];
  }
  return result;
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PKPayLaterFinancingController_accountRemoved___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __48__PKPayLaterFinancingController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) feature];
  if (result == 3)
  {
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pay later account removed", v6, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;

    return [*(id *)(a1 + 40) updateFinancingOptionsWithCompletion:0];
  }
  return result;
}

- (BOOL)_eligibleToFetchFinancingOptionsWithPayLaterAccount:(id)a3 transactionAmount:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_payLaterAccount)
  {
    long long v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no pay later account defined", buf, 2u);
    }

    BOOL v10 = 0;
    unint64_t v11 = 2;
    goto LABEL_42;
  }
  unint64_t v8 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration channel];
  if (v8 - 2 < 2)
  {
    if ([v6 hidePayLaterSetupInWallet])
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since \"hidePayLaterSetupInWallet\" is true.", buf, 2u);
      }

      BOOL v10 = 0;
      unint64_t v11 = 10;
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_31;
    }
    if ([v6 hidePayLaterInPaymentSheet])
    {
      char v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since \"hidePayLaterInPaymentSheet\" is true.", buf, 2u);
      }

      BOOL v10 = 0;
      unint64_t v11 = 11;
      goto LABEL_42;
    }
    if (_os_feature_enabled_impl())
    {
      id v14 = [(PKPayLaterFinancingController *)self payLaterPass];

      if (v14)
      {
        if (PKHideCardBenefitPayLater())
        {
          long long v15 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the user has turned off the \"Pay Later Card Benefit\" switch in settings", buf, 2u);
          }

          BOOL v10 = 0;
          unint64_t v11 = 12;
          goto LABEL_42;
        }
LABEL_31:
        if (!v7)
        {
          __int16 v27 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no transactionAmount defined", buf, 2u);
          }

          BOOL v10 = 0;
          unint64_t v11 = 3;
          goto LABEL_42;
        }
        id v17 = [(PKPayLaterFinancingControllerConfiguration *)self->_configuration currencyCode];
        if (!v17)
        {
          __int16 v29 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because there is no currencyCode defined", buf, 2u);
          }

          BOOL v10 = 0;
          self->_optionFetchIneligibleReason = 4;
          goto LABEL_56;
        }
        id v18 = [v6 payLaterDetails];
        id v19 = [v18 countryCode];

        v20 = PKCurrentRegion();
        id v21 = [v6 payLaterDetails];
        char v22 = [v21 isPayLaterSupportedInCurrentRegion];

        if ((v22 & 1) == 0)
        {
          id v30 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v45 = v19;
            __int16 v46 = 2112;
            v47 = v20;
            _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since the account countryCode: %@, doesn't match the device country code: %@", buf, 0x16u);
          }

          BOOL v10 = 0;
          self->_optionFetchIneligibleReason = 5;
          goto LABEL_55;
        }
        id v23 = [(PKPaymentWebService *)self->_paymentWebService context];
        os_signpost_id_t v24 = [v23 configuration];
        if (([v24 applyServiceEnabledForRegion:v20] & 1) == 0)
        {
          uint64_t v31 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since apply service is not enabled for device region", buf, 2u);
          }

          BOOL v10 = 0;
          unint64_t v26 = 6;
          goto LABEL_53;
        }
        if (PKIsManagedAppleID())
        {
          int v25 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later feature is not supported for Managed Apple ID", buf, 2u);
          }

          BOOL v10 = 0;
          unint64_t v26 = 8;
LABEL_53:
          self->_optionFetchIneligibleReason = v26;
LABEL_54:

LABEL_55:
LABEL_56:

          goto LABEL_43;
        }
        id v40 = v24;
        dispatch_queue_t v32 = [v23 applyServiceFeaturesForRegionMeetingEnablementThreshold:v20];
        uint64_t v33 = PKDeviceSupportedFeatureIdentifiers();
        id v34 = objc_alloc(MEMORY[0x1E4F1CA80]);
        objc_super v43 = v32;
        id v35 = [v32 allKeys];
        uint64_t v36 = [v34 initWithArray:v35];

        v42 = (void *)v33;
        [(id)v36 intersectSet:v33];
        id v37 = PKFeatureIdentifierToString(3);
        id v41 = (void *)v36;
        LOBYTE(v36) = [(id)v36 containsObject:v37];

        if (v36)
        {
          if (PKDeviceSupportsApplicationForFeatureIdentifier(3))
          {
            os_signpost_id_t v24 = v40;
            if (self->_loadingState)
            {
              unint64_t v38 = 0;
              BOOL v10 = 1;
LABEL_71:
              self->_optionFetchIneligibleReason = v38;

              goto LABEL_54;
            }
            v39 = PKLogFacilityTypeGetObject(6uLL);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the loading state is not applicable", buf, 2u);
            }
            unint64_t v38 = 1;
          }
          else
          {
            v39 = PKLogFacilityTypeGetObject(6uLL);
            os_signpost_id_t v24 = v40;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later application not supported on device type", buf, 2u);
            }
            unint64_t v38 = 9;
          }
        }
        else
        {
          v39 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v39, OS_LOG_TYPE_DEFAULT, "Not fetching financing options since pay later feature is not supported", buf, 2u);
          }
          unint64_t v38 = 7;
          os_signpost_id_t v24 = v40;
        }

        BOOL v10 = 0;
        goto LABEL_71;
      }
      if (!PKHidePayLaterOptions()) {
        goto LABEL_31;
      }
      uint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (!PKHidePayLaterOptions()) {
        goto LABEL_31;
      }
      uint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
    }
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Not fetching financing options because the user has turned off the \"Pay Later Offers\" switch in settings", buf, 2u);
LABEL_30:

    BOOL v10 = 0;
    unint64_t v11 = 13;
    goto LABEL_42;
  }
  BOOL v10 = 0;
  unint64_t v11 = 1;
LABEL_42:
  self->_optionFetchIneligibleReason = v11;
LABEL_43:

  return v10;
}

- (void)_addFinancingOptionRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (PKPayLaterFinancingControllerRequest *)a3;
  if (v4)
  {
    if ([(PKPayLaterFinancingControllerRequest *)self->_currentRequest coalesceWithRequest:v4])
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      id v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEFAULT))
      {
        currentRequest = self->_currentRequest;
        *(_DWORD *)buf = 138412290;
        v20 = currentRequest;
        _os_log_impl(&dword_190E10000, &v5->super.super, OS_LOG_TYPE_DEFAULT, "Coalescing incoming pay later financing controller request onto current request %@", buf, 0xCu);
      }
LABEL_19:
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = self->_queuedRequests;
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v5);
            }
            unint64_t v11 = *(PKPayLaterFinancingControllerRequest **)(*((void *)&v14 + 1) + 8 * i);
            if (-[PKPayLaterFinancingControllerRequest coalesceWithRequest:](v11, "coalesceWithRequest:", v4, (void)v14))
            {
              uint64_t v13 = PKLogFacilityTypeGetObject(0xEuLL);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v11;
                _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Coalescing incoming pay later financing controller request onto queued request %@", buf, 0xCu);
              }

              goto LABEL_19;
            }
          }
          uint64_t v8 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      [(NSMutableOrderedSet *)self->_queuedRequests addObject:v4];
      long long v12 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Adding incoming pay later financing controller request onto queued list %@", buf, 0xCu);
      }

      [(PKPayLaterFinancingController *)self _executeNextRequestIfPossible];
    }
  }
}

- (void)_executeNextRequestIfPossible
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!self->_currentRequest)
  {
    id v3 = [(NSMutableOrderedSet *)self->_queuedRequests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    id v5 = self->_currentRequest;
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Starting pay later financing controller request %@", (uint8_t *)&buf, 0xCu);
      }

      [(NSMutableOrderedSet *)self->_queuedRequests removeObjectAtIndex:0];
      uint64_t v7 = [(PKPayLaterFinancingControllerRequest *)self->_currentRequest amount];
      uint64_t v8 = [(PKPayLaterFinancingControllerRequest *)self->_currentRequest optionIdentifierToCancel];
      uint64_t v9 = [(PKPayLaterFinancingControllerRequest *)self->_currentRequest authenticationState];
      BOOL v10 = [(PKPayLaterFinancingControllerRequest *)self->_currentRequest stateMachineCancelReason];
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      int v12 = !v11;
      if (v8) {
        BOOL v13 = v9 == (void *)2;
      }
      else {
        BOOL v13 = 0;
      }
      int v14 = !v13;
      if (v7) {
        int v15 = v14;
      }
      else {
        int v15 = 0;
      }
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke;
      aBlock[3] = &unk_1E56E5DC8;
      objc_copyWeak(&v44, &location);
      char v45 = v12;
      id v16 = v8;
      id v43 = v16;
      long long v17 = _Block_copy(aBlock);
      id v18 = objc_alloc_init(PKAsyncUnaryOperationComposer);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v48 = 0x3032000000;
      v49 = __Block_byref_object_copy__30;
      v50 = __Block_byref_object_dispose__30;
      id v51 = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      char v41 = 0;
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3032000000;
      v38[3] = __Block_byref_object_copy__30;
      v38[4] = __Block_byref_object_dispose__30;
      id v39 = 0;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_52;
      v36[3] = &unk_1E56E5E18;
      v36[4] = self;
      v36[5] = &buf;
      objc_copyWeak(&v37, &location);
      [(PKAsyncUnaryOperationComposer *)v18 addOperation:v36];
      if (v12)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_3;
        v32[3] = &unk_1E56E5E68;
        objc_copyWeak(v35, &location);
        p_long long buf = &buf;
        id v33 = v16;
        v35[1] = v9;
        v35[2] = v10;
        [(PKAsyncUnaryOperationComposer *)v18 addOperation:v32];

        objc_destroyWeak(v35);
      }
      if (v15)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_6;
        v26[3] = &unk_1E56E5EE0;
        objc_copyWeak(&v31, &location);
        id v28 = &buf;
        id v27 = v7;
        __int16 v29 = v38;
        id v30 = v40;
        [(PKAsyncUnaryOperationComposer *)v18 addOperation:v26];

        objc_destroyWeak(&v31);
      }
      id v19 = [MEMORY[0x1E4F1CA98] null];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_59;
      v22[3] = &unk_1E56E1258;
      id v20 = v17;
      id v23 = v20;
      os_signpost_id_t v24 = v40;
      int v25 = v38;
      id v21 = [(PKAsyncUnaryOperationComposer *)v18 evaluateWithInput:v19 completion:v22];

      objc_destroyWeak(&v37);
      _Block_object_dispose(v38, 8);

      _Block_object_dispose(v40, 8);
      _Block_object_dispose(&buf, 8);

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v8 = PKLocalizedCocoonString(&cfstr_ApplyGenericEr_0.isa, 0);
      uint64_t v9 = PKLocalizedCocoonString(&cfstr_ApplyGenericEr.isa, 0);
      uint64_t v10 = PKAccountDisplayableError(v5, 3, v8, v9);
      BOOL v11 = (void *)*((void *)v7 + 33);
      *((void *)v7 + 33) = v10;
    }
    else
    {
      uint64_t v8 = (void *)WeakRetained[33];
      WeakRetained[33] = 0;
    }

    int v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *((void *)v7 + 7);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v13;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Completed pay later financing controller request %@", buf, 0xCu);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v14 = objc_msgSend(*((id *)v7 + 7), "completions", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * i) + 16))();
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    if (a2)
    {
      [v7 refreshAvailableFundingSources];
      if (*(unsigned char *)(a1 + 48) && *(void *)(a1 + 32)) {
        objc_msgSend(v7, "_informObserversFinancingOptionCancelled:");
      }
      [v7 _informObserversAssessmentCollectionChanged];
    }
    id v19 = (void *)*((void *)v7 + 7);
    *((void *)v7 + 7) = 0;

    [v7 _executeNextRequestIfPossible];
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2;
  v13[3] = &unk_1E56E5DF0;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 _payLaterAccountWithCompletion:v13];

  objc_destroyWeak(&v17);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      [WeakRetained _updateLoadingState:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateLoadingState:1];
    uint64_t v13 = objc_alloc_init(PKAccountWebServicePayLaterFinancingOptionCancellationRequest);
    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountIdentifier];
    [(PKAccountWebServicePayLaterFinancingOptionCancellationRequest *)v13 setAccountIdentifier:v14];

    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountBaseURL];
    [(PKAccountWebServicePayLaterFinancingOptionCancellationRequest *)v13 setBaseURL:v15];

    [(PKAccountWebServicePayLaterFinancingOptionCancellationRequest *)v13 setOptionIdentifier:*(void *)(a1 + 32)];
    unint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = 3;
    if (v16 <= 5)
    {
      if (((1 << v16) & 0x33) != 0)
      {
        uint64_t v17 = 0;
      }
      else if (v16 == 2)
      {
        uint64_t v20 = *(void *)(a1 + 64);
        if (v20 == 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = 2 * (v20 == 0);
        }
      }
    }
    [(PKAccountWebServicePayLaterFinancingOptionCancellationRequest *)v13 setReason:v17];
    id v18 = [v12[7] stateMachineError];
    [(PKAccountWebServicePayLaterFinancingOptionCancellationRequest *)v13 setError:v18];

    id v19 = v12[28];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_4;
    v21[3] = &unk_1E56E5E40;
    objc_copyWeak(&v24, v10);
    id v23 = v9;
    id v22 = v8;
    [v19 accountPayLaterFinancingOptionCancellationWithRequest:v13 completion:v21];

    objc_destroyWeak(&v24);
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_4(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_5;
  block[3] = &unk_1E56E2C70;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  id v3 = a1[4];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v13 = [WeakRetained[7] amount];
    LOBYTE(v12) = [v11 _eligibleToFetchFinancingOptionsWithPayLaterAccount:v12 transactionAmount:v13];

    if (v12)
    {
      [v11 _updateLoadingState:1];
      id v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Fetching financing options", buf, 2u);
      }

      uint64_t v15 = [v11[22] currencyCode];
      unint64_t v16 = [v11[22] merchantIdentifier];
      uint64_t v17 = objc_alloc_init(PKAccountWebServiceFinancingOptionsRequest);
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setAmount:*(void *)(a1 + 32)];
      id v30 = (void *)v15;
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setCurrencyCode:v15];
      id v18 = [v11[22] merchantCountryCode];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setCountryCode:v18];

      id v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountIdentifier];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setAccountIdentifier:v19];

      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setMerchantIdentifier:v16];
      uint64_t v20 = [v11[22] originURL];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setOriginURL:v20];

      long long v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountBaseURL];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setBaseURL:v21];

      -[PKAccountWebServiceFinancingOptionsRequest setChannel:](v17, "setChannel:", [v11[22] channel]);
      id v22 = [v11[22] webMerchantName];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setWebMerchantName:v22];

      id v23 = [v11[22] merchantName];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setMerchantName:v23];

      id v24 = [v11[22] adamIdentifier];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setAdamIdentifier:v24];

      -[PKAccountWebServiceFinancingOptionsRequest setIsMerchantTokenRequest:](v17, "setIsMerchantTokenRequest:", [v11[22] isMerchantTokenRequest]);
      -[PKAccountWebServiceFinancingOptionsRequest setIsMultiTokenRequest:](v17, "setIsMultiTokenRequest:", [v11[22] isMultiTokenRequest]);
      int v25 = [v11[22] webMerchantIdentifier];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setWebMerchantIdentifier:v25];

      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setReferrerIdentifier:v11[31]];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setSessionIdentifier:v11[12]];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setDueNext30Days:v11[5]];
      uint64_t v26 = [v11[22] supportedNetworks];
      [(PKAccountWebServiceFinancingOptionsRequest *)v17 setSupportedNetworks:v26];

      -[PKAccountWebServiceFinancingOptionsRequest setSuppressionMode:](v17, "setSuppressionMode:", [v11[22] suppressionMode]);
      [v11 _reportEventSignpostIfNecessary];
      id v27 = v11[28];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_56;
      v31[3] = &unk_1E56E5EB8;
      objc_copyWeak(&v36, (id *)(a1 + 64));
      uint64_t v34 = *(void *)(a1 + 48);
      id v33 = v9;
      id v28 = v8;
      uint64_t v29 = *(void *)(a1 + 56);
      id v32 = v28;
      uint64_t v35 = v29;
      [v27 accountFinancingOptionsWithRequest:v17 completion:v31];

      objc_destroyWeak(&v36);
    }
    else
    {
      [v11 _updateLoadingState:0];
      (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    }
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_57;
  block[3] = &unk_1E56E5E90;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v11;
  long long v16 = v11;
  id v8 = *(id *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 56);
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_57(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _reportEndSignpostIfNecessary];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        uint64_t v7 = v4;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error getting financing options: %@", (uint8_t *)&v6, 0xCu);
      }

      [v3 _updateLoadingState:2];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 _updateStateWithResponse:*(void *)(a1 + 48)];
      [v3 _updateLoadingState:3];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_59(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_60;
  block[3] = &unk_1E56DF6D0;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__PKPayLaterFinancingController__executeNextRequestIfPossible__block_invoke_2_60(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_updateLoadingState:(unint64_t)a3
{
  unint64_t loadingState = self->_loadingState;
  self->_unint64_t loadingState = a3;
  if (loadingState != a3) {
    [(PKPayLaterFinancingController *)self _informObserversAssessmentCollectionChanged];
  }
  [(PKPayLaterFinancingController *)self _updatePayLaterPassEligibility];
}

- (void)_updatePayLaterPassEligibility
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t payLaterPassEligibility = self->_payLaterPassEligibility;
  switch(self->_loadingState)
  {
    case 0uLL:
      if ((self->_optionFetchIneligibleReason & 0xFFFFFFFFFFFFFFFELL) == 0xC) {
        unint64_t v4 = 3;
      }
      else {
        unint64_t v4 = 2;
      }
      goto LABEL_11;
    case 1uLL:
      unint64_t v4 = 4;
      goto LABEL_11;
    case 2uLL:
      unint64_t v4 = 5;
LABEL_11:
      self->_unint64_t payLaterPassEligibility = v4;
      goto LABEL_14;
    case 3uLL:
      id v5 = [(PKPayLaterProductAssessmentCollection *)self->_assessmentCollection productAssessmentForProductType:1];
      if ([v5 isEligible])
      {
        int v6 = [v5 financingOptions];
        uint64_t v7 = [v6 count];

        uint64_t v8 = [v5 preliminaryAssessment];
        uint64_t v9 = v7 | v8;

        unint64_t v10 = 1;
        if (!v9) {
          unint64_t v10 = 2;
        }
      }
      else
      {
        unint64_t v10 = 2;
      }
      self->_unint64_t payLaterPassEligibility = v10;

      unint64_t v4 = self->_payLaterPassEligibility;
LABEL_14:
      if (payLaterPassEligibility != v4)
      {
        long long v11 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          if (payLaterPassEligibility - 1 > 4) {
            uint64_t v12 = @"unknown";
          }
          else {
            uint64_t v12 = off_1E56E6048[payLaterPassEligibility - 1];
          }
          if (v4 - 1 > 4) {
            id v13 = @"unknown";
          }
          else {
            id v13 = off_1E56E6048[v4 - 1];
          }
          int v14 = 138412546;
          id v15 = v12;
          __int16 v16 = 2112;
          uint64_t v17 = v13;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Pay Later pass eligibility changed from %@ to %@", (uint8_t *)&v14, 0x16u);
        }

        [(PKPayLaterFinancingController *)self refreshAvailableFundingSources];
        [(PKPayLaterFinancingController *)self _informObserversAssessmentCollectionChanged];
      }
      break;
    default:
      return;
  }
}

- (BOOL)_updateStateWithResponse:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_assessmentCollection;
  int v6 = [v4 assessmentCollection];
  objc_storeStrong((id *)&self->_assessmentCollection, v6);
  uint64_t v7 = [v4 dynamicContent];
  dynamicContent = self->_dynamicContent;
  self->_dynamicContent = v7;

  uint64_t v9 = [v4 sessionIdentifier];
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v9;

  self->_languageDisclosureLocation = [v4 languageDisclosureLocation];
  if (v5 && v6)
  {
    if ([(PKPayLaterProductAssessmentCollection *)v5 isEqual:v6])
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_9;
    }
  }
  else if (v5 == v6)
  {
    goto LABEL_4;
  }
  uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v49 = v6;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Assessment collection has changed: %@", buf, 0xCu);
  }

  char v11 = 1;
LABEL_9:
  lastUsedFundingSources = self->_lastUsedFundingSources;
  int v14 = [v4 lastUsedFundingSources];
  id v15 = v14;
  v42 = v5;
  if (lastUsedFundingSources && v14)
  {
    char v16 = [(NSArray *)lastUsedFundingSources isEqual:v14];

    if (v16) {
      goto LABEL_17;
    }
  }
  else
  {

    if (lastUsedFundingSources == v15) {
      goto LABEL_17;
    }
  }
  uint64_t v17 = [v4 lastUsedFundingSources];
  uint64_t v18 = self->_lastUsedFundingSources;
  self->_lastUsedFundingSources = v17;

  id v19 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = self->_lastUsedFundingSources;
    *(_DWORD *)long long buf = 138412290;
    v49 = (PKPayLaterProductAssessmentCollection *)v20;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Updated lastUsedFundingSources: %@", buf, 0xCu);
  }

  char v11 = 1;
LABEL_17:
  char v41 = v11;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v22 = [v4 acceptedFundingSources];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v27 type] == 1)
        {
          id v28 = [[PKPayLaterBankPaymentSource alloc] initWithAccountPaymentFundingSource:v27];
          uint64_t v29 = v28;
          if (v28)
          {
            id v30 = [(PKPayLaterBankPaymentSource *)v28 identifier];
            [v21 setObject:v29 forKey:v30];
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v24);
  }

  if ([v21 count]) {
    id v31 = v21;
  }
  else {
    id v31 = 0;
  }
  id v32 = v31;

  bankFundingSources = self->_bankFundingSources;
  if (v32 && bankFundingSources)
  {
    uint64_t v34 = v42;
    BOOL v35 = v41;
    if ([(NSDictionary *)bankFundingSources isEqual:v32]) {
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v34 = v42;
    BOOL v35 = v41;
    if (bankFundingSources == v32) {
      goto LABEL_39;
    }
  }
  id v36 = (NSDictionary *)[(NSDictionary *)v32 copy];
  id v37 = self->_bankFundingSources;
  self->_bankFundingSources = v36;

  unint64_t v38 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = self->_bankFundingSources;
    *(_DWORD *)long long buf = 138412290;
    v49 = (PKPayLaterProductAssessmentCollection *)v39;
    _os_log_impl(&dword_190E10000, v38, OS_LOG_TYPE_DEFAULT, "Updated bankFundingSources: %@", buf, 0xCu);
  }

  BOOL v35 = 1;
LABEL_39:

  return v35;
}

- (void)_payLaterAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_payLaterAccount || self->_fetchedPayLaterAccount)
  {
    if (v4) {
      (*((void (**)(id))v4 + 2))(v4);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    int v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke;
    v14[3] = &unk_1E56E5F58;
    v14[4] = self;
    objc_copyWeak(&v15, &location);
    [(PKAsyncUnaryOperationComposer *)v6 addOperation:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_66;
    v12[3] = &unk_1E56E5CB0;
    objc_copyWeak(&v13, &location);
    [(PKAsyncUnaryOperationComposer *)v6 addOperation:v12];
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_4;
    v9[3] = &unk_1E56E5FD0;
    objc_copyWeak(&v11, &location);
    id v10 = v5;
    id v8 = [(PKAsyncUnaryOperationComposer *)v6 evaluateWithInput:v7 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 208);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2;
  v13[3] = &unk_1E56E5F30;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 defaultAccountForFeature:3 completion:v13];

  objc_destroyWeak(&v16);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3;
  block[3] = &unk_1E56E5F08;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v6;
  id v11 = v5;
  id v13 = a1[5];
  id v12 = a1[4];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v4;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pay later account: %@", (uint8_t *)&v15, 0xCu);
      }

      goto LABEL_12;
    }
    id v6 = (void *)WeakRetained[3];
    *((unsigned char *)WeakRetained + 32) = 1;
    id v7 = *(id *)(a1 + 40);
    id v8 = (void *)v3[3];
    v3[3] = v7;
    id v9 = v6;

    id v10 = [[PKPayLaterFinancingPlansFetcher alloc] initWithPayLaterAccount:v3[3]];
    id v11 = (void *)v3[14];
    v3[14] = v10;

    id v12 = *(id *)(a1 + 40);
    if (v9 && v12)
    {
      char v13 = [v9 isEqual:*(void *)(a1 + 40)];

      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {

      if (v9 == v12)
      {
LABEL_12:
        (*(void (**)(void, void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 32) != 0);
        goto LABEL_13;
      }
    }
    id v14 = (id)[v3 payLaterPass];
    [v3 _updatePayLaterPassEligibility];
    goto LABEL_12;
  }
LABEL_13:
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)*((void *)WeakRetained + 14);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2_67;
    v11[3] = &unk_1E56E5F80;
    void v11[4] = WeakRetained;
    id v13 = v7;
    id v12 = v6;
    [v10 financingPlansWithQueryItems:1 completion:v11];
  }
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_2_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3_68;
  v5[3] = &unk_1E56DEB98;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_3_68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) dueNext30Days];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v5();
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_5;
  v2[3] = &unk_1E56E5FA8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __64__PKPayLaterFinancingController__payLaterAccountWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v4 = [WeakRetained[1] defaultPaymentPassUniqueIdentifier];
    id v5 = v9[8];
    v9[8] = (id)v4;

    id v6 = [[PKPayLaterAvailableFundingSourcesFilter alloc] initWithPassLibrary:v9[29] peerPaymentAccount:v9[27] defaultPassUniqueIdentifier:v9[8]];
    id v7 = v9[11];
    v9[11] = v6;

    id v3 = v9;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9[3]);
      id v3 = v9;
    }
  }
}

- (void)_reportEventSignpostIfNecessary
{
  if ([(PKPayLaterFinancingControllerConfiguration *)self->_configuration channel] == 1
    && !self->_hasEndedSignPost)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)id v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v3, OS_SIGNPOST_EVENT, v5, "request:paylater:financingOptions", "", v6, 2u);
      }
    }
  }
}

- (void)_reportEndSignpostIfNecessary
{
  if ([(PKPayLaterFinancingControllerConfiguration *)self->_configuration channel] == 1
    && !self->_hasEndedSignPost)
  {
    PKLogFacilityTypeGetObject(0x23uLL);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)id v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_190E10000, v3, OS_SIGNPOST_INTERVAL_END, v5, "request:paylater:financingOptions", "", v6, 2u);
      }
    }

    self->_hasEndedSignPost = 1;
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    os_signpost_id_t v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__PKPayLaterFinancingController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __61__PKPayLaterFinancingController__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_informObserversAssessmentCollectionChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__PKPayLaterFinancingController__informObserversAssessmentCollectionChanged__block_invoke;
  v2[3] = &unk_1E56E5DA0;
  void v2[4] = self;
  [(PKPayLaterFinancingController *)self _accessObserversWithHandler:v2];
}

void __76__PKPayLaterFinancingController__informObserversAssessmentCollectionChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 payLaterFinancingAssessmentCollectionDidUpdate:*(void *)(a1 + 32)];
  }
}

- (void)_informObserversFinancingOptionCancelled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKPayLaterFinancingController__informObserversFinancingOptionCancelled___block_invoke;
  v6[3] = &unk_1E56E5FF8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPayLaterFinancingController *)self _accessObserversWithHandler:v6];
}

void __74__PKPayLaterFinancingController__informObserversFinancingOptionCancelled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 payLaterFinancingController:*(void *)(a1 + 32) financingOptionCancelled:*(void *)(a1 + 40)];
  }
}

- (PKPayLaterFinancingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterPass:(id)a3
{
}

- (unint64_t)payLaterPassEligibility
{
  return self->_payLaterPassEligibility;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (PKPayLaterPaymentSource)selectedFundingSource
{
  return self->_selectedFundingSource;
}

- (BOOL)autoPaymentOn
{
  return self->_autoPaymentOn;
}

- (void)setAutoPaymentOn:(BOOL)a3
{
  self->_autoPaymentOn = a3;
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (NSError)loadingError
{
  return self->_loadingError;
}

- (unint64_t)languageDisclosureLocation
{
  return self->_languageDisclosureLocation;
}

- (BOOL)hasSeenLanguageNotice
{
  return self->_hasSeenLanguageNotice;
}

- (void)setHasSeenLanguageNotice:(BOOL)a3
{
  self->_hasSeenLanguageNotice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_pendingCancellationRequest, 0);
  objc_storeStrong((id *)&self->_plansFetcher, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_availableFundingSourcesFilter, 0);
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_bankFundingSources, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end