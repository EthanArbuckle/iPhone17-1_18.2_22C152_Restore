@interface NPKExpressModeSettingsCoordinator
- (BOOL)_isExpressMode:(unint64_t)a3 supportedForPassWithUniqueID:(id)a4;
- (BOOL)_isNFCExpressModeSupportedForPass:(id)a3;
- (BOOL)expressStateUpdatePending;
- (BOOL)inSessionExpressEnabledForPass:(id)a3;
- (BOOL)isExpressMode:(unint64_t)a3 supportedForPass:(id)a4;
- (BOOL)needUpgradeForPass:(id)a3;
- (LAContext)currentContext;
- (NPKExpressModeSettingsCoordinator)initWithExpressPassController:(id)a3 workQueue:(id)a4 callbackQueue:(id)a5;
- (NPKExpressModeSettingsCoordinatorDelegate)delegate;
- (NPKExpressState)currentState;
- (NPKPassesDataSource)passDataSource;
- (NSMutableDictionary)previousPassStates;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (PKExpressPassController)expressPassController;
- (PKPass)currentPass;
- (id)_expressStateForPassWithUniqueID:(id)a3;
- (id)_expressStateForPassWithUniqueID:(id)a3 fromControllerState:(id)a4;
- (id)_newExpressStateForMode:(unint64_t)a3 pass:(id)a4 enable:(BOOL)a5;
- (id)completionHandler;
- (id)eligibleExpressUpgradeRequestsForPass:(id)a3;
- (id)expressAppletIdentifiersForPass:(id)a3;
- (id)expressStateForPass:(id)a3;
- (int)notifyToken;
- (void)_checkForConflictsInEnablingExpressForPass:(id)a3 completion:(id)a4;
- (void)_enableExpressForPass:(id)a3 mode:(unint64_t)a4 withCredential:(id)a5;
- (void)_handleExpressStateChange;
- (void)_handleFailedEnableExpress;
- (void)_handleFailedPassUpgrade;
- (void)_handleFailedUserAuthentication;
- (void)_handleSuccessForPass:(id)a3;
- (void)_handleSuccessfulUserAuthenticationWithCredential:(id)a3 forPass:(id)a4 withExpressMode:(unint64_t)a5;
- (void)_handleUserCancelled;
- (void)_invokeCompletionHandlerWithSuccess:(BOOL)a3;
- (void)_requestUserAuthenticationForPass:(id)a3 withExpressMode:(unint64_t)a4;
- (void)_upgradeExpressModeForPass:(id)a3 withCredential:(id)a4;
- (void)disableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
- (void)enableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5;
- (void)setCallbackQueue:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentPass:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressPassController:(id)a3;
- (void)setExpressStateUpdatePending:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPassDataSource:(id)a3;
- (void)setPreviousPassStates:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation NPKExpressModeSettingsCoordinator

- (NPKExpressModeSettingsCoordinator)initWithExpressPassController:(id)a3 workQueue:(id)a4 callbackQueue:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)NPKExpressModeSettingsCoordinator;
  v11 = [(NPKExpressModeSettingsCoordinator *)&v34 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expressPassController, a3);
    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_storeStrong((id *)&v12->_callbackQueue, a5);
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    previousPassStates = v12->_previousPassStates;
    v12->_previousPassStates = (NSMutableDictionary *)v13;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v15 = [v9 enabledExpressPasses];
    v16 = [v15 allValues];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v21 = [v20 passUniqueIdentifier];
          v22 = [[NPKExpressState alloc] initWithExpressPassConfiguration:v20];
          [(NSMutableDictionary *)v12->_previousPassStates setObject:v22 forKey:v21];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v17);
    }

    objc_initWeak(&location, v12);
    v23 = (const char *)[(id)*MEMORY[0x263F5C530] UTF8String];
    workQueue = v12->_workQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __91__NPKExpressModeSettingsCoordinator_initWithExpressPassController_workQueue_callbackQueue___block_invoke;
    handler[3] = &unk_2644D2870;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch(v23, &v12->_notifyToken, workQueue, handler);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __91__NPKExpressModeSettingsCoordinator_initWithExpressPassController_workQueue_callbackQueue___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = 0;
    v2 = WeakRetained;
    [WeakRetained _handleExpressStateChange];
    WeakRetained = v2;
  }
}

