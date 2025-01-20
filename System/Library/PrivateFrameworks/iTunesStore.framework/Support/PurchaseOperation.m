@interface PurchaseOperation
+ (double)_randomDouble;
+ (void)reportAnonymousPings:(id)a3;
- (AMSPurchaseShim)shim;
- (BOOL)_clientIsViewService;
- (BOOL)_shouldDisableReversePush;
- (BOOL)_shouldSendKeyBagSyncData;
- (BOOL)_shouldSendSBSyncData;
- (BOOL)_shouldUseClientAuthentication;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)didConsumeScore;
- (BOOL)displayedErrorDialog;
- (BOOL)isBackgroundPurchase;
- (BOOL)isMoveToiOS;
- (BOOL)isPlaybackRequest;
- (BOOL)isPreauthenticated;
- (BOOL)microPayment;
- (BOOL)requiresAuthentication;
- (BOOL)requiresSerialNumber;
- (BOOL)shouldSendKeyBagSyncData;
- (BOOL)skipsConfirmationDialogs;
- (BOOL)useRemoteAuthentication;
- (ISURLRequestPerformance)requestPerformanceMetrics;
- (NSData)clientAuditTokenData;
- (NSDictionary)rawOutput;
- (NSDictionary)tidHeaders;
- (NSNumber)originalProductOwnerAccountDSID;
- (NSString)affiliateIdentifier;
- (NSString)buyParameters;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)deviceScore;
- (NSString)logKey;
- (NSString)originatingStorefront;
- (NSString)storeCorrelationID;
- (NSString)urlBagKey;
- (PurchaseOperation)init;
- (PurchaseOperation)initWithPurchase:(id)a3;
- (SSAuthenticationContext)authenticationContext;
- (SSURLConnectionResponse)URLResponse;
- (id)_URLBagContext;
- (id)_account;
- (id)_accountWithUniqueIdentifier:(id)a3;
- (id)_buyParamProductType;
- (id)_countryCode;
- (id)_deviceScoreMetricsParam;
- (id)_fairPlaySubscriptionController;
- (id)_newPurchaseRequestOperation;
- (id)_newRequestParameters;
- (id)_priceFromBuyParams;
- (id)_recordEngagementEventWithResult:(id)a3 error:(id)a4;
- (id)authenticatedAccountDSID;
- (id)remoteAuthenticationHandler;
- (id)uniqueKey;
- (int64_t)_purchaseType;
- (int64_t)bagType;
- (void)_addFairPlayToRequestProperties:(id)a3 withAccountIdentifier:(unint64_t)a4;
- (void)_continueTouchIDSessionWithDialog:(id)a3;
- (void)_handleFailureForOperation:(id)a3;
- (void)_performApplePayClassicCheck;
- (void)_performAutoEnrollmentCheck;
- (void)_performDelayedGotoForOperation:(id)a3;
- (void)_performMachineDataActionForURLResponse:(id)a3;
- (void)_runDialogOperationForDialog:(id)a3;
- (void)_runPurchaseRequest;
- (void)_scoreDevice;
- (void)_scoreDeviceRetryFailedV2Score;
- (void)_setChangedBuyParameters:(id)a3 fromDataProvider:(id)a4;
- (void)_setMoveToiOS;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)operation:(id)a3 shouldAuthenticateWithContext:(id)a4 responseHandler:(id)a5;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)run;
- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4;
- (void)sender:(id)a3 shouldContinueTouchIDSession:(BOOL)a4;
- (void)sender:(id)a3 willSendChallenge:(id)a4 andSignature:(id)a5 andPaymentTokenData:(id)a6 andFpanID:(id)a7 isExtendedAction:(BOOL)a8 isPayment:(BOOL)a9 additionalHeaders:(id)a10;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBackgroundPurchase:(BOOL)a3;
- (void)setBagType:(int64_t)a3;
- (void)setBuyParameters:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setDidConsumeScore:(BOOL)a3;
- (void)setDisplayedErrorDialog:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMicroPayment:(BOOL)a3;
- (void)setOriginalProductOwnerAccountDSID:(id)a3;
- (void)setOriginatingStorefront:(id)a3;
- (void)setPlaybackRequest:(BOOL)a3;
- (void)setPreauthenticated:(BOOL)a3;
- (void)setRawOutput:(id)a3;
- (void)setRemoteAuthenticationHandler:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresSerialNumber:(BOOL)a3;
- (void)setShouldSendKeyBagSyncData:(BOOL)a3;
- (void)setSkipsConfirmationDialogs:(BOOL)a3;
- (void)setStoreCorrelationID:(id)a3;
- (void)setUrlBagKey:(id)a3;
- (void)setUseRemoteAuthentication:(BOOL)a3;
@end

@implementation PurchaseOperation

- (PurchaseOperation)init
{
  return [(PurchaseOperation *)self initWithPurchase:0];
}

- (PurchaseOperation)initWithPurchase:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PurchaseOperation;
  v5 = [(PurchaseOperation *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 affiliateIdentifier];
    affiliateIdentifier = v5->_affiliateIdentifier;
    v5->_affiliateIdentifier = (NSString *)v6;

    id v8 = objc_alloc((Class)SSAuthenticationContext);
    v9 = [v4 accountIdentifier];
    v10 = (SSAuthenticationContext *)[v8 initWithAccountIdentifier:v9];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = v10;

    v12 = (SSBiometricAuthenticationContext *)objc_alloc_init((Class)SSBiometricAuthenticationContext);
    biometricAuthenticationContext = v5->_biometricAuthenticationContext;
    v5->_biometricAuthenticationContext = v12;

    uint64_t v14 = [v4 buyParameters];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v14;

    uint64_t v16 = [v4 valueForDownloadProperty:SSDownloadPropertyKind];
    downloadKind = v5->_downloadKind;
    v5->_downloadKind = (NSString *)v16;

    v5->_didConsumeScore = 0;
    v5->_displaysOnLockScreen = [v4 displaysOnLockScreen];
    v5->_ignoresForcedPasswordRestriction = [v4 ignoresForcedPasswordRestriction];
    v5->_isBackgroundPurchase = [v4 isBackgroundPurchase];
    v5->_isPlaybackRequest = [v4 isPlaybackRequest];
    uint64_t v18 = [(SSAuthenticationContext *)v5->_authenticationContext logUUID];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v18;

    v20 = +[SSDevice currentDevice];
    uint64_t v21 = [v20 storeFrontIdentifier];
    originatingStorefront = v5->_originatingStorefront;
    v5->_originatingStorefront = (NSString *)v21;

    v5->_preauthenticated = [v4 isPreauthenticated];
    v23 = [v4 requestProperties];
    v24 = (SSURLRequestProperties *)[v23 copy];
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = v24;

    v26 = [v4 valueForDownloadProperty:SSDownloadPropertyShouldSuppressErrorDialogs];
    v5->_suppressDialogs = [v26 BOOLValue];

    v5->_silentAuthCount = 0;
    v5->_shouldCancelBiometricTokenUpdate = +[ISBiometricStore tokenUpdateState] == (id)1;
    v27 = [v4 tidHeaders];
    if (v27)
    {
      [(SSBiometricAuthenticationContext *)v5->_biometricAuthenticationContext setIsPayment:1];
      [(SSBiometricAuthenticationContext *)v5->_biometricAuthenticationContext setShouldContinueTouchIDSession:1];
      v28 = [v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDChallenge];
      v29 = [v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDSignature];
      v30 = [v27 objectForKeyedSubscript:SSHTTPHeaderXAppleTouchIDAction];
      if (v28) {
        [(SSBiometricAuthenticationContext *)v5->_biometricAuthenticationContext setChallenge:v28];
      }
      if (v29) {
        [(SSBiometricAuthenticationContext *)v5->_biometricAuthenticationContext setSignature:v29];
      }
      v31 = [v30 uppercaseString];
      unsigned int v32 = [v31 isEqualToString:@"FB"];

      if (v32) {
        [(SSBiometricAuthenticationContext *)v5->_biometricAuthenticationContext setDidFallbackToPassword:1];
      }
    }
    [(PurchaseOperation *)v5 setPowerAssertionIdentifier:@"com.apple.itunesstored.purchase"];
    [(PurchaseOperation *)v5 _setMoveToiOS];
    if (!v5->_moveToiOS)
    {
      v33 = [[AMSPurchaseShim alloc] initWithPurchase:v4];
      shim = v5->_shim;
      v5->_shim = v33;
    }
  }

  return v5;
}

+ (void)reportAnonymousPings:(id)a3
{
  id v3 = a3;
  id v4 = [(id)ISWeakLinkedClassForString() sharedConnection];
  unsigned int v5 = [v4 isAppAnalyticsAllowed];

  if (v5)
  {
    uint64_t v6 = +[ISOperationQueue mainQueue];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v3;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [objc_alloc((Class)NSURL) initWithString:v12];
            id v14 = objc_alloc_init((Class)ISURLOperation);
            [v14 setQueuePriority:-4];
            [v14 _setUsesPrivateCookieStore:0];
            id v15 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:v13];
            [v15 setAllowedRetryCount:0];
            [v15 setITunesStoreRequest:0];
            [v15 setTimeoutInterval:20.0];
            [v14 setRequestProperties:v15];
            [v6 addOperation:v14];
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    id v3 = v16;
  }
}

- (NSString)affiliateIdentifier
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_affiliateIdentifier;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_authenticationContext;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (NSString)clientIdentifier
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_clientIdentifier;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (NSString)clientIdentifierHeader
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_clientIdentifierHeader;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (NSString)deviceScore
{
  [(PurchaseOperation *)self lock];
  id v3 = [(NSString *)self->_deviceScore copy];
  [(PurchaseOperation *)self unlock];

  return (NSString *)v3;
}

- (BOOL)isBackgroundPurchase
{
  [(PurchaseOperation *)self lock];
  BOOL isBackgroundPurchase = self->_isBackgroundPurchase;
  [(PurchaseOperation *)self unlock];
  return isBackgroundPurchase;
}

- (BOOL)isPlaybackRequest
{
  [(PurchaseOperation *)self lock];
  BOOL isPlaybackRequest = self->_isPlaybackRequest;
  [(PurchaseOperation *)self unlock];
  return isPlaybackRequest;
}

- (BOOL)isMoveToiOS
{
  [(PurchaseOperation *)self lock];
  BOOL moveToiOS = self->_moveToiOS;
  [(PurchaseOperation *)self unlock];
  return moveToiOS;
}

- (NSString)logKey
{
  id v3 = [(PurchaseOperation *)self authenticationContext];
  id v4 = [v3 logUUID];

  if (v4)
  {
    unsigned int v5 = [(PurchaseOperation *)self authenticationContext];
    uint64_t v6 = [v5 logUUID];
  }
  else
  {
    uint64_t v6 = self->_logKey;
  }

  return v6;
}

- (NSNumber)originalProductOwnerAccountDSID
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_originalProductOwnerAccountDSID;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (ISURLRequestPerformance)requestPerformanceMetrics
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_requestPerformanceMetrics;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (void)setAffiliateIdentifier:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_affiliateIdentifier != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v4;
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setAuthenticationContext:(id)a3
{
  uint64_t v6 = (SSAuthenticationContext *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_authenticationContext != v6)
  {
    id v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setBackgroundPurchase:(BOOL)a3
{
  [(PurchaseOperation *)self lock];
  self->_BOOL isBackgroundPurchase = a3;

  [(PurchaseOperation *)self unlock];
}

- (void)setPlaybackRequest:(BOOL)a3
{
  [(PurchaseOperation *)self lock];
  self->_BOOL isPlaybackRequest = a3;

  [(PurchaseOperation *)self unlock];
}

- (void)setClientIdentifier:(id)a3
{
  unsigned int v5 = (NSString *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_clientIdentifier != v5) {
    objc_storeStrong((id *)&self->_clientIdentifier, a3);
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setClientIdentifierHeader:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_clientIdentifierHeader != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    clientIdentifierHeader = self->_clientIdentifierHeader;
    self->_clientIdentifierHeader = v4;
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setOriginalProductOwnerAccountDSID:(id)a3
{
  uint64_t v6 = (NSNumber *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_originalProductOwnerAccountDSID != v6)
  {
    id v4 = (NSNumber *)[(NSNumber *)v6 copy];
    originalProductOwnerAccountDSID = self->_originalProductOwnerAccountDSID;
    self->_originalProductOwnerAccountDSID = v4;
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setUrlBagKey:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  [(PurchaseOperation *)self lock];
  if (self->_urlBagKey != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    urlBagKey = self->_urlBagKey;
    self->_urlBagKey = v4;
  }
  [(PurchaseOperation *)self unlock];
}

- (void)setUseRemoteAuthentication:(BOOL)a3
{
  [(PurchaseOperation *)self lock];
  self->_useRemoteAuthentication = a3;

  [(PurchaseOperation *)self unlock];
}

- (NSDictionary)tidHeaders
{
  [(PurchaseOperation *)self lock];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext challenge];
  unsigned int v5 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext signature];
  unsigned int v6 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext didFallbackToPassword];
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v3 setObject:v4 forKey:SSHTTPHeaderXAppleTouchIDChallenge];
    [v3 setObject:v5 forKey:SSHTTPHeaderXAppleTouchIDSignature];
  }
  if (v6) {
    [v3 setObject:@"FB" forKey:SSHTTPHeaderXAppleTouchIDAction];
  }
  [(PurchaseOperation *)self unlock];
  if ([v3 count]) {
    id v8 = [v3 copy];
  }
  else {
    id v8 = 0;
  }

  return (NSDictionary *)v8;
}

- (NSString)urlBagKey
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_urlBagKey;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"buyProduct";
  }
  [(PurchaseOperation *)self unlock];

  return (NSString *)v4;
}

- (BOOL)useRemoteAuthentication
{
  [(PurchaseOperation *)self lock];
  BOOL useRemoteAuthentication = self->_useRemoteAuthentication;
  [(PurchaseOperation *)self unlock];
  return useRemoteAuthentication;
}

- (SSURLConnectionResponse)URLResponse
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_urlResponse;
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (id)authenticatedAccountDSID
{
  [(PurchaseOperation *)self lock];
  id v3 = self->_accountID;
  if (!v3)
  {
    id v3 = [(SSAuthenticationContext *)self->_authenticationContext requiredUniqueIdentifier];
  }
  [(PurchaseOperation *)self unlock];

  return v3;
}

- (void)run
{
  shim = self->_shim;
  if (shim)
  {
    id v135 = 0;
    id v4 = [(AMSPurchaseShim *)shim runPurchase:&v135];
    id v5 = v135;
    unsigned int v6 = v5;
    if (!v5)
    {
LABEL_63:
      -[PurchaseOperation setSuccess:](self, "setSuccess:", v6 == 0, v126);
      goto LABEL_184;
    }
    id v7 = v5;
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      id v13 = objc_opt_class();
      id v14 = v13;
      id v15 = AMSLogKey();
      int v136 = 138543874;
      v137 = v13;
      __int16 v138 = 2114;
      id v139 = v15;
      __int16 v140 = 2114;
      unsigned int v6 = v7;
      v141 = v7;
      LODWORD(v128) = 32;
      v126 = &v136;
      id v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_62:

        [(PurchaseOperation *)self setError:v6];
        goto LABEL_63;
      }
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v136, v128);
      free(v16);
      v126 = (int *)v11;
      SSFileLog();
    }
    else
    {
      unsigned int v6 = v7;
    }

    goto LABEL_62;
  }
  long long v17 = [(PurchaseOperation *)self buyParameters];
  id v18 = +[NSURL copyDictionaryForQueryString:v17 unescapedValues:1];

  id v131 = v18;
  v132 = [v18 objectForKey:@"salableAdamId"];
  long long v19 = &syslog_ptr;
  long long v20 = +[SSLogConfig sharedDaemonConfig];
  if (!v20)
  {
    long long v20 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  v23 = [v20 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    int v24 = v22;
  }
  else {
    int v24 = v22 & 2;
  }
  if (v24)
  {
    v25 = objc_opt_class();
    id v26 = v25;
    v27 = [(PurchaseOperation *)self logKey];
    int v136 = 138543874;
    v137 = v25;
    __int16 v138 = 2114;
    id v139 = v27;
    __int16 v140 = 2112;
    v141 = v132;
    LODWORD(v128) = 32;
    v126 = &v136;
    v28 = (void *)_os_log_send_and_compose_impl();

    long long v19 = &syslog_ptr;
    if (!v28) {
      goto LABEL_26;
    }
    v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v136, v128);
    free(v28);
    v126 = (int *)v23;
    SSFileLog();
  }

LABEL_26:
  v29 = [(PurchaseOperation *)self _URLBagContext];
  v30 = [(PurchaseOperation *)self clientAuditTokenData];
  [v29 setClientAuditTokenData:v30];

  id v134 = 0;
  v130 = v29;
  unsigned int v31 = [(PurchaseOperation *)self loadURLBagWithContext:v29 returningError:&v134];
  id v32 = v134;
  if (v31) {
    goto LABEL_40;
  }
  v33 = +[SSLogConfig sharedDaemonConfig];
  if (!v33)
  {
    v33 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = objc_msgSend(v33, "shouldLog", v126);
  if ([v33 shouldLogToDisk]) {
    int v35 = v34 | 2;
  }
  else {
    int v35 = v34;
  }
  objc_super v36 = [v33 OSLogObject];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
    int v37 = v35;
  }
  else {
    int v37 = v35 & 2;
  }
  if (!v37) {
    goto LABEL_38;
  }
  v38 = objc_opt_class();
  int v136 = 138412546;
  v137 = v38;
  __int16 v138 = 2112;
  id v139 = v32;
  id v39 = v38;
  LODWORD(v128) = 22;
  v126 = &v136;
  v40 = (void *)_os_log_send_and_compose_impl();

  if (v40)
  {
    objc_super v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v136, v128);
    free(v40);
    v126 = (int *)v36;
    SSFileLog();
