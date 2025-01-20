@interface NPKBarcodePaymentSession
- (BOOL)sessionStarted;
- (BOOL)submittingAuthenticationResult;
- (NPKBarcodePaymentSession)initWithPaymentPass:(id)a3 authorizationCredential:(id)a4;
- (NPKBarcodePaymentSessionDelegate)delegate;
- (NPKPaymentBarcode)currentPaymentBarcode;
- (NSData)authorizationCredential;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_source)sessionTimeoutTimer;
- (PKAssertion)expressTransactionSuppressionAssertion;
- (PKAssertion)notificationSuppressionAssertion;
- (PKPaymentPass)paymentPass;
- (PKPaymentService)paymentService;
- (PKPaymentTransaction)currentTransaction;
- (unint64_t)currentTransactionStatus;
- (void)_acquireExpressTransactionSuppressAssertion;
- (void)_acquireNotificationSuppressionAssertion;
- (void)_completedAuthenticationForTransaction:(id)a3;
- (void)_extendSessionTimeoutTimer;
- (void)_fetchDecryptedBarcodeWithCredential:(id)a3;
- (void)_handleSessionTimeout;
- (void)_handleUpdatedPaymentTransaction:(id)a3;
- (void)_handleUpdatedTransactionStatus:(unint64_t)a3;
- (void)_insertPaymentTransactionForActiveBarcode;
- (void)_invokeExtensionToCollectPaymentInformation;
- (void)_processedAuthenticationMechanismForTransaction:(id)a3;
- (void)_releaseExpressTransactionSuppressionAssertion;
- (void)_releaseNotificationSuppressionAssertion;
- (void)_startSessionTimeoutTimer;
- (void)_stopSessionTimeoutTimer;
- (void)_updateCurrentPaymentBarcodeWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5;
- (void)_updateCurrentTransactionStatus:(unint64_t)a3 transaction:(id)a4;
- (void)invalidateSession;
- (void)retryFetchingBarcode;
- (void)setAuthorizationCredential:(id)a3;
- (void)setCurrentPaymentBarcode:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setCurrentTransactionStatus:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressTransactionSuppressionAssertion:(id)a3;
- (void)setNotificationSuppressionAssertion:(id)a3;
- (void)setPaymentService:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSessionStarted:(BOOL)a3;
- (void)setSessionTimeoutTimer:(id)a3;
- (void)setSubmittingAuthenticationResult:(BOOL)a3;
- (void)startSession;
- (void)submitPinCode:(id)a3;
- (void)submitUserIntentionConfirmation:(BOOL)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
@end

@implementation NPKBarcodePaymentSession

- (NPKBarcodePaymentSession)initWithPaymentPass:(id)a3 authorizationCredential:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKBarcodePaymentSession;
  v9 = [(NPKBarcodePaymentSession *)&v18 init];
  if (v9)
  {
    v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v7 uniqueID];
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] New barcode session created for pass: %@", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v9->_authorizationCredential, a4);
    v9->_currentTransactionStatus = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.NanoPassKit.BarcodePaymentSession", v14);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v15;
  }
  return v9;
}

- (void)startSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session started!", (uint8_t *)&v8, 0xCu);
    }
  }
  [(NPKBarcodePaymentSession *)self setSessionStarted:1];
  v6 = (void *)[objc_alloc(MEMORY[0x263F5C0A8]) initWithDelegate:self];
  [(NPKBarcodePaymentSession *)self setPaymentService:v6];

  [(NPKBarcodePaymentSession *)self _startSessionTimeoutTimer];
  [(NPKBarcodePaymentSession *)self _updateCurrentPaymentBarcodeWithBarcodeIdentifier:0 decryptedBarcodeCredential:0 error:0];
  id v7 = [(NPKBarcodePaymentSession *)self authorizationCredential];
  [(NPKBarcodePaymentSession *)self _fetchDecryptedBarcodeWithCredential:v7];

  [(NPKBarcodePaymentSession *)self _acquireNotificationSuppressionAssertion];
  [(NPKBarcodePaymentSession *)self _acquireExpressTransactionSuppressAssertion];
}

- (void)retryFetchingBarcode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session retried!", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NPKBarcodePaymentSession *)self _extendSessionTimeoutTimer];
  [(NPKBarcodePaymentSession *)self _updateCurrentPaymentBarcodeWithBarcodeIdentifier:0 decryptedBarcodeCredential:0 error:0];
  v6 = [(NPKBarcodePaymentSession *)self authorizationCredential];
  [(NPKBarcodePaymentSession *)self _fetchDecryptedBarcodeWithCredential:v6];
}

