@interface PKWebService
+ (id)_sharedCookieStorage;
- (BOOL)_evaluateTrust:(__SecTrust *)a3;
- (BOOL)canBypassTrustValidation;
- (NSString)webServiceSessionMarker;
- (NSURLSessionConfiguration)sessionConfiguration;
- (PKTapToRadarDelegate)tapToRadarDelegate;
- (PKWebService)initWithTapToRadarDelegate:(id)a3;
- (id)_accountStore;
- (id)_urlRequestTaggedWithDiagnosticReasonHeader:(id)a3 forTaskID:(unint64_t)a4;
- (id)_urlRequestTaggedWithWebServiceSessionMarkerHeader:(id)a3;
- (id)_urlRequestWithCustomHeaders:(id)a3;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)forbiddenErrorWithResponse:(id)a3;
- (id)urlRequestTaggedWithUniqueRequestIdentifier:(id)a3;
- (id)urlSession;
- (int64_t)logFacilityType;
- (unint64_t)nextTaskID;
- (unint64_t)webServiceTaskIdentifierForTaskIdentifier:(int64_t)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)_associateDiagnosticReasonsWithTaskID:(unint64_t)a3;
- (void)_cleanUpDiagnosticReasonsForTaskID:(unint64_t)a3;
- (void)addDiagnosticReason:(id)a3;
- (void)diagnosticSessionWithReason:(id)a3 sessionHandler:(id)a4;
- (void)handleAuthenticationFailureWithCompletionHandler:(id)a3;
- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7;
- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5;
- (void)invalidate;
- (void)logRequest:(id)a3;
- (void)logResponse:(id)a3 withData:(id)a4;
- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 cacheResponse:(BOOL)a5 completionHandler:(id)a6;
- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5;
- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 cacheResponse:(BOOL)a7 completionHandler:(id)a8;
- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 completionHandler:(id)a7;
- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6;
- (void)refreshSessionWithConfiguration:(id)a3;
- (void)removeDiagnosticReason:(id)a3;
- (void)resetWebServiceSessionMarker;
- (void)setTapToRadarDelegate:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation PKWebService

- (PKWebService)initWithTapToRadarDelegate:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKWebService;
  v5 = [(PKWebService *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tapToRadarDelegate, v4);
    v6->_taskIDCounter = 0;
    v6->_stateLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passd.urlsession", 0);
    sessionQueue = v6->_sessionQueue;
    v6->_sessionQueue = (OS_dispatch_queue *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    delegateOperationQueue = v6->_delegateOperationQueue;
    v6->_delegateOperationQueue = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    webServiceTasks = v6->_webServiceTasks;
    v6->_webServiceTasks = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tasksMetadata = v6->_tasksMetadata;
    v6->_tasksMetadata = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    diagnosticReasonsByTaskID = v6->_diagnosticReasonsByTaskID;
    v6->_diagnosticReasonsByTaskID = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    diagnosticReasons = v6->_diagnosticReasons;
    v6->_diagnosticReasons = (NSMutableArray *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passkit.diagnosticReasonsQueue", 0);
    diagnosticReasonsQueue = v6->_diagnosticReasonsQueue;
    v6->_diagnosticReasonsQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"cardSecurityCode", @"amount", @"merchantIdentifier", @"merchantName", @"cardholderName", @"expiration", @"firstName", @"lastName", @"addressLine1", @"addressLine2", @"street1", @"street2", @"email", @"city", @"postalCode", @"name", @"nameOptions",
      @"FPANSuffix",
      @"countryCode",
      @"SELDInfo",
      @"dateOfBirth",
      @"emailAddress",
      @"phoneNumber",
      @"accountNumber",
      @"mailboxIdentifier",
      @"originURL",
      @"aprForPurchase",
      @"rewardsEarned",
      @"rewardsRedeemed",
      @"rewardsBalance",
      @"rewardsLifetime",
      @"statementBalance",
      @"rewardsYTD",
      @"cyclesPastDue",
      @"inGrace",
      @"pastDueAmount",
      @"unpostedInterest",
      @"requiresDebtCollectionNotices",
      @"creditLimit",
      @"availableCredit",
      @"currentBalance",
      @"adjustedBalance",
      @"installmentBalance",
      @"remainingStatementBalance",
      @"remainingMinimumPayment",
      @"remainingMinimumPaymentExcludedFromInterestCalculation",
      @"purchases",
      @"pendingPurchases",
      @"balanceTransfers",
      @"interestCharged",
      @"feesCharged",
      @"paymentsAndCredits",
      @"payments",
      @"credits",
      @"remainingStatementBalanceForInterestCalculation",
      @"availableBalance",
      @"interestYTD",
      @"totalBalance",
      @"minimumDue",
      @"openingBalance",
    uint64_t v21 = @"closingBalance");
    sensitiveKeys = v6->_sensitiveKeys;
    v6->_sensitiveKeys = (NSSet *)v21;

    [(PKWebService *)v6 resetWebServiceSessionMarker];
  }

  return v6;
}