- (BOOL)isExpressMode:(unint64_t)a3 supportedForPass:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(NPKExpressModeSettingsCoordinator *)self _isNFCExpressModeSupportedForPass:v6];
  v8 = [v6 paymentPass];

  char v9 = [v8 npkSupportsBluetooth];
  if (a3 == 2) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = v7;
  }
  if (a3 == 3) {
    return v7 & v9;
  }
  else {
    return v10;
  }
}

- (BOOL)inSessionExpressEnabledForPass:(id)a3
{
  id v4 = a3;
  expressPassController = self->_expressPassController;
  id v6 = [v4 secureElementPass];
  BOOL v7 = [(PKExpressPassController *)expressPassController existingExpressPassConfigurationForPass:v6];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8 = [v7 passInformation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__NPKExpressModeSettingsCoordinator_inSessionExpressEnabledForPass___block_invoke;
  v10[3] = &unk_2644D7478;
  v10[4] = &v11;
  [v8 enumerateCredentialsWithHandler:v10];

  LOBYTE(v8) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v8;
}

void __68__NPKExpressModeSettingsCoordinator_inSessionExpressEnabledForPass___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v10) supportsInSessionExpress])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          *a4 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)needUpgradeForPass:(id)a3
{
  id v4 = [a3 paymentPass];
  if (v4) {
    char v5 = [(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)expressStateForPass:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__22;
  uint64_t v18 = __Block_byref_object_dispose__22;
  id v19 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__NPKExpressModeSettingsCoordinator_expressStateForPass___block_invoke;
  v9[3] = &unk_2644D6690;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  long long v11 = &v14;
  id v6 = v4;
  dispatch_sync(workQueue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __57__NPKExpressModeSettingsCoordinator_expressStateForPass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [*(id *)(a1 + 32) uniqueID];
  uint64_t v3 = [WeakRetained _expressStateForPassWithUniqueID:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)eligibleExpressUpgradeRequestsForPass:(id)a3
{
  uint64_t v4 = [a3 paymentPass];
  if (v4)
  {
    char v5 = [(PKExpressPassController *)self->_expressPassController eligibleExpressUpgradeRequestsForPass:v4];
  }
  else
  {
    char v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)expressAppletIdentifiersForPass:(id)a3
{
  expressPassController = self->_expressPassController;
  uint64_t v4 = [a3 secureElementPass];
  char v5 = [(PKExpressPassController *)expressPassController existingExpressPassConfigurationForPass:v4];

  id v6 = [v5 passInformation];

  if (v6)
  {
    id v7 = [v5 passInformation];
    id v6 = objc_msgSend(v7, "npk_expressAppletIdentifiers");
  }
  return v6;
}

- (void)enableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Received request to enable express for %@", buf, 0xCu);
    }
  }
  uint64_t v14 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke;
  block[3] = &unk_2644D74F0;
  objc_copyWeak(v22, (id *)buf);
  v20 = v14;
  id v21 = v9;
  v22[1] = (id)a4;
  id v19 = v8;
  v15 = v14;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(v15, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = MEMORY[0x223C37380](*(void *)(a1 + 48));
  uint64_t v4 = (void *)*((void *)WeakRetained + 8);
  *((void *)WeakRetained + 8) = v3;

  objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
  uint64_t v5 = [WeakRetained _newExpressStateForMode:*(void *)(a1 + 64) pass:*(void *)(a1 + 32) enable:1];
  id v6 = (void *)*((void *)WeakRetained + 6);
  *((void *)WeakRetained + 6) = v5;

  *((unsigned char *)WeakRetained + 8) = 1;
  id v7 = [*(id *)(a1 + 32) paymentPass];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_2;
  long long v13 = &unk_2644D74C8;
  id v14 = *(id *)(a1 + 40);
  id v15 = WeakRetained;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 64);
  id v16 = v8;
  uint64_t v17 = v9;
  [WeakRetained _checkForConflictsInEnablingExpressForPass:v7 completion:&v10];

  objc_msgSend(WeakRetained, "_handleExpressStateChange", v10, v11, v12, v13);
}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_2(void *a1, char a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_3;
  v7[3] = &unk_2644D74A0;
  char v10 = a2;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v7[4] = a1[5];
  id v5 = v4;
  uint64_t v6 = a1[7];
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v3, v7);
}

void __81__NPKExpressModeSettingsCoordinator_enableExpressForPass_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 40) paymentPass];
    [v1 _requestUserAuthenticationForPass:v4 withExpressMode:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 _handleUserCancelled];
  }
}

