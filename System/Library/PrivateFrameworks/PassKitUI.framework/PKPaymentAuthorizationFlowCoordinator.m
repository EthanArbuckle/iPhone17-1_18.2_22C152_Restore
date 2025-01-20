@interface PKPaymentAuthorizationFlowCoordinator
- (BOOL)_canPresentPaymentSheetWithEmptyPass;
- (BOOL)_peerPaymentIdentityVerificationRequired;
- (BOOL)_shouldBlockHardwareCancels;
- (BOOL)dismissAfterPaymentSetup;
- (BOOL)handleHomeButtonPressed;
- (BOOL)supportsSecondaryViewController;
- (NSXPCConnection)hostConnection;
- (PKAsyncTaskProgressTracker)dismissalTaskProgressTracker;
- (PKInAppPaymentService)inAppPaymentService;
- (PKPaymentAuthorizationContext)context;
- (PKPaymentAuthorizationDefaultService)defaultService;
- (PKPaymentAuthorizationFlowCoordinator)initWithContext:(id)a3 scenePresenter:(id)a4 delegate:(id)a5;
- (PKPaymentAuthorizationFlowCoordinatorDelegate)delegate;
- (PKPaymentAuthorizationHostProtocol)remoteObjectProxy;
- (PKPaymentAuthorizationScenePresenter)scenePresenter;
- (PKPaymentAuthorizationServiceProxy)exportedObject;
- (PKPaymentRequest)paymentRequest;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (id)_createPaymentInterfaceConfigurationWithRelevantPassID:(id)a3;
- (id)createConnectionToEndpoint:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_canPresentPaymentRequest:(id)a3 completion:(id)a4;
- (void)_endAnalyticsReporting;
- (void)_handlePaymentRequestPresentationResultType:(int64_t)a3 relevantUniqueID:(id)a4;
- (void)_openApplication:(id)a3;
- (void)_presentActivatingPassAlertWithRelevantUniqueID:(id)a3;
- (void)_presentAddCardAlert;
- (void)_presentAlertController:(id)a3;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5 actionHandler:(id)a6;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 finalError:(id)a8;
- (void)_presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:(id)a3;
- (void)_presentEnrollAccessibilityIntentAlert;
- (void)_presentInvalidAlert;
- (void)_presentLostModeAlertWithRelevantUniqueID:(id)a3;
- (void)_presentNextStepDismissingCurrentInterface:(BOOL)a3 withDefaultPassID:(id)a4;
- (void)_presentOnboardingForContext:(int64_t)a3;
- (void)_presentPassNotSupportedAlertWithRelevantUniqueID:(id)a3;
- (void)_presentPaymentAuthorizationWithRelevantUniqueID:(id)a3;
- (void)_presentPaymentInterface:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentIdentityVerification;
- (void)_presentPeerPaymentIdentityVerificationAlert;
- (void)_presentVerifyPassAlertWithRelevantUniqueID:(id)a3;
- (void)_presentWalletUninstalledAlert;
- (void)_reportAddCardAlertPresentedAnalytics;
- (void)_reportConnectionEstablishedAnalyticsForConnection:(id)a3;
- (void)_reportPaymentPassMissingAnalytics;
- (void)_reportPaymentRequestDetails;
- (void)_reportUnsupportedPaymentPassAnalytics;
- (void)_reportVerificationRequiredAnalytics;
- (void)_startAnalyticsReporting;
- (void)_startSuppressingNotificationsIfNecessary;
- (void)_stopSuppressingNotifications;
- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3;
- (void)authorizationDidAuthorizeContext;
- (void)authorizationDidAuthorizePayment:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3;
- (void)authorizationDidAuthorizePurchase:(id)a3;
- (void)authorizationDidChangeCouponCode:(id)a3;
- (void)authorizationDidFinishWithError:(id)a3;
- (void)authorizationDidFulfillPaymentRequest:(id)a3 completion:(id)a4;
- (void)authorizationDidPresent;
- (void)authorizationDidRejectPaymentRequestPromise;
- (void)authorizationDidRequestMerchantSession;
- (void)authorizationDidSelectPaymentMethod:(id)a3;
- (void)authorizationDidSelectShippingAddress:(id)a3;
- (void)authorizationDidSelectShippingMethod:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3;
- (void)authorizationWillStart;
- (void)dealloc;
- (void)didEncounterAuthorizationEvent:(unint64_t)a3;
- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)notifyOnDismissal:(id)a3;
- (void)openConnection:(id)a3;
- (void)paymentAuthorizationOnboardingDidFinishWithError:(id)a3;
- (void)paymentAuthorizationProvisioningDidFinishWithPass:(id)a3;
- (void)peerPaymentIdentityVerificationDidFinishWithAccount:(id)a3;
- (void)presentPaymentProvisioningDismissingAfterwards:(BOOL)a3;
- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDefaultService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAfterPaymentSetup:(BOOL)a3;
- (void)setDismissalTaskProgressTracker:(id)a3;
- (void)setHostConnection:(id)a3;
- (void)setInAppPaymentService:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)start;
- (void)willDisappear;
@end

@implementation PKPaymentAuthorizationFlowCoordinator

- (PKPaymentAuthorizationDefaultService)defaultService
{
  defaultService = self->_defaultService;
  if (!defaultService)
  {
    v4 = objc_alloc_init(PKPaymentAuthorizationDefaultService);
    v5 = self->_defaultService;
    self->_defaultService = v4;

    [(PKPaymentAuthorizationDefaultService *)self->_defaultService setPresenter:self];
    defaultService = self->_defaultService;
  }

  return defaultService;
}

- (PKInAppPaymentService)inAppPaymentService
{
  inAppPaymentService = self->_inAppPaymentService;
  if (!inAppPaymentService)
  {
    v4 = (PKInAppPaymentService *)objc_alloc_init(MEMORY[0x1E4F84798]);
    v5 = self->_inAppPaymentService;
    self->_inAppPaymentService = v4;

    inAppPaymentService = self->_inAppPaymentService;
  }

  return inAppPaymentService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  peerPaymentAccount = self->_peerPaymentAccount;
  if (!peerPaymentAccount)
  {
    v4 = [MEMORY[0x1E4F84E10] sharedService];
    v5 = [v4 targetDevice];
    v6 = [v5 account];
    v7 = self->_peerPaymentAccount;
    self->_peerPaymentAccount = v6;

    peerPaymentAccount = self->_peerPaymentAccount;
  }

  return peerPaymentAccount;
}

- (PKAsyncTaskProgressTracker)dismissalTaskProgressTracker
{
  dismissalTaskProgressTracker = self->_dismissalTaskProgressTracker;
  if (!dismissalTaskProgressTracker)
  {
    v4 = (PKAsyncTaskProgressTracker *)objc_alloc_init(MEMORY[0x1E4F84510]);
    v5 = self->_dismissalTaskProgressTracker;
    self->_dismissalTaskProgressTracker = v4;

    dismissalTaskProgressTracker = self->_dismissalTaskProgressTracker;
  }

  return dismissalTaskProgressTracker;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (PKUserInterfaceIdiomSupportsLargeLayouts()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (PKPaymentRequest)paymentRequest
{
  return [(PKPaymentAuthorizationContext *)self->_context request];
}

- (PKPaymentAuthorizationServiceProxy)exportedObject
{
  return (PKPaymentAuthorizationServiceProxy *)[(NSXPCConnection *)self->_hostConnection exportedObject];
}

- (PKPaymentAuthorizationHostProtocol)remoteObjectProxy
{
  return (PKPaymentAuthorizationHostProtocol *)[(NSXPCConnection *)self->_hostConnection remoteObjectProxy];
}

- (PKPaymentAuthorizationFlowCoordinator)initWithContext:(id)a3 scenePresenter:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationFlowCoordinator;
  v12 = [(PKPaymentAuthorizationFlowCoordinator *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeWeak((id *)&v13->_scenePresenter, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__openApplication_ name:@"PKOpenApplicationNotification" object:0];
  }
  return v13;
}

- (void)dealloc
{
  [(PKPaymentAuthorizationFlowCoordinator *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationFlowCoordinator;
  [(PKPaymentAuthorizationFlowCoordinator *)&v3 dealloc];
}

- (void)willDisappear
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationFlowCoordinator *)self _stopSuppressingNotifications];
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134349056;
    v5 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the remote alert controller will disappear", (uint8_t *)&v4, 0xCu);
  }

  [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:0 error:0 completion:0];
}

- (void)start
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "==== Payment Authorization Flow Start ====", buf, 2u);
  }

  [(PKPaymentAuthorizationFlowCoordinator *)self _startAnalyticsReporting];
  int v4 = [(PKPaymentAuthorizationFlowCoordinator *)self inAppPaymentService];
  v5 = [(PKPaymentAuthorizationContext *)self->_context hostIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke;
  v6[3] = &unk_1E59DDB30;
  v6[4] = self;
  [v4 retrievePaymentListenerEndpointForHostIdentifier:v5 completion:v6];
}

