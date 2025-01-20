@interface PKPeerPaymentWebService
+ (id)sharedService;
- (BOOL)_isValidResponse:(id)a3 error:(id)a4;
- (BOOL)canBypassTrustValidation;
- (BOOL)isSharedService;
- (BOOL)needsRegistration;
- (NSString)accountIdentifier;
- (NSURL)peerPaymentServiceURL;
- (PKPeerPaymentService)peerPaymentService;
- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4;
- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5;
- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6;
- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5;
- (PKPeerPaymentWebService)initWithTapToRadarDelegate:(id)a3;
- (PKPeerPaymentWebServiceArchiver)archiver;
- (PKPeerPaymentWebServiceContext)context;
- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice;
- (id)_appleAccountInformation;
- (id)_createDeviceScorerForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5;
- (id)_deviceIdentifier;
- (id)badRequestErrorWithResponse:(id)a3;
- (id)forbiddenErrorWithResponse:(id)a3;
- (int64_t)logFacilityType;
- (unint64_t)peerPaymentAcceptTermsWithIdentifier:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentAccountWithCompletion:(id)a3;
- (unint64_t)peerPaymentAddAssociatedAccountWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentAssociatedAccountActionWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentAssociatedAccountsWithCompletion:(id)a3;
- (unint64_t)peerPaymentBankLookupWithCountryCode:(id)a3 query:(id)a4 completion:(id)a5;
- (unint64_t)peerPaymentDocumentSubmissionRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentEmailTermsWithCompletion:(id)a3;
- (unint64_t)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 withCompletion:(id)a4;
- (unint64_t)peerPaymentFailureDiagnosticWithRequest:(id)a3 withCompletion:(id)a4;
- (unint64_t)peerPaymentIdentityVerificationRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentPassDetailsWithCompletion:(id)a3;
- (unint64_t)peerPaymentPendingRequestPerformAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5;
- (unint64_t)peerPaymentPendingRequestsWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentPerformAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5;
- (unint64_t)peerPaymentPerformQuoteWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentPreferencesWithCompletion:(id)a3;
- (unint64_t)peerPaymentQuoteCertificatesForDestination:(unint64_t)a3 completion:(id)a4;
- (unint64_t)peerPaymentQuoteWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentReOpenAccountWithCompletion:(id)a3;
- (unint64_t)peerPaymentRecipientForRecipientAddress:(id)a3 senderAddress:(id)a4 source:(unint64_t)a5 completion:(id)a6;
- (unint64_t)peerPaymentRecurringPaymentPerformAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
- (unint64_t)peerPaymentRecurringPaymentsForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (unint64_t)peerPaymentRegisterWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5;
- (unint64_t)peerPaymentRemoveAssociatedAccountWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentRequestStatementForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (unint64_t)peerPaymentRequestTokenWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentStatusWithPaymentIdentifier:(id)a3 completion:(id)a4;
- (unint64_t)peerPaymentUnregisterWithCompletion:(id)a3;
- (unint64_t)peerPaymentUpdatePreferencesWithRequest:(id)a3 completion:(id)a4;
- (unint64_t)submitDeviceScoreIdentifiersWithRequest:(id)a3 completion:(id)a4;
- (void)_archiveContext;
- (void)_deviceRegistrationDataWithCompletion:(id)a3;
- (void)_deviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 withCompletion:(id)a6;
- (void)_handleRetryAfterRegisterWithRequest:(id)a3 completionHandler:(id)a4;
- (void)_peerPaymentDeviceMetadataWithCompletion:(id)a3;
- (void)_provideDeviceScoreFeedbackIfNeededForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 ingested:(BOOL)a6;
- (void)_renewAppleAccountWithCompletionHandler:(id)a3;
- (void)_updateRequestWithCurrentTargetDevice:(id)a3;
- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7;
- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5;
- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5;
- (void)prewarmDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5;
- (void)setContext:(id)a3;
- (void)setPeerPaymentService:(id)a3;
- (void)setSharedService:(BOOL)a3;
- (void)sharedPeerPaymentServiceChanged:(id)a3;
- (void)unloadDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5;
- (void)updateDeviceScorersWithEncryptedPayloadVersion:(unint64_t)a3;
@end

@implementation PKPeerPaymentWebService

- (BOOL)needsRegistration
{
  v3 = [(PKPeerPaymentWebService *)self context];
  if (v3)
  {
    v4 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
    if (v4)
    {
      v5 = [(PKPeerPaymentWebService *)self context];
      v6 = [v5 deviceIdentifier];
      BOOL v7 = v6 == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSURL)peerPaymentServiceURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = PKPeerPaymentServiceOverrideURL();
  if (v3)
  {
    v4 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Peer Payment service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    id v5 = v3;
  }
  else
  {
    v6 = [(PKPeerPaymentWebService *)self context];
    id v5 = [v6 serviceURL];
  }
  return (NSURL *)v5;
}

- (PKPeerPaymentWebServiceContext)context
{
  return self->_context;
}

- (PKPeerPaymentWebService)initWithTapToRadarDelegate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKPeerPaymentWebServiceContext);
  v6 = [(PKPeerPaymentWebService *)self initWithContext:v5 targetDevice:0 tapToRadarDelegate:v4];

  return v6;
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4
{
  return [(PKPeerPaymentWebService *)self initWithContext:a3 targetDevice:a4 archiver:0];
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5
{
  return [(PKPeerPaymentWebService *)self initWithContext:a3 targetDevice:a4 archiver:a5 tapToRadarDelegate:0];
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 tapToRadarDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentWebService;
  v11 = [(PKWebService *)&v20 initWithTapToRadarDelegate:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    objc_storeStrong((id *)&v12->_targetDevice, a4);
    v13 = objc_alloc_init(PKSecureElement);
    secureElement = v12->_secureElement;
    v12->_secureElement = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    prewarmedDeviceScorers = v12->_prewarmedDeviceScorers;
    v12->_prewarmedDeviceScorers = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passkit.peerpayment.webservice.devicescorers", 0);
    prewarmedDeviceScorersQueue = v12->_prewarmedDeviceScorersQueue;
    v12->_prewarmedDeviceScorersQueue = (OS_dispatch_queue *)v17;
  }
  return v12;
}

- (PKPeerPaymentWebService)initWithContext:(id)a3 targetDevice:(id)a4 archiver:(id)a5 tapToRadarDelegate:(id)a6
{
  id v11 = a5;
  v12 = [(PKPeerPaymentWebService *)self initWithContext:a3 targetDevice:a4 tapToRadarDelegate:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_archiver, a5);
  }

  return v13;
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKPeerPaymentWebService;
    [(PKWebService *)&v13 performRequest:v8 taskIdentifier:a4 completionHandler:v9];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: Attempting to perform a nil NSURLRequest. Failing with error PKPeerPaymentWebServiceErrorCodeRequiredParameterMissing.", v12, 2u);
    }

    if (v9)
    {
      id v11 = _PKPeerPaymentWebServiceError(4, 0, 0, self->_targetDevice);
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v11);
    }
  }
}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_initWeak(&location, a6);
  id v15 = a7;
  id v16 = objc_loadWeakRetained(&location);
  dispatch_queue_t v17 = [v16 currentRequest];

  uint64_t v18 = [v12 statusCode];
  if (v18 > 448)
  {
    if (v18 == 449)
    {
      v26 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 449. Identity Verification Required.", buf, 2u);
      }

      v23 = [[PKPeerPaymentIdentityVerificationRequiredResponse alloc] initWithData:v14];
      v24 = [(PKPeerPaymentIdentityVerificationRequiredResponse *)v23 prerequisiteIdentifier];
      v27 = objc_alloc_init(PKPeerPaymentIdentityVerificationRequest);
      [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v27];
      [(PKPeerPaymentIdentityVerificationRequest *)v27 setPrerequisiteIdentifier:v24];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __80__PKPeerPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke;
      v29[3] = &unk_1E56E5048;
      v29[4] = self;
      id v31 = v15;
      id v30 = v12;
      [(PKPeerPaymentWebService *)self peerPaymentIdentityVerificationRequest:v27 completion:v29];
    }
    else
    {
      if (v18 != 451)
      {
LABEL_21:
        v23 = (PKPeerPaymentIdentityVerificationRequiredResponse *)objc_loadWeakRetained(&location);
        v28.receiver = self;
        v28.super_class = (Class)PKPeerPaymentWebService;
        [(PKWebService *)&v28 handleResponse:v12 withError:v13 data:v14 task:v23 completionHandler:v15];
LABEL_26:

        goto LABEL_27;
      }
      v22 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 451. Terms Acceptance Required.", buf, 2u);
      }

      v23 = [[PKPeerPaymentTermsAcceptanceResponse alloc] initWithData:v14];
      if ([(PKPeerPaymentIdentityVerificationRequiredResponse *)v23 hasTermsData])
      {
        v34 = @"PKTermsResponseUserInfoKey";
        v35[0] = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      }
      else
      {
        v24 = 0;
      }
      _PKPeerPaymentWebServiceError(5, 0, v24, self->_targetDevice);
      v27 = (PKPeerPaymentIdentityVerificationRequest *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        (*((void (**)(id, void, id, PKPeerPaymentIdentityVerificationRequest *))v15 + 2))(v15, 0, v12, v27);
      }
    }

    goto LABEL_26;
  }
  if (v18 != 301)
  {
    if (v18 == 400)
    {
      v19 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Received Status Code 400. Bad Request.", buf, 2u);
      }

      objc_super v20 = +[PKWebServiceResponse responseWithData:v14];
      uint64_t v21 = [(PKPeerPaymentWebService *)self badRequestErrorWithResponse:v20];

      if (v15) {
        (*((void (**)(id, id, id, uint64_t))v15 + 2))(v15, v14, v12, v21);
      }
      id v13 = (id)v21;
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  v25 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Received Peer Payment Status Code 301. Retry after register.", buf, 2u);
  }

  [(PKPeerPaymentWebService *)self _handleRetryAfterRegisterWithRequest:v17 completionHandler:v15];