- (void)disableExpressForPass:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  char v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Received request to disable express for %@", buf, 0xCu);
    }
  }
  id v14 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke;
  block[3] = &unk_2644D74F0;
  objc_copyWeak(v22, (id *)buf);
  v20 = v14;
  id v21 = v9;
  v22[1] = (id)a4;
  id v19 = v8;
  id v15 = v14;
  id v16 = v8;
  id v17 = v9;
  dispatch_async(v15, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

void __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = MEMORY[0x223C37380](*(void *)(a1 + 48));
  id v4 = (void *)*((void *)WeakRetained + 8);
  *((void *)WeakRetained + 8) = v3;

  objc_storeStrong((id *)WeakRetained + 5, *(id *)(a1 + 32));
  id v5 = (void *)[WeakRetained _newExpressStateForMode:*(void *)(a1 + 64) pass:*(void *)(a1 + 32) enable:0];
  objc_storeStrong((id *)WeakRetained + 6, v5);
  *((unsigned char *)WeakRetained + 8) = 1;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_2;
  v21[3] = &unk_2644D2E08;
  id v22 = *(id *)(a1 + 40);
  id v23 = WeakRetained;
  uint64_t v6 = (void *)MEMORY[0x223C37380](v21);
  id v7 = (void *)*((void *)WeakRetained + 2);
  id v8 = [*(id *)(a1 + 32) paymentPass];
  id v9 = [v7 expressModeSupportedForPass:v8];

  if (v9
    && (uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F5BE60]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v9, (unint64_t)objc_msgSend(v5, "nfcExpressState") < 2, (unint64_t)objc_msgSend(v5, "uwbExpressState") < 2)) != 0)
  {
    id v11 = (id)v10;
    id v12 = (void *)*((void *)WeakRetained + 2);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_4;
    v19[3] = &unk_2644D6A28;
    id v20 = v6;
    id v13 = v6;
    [v12 setExpressModeWithPassConfiguration:v11 credential:0 completion:v19];
  }
  else
  {
    id v14 = (void *)*((void *)WeakRetained + 2);
    id v15 = [*(id *)(a1 + 32) uniqueID];
    v24[0] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_5;
    v17[3] = &unk_2644D6A28;
    uint64_t v18 = v6;
    id v11 = v6;
    [v14 disableExpressModeForPassesWithUniqueIdentifiers:v16 withCompletion:v17];

    id v13 = v18;
  }
}

void __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_3;
  block[3] = &unk_2644D2910;
  v1 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleExpressStateChange];
  v2 = *(void **)(a1 + 32);
  return [v2 _invokeCompletionHandlerWithSuccess:1];
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__NPKExpressModeSettingsCoordinator_disableExpressForPass_mode_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isNFCExpressModeSupportedForPass:(id)a3
{
  id v4 = [a3 paymentPass];
  if (v4)
  {
    id v5 = [(PKExpressPassController *)self->_expressPassController expressModeSupportedForPass:v4];
    if (v5) {
      char v6 = 1;
    }
    else {
      char v6 = [(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:v4];
    }
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    char v6 = 0;
    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Cannot check _isNFCExpressModeSupportedForPass for nil pass", v11, 2u);
      }

      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_isExpressMode:(unint64_t)a3 supportedForPassWithUniqueID:(id)a4
{
  id v6 = a4;
  id v7 = [(NPKExpressModeSettingsCoordinator *)self passDataSource];
  BOOL v8 = [v7 passForUniqueID:v6];

  LOBYTE(a3) = [(NPKExpressModeSettingsCoordinator *)self isExpressMode:a3 supportedForPass:v8];
  return a3;
}

- (id)_newExpressStateForMode:(unint64_t)a3 pass:(id)a4 enable:(BOOL)a5
{
  BOOL v5 = a5;
  workQueue = self->_workQueue;
  id v9 = a4;
  dispatch_assert_queue_V2(workQueue);
  BOOL v10 = [(NPKExpressModeSettingsCoordinator *)self needUpgradeForPass:v9];
  uint64_t v11 = 2;
  if (v5) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 2;
  }
  id v13 = [v9 secureElementPass];
  unsigned __int8 v14 = [v13 isCarKeyPass];

  if (((a3 == 2) & v14) != 0) {
    unint64_t v15 = 3;
  }
  else {
    unint64_t v15 = a3;
  }
  expressPassController = self->_expressPassController;
  id v17 = [v9 secureElementPass];

  uint64_t v18 = [(PKExpressPassController *)expressPassController existingExpressPassConfigurationForPass:v17];

  uint64_t v19 = 2;
  if (v18)
  {
    uint64_t v19 = 2;
    if ([v18 isNFCExpressEnabled]) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 2;
    }
    if ([v18 isUWBExpressEnabled]) {
      uint64_t v19 = 0;
    }
  }
  switch(v15)
  {
    case 3uLL:
      id v20 = [NPKExpressState alloc];
      uint64_t v21 = v12;
LABEL_19:
      uint64_t v22 = v12;
      goto LABEL_20;
    case 2uLL:
      id v20 = [NPKExpressState alloc];
      uint64_t v21 = v11;
      goto LABEL_19;
    case 1uLL:
      id v20 = [NPKExpressState alloc];
      uint64_t v21 = v12;
      uint64_t v22 = v19;
LABEL_20:
      uint64_t v11 = [(NPKExpressState *)v20 initWithNFCState:v21 uwbState:v22];
      break;
  }

  return (id)v11;
}