void __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke_2;
  block[3] = &unk_1E59CD7B0;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__PKPaymentAuthorizationFlowCoordinator_start__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_debug_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEBUG, "Retrieved payment listener endpoint: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_super v3 = *(unsigned char **)(a1 + 32);
    if (v3[32])
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator invalidated, discarding endpoint.", (uint8_t *)&v11, 2u);
      }
    }
    else
    {
      uint64_t v5 = [v3 createConnectionToEndpoint:*(void *)(a1 + 40)];
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 80);
      *(void *)(v6 + 80) = v5;

      [*(id *)(a1 + 32) openConnection:*(void *)(*(void *)(a1 + 32) + 80)];
      uint64_t v8 = [MEMORY[0x1E4F88108] userIntentStyle];
      char v9 = *(void **)(a1 + 32);
      if (v8 == -1) {
        [v9 _presentEnrollAccessibilityIntentAlert];
      }
      else {
        [v9 _presentNextStepDismissingCurrentInterface:0 withDefaultPassID:0];
      }
    }
  }
  else
  {
    int v4 = *(void **)(a1 + 32);
    [v4 invalidate];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    objc_super v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "==== Payment Authorization Flow End ====", v10, 2u);
    }

    int v4 = [(PKPaymentAuthorizationFlowCoordinator *)self dismissalTaskProgressTracker];
    [v4 taskDidComplete];

    if (objc_opt_respondsToSelector()) {
      [(PKPaymentAuthorizationInterface *)self->_paymentInterface invalidate];
    }
    paymentInterface = self->_paymentInterface;
    self->_paymentInterface = 0;

    [(NSXPCConnection *)self->_hostConnection invalidate];
    hostConnection = self->_hostConnection;
    self->_hostConnection = 0;

    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v7, "pkui_resetSharedRootAuthenticationContext");

    uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self];

    [(PKPaymentAuthorizationFlowCoordinator *)self _endAnalyticsReporting];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained flowCoordinatorDidInvalidate];
  }
}

- (void)notifyOnDismissal:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self dismissalTaskProgressTracker];
  [v5 notifyOnCompletion:v4];
}

- (id)createConnectionToEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
  uint64_t v6 = PKPaymentAuthorizationHostInterface();
  [v5 setRemoteObjectInterface:v6];

  v7 = PKPaymentAuthorizationServiceInterface();
  [v5 setExportedInterface:v7];

  uint64_t v8 = [PKPaymentAuthorizationServiceProxy alloc];
  char v9 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  uint64_t v10 = [(PKPaymentAuthorizationServiceProxy *)v8 initWithConnection:v5 paymentRequest:v9];

  int v11 = [(PKPaymentAuthorizationFlowCoordinator *)self defaultService];
  [(PKPaymentAuthorizationServiceProxy *)v10 setDelegate:v11];

  [v5 setExportedObject:v10];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke;
  v15[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v16, &location);
  [v5 setInterruptionHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_2;
  v13[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v14, &location);
  [v5 setInvalidationHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v5;
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator connection interrupted", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_41;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_42;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __68__PKPaymentAuthorizationFlowCoordinator_createConnectionToEndpoint___block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)openConnection:(id)a3
{
  id v4 = a3;
  [v4 resume];
  objc_initWeak(&location, self);
  id v5 = [v4 remoteObjectProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke;
  v7[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 handleConnectionDidOpenWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __56__PKPaymentAuthorizationFlowCoordinator_openConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reportConnectionEstablishedAnalyticsForConnection:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_startAnalyticsReporting
{
  id v3 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v4 = [v3 clientAnalyticsParameters];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87AD0]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)*MEMORY[0x1E4F87020];
  if (isKindOfClass) {
    v7 = v5;
  }
  id v8 = v7;

  [MEMORY[0x1E4F843E0] beginSubjectReporting:v8];
  if (![(PKPaymentAuthorizationContext *)self->_context awaitingRemoteNetworkPaymentRequest])[(PKPaymentAuthorizationFlowCoordinator *)self _reportPaymentRequestDetails]; {
}
  }

- (void)_reportPaymentRequestDetails
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v4 = [v3 clientAnalyticsParameters];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87AD0]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)*MEMORY[0x1E4F87020];
  if (isKindOfClass) {
    v7 = v5;
  }
  id v8 = v7;

  id v9 = [MEMORY[0x1E4F843E0] reporterForSubject:v8];

  if (!v9) {
    [MEMORY[0x1E4F843E0] beginSubjectReporting:v8];
  }
  id v10 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  uint64_t v12 = [v10 supportedNetworks];
  uint64_t v13 = [v12 componentsJoinedByString:@", "];

  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F868F8]];
  unint64_t v14 = [v10 requestType];
  v149 = v8;
  if (v14 > 0xF) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E59DDC40[v14];
  }
  [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F86900]];
  id v16 = [v10 merchantSession];
  uint64_t v17 = [v16 merchantIdentifier];

  v18 = (void *)MEMORY[0x1E4F868E0];
  if (v17)
  {
    [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F868E0]];
  }
  else
  {
    v19 = [v10 merchantIdentifier];
    [v11 setObject:v19 forKeyedSubscript:*v18];
  }
  v20 = [v10 originatingURL];

  if (v20)
  {
    v21 = [v10 originatingURL];
    v22 = [v21 host];
    [v11 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F868D8]];
  }
  uint64_t v23 = [v10 countryCode];
  if (v23) {
    [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F868D0]];
  }
  v147 = (void *)v23;
  v148 = (void *)v17;
  v24 = [v10 merchantSession];
  uint64_t v25 = [v24 operationalAnalyticsIdentifier];

  if (v25) {
    [v11 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F86898]];
  }
  v146 = (void *)v25;
  v26 = [v10 requiredBillingContactFields];
  v27 = [v26 allObjects];
  v28 = [v27 componentsJoinedByString:@", "];
  [v11 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F86948]];

  v29 = [v10 requiredShippingContactFields];
  v30 = [v29 allObjects];
  v31 = [v30 componentsJoinedByString:@", "];
  [v11 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F86950]];

  v32 = [v10 billingContact];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  if (v32)
  {
    v34 = [v32 postalAddress];

    if (v34) {
      [v33 addObject:@"post"];
    }
    v35 = [v32 phoneNumber];

    if (v35) {
      [v33 addObject:@"phone"];
    }
    v36 = [v32 emailAddress];

    if (v36) {
      [v33 addObject:@"email"];
    }
    v37 = [v32 name];

    if (v37) {
      [v33 addObject:@"name"];
    }
  }
  v38 = [v33 componentsJoinedByString:@", "];
  [v11 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F868B0]];

  v39 = [v10 shippingContact];

  [v33 removeAllObjects];
  if (v39)
  {
    v40 = [v39 postalAddress];

    if (v40) {
      [v33 addObject:@"post"];
    }
    v41 = [v39 phoneNumber];

    if (v41) {
      [v33 addObject:@"phone"];
    }
    v42 = [v39 emailAddress];

    if (v42) {
      [v33 addObject:@"email"];
    }
    v43 = [v39 name];

    if (v43) {
      [v33 addObject:@"name"];
    }
  }
  v151 = v39;
  v44 = [v33 componentsJoinedByString:@", "];
  [v11 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F86958]];

  v45 = [v10 availableShippingMethods];
  v46 = [v45 methods];
  unint64_t v47 = [v46 count];

  if (v47 <= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", v47);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = @"5+";
  }

  [v11 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F86968]];
  unint64_t v49 = [v10 shippingType];
  unint64_t v50 = v49;
  if (v49 > 3) {
    v51 = @"unknown";
  }
  else {
    v51 = off_1E59DDCC0[v49];
  }
  [v11 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F86978]];
  if ((v50 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v52 = [v151 postalAddress];
    v53 = PKAnalyticsReportSwitchToggleResultValue();
    [v11 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F86910]];

    [v10 isShippingEditable];
    v54 = PKAnalyticsReportSwitchToggleResultValue();
    [v11 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F86908]];
  }
  v55 = [v45 methods];
  uint64_t v56 = [v55 count];

  v145 = v45;
  v150 = v33;
  if (v56)
  {
    v143 = v48;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v57 = [v45 methods];
    uint64_t v58 = [v57 countByEnumeratingWithState:&v154 objects:v158 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      int v60 = 0;
      int v61 = 0;
      uint64_t v62 = *(void *)v155;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v155 != v62) {
            objc_enumerationMutation(v57);
          }
          v64 = [*(id *)(*((void *)&v154 + 1) + 8 * i) dateComponentsRange];
          v65 = [v64 startDateComponents];

          v61 |= v65 != 0;
          v66 = [v64 endDateComponents];

          v60 |= v66 != 0;
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v154 objects:v158 count:16];
      }
      while (v59);
    }

    v67 = PKAnalyticsReportSwitchToggleResultValue();
    [v11 setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F86970]];

    v68 = PKAnalyticsReportSwitchToggleResultValue();
    [v11 setObject:v68 forKeyedSubscript:*MEMORY[0x1E4F86960]];

    v33 = v150;
    v48 = v143;
  }
  v69 = [v10 currencyCode];
  [v11 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F86D58]];

  v70 = [v10 paymentSummaryItems];
  unint64_t v71 = [v70 count];

  if (v71 <= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", v71);
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = @"5+";
  }

  v144 = v72;
  [v11 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F868E8]];
  [v10 supportsCouponCode];
  v73 = PKAnalyticsReportSwitchToggleResultValue();
  [v11 setObject:v73 forKeyedSubscript:*MEMORY[0x1E4F868C0]];

  v74 = [v10 couponCode];
  [v74 length];

  v75 = PKAnalyticsReportSwitchToggleResultValue();
  [v11 setObject:v75 forKeyedSubscript:*MEMORY[0x1E4F868B8]];

  [v10 isMultiTokenRequest];
  v76 = PKAnalyticsReportSwitchToggleResultValue();
  [v11 setObject:v76 forKeyedSubscript:*MEMORY[0x1E4F868F0]];

  if ([v10 APIType] == 1)
  {
    v77 = (void *)MEMORY[0x1E4F86FC8];
  }
  else
  {
    if ([v10 APIType] != 2) {
      goto LABEL_60;
    }
    v77 = (void *)MEMORY[0x1E4F86FD8];
  }
  [v11 setObject:*v77 forKeyedSubscript:*MEMORY[0x1E4F86FD0]];