- (void)resetWebServiceSessionMarker
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = self->_webServiceSessionMarker;
  v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];
  webServiceSessionMarker = self->_webServiceSessionMarker;
  self->_webServiceSessionMarker = v6;

  v8 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = self->_webServiceSessionMarker;
      int v18 = 138543874;
      dispatch_queue_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v4;
      __int16 v22 = 2112;
      v23 = v12;
      v13 = "%{public}@ Session Marker Reset - (Old : '%@' ==> New : '%@')";
      v14 = v8;
      uint32_t v15 = 32;
LABEL_6:
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
    }
  }
  else if (v9)
  {
    v16 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v16);
    uint64_t v17 = self->_webServiceSessionMarker;
    int v18 = 138543618;
    dispatch_queue_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    v13 = "%{public}@ Session Marker Initialized - ('%@')";
    v14 = v8;
    uint32_t v15 = 22;
    goto LABEL_6;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)handleResponse:(id)a3 withError:(id)a4 data:(id)a5 task:(id)a6 completionHandler:(id)a7
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, id, id, void *))a7;
  uint64_t v15 = [v11 statusCode];
  switch(v15)
  {
    case 403:
      uint64_t v21 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Received Status Code 403.", v26, 2u);
      }

      __int16 v22 = +[PKWebServiceResponse responseWithData:v13];
      __int16 v20 = [(PKWebService *)self forbiddenErrorWithResponse:v22];

      if (v14) {
        v14[2](v14, v13, v11, v20);
      }
      break;
    case 503:
      v23 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "Received Status Code 503.", v26, 2u);
      }

      v27[0] = *MEMORY[0x1E4F28588];
      uint64_t v24 = PKLocalizedPaymentString(&cfstr_RateLimitedErr.isa, 0);
      v28[0] = v24;
      v27[1] = *MEMORY[0x1E4F285A0];
      v25 = PKLocalizedPaymentString(&cfstr_RateLimitedErr_0.isa, 0);
      v28[1] = v25;
      dispatch_queue_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

      __int16 v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:4 userInfo:v19];

      goto LABEL_14;
    case 429:
      v16 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Received Status Code 429.", v26, 2u);
      }

      v29[0] = *MEMORY[0x1E4F28588];
      uint64_t v17 = PKLocalizedPaymentString(&cfstr_RateLimitedErr.isa, 0);
      v30[0] = v17;
      v29[1] = *MEMORY[0x1E4F285A0];
      int v18 = PKLocalizedPaymentString(&cfstr_RateLimitedErr_0.isa, 0);
      v30[1] = v18;
      dispatch_queue_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

      __int16 v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:3 userInfo:v19];

LABEL_14:
      if (v14) {
        v14[2](v14, v13, v11, v20);
      }

      break;
    default:
      if (v14) {
        v14[2](v14, v13, v11, v12);
      }
      __int16 v20 = v12;
      break;
  }
}

- (void)processRetryRequest:(id)a3 responseData:(id)a4 orginalRequest:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v8 = a6;
    id v9 = (id)[a3 copy];
    (*((void (**)(id, id))a6 + 2))(v8, v9);
  }
}

- (BOOL)canBypassTrustValidation
{
  if ((PKBypassCertValidation() & 1) != 0 || (int v3 = PKIgnoreSSLPinning()) != 0)
  {
    id v4 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Allowing bypass of extended trust validation by preference on internal build", v6, 2u);
    }

    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)handleWillPerformHTTPRedirectionWithResponse:(id)a3 originalRequest:(id)a4 redirectHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (void)handleAuthenticationFailureWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 2, 0);
  }
}

- (void)invalidate
{
  id v2 = [(PKWebService *)self urlSession];
  [v2 invalidateAndCancel];
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  id v2 = [(PKWebService *)self urlSession];
  int v3 = [v2 configuration];

  return (NSURLSessionConfiguration *)v3;
}

- (void)refreshSessionWithConfiguration:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Requested update to web service with configuration: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v4 delegate:self delegateQueue:self->_delegateOperationQueue];
  [(PKWebService *)self setUrlSession:v6];
}

