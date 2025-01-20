@interface NPKContactlessPaymentSessionManager
- (BOOL)_canHandleRKEActionForTileItem:(id)a3 pass:(id)a4 outAction:(id *)a5 outFunction:(id *)a6 outError:(id *)a7;
- (BOOL)_handleIfPossibleIdentityUnavailablePassWithSession:(id)a3;
- (BOOL)contactlessPaymentInterfaceVisible;
- (NPKBarcodePaymentSession)barcodePaymentSession;
- (NPKContactlessPaymentSessionManager)init;
- (NPKContactlessPaymentSessionState)lastSessionState;
- (NPKObserverManager)observersManager;
- (NPKQuickPaymentSession)quickPaymentSession;
- (NPKQuickPaymentSessionCleanupDelegate)cleanupDelegate;
- (NSData)credential;
- (OS_dispatch_source)sessionTimer;
- (PKPass)userSelectedPass;
- (id)_baseSessionStateForUpdate;
- (id)_managerContextForContactlessInterfaceTransactionContext:(id)a3;
- (id)_paymentBalancesFromTransitAppletBalances:(id)a3;
- (id)_sessionStateForBarcodeTransactionStatus:(unint64_t)a3 paymentBarcode:(id)a4 transaction:(id)a5;
- (id)_sessionStateForExpressTransactionStatus:(unint64_t)a3 pass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9;
- (id)_sessionStateForPaymentBarcode:(id)a3;
- (id)_sessionStateForTransactionContext:(id)a3;
- (id)_sessionStateForUserCanceledBarcodeTransaction;
- (id)_updatedPassItemFieldWithPaymentPass:(id)a3 transitAppletBalances:(id)a4 appletState:(id)a5 paymentApplication:(id)a6;
- (int)serviceModeRequestNotifyToken;
- (void)_cleanupBarcodePaymentSession;
- (void)_cleanupQuickPaymentSession;
- (void)_handleRKEActionRequestedForPass:(id)a3 action:(id)a4 function:(id)a5 withSession:(id)a6 completion:(id)a7;
- (void)_handleServiceModeRequestEnded;
- (void)_handleSessionTimerFired;
- (void)_handleValueAddedServiceTransactions:(id)a3 forValueAddedServicePasses:(id)a4 paymentTransaction:(id)a5 outUserInterventionRequiredPasses:(id *)a6;
- (void)_prepareSessionStateForSendingToObservers:(id)a3;
- (void)_registerForServiceModeRequestNotification;
- (void)_sendSessionStateToObservers:(id)a3;
- (void)_startSessionTimerWithReason:(unint64_t)a3;
- (void)_stopSessionTimer;
- (void)barcodePaymentSession:(id)a3 didReceivePaymentBarcode:(id)a4;
- (void)barcodePaymentSession:(id)a3 didUpdateTransactionStatus:(unint64_t)a4 withTransaction:(id)a5;
- (void)handleAuthorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4;
- (void)handleAutomaticSelectionValueAddedServicePasses:(id)a3;
- (void)handleBarcodePaymentPinCodeEntry:(id)a3;
- (void)handleBarcodePaymentUserIntentionConfirmation:(BOOL)a3;
- (void)handleContactlessPaymentInterfaceDidAppear;
- (void)handleContactlessPaymentInterfaceDidDisappear;
- (void)handleContactlessPaymentSession:(id)a3 authenticationExpected:(BOOL)a4;
- (void)handleCredential:(id)a3;
- (void)handleDidPresentPasscodeAuthentication;
- (void)handleDoublePressReceivedAtDate:(id)a3;
- (void)handleEndBarcodePaymentSessionRequestedByUI;
- (void)handleEndQuickPaymentSessionRequestedByUI;
- (void)handleEndSessionRequestedForReason:(unint64_t)a3;
- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4;
- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9;
- (void)handleFailureToReleaseDataWithError:(id)a3;
- (void)handleISO18013DataReleaseCanceled;
- (void)handleISO18013Request:(id)a3 withReaderAuthInfo:(id)a4;
- (void)handleISO18013TransactionStarted;
- (void)handleLocalAuthenticationError:(id)a3;
- (void)handlePaymentBarcodeRequested;
- (void)handleRKEActionRequestedForTileItem:(id)a3 pass:(id)a4 completion:(id)a5;
- (void)handleRKETransactionForPass:(id)a3 fromTile:(id)a4;
- (void)handleRetryLoadingPaymentBarcodeRequested;
- (void)handleServiceModeRequestedForPass:(id)a3;
- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4;
- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4 withAccessory:(id)a5;
- (void)handleTransactionStarted;
- (void)handleUserSelectedPass:(id)a3;
- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4;
- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4;
- (void)passesDataSourceDidReloadPasses:(id)a3;
- (void)paymentSession:(id)a3 didActivatePass:(id)a4;
- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6;
- (void)paymentSession:(id)a3 didFailTransactionForPass:(id)a4 withValueAddedServiceTransactions:(id)a5 forValueAddedServicePasses:(id)a6;
- (void)paymentSession:(id)a3 didMakePassCurrent:(id)a4;
- (void)paymentSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5;
- (void)paymentSession:(id)a3 willActivatePass:(id)a4;
- (void)paymentSessionDidEnterField:(id)a3;
- (void)paymentSessionDidExitField:(id)a3;
- (void)paymentSessionDidReceiveActivationError:(id)a3;
- (void)paymentSessionDidReceiveActivityTimeout:(id)a3;
- (void)paymentSessionDidReceiveAuthorizationTimeout:(id)a3;
- (void)paymentSessionDidReceiveCredential:(id)a3;
- (void)paymentSessionDidReceiveStartTransaction:(id)a3;
- (void)paymentSessionDidReceiveTransactionError:(id)a3;
- (void)paymentSessionDidSelectPayment:(id)a3;
- (void)paymentSessionDidSelectValueAddedService:(id)a3;
- (void)paymentSessionDidStart:(id)a3;
- (void)paymentSessionIsWaitingToStart:(id)a3;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4;
- (void)setBarcodePaymentSession:(id)a3;
- (void)setCleanupDelegate:(id)a3;
- (void)setContactlessPaymentInterfaceVisible:(BOOL)a3;
- (void)setCredential:(id)a3;
- (void)setLastSessionState:(id)a3;
- (void)setObserversManager:(id)a3;
- (void)setQuickPaymentSession:(id)a3;
- (void)setServiceModeRequestNotifyToken:(int)a3;
- (void)setSessionTimer:(id)a3;
- (void)setUserSelectedPass:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKContactlessPaymentSessionManager

- (NPKContactlessPaymentSessionManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)NPKContactlessPaymentSessionManager;
  id v2 = [(NPKContactlessPaymentSessionManager *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(NPKObserverManager);
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    v5 = objc_alloc_init(NPKQuickPaymentSessionCleanupDelegate);
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    objc_initWeak(&location, v2);
    v7 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
    v9 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v8;

    v10 = *((void *)v2 + 8);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __43__NPKContactlessPaymentSessionManager_init__block_invoke;
    v15 = &unk_2644D29A8;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v10, &v12);
    dispatch_resume(*((dispatch_object_t *)v2 + 8));
    objc_msgSend(v2, "_registerForServiceModeRequestNotification", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (NPKContactlessPaymentSessionManager *)v2;
}

void __43__NPKContactlessPaymentSessionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__NPKContactlessPaymentSessionManager_init__block_invoke_2;
    block[3] = &unk_2644D2910;
    id v4 = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __43__NPKContactlessPaymentSessionManager_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionTimerFired];
}

- (void)handleContactlessPaymentSession:(id)a3 authenticationExpected:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  dispatch_source_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling new contactless payment session: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
  [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
  objc_storeStrong((id *)&self->_quickPaymentSession, a3);
  v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v7;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] did set new quick payment session: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  v14 = [(NPKContactlessPaymentSessionState *)self->_lastSessionState serviceModeRequestedPass];
  v15 = [v14 uniqueID];
  id v16 = [v7 currentPass];
  v17 = [v16 uniqueID];
  int v18 = [v15 isEqualToString:v17];

  if (v18)
  {
    [(NPKQuickPaymentSession *)self->_quickPaymentSession setInServiceMode:1];
    [(NPKContactlessPaymentSessionManager *)self _handleServiceModeRequestEnded];
  }
  lastSessionState = self->_lastSessionState;
  self->_lastSessionState = 0;

  credential = self->_credential;
  self->_credential = 0;

  [v7 setDelegate:self];
  v21 = [v7 currentPass];
  if (!v21)
  {
    userSelectedPass = self->_userSelectedPass;
    if (userSelectedPass)
    {
      v21 = userSelectedPass;
      [v7 setCurrentPass:v21];
    }
    else
    {
      v21 = 0;
    }
  }
  if (!self->_contactlessPaymentInterfaceVisible
    || ([(NPKContactlessPaymentSessionManager *)self _startSessionTimerWithReason:1],
        [v7 confirmSessionExpectingCredential:v4],
        !self->_contactlessPaymentInterfaceVisible))
  {
    [(NPKContactlessPaymentSessionManager *)self _startSessionTimerWithReason:0];
  }
  v23 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v23 setCurrentPass:v21];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v23];
}

- (void)handleDidPresentPasscodeAuthentication
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling did present passcode Authentication", v6, 2u);
    }
  }
  [(NPKContactlessPaymentSessionManager *)self _stopSessionTimer];
}

- (void)handleContactlessPaymentInterfaceDidAppear
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling contactless payment interface did appear", v6, 2u);
    }
  }
  self->_contactlessPaymentInterfaceVisible = 1;
  [(NPKContactlessPaymentSessionManager *)self _startSessionTimerWithReason:1];
  [(NPKQuickPaymentSession *)self->_quickPaymentSession confirmSessionExpectingCredential:[(NPKContactlessPaymentSessionState *)self->_lastSessionState doublePressReceived]];
  if ([(NPKContactlessPaymentSessionState *)self->_lastSessionState contactlessInterfaceReady])
  {
    kdebug_trace();
  }
}

- (void)handleContactlessPaymentInterfaceDidDisappear
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling contactless payment interface did disappear with session: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  self->_contactlessPaymentInterfaceVisible = 0;
  if (v3)
  {
    [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
    id v7 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
    [v7 setCompletionReason:1];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
  }
  dispatch_source_t v8 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  if (v8)
  {
    [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
    BOOL v9 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
    [v9 setCompletionReason:1];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v9];
  }
}

- (void)handleCredential:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = (NSData *)a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      quickPaymentSession = self->_quickPaymentSession;
      int v11 = 138412546;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      v14 = quickPaymentSession;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling credential: %@ with quickPaymentSession:%@", (uint8_t *)&v11, 0x16u);
    }
  }
  credential = self->_credential;
  self->_credential = v4;
  int v10 = v4;

  [(NPKQuickPaymentSession *)self->_quickPaymentSession setCredential:v10];
  if (self->_contactlessPaymentInterfaceVisible) {
    [(NPKContactlessPaymentSessionManager *)self _startSessionTimerWithReason:1];
  }
}