LABEL_60:
  v78 = [v10 userAgent];
  if ([v78 length]) {
    [v11 setObject:v78 forKeyedSubscript:*MEMORY[0x1E4F86D80]];
  }
  v142 = v78;
  v79 = [v10 paymentSummaryItems];
  v80 = [v79 lastObject];

  objc_opt_class();
  char v81 = objc_opt_isKindOfClass();
  v82 = (void *)MEMORY[0x1E4F86930];
  v83 = (void *)MEMORY[0x1E4F86928];
  v84 = (void *)MEMORY[0x1E4F86938];
  v141 = v80;
  if (v81)
  {
    id v85 = v80;
    id v86 = v11;
    v87 = v83;
    id v88 = v85;
    v89 = PKAnalyticsReportSwitchToggleResultValue();
    uint64_t v90 = *MEMORY[0x1E4F86940];
    [v86 setObject:v89 forKeyedSubscript:*MEMORY[0x1E4F86940]];

    [v88 intervalUnitSpecified];
    v91 = PKAnalyticsReportSwitchToggleResultValue();
    [v86 setObject:v91 forKeyedSubscript:*v82];

    [v88 intervalCountSpecified];
    v92 = PKAnalyticsReportSwitchToggleResultValue();
    [v86 setObject:v92 forKeyedSubscript:*v87];

    v93 = [v88 startDate];
    v94 = PKAnalyticsReportSwitchToggleResultValue();
    [v86 setObject:v94 forKeyedSubscript:*v84];

    v95 = [v88 endDate];
    v96 = PKAnalyticsReportSwitchToggleResultValue();
    [v86 setObject:v96 forKeyedSubscript:*MEMORY[0x1E4F86920]];

    uint64_t v97 = *MEMORY[0x1E4F86D08];
    uint64_t v98 = *MEMORY[0x1E4F86918];
    [v86 setObject:*MEMORY[0x1E4F86D08] forKeyedSubscript:*MEMORY[0x1E4F86918]];
  }
  else
  {
    objc_opt_class();
    char v99 = objc_opt_isKindOfClass();
    uint64_t v97 = *MEMORY[0x1E4F86D08];
    uint64_t v90 = *MEMORY[0x1E4F86940];
    [v11 setObject:*MEMORY[0x1E4F86D08] forKeyedSubscript:*MEMORY[0x1E4F86940]];
    if (v99)
    {
      uint64_t v100 = *MEMORY[0x1E4F86D10];
      uint64_t v98 = *MEMORY[0x1E4F86918];
      v101 = v11;
    }
    else
    {
      uint64_t v98 = *MEMORY[0x1E4F86918];
      v101 = v11;
      uint64_t v100 = v97;
    }
    [v101 setObject:v100 forKeyedSubscript:v98];
  }
  v102 = [v10 recurringPaymentRequest];
  if (v102) {
    v103 = @"MPAN";
  }
  else {
    v103 = @"DPAN";
  }
  [v11 setObject:v103 forKeyedSubscript:*MEMORY[0x1E4F86980]];
  if (v102)
  {
    v104 = [v102 billingAgreement];
    id v105 = v11;
    id v106 = v104;
    uint64_t v107 = [v106 length];
    v108 = PKAnalyticsReportSwitchToggleResultValue();
    [v105 setObject:v108 forKeyedSubscript:*MEMORY[0x1E4F868A8]];

    if (v107)
    {
      id v109 = v106;
      unint64_t v110 = [v109 length];
      v111 = @"100 - 200";
      v112 = @"200 - 300";
      v113 = @"300 - 400";
      v114 = @"more";
      if (v110 < 0x1F4) {
        v114 = @"400 - 500";
      }
      if (v110 >= 0x190) {
        v113 = v114;
      }
      if (v110 >= 0x12C) {
        v112 = v113;
      }
      if (v110 >= 0xC8) {
        v111 = v112;
      }
      if ((uint64_t)v110 >= 100) {
        v115 = v111;
      }
      else {
        v115 = @"0 - 100";
      }

      [v105 setObject:v115 forKeyedSubscript:*MEMORY[0x1E4F868A0]];
    }

    v116 = [v102 regularBilling];
    id v117 = v105;
    id v118 = v116;
    v119 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v119 forKeyedSubscript:v90];

    [v118 intervalUnitSpecified];
    v120 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v120 forKeyedSubscript:*MEMORY[0x1E4F86930]];

    [v118 intervalCountSpecified];
    v121 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v121 forKeyedSubscript:*MEMORY[0x1E4F86928]];

    v122 = [v118 startDate];
    v123 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v123 forKeyedSubscript:*MEMORY[0x1E4F86938]];

    v124 = [v118 endDate];
    v125 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v125 forKeyedSubscript:*MEMORY[0x1E4F86920]];

    v126 = [v102 trialBilling];
    v127 = PKAnalyticsReportSwitchToggleResultValue();
    [v117 setObject:v127 forKeyedSubscript:v98];

    v33 = v150;
  }
  v128 = [v10 remoteNetworkRequestPaymentTopicID];
  uint64_t v129 = [v128 length];

  uint64_t v130 = *MEMORY[0x1E4F86B38];
  if (v129)
  {
    [v11 setObject:*MEMORY[0x1E4F86B40] forKeyedSubscript:v130];
    uint64_t v97 = *MEMORY[0x1E4F86D10];
  }
  else
  {
    [v11 setObject:*MEMORY[0x1E4F86B30] forKeyedSubscript:v130];
  }
  [v11 setObject:v97 forKeyedSubscript:*MEMORY[0x1E4F86580]];
  uint64_t v131 = [v10 merchantCategoryCode];
  if ((int)v131 >= 1)
  {
    v132 = [NSNumber numberWithShort:v131];
    v133 = [v132 stringValue];
    [v11 setObject:v133 forKeyedSubscript:*MEMORY[0x1E4F868C8]];
  }
  v134 = [v10 clientAnalyticsParameters];
  v135 = [v134 PKDictionaryForKey:*MEMORY[0x1E4F87AC8]];

  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __PKPaymentRequestAnalyticsDescription_block_invoke;
  v152[3] = &unk_1E59DDC20;
  id v136 = v11;
  id v153 = v136;
  [v135 enumerateKeysAndObjectsUsingBlock:v152];
  v137 = [v10 analyticsProductType];
  [v136 setObject:v137 forKeyedSubscript:*MEMORY[0x1E4F867D0]];

  id v138 = v136;
  [v138 setObject:*MEMORY[0x1E4F86460] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v138 setObject:*MEMORY[0x1E4F86B78] forKeyedSubscript:*MEMORY[0x1E4F86730]];
  v139 = (void *)MEMORY[0x1E4F843E0];
  v140 = (void *)[v138 copy];
  [v139 subject:v149 sendEvent:v140];
}

- (void)_endAnalyticsReporting
{
  v2 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v3 = [v2 clientAnalyticsParameters];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F87AD0]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = (void *)*MEMORY[0x1E4F87020];
  if (isKindOfClass) {
    id v6 = v4;
  }
  id v7 = v6;

  [MEMORY[0x1E4F843E0] endSubjectReporting:v7];
}