- (unint64_t)nextTaskID
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  unint64_t taskIDCounter = self->_taskIDCounter;
  self->_unint64_t taskIDCounter = taskIDCounter + 1;
  os_unfair_lock_unlock(p_stateLock);
  [(PKWebService *)self _associateDiagnosticReasonsWithTaskID:taskIDCounter];
  return taskIDCounter;
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 cacheResponse:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)performRequest:(id)a3 taskIdentifier:(unint64_t)a4 retries:(unint64_t)a5 authHandling:(BOOL)a6 cacheResponse:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a8;
  if (!v14)
  {
    v28 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v37 = 0;
    v29 = "Error: Attempting to perform a nil NSURLRequest. Failing with error PKWebServiceErrorCodeServiceFailure.";
    v30 = (uint8_t *)&v37;
    goto LABEL_10;
  }
  v16 = [v14 URL];

  if (v16)
  {
    uint64_t v17 = [(PKWebService *)self _urlRequestTaggedWithWebServiceSessionMarkerHeader:v14];

    int v18 = [(PKWebService *)self _urlRequestTaggedWithDiagnosticReasonHeader:v17 forTaskID:a4];

    dispatch_queue_t v19 = [(PKWebService *)self urlRequestTaggedWithUniqueRequestIdentifier:v18];

    id v14 = [(PKWebService *)self _urlRequestWithCustomHeaders:v19];

    if (v14)
    {
      [(PKWebService *)self logRequest:v14];
      __int16 v20 = [v14 HTTPBody];
      uint64_t v21 = (void *)[v20 copy];

      __int16 v22 = [(PKWebService *)self urlSession];
      v23 = [v22 dataTaskWithRequest:v14];

      if (v23)
      {
        uint64_t v24 = objc_alloc_init(PKWebServiceRequestMetadata);
        [(PKWebServiceRequestMetadata *)v24 setCacheResponse:v9];
        [(PKWebServiceRequestMetadata *)v24 setRetries:a5];
        [(PKWebServiceRequestMetadata *)v24 setOriginalBody:v21];
        [(PKWebServiceRequestMetadata *)v24 setAuthHandling:v10];
        [(PKWebServiceRequestMetadata *)v24 setCompletion:v15];
        os_unfair_lock_lock(&self->_stateLock);
        v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "taskIdentifier"));
        webServiceTasks = self->_webServiceTasks;
        v27 = [NSNumber numberWithUnsignedInteger:a4];
        [(NSMutableDictionary *)webServiceTasks setObject:v27 forKey:v25];

        [(NSMutableDictionary *)self->_tasksMetadata setObject:v24 forKey:v25];
        os_unfair_lock_unlock(&self->_stateLock);
        [v23 resume];
      }
      else
      {
        v32 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error - Could not start network request", v34, 2u);
        }

        v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
        (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v33);
      }
    }
    else
    {
      v31 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error - No request to create task", v35, 2u);
      }

      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v21);
      id v14 = 0;
    }
    goto LABEL_20;
  }
  v28 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v29 = "Error: Attempting to perform NSURLRequest with a nil URL. Failing with error PKWebServiceErrorCodeServiceFailure.";
    v30 = buf;
LABEL_10:
    _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
  }
LABEL_11:

  if (v15)
  {
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void, void *))v15 + 2))(v15, 0, 0, v21);
LABEL_20:
  }
}

- (unint64_t)webServiceTaskIdentifierForTaskIdentifier:(int64_t)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  webServiceTasks = self->_webServiceTasks;
  int v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)webServiceTasks objectForKey:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  os_unfair_lock_unlock(p_stateLock);
  return v9;
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(PKWebService *)self urlSession];
    unint64_t v9 = [v8 dataTaskWithRequest:v6 completionHandler:v7];
  }
  else
  {
    BOOL v10 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request is nil, completing with PKWebServiceErrorCodeServiceFailure", v13, 2u);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);

    unint64_t v9 = 0;
  }

  return v9;
}

- (id)urlSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__29;
  BOOL v10 = __Block_byref_object_dispose__29;
  id v11 = 0;
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__PKWebService_urlSession__block_invoke;
  v5[3] = &unk_1E56DC618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__PKWebService_urlSession__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    [v3 setTimeoutIntervalForResource:360.0];
    [v3 setTimeoutIntervalForRequest:60.0];
    id v4 = +[PKWebService _sharedCookieStorage];
    [v3 setHTTPCookieStorage:v4];

    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:v6];
    objc_msgSend(v3, "set_appleIDContext:", v7);
    uint64_t v8 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v3 delegate:*(void *)(a1 + 32) delegateQueue:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = v8;

    id v2 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  id v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v11, v2);
}

- (void)setUrlSession:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__PKWebService_setUrlSession___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(sessionQueue, v7);
}

void __30__PKWebService_setUrlSession___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 72);
  if (v2 != v3)
  {
    [v3 finishTasksAndInvalidate];
    id v4 = *(void **)(a1 + 32);
    v5 = (id *)(*(void *)(a1 + 40) + 72);
    objc_storeStrong(v5, v4);
  }
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

+ (id)_sharedCookieStorage
{
  if (qword_1EB402E18 != -1) {
    dispatch_once(&qword_1EB402E18, &__block_literal_global_93);
  }
  id v2 = (void *)_MergedGlobals_227;
  return v2;
}

void __36__PKWebService__sharedCookieStorage__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = PKSharedCacheDirectoryPath();
  id v2 = [v0 fileURLWithPath:v1];
  id v7 = [v2 URLByAppendingPathComponent:@"WebServiceCookies"];

  uint64_t v3 = CFHTTPCookieStorageCreateFromFile();
  if (v3)
  {
    id v4 = (const void *)v3;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F18D30]) _initWithCFHTTPCookieStorage:v3];
    id v6 = (void *)_MergedGlobals_227;
    _MergedGlobals_227 = v5;

    CFRelease(v4);
  }
}

