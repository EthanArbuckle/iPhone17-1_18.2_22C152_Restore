@interface PKAccountFlowController
+ (id)displayableErrorForError:(id)a3 featureIdentifier:(unint64_t)a4 genericErrorTitle:(id)a5 genericErrorMessage:(id)a6;
- (PKAccountCredential)accountCredential;
- (PKAccountFlowController)init;
- (PKAccountFlowController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6 operations:(unint64_t)a7;
- (PKAccountFlowControllerDelegate)delegate;
- (PKAccountProvisioningController)accountProvisioningController;
- (PKPaymentProvisioningController)provisioningController;
- (PKSetupFlowControllerProtocol)parentFlowController;
- (id)firstAccountViewController;
- (unint64_t)_fitleredOperations:(unint64_t)a3 account:(id)a4 context:(int64_t)a5;
- (unint64_t)operations;
- (void)_accountProvisioningControllerRequiresNextViewController:(id)a3;
- (void)_acquireAssertion;
- (void)_checkAccountProvisioningControllerState:(id)a3;
- (void)_invalidateAssertion;
- (void)_nextPostProvisioningViewControllerWithCompletion:(id)a3;
- (void)_requestPresentationOfActiviationViewControllerShowingMadeDefault:(BOOL)a3;
- (void)_resetPostProvisioningContent;
- (void)accountProvisioningController:(id)a3 displayableError:(id)a4;
- (void)accountProvisioningControllerUpdatedState:(id)a3;
- (void)dealloc;
- (void)endProvisioningFlow;
- (void)makeAccountPassDefault:(BOOL)a3;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)performInitalOperations;
- (void)setDelegate:(id)a3;
- (void)setParentFlowController:(id)a3;
@end

@implementation PKAccountFlowController

- (PKAccountFlowController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountFlowController;
  v2 = [(PKAccountFlowController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v3;
  }
  return v2;
}

- (PKAccountFlowController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 setupDelegate:(id)a5 context:(int64_t)a6 operations:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = [(PKAccountFlowController *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_setupDelegate, v15);
    objc_storeStrong((id *)&v17->_accountCredential, a3);
    uint64_t v18 = [(PKAccountCredential *)v17->_accountCredential account];
    account = v17->_account;
    v17->_account = (PKAccount *)v18;

    objc_storeStrong((id *)&v17->_provisioningController, a4);
    v17->_context = a6;
    v17->_isMerchantApp = PKPaymentSetupContextIsMerchantApp();
    v17->_operations = [(PKAccountFlowController *)v17 _fitleredOperations:a7 account:v17->_account context:v17->_context];
  }

  return v17;
}

- (void)dealloc
{
  [(PKAccountFlowController *)self _invalidateAssertion];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountFlowController;
  [(PKAccountFlowController *)&v3 dealloc];
}

- (unint64_t)_fitleredOperations:(unint64_t)a3 account:(id)a4 context:(int64_t)a5
{
  unint64_t v6 = [a4 state];
  if ((0x3Du >> v6)) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v6 < 6) {
    a3 = v7;
  }
  if ((PKPaymentSetupContextIsBridge() & 1) != 0 || !PKIsPairedWithWatch()) {
    a3 &= ~2uLL;
  }
  return a3;
}

- (id)firstAccountViewController
{
  if ((self->_operations | 2) == 3)
  {
    objc_super v3 = [PKAccountPassActivationResultViewController alloc];
    int64_t context = self->_context;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    unint64_t v6 = [(PKAccountPassActivationResultViewController *)v3 initWithAccountFlowController:self context:context setupDelegate:WeakRetained];

    [(PKAccountPassActivationResultViewController *)v6 setShowingLoadingIndicator:1];
    [(PKAccountPassActivationResultViewController *)v6 setDidMakeAccountPassDefault:0];
  }
  else
  {
    unint64_t v7 = [PKAccountPassMakeDefaultViewContoller alloc];
    int64_t v8 = self->_context;
    id v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    unint64_t v6 = [(PKAccountPassMakeDefaultViewContoller *)v7 initWithAccountFlowController:self context:v8 setupDelegate:v9];
  }
  objc_storeWeak((id *)&self->_delegate, v6);

  return v6;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke;
    v6[3] = &unk_1E59CB7C0;
    v6[4] = self;
    id v7 = v4;
    [(PKAccountFlowController *)self _nextPostProvisioningViewControllerWithCompletion:v6];
  }
}

