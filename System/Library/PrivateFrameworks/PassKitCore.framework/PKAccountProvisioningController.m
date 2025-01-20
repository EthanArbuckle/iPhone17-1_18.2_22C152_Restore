@interface PKAccountProvisioningController
+ (BOOL)_isPaymentPassActivated:(id)a3 forAccountCredential:(id)a4;
- (BOOL)didAddToAMP;
- (NSString)provisionedPassUniqueID;
- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 accountService:(id)a5;
- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 usingRemoteLibrary:(BOOL)a5;
- (PKAccountProvisioningControllerDelegate)delegate;
- (double)passActivationTimeout;
- (id)_notificationDidChangeNames;
- (unint64_t)addToAMPState;
- (unint64_t)addToIDMSState;
- (unint64_t)localPassActivationState;
- (unint64_t)makeAccountPassDefaultOnLocalDeviceState;
- (unint64_t)provisionLocalPassState;
- (unint64_t)provisionWatchPassState;
- (void)_handlePassActiviated;
- (void)_informDelegateOfError:(id)a3;
- (void)_informDelegateOfStateUpdate;
- (void)_passLibraryDidChange:(id)a3;
- (void)_processRemainingTasks;
- (void)_setupAccountAndProvisionAccountCredenital:(id)a3 provisioningController:(id)a4 completion:(id)a5;
- (void)_startPassActivationObserver;
- (void)_stopPassActivationObserver;
- (void)addToIDMS;
- (void)dealloc;
- (void)makeAccountPassDefaultOnLocalDevice;
- (void)performAMPEnrollmentShouldEnroll:(BOOL)a3 shouldMakeDefault:(BOOL)a4;
- (void)provisionAccountPassToLocalDevice;
- (void)provisionAccountPassToWatchAsDefault:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddToAMP:(BOOL)a3;
- (void)setPassActivationTimeout:(double)a3;
- (void)setProvisionedPassUniqueID:(id)a3;
@end

@implementation PKAccountProvisioningController

- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 accountService:(id)a5
{
  return [(PKAccountProvisioningController *)self initWithAccountCredential:a3 provisioningController:a4 usingRemoteLibrary:0];
}

- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 usingRemoteLibrary:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountProvisioningController;
  v11 = [(PKAccountProvisioningController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a4);
    objc_storeStrong((id *)&v12->_accountCredential, a3);
    v12->_usingRemoteLibrary = a5;
  }

  return v12;
}

- (void)dealloc
{
  [(PKAccountProvisioningController *)self _stopPassActivationObserver];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountProvisioningController;
  [(PKAccountProvisioningController *)&v3 dealloc];
}