- (void)_reportConnectionEstablishedAnalyticsForConnection:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87020];
  uint64_t v7 = *MEMORY[0x1E4F86B78];
  uint64_t v8 = *MEMORY[0x1E4F86308];
  v19[0] = *MEMORY[0x1E4F86730];
  v19[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86458];
  v20[0] = v7;
  v20[1] = v9;
  v19[2] = *MEMORY[0x1E4F85FE0];
  id v10 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v11 = v4;
  uint64_t v12 = [v10 originatingURL];
  uint64_t v13 = [v12 host];

  if (v13)
  {
    unint64_t v14 = (uint64_t *)MEMORY[0x1E4F86528];
  }
  else
  {
    v15 = [v11 valueForEntitlement:@"com.apple.developer.on-demand-install-capable"];
    int v16 = [v15 BOOLValue];

    unint64_t v14 = (uint64_t *)MEMORY[0x1E4F86520];
    if (v16) {
      unint64_t v14 = (uint64_t *)MEMORY[0x1E4F86518];
    }
  }
  uint64_t v17 = *v14;

  v20[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v5 subject:v6 sendEvent:v18];
}

- (void)_reportPaymentPassMissingAnalytics
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87020];
  uint64_t v4 = *MEMORY[0x1E4F863C8];
  uint64_t v5 = *MEMORY[0x1E4F862F8];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F862F0];
  v9[0] = v4;
  v9[1] = v6;
  v8[2] = *MEMORY[0x1E4F86CD8];
  v9[2] = *MEMORY[0x1E4F86CE0];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 subject:v3 sendEvent:v7];
}

- (void)_reportUnsupportedPaymentPassAnalytics
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87020];
  uint64_t v4 = *MEMORY[0x1E4F863C8];
  uint64_t v5 = *MEMORY[0x1E4F862F8];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F862F0];
  v9[0] = v4;
  v9[1] = v6;
  v8[2] = *MEMORY[0x1E4F86CD8];
  v9[2] = *MEMORY[0x1E4F86CE8];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 subject:v3 sendEvent:v7];
}

- (void)_reportVerificationRequiredAnalytics
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87028];
  v8[0] = *MEMORY[0x1E4F87020];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E4F87058];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  uint64_t v7 = *MEMORY[0x1E4F86498];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 subjects:v4 sendEvent:v5];
}

- (void)_reportAddCardAlertPresentedAnalytics
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87020];
  uint64_t v4 = *MEMORY[0x1E4F86730];
  v7[0] = *MEMORY[0x1E4F86308];
  v7[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F86040];
  v8[0] = *MEMORY[0x1E4F864A0];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 subject:v3 sendEvent:v6];
}

- (void)_startSuppressingNotificationsIfNecessary
{
  if (!self->_notificationSuppressionAssertion)
  {
    objc_initWeak(&location, self);
    v2 = (void *)MEMORY[0x1E4F84508];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke;
    v3[3] = &unk_1E59D6CC8;
    objc_copyWeak(&v4, &location);
    [v2 acquireAssertionOfType:4 withReason:@"In-App Payment Interface" completion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_2;
  block[3] = &unk_1E59D1400;
  id v10 = v6;
  id v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v1;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v2 = WeakRetained;
    if (WeakRetained)
    {
      objc_storeStrong((id *)&WeakRetained[2].isa, *(id *)(a1 + 40));
      id v6 = *(void **)(a1 + 40);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_50;
      v7[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v8, v4);
      [v6 setInvalidationHandler:v7];
      objc_destroyWeak(&v8);
    }
  }
}

void __82__PKPaymentAuthorizationFlowCoordinator__startSuppressingNotificationsIfNecessary__block_invoke_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    uint64_t v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)_stopSuppressingNotifications
{
  [(PKAssertion *)self->_notificationSuppressionAssertion invalidate];
  notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
  self->_notificationSuppressionAssertion = 0;
}

- (void)_presentNextStepDismissingCurrentInterface:(BOOL)a3 withDefaultPassID:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke;
  v9[3] = &unk_1E59DDB58;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a3;
  [(PKPaymentAuthorizationFlowCoordinator *)self _canPresentPaymentRequest:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_2;
  v9[3] = &unk_1E59CAED0;
  objc_copyWeak(v12, (id *)(a1 + 40));
  id v10 = v5;
  id v6 = *(id *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 48);
  id v11 = v6;
  v12[1] = a2;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E59CAA98;
  id v15 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (!v3) {
      uint64_t v3 = *(void **)(a1 + 40);
    }
    id v4 = v3;
    if (*(unsigned char *)(a1 + 64))
    {
      id v5 = objc_loadWeakRetained(WeakRetained + 9);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_3;
      v7[3] = &unk_1E59CC648;
      uint64_t v6 = *(void *)(a1 + 56);
      void v7[4] = WeakRetained;
      uint64_t v9 = v6;
      id v8 = v4;
      [v5 dismissSceneAnimated:1 completion:v7];
    }
    else
    {
      [WeakRetained _handlePaymentRequestPresentationResultType:*(void *)(a1 + 56) relevantUniqueID:v4];
    }
  }
}

uint64_t __102__PKPaymentAuthorizationFlowCoordinator__presentNextStepDismissingCurrentInterface_withDefaultPassID___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePaymentRequestPresentationResultType:*(void *)(a1 + 48) relevantUniqueID:*(void *)(a1 + 40)];
}

- (void)_canPresentPaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKPaymentAuthorizationContext *)self->_context awaitingRemoteNetworkPaymentRequest])
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary canPresentPaymentRequest check as remote payment request has been promised", buf, 2u);
      }

      if (PKPassbookIsCurrentlyDeletedByUser())
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary: Wallet must not be deleted", v17, 2u);
        }

        (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 9, 0, 0);
      }
      (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 10, 0, 0);
    }
    else
    {
      unint64_t v9 = [v6 requestType];
      int v10 = [v6 isPeerPaymentRequest];
      if (v9 <= 0xF && ((1 << v9) & 0xA0C6) != 0 || v10)
      {
        id v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v16 = 0;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Bypassing PKPassLibrary canPresentPaymentRequest check due to request type", v16, 2u);
        }

        (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1, 0, 0);
      }
      else
      {
        BOOL v12 = [MEMORY[0x1E4F84898] sharedInstance];
        char v13 = v12;
        if (v12)
        {
          [v12 canPresentPaymentRequest:v6 completion:v7];
        }
        else
        {
          unint64_t v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v15 = 0;
            _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Error: No pass library to validate payment request. Bailing out", v15, 2u);
          }

          (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
        }
      }
    }
  }
}

- (void)_handlePaymentRequestPresentationResultType:(int64_t)a3 relevantUniqueID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t paymentSetupState = self->_paymentSetupState;
  unint64_t v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = NSStringFromSelector(a2);
    id v11 = @"subsequent attempt";
    *(_DWORD *)v27 = 138412802;
    *(void *)&v27[4] = v10;
    if (!paymentSetupState) {
      id v11 = @"first attempt";
    }
    *(_WORD *)&v27[12] = 2112;
    *(void *)&v27[14] = v11;
    __int16 v28 = 2048;
    int64_t v29 = a3;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%@ => %@,  %ld", v27, 0x20u);
  }
  switch(a3)
  {
    case 0:
      BOOL v12 = (id *)MEMORY[0x1E4F85D50];
      if (paymentSetupState) {
        BOOL v12 = (id *)MEMORY[0x1E4F85D88];
      }
      id v13 = *v12;
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentInvalidAlert];
      break;
    case 1:
      unint64_t v14 = (id *)MEMORY[0x1E4F85D30];
      if (paymentSetupState) {
        unint64_t v14 = (id *)MEMORY[0x1E4F85DA0];
      }
      id v13 = *v14;
      goto LABEL_12;
    case 2:
      [(PKPaymentAuthorizationFlowCoordinator *)self _reportPaymentPassMissingAnalytics];
      id v13 = (id)*MEMORY[0x1E4F85D58];
      id v15 = (void *)*MEMORY[0x1E4F85D90];
      if (paymentSetupState) {
        int v16 = (void *)*MEMORY[0x1E4F85D90];
      }
      else {
        int v16 = (void *)*MEMORY[0x1E4F85D58];
      }
      id v17 = v16;
      if (paymentSetupState)
      {
        [(PKPaymentAuthorizationFlowCoordinator *)self authorizationDidFinishWithError:0];
        goto LABEL_29;
      }
      uint64_t v25 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
      uint64_t v26 = [v25 requestType];

      if (v26 == 5)
      {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentOnboardingForContext:1];
        break;
      }
      if ([(PKPaymentAuthorizationFlowCoordinator *)self _canPresentPaymentSheetWithEmptyPass])
      {
        goto LABEL_12;
      }
      [(PKPaymentAuthorizationFlowCoordinator *)self presentPaymentProvisioningDismissingAfterwards:0];
      break;
    case 3:
      v18 = (id *)MEMORY[0x1E4F85D40];
      if (paymentSetupState) {
        v18 = (id *)MEMORY[0x1E4F85D70];
      }
      id v13 = *v18;
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentActivatingPassAlertWithRelevantUniqueID:v7];
      break;
    case 4:
      v19 = (id *)MEMORY[0x1E4F85D68];
      if (paymentSetupState) {
        v19 = (id *)MEMORY[0x1E4F85DA8];
      }
      id v13 = *v19;
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentVerifyPassAlertWithRelevantUniqueID:v7];
      break;
    case 5:
      [(PKPaymentAuthorizationFlowCoordinator *)self _reportUnsupportedPaymentPassAnalytics];
      id v13 = (id)*MEMORY[0x1E4F85D48];
      id v15 = (void *)*MEMORY[0x1E4F85D80];
      if (paymentSetupState) {
        v20 = (void *)*MEMORY[0x1E4F85D80];
      }
      else {
        v20 = (void *)*MEMORY[0x1E4F85D48];
      }
      id v21 = v20;
      if (paymentSetupState)
      {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentPassNotSupportedAlertWithRelevantUniqueID:v7];
