@interface PKSubcredentialProvisioningController
- (PKAppletSubcredential)addedCredential;
- (PKPaymentPass)provisionedPass;
- (PKSubcredentialProvisioningController)init;
- (PKSubcredentialProvisioningControllerDelegate)delegate;
- (id)webServiceFromConfiguration:(id)a3;
- (int64_t)currentState;
- (void)_canBeginProvisioning:(id)a3;
- (void)acquireProvisioningAssertionsWithCompletion:(id)a3;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4;
- (void)cancelProvisioningWithCompletion:(id)a3;
- (void)cleanUpProvisioningAfterError:(BOOL)a3;
- (void)declineRelatedInvitationsIfNecessary;
- (void)finishProvisioningWithError:(id)a3 state:(int64_t)a4;
- (void)operation:(id)a3 addedCredential:(id)a4;
- (void)operation:(id)a3 addedPass:(id)a4;
- (void)operation:(id)a3 advanceToState:(int64_t)a4;
- (void)operation:(id)a3 failWithError:(id)a4;
- (void)operationWasCanceled:(id)a3;
- (void)releaseProvisioningAssertions;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)startProvisioningWithConfiguration:(id)a3;
- (void)transitionToState:(int64_t)a3 withOperation:(id)a4 error:(id)a5;
@end

@implementation PKSubcredentialProvisioningController

- (PKSubcredentialProvisioningController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKSubcredentialProvisioningController;
  v2 = [(PKSubcredentialProvisioningController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.provisioningController", 0);
    operationSerialQueue = v2->_operationSerialQueue;
    v2->_operationSerialQueue = (OS_dispatch_queue *)v3;

    v2->_stateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)startProvisioningWithConfiguration:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (PKSubcredentialProvisioningOperation *)a3;
  objc_super v6 = [[PKSubcredentialProvisioningOperationContext alloc] initWithQueue:self->_operationSerialQueue];
  context = self->_context;
  self->_context = v6;

  os_unfair_lock_lock(&self->_stateLock);
  objc_storeStrong((id *)&self->_configuration, a3);
  v8 = [(PKSubcredentialProvisioningOperation *)v5 transitionTable];
  transitionTable = self->_transitionTable;
  self->_transitionTable = v8;

  int64_t v10 = [(PKSubcredentialProvisioningOperation *)v5 startingState];
  self->_unint64_t currentState = v10;
  v11 = +[PKSubcredentialProvisioningOperation operationForState:v10 configuration:v5 context:self->_context delegate:self];
  currentOperation = self->_currentOperation;
  self->_currentOperation = v11;

  unint64_t currentState = self->_currentState;
  v14 = self->_currentOperation;
  BOOL hasStarted = self->_hasStarted;
  self->_BOOL hasStarted = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  if (hasStarted)
  {
    v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Provisioning already has started", buf, 2u);
    }
  }
  else
  {
    v17 = [(PKSubcredentialProvisioningController *)self webServiceFromConfiguration:v5];
    v16 = [v17 targetDevice];

    [v16 noteProvisioningDidBegin];
    BOOL v18 = [(PKSubcredentialProvisioningTransitionTable *)self->_transitionTable isValidStartingState:currentState];
    v19 = PKStringForSubcredentialProvisioningState(currentState);
    v20 = PKLogFacilityTypeGetObject(0x16uLL);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v18 && v14)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        __int16 v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Starting pairing in state '%@' with configuration: %@", buf, 0x16u);
      }

      operationSerialQueue = self->_operationSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke;
      block[3] = &unk_1E56DF798;
      block[4] = self;
      v25 = v14;
      unint64_t v26 = currentState;
      dispatch_async(operationSerialQueue, block);
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        __int16 v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Invalid starting state '%@' with operation %@", buf, 0x16u);
      }

      v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
      [(PKSubcredentialProvisioningController *)self transitionToState:0 withOperation:v14 error:v23];
    }
  }
}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_2;
  v5[3] = &unk_1E56ECBF0;
  v5[4] = v2;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _canBeginProvisioning:v5];
}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_3;
    v9[3] = &unk_1E56DD7F0;
    v9[4] = v3;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v10 = v5;
    uint64_t v11 = v6;
    [v3 acquireProvisioningAssertionsWithCompletion:v9];
  }
  else
  {
    uint64_t v7 = v3[9];
    v8 = *(void **)(a1 + 32);
    [v8 transitionToState:0 withOperation:v7 error:a3];
  }
}