- (void)provisionAccountPassToLocalDevice
{
  objc_super v3 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Requesting local device provisioning of credential", (uint8_t *)buf, 2u);
  }

  if ((self->_provisionLocalPassState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    *(int64x2_t *)&self->_provisionLocalPassState = vdupq_n_s64(2uLL);
    [(PKAccountProvisioningController *)self _stopPassActivationObserver];
    objc_initWeak(buf, self);
    accountCredential = self->_accountCredential;
    provisioningController = self->_provisioningController;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke;
    v6[3] = &unk_1E56E7478;
    objc_copyWeak(&v7, buf);
    v6[4] = self;
    [(PKAccountProvisioningController *)self _setupAccountAndProvisionAccountCredenital:accountCredential provisioningController:provisioningController completion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"YES";
    if (!v5) {
      v8 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Finished provisioning to local device with success: %@", buf, 0xCu);
  }

  id v9 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      WeakRetained[10] = 0;
      WeakRetained[11] = 0;
      [WeakRetained _informDelegateOfError:v6];
    }
    else
    {
      uint64_t v12 = [v5 uniqueID];
      v13 = (void *)v11[9];
      v11[9] = v12;

      [(id)v11[2] setPaymentPass:v5];
      if ([(id)objc_opt_class() _isPaymentPassActivated:v5 forAccountCredential:v11[2]])
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
        v11[11] = 3;
      }
      else
      {
        [v11 _startPassActivationObserver];
      }
      objc_super v14 = [(id)v11[2] account];
      v15 = [v14 accountIdentifier];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_30;
      aBlock[3] = &unk_1E56DD818;
      objc_copyWeak(&v31, v9);
      v16 = _Block_copy(aBlock);
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_3;
      v26 = &unk_1E56E7450;
      objc_copyWeak(&v29, v9);
      id v17 = v15;
      id v27 = v17;
      id v18 = v16;
      id v28 = v18;
      v19 = (void (**)(void))_Block_copy(&v23);
      unint64_t v20 = objc_msgSend(v14, "type", v23, v24, v25, v26);
      if (v20 <= 4)
      {
        uint64_t v21 = 1 << v20;
        v22 = v19;
        if ((v21 & 0x1A) == 0) {
          v22 = (void (**)(void))v18;
        }
        v22[2]();
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
    }
  }
}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_2;
    block[3] = &unk_1E56D8AE0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 3;
  [*(id *)(a1 + 32) _informDelegateOfStateUpdate];
  v2 = *(void **)(a1 + 32);
  return [v2 _processRemainingTasks];
}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained[3] webService];
    id v5 = [v4 targetDevice];
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_4;
      v9[3] = &unk_1E56E7428;
      uint64_t v6 = *(void *)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      [v5 paymentWebService:v4 updateAccountWithIdentifier:v6 completion:v9];
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support updating account", (uint8_t *)&v8, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)makeAccountPassDefaultOnLocalDevice
{
  if ((self->_makeAccountPassDefaultOnLocalDeviceState & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return;
  }
  if (![(NSString *)self->_provisionedPassUniqueID length])
  {
    if (self->_makeAccountPassDefaultOnLocalDeviceState == 1) {
      return;
    }
    uint64_t v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    __int16 v12 = 0;
    id v7 = "Pass provisioning not complete - queueing work to make it default";
    __int16 v8 = (uint8_t *)&v12;
    goto LABEL_16;
  }
  if (!self->_passIsActivated)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      self->_makeAccountPassDefaultOnLocalDeviceState = 1;
      return;
    }
    __int16 v10 = 0;
    id v7 = "Pass is not yet activated, queuing request";
    __int16 v8 = (uint8_t *)&v10;
LABEL_16:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_17;
  }
  self->_makeAccountPassDefaultOnLocalDeviceState = 2;
  objc_super v3 = [(PKAccountCredential *)self->_accountCredential paymentPass];
  PKEnableAutomaticSelectionForPaymentPass(v3);

  v4 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  id v5 = [v4 targetDevice];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 paymentWebService:v4 setDefaultPaymentPassUniqueIdentifier:self->_provisionedPassUniqueID];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support setting default", buf, 2u);
    }
  }
  self->_makeAccountPassDefaultOnLocalDeviceState = 3;
  [(PKAccountProvisioningController *)self _informDelegateOfStateUpdate];
  [(PKAccountProvisioningController *)self _processRemainingTasks];
}

- (void)performAMPEnrollmentShouldEnroll:(BOOL)a3 shouldMakeDefault:(BOOL)a4
{
  if ((self->_addToAMPState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    self->_enrollInAMP = a3;
    self->_makeDefaultInAMP = a3 && a4;
    if ([(NSString *)self->_provisionedPassUniqueID length])
    {
      self->_addToAMPState = 2;
      uint64_t v6 = +[PKAMPEnrollmentManager sharedManager];
      id v7 = [(PKAccountCredential *)self->_accountCredential paymentPass];
      __int16 v8 = PKDismissedKeyForPass(@"AMPEnrollmentDismissed", v7);
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke;
      aBlock[3] = &unk_1E56E74C8;
      id v9 = v8;
      id v20 = v9;
      objc_copyWeak(&v21, location);
      __int16 v10 = _Block_copy(aBlock);
      if (a3)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_39;
        v13[3] = &unk_1E56E74F0;
        id v14 = v6;
        id v15 = v7;
        v16 = self;
        id v17 = v10;
        [v14 enrollmentStatusForPaymentPass:v15 completion:v13 progress:v17];
      }
      else
      {
        __int16 v12 = PKLogFacilityTypeGetObject(0xEuLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Skipping making card non default in AMP", buf, 2u);
        }

        (*((void (**)(void *, void, void))v10 + 2))(v10, 0, 0);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    else if (self->_addToAMPState != 1)
    {
      v11 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Pass provisioning not complete - queueing work to add to AMP", (uint8_t *)location, 2u);
      }

      self->_addToAMPState = 1;
    }
  }
}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_2;
  v7[3] = &unk_1E56E74A0;
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v10);
}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    v7[0] = 67109378;
    v7[1] = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "AMP enrollment completed:%d (%@)", (uint8_t *)v7, 0x12u);
  }

  PKSharedCacheSetBoolForKey(*(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 15) == 2)
  {
    *((unsigned char *)WeakRetained + 50) = *(unsigned char *)(a1 + 56);
    *((void *)WeakRetained + 15) = 3;
    [WeakRetained _informDelegateOfStateUpdate];
    [v6 _processRemainingTasks];
  }
}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 != 2)
  {
    id v7 = v5;
    if (a2 == 1) {
      [*(id *)(a1 + 32) enrollPaymentPass:*(void *)(a1 + 40) isDefault:*(unsigned __int8 *)(*(void *)(a1 + 48) + 33) completion:*(void *)(a1 + 56)];
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id v6 = v7;
  }
}