- (void)handleUserSelectedPass:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    dispatch_source_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 uniqueID];
      int v30 = 138412290;
      v31 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling user selected pass: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  p_userSelectedPass = &self->_userSelectedPass;
  [(PKPass *)self->_userSelectedPass isEqualToPassIncludingMetadata:v5];
  int v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    __int16 v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(PKPass *)*p_userSelectedPass uniqueID];
      uint64_t v15 = [v5 uniqueID];
      id v16 = NSStringFromBOOL();
      int v30 = 138412802;
      v31 = v14;
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      v35 = v16;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Is previous user selected pass (%@) equal to new pass (%@)? %@", (uint8_t *)&v30, 0x20u);
    }
  }
  objc_storeStrong((id *)&self->_userSelectedPass, a3);
  if (self->_quickPaymentSession)
  {
    v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Updating payment session with user selected pass", (uint8_t *)&v30, 2u);
      }
    }
    [(NPKQuickPaymentSession *)self->_quickPaymentSession setInServiceMode:0];
    [(NPKQuickPaymentSession *)self->_quickPaymentSession setCurrentPass:v5];
  }
  v20 = [(NPKContactlessPaymentSessionState *)self->_lastSessionState serviceModeRequestedPass];
  v21 = v20;
  if (v20)
  {
    v22 = [v20 uniqueID];
    v23 = [(PKPass *)*p_userSelectedPass uniqueID];
    char v24 = [v22 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
      id v25 = pk_Payment_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v26)
      {
        v27 = pk_Payment_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [v21 uniqueID];
          int v30 = 138412290;
          v31 = v28;
          _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing service mode requested pass %@", (uint8_t *)&v30, 0xCu);
        }
      }
      v29 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
      [v29 setServiceModeRequestedPass:0];
      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v29];
      [(NPKContactlessPaymentSessionManager *)self _handleServiceModeRequestEnded];
    }
  }
}

- (void)handleDoublePressReceivedAtDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] handleDoublePressReceivedAtDate:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_source_t v8 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v8 setDoublePressReceived:1];
  [v8 setDoublePressTimestamp:v4];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v8];
}

- (void)handleServiceModeRequestedForPass:(id)a3
{
  id v7 = a3;
  -[NPKContactlessPaymentSessionManager handleUserSelectedPass:](self, "handleUserSelectedPass:");
  quickPaymentSession = self->_quickPaymentSession;
  if (quickPaymentSession)
  {
    [(NPKQuickPaymentSession *)quickPaymentSession setInServiceMode:1];
    [(NPKContactlessPaymentSessionManager *)self _handleServiceModeRequestEnded];
  }
  id v5 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  BOOL v6 = v5;
  if (!self->_quickPaymentSession) {
    [v5 setServiceModeRequestedPass:v7];
  }
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v6];
}

- (void)handleRKEActionRequestedForTileItem:(id)a3 pass:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    __int16 v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v9 uniqueID];
      *(_DWORD *)buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling tile requested for item: %@ pass: %@", buf, 0x16u);
    }
  }
  uint64_t v15 = [v8 action];
  uint64_t v16 = [v15 type];

  if (v16 == 4)
  {
    id v34 = 0;
    id v35 = 0;
    id v33 = 0;
    BOOL v17 = [(NPKContactlessPaymentSessionManager *)self _canHandleRKEActionForTileItem:v8 pass:v9 outAction:&v35 outFunction:&v34 outError:&v33];
    BOOL v18 = v35;
    id v19 = v34;
    id v20 = v33;
    if (v20 || !v17)
    {
      v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

      if (v29)
      {
        int v30 = pk_Payment_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = [v9 uniqueID];
          *(_DWORD *)buf = 138413058;
          id v37 = v31;
          __int16 v38 = 2112;
          v39 = v18;
          __int16 v40 = 2112;
          id v41 = v19;
          __int16 v42 = 2112;
          id v43 = v20;
          _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Unable to handle RKE action for pass: %@ with action: %@ function: %@ error: %@", buf, 0x2Au);
        }
      }
      __int16 v32 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];

      if (v32) {
        [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
      }
      char v24 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
      [v24 setCompletionReason:6];
      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v24];
      if (v10) {
        v10[2](v10, 0);
      }
    }
    else
    {
      [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
      v21 = +[NPKQuickPaymentSession sessionWithQueue:MEMORY[0x263EF83A0]];
      [(NPKContactlessPaymentSessionManager *)self setQuickPaymentSession:v21];

      v22 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [v22 setCurrentPass:v9];

      v23 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [v23 setRequireFirstInQueue:0];

      char v24 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [(NPKContactlessPaymentSessionManager *)self _handleRKEActionRequestedForPass:v9 action:v18 function:v19 withSession:v24 completion:v10];
    }

LABEL_21:
    goto LABEL_22;
  }
  id v25 = pk_Payment_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

  if (v26)
  {
    BOOL v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v27 = [v9 uniqueID];
      *(_DWORD *)buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Asked to handle RKE action for unexpected item: %@ pass: %@; Aborting.",
        buf,
        0x16u);
    }
    goto LABEL_21;
  }
LABEL_22:
}

- (void)handleEndSessionRequestedForReason:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling end quick payment session requested with session: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
    id v9 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
    [v9 setCompletionReason:a3];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v9];
  }
  id v10 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  if (v10)
  {
    uint64_t v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      __int16 v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v10;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling end barcode payment session requested with session: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
    v14 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForUserCanceledBarcodeTransaction];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v14];
  }
}

- (void)handleAutomaticSelectionValueAddedServicePasses:(id)a3
{
}

- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4
{
  id v8 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForExpressTransactionStatus:4 pass:a4 paymentApplication:0 concreteTransactions:0 ephemeralTransaction:0 mutatedBalances:0 appletState:0];
  BOOL v6 = [v8 transactionContext];
  [v6 setAction:a3];

  BOOL v7 = [v8 transactionContext];
  [v7 setTransactionStatus:2];

  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v8];
}

- (void)handleRKETransactionForPass:(id)a3 fromTile:(id)a4
{
  id v6 = a4;
  id v10 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForExpressTransactionStatus:4 pass:a3 paymentApplication:0 concreteTransactions:0 ephemeralTransaction:0 mutatedBalances:0 appletState:0];
  BOOL v7 = [v10 transactionContext];
  [v7 setAction:5];

  id v8 = [v10 transactionContext];
  [v8 setPassTile:v6];

  id v9 = [v10 transactionContext];
  [v9 setTransactionStatus:2];

  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v10];
}

- (void)handleStandaloneTransactionWithAction:(unint64_t)a3 forPass:(id)a4 withAccessory:(id)a5
{
  id v8 = a5;
  id v12 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForExpressTransactionStatus:4 pass:a4 paymentApplication:0 concreteTransactions:0 ephemeralTransaction:0 mutatedBalances:0 appletState:0];
  id v9 = [v12 transactionContext];
  [v9 setAction:a3];

  id v10 = [v12 transactionContext];
  [v10 setTransactionStatus:2];

  uint64_t v11 = [v12 transactionContext];
  [v11 setAccessory:v8];

  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v12];
}

- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4
{
}

- (void)handleExpressTransactionStatus:(unint64_t)a3 forPass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = pk_Payment_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v23 = pk_Payment_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v26 = NSStringFromNPKExpressTransactionStatus(a3);
      [v15 uniqueID];
      *(_DWORD *)buf = 138413570;
      v28 = v26;
      uint64_t v30 = v29 = 2112;
      char v24 = (void *)v30;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got express transaction status %@ for pass %@ concrete transactions %@ ephemeral transactions %@ mutatedBalances:%@ applet state %@", buf, 0x3Eu);
    }
  }
  id v25 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForExpressTransactionStatus:a3 pass:v15 paymentApplication:v16 concreteTransactions:v17 ephemeralTransaction:v18 mutatedBalances:v19 appletState:v20];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v25];
}

- (void)handleLocalAuthenticationError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling local authentication error %@", (uint8_t *)&v11, 0xCu);
    }
  }
  id v8 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v8 setDoublePressReceived:0];
  [v8 setSessionAuthorized:0];
  id v9 = [v4 domain];
  if (![v9 isEqualToString:*MEMORY[0x263F10440]])
  {

    goto LABEL_10;
  }
  if ([v4 code] != -9)
  {
    uint64_t v10 = [v4 code];

    if (v10 == -4) {
      goto LABEL_11;
    }
LABEL_10:
    [v8 setFailureType:1];
    goto LABEL_11;
  }

LABEL_11:
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v8];
}

- (void)handleEndQuickPaymentSessionRequestedByUI
{
  v3 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];

  if (v3)
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending quick payment session requested by UI.", v10, 2u);
      }
    }
    BOOL v7 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
    id v8 = [v7 paymentPass];

    if (([v8 supportsBarcodePayment] & 1) == 0)
    {
      [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
      id v9 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
      [v9 setCompletionReason:7];
      [v9 setDoublePressReceived:0];
      [v9 setSessionAuthorized:0];
      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v9];
    }
  }
}

- (void)handlePaymentBarcodeRequested
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  id v4 = [v3 paymentPass];

  if ([v4 supportsBarcodePayment])
  {
    BOOL v5 = [v4 devicePrimaryBarcodePaymentApplication];
    [v5 state];
    int IsPersonalized = PKPaymentApplicationStateIsPersonalized();

    BOOL v7 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];

    id v8 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

    id v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (IsPersonalized && v7 && !v8)
    {
      if (v10)
      {
        int v11 = pk_Payment_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17[0]) = 0;
          _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Transitioning from quickPaymentSession into barcodePaymentSession.", (uint8_t *)v17, 2u);
        }
      }
      [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
      id v12 = [NPKBarcodePaymentSession alloc];
      uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self credential];
      v14 = [(NPKBarcodePaymentSession *)v12 initWithPaymentPass:v4 authorizationCredential:v13];

      [v14 setDelegate:self];
      [v14 startSession];
      [(NPKContactlessPaymentSessionManager *)self setBarcodePaymentSession:v14];
      id v15 = [v14 currentPaymentBarcode];
      id v16 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForPaymentBarcode:v15];

      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v16];
LABEL_13:

      goto LABEL_14;
    }
    if (v10)
    {
      v14 = pk_Payment_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109632;
        v17[1] = IsPersonalized != 0;
        __int16 v18 = 1024;
        BOOL v19 = v7 != 0;
        __int16 v20 = 1024;
        BOOL v21 = v8 == 0;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Skip creating new barcodePaymentSession - isPersonalized: %d, hasQuickPaymentSession: %d, hasNoExistingBarcodePaymentSession: %d", (uint8_t *)v17, 0x14u);
      }
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)handleRetryLoadingPaymentBarcodeRequested
{
  v3 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v3)
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling retry loading paymentBarcode", v8, 2u);
      }
    }
    BOOL v7 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
    [v7 retryFetchingBarcode];
  }
}

