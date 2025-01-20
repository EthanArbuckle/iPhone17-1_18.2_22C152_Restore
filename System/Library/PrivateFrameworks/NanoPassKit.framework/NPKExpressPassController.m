@interface NPKExpressPassController
- (BOOL)_canProceedWithTransactionForPass:(id)a3 selector:(SEL)a4;
- (BOOL)_hasNoTransactionStartOrEndNotificationForTechnologyType:(int64_t)a3;
- (NPKExpressPassController)initWithDelegate:(id)a3;
- (NPKExpressPassController)initWithPaymentService:(id)a3 passLibrary:(id)a4 distributedNotificationCenter:(id)a5 delegate:(id)a6;
- (NPKExpressPassControllerDelegate)delegate;
- (NSDictionary)expressPasses;
- (NSDistributedNotificationCenter)distributedNotificationCenter;
- (NSSet)expressPassConfigurations;
- (NSString)currentApplicationIdentifier;
- (NSString)currentSubCredentialIdentifier;
- (PKExpressPassInformation)currentTransactionExpressPassInformation;
- (PKFieldDetector)fieldDetector;
- (PKPass)currentTransactionPass;
- (PKPassLibrary)passLibrary;
- (id)_expressPassInformationWithTechnologyType:(int64_t)a3;
- (id)_expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3;
- (id)_expressPassesInformationWithTCIs:(id)a3;
- (id)_queue_expressPassForTransactionApplicationIdentifier:(id)a3 transactionApplicationKeyIdentifier:(id)a4;
- (id)_queue_siblingExpressPassesForExpressPass:(id)a3 applicationIdentifier:(id)a4;
- (id)paymentService;
- (unint64_t)_operationSourceFromRawValue:(id)a3;
- (unint64_t)_transactionEventFromLockStatus:(id)a3;
- (void)_handleCarKeyExpressEnteredNotification:(id)a3;
- (void)_handleCarKeyExpressExitedNotification:(id)a3;
- (void)_handleCarKeyRKEActionCompletedNotification:(id)a3;
- (void)_handleCarKeyRangingEndedNotification:(id)a3;
- (void)_handleCarKeyRangingStartedNotification:(id)a3;
- (void)_handleCarKeySessionEndedNotification:(id)a3;
- (void)_handleCarKeySessionEndedWithErrorNotification:(id)a3;
- (void)_handleCarKeyVehicleConnectedNotification:(id)a3;
- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3;
- (void)_handleCarKeyVehicleLockedNotification:(id)a3;
- (void)_handleCarKeyVehicleUnlockedNotification:(id)a3;
- (void)_handleEnterNearFieldNotification:(id)a3;
- (void)_handleExitNearFieldNotification:(id)a3;
- (void)_handleExpressTransactionEndNotification:(id)a3;
- (void)_handleExpressTransactionFailedNotification:(id)a3;
- (void)_handleExpressTransactionStartNotification:(id)a3;
- (void)_handleExpressTransactionTimeOutNotification:(id)a3;
- (void)_handleHomeKeyLockConnectedNotification:(id)a3;
- (void)_handleHomeKeyLockDisconnectedNotification:(id)a3;
- (void)_handleHomeKeyLockStatusChangedNotification:(id)a3;
- (void)_handlePassesLibraryChangedNotification:(id)a3;
- (void)_handleStandaloneTransactionDoneNotification:(id)a3;
- (void)_internalQueue_startFieldDetector;
- (void)_internalQueue_stopFieldDetector;
- (void)_internalQueue_updateExpressPasses;
- (void)_onqueue_transactionCompletedForRKEAction:(id)a3 function:(id)a4 withApplicationIdentifier:(id)a5 applicationKeyIdentifier:(id)a6;
- (void)_onqueue_transactionCompletedForStandaloneTransactionEvent:(unint64_t)a3 withApplicationIdentifier:(id)a4 applicationKeyIdentifier:(id)a5;
- (void)_onqueue_transactionEndedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4;
- (void)_onqueue_transactionFailedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4;
- (void)_onqueue_transactionStartedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4;
- (void)_parseExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5;
- (void)_parseHomeKeyUWBExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outReaderIdentifier:(id *)a6 outTimestamp:(id *)a7 outTransactionLockStatus:(id *)a8 outLockOperationSource:(id *)a9;
- (void)_parseRKEActionNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outFunctionNumber:(id *)a6 outActionNumber:(id *)a7 outExecutionStatusNumber:(id *)a8 outErrorMessage:(id *)a9;
- (void)_startListeningForCarKeyNotifications;
- (void)_startListeningForExpressNotifications;
- (void)_startListeningForGenericNotifications;
- (void)_startListeningForHomeKeyNotifications;
- (void)_stopListeningForExpressNotifications;
- (void)_transitionToCompletedRKEAction:(id)a3 function:(id)a4 forExpressPass:(id)a5;
- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4;
- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4 withExpressUWBInfo:(id)a5;
- (void)_transitionToStatus:(unint64_t)a3 forExpressPass:(id)a4 paymentApplicationIdentifier:(id)a5;
- (void)dealloc;
- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4;
- (void)reset;
- (void)setCurrentApplicationIdentifier:(id)a3;
- (void)setCurrentSubCredentialIdentifier:(id)a3;
- (void)setCurrentTransactionExpressPassInformation:(id)a3;
- (void)setCurrentTransactionPass:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setExpressPasses:(id)a3;
- (void)setFieldDetector:(id)a3;
- (void)updateExpressPasses;
- (void)updateExpressPassesSynchronous;
@end

@implementation NPKExpressPassController

- (NPKExpressPassController)initWithPaymentService:(id)a3 passLibrary:(id)a4 distributedNotificationCenter:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)NPKExpressPassController;
  v14 = [(NPKExpressPassController *)&v27 init];
  if (v14)
  {
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.expressPassController.internalQueue", v15);
    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v16;

    v14->_transactionStatus = 0;
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeWeak((id *)&v14->_distributedNotificationCenter, v12);
    objc_storeWeak((id *)&v14->_passLibrary, v11);
    objc_storeWeak((id *)&v14->_paymentService, v10);
    v14->_expressPassChangedNotifyToken = -1;
    objc_initWeak(&location, v14);
    v18 = (const char *)[(id)*MEMORY[0x263F5C530] UTF8String];
    v19 = v14->_internalQueue;
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __102__NPKExpressPassController_initWithPaymentService_passLibrary_distributedNotificationCenter_delegate___block_invoke;
    v24 = &unk_2644D2870;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch(v18, &v14->_expressPassChangedNotifyToken, v19, &v21);
    [(NPKExpressPassController *)v14 updateExpressPasses];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __102__NPKExpressPassController_initWithPaymentService_passLibrary_distributedNotificationCenter_delegate___block_invoke(uint64_t a1)
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Got express passes changed notification in express pass controller", v6, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_internalQueue_updateExpressPasses");
}

- (NPKExpressPassController)initWithDelegate:(id)a3
{
  return [(NPKExpressPassController *)self initWithPaymentService:0 passLibrary:0 distributedNotificationCenter:0 delegate:a3];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_expressPassChangedNotifyToken)) {
    notify_cancel(self->_expressPassChangedNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKExpressPassController;
  [(NPKExpressPassController *)&v3 dealloc];
}

- (void)reset
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __33__NPKExpressPassController_reset__block_invoke;
  v2[3] = &unk_2644D2910;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

uint64_t __33__NPKExpressPassController_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToStatus:0 forExpressPass:0 paymentApplicationIdentifier:0];
}