void __76__PKSubcredentialProvisioningController_startProvisioningWithConfiguration___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
    [*(id *)(a1 + 32) transitionToState:0 withOperation:*(void *)(*(void *)(a1 + 32) + 72) error:v6];
LABEL_6:
    id v5 = v6;
    goto LABEL_8;
  }
  [*(id *)(a1 + 40) performOperation];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    char v4 = objc_opt_respondsToSelector();
    id v5 = v6;
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    [v6 subcredentialProvisioningController:*(void *)(a1 + 32) didEnterState:*(void *)(a1 + 48)];
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_8:
}

- (void)_canBeginProvisioning:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__46;
  v13[4] = __Block_byref_object_dispose__46;
  id v14 = 0;
  id v5 = objc_alloc_init(PKSecureElement);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke;
  v7[3] = &unk_1E56ECC18;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  v9 = v15;
  id v10 = v13;
  [(PKSecureElement *)v5 allAppletsAndCredentialsWithCompletion:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
}

void __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v6 = [v4 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v26 = a1;
      id v27 = WeakRetained;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v13 = objc_msgSend(v4, "objectForKey:", v12, v26);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(v13);
                }
                v9 += ((unint64_t)[*(id *)(*((void *)&v34 + 1) + 8 * j) supportedRadioTechnologies] >> 1) & 1;
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v15);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v8);

      a1 = v26;
      id WeakRetained = v27;
      if (v9 > 7)
      {
        *(unsigned char *)(*(void *)(*(void *)(v26 + 48) + 8) + 24) = 0;
        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:23 userInfo:0];
        uint64_t v19 = *(void *)(*(void *)(v26 + 56) + 8);
        v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        BOOL v21 = *(NSObject **)(*(void *)(v26 + 32) + 32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_3;
        block[3] = &unk_1E56DF6D0;
        id v29 = *(id *)(v26 + 40);
        long long v30 = *(_OWORD *)(v26 + 48);
        dispatch_async(v21, block);
        v22 = v29;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v25 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_2;
    v31[3] = &unk_1E56DF6D0;
    id v32 = *(id *)(a1 + 40);
    long long v33 = *(_OWORD *)(a1 + 48);
    dispatch_async(v25, v31);
    v22 = v32;
    goto LABEL_21;
  }
  uint64_t v23 = *(void *)(a1 + 40);
  v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);

LABEL_22:
}

uint64_t __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __63__PKSubcredentialProvisioningController__canBeginProvisioning___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)cancelProvisioningWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->_stateLock);
  unint64_t currentState = self->_currentState;
  id v6 = self->_currentOperation;
  BOOL hasBeenCanceled = self->_hasBeenCanceled;
  if ([(PKSubcredentialProvisioningTransitionTable *)self->_transitionTable isStateFinal:currentState])
  {
    self->_BOOL hasBeenCanceled = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    uint64_t v8 = PKStringForSubcredentialProvisioningState(currentState);
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Can't cancel terminal state '%@'", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    uint64_t v10 = _Block_copy(v4);
    id cancelCompletion = self->_cancelCompletion;
    self->_id cancelCompletion = v10;

    self->_BOOL hasBeenCanceled = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    if (hasBeenCanceled)
    {
      uint64_t v12 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Likely overwrote existing cancelation handler", buf, 2u);
      }
    }
    uint64_t v8 = PKStringForSubcredentialProvisioningState(currentState);
    v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Canceling operation '%@'", buf, 0xCu);
    }

    if ([(PKSubcredentialProvisioningOperation *)v6 canCancelOperation])
    {
      operationSerialQueue = self->_operationSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PKSubcredentialProvisioningController_cancelProvisioningWithCompletion___block_invoke;
      block[3] = &unk_1E56D8AE0;
      uint64_t v16 = v6;
      dispatch_async(operationSerialQueue, block);
    }
  }
}