LABEL_29:
        id v13 = v15;
      }
      else if ([(PKPaymentAuthorizationFlowCoordinator *)self _canPresentPaymentSheetWithEmptyPass])
      {
LABEL_12:
        -[PKPaymentAuthorizationFlowCoordinator _presentPaymentAuthorizationWithRelevantUniqueID:](self, "_presentPaymentAuthorizationWithRelevantUniqueID:", v7, *(_OWORD *)v27);
      }
      else
      {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentAddCardAlert];
      }
      break;
    case 6:
      v22 = (id *)MEMORY[0x1E4F85D60];
      if (paymentSetupState) {
        v22 = (id *)MEMORY[0x1E4F85D98];
      }
      id v13 = *v22;
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentLostModeAlertWithRelevantUniqueID:v7];
      break;
    case 7:
      if (self->_peerPaymentIdentityVerificationCompleted) {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentPeerPaymentIdentityVerificationAlert];
      }
      else {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentPeerPaymentIdentityVerification];
      }
      goto LABEL_35;
    case 8:
      uint64_t v23 = [(PKPaymentAuthorizationContext *)self->_context request];
      v24 = [v23 installmentConfiguration];
      [v24 feature];
      PKFeatureIdentifierFromPaymentSetupFeatureType();

      if (paymentSetupState || !PKDeviceSupportsApplicationForFeatureIdentifier()) {
        -[PKPaymentAuthorizationFlowCoordinator authorizationDidFinishWithError:](self, "authorizationDidFinishWithError:", 0, *(void *)v27, *(void *)&v27[8]);
      }
      else {
        [(PKPaymentAuthorizationFlowCoordinator *)self _presentOnboardingForContext:0];
      }
      goto LABEL_35;
    case 9:
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentWalletUninstalledAlert];
      goto LABEL_35;
    case 10:
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:v7];
      goto LABEL_35;
    default:
      goto LABEL_35;
  }
  if (v13)
  {
    MEMORY[0x1A6220EC0](v13, 0);
  }
LABEL_35:
}

- (id)_createPaymentInterfaceConfigurationWithRelevantPassID:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentAuthorizationInterfaceConfiguration alloc] initWithRelevantPassID:v4 presenter:self host:self supportedOrientations:[(PKPaymentAuthorizationFlowCoordinator *)self supportedInterfaceOrientations]];

  return v5;
}

- (void)_presentPaymentInterface:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  p_paymentInterface = &self->_paymentInterface;
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentAuthorizationInterface *)*p_paymentInterface invalidate];
  }
  objc_storeStrong((id *)&self->_paymentInterface, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(PKPaymentAuthorizationInterface *)*p_paymentInterface serviceDelegate],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (void *)v10;
    BOOL v12 = [(PKPaymentAuthorizationFlowCoordinator *)self exportedObject];
    id v13 = v12;
    unint64_t v14 = v11;
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      paymentInterface = self->_paymentInterface;
      *(_DWORD *)buf = 134349312;
      uint64_t v23 = self;
      __int16 v24 = 2050;
      uint64_t v25 = paymentInterface;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): displayed interface (%{public}p) didn't provide a service delegate - using default one.", buf, 0x16u);
    }

    id v11 = [(PKPaymentAuthorizationFlowCoordinator *)self exportedObject];
    id v13 = [(PKPaymentAuthorizationFlowCoordinator *)self defaultService];
    BOOL v12 = v11;
    unint64_t v14 = v13;
  }
  [v12 setDelegate:v14];

  if (objc_opt_respondsToSelector()) {
    [(PKPaymentAuthorizationInterface *)*p_paymentInterface willAppear];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  v18 = [(PKPaymentAuthorizationInterface *)self->_paymentInterface primaryViewController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__PKPaymentAuthorizationFlowCoordinator__presentPaymentInterface_completion___block_invoke;
  v20[3] = &unk_1E59CAD18;
  void v20[4] = self;
  id v21 = v8;
  id v19 = v8;
  [WeakRetained presentPrimaryViewController:v18 animated:1 completion:v20];
}

uint64_t __77__PKPaymentAuthorizationFlowCoordinator__presentPaymentInterface_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) authorizationDidPresent];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 24) didAppear];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_openApplication:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): asked to open application for notification %{public}@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __58__PKPaymentAuthorizationFlowCoordinator__openApplication___block_invoke;
  v7[3] = &unk_1E59CA7D0;
  id v8 = v4;
  id v6 = v4;
  [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:3 error:0 completion:v7];
}

uint64_t __58__PKPaymentAuthorizationFlowCoordinator__openApplication___block_invoke(uint64_t a1)
{
  return PKOpenApplication(*(NSNotification **)(a1 + 32));
}

- (void)_presentOnboardingForContext:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_paymentSetupState)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134349056;
      uint64_t v10 = self;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): asked to show onboarding flow but payment setup was already initiated. Ignoring request.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    self->_unint64_t paymentSetupState = 1;
    id v4 = [(PKPaymentAuthorizationFlowCoordinator *)self _createPaymentInterfaceConfigurationWithRelevantPassID:0];
    id v6 = [[PKPaymentAuthorizationOnboardingInterface alloc] initWithOnboardingContext:a3 authorizationContext:self->_context configuration:v4];
    id v7 = v6;
    if (v6)
    {
      [(PKPaymentAuthorizationOnboardingInterface *)v6 setDelegate:self];
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v7 completion:0];
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134349056;
        uint64_t v10 = self;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create onboarding interface - dismissing.", (uint8_t *)&v9, 0xCu);
      }

      [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:1 error:0 completion:0];
    }
  }
}

- (void)paymentAuthorizationOnboardingDidFinishWithError:(id)a3
{
  self->_unint64_t paymentSetupState = 2;
  if (a3) {
    [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:1 error:a3 completion:0];
  }
  else {
    -[PKPaymentAuthorizationFlowCoordinator _presentNextStepDismissingCurrentInterface:withDefaultPassID:](self, "_presentNextStepDismissingCurrentInterface:withDefaultPassID:", 1);
  }
}

- (void)_presentPeerPaymentIdentityVerification
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presenting peer payment identity verification.", buf, 2u);
  }

  id v4 = [(PKPaymentAuthorizationFlowCoordinator *)self _createPaymentInterfaceConfigurationWithRelevantPassID:0];
  context = self->_context;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke;
  v6[3] = &unk_1E59DDB80;
  v6[4] = self;
  +[PKPeerPaymentIdentityVerificationInterface interfaceWithContext:context configuration:v4 completion:v6];
}

void __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) _presentPaymentInterface:v4 completion:0];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134349056;
      uint64_t v10 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): failed to create peer identity verification interface.", buf, 0xCu);
    }

    if (PKDeviceSupportsPeerPaymentIdentityVerification())
    {
      [*(id *)(a1 + 32) _presentPeerPaymentIdentityVerificationAlert];
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke_69;
      void v8[3] = &unk_1E59CA7D0;
      void v8[4] = *(void *)(a1 + 32);
      id v7 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v8);
      [*(id *)(a1 + 32) _presentAlertController:v7];
    }
  }
}

uint64_t __80__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerification__block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) authorizationDidFinishWithError:0];
}

- (void)peerPaymentIdentityVerificationDidFinishWithAccount:(id)a3
{
  self->_peerPaymentIdentityVerificationCompleted = 1;
  [(PKPaymentAuthorizationFlowCoordinator *)self setPeerPaymentAccount:a3];

  [(PKPaymentAuthorizationFlowCoordinator *)self _presentNextStepDismissingCurrentInterface:0 withDefaultPassID:0];
}