- (void)handleBarcodePaymentUserIntentionConfirmation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  [v4 submitUserIntentionConfirmation:v3];
}

- (void)handleBarcodePaymentPinCodeEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  [v5 submitPinCode:v4];
}

- (void)handleEndBarcodePaymentSessionRequestedByUI
{
  BOOL v3 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v3)
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending barcode payment session requested by UI.", v9, 2u);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
    BOOL v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
    [v7 setCompletionReason:7];
    id v8 = [v7 transactionContext];
    [v8 setTransactionStatus:2];

    [v7 setDoublePressReceived:0];
    [v7 setSessionAuthorized:0];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
  }
}

- (void)handleTransactionStarted
{
  id v3 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v3 setCanChangePass:0];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v3];
}

- (BOOL)_handleIfPossibleIdentityUnavailablePassWithSession:(id)a3
{
  return 0;
}

- (void)handleISO18013TransactionStarted
{
  id v8 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v8 setTransactionType:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v8 setReleaseDataStatus:1];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v8 setTransactionStatus:1];
  id v3 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  id v4 = [v3 currentPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v8 setTransactionPass:v4];

  BOOL v5 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  BOOL v6 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  BOOL v7 = [v6 currentPass];
  [v5 setCurrentPass:v7];

  [v5 setSessionAuthorized:0];
  [v5 setDoublePressReceived:0];
  [v5 setContactlessInterfaceReady:0];
  [v5 setCanChangePass:0];
  [v5 setCompletionReason:0];
  [v5 setTransactionContext:v8];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v5];
}

- (void)handleISO18013DataReleaseCanceled
{
  id v3 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v3 setTransactionType:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v3 setReleaseDataStatus:6];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v3 setTransactionStatus:2];
  id v4 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling ending quick payment session requested by UI.", v11, 2u);
      }
    }
    id v8 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
    id v9 = [v8 paymentPass];

    if (([v9 supportsBarcodePayment] & 1) == 0)
    {
      [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
      BOOL v10 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
      [v10 setTransactionContext:v3];
      [v10 setCompletionReason:7];
      [v10 setFailureType:7];
      [v10 setDoublePressReceived:0];
      [v10 setSessionAuthorized:0];
      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v10];
    }
  }
}

- (void)handleISO18013Request:(id)a3 withReaderAuthInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v11 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setTransactionType:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setReleaseDataStatus:2];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setTransactionStatus:1];
  id v8 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setTransactionPass:v8];

  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setReleaseDataRequest:v7];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v11 setReaderAuthInfo:v6];

  id v9 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  BOOL v10 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [v9 setCurrentPass:v10];

  [v9 setSessionAuthorized:0];
  [v9 setDoublePressReceived:0];
  [v9 setContactlessInterfaceReady:0];
  [v9 setCanChangePass:0];
  [v9 setCompletionReason:0];
  [v9 setTransactionContext:v11];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v9];
}

- (void)handleAuthorize18013RequestWithDataToRelease:(id)a3 credential:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  [v8 authorize18013RequestWithDataToRelease:v7 credential:v6];

  id v16 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setTransactionType:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setReleaseDataStatus:3];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setTransactionStatus:1];
  id v9 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setTransactionPass:v9];

  BOOL v10 = [(NPKContactlessPaymentSessionManager *)self lastSessionState];
  int v11 = [v10 transactionContext];
  id v12 = [v11 releaseDataRequest];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setReleaseDataRequest:v12];

  uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  v14 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [v13 setCurrentPass:v14];

  [v13 setSessionAuthorized:1];
  [v13 setDoublePressReceived:1];
  id v15 = [MEMORY[0x263EFF910] now];
  [v13 setDoublePressTimestamp:v15];

  [v13 setContactlessInterfaceReady:1];
  [v13 setCanChangePass:0];
  [v13 setCompletionReason:0];
  [v13 setTransactionContext:v16];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v13];
}

- (void)handleFailureToReleaseDataWithError:(id)a3
{
  id v6 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v6 setTransactionType:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v6 setReleaseDataStatus:5];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v6 setTransactionStatus:2];
  id v4 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  BOOL v5 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [v4 setCurrentPass:v5];

  [v4 setTransactionContext:v6];
  [v4 setDoublePressReceived:0];
  [v4 setSessionAuthorized:0];
  [v4 setCompletionReason:5];
  [v4 setFailureType:2];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v4];
}

- (void)barcodePaymentSession:(id)a3 didReceivePaymentBarcode:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v7 == v6)
  {
    id v8 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForPaymentBarcode:v9];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v8];
  }
}

- (void)barcodePaymentSession:(id)a3 didUpdateTransactionStatus:(unint64_t)a4 withTransaction:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  id v9 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v9 == v15)
  {
    BOOL v10 = [v15 currentPaymentBarcode];
    int v11 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForBarcodeTransactionStatus:a4 paymentBarcode:v10 transaction:v8];

    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v11];
    id v12 = [v11 transactionContext];
    uint64_t v13 = [v12 transactionStatus];

    if (v13 == 2)
    {
      [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
      uint64_t v14 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];

      [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v14];
      int v11 = (void *)v14;
    }
  }
}

- (void)_cleanupBarcodePaymentSession
{
  id v3 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  if (v3)
  {
    id v4 = v3;
    [v3 invalidateSession];
    [(NPKContactlessPaymentSessionManager *)self setBarcodePaymentSession:0];
    id v3 = v4;
  }
}

- (void)passesDataSource:(id)a3 didRemovePasses:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = objc_msgSend(a4, "pk_arrayByApplyingBlock:", &__block_literal_global_536);
  id v7 = [v5 setWithArray:v6];

  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v7 allObjects];
      id v12 = [v11 componentsJoinedByString:@", "];
      int v30 = 138412290;
      __int16 v31 = v12;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got removed unique IDs: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  uint64_t v14 = [v13 currentPass];
  id v15 = [v14 uniqueID];

  id v16 = pk_Payment_log();
  LODWORD(v14) = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v17 = pk_Payment_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      __int16 v31 = v15;
      _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", (uint8_t *)&v30, 0xCu);
    }
  }
  if (v15 && [v7 containsObject:v15])
  {
    __int16 v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      __int16 v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing quick payment session current pass because it has been removed", (uint8_t *)&v30, 2u);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
    BOOL v21 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:0];
    [v21 setCompletionReason:7];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v21];
  }
  uint64_t v22 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  v23 = [v22 paymentPass];
  char v24 = [v23 uniqueID];

  id v25 = pk_Payment_log();
  LODWORD(v23) = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    BOOL v26 = pk_Payment_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      __int16 v31 = v24;
      _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", (uint8_t *)&v30, 0xCu);
    }
  }
  if (v24 && [v7 containsObject:v24])
  {
    v27 = pk_Payment_log();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      __int16 v29 = pk_Payment_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because pass has been removed", (uint8_t *)&v30, 2u);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
  }
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didRemovePasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

- (void)passesDataSource:(id)a3 didUpdatePasses:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_541);
  id v8 = [v6 setWithArray:v7];

  BOOL v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    int v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v8 allObjects];
      uint64_t v13 = [v12 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v13;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got updated unique IDs: %@", buf, 0xCu);
    }
  }
  uint64_t v14 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  id v15 = [v14 currentPass];
  id v16 = [v15 uniqueID];

  id v17 = pk_Payment_log();
  LODWORD(v15) = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    __int16 v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v16;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", buf, 0xCu);
    }
  }
  if (v16 && [v8 containsObject:v16])
  {
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_542;
    v51[3] = &unk_2644D4770;
    id v52 = v16;
    BOOL v19 = objc_msgSend(v5, "pk_objectsPassingTest:", v51);
    __int16 v20 = [v19 firstObject];

    if (v20)
    {
      BOOL v21 = pk_Payment_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v23 = pk_Payment_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          char v24 = [v20 uniqueID];
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = (uint64_t)v24;
          _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting updated payment session pass with unique ID %@", buf, 0xCu);
        }
      }
      id v25 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [v25 setCurrentPass:v20];
    }
  }
  BOOL v26 = [(PKPass *)self->_userSelectedPass uniqueID];
  v27 = pk_Payment_log();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

  if (v28)
  {
    __int16 v29 = pk_Payment_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v26;
      _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] User selected pass unique ID is %@", buf, 0xCu);
    }
  }
  if (v26 && [v8 containsObject:v26])
  {
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_544;
    v50[3] = &unk_2644D4770;
    v50[4] = self;
    int v30 = objc_msgSend(v5, "pk_objectsPassingTest:", v50);
    __int16 v31 = [v30 firstObject];

    if (v31)
    {
      uint64_t v32 = pk_Payment_log();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        id v34 = pk_Payment_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v35 = [v31 uniqueID];
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = (uint64_t)v35;
          _os_log_impl(&dword_21E92F000, v34, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting updated user selected pass with unique ID %@", buf, 0xCu);
        }
      }
      objc_storeStrong((id *)&self->_userSelectedPass, v31);
    }
  }
  id v36 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  __int16 v37 = [v36 paymentPass];
  id v38 = [v37 uniqueID];

  uint64_t v39 = pk_Payment_log();
  LODWORD(v37) = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

  if (v37)
  {
    __int16 v40 = pk_Payment_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = (uint64_t)v38;
      _os_log_impl(&dword_21E92F000, v40, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", buf, 0xCu);
    }
  }
  if (v38 && [v8 containsObject:v38])
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_545;
    v48[3] = &unk_2644D4770;
    id v49 = v16;
    id v41 = objc_msgSend(v5, "pk_objectsPassingTest:", v48);
    __int16 v42 = [v41 firstObject];

    id v43 = [v42 secureElementPass];
    uint64_t v44 = [v43 passActivationState];

    if (v44)
    {
      v45 = pk_Payment_log();
      BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);

      if (v46)
      {
        v47 = pk_Payment_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v54 = v44;
          _os_log_impl(&dword_21E92F000, v47, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because updated pass is not activated (state %lu)", buf, 0xCu);
        }
      }
      [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
    }
  }
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_542(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_544(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) uniqueID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __72__NPKContactlessPaymentSessionManager_passesDataSource_didUpdatePasses___block_invoke_545(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)passesDataSourceDidReloadPasses:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Got passes reloaded", (uint8_t *)&v46, 2u);
    }
  }
  id v8 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  BOOL v9 = [v8 currentPass];

  BOOL v10 = [v9 uniqueID];
  int v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 138412290;
      v47 = v10;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Quick payment session pass unique ID is %@", (uint8_t *)&v46, 0xCu);
    }
  }
  if (v10)
  {
    uint64_t v14 = [v4 passForUniqueID:v10];
    id v15 = v14;
    if (v14)
    {
      if ([v14 isEqualToPassIncludingMetadata:v9]) {
        goto LABEL_24;
      }
      id v16 = pk_Payment_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        __int16 v18 = pk_Payment_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v19 = [v15 uniqueID];
          int v46 = 138412290;
          v47 = v19;
          _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Setting reloaded pass for unique ID %@", (uint8_t *)&v46, 0xCu);
        }
      }
      __int16 v20 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [v20 setCurrentPass:v15];

      BOOL v21 = [(PKPass *)self->_userSelectedPass uniqueID];
      BOOL v22 = [v15 uniqueID];
      int v23 = [v21 isEqualToString:v22];

      if (!v23) {
        goto LABEL_24;
      }
      char v24 = v15;
      userSelectedPass = self->_userSelectedPass;
      self->_userSelectedPass = v24;
    }
    else
    {
      BOOL v26 = pk_Payment_log();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        BOOL v28 = pk_Payment_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Clearing quick payment session current pass because it has been removed", (uint8_t *)&v46, 2u);
        }
      }
      userSelectedPass = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      [userSelectedPass setCurrentPass:0];
    }