LABEL_38:
  }
  [(PurchaseOperation *)self setError:v32];
  long long v19 = &syslog_ptr;
LABEL_40:
  v41 = objc_alloc_init(PurchaseResponseInfo);
  responseInfo = self->_responseInfo;
  self->_responseInfo = v41;

  v129 = v32;
  if (+[ISBiometricStore shouldUseApplePayClassic])
  {
    [(PurchaseOperation *)self _performApplePayClassicCheck];
  }
  else if (+[ISBiometricStore shouldUseAutoEnrollment])
  {
    [(PurchaseOperation *)self _performAutoEnrollmentCheck];
  }
  if (!+[DeviceScorer deviceScoringSupported]) {
    goto LABEL_70;
  }
  int64_t v43 = [(PurchaseOperation *)self _purchaseType];
  v44 = +[SSLogConfig sharedDaemonConfig];
  if (!v44)
  {
    v44 = +[SSLogConfig sharedConfig];
  }
  unsigned int v45 = [v44 shouldLog];
  if ([v44 shouldLogToDisk]) {
    int v46 = v45 | 2;
  }
  else {
    int v46 = v45;
  }
  v47 = [v44 OSLogObject];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO)) {
    int v48 = v46;
  }
  else {
    int v48 = v46 & 2;
  }
  if (v48)
  {
    v49 = [(PurchaseOperation *)self logKey];
    v50 = +[NSNumber numberWithInteger:v43];
    int v136 = 138543618;
    v137 = v49;
    __int16 v138 = 2114;
    id v139 = v50;
    LODWORD(v128) = 22;
    v127 = &v136;
    v51 = (void *)_os_log_send_and_compose_impl();

    if (!v51) {
      goto LABEL_57;
    }
    v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v136, v128, v129);
    free(v51);
    v127 = (int *)v47;
    SSFileLog();
  }

LABEL_57:
  if (v43 != 3 && v43)
  {
    unsigned int v52 = 0;
  }
  else
  {
    v44 = [(PurchaseOperation *)self buyParameters];
    unsigned int v52 = [v44 containsString:@"STDRDL"] ^ 1;
  }
  long long v19 = &syslog_ptr;
  if (v43 == 3 || !v43) {

  }
  if (v52) {
    [(PurchaseOperation *)self _scoreDevice];
  }
LABEL_70:
  if (!v31) {
    goto LABEL_159;
  }
  HIDWORD(v128) = 0;
  while (1)
  {
    v53 = [(PurchaseResponseInfo *)self->_responseInfo dialog];
    [(PurchaseResponseInfo *)self->_responseInfo reset];
    [(PurchaseOperation *)self setError:0];
    if (v53) {
      [(PurchaseOperation *)self _runDialogOperationForDialog:v53];
    }
    else {
      [(PurchaseOperation *)self _runPurchaseRequest];
    }
    v54 = [(PurchaseResponseInfo *)self->_responseInfo changedBuyParameters];
    if (([(PurchaseOperation *)self success] & 1) != 0
      || ([(PurchaseOperation *)self isCancelled] & 1) != 0)
    {
      break;
    }
    v55 = [(PurchaseResponseInfo *)self->_responseInfo dialog];

    if (v55)
    {
      v56 = [v19[405] sharedDaemonConfig];
      if (!v56)
      {
        v56 = [v19[405] sharedConfig];
      }
      unsigned int v57 = [v56 shouldLog];
      if ([v56 shouldLogToDisk]) {
        v57 |= 2u;
      }
      v58 = [v56 OSLogObject];
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO)) {
        v57 &= 2u;
      }
      if (v57)
      {
        v59 = objc_opt_class();
        int v136 = 138412290;
        v137 = v59;
        id v60 = v59;
        LODWORD(v128) = 12;
        v127 = &v136;
        v61 = (void *)_os_log_send_and_compose_impl();

        long long v19 = &syslog_ptr;
        if (!v61) {
          goto LABEL_88;
        }
        v58 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v61, 4, &v136, v128);
        free(v61);
        v127 = (int *)v58;
        SSFileLog();
      }

      goto LABEL_88;
    }
    if ([(PurchaseResponseInfo *)self->_responseInfo shouldRetryForDelayedGoto])
    {
      uint64_t v62 = [(PurchaseResponseInfo *)self->_responseInfo delayedGotoRetryCount];
      if (v62 > 4) {
        break;
      }
      uint64_t v63 = v62;
      v64 = [v19[405] sharedDaemonConfig];
      if (!v64)
      {
        v64 = [v19[405] sharedConfig];
      }
      unsigned int v65 = [v64 shouldLog];
      if ([v64 shouldLogToDisk]) {
        v65 |= 2u;
      }
      v66 = [v64 OSLogObject];
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_INFO)) {
        v65 &= 2u;
      }
      if (v65)
      {
        v67 = objc_opt_class();
        int v136 = 138412290;
        v137 = v67;
        id v68 = v67;
        LODWORD(v128) = 12;
        v127 = &v136;
        v69 = (void *)_os_log_send_and_compose_impl();

        if (v69)
        {
          v66 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v69, 4, &v136, v128);
          free(v69);
          v127 = (int *)v66;
          SSFileLog();
          goto LABEL_100;
        }
      }
      else
      {
LABEL_100:
      }
      if (v54) {
        [(PurchaseOperation *)self setBuyParameters:v54];
      }
      -[PurchaseResponseInfo setDelayedGotoRetryCount:](self->_responseInfo, "setDelayedGotoRetryCount:", v63 + 1, v127);
      long long v19 = &syslog_ptr;
      goto LABEL_116;
    }
    if (v54)
    {
      v70 = [v19[405] sharedDaemonConfig];
      if (!v70)
      {
        v70 = [v19[405] sharedConfig];
      }
      unsigned int v71 = [v70 shouldLog];
      if ([v70 shouldLogToDisk]) {
        v71 |= 2u;
      }
      v72 = [v70 OSLogObject];
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_INFO)) {
        v71 &= 2u;
      }
      if (v71)
      {
        v73 = objc_opt_class();
        int v136 = 138412290;
        v137 = v73;
        id v74 = v73;
        LODWORD(v128) = 12;
        v127 = &v136;
        v75 = (void *)_os_log_send_and_compose_impl();

        long long v19 = &syslog_ptr;
        if (v75)
        {
          v72 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v75, 4, &v136, v128);
          free(v75);
          v127 = (int *)v72;
          SSFileLog();
          goto LABEL_114;
        }
      }
      else
      {
LABEL_114:
      }
      [(PurchaseOperation *)self setBuyParameters:v54];
      goto LABEL_116;
    }
    v76 = [(PurchaseResponseInfo *)self->_responseInfo machineDataSyncState];

    if (v76)
    {
      v56 = [v19[405] sharedDaemonConfig];
      if (!v56)
      {
        v56 = [v19[405] sharedConfig];
      }
      unsigned int v77 = [v56 shouldLog];
      if ([v56 shouldLogToDisk]) {
        v77 |= 2u;
      }
      v78 = [v56 OSLogObject];
      if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO)) {
        v77 &= 2u;
      }
      if (v77)
      {
        v79 = objc_opt_class();
        int v136 = 138412290;
        v137 = v79;
        id v80 = v79;
        LODWORD(v128) = 12;
        v127 = &v136;
        v81 = (void *)_os_log_send_and_compose_impl();

        long long v19 = &syslog_ptr;
        if (v81)
        {
          v78 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, &v136, v128);
          free(v81);
          v127 = (int *)v78;
          SSFileLog();
          goto LABEL_128;
        }
      }
      else
      {
LABEL_128:
      }
LABEL_88:

      goto LABEL_116;
    }
    unsigned int v82 = [(PurchaseResponseInfo *)self->_responseInfo shouldRetryForMachineData];
    v83 = self->_responseInfo;
    if (v82)
    {
      int64_t v84 = [(PurchaseResponseInfo *)v83 machineDataRetryCount];
      if (v84 > 0) {
        break;
      }
      int64_t v85 = v84;
      v86 = [v19[405] sharedDaemonConfig];
      if (!v86)
      {
        v86 = [v19[405] sharedConfig];
      }
      unsigned int v87 = [v86 shouldLog];
      if ([v86 shouldLogToDisk]) {
        v87 |= 2u;
      }
      v88 = [v86 OSLogObject];
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_INFO)) {
        v87 &= 2u;
      }
      if (v87)
      {
        v89 = objc_opt_class();
        int v136 = 138412290;
        v137 = v89;
        id v90 = v89;
        LODWORD(v128) = 12;
        v127 = &v136;
        v91 = (void *)_os_log_send_and_compose_impl();

        long long v19 = &syslog_ptr;
        if (v91)
        {
          v88 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v91, 4, &v136, v128);
          free(v91);
          v127 = (int *)v88;
          SSFileLog();
          goto LABEL_140;
        }
      }
      else
      {
LABEL_140:
      }
      [(PurchaseResponseInfo *)self->_responseInfo setMachineDataRetryCount:v85 + 1];
      goto LABEL_116;
    }
    if (![(PurchaseResponseInfo *)v83 shouldRetryWithOriginalProductOwnerAccount]|| (self->_originalProductOwnerAccountDSID == 0) | BYTE4(v128) & 1)
    {
      break;
    }
    id v92 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccountIdentifier:self->_originalProductOwnerAccountDSID];
    v93 = [(PurchaseOperation *)self logKey];
    [v92 setLogUUID:v93];

    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = (SSAuthenticationContext *)v92;

    HIDWORD(v128) = 1;
LABEL_116:
    if (self->_silentAuthCount >= 3)
    {
      v95 = [v19[405] sharedDaemonConfig];
      if (!v95)
      {
        v95 = [v19[405] sharedConfig];
      }
      unsigned int v96 = objc_msgSend(v95, "shouldLog", v127);
      if ([v95 shouldLogToDisk]) {
        int v97 = v96 | 2;
      }
      else {
        int v97 = v96;
      }
      v98 = [v95 OSLogObject];
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        int v99 = v97;
      }
      else {
        int v99 = v97 & 2;
      }
      if (v99)
      {
        v100 = objc_opt_class();
        int v136 = 138543362;
        v137 = v100;
        id v101 = v100;
        LODWORD(v128) = 12;
        v127 = &v136;
        v102 = (void *)_os_log_send_and_compose_impl();

        if (v102)
        {
          v98 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v102, 4, &v136, v128);
          free(v102);
          v127 = (int *)v98;
          SSFileLog();
          goto LABEL_156;
        }
      }
      else
      {
LABEL_156:
      }
      long long v19 = &syslog_ptr;
      break;
    }
  }
LABEL_159:
  v103 = [(PurchaseOperation *)self rawOutput];
  v104 = [(PurchaseOperation *)self error];
  v105 = [(PurchaseOperation *)self _recordEngagementEventWithResult:v103 error:v104];

  v133[0] = _NSConcreteStackBlock;
  v133[1] = 3221225472;
  v133[2] = sub_10001E780;
  v133[3] = &unk_1003A3140;
  v133[4] = self;
  [v105 addSuccessBlock:v133];
  v106 = [(PurchaseOperation *)self error];

  uint64_t v107 = [v19[405] sharedDaemonConfig];
  v108 = (void *)v107;
  if (!v106)
  {
    if (!v107)
    {
      v108 = [v19[405] sharedConfig];
    }
    unsigned int v118 = [v108 shouldLog];
    if ([v108 shouldLogToDisk]) {
      v118 |= 2u;
    }
    v110 = [v108 OSLogObject];
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT)) {
      v118 &= 2u;
    }
    if (v118)
    {
      v119 = objc_opt_class();
      id v120 = v119;
      v121 = [(PurchaseOperation *)self logKey];
      int v136 = 138543618;
      v137 = v119;
      __int16 v138 = 2114;
      id v139 = v121;
      LODWORD(v128) = 22;
      uint64_t v122 = _os_log_send_and_compose_impl();

      if (!v122) {
        goto LABEL_181;
      }
      v110 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v122, 4, &v136, v128);
      v117 = (void *)v122;
LABEL_179:
      free(v117);
      SSFileLog();
    }
    goto LABEL_180;
  }
  if (!v107)
  {
    v108 = [v19[405] sharedConfig];
  }
  unsigned int v109 = [v108 shouldLog];
  if ([v108 shouldLogToDisk]) {
    v109 |= 2u;
  }
  v110 = [v108 OSLogObject];
  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
    int v111 = v109;
  }
  else {
    int v111 = v109 & 2;
  }
  if (!v111)
  {
LABEL_180:

    goto LABEL_181;
  }
  v112 = objc_opt_class();
  id v113 = v112;
  v114 = [(PurchaseOperation *)self logKey];
  v115 = [(PurchaseOperation *)self error];
  int v136 = 138543874;
  v137 = v112;
  __int16 v138 = 2114;
  id v139 = v114;
  __int16 v140 = 2114;
  v141 = v115;
  LODWORD(v128) = 32;
  uint64_t v116 = _os_log_send_and_compose_impl();

  if (v116)
  {
    v110 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v116, 4, &v136, v128);
    v117 = (void *)v116;
    goto LABEL_179;
  }
LABEL_181:

  v123 = [(DeviceScorer *)self->_deviceScorer context];
  id v124 = [v123 serverEndpoint];

  if (v124 == (id)2) {
    [(DeviceScorer *)self->_deviceScorer didConsumeDeviceScore:[(PurchaseOperation *)self didConsumeScore]];
  }
  v125 = self->_responseInfo;
  self->_responseInfo = 0;

  unsigned int v6 = v131;
LABEL_184:
}

- (id)uniqueKey
{
  return @"com.apple.itunesstored.PurchaseOperation";
}

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [v20 _requestProperties];
  [v7 URLBagType];
  if (!SSAccountScopeForURLBagType())
  {
    unsigned int v9 = +[SSAccountStore defaultStore];
    id v10 = [v9 accountWithUniqueIdentifier:v6 scope:0];
    goto LABEL_5;
  }
  id v8 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  unsigned int v9 = objc_msgSend(v8, "ams_iTunesAccountWithDSID:", v6);

  if (v9)
  {
    id v10 = [objc_alloc((Class)SSAccount) initWithBackingAccount:v9];
LABEL_5:
    v11 = v10;
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  if (v6) {
    -[PurchaseOperation _addFairPlayToRequestProperties:withAccountIdentifier:](self, "_addFairPlayToRequestProperties:withAccountIdentifier:", v7, [v6 unsignedLongLongValue]);
  }
  int v12 = [v11 popBiometricToken];
  if (!v12) {
    [v20 setIgnorePreexistingSecureToken:0];
  }
  [(PurchaseOperation *)self lock];
  id v13 = [v12 base64EncodedStringWithOptions:0];
  objc_storeStrong((id *)&self->_mToken, v13);
  [(PurchaseResponseInfo *)self->_responseInfo setDidPasswordAuthenticate:[(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext didFallbackToPassword]];
  [(PurchaseOperation *)self unlock];
  [v7 setValue:v13 forHTTPHeaderField:SSHTTPHeaderXToken];
  id v14 = +[NSNumber numberWithBool:1];
  [v7 setValue:v14 forRequestParameter:@"hasBeenAuthedForBuy"];

  [(PurchaseOperation *)self lock];
  authenticationContext = self->_authenticationContext;
  if (authenticationContext)
  {
    id v16 = [(SSAuthenticationContext *)authenticationContext requiredUniqueIdentifier];

    id v17 = 0;
    if (!v16 && v11)
    {
      id v17 = [(SSAuthenticationContext *)self->_authenticationContext mutableCopy];
      [v17 setValuesWithAccount:v11];
      id v18 = (SSAuthenticationContext *)[v17 copy];
      long long v19 = self->_authenticationContext;
      self->_authenticationContext = v18;
    }
  }
  else
  {
    id v17 = 0;
  }
  self->_didAuthenticate = 1;
  [(PurchaseOperation *)self unlock];
  if (v17) {
    [v20 setAuthenticationContext:v17];
  }
}

- (void)operation:(id)a3 shouldAuthenticateWithContext:(id)a4 responseHandler:(id)a5
{
  id v12 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  if (![(PurchaseOperation *)self useRemoteAuthentication])
  {
    id v8 = SSError();
    v7[2](v7, 0, v8);
  }
  uint64_t v9 = [(PurchaseOperation *)self remoteAuthenticationHandler];
  id v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v12, v7);
  }
  else
  {
    v11 = SSError();
    v7[2](v7, 0, v11);
  }
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForHTTPHeaderField:SSHTTPHeaderXAppleMD];

  if (!v8)
  {
    uint64_t v9 = [v6 _accountIdentifier];
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "unsignedLongLongValue", v17);
      SSVAnisetteAddHeadersToURLRequest();

      goto LABEL_4;
    }
    urlBagKey = self->_urlBagKey;
    if (urlBagKey)
    {
      if ([(NSString *)urlBagKey isEqualToString:@"downloadProduct"])
      {
        v11 = +[SSLogConfig sharedDaemonConfig];
        if (!v11)
        {
          v11 = +[SSLogConfig sharedConfig];
        }
        unsigned int v12 = [v11 shouldLog];
        if ([v11 shouldLogToDisk]) {
          int v13 = v12 | 2;
        }
        else {
          int v13 = v12;
        }
        id v14 = [v11 OSLogObject];
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          v13 &= 2u;
        }
        if (v13)
        {
          LODWORD(v19) = 138543362;
          *(void *)((char *)&v19 + 4) = objc_opt_class();
          id v15 = *(id *)((char *)&v19 + 4);
          LODWORD(v18) = 12;
          id v17 = &v19;
          id v16 = (void *)_os_log_send_and_compose_impl();

          if (!v16)
          {
LABEL_18:

            uint64_t v9 = &off_1003C8F28;
            goto LABEL_3;
          }
          id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v19, v18, v19);
          free(v16);
          id v17 = v14;
          SSFileLog();
        }

        goto LABEL_18;
      }
    }
  }