- (id)forbiddenErrorWithResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localizedTitle];
  uint64_t v5 = [v3 localizedDescription];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  id v7 = [NSString stringWithFormat:@"%@ - %@", v4, v5];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v6];
  BOOL v10 = [v8 errorWithDomain:@"PKWebServiceErrorDomain" code:2 userInfo:v9];

  return v10;
}

- (BOOL)_evaluateTrust:(__SecTrust *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  CFErrorRef error = 0;
  BOOL v4 = SecTrustEvaluateWithError(a3, &error);
  if (!v4)
  {
    if (error) {
      CFStringRef v5 = CFErrorCopyDescription(error);
    }
    else {
      CFStringRef v5 = 0;
    }
    id v7 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v10 = v5;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Not trusted with error: %@.", buf, 0xCu);
    }

    if (v5) {
      CFRelease(v5);
    }
  }
  if (error) {
    CFRelease(error);
  }
  return v4 || [(PKWebService *)self canBypassTrustValidation];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v14 = a5;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier"));
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v9 = [(NSMutableDictionary *)self->_tasksMetadata objectForKey:v7];
  os_unfair_lock_unlock(p_stateLock);
  CFStringRef v10 = [v9 responseData];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = (void *)[v10 mutableCopy];
    [v12 appendData:v14];
    id v13 = (id)[v12 copy];
  }
  else
  {
    id v13 = v14;
  }
  [v9 setResponseData:v13];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = 0x1E4F28000uLL;
  CFStringRef v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v12 = [(NSMutableDictionary *)self->_webServiceTasks objectForKey:v10];
  unsigned int v13 = [v12 unsignedIntValue];

  id v14 = [(NSMutableDictionary *)self->_tasksMetadata objectForKey:v10];
  [(NSMutableDictionary *)self->_tasksMetadata removeObjectForKey:v10];
  os_unfair_lock_unlock(&self->_stateLock);
  v59 = [v14 responseData];
  id v15 = [v7 response];
  v16 = [v14 completion];
  if (v16)
  {
    uint64_t v58 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v8)
      {
        v30 = v15;
        v31 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [v8 localizedDescription];
          v33 = [v7 description];
          *(_DWORD *)buf = 138412546;
          uint64_t v85 = (uint64_t)v32;
          __int16 v86 = 2114;
          uint64_t v87 = (uint64_t)v33;
          _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Error %@ returned from task: %{public}@", buf, 0x16u);

          unint64_t v9 = 0x1E4F28000;
        }

        id v15 = v30;
        p_stateLock = &self->_stateLock;
      }
      ((void (**)(void, void *, void *, id))v16)[2](v16, v59, v15, v8);
      goto LABEL_44;
    }
    id v17 = v8;
    v52 = v15;
    id v18 = v15;
    [(PKWebService *)self logResponse:v18 withData:v59];
    v53 = [v7 currentRequest];
    uint64_t v19 = [v18 statusCode];
    __int16 v20 = +[PKWebService _sharedCookieStorage];
    [v20 _saveCookies];

    uint64_t v21 = v18;
    v56 = [v18 allHeaderFields];
    [v56 objectForKeyedSubscript:@"X-Wallet-TapToRadar-Request"];
    v57 = v54 = v18;
    if (v57)
    {
      __int16 v22 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v85 = (uint64_t)v57;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Server requested a Tap-To-Radar prompt with reason: \"%@\"", buf, 0xCu);
      }

      v23 = objc_alloc_init(PKTapToRadarRequest);
      [(PKTapToRadarRequest *)v23 setReason:v57];
      [(PKTapToRadarRequest *)v23 setServerGenerated:1];
      uint64_t v24 = [v56 objectForKeyedSubscript:@"X-Wallet-TapToRadar-Request-RelatedRadar"];
      if (v24) {
        [(PKTapToRadarRequest *)v23 setRelatedRadar:v24];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
      [WeakRetained displayTapToRadarAlertForRequest:v23 completion:0];

      uint64_t v21 = v54;
    }
    uint64_t v50 = [v14 retries];
    char v49 = [v14 authHandling];
    char v48 = [v14 cacheResponse];
    v55 = [v14 originalBody];
    if (v19 == 504)
    {
      v34 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      id v8 = v17;
      v26 = v53;
      if (v50)
      {
        p_stateLock = &self->_stateLock;
        if (v35)
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v85 = 504;
          __int16 v86 = 2048;
          uint64_t v87 = v50;
          _os_log_impl(&dword_190E10000, v34, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld (%tu retries remaining).", buf, 0x16u);
        }

        v36 = (void *)[v53 mutableCopy];
        [v36 setHTTPBody:v55];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_317;
        v60[3] = &unk_1E56E5B98;
        v60[4] = self;
        uint64_t v62 = v58;
        uint64_t v63 = v50;
        char v64 = v49;
        char v65 = v48;
        v61 = v16;
        [(PKWebService *)self processRetryRequest:v36 responseData:v59 orginalRequest:v53 completion:v60];

        id v15 = v52;
        uint64_t v21 = v54;
        goto LABEL_43;
      }
      p_stateLock = &self->_stateLock;
      if (v35)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v85 = 504;
        _os_log_impl(&dword_190E10000, v34, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld (giving up).", buf, 0xCu);
      }
    }
    else
    {
      id v8 = v17;
      v26 = v53;
      if (v19 == 503)
      {
        __int16 v37 = [v21 allHeaderFields];
        v38 = [v37 objectForKeyedSubscript:@"Retry-After"];

        p_stateLock = &self->_stateLock;
        v47 = v38;
        if (!v38) {
          goto LABEL_33;
        }
        uint64_t v39 = PKRetryAfterSecondsFromNow(v38);
        v40 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v85 = 503;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v47;
          __int16 v88 = 2048;
          uint64_t v89 = v50;
          __int16 v90 = 2048;
          uint64_t v91 = v39;
          _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "Received %ld (Retry-After: %@) (%tu retries remaining) (retry-after in %lu seconds).", buf, 0x2Au);
        }

        if (v39)
        {
          v41 = (void *)[v53 mutableCopy];
          [v41 setHTTPBody:v55];
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_316;
          v66[3] = &unk_1E56E5C10;
          v66[4] = self;
          uint64_t v68 = v39;
          uint64_t v69 = v58;
          uint64_t v70 = v50;
          char v71 = v49;
          char v72 = v48;
          v67 = v16;
          [(PKWebService *)self processRetryRequest:v41 responseData:v59 orginalRequest:v53 completion:v66];

          id v15 = v52;
          uint64_t v21 = v54;
        }
        else
        {
LABEL_33:
          v42 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v85 = 503;
            _os_log_impl(&dword_190E10000, v42, OS_LOG_TYPE_DEFAULT, "Received Unexpected Error %ld without retry-after; failing.",
              buf,
              0xCu);
          }

          uint64_t v21 = v54;
          [(PKWebService *)self handleResponse:v54 withError:v8 data:v59 task:v7 completionHandler:v16];
          id v15 = v52;
        }
        v28 = v47;
        goto LABEL_37;
      }
      p_stateLock = &self->_stateLock;
      if (v19 == 401)
      {
        v27 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
        id v15 = v52;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Received Status Code 401.", buf, 2u);
        }

        if (![v14 authHandling])
        {
          uint64_t v92 = *MEMORY[0x1E4F28568];
          v43 = PKLocalizedPaymentString(&cfstr_AuthError.isa, 0);
          v93[0] = v43;
          v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];

          v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:1 userInfo:v51];
          uint64_t v21 = v54;
          ((void (**)(void, void *, void *, void *))v16)[2](v16, v59, v54, v44);

          v26 = v53;
          goto LABEL_43;
        }
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke;
        v73[3] = &unk_1E56E5BC0;
        uint64_t v80 = v50;
        v73[4] = self;
        id v74 = v53;
        id v75 = v14;
        id v76 = v59;
        uint64_t v81 = v58;
        char v82 = v49;
        char v83 = v48;
        v79 = v16;
        uint64_t v21 = v54;
        id v77 = v54;
        id v78 = v8;
        [(PKWebService *)self handleAuthenticationFailureWithCompletionHandler:v73];

        v28 = v74;
