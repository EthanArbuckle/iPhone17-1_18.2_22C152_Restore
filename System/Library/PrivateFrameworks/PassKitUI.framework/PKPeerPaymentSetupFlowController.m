@interface PKPeerPaymentSetupFlowController
- (BOOL)_hasTooManyPasses;
- (BOOL)_peerPaymentPassIsProvisioned;
- (BOOL)_willDisplayErrorForOperationOperationInContext:(unint64_t)a3 completion:(id)a4;
- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentCredential)peerPaymentCredential;
- (PKPeerPaymentService)peerPaymentService;
- (PKPeerPaymentSetupFlowController)initWithPeerPaymentCredential:(id)a3 provisioningController:(id)a4 passLibraryDataProvider:(id)a5 configuration:(id)a6 context:(int64_t)a7;
- (PKPeerPaymentSetupFlowControllerConfiguration)configuration;
- (PKPeerPaymentSetupFlowControllerDataSource)parentViewController;
- (PKPeerPaymentSetupFlowControllerDelegate)flowItemDelegate;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (UIImage)passSnapShot;
- (id)_paymentWebService;
- (id)_peerPaymentWebService;
- (id)firstPeerPaymentAccountSetupViewController;
- (id)passesIncludingPeerPaymentPass:(BOOL)a3 isCheckingTotalPassCount:(BOOL)a4;
- (int64_t)context;
- (unint64_t)_cipState;
- (void)_addAssociatedAccountWithCompletion:(id)a3;
- (void)_checkCloudStoreSetupWithCompletion:(id)a3;
- (void)_checkManateeCapabilityWithCompletion:(id)a3;
- (void)_checkMissingTLKsWithCompletion:(id)a3;
- (void)_completedOperation:(unint64_t)a3;
- (void)_fetchAppleCashCapabilitiesIfNecessary;
- (void)_fitlerOperations:(unint64_t)a3 peerPaymentAccount:(id)a4 context:(int64_t)a5;
- (void)_handleDisplayableError:(id)a3 completion:(id)a4;
- (void)_handlePeerPaymentAccountDidChangeNotification;
- (void)_nextViewControllerWithCompletion:(id)a3;
- (void)_presentEnsurePassCountWithCompletion:(id)a3;
- (void)_presentIdentityVerificationFlowWithError:(id)a3 completion:(id)a4;
- (void)_presentManateeCapableOperationWithCompletion:(id)a3;
- (void)_presentMissingTLKsFlowWithCompletion:(id)a3;
- (void)_presentNameConfirmationViewControllerWithError:(id)a3 completion:(id)a4;
- (void)_presentTermWithTermsResponse:(id)a3 completion:(id)a4;
- (void)_provisionPassWithCompletion:(id)a3;
- (void)_setupCloudStoreWithCompletion:(id)a3;
- (void)_termsOperationWithTermsResponse:(id)a3 completion:(id)a4;
- (void)confirmNameViewController:(id)a3 enteredFirstName:(id)a4 lastName:(id)a5;
- (void)confirmNameViewControllerCancelled:(id)a3;
- (void)nextViewControllerAfterPerfomingOperations:(unint64_t)a3 completion:(id)a4;
- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5;
- (void)selectPassesViewControllerDidTapBackButton:(id)a3;
- (void)setFlowItemDelegate:(id)a3;
- (void)setOperations:(unint64_t)a3;
- (void)setParentViewController:(id)a3;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation PKPeerPaymentSetupFlowController

- (PKPeerPaymentSetupFlowController)initWithPeerPaymentCredential:(id)a3 provisioningController:(id)a4 passLibraryDataProvider:(id)a5 configuration:(id)a6 context:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [(PKPeerPaymentSetupFlowController *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerPaymentCredential, a3);
    uint64_t v19 = [(PKPeerPaymentCredential *)v18->_peerPaymentCredential account];
    peerPaymentAccount = v18->_peerPaymentAccount;
    v18->_peerPaymentAccount = (PKPeerPaymentAccount *)v19;

    if (v15) {
      v21 = (PKPassLibraryDataProvider *)v15;
    }
    else {
      v21 = (PKPassLibraryDataProvider *)objc_alloc_init(MEMORY[0x1E4F848A0]);
    }
    passLibraryDataProvider = v18->_passLibraryDataProvider;
    v18->_passLibraryDataProvider = v21;

    if (v14)
    {
      v23 = (PKPaymentProvisioningController *)v14;
      provisioningController = v18->_provisioningController;
      v18->_provisioningController = v23;
    }
    else
    {
      id v25 = objc_alloc(MEMORY[0x1E4F84BB8]);
      provisioningController = [(PKPeerPaymentSetupFlowController *)v18 _paymentWebService];
      uint64_t v26 = [v25 initWithWebService:provisioningController];
      v27 = v18->_provisioningController;
      v18->_provisioningController = (PKPaymentProvisioningController *)v26;
    }
    v18->_context = a7;
    objc_storeStrong((id *)&v18->_configuration, a6);
    uint64_t v28 = [(PKPeerPaymentSetupFlowController *)v18 _peerPaymentWebService];
    peerPaymentWebService = v18->_peerPaymentWebService;
    v18->_peerPaymentWebService = (PKPeerPaymentWebService *)v28;

    v30 = [(PKPaymentProvisioningController *)v18->_provisioningController webService];
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      v32 = [(PKPeerPaymentSetupFlowController *)v18 _paymentWebService];
    }
    paymentWebService = v18->_paymentWebService;
    v18->_paymentWebService = v32;

    uint64_t v34 = [(PKPeerPaymentWebService *)v18->_peerPaymentWebService peerPaymentService];
    peerPaymentService = v18->_peerPaymentService;
    v18->_peerPaymentService = (PKPeerPaymentService *)v34;

    v36 = (PKDeviceSharingCapabilitiesManager *)objc_alloc_init(MEMORY[0x1E4F84648]);
    deviceCapabiltiesManager = v18->_deviceCapabiltiesManager;
    v18->_deviceCapabiltiesManager = v36;

    v38 = [(PKPeerPaymentAccount *)v18->_peerPaymentAccount associatedPassUniqueID];
    v39 = [(PKPaymentWebService *)v18->_paymentWebService targetDevice];
    char v40 = objc_opt_respondsToSelector();

    if (v40)
    {
      v41 = [(PKPaymentWebService *)v18->_paymentWebService targetDevice];
      v42 = [v41 paymentWebService:v18->_paymentWebService passesOfType:1];

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __135__PKPeerPaymentSetupFlowController_initWithPeerPaymentCredential_provisioningController_passLibraryDataProvider_configuration_context___block_invoke;
      v58[3] = &unk_1E59D2858;
      id v59 = v38;
      v43 = objc_msgSend(v42, "pk_objectsPassingTest:", v58);
      v44 = [v43 firstObject];
      uint64_t v45 = [v44 paymentPass];
      peerPaymentPass = v18->_peerPaymentPass;
      v18->_peerPaymentPass = (PKPaymentPass *)v45;
    }
    if ([v38 length])
    {
      v47 = v18->_peerPaymentPass;
      if (v47)
      {
        v48 = v47;
      }
      else
      {
        v48 = [(PKPassLibraryDataProvider *)v18->_passLibraryDataProvider passWithUniqueID:v38];
      }
      v49 = v48;
      [(PKPaymentPass *)v48 loadImageSetSync:0 preheat:1];
      if ([v13 flowState] == 2) {
        uint64_t v50 = 1536;
      }
      else {
        uint64_t v50 = 512;
      }
      v51 = [[PKPassView alloc] initWithPass:v49 content:5 suppressedContent:v50];
      uint64_t v52 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v51, "snapshotOfFrontFaceWithRequestedSize:", 257.0, 157.0);
      passSnapShot = v18->_passSnapShot;
      v18->_passSnapShot = (UIImage *)v52;
    }
    v54 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v55 = *MEMORY[0x1E4F87CC8];
    v56 = [(PKPeerPaymentWebService *)v18->_peerPaymentWebService targetDevice];
    [v54 addObserver:v18 selector:sel__handlePeerPaymentAccountDidChangeNotification name:v55 object:v56];

    [(PKPeerPaymentSetupFlowController *)v18 _fetchAppleCashCapabilitiesIfNecessary];
  }

  return v18;
}