LABEL_4:
}

- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4
{
}

- (void)sender:(id)a3 shouldContinueTouchIDSession:(BOOL)a4
{
}

- (void)sender:(id)a3 willSendChallenge:(id)a4 andSignature:(id)a5 andPaymentTokenData:(id)a6 andFpanID:(id)a7 isExtendedAction:(BOOL)a8 isPayment:(BOOL)a9 additionalHeaders:(id)a10
{
  BOOL v10 = a8;
  id v23 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  if (v16) {
    [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setChallenge:v16];
  }
  if (v17) {
    [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setSignature:v17];
  }
  if (v18) {
    [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setPaymentTokenData:v18];
  }
  if (v19) {
    [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setFpanID:v19];
  }
  [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setIsExtendedAction:v10];
  [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setIsPayment:a9];
  if (v20)
  {
    unsigned int v21 = [v20 objectForKeyedSubscript:SSHTTPHeaderXAppleAMD];
    if (v21) {
      [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setXAppleAMDHeader:v21];
    }
    int v22 = [v20 objectForKeyedSubscript:SSHTTPHeaderXAppleAMDM];
    if (v22) {
      [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setXAppleAMDMHeader:v22];
    }
  }
}

- (id)_account
{
  id v3 = +[SSAccountStore defaultStore];
  id v4 = [(PurchaseOperation *)self authenticationContext];
  id v5 = [v4 requiredUniqueIdentifier];
  if (v5
    || ([v3 activeAccount],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 uniqueIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    id v7 = [v4 accountScope];
    if (!v7
      || ([v3 accountWithUniqueIdentifier:v5 scope:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v8 = [v3 accountWithUniqueIdentifier:v5];
    }
    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_accountWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PurchaseOperation *)self authenticationContext];
    id v6 = [v5 accountScope];
    if (!v6
      || (id v7 = v6,
          +[SSAccountStore defaultStore],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 accountWithUniqueIdentifier:v4 scope:v7],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      BOOL v10 = +[SSAccountStore defaultStore];
      uint64_t v9 = [v10 accountWithUniqueIdentifier:v4];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_addFairPlayToRequestProperties:(id)a3 withAccountIdentifier:(unint64_t)a4
{
  id v6 = a3;
  if ([(PurchaseOperation *)self _shouldSendKeyBagSyncData])
  {
    CFDataRef v7 = sub_10002D24C(a4, 1);
    uint64_t v8 = [(__CFData *)v7 base64EncodedStringWithOptions:0];
    if (v8) {
      [v6 setValue:v8 forRequestParameter:@"kbsync"];
    }
  }
  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  MachineDataAddHeadersToRequestProperties();

  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  sub_1001DC128(-1, (uint64_t)&v31, (uint64_t)&v29 + 4, (uint64_t)&v30, (uint64_t)&v29);
  if (v10)
  {
    int v11 = v10;
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12)
    {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      int v32 = 134217984;
      uint64_t v33 = v11;
      LODWORD(v26) = 12;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17) {
        goto LABEL_35;
      }
      id v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v32, v26);
      free(v17);
      SSFileLog();
    }
    goto LABEL_34;
  }
  if (HIDWORD(v29))
  {
    id v18 = objc_alloc((Class)NSData);
    id v12 = [v18 initWithBytesNoCopy:v31 length:HIDWORD(v29) freeWhenDone:0];
  }
  else
  {
    id v12 = 0;
  }
  if ([(PurchaseOperation *)self _shouldSendSBSyncData])
  {
    id v19 = [(PurchaseOperation *)self _fairPlaySubscriptionController];
    id v27 = 0;
    id v28 = 0;
    [v19 generateSubscriptionBagRequestWithAccountUniqueIdentifier:a4 transactionType:312 machineIDData:v12 returningSubscriptionBagData:&v28 error:&v27];
    id v20 = v28;
    id v21 = v27;
    if (!v21)
    {
      int v22 = [v20 base64EncodedStringWithOptions:0];
      if (v22) {
        [v6 setValue:v22 forRequestParameter:@"sbsync"];
      }
    }
  }
  if (v12)
  {
    id v23 = [v12 base64EncodedStringWithOptions:0];
    if (v23) {
      [v6 setValue:v23 forHTTPHeaderField:SSHTTPHeaderXAppleAMDM];
    }
  }
  if (v30)
  {
    id v24 = objc_alloc((Class)NSData);
    id v15 = [v24 initWithBytesNoCopy:v30 length:v29 freeWhenDone:0];
    v25 = [v15 base64EncodedStringWithOptions:0];
    if (v25) {
      [v6 setValue:v25 forHTTPHeaderField:SSHTTPHeaderXAppleAMD];
    }

LABEL_34:
  }
LABEL_35:

  if (v31) {
    sub_1001CD9F8(v31);
  }
  if (v30) {
    sub_1001CD9F8(v30);
  }
}

- (id)_buyParamProductType
{
  id v3 = [(PurchaseOperation *)self buyParameters];
  id v4 = +[NSURL copyDictionaryForQueryString:v3 unescapedValues:1];

  id v5 = [v4 objectForKeyedSubscript:@"productType"];
  if (![(__CFString *)v5 length] && [(PurchaseOperation *)self microPayment])
  {

    id v5 = @"A";
  }
  if (![(__CFString *)v5 length])
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v14, v13, v14);
      free(v11);
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (BOOL)_clientIsViewService
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [&off_1003C9F20 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&off_1003C9F20);
        }
        unsigned int v7 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v6);
        int v8 = [(PurchaseOperation *)self clientIdentifier];
        LOBYTE(v7) = [v7 isEqualToString:v8];

        if (v7)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [&off_1003C9F20 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (void)_continueTouchIDSessionWithDialog:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "buttons", 0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      int v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) dictionary];
        long long v10 = [v9 objectForKey:@"tidContinue"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 BOOLValue])
        {

          [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setShouldContinueTouchIDSession:1];
          return;
        }

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
}

- (id)_countryCode
{
  id v2 = objc_alloc((Class)ISLoadURLBagOperation);
  id v3 = +[SSURLBagContext contextWithBagType:0];
  id v4 = [v2 initWithBagContext:v3];

  [v4 start];
  id v5 = [v4 URLBag];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      uint64_t v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    id v17 = [v9 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v16 &= 2u;
    }
    if (v16)
    {
      *(_DWORD *)int v22 = 138543362;
      *(void *)&v22[4] = objc_opt_class();
      id v18 = *(id *)&v22[4];
      LODWORD(v21) = 12;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_24:
        int v8 = 0;
        goto LABEL_25;
      }
      id v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, v22, v21, *(void *)v22, *(void *)&v22[8]);
      free(v19);
      SSFileLog();
    }

    goto LABEL_24;
  }
  uint64_t v7 = [v5 valueForKey:@"countryCode"];
  int v8 = [v7 uppercaseString];

  uint64_t v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    uint64_t v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  long long v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    *(_DWORD *)int v22 = 138543618;
    *(void *)&v22[4] = objc_opt_class();
    *(_WORD *)&v22[12] = 2114;
    *(void *)&v22[14] = v8;
    id v13 = *(id *)&v22[4];
    LODWORD(v21) = 22;
    long long v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_25;
    }
    long long v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, v22, v21, *(_OWORD *)v22, *(void *)&v22[16]);
    free(v14);
    SSFileLog();
  }

LABEL_25:

  return v8;
}

- (id)_deviceScoreMetricsParam
{
  if (+[DeviceScorer deviceScoringSupported])
  {
    id v3 = [(PurchaseOperation *)self deviceScore];
    id v4 = [v3 length];
    id v5 = @"true";
    if (!v4) {
      id v5 = @"false";
    }
    id v6 = v5;
  }
  else
  {
    id v6 = @"disabled";
  }

  return v6;
}

- (id)_fairPlaySubscriptionController
{
  [(PurchaseOperation *)self lock];
  if (!self->_fairPlaySubscriptionController)
  {
    id v3 = (SSVFairPlaySubscriptionController *)objc_alloc_init((Class)SSVFairPlaySubscriptionController);
    fairPlaySubscriptionController = self->_fairPlaySubscriptionController;
    self->_fairPlaySubscriptionController = v3;
  }
  [(PurchaseOperation *)self unlock];
  id v5 = self->_fairPlaySubscriptionController;

  return v5;
}

- (void)_handleFailureForOperation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dataProvider];
  id v6 = [v5 output];
  unsigned int v96 = v5;
  uint64_t v7 = [v5 redirectActionParameters];
  int v8 = [v6 objectForKey:kISDialogKey];
  uint64_t v9 = [v6 objectForKey:kISFailureTypeKey];
  unsigned int v10 = &OBJC_IVAR___PurchaseOperation__buyParameters;
  if ([v9 integerValue] == (id)3800 && self->_originalProductOwnerAccountDSID)
  {
    [(PurchaseResponseInfo *)self->_responseInfo setShouldRetryWithOriginalProductOwnerAccount:1];
    goto LABEL_90;
  }
  if (v7)
  {
    int v11 = [(PurchaseOperation *)self buyParameters];
    unsigned __int8 v12 = [v7 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      unsigned int v52 = +[SSLogConfig sharedDaemonConfig];
      if (!v52)
      {
        unsigned int v52 = +[SSLogConfig sharedConfig];
      }
      v95 = v9;
      unsigned int v53 = [v52 shouldLog];
      if ([v52 shouldLogToDisk]) {
        int v54 = v53 | 2;
      }
      else {
        int v54 = v53;
      }
      v55 = [v52 OSLogObject];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
        int v56 = v54;
      }
      else {
        int v56 = v54 & 2;
      }
      if (v56)
      {
        unsigned int v57 = v8;
        v58 = v7;
        v59 = objc_opt_class();
        id v90 = v6;
        id v60 = v59;
        v61 = [(PurchaseOperation *)self logKey];
        int v102 = 138543874;
        v103 = v59;
        uint64_t v7 = v58;
        int v8 = v57;
        __int16 v104 = 2114;
        v105 = v61;
        __int16 v106 = 2112;
        uint64_t v107 = v7;
        LODWORD(v82) = 32;
        v81 = &v102;
        uint64_t v62 = (void *)_os_log_send_and_compose_impl();

        id v6 = v90;
        if (v62)
        {
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v62, 4, &v102, v82);
          uint64_t v63 = (int *)objc_claimAutoreleasedReturnValue();
          free(v62);
          v81 = v63;
          SSFileLog();
        }
      }
      else
      {
      }
      [(PurchaseOperation *)self _setChangedBuyParameters:v7 fromDataProvider:v96];
      uint64_t v9 = v95;
      goto LABEL_89;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [objc_alloc((Class)ISDialog) initWithDialogDictionary:v8];
    long long v14 = [v4 authenticationContext];
    [v13 setAuthenticationContext:v14];

    unsigned int v15 = [v6 objectForKey:@"metrics"];
    int v16 = +[SSAuthorizationMetricsController dialogIdForMetricsDictionary:v15];
    id v17 = [v13 paymentSheet];
    [v17 setDialogId:v16];

    [(PurchaseOperation *)self _continueTouchIDSessionWithDialog:v13];
    if ([v13 kind] == (id)1)
    {
LABEL_88:

LABEL_89:
      unsigned int v10 = &OBJC_IVAR___PurchaseOperation__buyParameters;
      goto LABEL_90;
    }
    int64_t v85 = v15;
    id v87 = v4;
    v91 = v7;
    id v18 = [v13 buttons];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v19 = [v18 countByEnumeratingWithState:&v97 objects:v101 count:16];
    int64_t v84 = v16;
    v89 = v6;
    v93 = v9;
    if (v19)
    {
      id v20 = v19;
      char v21 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v98;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v98 != v23) {
            objc_enumerationMutation(v18);
          }
          unsigned int v25 = [*(id *)(*((void *)&v97 + 1) + 8 * i) actionType];
          if (v25 == 1)
          {
            char v21 = 1;
          }
          else if (v25 == 11 || v25 == 3)
          {
            char v22 = 1;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v97 objects:v101 count:16];
      }
      while (v20);
      uint64_t v9 = v93;
      if (v22)
      {
        id v27 = +[SSLogConfig sharedDaemonConfig];
        if (!v27)
        {
          id v27 = +[SSLogConfig sharedConfig];
        }
        unsigned int v28 = [v27 shouldLog];
        if ([v27 shouldLogToDisk]) {
          v28 |= 2u;
        }
        uint64_t v29 = [v27 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          int v30 = v28;
        }
        else {
          int v30 = v28 & 2;
        }
        if (v30)
        {
          uint64_t v31 = objc_opt_class();
          id v32 = v31;
          uint64_t v33 = [(PurchaseOperation *)self buyParameters];
          int v102 = 138412546;
          v103 = v31;
          __int16 v104 = 2112;
          v105 = v33;
          LODWORD(v82) = 22;
          v81 = &v102;
          unsigned int v34 = (void *)_os_log_send_and_compose_impl();

          id v4 = v87;
          uint64_t v9 = v93;
          if (!v34)
          {
LABEL_72:

            [(PurchaseResponseInfo *)self->_responseInfo setDialog:v13];
LABEL_87:

            id v6 = v89;
            uint64_t v7 = v91;
            int v16 = v84;
            unsigned int v15 = v85;
            goto LABEL_88;
          }
          uint64_t v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v102, v82);
          free(v34);
          v81 = (int *)v29;
          SSFileLog();
        }
        else
        {
          id v4 = v87;
          uint64_t v9 = v93;
        }

        goto LABEL_72;
      }
    }
    else
    {
      char v21 = 0;
    }
    v64 = [(PurchaseOperation *)self error];

    if (!v64)
    {
      if (v21)
      {
        unsigned int v65 = ISError();
        [(PurchaseOperation *)self setError:v65];
      }
      else
      {
        unsigned int v65 = [v6 objectForKey:@"customerMessage"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          unsigned int v65 = 0;
        }
        if (v9) {
          [v9 integerValue];
        }
        v66 = SSError();
        [(PurchaseOperation *)self setError:v66];
      }
    }
    v67 = +[SSLogConfig sharedDaemonConfig];
    if (!v67)
    {
      v67 = +[SSLogConfig sharedConfig];
    }
    unsigned int v68 = [v67 shouldLog];
    if ([v67 shouldLogToDisk]) {
      v68 |= 2u;
    }
    v69 = [v67 OSLogObject];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
      int v70 = v68;
    }
    else {
      int v70 = v68 & 2;
    }
    if (v70)
    {
      unsigned int v71 = objc_opt_class();
      id v83 = v71;
      v72 = [(PurchaseOperation *)self buyParameters];
      v73 = [(PurchaseOperation *)self error];
      int v102 = 138412802;
      v103 = v71;
      __int16 v104 = 2112;
      v105 = v72;
      __int16 v106 = 2112;
      uint64_t v107 = v73;
      LODWORD(v82) = 32;
      v81 = &v102;
      id v74 = (void *)_os_log_send_and_compose_impl();

      uint64_t v9 = v93;
      if (!v74)
      {
LABEL_86:

        [(PurchaseOperation *)self setDisplayedErrorDialog:1];
        id v75 = objc_alloc_init((Class)NSUUID);
        v76 = [v75 UUIDString];

        unsigned int v77 = +[ISBiometricStore sharedInstance];
        [v77 addContextToCache:self->_biometricAuthenticationContext withToken:v76];

        [v13 setTouchIDContinueToken:v76];
        v78 = [[DaemonDialogOperation alloc] initWithDialog:v13];
        [(DaemonDialogOperation *)v78 setDisplaysOnLockscreen:self->_displaysOnLockScreen];
        v79 = +[ISOperationQueue mainQueue];
        [v79 addOperation:v78];

        id v4 = v87;
        goto LABEL_87;
      }
      v69 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v74, 4, &v102, v82);
      free(v74);
      v81 = (int *)v69;
      SSFileLog();
    }

    goto LABEL_86;
  }
  int v35 = [v6 objectForKey:@"customerMessage"];
  objc_opt_class();
  id v92 = v7;
  v94 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v36 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v37 = [v36 localizedStringForKey:@"GENERIC_PURCHASE_ERROR" value:&stru_1003B9B00 table:0];

    int v35 = (void *)v37;
  }
  v88 = v35;
  v38 = ISError();
  [(PurchaseOperation *)self setError:v38];

  id v39 = +[SSLogConfig sharedDaemonConfig];
  if (!v39)
  {
    id v39 = +[SSLogConfig sharedConfig];
  }
  unsigned int v40 = [v39 shouldLog];
  if ([v39 shouldLogToDisk]) {
    int v41 = v40 | 2;
  }
  else {
    int v41 = v40;
  }
  v42 = [v39 OSLogObject];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
    int v43 = v41;
  }
  else {
    int v43 = v41 & 2;
  }
  if (v43)
  {
    v44 = objc_opt_class();
    id v86 = v44;
    unsigned int v45 = [(PurchaseOperation *)self logKey];
    [(PurchaseOperation *)self buyParameters];
    int v46 = v6;
    v47 = v8;
    v49 = id v48 = v4;
    int v102 = 138544130;
    v103 = v44;
    __int16 v104 = 2114;
    v105 = v45;
    __int16 v106 = 2112;
    uint64_t v9 = v94;
    uint64_t v107 = v94;
    __int16 v108 = 2112;
    unsigned int v109 = v49;
    LODWORD(v82) = 42;
    v81 = &v102;
    v50 = (void *)_os_log_send_and_compose_impl();

    id v4 = v48;
    int v8 = v47;
    id v6 = v46;
    unsigned int v10 = &OBJC_IVAR___PurchaseOperation__buyParameters;

    if (v50)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4, &v102, v82);
      v51 = (int *)objc_claimAutoreleasedReturnValue();
      free(v50);
      v81 = v51;
      SSFileLog();
    }
  }
  else
  {

    uint64_t v9 = v94;
  }

  uint64_t v7 = v92;