- (void)invalidateSession
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] %@ session invalidated!", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NPKBarcodePaymentSession *)self setSessionStarted:0];
  v6 = [(NPKBarcodePaymentSession *)self paymentService];
  [v6 setDelegate:0];

  [(NPKBarcodePaymentSession *)self setPaymentService:0];
  [(NPKBarcodePaymentSession *)self _stopSessionTimeoutTimer];
  [(NPKBarcodePaymentSession *)self _releaseNotificationSuppressionAssertion];
  [(NPKBarcodePaymentSession *)self _releaseExpressTransactionSuppressionAssertion];
}

- (void)submitUserIntentionConfirmation:(BOOL)a3
{
  if (a3)
  {
    [(NPKBarcodePaymentSession *)self setSubmittingAuthenticationResult:1];
    BOOL v4 = [(NPKBarcodePaymentSession *)self paymentService];
    v5 = [(NPKBarcodePaymentSession *)self currentTransaction];
    v6 = [v5 identifier];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke;
    v8[3] = &unk_2644D8D28;
    v8[4] = self;
    [v4 submitUserConfirmation:1 forTransactionIdentifier:v6 completion:v8];

    [(NPKBarcodePaymentSession *)self _extendSessionTimeoutTimer];
  }
  else
  {
    int v7 = [(NPKBarcodePaymentSession *)self currentTransaction];
    [(NPKBarcodePaymentSession *)self _completedAuthenticationForTransaction:v7];

    [(NPKBarcodePaymentSession *)self _handleUpdatedTransactionStatus:2];
  }
}

void __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke_2;
  block[3] = &unk_2644D31B0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__NPKBarcodePaymentSession_submitUserIntentionConfirmation___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      [v5 transactionStatus];
      id v6 = PKPaymentTransactionStatusToString();
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ user intention confirmation step up result: %@, error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [*(id *)(a1 + 48) _handleUpdatedPaymentTransaction:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 48) setSubmittingAuthenticationResult:0];
}

- (void)submitPinCode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NPKBarcodePaymentSession *)self setSubmittingAuthenticationResult:1];
    id v5 = [(NPKBarcodePaymentSession *)self paymentPass];
    id v6 = [v5 uniqueID];

    uint64_t v7 = [(NPKBarcodePaymentSession *)self currentTransaction];
    id v8 = [(NPKBarcodePaymentSession *)self paymentService];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke;
    uint64_t v15 = &unk_2644D8D50;
    id v16 = v4;
    id v17 = v7;
    id v18 = v6;
    v19 = self;
    id v9 = v6;
    id v10 = v7;
    [v8 retrievePINEncryptionCertificateForPassUniqueIdentifier:v9 withCompletion:&v12];

    [(NPKBarcodePaymentSession *)self _extendSessionTimeoutTimer];
  }
  else
  {
    __int16 v11 = [(NPKBarcodePaymentSession *)self currentTransaction];
    [(NPKBarcodePaymentSession *)self _completedAuthenticationForTransaction:v11];

    [(NPKBarcodePaymentSession *)self _handleUpdatedTransactionStatus:2];
  }
}

void __42__NPKBarcodePaymentSession_submitPinCode___block_invoke(id *a1)
{
  uint64_t v13 = 0;
  v2 = PKEncryptTransactionAuthenticationPasscode();
  id v3 = 0;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2;
    block[3] = &unk_2644D31B0;
    id v10 = a1[6];
    id v4 = v3;
    id v5 = a1[7];
    id v11 = v4;
    id v12 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v6 = [a1[7] paymentService];
    uint64_t v7 = [a1[5] identifier];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_49;
    v8[3] = &unk_2644D8D28;
    v8[4] = a1[7];
    [v6 submitEncryptedPIN:v2 forTransactionIdentifier:v7 completion:v8];
  }
}

uint64_t __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Failed to encrypt PIN for pass %@ with error %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = [v7 currentTransaction];
  [v7 _completedAuthenticationForTransaction:v8];

  [*(id *)(a1 + 48) _handleUpdatedTransactionStatus:3];
  return [*(id *)(a1 + 48) setSubmittingAuthenticationResult:0];
}

void __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2_50;
  block[3] = &unk_2644D31B0;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__NPKBarcodePaymentSession_submitPinCode___block_invoke_2_50(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      [v5 transactionStatus];
      id v6 = PKPaymentTransactionStatusToString();
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ pin step up result: %@, error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [*(id *)(a1 + 48) _handleUpdatedPaymentTransaction:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 48) setSubmittingAuthenticationResult:0];
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__NPKBarcodePaymentSession_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __78__NPKBarcodePaymentSession_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) submittingAuthenticationResult])
  {
    v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v12 = 138412290;
        uint64_t v13 = v5;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Ignoring transaction update while submitting authentication result. %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) barcodeIdentifier];
    uint64_t v7 = [*(id *)(a1 + 32) currentPaymentBarcode];
    id v8 = [v7 barcodeIdentifier];
    int v9 = [v6 isEqualToString:v8];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      [v10 _handleUpdatedPaymentTransaction:v11];
    }
  }
}