- (id)paymentService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentService);
  if (!WeakRetained) {
    id WeakRetained = objc_alloc_init(MEMORY[0x263F5C0A8]);
  }
  return WeakRetained;
}

- (PKPassLibrary)passLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibrary);
  if (!WeakRetained)
  {
    id WeakRetained = [MEMORY[0x263F5BF80] sharedInstance];
  }
  return (PKPassLibrary *)WeakRetained;
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  p_distributedNotificationCenter = &self->_distributedNotificationCenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_distributedNotificationCenter);
  if (!WeakRetained)
  {
    id WeakRetained = [MEMORY[0x263F087C8] defaultCenter];
    objc_storeWeak((id *)p_distributedNotificationCenter, WeakRetained);
  }
  return (NSDistributedNotificationCenter *)WeakRetained;
}

- (void)_transitionToStatus:(unint64_t)a3 forExpressPass:(id)a4 paymentApplicationIdentifier:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  unint64_t transactionStatus = self->_transactionStatus;
  if (transactionStatus == a3) {
    goto LABEL_33;
  }
  if (v9 && self->_currentTransactionPass)
  {
    id v12 = [v9 uniqueID];
    id v13 = [(PKPass *)self->_currentTransactionPass uniqueID];
    int v14 = [v12 isEqualToString:v13];

    if (!v14)
    {
      uint64_t v21 = pk_Payment_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [(PKPass *)self->_currentTransactionPass uniqueID];
          v24 = [v9 uniqueID];
          int v33 = 138412546;
          v34 = v23;
          __int16 v35 = 2112;
          v36 = v24;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Warning: Accepting new express status because express transit pass changed from %@ to %@.", (uint8_t *)&v33, 0x16u);
        }
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    unint64_t transactionStatus = self->_transactionStatus;
  }
  if (transactionStatus >= a3)
  {
    if (a3) {
      goto LABEL_33;
    }
    v19 = pk_Payment_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20) {
      goto LABEL_19;
    }
    v17 = pk_Payment_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v33) = 0;
    v18 = "Notice: Accepting reset of express status.";
    goto LABEL_14;
  }
  v15 = pk_Payment_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    v17 = pk_Payment_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      goto LABEL_19;
    }
    LOWORD(v33) = 0;
    v18 = "Notice: Accepting new express status because it is greater than the previous express status.";
LABEL_14:
    _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v33, 2u);
    goto LABEL_18;
  }
LABEL_19:
  id v25 = pk_General_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    objc_super v27 = pk_General_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = NSStringFromNPKExpressPassControllerStatus(self->_transactionStatus);
      v29 = NSStringFromNPKExpressPassControllerStatus(a3);
      int v33 = 138412802;
      v34 = self;
      __int16 v35 = 2112;
      v36 = v28;
      __int16 v37 = 2112;
      v38 = v29;
      _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: %@ transition from status %@ to %@", (uint8_t *)&v33, 0x20u);
    }
  }
  self->_unint64_t transactionStatus = a3;
  objc_storeStrong((id *)&self->_currentTransactionPass, a4);
  uint64_t v30 = [(NPKExpressPassController *)self delegate];
  v31 = (void *)v30;
  if (v9 && v30)
  {
    v32 = [(NPKExpressPassController *)self _queue_siblingExpressPassesForExpressPass:v9 applicationIdentifier:v10];
    switch(a3)
    {
      case 4uLL:
        [v31 expressPassController:self didCompleteTransactionForPass:v9];
        break;
      case 3uLL:
        [v31 expressPassController:self didFailTransactionForPass:v9];
        break;
      case 2uLL:
        [v31 expressPassController:self didStartTransactionForPass:v9 paymentApplicationIdentifier:v10 siblingExpressPasses:v32];
        break;
    }
  }
LABEL_33:
}

- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4
{
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(NPKExpressPassController *)self _canProceedWithTransactionForPass:v7 selector:sel__transitionToStandaloneTransactionEvent_forExpressPass_])
  {
    v6 = [(NPKExpressPassController *)self delegate];
    if (v7 && v6) {
      [v6 expressPassController:self didCompleteStandaloneTransactionEvent:a3 forPass:v7];
    }
  }
}

- (void)_transitionToCompletedRKEAction:(id)a3 function:(id)a4 forExpressPass:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(NPKExpressPassController *)self _canProceedWithTransactionForPass:v9 selector:sel__transitionToCompletedRKEAction_function_forExpressPass_])
  {
    id v10 = [(NPKExpressPassController *)self delegate];
    id v11 = v10;
    if (v9 && v10) {
      [v10 expressPassController:self didCompleteRKEAction:v12 function:v8 forPass:v9];
    }
  }
}

- (void)_transitionToStandaloneTransactionEvent:(unint64_t)a3 forExpressPass:(id)a4 withExpressUWBInfo:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(NPKExpressPassController *)self _canProceedWithTransactionForPass:v11 selector:sel__transitionToStandaloneTransactionEvent_forExpressPass_withExpressUWBInfo_])
  {
    id v9 = [(NPKExpressPassController *)self delegate];
    if (v11 && v9)
    {
      id v10 = [(NPKExpressPassController *)self delegate];
      [v10 expressPassController:self didCompleteStandaloneTransactionEvent:a3 forPass:v11 withUWBTransactionInfo:v8];
    }
  }
}

- (BOOL)_canProceedWithTransactionForPass:(id)a3 selector:(SEL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t transactionStatus = self->_transactionStatus;
  if (transactionStatus)
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = NSStringFromSelector(a4);
        id v12 = NSStringFromNPKExpressPassControllerStatus(self->_transactionStatus);
        id v13 = [v6 uniqueID];
        int v15 = 138412802;
        BOOL v16 = v11;
        __int16 v17 = 2112;
        v18 = v12;
        __int16 v19 = 2112;
        BOOL v20 = v13;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: %@: We're in the middle of some other transaction (transactionStatus: %@). Suppressing event for pass %@.", (uint8_t *)&v15, 0x20u);
      }
    }
  }

  return transactionStatus == 0;
}

- (void)_startListeningForExpressNotifications
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __66__NPKExpressPassController__startListeningForExpressNotifications__block_invoke;
  v2[3] = &unk_2644D2910;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

void __66__NPKExpressPassController__startListeningForExpressNotifications__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@ Start listening for express notifications", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _startListeningForGenericNotifications];
  [*(id *)(a1 + 32) _startListeningForCarKeyNotifications];
  [*(id *)(a1 + 32) _startListeningForHomeKeyNotifications];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handlePassesLibraryChangedNotification_ name:*MEMORY[0x263F5C648] object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handlePassesLibraryChangedNotification_ name:*MEMORY[0x263F5C660] object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handlePassesLibraryChangedNotification_ name:*MEMORY[0x263F5C658] object:0];
}

- (void)_startListeningForGenericNotifications
{
  objc_super v3 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v3 addObserver:self selector:sel__handleEnterNearFieldNotification_ name:*MEMORY[0x263F5C548] object:0];

  BOOL v4 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v4 addObserver:self selector:sel__handleExpressTransactionStartNotification_ name:*MEMORY[0x263F5C570] object:0];

  v5 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v5 addObserver:self selector:sel__handleExpressTransactionTimeOutNotification_ name:*MEMORY[0x263F5C578] object:0];

  uint64_t v6 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v6 addObserver:self selector:sel__handleExpressTransactionEndNotification_ name:*MEMORY[0x263F5C558] object:0];

  int v7 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v7 addObserver:self selector:sel__handleExpressTransactionFailedNotification_ name:*MEMORY[0x263F5C568] object:0];

  uint64_t v8 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v8 addObserver:self selector:sel__handleExpressTransactionFailedNotification_ name:*MEMORY[0x263F5C560] object:0];

  uint64_t v9 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v9 addObserver:self selector:sel__handleExitNearFieldNotification_ name:*MEMORY[0x263F5C550] object:0];

  id v10 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v10 addObserver:self selector:sel__handleStandaloneTransactionDoneNotification_ name:@"NPKDistributedNotificationStandaloneTransactionDone" object:0];
}