void __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 112))
    {
      [*(id *)(v5 + 104) resetForNewProvisioning];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 112);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke_2;
      v8[3] = &unk_1E59CAC08;
      v8[4] = v6;
      id v9 = *(id *)(a1 + 40);
      [v7 nextViewControllerWithCompletion:v8];

      goto LABEL_6;
    }
    [(id)v5 _invalidateAssertion];
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
LABEL_6:
}

void __60__PKAccountFlowController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _invalidateAssertion];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 112);
  *(void *)(v8 + 112) = 0;
}

- (void)performInitalOperations
{
  [(PKAccountFlowController *)self _acquireAssertion];
  id v3 = [(PKAccountFlowController *)self accountProvisioningController];
  if (self->_operations)
  {
    id v4 = v3;
    [v3 provisionAccountPassToLocalDevice];
    id v3 = v4;
  }
}

- (void)makeAccountPassDefault:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = 1;
  if (!a3) {
    unint64_t v5 = 2;
  }
  self->_madeDefault = v5;
  id v8 = [(PKAccountFlowController *)self accountProvisioningController];
  if (v3)
  {
    unint64_t operations = self->_operations;
    if ((operations & 8) != 0)
    {
      [v8 addToIDMS];
      unint64_t operations = self->_operations;
    }
    if ((operations & 4) != 0) {
      [v8 makeAccountPassDefaultOnLocalDevice];
    }
  }
  unint64_t v7 = self->_operations;
  if ((v7 & 2) != 0)
  {
    [v8 provisionAccountPassToWatchAsDefault:v3];
    unint64_t v7 = self->_operations;
  }
  if ((v7 & 0x10) != 0) {
    [v8 performAMPEnrollmentShouldEnroll:v3 shouldMakeDefault:v3];
  }
  [(PKAccountFlowController *)self _requestPresentationOfActiviationViewControllerShowingMadeDefault:v3];
}

- (void)accountProvisioningControllerUpdatedState:(id)a3
{
  accountProvisioningController = self->_accountProvisioningController;
  if (accountProvisioningController) {
    BOOL v4 = accountProvisioningController == a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    [(PKAccountFlowController *)self _checkAccountProvisioningControllerState:a3];
  }
}

- (void)accountProvisioningController:(id)a3 displayableError:(id)a4
{
  id v13 = (PKAccountProvisioningController *)a3;
  id v6 = a4;
  accountProvisioningController = self->_accountProvisioningController;
  if (accountProvisioningController) {
    BOOL v8 = accountProvisioningController == v13;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", 0, -[PKAccount feature](self->_account, "feature"), 0, 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 accountFlowController:self requestsPresentationOfDisplayableError:v10];
    }
  }
}

