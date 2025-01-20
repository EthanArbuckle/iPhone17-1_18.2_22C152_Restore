@interface PKPaymentAuthorizationCoordinator
+ (BOOL)_canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5 paymentRequestType:(id)a6;
+ (BOOL)canMakePayments;
+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5;
+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 webDomain:(id)a4;
+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3;
+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3 capabilities:(unint64_t)a4;
- (BOOL)didPresent;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)remotePaymentRequestPromised;
- (BSProcessHandle)remoteNetworkPaymentInvokingProcess;
- (NSString)hostIdentifier;
- (NSTimer)timer;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (PKInAppPaymentService)inAppPaymentService;
- (PKPaymentAuthorizationCoordinator)init;
- (PKPaymentAuthorizationCoordinator)initWithDisbursementRequest:(id)a3;
- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3;
- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3 remotePaymentRequestPromised:(BOOL)a4;
- (PKPaymentAuthorizationCoordinator)initWithRemotePaymentRequestPromised;
- (PKPaymentAuthorizationCoordinatorDelegate)delegate;
- (PKPaymentAuthorizationCoordinatorExportedObject)exportedObject;
- (PKPaymentAuthorizationCoordinatorPrivateDelegate)_privateDelegate;
- (PKPaymentAuthorizationHostProtocol)hostDelegate;
- (PKPaymentAuthorizationServiceProtocol)serviceProxy;
- (PKPaymentRequest)paymentRequest;
- (double)connectionTimeout;
- (id)_remoteObjectProxy;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (id)presentationCompletionBlock;
- (id)remoteRequestPromisePresentationCompletionBlock;
- (void)_invokeCallbackWithSuccess:(BOOL)a3;
- (void)_setPrivateDelegate:(id)a3;
- (void)_viewServiceTimerFired:(id)a3;
- (void)dealloc;
- (void)dismissWithCompletion:(id)a3;
- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4;
- (void)presentWithCompletion:(id)a3;
- (void)presentWithOrientation:(id)a3 completion:(id)a4;
- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPresent:(BOOL)a3;
- (void)setExportedObject:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setInAppPaymentService:(id)a3;
- (void)setListener:(id)a3;
- (void)setPaymentRequest:(id)a3;
- (void)setPresentationCompletionBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteNetworkPaymentInvokingProcess:(id)a3;
- (void)setRemotePaymentRequestPromised:(BOOL)a3;
- (void)setRemoteRequestPromisePresentationCompletionBlock:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation PKPaymentAuthorizationCoordinator

+ (BOOL)canMakePayments
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL Payments = PKCanMakePayments();
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v10 = @"result";
  v4 = [NSNumber numberWithBool:Payments];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v6 = [v3 dictionaryWithDictionary:v5];

  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 PKSanitizedBundleIdentifier];

  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:@"bundle"];
  }
  AnalyticsSendEvent();

  return Payments;
}

+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 webDomain:(id)a4
{
  return [a1 canMakePaymentsUsingNetworks:a3 capabilities:31 webDomain:a4];
}

+ (BOOL)canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5
{
  return [a1 _canMakePaymentsUsingNetworks:a3 capabilities:a4 webDomain:a5 paymentRequestType:0];
}

+ (BOOL)_canMakePaymentsUsingNetworks:(id)a3 capabilities:(unint64_t)a4 webDomain:(id)a5 paymentRequestType:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  PKCanMakePayments();
  uint64_t PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType(v9, 0, a4, v10, v11);
  v13 = PKMerchantCapabilityToStrings(a4);
  id v14 = v9;
  id v15 = v13;
  id v16 = v10;
  v17 = (void *)MEMORY[0x1E4F1CA60];
  v26 = @"result";
  v18 = [NSNumber numberWithBool:PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType];
  v27[0] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v20 = [v17 dictionaryWithDictionary:v19];

  v21 = [MEMORY[0x1E4F28B50] mainBundle];
  v22 = [v21 PKSanitizedBundleIdentifier];

  if (v22) {
    [v20 setObject:v22 forKeyedSubscript:@"bundle"];
  }
  if (v14 && [v14 count])
  {
    v23 = [v14 componentsJoinedByString:@", "];
    [v20 setObject:v23 forKeyedSubscript:@"networks"];
  }
  if (v15 && [v15 count])
  {
    v24 = [v15 componentsJoinedByString:@", "];
    [v20 setObject:v24 forKeyedSubscript:@"capabilities"];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:@"domain"];
  }
  AnalyticsSendEvent();

  return PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
}