LABEL_27:

  objc_destroyWeak(&location);
}

void __80__PKPeerPaymentWebService_handleResponse_withError_data_task_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v10 = @"PKIdentityVerificationResponse";
    v11[0] = v5;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = _PKPeerPaymentWebServiceError(1, 0, v7, *(void **)(a1[4] + 176));
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, a1[5], v8);
  }
}

- (id)badRequestErrorWithResponse:(id)a3
{
  id v4 = [a3 errorCode];
  uint64_t v5 = [v4 integerValue];

  id v6 = _PKPeerPaymentWebServiceError(v5, 0, 0, self->_targetDevice);
  BOOL v7 = [v6 localizedFailureReason];
  id v8 = [v6 localizedRecoverySuggestion];
  uint64_t v9 = [v6 code];
  if (!v9) {
    uint64_t v9 = 40099;
  }
  id v10 = _PKPeerPaymentWebServiceErrorCustom(v9, v7, v8, 0, 0);

  return v10;
}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 errorCode];
  uint64_t v6 = [v5 integerValue];

  BOOL v7 = _PKPeerPaymentWebServiceError(v6, 0, 0, self->_targetDevice);
  id v8 = [v7 localizedFailureReason];
  uint64_t v9 = [v7 localizedRecoverySuggestion];
  uint64_t v10 = [v7 code];
  id v11 = [v4 localizedTitle];
  if (v11)
  {
  }
  else
  {
    id v12 = [v4 localizedDescription];

    if (!v12) {
      goto LABEL_5;
    }
  }
  uint64_t v13 = [v4 localizedTitle];

  uint64_t v14 = [v4 localizedDescription];

  id v8 = (void *)v13;
  uint64_t v9 = (void *)v14;
LABEL_5:
  if (!v10) {
    uint64_t v10 = 40399;
  }
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentWebService;
  id v15 = [(PKWebService *)&v18 forbiddenErrorWithResponse:v4];
  id v16 = _PKPeerPaymentWebServiceErrorCustom(v10, v8, v9, v15, 0);

  return v16;
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id v11 = objc_msgSend(v8, "pk_valueForHTTPHeaderField:", @"PeerPaymentURL");
  if ([v11 length])
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Redirect specifies new peer payment URL: %@", buf, 0xCu);
    }

    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
    uint64_t v14 = [(PKPeerPaymentWebService *)self context];
    id v15 = [v14 pushToken];

    id v16 = [MEMORY[0x1E4F18DA0] propertyForKey:@"PKPeerPaymentEndPointKey" inRequest:v9];
    dispatch_queue_t v17 = v16;
    if (v16 && (unint64_t)([v16 integerValue] - 1) < 2)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Using the webservice to re-register since we are already in passd on target device", buf, 2u);
      }

      objc_super v18 = v28;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke;
      v28[3] = &unk_1E56E5070;
      v28[5] = &v29;
      v28[4] = v10;
      [(PKPeerPaymentWebService *)self peerPaymentRegisterWithURL:v13 pushToken:v15 completion:v28];
    }
    else
    {
      char v19 = objc_opt_respondsToSelector();
      v25 = v11;
      id v20 = v9;
      uint64_t v21 = v13;
      targetDevice = self->_targetDevice;
      if (v19)
      {
        objc_super v18 = v27;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_2;
        v27[3] = &unk_1E56E5098;
        v27[5] = &v29;
        v27[4] = v10;
        v23 = targetDevice;
        uint64_t v13 = v21;
        [(PKPeerPaymentWebServiceTargetDeviceProtocol *)v23 peerPaymentReRegisterWithURL:v21 pushToken:v15 peerPaymentWebService:self completion:v27];
        id v9 = v20;
        id v11 = v25;
      }
      else
      {
        uint64_t v13 = v21;
        id v9 = v20;
        id v11 = v25;
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "targetDevice cannot peer payment register. Aborting original request", buf, 2u);
          }

          (*((void (**)(id, void))v10 + 2))(v10, 0);
          goto LABEL_15;
        }
        v24 = self->_targetDevice;
        objc_super v18 = v26;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_3;
        v26[3] = &unk_1E56E5098;
        v26[5] = &v29;
        v26[4] = v10;
        [(PKPeerPaymentWebServiceTargetDeviceProtocol *)v24 peerPaymentReRegisterWithURL:v13 pushToken:v15 completion:v26];
      }
    }

LABEL_15:
    goto LABEL_16;
  }
  (*((void (**)(id, void))v10 + 2))(v10, *((unsigned __int8 *)v30 + 24));
LABEL_16:

  _Block_object_dispose(&v29, 8);
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  char v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  if (a3) {
    char v3 = 0;
  }
  else {
    char v3 = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __104__PKPeerPaymentWebService_handleWillPerformHTTPRedirectionWithResponse_originalRequest_redirectHandler___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  if (a3) {
    char v3 = 0;
  }
  else {
    char v3 = a2;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (int64_t)logFacilityType
{
  return 11;
}

+ (id)sharedService
{
  v2 = (void *)qword_1E92D9A58;
  if (!qword_1E92D9A58)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_11_0);
    if (!qword_1E92D9A58)
    {
      char v3 = +[PKPeerPaymentService sharedInstance];
      char v4 = [v3 sharedPeerPaymentWebServiceContext];
      if (v4)
      {
        uint64_t v5 = [[PKSharedPeerPaymentWebServiceArchiver alloc] initWithPeerPaymentService:v3];
        uint64_t v6 = [PKPeerPaymentWebService alloc];
        BOOL v7 = [[PKPeerPaymentWebServiceTargetDevice alloc] initWithTargetDeviceDelegate:v3];
        uint64_t v8 = [(PKPeerPaymentWebService *)v6 initWithContext:v4 targetDevice:v7 archiver:v5];
        id v9 = (void *)qword_1E92D9A58;
        qword_1E92D9A58 = v8;

        [(id)qword_1E92D9A58 setSharedService:1];
        objc_storeStrong((id *)(qword_1E92D9A58 + 184), v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_11_0);
    v2 = (void *)qword_1E92D9A58;
    if (!qword_1E92D9A58)
    {
      id v10 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_error_impl(&dword_190E10000, v10, OS_LOG_TYPE_ERROR, "Failed to get the shared peer payment web service, therefore +[PKPeerPaymentWebService sharedService] is not available. This is likely an entitlements issue or passd hasn't initialized yet.", v12, 2u);
      }

      v2 = (void *)qword_1E92D9A58;
    }
  }
  return v2;
}

- (void)setSharedService:(BOOL)a3
{
  self->_sharedService = a3;
  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 addObserver:self selector:sel_sharedPeerPaymentServiceChanged_ name:@"PDSharedPeerPaymentWebServiceDidChangeNotification" object:0 suspensionBehavior:2];
}

- (void)sharedPeerPaymentServiceChanged:(id)a3
{
  if ([(PKPeerPaymentWebService *)self isSharedService])
  {
    peerPaymentService = self->_peerPaymentService;
    if (!peerPaymentService)
    {
      uint64_t v5 = objc_alloc_init(PKPeerPaymentService);
      uint64_t v6 = self->_peerPaymentService;
      self->_peerPaymentService = v5;

      peerPaymentService = self->_peerPaymentService;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKPeerPaymentWebService_sharedPeerPaymentServiceChanged___block_invoke;
    v7[3] = &unk_1E56E50C0;
    v7[4] = self;
    [(PKPeerPaymentService *)peerPaymentService sharedPeerPaymentWebServiceContextWithCompletion:v7];
  }
}

void __59__PKPeerPaymentWebService_sharedPeerPaymentServiceChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setContext:v3];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"PKSharedPeerPaymentWebServiceDidChangeNotification" object:0];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Received PDSharedPeerPaymentWebServiceDidChangeNotification, however [PKPaymentService sharedPeerPaymentWebServiceContextWithCompletion:] returned nil. Ignoring.", v5, 2u);
    }
  }
}

- (NSString)accountIdentifier
{
  v2 = [(PKPeerPaymentService *)self->_peerPaymentService account];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)canBypassTrustValidation
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentWebService;
  if ([(PKWebService *)&v8 canBypassTrustValidation]) {
    return 1;
  }
  id v3 = [(PKPeerPaymentWebService *)self context];
  int v4 = [v3 devSigned];

  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Allowing bypass of extended trust validation by dev-signed SE", v7, 2u);
    }

    return 1;
  }
  return 0;
}