LABEL_37:

LABEL_43:
        unint64_t v9 = 0x1E4F28000uLL;
LABEL_44:
        os_unfair_lock_lock(p_stateLock);
        webServiceTasks = self->_webServiceTasks;
        v46 = objc_msgSend(*(id *)(v9 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v7, "taskIdentifier"));
        [(NSMutableDictionary *)webServiceTasks removeObjectForKey:v46];

        os_unfair_lock_unlock(p_stateLock);
        [(PKWebService *)self _cleanUpDiagnosticReasonsForTaskID:v58];
        goto LABEL_45;
      }
    }
    [(PKWebService *)self handleResponse:v21 withError:v8 data:v59 task:v7 completionHandler:v16];
    id v15 = v52;
    goto LABEL_43;
  }
  v29 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = (uint64_t)v7;
    _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "No completion for task %@", buf, 0xCu);
  }

LABEL_45:
}

void __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 2)
  {
LABEL_11:
    v16 = PKLogFacilityTypeGetObject([*(id *)(a1 + 32) logFacilityType]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Credential Renewal Failed.", buf, 2u);
    }

    goto LABEL_14;
  }
  if (a2 == 1)
  {
    id v15 = PKLogFacilityTypeGetObject([*(id *)(a1 + 32) logFacilityType]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Credential Renewal Rejected by User.", buf, 2u);
    }

    goto LABEL_11;
  }
  if (a2)
  {
LABEL_14:
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v17 = PKLocalizedPaymentString(&cfstr_AuthError.isa, 0);
    v26[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKWebServiceErrorDomain" code:1 userInfo:v18];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(a1 + 88);
  id v7 = PKLogFacilityTypeGetObject([*(id *)(a1 + 32) logFacilityType]);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Credential Renewal succeeded, retrying request.", buf, 2u);
    }

    unint64_t v9 = (void *)[*(id *)(a1 + 40) mutableCopy];
    CFStringRef v10 = [v5 authorizationHeader];
    [v9 setValue:v10 forHTTPHeaderField:@"Authorization"];

    uint64_t v11 = [*(id *)(a1 + 48) originalBody];
    [v9 setHTTPBody:v11];

    uint64_t v12 = *(void *)(a1 + 56);
    unsigned int v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_310;
    v20[3] = &unk_1E56E5B98;
    v20[4] = v13;
    int8x16_t v22 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
    __int16 v23 = *(_WORD *)(a1 + 104);
    id v21 = *(id *)(a1 + 80);
    [v13 processRetryRequest:v9 responseData:v12 orginalRequest:v14 completion:v20];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Exceeded maximum retries (giving up).", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
LABEL_15:
}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_310(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequest:a2 taskIdentifier:*(void *)(a1 + 48) retries:*(void *)(a1 + 56) - 1 authHandling:*(unsigned __int8 *)(a1 + 64) cacheResponse:*(unsigned __int8 *)(a1 + 65) completionHandler:*(void *)(a1 + 40)];
}