uint64_t __74__PKSubcredentialProvisioningController_cancelProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelOperation];
}

- (void)finishProvisioningWithError:(id)a3 state:(int64_t)a4
{
  id v8 = a3;
  [(PKSubcredentialProvisioningController *)self cleanUpProvisioningAfterError:v8 != 0];
  if (v8 || self->_currentState != 16)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained subcredentialProvisioningController:self didFinishWithError:v8 inState:a4];
    }
    else if (objc_opt_respondsToSelector())
    {
      [WeakRetained subcredentialProvisioningController:self didFinishWithError:v8];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v7 = [(PKSubcredentialProvisioningController *)self provisionedPass];
    [WeakRetained subcredentialProvisioningController:self didFinishWithPass:v7];
  }
}

- (void)cleanUpProvisioningAfterError:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKSubcredentialProvisioningController *)self webServiceFromConfiguration:self->_configuration];
  id v6 = [v5 targetDevice];

  uint64_t v7 = [(PKSubcredentialProvisioningController *)self addedCredential];
  id v8 = [(PKSubcredentialProvisioningController *)self provisionedPass];
  int64_t v9 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType];
  if (v9 == 2)
  {
    id v11 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration remoteDeviceConfiguration];
    uint64_t v12 = [v11 sharingSession];
  }
  else
  {
    if (v9 == 1)
    {
      uint64_t v10 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration acceptInvitationConfiguration];
    }
    else
    {
      if (v9) {
        goto LABEL_10;
      }
      uint64_t v10 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration ownerConfiguration];
    }
    id v11 = v10;
    uint64_t v12 = [v10 session];
  }
  v13 = (void *)v12;

  if (v13)
  {
    [v13 endSession];
  }
LABEL_10:
  if (v7 && !v8)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Provisioning did add a credential but not a pass, removing credential", buf, 2u);
    }

    uint64_t v15 = objc_alloc_init(PKDAManager);
    uint64_t v16 = [v7 identifier];
    [(PKDAManager *)v15 deleteCredential:v16 completion:&__block_literal_global_143];
  }
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling consistency check on the target device due to provisoning error", v18, 2u);
    }

    [v6 consistencyCheck];
  }
  [v6 noteProvisioningDidEnd];
  [(PKSubcredentialProvisioningController *)self releaseProvisioningAssertions];
  [(PKSubcredentialProvisioningController *)self declineRelatedInvitationsIfNecessary];
}

void __71__PKSubcredentialProvisioningController_cleanUpProvisioningAfterError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Revoked credential - error:%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)declineRelatedInvitationsIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType];
  if (v3 == 1)
  {
    int v4 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration acceptInvitationConfiguration];
    uint64_t v5 = [v4 remoteDeviceWebService];
    if ([(PKSubcredentialProvisioningOperationContext *)self->_context hasAcceptedInvitation])
    {
LABEL_4:
      uint64_t v6 = [v4 invitation];
      goto LABEL_7;
    }
  }
  else
  {
    if (v3 != 3)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_22;
    }
    int v4 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration remoteDeviceInvitation];
    uint64_t v5 = [v4 localDeviceWebService];
    if ([(PKSubcredentialProvisioningOperationContext *)self->_context hasAcceptedInvitation]) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = 0;