- (unint64_t)peerPaymentRegisterWithURL:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke;
    v16[3] = &unk_1E56E5188;
    v16[4] = self;
    id v19 = v10;
    id v17 = v9;
    id v18 = v8;
    unint64_t v20 = v11;
    [(PKPeerPaymentWebService *)self _deviceScoreForEndpoint:@"registration" recipientAddress:0 quoteDestinationType:0 withCompletion:v16];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error: Asked to register with a nil service url.", v15, 2u);
    }

    if (v10)
    {
      uint64_t v13 = _PKPeerPaymentWebServiceError(4, 0, 0, self->_targetDevice);
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
    }
  }

  return v11;
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the registration endpoint. %@", buf, 0xCu);
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_159;
  v21[3] = &unk_1E56E5138;
  id v15 = *(id *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(a1 + 40);
  id v26 = v15;
  v21[4] = v16;
  id v22 = v17;
  id v23 = *(id *)(a1 + 48);
  id v24 = (id)v10;
  uint64_t v18 = *(void *)(a1 + 64);
  id v25 = (id)v11;
  uint64_t v27 = v18;
  id v19 = (id)v11;
  id v20 = (id)v10;
  [v14 _deviceRegistrationDataWithCompletion:v21];
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Error: Failed to get device data for registration with error: %@.", buf, 0xCu);
    }

    uint64_t v19 = *(void *)(a1 + 72);
    if (!v19) {
      goto LABEL_15;
    }
    id v20 = *(void (**)(void))(v19 + 16);
    goto LABEL_14;
  }
  uint64_t v7 = [v5 devSigned];
  if (os_variant_has_internal_ui())
  {
    if (v7)
    {
      id v8 = PKStockholmEnvironmentName();
      char v9 = [v8 containsString:@"QA"];

      if ((v9 & 1) == 0)
      {
        uint64_t v21 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_190E10000, v21, OS_LOG_TYPE_ERROR, "******** ERROR: Using DevSE with non QA Enviroment - refusing to register **********", buf, 2u);
        }

        uint64_t v22 = *(void *)(a1 + 72);
        if (!v22) {
          goto LABEL_15;
        }
        id v20 = *(void (**)(void))(v22 + 16);
LABEL_14:
        v20();
LABEL_15:
        [*(id *)(a1 + 32) _provideDeviceScoreFeedbackIfNeededForEndpoint:@"registration" recipientAddress:0 quoteDestinationType:0 ingested:0];
        goto LABEL_16;
      }
    }
  }
  unint64_t v10 = [*(id *)(a1 + 32) context];
  [v10 setDevSigned:v7];

  unint64_t v11 = objc_alloc_init(PKPeerPaymentServiceRegistrationRequest);
  [*(id *)(a1 + 32) _updateRequestWithCurrentTargetDevice:v11];
  [(PKPeerPaymentServiceRegistrationRequest *)v11 setDeviceData:v5];
  [(PKPeerPaymentServiceRegistrationRequest *)v11 setPushToken:*(void *)(a1 + 40)];
  id v12 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_164;
  v23[3] = &unk_1E56E5110;
  id v24 = v11;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v25 = v13;
  uint64_t v26 = v14;
  id v27 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 80);
  id v28 = v15;
  uint64_t v31 = v16;
  id v29 = v5;
  id v30 = *(id *)(a1 + 72);
  id v17 = v11;
  [v12 _peerPaymentDeviceMetadataWithCompletion:v23];

LABEL_16:
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_164(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  uint64_t v7 = [v5 _appleAccountInformation];
  id v8 = [*(id *)(a1 + 48) _deviceIdentifier];
  char v9 = [v3 _urlRequestWithServiceURL:v4 appleAccountInformation:v7 deviceIdentifier:v8 deviceScore:*(void *)(a1 + 56) odiAssessment:*(void *)(a1 + 64) deviceMetadata:v6];

  unint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_2;
  v12[3] = &unk_1E56E50E8;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 80);
  [v10 performRequest:v9 taskIdentifier:v11 completionHandler:v12];
}

void __75__PKPeerPaymentWebService_peerPaymentRegisterWithURL_pushToken_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (![*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  if (!v7 || v8)
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment registration request failed with error %@", (uint8_t *)&v14, 0xCu);
    }

LABEL_11:
    char v9 = 0;
    goto LABEL_15;
  }
  char v9 = [[PKPeerPaymentServiceRegistrationResponse alloc] initWithData:v7];
  unint64_t v10 = [(PKPeerPaymentServiceRegistrationResponse *)v9 deviceIdentifier];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) context];
    [v11 updateContextWithDeviceRegistrationData:*(void *)(a1 + 40) registrationResponse:v9];
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment registration response does not have a device identifier", (uint8_t *)&v14, 2u);
    }
  }

  [*(id *)(a1 + 32) _archiveContext];
  id v8 = 0;
LABEL_15:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, PKPeerPaymentServiceRegistrationResponse *, id))(v13 + 16))(v13, v9, v8);
  }
  [*(id *)(a1 + 32) _provideDeviceScoreFeedbackIfNeededForEndpoint:@"registration" recipientAddress:0 quoteDestinationType:0 ingested:1];
}

- (unint64_t)peerPaymentUnregisterWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  if ([(PKPeerPaymentWebService *)self needsRegistration])
  {
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    id v7 = objc_alloc_init(PKPeerPaymentServiceUnregisterRequest);
    [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
    id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
    char v9 = [(PKPeerPaymentWebService *)self _deviceIdentifier];
    unint64_t v10 = [(PKPeerPaymentServiceUnregisterRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8 deviceIdentifier:v9];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__PKPeerPaymentWebService_peerPaymentUnregisterWithCompletion___block_invoke;
    v12[3] = &unk_1E56E0EC8;
    v12[4] = self;
    uint64_t v13 = v4;
    [(PKPeerPaymentWebService *)self performRequest:v10 taskIdentifier:v5 completionHandler:v12];
  }
  return v5;
}

void __63__PKPeerPaymentWebService_peerPaymentUnregisterWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([*(id *)(a1 + 32) _isValidResponse:v6 error:v7] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v6 statusCode] == 404)
  {
    id v8 = objc_alloc_init(PKPeerPaymentWebServiceContext);
    [*(id *)(a1 + 32) setContext:v8];
    [*(id *)(a1 + 32) _archiveContext];

    uint64_t v9 = 1;
  }
  else
  {
    if (!v7)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment unregister request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v7);
  }
}

- (unint64_t)peerPaymentAcceptTermsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = objc_alloc_init(PKPeerPaymentAcceptTermsRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  [(PKPeerPaymentAcceptTermsRequest *)v10 setTermsIdentifier:v7];

  uint64_t v11 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  int v12 = [(PKPeerPaymentWebService *)self _deviceIdentifier];
  id v13 = [(PKPeerPaymentAcceptTermsRequest *)v10 _urlRequestWithServiceURL:v9 appleAccountInformation:v11 deviceIdentifier:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PKPeerPaymentWebService_peerPaymentAcceptTermsWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E56E0EC8;
  v16[4] = self;
  id v17 = v6;
  id v14 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __75__PKPeerPaymentWebService_peerPaymentAcceptTermsWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) _isValidResponse:a3 error:v6];
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment accept terms request failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);
  }
}

- (unint64_t)peerPaymentPassDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  uint64_t v7 = objc_alloc_init(PKPeerPaymentPassDetailsRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v9 = [(PKPeerPaymentWebService *)self _deviceIdentifier];
  int v10 = [(PKPeerPaymentPassDetailsRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8 deviceIdentifier:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKPeerPaymentWebService_peerPaymentPassDetailsWithCompletion___block_invoke;
  v13[3] = &unk_1E56E0EC8;
  v13[4] = self;
  id v14 = v4;
  id v11 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v10 taskIdentifier:v5 completionHandler:v13];

  return v5;
}

void __64__PKPeerPaymentWebService_peerPaymentPassDetailsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      uint64_t v9 = [[PKPeerPaymentPassDetailsResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    int v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pass details request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentPassDetailsResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v7 = objc_alloc_init(PKPeerPaymentAccountRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v9 = [(PKPeerPaymentAccountRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKPeerPaymentWebService_peerPaymentAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v9 taskIdentifier:v5 completionHandler:v12];

  return v5;
}

void __60__PKPeerPaymentWebService_peerPaymentAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      uint64_t v9 = [[PKPeerPaymentAccountResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentAccountResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentAssociatedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v7 = objc_alloc_init(PKPeerPaymentAssociatedAccountsRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v9 = [(PKPeerPaymentAssociatedAccountsRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKPeerPaymentWebService_peerPaymentAssociatedAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v9 taskIdentifier:v5 completionHandler:v12];

  return v5;
}

void __71__PKPeerPaymentWebService_peerPaymentAssociatedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      uint64_t v9 = [[PKPeerPaymentAssociatedAccountsResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment asscoaited accounts request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentAssociatedAccountsResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentRecipientForRecipientAddress:(id)a3 senderAddress:(id)a4 source:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  unint64_t v13 = [(PKWebService *)self nextTaskID];
  uint64_t v14 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v15 = objc_alloc_init(PKPeerPaymentRecipientRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v15];
  [(PKPeerPaymentRecipientRequest *)v15 setRecipientAddress:v10];
  [(PKPeerPaymentRecipientRequest *)v15 setRecipientAddressSource:a5];
  [(PKPeerPaymentRecipientRequest *)v15 setSenderAddress:v12];

  uint64_t v16 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v17 = [(PKPeerPaymentWebService *)self _deviceIdentifier];
  uint64_t v18 = [(PKPeerPaymentRecipientRequest *)v15 _urlRequestWithServiceURL:v14 appleAccountInformation:v16 deviceIdentifier:v17];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__PKPeerPaymentWebService_peerPaymentRecipientForRecipientAddress_senderAddress_source_completion___block_invoke;
  v22[3] = &unk_1E56E50E8;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v19 = v11;
  id v20 = v10;
  [(PKPeerPaymentWebService *)self performRequest:v18 taskIdentifier:v13 completionHandler:v22];

  return v13;
}

void __99__PKPeerPaymentWebService_peerPaymentRecipientForRecipientAddress_senderAddress_source_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      uint64_t v9 = [[PKPeerPaymentRecipientResponse alloc] initWithData:v7];
      id v10 = [(PKPeerPaymentRecipientResponse *)v9 recipient];
      [v10 setPhoneOrEmail:*(void *)(a1 + 40)];

      id v8 = 0;
      goto LABEL_11;
    }
    id v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment recipient lookup request failed with error %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = 0;
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, PKPeerPaymentRecipientResponse *, id))(v12 + 16))(v12, v9, v8);
  }
}

- (unint64_t)peerPaymentRequestTokenWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v10 = [v6 recipientPhoneOrEmail];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke;
  v15[3] = &unk_1E56E5188;
  v15[4] = self;
  id v16 = v6;
  id v18 = v7;
  unint64_t v19 = v8;
  id v17 = v9;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  [(PKPeerPaymentWebService *)self _deviceScoreForEndpoint:@"requestToken" recipientAddress:v10 quoteDestinationType:1 withCompletion:v15];

  return v8;
}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    id v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the request token endpoint. %@", buf, 0xCu);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_181;
  v21[3] = &unk_1E56E5110;
  id v14 = *(void **)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  id v23 = v15;
  uint64_t v24 = v16;
  id v25 = (id)v10;
  id v26 = (id)v11;
  id v17 = *(void **)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 64);
  id v27 = v9;
  id v28 = v17;
  id v18 = v9;
  id v19 = (id)v11;
  id v20 = (id)v10;
  [v14 _peerPaymentDeviceMetadataWithCompletion:v21];
}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_181(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v7 = [v5 _appleAccountInformation];
  unint64_t v8 = [*(id *)(a1 + 48) _deviceIdentifier];
  id v9 = [v3 _urlRequestWithServiceURL:v4 appleAccountInformation:v7 deviceIdentifier:v8 deviceScore:*(void *)(a1 + 56) odiAssessment:*(void *)(a1 + 64) deviceMetadata:v6];

  unint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56E5160;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 80);
  [v10 performRequest:v9 taskIdentifier:v11 completionHandler:v12];
}