LABEL_24:
  }
  __int16 v29 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
  int v30 = [v29 paymentPass];
  __int16 v31 = [v30 uniqueID];

  uint64_t v32 = pk_Payment_log();
  LODWORD(v30) = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    BOOL v33 = pk_Payment_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 138412290;
      v47 = v31;
      _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Barcode payment session pass unique ID is %@", (uint8_t *)&v46, 0xCu);
    }
  }
  if (v31)
  {
    id v34 = [v4 passForUniqueID:v31];
    __int16 v35 = pk_Payment_log();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

    if (v36)
    {
      __int16 v37 = pk_Payment_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = [v34 secureElementPass];
        uint64_t v39 = [v38 passActivationState];
        int v46 = 138412546;
        v47 = v34;
        __int16 v48 = 2048;
        uint64_t v49 = v39;
        _os_log_impl(&dword_21E92F000, v37, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Reloaded barcode payment pass is %@ (state %lu)", (uint8_t *)&v46, 0x16u);
      }
    }
    if (!v34
      || ([v34 secureElementPass],
          __int16 v40 = objc_claimAutoreleasedReturnValue(),
          uint64_t v41 = [v40 passActivationState],
          v40,
          v41))
    {
      __int16 v42 = pk_Payment_log();
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

      if (v43)
      {
        uint64_t v44 = pk_Payment_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_21E92F000, v44, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Tearing down barcode payment session because updated pass no longer exists or is not activated", (uint8_t *)&v46, 2u);
        }
      }
      v45 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
      [v45 invalidateSession];
    }
  }
}

- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  observersManager = self->_observersManager;
  id v10 = a3;
  -[NPKObserverManager registerObserver:withRelativePriority:](observersManager, "registerObserver:withRelativePriority:");
  BOOL v6 = [(NPKContactlessPaymentSessionManager *)self lastSessionState];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  }
  BOOL v9 = v8;

  [(NPKContactlessPaymentSessionManager *)self _prepareSessionStateForSendingToObservers:v9];
  [v10 contactlessPaymentSessionManager:self didChangeSessionState:v9];
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
  observersManager = self->_observersManager;
  id v4 = a3;
  [(NPKObserverManager *)observersManager unregisterObserver:v4];
}

- (void)paymentSession:(id)a3 didMakePassCurrent:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 uniqueID];
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] New current pass from payment session: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v10 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v10 setCurrentPass:v5];
  BOOL v12 = 1;
  if ([v5 passType] != 1 || (objc_msgSend(v10, "doublePressReceived") & 1) == 0)
  {
    if (![v5 npkHasValidNFCPayload]
      || ([(NPKContactlessPaymentSessionManager *)self quickPaymentSession],
          int v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      BOOL v12 = 0;
    }
  }
  [v10 setPassActivating:v12];
  [v10 setContactlessInterfaceReady:0];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v10];
}

- (void)paymentSession:(id)a3 willActivatePass:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v7 uniqueID];
      *(_DWORD *)buf = 138412290;
      BOOL v43 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session will activate pass: %@", buf, 0xCu);
    }
  }
  kdebug_trace();
  if ([v7 style] != 8)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:*MEMORY[0x263F5C408] forKeyedSubscript:*MEMORY[0x263F5C378]];
    [v12 setObject:*MEMORY[0x263F5C450] forKeyedSubscript:*MEMORY[0x263F5C448]];
    id v13 = v12;
    id v14 = v7;
    uint64_t v15 = v14;
    if (!v14 || !v13)
    {
LABEL_32:

      id v38 = (void *)MEMORY[0x263F5BD40];
      uint64_t v39 = *MEMORY[0x263F5C4C8];
      v41[0] = *MEMORY[0x263F5C4A8];
      v41[1] = v39;
      __int16 v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      [v38 subjects:v40 sendEvent:v13];

      goto LABEL_33;
    }
    uint64_t v16 = [v14 passType];
    BOOL v17 = (id *)MEMORY[0x263F5C4A0];
    if ((unint64_t)(v16 + 1) >= 3) {
      __int16 v18 = (__CFString *)(id)*MEMORY[0x263F5C4A0];
    }
    else {
      __int16 v18 = off_2644D4A28[v16 + 1];
    }
    [v13 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C478]];

    unint64_t v19 = [v15 style];
    if (v19 < 0xD && ((0x13FFu >> v19) & 1) != 0) {
      __int16 v20 = off_2644D4A40[v19];
    }
    else {
      __int16 v20 = (__CFString *)*v17;
    }
    [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x263F5C470]];

    BOOL v21 = [v15 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    BOOL v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v22 forKeyedSubscript:*MEMORY[0x263F5C458]];

    id v23 = v15;
    if ([v23 passType] == 1)
    {
      char v24 = [v23 secureElementPass];
      unint64_t v25 = [v24 cardType];
      if (v25 <= 4) {
        BOOL v22 = (__CFString *)**((id **)&unk_2644D4AA8 + v25);
      }
    }
    else
    {
      BOOL v22 = @"other";
    }

    [v13 setObject:v22 forKeyedSubscript:*MEMORY[0x263F5C468]];
    BOOL v26 = [v23 secureElementPass];
    if ([v26 isIdentityPass])
    {
      uint64_t v27 = [v26 identityType];
      if ((unint64_t)(v27 - 1) < 3)
      {
        BOOL v28 = off_2644D4AD0[v27 - 1];
        goto LABEL_27;
      }
    }
    else if ([v26 isAccessPass])
    {
      unint64_t v29 = [v26 accessType];
      if (v29 < 7)
      {
        BOOL v28 = off_2644D4AE8[v29];
        goto LABEL_27;
      }
    }
    BOOL v28 = (__CFString *)*v17;
LABEL_27:

    [v13 setObject:v28 forKeyedSubscript:*MEMORY[0x263F5C460]];
    int v30 = [v23 secureElementPass];
    __int16 v31 = [v30 devicePaymentApplications];
    [v31 count];

    uint64_t v32 = PKAnalyticsReportSwitchToggleResultValue();

    [v13 setObject:v32 forKeyedSubscript:*MEMORY[0x263F5C340]];
    BOOL v33 = [v23 secureElementPass];
    id v34 = *v17;
    __int16 v35 = [v33 organizationName];
    if ([v35 length])
    {
      unint64_t v36 = [v33 cardType];
      if (v36 <= 4 && ((1 << v36) & 0x16) != 0)
      {
        id v37 = v35;

        id v34 = v37;
      }
    }

    [v13 setObject:v34 forKeyedSubscript:*MEMORY[0x263F5C420]];
    goto LABEL_32;
  }
LABEL_33:
  [(NPKContactlessPaymentSessionManager *)self paymentSession:v6 didMakePassCurrent:v7];
}

- (void)paymentSession:(id)a3 didActivatePass:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 uniqueID];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did activate pass: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  kdebug_trace();
  if (self->_contactlessPaymentInterfaceVisible) {
    kdebug_trace();
  }
  id v10 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v10 setCurrentPass:v5];
  [v10 setPassActivating:0];
  [v10 setContactlessInterfaceReady:1];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v10];
}

- (void)paymentSession:(id)a3 didFailTransactionForPass:(id)a4 withValueAddedServiceTransactions:(id)a5 forValueAddedServicePasses:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    uint64_t v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      id v37 = v11;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session %@ (current %@) failed (VAS) transaction for pass %@", buf, 0x20u);
    }
  }
  if (v12)
  {
    id v31 = 0;
    [(NPKContactlessPaymentSessionManager *)self _handleValueAddedServiceTransactions:v12 forValueAddedServicePasses:v13 paymentTransaction:0 outUserInterventionRequiredPasses:&v31];
    id v18 = v31;
  }
  else
  {
    id v18 = 0;
  }
  if (![v18 count])
  {
    if (![v12 count]) {
      goto LABEL_25;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v37) = 1;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __141__NPKContactlessPaymentSessionManager_paymentSession_didFailTransactionForPass_withValueAddedServiceTransactions_forValueAddedServicePasses___block_invoke;
    v30[3] = &unk_2644D4798;
    v30[4] = buf;
    [v12 enumerateObjectsUsingBlock:v30];
    BOOL v22 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
    id v23 = [v22 currentPass];

    char v24 = pk_Payment_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      BOOL v26 = pk_Payment_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [v23 style];
        *(_DWORD *)uint64_t v32 = 138412546;
        BOOL v33 = v23;
        __int16 v34 = 1024;
        int v35 = v27;
        _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] current pass unique ID is %@ style %d", v32, 0x12u);
      }
    }
    BOOL v28 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
    [v28 setCurrentPass:v11];
    [v28 setContactlessInterfaceReady:1];
    if ([v23 passType] == 1 && *(unsigned char *)(*(void *)&buf[8] + 24))
    {
      uint64_t v29 = 4;
    }
    else
    {
      if (![v23 npkHasValidNFCPayload])
      {
LABEL_24:
        [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v28];

        _Block_object_dispose(buf, 8);
        goto LABEL_25;
      }
      uint64_t v29 = 2;
    }
    [v28 setFailureType:v29];
    goto LABEL_24;
  }
  unint64_t v19 = pk_Payment_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    BOOL v21 = pk_Payment_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Got user intervention required passes %@", buf, 0xCu);
    }
  }
LABEL_25:
}