void __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_316(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * *(void *)(a1 + 48));
  id v5 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_2;
  v8[3] = &unk_1E56E5BE8;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  long long v11 = *(_OWORD *)(a1 + 56);
  __int16 v12 = *(_WORD *)(a1 + 72);
  id v10 = v6;
  id v7 = v3;
  dispatch_after(v4, v5, v8);
}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performRequest:*(void *)(a1 + 40) taskIdentifier:*(void *)(a1 + 56) retries:*(void *)(a1 + 64) - 1 authHandling:*(unsigned __int8 *)(a1 + 72) cacheResponse:*(unsigned __int8 *)(a1 + 73) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __53__PKWebService_URLSession_task_didCompleteWithError___block_invoke_317(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequest:a2 taskIdentifier:*(void *)(a1 + 48) retries:*(void *)(a1 + 56) - 1 authHandling:*(unsigned __int8 *)(a1 + 64) cacheResponse:*(unsigned __int8 *)(a1 + 65) completionHandler:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = NSNumber;
  id v10 = (void (**)(id, void))a6;
  id v11 = a5;
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(a4, "taskIdentifier"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  unsigned int v13 = [(NSMutableDictionary *)self->_tasksMetadata objectForKey:v15];
  os_unfair_lock_unlock(p_stateLock);
  if ([v13 cacheResponse]) {
    id v14 = v11;
  }
  else {
    id v14 = 0;
  }
  ((void (**)(id, id))v10)[2](v10, v14);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, void))a7;
  [(PKWebService *)self logResponse:v12 withData:0];
  id v15 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Performing redirection…", buf, 2u);
  }

  v16 = [v11 originalRequest];
  id v17 = [v16 URL];

  id v18 = [v13 URL];
  uint64_t v19 = [v17 scheme];
  v44 = v18;
  if ([v19 isEqual:@"https"])
  {
    __int16 v20 = [v18 scheme];
    char v21 = [v20 isEqual:v19];

    if ((v21 & 1) == 0)
    {
      v40 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "ERROR: https request redirects to non https URL.", buf, 2u);
      }

      goto LABEL_10;
    }
  }
  uint64_t v22 = [v13 mutableCopy];
  if (!v22)
  {
LABEL_10:
    v14[2](v14, 0);
    goto LABEL_11;
  }
  __int16 v23 = (void *)v22;
  uint64_t v24 = [v11 originalRequest];
  uint64_t v25 = [v24 HTTPMethod];
  [v23 setHTTPMethod:v25];

  [v24 valueForHTTPHeaderField:@"Authorization"];
  v26 = id v43 = v11;
  [v23 setValue:v26 forHTTPHeaderField:@"Authorization"];

  v27 = [v24 HTTPBody];
  [v23 setHTTPBody:v27];

  v28 = [MEMORY[0x1E4F18DA0] propertyForKey:@"overlayRequest" inRequest:v24];
  v29 = (void *)MEMORY[0x1E4F28DC0];
  v41 = v17;
  v30 = v12;
  uint64_t v31 = objc_opt_class();
  [v28 data];
  id v42 = v13;
  v33 = v32 = v14;
  v34 = [v29 unarchivedObjectOfClass:v31 fromData:v33 error:0];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E56E5C60;
  id v35 = v30;
  id v46 = v35;
  id v47 = v34;
  id v48 = v23;
  char v49 = self;
  id v50 = v32;
  id v36 = v23;
  id v37 = v34;
  v38 = _Block_copy(aBlock);
  id v39 = v35;
  id v12 = v30;
  id v17 = v41;
  [(PKWebService *)self handleWillPerformHTTPRedirectionWithResponse:v39 originalRequest:v24 redirectHandler:v38];

  id v14 = (void (**)(id, void))v32;
  id v13 = v42;

  id v11 = v43;