LABEL_7:
  int v7 = [v4 declineRelatedInvitations];

  if (v5)
  {
    if (!v6)
    {
      id v8 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "No invite was accepted, skipping declining related invites", (uint8_t *)&v13, 2u);
      }
      goto LABEL_21;
    }
    if (v7)
    {
      id v8 = [v6 copy];
      [v8 setIdentifier:0];
      [v8 setSharingSessionIdentifier:0];
      int64_t v9 = [v5 targetDevice];
      char v10 = objc_opt_respondsToSelector();
      id v11 = PKLogFacilityTypeGetObject(0x16uLL);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          int v13 = 138412290;
          uint64_t v14 = v8;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Declining invites similar to: %@", (uint8_t *)&v13, 0xCu);
        }

        [v9 paymentWebService:v5 declineRelatedSharingInvitationsIfNecessary:v8 withCompletion:0];
      }
      else
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Target device doesn't support declining related invitations", (uint8_t *)&v13, 2u);
        }
      }
LABEL_21:
    }
  }
LABEL_22:
}

- (void)transitionToState:(int64_t)a3 withOperation:(id)a4 error:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = (PKSubcredentialProvisioningOperation *)a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  p_currentOperation = &self->_currentOperation;
  if (self->_currentOperation == v8)
  {
    unint64_t currentState = self->_currentState;
    int v13 = PKStringForSubcredentialProvisioningState(currentState);
    if (self->_hasBeenCanceled)
    {
      if (a3 != 1)
      {
        uint64_t v14 = PKLogFacilityTypeGetObject(0x16uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v13;
          _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Stopping transition from '%@' due to pending cancellation", buf, 0xCu);
        }
      }
      uint64_t v15 = (void (**)(void))_Block_copy(self->_cancelCompletion);
      id cancelCompletion = self->_cancelCompletion;
      self->_id cancelCompletion = 0;

      os_unfair_lock_unlock(&self->_stateLock);
      [(PKSubcredentialProvisioningController *)self cleanUpProvisioningAfterError:1];
      if (v15) {
        v15[2](v15);
      }
      goto LABEL_25;
    }
    if (![(PKSubcredentialProvisioningTransitionTable *)self->_transitionTable isValidStateTransitionFrom:currentState to:a3])
    {
      v17 = PKStringForSubcredentialProvisioningState(a3);
      uint64_t v18 = [[NSString alloc] initWithFormat:@"Cannot transition from state '%@' to state '%@'", v13, v17];
      uint64_t v19 = (void *)v18;
      if (!v9)
      {
        long long v34 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28228];
        uint64_t v47 = v18;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        BOOL v21 = v20 = v13;
        id v9 = [v34 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:v21];

        int v13 = v20;
      }

      a3 = 0;
    }
    unint64_t v35 = currentState;
    if ([(PKSubcredentialProvisioningTransitionTable *)self->_transitionTable isStateFinal:a3])
    {
      v22 = *p_currentOperation;
      *p_currentOperation = 0;
    }
    else
    {
      long long v33 = v13;
      uint64_t v23 = [(PKSubcredentialProvisioningOperation *)v8 configuration];
      v24 = [(PKSubcredentialProvisioningOperation *)v8 context];
      v25 = [(PKSubcredentialProvisioningOperation *)v8 delegate];
      uint64_t v26 = +[PKSubcredentialProvisioningOperation operationForState:a3 configuration:v23 context:v24 delegate:v25];

      if (v26)
      {
        int v13 = v33;
LABEL_24:
        self->_unint64_t currentState = a3;
        objc_storeStrong((id *)&self->_currentOperation, v26);
        int64_t v31 = self->_currentState;
        os_unfair_lock_unlock(&self->_stateLock);
        operationSerialQueue = self->_operationSerialQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke;
        block[3] = &unk_1E56ECC90;
        int64_t v41 = a3;
        int64_t v42 = v31;
        void block[4] = self;
        id v37 = v26;
        id v38 = v13;
        id v9 = v9;
        id v39 = v9;
        long long v40 = v8;
        unint64_t v43 = v35;
        uint64_t v15 = v26;
        dispatch_async(operationSerialQueue, block);

LABEL_25:
        goto LABEL_26;
      }
      id v27 = [NSString alloc];
      v28 = PKStringForSubcredentialProvisioningState(0);
      v22 = (PKSubcredentialProvisioningOperation *)[v27 initWithFormat:@"Failed to create operation for state: %@", v28];

      int v13 = v33;
      if (!v9)
      {
        id v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v44 = *MEMORY[0x1E4F28228];
        v45 = v22;
        long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        id v9 = [v29 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:0 userInfo:v30];
      }
      a3 = 0;
    }

    uint64_t v26 = 0;
    goto LABEL_24;
  }
  id v11 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Received unexpected transition request, dropping it...", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_stateLock);