- (BOOL)_peerPaymentIdentityVerificationRequired
{
  v2 = [(PKPaymentAuthorizationFlowCoordinator *)self peerPaymentAccount];
  if ([v2 identityVerificationForDisbursementsRequired])
  {
    if ([v2 identityVerificationRequired])
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v4 = [v2 state];
      uint64_t v5 = [v2 stage];
      BOOL v3 = v4 == 1 && v5 == 2;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_presentAwaitingRemoteNetworkPaymentRequestWithRelevantUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "FlowCoordinator: Displaying awaiting remote request view", v8, 2u);
  }

  uint64_t v6 = [(PKPaymentAuthorizationFlowCoordinator *)self _createPaymentInterfaceConfigurationWithRelevantPassID:v4];
  id v7 = [[PKRemoteNetworkPaymentLoadingViewInterface alloc] initWithContext:self->_context configuration:v6];
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v7 completion:0];
}

- (void)_presentPaymentAuthorizationWithRelevantUniqueID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  PKLogFacilityTypeGetObject();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "present:paymentSheet", "", buf, 2u);
    }
  }

  int v9 = [(PKPaymentAuthorizationFlowCoordinator *)self _createPaymentInterfaceConfigurationWithRelevantPassID:v6];

  context = self->_context;
  id v15 = 0;
  uint64_t v11 = +[PKPaymentAuthorizationInterfaceManager paymentInterfaceForContext:context configuration:v9 error:&v15];
  id v12 = v15;
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__PKPaymentAuthorizationFlowCoordinator__presentPaymentAuthorizationWithRelevantUniqueID___block_invoke;
    v14[3] = &unk_1E59CA7D0;
    v14[4] = self;
    [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v11 completion:v14];
  }
  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      id v17 = self;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create authorization interface - dismissing.", buf, 0xCu);
    }

    [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:1 error:v12 completion:0];
  }
}

void __90__PKPaymentAuthorizationFlowCoordinator__presentPaymentAuthorizationWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  PKLogFacilityTypeGetObject();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_19F450000, v2, OS_SIGNPOST_INTERVAL_END, v4, "present:paymentSheet", "", v5, 2u);
    }
  }
}

- (void)_presentActivatingPassAlertWithRelevantUniqueID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    id v6 = [v5 originatingURL];
    os_signpost_id_t v7 = [v6 host];
    os_signpost_id_t v8 = @"Web payment";
    if (!v7) {
      os_signpost_id_t v8 = @"In app payment";
    }
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@: displaying card activating alert", (uint8_t *)&v12, 0xCu);
  }
  int v9 = PKLocalizedPaymentString(&cfstr_LocalSetupActi.isa);
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_LocalSetupActi_0.isa);
  uint64_t v11 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v9 message:v10 cancelTitle:v11 actionTitle:0 actionHandler:0];
}

- (void)_presentVerifyPassAlertWithRelevantUniqueID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    os_signpost_id_t v7 = [v6 originatingURL];
    os_signpost_id_t v8 = [v7 host];
    int v9 = @"Web payment";
    if (!v8) {
      int v9 = @"In app payment";
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%@: displaying card verification required alert", buf, 0xCu);
  }
  [(PKPaymentAuthorizationFlowCoordinator *)self _reportVerificationRequiredAnalytics];
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_LocalSetupVeri.isa);
  uint64_t v11 = PKLocalizedPaymentString(&cfstr_LocalSetupVeri_0.isa);
  int v12 = PKLocalizedPaymentString(&cfstr_LocalSetupVeri_1.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PKPaymentAuthorizationFlowCoordinator__presentVerifyPassAlertWithRelevantUniqueID___block_invoke;
  v14[3] = &unk_1E59CA870;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v10 message:v11 actionTitle:v12 actionHandler:v14];
}

void __85__PKPaymentAuthorizationFlowCoordinator__presentVerifyPassAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) authorizationDidFinishWithError:0];
  id v2 = [MEMORY[0x1E4F84898] sharedInstance];
  [v2 presentWalletWithRelevantPassUniqueID:*(void *)(a1 + 40)];
}

- (void)_presentLostModeAlertWithRelevantUniqueID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    os_signpost_id_t v7 = [v6 originatingURL];
    os_signpost_id_t v8 = [v7 host];
    int v9 = @"Web payment";
    if (!v8) {
      int v9 = @"In app payment";
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%@: displaying card in lost mode alert", buf, 0xCu);
  }
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_LocalSetupLost.isa);
  uint64_t v11 = PKLocalizedPaymentString(&cfstr_LocalSetupLost_0.isa);
  int v12 = PKLocalizedString(&cfstr_Wallet_0.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentAuthorizationFlowCoordinator__presentLostModeAlertWithRelevantUniqueID___block_invoke;
  v14[3] = &unk_1E59CA870;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v10 message:v11 actionTitle:v12 actionHandler:v14];
}

void __83__PKPaymentAuthorizationFlowCoordinator__presentLostModeAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) authorizationDidFinishWithError:0];
  id v2 = [MEMORY[0x1E4F84898] sharedInstance];
  [v2 presentWalletWithRelevantPassUniqueID:*(void *)(a1 + 40)];
}

- (void)_presentPeerPaymentIdentityVerificationAlert
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    uint64_t v5 = [v4 originatingURL];
    id v6 = [v5 host];
    os_signpost_id_t v7 = @"Web payment";
    if (!v6) {
      os_signpost_id_t v7 = @"In app payment";
    }
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "%@: displaying peer payment identity verification alert", buf, 0xCu);
  }
  os_signpost_id_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIde.isa);
  int v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIde_0.isa);
  uint64_t v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentIde_1.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerificationAlert__block_invoke;
  v11[3] = &unk_1E59CA7D0;
  v11[4] = self;
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v8 message:v9 actionTitle:v10 actionHandler:v11];
}

uint64_t __85__PKPaymentAuthorizationFlowCoordinator__presentPeerPaymentIdentityVerificationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) authorizationDidFinishWithError:0];
}

- (void)_presentAddCardAlert
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    id v6 = [v5 originatingURL];
    id v2 = [v6 host];
    os_signpost_id_t v7 = @"Web payment";
    if (!v2) {
      os_signpost_id_t v7 = @"In app payment";
    }
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@: displaying add card alert", buf, 0xCu);
  }
  [(PKPaymentAuthorizationFlowCoordinator *)self _reportAddCardAlertPresentedAnalytics];
  os_signpost_id_t v8 = PKLocalizedPaymentString(&cfstr_LocalSetupUnsu.isa);
  int v9 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  uint64_t v10 = [v9 originatingURL];
  if (v10)
  {
    PKLocalizedPaymentString(&cfstr_LocalSetupUnsu_0.isa);
  }
  else
  {
    id v2 = [(PKPaymentAuthorizationContext *)self->_context hostLocalizedAppName];
    PKLocalizedPaymentString(&cfstr_LocalSetupUnsu_1.isa, &stru_1EF1B4C70.isa, v2);
  uint64_t v11 = };
  int v12 = PKLocalizedPaymentString(&cfstr_LocalSetupUnsu_2.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke;
  v13[3] = &unk_1E59CA7D0;
  void v13[4] = self;
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v8 message:v11 actionTitle:v12 actionHandler:v13];

  if (!v10)
  {

    uint64_t v11 = v2;
  }
}

void __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke_2;
  v2[3] = &unk_1E59CA7D0;
  void v2[4] = *(void *)(a1 + 32);
  uint64_t v1 = v2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E59CAA98;
  id v4 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__PKPaymentAuthorizationFlowCoordinator__presentAddCardAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPaymentProvisioningDismissingAfterwards:0];
}

- (void)_presentPassNotSupportedAlertWithRelevantUniqueID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v6 = [v5 originatingURL];
  os_signpost_id_t v7 = [v6 host];

  os_signpost_id_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = @"Web payment";
    if (!v7) {
      int v9 = @"In app payment";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v9;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "%@: displaying pass not supported alert", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v11 = [v10 passWithUniqueID:v4];

  int v12 = [v11 devicePrimaryPaymentApplication];
  [v12 paymentNetworkIdentifier];
  id v13 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();

  if (!v13)
  {
    id v13 = [v11 organizationName];
  }
  uint64_t v14 = [(PKPaymentAuthorizationContext *)self->_context hostLocalizedAppName];
  id v15 = PKLocalizedPaymentString(&cfstr_LocalSetupCard.isa, &cfstr_12.isa, v14, v13);

  uint64_t v16 = [(PKPaymentAuthorizationContext *)self->_context hostLocalizedAppName];
  id v17 = PKLocalizedPaymentString(&cfstr_LocalSetupCard_0.isa, &stru_1EF1B4C70.isa, v16);

  uint64_t v18 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  id v19 = PKLocalizedPaymentString(&cfstr_LocalSetupUnsu_2.isa);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  if (v7)
  {
    uint64_t v21 = PKLocalizedPaymentString(&cfstr_LocalSetupCard_1.isa, &stru_1EF1B4C70.isa, v13);

    uint64_t v22 = PKLocalizedPaymentString(&cfstr_LocalSetupCard_2.isa);

    id v15 = (void *)v21;
    id v17 = (void *)v22;
  }
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v15 message:v17 cancelTitle:v18 actionTitle:v19 actionHandler:v20];
}