uint64_t __141__NPKContactlessPaymentSessionManager_paymentSession_didFailTransactionForPass_withValueAddedServiceTransactions_forValueAddedServicePasses___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 terminalMode];
  if (result != 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      uint64_t v16 = NSStringFromNPKQuickPaymentSessionCompletionReason(a4);
      int v26 = 138412802;
      id v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session %@ (current %@) completed for reason %@", (uint8_t *)&v26, 0x20u);
    }
  }
  id v17 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];

  if (v17 == v10)
  {
    id v18 = [(NPKContactlessPaymentSessionManager *)self _sessionStateForTransactionContext:v11];
    [v18 setCompletionReason:a4];
    unint64_t v19 = a4 - 4;
    if (a4 - 4 <= 6 && ((0x73u >> v19) & 1) != 0) {
      [v18 setFailureType:qword_21EBB1750[v19]];
    }
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v18];
    if ([v18 hasSession])
    {
      BOOL v20 = [v18 transactionContext];
      BOOL v21 = [v20 transactionType] == 5;

      if (a6) {
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v21 = 0;
      if (a6) {
        goto LABEL_14;
      }
    }
    if (!v21)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_14:
    BOOL v22 = pk_Payment_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      char v24 = pk_Payment_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Will cleanup payment session", (uint8_t *)&v26, 2u);
      }
    }
    [(NPKContactlessPaymentSessionManager *)self _cleanupQuickPaymentSession];
    uint64_t v25 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];

    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v25];
    id v18 = (void *)v25;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)paymentSessionDidEnterField:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v42 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session detected field entry", v42, 2u);
    }
  }
  id v8 = [v4 currentPass];
  if ([v8 style] != 8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v9 setObject:*MEMORY[0x263F5C3D8] forKeyedSubscript:*MEMORY[0x263F5C378]];
    id v10 = v9;
    id v11 = v8;
    id v12 = v11;
    if (!v11 || !v10)
    {
LABEL_32:

      int v35 = (void *)MEMORY[0x263F5BD40];
      uint64_t v36 = *MEMORY[0x263F5C4C8];
      v43[0] = *MEMORY[0x263F5C4A8];
      v43[1] = v36;
      id v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      [v35 subjects:v37 sendEvent:v10];

      goto LABEL_33;
    }
    uint64_t v13 = [v11 passType];
    id v14 = (id *)MEMORY[0x263F5C4A0];
    if ((unint64_t)(v13 + 1) >= 3) {
      BOOL v15 = (__CFString *)(id)*MEMORY[0x263F5C4A0];
    }
    else {
      BOOL v15 = off_2644D4A28[v13 + 1];
    }
    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x263F5C478]];

    unint64_t v16 = [v12 style];
    if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0) {
      id v17 = off_2644D4A40[v16];
    }
    else {
      id v17 = (__CFString *)*v14;
    }
    [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x263F5C470]];

    id v18 = [v12 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    unint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F5C458]];

    id v20 = v12;
    if ([v20 passType] == 1)
    {
      BOOL v21 = [v20 secureElementPass];
      unint64_t v22 = [v21 cardType];
      if (v22 <= 4) {
        unint64_t v19 = (__CFString *)**((id **)&unk_2644D4AA8 + v22);
      }
    }
    else
    {
      unint64_t v19 = @"other";
    }

    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x263F5C468]];
    BOOL v23 = [v20 secureElementPass];
    if ([v23 isIdentityPass])
    {
      uint64_t v24 = [v23 identityType];
      if ((unint64_t)(v24 - 1) < 3)
      {
        uint64_t v25 = off_2644D4AD0[v24 - 1];
        goto LABEL_27;
      }
    }
    else if ([v23 isAccessPass])
    {
      unint64_t v26 = [v23 accessType];
      if (v26 < 7)
      {
        uint64_t v25 = off_2644D4AE8[v26];
        goto LABEL_27;
      }
    }
    uint64_t v25 = (__CFString *)*v14;
LABEL_27:

    [v10 setObject:v25 forKeyedSubscript:*MEMORY[0x263F5C460]];
    id v27 = [v20 secureElementPass];
    __int16 v28 = [v27 devicePaymentApplications];
    [v28 count];

    uint64_t v29 = PKAnalyticsReportSwitchToggleResultValue();

    [v10 setObject:v29 forKeyedSubscript:*MEMORY[0x263F5C340]];
    __int16 v30 = [v20 secureElementPass];
    id v31 = *v14;
    uint64_t v32 = [v30 organizationName];
    if ([v32 length])
    {
      unint64_t v33 = [v30 cardType];
      if (v33 <= 4 && ((1 << v33) & 0x16) != 0)
      {
        id v34 = v32;

        id v31 = v34;
      }
    }

    [v10 setObject:v31 forKeyedSubscript:*MEMORY[0x263F5C420]];
    goto LABEL_32;
  }
LABEL_33:
  uint64_t v38 = [v4 currentPass];
  uint64_t v39 = [v38 paymentPass];
  uint64_t v40 = [v39 effectiveContactlessPaymentApplicationState];
  if (!v38 || v39 && v40 != 1)
  {
    uint64_t v41 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
    [v41 setCurrentPass:v38];
    [v41 setFailureType:5];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v41];
  }
}

- (void)paymentSessionDidExitField:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v37 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session detected field exit", v37, 2u);
    }
  }
  BOOL v7 = [v3 currentPass];
  if ([v7 style] != 8)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v8 setObject:*MEMORY[0x263F5C3E0] forKeyedSubscript:*MEMORY[0x263F5C378]];
    id v9 = v8;
    id v10 = v7;
    id v11 = v10;
    if (!v10 || !v9)
    {
LABEL_32:

      id v34 = (void *)MEMORY[0x263F5BD40];
      uint64_t v35 = *MEMORY[0x263F5C4C8];
      v38[0] = *MEMORY[0x263F5C4A8];
      v38[1] = v35;
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
      [v34 subjects:v36 sendEvent:v9];

      goto LABEL_33;
    }
    uint64_t v12 = [v10 passType];
    uint64_t v13 = (id *)MEMORY[0x263F5C4A0];
    if ((unint64_t)(v12 + 1) >= 3) {
      id v14 = (__CFString *)(id)*MEMORY[0x263F5C4A0];
    }
    else {
      id v14 = off_2644D4A28[v12 + 1];
    }
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F5C478]];

    unint64_t v15 = [v11 style];
    if (v15 < 0xD && ((0x13FFu >> v15) & 1) != 0) {
      unint64_t v16 = off_2644D4A40[v15];
    }
    else {
      unint64_t v16 = (__CFString *)*v13;
    }
    [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x263F5C470]];

    id v17 = [v11 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C458]];

    id v19 = v11;
    if ([v19 passType] == 1)
    {
      id v20 = [v19 secureElementPass];
      unint64_t v21 = [v20 cardType];
      if (v21 <= 4) {
        id v18 = (__CFString *)**((id **)&unk_2644D4AA8 + v21);
      }
    }
    else
    {
      id v18 = @"other";
    }

    [v9 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5C468]];
    unint64_t v22 = [v19 secureElementPass];
    if ([v22 isIdentityPass])
    {
      uint64_t v23 = [v22 identityType];
      if ((unint64_t)(v23 - 1) < 3)
      {
        uint64_t v24 = off_2644D4AD0[v23 - 1];
        goto LABEL_27;
      }
    }
    else if ([v22 isAccessPass])
    {
      unint64_t v25 = [v22 accessType];
      if (v25 < 7)
      {
        uint64_t v24 = off_2644D4AE8[v25];
        goto LABEL_27;
      }
    }
    uint64_t v24 = (__CFString *)*v13;
LABEL_27:

    [v9 setObject:v24 forKeyedSubscript:*MEMORY[0x263F5C460]];
    unint64_t v26 = [v19 secureElementPass];
    id v27 = [v26 devicePaymentApplications];
    [v27 count];

    __int16 v28 = PKAnalyticsReportSwitchToggleResultValue();

    [v9 setObject:v28 forKeyedSubscript:*MEMORY[0x263F5C340]];
    uint64_t v29 = [v19 secureElementPass];
    id v30 = *v13;
    id v31 = [v29 organizationName];
    if ([v31 length])
    {
      unint64_t v32 = [v29 cardType];
      if (v32 <= 4 && ((1 << v32) & 0x16) != 0)
      {
        id v33 = v31;

        id v30 = v33;
      }
    }

    [v9 setObject:v30 forKeyedSubscript:*MEMORY[0x263F5C420]];
    goto LABEL_32;
  }
LABEL_33:
}

- (void)paymentSessionDidSelectPayment:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  BOOL v5 = [v4 currentPass];

  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 uniqueID];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did select payment for unique ID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if ([v5 passType] != 1)
  {
    id v10 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
    [v10 setCurrentPass:v5];
    [v10 setFailureType:3];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v10];
  }
}

- (void)paymentSessionDidSelectValueAddedService:(id)a3
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session selected value added service", v6, 2u);
    }
  }
}

- (void)paymentSessionDidReceiveStartTransaction:(id)a3
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received start transaction", v6, 2u);
    }
  }
}

- (void)paymentSessionDidReceiveActivityTimeout:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v31 = a3;
  __int16 v28 = [v31 currentPass];
  BOOL v4 = [v28 paymentPass];
  int v5 = [v4 isTransitPass];

  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received activity timeout isTransit %i", (uint8_t *)&buf, 8u);
    }
  }
  if (v5)
  {
    int v9 = NPKIsTruthOnCardTransitPass(v28);
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      if (v11)
      {
        uint64_t v12 = pk_Payment_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling activity timeout in transit pass as completion", (uint8_t *)&buf, 2u);
        }
      }
      uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
      id v14 = [v13 currentPass];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      unint64_t v15 = [v14 paymentPass];
      id obj = [v15 npkPreferredContactlessPaymentApplications];

      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v16)
      {
        uint64_t v30 = *(void *)v36;
        uint64_t v17 = MEMORY[0x263EFFA68];
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v36 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * v18);
            id v20 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
            [(NPKContactlessPaymentSessionManagerTransactionContext *)v20 setTransactionStatus:2];
            unint64_t v21 = [v31 currentPass];
            [(NPKContactlessPaymentSessionManagerTransactionContext *)v20 setTransactionPass:v21];

            if (NPKIsTruthOnCardTransitPass(v14))
            {
              id v22 = objc_alloc_init(MEMORY[0x263F5C0A8]);
              dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v40 = 0x3032000000;
              uint64_t v41 = __Block_byref_object_copy__8;
              __int16 v42 = __Block_byref_object_dispose__8;
              id v43 = 0;
              uint64_t v24 = [v14 uniqueID];
              v32[0] = MEMORY[0x263EF8330];
              v32[1] = 3221225472;
              v32[2] = __79__NPKContactlessPaymentSessionManager_paymentSessionDidReceiveActivityTimeout___block_invoke;
              v32[3] = &unk_2644D47C0;
              p_long long buf = &buf;
              unint64_t v25 = v23;
              id v33 = v25;
              [v22 transitStateWithPassUniqueIdentifier:v24 paymentApplication:v19 completion:v32];

              dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
              [(NPKContactlessPaymentSessionManagerTransactionContext *)v20 updateWithConcreteTransactions:v17 ephemeralTransaction:0 updatedPassTransitItems:v17 paymentApplication:v19];
              if (*(void *)(*((void *)&buf + 1) + 40)) {
                [(NPKContactlessPaymentSessionManagerTransactionContext *)v20 forceToTransitTypeTransactionWithTransactionStatus:1];
              }

              _Block_object_dispose(&buf, 8);
            }
            else
            {
              [(NPKContactlessPaymentSessionManagerTransactionContext *)v20 updateWithConcreteTransactions:v17 ephemeralTransaction:0 updatedPassTransitItems:v17 paymentApplication:v19];
            }
            unint64_t v26 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
            [v26 setCurrentPass:v14];
            [v26 setSessionAuthorized:0];
            [v26 setDoublePressReceived:0];
            [v26 setContactlessInterfaceReady:0];
            [v26 setCanChangePass:1];
            [v26 setCompletionReason:0];
            [v26 setTransactionContext:v20];
            [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v26];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v16);
      }