- (void)_startListeningForCarKeyNotifications
{
  objc_super v3 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v3 addObserver:self selector:sel__handleCarKeyExpressEnteredNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.express.enter" object:0];

  BOOL v4 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v4 addObserver:self selector:sel__handleCarKeyExpressExitedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.express.exit" object:0];

  v5 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v5 addObserver:self selector:sel__handleCarKeySessionEndedNotification_ name:@"com.apple.secureelementservice.dck.event.session.did.end" object:0];

  uint64_t v6 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v6 addObserver:self selector:sel__handleCarKeySessionEndedWithErrorNotification_ name:@"com.apple.secureelementservice.dck.event.session.did.end.with.error" object:0];

  int v7 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v7 addObserver:self selector:sel__handleCarKeyVehicleConnectedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.connect" object:0];

  uint64_t v8 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v8 addObserver:self selector:sel__handleCarKeyVehicleDisconnectedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.disconnect" object:0];

  uint64_t v9 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v9 addObserver:self selector:sel__handleCarKeyVehicleLockedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.lock" object:0];

  id v10 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v10 addObserver:self selector:sel__handleCarKeyVehicleUnlockedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.unlock" object:0];

  id v11 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v11 addObserver:self selector:sel__handleCarKeyRKEActionCompletedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.rke.action.complete" object:0];

  id v12 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v12 addObserver:self selector:sel__handleCarKeyRangingStartedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.ranging.start" object:0];

  id v13 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v13 addObserver:self selector:sel__handleCarKeyRangingEndedNotification_ name:@"com.apple.secureelementservice.dck.event.vehicle.did.ranging.end" object:0];
}

- (void)_startListeningForHomeKeyNotifications
{
  objc_super v3 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v3 addObserver:self selector:sel__handleHomeKeyLockConnectedNotification_ name:@"com.apple.secureelementservice.acwg.event.did.connect" object:0];

  BOOL v4 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v4 addObserver:self selector:sel__handleHomeKeyLockDisconnectedNotification_ name:@"com.apple.secureelementservice.acwg.event.did.disconnect" object:0];

  id v5 = [(NPKExpressPassController *)self distributedNotificationCenter];
  [v5 addObserver:self selector:sel__handleHomeKeyLockStatusChangedNotification_ name:@"com.apple.secureelementservice.acwg.event.did.status.update" object:0];
}

- (void)_stopListeningForExpressNotifications
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __65__NPKExpressPassController__stopListeningForExpressNotifications__block_invoke;
  v2[3] = &unk_2644D2910;
  v2[4] = self;
  NPKGuaranteeMainThread(v2);
}

void __65__NPKExpressPassController__stopListeningForExpressNotifications__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: %@ Stop listening for express notifications", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) distributedNotificationCenter];
  [v6 removeObserver:*(void *)(a1 + 32)];
}

- (void)_handleEnterNearFieldNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  uint64_t v5 = [v4 object];

  uint64_t v6 = PKPassAutomaticSelectionTechnologyTypeForExpressEnteredObject();
  int v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Received Enter Near Field Notification for automatic selection technology type %d", buf, 8u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__NPKExpressPassController__handleEnterNearFieldNotification___block_invoke;
  v10[3] = &unk_2644D3160;
  v10[4] = self;
  v10[5] = v6;
  NPKGuaranteeMainThread(v10);
}

void __62__NPKExpressPassController__handleEnterNearFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _expressPassesInformationWithAutomaticSelectionTechnologyType:*(void *)(a1 + 40)];
  if ([v2 count] == 1)
  {
    BOOL v3 = [v2 anyObject];
    [*(id *)(a1 + 32) setCurrentTransactionExpressPassInformation:v3];
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v4 = [v2 count];
  uint64_t v5 = pk_General_log();
  uint64_t v6 = v5;
  if (v4 < 2)
  {
    BOOL v11 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v3 = pk_General_log();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)v28 = 138412290;
      *(void *)&v28[4] = v2;
      BOOL v8 = "Error: Received Enter Near Field Notification, but no express pass information: %@";
      uint64_t v9 = v3;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      BOOL v3 = pk_General_log();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)v28 = 138412290;
      *(void *)&v28[4] = v2;
      BOOL v8 = "Notice: More than one express pass for this technology type: %@";
      uint64_t v9 = v3;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_21E92F000, v9, v10, v8, v28, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_12:
  if (!objc_msgSend(*(id *)(a1 + 32), "_hasNoTransactionStartOrEndNotificationForTechnologyType:", *(void *)(a1 + 40), *(_OWORD *)v28))goto LABEL_27; {
  int v12 = pk_Payment_log();
  }
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    int v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      BOOL v16 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];
      *(_DWORD *)v28 = 134218242;
      *(void *)&v28[4] = v15;
      *(_WORD *)&v28[12] = 2112;
      *(void *)&v28[14] = v16;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Technology type: %ld detected. Express passes information: %@", v28, 0x16u);
    }
  }
  __int16 v17 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];

  if (!v17) {
    goto LABEL_27;
  }
  v18 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];
  __int16 v19 = [v18 passUniqueIdentifier];

  if (!v19) {
    goto LABEL_27;
  }
  BOOL v20 = [*(id *)(a1 + 32) expressPasses];
  uint64_t v21 = [v20 objectForKey:v19];

  if (!v21)
  {

LABEL_27:
    [*(id *)(a1 + 32) _transitionToStatus:1 forExpressPass:0 paymentApplicationIdentifier:0];
    goto LABEL_28;
  }
  BOOL v22 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];
  v23 = [v22 paymentApplicationIdentifiers];

  if ((unint64_t)[v23 count] >= 2)
  {
    v24 = pk_Payment_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      BOOL v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Warning: More than one express payment application identifier for a transit pass! This isn't supported.", v28, 2u);
      }
    }
  }
  objc_super v27 = [v23 firstObject];
  [*(id *)(a1 + 32) setCurrentApplicationIdentifier:v27];
  [*(id *)(a1 + 32) setCurrentSubCredentialIdentifier:0];
  [*(id *)(a1 + 32) _transitionToStatus:2 forExpressPass:v21 paymentApplicationIdentifier:v27];

LABEL_28:
}

- (void)_handleExpressTransactionStartNotification:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__NPKExpressPassController__handleExpressTransactionStartNotification___block_invoke;
  v6[3] = &unk_2644D2E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  NPKGuaranteeMainThread(v6);
}

void __71__NPKExpressPassController__handleExpressTransactionStartNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) object];
  id v9 = 0;
  id v10 = 0;
  [v2 _parseExpressNotificationObject:v3 outApplicationIdentifier:&v10 outApplicationKeyIdentifier:&v9];
  id v4 = v10;
  id v5 = v9;

  uint64_t v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    BOOL v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Start Notification for application identifier: %@, application key identifier: %@", buf, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionStartedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);
}

- (void)_handleExpressTransactionTimeOutNotification:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke;
  v6[3] = &unk_2644D2E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  NPKGuaranteeMainThread(v6);
}