void __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke_2;
  v2[3] = &unk_1E59CA7D0;
  void v2[4] = *(void *)(a1 + 32);
  uint64_t v1 = v2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E59CAA98;
  id v4 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__PKPaymentAuthorizationFlowCoordinator__presentPassNotSupportedAlertWithRelevantUniqueID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPaymentProvisioningDismissingAfterwards:0];
}

- (void)_presentInvalidAlert
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  uint64_t v4 = [v3 requestType];

  uint64_t v5 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  id v6 = v5;
  if (v4 == 5)
  {
    os_signpost_id_t v7 = [v5 installmentConfiguration];
    [v7 feature];
    uint64_t v8 = PKFeatureIdentifierFromPaymentSetupFeatureType();

    int v9 = [MEMORY[0x1E4F84270] sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke;
    v17[3] = &unk_1E59DDBA8;
    v17[4] = self;
    v17[5] = v8;
    [v9 defaultAccountForFeature:v8 completion:v17];
  }
  else
  {
    uint64_t v10 = [v5 originatingURL];
    uint64_t v11 = [v10 host];

    int v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = @"Web payment";
      if (!v11) {
        id v13 = @"In app payment";
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v13;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "%@: displaying invalid alert", buf, 0xCu);
    }

    if (v11)
    {
      int v9 = PKLocalizedPaymentString(&cfstr_WebPaymentErro.isa);
      uint64_t v14 = 0;
    }
    else
    {
      id v15 = [(PKPaymentAuthorizationContext *)self->_context hostLocalizedAppName];
      int v9 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_3.isa, &stru_1EF1B4C70.isa, v15);

      uint64_t v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_4.isa);
    }
    uint64_t v16 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v9 message:v14 cancelTitle:v16 actionTitle:0 actionHandler:0];
  }
}

void __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke_2;
  block[3] = &unk_1E59CC648;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v4;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__PKPaymentAuthorizationFlowCoordinator__presentInvalidAlert__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 && (unint64_t)([v2 state] - 2) <= 2)
  {
    PKLocalizedFeatureString();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = PKLocalizedFeatureString();
  }
  else
  {
    id v3 = 0;
    id v7 = 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:-2016 userInfo:0];
  id v5 = *(void **)(a1 + 40);
  if (v7 && v3)
  {
    id v6 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    [v5 _presentAlertWithTitle:v7 message:v3 cancelTitle:v6 actionTitle:0 actionHandler:0 finalError:v4];
  }
  else
  {
    [v5 authorizationDidFinishWithError:v4];
  }
}

- (void)_presentAlertController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentAuthorizationMinimalInterface alloc] initWithPrimaryViewController:v4];

  [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v5 completion:0];
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 finalError:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v16)
  {
    PKLocalizedString(&cfstr_Cancel.isa);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v15 preferredStyle:1];
  uint64_t v21 = (void *)MEMORY[0x1E4FB1410];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke;
  v28[3] = &unk_1E59CB218;
  v28[4] = self;
  id v22 = v19;
  id v29 = v22;
  uint64_t v23 = [v21 actionWithTitle:v16 style:1 handler:v28];
  [v20 addAction:v23];

  if (v17)
  {
    __int16 v24 = (void *)MEMORY[0x1E4FB1410];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke_2;
    v26[3] = &unk_1E59CB150;
    id v27 = v18;
    uint64_t v25 = [v24 actionWithTitle:v17 style:0 handler:v26];
    [v20 addAction:v25];
  }
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertController:v20];
}

uint64_t __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) authorizationDidFinishWithError:*(void *)(a1 + 40)];
}

uint64_t __121__PKPaymentAuthorizationFlowCoordinator__presentAlertWithTitle_message_cancelTitle_actionTitle_actionHandler_finalError___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5 actionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  PKLocalizedString(&cfstr_Cancel.isa);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentAlertWithTitle:v13 message:v12 cancelTitle:v14 actionTitle:v11 actionHandler:v10];
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 cancelTitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7
{
}

- (void)_presentEnrollAccessibilityIntentAlert
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  id v3 = _Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke_2;
  v7[3] = &unk_1E59DA350;
  objc_copyWeak(&v8, &location);
  id v4 = _Block_copy(v7);
  AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v3, v4);
  id v6 = [[PKPaymentAuthorizationMinimalInterface alloc] initWithPrimaryViewController:AccesibilityIntentUnavailable];
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v6 completion:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissWithReason:3 error:0 completion:0];
    id WeakRetained = v2;
  }
}

void __79__PKPaymentAuthorizationFlowCoordinator__presentEnrollAccessibilityIntentAlert__block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissWithReason:3 error:0 completion:0];
    id v6 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v6 setSensitive:1];
    uint64_t v8 = *MEMORY[0x1E4F62688];
    v9[0] = MEMORY[0x1E4F1CC38];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v6 setFrontBoardOptions:v7];

    PKOpenApplication(v3, v6);
  }
}

- (void)_presentWalletUninstalledAlert
{
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __71__PKPaymentAuthorizationFlowCoordinator__presentWalletUninstalledAlert__block_invoke;
  uint64_t v9 = &unk_1E59CA7F8;
  objc_copyWeak(&v10, &location);
  id v3 = PKCreateAlertControllerForWalletUninstalled(&v6);
  id v4 = [PKPaymentAuthorizationMinimalInterface alloc];
  id v5 = -[PKPaymentAuthorizationMinimalInterface initWithPrimaryViewController:](v4, "initWithPrimaryViewController:", v3, v6, v7, v8, v9);
  [(PKPaymentAuthorizationFlowCoordinator *)self _presentPaymentInterface:v5 completion:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__PKPaymentAuthorizationFlowCoordinator__presentWalletUninstalledAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained authorizationDidFinishWithError:0];
    id WeakRetained = v2;
  }
}

- (void)authorizationWillStart
{
  id v2 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v2 authorizationWillStart];
}

- (void)authorizationDidRequestMerchantSession
{
  id v2 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v2 authorizationDidRequestMerchantSession];
}

- (void)authorizationDidFinishWithError:(id)a3
{
  if (!self->_didSendAuthorizationDidFinish)
  {
    self->_didSendAuthorizationDidFinish = 1;
    id v4 = a3;
    id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
    [v5 authorizationDidFinishWithError:v4];
  }
}

- (void)authorizationDidAuthorizeContext
{
  id v2 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v2 authorizationDidAuthorizeContext];
}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidAuthorizePayment:v4];

  if (self->_paymentSetupState == 2)
  {
    JUMPOUT(0x1A6220EC0);
  }
}

- (void)authorizationDidAuthorizePurchase:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidAuthorizePurchase:v4];
}

- (void)authorizationDidAuthorizePeerPaymentQuote:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidAuthorizePeerPaymentQuote:v4];
}

- (void)authorizationDidAuthorizeApplePayTrustSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidAuthorizeApplePayTrustSignature:v4];
}

- (void)authorizationDidUpdateAccountServicePaymentMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidUpdateAccountServicePaymentMethod:v4];
}

- (void)authorizationDidSelectShippingMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidSelectShippingMethod:v4];
}

- (void)authorizationDidSelectShippingAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidSelectShippingAddress:v4];
}

- (void)authorizationDidSelectPaymentMethod:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidSelectPaymentMethod:v4];
}

- (void)authorizationDidChangeCouponCode:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v5 authorizationDidChangeCouponCode:v4];
}

- (void)didEncounterAuthorizationEvent:(unint64_t)a3
{
  id v4 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
  [v4 didEncounterAuthorizationEvent:a3];
}

- (void)authorizationDidPresent
{
  if (!self->_didSendAuthorizationDidPresent)
  {
    self->_didSendAuthorizationDidPresent = 1;
    id v2 = [(PKPaymentAuthorizationFlowCoordinator *)self remoteObjectProxy];
    [v2 authorizationDidPresent];
  }
}

- (void)authorizationDidFulfillPaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKPaymentAuthorizationContext *)self->_context fulfillPromisedRemoteNetworkPaymentRequest:v6];
  [(PKPaymentAuthorizationFlowCoordinator *)self _reportPaymentRequestDetails];
  objc_initWeak(&location, self);
  uint64_t v8 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke;
  v10[3] = &unk_1E59DDBF8;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  [(PKPaymentAuthorizationFlowCoordinator *)self _canPresentPaymentRequest:v8 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_2;
  v10[3] = &unk_1E59DDBD0;
  objc_copyWeak(v13, (id *)(a1 + 48));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v13[1] = a2;
  v10[4] = v6;
  id v11 = v5;
  id v12 = v7;
  uint64_t v8 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_1;
  block[3] = &unk_1E59CAA98;
  id v15 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v13);
}