+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3
{
  return [a1 _canMakePaymentsUsingNetworks:a3 capabilities:31 webDomain:0 paymentRequestType:&unk_1EE22BAC8];
}

+ (BOOL)supportsDisbursementsUsingNetworks:(id)a3 capabilities:(unint64_t)a4
{
  return [a1 _canMakePaymentsUsingNetworks:a3 capabilities:a4 webDomain:0 paymentRequestType:&unk_1EE22BAC8];
}

- (PKPaymentAuthorizationCoordinator)initWithDisbursementRequest:(id)a3
{
  id v4 = a3;
  v5 = [[PKDisbursementPaymentRequest alloc] initWithDisbursementRequest:v4];

  v6 = [(PKPaymentAuthorizationCoordinator *)self initWithPaymentRequest:v5];
  return v6;
}

- (PKPaymentAuthorizationCoordinator)init
{
  return [(PKPaymentAuthorizationCoordinator *)self initWithPaymentRequest:0];
}

- (PKPaymentAuthorizationCoordinator)initWithRemotePaymentRequestPromised
{
  v3 = objc_alloc_init(PKPaymentRequest);
  id v4 = [(PKPaymentAuthorizationCoordinator *)self initWithPaymentRequest:v3 remotePaymentRequestPromised:1];

  return v4;
}

- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3
{
  return [(PKPaymentAuthorizationCoordinator *)self initWithPaymentRequest:a3 remotePaymentRequestPromised:0];
}

- (PKPaymentAuthorizationCoordinator)initWithPaymentRequest:(id)a3 remotePaymentRequestPromised:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v4)
  {
    id v9 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Remote Payment Request has been promised, will check validity on fulfillment", buf, 2u);
    }

    id v10 = 0;
    goto LABEL_18;
  }
  if ([v7 requestType] == 10 && objc_msgSend(v8, "APIType") == 2)
  {
    id v11 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial validation for a PKDisbursementRequest originating from the Web", buf, 2u);
    }

    v12 = +[PKDisbursementPaymentRequestValidator validatorWithObject:v8 shouldSkipValidation:1];
    id v40 = 0;
    char v13 = [v12 isValidWithError:&v40];
    id v10 = v40;

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v10;
        _os_log_error_impl(&dword_190E10000, v11, OS_LOG_TYPE_ERROR, "Payment request is invalid: %{public}@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
  else
  {
    id v14 = +[PKPaymentRequestValidator validatorWithObject:v8];
    id v39 = 0;
    char v15 = [v14 isValidWithError:&v39];
    id v10 = v39;

    if ((v15 & 1) == 0)
    {
      v33 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v10;
        v35 = "Payment request is invalid: %{public}@";
        v36 = v33;
        uint32_t v37 = 12;
        goto LABEL_28;
      }
LABEL_22:

LABEL_23:
      v32 = 0;
      goto LABEL_24;
    }
  }
  if (![v8 requestType] && (objc_msgSend(v8, "isPeerPaymentRequest") & 1) == 0)
  {
    id v16 = [v8 supportedNetworks];
    uint64_t v17 = [v8 merchantCapabilities];
    v18 = [v8 originatingURL];
    v19 = [v18 host];
    BOOL v20 = +[PKPaymentAuthorizationCoordinator canMakePaymentsUsingNetworks:v16 capabilities:v17 webDomain:v19];

    if (!v20
      && !+[PKPaymentAuthorizationCoordinator canMakePayments])
    {
      v33 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v35 = "This device cannot make payments.";
        v36 = v33;
        uint32_t v37 = 2;
LABEL_28:
        _os_log_error_impl(&dword_190E10000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
  }
LABEL_18:
  v38.receiver = self;
  v38.super_class = (Class)PKPaymentAuthorizationCoordinator;
  v21 = [(PKPaymentAuthorizationCoordinator *)&v38 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_paymentRequest, a3);
    v22->_remotePaymentRequestPromised = v4;
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passkit.PaymentAuthorization", 0);
    queue = v22->_queue;
    v22->_queue = (OS_dispatch_queue *)v23;

    v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];
    hostIdentifier = v22->_hostIdentifier;
    v22->_hostIdentifier = (NSString *)v26;

    uint64_t v28 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v22->_listener;
    v22->_listener = (NSXPCListener *)v28;

    [(NSXPCListener *)v22->_listener setDelegate:v22];
    v30 = [[PKPaymentAuthorizationCoordinatorExportedObject alloc] initWithController:v22];
    exportedObject = v22->_exportedObject;
    v22->_exportedObject = v30;

    v22->_connectionTimeout = 10.0;
  }
  self = v22;
  v32 = self;