LABEL_90:
  objc_msgSend(*(id *)&self->ISOperation_opaque[v10[25]], "setMachineDataSyncState:", 0, v81);
  id v80 = [v4 response];
  [(PurchaseOperation *)self _performMachineDataActionForURLResponse:v80];
}

- (id)_newPurchaseRequestOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  [v3 setDelegate:self];
  id v4 = [(PurchaseOperation *)self logKey];
  [v3 setLogKey:v4];

  [v3 setMachineDataStyle:0];
  [v3 setShouldCancelBiometricTokenUpdate:self->_shouldCancelBiometricTokenUpdate];
  [v3 setShouldSendXTokenHeader:1];
  [v3 setTracksPerformanceMetrics:1];
  [v3 setUseUserSpecificURLBag:1];
  id v5 = [(PurchaseOperation *)self authenticationContext];
  id v6 = [v5 mutableCopy];

  if (!v6)
  {
    id v7 = objc_alloc((Class)SSMutableAuthenticationContext);
    int v8 = +[SSAccountStore defaultStore];
    uint64_t v9 = [v8 activeAccount];
    id v6 = [v7 initWithAccount:v9];

    unsigned int v10 = [(PurchaseOperation *)self logKey];
    [v6 setLogUUID:v10];
  }
  objc_msgSend(v6, "setAllowsBootstrapCellularData:", -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  [v6 setDisplaysOnLockScreen:self->_displaysOnLockScreen];
  int v11 = [(PurchaseOperation *)self urlBagKey];
  unsigned int v12 = [v11 isEqualToString:@"updateProduct"];

  if (v12) {
    [v6 setCanSetActiveAccount:0];
  }
  if ([(PurchaseOperation *)self isMoveToiOS])
  {
    id v13 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v13)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    int v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      id v18 = (id)objc_opt_class();
      int v138 = 138543362;
      id v139 = v18;
      LODWORD(v126) = 12;
      uint64_t v122 = &v138;
      id v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_18:

        [v6 setShouldIgnoreAccountConversion:1];
        goto LABEL_19;
      }
      int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v138, v126);
      free(v19);
      uint64_t v122 = (int *)v16;
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_19:
  uint64_t v20 = SSClientIdentifierForDownloadKind();
  if (!v20)
  {
    if ([(PurchaseOperation *)self _clientIsViewService])
    {
      uint64_t v20 = [(PurchaseOperation *)self clientIdentifier];
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  id v134 = (void *)v20;
  objc_msgSend(v6, "setPreferredITunesStoreClient:", v20, v122);
  uint64_t v21 = [(PurchaseOperation *)self buyParameters];
  id v136 = v6;
  v137 = v3;
  if (v21)
  {
    char v22 = (void *)v21;
    id v23 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v21, @"product", 0);
    [v6 setSignupRequestParameters:v23];
    [(PurchaseOperation *)self lock];
    id v24 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext paymentTokenData];
    [(PurchaseOperation *)self unlock];
    if (!v24) {
      goto LABEL_38;
    }
    unsigned int v25 = +[SSLogConfig sharedDaemonConfig];
    if (!v25)
    {
      unsigned int v25 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    unsigned int v28 = [v25 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      id v30 = (id)objc_opt_class();
      int v138 = 138543362;
      id v139 = v30;
      LODWORD(v126) = 12;
      id v124 = &v138;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_37:

        id v32 = v24;
        [v32 bytes];
        [v32 length];
        uint64_t v33 = (void *)ISCopyEncodedBase64();
        id v34 = +[NSURL copyDictionaryForQueryString:v22 unescapedValues:1];
        [v34 setObject:v33 forKeyedSubscript:@"pkPayment"];
        uint64_t v35 = +[NSURL queryStringForDictionary:v34 escapedValues:1];

        [(PurchaseOperation *)self lock];
        [(PurchaseOperation *)self setBuyParameters:v35];
        [(PurchaseOperation *)self unlock];

        char v22 = (void *)v35;
        id v3 = v137;
LABEL_38:
        objc_super v36 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext fpanID];
        if (!v36)
        {
LABEL_52:

          id v6 = v136;
          goto LABEL_53;
        }
        uint64_t v37 = +[SSLogConfig sharedDaemonConfig];
        if (!v37)
        {
          uint64_t v37 = +[SSLogConfig sharedConfig];
        }
        unsigned int v38 = [v37 shouldLog];
        if ([v37 shouldLogToDisk]) {
          int v39 = v38 | 2;
        }
        else {
          int v39 = v38;
        }
        unsigned int v40 = [v37 OSLogObject];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
          int v41 = v39;
        }
        else {
          int v41 = v39 & 2;
        }
        if (v41)
        {
          id v42 = (id)objc_opt_class();
          int v138 = 138543362;
          id v139 = v42;
          LODWORD(v126) = 12;
          v123 = &v138;
          int v43 = (void *)_os_log_send_and_compose_impl();

          if (!v43)
          {
LABEL_51:

            id v44 = +[NSURL copyDictionaryForQueryString:v22 unescapedValues:1];
            [v44 setObject:v36 forKeyedSubscript:@"fpanID"];
            uint64_t v45 = +[NSURL queryStringForDictionary:v44 escapedValues:1];

            [(PurchaseOperation *)self lock];
            [(PurchaseOperation *)self setBuyParameters:v45];
            [(PurchaseOperation *)self unlock];

            char v22 = (void *)v45;
            id v3 = v137;
            goto LABEL_52;
          }
          unsigned int v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v138, v126);
          free(v43);
          v123 = (int *)v40;
          SSFileLog();
        }

        goto LABEL_51;
      }
      unsigned int v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v138, v126);
      free(v31);
      id v124 = (int *)v28;
      SSFileLog();
    }

    goto LABEL_37;
  }
LABEL_53:
  int v46 = [(SSURLRequestProperties *)self->_requestProperties HTTPHeaders];
  uint64_t v47 = SSHTTPHeaderUserAgent;
  uint64_t v48 = [v46 objectForKey:SSHTTPHeaderUserAgent];

  if (v48) {
    [v6 setValue:v48 forHTTPHeaderField:v47];
  }
  uint64_t ShouldRequirePasswordImmediately = SSRestrictionsShouldRequirePasswordImmediately();
  v50 = [v6 requestParameters];
  id v51 = [v50 mutableCopy];

  if (!v51) {
    id v51 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v133 = (void *)v48;
  unsigned int v52 = +[NSNumber numberWithBool:ShouldRequirePasswordImmediately];
  [v51 setObject:v52 forKey:@"requirePasswordImmediately"];

  [v6 setRequestParameters:v51];
  [(PurchaseOperation *)self lock];
  BOOL v53 = [(PurchaseOperation *)self isPreauthenticated] || self->_didAuthenticate;
  [(PurchaseOperation *)self unlock];
  objc_msgSend(v3, "setNeedsAuthentication:", -[PurchaseOperation _shouldUseClientAuthentication](self, "_shouldUseClientAuthentication"));
  if (!v53 && self->_requiresAuthentication) {
    [v3 setNeedsAuthentication:1];
  }
  if (self->_suppressDialogs)
  {
    uint64_t v54 = 1000;
LABEL_65:
    objc_msgSend(v6, "setPromptStyle:", v54, v125);
    goto LABEL_84;
  }
  if (!v53)
  {
    int v55 = self->_ignoresForcedPasswordRestriction ? 0 : ShouldRequirePasswordImmediately;
    if (v55 == 1)
    {
      int v56 = +[SSLogConfig sharedDaemonConfig];
      if (!v56)
      {
        int v56 = +[SSLogConfig sharedConfig];
      }
      unsigned int v57 = [v56 shouldLog];
      if ([v56 shouldLogToDisk]) {
        int v58 = v57 | 2;
      }
      else {
        int v58 = v57;
      }
      v59 = [v56 OSLogObject];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO)) {
        int v60 = v58;
      }
      else {
        int v60 = v58 & 2;
      }
      if (v60)
      {
        id v61 = (id)objc_opt_class();
        int v138 = 138412290;
        id v139 = v61;
        LODWORD(v126) = 12;
        v125 = &v138;
        uint64_t v62 = (void *)_os_log_send_and_compose_impl();

        if (!v62)
        {
LABEL_83:

          uint64_t v54 = 1;
          [v3 setNeedsAuthentication:1];
          goto LABEL_65;
        }
        v59 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v62, 4, &v138, v126);
        free(v62);
        v125 = (int *)v59;
        SSFileLog();
      }

      goto LABEL_83;
    }
  }
LABEL_84:
  id v135 = [(PurchaseOperation *)self _newRequestParameters];
  uint64_t v63 = [v135 objectForKey:@"disableTouchID"];
  unsigned int v64 = [v63 BOOLValue];

  unsigned int v65 = &OBJC_IVAR___PurchaseOperation__buyParameters;
  if (v64
    || [(PurchaseResponseInfo *)self->_responseInfo didPasswordAuthenticate]
    || [(PurchaseOperation *)self isPreauthenticated])
  {
    [v3 setIgnorePreexistingSecureToken:0];
  }
  else
  {
    v119 = objc_alloc_init(DaemonBiometricStore);
    if ((id)[(DaemonBiometricStore *)v119 biometricState] == (id)2)
    {
      id v120 = +[MCProfileConnection sharedConnection];
      if ([v120 isPasscodeSet])
      {
        v121 = [(DaemonBiometricStore *)v119 identityMap];
        objc_msgSend(v3, "setIgnorePreexistingSecureToken:", objc_msgSend(v121, "count") != 0);

        unsigned int v65 = &OBJC_IVAR___PurchaseOperation__buyParameters;
      }
      else
      {
        [v3 setIgnorePreexistingSecureToken:0];
      }
    }
    else
    {
      [v3 setIgnorePreexistingSecureToken:0];
    }
  }
  v66 = objc_alloc_init(DaemonBiometricStore);
  v67 = [(DaemonBiometricStore *)v66 identityMap];
  id v131 = v66;
  if ([v67 count])
  {
    id v68 = [(DaemonBiometricStore *)v66 biometricState];

    if (v68 == (id)2)
    {
      id v69 = [*(id *)&self->ISOperation_opaque[v65[25]] didPasswordAuthenticate];
      goto LABEL_93;
    }
  }
  else
  {
  }
  id v69 = 0;
LABEL_93:
  int v70 = [v3 biometricAuthenticationContext];
  [v70 setShouldSendFallbackHeader:v69];

  [v3 setBiometricSessionDelegate:self];
  if ([(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext shouldContinueTouchIDSession])
  {
    unsigned int v71 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext challenge];
    v72 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext signature];
    unsigned int v73 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext didFallbackToPassword];
    id v74 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext isExtendedAction];
    id v75 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext isPayment];
    v76 = [v3 biometricAuthenticationContext];
    [v76 setChallenge:v71];

    unsigned int v77 = [v137 biometricAuthenticationContext];
    [v77 setSignature:v72];

    v78 = [v137 biometricAuthenticationContext];
    [v78 setIsExtendedAction:v74];

    id v3 = v137;
    v79 = [v137 biometricAuthenticationContext];
    [v79 setIsPayment:v75];

    if (v73)
    {
      id v80 = [v137 biometricAuthenticationContext];
      [v80 setDidFallbackToPassword:1];

      v81 = [v137 biometricAuthenticationContext];
      [v81 setShouldSendFallbackHeader:1];
    }
    id v6 = v136;
    unsigned int v65 = &OBJC_IVAR___PurchaseOperation__buyParameters;
  }
  v132 = v51;
  uint64_t v82 = [(PurchaseOperation *)self _buyParamProductType];
  unsigned int v83 = [v82 isEqualToString:@"A"];

  if (v83)
  {
    int64_t v84 = [v3 biometricAuthenticationContext];
    [v84 setTouchIDDelayEnabled:1];
  }
  int64_t v85 = objc_alloc_init(PurchaseProtocolDataProvider);
  [(PurchaseProtocolDataProvider *)v85 setAuthenticationContext:v6];
  [(PurchaseProtocolDataProvider *)v85 setBiometricSessionDelegate:v3];
  [(PurchaseProtocolDataProvider *)v85 setShouldProcessDialogs:0];
  [(PurchaseProtocolDataProvider *)v85 setShouldTriggerDownloads:0];
  [(PurchaseProtocolDataProvider *)v85 setBiometricAuthenticationContext:self->_biometricAuthenticationContext];
  [v3 setDataProvider:v85];
  id v86 = [(SSURLRequestProperties *)self->_requestProperties mutableCopy];
  if (!v86) {
    id v86 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  }
  [v86 setAllowedRetryCount:0];
  objc_msgSend(v86, "setAllowsBootstrapCellularData:", -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  [v86 setCachePolicy:1];
  id v87 = [(PurchaseOperation *)self clientAuditTokenData];
  [v86 setClientAuditTokenData:v87];

  [v86 setHTTPMethod:@"POST"];
  [v86 setRequestParameters:v135];
  [v86 setShouldDecodeResponse:0];
  objc_msgSend(v86, "setShouldDisableReversePush:", -[PurchaseOperation _shouldDisableReversePush](self, "_shouldDisableReversePush"));
  [v86 setShouldDisableReversePushSampling:1];
  objc_msgSend(v86, "setURLBagType:", -[PurchaseOperation bagType](self, "bagType"));
  [v86 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  v88 = +[ApplicationWorkspace defaultWorkspace];
  unsigned int v89 = [v88 isMultiUser];

  if (v89) {
    [v86 setValue:@"true" forHTTPHeaderField:SSHTTPHeaderXAppleMMeMultiUser];
  }
  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  v91 = [(PurchaseOperation *)self _deviceScoreMetricsParam];
  if ([v91 length]) {
    [v90 setObject:v91 forKeyedSubscript:@"deviceScore"];
  }
  id v92 = [(PurchaseOperation *)self _buyParamProductType];
  if ([v92 length]) {
    [v90 setObject:v92 forKeyedSubscript:@"purchaseProductType"];
  }
  if ([v90 count]) {
    [v86 setAdditionalMetrics:v90];
  }
  v129 = v91;
  v130 = v90;
  uint64_t v93 = v65[25];
  uint64_t v94 = [*(id *)&self->ISOperation_opaque[v93] redirectURL];
  if (v94) {
    [v86 setURL:v94];
  }
  v127 = (void *)v94;
  v95 = [v86 clientIdentifier];

  if (!v95)
  {
    unsigned int v96 = [(PurchaseOperation *)self clientIdentifierHeader];
    [v86 setClientIdentifier:v96];
  }
  if (([v86 canBeResolved] & 1) == 0)
  {
    long long v97 = [(PurchaseOperation *)self urlBagKey];
    [v86 setURLBagKey:v97];
  }
  long long v98 = [(PurchaseOperation *)self _account];
  long long v99 = v98;
  if (v98)
  {
    long long v100 = [v98 uniqueIdentifier];
    -[PurchaseOperation _addFairPlayToRequestProperties:withAccountIdentifier:](self, "_addFairPlayToRequestProperties:withAccountIdentifier:", v86, [v100 unsignedLongLongValue]);
  }
  uint64_t v128 = v92;
  id v101 = +[WiFiManager sharedWiFiManager];
  int v102 = [v101 IPAddress];

  if (v102) {
    [v86 setValue:v102 forHTTPHeaderField:@"X-Apple-Client-Address"];
  }
  if (+[SSDevice deviceIsInternalBuild])
  {
    v103 = +[NSUUID UUID];
    __int16 v104 = [v103 UUIDString];
    [v86 setValue:v104 forHTTPHeaderField:@"X-Apple-Purchase-UUID"];
  }
  v105 = [v86 HTTPHeaders];
  uint64_t v106 = SSHTTPHeaderXAppleTADevice;
  uint64_t v107 = [v105 objectForKeyedSubscript:SSHTTPHeaderXAppleTADevice];

  if (!v107)
  {
    __int16 v108 = +[SSDevice currentDevice];
    unsigned int v109 = [v108 thinnedApplicationVariantIdentifier];

    if (v109) {
      [v86 setValue:v109 forHTTPHeaderField:v106];
    }
  }
  v110 = [*(id *)&self->ISOperation_opaque[v93] machineDataSyncState];
  if (v110)
  {
    unsigned int v111 = [(PurchaseOperation *)self _shouldSendSBSyncData];
    v112 = &SSHTTPHeaderXAppleAMDS;
    if (!v111) {
      v112 = &SSHTTPHeaderXAppleMDS;
    }
    [v86 setValue:v110 forHTTPHeaderField:*v112];
  }
  [(PurchaseOperation *)self lock];
  mToken = self->_mToken;
  v114 = v136;
  if (mToken) {
    [v86 setValue:mToken forHTTPHeaderField:SSHTTPHeaderXToken];
  }
  [(PurchaseOperation *)self unlock];
  [v137 setAuthenticationContext:v136];
  [v137 setRequestProperties:v86];
  if ([(PurchaseOperation *)self isMoveToiOS])
  {
    [v137 setNeedsTermsAndConditionsAcceptance:1];
    v115 = +[SSAccountStore defaultStore];
    uint64_t v116 = [v115 activeAccount];

    if (!v116 || ([v116 isAuthenticated] & 1) == 0) {
      [v137 setNeedsAuthentication:1];
    }

    v114 = v136;
  }
  id v117 = v137;

  return v117;
}

- (id)_newRequestParameters
{
  id v3 = [(PurchaseOperation *)self buyParameters];
  id v4 = +[NSURL copyDictionaryForQueryString:v3 unescapedValues:1];

  [v4 removeObjectForKey:@"isUpdateAll"];
  id v5 = +[ISDevice sharedInstance];
  id v6 = [v5 guid];

  if (v6) {
    [v4 setObject:v6 forKey:@"guid"];
  }
  if ([(PurchaseOperation *)self requiresSerialNumber])
  {
    id v7 = +[ISDevice sharedInstance];
    uint64_t v8 = [v7 serialNumber];

    if (v8)
    {
      [v4 setObject:v8 forKey:@"serialNumber"];
      id v6 = (void *)v8;
    }
    else
    {
      id v6 = 0;
    }
  }
  if ([(PurchaseOperation *)self isBackgroundPurchase]) {
    [v4 setObject:@"1" forKey:@"is-background"];
  }
  uint64_t v9 = [(PurchaseOperation *)self affiliateIdentifier];

  if ([v9 length]) {
    [v4 setObject:v9 forKey:@"caller"];
  }
  unsigned int v10 = [v4 objectForKey:@"generateBuyParams"];

  if (v10)
  {
    int v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
    [v4 setObject:v11 forKey:@"generateBuyParams"];
  }
  if ([(PurchaseOperation *)self isPlaybackRequest]) {
    [v4 setObject:@"1" forKey:@"playback"];
  }
  if (qword_100401C00 != -1) {
    dispatch_once(&qword_100401C00, &stru_1003A3660);
  }
  if (!byte_100401BF8)
  {
    ISWeakLinkerLoadLibrary();
    id v12 = objc_alloc_init((Class)ACAccountStore);
    id v13 = objc_msgSend(v12, "aa_primaryAppleAccount");
    if ([v13 isEnabledForDataclass:kAccountDataclassBackup]) {
      [v4 setObject:@"1" forKey:@"icloud-backup-enabled"];
    }
  }
  unsigned int v14 = [(PurchaseOperation *)self _account];
  int v15 = [v14 creditsString];

  if ([v15 length]) {
    [v4 setObject:v15 forKey:@"creditDisplay"];
  }
  int v16 = [(PurchaseOperation *)self deviceScore];

  if (v16)
  {
    int v43 = v15;
    int v17 = [(DeviceScorer *)self->_deviceScorer context];
    id v18 = [v17 serverEndpoint];

    id v19 = @"afds";
    if (v18 == (id)2) {
      id v19 = @"afdsv2";
    }
    uint64_t v20 = v19;
    uint64_t v21 = [(PurchaseOperation *)self deviceScore];
    [v4 setObject:v21 forKey:v20];

    [(PurchaseOperation *)self setDidConsumeScore:1];
    char v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      char v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    unsigned int v25 = [v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      int v27 = objc_opt_class();
      id v40 = v27;
      uint64_t v28 = SSHashIfNeeded();
      +[NSNumber numberWithInteger:v18];
      int v29 = v41 = v20;
      [(PurchaseOperation *)self deviceScore];
      id v30 = v42 = v14;
      uint64_t v31 = SSHashIfNeeded();
      int v46 = 138544130;
      uint64_t v47 = v27;
      __int16 v48 = 2114;
      uint64_t v49 = v28;
      id v32 = (void *)v28;
      __int16 v50 = 2114;
      id v51 = v29;
      __int16 v52 = 2114;
      BOOL v53 = v31;
      LODWORD(v39) = 42;
      unsigned int v38 = &v46;
      uint64_t v33 = (void *)_os_log_send_and_compose_impl();

      unsigned int v14 = v42;
      uint64_t v20 = v41;

      if (v33)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v46, v39);
        id v34 = (int *)objc_claimAutoreleasedReturnValue();
        free(v33);
        unsigned int v38 = v34;
        SSFileLog();
      }
    }
    else
    {
    }
    int v15 = v43;
  }
  uint64_t v35 = [(SSURLRequestProperties *)self->_requestProperties requestParameters];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002223C;
  v44[3] = &unk_1003A3688;
  id v36 = v4;
  id v45 = v36;
  [v35 enumerateKeysAndObjectsUsingBlock:v44];

  return v36;
}