- (void)_fetchDecryptedBarcodeWithCredential:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Start fetching decrypted barcode with credential: %@", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(NPKBarcodePaymentSession *)self paymentService];
  int v9 = [(NPKBarcodePaymentSession *)self paymentPass];
  id v10 = [v9 uniqueID];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke;
  v11[3] = &unk_2644D8DA0;
  objc_copyWeak(&v12, (id *)buf);
  [v8 retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:v10 authorization:v4 withCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F5BD40];
  uint64_t v11 = *MEMORY[0x263F5C4C8];
  v27[0] = *MEMORY[0x263F5C4A8];
  v27[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  uint64_t v13 = *MEMORY[0x263F5C378];
  v26[0] = *MEMORY[0x263F5C3B0];
  uint64_t v14 = *MEMORY[0x263F5C328];
  v25[0] = v13;
  v25[1] = v14;
  uint64_t v15 = PKAnalyticsReportBarcodeCredentialRetrivalStatusFromError();
  v26[1] = v15;
  id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v10 subjects:v12 sendEvent:v16];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke_2;
  block[3] = &unk_2644D8D78;
  id v21 = v9;
  id v22 = v7;
  id v17 = v7;
  id v18 = v9;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  id v23 = v8;
  id v19 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v24);
}

void __65__NPKBarcodePaymentSession__fetchDecryptedBarcodeWithCredential___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = pk_Payment_log();
  id v4 = v3;
  if (v2)
  {
    BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (!v5) {
      goto LABEL_10;
    }
    BOOL v6 = pk_Payment_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v7;
    id v8 = "Error: [BarcodePayment] Failed to fetch barcode due to: %@";
    id v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  BOOL v11 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (!v11) {
    goto LABEL_10;
  }
  BOOL v6 = pk_Payment_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v15 = 138412290;
    uint64_t v16 = v12;
    id v8 = "Notice: [BarcodePayment] Fetched barcode with identifier: %@";
    id v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v15, 0xCu);
  }
LABEL_9:

LABEL_10:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v14 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateCurrentPaymentBarcodeWithBarcodeIdentifier:*(void *)(a1 + 40) decryptedBarcodeCredential:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
}

- (void)_invokeExtensionToCollectPaymentInformation
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NPKBarcodePaymentSession *)self paymentPass];
  id v4 = [v3 uniqueID];

  BOOL v5 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
  BOOL v6 = [v5 barcodeIdentifier];

  uint64_t v7 = [(NPKBarcodePaymentSession *)self paymentPass];
  id v8 = [v7 deviceAccountIdentifier];

  id v9 = [(NPKBarcodePaymentSession *)self paymentPass];
  os_log_type_t v10 = [v9 associatedApplicationIdentifiers];

  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Starting to collect payment information for pass %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v14 = NPKMyPid();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__25;
  v53 = __Block_byref_object_dispose__25;
  id v15 = objc_alloc(MEMORY[0x263F28180]);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke;
  v48[3] = &__block_descriptor_36_e8_v12__0B8l;
  int v49 = v14;
  id v54 = (id)[v15 initWithPID:v14 flags:1 reason:4 name:@"Submit Barcode Payment Event" withHandler:v48];
  [*(id *)(*((void *)&buf + 1) + 40) setInvalidationHandler:&__block_literal_global_36];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_62;
  v47[3] = &unk_2644D30F8;
  v47[4] = &buf;
  uint64_t v16 = (void *)MEMORY[0x223C37380](v47);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  uint64_t v17 = [(NPKBarcodePaymentSession *)self paymentService];
  objc_initWeak(&location, v17);

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2;
  v38[3] = &unk_2644D8DE8;
  v42 = v45;
  id v18 = v8;
  id v39 = v18;
  id v19 = v6;
  id v40 = v19;
  id v20 = v4;
  id v41 = v20;
  objc_copyWeak(&v43, &location);
  id v21 = (void *)MEMORY[0x223C37380](v38);
  id v22 = [MEMORY[0x263F5BE70] providerForExtensionPoint:*MEMORY[0x263F5C590]];
  id v23 = [v10 allObjects];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_67;
  v30[3] = &unk_2644D8ED8;
  id v24 = v20;
  id v31 = v24;
  v32 = self;
  id v25 = v21;
  id v36 = v25;
  id v26 = v16;
  id v37 = v26;
  id v27 = v19;
  id v33 = v27;
  id v28 = v18;
  id v34 = v28;
  id v29 = v10;
  id v35 = v29;
  [v22 extensionsWithContainingApplicationIdentifiers:v23 completion:v30];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&buf, 8);
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (a2)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6) {
      return;
    }
    uint64_t v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v8 = *(_DWORD *)(a1 + 32);
    int v14 = 67109120;
    int v15 = v8;
    id v9 = "Notice: [BarcodePayment] Acquired process assertion for barcode payment event for %d.";
    os_log_type_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (!v12) {
    return;
  }
  uint64_t v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = *(_DWORD *)(a1 + 32);
    int v14 = 67109120;
    int v15 = v13;
    id v9 = "Error: [BarcodePayment] Failed to acquire process assertion for barcode payment event: %d.";
    os_log_type_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v10, v11, v9, (uint8_t *)&v14, 8u);
  }