- (void)_checkAccountProvisioningControllerState:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if ((self->_operations & 1) != 0 && [v4 provisionLocalPassState] != 3)
  {
    unint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      BOOL v8 = "Local device provisioning is still running. Ignoring update";
      id v9 = (uint8_t *)&v15;
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (self->_isMerchantApp && (self->_operations & 1) != 0 && [v5 localPassActivationState] != 3)
  {
    unint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      BOOL v8 = "Local device pass still activating. Ignoring update";
      id v9 = (uint8_t *)&v14;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  unint64_t madeDefault = self->_madeDefault;
  if (madeDefault == 1)
  {
    if ((self->_operations & 4) != 0 && [v5 makeAccountPassDefaultOnLocalDeviceState] != 3)
    {
      unint64_t v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        BOOL v8 = "Card has not been made default on local device yet. Ignoring update";
        id v9 = (uint8_t *)&v12;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    if (self->_isMerchantApp && (self->_operations & 8) != 0 && [v5 addToIDMSState] != 3)
    {
      unint64_t v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        BOOL v8 = "Card has not been added to IDMS. Ignoring update";
        id v9 = buf;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (!madeDefault && (self->_operations & 0x1C) != 0)
  {
    unint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      BOOL v8 = "User default choice not made yet. Ignoring update";
      id v9 = (uint8_t *)&v13;
LABEL_29:
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if ((self->_operations & 0x10) != 0 && [v5 addToAMPState] != 3)
  {
    unint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      BOOL v8 = "Card has not been added to AMP. Ignoring update";
      id v9 = (uint8_t *)&v10;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  [(PKAccountFlowController *)self _accountProvisioningControllerRequiresNextViewController:v5];
LABEL_31:
}

- (void)_accountProvisioningControllerRequiresNextViewController:(id)a3
{
  [a3 setDelegate:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__PKAccountFlowController__accountProvisioningControllerRequiresNextViewController___block_invoke;
    v6[3] = &unk_1E59D8E48;
    id v7 = WeakRetained;
    BOOL v8 = self;
    [(PKAccountFlowController *)self nextViewControllerWithCompletion:v6];
  }
}

uint64_t __84__PKAccountFlowController__accountProvisioningControllerRequiresNextViewController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (a3) {
    return objc_msgSend(v5, "accountFlowController:requestsPresentationOfDisplayableError:", v6);
  }
  else {
    return [v5 accountFlowController:v6 requestsPresentationOfViewController:a2];
  }
}

- (void)_requestPresentationOfActiviationViewControllerShowingMadeDefault:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    id v7 = [PKAccountPassActivationResultViewController alloc];
    int64_t context = self->_context;
    id v9 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    __int16 v10 = [(PKAccountPassActivationResultViewController *)v7 initWithAccountFlowController:self context:context setupDelegate:v9];

    v11 = [(PKAccountFlowController *)self accountProvisioningController];
    BOOL v12 = [v11 provisionLocalPassState] != 3
       || [v11 makeAccountPassDefaultOnLocalDeviceState] != 3
       || [v11 addToAMPState] != 3
       || [v11 addToIDMSState] != 3;
    [(PKAccountPassActivationResultViewController *)v10 setShowingLoadingIndicator:v12];
    [(PKAccountPassActivationResultViewController *)v10 setDidMakeAccountPassDefault:v3];
    -[PKAccountPassActivationResultViewController setDidAddToAmp:](v10, "setDidAddToAmp:", [v11 didAddToAMP]);
    objc_storeWeak((id *)p_delegate, v10);
    [v13 accountFlowController:self requestsPresentationOfViewController:v10];

    id WeakRetained = v13;
  }
}

- (PKAccountProvisioningController)accountProvisioningController
{
  accountProvisioningController = self->_accountProvisioningController;
  if (!accountProvisioningController)
  {
    id v4 = (PKAccountProvisioningController *)[objc_alloc(MEMORY[0x1E4F84240]) initWithAccountCredential:self->_accountCredential provisioningController:self->_provisioningController usingRemoteLibrary:PKPaymentSetupContextIsBridge()];
    unint64_t v5 = self->_accountProvisioningController;
    self->_accountProvisioningController = v4;

    [(PKAccountProvisioningController *)self->_accountProvisioningController setDelegate:self];
    double v6 = 120.0;
    if (self->_isMerchantApp) {
      double v6 = 30.0;
    }
    [(PKAccountProvisioningController *)self->_accountProvisioningController setPassActivationTimeout:v6];
    id v7 = [(PKAccountCredential *)self->_accountCredential paymentPass];
    if ([(PKAccount *)self->_account state] == 1)
    {
      BOOL v8 = [v7 devicePrimaryPaymentApplication];

      if (v8)
      {
        id v9 = self->_accountProvisioningController;
        __int16 v10 = [v7 uniqueID];
        [(PKAccountProvisioningController *)v9 setProvisionedPassUniqueID:v10];
      }
    }

    accountProvisioningController = self->_accountProvisioningController;
  }

  return accountProvisioningController;
}

- (void)endProvisioningFlow
{
  self->_endedProvisioningFlow = 1;
}

- (void)_nextPostProvisioningViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    unint64_t v5 = [(PKPaymentProvisioningController *)self->_provisioningController provisionedPasses];
    double v6 = [v5 lastObject];
    id v7 = [v6 secureElementPass];
    BOOL v8 = [v7 paymentPass];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59CD960;
    objc_copyWeak(&v52, location);
    aBlock[4] = self;
    id v9 = _Block_copy(aBlock);
    __int16 v10 = [(PKPaymentProvisioningController *)self->_provisioningController provisioningResponse];
    v11 = [v10 externalProvisioningOptions];

    if (!v11)
    {
      if (!PKShowFakeExternalDevicePicker())
      {
        v11 = 0;
        goto LABEL_11;
      }
      v11 = [MEMORY[0x1E4F84700] mockOptions];
    }
    if (!self->_shownExternalDeviceProvisioning && v11 && v8 && (self->_operations & 0x20) != 0)
    {
      self->_shownExternalDeviceProvisioning = 1;
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:self->_provisioningController groupsController:0];
      id v13 = [(PKPaymentProvisioningController *)self->_provisioningController eligibilityResponse];
      __int16 v14 = [v13 identifier];

      __int16 v15 = [[PKProvisioningExternalDeviceFlowItem alloc] initWithContext:v12 pass:v8 externalOptions:v11 cardIdentifier:v14];
      v16 = [(PKProvisioningExternalDeviceFlowItem *)v15 extract];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_3;
      v46[3] = &unk_1E59D8EC0;
      objc_copyWeak(&v50, location);
      id v48 = v4;
      id v17 = v16;
      id v47 = v17;
      id v49 = v9;
      [v17 preflightWithCompletion:v46];

      objc_destroyWeak(&v50);
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
LABEL_11:
    uint64_t v18 = [(PKPaymentProvisioningController *)self->_provisioningController moreInfoItems];
    BOOL v12 = v18;
    if (!self->_shownMoreInfoItems && [v18 count])
    {
      v21 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
      __int16 v14 = [v21 targetDevice];

      __int16 v15 = [[PKPaymentSetupMoreInfoViewController alloc] initWithMoreInfoItems:v12 paymentPass:v8 targetDevice:v14 context:self->_context dismissalHandler:v9];
      [(PKProvisioningExternalDeviceFlowItem *)v15 setIsFinalViewController:0];
      (*((void (**)(id, PKProvisioningExternalDeviceFlowItem *))v4 + 2))(v4, v15);
      self->_shownMoreInfoItems = 1;
      goto LABEL_19;
    }
    if (self->_endedProvisioningFlow)
    {
      v19 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_21:

        objc_destroyWeak(&v52);
        objc_destroyWeak(location);
        goto LABEL_22;
      }
      LOWORD(buf) = 0;
      v20 = "Skipping account pass post provisioning content as provisoning ended";
LABEL_15:
      _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&buf, 2u);
      goto LABEL_16;
    }
    unint64_t context = self->_context;
    if (context > 8 || ((1 << context) & 0x109) == 0)
    {
      v19 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      LOWORD(buf) = 0;
      v20 = "Skipping account pass post provisioning content for the current context";
      goto LABEL_15;
    }
    v23 = [(PKAccountCredential *)self->_accountCredential passDetailsResponse];
    __int16 v14 = [v23 postProvisioningContent];

    unint64_t postProvisoningContentIndex = self->_postProvisoningContentIndex;
    if (postProvisoningContentIndex >= [v14 count])
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      goto LABEL_20;
    }
    ++self->_postProvisoningContentIndex;
    objc_msgSend(v14, "objectAtIndex:");
    v25 = (PKProvisioningExternalDeviceFlowItem *)objc_claimAutoreleasedReturnValue();
    __int16 v15 = v25;
    if (!v25)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      goto LABEL_19;
    }
    unint64_t v26 = [(PKProvisioningExternalDeviceFlowItem *)v25 type];
    if (v26 >= 2)
    {
      if (v26 == 2)
      {
        id val = [(PKPaymentProvisioningController *)self->_provisioningController provisionedPasses];
        v34 = [val lastObject];
        v30 = [v34 secureElementPass];
        uint64_t v38 = [v30 paymentPass];

        if (+[PKEducationViewController shouldPresentForPass:v38 inEducationContext:0])
        {
          PKSetHasSeenApplePayEducation();
          vala = [[PKEducationViewController alloc] initWithPaymentPass:v38 setupContext:self->_context educationContext:0];
          [(PKAccount *)self->_account feature];
          v31 = PKLocalizedFeatureString();
          [(PKEducationViewController *)vala setTitleOverride:v31];

          v32 = PKLocalizedFeatureString();
          [(PKEducationViewController *)vala setBodyAddition:v32];

          objc_initWeak(&buf, vala);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_79;
          v39[3] = &unk_1E59D8F10;
          id v40 = v9;
          objc_copyWeak(&v41, &buf);
          [(PKEducationViewController *)vala setContinueHandler:v39];
          (*((void (**)(id, PKEducationViewController *))v4 + 2))(v4, vala);
          objc_destroyWeak(&v41);

          objc_destroyWeak(&buf);
        }
        else
        {
          [(PKAccountFlowController *)self _nextPostProvisioningViewControllerWithCompletion:v4];
        }
        v29 = (void *)v38;
        goto LABEL_41;
      }
      if (v26 != 3) {
        goto LABEL_19;
      }
      unint64_t v27 = self->_context;
      if (v27 <= 8 && ((1 << v27) & 0x109) != 0)
      {
        accountService = self->_accountService;
        v28 = [(PKAccount *)self->_account accountIdentifier];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_66;
        v43[3] = &unk_1E59CEBB0;
        v43[4] = self;
        id v45 = v4;
        __int16 v15 = v15;
        v44 = v15;
        [(PKAccountService *)accountService physicalCardsForAccountWithIdentifier:v28 completion:v43];

        v29 = v45;
LABEL_41:

        goto LABEL_19;
      }
      v33 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Limiting Physical card ordering from appearing because of current context", (uint8_t *)&buf, 2u);
      }
    }
    [(PKAccountFlowController *)self _nextPostProvisioningViewControllerWithCompletion:v4];
    goto LABEL_19;
  }