LABEL_26:
}

void __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  int64_t v3 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 72));
  int v4 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 80));
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v3;
      __int16 v30 = 2112;
      uint64_t v31 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Transitioning to state '%@' (expected state '%@') from state '%@'", buf, 0x20u);
    }

    [*(id *)(a1 + 40) performOperation];
  }
  else if (*(void *)(a1 + 56) {
         && [*(id *)(a1 + 64) canBeRestarted]
  }
         && (id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112)),
             char v8 = objc_opt_respondsToSelector(),
             v7,
             (v8 & 1) != 0))
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Checking if error should cause failure in state '%@'", buf, 0xCu);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_52;
    v18[3] = &unk_1E56ECC68;
    objc_copyWeak(v25, (id *)buf);
    id v19 = *(id *)(a1 + 48);
    id v20 = v4;
    id v21 = v3;
    id v14 = *(id *)(a1 + 56);
    v25[1] = *(id *)(a1 + 88);
    uint64_t v15 = *(void *)(a1 + 32);
    id v22 = v14;
    uint64_t v23 = v15;
    id v24 = *(id *)(a1 + 64);
    [v11 subcredentialProvisioningController:v12 shouldFailAfterError:v13 withCompletion:v18];

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v3;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Transitioning to state '%@' (expected state '%@') from state '%@'", buf, 0x20u);
    }

    [*(id *)(a1 + 32) finishProvisioningWithError:*(void *)(a1 + 56) state:*(void *)(a1 + 88)];
  }
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained subcredentialProvisioningController:*(void *)(a1 + 32) didEnterState:*(void *)(a1 + 80)];
  }
}

void __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_52(uint64_t a1, char a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_2;
    block[3] = &unk_1E56ECC40;
    char v19 = a2;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v14 = v5;
    id v7 = *(id *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = *(void **)(a1 + 72);
    id v15 = v7;
    uint64_t v16 = v8;
    id v17 = v9;
    dispatch_async(v6, block);
  }
}

uint64_t __79__PKSubcredentialProvisioningController_transitionToState_withOperation_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 96))
  {
    v2 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v9 = 138412802;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error should cause failure in state '%@' transitioning to state '%@' (expected state '%@')", (uint8_t *)&v9, 0x20u);
    }

    return [*(id *)(a1 + 56) finishProvisioningWithError:*(void *)(a1 + 64) state:*(void *)(a1 + 88)];
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 72) + 40));
    *(void *)(*(void *)(a1 + 72) + 80) = *(void *)(a1 + 88);
    objc_storeStrong((id *)(*(void *)(a1 + 72) + 72), *(id *)(a1 + 80));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 72) + 40));
    id v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error should not cause failure, retrying operation for state '%@'", (uint8_t *)&v9, 0xCu);
    }

    return [*(id *)(a1 + 80) performOperation];
  }
}

- (PKAppletSubcredential)addedCredential
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_addedCredential;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (PKPaymentPass)provisionedPass
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_provisionedPass;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (int64_t)currentState
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t currentState = self->_currentState;
  os_unfair_lock_unlock(p_stateLock);
  return currentState;
}

- (id)webServiceFromConfiguration:(id)a3
{
  switch([(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType])
  {
    case 0:
      uint64_t v4 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration ownerConfiguration];
      goto LABEL_5;
    case 1:
      uint64_t v4 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration acceptInvitationConfiguration];
LABEL_5:
      uint64_t v6 = v4;
      uint64_t v7 = [v4 webService];
      goto LABEL_9;
    case 2:
      uint64_t v8 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration remoteDeviceConfiguration];
      goto LABEL_8;
    case 3:
      uint64_t v8 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration remoteDeviceInvitation];