LABEL_9:
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_61()
{
  v0 = pk_Payment_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);

  if (v1)
  {
    uint64_t v2 = pk_Payment_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl(&dword_21E92F000, v2, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Invalidated process assertion for barcode payment event.", v3, 2u);
    }
  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_62(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  v35[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  BOOL v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    BOOL v12 = [v5 paymentInformation];

    int v13 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionLocalExtensionSucceeded;
    if (!a3) {
      int v13 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionRemoteExtensionSucceeded;
    }
    int v14 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionLocalExtensionFailed;
    if (!a3) {
      int v14 = NPKAnalyticsReportEventTypeBarcodePaymentTransactionRemoteExtensionFailed;
    }
    if (!v12) {
      int v13 = v14;
    }
    os_log_type_t v10 = *v13;
    int v15 = (void *)MEMORY[0x263F5BD40];
    uint64_t v16 = *MEMORY[0x263F5C4C8];
    v35[0] = *MEMORY[0x263F5C4A8];
    v35[1] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    uint64_t v33 = *MEMORY[0x263F5C378];
    id v34 = v10;
    id v18 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v15 subjects:v17 sendEvent:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F5BDD0]);
    [v19 setEventType:1];
    id v20 = [MEMORY[0x263EFF910] date];
    [v19 setTimestamp:v20];

    id v21 = [v6 paymentInformation];
    [v19 setEventMetadata:v21];

    [v19 setDeviceAccountIdentifier:*(void *)(a1 + 32)];
    [v19 setBarcodeIdentifier:*(void *)(a1 + 40)];
    [v19 setAuthenticationType:1];
    id v22 = pk_Payment_log();
    LODWORD(v18) = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      id v23 = pk_Payment_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 48);
        int v29 = 138412546;
        id v30 = v19;
        __int16 v31 = 2112;
        uint64_t v32 = v24;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Submitting barcodePaymentEvent %@ for %@", (uint8_t *)&v29, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v26 = WeakRetained;
    if (WeakRetained) {
      id v27 = WeakRetained;
    }
    else {
      id v27 = objc_alloc_init(MEMORY[0x263F5C0A8]);
    }
    id v28 = v27;

    [v28 submitBarcodePaymentEvent:v19 forPassUniqueIdentifier:*(void *)(a1 + 48) withCompletion:0];
    goto LABEL_19;
  }
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    os_log_type_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v11 = *(void **)(a1 + 48);
      int v29 = 138412290;
      id v30 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] BarcodePaymentEvent already submitted for %@. Skipping.", (uint8_t *)&v29, 0xCu);
    }