LABEL_11:
}

void __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "pk_valueForHTTPHeaderField:", @"X-Redirect-Encrypted-Data");
    dispatch_time_t v4 = *(void **)(a1 + 40);
    if (!v4 || ([v4 requiresConfigurationForRedirect] ? (BOOL v5 = v3 == 0) : (BOOL v5 = 1), v5))
    {
      [*(id *)(a1 + 56) logRequest:*(void *)(a1 + 48)];
      uint64_t v6 = *(void *)(a1 + 64);
      id v7 = (void *)[*(id *)(a1 + 48) copy];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
      id v10 = (void *)v9;
      if (v9)
      {
        id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:0];
      }
      else
      {
        id v11 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = *(void **)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
        v15[3] = &unk_1E56E5C38;
        v15[4] = v14;
        id v16 = *(id *)(a1 + 64);
        [v12 _updateRequestForRedirect:v13 overrides:v11 webService:v14 withCompletion:v15];
      }
    }
  }
  else
  {
    BOOL v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v8();
  }
}

void __88__PKWebService_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 logRequest:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (id)[v4 copy];

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 currentRequest];
    BOOL v8 = [v7 URL];
    uint64_t v9 = [v8 absoluteString];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Task is waiting for connectivity URL: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PKWebService *)self urlSession];

  if (v6 == v5) {
    [(PKWebService *)self setUrlSession:0];
  }
  id v7 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v5 configuration];
    uint64_t v9 = [v8 identifier];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Session did become invalid. Identifier: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  int v10 = (void (**)(id, void, void *))a5;
  id v7 = [a4 protectionSpace];
  BOOL v8 = [v7 authenticationMethod];
  if ([v8 isEqualToString:*MEMORY[0x1E4F18CB8]])
  {
    if (-[PKWebService _evaluateTrust:](self, "_evaluateTrust:", [v7 serverTrust]))
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F18D88], "credentialForTrust:", objc_msgSend(v7, "serverTrust"));
      v10[2](v10, 0, v9);
    }
    else
    {
      v10[2](v10, 2, 0);
    }
  }
  else
  {
    v10[2](v10, 1, 0);
  }
}

- (NSString)webServiceSessionMarker
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = (void *)[(NSString *)self->_webServiceSessionMarker copy];
  os_unfair_lock_unlock(p_stateLock);
  return (NSString *)v4;
}

- (id)_urlRequestTaggedWithWebServiceSessionMarkerHeader:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  id v5 = [(PKWebService *)self webServiceSessionMarker];
  [v4 setValue:v5 forHTTPHeaderField:@"X-Apple-Web-Service-Session"];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (id)urlRequestTaggedWithUniqueRequestIdentifier:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  id v4 = PKRequestIDHeaderValue();
  if (v4) {
    [v3 setValue:v4 forHTTPHeaderField:@"x-request-id"];
  }
  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)_urlRequestWithCustomHeaders:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  id v4 = PKGetCustomHeaders();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PKWebService__urlRequestWithCustomHeaders___block_invoke;
  v8[3] = &unk_1E56DCAA0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __45__PKWebService__urlRequestWithCustomHeaders___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)diagnosticSessionWithReason:(id)a3 sessionHandler:(id)a4
{
  if (a4)
  {
    id v6 = (void (**)(id, PKWebService *))a4;
    id v7 = a3;
    [(PKWebService *)self addDiagnosticReason:v7];
    v6[2](v6, self);

    [(PKWebService *)self removeDiagnosticReason:v7];
  }
}

- (void)addDiagnosticReason:(id)a3
{
  id v4 = a3;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PKWebService_addDiagnosticReason___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(diagnosticReasonsQueue, v7);
}

void __36__PKWebService_addDiagnosticReason___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = *(void **)(*(void *)(a1 + 40) + 64);
    id v4 = (id)[v2 copy];
    [v3 addObject:v4];
  }
}

- (void)removeDiagnosticReason:(id)a3
{
  id v4 = a3;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PKWebService_removeDiagnosticReason___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(diagnosticReasonsQueue, v7);
}

uint64_t __39__PKWebService_removeDiagnosticReason___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(*(void *)(result + 40) + 64), "removeObject:");
  }
  return result;
}