- (void)_checkForConflictsInEnablingExpressForPass:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Checking for conflicts when enabling express for %@", buf, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v12 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:v6];
  if (!v12)
  {
    id v13 = [(PKExpressPassController *)self->_expressPassController expressModeSupportedForPass:v6];
    if (v13) {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F5BE60]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v13, -[NPKExpressState nfcExpressState](self->_currentState, "nfcExpressState") < 2, -[NPKExpressState uwbExpressState](self->_currentState, "uwbExpressState") < 2);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  unsigned __int8 v14 = self->_callbackQueue;
  objc_initWeak((id *)buf, self);
  expressPassController = self->_expressPassController;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke;
  v19[3] = &unk_2644D7518;
  id v16 = v14;
  id v20 = v16;
  objc_copyWeak(&v23, (id *)buf);
  id v17 = v6;
  id v21 = v17;
  id v18 = v7;
  id v22 = v18;
  [(PKExpressPassController *)expressPassController conflictingExpressPassesWithPassConfiguration:v12 completion:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_2;
  v6[3] = &unk_2644D34C8;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v3 = [a1[4] count];
  if ([a1[5] hasImmediateAutomaticSelectionCriterion]) {
    uint64_t v4 = NPKIsGymKitEnabled();
  }
  else {
    uint64_t v4 = 0;
  }
  if (v3) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    id v9 = (void (**)(id, uint64_t))a1[6];
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else
  {
    id v6 = [WeakRetained delegate];
    id v8 = a1[4];
    id v7 = a1[5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_3;
    v10[3] = &unk_2644D4150;
    id v11 = a1[6];
    [v6 expressModeSettingsCoordinator:WeakRetained didEncounterConflictWhenEnablingExpressForPass:v7 conflictingExpressPasses:v8 conflictsWithGymKit:v4 completion:v10];
  }
}

uint64_t __91__NPKExpressModeSettingsCoordinator__checkForConflictsInEnablingExpressForPass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_requestUserAuthenticationForPass:(id)a3 withExpressMode:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Requesting user authentication for %@", buf, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v11 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  uint64_t v12 = [(NPKExpressModeSettingsCoordinator *)self delegate];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke;
  v15[3] = &unk_2644D7568;
  id v13 = v11;
  id v16 = v13;
  objc_copyWeak(v18, (id *)buf);
  id v14 = v6;
  id v17 = v14;
  v18[1] = (id)a4;
  [v12 expressModeSettingsCoordinator:self requestsAuthorizationToEnableExpressForPass:v14 completion:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  BOOL v8 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke_2;
  block[3] = &unk_2644D7540;
  objc_copyWeak(v15, (id *)(a1 + 48));
  char v16 = a2;
  id v13 = v7;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(void **)(a1 + 56);
  id v14 = v9;
  v15[1] = v10;
  char v17 = a3;
  id v11 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(v15);
}

void __87__NPKExpressModeSettingsCoordinator__requestUserAuthenticationForPass_withExpressMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (*(unsigned char *)(a1 + 64))
  {
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    uint64_t v3 = [*(id *)(a1 + 32) externalizedContext];
    uint64_t v4 = [*(id *)(a1 + 40) paymentPass];
    [v5 _handleSuccessfulUserAuthenticationWithCredential:v3 forPass:v4 withExpressMode:*(void *)(a1 + 56)];
  }
  else if (*(unsigned char *)(a1 + 65))
  {
    [WeakRetained _handleUserCancelled];
  }
  else
  {
    [WeakRetained _handleFailedUserAuthentication];
  }
}