LABEL_8:
      uint64_t v6 = v8;
      uint64_t v7 = [v8 remoteDeviceWebService];
LABEL_9:
      uint64_t v5 = (void *)v7;

      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (void)acquireProvisioningAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PKSubcredentialProvisioningConfiguration *)self->_configuration configurationType];
  if (!v5)
  {
    char v6 = 1;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    char v6 = 0;
LABEL_5:
    uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v8 = [v7 processName];
    int v9 = [v7 processIdentifier];
    uint64_t v10 = [NSString stringWithFormat:@"Credential Provisioning (%@:%ld)", v8, v9];
    __int16 v11 = self->_operationSerialQueue;
    uint64_t v12 = dispatch_group_create();
    objc_initWeak(location, self);
    dispatch_group_enter(v12);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke;
    v31[3] = &unk_1E56ECCB8;
    __int16 v13 = v11;
    uint64_t v32 = v13;
    objc_copyWeak(&v34, location);
    uint64_t v14 = v12;
    long long v33 = v14;
    +[PKAssertion acquireAssertionOfType:4 withReason:v10 completion:v31];

    objc_destroyWeak(&v34);
    if (v6)
    {
      dispatch_group_enter(v14);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_59;
      v27[3] = &unk_1E56ECCB8;
      uint64_t v15 = v13;
      __int16 v28 = v15;
      objc_copyWeak(&v30, location);
      uint64_t v16 = v14;
      id v29 = v16;
      +[PKAssertion acquireAssertionOfType:0 withReason:v10 completion:v27];

      objc_destroyWeak(&v30);
      dispatch_group_enter(v16);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_62;
      v23[3] = &unk_1E56ECCB8;
      id v24 = v15;
      objc_copyWeak(&v26, location);
      v25 = v16;
      +[PKAssertion acquireAssertionOfType:3 withReason:v10 completion:v23];

      objc_destroyWeak(&v26);
    }
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_65;
      block[3] = &unk_1E56ECCE0;
      objc_copyWeak(&v19, location);
      id v18 = v4;
      char v20 = 1;
      char v21 = v6;
      char v22 = v6;
      dispatch_group_notify(v14, v13, block);

      objc_destroyWeak(&v19);
    }
    objc_destroyWeak(location);

    goto LABEL_12;
  }
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_12:
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 6, v5);
      [*(id *)(a1 + 32) setInvalidateWhenBackgrounded:0];
      char v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3;
      v9[3] = &unk_1E56DD818;
      objc_copyWeak(&v10, v2);
      [v6 setInvalidationHandler:v9];
      objc_destroyWeak(&v10);
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire user notification suppression assertion", (uint8_t *)&v8, 2u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_60;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_60(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 8, v5);
      [*(id *)(a1 + 32) setInvalidateWhenBackgrounded:0];
      char v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_61;
      v9[3] = &unk_1E56DD818;
      objc_copyWeak(&v10, v2);
      [v6 setInvalidationHandler:v9];
      objc_destroyWeak(&v10);
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire contactless interface suppression assertion", (uint8_t *)&v8, 2u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_61(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_63;
  block[3] = &unk_1E56DD038;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_2_63(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_storeStrong(WeakRetained + 7, v5);
      [*(id *)(a1 + 32) setInvalidateWhenBackgrounded:0];
      char v6 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_64;
      v9[3] = &unk_1E56DD818;
      objc_copyWeak(&v10, v2);
      [v6 setInvalidationHandler:v9];
      objc_destroyWeak(&v10);
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to acquire field detect suppression assertion", (uint8_t *)&v8, 2u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_3_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __85__PKSubcredentialProvisioningController_acquireProvisioningAssertionsWithCompletion___block_invoke_65(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (id)WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48) && !*(void *)(WeakRetained + 48)
      || *(unsigned char *)(a1 + 49) && !*(void *)(WeakRetained + 64))
    {
      uint64_t WeakRetained = 0;
    }
    else if (*(unsigned char *)(a1 + 50))
    {
      uint64_t WeakRetained = *(void *)(WeakRetained + 56) != 0;
    }
    else
    {
      uint64_t WeakRetained = 1;
    }
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), WeakRetained);
}