- (void)addToIDMS
{
  if ((self->_addToIDMSState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    self->_addToIDMSState = 2;
    int v3 = [(PKAccountCredential *)self->_accountCredential account];
    uint64_t v4 = objc_alloc_init(PKAccountWebServiceAccountActionRequest);
    id v5 = [v3 accountIdentifier];
    [(PKAccountWebServiceAccountActionRequest *)v4 setAccountIdentifier:v5];

    id v6 = [v3 accountBaseURL];
    [(PKAccountWebServiceAccountActionRequest *)v4 setBaseURL:v6];

    id v7 = objc_alloc_init(PKAccountAction);
    [(PKAccountAction *)v7 setActionType:1];
    [(PKAccountWebServiceAccountActionRequest *)v4 setAction:v7];
    objc_initWeak(&location, self);
    __int16 v8 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PKAccountProvisioningController_addToIDMS__block_invoke;
    v9[3] = &unk_1E56E7518;
    objc_copyWeak(&v10, &location);
    [v8 accountActionWithRequest:v4 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __44__PKAccountProvisioningController_addToIDMS__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PKAccountProvisioningController_addToIDMS__block_invoke_2;
    block[3] = &unk_1E56D8AE0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __44__PKAccountProvisioningController_addToIDMS__block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Completed account pass default in IDMS", v4, 2u);
  }

  *(void *)(*(void *)(a1 + 32) + 104) = 3;
  [*(id *)(a1 + 32) _informDelegateOfStateUpdate];
  return [*(id *)(a1 + 32) _processRemainingTasks];
}

- (void)provisionAccountPassToWatchAsDefault:(BOOL)a3
{
  BOOL v3 = a3;
  if (PKIsPairedWithWatch())
  {
    if ((self->_provisionWatchPassState & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      self->_provisionWatchPassState = 2;
      id v5 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Requesting watch provisioning of credential", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke;
      aBlock[3] = &unk_1E56DD818;
      objc_copyWeak(&v19, buf);
      id v6 = _Block_copy(aBlock);
      if (!self->_watchConnection)
      {
        id v7 = (NPKCompanionAgentConnection *)objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_1[0]());
        watchConnection = self->_watchConnection;
        self->_watchConnection = v7;
      }
      uint64_t v9 = [(PKAccountCredential *)self->_accountCredential account];
      id v10 = [v9 accountIdentifier];

      char v11 = self->_watchConnection;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_3;
      v15[3] = &unk_1E56D84A0;
      id v12 = v10;
      id v16 = v12;
      id v13 = v6;
      id v17 = v13;
      [(NPKCompanionAgentConnection *)v11 provisionPassForAccountIdentifier:v12 makeDefault:v3 completion:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "No watch paired for provisioning of credential", (uint8_t *)buf, 2u);
    }
  }
}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_2;
    block[3] = &unk_1E56D8AE0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = 3;
  [*(id *)(a1 + 32) _informDelegateOfStateUpdate];
  v2 = *(void **)(a1 + 32);
  return [v2 _processRemainingTasks];
}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Finished provisioning to watch with success: %@ error: %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2)
  {
    __int16 v8 = +[PKPassLibrary sharedInstanceWithRemoteLibrary];
    [v8 paymentPassWithAssociatedAccountIdentifier:*(void *)(a1 + 32) completion:&__block_literal_global_96];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_45(uint64_t a1, void *a2)
{
}

- (void)_processRemainingTasks
{
  if (self->_addToIDMSState == 1) {
    [(PKAccountProvisioningController *)self addToIDMS];
  }
  if (self->_makeAccountPassDefaultOnLocalDeviceState == 1) {
    [(PKAccountProvisioningController *)self makeAccountPassDefaultOnLocalDevice];
  }
  if (self->_addToAMPState == 1)
  {
    BOOL enrollInAMP = self->_enrollInAMP;
    BOOL makeDefaultInAMP = self->_makeDefaultInAMP;
    [(PKAccountProvisioningController *)self performAMPEnrollmentShouldEnroll:enrollInAMP shouldMakeDefault:makeDefaultInAMP];
  }
}

- (void)_setupAccountAndProvisionAccountCredenital:(id)a3 provisioningController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke;
  aBlock[3] = &unk_1E56D8928;
  id v11 = v10;
  void aBlock[4] = self;
  id v23 = v11;
  id v12 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_2;
  v17[3] = &unk_1E56E7588;
  id v18 = v9;
  id v19 = v8;
  id v20 = v12;
  id v21 = v11;
  id v13 = v11;
  id v14 = v8;
  id v15 = v9;
  id v16 = v12;
  [v15 validatePreconditionsAndRegister:v17];
}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (*(void *)(a1 + 40))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    id v6 = a3;
    id v7 = [v5 provisionedPasses];
    id v8 = [v7 lastObject];
    id v9 = [v8 secureElementPass];
    id v11 = [v9 paymentPass];

    id v10 = v11;
    if (!a2) {
      id v10 = 0;
    }
    (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v6);
  }
}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
  else
  {
    uint64_t v4 = [[PKProvisioningContext alloc] initWithEnvironment:0 provisioningController:*(void *)(a1 + 32) groupsController:0];
    id v5 = [[PKProvisioningBackgroundCoordinator alloc] initWithSetupContext:v4 credential:*(void *)(a1 + 40) previouslyAcceptedTerms:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_3;
    v9[3] = &unk_1E56E7560;
    id v6 = *(id *)(a1 + 56);
    id v10 = v5;
    id v11 = v6;
    id v7 = v5;
    [(PKProvisioningBackgroundCoordinator *)v7 startWithCompletion:v9];
  }
}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 firstObject];
  id v7 = [v6 secureElementPass];
  id v8 = [v7 paymentPass];

  id v9 = PKLogFacilityTypeGetObject(0xEuLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = [v8 uniqueID];
      int v14 = 138412290;
      id v15 = v11;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Sucessfully provisioned pass %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v10)
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Pass provisioning failed with error: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if ([v5 hasLocalizedTitleAndMessage])
    {
      id v13 = [v5 displayableError];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, 0, 0);
    }
  }
}