uint64_t __135__PKPeerPaymentSetupFlowController_initWithPeerPaymentCredential_provisioningController_passLibraryDataProvider_configuration_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)passesIncludingPeerPaymentPass:(BOOL)a3 isCheckingTotalPassCount:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v7 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  uint64_t v8 = [v7 paymentWebService:self->_paymentWebService passesOfType:1];

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (a3) {
          goto LABEL_11;
        }
        id v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) uniqueID];
        id v16 = v9;
        v17 = v16;
        if (v15 == v16)
        {

          continue;
        }
        if (v9 && v15)
        {
          char v18 = [v15 isEqualToString:v16];

          if (v18) {
            continue;
          }
LABEL_11:
          if (a4) {
            goto LABEL_16;
          }
          goto LABEL_12;
        }

        if (a4)
        {
LABEL_16:
          [v22 addObject:v14];
          continue;
        }
LABEL_12:
        if (([v14 isHomeKeyPass] & 1) == 0) {
          goto LABEL_16;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  uint64_t v19 = (void *)[v22 copy];

  return v19;
}

- (void)setOperations:(unint64_t)a3
{
}

- (id)firstPeerPaymentAccountSetupViewController
{
  uint64_t v3 = [(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType];
  if (!v3)
  {
    v4 = &off_1E59C4D20;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = off_1E59C4BC0;
LABEL_5:
    id v5 = (void *)[objc_alloc(*v4) initWithPeerPaymentSetupFlowController:self];
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)nextViewControllerAfterPerfomingOperations:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(PKPeerPaymentSetupFlowController *)self setOperations:a3];
  [(PKPeerPaymentSetupFlowController *)self _nextViewControllerWithCompletion:v6];
}

- (void)_nextViewControllerWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    unint64_t operations = self->_operations;
    if (operations)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = PKPeerPaymentSetupOperationDescriptionForOperations(1uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:1 completion:v4])[(PKPeerPaymentSetupFlowController *)self _termsOperationWithTermsResponse:0 completion:v4]; {
    }
      }
    else if ((operations & 2) != 0)
    {
      uint64_t v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);
      }
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke;
      v36[3] = &unk_1E59CF408;
      v36[4] = self;
      id v37 = v4;
      [(PKPeerPaymentSetupFlowController *)self _checkManateeCapabilityWithCompletion:v36];
    }
    else if ((operations & 4) != 0)
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:4 completion:v4])[(PKPeerPaymentSetupFlowController *)self _presentEnsurePassCountWithCompletion:v4]; {
    }
      }
    else if ((operations & 8) != 0)
    {
      id v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = PKPeerPaymentSetupOperationDescriptionForOperations(8uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v17;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_33;
      v34[3] = &unk_1E59CF408;
      v34[4] = self;
      id v35 = v4;
      [(PKPeerPaymentSetupFlowController *)self _checkMissingTLKsWithCompletion:v34];
    }
    else if ((operations & 0x10) != 0)
    {
      char v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = PKPeerPaymentSetupOperationDescriptionForOperations(0x10uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v19;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_35;
      v32[3] = &unk_1E59CF408;
      v32[4] = self;
      id v33 = v4;
      [(PKPeerPaymentSetupFlowController *)self _checkCloudStoreSetupWithCompletion:v32];
    }
    else if ((operations & 0x20) != 0)
    {
      v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = PKPeerPaymentSetupOperationDescriptionForOperations(0x20uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v21;
        _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:32 completion:v4])
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_37;
        v30[3] = &unk_1E59CD2D0;
        v30[4] = self;
        id v31 = v4;
        [(PKPeerPaymentSetupFlowController *)self _provisionPassWithCompletion:v30];
      }
    }
    else if ((operations & 0x40) != 0)
    {
      id v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v23;
        _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:64 completion:v4])[(PKPeerPaymentSetupFlowController *)self _presentIdentityVerificationFlowWithError:0 completion:v4]; {
    }
      }
    else if ((operations & 0x80) != 0)
    {
      long long v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = PKPeerPaymentSetupOperationDescriptionForOperations(0x80uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:128 completion:v4])
      {
        objc_initWeak((id *)buf, self);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_41;
        v27[3] = &unk_1E59E0BF8;
        objc_copyWeak(&v29, (id *)buf);
        v27[4] = self;
        id v28 = v4;
        [(PKPeerPaymentSetupFlowController *)self _addAssociatedAccountWithCompletion:v27];

        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      id v6 = PKLogFacilityTypeGetObject();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if ((operations & 0x100) == 0)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment setup operations", buf, 2u);
        }

        unint64_t completedOperations = self->_completedOperations;
        if ((completedOperations & 0x20) != 0)
        {
          if (![(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType])goto LABEL_50; {
          unint64_t completedOperations = self->_completedOperations;
          }
        }
        if ((completedOperations & 0x80) == 0)
        {
          v9 = [(PKPeerPaymentSetupFlowController *)self firstPeerPaymentAccountSetupViewController];
          (*((void (**)(id, void *, void, void))v4 + 2))(v4, v9, 0, 0);

          goto LABEL_51;
        }
LABEL_50:
        (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
        goto LABEL_51;
      }
      if (v7)
      {
        long long v26 = PKPeerPaymentSetupOperationDescriptionForOperations(0x100uLL);
        *(_DWORD *)buf = 138412290;
        v39 = v26;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);
      }
      [(PKPeerPaymentSetupFlowController *)self _completedOperation:256];
      [(PKPeerPaymentSetupFlowController *)self _nextViewControllerWithCompletion:v4];
    }
  }