void __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) object];
  id v5 = (id *)(v18 + 5);
  id v4 = (void *)v18[5];
  id v15 = 0;
  id obj = v4;
  [v2 _parseExpressNotificationObject:v3 outApplicationIdentifier:&obj outApplicationKeyIdentifier:&v15];
  objc_storeStrong(v5, obj);
  id v6 = v15;

  if (!v18[5])
  {
    id v7 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];
    BOOL v8 = v7 == 0;

    if (!v8)
    {
      id v9 = [*(id *)(a1 + 32) currentTransactionExpressPassInformation];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke_103;
      v14[3] = &unk_2644D61A0;
      v14[4] = *(void *)(a1 + 32);
      v14[5] = &v17;
      [v9 enumerateCriteriaWithHandler:v14];
    }
  }
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v18[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Time Out Notification for application identifier %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionEndedWithApplicationIdentifier:applicationKeyIdentifier:", v18[5], v6);

  _Block_object_dispose(&v17, 8);
}

void __73__NPKExpressPassController__handleExpressTransactionTimeOutNotification___block_invoke_103(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "_hasNoTransactionStartOrEndNotificationForTechnologyType:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "technologyType", (void)v14)))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_handleExpressTransactionEndNotification:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__NPKExpressPassController__handleExpressTransactionEndNotification___block_invoke;
  v6[3] = &unk_2644D2E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  NPKGuaranteeMainThread(v6);
}

void __69__NPKExpressPassController__handleExpressTransactionEndNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) object];
  id v9 = 0;
  id v10 = 0;
  [v2 _parseExpressNotificationObject:v3 outApplicationIdentifier:&v10 outApplicationKeyIdentifier:&v9];
  id v4 = v10;
  id v5 = v9;

  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction End Notification for application identifier %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionEndedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);
}

- (void)_handleExpressTransactionFailedNotification:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__NPKExpressPassController__handleExpressTransactionFailedNotification___block_invoke;
  v6[3] = &unk_2644D2E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  NPKGuaranteeMainThread(v6);
}

void __72__NPKExpressPassController__handleExpressTransactionFailedNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) object];
  id v9 = 0;
  id v10 = 0;
  [v2 _parseExpressNotificationObject:v3 outApplicationIdentifier:&v10 outApplicationKeyIdentifier:&v9];
  id v4 = v10;
  id v5 = v9;

  id v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Received Express Transaction Failed Notification for application identifier %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionFailedWithApplicationIdentifier:applicationKeyIdentifier:", v4, v5);
}

- (void)_handleExitNearFieldNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  id v5 = [v4 object];

  int v6 = PKPassAutomaticSelectionTechnologyTypeForExpressEnteredObject();
  BOOL v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Received Exit Near Field Notification for automatic selection technology type %d", buf, 8u);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__NPKExpressPassController__handleExitNearFieldNotification___block_invoke;
  v10[3] = &unk_2644D2910;
  v10[4] = self;
  NPKGuaranteeMainThread(v10);
}

uint64_t __61__NPKExpressPassController__handleExitNearFieldNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2[3] == 2)
  {
    BOOL v3 = [v2 currentApplicationIdentifier];

    if (v3)
    {
      id v4 = pk_General_log();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        int v6 = pk_General_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v7 = [*(id *)(a1 + 32) currentTransactionPass];
          int v12 = 138412290;
          uint64_t v13 = v7;
          _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Exit Near Field Notification, but didn't finish transaction with applicationIdentifier:%@ assume it fails.", (uint8_t *)&v12, 0xCu);
        }
      }
      BOOL v8 = *(void **)(a1 + 32);
      id v9 = [v8 currentApplicationIdentifier];
      id v10 = [*(id *)(a1 + 32) currentSubCredentialIdentifier];
      objc_msgSend(v8, "_onqueue_transactionFailedWithApplicationIdentifier:applicationKeyIdentifier:", v9, v10);
    }
  }
  [*(id *)(a1 + 32) _transitionToStatus:0 forExpressPass:0 paymentApplicationIdentifier:0];
  [*(id *)(a1 + 32) setCurrentTransactionExpressPassInformation:0];
  [*(id *)(a1 + 32) setCurrentApplicationIdentifier:0];
  return [*(id *)(a1 + 32) setCurrentSubCredentialIdentifier:0];
}

- (void)_onqueue_transactionStartedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(NPKExpressPassController *)self setCurrentApplicationIdentifier:v6];
  [(NPKExpressPassController *)self setCurrentSubCredentialIdentifier:v7];
  BOOL v8 = [(NPKExpressPassController *)self _queue_expressPassForTransactionApplicationIdentifier:v6 transactionApplicationKeyIdentifier:v7];

  [(NPKExpressPassController *)self _transitionToStatus:2 forExpressPass:v8 paymentApplicationIdentifier:v6];
  if (!v8)
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      uint64_t v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Started Notification for application identifier %@, but no pass.", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)_onqueue_transactionEndedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v8 = [(NPKExpressPassController *)self currentApplicationIdentifier];
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = v10;
  if (v10 == v9)
  {
  }
  else
  {
    if (!v9 || !v10)
    {

      goto LABEL_15;
    }
    int v12 = [v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_15;
    }
  }
  if ([v7 length])
  {
LABEL_15:

    goto LABEL_16;
  }
  id v13 = [(NPKExpressPassController *)self currentSubCredentialIdentifier];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = [(NPKExpressPassController *)self currentSubCredentialIdentifier];

    long long v16 = pk_General_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = pk_General_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(NPKExpressPassController *)self currentSubCredentialIdentifier];
        int v24 = 138412802;
        id v25 = v19;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Using the subcredential identifier (%@) from the start transaction event for %@ since the transaction end event didn't include it (%@)", (uint8_t *)&v24, 0x20u);
      }
    }
    id v7 = (id)v15;
  }
LABEL_16:
  BOOL v20 = [(NPKExpressPassController *)self _queue_expressPassForTransactionApplicationIdentifier:v9 transactionApplicationKeyIdentifier:v7];
  [(NPKExpressPassController *)self _transitionToStatus:4 forExpressPass:v20 paymentApplicationIdentifier:v9];
  if (!v20)
  {
    uint64_t v21 = pk_General_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      v23 = pk_General_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        id v25 = v9;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Ended Notification for application identifier %@, but no pass.", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

- (void)_onqueue_transactionFailedWithApplicationIdentifier:(id)a3 applicationKeyIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v8 = [(NPKExpressPassController *)self _queue_expressPassForTransactionApplicationIdentifier:v6 transactionApplicationKeyIdentifier:v7];

  [(NPKExpressPassController *)self _transitionToStatus:3 forExpressPass:v8 paymentApplicationIdentifier:v6];
  if (!v8)
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      uint64_t v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: Received Express Transaction Failed Notification for application identifier %@, but no pass.", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)_handleCarKeyExpressEnteredNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  kdebug_trace();
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Express Entered Notification: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleCarKeyExpressExitedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  kdebug_trace();
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Express Exited Notification: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleCarKeySessionEndedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Session Ended Notification: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleCarKeySessionEndedWithErrorNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Session Ended with Error Notification: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_handleCarKeyVehicleConnectedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 object];
  id v11 = 0;
  id v12 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v12 outApplicationKeyIdentifier:&v11];
  id v6 = v12;
  id v7 = v11;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Connected Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
}

- (void)_handleCarKeyVehicleDisconnectedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 object];
  id v11 = 0;
  id v12 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v12 outApplicationKeyIdentifier:&v11];
  id v6 = v12;
  id v7 = v11;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Disconnected Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
}

- (void)_handleCarKeyVehicleLockedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  BOOL v5 = [v4 object];
  id v16 = 0;
  id v17 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v17 outApplicationKeyIdentifier:&v16];
  id v6 = v17;
  id v7 = v16;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Locked Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__NPKExpressPassController__handleCarKeyVehicleLockedNotification___block_invoke;
  v13[3] = &unk_2644D31B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  NPKGuaranteeMainThread(v13);
}

uint64_t __67__NPKExpressPassController__handleCarKeyVehicleLockedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 0, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_handleCarKeyVehicleUnlockedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  BOOL v5 = [v4 object];
  id v16 = 0;
  id v17 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v17 outApplicationKeyIdentifier:&v16];
  id v6 = v17;
  id v7 = v16;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Vehicle Unlocked Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__NPKExpressPassController__handleCarKeyVehicleUnlockedNotification___block_invoke;
  v13[3] = &unk_2644D31B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  NPKGuaranteeMainThread(v13);
}

uint64_t __69__NPKExpressPassController__handleCarKeyVehicleUnlockedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 1, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_handleStandaloneTransactionDoneNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  BOOL v5 = [v4 object];
  id v16 = 0;
  id v17 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v17 outApplicationKeyIdentifier:&v16];
  id v6 = v17;
  id v7 = v16;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Generic Transaction Done Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__NPKExpressPassController__handleStandaloneTransactionDoneNotification___block_invoke;
  v13[3] = &unk_2644D31B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  NPKGuaranteeMainThread(v13);
}

uint64_t __73__NPKExpressPassController__handleStandaloneTransactionDoneNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_transactionCompletedForStandaloneTransactionEvent:withApplicationIdentifier:applicationKeyIdentifier:", 2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_handleCarKeyRKEActionCompletedNotification:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  BOOL v5 = [v4 object];

  id v33 = 0;
  id v34 = 0;
  id v31 = 0;
  id v32 = 0;
  id v29 = 0;
  id v30 = 0;
  [(NPKExpressPassController *)self _parseRKEActionNotificationObject:v5 outApplicationIdentifier:&v34 outApplicationKeyIdentifier:&v33 outFunctionNumber:&v32 outActionNumber:&v31 outExecutionStatusNumber:&v30 outErrorMessage:&v29];
  id v6 = v34;
  id v7 = v33;
  id v8 = v32;
  id v9 = v31;
  id v10 = v30;
  id v11 = v29;

  id v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v7;
      __int16 v39 = 2112;
      id v40 = v8;
      __int16 v41 = 2112;
      id v42 = v9;
      __int16 v43 = 2112;
      id v44 = v10;
      __int16 v45 = 2112;
      id v46 = v11;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key RKE Action Completed Notification for...\nAID: %@\nkey ID: %@\nfunctionNumber: %@\nactionNumber: %@\nexecutionStatusNumber: %@\nerrorMessage: %@", buf, 0x3Eu);
    }
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__NPKExpressPassController__handleCarKeyRKEActionCompletedNotification___block_invoke;
  v21[3] = &unk_2644D61C8;
  id v22 = v11;
  id v23 = v10;
  uint64_t v24 = self;
  id v25 = v9;
  id v26 = v8;
  id v27 = v6;
  id v28 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  NPKGuaranteeMainThread(v21);
}

void __72__NPKExpressPassController__handleCarKeyRKEActionCompletedNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) length])
  {
    v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (!v3) {
      return;
    }
    id v4 = pk_General_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    int v17 = 138412290;
    uint64_t v18 = v5;
    id v6 = "Error: RKE action failed with error: %@";
LABEL_12:
    _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v17, 0xCu);
LABEL_13:

    return;
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [NSNumber numberWithInteger:0];
  LOBYTE(v7) = [v7 isEqualToNumber:v8];

  if ((v7 & 1) == 0)
  {
    id v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (!v15) {
      return;
    }
    id v4 = pk_General_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = 138412290;
    uint64_t v18 = v16;
    id v6 = "Error: RKE action completed with unexpected execution status number! Received: %@; expected: 0";
    goto LABEL_12;
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  objc_msgSend(v9, "_onqueue_transactionCompletedForRKEAction:function:withApplicationIdentifier:applicationKeyIdentifier:", v10, v11, v12, v13);
}

- (void)_handleCarKeyRangingStartedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v11 = 0;
  id v12 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v12 outApplicationKeyIdentifier:&v11];
  id v6 = v12;
  id v7 = v11;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Started Ranging Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
}

- (void)_handleCarKeyRangingEndedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v11 = 0;
  id v12 = 0;
  [(NPKExpressPassController *)self _parseExpressNotificationObject:v5 outApplicationIdentifier:&v12 outApplicationKeyIdentifier:&v11];
  id v6 = v12;
  id v7 = v11;

  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Received Car Key Ended Ranging Notification: %@ for AID: %@ key ID: %@", buf, 0x20u);
    }
  }
}

- (void)_handleHomeKeyLockConnectedNotification:(id)a3
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Received lock connected notification.", v6, 2u);
    }
  }
}

- (void)_handleHomeKeyLockDisconnectedNotification:(id)a3
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Received lock disconnected notification.", v6, 2u);
    }
  }
}

- (void)_handleHomeKeyLockStatusChangedNotification:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v32 = 0;
  id v33 = 0;
  id v30 = 0;
  id v31 = 0;
  id v28 = 0;
  id v29 = 0;
  [(NPKExpressPassController *)self _parseHomeKeyUWBExpressNotificationObject:v5 outApplicationIdentifier:&v33 outApplicationKeyIdentifier:&v32 outReaderIdentifier:&v31 outTimestamp:&v30 outTransactionLockStatus:&v29 outLockOperationSource:&v28];
  id v6 = v33;
  id v7 = v32;
  id v8 = v31;
  id v9 = v30;
  id v10 = v29;
  id v11 = v28;

  id v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v35 = v4;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      id v43 = v8;
      __int16 v44 = 2112;
      id v45 = v9;
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Received home key status changed notification: %@ for AID: %@ key ID: %@ lock status: %@ reader ID: %@ timestamp %@ operation source: %@", buf, 0x48u);
    }
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__NPKExpressPassController__handleHomeKeyLockStatusChangedNotification___block_invoke;
  v21[3] = &unk_2644D61C8;
  void v21[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v24 = v8;
  id v25 = v10;
  id v26 = v9;
  id v27 = v11;
  id v15 = v11;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v19 = v7;
  id v20 = v6;
  NPKGuaranteeMainThread(v21);
}

void __72__NPKExpressPassController__handleHomeKeyLockStatusChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_expressPassForTransactionApplicationIdentifier:transactionApplicationKeyIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  BOOL v3 = [[NPKExpressUWBTransactionInfo alloc] initWithReaderID:*(void *)(a1 + 56) lockStatus:*(void *)(a1 + 64) timestamp:*(void *)(a1 + 72)];
  uint64_t v4 = [*(id *)(a1 + 32) _transactionEventFromLockStatus:*(void *)(a1 + 64)];
  uint64_t v5 = [*(id *)(a1 + 32) _operationSourceFromRawValue:*(void *)(a1 + 80)];
  if (v4 == 1 && v5 == 4)
  {
    [*(id *)(a1 + 32) _transitionToStandaloneTransactionEvent:1 forExpressPass:v2 withExpressUWBInfo:v3];
  }
  else
  {
    unint64_t v7 = v5;
    id v8 = @"Locked";
    if (v4 == 2) {
      id v8 = @"Generic";
    }
    if (v4 == 1) {
      id v8 = @"Unlocked";
    }
    id v9 = v8;
    if (v7 > 4) {
      id v10 = @"SourceUnknown";
    }
    else {
      id v10 = off_2644D6328[v7];
    }
    id v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      BOOL v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v9;
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring UWB event %@ with operation source %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)_onqueue_transactionCompletedForStandaloneTransactionEvent:(unint64_t)a3 withApplicationIdentifier:(id)a4 applicationKeyIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v10 = [(NPKExpressPassController *)self _queue_expressPassForTransactionApplicationIdentifier:v9 transactionApplicationKeyIdentifier:v8];

  [(NPKExpressPassController *)self _transitionToStandaloneTransactionEvent:a3 forExpressPass:v10];
}