void __73__PKPeerPaymentWebService_peerPaymentRequestTokenWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (![*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    id v9 = 0;
    goto LABEL_16;
  }
  if (!v7 || v8)
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment request token request failed with error %@", (uint8_t *)&v19, 0xCu);
    }

    id v13 = [v8 domain];
    if ([v13 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"])
    {
      uint64_t v14 = [v8 code];

      if (v14 == 40312)
      {
        uint64_t v15 = _PKPeerPaymentWebServiceError(40001, v8, 0, *(void **)(*(void *)(a1 + 32) + 176));

        id v9 = 0;
        id v8 = (id)v15;
        goto LABEL_16;
      }
    }
    else
    {
    }
    goto LABEL_15;
  }
  id v9 = [[PKPeerPaymentRequestTokenResponse alloc] initWithData:v7 deviceScoreIdentifier:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    unint64_t v10 = +[PKPeerPaymentRecipientCache sharedCache];
    uint64_t v11 = [*(id *)(a1 + 56) recipientPhoneOrEmail];
    [v10 noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:v11];
  }
  id v8 = 0;
LABEL_16:
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, PKPeerPaymentRequestTokenResponse *, id))(v16 + 16))(v16, v9, v8);
  }
  id v17 = *(void **)(a1 + 32);
  id v18 = [*(id *)(a1 + 56) recipientPhoneOrEmail];
  [v17 _provideDeviceScoreFeedbackIfNeededForEndpoint:@"requestToken" recipientAddress:v18 quoteDestinationType:1 ingested:1];
}

- (unint64_t)peerPaymentPendingRequestsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PKPeerPaymentWebService_peerPaymentPendingRequestsWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __76__PKPeerPaymentWebService_peerPaymentPendingRequestsWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentPendingRequestsResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    unint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pending requests request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentPendingRequestsResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentPendingRequestPerformAction:(id)a3 withRequestToken:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  int v12 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v13 = objc_alloc_init(PKPeerPaymentPendingRequestPerformActionRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v13];
  [(PKPeerPaymentPendingRequestPerformActionRequest *)v13 setAction:v10];

  [(PKPeerPaymentPendingRequestPerformActionRequest *)v13 setRequestToken:v9];
  uint64_t v14 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v15 = [(PKPeerPaymentPendingRequestPerformActionRequest *)v13 _urlRequestWithServiceURL:v12 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PKPeerPaymentWebService_peerPaymentPendingRequestPerformAction_withRequestToken_completion___block_invoke;
  v18[3] = &unk_1E56E0EC8;
  v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  [(PKPeerPaymentWebService *)self performRequest:v15 taskIdentifier:v11 completionHandler:v18];

  return v11;
}

void __94__PKPeerPaymentWebService_peerPaymentPendingRequestPerformAction_withRequestToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentPendingRequestPerformActionResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment pending request action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentPendingRequestPerformActionResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentQuoteWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v10 = [v6 recipientPhoneOrEmail];
  uint64_t v11 = [v6 destination];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke;
  v16[3] = &unk_1E56E5188;
  v16[4] = self;
  id v17 = v6;
  id v19 = v7;
  unint64_t v20 = v8;
  id v18 = v9;
  id v12 = v7;
  id v13 = v9;
  id v14 = v6;
  [(PKPeerPaymentWebService *)self _deviceScoreForEndpoint:@"quote" recipientAddress:v10 quoteDestinationType:v11 withCompletion:v16];

  return v8;
}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    id v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the quote endpoint. %@", buf, 0xCu);
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_187;
  v20[3] = &unk_1E56E51D8;
  id v14 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  id v22 = v15;
  uint64_t v23 = v16;
  id v24 = (id)v10;
  id v25 = (id)v11;
  id v17 = *(void **)(a1 + 56);
  uint64_t v27 = *(void *)(a1 + 64);
  id v26 = v17;
  id v18 = (id)v11;
  id v19 = (id)v10;
  [v14 _peerPaymentDeviceMetadataWithCompletion:v20];
}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_187(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v7 = [v5 _appleAccountInformation];
  unint64_t v8 = [*(id *)(a1 + 48) _deviceIdentifier];
  id v9 = [v3 _urlRequestWithServiceURL:v4 appleAccountInformation:v7 deviceIdentifier:v8 deviceScore:*(void *)(a1 + 56) odiAssessment:*(void *)(a1 + 64) deviceMetadata:v6];

  unint64_t v10 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56E51B0;
  v12[4] = v10;
  uint64_t v11 = *(void *)(a1 + 80);
  id v14 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 32);
  [v10 performRequest:v9 taskIdentifier:v11 completionHandler:v12];
}

void __66__PKPeerPaymentWebService_peerPaymentQuoteWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = +[PKPeerPaymentService sharedInstance];
      unint64_t v10 = [v9 account];

      uint64_t v11 = [v10 recurringPaymentsFeatureDescriptor];
      id v12 = [v11 productTimeZone];

      id v13 = [[PKPeerPaymentQuoteResponse alloc] initWithData:v7 productTimeZone:v12];
      id v8 = 0;
      goto LABEL_14;
    }
    id v14 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment Quote request failed with error %@", (uint8_t *)&v21, 0xCu);
    }

    id v15 = [v8 domain];
    if ([v15 isEqualToString:@"PKPeerPaymentWebServiceErrorDomain"])
    {
      uint64_t v16 = [v8 code];

      if (v16 == 40312)
      {
        uint64_t v17 = _PKPeerPaymentWebServiceError(40001, v8, 0, *(void **)(*(void *)(a1 + 32) + 176));

        id v13 = 0;
        id v8 = (id)v17;
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = 0;
LABEL_14:
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, PKPeerPaymentQuoteResponse *, id))(v18 + 16))(v18, v13, v8);
  }
  id v19 = *(void **)(a1 + 32);
  unint64_t v20 = [*(id *)(a1 + 40) recipientPhoneOrEmail];
  objc_msgSend(v19, "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", @"quote", v20, objc_msgSend(*(id *)(a1 + 40), "destination"), 1);
}

- (unint64_t)peerPaymentQuoteCertificatesForDestination:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKWebService *)self nextTaskID];
  id v8 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v9 = objc_alloc_init(PKPeerPaymentQuoteCertificatesRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  [(PKPeerPaymentQuoteCertificatesRequest *)v9 setDestination:a3];
  unint64_t v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [(PKPeerPaymentQuoteCertificatesRequest *)v9 _urlRequestWithServiceURL:v8 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPeerPaymentWebService_peerPaymentQuoteCertificatesForDestination_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v7 completionHandler:v14];

  return v7;
}

void __81__PKPeerPaymentWebService_peerPaymentQuoteCertificatesForDestination_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentQuoteCertificatesResponse alloc] initWithData:v7];
      unint64_t v10 = [*(id *)(a1 + 32) context];
      -[PKPeerPaymentQuoteCertificatesResponse setDevSigned:](v9, "setDevSigned:", [v10 devSigned]);

      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Peer Payment Quote Certificates request failed with error %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, PKPeerPaymentQuoteCertificatesResponse *, id))(v12 + 16))(v12, v9, v8);
  }
}

- (unint64_t)peerPaymentIdentityVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = [(PKPeerPaymentWebService *)self context];
  objc_msgSend(v6, "setDevSigned:", objc_msgSend(v10, "devSigned"));

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E56E5200;
  id v23 = v7;
  unint64_t v24 = v8;
  aBlock[4] = self;
  id v11 = v7;
  uint64_t v12 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_193;
  v17[3] = &unk_1E56E5250;
  id v18 = v6;
  id v19 = self;
  id v20 = v9;
  id v21 = v12;
  id v13 = v12;
  id v14 = v9;
  id v15 = v6;
  [(PKPeerPaymentWebService *)self _peerPaymentDeviceMetadataWithCompletion:v17];

  return v8;
}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2;
  v5[3] = &unk_1E56E0EC8;
  v5[4] = v3;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 performRequest:a2 taskIdentifier:v4 completionHandler:v5];
}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = +[PKWebServiceResponse responseWithData:v7];
      goto LABEL_11;
    }
    unint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment identity verification response failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v9, v8);
  }
}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_193(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] hasOverlayParameters])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2_194;
    v12[3] = &unk_1E56E5228;
    id v4 = a1[5];
    id v13 = a1[4];
    id v5 = a1[6];
    id v6 = a1[5];
    id v14 = v5;
    id v15 = v6;
    id v16 = v3;
    id v17 = a1[7];
    [v4 _deviceScoreForEndpoint:@"identityVerification" recipientAddress:0 quoteDestinationType:0 withCompletion:v12];
  }
  else
  {
    id v7 = a1[6];
    id v8 = a1[4];
    id v9 = [a1[5] _appleAccountInformation];
    unint64_t v10 = [a1[5] _deviceIdentifier];
    uint64_t v11 = [v8 _urlRequestWithServiceURL:v7 appleAccountInformation:v9 deviceIdentifier:v10 deviceScore:0 odiAssessment:0 deviceMetadata:v3];

    (*((void (**)(void))a1[7] + 2))();
  }
}

void __77__PKPeerPaymentWebService_peerPaymentIdentityVerificationRequest_completion___block_invoke_2_194(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    id v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the identity verification endpoint. %@", (uint8_t *)&v19, 0xCu);
    }
  }
  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 48) _appleAccountInformation];
  id v17 = [*(id *)(a1 + 48) _deviceIdentifier];
  id v18 = [v14 _urlRequestWithServiceURL:v15 appleAccountInformation:v16 deviceIdentifier:v17 deviceScore:v10 odiAssessment:v11 deviceMetadata:*(void *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 48) _provideDeviceScoreFeedbackIfNeededForEndpoint:@"identityVerification" recipientAddress:0 quoteDestinationType:0 ingested:1];
}