- (void)_associateDiagnosticReasonsWithTaskID:(unint64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__29;
  id v15 = __Block_byref_object_dispose__29;
  id v16 = 0;
  diagnosticReasonsQueue = self->_diagnosticReasonsQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PKWebService__associateDiagnosticReasonsWithTaskID___block_invoke;
  v10[3] = &unk_1E56DC5F0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(diagnosticReasonsQueue, v10);
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  uint64_t v8 = v12[5];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)diagnosticReasonsByTaskID setObject:v8 forKey:v9];

  os_unfair_lock_unlock(p_stateLock);
  _Block_object_dispose(&v11, 8);
}

void __54__PKWebService__associateDiagnosticReasonsWithTaskID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_cleanUpDiagnosticReasonsForTaskID:(unint64_t)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)diagnosticReasonsByTaskID removeObjectForKey:v7];

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_urlRequestTaggedWithDiagnosticReasonHeader:(id)a3 forTaskID:(unint64_t)a4
{
  id v6 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  diagnosticReasonsByTaskID = self->_diagnosticReasonsByTaskID;
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  int v10 = [(NSMutableDictionary *)diagnosticReasonsByTaskID objectForKey:v9];
  uint64_t v11 = (void *)[v10 mutableCopy];

  os_unfair_lock_unlock(p_stateLock);
  if ([v11 count])
  {
    uint64_t v12 = [v6 valueForHTTPHeaderField:@"X-Apple-Diagnostic-Reasons"];
    if (v12) {
      [v11 addObject:v12];
    }
    uint64_t v13 = (void *)[v6 mutableCopy];
    uint64_t v14 = [v11 componentsJoinedByString:@", "];
    [v13 setValue:v14 forHTTPHeaderField:@"X-Apple-Diagnostic-Reasons"];
    id v15 = (id)[v13 copy];
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

- (int64_t)logFacilityType
{
  return 2;
}

- (void)logRequest:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    if (v4)
    {
      id v7 = (void *)MEMORY[0x192FDC630]();
      uint64_t v8 = [v4 HTTPBody];
      id v9 = [v4 URL];
      int v10 = [v9 absoluteString];

      PKTimeProfileBegin(0, v10);
      uint64_t v11 = [[PKWebServiceLoggableRequestBody alloc] initWithBody:v8 sensitiveKeys:self->_sensitiveKeys];
      uint64_t v12 = [PKWebServiceLoggableHeaders alloc];
      uint64_t v13 = [v4 allHTTPHeaderFields];
      uint64_t v14 = [(PKWebServiceLoggableHeaders *)v12 initWithHeaders:v13];

      id v15 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v4 HTTPMethod];
        *(_DWORD *)buf = 138413058;
        v33 = v16;
        __int16 v34 = 2112;
        id v35 = v10;
        __int16 v36 = 2112;
        id v37 = v14;
        __int16 v38 = 2112;
        id v39 = v11;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Performing request:\n%@ %@\n%@\n\n%@\n", buf, 0x2Au);
      }
      id v17 = [MEMORY[0x1E4F18DA0] propertyForKey:@"encryptedCardDataKeys" inRequest:v4];
      if (v17)
      {
        uint64_t v25 = v8;
        v26 = v7;
        id v18 = [MEMORY[0x1E4F28E78] string];
        [v18 appendString:@"Encrypted Card Data Keys: "];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v28 != v22) {
                objc_enumerationMutation(v19);
              }
              [v18 appendFormat:@"%@,", *(void *)(*((void *)&v27 + 1) + 8 * i)];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v21);
        }

        uint64_t v8 = v25;
        id v7 = v26;
      }
    }
    else
    {
      uint64_t v24 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Request is nil", buf, 2u);
      }
    }
  }
}

- (void)logResponse:(id)a3 withData:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    int v10 = [v6 URL];
    uint64_t v11 = [v10 absoluteString];

    uint64_t v12 = PKTimeProfileEnd(0, v11, 0);
    uint64_t v13 = [[PKWebServiceLoggableRequestBody alloc] initWithBody:v7 sensitiveKeys:self->_sensitiveKeys];
    uint64_t v14 = [PKWebServiceLoggableHeaders alloc];
    id v15 = [v6 allHeaderFields];
    id v16 = [(PKWebServiceLoggableHeaders *)v14 initWithHeaders:v15];

    id v17 = PKLogFacilityTypeGetObject([(PKWebService *)self logFacilityType]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138413314;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = [v6 statusCode];
      __int16 v22 = 2114;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      long long v27 = v13;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Response:\n%@ %ld %{public}@\n%@\n\n%@\n", (uint8_t *)&v18, 0x34u);
    }
  }
}

- (PKTapToRadarDelegate)tapToRadarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapToRadarDelegate);
  return (PKTapToRadarDelegate *)WeakRetained;
}

- (void)setTapToRadarDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapToRadarDelegate);
  objc_storeStrong((id *)&self->_sensitiveKeys, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_diagnosticReasons, 0);
  objc_storeStrong((id *)&self->_tasksMetadata, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsByTaskID, 0);
  objc_storeStrong((id *)&self->_webServiceTasks, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_webServiceSessionMarker, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end