- (void)_onqueue_transactionCompletedForRKEAction:(id)a3 function:(id)a4 withApplicationIdentifier:(id)a5 applicationKeyIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v14 = [(NPKExpressPassController *)self _queue_expressPassForTransactionApplicationIdentifier:v11 transactionApplicationKeyIdentifier:v10];

  [(NPKExpressPassController *)self _transitionToCompletedRKEAction:v13 function:v12 forExpressPass:v14];
}

- (void)_handlePassesLibraryChangedNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received Library Passes Changed Notification %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NPKExpressPassController *)self updateExpressPasses];
}

- (BOOL)_hasNoTransactionStartOrEndNotificationForTechnologyType:(int64_t)a3
{
  return a3 == 1 || a3 == 6;
}

- (id)_queue_expressPassForTransactionApplicationIdentifier:(id)a3 transactionApplicationKeyIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v22 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__15;
  id v37 = __Block_byref_object_dispose__15;
  id v38 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = self;
  id v6 = [(NPKExpressPassController *)self expressPassConfigurations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = [*(id *)(*((void *)&v29 + 1) + 8 * v9) passInformation];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __118__NPKExpressPassController__queue_expressPassForTransactionApplicationIdentifier_transactionApplicationKeyIdentifier___block_invoke;
      v24[3] = &unk_2644D61F0;
      id v11 = v10;
      id v25 = v11;
      id v26 = v23;
      id v27 = v22;
      id v28 = &v33;
      [v11 enumerateCriteriaWithHandler:v24];
      BOOL v12 = v34[5] == 0;

      if (!v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v34[5])
  {
    id v13 = [(NPKExpressPassController *)v21 expressPasses];
    id v14 = [(id)v34[5] passUniqueIdentifier];
    id v15 = [v13 objectForKey:v14];
  }
  else
  {
    id v15 = 0;
  }
  __int16 v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    uint64_t v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v15 uniqueID];
      *(_DWORD *)buf = 138412546;
      id v40 = v23;
      __int16 v41 = 2112;
      __int16 v42 = v19;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Transaction application identifier: %@ express pass unique ID %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v33, 8);

  return v15;
}

void __118__NPKExpressPassController__queue_expressPassForTransactionApplicationIdentifier_transactionApplicationKeyIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) paymentApplicationIdentifiers];
  int v7 = [v6 containsObject:*(void *)(a1 + 40)];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) subcredentialCredentialIdentifiers];
    id v9 = [v8 objectForKey:*(void *)(a1 + 40)];

    if (!*(void *)(a1 + 48) || PKEqualObjects())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
      *a4 = 1;
    }
  }
}

- (void)updateExpressPasses
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__NPKExpressPassController_updateExpressPasses__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __47__NPKExpressPassController_updateExpressPasses__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateExpressPasses");
}

- (void)updateExpressPassesSynchronous
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKExpressPassController_updateExpressPassesSynchronous__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __58__NPKExpressPassController_updateExpressPassesSynchronous__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateExpressPasses");
}

- (void)_internalQueue_updateExpressPasses
{
  v2 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v3 = [(NPKExpressPassController *)v2 paymentService];
  uint64_t v4 = [v3 expressPassConfigurations];
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NPKExpressPassController *)v2 expressPassConfigurations];
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v4;
      __int16 v49 = 2112;
      v50 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Updating current express passes with new configurations: %@ (previous: %@)", buf, 0x16u);
    }
  }
  id v37 = [MEMORY[0x263EFF9A0] dictionary];
  if (![v4 count])
  {
    [(NPKExpressPassController *)v2 _stopListeningForExpressNotifications];
LABEL_31:
    [(NPKExpressPassController *)v2 _internalQueue_stopFieldDetector];
    goto LABEL_32;
  }
  [(NPKExpressPassController *)v2 _startListeningForExpressNotifications];
  id v9 = [(NPKExpressPassController *)v2 passLibrary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v11)
  {

    goto LABEL_31;
  }
  uint64_t v12 = v11;
  id obj = v10;
  id v34 = v4;
  uint64_t v35 = v2;
  __int16 v36 = v3;
  char v13 = 0;
  uint64_t v14 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(obj);
      }
      __int16 v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      BOOL v17 = [v16 passUniqueIdentifier];
      if (v17)
      {
        uint64_t v18 = [v9 passWithUniqueID:v17];
        id v19 = pk_Payment_log();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          id v21 = pk_Payment_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v18 uniqueID];
            *(_DWORD *)buf = 138412802;
            uint64_t v48 = v18;
            __int16 v49 = 2112;
            v50 = v22;
            __int16 v51 = 2112;
            v52 = v16;
            _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Fetched pass %@ with Unique Identifier %@ for express pass configuration %@", buf, 0x20u);
          }
        }
        id v23 = [v18 paymentPass];
        uint64_t v24 = [v23 cardType];

        if (v24 == 3) {
          char v13 = 1;
        }
        if (v18)
        {
          [v37 setObject:v18 forKey:v17];
        }
        else
        {
          id v25 = pk_Payment_log();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

          if (v26)
          {
            id v27 = pk_Payment_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v48 = v16;
              _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_ERROR, "Error: Express pass controller could not find pass for express pass configuration: %@", buf, 0xCu);
            }
          }
        }
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  }
  while (v12);

  v2 = v35;
  BOOL v3 = v36;
  uint64_t v4 = v34;
  if ((v13 & 1) == 0) {
    goto LABEL_31;
  }
  [(NPKExpressPassController *)v35 _internalQueue_startFieldDetector];
LABEL_32:
  id v28 = (void *)MEMORY[0x263EFFA08];
  long long v29 = [v37 allValues];
  long long v30 = [v28 setWithArray:v29];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __62__NPKExpressPassController__internalQueue_updateExpressPasses__block_invoke;
  v39[3] = &unk_2644D3BE0;
  v39[4] = v2;
  id v40 = v4;
  id v41 = v30;
  id v42 = v37;
  id v31 = v37;
  id v32 = v30;
  id v33 = v4;
  NPKGuaranteeMainThread(v39);
}

void __62__NPKExpressPassController__internalQueue_updateExpressPasses__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) expressPassConfigurations];
  if (PKEqualObjects())
  {
    BOOL v3 = [*(id *)(a1 + 32) expressPasses];
    char v4 = PKEqualObjects();

    if (v4) {
      return;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) setExpressPassConfigurations:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(a1 + 56);
  BOOL v6 = *(void **)(a1 + 32);
  [v6 setExpressPasses:v5];
}

- (id)_expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15;
  char v13 = __Block_byref_object_dispose__15;
  id v14 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = [(NPKExpressPassController *)self expressPassConfigurations];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke;
  v8[3] = &unk_2644D6240;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 passInformation];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke_2;
  v7[3] = &unk_2644D6218;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 enumerateCriteriaWithHandler:v7];
}