- (unint64_t)peerPaymentDocumentSubmissionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  unint64_t v11 = [v6 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke;
  v15[3] = &unk_1E56E50E8;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v15];

  return v8;
}

void __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (![*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  if (!v7 || v8)
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 138412290;
      *(void *)((char *)&block + 4) = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment Submit Document request failed with error %@", (uint8_t *)&block, 0xCu);
    }

LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  id v9 = [[PKPeerPaymentDocumentSubmissionResponse alloc] initWithData:v7];
  if (os_variant_has_internal_ui() && PKCIPSaveImages())
  {
    unint64_t v10 = dispatch_get_global_queue(0, 0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke_2;
    v14[3] = &unk_1E56D8AE0;
    id v15 = *(id *)(a1 + 40);
    unint64_t v11 = v14;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    id v17 = __dispatch_async_ar_block_invoke_9;
    id v18 = &unk_1E56D8360;
    id v19 = v11;
    dispatch_async(v10, &block);
  }
  id v8 = 0;
LABEL_14:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, PKPeerPaymentDocumentSubmissionResponse *, id))(v13 + 16))(v13, v9, v8);
  }
}

void __75__PKPeerPaymentWebService_peerPaymentDocumentSubmissionRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyyMMddHHmmss"];
  id v29 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_msgSend(v2, "stringFromDate:");
  id v4 = PKCIPDirectoryPath();
  id v5 = [NSString stringWithFormat:@"%@-front.jpg", v3];
  id v6 = [v4 stringByAppendingPathComponent:v5];

  id v7 = [NSString stringWithFormat:@"%@-back.jpg", v3];
  id v8 = [v4 stringByAppendingPathComponent:v7];

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v10 = PKCIPDirectoryPath();
  char v11 = [v9 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v13 = PKCIPDirectoryPath();
    [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v14 = [*(id *)(a1 + 32) frontImageData];
  id v15 = v14;
  if (v14)
  {
    id v31 = 0;
    int v16 = [v14 writeToFile:v6 options:1 error:&v31];
    id v17 = v31;
    if (v16)
    {
      id v18 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      id v19 = "Saved frontImageData to: '%@'";
      uint64_t v20 = v18;
      uint32_t v21 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    id v17 = 0;
  }
  id v18 = PKLogFacilityTypeGetObject(6uLL);
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_11;
  }
  *(_DWORD *)buf = 138412546;
  id v33 = v6;
  __int16 v34 = 2112;
  id v35 = v17;
  id v19 = "Failed to save frontImageData to: '%@'; error: %@";
  uint64_t v20 = v18;
  uint32_t v21 = 22;
LABEL_10:
  _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_11:

  id v22 = [*(id *)(a1 + 32) backImageData];

  if (v22)
  {
    id v30 = v17;
    int v23 = [v22 writeToFile:v8 options:1 error:&v30];
    id v24 = v30;

    if (v23)
    {
      id v25 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v8;
        id v26 = "Saved backImageData to: '%@'";
        uint64_t v27 = v25;
        uint32_t v28 = 12;
LABEL_18:
        _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v24 = v17;
  }
  id v25 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v24;
    id v26 = "Failed to save backImageData to: '%@'; error: %@";
    uint64_t v27 = v25;
    uint32_t v28 = 22;
    goto LABEL_18;
  }
LABEL_19:
}

- (unint64_t)peerPaymentPerformQuoteWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = [(PKPeerPaymentWebService *)self context];
  char v11 = [v10 pushToken];
  [v6 setPushToken:v11];

  id v12 = [(PKPeerPaymentWebService *)self context];
  uint64_t v13 = [v12 signedEnrollmentDataSignature];
  [v6 setSignedEnrollmentDataSignature:v13];

  id v14 = [v6 recipientPhoneOrEmail];
  uint64_t v15 = [v6 destination];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke;
  v20[3] = &unk_1E56E5188;
  void v20[4] = self;
  id v21 = v6;
  id v23 = v7;
  unint64_t v24 = v8;
  id v22 = v9;
  id v16 = v7;
  id v17 = v9;
  id v18 = v6;
  [(PKPeerPaymentWebService *)self _deviceScoreForEndpoint:@"performQuote" recipientAddress:v14 quoteDestinationType:v15 withCompletion:v20];

  return v8;
}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  if (!(v10 | v11))
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Note: No device score was provided for the perform quote endpoint. %@", buf, 0xCu);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_210;
  v21[3] = &unk_1E56E5110;
  id v14 = *(void **)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  id v23 = v15;
  uint64_t v24 = v16;
  id v25 = (id)v10;
  id v26 = (id)v11;
  id v17 = *(void **)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 64);
  id v27 = v9;
  id v28 = v17;
  id v18 = v9;
  id v19 = (id)v11;
  id v20 = (id)v10;
  [v14 _peerPaymentDeviceMetadataWithCompletion:v21];
}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_210(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = a2;
  id v7 = [v5 _appleAccountInformation];
  unint64_t v8 = [*(id *)(a1 + 48) _deviceIdentifier];
  id v9 = [v3 _urlRequestWithServiceURL:v4 appleAccountInformation:v7 deviceIdentifier:v8 deviceScore:*(void *)(a1 + 56) odiAssessment:*(void *)(a1 + 64) deviceMetadata:v6];

  unint64_t v10 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56E5160;
  void v12[4] = v10;
  id v13 = *(id *)(a1 + 72);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 80);
  [v10 performRequest:v9 taskIdentifier:v11 completionHandler:v12];
}

void __73__PKPeerPaymentWebService_peerPaymentPerformQuoteWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (![*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (!v7 || v8)
  {
    id v12 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment perform request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  id v9 = [[PKPeerPaymentPerformResponse alloc] initWithData:v7 deviceScoreIdentifier:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    unint64_t v10 = +[PKPeerPaymentRecipientCache sharedCache];
    uint64_t v11 = [*(id *)(a1 + 56) recipientPhoneOrEmail];
    [v10 noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:v11];
  }
  id v8 = 0;
LABEL_13:
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13) {
    (*(void (**)(uint64_t, PKPeerPaymentPerformResponse *, id))(v13 + 16))(v13, v9, v8);
  }
  id v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 56) recipientPhoneOrEmail];
  objc_msgSend(v14, "_provideDeviceScoreFeedbackIfNeededForEndpoint:recipientAddress:quoteDestinationType:ingested:", @"performQuote", v15, objc_msgSend(*(id *)(a1 + 56), "destination"), 1);
}

- (unint64_t)peerPaymentStatusWithPaymentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  unint64_t v10 = objc_alloc_init(PKPeerPaymentStatusRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  [(PKPeerPaymentStatusRequest *)v10 setPaymentIdentifier:v7];

  uint64_t v11 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v12 = [(PKPeerPaymentStatusRequest *)v10 _urlRequestWithServiceURL:v9 appleAccountInformation:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PKPeerPaymentWebService_peerPaymentStatusWithPaymentIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56E0EC8;
  v15[4] = self;
  id v16 = v6;
  id v13 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v12 taskIdentifier:v8 completionHandler:v15];

  return v8;
}

void __77__PKPeerPaymentWebService_peerPaymentStatusWithPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentStatusResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    unint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment status request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentStatusResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentPerformAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  int v12 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v13 = objc_alloc_init(PKPeerPaymentPerformActionRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v13];
  [(PKPeerPaymentPerformActionRequest *)v13 setAction:v10];

  [(PKPeerPaymentPerformActionRequest *)v13 setPaymentIdentifier:v9];
  uint64_t v14 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v15 = [(PKPeerPaymentPerformActionRequest *)v13 _urlRequestWithServiceURL:v12 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PKPeerPaymentWebService_peerPaymentPerformAction_withPaymentIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56E0EC8;
  v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  [(PKPeerPaymentWebService *)self performRequest:v15 taskIdentifier:v11 completionHandler:v18];

  return v11;
}

void __85__PKPeerPaymentWebService_peerPaymentPerformAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentPerformActionResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentPerformActionResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v7 = objc_alloc_init(PKPeerPaymentPreferencesRequest);
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v9 = [(PKPeerPaymentPreferencesRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKPeerPaymentWebService_peerPaymentPreferencesWithCompletion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  void v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v9 taskIdentifier:v5 completionHandler:v12];

  return v5;
}

void __64__PKPeerPaymentWebService_peerPaymentPreferencesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentPreferencesResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment preferences request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentPreferencesResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentUpdatePreferencesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKPeerPaymentWebService_peerPaymentUpdatePreferencesWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __78__PKPeerPaymentWebService_peerPaymentUpdatePreferencesWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentUpdatePreferencesResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment update preferences request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentUpdatePreferencesResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentBankLookupWithCountryCode:(id)a3 query:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(PKWebService *)self nextTaskID];
  int v12 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v13 = [[PKPeerPaymentBankLookupRequest alloc] initWithCountryCode:v10 query:v9];

  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v13];
  uint64_t v14 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v15 = [(PKPeerPaymentBankLookupRequest *)v13 _urlRequestWithServiceURL:v12 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__PKPeerPaymentWebService_peerPaymentBankLookupWithCountryCode_query_completion___block_invoke;
  v18[3] = &unk_1E56E0EC8;
  v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  [(PKPeerPaymentWebService *)self performRequest:v15 taskIdentifier:v11 completionHandler:v18];

  return v11;
}