LABEL_24:

  return v32;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationCoordinator;
  [(PKPaymentAuthorizationCoordinator *)&v3 dealloc];
}

- (PKInAppPaymentService)inAppPaymentService
{
  inAppPaymentService = self->_inAppPaymentService;
  if (!inAppPaymentService)
  {
    BOOL v4 = objc_alloc_init(PKInAppPaymentService);
    v5 = self->_inAppPaymentService;
    self->_inAppPaymentService = v4;

    inAppPaymentService = self->_inAppPaymentService;
  }
  return inAppPaymentService;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentAuthorizationCoordinatorDelegate)delegate
{
  return [(PKPaymentAuthorizationCoordinatorExportedObject *)self->_exportedObject delegate];
}

- (void)_setPrivateDelegate:(id)a3
{
}

- (PKPaymentAuthorizationCoordinatorPrivateDelegate)_privateDelegate
{
  return [(PKPaymentAuthorizationCoordinatorExportedObject *)self->_exportedObject privateDelegate];
}

- (void)setServiceProxy:(id)a3
{
  p_serviceProxy = &self->_serviceProxy;
  id v5 = a3;
  objc_storeWeak((id *)p_serviceProxy, v5);
  [(PKPaymentAuthorizationCoordinatorExportedObject *)self->_exportedObject setServiceProxy:v5];
}

- (PKPaymentAuthorizationHostProtocol)hostDelegate
{
  return (PKPaymentAuthorizationHostProtocol *)self->_exportedObject;
}

- (void)presentWithCompletion:(id)a3
{
}