- (void)_performDelayedGotoForOperation:(id)a3
{
  id v11 = [a3 dataProvider];
  id v4 = [v11 output];
  id v5 = [DelayedGotoSemaphore alloc];
  id v6 = [v4 objectForKey:@"DelayedGoto"];
  id v7 = [(DelayedGotoSemaphore *)v5 initWithDelayedGoto:v6];

  [(DelayedGotoSemaphore *)v7 wait];
  uint64_t v8 = [(DelayedGotoSemaphore *)v7 bodyDictionary];
  if (v8)
  {
    uint64_t v9 = +[NSURL queryStringForDictionary:v8 escapedValues:0];
    [(PurchaseOperation *)self _setChangedBuyParameters:v9 fromDataProvider:v11];
  }
  unsigned int v10 = [(DelayedGotoSemaphore *)v7 URL];
  if (v10) {
    [(PurchaseResponseInfo *)self->_responseInfo setRedirectURL:v10];
  }
  [(PurchaseResponseInfo *)self->_responseInfo setShouldRetryForDelayedGoto:1];
}

- (void)_performMachineDataActionForURLResponse:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SSMachineDataRequest) initWithURLResponse:v4];

  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v6 = [(PurchaseOperation *)self authenticatedAccountDSID];
  [v5 setAccountIdentifier:v6];
  objc_msgSend(v5, "setAllowsBootstrapCellularData:", -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  id v7 = [objc_alloc((Class)ISMachineDataActionOperation) initWithMachineDataRequest:v5];
  [v7 setBlocksPurchaseRequests:0];
  [v7 setHidesServerDrivenDialogs:self->_suppressDialogs];
  uint64_t v8 = [(SSURLRequestProperties *)self->_requestProperties HTTPHeaders];
  uint64_t v9 = [v8 objectForKey:SSHTTPHeaderUserAgent];
  [v7 setUserAgent:v9];

  unsigned int v10 = [v5 actionName];
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  unsigned int v14 = [v11 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    int v15 = v13;
  }
  else {
    int v15 = v13 & 2;
  }
  int v26 = (void *)v6;
  if (!v15) {
    goto LABEL_13;
  }
  int v27 = 138412802;
  id v28 = (id)objc_opt_class();
  __int16 v29 = 2112;
  id v30 = v10;
  __int16 v31 = 2112;
  uint64_t v32 = v6;
  id v16 = v28;
  LODWORD(v25) = 32;
  int v24 = &v27;
  int v17 = (void *)_os_log_send_and_compose_impl();

  if (v17)
  {
    unsigned int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v27, v25);
    free(v17);
    int v24 = (int *)v14;
    SSFileLog();
LABEL_13:
  }
  [(PurchaseOperation *)self runSubOperation:v7 returningError:0];
  unsigned int v18 = [v7 success];
  id v19 = [v7 syncState];
  [(PurchaseResponseInfo *)self->_responseInfo setMachineDataSyncState:v19];
  if (v19) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v18;
  }
  -[PurchaseResponseInfo setShouldRetryForMachineData:](self->_responseInfo, "setShouldRetryForMachineData:", v20, v24);
  if ([(PurchaseResponseInfo *)self->_responseInfo shouldRetryForMachineData])
  {
    uint64_t v21 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext challenge];
    uint64_t v22 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext signature];
    unsigned int v23 = (void *)v22;
    if (v21 && v22) {
      [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext setShouldContinueTouchIDSession:1];
    }
  }
  if (v18 && [v10 isEqualToString:@"RP"]) {
    [(PurchaseResponseInfo *)self->_responseInfo setMachineDataRetryCount:-1];
  }

LABEL_26:
}

- (void)_performApplePayClassicCheck
{
  id v3 = [(PurchaseOperation *)self _countryCode];
  id v4 = &syslog_ptr;
  if (v3)
  {
    id v5 = +[ISBiometricStore applePayClassicNetworks];
    if (v5)
    {
      uint64_t v6 = +[NSSet setWithArray:v5];
      id v7 = +[ISBiometricStore sharedInstance];
      id v8 = [v7 biometricState];

      if (v8 == (id)2)
      {
        v72 = v6;
        unsigned int v73 = v3;
        id v9 = objc_alloc_init((Class)SSBiometricAuthenticationContext);
        unsigned int v10 = [(PurchaseOperation *)self authenticatedAccountDSID];
        [v9 setAccountIdentifier:v10];

        [v9 setIsPayment:1];
        id v11 = +[DaemonBiometricKeychain sharedInstance];
        unsigned int v71 = v9;
        id v12 = [v11 copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:v9 error:0];

        int v13 = &syslog_ptr;
        id v14 = +[AMSBiometrics isActionSupported:4 withAccessControl:v12];
        int v15 = +[SSLogConfig sharedDaemonConfig];
        if (!v15)
        {
          int v15 = +[SSLogConfig sharedConfig];
        }
        unsigned int v16 = [v15 shouldLog];
        if ([v15 shouldLogToDisk]) {
          int v17 = v16 | 2;
        }
        else {
          int v17 = v16;
        }
        unsigned int v18 = [v15 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          int v19 = v17;
        }
        else {
          int v19 = v17 & 2;
        }
        if (v19)
        {
          id v20 = v12;
          uint64_t v21 = objc_opt_class();
          id v22 = v21;
          unsigned int v23 = +[NSNumber numberWithBool:v14];
          int v74 = 138543618;
          id v75 = v21;
          id v12 = v20;
          id v4 = &syslog_ptr;
          __int16 v76 = 2114;
          unsigned int v77 = v23;
          LODWORD(v70) = 22;
          id v68 = &v74;
          int v24 = (void *)_os_log_send_and_compose_impl();

          int v13 = &syslog_ptr;
          if (v24)
          {
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v74, v70);
            uint64_t v25 = (int *)objc_claimAutoreleasedReturnValue();
            free(v24);
            id v68 = v25;
            SSFileLog();
          }
        }
        else
        {
        }
        if (v14)
        {
          uint64_t v6 = v72;
          if (v12) {
            CFRelease(v12);
          }
          id v44 = objc_msgSend(v4[405], "sharedDaemonConfig", v68);
          if (!v44)
          {
            id v44 = [v4[405] sharedConfig];
          }
          unsigned int v45 = [v44 shouldLog];
          if ([v44 shouldLogToDisk]) {
            v45 |= 2u;
          }
          int v46 = [v44 OSLogObject];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            int v47 = v45;
          }
          else {
            int v47 = v45 & 2;
          }
          if (v47)
          {
            __int16 v48 = objc_opt_class();
            id v49 = v48;
            __int16 v50 = +[NSNumber numberWithBool:0];
            int v74 = 138543618;
            id v75 = v48;
            __int16 v76 = 2114;
            unsigned int v77 = v50;
            LODWORD(v70) = 22;
            id v69 = &v74;
            id v51 = (void *)_os_log_send_and_compose_impl();

            id v3 = v73;
            if (!v51) {
              goto LABEL_78;
            }
            int v46 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v51, 4, &v74, v70);
            free(v51);
            id v69 = (int *)v46;
            SSFileLog();
          }
          else
          {
            id v3 = v73;
          }

LABEL_78:
          __int16 v52 = [v4[405] sharedDaemonConfig];
          if (!v52)
          {
            __int16 v52 = [v4[405] sharedConfig];
          }
          unsigned int v61 = objc_msgSend(v52, "shouldLog", v69);
          if ([v52 shouldLogToDisk]) {
            int v62 = v61 | 2;
          }
          else {
            int v62 = v61;
          }
          uint64_t v63 = [v52 OSLogObject];
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
            int v64 = v62;
          }
          else {
            int v64 = v62 & 2;
          }
          if (v64)
          {
            unsigned int v65 = objc_opt_class();
            int v74 = 138543362;
            id v75 = v65;
            id v66 = v65;
            LODWORD(v70) = 12;
            v67 = (void *)_os_log_send_and_compose_impl();

            if (!v67)
            {
LABEL_95:

              goto LABEL_96;
            }
            uint64_t v63 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, &v74, v70);
            free(v67);
            SSFileLog();
          }

          goto LABEL_95;
        }
        __int16 v52 = [v13[208] ACLVersionForAccessControl:v12];
        BOOL v53 = [v4[405] sharedDaemonConfig];
        if (!v53)
        {
          BOOL v53 = [v4[405] sharedConfig];
        }
        unsigned int v54 = objc_msgSend(v53, "shouldLog", v68);
        if ([v53 shouldLogToDisk]) {
          int v55 = v54 | 2;
        }
        else {
          int v55 = v54;
        }
        int v56 = [v53 OSLogObject];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
          int v57 = v55;
        }
        else {
          int v57 = v55 & 2;
        }
        if (v57)
        {
          int v58 = objc_opt_class();
          int v74 = 138543618;
          id v75 = v58;
          __int16 v76 = 2114;
          unsigned int v77 = v52;
          id v59 = v58;
          LODWORD(v70) = 22;
          int v60 = (void *)_os_log_send_and_compose_impl();

          uint64_t v6 = v72;
          if (!v60)
          {
LABEL_92:

            if (v12) {
              CFRelease(v12);
            }
            id v3 = v73;
            goto LABEL_95;
          }
          int v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v60, 4, &v74, v70);
          free(v60);
          SSFileLog();
        }
        else
        {
          uint64_t v6 = v72;
        }

        goto LABEL_92;
      }
      id v34 = +[SSLogConfig sharedDaemonConfig];
      if (!v34)
      {
        id v34 = +[SSLogConfig sharedConfig];
      }
      unsigned int v38 = [v34 shouldLog];
      if ([v34 shouldLogToDisk]) {
        int v39 = v38 | 2;
      }
      else {
        int v39 = v38;
      }
      id v40 = [v34 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        int v41 = v39;
      }
      else {
        int v41 = v39 & 2;
      }
      if (!v41) {
        goto LABEL_49;
      }
      int v74 = 138543362;
      id v75 = (id)objc_opt_class();
      id v42 = v75;
      LODWORD(v70) = 12;
      int v43 = (void *)_os_log_send_and_compose_impl();

      if (v43)
      {
        id v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v74, v70);
        free(v43);
        SSFileLog();
LABEL_49:
      }
    }
    else
    {
      uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
      if (!v6)
      {
        uint64_t v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v32 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v33 = v32 | 2;
      }
      else {
        int v33 = v32;
      }
      id v34 = [v6 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        int v35 = v33;
      }
      else {
        int v35 = v33 & 2;
      }
      if (v35)
      {
        int v74 = 138543362;
        id v75 = (id)objc_opt_class();
        id v36 = v75;
        LODWORD(v70) = 12;
        uint64_t v37 = (void *)_os_log_send_and_compose_impl();

        if (!v37)
        {
LABEL_96:

          goto LABEL_97;
        }
        id v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v74, v70);
        free(v37);
        SSFileLog();
      }
    }

    goto LABEL_96;
  }
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  id v28 = [v5 OSLogObject];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    int v29 = v27;
  }
  else {
    int v29 = v27 & 2;
  }
  if (!v29) {
    goto LABEL_26;
  }
  int v74 = 138543362;
  id v75 = (id)objc_opt_class();
  id v30 = v75;
  LODWORD(v70) = 12;
  __int16 v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v74, v70);
    free(v31);
    SSFileLog();
LABEL_26:
  }
LABEL_97:
}

- (void)_performAutoEnrollmentCheck
{
  id v3 = +[ISBiometricStore sharedInstance];
  id v4 = [v3 biometricState];

  if (v4 == (id)2)
  {
    id v5 = [(PurchaseOperation *)self _countryCode];
    uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
    id v7 = v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      unsigned int v10 = [v7 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        int v11 = v9;
      }
      else {
        int v11 = v9 & 2;
      }
      if (!v11) {
        goto LABEL_36;
      }
      int v47 = 138543618;
      id v48 = (id)objc_opt_class();
      __int16 v49 = 2114;
      __int16 v50 = v5;
      id v12 = v48;
      LODWORD(v46) = 22;
      id v44 = &v47;
    }
    else
    {
      if (!v6)
      {
        id v7 = +[SSLogConfig sharedConfig];
      }
      unsigned int v18 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      unsigned int v10 = [v7 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        int v20 = v19;
      }
      else {
        int v20 = v19 & 2;
      }
      if (!v20) {
        goto LABEL_36;
      }
      int v47 = 138543362;
      id v48 = (id)objc_opt_class();
      id v12 = v48;
      LODWORD(v46) = 12;
      id v44 = &v47;
    }
    uint64_t v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v47, v46);
      free(v21);
      id v44 = (int *)v10;
      SSFileLog();