LABEL_22:
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2;
    v7[3] = &unk_1E59D8E70;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    id v10 = WeakRetained;
    [WeakRetained nextViewControllerWithCompletion:v7];
  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (v8)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    id v5 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) navigationController];
      objc_msgSend(v6, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, 0);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));

      if (WeakRetained)
      {
        uint64_t v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 24));
        [v6 viewControllerDidTerminateSetupFlow:*(void *)(a1 + 32)];
      }
      else
      {
        uint64_t v6 = [*(id *)(a1 + 32) navigationController];
        [v6 dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v13 = 0;
      __int16 v14 = &v13;
      uint64_t v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__38;
      id v17 = __Block_byref_object_dispose__38;
      id v18 = 0;
      uint64_t v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_62;
      v9[3] = &unk_1E59D8E98;
      id v11 = *(id *)(a1 + 48);
      BOOL v12 = &v13;
      id v10 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 viewControllerWithCompletion:v9];
      id v8 = (void *)v14[5];
      v14[5] = v7;

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      [WeakRetained _nextPostProvisioningViewControllerWithCompletion:*(void *)(a1 + 40)];
    }
  }
}

uint64_t __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2_67;
  v5[3] = &unk_1E59CE9B0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_2_67(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 104) provisionedPasses];
  id v3 = [v2 lastObject];
  id v4 = [v3 secureElementPass];
  id v5 = [v4 paymentPass];

  id v6 = [[PKPhysicalCardController alloc] initWithAccountService:*(void *)(*(void *)(a1 + 32) + 40) paymentPass:v5 account:*(void *)(*(void *)(a1 + 32) + 16) accountUser:0 physicalCards:*(void *)(a1 + 40)];
  if ([(PKPhysicalCardController *)v6 canRequestNewPhysicalCard])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    [(PKPhysicalCardController *)v6 setSetupDelegate:WeakRetained];

    [(PKPhysicalCardController *)v6 setParentFlowController:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_69;
    v12[3] = &unk_1E59D8EE8;
    id v13 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v16 = v9;
    uint64_t v14 = v10;
    uint64_t v15 = v6;
    [(PKPhysicalCardController *)v15 orderFlowViewControllerForReason:0 content:v8 completion:v12];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Skipping physical card order flow - user already has one", buf, 2u);
    }

    [*(id *)(a1 + 32) _nextPostProvisioningViewControllerWithCompletion:*(void *)(a1 + 56)];
  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) title];
    [v5 setTitleOverride:v7];

    uint64_t v8 = [*(id *)(a1 + 32) body];
    [v5 setBodyOverride:v8];

    id v9 = [*(id *)(a1 + 32) primaryButtonTitle];
    [v5 setPrimaryButtonTitleOverride:v9];

    uint64_t v10 = [*(id *)(a1 + 32) secondaryButtonTitle];
    [v5 setSecondaryButtonTitleOverride:v10];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Skipping physical card order flow - error: %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 40) _nextPostProvisioningViewControllerWithCompletion:*(void *)(a1 + 56)];
  }
}