- (void)presentWithOrientation:(id)a3 completion:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = a4;
  if (self->_didPresent)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v7 raise:v8, @"%@ can only present one payment request.", v10 format];
  }
  self->_didPresent = 1;
  id v11 = (void *)[v6 copy];
  id presentationCompletionBlock = self->_presentationCompletionBlock;
  self->_id presentationCompletionBlock = v11;

  char v13 = [(PKPaymentAuthorizationCoordinator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v14 = [v13 presentationSceneIdentifierForPaymentAuthorizationCoordinator:self];
  }
  else
  {
    id v14 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    char v15 = [v13 presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:self];
  }
  else
  {
    char v15 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [v13 analyticsSessionSubjectForPaymentAuthorizationCoordinator:self];
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint32_t v37 = (void *)v16;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v13 analyticsSessionTokenForPaymentAuthorizationCoordinator:self];
  }
  else
  {
    uint64_t v17 = 0;
  }
  int v18 = [v14 hasPrefix:@"UIHostedScene"];
  v19 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v18;
    _os_log_debug_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEBUG, "Presentation: is scene a _UIHostedWindowScene: %d", buf, 8u);
  }

  uint64_t v20 = [(Class)getLNClientConnectionClass[0]() currentAuditToken];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v35 = @"not present";
    if (v20) {
      v35 = @"present";
    }
    *(_DWORD *)buf = 138412290;
    v47 = v35;
    _os_log_debug_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Intent audit token: %@", buf, 0xCu);
  }

  if (self->_remoteNetworkPaymentInvokingProcess)
  {
    if (PKRemoteNetworkPaymentDisableEntitlementCheck())
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Remote network payment universal link entitlement check disabled", buf, 2u);
      }

      LOBYTE(v18) = 1;
    }
    else
    {
      v21 = v15;
      int v22 = [(BSProcessHandle *)self->_remoteNetworkPaymentInvokingProcess hasEntitlement:@"com.apple.private.payment.remote-network-payment-initiate"];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v36 = @"not entitled";
        if (v22) {
          v36 = @"entitled";
        }
        *(_DWORD *)buf = 138412290;
        v47 = v36;
        _os_log_debug_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEBUG, "Presentation: Remote network payment universal link: %@", buf, 0xCu);
      }

      if (v20) {
        char v23 = 1;
      }
      else {
        char v23 = v22;
      }
      LOBYTE(v18) = v23 | v18;
      char v15 = v21;
    }
  }
  else if (v20)
  {
    LOBYTE(v18) = 1;
  }
  [(NSXPCListener *)self->_listener resume];
  int v24 = MKBGetDeviceLockState();
  if (v24 && v24 != 3)
  {
    [(PKPaymentAuthorizationCoordinator *)self _invokeCallbackWithSuccess:0];
    v33 = v37;
    v32 = v38;
  }
  else
  {
    v25 = [(NSXPCListener *)self->_listener endpoint];
    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F1CB00];
      [(PKPaymentAuthorizationCoordinator *)self connectionTimeout];
      objc_msgSend(v26, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__viewServiceTimerFired_, 0, 0);
      v27 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v27;

      v29 = [(PKPaymentAuthorizationCoordinator *)self inAppPaymentService];
      v30 = v15;
      hostIdentifier = self->_hostIdentifier;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke;
      v39[3] = &unk_1E56E2568;
      v39[4] = self;
      id v40 = v14;
      id v41 = v30;
      v32 = v38;
      id v42 = v38;
      char v45 = v18;
      v33 = v37;
      id v43 = v37;
      id v44 = v17;
      v34 = hostIdentifier;
      char v15 = v30;
      [v29 registerPaymentListenerEndpoint:v25 forHostIdentifier:v34 completion:v39];
    }
    else
    {
      [(PKPaymentAuthorizationCoordinator *)self _invokeCallbackWithSuccess:0];
      v33 = v37;
      v32 = v38;
    }
  }
}

void __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke(uint64_t a1, int a2)
{
  BOOL v4 = PKLogFacilityTypeGetObject(7uLL);
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - Presenting payment authorization sheet", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) inAppPaymentService];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 9);
    uint64_t v10 = *(void *)(v8 + 56);
    uint64_t v11 = *(void *)(v8 + 64);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    char v14 = *(unsigned char *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 72);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_64;
    v18[3] = &unk_1E56DD150;
    v18[4] = v8;
    LOBYTE(v17) = v14;
    [v6 presentInAppPaymentInterfaceWithPaymentRequest:v10 awaitingRemoteNetworkPaymentRequest:v9 forHostIdentifier:v11 hostSceneIdentifier:v7 hostSceneBundleIdentifier:v12 orientation:v13 omitPresentationTarget:v17 analyticsSubject:v15 analyticsArchivedSessionToken:v16 completion:v18];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationCoordinator - failed to register payment listener endpoint", buf, 2u);
    }

    [*(id *)(a1 + 32) _invokeCallbackWithSuccess:0];
  }
}