LABEL_36:
    }
  }
  else
  {
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v7 = [v5 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      int v15 = v14;
    }
    else {
      int v15 = v14 & 2;
    }
    if (v15)
    {
      int v47 = 138543362;
      id v48 = (id)objc_opt_class();
      id v16 = v48;
      LODWORD(v46) = 12;
      id v44 = &v47;
      int v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17) {
        goto LABEL_38;
      }
      id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v47, v46);
      free(v17);
      id v44 = (int *)v7;
      SSFileLog();
    }
  }

LABEL_38:
  id v22 = objc_alloc_init((Class)SSBiometricAuthenticationContext);
  unsigned int v23 = [(PurchaseOperation *)self authenticatedAccountDSID];
  [v22 setAccountIdentifier:v23];

  [v22 setIsPayment:1];
  int v24 = +[DaemonBiometricKeychain sharedInstance];
  id v25 = [v24 copyAccessControlListForPrivateKeyWithBiometricAuthenticationContext:v22 error:0];

  id v26 = +[AMSBiometrics isActionSupported:3 withAccessControl:v25];
  int v27 = +[SSLogConfig sharedDaemonConfig];
  if (!v27)
  {
    int v27 = +[SSLogConfig sharedConfig];
  }
  unsigned int v28 = objc_msgSend(v27, "shouldLog", v44);
  if ([v27 shouldLogToDisk]) {
    int v29 = v28 | 2;
  }
  else {
    int v29 = v28;
  }
  id v30 = [v27 OSLogObject];
  if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    v29 &= 2u;
  }
  if (v29)
  {
    __int16 v31 = objc_opt_class();
    id v32 = v31;
    int v33 = +[NSNumber numberWithBool:v26];
    int v47 = 138543618;
    id v48 = v31;
    __int16 v49 = 2114;
    __int16 v50 = v33;
    LODWORD(v46) = 22;
    unsigned int v45 = &v47;
    id v34 = (void *)_os_log_send_and_compose_impl();

    if (!v34) {
      goto LABEL_49;
    }
    id v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v47, v46);
    free(v34);
    unsigned int v45 = (int *)v30;
    SSFileLog();
  }

LABEL_49:
  int v35 = +[AMSBiometrics ACLVersionForAccessControl:v25];
  id v36 = +[SSLogConfig sharedDaemonConfig];
  if (!v36)
  {
    id v36 = +[SSLogConfig sharedConfig];
  }
  unsigned int v37 = objc_msgSend(v36, "shouldLog", v45);
  if ([v36 shouldLogToDisk]) {
    int v38 = v37 | 2;
  }
  else {
    int v38 = v37;
  }
  int v39 = [v36 OSLogObject];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
    int v40 = v38;
  }
  else {
    int v40 = v38 & 2;
  }
  if (v40)
  {
    int v41 = objc_opt_class();
    int v47 = 138543618;
    id v48 = v41;
    __int16 v49 = 2114;
    __int16 v50 = v35;
    id v42 = v41;
    LODWORD(v46) = 22;
    int v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43) {
      goto LABEL_61;
    }
    int v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v47, v46);
    free(v43);
    SSFileLog();
  }

LABEL_61:
  if (v25) {
    CFRelease(v25);
  }
}

- (id)_priceFromBuyParams
{
  id v2 = [(PurchaseOperation *)self buyParameters];
  id v3 = +[NSURL copyDictionaryForQueryString:v2 unescapedValues:1];

  id v4 = [v3 objectForKeyedSubscript:@"price"];
  if (v4)
  {
    id v5 = (void *)qword_100401C08;
    if (!qword_100401C08)
    {
      id v6 = objc_alloc_init((Class)NSNumberFormatter);
      id v7 = (void *)qword_100401C08;
      qword_100401C08 = (uint64_t)v6;

      [(id)qword_100401C08 setNumberStyle:1];
      id v5 = (void *)qword_100401C08;
    }
    unsigned int v8 = [v5 numberFromString:v4];
  }
  else
  {
    unsigned int v8 = &off_1003C8F40;
  }

  return v8;
}

- (int64_t)_purchaseType
{
  id v2 = [(PurchaseOperation *)self urlBagKey];
  if ([v2 isEqualToString:@"backgroundUpdateProduct"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"buyProduct"])
  {
    int64_t v3 = 0;
  }
  else if ([v2 isEqualToString:@"downloadProduct"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"p2-in-app-buy"])
  {
    int64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"updateProduct"])
  {
    int64_t v3 = 4;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)_recordEngagementEventWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)AMSMetricsEvent) initForEngagement];
  [v8 setProperty:@"purchase" forBodyKey:@"eventType"];
  [v8 setProperty:@"AMS" forBodyKey:@"source"];
  int v9 = +[NSNumber numberWithBool:v6 == 0];
  [v8 setProperty:v9 forBodyKey:@"success"];

  unsigned int v10 = +[NSNumber numberWithInteger:[(PurchaseOperation *)self _purchaseType]];
  [v8 setProperty:v10 forBodyKey:@"purchaseType"];

  int v11 = [(PurchaseOperation *)self buyParameters];
  id v12 = +[NSURL copyDictionaryForQueryString:v11 unescapedValues:1];

  [v8 setProperty:v12 forBodyKey:@"buyParameters"];
  unsigned int v13 = [(PurchaseOperation *)self authenticatedAccountDSID];
  [v8 setProperty:v13 forBodyKey:@"accountId"];

  [v8 setProperty:v7 forBodyKey:@"responseDictionary"];
  if (v6)
  {
    v45[0] = @"code";
    int v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    v46[0] = v14;
    v45[1] = @"domain";
    uint64_t v15 = [v6 domain];
    id v16 = (void *)v15;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    else {
      CFStringRef v17 = &stru_1003B9B00;
    }
    v46[1] = v17;
    v45[2] = @"title";
    uint64_t v18 = objc_msgSend(v6, "ams_title");
    int v19 = (void *)v18;
    if (v18) {
      CFStringRef v20 = (const __CFString *)v18;
    }
    else {
      CFStringRef v20 = &stru_1003B9B00;
    }
    v46[2] = v20;
    v45[3] = @"message";
    uint64_t v21 = objc_msgSend(v6, "ams_message");
    id v22 = (void *)v21;
    if (v21) {
      CFStringRef v23 = (const __CFString *)v21;
    }
    else {
      CFStringRef v23 = &stru_1003B9B00;
    }
    v46[3] = v23;
    int v24 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];

    [v8 setProperty:v24 forBodyKey:@"error"];
  }
  id v25 = +[AMSLogConfig sharedConfig];
  if (!v25)
  {
    id v25 = +[AMSLogConfig sharedConfig];
  }
  id v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_opt_class();
    unsigned int v28 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v27;
    __int16 v41 = 2114;
    id v42 = v28;
    __int16 v43 = 1024;
    BOOL v44 = v6 == 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording engagement event. success: %d", buf, 0x1Cu);
  }
  id v29 = objc_alloc_init((Class)AMSEngagement);
  id v30 = [v8 underlyingDictionary];
  __int16 v31 = [v29 enqueueData:v30];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100023E38;
  v36[3] = &unk_1003A36D8;
  id v32 = objc_alloc_init((Class)AMSBinaryPromise);
  id v37 = v32;
  int v38 = self;
  [v31 addFinishBlock:v36];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100024228;
  v35[3] = &unk_1003A3700;
  v35[4] = self;
  [v32 addErrorBlock:v35];
  id v33 = v32;

  return v33;
}

- (void)_runDialogOperationForDialog:(id)a3
{
  id v116 = a3;
  v119 = self;
  if (![(PurchaseOperation *)self skipsConfirmationDialogs]) {
    goto LABEL_25;
  }
  id obj = [v116 buttons];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v4 = [obj countByEnumeratingWithState:&v135 objects:v149 count:16];
  if (!v4)
  {

    goto LABEL_25;
  }
  uint64_t v5 = *(void *)v136;
  char v6 = 1;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v136 != v5) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v135 + 1) + 8 * i);
      if (objc_msgSend(v8, "actionType", v112) == 3)
      {
        int v9 = +[SSLogConfig sharedDaemonConfig];
        if (!v9)
        {
          int v9 = +[SSLogConfig sharedConfig];
        }
        unsigned int v10 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          v10 |= 2u;
        }
        int v11 = [v9 OSLogObject];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          int v12 = v10;
        }
        else {
          int v12 = v10 & 2;
        }
        if (v12)
        {
          unsigned int v13 = objc_opt_class();
          id v14 = v13;
          uint64_t v15 = [v8 parameter];
          *(_DWORD *)v145 = 138412546;
          *(void *)&v145[4] = v13;
          *(_WORD *)&v145[12] = 2112;
          *(void *)&v145[14] = v15;
          LODWORD(v115) = 22;
          v112 = v145;
          id v16 = (void *)_os_log_send_and_compose_impl();

          if (v16)
          {
            int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, v145, v115);
            free(v16);
            v112 = v11;
            SSFileLog();
            goto LABEL_18;
          }
        }
        else
        {
LABEL_18:
        }
        responseInfo = v119->_responseInfo;
        uint64_t v18 = [v8 parameter];
        [(PurchaseResponseInfo *)responseInfo setChangedBuyParameters:v18];

        char v6 = 0;
        continue;
      }
    }
    id v4 = [obj countByEnumeratingWithState:&v135 objects:v149 count:16];
  }
  while (v4);

  if ((v6 & 1) == 0) {
    goto LABEL_134;
  }
LABEL_25:
  int v19 = +[SSLogConfig sharedDaemonConfig];
  if (!v19)
  {
    int v19 = +[SSLogConfig sharedConfig];
  }
  unsigned int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    v20 |= 2u;
  }
  uint64_t v21 = [v19 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    v20 &= 2u;
  }
  if (v20)
  {
    id v22 = objc_opt_class();
    *(_DWORD *)v145 = 138412290;
    *(void *)&v145[4] = v22;
    id v23 = v22;
    LODWORD(v115) = 12;
    id v113 = v145;
    int v24 = (void *)_os_log_send_and_compose_impl();

    if (v24)
    {
      uint64_t v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, v145, v115);
      free(v24);
      id v113 = v21;
      SSFileLog();
      goto LABEL_34;
    }
  }
  else
  {
LABEL_34:
  }
  id v25 = [v116 paymentSheet];
  if (!v25)
  {
    __int16 v50 = [[DaemonDialogOperation alloc] initWithDialog:v116];
    [(DaemonDialogOperation *)v50 setDisplaysOnLockscreen:v119->_displaysOnLockScreen];
    *(void *)v145 = 0;
    *(void *)&v145[8] = v145;
    *(void *)&v145[16] = 0x3032000000;
    v146 = sub_100025714;
    v147 = sub_100025724;
    id v148 = 0;
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_100025C0C;
    v122[3] = &unk_1003A3778;
    id v124 = v145;
    id v51 = v116;
    id v123 = v51;
    [(DaemonDialogOperation *)v50 setOutputBlock:v122];
    id v121 = 0;
    unsigned __int8 v52 = [(PurchaseOperation *)v119 runSubOperation:v50 returningError:&v121];
    id v53 = v121;
    id obja = v53;
    if ((v52 & 1) == 0)
    {
      [(PurchaseOperation *)v119 setError:v53];
LABEL_132:

      _Block_object_dispose(v145, 8);
      goto LABEL_133;
    }
    unsigned int v54 = *(void **)(*(void *)&v145[8] + 40);
    if (v54)
    {
      if ([v54 actionType] == 3)
      {
        int v55 = +[SSLogConfig sharedDaemonConfig];
        if (!v55)
        {
          int v55 = +[SSLogConfig sharedConfig];
        }
        unsigned int v56 = objc_msgSend(v55, "shouldLog", v113);
        unsigned int v57 = [v55 shouldLogToDisk];
        int v58 = [v55 OSLogObject];
        id v59 = v58;
        if (v57) {
          v56 |= 2u;
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO)) {
          int v60 = v56;
        }
        else {
          int v60 = v56 & 2;
        }
        if (v60)
        {
          id v61 = (id)objc_opt_class();
          int v62 = [(PurchaseOperation *)v119 buyParameters];
          *(_DWORD *)v141 = 138412546;
          *(void *)&v141[4] = v61;
          *(_WORD *)&v141[12] = 2112;
          *(void *)&v141[14] = v62;
          LODWORD(v115) = 22;
          uint64_t v63 = (void *)_os_log_send_and_compose_impl();

          if (!v63)
          {
LABEL_75:

            int v64 = v119->_responseInfo;
            unsigned int v65 = [*(id *)(*(void *)&v145[8] + 40) parameter];
            [(PurchaseResponseInfo *)v64 setChangedBuyParameters:v65];
LABEL_131:

            goto LABEL_132;
          }
          id v59 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, v141, v115);
          free(v63);
          SSFileLog();
        }

        goto LABEL_75;
      }
      unsigned int v54 = *(void **)(*(void *)&v145[8] + 40);
    }
    if (objc_msgSend(v54, "actionType", v113) == 11)
    {
      v72 = [*(id *)(*(void *)&v145[8] + 40) parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v73 = +[NSURL URLWithString:v72];

        v72 = (void *)v73;
      }
      int v74 = +[SSLogConfig sharedDaemonConfig];
      if (!v74)
      {
        int v74 = +[SSLogConfig sharedConfig];
      }
      unsigned int v75 = [v74 shouldLog];
      unsigned int v76 = [v74 shouldLogToDisk];
      unsigned int v77 = [v74 OSLogObject];
      v78 = v77;
      if (v76) {
        v75 |= 2u;
      }
      if (!os_log_type_enabled(v77, OS_LOG_TYPE_INFO)) {
        v75 &= 2u;
      }
      if (v75)
      {
        v79 = objc_opt_class();
        *(_DWORD *)v141 = 138412546;
        *(void *)&v141[4] = v79;
        *(_WORD *)&v141[12] = 2112;
        *(void *)&v141[14] = v72;
        id v80 = v79;
        LODWORD(v115) = 22;
        v114 = v141;
        v81 = (void *)_os_log_send_and_compose_impl();

        if (!v81)
        {
LABEL_104:

          uint64_t v82 = [AskPermissionActionOperation alloc];
          unsigned int v83 = [(PurchaseOperation *)v119 _account];
          int64_t v84 = [(AskPermissionActionOperation *)v82 initWithURL:v72 account:v83];

          id v120 = obja;
          [(PurchaseOperation *)v119 runSubOperation:v84 returningError:&v120];
          id v85 = v120;

          id v86 = SSError();
          [(PurchaseOperation *)v119 setError:v86];

          [(PurchaseOperation *)v119 setSuccess:0];
          id obja = v85;
          long long v97 = v119;
LABEL_117:
          long long v98 = [(PurchaseOperation *)v97 authenticationContext];
          BOOL v99 = [v98 tokenType] == (id)1;

          if (!v99) {
            goto LABEL_132;
          }
          [(PurchaseOperation *)v119 lock];
          BOOL didAuthenticate = v119->_didAuthenticate;
          [(PurchaseOperation *)v119 unlock];
          if (!didAuthenticate) {
            goto LABEL_132;
          }
          unsigned int v65 = [(PurchaseOperation *)v119 _account];
          [v65 setSecureToken:0];
          id v101 = +[SSLogConfig sharedAccountsConfig];
          if (!v101)
          {
            id v101 = +[SSLogConfig sharedConfig];
          }
          unsigned int v102 = [v101 shouldLog];
          unsigned int v103 = [v101 shouldLogToDisk];
          __int16 v104 = [v101 OSLogObject];
          v105 = v104;
          if (v103) {
            v102 |= 2u;
          }
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
            int v106 = v102;
          }
          else {
            int v106 = v102 & 2;
          }
          if (v106)
          {
            id v107 = (id)objc_opt_class();
            __int16 v108 = [v65 accountName];
            unsigned int v109 = SSHashIfNeeded();
            *(_DWORD *)v141 = 138543618;
            *(void *)&v141[4] = v107;
            *(_WORD *)&v141[12] = 2114;
            *(void *)&v141[14] = v109;
            LODWORD(v115) = 22;
            v110 = (void *)_os_log_send_and_compose_impl();

            if (!v110)
            {
LABEL_130:

              unsigned int v111 = +[SSAccountStore defaultStore];
              [v111 saveAccount:v65 completion:0];

              goto LABEL_131;
            }
            v105 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v110, 4, v141, v115);
            free(v110);
            SSFileLog();
          }

          goto LABEL_130;
        }
        v78 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v81, 4, v141, v115);
        free(v81);
        v114 = v78;
        SSFileLog();
      }

      goto LABEL_104;
    }
    id v87 = +[SSLogConfig sharedDaemonConfig];
    if (!v87)
    {
      id v87 = +[SSLogConfig sharedConfig];
    }
    unsigned int v88 = [v87 shouldLog];
    unsigned int v89 = [v87 shouldLogToDisk];
    id v90 = [v87 OSLogObject];
    v91 = v90;
    if (v89) {
      v88 |= 2u;
    }
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT)) {
      int v92 = v88;
    }
    else {
      int v92 = v88 & 2;
    }
    if (v92)
    {
      id v93 = (id)objc_opt_class();
      uint64_t v94 = [(PurchaseOperation *)v119 buyParameters];
      *(_DWORD *)v141 = 138412546;
      *(void *)&v141[4] = v93;
      *(_WORD *)&v141[12] = 2112;
      *(void *)&v141[14] = v94;
      LODWORD(v115) = 22;
      v114 = v141;
      v95 = (void *)_os_log_send_and_compose_impl();

      if (!v95)
      {
LABEL_116:

        [*(id *)(*(void *)&v145[8] + 40) performDefaultActionForDialog:v51];
        unsigned int v96 = SSError();
        [(PurchaseOperation *)v119 setError:v96];

        long long v97 = v119;
        [(PurchaseOperation *)v119 setSuccess:0];
        goto LABEL_117;
      }
      v91 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v95, 4, v141, v115);
      free(v95);
      v114 = v91;
      SSFileLog();
    }

    goto LABEL_116;
  }
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 0;
  *(void *)v145 = 0;
  *(void *)&v145[8] = v145;
  *(void *)&v145[16] = 0x3032000000;
  v146 = sub_100025714;
  v147 = sub_100025724;
  id v148 = 0;
  id v26 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
  uint64_t v27 = [[DisplayPaymentSheetOperation alloc] initWithPaymentSheet:v25];
  unsigned int v28 = [v25 dialogId];
  [(DisplayPaymentSheetOperation *)v27 setDialogId:v28];

  id v29 = [(SSAuthenticationContext *)v119->_authenticationContext accountName];
  [(DisplayPaymentSheetOperation *)v27 setAccountName:v29];

  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_10002572C;
  v127[3] = &unk_1003A3728;
  id v30 = v26;
  id v128 = v30;
  v129 = v145;
  v130 = &v131;
  [(DisplayPaymentSheetOperation *)v27 setCompletionHandler:v127];
  __int16 v31 = [[DisplayPaymentSheetContainerOperation alloc] initWithDisplayPaymentSheetOperation:v27];
  id v126 = 0;
  LODWORD(v29) = [(PurchaseOperation *)v119 runSubOperation:v31 returningError:&v126];
  id v32 = v126;
  if (!v29 || !*((unsigned char *)v132 + 24))
  {
    [(PurchaseOperation *)v119 setError:v32];
    [(PurchaseOperation *)v119 setSuccess:0];
    __int16 v43 = +[SSLogConfig sharedConfig];
    unsigned int v44 = [v43 shouldLog];
    unsigned int v45 = [v43 shouldLogToDisk];
    uint64_t v46 = [v43 OSLogObject];
    int v47 = v46;
    if (v45) {
      v44 |= 2u;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      int v48 = v44;
    }
    else {
      int v48 = v44 & 2;
    }
    if (v48)
    {
      *(_DWORD *)v141 = 138543618;
      *(void *)&v141[4] = v30;
      *(_WORD *)&v141[12] = 2114;
      *(void *)&v141[14] = v32;
      LODWORD(v115) = 22;
      __int16 v49 = (void *)_os_log_send_and_compose_impl();

      if (!v49)
      {
LABEL_60:

        goto LABEL_89;
      }
      int v47 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, v141, v115);
      free(v49);
      SSFileLog();
    }

    goto LABEL_60;
  }
  *(void *)v141 = 0;
  *(void *)&v141[8] = v141;
  *(void *)&v141[16] = 0x3032000000;
  v142 = sub_100025714;
  v143 = sub_100025724;
  id v144 = 0;
  id v33 = [v116 buttons];
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_100025B90;
  v125[3] = &unk_1003A3750;
  v125[4] = v141;
  [v33 enumerateObjectsUsingBlock:v125];

  if (*(void *)(*(void *)&v141[8] + 40))
  {
    id v34 = +[SSLogConfig sharedDaemonConfig];
    if (!v34)
    {
      id v34 = +[SSLogConfig sharedConfig];
    }
    unsigned int v35 = [v34 shouldLog];
    unsigned int v36 = [v34 shouldLogToDisk];
    id v37 = [v34 OSLogObject];
    int v38 = v37;
    if (v36) {
      v35 |= 2u;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      int v39 = v35;
    }
    else {
      int v39 = v35 & 2;
    }
    if (v39)
    {
      int v139 = 138543362;
      id v140 = v30;
      LODWORD(v115) = 12;
      uint64_t v40 = (void *)_os_log_send_and_compose_impl();

      if (v40)
      {
        int v38 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v139, v115);
        free(v40);
        SSFileLog();
        goto LABEL_49;
      }
    }
    else
    {
LABEL_49:
    }
    __int16 v41 = v119->_responseInfo;
    id v42 = [*(id *)(*(void *)&v141[8] + 40) parameter];
    [(PurchaseResponseInfo *)v41 setChangedBuyParameters:v42];
  }
  else
  {
    id v42 = +[SSLogConfig sharedDaemonConfig];
    if (!v42)
    {
      id v42 = +[SSLogConfig sharedConfig];
    }
    unsigned int v66 = [v42 shouldLog];
    unsigned int v67 = [v42 shouldLogToDisk];
    id v68 = [v42 OSLogObject];
    id v69 = v68;
    if (v67) {
      v66 |= 2u;
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      int v70 = v66;
    }
    else {
      int v70 = v66 & 2;
    }
    if (v70)
    {
      int v139 = 138412290;
      id v140 = v30;
      LODWORD(v115) = 12;
      unsigned int v71 = (void *)_os_log_send_and_compose_impl();

      if (!v71) {
        goto LABEL_88;
      }
      id v69 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v71, 4, &v139, v115);
      free(v71);
      SSFileLog();
    }
  }