void __77__PKAccountFlowController__nextPostProvisioningViewControllerWithCompletion___block_invoke_79(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_resetPostProvisioningContent
{
  self->_unint64_t postProvisoningContentIndex = 0;
}

- (void)_acquireAssertion
{
  notificationSupressionAssertion = self->_notificationSupressionAssertion;
  id v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (notificationSupressionAssertion)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Notification suppression assertion already acquired", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring notification suppression assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v6 = (void *)MEMORY[0x1E4F84508];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PKAccountFlowController__acquireAssertion__block_invoke;
    v7[3] = &unk_1E59D6CC8;
    objc_copyWeak(&v8, buf);
    [v6 acquireAssertionOfType:4 withReason:@"Account Pass Provisioning" completion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __44__PKAccountFlowController__acquireAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v7)
    {
      if (v11)
      {
        *(_DWORD *)id buf = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Acquired notification suppression assertion", buf, 2u);
      }

      objc_storeStrong(WeakRetained + 9, a2);
      [WeakRetained[9] setInvalidateWhenBackgrounded:0];
      id v12 = WeakRetained[9];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__PKAccountFlowController__acquireAssertion__block_invoke_85;
      v13[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v14, v8);
      [v12 setInvalidationHandler:v13];
      objc_destroyWeak(&v14);
    }
  }
}

void __44__PKAccountFlowController__acquireAssertion__block_invoke_85(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Executing notification suppression assertion invalidation handler", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;
  }
}

- (void)_invalidateAssertion
{
  if (self->_notificationSupressionAssertion)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification suppression assertion", v4, 2u);
    }

    [(PKAssertion *)self->_notificationSupressionAssertion invalidate];
  }
}

+ (id)displayableErrorForError:(id)a3 featureIdentifier:(unint64_t)a4 genericErrorTitle:(id)a5 genericErrorMessage:(id)a6
{
  return (id)PKAccountDisplayableError();
}

- (unint64_t)operations
{
  return self->_operations;
}

- (PKAccountCredential)accountCredential
{
  return self->_accountCredential;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
}

- (PKAccountFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccountFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_accountCredential, 0);
  objc_storeStrong((id *)&self->_notificationSupressionAssertion, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountProvisioningController, 0);
}

@end