LABEL_51:
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 _completedOperation:2];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 _nextViewControllerWithCompletion:v5];
  }
  else
  {
    uint64_t result = [v3 _willDisplayErrorForOperationOperationInContext:2 completion:*(void *)(a1 + 40)];
    if ((result & 1) == 0)
    {
      BOOL v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      return [v7 _presentManateeCapableOperationWithCompletion:v8];
    }
  }
  return result;
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_33(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    if (([v3 _willDisplayErrorForOperationOperationInContext:8 completion:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v4 = *(void **)(a1 + 32);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2;
      v7[3] = &unk_1E59E0BA8;
      v7[4] = v4;
      id v8 = *(id *)(a1 + 40);
      [v4 _presentMissingTLKsFlowWithCompletion:v7];
    }
  }
  else
  {
    [v3 _completedOperation:8];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 _nextViewControllerWithCompletion:v6];
  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = v7;
  if (a2)
  {
    [*(id *)(a1 + 32) _completedOperation:8];
    [*(id *)(a1 + 32) _nextViewControllerWithCompletion:*(void *)(a1 + 40)];
  }
  else if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _handleDisplayableError:v7 completion:*(void *)(a1 + 40)];
  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_35(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 _completedOperation:16];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _nextViewControllerWithCompletion:v5];
  }
  else if (([v3 _willDisplayErrorForOperationOperationInContext:16 completion:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_36;
    v7[3] = &unk_1E59E0BA8;
    v7[4] = v6;
    id v8 = *(id *)(a1 + 40);
    [v6 _setupCloudStoreWithCompletion:v7];
  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_36(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = v7;
  if (a2)
  {
    [*(id *)(a1 + 32) _completedOperation:16];
    [*(id *)(a1 + 32) _nextViewControllerWithCompletion:*(void *)(a1 + 40)];
  }
  else if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _handleDisplayableError:v7 completion:*(void *)(a1 + 40)];
  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "_handleDisplayableError:completion:");
  }
  else
  {
    [v4 _completedOperation:32];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_38;
    v6[3] = &unk_1E59E0BD0;
    uint64_t v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 _nextViewControllerWithCompletion:v6];
  }
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_41(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_42;
      aBlock[3] = &unk_1E59CAD18;
      aBlock[4] = WeakRetained;
      id v19 = *(id *)(a1 + 40);
      uint64_t v10 = _Block_copy(aBlock);
      uint64_t v11 = v10;
      if (v9[6])
      {
        [v9 _completedOperation:256];
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(void **)(v12 + 72);
        *(void *)(v12 + 72) = 0;

        id v14 = (void *)v9[6];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_3;
        v16[3] = &unk_1E59CAD18;
        v16[4] = v9;
        id v17 = v11;
        [v14 dismissViewControllerAnimated:1 completion:v16];
      }
      else
      {
        (*((void (**)(void *))v10 + 2))(v10);
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 40);
      if (a3) {
        (*(void (**)(void, void, uint64_t, void))(v15 + 16))(*(void *)(a1 + 40), 0, 1, 0);
      }
      else {
        [WeakRetained _handleDisplayableError:v7 completion:v15];
      }
    }
  }
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_42(uint64_t a1)
{
  [*(id *)(a1 + 32) _completedOperation:128];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _nextViewControllerWithCompletion:v3];
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)_handleDisplayableError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_36;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke;
  aBlock[3] = &unk_1E59CCD30;
  aBlock[4] = self;
  id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  switch([MEMORY[0x1E4F84D80] proposedResolutionForError:v6])
  {
    case 0:
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_63;
      v34[3] = &unk_1E59CAA98;
      id v35 = v7;
      v8[2](v8, v34);
      v9 = v35;
      goto LABEL_18;
    case 1:
      id v10 = v6;
      uint64_t v11 = [v10 domain];
      int v12 = [v11 isEqualToString:*MEMORY[0x1E4F871A0]];

      id v13 = v10;
      if (v12)
      {
        id v14 = [v10 userInfo];
        id v13 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      }
      uint64_t v15 = [v13 domain];
      uint64_t v16 = [v13 code];
      id v17 = (id)*MEMORY[0x1E4F87CD8];
      id v18 = v15;
      id v19 = v18;
      if (v18 == v17)
      {

        if (v16 != 40310)
        {
          id v26 = v19;
          int v21 = 1;
          goto LABEL_25;
        }
LABEL_20:
        long long v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Presenting HSA2 upgrade flow after error from server was returned.", buf, 2u);
        }

        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_47;
        v43[3] = &unk_1E59CAD18;
        v43[4] = self;
        id v44 = v7;
        v8[2](v8, v43);
        long long v25 = v44;
        goto LABEL_33;
      }
      if (!v18 || !v17)
      {

LABEL_30:
        v32 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v32, OS_LOG_TYPE_DEFAULT, "Attempting to display an alert after an error was received", buf, 2u);
        }

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_61;
        v39[3] = &unk_1E59CAD68;
        id v41 = v7;
        id v40 = v10;
        v8[2](v8, v39);

        long long v25 = v41;
        goto LABEL_33;
      }
      int v20 = [v18 isEqualToString:v17];

      if (v20 && v16 == 40310) {
        goto LABEL_20;
      }
      int v21 = [v19 isEqualToString:v17];
LABEL_25:

      if (!v21
        || v16 != 40014
        || [(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] != 1)
      {
        goto LABEL_30;
      }
      if (self->_confirmNameViewControllerBeingPresented)
      {
        uint64_t v33 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_6.isa);
        v27 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_7.isa);
        id v28 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v33 message:v27 preferredStyle:1];
        id v29 = (void *)MEMORY[0x1E4FB1410];
        v30 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_59;
        v42[3] = &unk_1E59CB1F0;
        v42[4] = self;
        id v31 = [v29 actionWithTitle:v30 style:0 handler:v42];
        [v28 addAction:v31];

        [(PKPeerPaymentConfirmNameViewController *)self->_confirmNameViewControllerBeingPresented presentViewController:v28 animated:1 completion:0];
        long long v25 = (void *)v33;
LABEL_33:

        goto LABEL_34;
      }
      [(PKPeerPaymentSetupFlowController *)self _presentNameConfirmationViewControllerWithError:v13 completion:v7];
LABEL_34:

LABEL_35:
LABEL_36:

      return;
    case 2:
      id v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Attempting to display terms after an error was received", buf, 2u);
      }

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_46;
      v45[3] = &unk_1E59CE110;
      id v46 = v6;
      v47 = self;
      id v48 = v7;
      v8[2](v8, v45);

      v9 = v46;
      goto LABEL_18;
    case 3:
      long long v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to display CIP after an error was received", buf, 2u);
      }

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_62;
      v36[3] = &unk_1E59CE110;
      v36[4] = self;
      id v37 = v6;
      id v38 = v7;
      v8[2](v8, v36);

      v9 = v37;
LABEL_18:

      goto LABEL_35;
    default:
      goto LABEL_35;
  }
}

void __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2;
    v6[3] = &unk_1E59CAA98;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_46(uint64_t a1)
{
  id v9 = *(id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (v3)
  {
    id v4 = [v9 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v6 = (void *)v5;
  }
  else
  {
    id v6 = v9;
  }
  id v10 = v6;
  id v7 = [v6 userInfo];
  id v8 = [v7 objectForKey:*MEMORY[0x1E4F87EF8]];

  [*(id *)(a1 + 40) _termsOperationWithTermsResponse:v8 completion:*(void *)(a1 + 48)];
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentManateeCapableOperationWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_59(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) showSpinner:0];
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentIdentityVerificationFlowWithError:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_completedOperation:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = PKPeerPaymentSetupOperationDescriptionForOperations(a3);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "User completed peer payment setup operation %@", (uint8_t *)&v8, 0xCu);
  }
  unint64_t v7 = self->_completedOperations | a3;
  self->_operations &= ~a3;
  self->_unint64_t completedOperations = v7;
}