LABEL_19:
  }
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  v56[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v5 count];
  }
  int v8 = (void *)MEMORY[0x263F5BD40];
  uint64_t v9 = *MEMORY[0x263F5C4C8];
  v56[0] = *MEMORY[0x263F5C4A8];
  v56[1] = v9;
  os_log_type_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  uint64_t v11 = *MEMORY[0x263F5C3D0];
  uint64_t v12 = *MEMORY[0x263F5C418];
  v54[0] = *MEMORY[0x263F5C378];
  v54[1] = v12;
  uint64_t v13 = *MEMORY[0x263F5C590];
  v55[0] = v11;
  v55[1] = v13;
  v54[2] = *MEMORY[0x263F5C440];
  int v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
  v55[2] = v14;
  int v15 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];
  [v8 subjects:v10 sendEvent:v15];

  if ([v5 count])
  {
    uint64_t v16 = [v5 firstObject];
    uint64_t v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      id v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Local extension %@ is now collecting payment information for pass %@", buf, 0x16u);
      }
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__25;
    v52 = __Block_byref_object_dispose__25;
    id v53 = 0;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_72;
    v42[3] = &unk_2644D8E60;
    v42[4] = *(void *)(a1 + 40);
    id v21 = v16;
    id v43 = v21;
    id v44 = *(id *)(a1 + 32);
    id v47 = *(id *)(a1 + 72);
    id v48 = *(id *)(a1 + 80);
    int v49 = buf;
    id v45 = *(id *)(a1 + 48);
    id v46 = *(id *)(a1 + 56);
    [v21 beginExtensionRequestWithOptions:1 completion:v42];

    _Block_object_dispose(buf, 8);
    goto LABEL_23;
  }
  id v22 = [v6 domain];
  if ([v22 isEqualToString:*MEMORY[0x263F5C630]])
  {
    BOOL v23 = [v6 code] == -1001;

    if (v23)
    {
      uint64_t v24 = pk_Payment_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        id v26 = pk_Payment_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Extension doesn't exist locally. Invoking remote extension on paired device.", buf, 2u);
        }
      }
      id v27 = (void *)[objc_alloc(MEMORY[0x263F5BDC8]) initWithBarcodeIdentifier:*(void *)(a1 + 48) deviceAccountIdentifier:*(void *)(a1 + 56)];
      id v28 = objc_alloc_init(NPKNanoPassDaemonConnection);
      uint64_t v29 = *(void *)(a1 + 64);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_85;
      v39[3] = &unk_2644D8EB0;
      v39[4] = *(void *)(a1 + 40);
      id v40 = *(id *)(a1 + 72);
      id v41 = *(id *)(a1 + 80);
      [(NPKNanoPassDaemonConnection *)v28 handleMetadataRequestOnPairedDevice:v27 withAssociatedApplicationIdentifiers:v29 completion:v39];
      dispatch_time_t v30 = dispatch_time(0, 0x37E11D800);
      __int16 v31 = [*(id *)(a1 + 40) serialQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_88;
      block[3] = &unk_2644D6100;
      id v37 = *(id *)(a1 + 72);
      id v38 = *(id *)(a1 + 80);
      dispatch_after(v30, v31, block);

      goto LABEL_23;
    }
  }
  else
  {
  }
  uint64_t v32 = pk_Payment_log();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

  if (v33)
  {
    id v34 = pk_Payment_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_21E92F000, v34, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Failed to begin payment information event extension for pass %@ with error %@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_23:
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 isInvalidated] & 1) == 0)
  {
    id v5 = [v4 extensionContext];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v8 = (void *)MEMORY[0x263F00A48];
        uint64_t v9 = [*(id *)(a1 + 40) identifier];
        uint64_t v10 = [v8 newAssertionForBundleIdentifier:v9 withReason:@"Barcode Event Metadata"];
        uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F5BDC8]) initWithBarcodeIdentifier:*(void *)(a1 + 56) deviceAccountIdentifier:*(void *)(a1 + 64)];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_80;
        v15[3] = &unk_2644D8E38;
        v15[4] = *(void *)(a1 + 32);
        id v13 = *(id *)(a1 + 72);
        uint64_t v14 = *(void *)(a1 + 88);
        id v17 = v13;
        uint64_t v19 = v14;
        id v16 = v4;
        id v18 = *(id *)(a1 + 80);
        [v5 handleInformationRequest:v7 completion:v15];

        goto LABEL_5;
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_74;
  block[3] = &unk_2644D81B8;
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 80);
  dispatch_async(v6, block);

  uint64_t v7 = v21;
LABEL_5:
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_74(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Local extension %@ for pass %@ failed to collect payment information", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_81;
  block[3] = &unk_2644D8E10;
  id v5 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  id v6 = v3;
  dispatch_async(v4, block);

  [*(id *)(a1 + 40) invalidate];
  uint64_t v7 = [*(id *)(a1 + 32) serialQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_3;
  v8[3] = &unk_2644D2B10;
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v7, v8);
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_81(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v2 invalidate];
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_85(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] serialQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_86;
  v11[3] = &unk_2644D8E88;
  id v12 = v6;
  id v8 = a1[5];
  id v13 = v5;
  id v14 = v8;
  id v15 = a1[6];
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_2_86(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    uint64_t v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = a1[4];
        int v8 = 138412290;
        uint64_t v9 = v5;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Remote extension failed with error: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __71__NPKBarcodePaymentSession__invokeExtensionToCollectPaymentInformation__block_invoke_88(uint64_t a1)
{
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Remote extension timed out.", v6, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCurrentPaymentBarcodeWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [[NPKPaymentBarcode alloc] initWithBarcodeIdentifier:v10 decryptedBarcodeCredential:v9 error:v8];

  id v12 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
  LOBYTE(v8) = [v12 isEqual:v11];

  id v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v14)
    {
      id v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Barcode state didn't change.", (uint8_t *)&v22, 2u);
      }
    }
  }
  else
  {
    if (v14)
    {
      id v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
        int v22 = 138412546;
        id v23 = v17;
        __int16 v24 = 2112;
        BOOL v25 = v11;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Updating barcode state from %@ to %@", (uint8_t *)&v22, 0x16u);
      }
    }
    [(NPKBarcodePaymentSession *)self setCurrentPaymentBarcode:v11];
    id v18 = [(NPKBarcodePaymentSession *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      uint64_t v20 = [(NPKBarcodePaymentSession *)self delegate];
      id v21 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
      [v20 barcodePaymentSession:self didReceivePaymentBarcode:v21];
    }
    if ([(NPKPaymentBarcode *)v11 state] == 1)
    {
      [(NPKBarcodePaymentSession *)self _insertPaymentTransactionForActiveBarcode];
      [(NPKBarcodePaymentSession *)self _invokeExtensionToCollectPaymentInformation];
    }
  }
}