void __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3 == 5 || v3 == 2)
    {
      char v5 = [*(id *)(a1 + 32) _canPresentPaymentSheetWithEmptyPass];
      uint64_t v3 = *(void *)(a1 + 64);
    }
    else
    {
      char v5 = 0;
    }
    if (v3 == 1) {
      char v6 = 1;
    }
    else {
      char v6 = v5;
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7 && (v6 & 1) == 0) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
    id v8 = objc_loadWeakRetained(WeakRetained + 9);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_3;
    v10[3] = &unk_1E59D4158;
    uint64_t v9 = *(void *)(a1 + 64);
    v10[4] = WeakRetained;
    uint64_t v13 = v9;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    char v14 = v6;
    [v8 dismissSceneAnimated:1 completion:v10];
  }
}

uint64_t __90__PKPaymentAuthorizationFlowCoordinator_authorizationDidFulfillPaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _handlePaymentRequestPresentationResultType:*(void *)(a1 + 56) relevantUniqueID:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result && *(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)authorizationDidRejectPaymentRequestPromise
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "FlowCoordinator: Dismissing prayment request promise with failure", v4, 2u);
  }

  [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:3 error:0 completion:0];
}

- (BOOL)supportsSecondaryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  char v3 = [WeakRetained supportsSecondaryViewController];

  return v3;
}

- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_scenePresenter = &self->_scenePresenter;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scenePresenter);
  [WeakRetained presentSecondaryViewController:v9 animated:v5 completion:v8];
}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  p_scenePresenter = &self->_scenePresenter;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_scenePresenter);
  [WeakRetained dismissSecondaryViewControllerAnimated:v4 completion:v6];
}

- (void)presentPaymentProvisioningDismissingAfterwards:(BOOL)a3
{
  self->_dismissAfterPaymentSetup = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__PKPaymentAuthorizationFlowCoordinator_presentPaymentProvisioningDismissingAfterwards___block_invoke;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = self;
  [WeakRetained dismissSceneAnimated:1 completion:v5];
}

void __88__PKPaymentAuthorizationFlowCoordinator_presentPaymentProvisioningDismissingAfterwards___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40) == 1)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134349056;
      uint64_t v9 = v1;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): Asked to show provisioning flow but payment setup already in progress. Ignoring request", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85DB0], 0);
    *(void *)(*(void *)(a1 + 32) + 40) = 1;
    id v2 = [*(id *)(a1 + 32) _createPaymentInterfaceConfigurationWithRelevantPassID:0];
    BOOL v4 = [[PKPaymentAuthorizationProvisioningInterface alloc] initWithContext:*(void *)(*(void *)(a1 + 32) + 56) configuration:v2];
    BOOL v5 = v4;
    if (v4)
    {
      [(PKPaymentAuthorizationProvisioningInterface *)v4 setDelegate:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) _presentPaymentInterface:v5 completion:0];
    }
    else
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 134349056;
        uint64_t v9 = v7;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationFlowCoordinator (%{public}p): cannot create provisioning interface - dismissing", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(a1 + 32) dismissWithReason:1 error:0 completion:0];
    }
  }
}

- (void)paymentAuthorizationProvisioningDidFinishWithPass:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  self->_unint64_t paymentSetupState = 2;
  if (self->_dismissAfterPaymentSetup)
  {
    BOOL v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134349056;
      uint64_t v9 = self;
      id v6 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing following completed payment setup";
LABEL_4:
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = [v4 uniqueID];
      [(PKPaymentAuthorizationFlowCoordinator *)self _presentNextStepDismissingCurrentInterface:1 withDefaultPassID:v7];

      goto LABEL_8;
    }
    BOOL v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134349056;
      uint64_t v9 = self;
      id v6 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Provisioning didn't produce any pass. Dismissing";
      goto LABEL_4;
    }
  }

  [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:1 error:0 completion:0];
LABEL_8:
}

- (void)dismissWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = [(PKPaymentAuthorizationFlowCoordinator *)self dismissalTaskProgressTracker];
    [v10 notifyOnCompletion:v9];
  }
  id v11 = [(PKPaymentAuthorizationFlowCoordinator *)self dismissalTaskProgressTracker];
  uint64_t v12 = [v11 status];

  if (!v12)
  {
    uint64_t v13 = [(PKPaymentAuthorizationFlowCoordinator *)self dismissalTaskProgressTracker];
    [v13 taskDidStart];

    if (self->_paymentSetupState == 2 && !self->_dismissAfterPaymentSetup) {
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85D78], 0);
    }
    char v14 = [(PKPaymentAuthorizationFlowCoordinator *)self exportedObject];
    id v15 = [v14 delegate];

    if (objc_opt_respondsToSelector()) {
      [v15 handleHostApplicationDidCancel];
    }
    if (a3 != 2) {
      [(PKPaymentAuthorizationFlowCoordinator *)self authorizationDidFinishWithError:v8];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPaymentAuthorizationFlowCoordinator_dismissWithReason_error_completion___block_invoke;
    aBlock[3] = &unk_1E59CA7D0;
    void aBlock[4] = self;
    id v16 = (void (**)(void))_Block_copy(aBlock);
    BOOL invalidated = self->_invalidated;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);
    id v19 = WeakRetained;
    if (invalidated)
    {
      [WeakRetained dismissSceneAnimated:0 completion:0];

      v16[2](v16);
    }
    else
    {
      [WeakRetained dismissSceneAnimated:1 completion:v16];
    }
  }
}

uint64_t __76__PKPaymentAuthorizationFlowCoordinator_dismissWithReason_error_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)_shouldBlockHardwareCancels
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  paymentInterface = self->_paymentInterface;

  return [(PKPaymentAuthorizationInterface *)paymentInterface shouldBlockHardwareCancels];
}

- (BOOL)handleHomeButtonPressed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPaymentAuthorizationFlowCoordinator *)self _shouldBlockHardwareCancels];
  if (!v3)
  {
    id v4 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
    uint64_t v5 = [v4 requestType];

    if (v5 == 1)
    {
      if (PKHomeButtonIsAvailable()) {
        uint64_t v6 = 6;
      }
      else {
        uint64_t v6 = 10;
      }
      [(PKPaymentAuthorizationFlowCoordinator *)self didEncounterAuthorizationEvent:v6];
    }
    int IsAvailable = PKHomeButtonIsAvailable();
    id v8 = PKLogFacilityTypeGetObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (IsAvailable)
    {
      if (v9)
      {
        int v12 = 134349056;
        uint64_t v13 = self;
        uint64_t v10 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the home button was pressed";
LABEL_12:
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
      }
    }
    else if (v9)
    {
      int v12 = 134349056;
      uint64_t v13 = self;
      uint64_t v10 = "PKPaymentAuthorizationFlowCoordinator (%{public}p): Dismissing because the home indicator was swiped";
      goto LABEL_12;
    }

    [(PKPaymentAuthorizationFlowCoordinator *)self dismissWithReason:3 error:0 completion:0];
  }
  return !v3;
}

- (BOOL)_canPresentPaymentSheetWithEmptyPass
{
  id v2 = [(PKPaymentAuthorizationFlowCoordinator *)self paymentRequest];
  if ([v2 requestType]) {
    BOOL v3 = [v2 requestType] == 10;
  }
  else {
    BOOL v3 = 1;
  }

  return v3;
}

- (PKPaymentAuthorizationContext)context
{
  return self->_context;
}

- (PKPaymentAuthorizationFlowCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationFlowCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentAuthorizationScenePresenter)scenePresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scenePresenter);

  return (PKPaymentAuthorizationScenePresenter *)WeakRetained;
}

- (void)setScenePresenter:(id)a3
{
}

- (NSXPCConnection)hostConnection
{
  return self->_hostConnection;
}

- (void)setHostConnection:(id)a3
{
}

- (void)setDefaultService:(id)a3
{
}

- (void)setInAppPaymentService:(id)a3
{
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (void)setDismissalTaskProgressTracker:(id)a3
{
}

- (BOOL)dismissAfterPaymentSetup
{
  return self->_dismissAfterPaymentSetup;
}

- (void)setDismissAfterPaymentSetup:(BOOL)a3
{
  self->_dismissAfterPaymentSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalTaskProgressTracker, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
  objc_storeStrong((id *)&self->_defaultService, 0);
  objc_storeStrong((id *)&self->_hostConnection, 0);
  objc_destroyWeak((id *)&self->_scenePresenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_paymentInterface, 0);

  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
}

@end