LABEL_27:
      goto LABEL_28;
    }
    if (v11)
    {
      id v14 = pk_Payment_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v28 uniqueID];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] unexpected activity timeout event for cEMV pass with uniqueID:%@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_27;
    }
  }
LABEL_28:
}

void __79__NPKContactlessPaymentSessionManager_paymentSessionDidReceiveActivityTimeout___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)paymentSessionDidReceiveCredential:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received credential", v8, 2u);
    }
  }
  BOOL v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setSessionAuthorized:1];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
}

- (void)paymentSession:(id)a3 didReceive18013Request:(id)a4 readerAuthInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    BOOL v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received 18013 Request", v12, 2u);
    }
  }
  [(NPKContactlessPaymentSessionManager *)self handleISO18013Request:v7 withReaderAuthInfo:v8];
}

- (void)paymentSessionDidReceiveAuthorizationTimeout:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received authorization timeout", v8, 2u);
    }
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setDoublePressReceived:0];
  [v7 setSessionAuthorized:0];
  if ([(NPKContactlessPaymentSessionState *)self->_lastSessionState sessionAuthorized])
  {
    [v7 setFailureType:6];
    [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
  }
}

- (void)paymentSessionDidReceiveActivationError:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received activation error", v8, 2u);
    }
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setDoublePressReceived:0];
  [v7 setSessionAuthorized:0];
  [v7 setFailureType:1];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
}

- (void)paymentSessionDidReceiveTransactionError:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session received transaction error", v8, 2u);
    }
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setDoublePressReceived:0];
  [v7 setSessionAuthorized:0];
  [v7 setFailureType:2];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
}

- (void)paymentSessionIsWaitingToStart:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session waiting to start", v8, 2u);
    }
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setSessionWaitingToStart:1];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
}

- (void)paymentSessionDidStart:(id)a3
{
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Payment session did start", v8, 2u);
    }
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [(NPKContactlessPaymentSessionManager *)self _sendSessionStateToObservers:v7];
}

- (void)_cleanupQuickPaymentSession
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  if (v3)
  {
    id v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      BOOL v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        int v9 = "-[NPKContactlessPaymentSessionManager _cleanupQuickPaymentSession]";
        __int16 v10 = 2112;
        BOOL v11 = v3;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] %s cleaning payment session:%@", (uint8_t *)&v8, 0x16u);
      }
    }
    [v3 deactivateSessionWithCompletion:0];
    [(NPKContactlessPaymentSessionManager *)self setQuickPaymentSession:0];
    id v7 = [(NPKContactlessPaymentSessionManager *)self cleanupDelegate];
    [v3 setDelegate:v7];

    [(NPKContactlessPaymentSessionManager *)self _stopSessionTimer];
  }
}

- (id)_managerContextForContactlessInterfaceTransactionContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  BOOL v6 = [v4 paymentPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setTransactionPass:v6];

  id v7 = [v4 paymentPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setValueAddedServicePass:v7];

  int v8 = [v4 transaction];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setPaymentTransaction:v8];

  int v9 = [(NPKContactlessPaymentSessionManager *)self lastSessionState];
  __int16 v10 = [v9 transactionContext];
  uint64_t v11 = [v10 transactionType];

  if (v11 == 5)
  {
    if ([v4 success]) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 5;
    }
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setReleaseDataStatus:v12];
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setTransactionType:5];
    uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self lastSessionState];
    id v14 = [v13 transactionContext];
    unint64_t v15 = [v14 releaseDataRequest];
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setReleaseDataRequest:v15];
  }
  uint64_t v16 = [v4 valueAddedServiceTransactions];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke;
  v67[3] = &unk_2644D4810;
  id v17 = v4;
  id v68 = v17;
  uint64_t v18 = v5;
  v69 = v18;
  [v16 enumerateObjectsUsingBlock:v67];

  uint64_t v19 = [v17 valueAddedServicePasses];
  id v20 = [v19 firstObject];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 setValueAddedServicePass:v20];

  unint64_t v21 = [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 transactionPass];

  if (!v21)
  {
    id v22 = [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 valueAddedServicePass];
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 setTransactionPass:v22];
  }
  dispatch_semaphore_t v23 = [v17 transaction];
  if (v23)
  {
    id v24 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    unint64_t v25 = [v17 paymentPass];
    unint64_t v26 = [v25 uniqueID];
    id v27 = [v17 paymentApplication];
    [v24 insertOrUpdatePaymentTransaction:v23 forPassUniqueIdentifier:v26 paymentApplication:v27 completion:0];
LABEL_12:

    goto LABEL_13;
  }
  __int16 v28 = [v17 transitHistory];

  if (v28)
  {
    id v52 = self;
    id v24 = [v17 paymentPass];
    uint64_t v29 = [v24 uniqueID];
    id v30 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__8;
    v65 = __Block_byref_object_dispose__8;
    id v66 = 0;
    unint64_t v32 = [v24 devicePrimaryPaymentApplication];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_3;
    v58[3] = &unk_2644D47C0;
    v60 = &v61;
    id v27 = v31;
    v59 = v27;
    [v30 transitStateWithPassUniqueIdentifier:v29 paymentApplication:v32 completion:v58];
    v53 = v30;
    uint64_t v50 = (void *)v29;

    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    id v56 = 0;
    id v57 = (id)MEMORY[0x263EFFA68];
    id v55 = 0;
    id v33 = (void *)v62[5];
    id v34 = [v17 transitHistory];
    long long v35 = [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 transactionPass];
    long long v36 = [v35 paymentPass];
    v51 = objc_msgSend(v33, "npk_processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:pass:", v34, &v57, &v56, &v55, v36);

    uint64_t v54 = [v17 transitHistory];
    long long v37 = [v17 date];
    long long v38 = [v17 paymentApplication];
    uint64_t v39 = [v17 paymentPass];
    uint64_t v40 = [v39 uniqueID];
    uint64_t v41 = [v17 expressState];
    [v53 processTransitTransactionEventWithHistory:v54 transactionDate:v37 forPaymentApplication:v38 withPassUniqueIdentifier:v40 expressTransactionState:v41];

    id v42 = v55;
    id v43 = [v17 paymentApplication];
    uint64_t v44 = [(NPKContactlessPaymentSessionManager *)v52 _updatedPassItemFieldWithPaymentPass:v24 transitAppletBalances:v42 appletState:v51 paymentApplication:v43];

    id v46 = v56;
    id v45 = v57;
    v47 = [v17 paymentApplication];
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 updateWithConcreteTransactions:v45 ephemeralTransaction:v46 updatedPassTransitItems:v44 paymentApplication:v47];

    [(NPKContactlessPaymentSessionManagerTransactionContext *)v18 forceToTransitTypeTransactionWithTransactionStatus:5];
    _Block_object_dispose(&v61, 8);

    unint64_t v25 = v50;
    unint64_t v26 = v53;
    goto LABEL_12;
  }
LABEL_13:
  __int16 v48 = v18;

  return v48;
}

void __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 didSucceed])
  {
    id v7 = [*(id *)(a1 + 32) valueAddedServicePasses];
    int v8 = (void *)MEMORY[0x263F08A98];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_2;
    v12[3] = &unk_2644D47E8;
    id v13 = v6;
    int v9 = [v8 predicateWithBlock:v12];
    __int16 v10 = [v7 filteredArrayUsingPredicate:v9];
    uint64_t v11 = [v10 firstObject];

    if (v11)
    {
      [*(id *)(a1 + 40) setValueAddedServicePass:v11];
      *a4 = 1;
    }
  }
}

uint64_t __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 passTypeIdentifier];
  id v4 = [v3 dataUsingEncoding:4];
  BOOL v5 = [v4 SHA256Hash];

  id v6 = [*(id *)(a1 + 32) merchant];
  id v7 = [v6 identifier];
  uint64_t v8 = [v5 isEqual:v7];

  return v8;
}

void __96__NPKContactlessPaymentSessionManager__managerContextForContactlessInterfaceTransactionContext___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleValueAddedServiceTransactions:(id)a3 forValueAddedServicePasses:(id)a4 paymentTransaction:(id)a5 outUserInterventionRequiredPasses:(id *)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v35 = a5;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v49 = v9;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Handling VAS transactions: %@", buf, 0xCu);
    }
  }
  if (a6)
  {
    id v34 = [MEMORY[0x263EFF980] array];
    *a6 = v34;
  }
  else
  {
    id v34 = 0;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        unint64_t v21 = [v20 passTypeIdentifier];
        id v22 = [v21 dataUsingEncoding:4];
        dispatch_semaphore_t v23 = [v22 SHA256Hash];

        id v24 = [v14 objectForKey:v23];
        if (!v24)
        {
          id v24 = [MEMORY[0x263EFF980] array];
          [v14 setObject:v24 forKey:v23];
        }
        [v24 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v17);
  }

  unint64_t v25 = [MEMORY[0x263EFF980] array];
  unint64_t v26 = [MEMORY[0x263EFF980] array];
  id v27 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __156__NPKContactlessPaymentSessionManager__handleValueAddedServiceTransactions_forValueAddedServicePasses_paymentTransaction_outUserInterventionRequiredPasses___block_invoke;
  v36[3] = &unk_2644D4838;
  id v37 = v14;
  id v38 = v25;
  id v39 = v26;
  id v40 = v27;
  id v41 = v35;
  id v42 = v34;
  id v28 = v34;
  id v29 = v35;
  id v30 = v27;
  id v31 = v26;
  id v32 = v25;
  id v33 = v14;
  [v9 enumerateObjectsUsingBlock:v36];
}

void __156__NPKContactlessPaymentSessionManager__handleValueAddedServiceTransactions_forValueAddedServicePasses_paymentTransaction_outUserInterventionRequiredPasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v3 merchant];
  id v6 = [v5 identifier];
  id v7 = [v4 objectForKey:v6];

  if ([v3 didSucceed])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (void)v20);
          id v14 = *(void **)(a1 + 48);
          id v15 = [v13 uniqueID];
          [v14 addObject:v15];

          uint64_t v16 = *(void **)(a1 + 56);
          uint64_t v17 = [v13 uniqueID];
          [v16 insertOrUpdateValueAddedServiceTransaction:v3 forPassUniqueIdentifier:v17 paymentTransaction:*(void *)(a1 + 64) completion:0];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 48) addObject:&stru_26CFEBA18];
    if ([v3 error] == 3)
    {
      [*(id *)(a1 + 72) addObjectsFromArray:v7];
    }
    else if ([v3 error] == 1)
    {
      uint64_t v18 = [v3 merchantURL];
      uint64_t v19 = [v18 length];

      if (v19) {
        [*(id *)(a1 + 56) insertOrUpdateValueAddedServiceTransaction:v3 forPassUniqueIdentifier:0 paymentTransaction:0 completion:0];
      }
    }
  }
}