- (void)_termsOperationWithTermsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:1 completion:v7])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PKPeerPaymentSetupFlowController__termsOperationWithTermsResponse_completion___block_invoke;
    v8[3] = &unk_1E59CD2D0;
    v8[4] = self;
    id v9 = v7;
    [(PKPeerPaymentSetupFlowController *)self _presentTermWithTermsResponse:v6 completion:v8];
  }
}

void __80__PKPeerPaymentSetupFlowController__termsOperationWithTermsResponse_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F84D80] displayableErrorForError:v5];
    [v6 _handleDisplayableError:v7 completion:*(void *)(a1 + 40)];
  }
  else if (a2)
  {
    [*(id *)(a1 + 32) _completedOperation:1];
    [*(id *)(a1 + 32) _nextViewControllerWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_presentTermWithTermsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    id v8 = [v6 termsURL];
    uint64_t v9 = [v6 termsIdentifier];
    uint64_t v10 = (void *)v9;
    if (!v8 || !v9)
    {
      uint64_t v11 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsURL];

      uint64_t v12 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsIdentifier];

      id v8 = (void *)v11;
      uint64_t v10 = (void *)v12;
    }
    id v13 = [PKPeerPaymentTermsController alloc];
    id v14 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    uint64_t v15 = [(PKPeerPaymentTermsController *)v13 initWithTermsURL:v8 termsIdentifier:v10 passUniqueID:v14 webService:self->_peerPaymentWebService];
    termsController = self->_termsController;
    self->_termsController = v15;

    [(PKPeerPaymentTermsController *)self->_termsController setPaymentSetupContext:[(PKPeerPaymentSetupFlowController *)self context]];
    if ([(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController shouldPushTerms])[(PKPeerPaymentTermsController *)self->_termsController setCustomPresentationHandler:&__block_literal_global_251]; {
    id v17 = PKLogFacilityTypeGetObject();
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Presenting terms for peer payment setup", buf, 2u);
    }

    id v18 = self->_termsController;
    id v19 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_66;
    v20[3] = &unk_1E59CD3C0;
    v20[4] = self;
    id v21 = v7;
    [(PKPeerPaymentTermsController *)v18 presentTermsOverController:v19 showInterstitialViewController:0 withCompletionHandler:v20];
  }
}

uint64_t __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 presentViewController:a3 withTransition:1 completion:0];
}

void __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if (!a2) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    BOOL v6 = a2 == 2;
    id v7 = *(void **)(*(void *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_2;
    v8[3] = &unk_1E59CF318;
    id v10 = *(id *)(a1 + 40);
    BOOL v11 = v6;
    id v9 = v5;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
}

uint64_t __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_presentManateeCapableOperationWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4
    && ![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:2 completion:v4])
  {
    id v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:8 feature:1 context:[(PKPeerPaymentSetupFlowController *)self context]];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
    id v8 = v7;
    if (PKPaymentSetupContextIsBridge())
    {
      id v9 = [v7 viewControllers];
      id v8 = [v9 lastObject];
    }
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Presenting hsa2 flow for peer payment setup", buf, 2u);
    }

    BOOL v11 = self->_securityCapabiltiesController;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke;
    v12[3] = &unk_1E59CD3C0;
    v12[4] = self;
    id v13 = v4;
    [(PKSecurityCapabilitiesController *)v11 presentSecurityRepairFlowWithPresentingViewController:v8 completion:v12];
  }
}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2;
  v9[3] = &unk_1E59CEA00;
  uint64_t v13 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = PKSecurityCapabilitiesErrorToString(*(void *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking peer payment security capabilities with upgrade error %@, error %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 == 3)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  if (v5 || *(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
    v6();
    return;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "User successfully completed %@. Ensuring that they indeed supportsDeviceToDeviceEncryption", buf, 0xCu);
  }
  id v8 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_69;
  v9[3] = &unk_1E59CF408;
  void v9[4] = v8;
  id v10 = *(id *)(a1 + 48);
  [v8 _checkManateeCapabilityWithCompletion:v9];
}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_69(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2_70;
  block[3] = &unk_1E59CF278;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2_70(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _completedOperation:2];
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _nextViewControllerWithCompletion:v3];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error: Possible bug on CoreCDP. User is not manatee capable after successful completion of hsa2 upgrade flow", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
    (*(void (**)(uint64_t, void, void, void *))(v5 + 16))(v5, 0, 0, v6);
  }
}

- (void)_presentEnsurePassCountWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = _Block_copy(v4);

  id nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_id nextViewControllerCompletion = v5;

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Presenting pass picker flow for peer payment setup", v15, 2u);
  }

  id v8 = [PKPaymentSelectPassesViewController alloc];
  id v9 = [(PKPeerPaymentSetupFlowController *)self passesIncludingPeerPaymentPass:0 isCheckingTotalPassCount:0];
  id v10 = [(PKPaymentSelectPassesViewController *)v8 initWithSecureElementPasses:v9 context:self->_context delegate:self peerPaymentAccount:self->_peerPaymentAccount reporter:0];

  uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMax.isa);
  [(PKPaymentSelectPassesViewController *)v10 setHeaderTitle:v11];

  id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMax_0.isa);
  [(PKPaymentSelectPassesViewController *)v10 setHeaderSubtitle:v12];

  __int16 v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentRem.isa);
  [(PKPaymentSelectPassesViewController *)v10 setButtonText:v13];

  uint64_t v14 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
  [v14 pushViewController:v10 animated:1];
}

- (void)_presentMissingTLKsFlowWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    uint64_t v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:16 feature:1 context:[(PKPeerPaymentSetupFlowController *)self context]];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Presenting missing TLKs for peer payment setup", buf, 2u);
    }

    id v8 = self->_securityCapabiltiesController;
    parentViewController = self->_parentViewController;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke;
    v10[3] = &unk_1E59DF6C0;
    id v11 = v4;
    [(PKSecurityCapabilitiesController *)v8 presentSecurityRepairFlowWithPresentingViewController:parentViewController completion:v10];
  }
}

void __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D6EA8;
  uint64_t v10 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = PKSecurityCapabilitiesErrorToString(a1[6]);
    uint64_t v4 = a1[4];
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking missing tlks with upgrade error %@, error %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)_setupCloudStoreWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    id v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:32 feature:1 context:[(PKPeerPaymentSetupFlowController *)self context]];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Starting cloud store setup for peer payment setup", buf, 2u);
    }

    __int16 v8 = self->_securityCapabiltiesController;
    parentViewController = self->_parentViewController;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke;
    v10[3] = &unk_1E59DF6C0;
    id v11 = v4;
    [(PKSecurityCapabilitiesController *)v8 presentSecurityRepairFlowWithPresentingViewController:parentViewController completion:v10];
  }
}

void __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D6EA8;
  uint64_t v10 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = PKSecurityCapabilitiesErrorToString(a1[6]);
    uint64_t v4 = a1[4];
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking cloud store setup upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = a1[6];
  if (v5 == 3)
  {
    id v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v5) {
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E40], 0);
    }
    id v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  return v6();
}