void __81__PKPeerPaymentWebService_peerPaymentBankLookupWithCountryCode_query_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    if (v7 && !v8)
    {
      id v9 = [[PKPeerPaymentBankLookupResponse alloc] initWithData:v7];
      goto LABEL_11;
    }
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment bank lookup request failed with error %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (!v8)
  {
    _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = 0;
LABEL_11:
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentBankLookupResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentRequestStatementForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v10 = objc_alloc_init(PKPeerPaymentStatementRequest);
  [(PKPeerPaymentStatementRequest *)v10 setAccountIdentifier:v7];

  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  uint64_t v11 = PKPrimaryAppleAccountEmail();
  [(PKPeerPaymentStatementRequest *)v10 setEmailAddress:v11];

  int v12 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v13 = [(PKPeerPaymentStatementRequest *)v10 _urlRequestWithServiceURL:v9 appleAccountInformation:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PKPeerPaymentWebService_peerPaymentRequestStatementForAccountIdentifier_withCompletion___block_invoke;
  v16[3] = &unk_1E56E0EC8;
  v16[4] = self;
  id v17 = v6;
  id v14 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v13 taskIdentifier:v8 completionHandler:v16];

  return v8;
}

void __90__PKPeerPaymentWebService_peerPaymentRequestStatementForAccountIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    id v9 = [[PKPeerPaymentStatementResponse alloc] initWithData:v7];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment statement request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentStatementResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentReOpenAccountWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v7 = objc_alloc_init(PKPeerPaymentReOpenAccountRequest);
  id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v9 = [(PKPeerPaymentReOpenAccountRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKPeerPaymentWebService_peerPaymentReOpenAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  void v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v9 taskIdentifier:v5 completionHandler:v12];

  return v5;
}

void __66__PKPeerPaymentWebService_peerPaymentReOpenAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) _isValidResponse:a3 error:v6];
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment account reopen request failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);
  }
}

- (unint64_t)peerPaymentEmailTermsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKWebService *)self nextTaskID];
  id v6 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  uint64_t v7 = objc_alloc_init(PKPeerPaymentEmailTermsAccountRequest);
  id v8 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v9 = [(PKPeerPaymentEmailTermsAccountRequest *)v7 _urlRequestWithServiceURL:v6 appleAccountInformation:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKPeerPaymentWebService_peerPaymentEmailTermsWithCompletion___block_invoke;
  v12[3] = &unk_1E56E0EC8;
  void v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [(PKPeerPaymentWebService *)self performRequest:v9 taskIdentifier:v5 completionHandler:v12];

  return v5;
}

void __63__PKPeerPaymentWebService_peerPaymentEmailTermsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) _isValidResponse:a3 error:v6];
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment email terms request failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);
  }
}

- (unint64_t)submitDeviceScoreIdentifiersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  int v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKPeerPaymentWebService_submitDeviceScoreIdentifiersWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __78__PKPeerPaymentWebService_submitDeviceScoreIdentifiersWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) _isValidResponse:a3 error:v6];
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment submission of device scores failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);
  }
}

- (unint64_t)peerPaymentAddAssociatedAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  int v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  id v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PKPeerPaymentWebService_peerPaymentAddAssociatedAccountWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __81__PKPeerPaymentWebService_peerPaymentAddAssociatedAccountWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    uint64_t v9 = [[PKPeerPaymentAddAssociatedAccountResponse alloc] initWithData:v7];
  }
  else
  {
    int v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment invite associated account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentAddAssociatedAccountResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentRemoveAssociatedAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  int v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__PKPeerPaymentWebService_peerPaymentRemoveAssociatedAccountWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __84__PKPeerPaymentWebService_peerPaymentRemoveAssociatedAccountWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    uint64_t v9 = [[PKPeerPaymentRemoveAssociatedAccountResponse alloc] initWithData:v7];
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment remove associated account request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentRemoveAssociatedAccountResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentAssociatedAccountActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  int v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__PKPeerPaymentWebService_peerPaymentAssociatedAccountActionWithRequest_completion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __84__PKPeerPaymentWebService_peerPaymentAssociatedAccountActionWithRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    uint64_t v9 = [[PKPeerPaymentAssociatedAccountActionResponse alloc] initWithData:v7];
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment associated account action request failed with error %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, PKPeerPaymentAssociatedAccountActionResponse *, id))(v11 + 16))(v11, v9, v8);
  }
}

- (unint64_t)peerPaymentRecurringPaymentsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  int v10 = [[PKPeerPaymentRecurringPaymentsRequest alloc] initWithAccountIdentifier:v7];

  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v10];
  uint64_t v11 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  int v12 = [(PKPeerPaymentRecurringPaymentsRequest *)v10 _urlRequestWithServiceURL:v9 appleAccountInformation:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PKPeerPaymentWebService_peerPaymentRecurringPaymentsForAccountIdentifier_withCompletion___block_invoke;
  v15[3] = &unk_1E56E0EC8;
  v15[4] = self;
  id v16 = v6;
  id v13 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v12 taskIdentifier:v8 completionHandler:v15];

  return v8;
}

void __91__PKPeerPaymentWebService_peerPaymentRecurringPaymentsForAccountIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    uint64_t v9 = +[PKPeerPaymentService sharedInstance];
    int v10 = [v9 account];

    uint64_t v11 = [v10 recurringPaymentsFeatureDescriptor];
    int v12 = [v11 productTimeZone];

    id v13 = [[PKPeerPaymentRecurringPaymentsResponse alloc] initWithData:v7 productTimeZone:v12];
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment recurring payments request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, PKPeerPaymentRecurringPaymentsResponse *, id))(v15 + 16))(v15, v13, v8);
  }
}

- (unint64_t)peerPaymentRecurringPaymentPerformAction:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unint64_t v10 = [(PKWebService *)self nextTaskID];
  uint64_t v11 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  int v12 = [[PKPeerPaymentRecurringPaymentActionRequest alloc] initWithRecurringPaymentIdentifier:v9];

  id v13 = PKPeerPaymentRecurringPaymentActionToString(a3);
  [(PKPeerPaymentRecurringPaymentActionRequest *)v12 setAction:v13];

  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v12];
  uint64_t v14 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v15 = [(PKPeerPaymentRecurringPaymentActionRequest *)v12 _urlRequestWithServiceURL:v11 appleAccountInformation:v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__PKPeerPaymentWebService_peerPaymentRecurringPaymentPerformAction_identifier_completion___block_invoke;
  v18[3] = &unk_1E56E0EC8;
  v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  [(PKPeerPaymentWebService *)self performRequest:v15 taskIdentifier:v10 completionHandler:v18];

  return v10;
}

void __90__PKPeerPaymentWebService_peerPaymentRecurringPaymentPerformAction_identifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    id v9 = +[PKPeerPaymentService sharedInstance];
    unint64_t v10 = [v9 account];

    uint64_t v11 = [v10 recurringPaymentsFeatureDescriptor];
    int v12 = [v11 productTimeZone];

    id v13 = [[PKPeerPaymentRecurringPaymentActionResponse alloc] initWithData:v7 productTimeZone:v12];
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Peer Payment recurring payment action request failed with error %@", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, PKPeerPaymentRecurringPaymentActionResponse *, id))(v15 + 16))(v15, v13, v8);
  }
}

- (unint64_t)peerPaymentEncryptionCertificateForDestination:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PKWebService *)self nextTaskID];
  id v8 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  id v9 = [[PKPeerPaymentEncryptionCertificatesRequest alloc] initWithEncryptionCertificateDestination:a3];
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v9];
  unint64_t v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [(PKPeerPaymentEncryptionCertificatesRequest *)v9 _urlRequestWithServiceURL:v8 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__PKPeerPaymentWebService_peerPaymentEncryptionCertificateForDestination_withCompletion___block_invoke;
  v14[3] = &unk_1E56E5278;
  id v15 = v6;
  unint64_t v16 = a3;
  void v14[4] = self;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v7 completionHandler:v14];

  return v7;
}

void __89__PKPeerPaymentWebService_peerPaymentEncryptionCertificateForDestination_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if ([*(id *)(a1 + 32) _isValidResponse:a3 error:v8])
  {
    id v9 = [[PKPeerPaymentEncryptionCertificatesResponse alloc] initWithData:v7];
  }
  else
  {
    if (!v8)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = PKPeerPaymentEncryptionCertificateDestinationToString(*(void *)(a1 + 48));
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment encryption certificate request for destination %@ failed with error %@", (uint8_t *)&v13, 0x16u);
    }
    id v9 = 0;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, PKPeerPaymentEncryptionCertificatesResponse *, id))(v12 + 16))(v12, v9, v8);
  }
}

- (unint64_t)peerPaymentFailureDiagnosticWithRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PKWebService *)self nextTaskID];
  id v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  [(PKPeerPaymentWebService *)self _updateRequestWithCurrentTargetDevice:v7];
  unint64_t v10 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
  uint64_t v11 = [v7 _urlRequestWithServiceURL:v9 appleAccountInformation:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PKPeerPaymentWebService_peerPaymentFailureDiagnosticWithRequest_withCompletion___block_invoke;
  v14[3] = &unk_1E56E0EC8;
  void v14[4] = self;
  id v15 = v6;
  id v12 = v6;
  [(PKPeerPaymentWebService *)self performRequest:v11 taskIdentifier:v8 completionHandler:v14];

  return v8;
}

void __82__PKPeerPaymentWebService_peerPaymentFailureDiagnosticWithRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [*(id *)(a1 + 32) _isValidResponse:a3 error:v6];
  if ((v7 & 1) == 0)
  {
    if (!v6)
    {
      _PKPeerPaymentWebServiceError(0, 0, 0, *(void **)(*(void *)(a1 + 32) + 176));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    unint64_t v8 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment failure diagnostic request failed with error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v6);
  }
}

- (id)_deviceIdentifier
{
  id v2 = [(PKPeerPaymentWebService *)self context];
  id v3 = [v2 deviceIdentifier];

  return v3;
}