- (id)_baseSessionStateForUpdate
{
  id v3 = (void *)[(NPKContactlessPaymentSessionState *)self->_lastSessionState copy];
  id v4 = v3;
  if (v3) {
    BOOL v5 = v3;
  }
  else {
    BOOL v5 = objc_alloc_init(NPKContactlessPaymentSessionState);
  }
  id v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
  [(NPKContactlessPaymentSessionState *)v6 setUniqueID:v7];

  id v8 = [MEMORY[0x263EFF910] date];
  [(NPKContactlessPaymentSessionState *)v6 setTimestamp:v8];

  uint64_t v9 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  [(NPKContactlessPaymentSessionState *)v6 setHasSession:v9 != 0];

  uint64_t v10 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  -[NPKContactlessPaymentSessionState setSessionStarted:](v6, "setSessionStarted:", [v10 sessionStarted]);

  uint64_t v11 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  -[NPKContactlessPaymentSessionState setIsSwitchingSessionType:](v6, "setIsSwitchingSessionType:", [v11 isSwitchingSessionType]);

  uint64_t v12 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  -[NPKContactlessPaymentSessionState setSessionType:](v6, "setSessionType:", [v12 sessionType]);

  if (![(NPKContactlessPaymentSessionState *)v6 hasSession]
    || [(NPKContactlessPaymentSessionState *)v6 sessionStarted])
  {
    [(NPKContactlessPaymentSessionState *)v6 setSessionWaitingToStart:0];
  }
  id v13 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  -[NPKContactlessPaymentSessionState setInServiceMode:](v6, "setInServiceMode:", [v13 inServiceMode]);

  if ([(NPKContactlessPaymentSessionState *)v6 inServiceMode]) {
    [(NPKContactlessPaymentSessionState *)v6 setServiceModeRequestedPass:0];
  }
  [(NPKContactlessPaymentSessionState *)v6 setTransactionContext:0];
  id v14 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v14)
  {
    [(NPKContactlessPaymentSessionState *)v6 setHasSession:1];
    id v15 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];
    -[NPKContactlessPaymentSessionState setSessionStarted:](v6, "setSessionStarted:", [v15 sessionStarted]);

    [(NPKContactlessPaymentSessionState *)v6 setInServiceMode:0];
  }
  [(NPKContactlessPaymentSessionState *)v6 setExpressTransactionStatus:0];
  [(NPKContactlessPaymentSessionState *)v6 setFailureType:0];
  [(NPKContactlessPaymentSessionState *)v6 setCompletionReason:0];
  return v6;
}

- (void)_prepareSessionStateForSendingToObservers:(id)a3
{
  id v5 = a3;
  if ([v5 inServiceMode]) {
    uint64_t v4 = [v5 doublePressReceived] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setCanChangePass:v4];
  if (([v5 hasSession] & 1) == 0) {
    [v5 setCurrentPass:self->_userSelectedPass];
  }
}

- (void)_sendSessionStateToObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NPKContactlessPaymentSessionManager *)self _prepareSessionStateForSendingToObservers:v5];
  objc_storeStrong((id *)&self->_lastSessionState, a3);
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] sending to observer new session State:%@", buf, 0xCu);
    }
  }
  observersManager = self->_observersManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__NPKContactlessPaymentSessionManager__sendSessionStateToObservers___block_invoke;
  v11[3] = &unk_2644D4860;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [(NPKObserverManager *)observersManager enumerateObserversUsingBlock:v11];
}

uint64_t __68__NPKContactlessPaymentSessionManager__sendSessionStateToObservers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contactlessPaymentSessionManager:*(void *)(a1 + 32) didChangeSessionState:*(void *)(a1 + 40)];
}

- (id)_sessionStateForTransactionContext:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Getting session state for transaction completion", buf, 2u);
    }
  }
  id v8 = [v4 valueAddedServicePasses];
  uint64_t v9 = [v4 valueAddedServiceTransactions];
  *(void *)long long buf = 0;
  long long v21 = buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__8;
  id v24 = __Block_byref_object_dispose__8;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__NPKContactlessPaymentSessionManager__sessionStateForTransactionContext___block_invoke;
  v19[3] = &unk_2644D4798;
  v19[4] = buf;
  [v9 enumerateObjectsUsingBlock:v19];
  id v10 = [(NPKContactlessPaymentSessionManager *)self quickPaymentSession];
  uint64_t v11 = [v10 currentPass];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v4 transaction];
    if (v12 || ([v4 transitHistory], (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (*((void *)v21 + 5))
    {
      uint64_t v15 = [v8 firstObject];

      id v13 = 0;
      uint64_t v11 = (void *)v15;
      if (!v4) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  if (*((void *)v21 + 5))
  {
    id v13 = [v8 firstObject];
    if (!v4)
    {
LABEL_17:
      id v14 = 0;
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v13 = 0;
    if (!v4) {
      goto LABEL_17;
    }
  }
LABEL_13:
  id v14 = [(NPKContactlessPaymentSessionManager *)self _managerContextForContactlessInterfaceTransactionContext:v4];
  [v14 setValueAddedServicePass:v13];
  if (v9)
  {
LABEL_18:
    uint64_t v16 = [v4 transaction];
    [(NPKContactlessPaymentSessionManager *)self _handleValueAddedServiceTransactions:v9 forValueAddedServicePasses:v8 paymentTransaction:v16 outUserInterventionRequiredPasses:0];
  }
LABEL_19:
  uint64_t v17 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v17 setCurrentPass:v11];
  [v17 setSessionAuthorized:0];
  [v17 setDoublePressReceived:0];
  [v17 setContactlessInterfaceReady:0];
  [v17 setCanChangePass:1];
  [v17 setTransactionContext:v14];

  _Block_object_dispose(buf, 8);
  return v17;
}

void __74__NPKContactlessPaymentSessionManager__sessionStateForTransactionContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 didSucceed])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_sessionStateForExpressTransactionStatus:(unint64_t)a3 pass:(id)a4 paymentApplication:(id)a5 concreteTransactions:(id)a6 ephemeralTransaction:(id)a7 mutatedBalances:(id)a8 appletState:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  long long v21 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v21 setCurrentPass:v15];
  [v21 setSessionAuthorized:1];
  [v21 setDoublePressReceived:1];
  [v21 setContactlessInterfaceReady:0];
  [v21 setCanChangePass:1];
  [v21 setExpressTransactionStatus:a3];
  if (a3 == 1)
  {
    [v21 setCanChangePass:0];
  }
  else
  {
    BOOL IsComplete = NPKExpressTransactionStatusIsComplete(a3);
    if (a3 == 3 || IsComplete)
    {
      long long v23 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
      [(NPKContactlessPaymentSessionManagerTransactionContext *)v23 setTransactionPass:v15];
      if (NPKIsTruthOnCard(v15))
      {
        [v15 paymentPass];
        id v24 = v27 = v17;
        id v25 = [(NPKContactlessPaymentSessionManager *)self _updatedPassItemFieldWithPaymentPass:v24 transitAppletBalances:v19 appletState:v20 paymentApplication:v16];

        id v17 = v27;
        [(NPKContactlessPaymentSessionManagerTransactionContext *)v23 updateWithConcreteTransactions:v27 ephemeralTransaction:v18 updatedPassTransitItems:v25 paymentApplication:v16];
        [(NPKContactlessPaymentSessionManagerTransactionContext *)v23 forceToTransitTypeTransactionWithTransactionStatus:a3];
      }
      [v21 setTransactionContext:v23];
      [v21 setCompletionReason:3];
    }
    else if (a3 == 2)
    {
      [v21 setCompletionReason:5];
      [v21 setFailureType:2];
    }
  }

  return v21;
}

- (void)_startSessionTimerWithReason:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = pk_ui_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_ui_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"authTokenInUse";
      if (!a3) {
        id v8 = @"sessionCreated";
      }
      uint64_t v9 = v8;
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Starting contactless session timer for reason: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  sessionTimer = self->_sessionTimer;
  if (a3) {
    int64_t v11 = 60000000000;
  }
  else {
    int64_t v11 = 5000000000;
  }
  dispatch_time_t v12 = dispatch_time(0, v11);
  dispatch_source_set_timer(sessionTimer, v12, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_stopSessionTimer
{
  id v3 = pk_ui_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_ui_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Stopping contactless session timer", v6, 2u);
    }
  }
  dispatch_source_set_timer((dispatch_source_t)self->_sessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_handleSessionTimerFired
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = pk_ui_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_ui_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL contactlessPaymentInterfaceVisible = self->_contactlessPaymentInterfaceVisible;
      v8[0] = 67109120;
      v8[1] = contactlessPaymentInterfaceVisible;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: contactless session timer fired with visibility %d", (uint8_t *)v8, 8u);
    }
  }
  if (self->_quickPaymentSession) {
    [(NPKContactlessPaymentSessionManager *)self handleEndSessionRequestedForReason:2];
  }
  id v7 = [(NPKContactlessPaymentSessionManager *)self barcodePaymentSession];

  if (v7) {
    [(NPKContactlessPaymentSessionManager *)self _cleanupBarcodePaymentSession];
  }
}

- (void)_handleServiceModeRequestEnded
{
  id v2 = (const char *)[@"NPKEndedServiceModeRequestDarwinNotification" UTF8String];
  notify_post(v2);
}

- (void)_registerForServiceModeRequestNotification
{
  objc_initWeak(&location, self);
  id v3 = (const char *)[@"NPKCancelledServiceModeRequestDarwinNotification" UTF8String];
  BOOL v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__NPKContactlessPaymentSessionManager__registerForServiceModeRequestNotification__block_invoke;
  v6[3] = &unk_2644D2870;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_serviceModeRequestNotifyToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __81__NPKContactlessPaymentSessionManager__registerForServiceModeRequestNotification__block_invoke(uint64_t a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Got cancel service mode requests notification", (uint8_t *)v9, 2u);
    }
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained[2] serviceModeRequestedPass];

    if (v7)
    {
      id v8 = [v6 _baseSessionStateForUpdate];
      [v8 setServiceModeRequestedPass:0];
      [v6 _sendSessionStateToObservers:v8];
    }
  }
}