- (void)releaseProvisioningAssertions
{
  [(PKAssertion *)self->_userNotificationAssertion invalidate];
  userNotificationAssertion = self->_userNotificationAssertion;
  self->_userNotificationAssertion = 0;

  [(PKAssertion *)self->_fieldDetectSuppressionAssertion invalidate];
  fieldDetectSuppressionAssertion = self->_fieldDetectSuppressionAssertion;
  self->_fieldDetectSuppressionAssertion = 0;

  [(PKAssertion *)self->_contactlessInterfaceSuppressionAssertion invalidate];
  contactlessInterfaceSuppressionAssertion = self->_contactlessInterfaceSuppressionAssertion;
  self->_contactlessInterfaceSuppressionAssertion = 0;
}

- (void)operation:(id)a3 advanceToState:(int64_t)a4
{
}

- (void)operation:(id)a3 failWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Failing with error: %@", (uint8_t *)&v9, 0xCu);
  }

  [(PKSubcredentialProvisioningController *)self transitionToState:0 withOperation:v6 error:v7];
}

- (void)operation:(id)a3 addedCredential:(id)a4
{
  id v6 = (PKAppletSubcredential *)a4;
  id v7 = (PKSubcredentialProvisioningOperation *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  currentOperation = self->_currentOperation;

  if (currentOperation != v7)
  {
    int v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Received unexpected credential?", buf, 2u);
    }
  }
  addedCredential = self->_addedCredential;
  if (addedCredential)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Adding credential with credential already added?", v12, 2u);
    }

    addedCredential = self->_addedCredential;
  }
  self->_addedCredential = v6;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)operationWasCanceled:(id)a3
{
}

- (void)operation:(id)a3 addedPass:(id)a4
{
  id v5 = (PKPaymentPass *)a4;
  os_unfair_lock_lock(&self->_stateLock);
  provisionedPass = self->_provisionedPass;
  self->_provisionedPass = v5;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  id v7 = self->_currentOperation;
  int64_t currentState = self->_currentState;
  BOOL v9 = [(PKSubcredentialProvisioningTransitionTable *)self->_transitionTable isStateFinal:currentState];
  transitionTable = self->_transitionTable;
  os_unfair_lock_unlock(&self->_stateLock);
  if (transitionTable)
  {
    if (!v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        operationSerialQueue = self->_operationSerialQueue;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __64__PKSubcredentialProvisioningController_session_didChangeState___block_invoke;
        v12[3] = &unk_1E56ECD08;
        __int16 v13 = v7;
        id v14 = v6;
        unint64_t v15 = a4;
        int64_t v16 = currentState;
        dispatch_async(operationSerialQueue, v12);
      }
    }
  }
}

void __64__PKSubcredentialProvisioningController_session_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 session:v3 didChangeState:v4];
  }
  else
  {
    id v5 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 56));
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      __int16 v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring session:didChangeState: on state %@ - operation completed", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  id v5 = self->_currentOperation;
  unint64_t currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    operationSerialQueue = self->_operationSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidBeginPairing___block_invoke;
    block[3] = &unk_1E56DF798;
    uint64_t v11 = v5;
    id v12 = v4;
    unint64_t v13 = currentState;
    dispatch_async(operationSerialQueue, block);

    __int16 v8 = v11;
  }
  else
  {
    __int16 v8 = PKStringForSubcredentialProvisioningState(currentState);
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v15 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSessionDidBeginPairing: on state %@", buf, 0xCu);
    }
  }
}