- (void)_handleUpdatedPaymentTransaction:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  switch([v4 transactionStatus])
  {
    case -1:
    case 8:
      uint64_t v5 = pk_Payment_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (!v6) {
        goto LABEL_6;
      }
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        [v4 transactionStatus];
        id v8 = PKPaymentTransactionStatusToString();
        *(_DWORD *)long long buf = 138412546;
        id v31 = v4;
        __int16 v32 = 2112;
        BOOL v33 = v8;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status %@ is not relevant. Skipping.", buf, 0x16u);
      }
      goto LABEL_5;
    case 0:
      int ShouldAuthenticateForMechanism = PKPaymentTransactionShouldAuthenticateForMechanism();
      id v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (ShouldAuthenticateForMechanism)
      {
        if (v16)
        {
          id v17 = pk_Payment_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v4 authenticationContext];
            [v18 requestedAuthenticationMechanisms];
            char v19 = PKTransactionAuthenticationMechanismToStrings();
            *(_DWORD *)long long buf = 138412546;
            id v31 = v4;
            __int16 v32 = 2112;
            BOOL v33 = v19;
            _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status is pending with authentication request %@.", buf, 0x16u);
          }
        }
        [(NPKBarcodePaymentSession *)self _processedAuthenticationMechanismForTransaction:v4];
        uint64_t v9 = 1;
      }
      else
      {
        if (v16)
        {
          uint64_t v7 = pk_Payment_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v31 = v4;
            _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] PKPaymentTransaction %@ status is pending without valid authentication context. Skipping.", buf, 0xCu);
          }
LABEL_5:
        }
LABEL_6:
        uint64_t v9 = 0;
      }
LABEL_18:
      [(NPKBarcodePaymentSession *)self _updateCurrentTransactionStatus:v9 transaction:v4];

      return;
    case 1:
      uint64_t v20 = (void *)MEMORY[0x263F5BD40];
      uint64_t v21 = *MEMORY[0x263F5C4C8];
      v29[0] = *MEMORY[0x263F5C4A8];
      v29[1] = v21;
      int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
      uint64_t v27 = *MEMORY[0x263F5C378];
      uint64_t v28 = *MEMORY[0x263F5C3B8];
      id v23 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v20 subjects:v22 sendEvent:v23];

      goto LABEL_16;
    case 2:
    case 6:
      id v10 = (void *)MEMORY[0x263F5BD40];
      uint64_t v11 = *MEMORY[0x263F5C4C8];
      v26[0] = *MEMORY[0x263F5C4A8];
      v26[1] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
      uint64_t v24 = *MEMORY[0x263F5C378];
      uint64_t v25 = *MEMORY[0x263F5C3C0];
      id v13 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      [v10 subjects:v12 sendEvent:v13];

      goto LABEL_8;
    case 3:
LABEL_16:
      uint64_t v9 = 4;
      goto LABEL_18;
    case 4:
    case 5:
LABEL_8:
      uint64_t v9 = 3;
      goto LABEL_18;
    case 7:
      uint64_t v9 = 5;
      goto LABEL_18;
    default:
      goto LABEL_6;
  }
}

- (void)_handleUpdatedTransactionStatus:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(NPKBarcodePaymentSession *)self currentTransaction];
  [(NPKBarcodePaymentSession *)self _updateCurrentTransactionStatus:a3 transaction:v5];
}

- (void)_updateCurrentTransactionStatus:(unint64_t)a3 transaction:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(NPKBarcodePaymentSession *)self currentTransactionStatus] != a3
    || ([(NPKBarcodePaymentSession *)self currentTransaction],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = PKEqualObjects(),
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134218242;
        unint64_t v19 = a3;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session status is updated to %lu with transaction %@.", (uint8_t *)&v18, 0x16u);
      }
    }
    [(NPKBarcodePaymentSession *)self setCurrentTransactionStatus:a3];
    [(NPKBarcodePaymentSession *)self setCurrentTransaction:v6];
    if (a3 == 1)
    {
      id v12 = pk_Payment_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        BOOL v14 = pk_Payment_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session timeout timer is extended because transaction authentication is requested.", (uint8_t *)&v18, 2u);
        }
      }
      [(NPKBarcodePaymentSession *)self _extendSessionTimeoutTimer];
    }
    id v15 = [(NPKBarcodePaymentSession *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(NPKBarcodePaymentSession *)self delegate];
      [v17 barcodePaymentSession:self didUpdateTransactionStatus:a3 withTransaction:v6];
    }
  }
}