- (BOOL)_canHandleRKEActionForTileItem:(id)a3 pass:(id)a4 outAction:(id *)a5 outFunction:(id *)a6 outError:(id *)a7
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v50 = 0;
  int64_t v11 = [(id)PKGetClassNFDigitalCarKeySession() getVehicleReports:&v50];
  id v12 = v50;
  int v13 = [v10 secureElementPass];
  id v14 = [v13 devicePrimaryPaymentApplication];

  uint64_t v15 = [v14 subcredentials];
  id v16 = [v15 anyObject];
  id v17 = [v16 identifier];

  id v18 = [v11 objectForKeyedSubscript:v17];
  long long v45 = v11;
  long long v43 = v14;
  if (!v18 || v12)
  {
    id v31 = pk_Payment_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

    if (!v32)
    {
      id v25 = 0;
      id v30 = 0;
      id v34 = a6;
      goto LABEL_23;
    }
    id v20 = pk_Payment_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v33 = [v10 uniqueID];
      *(_DWORD *)long long buf = 138413058;
      id v52 = v18;
      __int16 v53 = 2112;
      uint64_t v54 = v33;
      __int16 v55 = 2112;
      id v56 = v17;
      __int16 v57 = 2112;
      id v58 = v12;
      _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Failed to obtain vehicle report (%@) for pass: %@ with subcredential identifier: %@! Error: %@", buf, 0x2Au);
    }
    id v25 = 0;
    id v30 = 0;
  }
  else
  {
    id v41 = a7;
    id v19 = [v9 action];
    id v20 = [v19 vehicleFunctionActions];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v21 = [v9 tile];
    uint64_t v22 = [v21 metadata];
    long long v23 = [v22 metadataTypeVehicleFunction];
    id v24 = [v23 vehicleFunctions];

    id v25 = (id)[v24 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (v25)
    {
      id v39 = v10;
      id v40 = v9;
      uint64_t v26 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v24);
          }
          id v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v18 isRKEFunctionSupported:v28])
          {
            uint64_t v29 = [v20 objectForKeyedSubscript:v28];
            if (v29)
            {
              id v30 = (void *)v29;
              id v25 = v28;
              goto LABEL_18;
            }
          }
        }
        id v25 = (id)[v24 countByEnumeratingWithState:&v46 objects:v59 count:16];
        if (v25) {
          continue;
        }
        break;
      }
      id v30 = 0;
LABEL_18:
      id v10 = v39;
      id v9 = v40;
    }
    else
    {
      id v30 = 0;
    }

    a7 = v41;
  }
  id v34 = a6;

LABEL_23:
  if (a5) {
    *a5 = v30;
  }
  if (v34) {
    *id v34 = v25;
  }
  if (a7) {
    *a7 = v12;
  }
  if (v12) {
    BOOL v35 = 1;
  }
  else {
    BOOL v35 = v30 == 0;
  }
  BOOL v37 = !v35 && v25 != 0;

  return v37;
}

- (void)_handleRKEActionRequestedForPass:(id)a3 action:(id)a4 function:(id)a5 withSession:(id)a6 completion:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke;
  v33[3] = &unk_2644D4888;
  id v17 = v12;
  id v34 = v17;
  id v18 = v13;
  id v35 = v18;
  id v19 = v14;
  id v36 = v19;
  id v20 = v15;
  id v37 = v20;
  id v38 = self;
  id v21 = v16;
  id v39 = v21;
  uint64_t v22 = (void (**)(void, void, void))MEMORY[0x223C37380](v33);
  if (v17 && v18 && v19)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_559;
    v27[3] = &unk_2644D48D8;
    id v28 = v17;
    id v29 = v19;
    id v30 = v18;
    id v31 = v20;
    BOOL v32 = v22;
    [v31 executeRKEActionForPass:v28 function:v29 action:v30 withCompletion:v27];
  }
  else
  {
    long long v23 = pk_Payment_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      id v25 = pk_Payment_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v17 uniqueID];
        *(_DWORD *)long long buf = 138412802;
        id v41 = v26;
        __int16 v42 = 2112;
        id v43 = v19;
        __int16 v44 = 2112;
        id v45 = v18;
        _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_ERROR, "Error: [PaymentSessionManager] Unable to handle RKE action for pass: %@ function: %@ action: %@! Invalid input.", buf, 0x20u);
      }
    }
    v22[2](v22, 0, 6);
  }
}

void __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) uniqueID];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      int v15 = 138413314;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = a3;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] Invoking RKE action completion handler for pass %@ action %@ function %@ with reason %lu for session %@", (uint8_t *)&v15, 0x34u);
    }
  }
  if (*(void *)(a1 + 56)) {
    [*(id *)(a1 + 64) _cleanupQuickPaymentSession];
  }
  id v13 = [*(id *)(a1 + 64) _sessionStateForTransactionContext:0];
  [v13 setCompletionReason:a3];
  [*(id *)(a1 + 64) _sendSessionStateToObservers:v13];
  uint64_t v14 = *(void *)(a1 + 72);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, a2);
  }
}

void __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_559(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) uniqueID];
      id v8 = (void *)v7;
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = @"NO";
      uint64_t v12 = *(void *)(a1 + 56);
      if (a2) {
        uint64_t v11 = @"YES";
      }
      *(_DWORD *)long long buf = 138413314;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: [PaymentSessionManager] RKE action execution for pass: %@ function: %@ action: %@ completed with success: %@ for session: %@", buf, 0x34u);
    }
  }
  if (a2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 5;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_566;
  block[3] = &unk_2644D48B0;
  id v14 = *(id *)(a1 + 64);
  char v18 = a2;
  id v16 = v14;
  uint64_t v17 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __111__NPKContactlessPaymentSessionManager__handleRKEActionRequestedForPass_action_function_withSession_completion___block_invoke_566(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (id)_sessionStateForPaymentBarcode:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  BOOL v6 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setTransactionPass:v6];

  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setTransactionType:4];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setTransactionStatus:0];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v5 setPaymentBarcode:v4];

  uint64_t v7 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v7 setTransactionContext:v5];

  return v7;
}

- (id)_sessionStateForBarcodeTransactionStatus:(unint64_t)a3 paymentBarcode:(id)a4 transaction:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_alloc_init(NPKContactlessPaymentSessionManagerTransactionContext);
  uint64_t v11 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setTransactionPass:v11];

  [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setTransactionType:4];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setPaymentBarcode:v9];

  [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setPaymentTransaction:v8];
  uint64_t v12 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  [v12 setTransactionContext:v10];
  switch(a3)
  {
    case 0uLL:
      uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self lastSessionState];
      id v14 = [v13 transactionContext];
      uint64_t v15 = [v14 transactionStatus];

      if (v15 == 1) {
        goto LABEL_5;
      }
      id v16 = v10;
      uint64_t v17 = 0;
      goto LABEL_6;
    case 1uLL:
      [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setAuthenticationRequested:1];
LABEL_5:
      id v16 = v10;
      uint64_t v17 = 1;
LABEL_6:
      [(NPKContactlessPaymentSessionManagerTransactionContext *)v16 setTransactionStatus:v17];
      goto LABEL_14;
    case 2uLL:
      [v12 setCompletionReason:6];
      char v18 = v12;
      uint64_t v19 = 7;
      goto LABEL_11;
    case 3uLL:
      [v12 setCompletionReason:5];
      char v18 = v12;
      uint64_t v19 = 2;
      goto LABEL_11;
    case 4uLL:
      [v12 setCompletionReason:3];
      goto LABEL_12;
    case 5uLL:
      [v12 setCompletionReason:2];
      char v18 = v12;
      uint64_t v19 = 6;
LABEL_11:
      [v18 setFailureType:v19];
LABEL_12:
      [(NPKContactlessPaymentSessionManagerTransactionContext *)v10 setTransactionStatus:2];
      break;
    default:
      break;
  }
  uint64_t v20 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [v12 setCurrentPass:v20];

  [v12 setDoublePressReceived:0];
  [v12 setContactlessInterfaceReady:0];
  [v12 setCanChangePass:1];
LABEL_14:

  return v12;
}

- (id)_sessionStateForUserCanceledBarcodeTransaction
{
  BOOL v3 = [(NPKContactlessPaymentSessionManager *)self _baseSessionStateForUpdate];
  id v4 = [(NPKContactlessPaymentSessionManager *)self userSelectedPass];
  [v3 setCurrentPass:v4];

  [v3 setDoublePressReceived:0];
  [v3 setContactlessInterfaceReady:0];
  [v3 setCanChangePass:1];
  [v3 setCompletionReason:6];
  [v3 setFailureType:7];
  return v3;
}

- (id)_paymentBalancesFromTransitAppletBalances:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__NPKContactlessPaymentSessionManager__paymentBalancesFromTransitAppletBalances___block_invoke;
  v7[3] = &unk_2644D4900;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __81__NPKContactlessPaymentSessionManager__paymentBalancesFromTransitAppletBalances___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(MEMORY[0x263F5BFB8], "NPK_paymentBalanceWithAppletBalance:", a2);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (id)_updatedPassItemFieldWithPaymentPass:(id)a3 transitAppletBalances:(id)a4 appletState:(id)a5 paymentApplication:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(NPKContactlessPaymentSessionManager *)self _paymentBalancesFromTransitAppletBalances:a4];
  id v14 = [v11 transitPassPropertiesWithPaymentApplication:v10 pass:v12];

  uint64_t v15 = [[NPKPassAssociatedInfoModel alloc] initWithPass:v12 transitProperties:v14 balances:v13 commutePlanValueRequired:1];
  id v16 = [(NPKPassAssociatedInfoModel *)v15 allPassItemsFields];

  return v16;
}

- (NPKContactlessPaymentSessionState)lastSessionState
{
  return self->_lastSessionState;
}

- (void)setLastSessionState:(id)a3
{
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NPKQuickPaymentSession)quickPaymentSession
{
  return self->_quickPaymentSession;
}

- (void)setQuickPaymentSession:(id)a3
{
}

- (NPKQuickPaymentSessionCleanupDelegate)cleanupDelegate
{
  return self->_cleanupDelegate;
}

- (void)setCleanupDelegate:(id)a3
{
}

- (NPKObserverManager)observersManager
{
  return self->_observersManager;
}

- (void)setObserversManager:(id)a3
{
}

- (PKPass)userSelectedPass
{
  return self->_userSelectedPass;
}

- (void)setUserSelectedPass:(id)a3
{
}

- (BOOL)contactlessPaymentInterfaceVisible
{
  return self->_contactlessPaymentInterfaceVisible;
}

- (void)setContactlessPaymentInterfaceVisible:(BOOL)a3
{
  self->_BOOL contactlessPaymentInterfaceVisible = a3;
}

- (OS_dispatch_source)sessionTimer
{
  return self->_sessionTimer;
}

- (void)setSessionTimer:(id)a3
{
}

- (int)serviceModeRequestNotifyToken
{
  return self->_serviceModeRequestNotifyToken;
}

- (void)setServiceModeRequestNotifyToken:(int)a3
{
  self->_serviceModeRequestNotifyToken = a3;
}

- (NPKBarcodePaymentSession)barcodePaymentSession
{
  return self->_barcodePaymentSession;
}

- (void)setBarcodePaymentSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodePaymentSession, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_userSelectedPass, 0);
  objc_storeStrong((id *)&self->_observersManager, 0);
  objc_storeStrong((id *)&self->_cleanupDelegate, 0);
  objc_storeStrong((id *)&self->_quickPaymentSession, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_lastSessionState, 0);
}

@end