+ (BOOL)_isPaymentPassActivated:(id)a3 forAccountCredential:(id)a4
{
  id v5 = a3;
  id v6 = [a4 passDetailsResponse];
  uint64_t v7 = [v6 status];

  BOOL v8 = (unint64_t)(v7 + 1) <= 6
    && (((1 << (v7 + 1)) & 0x47) == 0 || ![v5 activationState]);

  return v8;
}

- (id)_notificationDidChangeNames
{
  if (self->_usingRemoteLibrary) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PKPassLibraryRemotePaymentPassesDidChange", @"PKPassLibraryDidChangeNotification", 0);
  }
  else {
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PKPassLibraryDidChangeNotification"];
  }
  return v2;
}

- (void)_startPassActivationObserver
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Starting pass activiation observer", (uint8_t *)buf, 2u);
  }

  uint64_t v4 = [(PKAccountProvisioningController *)self _notificationDidChangeNames];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v10 addObserver:self selector:sel__passLibraryDidChange_ name:v9 object:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  if (self->_passActivationTimeout > 0.0 && !self->_activationTimer)
  {
    id v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    activationTimer = self->_activationTimer;
    self->_activationTimer = v11;

    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(self->_passActivationTimeout * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_activationTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    int v14 = self->_activationTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__PKAccountProvisioningController__startPassActivationObserver__block_invoke;
    handler[3] = &unk_1E56DD818;
    objc_copyWeak(&v16, buf);
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume((dispatch_object_t)self->_activationTimer);
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
}

void __63__PKAccountProvisioningController__startPassActivationObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Pass activation timeout occured. Forcing activiation callback", v5, 2u);
    }

    BOOL v3 = WeakRetained[5];
    if (v3)
    {
      dispatch_source_cancel(v3);
      uint64_t v4 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;
    }
    [WeakRetained _handlePassActiviated];
  }
}