- (void)_deviceRegistrationDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(PKPeerPaymentWebService *)self _appleAccountInformation];
    id v6 = [v5 authorizationHeader];
    uint64_t v7 = dispatch_group_create();
    unint64_t v8 = objc_alloc_init(PKPeerPaymentDeviceRegistrationData);
    [(PKPeerPaymentDeviceRegistrationData *)v8 setDevSigned:[(PKSecureElement *)self->_secureElement isProductionSigned] ^ 1];
    [(PKPeerPaymentDeviceRegistrationData *)v8 setAuthorizationHeader:v6];
    dispatch_group_enter(v7);
    uint64_t v9 = [v5 aidaAlternateDSID];
    secureElement = self->_secureElement;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke;
    v25[3] = &unk_1E56E52A0;
    id v11 = v8;
    id v26 = v11;
    id v27 = self;
    uint64_t v12 = v7;
    id v28 = v12;
    [(PKSecureElement *)secureElement peerPaymentEnrollmentDataWithAlternateDSID:v9 completion:v25];
    dispatch_group_enter(v12);
    int v13 = self->_secureElement;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_2;
    v22[3] = &unk_1E56D8CB0;
    uint64_t v14 = v11;
    id v23 = v14;
    uint64_t v24 = v12;
    id v15 = v12;
    [(PKSecureElement *)v13 signatureForAuthToken:v6 completion:v22];
    id v16 = dispatch_get_global_queue(21, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_3;
    v18[3] = &unk_1E56DEAA8;
    id v19 = v14;
    id v20 = self;
    id v21 = v4;
    uint64_t v17 = v14;
    dispatch_group_notify(v15, v16, v18);
  }
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setEnrollmentData:a2];
  [*(id *)(a1 + 32) setSignedEnrollmentDataSignature:v6];
  [*(id *)(*(void *)(a1 + 40) + 160) setSignedEnrollmentDataSignature:v6];

  [*(id *)(a1 + 40) _archiveContext];
  uint64_t v7 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v7);
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSignedAuthToken:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __65__PKPeerPaymentWebService__deviceRegistrationDataWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192FDC630]();
  uint64_t v3 = [*(id *)(a1 + 32) enrollmentData];
  if (v3
    && (id v4 = (void *)v3,
        [*(id *)(a1 + 32) signedAuthToken],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = _PKPeerPaymentWebServiceError(2, 0, 0, *(void **)(*(void *)(a1 + 40) + 176));
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (void)_peerPaymentDeviceMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    paymentDevice = self->_paymentDevice;
    id v8 = v4;
    if (!paymentDevice)
    {
      uint64_t v6 = objc_alloc_init(PKPaymentDevice);
      uint64_t v7 = self->_paymentDevice;
      self->_paymentDevice = v6;

      paymentDevice = self->_paymentDevice;
    }
    [(PKPaymentDevice *)paymentDevice paymentDeviceMetadataFields:43 completion:v8];
    id v4 = v8;
  }
}

- (id)_appleAccountInformation
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(PKPeerPaymentWebServiceTargetDeviceProtocol *)self->_targetDevice appleAccountInformation];
  }
  else
  {
    id v4 = +[PKAppleAccountManager sharedInstance];
    uint64_t v3 = [v4 appleAccountInformation];
  }
  return v3;
}

- (void)_renewAppleAccountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __67__PKPeerPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke;
  id v11 = &unk_1E56D85B8;
  uint64_t v12 = self;
  id v5 = v4;
  id v13 = v5;
  uint64_t v6 = _Block_copy(&v8);
  if (objc_opt_respondsToSelector())
  {
    -[PKPeerPaymentWebServiceTargetDeviceProtocol renewAppleAccountWithCompletionHandler:](self->_targetDevice, "renewAppleAccountWithCompletionHandler:", v6, v8, v9, v10, v11, v12);
  }
  else
  {
    uint64_t v7 = +[PKAppleAccountManager sharedInstance];
    [v7 renewAppleAccountWithCompletionHandler:v6];
  }
}

void __67__PKPeerPaymentWebService__renewAppleAccountWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = PKWebServiceAccountCredentialRenewalSucceededNotification;
  if (a2) {
    id v5 = &PKWebServiceAccountCredentialRenewalFailedNotification;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28EB8];
  uint64_t v7 = *v5;
  uint64_t v8 = [v6 defaultCenter];
  [v8 postNotificationName:v7 object:*(void *)(a1 + 32)];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
  }
}

- (void)prewarmDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PKPeerPaymentService *)self->_peerPaymentService account];
  id v11 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", [v10 deviceScoreEncryptedPayloadVersion], v8, v9, a5);

  if ([v11 length])
  {
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__PKPeerPaymentWebService_prewarmDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke;
    block[3] = &unk_1E56E52C8;
    block[4] = self;
    id v15 = v11;
    id v16 = v8;
    id v17 = v9;
    unint64_t v18 = a5;
    dispatch_async(prewarmedDeviceScorersQueue, block);
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Invalid key for endpoint %@.", buf, 0xCu);
    }
  }
}

void __95__PKPeerPaymentWebService_prewarmDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:*(void *)(a1 + 40)];

  if (v2) {
    return;
  }
  uint64_t v3 = (__CFString *)*(id *)(a1 + 48);
  if (v3 != @"requestToken")
  {
    id v4 = v3;
    if (!v3
      || (int v5 = [(__CFString *)v3 isEqualToString:@"requestToken"], v4, !v5))
    {
      id v8 = (__CFString *)*(id *)(a1 + 48);
      if (v8 != @"quote")
      {
        id v9 = v8;
        if (!v8) {
          goto LABEL_26;
        }
        int v10 = [(__CFString *)v8 isEqualToString:@"quote"];

        if (!v10) {
          goto LABEL_26;
        }
      }
      if (!*(void *)(a1 + 56)) {
        goto LABEL_26;
      }
      id v11 = [*(id *)(*(void *)(a1 + 32) + 184) account];
      uint64_t v12 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", [v11 deviceScoreEncryptedPayloadVersion], *(void *)(a1 + 48), 0, *(void *)(a1 + 64));

      uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v12];
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        id v15 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v12;
LABEL_20:
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Recovered device scorer from key: %@.", buf, 0xCu);
        }
LABEL_21:

        [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:v12];
        [*(id *)(*(void *)(a1 + 32) + 128) setObject:v14 forKey:*(void *)(a1 + 40)];

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          id v23 = v14;
          __int16 v24 = 2112;
          uint64_t v25 = v18;
          _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Pre-warmed device scorer already exists %p for key: %@.", buf, 0x16u);
        }

        [v14 updateAttributesWithEndpointIdentifier:*(void *)(a1 + 48) recipientAddress:*(void *)(a1 + 56) quoteDestinationType:*(void *)(a1 + 64)];
LABEL_29:

        return;
      }
LABEL_25:

LABEL_26:
      uint64_t v14 = [*(id *)(a1 + 32) _createDeviceScorerForEndpoint:*(void *)(a1 + 48) recipientAddress:*(void *)(a1 + 56) quoteDestinationType:*(void *)(a1 + 64)];
      [*(id *)(*(void *)(a1 + 32) + 128) setObject:v14 forKey:*(void *)(a1 + 40)];
      id v19 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        id v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Inserted pre-warming device scorer %p for key: %@.", buf, 0x16u);
      }

      goto LABEL_29;
    }
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 184) account];
  +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", [v6 deviceScoreEncryptedPayloadVersion], @"quote", *(void *)(a1 + 56), *(void *)(a1 + 64));
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v21];

  if (!v7)
  {
    if (*(void *)(a1 + 56))
    {
      id v16 = [*(id *)(*(void *)(a1 + 32) + 184) account];
      uint64_t v12 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", [v16 deviceScoreEncryptedPayloadVersion], *(void *)(a1 + 48), 0, *(void *)(a1 + 64));

      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v12];
      if (v17)
      {
        uint64_t v14 = (void *)v17;
        id v15 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v12;
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v12 = v21;
    }
    goto LABEL_25;
  }
}

- (void)unloadDeviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  peerPaymentService = self->_peerPaymentService;
  id v10 = a4;
  id v11 = [(PKPeerPaymentService *)peerPaymentService account];
  uint64_t v12 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:](PKPeerPaymentDeviceScoreEncryptedPayloadManager, "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", [v11 deviceScoreEncryptedPayloadVersion], v8, v10, a5);

  if ([v12 length])
  {
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__PKPeerPaymentWebService_unloadDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke;
    v15[3] = &unk_1E56D8A90;
    v15[4] = self;
    id v16 = v12;
    dispatch_async(prewarmedDeviceScorersQueue, v15);
  }
  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Invalid key for endpoint %@.", buf, 0xCu);
    }
  }
}

void __94__PKPeerPaymentWebService_unloadDeviceScoreForEndpoint_recipientAddress_quoteDestinationType___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Removing unused pre-warmed device score for key: %@.", (uint8_t *)&v5, 0xCu);
    }

    [v2 provideSessionFeedbackWithIngested:0];
    [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)updateDeviceScorersWithEncryptedPayloadVersion:(unint64_t)a3
{
  prewarmedDeviceScorers = self->_prewarmedDeviceScorers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__PKPeerPaymentWebService_updateDeviceScorersWithEncryptedPayloadVersion___block_invoke;
  v4[3] = &__block_descriptor_40_e74_v32__0__NSString_8__PKPeerPaymentDeviceScoreEncryptedPayloadManager_16_B24l;
  v4[4] = a3;
  [(NSMutableDictionary *)prewarmedDeviceScorers enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __74__PKPeerPaymentWebService_updateDeviceScorersWithEncryptedPayloadVersion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDeviceScoreEncryptedPayloadVersion:*(void *)(a1 + 32)];
}

- (id)_createDeviceScorerForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  peerPaymentService = self->_peerPaymentService;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PKPeerPaymentService *)peerPaymentService account];
  uint64_t v11 = [v10 deviceScoreEncryptedPayloadVersion];

  uint64_t v12 = [[PKPeerPaymentDeviceScoreEncryptedPayloadManager alloc] initWithEndpointIdentifier:v9 recipientAddress:v8 deviceScoreEncryptedPayloadVersion:v11 quoteDestinationType:a5];
  return v12;
}