- (void)_handleSuccessfulUserAuthenticationWithCredential:(id)a3 forPass:(id)a4 withExpressMode:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v9 uniqueID];
      int v14 = 138412290;
      unint64_t v15 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Handling successful user authentication for %@", (uint8_t *)&v14, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v9)
  {
    if ([(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:v9])[(NPKExpressModeSettingsCoordinator *)self _upgradeExpressModeForPass:v9 withCredential:v8]; {
    else
    }
      [(NPKExpressModeSettingsCoordinator *)self _enableExpressForPass:v9 mode:a5 withCredential:v8];
  }
}

- (void)_upgradeExpressModeForPass:(id)a3 withCredential:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v6 uniqueID];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Upgrading express for %@", buf, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v12 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  expressPassController = self->_expressPassController;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  id v15[2] = __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke;
  v15[3] = &unk_2644D7590;
  int v14 = v12;
  uint64_t v16 = v14;
  objc_copyWeak(&v17, (id *)buf);
  [(PKExpressPassController *)expressPassController upgradeExpressModeForPass:v6 withCredential:v7 resultHandler:v15];
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

void __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke_2;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __79__NPKExpressModeSettingsCoordinator__upgradeExpressModeForPass_withCredential___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40)) {
    objc_msgSend(WeakRetained, "_handleSuccessForPass:");
  }
  else {
    [WeakRetained _handleFailedPassUpgrade];
  }
}

- (void)_enableExpressForPass:(id)a3 mode:(unint64_t)a4 withCredential:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 uniqueID];
      *(_DWORD *)buf = 138412290;
      long long v30 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Enabling express for %@", buf, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  expressPassController = self->_expressPassController;
  unint64_t v15 = [v8 paymentPass];
  uint64_t v16 = [(PKExpressPassController *)expressPassController expressModeSupportedForPass:v15];

  if (v16)
  {
    id v17 = [(NPKExpressModeSettingsCoordinator *)self _newExpressStateForMode:a4 pass:v8 enable:1];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x263F5BE60]), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v16, (unint64_t)objc_msgSend(v17, "nfcExpressState") < 2, (unint64_t)objc_msgSend(v17, "uwbExpressState") < 2);
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v19 = self->_workQueue;
  objc_initWeak((id *)buf, self);
  uint64_t v20 = self->_expressPassController;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  void v24[2] = __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke;
  v24[3] = &unk_2644D75B8;
  uint64_t v21 = v19;
  uint64_t v25 = v21;
  objc_copyWeak(&v28, (id *)buf);
  id v22 = v18;
  id v26 = v22;
  id v23 = v8;
  id v27 = v23;
  [(PKExpressPassController *)v20 setExpressModeWithPassConfiguration:v22 credential:v9 completion:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke_2;
  v6[3] = &unk_2644D3450;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __79__NPKExpressModeSettingsCoordinator__enableExpressForPass_mode_withCredential___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)]) {
      [v3 _handleSuccessForPass:*(void *)(a1 + 48)];
    }
    else {
      [v3 _handleFailedEnableExpress];
    }
    id WeakRetained = v3;
  }
}

- (void)_handleSuccessForPass:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueID];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Express mode settings coordinator: Operation completed successfully for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(NPKExpressModeSettingsCoordinator *)self _invokeCompletionHandlerWithSuccess:1];
}

- (void)_handleFailedUserAuthentication
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  [(NPKExpressModeSettingsCoordinator *)self _invokeCompletionHandlerWithSuccess:0];
}

- (void)_handleFailedPassUpgrade
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  [(NPKExpressModeSettingsCoordinator *)self _invokeCompletionHandlerWithSuccess:0];
}

- (void)_handleFailedEnableExpress
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  [(NPKExpressModeSettingsCoordinator *)self _invokeCompletionHandlerWithSuccess:0];
}

- (void)_handleUserCancelled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_expressStateUpdatePending = 0;
  [(NPKExpressModeSettingsCoordinator *)self _invokeCompletionHandlerWithSuccess:1];
}

- (void)_invokeCompletionHandlerWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v21 = v3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Express mode operation completed with success: %d", buf, 8u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v8 = (void *)MEMORY[0x223C37380](self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  currentPass = self->_currentPass;
  self->_currentPass = 0;

  currentState = self->_currentState;
  self->_currentState = 0;

  callbackQueue = self->_callbackQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __73__NPKExpressModeSettingsCoordinator__invokeCompletionHandlerWithSuccess___block_invoke;
  id v17 = &unk_2644D5078;
  id v13 = v8;
  id v18 = v13;
  BOOL v19 = v3;
  dispatch_async(callbackQueue, &v14);
  if (!self->_expressStateUpdatePending) {
    [(NPKExpressModeSettingsCoordinator *)self _handleExpressStateChange];
  }
}