- (void)_insertPaymentTransactionForActiveBarcode
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F5C0F8] paymentTransactionWithSource:1];
  [v3 setOriginatedByDevice:1];
  id v4 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
  id v5 = [v4 barcodeIdentifier];
  id v6 = PKTransactionPaymentHashForBarcodeIdentifier();
  [v3 setPaymentHash:v6];

  [v3 addUpdateReasons:0x20000];
  uint64_t v7 = [MEMORY[0x263EFF910] date];
  [v3 setTransactionDate:v7];

  char v8 = pk_Payment_log();
  LODWORD(v5) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(NPKBarcodePaymentSession *)self currentPaymentBarcode];
      uint64_t v11 = [v10 barcodeIdentifier];
      int v17 = 138412546;
      int v18 = v3;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Inserting transaction %@ for current barcode: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v12 = [(NPKBarcodePaymentSession *)self paymentService];
  BOOL v13 = [(NPKBarcodePaymentSession *)self paymentPass];
  BOOL v14 = [v13 uniqueID];
  id v15 = [(NPKBarcodePaymentSession *)self paymentPass];
  char v16 = [v15 devicePrimaryBarcodePaymentApplication];
  [v12 insertOrUpdatePaymentTransaction:v3 forPassUniqueIdentifier:v14 paymentApplication:v16 completion:0];
}

- (void)_processedAuthenticationMechanismForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authenticationContext];
  char v6 = [v5 requestedAuthenticationMechanisms];

  if ((v6 & 8) != 0)
  {
    [(NPKBarcodePaymentSession *)self _completedAuthenticationForTransaction:v4];
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = 1;
      goto LABEL_7;
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v7 = 4;
LABEL_7:
      char v8 = [(NPKBarcodePaymentSession *)self paymentService];
      uint64_t v9 = [v4 identifier];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__NPKBarcodePaymentSession__processedAuthenticationMechanismForTransaction___block_invoke;
      v10[3] = &unk_2644D3160;
      uint64_t v12 = v7;
      id v11 = v4;
      [v8 processedAuthenticationMechanism:v7 forTransactionIdentifier:v9 completion:v10];
    }
  }
}

void __76__NPKBarcodePaymentSession__processedAuthenticationMechanismForTransaction___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = PKTransactionAuthenticationMechanismToStrings();
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      char v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Marking processed %@ for transaction %@.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_completedAuthenticationForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKBarcodePaymentSession *)self paymentService];
  uint64_t v6 = [(NPKBarcodePaymentSession *)self currentTransaction];
  int v7 = [v6 identifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__NPKBarcodePaymentSession__completedAuthenticationForTransaction___block_invoke;
  v9[3] = &unk_2644D2910;
  id v10 = v4;
  id v8 = v4;
  [v5 markAuthenticationCompleteForTransactionIdentifier:v7 completion:v9];
}

void __67__NPKBarcodePaymentSession__completedAuthenticationForTransaction___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Marking completed authentication for transaction %@.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_acquireNotificationSuppressionAssertion
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x263F5BD88];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke;
  v3[3] = &unk_2644D8F00;
  objc_copyWeak(&v4, &location);
  [v2 acquireAssertionOfType:4 withReason:@"Barcode Payment" completion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_2;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v23 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session is invalid, releasing assertion %@", buf, 0xCu);
      }
    }
    goto LABEL_7;
  }
  BOOL v4 = *(void *)(a1 + 40) == 0;
  id v5 = pk_Payment_log();
  id v6 = v5;
  if (!v4)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v23 = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }
    }
LABEL_7:
    [*(id *)(a1 + 32) invalidate];
    goto LABEL_18;
  }
  BOOL v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = v16;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Acquired notification suppression assertion: %@", buf, 0xCu);
    }
  }
  int v17 = [WeakRetained notificationSuppressionAssertion];
  [v17 setInvalidationHandler:0];

  int v18 = [WeakRetained notificationSuppressionAssertion];
  [v18 invalidate];

  [WeakRetained setNotificationSuppressionAssertion:*(void *)(a1 + 32)];
  __int16 v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_100;
  v20[3] = &unk_2644D29A8;
  objc_copyWeak(&v21, v2);
  [v19 setInvalidationHandler:v20];
  objc_destroyWeak(&v21);
LABEL_18:
}

void __68__NPKBarcodePaymentSession__acquireNotificationSuppressionAssertion__block_invoke_100(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setNotificationSuppressionAssertion:0];
    id WeakRetained = v3;
  }
}

- (void)_releaseNotificationSuppressionAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NPKBarcodePaymentSession *)self notificationSuppressionAssertion];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Released notification suppression assertion: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  BOOL v7 = [(NPKBarcodePaymentSession *)self notificationSuppressionAssertion];
  [v7 invalidate];

  [(NPKBarcodePaymentSession *)self setNotificationSuppressionAssertion:0];
}

- (void)_acquireExpressTransactionSuppressAssertion
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x263F5BD88];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke;
  v3[3] = &unk_2644D8F00;
  objc_copyWeak(&v4, &location);
  [v2 acquireAssertionOfType:0 withReason:@"Barcode Payment" completion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_2;
  block[3] = &unk_2644D34F0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v23 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Session is invalid, releasing assertion %@", buf, 0xCu);
      }
    }
    goto LABEL_7;
  }
  BOOL v4 = *(void *)(a1 + 40) == 0;
  id v5 = pk_Payment_log();
  id v6 = v5;
  if (!v4)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      id v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v23 = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: [BarcodePayment] Error acquiring express transaction suppression assertion: %@", buf, 0xCu);
      }
    }