void __90__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidBeginPairing___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 appletSubcredentialPairingSessionDidBeginPairing:v3];
  }
  else
  {
    id v4 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 48));
    id v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      int v7 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSessionDidBeginPairing: on state %@ - operation completed", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v11 = self->_currentOperation;
  unint64_t currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    operationSerialQueue = self->_operationSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithSubcredential_registrationData___block_invoke;
    block[3] = &unk_1E56E52C8;
    id v17 = v11;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    unint64_t v21 = currentState;
    dispatch_async(operationSerialQueue, block);

    id v14 = v17;
  }
  else
  {
    id v14 = PKStringForSubcredentialProvisioningState(currentState);
    unint64_t v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Missing didEndPairingWithSubcredential: on state %@", buf, 0xCu);
    }
  }
}

void __123__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithSubcredential_registrationData___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v2 appletSubcredentialPairingSession:v3 didEndPairingWithSubcredential:v4 registrationData:v5];
  }
  else
  {
    int v6 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 64));
    int v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring didEndPairingWithSubcredential: on state %@ - operation completed", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int v8 = self->_currentOperation;
  unint64_t currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithError___block_invoke;
    v13[3] = &unk_1E56E9BF8;
    id v14 = v8;
    id v15 = v6;
    id v16 = v7;
    unint64_t v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = PKStringForSubcredentialProvisioningState(currentState);
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Missing didEndPairingWithError: on state %@", buf, 0xCu);
    }
  }
}

void __98__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didEndPairingWithError___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 appletSubcredentialPairingSession:v3 didEndPairingWithError:v4];
  }
  else
  {
    uint64_t v5 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 56));
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSession:didEndPairingWithError: on state %@ - operation completed", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSessionDidFirstTransaction:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int v8 = self->_currentOperation;
  unint64_t currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __104__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidFirstTransaction_withError___block_invoke;
    v13[3] = &unk_1E56E9BF8;
    id v14 = v8;
    id v15 = v6;
    id v16 = v7;
    unint64_t v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = PKStringForSubcredentialProvisioningState(currentState);
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSessionDidFirstTransaction:withError: on state %@", buf, 0xCu);
    }
  }
}

void __104__PKSubcredentialProvisioningController_appletSubcredentialPairingSessionDidFirstTransaction_withError___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 appletSubcredentialPairingSessionDidFirstTransaction:v3 withError:v4];
  }
  else
  {
    uint64_t v5 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 56));
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSessionDidFirstTransaction:withError: on state %@ - operation completed", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_stateLock);
  int v8 = self->_currentOperation;
  unint64_t currentState = self->_currentState;
  os_unfair_lock_unlock(&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    operationSerialQueue = self->_operationSerialQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke;
    v13[3] = &unk_1E56E9BF8;
    id v14 = v8;
    id v15 = v6;
    id v16 = v7;
    unint64_t v17 = currentState;
    dispatch_async(operationSerialQueue, v13);

    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = PKStringForSubcredentialProvisioningState(currentState);
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Missing appletSubcredentialPairingSession:didFinishPreWarmWithResult: on state %@", buf, 0xCu);
    }
  }
}

void __102__PKSubcredentialProvisioningController_appletSubcredentialPairingSession_didFinishPreWarmWithResult___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProgress])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v2 appletSubcredentialPairingSession:v3 didFinishPreWarmWithResult:v4];
  }
  else
  {
    uint64_t v5 = PKStringForSubcredentialProvisioningState(*(void *)(a1 + 56));
    id v6 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring appletSubcredentialPairingSession:didFinishPreWarmWithResult: on state %@ - operation completed", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishProbingTerminalWithError:(id)a4 brandCode:(unint64_t)a5
{
  uint64_t v5 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected delgate invoked appletSubcredentialPairingSession:didFinishPreWarmWithResult:", v6, 2u);
  }
}

- (PKSubcredentialProvisioningControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKSubcredentialProvisioningControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong((id *)&self->_addedCredential, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_fieldDetectSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_userNotificationAssertion, 0);
  objc_storeStrong((id *)&self->_operationSerialQueue, 0);
  objc_storeStrong((id *)&self->_transitionTable, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end