- (void)_provisionPassWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Begin provisioning pass for peer payment setup", buf, 2u);
    }

    [(PKPaymentProvisioningController *)self->_provisioningController resetForNewProvisioning];
    id v6 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    p_peerPaymentCredential = &self->_peerPaymentCredential;
    peerPaymentCredential = self->_peerPaymentCredential;
    int v8 = p_peerPaymentCredential[1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke;
    v10[3] = &unk_1E59CE160;
    id v11 = v4;
    [v6 provisionPeerPaymentPassWithProvisioningController:v8 credential:peerPaymentCredential completion:v10];
  }
}

void __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CF318;
  char v11 = a2;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Completed provisioning pass for peer payment setup", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 48))
  {
    (*(void (**)(void, uint64_t, void))(v3 + 16))(*(void *)(a1 + 40), 1, 0);
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85F28], 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (void)_presentIdentityVerificationFlowWithError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v8 = _Block_copy(v7);
  id nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_id nextViewControllerCompletion = v8;

  if (self->_nextViewControllerCompletion
    && ![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:64 completion:v7])
  {
    id v10 = [v6 domain];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F871A0]];

    if (v11)
    {
      uint64_t v12 = [v6 userInfo];
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      id v6 = (id)v13;
    }
    uint64_t v14 = [v6 userInfo];
    uint64_t v15 = [v14 objectForKey:*MEMORY[0x1E4F87450]];

    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Presenting identity verification for peer payment setup", buf, 2u);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke;
    aBlock[3] = &unk_1E59E0C48;
    aBlock[4] = self;
    id v17 = (void (**)(void *, void *))_Block_copy(aBlock);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4;
    v22[3] = &unk_1E59E0C70;
    v22[4] = self;
    id v18 = _Block_copy(v22);
    id v19 = v18;
    if (v15)
    {
      (*((void (**)(void *, void *))v18 + 2))(v18, v15);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4_92;
      v20[3] = &unk_1E59E0C98;
      v20[4] = self;
      id v21 = v18;
      v17[2](v17, v20);
    }
  }
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F84DA0]);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) context];
  objc_msgSend(v4, "setDevSigned:", objc_msgSend(v5, "devSigned"));

  id v6 = *(void **)(*(void *)(a1 + 32) + 120);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2;
  v8[3] = &unk_1E59E0C20;
  id v9 = v3;
  id v7 = v3;
  [v6 peerPaymentIdentityVerificationRequest:v4 completion:v8];
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3;
  block[3] = &unk_1E59CA938;
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E60]);
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_5;
  aBlock[3] = &unk_1E59CCCE8;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = _Block_copy(aBlock);
  if ([*(id *)(*(void *)(a1 + 32) + 96) peerPaymentSetupConfigurationType] == 1)
  {
    id v5 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:*(void *)(*(void *)(a1 + 32) + 120) identityVerificationResponse:v3 setupDelegate:*(void *)(a1 + 32) hideInitialSplashScreen:1 context:*(void *)(*(void *)(a1 + 32) + 88)];
    id v6 = [[PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController alloc] initWithPeerPaymentSetupFlowController:*(void *)(a1 + 32)];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2_88;
    v18[3] = &unk_1E59CA7D0;
    v18[4] = *(void *)(a1 + 32);
    [(PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *)v6 setCancelHandler:v18];
    objc_initWeak(&location, v6);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3_89;
    id v13 = &unk_1E59CB038;
    objc_copyWeak(&v16, &location);
    id v7 = v5;
    uint64_t v14 = v7;
    id v15 = v4;
    [(PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *)v6 setContinueHandler:&v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    if (v7)
    {
      if (v6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:*(void *)(*(void *)(a1 + 32) + 120) identityVerificationResponse:v3 setupDelegate:*(void *)(a1 + 32) hideInitialSplashScreen:0 context:*(void *)(*(void *)(a1 + 32) + 88)];
  if (v6) {
    goto LABEL_8;
  }
LABEL_7:
  id v6 = [(PKPeerPaymentIdentityVerificationController *)v7 firstViewController];
  if (!v6)
  {
    (*((void (**)(void *, void))v4 + 2))(v4, 0);
    goto LABEL_9;
  }
LABEL_8:
  id v8 = [[PKNavigationController alloc] initWithRootViewController:v6];
  [(PKNavigationController *)v8 setModalInPresentation:1];
  [(PKNavigationController *)v8 setSupportedInterfaceOrientations:2];
  PKPaymentSetupApplyContextAppearance([*(id *)(a1 + 32) context], v8);
  id v9 = [*(id *)(*(void *)(a1 + 32) + 80) navigationController];
  [v9 presentViewController:v8 animated:1 completion:0];

LABEL_9:
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_6;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  id v5 = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_84;
    v6[3] = &unk_1E59CAA98;
    id v7 = v4;
    [v3 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    v4[2](v4);
  }
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error: no view controller defined for identity verification flow.", v7, 2u);
  }

  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E58], 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  id v4 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
  (*(void (**)(uint64_t, void, void, void *))(v3 + 16))(v3, 0, 0, v4);

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = 0;
}

uint64_t __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2_88(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) firstViewController];
    if (v3)
    {
      id v4 = [v5 navigationController];
      [v4 pushViewController:v3 animated:1];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    id WeakRetained = v5;
  }
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4_92(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v11)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F84D80] displayableErrorForError:v5];
      [v7 _handleDisplayableError:v8 completion:*(void *)(*(void *)(a1 + 32) + 72)];
    }
    else
    {
      (*(void (**)(void))(v7[9] + 16))();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = 0;
    }
  }
}