void __90__NPKExpressPassController__expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (void)v15)
          && [v11 technologyType] == a1[6])
        {
          uint64_t v12 = (void *)a1[4];
          char v13 = *(void **)(*(void *)(a1[5] + 8) + 40);
          id v14 = [v12 passInformation];
          [v13 addObject:v14];

          *a4 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)_queue_siblingExpressPassesForExpressPass:(id)a3 applicationIdentifier:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v52 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__15;
  v82 = __Block_byref_object_dispose__15;
  id v83 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v53 = self;
  uint64_t v7 = [(NPKExpressPassController *)self expressPassConfigurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v74 + 1) + 8 * i) passInformation];
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __92__NPKExpressPassController__queue_siblingExpressPassesForExpressPass_applicationIdentifier___block_invoke;
        v70[3] = &unk_2644D6268;
        id v12 = v11;
        id v71 = v12;
        id v72 = v52;
        v73 = &v78;
        [v12 enumerateCriteriaWithHandler:v70];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v8);
  }

  id v47 = [MEMORY[0x263EFF9C0] set];
  char v13 = [MEMORY[0x263EFF9C0] set];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v14 = (id)v79[5];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v91 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v67 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        if ([v18 supportsExpress]
          && [v18 supportsInSessionExpress])
        {
          if ([v18 technologyType] != 4)
          {
            id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "technologyType"));
            [v13 addObject:v22];
            goto LABEL_21;
          }
          id v19 = [v18 TCIs];

          if (v19)
          {
            uint64_t v20 = [v18 TCIs];
            [v47 unionSet:v20];
          }
          id v21 = [v18 primaryTCIs];

          if (v21)
          {
            id v22 = [v18 primaryTCIs];
            [v47 unionSet:v22];
LABEL_21:

            continue;
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v91 count:16];
    }
    while (v15);
  }

  id v23 = [(NPKExpressPassController *)v53 _expressPassesInformationWithTCIs:v47];
  uint64_t v24 = [MEMORY[0x263EFF9C0] set];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v23;
  uint64_t v25 = [obj countByEnumeratingWithState:&v62 objects:v90 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v63 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = [*(id *)(*((void *)&v62 + 1) + 8 * k) passUniqueIdentifier];
        if (v28)
        {
          long long v29 = [v6 uniqueID];
          char v30 = [v28 isEqualToString:v29];

          if ((v30 & 1) == 0)
          {
            id v31 = [(NSDictionary *)v53->_expressPasses objectForKey:v28];
            if (v31) {
              [v24 addObject:v31];
            }
          }
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v62 objects:v90 count:16];
    }
    while (v25);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v46 = v13;
  uint64_t v49 = [v46 countByEnumeratingWithState:&v58 objects:v89 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      for (uint64_t m = 0; m != v49; ++m)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v46);
        }
        id v32 = *(void **)(*((void *)&v58 + 1) + 8 * m);
        id v33 = -[NPKExpressPassController _expressPassInformationWithTechnologyType:](v53, "_expressPassInformationWithTechnologyType:", [v32 integerValue]);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v34 = v33;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v88 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v55;
          do
          {
            for (uint64_t n = 0; n != v35; ++n)
            {
              if (*(void *)v55 != v36) {
                objc_enumerationMutation(v34);
              }
              id v38 = [*(id *)(*((void *)&v54 + 1) + 8 * n) passUniqueIdentifier];
              if (v38)
              {
                id v39 = [v6 uniqueID];
                char v40 = [v38 isEqualToString:v39];

                if ((v40 & 1) == 0)
                {
                  id v41 = pk_General_log();
                  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

                  if (v42)
                  {
                    long long v43 = pk_General_log();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v85 = v32;
                      __int16 v86 = 2112;
                      v87 = v38;
                      _os_log_impl(&dword_21E92F000, v43, OS_LOG_TYPE_DEFAULT, "Notice: Found technology type %@ sibling express pass %@", buf, 0x16u);
                    }
                  }
                  long long v44 = [(NSDictionary *)v53->_expressPasses objectForKey:v38];
                  if (v44) {
                    [v24 addObject:v44];
                  }
                }
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v88 count:16];
          }
          while (v35);
        }
      }
      uint64_t v49 = [v46 countByEnumeratingWithState:&v58 objects:v89 count:16];
    }
    while (v49);
  }

  _Block_object_dispose(&v78, 8);
  return v24;
}

void __92__NPKExpressPassController__queue_siblingExpressPassesForExpressPass_applicationIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) paymentApplicationIdentifiers];
  int v8 = [v7 containsObject:*(void *)(a1 + 40)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)_expressPassesInformationWithTCIs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__15;
  uint64_t v16 = __Block_byref_object_dispose__15;
  id v17 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = [(NPKExpressPassController *)self expressPassConfigurations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke;
  v9[3] = &unk_2644D62B8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 passInformation];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke_2;
  v7[3] = &unk_2644D6290;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  [v6 enumerateCriteriaWithHandler:v7];
}

void __62__NPKExpressPassController__expressPassesInformationWithTCIs___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (void)v15) && objc_msgSend(v11, "technologyType") == 4)
        {
          uint64_t v12 = [v11 TCIs];
          if ([v12 intersectsSet:a1[4]])
          {

LABEL_14:
            [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:a1[5]];
            *a4 = 1;
            goto LABEL_15;
          }
          char v13 = [v11 primaryTCIs];
          int v14 = [v13 intersectsSet:a1[4]];

          if (v14) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (id)_expressPassInformationWithTechnologyType:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__15;
  char v13 = __Block_byref_object_dispose__15;
  id v14 = [MEMORY[0x263EFF9C0] set];
  uint64_t v5 = [(NPKExpressPassController *)self expressPassConfigurations];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke;
  v8[3] = &unk_2644D6240;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 passInformation];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke_2;
  v6[3] = &unk_2644D6218;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v4;
  id v7 = v3;
  id v5 = v3;
  [v5 enumerateCriteriaWithHandler:v6];
}

void __70__NPKExpressPassController__expressPassInformationWithTechnologyType___block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "supportsExpress", (void)v12)
          && [v11 technologyType] == a1[6])
        {
          [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:a1[4]];
          *a4 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (unint64_t)_transactionEventFromLockStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [NSNumber numberWithInt:0];
  char v5 = [v3 isEqualToNumber:v4];

  if (v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 1;
    uint64_t v7 = [NSNumber numberWithInt:1];
    char v8 = [v3 isEqualToNumber:v7];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = pk_General_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        uint64_t v11 = pk_General_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          id v14 = v3;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: Got lock status changed for unexpected lock status: %@", (uint8_t *)&v13, 0xCu);
        }
      }
      unint64_t v6 = 2;
    }
  }

  return v6;
}

- (unint64_t)_operationSourceFromRawValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [NSNumber numberWithInt:0];
  char v5 = [v3 isEqualToNumber:v4];

  if (v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 1;
    uint64_t v7 = [NSNumber numberWithInt:1];
    char v8 = [v3 isEqualToNumber:v7];

    if ((v8 & 1) == 0)
    {
      unint64_t v6 = 2;
      uint64_t v9 = [NSNumber numberWithInt:2];
      char v10 = [v3 isEqualToNumber:v9];

      if ((v10 & 1) == 0)
      {
        unint64_t v6 = 3;
        uint64_t v11 = [NSNumber numberWithInt:3];
        char v12 = [v3 isEqualToNumber:v11];

        if ((v12 & 1) == 0)
        {
          int v13 = [NSNumber numberWithInt:4];
          int v14 = [v3 isEqualToNumber:v13];

          if (v14) {
            unint64_t v6 = 4;
          }
          else {
            unint64_t v6 = 5;
          }
        }
      }
    }
  }

  return v6;
}