LABEL_88:

  _Block_object_dispose(v141, 8);
LABEL_89:

  _Block_object_dispose(v145, 8);
  _Block_object_dispose(&v131, 8);
LABEL_133:

LABEL_134:
}

- (void)_runPurchaseRequest
{
  int64_t v3 = +[SSDevice currentDevice];
  id v4 = [v3 storeFrontIdentifier];

  if (!v4
    || ([(PurchaseOperation *)self originatingStorefront],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v4 isEqualToString:v5],
        v5,
        (v6 & 1) != 0))
  {
LABEL_18:
    id v22 = [(PurchaseOperation *)self _newPurchaseRequestOperation];
    id v23 = [v22 dataProvider];
    int v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24)
    {
      int v24 = +[SSLogConfig sharedConfig];
    }
    uint64_t v122 = v4;
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      v25 |= 2u;
    }
    id v26 = [v24 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      int v27 = v25;
    }
    else {
      int v27 = v25 & 2;
    }
    if (v27)
    {
      unsigned int v28 = objc_opt_class();
      id v29 = v28;
      id v30 = [(PurchaseOperation *)self logKey];
      __int16 v31 = [(PurchaseOperation *)self buyParameters];
      int v124 = 138543874;
      v125 = v28;
      __int16 v126 = 2114;
      v127 = v30;
      __int16 v128 = 2112;
      v129 = v31;
      LODWORD(v110) = 32;
      id v107 = &v124;
      id v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32) {
        goto LABEL_29;
      }
      id v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v124, v110);
      free(v32);
      id v107 = (int *)v26;
      SSFileLog();
    }

LABEL_29:
    id v123 = 0;
    unsigned __int8 v33 = [(PurchaseOperation *)self runSubOperation:v22 returningError:&v123];
    id v34 = v123;
    unsigned int v35 = [v23 output];
    unsigned int v36 = v35;
    id v121 = v34;
    if ((v33 & 1) == 0)
    {
      [(PurchaseOperation *)self _handleFailureForOperation:v22];
      [(PurchaseOperation *)self setError:v34];
      goto LABEL_119;
    }
    id v37 = [v35 objectForKey:kISFailureTypeKey];

    if (v37)
    {
      [(PurchaseOperation *)self _handleFailureForOperation:v22];
    }
    else
    {
      [v23 setShouldProcessDialogs:1];
      [v23 processDialogFromDictionary:v36 error:0];
      int v38 = [v36 objectForKey:@"DelayedGoto"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [(PurchaseOperation *)self _performDelayedGotoForOperation:v22];
      }
      else {
        [(PurchaseOperation *)self setSuccess:1];
      }
    }
    uint64_t v40 = objc_msgSend(v36, "objectForKey:", @"keybag", v107);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v40 length]) {
      sub_10002E31C(v40);
    }
    uint64_t v41 = SSVSubscriptionBagForDictionary();
    if (v41)
    {
      id v42 = [(PurchaseOperation *)self _fairPlaySubscriptionController];
      [v42 importSubscriptionKeyBagData:v41 returningError:0];
    }
    uint64_t v43 = [v36 objectForKey:@"duAnonymousPings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(id)objc_opt_class() reportAnonymousPings:v43];
    }
    unsigned int v118 = (void *)v43;
    v119 = (void *)v41;
    id v120 = v40;
    uint64_t v44 = [v36 objectForKeyedSubscript:@"newsEntitlements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v45 = [(PurchaseOperation *)self authenticatedAccountDSID];
      +[AppStoreUtility sendNewsSubscriptionEntitlementsWithDictionary:v44 forAccountID:v45];
    }
    id v117 = (void *)v44;
    uint64_t v46 = [v36 objectForKeyedSubscript:@"appStoreEntitlements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v47 = [(PurchaseOperation *)self authenticatedAccountDSID];
      +[AppStoreUtility sendAppStoreSubscriptionEntitlementsWithDictionary:v46 forAccountID:v47];
    }
    int v48 = [v36 objectForKeyedSubscript:@"activityEntitlements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v49 = [(PurchaseOperation *)self authenticatedAccountDSID];
      +[AppStoreUtility sendActivitySubscriptionEntitlementsWithDictionary:v48 forAccountID:v49];
    }
    if (!+[ISBiometricStore shouldUseAutoEnrollment]|| ([(PurchaseOperation *)self success] & 1) == 0&& ![(PurchaseOperation *)self isCancelled])
    {
LABEL_113:
      [(PurchaseOperation *)self lock];
      id v87 = [v22 authenticatedAccountDSID];
      accountID = self->_accountID;
      self->_accountID = v87;

      if (self->_didAuthenticate)
      {
        self->_BOOL didAuthenticate = 1;
      }
      else
      {
        unsigned int v89 = [v23 authenticatedAccountDSID];
        self->_BOOL didAuthenticate = v89 != 0;

        if (!self->_didAuthenticate)
        {
LABEL_118:
          [(PurchaseOperation *)self unlock];

LABEL_119:
          -[PurchaseOperation setRawOutput:](self, "setRawOutput:", v36, v107);
          if (v36)
          {
            id v90 = +[NSPropertyListSerialization dataWithPropertyList:v36 format:200 options:0 error:0];
          }
          else
          {
            id v90 = 0;
          }
          [(PurchaseOperation *)self lock];
          v91 = [v22 performanceMetrics];
          requestPerformanceMetrics = self->_requestPerformanceMetrics;
          self->_requestPerformanceMetrics = v91;

          id v93 = objc_alloc((Class)SSURLConnectionResponse);
          uint64_t v94 = [v22 response];
          v95 = (SSURLConnectionResponse *)[v93 initWithURLResponse:v94 bodyData:v90];
          urlResponse = self->_urlResponse;
          self->_urlResponse = v95;

          long long v97 = [(SSURLConnectionResponse *)self->_urlResponse allHeaderFields];
          long long v98 = [v97 objectForKey:@"x-apple-jingle-correlation-key"];

          if (![v98 length]) {
            goto LABEL_134;
          }
          objc_storeStrong((id *)&self->_storeCorrelationID, v98);
          BOOL v99 = +[SSLogConfig sharedDaemonConfig];
          if (!v99)
          {
            BOOL v99 = +[SSLogConfig sharedConfig];
          }
          unsigned int v100 = [v99 shouldLog];
          if ([v99 shouldLogToDisk]) {
            v100 |= 2u;
          }
          id v101 = [v99 OSLogObject];
          if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT)) {
            v100 &= 2u;
          }
          if (v100)
          {
            unsigned int v102 = objc_opt_class();
            storeCorrelationID = self->_storeCorrelationID;
            int v124 = 138412546;
            v125 = v102;
            __int16 v126 = 2114;
            v127 = storeCorrelationID;
            id v104 = v102;
            LODWORD(v110) = 22;
            unsigned int v109 = &v124;
            v105 = (void *)_os_log_send_and_compose_impl();

            if (!v105)
            {
LABEL_133:

LABEL_134:
              [(PurchaseOperation *)self unlock];
              [v22 setDelegate:0];

              id v4 = v122;
              goto LABEL_135;
            }
            id v101 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v105, 4, &v124, v110);
            free(v105);
            unsigned int v109 = (int *)v101;
            SSFileLog();
          }

          goto LABEL_133;
        }
      }
      if ([v23 authenticatedAccountCredentialSource] == (id)3) {
        ++self->_silentAuthCount;
      }
      goto LABEL_118;
    }
    __int16 v50 = [(PurchaseOperation *)self buyParameters];
    id v51 = +[NSURL copyDictionaryForQueryString:v50 unescapedValues:1];

    unsigned __int8 v52 = [v51 objectForKeyedSubscript:@"applePayPaymentServiceURL"];

    id v53 = [v51 objectForKeyedSubscript:@"pkPayment"];

    id v116 = v51;
    if (v52 && !v53)
    {
      unsigned int v54 = +[SSLogConfig sharedDaemonConfig];
      if (!v54)
      {
        unsigned int v54 = +[SSLogConfig sharedConfig];
      }
      unsigned int v55 = [v54 shouldLog];
      if ([v54 shouldLogToDisk]) {
        v55 |= 2u;
      }
      unsigned int v56 = [v54 OSLogObject];
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
        v55 &= 2u;
      }
      if (!v55) {
        goto LABEL_98;
      }
      unsigned int v57 = objc_opt_class();
      int v124 = 138543362;
      v125 = v57;
      id v58 = v57;
      LODWORD(v110) = 12;
      __int16 v108 = &v124;
      id v59 = (void *)_os_log_send_and_compose_impl();

LABEL_96:
      if (v59)
      {
        unsigned int v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v59, 4, &v124, v110);
        free(v59);
        __int16 v108 = (int *)v56;
        SSFileLog();
LABEL_98:
        id v80 = v116;
LABEL_99:

LABEL_112:
        goto LABEL_113;
      }
LABEL_111:
      id v80 = v116;
      goto LABEL_112;
    }
    uint64_t v60 = +[SSLogConfig sharedDaemonConfig];
    unsigned int v54 = (void *)v60;
    if (!v52 || !v53)
    {
      if (!v60)
      {
        unsigned int v54 = +[SSLogConfig sharedConfig];
      }
      unsigned int v75 = [v54 shouldLog];
      if ([v54 shouldLogToDisk]) {
        v75 |= 2u;
      }
      v114 = [v54 OSLogObject];
      BOOL v76 = os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
      int v77 = v75 & 2;
      if (v76) {
        int v77 = v75;
      }
      if (!v77)
      {
        unsigned int v56 = v114;
        id v80 = v116;
        goto LABEL_99;
      }
      HIDWORD(v110) = v53 != 0;
      v78 = objc_opt_class();
      id v112 = v78;
      +[NSNumber numberWithBool:v52 != 0];
      unsigned int v111 = (NSString *)objc_claimAutoreleasedReturnValue();
      v79 = +[NSNumber numberWithBool:HIDWORD(v110)];
      int v124 = 138543874;
      v125 = v78;
      __int16 v126 = 2114;
      v127 = v111;
      __int16 v128 = 2114;
      v129 = v79;
      LODWORD(v110) = 32;
      __int16 v108 = &v124;
      unsigned int v56 = v114;
      id v59 = (void *)_os_log_send_and_compose_impl();

      goto LABEL_96;
    }
    if (!v60)
    {
      unsigned int v54 = +[SSLogConfig sharedConfig];
    }
    unsigned int v61 = [v54 shouldLog];
    if ([v54 shouldLogToDisk]) {
      v61 |= 2u;
    }
    int v62 = [v54 OSLogObject];
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
      v61 &= 2u;
    }
    if (v61)
    {
      uint64_t v63 = objc_opt_class();
      int v124 = 138543362;
      v125 = v63;
      id v64 = v63;
      LODWORD(v110) = 12;
      __int16 v108 = &v124;
      unsigned int v65 = (void *)_os_log_send_and_compose_impl();

      if (!v65)
      {
LABEL_74:

        unsigned int v54 = [v36 objectForKeyedSubscript:@"need-apple-pay-auto-enroll-retry"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v66 = [v54 lowercaseString];
          unsigned int v67 = [v66 isEqualToString:@"true"];

          if (v67)
          {
            id v68 = +[SSLogConfig sharedDaemonConfig];
            if (!v68)
            {
              id v68 = +[SSLogConfig sharedConfig];
            }
            unsigned int v69 = objc_msgSend(v68, "shouldLog", v108);
            if ([v68 shouldLogToDisk]) {
              v69 |= 2u;
            }
            int v70 = [v68 OSLogObject];
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT)) {
              v69 &= 2u;
            }
            if (v69)
            {
              unsigned int v71 = objc_opt_class();
              int v124 = 138543362;
              v125 = v71;
              id v113 = v68;
              id v72 = v71;
              LODWORD(v110) = 12;
              __int16 v108 = &v124;
              uint64_t v73 = (void *)_os_log_send_and_compose_impl();

              id v68 = v113;
              if (!v73)
              {
LABEL_86:

                +[AMSCardEnrollment clearAutoEnrollmentIdentifier];
                goto LABEL_111;
              }
              int v70 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, &v124, v110);
              free(v73);
              __int16 v108 = (int *)v70;
              SSFileLog();
            }

            goto LABEL_86;
          }
        }
        v81 = +[SSLogConfig sharedDaemonConfig];
        if (!v81)
        {
          v81 = +[SSLogConfig sharedConfig];
        }
        unsigned int v82 = [v81 shouldLog];
        if ([v81 shouldLogToDisk]) {
          v82 |= 2u;
        }
        unsigned int v83 = [v81 OSLogObject];
        if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT)) {
          v82 &= 2u;
        }
        if (v82)
        {
          int64_t v84 = objc_opt_class();
          int v124 = 138543362;
          v125 = v84;
          uint64_t v115 = v81;
          id v85 = v84;
          LODWORD(v110) = 12;
          __int16 v108 = &v124;
          id v86 = (void *)_os_log_send_and_compose_impl();

          v81 = v115;
          if (!v86)
          {
LABEL_110:

            +[AMSCardEnrollment updateAutoEnrollmentIdentifier];
            goto LABEL_111;
          }
          unsigned int v83 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v86, 4, &v124, v110);
          free(v86);
          __int16 v108 = (int *)v83;
          SSFileLog();
        }

        goto LABEL_110;
      }
      int v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v65, 4, &v124, v110);
      free(v65);
      __int16 v108 = (int *)v62;
      SSFileLog();
    }

    goto LABEL_74;
  }
  uint64_t v7 = [(PurchaseOperation *)self delegate];
  if (!v7
    || (id v8 = (void *)v7,
        [(PurchaseOperation *)self delegate],
        int v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) == 0))
  {
LABEL_17:
    objc_storeStrong((id *)&self->_originatingStorefront, v4);
    goto LABEL_18;
  }
  int v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    int v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    v12 |= 2u;
  }
  unsigned int v13 = [v11 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    int v14 = v12;
  }
  else {
    int v14 = v12 & 2;
  }
  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    SSHashIfNeeded();
    CFStringRef v17 = v4;
    uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v124 = 138543618;
    v125 = v15;
    __int16 v126 = 2114;
    v127 = v18;
    LODWORD(v110) = 22;
    int v106 = &v124;
    int v19 = (void *)_os_log_send_and_compose_impl();

    id v4 = v17;
    if (!v19) {
      goto LABEL_16;
    }
    unsigned int v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v124, v110);
    free(v19);
    int v106 = (int *)v13;
    SSFileLog();
  }