void __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_64(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PKLogFacilityTypeGetObject(7uLL);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v5;
        uint64_t v8 = "PKPaymentAuthorizationCoordinator - Failed to present in-app payment interface: %{public}@";
        uint64_t v9 = v6;
        uint32_t v10 = 12;
LABEL_9:
        _os_log_error_impl(&dword_190E10000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "PKPaymentAuthorizationCoordinator - Failed to present in-app payment interface";
      uint64_t v9 = v6;
      uint32_t v10 = 2;
      goto LABEL_9;
    }

    uint64_t v11 = [*(id *)(a1 + 32) inAppPaymentService];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v12 + 64);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_65;
    v14[3] = &unk_1E56DD7C8;
    v14[4] = v12;
    [v11 registerPaymentListenerEndpoint:0 forHostIdentifier:v13 completion:v14];
  }
}

uint64_t __71__PKPaymentAuthorizationCoordinator_presentWithOrientation_completion___block_invoke_65(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokeCallbackWithSuccess:0];
}

- (void)dismissWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - dismissWithCompletion", buf, 2u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke;
  v9[3] = &unk_1E56D8A18;
  v9[4] = self;
  id v10 = v4;
  BOOL v7 = v9;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __dispatch_async_ar_block_invoke_7;
  char v14 = &unk_1E56D8360;
  id v15 = v7;
  id v8 = v4;
  dispatch_async(queue, buf);
}

void __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke_2;
  uint64_t v9 = &unk_1E56D8A18;
  v2 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v2;
  objc_super v3 = (void (**)(void))_Block_copy(&v6);
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithFailureHandler:", v3, v6, v7, v8, v9, v10);
  id v5 = v4;
  if (v4) {
    [v4 handleDismissWithCompletion:v3];
  }
  else {
    v3[2](v3);
  }
}

void __59__PKPaymentAuthorizationCoordinator_dismissWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationCoordinator - invalidate connection", (uint8_t *)v9, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    id v7 = v5;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __dispatch_async_ar_block_invoke_7;
    v9[3] = &unk_1E56D8360;
    id v10 = v7;
    id v8 = v7;
    dispatch_async(v6, v9);
  }
}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(0x2FuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: fulfillRemotePaymentRequestPromise", buf, 2u);
  }

  uint64_t v9 = (void *)[v7 copy];
  id remoteRequestPromisePresentationCompletionBlock = self->_remoteRequestPromisePresentationCompletionBlock;
  self->_id remoteRequestPromisePresentationCompletionBlock = v9;

  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke;
  v15[3] = &unk_1E56D89F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  uint64_t v12 = v15;
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __dispatch_async_ar_block_invoke_7;
  v21 = &unk_1E56D8360;
  id v22 = v12;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(queue, buf);
}

void __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke_2;
  aBlock[3] = &unk_1E56D8AE0;
  aBlock[4] = *(void *)(a1 + 32);
  v2 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v3 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v2];
  id v4 = v3;
  if (v3) {
    [v3 fulfillRemotePaymentRequestPromise:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else {
    v2[2](v2);
  }
}

void __83__PKPaymentAuthorizationCoordinator_fulfillRemotePaymentRequestPromise_completion___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(0x2FuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: fulfill: invalidate connection", v5, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject(0x2FuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: rejectRemotePaymentRequestPromiseWithFailure: %@", (uint8_t *)&buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke;
  v9[3] = &unk_1E56DE608;
  void v9[4] = self;
  void v9[5] = a3;
  id v8 = v9;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v11 = __dispatch_async_ar_block_invoke_7;
  uint64_t v12 = &unk_1E56D8360;
  id v13 = v8;
  dispatch_async(queue, &buf);
}

void __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke_2;
  aBlock[3] = &unk_1E56D8AE0;
  aBlock[4] = *(void *)(a1 + 32);
  v2 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v3 = [*(id *)(a1 + 32) _remoteObjectProxyWithFailureHandler:v2];
  id v4 = v3;
  if (v3) {
    [v3 rejectRemotePaymentRequestPromiseWithFailure:*(void *)(a1 + 40)];
  }
  else {
    v2[2](v2);
  }
}