- (void)_stopPassActivationObserver
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pass activiation observer", buf, 2u);
  }

  uint64_t v4 = [(PKAccountProvisioningController *)self _notificationDidChangeNames];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v10 removeObserver:self name:v9 object:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  activationTimer = self->_activationTimer;
  if (activationTimer)
  {
    dispatch_source_cancel(activationTimer);
    uint64_t v12 = self->_activationTimer;
    self->_activationTimer = 0;
  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Pass activiation observer - library did change", buf, 2u);
  }

  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PKPassLibraryReplacementPassesUserInfo"];

  if (v7)
  {
    *(void *)buf = 0;
    id v11 = buf;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke;
    v9[3] = &unk_1E56E75B0;
    void v9[4] = self;
    v9[5] = buf;
    [v7 enumerateObjectsUsingBlock:v9];
    if (v11[24])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke_2;
      block[3] = &unk_1E56D8AE0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    _Block_object_dispose(buf, 8);
  }
}

void __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [a2 paymentPass];
  uint64_t v6 = [v8 uniqueID];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 72)];

  if (v7)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)objc_opt_class() _isPaymentPassActivated:v8 forAccountCredential:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

uint64_t __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Pass activation change detected", v4, 2u);
  }

  return [*(id *)(a1 + 32) _handlePassActiviated];
}

- (void)_handlePassActiviated
{
  if (self->_localPassActivationState != 3)
  {
    BOOL v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Pass activated", v4, 2u);
    }

    self->_passIsActivated = 1;
    self->_localPassActivationState = 3;
    [(PKAccountProvisioningController *)self _stopPassActivationObserver];
    [(PKAccountProvisioningController *)self _informDelegateOfStateUpdate];
    [(PKAccountProvisioningController *)self _processRemainingTasks];
  }
}

- (void)_informDelegateOfError:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 accountProvisioningController:self displayableError:v7];
  }
}

- (void)_informDelegateOfStateUpdate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 accountProvisioningControllerUpdatedState:self];
  }
}

- (double)passActivationTimeout
{
  return self->_passActivationTimeout;
}

- (void)setPassActivationTimeout:(double)a3
{
  self->_passActivationTimeout = a3;
}

- (PKAccountProvisioningControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKAccountProvisioningControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)provisionedPassUniqueID
{
  return self->_provisionedPassUniqueID;
}

- (void)setProvisionedPassUniqueID:(id)a3
{
}

- (BOOL)didAddToAMP
{
  return self->_didAddToAMP;
}

- (void)setDidAddToAMP:(BOOL)a3
{
  self->_didAddToAMP = a3;
}

- (unint64_t)provisionLocalPassState
{
  return self->_provisionLocalPassState;
}

- (unint64_t)localPassActivationState
{
  return self->_localPassActivationState;
}

- (unint64_t)provisionWatchPassState
{
  return self->_provisionWatchPassState;
}

- (unint64_t)addToIDMSState
{
  return self->_addToIDMSState;
}

- (unint64_t)makeAccountPassDefaultOnLocalDeviceState
{
  return self->_makeAccountPassDefaultOnLocalDeviceState;
}

- (unint64_t)addToAMPState
{
  return self->_addToAMPState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionedPassUniqueID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activationTimer, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_accountCredential, 0);
  objc_storeStrong((id *)&self->_watchConnection, 0);
}

@end