- (void)_addAssociatedAccountWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)id v5 = self->_configuration; {
    else
    }
      id v5 = 0;
    id v6 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v5 familyMember];
    id v7 = [v6 altDSID];
    id v8 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v5 firstName];
    uint64_t v9 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v5 lastName];
    if (v7)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F84D68]);
      [v10 setFirstName:v8];
      [v10 setLastName:v9];
      [v10 setAltDSID:v7];
      [v10 setRole:1];
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v9;
        __int16 v22 = 2112;
        long long v23 = v7;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Starting add associated account flow for firstName: %@  lastName: %@ altDSID:  %@.", buf, 0x20u);
      }

      peerPaymentWebService = self->_peerPaymentWebService;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke;
      v14[3] = &unk_1E59E0D10;
      id v17 = v4;
      id v15 = v5;
      id v16 = self;
      [(PKPeerPaymentWebService *)peerPaymentWebService peerPaymentAddAssociatedAccountWithRequest:v10 completion:v14];
    }
    else
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Error: cannot add an associated account for a nil altDSID", buf, 2u);
      }

      id v10 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
      (*((void (**)(id, void, void, id))v4 + 2))(v4, 0, 0, v10);
    }
  }
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CEF00;
  id v12 = v6;
  id v13 = v5;
  id v16 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Addition of associated account completed with error %@", buf, 0xCu);
  }

  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) updatedPreferences];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_94;
    aBlock[3] = &unk_1E59E0CE8;
    aBlock[4] = *(void *)(a1 + 56);
    id v5 = v6;
    id v11 = v5;
    id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (v5)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Updating preferences for newly added associated account %@", buf, 0xCu);
      }

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_97;
      v8[3] = &unk_1E59CAA98;
      id v9 = *(id *)(a1 + 64);
      v7[2](v7, v8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 120) targetDevice];
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2_95;
  v7[3] = &unk_1E59E0CC0;
  id v8 = v3;
  id v6 = v3;
  [v4 setPreferences:v5 completion:v7];
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2_95(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_3;
  v6[3] = &unk_1E59CAD18;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error updating preferences for new associated account %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentNameConfirmationViewControllerWithError:(id)a3 completion:(id)a4
{
  id v17 = a4;
  int v5 = _Block_copy(v17);
  id nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_id nextViewControllerCompletion = v5;

  if (self->_nextViewControllerCompletion
    && ![(PKPeerPaymentSetupFlowController *)self _willDisplayErrorForOperationOperationInContext:256 completion:v17])
  {
    if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)uint64_t v7 = self->_configuration; {
    else
    }
      uint64_t v7 = 0;
    id v8 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v7 familyMember];
    if (v8)
    {
      id v9 = [PKPeerPaymentConfirmNameViewController alloc];
      id v10 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v7 familyMember];
      id v11 = [(PKPeerPaymentConfirmNameViewController *)v9 initWithFamilyMember:v10 delegate:self context:self->_context];
      confirmNameViewControllerBeingPresented = self->_confirmNameViewControllerBeingPresented;
      self->_confirmNameViewControllerBeingPresented = v11;

      id v13 = [[PKNavigationController alloc] initWithRootViewController:self->_confirmNameViewControllerBeingPresented];
      [(PKNavigationController *)v13 setModalInPresentation:1];
      uint64_t v14 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
      [v14 presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      id v15 = self->_nextViewControllerCompletion;
      id v16 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
      (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v16);

      id v13 = (PKNavigationController *)self->_nextViewControllerCompletion;
      self->_id nextViewControllerCompletion = 0;
    }
  }
}

- (void)_fitlerOperations:(unint64_t)a3 peerPaymentAccount:(id)a4 context:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = PKPeerPaymentSetupOperationDescriptionForOperations(a3);
    int v16 = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Setting new peer payment setup operations %@", (uint8_t *)&v16, 0xCu);
  }
  unint64_t completedOperations = self->_completedOperations;
  self->_unint64_t operations = a3 & ~completedOperations;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = PKPeerPaymentSetupOperationDescriptionForOperations(completedOperations);
    int v16 = 138412290;
    id v17 = v11;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Removing completed peer payment setup operations %@", (uint8_t *)&v16, 0xCu);
  }
  if (([(PKPeerPaymentAccount *)self->_peerPaymentAccount termsAcceptanceRequired] & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = PKPeerPaymentSetupOperationDescriptionForOperations(1uLL);
      int v16 = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);
    }
    [(PKPeerPaymentSetupFlowController *)self _completedOperation:1];
  }
  if (![(PKPeerPaymentSetupFlowController *)self _cipState])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
      int v16 = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);
    }
    [(PKPeerPaymentSetupFlowController *)self _completedOperation:64];
  }
  if (![(PKPeerPaymentSetupFlowController *)self _hasTooManyPasses])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);
    }
    [(PKPeerPaymentSetupFlowController *)self _completedOperation:4];
  }
  if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1&& [(PKPeerPaymentSetupFlowController *)self _peerPaymentPassIsProvisioned])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = PKPeerPaymentSetupOperationDescriptionForOperations(0x20uLL);
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);
    }
    [(PKPeerPaymentSetupFlowController *)self _completedOperation:32];
  }
}

- (BOOL)_willDisplayErrorForOperationOperationInContext:(unint64_t)a3 completion:(id)a4
{
  __int16 v4 = a3;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((v4 & 2) != 0)
  {
    if (PKPaymentSetupContextIsSetupAssistant())
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        *(_DWORD *)buf = 138412290;
        v81 = v18;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);
      }
      id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_16.isa);
      id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_17.isa);
      id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      id v19 = (void *)MEMORY[0x1E4FB1410];
      __int16 v20 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke;
      v78[3] = &unk_1E59CB150;
      id v79 = v6;
      id v21 = [v19 actionWithTitle:v20 style:0 handler:v78];
      [v11 addAction:v21];

      __int16 v22 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
      [v22 presentViewController:v11 animated:1 completion:0];

      int v16 = v79;
      goto LABEL_49;
    }
    if (PKPaymentSetupContextIsBridge())
    {
      if (self->_hasPresentedDeviceToDeviceEncryptionFlow)
      {
        uint64_t v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
          *(_DWORD *)buf = 138412290;
          v81 = v25;
          _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in bridge and has already need the device to device encryption flow", buf, 0xCu);
        }
        id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_18.isa);
        id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_19.isa);
        id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
        id v26 = (void *)MEMORY[0x1E4FB1410];
        v27 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_115;
        v76[3] = &unk_1E59CB150;
        id v77 = v6;
        id v28 = [v26 actionWithTitle:v27 style:1 handler:v76];
        [v11 addAction:v28];

        id v29 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
        [v29 presentViewController:v11 animated:1 completion:0];

        int v16 = v77;
        goto LABEL_49;
      }
    }
    else if (self->_hasPresentedDeviceToDeviceEncryptionFlow)
    {
      v36 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        *(_DWORD *)buf = 138412290;
        v81 = v37;
        _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user has already need the device to device encryption flow", buf, 0xCu);
      }
      id v38 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_0.isa);
      v39 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_1.isa);
      id v9 = PKDisplayableErrorCustom();

      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_122;
      v74[3] = &unk_1E59CAA98;
      id v75 = v6;
      id v40 = PKAlertForDisplayableErrorWithHandlers(v9, 0, v74, 0);
      id v41 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
      [v41 presentViewController:v40 animated:1 completion:0];

      goto LABEL_51;
    }
    goto LABEL_44;
  }
  if ((v4 & 0x40) == 0)
  {
    if ((v4 & 8) != 0)
    {
      if (PKPaymentSetupContextIsSetupAssistant())
      {
        v30 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = PKPeerPaymentSetupOperationDescriptionForOperations(8uLL);
          *(_DWORD *)buf = 138412290;
          v81 = v31;
          _os_log_impl(&dword_19F450000, v30, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);
        }
        id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_1.isa);
        id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAct_2.isa);
        id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
        v32 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v33 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_149;
        v66[3] = &unk_1E59CB150;
        id v67 = v6;
        uint64_t v34 = [v32 actionWithTitle:v33 style:0 handler:v66];
        [v11 addAction:v34];

        id v35 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
        [v35 presentViewController:v11 animated:1 completion:0];

        int v16 = v67;
        goto LABEL_49;
      }
    }
    else if ((v4 & 4) != 0)
    {
      if (PKPaymentSetupContextIsSetupAssistant())
      {
        id v46 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
          *(_DWORD *)buf = 138412290;
          v81 = v47;
          _os_log_impl(&dword_19F450000, v46, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);
        }
        MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E38], 0);
        id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen.isa);
        id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen_0.isa);
        id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
        id v48 = (void *)MEMORY[0x1E4FB1410];
        v49 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_156;
        v64[3] = &unk_1E59CB150;
        id v65 = v6;
        uint64_t v50 = [v48 actionWithTitle:v49 style:0 handler:v64];
        [v11 addAction:v50];

        v51 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
        [v51 presentViewController:v11 animated:1 completion:0];

        int v16 = v65;
        goto LABEL_49;
      }
    }
    else if ((v4 & 0x100) != 0 {
           && [(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] != 1)
    }
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = PKPeerPaymentSetupOperationDescriptionForOperations(0x100uLL);
        *(_DWORD *)buf = 138412290;
        v81 = v8;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is not adding an associated account", buf, 0xCu);
      }
      id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen.isa);
      id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentGen_0.isa);
      id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      id v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_157;
      v62[3] = &unk_1E59CB150;
      id v63 = v6;
      uint64_t v14 = [v12 actionWithTitle:v13 style:0 handler:v62];
      [v11 addAction:v14];

      id v15 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
      [v15 presentViewController:v11 animated:1 completion:0];

      int v16 = v63;
      goto LABEL_49;
    }
    goto LABEL_44;
  }
  unint64_t v23 = [(PKPeerPaymentSetupFlowController *)self _cipState];
  if (v23 == 2)
  {
    if (PKDeviceSupportsPeerPaymentIdentityVerification())
    {
      v42 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
        *(_DWORD *)buf = 138412290;
        v81 = v43;
        _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the cannot perform CIP.", buf, 0xCu);
      }
      id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_9.isa);
      id v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_13.isa);
      if (PKPaymentSetupContextIsSetupAssistant()) {
        PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
      }
      else {
      id v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      }
      v53 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      v54 = (void *)MEMORY[0x1E4FB1410];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_129;
      v70[3] = &unk_1E59CB150;
      id v71 = v6;
      uint64_t v55 = [v54 actionWithTitle:v11 style:0 handler:v70];
      [v53 addAction:v55];

      v56 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
      [v56 presentViewController:v53 animated:1 completion:0];

      goto LABEL_50;
    }
    goto LABEL_39;
  }
  if (v23 != 1)
  {
    if (PKDeviceSupportsPeerPaymentIdentityVerification()) {
      goto LABEL_44;
    }
LABEL_39:
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2;
    v72[3] = &unk_1E59CAA98;
    id v73 = v6;
    id v44 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v72);
    uint64_t v45 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
    [v45 presentViewController:v44 animated:1 completion:0];

    id v9 = v73;