void __82__PKPaymentAuthorizationCoordinator_rejectRemotePaymentRequestPromiseWithFailure___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(0x2FuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "AuthorizationCoordinator: reject: invalidate connection", v5, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  connection = self->_connection;
  if (!connection)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke;
    v11[3] = &unk_1E56D8A90;
    v11[4] = self;
    id v12 = v5;
    uint64_t v9 = v11;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_7;
    block[3] = &unk_1E56D8360;
    id v14 = v9;
    dispatch_async(queue, block);
  }
  return connection == 0;
}

void __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_2;
  aBlock[3] = &unk_1E56D8AE0;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = _Block_copy(aBlock);
  id v5 = *(void **)(a1 + 40);
  id v6 = PKPaymentAuthorizationServiceInterface();
  [v5 setRemoteObjectInterface:v6];

  id v7 = *(void **)(a1 + 40);
  id v8 = PKPaymentAuthorizationHostInterface();
  [v7 setExportedInterface:v8];

  [*(id *)(a1 + 40) setExportedObject:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v9 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_3;
  v17[3] = &unk_1E56D8360;
  id v10 = v4;
  id v18 = v10;
  [v9 setInvalidationHandler:v17];
  id v11 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_4;
  v15[3] = &unk_1E56D8360;
  id v16 = v10;
  id v12 = v10;
  [v11 setInterruptionHandler:v15];
  id v13 = *(void **)(*(void *)(a1 + 32) + 72);
  id v14 = [*(id *)(a1 + 40) remoteObjectProxy];
  [v13 setServiceProxy:v14];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 40) resume];
  [*(id *)(a1 + 32) _invokeCallbackWithSuccess:1];
}

void __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  [*(id *)(*(void *)(a1 + 32) + 72) authorizationDidFinishWithError:v2];
}

uint64_t __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__PKPaymentAuthorizationCoordinator_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_remoteObjectProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__PKPaymentAuthorizationCoordinator__remoteObjectProxyWithFailureHandler___block_invoke;
    v9[3] = &unk_1E56D8388;
    id v10 = v4;
    id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  }
  else
  {
    id v7 = [(PKPaymentAuthorizationCoordinator *)self _remoteObjectProxy];
  }

  return v7;
}

uint64_t __74__PKPaymentAuthorizationCoordinator__remoteObjectProxyWithFailureHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invokeCallbackWithSuccess:(BOOL)a3
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKPaymentAuthorizationCoordinator__invokeCallbackWithSuccess___block_invoke;
  v5[3] = &unk_1E56D8B80;
  BOOL v6 = a3;
  v5[4] = self;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_7;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(queue, block);
}

void __64__PKPaymentAuthorizationCoordinator__invokeCallbackWithSuccess___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;
  }
}

- (void)_viewServiceTimerFired:(id)a3
{
}

- (PKPaymentAuthorizationServiceProtocol)serviceProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceProxy);
  return (PKPaymentAuthorizationServiceProtocol *)WeakRetained;
}

- (BSProcessHandle)remoteNetworkPaymentInvokingProcess
{
  return self->_remoteNetworkPaymentInvokingProcess;
}

- (void)setRemoteNetworkPaymentInvokingProcess:(id)a3
{
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
}

- (PKPaymentAuthorizationCoordinatorExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
}

- (id)presentationCompletionBlock
{
  return self->_presentationCompletionBlock;
}

- (void)setPresentationCompletionBlock:(id)a3
{
}

- (BOOL)remotePaymentRequestPromised
{
  return self->_remotePaymentRequestPromised;
}

- (void)setRemotePaymentRequestPromised:(BOOL)a3
{
  self->_remotePaymentRequestPromised = a3;
}

- (id)remoteRequestPromisePresentationCompletionBlock
{
  return self->_remoteRequestPromisePresentationCompletionBlock;
}

- (void)setRemoteRequestPromisePresentationCompletionBlock:(id)a3
{
}

- (void)setInAppPaymentService:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_inAppPaymentService, 0);
  objc_storeStrong(&self->_remoteRequestPromisePresentationCompletionBlock, 0);
  objc_storeStrong(&self->_presentationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteNetworkPaymentInvokingProcess, 0);
  objc_destroyWeak((id *)&self->_serviceProxy);
}

@end