- (void)_deviceScoreForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [(PKPeerPaymentService *)self->_peerPaymentService account];
    uint64_t v14 = [v13 deviceScoreEncryptedPayloadVersion];

    id v15 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:v14 endpointIdentifier:v10 recipientAddress:v11 quoteDestinationType:a5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke;
    aBlock[3] = &unk_1E56E5338;
    id v16 = v15;
    id v29 = v16;
    id v30 = self;
    id v31 = v12;
    uint64_t v17 = _Block_copy(aBlock);
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_249;
    v21[3] = &unk_1E56E5360;
    void v21[4] = self;
    id v22 = v16;
    id v25 = v17;
    uint64_t v26 = v14;
    id v23 = v10;
    id v24 = v11;
    unint64_t v27 = a5;
    id v19 = v17;
    id v20 = v16;
    dispatch_async(prewarmedDeviceScorersQueue, v21);
  }
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_2;
  v7[3] = &unk_1E56DEB98;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: calculateWithDeviceScoreEncryptedPayloadManager() called with deviceScoreEncryptedPayloadManager for key: %@.", buf, 0xCu);
    }

    id v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_247;
    v11[3] = &unk_1E56E5310;
    id v12 = v6;
    id v13 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = v7;
    [v12 deviceScoreWithCompletion:v11];

    id v8 = v12;
  }
  else
  {
    if (v4)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v9;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: calculateWithDeviceScoreEncryptedPayloadManager() called with a nil deviceScoreEncryptedPayloadManager for key: %@. Calling completion with error.", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    _PKPeerPaymentWebServiceError(3, 0, 0, *(void **)(*(void *)(a1 + 48) + 176));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void, id))(v10 + 16))(v10, 0, 0, 0, v8);
  }
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_247(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  id v12 = a5;
  id v13 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v10 | v11)
  {
    if (v14)
    {
      uint64_t v15 = a1[5];
      int v22 = 138412290;
      uint64_t v23 = v15;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: deviceScoreWithCompletion: successfully returned a deviceScore for key: %@. Calling completion with score.", (uint8_t *)&v22, 0xCu);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (v14)
    {
      uint64_t v16 = a1[5];
      int v22 = 138412290;
      uint64_t v23 = v16;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: peerPaymentDeviceScoreWithCompletion: failed to return a deviceScore for key: %@. Calling completion with error.", (uint8_t *)&v22, 0xCu);
    }

    int v17 = PKIsPad();
    uint64_t v18 = PKAggDKeyPeerPaymentDeviceScoreErrorPhone;
    if (v17) {
      uint64_t v18 = PKAggDKeyPeerPaymentDeviceScoreErrorPad;
    }
    id v19 = *v18;
    if (v19) {
      AnalyticsSendEvent();
    }
    uint64_t v20 = a1[7];
    id v21 = _PKPeerPaymentWebServiceError(3, v12, 0, *(void **)(a1[6] + 176));
    (*(void (**)(uint64_t, void, void, void, void *))(v20 + 16))(v20, 0, 0, 0, v21);
  }
}

void __104__PKPeerPaymentWebService__deviceScoreForEndpoint_recipientAddress_quoteDestinationType_withCompletion___block_invoke_249(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:*(void *)(a1 + 40)];
  id v3 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Found an existing, pre-warmed device scorer for key: %@.", (uint8_t *)&v7, 0xCu);
    }

    if (!*(void *)(a1 + 72)) {
      [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: No pre-warmed device scorer available for key: %@. Creating a new scorer.", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v2 = [*(id *)(a1 + 32) _createDeviceScorerForEndpoint:*(void *)(a1 + 48) recipientAddress:*(void *)(a1 + 56) quoteDestinationType:*(void *)(a1 + 80)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_provideDeviceScoreFeedbackIfNeededForEndpoint:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5 ingested:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(PKPeerPaymentService *)self->_peerPaymentService account];
  uint64_t v13 = [v12 deviceScoreEncryptedPayloadVersion];

  if (v13 == 1)
  {
    BOOL v14 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:1 endpointIdentifier:v10 recipientAddress:v11 quoteDestinationType:a5];
    prewarmedDeviceScorersQueue = self->_prewarmedDeviceScorersQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__PKPeerPaymentWebService__provideDeviceScoreFeedbackIfNeededForEndpoint_recipientAddress_quoteDestinationType_ingested___block_invoke;
    block[3] = &unk_1E56E5388;
    id v18 = v14;
    id v19 = self;
    BOOL v24 = a6;
    id v20 = v10;
    unint64_t v22 = a5;
    uint64_t v23 = 1;
    id v21 = v11;
    id v16 = v14;
    dispatch_async(prewarmedDeviceScorersQueue, block);
  }
}

void __121__PKPeerPaymentWebService__provideDeviceScoreFeedbackIfNeededForEndpoint_recipientAddress_quoteDestinationType_ingested___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 128), "objectForKey:");
    if (v2)
    {
      id v3 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        if (*(unsigned char *)(a1 + 80)) {
          uint64_t v5 = @"YES";
        }
        else {
          uint64_t v5 = @"NO";
        }
        int v25 = 138412546;
        uint64_t v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v4;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Providing feedback ingested %@ for key %@", (uint8_t *)&v25, 0x16u);
      }

      [v2 provideSessionFeedbackWithIngested:*(unsigned __int8 *)(a1 + 80)];
      uint64_t v6 = (__CFString *)*(id *)(a1 + 48);
      if (v6 != @"quote")
      {
        int v7 = v6;
        if (!v6
          || (char v8 = [(__CFString *)v6 isEqualToString:@"quote"],
              v7,
              (v8 & 1) == 0))
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = *(__CFString **)(a1 + 32);
            int v25 = 138412290;
            uint64_t v26 = v9;
            _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Releasing session for key %@", (uint8_t *)&v25, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 40) + 128) removeObjectForKey:*(void *)(a1 + 32)];
        }
      }
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = (__CFString *)*(id *)(a1 + 48);
    id v12 = @"quote";
    if (v11 != @"requestToken")
    {
      uint64_t v13 = v11;
      if (!v11
        || (char v14 = [(__CFString *)v11 isEqualToString:@"requestToken"],
            v13,
            (v14 & 1) == 0))
      {
        uint64_t v15 = (__CFString *)*(id *)(a1 + 48);
        if (v15 == @"quote"
          || (id v16 = v15) != 0
          && (int v17 = [(__CFString *)v15 isEqualToString:@"quote"], v16, v17))
        {
          uint64_t v18 = *(void *)(a1 + 64);
          id v19 = @"quote";
          uint64_t v20 = 4;
          id v21 = @"requestToken";
          if (v18 != 1) {
            id v21 = 0;
          }
          if (v18 != 2)
          {
            id v19 = v21;
            uint64_t v20 = v10;
          }
          if (v18 == 4) {
            id v12 = @"quote";
          }
          else {
            id v12 = v19;
          }
          if (v18 == 4) {
            uint64_t v10 = 2;
          }
          else {
            uint64_t v10 = v20;
          }
        }
        else
        {
          id v12 = 0;
        }
      }
    }
    unint64_t v22 = +[PKPeerPaymentDeviceScoreEncryptedPayloadManager keyForDeviceScoreEncryptedPayloadVersion:*(void *)(a1 + 72) endpointIdentifier:v12 recipientAddress:*(void *)(a1 + 56) quoteDestinationType:v10];
    uint64_t v23 = [*(id *)(*(void *)(a1 + 40) + 128) objectForKey:v22];
    if (v23)
    {
      BOOL v24 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        uint64_t v26 = v22;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentWebService: Score: Providing feedback not ingested for key %@ and releasing session", (uint8_t *)&v25, 0xCu);
      }

      [v23 provideSessionFeedbackWithIngested:0];
      [*(id *)(*(void *)(a1 + 40) + 128) removeObjectForKey:v22];
    }
  }
}

- (void)_handleRetryAfterRegisterWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Registering device", buf, 2u);
  }

  uint64_t v9 = [(PKPeerPaymentWebService *)self peerPaymentServiceURL];
  uint64_t v10 = [(PKPeerPaymentWebService *)self context];
  id v11 = [v10 pushToken];

  if (objc_opt_respondsToSelector())
  {
    targetDevice = self->_targetDevice;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke;
    v14[3] = &unk_1E56E53B0;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [(PKPeerPaymentWebServiceTargetDeviceProtocol *)targetDevice peerPaymentReRegisterWithURL:v9 pushToken:v11 peerPaymentWebService:self completion:v14];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "targetDevice cannot peer payment register. Aborting original request", buf, 2u);
    }

    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPeerPaymentWebServiceErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v13);
  }
}

void __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject(0xBuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || !a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Registration failed. Aborting original request", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Registration succeeded, retrying original request", buf, 2u);
    }

    char v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke_256;
    char v14 = &unk_1E56E0EC8;
    id v15 = v8;
    id v16 = *(id *)(a1 + 48);
    uint64_t v10 = [v8 dataTaskWithRequest:v9 completionHandler:&v11];
    objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);
  }
}

void __82__PKPeerPaymentWebService__handleRetryAfterRegisterWithRequest_completionHandler___block_invoke_256(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) logResponse:v7 withData:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_archiveContext
{
  id v3 = [(PKPeerPaymentWebService *)self context];

  if (v3)
  {
    id v5 = [(PKPeerPaymentWebService *)self archiver];
    uint64_t v4 = [(PKPeerPaymentWebService *)self context];
    [v5 archiveContext:v4];
  }
}

- (BOOL)_isValidResponse:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v5;
    uint64_t v8 = [v7 statusCode];
    BOOL v9 = v8 == 200;
    if (v6 && v8 != 200)
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v7 URL];
        uint64_t v12 = [v11 absoluteString];
        int v14 = 138412546;
        id v15 = v12;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error executing request: %@ error: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateRequestWithCurrentTargetDevice:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (PKPeerPaymentWebServiceArchiver)archiver
{
  return self->_archiver;
}

- (PKPeerPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (void)setPeerPaymentService:(id)a3
{
}

- (BOOL)isSharedService
{
  return self->_sharedService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_paymentDevice, 0);
  objc_storeStrong((id *)&self->_prewarmedDeviceScorersQueue, 0);
  objc_storeStrong((id *)&self->_prewarmedDeviceScorers, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
}

@end