LABEL_16:
  unsigned int v20 = [(PurchaseOperation *)self delegate];
  unsigned int v21 = [v20 purchaseOperation:self shouldContinueWithNewStorefront:v4];

  if (v21) {
    goto LABEL_17;
  }
  id v22 = +[NSMutableDictionary dictionary];
  [v22 setObject:v4 forKeyedSubscript:@"storefront"];
  int v74 = +[NSError errorWithDomain:SSErrorDomain code:156 userInfo:v22];
  [(PurchaseOperation *)self setError:v74];

  [(PurchaseOperation *)self setSuccess:0];
LABEL_135:
}

- (void)_scoreDevice
{
  if (self->_deviceScorer) {
    goto LABEL_20;
  }
  int64_t v3 = [(PurchaseOperation *)self _priceFromBuyParams];
  [v3 floatValue];
  float v5 = v4;

  if (v5 == 0.0)
  {
    uint64_t v6 = 0;
  }
  else if (+[DeviceScorer deviceScoringSupportedV2])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }
  uint64_t v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    uint64_t v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  int v9 = [v7 shouldLogToDisk] ? v8 | 2 : v8;
  char v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT) ? v9 : v9 & 2)
  {
    unsigned int v12 = objc_opt_class();
    id v13 = v12;
    int v14 = +[NSNumber numberWithInteger:v6];
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v12;
    __int16 v32 = 2114;
    unsigned __int8 v33 = v14;
    LODWORD(v28) = 22;
    int v27 = location;
    uint64_t v15 = (void *)_os_log_send_and_compose_impl();

    if (v15)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, location, v28);
      id v16 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      free(v15);
      int v27 = v16;
      SSFileLog();
    }
  }
  else
  {
  }
  CFStringRef v17 = [[DeviceScorer alloc] initWithServerEndpoint:v6];
  deviceScorer = self->_deviceScorer;
  self->_deviceScorer = v17;

  if (self->_deviceScorer)
  {
LABEL_20:
    objc_initWeak((id *)location, self);
    int v19 = self->_deviceScorer;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100027234;
    v29[3] = &unk_1003A37A0;
    objc_copyWeak(&v30, (id *)location);
    v29[4] = self;
    [(DeviceScorer *)v19 deviceScoreWithNonce:0 completion:v29];
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
    return;
  }
  unsigned int v20 = +[SSLogConfig sharedDaemonConfig];
  if (!v20)
  {
    unsigned int v20 = +[SSLogConfig sharedConfig];
  }
  unsigned int v21 = objc_msgSend(v20, "shouldLog", v27);
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  id v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_31;
  }
  int v24 = objc_opt_class();
  *(_DWORD *)location = 138543362;
  *(void *)&location[4] = v24;
  id v25 = v24;
  LODWORD(v28) = 12;
  id v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, location, v28);
    free(v26);
    SSFileLog();
LABEL_31:
  }
}

- (void)_scoreDeviceRetryFailedV2Score
{
  int64_t v3 = [[DeviceScorer alloc] initWithServerEndpoint:1];
  deviceScorer = self->_deviceScorer;
  self->_deviceScorer = v3;

  if (self->_deviceScorer)
  {
    objc_initWeak(location, self);
    float v5 = self->_deviceScorer;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000277A8;
    v14[3] = &unk_1003A37C8;
    objc_copyWeak(&v15, location);
    [(DeviceScorer *)v5 deviceScoreWithNonce:0 completion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      uint64_t v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v10 = *(id *)((char *)location + 4);
      LODWORD(v13) = 12;
      int v11 = (void *)_os_log_send_and_compose_impl();

      if (v11)
      {
        unsigned int v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, location, v13);
        free(v11);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

- (void)_setChangedBuyParameters:(id)a3 fromDataProvider:(id)a4
{
  id v12 = a3;
  uint64_t v6 = [a4 authenticatedAccountDSID];
  if (v6)
  {
    unsigned int v7 = [(PurchaseOperation *)self _accountWithUniqueIdentifier:v6];
    if (v7)
    {
      int v8 = v7;
      int v9 = [v7 popBiometricToken];
      [(PurchaseOperation *)self lock];
      self->_BOOL didAuthenticate = 1;
      id v10 = [v9 base64EncodedStringWithOptions:0];
      mToken = self->_mToken;
      self->_mToken = v10;

      [(PurchaseResponseInfo *)self->_responseInfo setDidPasswordAuthenticate:[(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext didFallbackToPassword]];
      [(PurchaseOperation *)self unlock];
    }
  }
  [(PurchaseResponseInfo *)self->_responseInfo setChangedBuyParameters:v12];
}

- (BOOL)_shouldDisableReversePush
{
  int64_t v3 = +[SSURLBagContext contextWithBagType:[(PurchaseOperation *)self bagType]];
  float v4 = +[ISURLBagCache sharedCache];
  float v5 = [v4 URLBagForContext:v3];

  uint64_t v6 = [(PurchaseOperation *)self _buyParamProductType];
  if (v6)
  {
    unsigned int v7 = [v5 valueForKey:@"aps-allowed-product-type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = v7;
      id v29 = &off_1003C9FB0;
      id v8 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v22 = v5;
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v7;
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              [v9 setObject:*(void *)(*((void *)&v23 + 1) + 8 * i) forKey:&off_1003C9FB0];
            }
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v13);
        }

        float v5 = v22;
LABEL_18:
        id v16 = [v9 objectForKeyedSubscript:v6];
        if (objc_opt_respondsToSelector())
        {
          id v17 = +[AMSDefaults reversePushEnabled];
          if (v17 != (id)2)
          {
            if (v17 == (id)1)
            {
              BOOL v10 = 0;
LABEL_25:

              goto LABEL_26;
            }
            [(id)objc_opt_class() _randomDouble];
            if (v18 > 0.0)
            {
              double v19 = v18;
              [v16 doubleValue];
              BOOL v10 = v19 > v20;
              goto LABEL_25;
            }
          }
        }
        BOOL v10 = 1;
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = 0;
        goto LABEL_18;
      }
      id v8 = v7;
    }
    id v9 = v8;
    goto LABEL_18;
  }
  BOOL v10 = 1;
LABEL_26:

  return v10;
}

+ (double)_randomDouble
{
  if (qword_100401C10 != -1) {
    dispatch_once(&qword_100401C10, &stru_1003A37E8);
  }

  return drand48();
}

- (void)_setMoveToiOS
{
  [(PurchaseOperation *)self lock];
  int64_t v3 = [(SSURLRequestProperties *)self->_requestProperties HTTPHeaders];
  id v7 = [v3 objectForKey:SSHTTPHeaderUserAgent];

  BOOL v6 = 0;
  if (v7)
  {
    float v4 = +[NSString stringWithFormat:@"%@/", ISClientIdentifierMoveToiOS];
    unsigned __int8 v5 = [v7 hasPrefix:v4];

    if (v5) {
      BOOL v6 = 1;
    }
  }
  self->_BOOL moveToiOS = v6;
  [(PurchaseOperation *)self unlock];
}

- (BOOL)_shouldSendKeyBagSyncData
{
  if (![(PurchaseOperation *)self shouldSendKeyBagSyncData]) {
    return 0;
  }
  int64_t v3 = [(PurchaseOperation *)self urlBagKey];
  float v4 = v3;
  if (v3
    && ([v3 isEqualToString:@"buyProduct"] & 1) == 0
    && ([v4 isEqualToString:@"backgroundUpdateProduct"] & 1) == 0
    && ([v4 isEqualToString:@"updateProduct"] & 1) == 0
    && ([v4 isEqualToString:@"redownloadProduct"] & 1) == 0
    && ([v4 isEqualToString:@"redownloadAllTones"] & 1) == 0
    && ![v4 isEqualToString:@"paidRedownloadProduct"])
  {
    unsigned int v10 = [v4 isEqualToString:@"p2-in-app-buy"];

    if (v10) {
      goto LABEL_10;
    }
    return 0;
  }

LABEL_10:
  unsigned __int8 v5 = [(PurchaseOperation *)self _URLBagContext];
  BOOL v6 = +[ISURLBagCache sharedCache];
  id v7 = [v6 URLBagForContext:v5];

  id v8 = [v7 valueForKey:kISURLBagAuthCanPostKey];
  if (v8)
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v9 = [v8 BOOLValue];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)_shouldSendSBSyncData
{
  id v2 = [(PurchaseOperation *)self urlBagKey];
  if (([v2 isEqualToString:@"buyProduct"] & 1) != 0
    || ([v2 isEqualToString:@"backgroundUpdateProduct"] & 1) != 0
    || ([v2 isEqualToString:@"updateProduct"] & 1) != 0
    || ([v2 isEqualToString:@"subDownload"] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [v2 isEqualToString:@"sbDownload"];
  }

  return v3;
}

- (BOOL)_shouldUseClientAuthentication
{
  unsigned __int8 v3 = [(PurchaseOperation *)self urlBagKey];
  if (!v3) {
    goto LABEL_19;
  }
  float v4 = [(PurchaseOperation *)self _URLBagContext];
  unsigned __int8 v5 = +[ISURLBag valueForKey:@"p2-client-authentication" inBagContext:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = +[ISURLBag urlForKey:v3 inBagContext:v4];
    uint64_t v7 = [v6 path];
    if (v7)
    {
      id v8 = (void *)v7;
      char v9 = SSVURLPathMatchesActionDictionary();

      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
LABEL_8:
      id v11 = +[SSLogConfig sharedDaemonConfig];
      if (!v11)
      {
        id v11 = +[SSLogConfig sharedConfig];
      }
      unsigned int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      uint64_t v14 = [v11 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        v13 &= 2u;
      }
      if (v13)
      {
        *(_DWORD *)long long v25 = 138412546;
        *(void *)&v25[4] = objc_opt_class();
        *(_WORD *)&v25[12] = 2112;
        *(void *)&v25[14] = v3;
        id v15 = *(id *)&v25[4];
        LODWORD(v24) = 22;
        LOBYTE(v16) = 1;
        id v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17) {
          goto LABEL_30;
        }
        double v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, v25, v24, *(_OWORD *)v25, *(void *)&v25[16]);
        free(v17);
        SSFileLog();
      }
      else
      {
      }
      LOBYTE(v16) = 1;
      goto LABEL_30;
    }
    goto LABEL_18;
  }
  BOOL v6 = (void *)CFPreferencesCopyAppValue(@"p2-client-authentication", kSSUserDefaultsIdentifier);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  unsigned int v10 = [v6 containsObject:v3];

  if (v10) {
    goto LABEL_8;
  }
LABEL_19:
  id v11 = +[SSLogConfig sharedDaemonConfig];
  if (!v11)
  {
    id v11 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  unsigned int v21 = [v11 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_29;
  }
  *(_DWORD *)long long v25 = 138412546;
  *(void *)&v25[4] = objc_opt_class();
  *(_WORD *)&v25[12] = 2112;
  *(void *)&v25[14] = v3;
  id v22 = *(id *)&v25[4];
  LODWORD(v24) = 22;
  id v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    unsigned int v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, v25, v24, *(void *)v25, *(_OWORD *)&v25[8]);
    free(v16);
    SSFileLog();
LABEL_29:

    LOBYTE(v16) = 0;
  }
LABEL_30:

  return (char)v16;
}

- (id)_URLBagContext
{
  unsigned __int8 v3 = +[SSURLBagContext contextWithBagType:[(PurchaseOperation *)self bagType]];
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", -[PurchaseOperation allowsBootstrapCellularData](self, "allowsBootstrapCellularData"));
  float v4 = [(SSURLRequestProperties *)self->_requestProperties HTTPHeaders];
  uint64_t v5 = SSHTTPHeaderUserAgent;
  BOOL v6 = [v4 objectForKey:SSHTTPHeaderUserAgent];
  [v3 setValue:v6 forHTTPHeaderField:v5];

  return v3;
}

- (BOOL)allowsBootstrapCellularData
{
  return self->_allowsBootstrapCellularData;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  self->_allowsBootstrapCellularData = a3;
}

- (int64_t)bagType
{
  return self->_bagType;
}

- (void)setBagType:(int64_t)a3
{
  self->_bagType = a3;
}

- (NSString)buyParameters
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBuyParameters:(id)a3
{
}

- (NSData)clientAuditTokenData
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (BOOL)displayedErrorDialog
{
  return self->_displayedErrorDialog;
}

- (void)setDisplayedErrorDialog:(BOOL)a3
{
  self->_displayedErrorDialog = a3;
}

- (NSString)originatingStorefront
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setOriginatingStorefront:(id)a3
{
}

- (BOOL)isPreauthenticated
{
  return self->_preauthenticated;
}

- (void)setPreauthenticated:(BOOL)a3
{
  self->_preauthenticated = a3;
}

- (NSDictionary)rawOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRawOutput:(id)a3
{
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (BOOL)requiresSerialNumber
{
  return self->_requiresSerialNumber;
}

- (void)setRequiresSerialNumber:(BOOL)a3
{
  self->_requiresSerialNumber = a3;
}

- (BOOL)shouldSendKeyBagSyncData
{
  return self->_shouldSendKeyBagSyncData;
}

- (void)setShouldSendKeyBagSyncData:(BOOL)a3
{
  self->_shouldSendKeyBagSyncData = a3;
}

- (BOOL)skipsConfirmationDialogs
{
  return self->_skipsConfirmationDialogs;
}

- (void)setSkipsConfirmationDialogs:(BOOL)a3
{
  self->_skipsConfirmationDialogs = a3;
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void)setStoreCorrelationID:(id)a3
{
}

- (void)setLogKey:(id)a3
{
}

- (id)remoteAuthenticationHandler
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setRemoteAuthenticationHandler:(id)a3
{
}

- (AMSPurchaseShim)shim
{
  return (AMSPurchaseShim *)objc_getProperty(self, a2, 368, 1);
}

- (BOOL)microPayment
{
  return self->_microPayment;
}

- (void)setMicroPayment:(BOOL)a3
{
  self->_microPayment = a3;
}

- (BOOL)didConsumeScore
{
  return self->_didConsumeScore;
}

- (void)setDidConsumeScore:(BOOL)a3
{
  self->_didConsumeScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
  objc_storeStrong(&self->_remoteAuthenticationHandler, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_originatingStorefront, 0);
  objc_storeStrong((id *)&self->_deviceScore, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_responseInfo, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_requestPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_rawOutput, 0);
  objc_storeStrong((id *)&self->_originalProductOwnerAccountDSID, 0);
  objc_storeStrong((id *)&self->_mToken, 0);
  objc_storeStrong((id *)&self->_fairPlaySubscriptionController, 0);
  objc_storeStrong((id *)&self->_downloadKind, 0);
  objc_storeStrong((id *)&self->_deviceScorer, 0);
  objc_storeStrong((id *)&self->_clientIdentifierHeader, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end