uint64_t __73__NPKExpressModeSettingsCoordinator__invokeCompletionHandlerWithSuccess___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_handleExpressStateChange
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = self->_workQueue;
  id v4 = self->_callbackQueue;
  id v26 = self;
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke;
  v35[3] = &unk_2644D75E0;
  uint64_t v25 = v3;
  uint64_t v36 = v25;
  objc_copyWeak(&v38, &location);
  v24 = v4;
  v37 = v24;
  id v5 = (void (**)(void, void, void))MEMORY[0x223C37380](v35);
  BOOL v6 = [(PKExpressPassController *)self->_expressPassController enabledExpressPasses];
  id v7 = [(NSMutableDictionary *)self->_previousPassStates allKeys];
  uint64_t v8 = [v7 count];

  int v9 = (void *)MEMORY[0x263EFF9C0];
  if (v8)
  {
    id v10 = [(NSMutableDictionary *)self->_previousPassStates allKeys];
    id v11 = [v9 setWithArray:v10];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = [v6 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        [v11 removeObject:v16];
        id v17 = [(NPKExpressModeSettingsCoordinator *)v26 _expressStateForPassWithUniqueID:v16 fromControllerState:v6];
        ((void (**)(void, uint64_t, void *))v5)[2](v5, v16, v17);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v13);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        id v23 = [(NPKExpressModeSettingsCoordinator *)v26 _expressStateForPassWithUniqueID:v22 fromControllerState:v6];
        ((void (**)(void, uint64_t, void *))v5)[2](v5, v22, v23);
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v19);
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v7 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained[11] setObject:v6 forKey:v5];
  int v9 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke_2;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v15, v7);
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
}

void __62__NPKExpressModeSettingsCoordinator__handleExpressStateChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained delegate];
  [v2 expressModeSettingsCoordinator:WeakRetained didUpdateState:*(void *)(a1 + 32) forPassWithUniqueID:*(void *)(a1 + 40)];
}

- (id)_expressStateForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__22;
  uint64_t v19 = __Block_byref_object_dispose__22;
  id v20 = 0;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NPKExpressModeSettingsCoordinator__expressStateForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D6730;
  objc_copyWeak(&v13, &location);
  id v11 = self;
  id v12 = &v15;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v16[5];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __70__NPKExpressModeSettingsCoordinator__expressStateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [*(id *)(*(void *)(a1 + 40) + 16) enabledExpressPasses];
  uint64_t v4 = [WeakRetained _expressStateForPassWithUniqueID:v2 fromControllerState:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_expressStateForPassWithUniqueID:(id)a3 fromControllerState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_currentState
    && ([(PKPass *)self->_currentPass uniqueID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = PKEqualObjects(),
        v8,
        v9))
  {
    id v10 = self->_currentState;
  }
  else
  {
    id v11 = [v7 objectForKey:v6];
    id v12 = v11;
    if (v11
      && ([v11 passUniqueIdentifier],
          id v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = PKEqualObjects(),
          v13,
          v14))
    {
      uint64_t v15 = [[NPKExpressState alloc] initWithExpressPassConfiguration:v12];
    }
    else
    {
      uint64_t v15 = [[NPKExpressState alloc] initWithNFCState:2 uwbState:2];
    }
    id v10 = v15;
  }
  return v10;
}

- (PKExpressPassController)expressPassController
{
  return self->_expressPassController;
}

- (void)setExpressPassController:(id)a3
{
}

- (NPKExpressModeSettingsCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKExpressModeSettingsCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPassesDataSource)passDataSource
{
  return self->_passDataSource;
}

- (void)setPassDataSource:(id)a3
{
}

- (PKPass)currentPass
{
  return self->_currentPass;
}

- (void)setCurrentPass:(id)a3
{
}

- (NPKExpressState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (LAContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)expressStateUpdatePending
{
  return self->_expressStateUpdatePending;
}

- (void)setExpressStateUpdatePending:(BOOL)a3
{
  self->_expressStateUpdatePending = a3;
}

- (NSMutableDictionary)previousPassStates
{
  return self->_previousPassStates;
}

- (void)setPreviousPassStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPassStates, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_currentPass, 0);
  objc_storeStrong((id *)&self->_passDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expressPassController, 0);
}

@end