LABEL_51:

    BOOL v52 = 1;
    goto LABEL_52;
  }
  if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) == 0) {
    goto LABEL_39;
  }
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)
    {
      id v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_8.isa);
      PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_9.isa);
    }
    else
    {
      id v9 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_46.isa);
      PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_47.isa);
    id v10 = };
    id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
    v57 = (void *)MEMORY[0x1E4FB1410];
    v58 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2_142;
    v68[3] = &unk_1E59CB150;
    id v69 = v6;
    id v59 = [v57 actionWithTitle:v58 style:0 handler:v68];
    [v11 addAction:v59];

    v60 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
    [v60 presentViewController:v11 animated:1 completion:0];

    int v16 = v69;
LABEL_49:

LABEL_50:
    goto LABEL_51;
  }
LABEL_44:
  BOOL v52 = 0;
LABEL_52:

  return v52;
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_149(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_157(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasTooManyPasses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (PKDisableDynamicSEAllocation())
  {
    id v3 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
    __int16 v4 = [(PKPeerPaymentSetupFlowController *)self passesIncludingPeerPaymentPass:0 isCheckingTotalPassCount:1];
    unint64_t v5 = objc_msgSend(v4, "pk_countObjectsPassingTest:", &__block_literal_global_160);
    if (v5)
    {
      if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v6 = [v3 maximumPaymentCards];
      }
      else
      {
        id v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v15 = 138543362;
          int v16 = v11;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to max payment cards. Assuming local maximum.", (uint8_t *)&v15, 0xCu);
        }
        uint64_t v6 = PKMaxPaymentCards();
      }
      LODWORD(v5) = v6 - 1 < v5;
    }
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"NO";
      if (v5) {
        id v13 = @"YES";
      }
      int v15 = 138412290;
      int v16 = v13;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Need to ensure pass count %@ for peer payment setup", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v15 = 138543362;
      int v16 = v8;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _hasTooManyPasses returning false because dynamic se allocation enabled", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

BOOL __53__PKPeerPaymentSetupFlowController__hasTooManyPasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 passActivationState] != 4;
}

- (void)_checkManateeCapabilityWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:8 feature:1 context:self->_context];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke;
    v8[3] = &unk_1E59D2E18;
    id v9 = v4;
    [(PKSecurityCapabilitiesController *)v7 isEnabledForSecuirtyRequirementsWithCompletion:v8];
  }
}

void __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke_2;
  v3[3] = &unk_1E59CAF20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_checkCloudStoreSetupWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:32 feature:1 context:self->_context];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke;
    v8[3] = &unk_1E59D2E18;
    id v9 = v4;
    [(PKSecurityCapabilitiesController *)v7 isEnabledForSecuirtyRequirementsWithCompletion:v8];
  }
}

void __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke_2;
  block[3] = &unk_1E59E0D38;
  id v5 = *(id *)(a1 + 32);
  char v9 = a2;
  id v7 = v5;
  uint64_t v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v3 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, BOOL))(v2 + 16))(v2, v3);
}

- (void)_checkMissingTLKsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:16 feature:1 context:[(PKPeerPaymentSetupFlowController *)self context]];
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    id v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke;
    v8[3] = &unk_1E59D2E18;
    id v9 = v4;
    [(PKSecurityCapabilitiesController *)v7 isEnabledForSecuirtyRequirementsWithCompletion:v8];
  }
}

void __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke_2;
  v2[3] = &unk_1E59CAF20;
  char v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = @"NO";
    if (!v2) {
      char v4 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Need to present missing TLKs flow %@ for peer payment setup", (uint8_t *)&v7, 0xCu);
  }

  id v5 = (void *)MEMORY[0x1E4F85CD0];
  if (v2) {
    id v5 = (void *)MEMORY[0x1E4F85E48];
  }
  MEMORY[0x1A6220EC0](*v5, 0);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)_cipState
{
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount state] == 1
    && [(PKPeerPaymentAccount *)self->_peerPaymentAccount stage] == 3)
  {
    return 0;
  }
  unint64_t result = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
  if (result != 1)
  {
    if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount identityVerificationRequired])return 1; {
    else
    }
      return 2;
  }
  return result;
}

- (BOOL)_peerPaymentPassIsProvisioned
{
  return [(PKPaymentPass *)self->_peerPaymentPass activationState] != PKPaymentPassActivationStateDeactivated;
}

- (void)_fetchAppleCashCapabilitiesIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)
  {
    if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)id v3 = self->_configuration; {
    else
    }
      id v3 = 0;
    char v4 = [(PKPeerPaymentSetupFlowControllerConfiguration *)v3 familyMember];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Fetching family member apple cash capabilities %@", buf, 0xCu);
    }

    if (v4)
    {
      deviceCapabiltiesManager = self->_deviceCapabiltiesManager;
      int v7 = [v4 appleID];
      id v11 = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      id v10 = v4;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
      [(PKDeviceSharingCapabilitiesManager *)deviceCapabiltiesManager fetchDeviceCapabilitesForAppleIDs:v8 associatedFamilyMembers:v9];
    }
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Completed identity verification for peer payment setup", buf, 2u);
  }

  peerPaymentService = self->_peerPaymentService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke;
  v8[3] = &unk_1E59E0D60;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(PKPeerPaymentService *)peerPaymentService updateAccountWithCompletion:v8];
}

void __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_2(void *a1)
{
  int v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(a1[5] + 144), v2);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_3;
  v5[3] = &unk_1E59CA7D0;
  id v3 = (void *)a1[6];
  v5[4] = a1[5];
  return [v3 dismissViewControllerAnimated:1 completion:v5];
}

void __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cipState];
  if ((unint64_t)(v2 - 1) >= 3)
  {
    if (!v2)
    {
      [*(id *)(a1 + 32) _completedOperation:64];
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = v8[9];
      [v8 _nextViewControllerWithCompletion:v9];
    }
  }
  else
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "The user account is still not in a good state and CIP might still be required.", v10, 2u);
    }

    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F84D80] displayableErrorForError:0];
      (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);

      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 72);
      *(void *)(v6 + 72) = 0;
    }
  }
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Completed identity verification with cancel for peer payment setup", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPeerPaymentSetupFlowController_viewControllerDidCancelSetupFlow___block_invoke;
  v6[3] = &unk_1E59CA7D0;
  void v6[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __69__PKPeerPaymentSetupFlowController_viewControllerDidCancelSetupFlow___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, 0, 1, 0);
  }
  return result;
}

- (void)selectPassesViewControllerDidTapBackButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentSetupFlowControllerDataSource *)self->_parentViewController navigationController];
  uint64_t v6 = [v5 viewControllers];

  if ((unint64_t)[v6 count] < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "The user tapped the back button when removing a pass", v10, 2u);
      }

      id nextViewControllerCompletion = self->_nextViewControllerCompletion;
      if (nextViewControllerCompletion) {
        (*((void (**)(id, void, uint64_t, void))nextViewControllerCompletion + 2))(nextViewControllerCompletion, 0, 1, 0);
      }
    }
  }
}

- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v8 = a4;
  id v17 = a5;
  id v19 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  uint64_t v9 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__69;
  v30[4] = __Block_byref_object_dispose__69;
  id v31 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * v12);
        dispatch_group_enter(v9);
        paymentWebService = self->_paymentWebService;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke;
        v23[3] = &unk_1E59DF850;
        long long v25 = v30;
        uint64_t v24 = v9;
        [v19 paymentWebService:paymentWebService removePass:v13 withCompletionHandler:v23];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke_2;
  block[3] = &unk_1E59E0D88;
  void block[4] = self;
  id v21 = v17;
  __int16 v22 = v30;
  id v15 = v17;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v30, 8);
}

void __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 && (a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v3)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 72);
      *(void *)(v4 + 72) = 0;
    }
    else
    {
      int v6 = [*(id *)(a1 + 32) _hasTooManyPasses];
      id v7 = *(void **)(a1 + 32);
      if (!v6)
      {
        [v7 _completedOperation:4];
        id v7 = *(void **)(a1 + 32);
      }
      uint64_t v8 = v7[9];
      [v7 _nextViewControllerWithCompletion:v8];
    }
  }
}

- (void)confirmNameViewControllerCancelled:(id)a3
{
  uint64_t v4 = (PKPeerPaymentConfirmNameViewController *)a3;
  if (self->_confirmNameViewControllerBeingPresented == v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Name confirmation view controller canceled", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PKPeerPaymentSetupFlowController_confirmNameViewControllerCancelled___block_invoke;
    v6[3] = &unk_1E59CA7D0;
    void v6[4] = self;
    [(PKPeerPaymentConfirmNameViewController *)v4 dismissViewControllerAnimated:1 completion:v6];
  }
}

void __71__PKPeerPaymentSetupFlowController_confirmNameViewControllerCancelled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(uint64_t, void, uint64_t, void))(v2 + 16))(v2, 0, 1, 0);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;
  }
}

- (void)confirmNameViewController:(id)a3 enteredFirstName:(id)a4 lastName:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (PKPeerPaymentConfirmNameViewController *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_confirmNameViewControllerBeingPresented == v8)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Name confirmation view controller completed with %@ %@", (uint8_t *)&v13, 0x16u);
    }

    if ([(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] == 1)uint64_t v12 = self->_configuration; {
    else
    }
      uint64_t v12 = 0;
    [(PKPeerPaymentSetupFlowControllerConfiguration *)v12 setFirstName:v9];
    [(PKPeerPaymentSetupFlowControllerConfiguration *)v12 setLastName:v10];
    if (self->_nextViewControllerCompletion) {
      -[PKPeerPaymentSetupFlowController _nextViewControllerWithCompletion:](self, "_nextViewControllerWithCompletion:");
    }
  }
}

- (void)_handlePeerPaymentAccountDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPeerPaymentSetupFlowController__handlePeerPaymentAccountDidChangeNotification__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKPeerPaymentSetupFlowController__handlePeerPaymentAccountDidChangeNotification__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) targetDevice];
  uint64_t v2 = [v5 account];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;
}

- (id)_peerPaymentWebService
{
  if (PKPaymentSetupContextIsBridge()
    && [(PKPeerPaymentSetupFlowControllerConfiguration *)self->_configuration peerPaymentSetupConfigurationType] != 1)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Using watch peer payment web service for peer payment setup", buf, 2u);
    }

    uint64_t v4 = [(objc_class *)getNPKCompanionAgentConnectionClass_9() watchPeerPaymentWebService];
  }
  else
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Using phone peer payment web service for peer payment setup", v7, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F84E10] sharedService];
  }

  return v4;
}

- (id)_paymentWebService
{
  if (PKPaymentSetupContextIsBridge()) {
    [(objc_class *)getNPKCompanionAgentConnectionClass_9() watchPaymentWebService];
  }
  else {
  uint64_t v2 = [MEMORY[0x1E4F84D50] sharedService];
  }

  return v2;
}

- (PKPeerPaymentSetupFlowControllerDataSource)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (PKPeerPaymentSetupFlowControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPeerPaymentCredential)peerPaymentCredential
{
  return self->_peerPaymentCredential;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager
{
  return self->_deviceCapabiltiesManager;
}

- (UIImage)passSnapShot
{
  return self->_passSnapShot;
}

- (PKPeerPaymentSetupFlowControllerDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPeerPaymentSetupFlowControllerDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_passSnapShot, 0);
  objc_storeStrong((id *)&self->_deviceCapabiltiesManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_peerPaymentCredential, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong(&self->_nextViewControllerCompletion, 0);
  objc_storeStrong((id *)&self->_confirmNameViewControllerBeingPresented, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_securityCapabiltiesController, 0);
  objc_storeStrong((id *)&self->_termsController, 0);

  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
}

@end