- (void)_parseExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5
{
  id v7 = a3;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v8 = [v7 componentsSeparatedByString:@":"];
    *a4 = [v8 firstObject];
    if ([v8 count] == 2)
    {
      id v9 = [v8 lastObject];
      *a5 = v9;
    }
    else
    {
      *a5 = 0;
    }
  }
  else
  {
    char v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      char v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v13, 2u);
      }
    }
  }
}

- (void)_parseHomeKeyUWBExpressNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outReaderIdentifier:(id *)a6 outTimestamp:(id *)a7 outTransactionLockStatus:(id *)a8 outLockOperationSource:(id *)a9
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 componentsSeparatedByString:@":"];
      long long v16 = pk_General_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        long long v18 = pk_General_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          uint64_t v26 = v15;
          _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Will parse notification %@", (uint8_t *)&v25, 0xCu);
        }
      }
      if ((unint64_t)[v15 count] <= 5)
      {
        id v23 = pk_General_log();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (!v24) {
          goto LABEL_13;
        }
        id v19 = pk_General_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          uint64_t v26 = v15;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Got malformed event from sesd. %@", (uint8_t *)&v25, 0xCu);
        }
      }
      else
      {
        *a4 = [v15 objectAtIndex:0];
        *a5 = [v15 objectAtIndex:1];
        id v19 = [v15 objectAtIndex:2];
        *a6 = [MEMORY[0x263EFF8F8] dataWithHexEncodedString:v19];
        uint64_t v20 = [v15 objectAtIndex:3];
        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "integerValue"));
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = [v15 objectAtIndex:4];
        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = [v15 objectAtIndex:5];
        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "integerValue"));
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_13:
    }
  }
}

- (void)_parseRKEActionNotificationObject:(id)a3 outApplicationIdentifier:(id *)a4 outApplicationKeyIdentifier:(id *)a5 outFunctionNumber:(id *)a6 outActionNumber:(id *)a7 outExecutionStatusNumber:(id *)a8 outErrorMessage:(id *)a9
{
  id v14 = a3;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 componentsSeparatedByString:@":"];
      *a4 = [v15 firstObject];
      if ((unint64_t)[v15 count] <= 1)
      {
        *a5 = 0;
      }
      else
      {
        id v16 = [v15 objectAtIndex:1];
        *a5 = v16;
      }
      if ((unint64_t)[v15 count] >= 3)
      {
        id v19 = [v15 objectAtIndex:2];
        if (v19)
        {
          uint64_t v20 = v19;
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "integerValue"));
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      if ((unint64_t)[v15 count] >= 4)
      {
        id v21 = [v15 objectAtIndex:3];
        if (v21)
        {
          id v22 = v21;
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "integerValue"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      if ((unint64_t)[v15 count] >= 5)
      {
        id v23 = [v15 objectAtIndex:4];
        if (v23)
        {
          BOOL v24 = v23;
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      if ((unint64_t)[v15 count] < 6)
      {
        int v25 = 0;
      }
      else
      {
        int v25 = [v15 objectAtIndex:5];
      }
      id v26 = v25;
      *a9 = v26;

LABEL_22:
      goto LABEL_23;
    }
  }
  BOOL v17 = pk_Payment_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    uint64_t v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Expected to be provided a notification object, but instead found nil!", v27, 2u);
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_internalQueue_startFieldDetector
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    char v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Starting field detector for terminal-requested auth", v8, 2u);
    }
  }
  if (!self->_fieldDetector)
  {
    unint64_t v6 = (PKFieldDetector *)objc_alloc_init(MEMORY[0x263F5BE98]);
    fieldDetector = self->_fieldDetector;
    self->_fieldDetector = v6;

    [(PKFieldDetector *)self->_fieldDetector registerObserver:self];
  }
}

- (void)_internalQueue_stopFieldDetector
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  [(PKFieldDetector *)self->_fieldDetector unregisterObserver:self];
  fieldDetector = self->_fieldDetector;
  self->_fieldDetector = 0;
}

- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(NPKExpressPassController *)self passLibrary];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke;
  v8[3] = &unk_2644D62E0;
  id v9 = v5;
  char v10 = self;
  id v7 = v5;
  [v6 getMetadataForFieldWithProperties:v7 withHandler:v8];
}

void __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3
    && ([v3 shouldIgnoreField] & 1) == 0
    && [*(id *)(a1 + 32) authenticationRequired]
    && [*(id *)(a1 + 32) terminalType] == 3)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    unint64_t v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) TCIs];
    char v8 = [v5 setWithArray:v7];
    id v9 = [v6 _expressPassesInformationWithTCIs:v8];

    if ([v9 count])
    {
      if ((unint64_t)[v9 count] >= 2)
      {
        char v10 = pk_Payment_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (v11)
        {
          char v12 = pk_Payment_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Multiple express passes match TCIs for transient authentication required field detect event", buf, 2u);
          }
        }
      }
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke_117;
      v18[3] = &unk_2644D2E08;
      int v13 = v9;
      uint64_t v14 = *(void *)(a1 + 40);
      id v19 = v13;
      uint64_t v20 = v14;
      NPKGuaranteeMainThread(v18);
      uint64_t v15 = v19;
    }
    else
    {
      id v16 = pk_Payment_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v17) {
        goto LABEL_13;
      }
      uint64_t v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: No express passes match TCIs for transient authentication required field detect event", buf, 2u);
      }
    }

LABEL_13:
  }
}

void __70__NPKExpressPassController_fieldDetectorDidEnterField_withProperties___block_invoke_117(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) anyObject];
  id v3 = [*(id *)(a1 + 40) expressPasses];
  BOOL v4 = [v2 passUniqueIdentifier];
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    unint64_t v6 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 expressPassController:*(void *)(a1 + 40) didReceiveAuthenticationRequestForPass:v5];
    }
  }
  else
  {
    id v7 = pk_Payment_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      id v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        char v10 = [v2 passUniqueIdentifier];
        int v11 = 138412290;
        char v12 = v10;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Got on-device authentication required for unique ID %@, but no express pass!", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (NPKExpressPassControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKExpressPassControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPass)currentTransactionPass
{
  return self->_currentTransactionPass;
}

- (void)setCurrentTransactionPass:(id)a3
{
}

- (NSSet)expressPassConfigurations
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpressPassConfigurations:(id)a3
{
}

- (NSDictionary)expressPasses
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExpressPasses:(id)a3
{
}

- (PKExpressPassInformation)currentTransactionExpressPassInformation
{
  return self->_currentTransactionExpressPassInformation;
}

- (void)setCurrentTransactionExpressPassInformation:(id)a3
{
}

- (NSString)currentApplicationIdentifier
{
  return self->_currentApplicationIdentifier;
}

- (void)setCurrentApplicationIdentifier:(id)a3
{
}

- (NSString)currentSubCredentialIdentifier
{
  return self->_currentSubCredentialIdentifier;
}

- (void)setCurrentSubCredentialIdentifier:(id)a3
{
}

- (PKFieldDetector)fieldDetector
{
  return self->_fieldDetector;
}

- (void)setFieldDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetector, 0);
  objc_storeStrong((id *)&self->_currentSubCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_currentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_currentTransactionExpressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPasses, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_distributedNotificationCenter);
  objc_destroyWeak((id *)&self->_passLibrary);
  objc_destroyWeak((id *)&self->_paymentService);
  objc_storeStrong((id *)&self->_currentTransactionPass, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end