LABEL_7:
    [*(id *)(a1 + 32) invalidate];
    goto LABEL_18;
  }
  BOOL v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = v16;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Acquired express transaction suppression assertion: %@", buf, 0xCu);
    }
  }
  int v17 = [WeakRetained expressTransactionSuppressionAssertion];
  [v17 setInvalidationHandler:0];

  int v18 = [WeakRetained expressTransactionSuppressionAssertion];
  [v18 invalidate];

  [WeakRetained setExpressTransactionSuppressionAssertion:*(void *)(a1 + 32)];
  __int16 v19 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_102;
  v20[3] = &unk_2644D29A8;
  objc_copyWeak(&v21, v2);
  [v19 setInvalidationHandler:v20];
  objc_destroyWeak(&v21);
LABEL_18:
}

void __71__NPKBarcodePaymentSession__acquireExpressTransactionSuppressAssertion__block_invoke_102(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setExpressTransactionSuppressionAssertion:0];
    id WeakRetained = v3;
  }
}

- (void)_releaseExpressTransactionSuppressionAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NPKBarcodePaymentSession *)self expressTransactionSuppressionAssertion];
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: [BarcodePayment] Released express transaction suppression assertion: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  BOOL v7 = [(NPKBarcodePaymentSession *)self expressTransactionSuppressionAssertion];
  [v7 invalidate];

  [(NPKBarcodePaymentSession *)self setExpressTransactionSuppressionAssertion:0];
}

- (void)_startSessionTimeoutTimer
{
  id v3 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];

  if (!v3)
  {
    objc_initWeak(&location, self);
    BOOL v4 = dispatch_get_global_queue(21, 0);
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);
    [(NPKBarcodePaymentSession *)self setSessionTimeoutTimer:v5];

    id v6 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];
    dispatch_time_t v7 = dispatch_time(0, 0xDF8476000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    int v8 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke;
    handler[3] = &unk_2644D2BB8;
    objc_copyWeak(&v11, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    uint64_t v9 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];
    dispatch_resume(v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke_2;
    block[3] = &unk_2644D2910;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __53__NPKBarcodePaymentSession__startSessionTimeoutTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSessionTimeout];
}

- (void)_stopSessionTimeoutTimer
{
  id v3 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];

  if (v3)
  {
    BOOL v4 = [(NPKBarcodePaymentSession *)self sessionTimeoutTimer];
    dispatch_source_cancel(v4);

    [(NPKBarcodePaymentSession *)self setSessionTimeoutTimer:0];
  }
}

- (void)_extendSessionTimeoutTimer
{
  [(NPKBarcodePaymentSession *)self _stopSessionTimeoutTimer];
  [(NPKBarcodePaymentSession *)self _startSessionTimeoutTimer];
}

- (void)_handleSessionTimeout
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(NPKBarcodePaymentSession *)self _handleUpdatedTransactionStatus:5];
  [(NPKBarcodePaymentSession *)self invalidateSession];
}

- (NPKBarcodePaymentSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKBarcodePaymentSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)sessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (NPKPaymentBarcode)currentPaymentBarcode
{
  return self->_currentPaymentBarcode;
}

- (void)setCurrentPaymentBarcode:(id)a3
{
}

- (unint64_t)currentTransactionStatus
{
  return self->_currentTransactionStatus;
}

- (void)setCurrentTransactionStatus:(unint64_t)a3
{
  self->_currentTransactionStatus = a3;
}

- (PKPaymentTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (BOOL)submittingAuthenticationResult
{
  return self->_submittingAuthenticationResult;
}

- (void)setSubmittingAuthenticationResult:(BOOL)a3
{
  self->_submittingAuthenticationResult = a3;
}

- (NSData)authorizationCredential
{
  return self->_authorizationCredential;
}

- (void)setAuthorizationCredential:(id)a3
{
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (void)setPaymentService:(id)a3
{
}

- (OS_dispatch_source)sessionTimeoutTimer
{
  return self->_sessionTimeoutTimer;
}

- (void)setSessionTimeoutTimer:(id)a3
{
}

- (PKAssertion)notificationSuppressionAssertion
{
  return self->_notificationSuppressionAssertion;
}

- (void)setNotificationSuppressionAssertion:(id)a3
{
}

- (PKAssertion)expressTransactionSuppressionAssertion
{
  return self->_expressTransactionSuppressionAssertion;
}

- (void)setExpressTransactionSuppressionAssertion:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_expressTransactionSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sessionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_authorizationCredential, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_currentPaymentBarcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end