@interface ISStoreURLOperation
+ (BOOL)_operationWaitsForPurchases:(id)a3;
+ (id)_authKitSession;
+ (id)_restrictionsHeaderValue;
+ (id)_ssBag_copyExtraHeadersForURL:(id)a3 bag:(id)a4;
+ (id)_ssBag_copyHeaderPatternsFromBag:(id)a3;
+ (id)_storeFrontIdentifierForAccount:(id)a3;
+ (id)itemPingOperationWithIdentifier:(unint64_t)a3 urlBagKey:(id)a4;
+ (id)pingOperationWithUrl:(id)a3;
+ (id)propertyListOperationWithURLBagKey:(id)a3;
+ (void)_addAccountDSID:(id)a3 toRequest:(id)a4;
+ (void)_addPrimaryiCloudDSIDToRequest:(id)a3;
+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withAccount:(id)a4 appendAuthKitHeaders:(BOOL)a5 appendStorefrontToURL:(BOOL)a6 clientBundleIdentifier:(id)a7 extraHeaders:(id)a8 storefrontSuffix:(id)a9;
+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8;
+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8;
+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8;
+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8;
+ (void)_appendStorefront:(id)a3 toRequestURL:(id)a4;
+ (void)_handleResponseHeaders:(id)a3 response:(id)a4 request:(id)a5 account:(id)a6 performsMachineDataActions:(BOOL)a7 shouldRetry:(BOOL *)a8;
+ (void)_performMachineDataRequest:(id)a3 requestProperties:(id)a4 completion:(id)a5;
+ (void)addITunesStoreHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4;
+ (void)handleITunesStoreResponseHeaders:(id)a3 request:(id)a4 withAccountIdentifier:(id)a5 shouldRetry:(BOOL *)a6;
- (BOOL)_authenticateWithContext:(id)a3 error:(id *)a4;
- (BOOL)_canSendTokenToURL:(id)a3;
- (BOOL)_isErrorTokenError:(id)a3;
- (BOOL)_performMachineDataRequest:(id)a3;
- (BOOL)_processResponseData:(id)a3 error:(id *)a4;
- (BOOL)_shouldRetryForAbsintheWithResponse:(id)a3;
- (BOOL)_shouldRetryForTouchIDChallengeWithError:(id)a3;
- (BOOL)_ssBag_shouldSendGUIDForURL:(id)a3 withBag:(id)a4;
- (BOOL)canSendGUIDParameter;
- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4;
- (BOOL)ignorePreexistingSecureToken;
- (BOOL)isURLBagRequest;
- (BOOL)needsAuthentication;
- (BOOL)needsTermsAndConditionsAcceptance;
- (BOOL)needsURLBag;
- (BOOL)performsMachineDataActions;
- (BOOL)shouldAppendAuthKitHeaders;
- (BOOL)shouldAppendStorefrontToURL;
- (BOOL)shouldCancelBiometricTokenUpdate;
- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4;
- (BOOL)shouldSendAKClientInfoHeaders;
- (BOOL)shouldSendAKPRKRequestHeader;
- (BOOL)shouldSendDSIDHeader;
- (BOOL)shouldSendXTokenHeader;
- (BOOL)shouldSuppressUserInfo;
- (BOOL)urlKnownToBeTrusted;
- (BOOL)useUserSpecificURLBag;
- (ISBiometricSessionDelegate)biometricSessionDelegate;
- (ISStoreURLOperation)init;
- (NSNumber)authenticatedDSID;
- (SSBag)bag;
- (SSBiometricAuthenticationContext)biometricAuthenticationContext;
- (SSURLBagContext)URLBagContext;
- (SSVFairPlaySAPSession)SAPSession;
- (id)_absintheHeaders;
- (id)_account;
- (id)_buyParams;
- (id)_copyAuthenticationContext;
- (id)_copyAuthenticationContextForAttemptNumber:(int64_t)a3;
- (id)_loadURLBagInterpreterWithRequest:(id)a3 requestProperties:(id)a4;
- (id)_resolvedURLInBagContext:(id)a3 bagTrusted:(BOOL *)a4;
- (id)_ssBag_copyGUIDPatternsFromBag:(id)a3;
- (id)_ssBag_copyGUIDSchemesFromBag:(id)a3;
- (id)_urlBagForContext:(id)a3;
- (id)authenticatedAccountDSID;
- (id)logKey;
- (id)newRequestWithURL:(id)a3;
- (int64_t)machineDataStyle;
- (void)_addStandardQueryParametersForURL:(id)a3;
- (void)_applyAnalyticsCookiesToRequest:(id)a3 withBag:(id)a4 oldBag:(id)a5;
- (void)_continueTouchIDSession;
- (void)_runURLOperation;
- (void)_setStoreFrontIdentifier:(id)a3 isTransient:(BOOL)a4;
- (void)_willSendRequest:(id)a3;
- (void)handleResponse:(id)a3;
- (void)run;
- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4;
- (void)setAuthenticatedDSID:(id)a3;
- (void)setBag:(id)a3;
- (void)setBiometricAuthenticationContext:(id)a3;
- (void)setBiometricSessionDelegate:(id)a3;
- (void)setCanSendGUIDParameter:(BOOL)a3;
- (void)setIgnorePreexistingSecureToken:(BOOL)a3;
- (void)setMachineDataStyle:(int64_t)a3;
- (void)setNeedsAuthentication:(BOOL)a3;
- (void)setNeedsTermsAndConditionsAcceptance:(BOOL)a3;
- (void)setNeedsURLBag:(BOOL)a3;
- (void)setPerformsMachineDataActions:(BOOL)a3;
- (void)setSAPSession:(id)a3;
- (void)setShouldAppendAuthKitHeaders:(BOOL)a3;
- (void)setShouldAppendStorefrontToURL:(BOOL)a3;
- (void)setShouldCancelBiometricTokenUpdate:(BOOL)a3;
- (void)setShouldSendAKClientInfoHeaders:(BOOL)a3;
- (void)setShouldSendAKPRKRequestHeader:(BOOL)a3;
- (void)setShouldSendDSIDHeader:(BOOL)a3;
- (void)setShouldSendXTokenHeader:(BOOL)a3;
- (void)setShouldSuppressUserInfo:(BOOL)a3;
- (void)setURLBagRequest:(BOOL)a3;
- (void)setUrlKnownToBeTrusted:(BOOL)a3;
- (void)setUseUserSpecificURLBag:(BOOL)a3;
@end

@implementation ISStoreURLOperation

- (ISStoreURLOperation)init
{
  __ISRecordSPIClassUsage(self);
  v7.receiver = self;
  v7.super_class = (Class)ISStoreURLOperation;
  v3 = [(ISURLOperation *)&v7 init];
  if (v3)
  {
    v4 = (SSBiometricAuthenticationContext *)objc_alloc_init(MEMORY[0x263F7B130]);
    biometricAuthenticationContext = v3->_biometricAuthenticationContext;
    v3->_biometricAuthenticationContext = v4;

    v3->_canSendGUIDParameter = 1;
    v3->_machineDataStyle = 2;
    v3->_needsURLBag = 1;
    v3->_shouldAppendAuthKitHeaders = 1;
    v3->_shouldAppendStorefrontToURL = 0;
    v3->_shouldCancelBiometricTokenUpdate = 0;
    v3->_shouldSuppressUserInfo = 0;
  }
  return v3;
}

+ (void)addITunesStoreHeadersToRequest:(id)a3 withAccountIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v8 = [MEMORY[0x263F7B148] currentDevice];
  v9 = [v8 userAgent];
  [v7 setValue:v9 forHTTPHeaderField:*MEMORY[0x263F7B788]];

  v10 = +[ISURLBagCache sharedCache];
  v11 = [v10 URLBagForContext:v7];

  if (!v6)
  {
    v12 = [MEMORY[0x263F7B0E8] defaultStore];
    v13 = [v12 activeAccount];

    id v6 = [v13 uniqueIdentifier];
  }
  [a1 _addiTunesStoreHeadersToRequest:v14 withURLBag:v11 accountIdentifier:v6 appendAuthKitHeaders:1 appendStorefrontToURL:0 clientBundleIdentifier:0];
}

+ (void)handleITunesStoreResponseHeaders:(id)a3 request:(id)a4 withAccountIdentifier:(id)a5 shouldRetry:(BOOL *)a6
{
  v9 = (void *)MEMORY[0x263F7B0E8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [v9 defaultStore];
  v13 = [v14 accountWithUniqueIdentifier:v10];

  +[ISStoreURLOperation _handleResponseHeaders:0 response:v12 request:v11 account:v13 performsMachineDataActions:1 shouldRetry:a6];
}

+ (id)itemPingOperationWithIdentifier:(unint64_t)a3 urlBagKey:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)objc_opt_class());
  [v6 setQueuePriority:-8];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = +[ISDevice sharedInstance];
  v9 = [v8 guid];

  if (v9) {
    [v7 setObject:v9 forKey:@"machine-id"];
  }
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  [v7 setObject:v10 forKey:@"songId"];

  id v11 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v11 setRequestParameters:v7];
  [v11 setURLBagKey:v5];

  [v6 setRequestProperties:v11];

  return v6;
}

+ (id)pingOperationWithUrl:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setQueuePriority:-8];
  [v4 setUrlKnownToBeTrusted:1];
  id v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v6 = +[ISURLBagCache sharedCache];
  id v7 = [v6 URLBagForContext:v5];

  v8 = [v7 valueForKey:*MEMORY[0x263F7BBD0]];
  v9 = [v8 objectForKey:@"metricsUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [NSURL URLWithString:v9];
    id v11 = [v3 host];
    id v12 = [v10 host];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      uint64_t v14 = [v3 path];
      v15 = v10;
      v16 = (void *)v14;
      v32 = v15;
      v17 = [v15 path];
      v18 = NSURL;
      v19 = [v3 query];
      v20 = (void *)[v18 copyDictionaryForQueryString:v19 unescapedValues:1];

      v21 = v16;
      if ([v16 hasPrefix:v17])
      {
        v22 = v17;
        v23 = v21;
        v24 = [v20 objectForKey:@"eventTime"];

        if (v24)
        {
          v25 = [MEMORY[0x263EFF910] date];
          [v25 timeIntervalSince1970];
          double v27 = v26;

          v28 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)(v27 * 1000.0));
          [v20 setObject:v28 forKey:@"eventTime"];
          uint64_t v31 = [v3 urlBySettingQueryStringDictionary:v20];

          id v3 = (id)v31;
        }
        v21 = v23;
        v17 = v22;
      }
      id v10 = v32;
    }
  }
  v29 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v3];
  [v29 setAllowedRetryCount:0];
  [v29 setTimeoutInterval:20.0];
  [v4 setRequestProperties:v29];

  return v4;
}

+ (id)propertyListOperationWithURLBagKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = +[ISDataProvider provider];
  [v4 setDataProvider:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v6 setURLBagKey:v3];

  [v4 setRequestProperties:v6];

  return v4;
}

- (BOOL)canSendGUIDParameter
{
  [(ISOperation *)self lock];
  BOOL canSendGUIDParameter = self->_canSendGUIDParameter;
  [(ISOperation *)self unlock];
  return canSendGUIDParameter;
}

- (id)logKey
{
  id v3 = [(ISURLOperation *)self authenticationContext];
  id v4 = [v3 logUUID];

  if (v4)
  {
    id v5 = [(ISURLOperation *)self authenticationContext];
    id v6 = [v5 logUUID];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ISStoreURLOperation;
    id v6 = [(ISURLOperation *)&v8 logKey];
  }

  return v6;
}

- (BOOL)ignorePreexistingSecureToken
{
  [(ISOperation *)self lock];
  BOOL ignorePreexistingSecureToken = self->_ignorePreexistingSecureToken;
  [(ISOperation *)self unlock];
  return ignorePreexistingSecureToken;
}

- (BOOL)performsMachineDataActions
{
  [(ISOperation *)self lock];
  BOOL v3 = self->_machineDataStyle != 0;
  [(ISOperation *)self unlock];
  return v3;
}

- (SSVFairPlaySAPSession)SAPSession
{
  [(ISOperation *)self lock];
  BOOL v3 = self->_sapSession;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)setCanSendGUIDParameter:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_BOOL canSendGUIDParameter = a3;

  [(ISOperation *)self unlock];
}

- (void)setIgnorePreexistingSecureToken:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_BOOL ignorePreexistingSecureToken = a3;

  [(ISOperation *)self unlock];
}

- (void)setPerformsMachineDataActions:(BOOL)a3
{
  BOOL v3 = a3;
  [(ISOperation *)self lock];
  if (v3)
  {
    if (self->_machineDataStyle) {
      goto LABEL_6;
    }
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }
  self->_machineDataStyle = v5;
LABEL_6:

  [(ISOperation *)self unlock];
}

- (void)setSAPSession:(id)a3
{
  int64_t v5 = (SSVFairPlaySAPSession *)a3;
  [(ISOperation *)self lock];
  if (self->_sapSession != v5) {
    objc_storeStrong((id *)&self->_sapSession, a3);
  }
  [(ISOperation *)self unlock];
}

- (void)setShouldSendXTokenHeader:(BOOL)a3
{
  [(ISOperation *)self lock];
  self->_shouldSendXTokenHeader = a3;

  [(ISOperation *)self unlock];
}

- (BOOL)shouldSendXTokenHeader
{
  [(ISOperation *)self lock];
  BOOL shouldSendXTokenHeader = self->_shouldSendXTokenHeader;
  [(ISOperation *)self unlock];
  return shouldSendXTokenHeader;
}

- (SSURLBagContext)URLBagContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B358]);
  id v4 = [(ISURLOperation *)self _requestProperties];
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", objc_msgSend(v4, "allowsBootstrapCellularData"));
  objc_msgSend(v3, "setBagType:", objc_msgSend(v4, "URLBagType"));
  int64_t v5 = [v4 clientAuditTokenData];
  [v3 setClientAuditTokenData:v5];

  id v6 = [v4 HTTPHeaders];
  uint64_t v7 = *MEMORY[0x263F7B788];
  objc_super v8 = [v6 objectForKey:*MEMORY[0x263F7B788]];

  if (v8)
  {
    [v3 setValue:v8 forHTTPHeaderField:v7];
  }
  else
  {
    v9 = [v3 valueForHTTPHeaderField:v7];

    if (!v9)
    {
      id v10 = [MEMORY[0x263F7B148] currentDevice];
      id v11 = [v10 userAgent];
      [v3 setValue:v11 forHTTPHeaderField:v7];
    }
  }
  if ([(ISStoreURLOperation *)self needsAuthentication]
    || [(ISStoreURLOperation *)self useUserSpecificURLBag])
  {
    id v12 = [(ISStoreURLOperation *)self _account];
    int v13 = [v12 uniqueIdentifier];
    [v3 setUserIdentifier:v13];
  }

  return (SSURLBagContext *)v3;
}

- (id)authenticatedAccountDSID
{
  id v3 = [(ISStoreURLOperation *)self authenticatedDSID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ISStoreURLOperation;
    id v5 = [(ISOperation *)&v8 authenticatedAccountDSID];
  }
  id v6 = v5;

  return v6;
}

- (id)_copyAuthenticationContext
{
  v14.receiver = self;
  v14.super_class = (Class)ISStoreURLOperation;
  id v3 = [(ISURLOperation *)&v14 _copyAuthenticationContext];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F7B288]);
    id v5 = [(ISStoreURLOperation *)self _account];
    id v3 = (id)[v4 initWithAccount:v5];

    id v6 = [(ISStoreURLOperation *)self logKey];
    [v3 setLogUUID:v6];

    [v3 setCanSetActiveAccount:0];
  }
  uint64_t v7 = [(ISURLOperation *)self _requestProperties];
  [v7 URLBagType];
  [v3 setAccountScope:SSAccountScopeForURLBagType()];
  objc_msgSend(v3, "setAllowsBootstrapCellularData:", objc_msgSend(v7, "allowsBootstrapCellularData"));
  objc_super v8 = [v7 clientIdentifier];
  [v3 setClientIdentifierHeader:v8];

  v9 = [v7 HTTPHeaders];
  uint64_t v10 = *MEMORY[0x263F7B788];
  id v11 = [v9 objectForKey:*MEMORY[0x263F7B788]];

  if (v11) {
    [v3 setValue:v11 forHTTPHeaderField:v10];
  }
  id v12 = [v7 userAgentComponents];
  if (v12) {
    [v3 setUserAgentComponents:v12];
  }
  [(ISOperation *)self lock];
  if (self->_ignorePreexistingSecureToken) {
    [v3 setPersistsPasswordFallback:1];
  }
  [(ISOperation *)self unlock];

  return v3;
}

- (BOOL)handleRedirectFromDataProvider:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 authenticatedAccountDSID];
  if (v7)
  {
    [(ISStoreURLOperation *)self setAuthenticatedDSID:v7];
    [(ISStoreURLOperation *)self setNeedsAuthentication:1];
  }
  objc_super v8 = [v6 redirectURL];
  v9 = [v8 schemeSwizzledURL];

  if ([(ISStoreURLOperation *)self needsAuthentication]
    && ![(ISStoreURLOperation *)self _canSendTokenToURL:v9])
  {
    v22 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v22)
    {
      v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    v25 = [v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      double v27 = objc_opt_class();
      id v33 = v27;
      [(ISURLOperation *)self _sanitizedURLForURL:v9];
      int v36 = 138412546;
      v37 = v27;
      __int16 v38 = 2112;
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_30:

        ISError(3, 0, 0);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v12 = 0;
        goto LABEL_33;
      }
      v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v36, v30);
      free(v28);
      SSFileLog();
    }

    goto LABEL_30;
  }
  uint64_t v10 = [(ISStoreURLOperation *)self URLBagContext];
  id v11 = [(ISStoreURLOperation *)self _urlBagForContext:v10];
  if ([v11 urlIsTrusted:v9])
  {

    v34.receiver = self;
    v34.super_class = (Class)ISStoreURLOperation;
    id v35 = 0;
    BOOL v12 = [(ISURLOperation *)&v34 handleRedirectFromDataProvider:v6 error:&v35];
    id v13 = v35;
  }
  else
  {
    v32 = v9;
    objc_super v14 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v14)
    {
      objc_super v14 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      v19 = objc_opt_class();
      id v31 = v19;
      [(ISURLOperation *)self _sanitizedURLForURL:v32];
      int v36 = 138412546;
      v37 = v19;
      __int16 v38 = 2112;
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v36, v30);
        free(v20);
        SSFileLog();
      }
    }
    else
    {
    }
    ISError(3, 0, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v12 = 0;
    v9 = v32;
  }
LABEL_33:
  if (a4 && !v12) {
    *a4 = v13;
  }

  return v12;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = 0;
    id v5 = [(ISURLOperation *)self activeURLRequest];
    id v6 = [(ISStoreURLOperation *)self _account];
    +[ISStoreURLOperation _handleResponseHeaders:self response:v4 request:v5 account:v6 performsMachineDataActions:0 shouldRetry:&v8];

    if (v8) {
      [(ISURLOperation *)self _retry];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)ISStoreURLOperation;
  [(ISURLOperation *)&v7 handleResponse:v4];
}

- (id)newRequestWithURL:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ISStoreURLOperation *)self shouldSuppressUserInfo])
  {
    [(ISURLOperation *)self _setUsesPrivateCookieStore:0];
    v62.receiver = self;
    v62.super_class = (Class)ISStoreURLOperation;
    id v5 = [(ISURLOperation *)&v62 newRequestWithURL:v4];
    [v5 setHTTPShouldHandleCookies:0];
  }
  else
  {
    v61.receiver = self;
    v61.super_class = (Class)ISStoreURLOperation;
    id v5 = [(ISURLOperation *)&v61 newRequestWithURL:v4];
  }
  id v6 = [v5 URL];

  if (self->_bag)
  {
    if (![(ISStoreURLOperation *)self isURLBagRequest])
    {
      v9 = self->_bag;
      objc_super v7 = 0;
      goto LABEL_10;
    }
    objc_super v7 = 0;
  }
  else
  {
    char v8 = [(ISStoreURLOperation *)self URLBagContext];
    objc_super v7 = [(ISStoreURLOperation *)self _urlBagForContext:v8];
  }
  v9 = 0;
LABEL_10:
  [(ISStoreURLOperation *)self _applyAnalyticsCookiesToRequest:v5 withBag:v9 oldBag:v7];
  if ([(ISStoreURLOperation *)self canSendGUIDParameter])
  {
    uint64_t v10 = [v5 HTTPMethod];
    char v11 = [v10 isEqualToString:@"POST"];

    if ((v11 & 1) == 0)
    {
      if (v9)
      {
        if (![(ISStoreURLOperation *)self _ssBag_shouldSendGUIDForURL:v6 withBag:v9])goto LABEL_19; {
      }
        }
      else if (![v7 shouldSendGUIDForURL:v6])
      {
        goto LABEL_19;
      }
      BOOL v12 = +[ISDevice sharedInstance];
      id v13 = [v12 guid];

      if (v13)
      {
        uint64_t v14 = [v6 URLByAppendingQueryParameter:@"guid" value:v13];

        [v5 setURL:v14];
        id v6 = (void *)v14;
      }
    }
  }
LABEL_19:
  int v15 = [(ISStoreURLOperation *)self _account];
  v56 = v9;
  if (v9)
  {
    int v16 = v7;
    v17 = v6;
    if (v15)
    {
      int v18 = objc_opt_class();
      BOOL v19 = [(ISStoreURLOperation *)self shouldAppendAuthKitHeaders];
      BOOL v20 = [(ISStoreURLOperation *)self shouldAppendStorefrontToURL];
      v21 = [0 clientBundleIdentifier];
      [v18 _addiTunesStoreHeadersToRequest:v5 withSSBag:v9 account:v15 appendAuthKitHeaders:v19 appendStorefrontToURL:v20 clientBundleIdentifier:v21];
    }
    else
    {
      v21 = [(ISURLOperation *)self _accountIdentifier];
      v25 = objc_opt_class();
      BOOL v26 = [(ISStoreURLOperation *)self shouldAppendAuthKitHeaders];
      BOOL v27 = [(ISStoreURLOperation *)self shouldAppendStorefrontToURL];
      uint64_t v28 = [0 clientBundleIdentifier];
      v29 = v9;
      uint64_t v30 = (void *)v28;
      [v25 _addiTunesStoreHeadersToRequest:v5 withSSBag:v29 accountIdentifier:v21 appendAuthKitHeaders:v26 appendStorefrontToURL:v27 clientBundleIdentifier:v28];
    }
    id v6 = v17;
    objc_super v7 = v16;
  }
  else if (v15)
  {
    v22 = objc_opt_class();
    BOOL v23 = [(ISStoreURLOperation *)self shouldAppendAuthKitHeaders];
    BOOL v24 = [(ISStoreURLOperation *)self shouldAppendStorefrontToURL];
    v21 = [0 clientBundleIdentifier];
    [v22 _addiTunesStoreHeadersToRequest:v5 withURLBag:v7 account:v15 appendAuthKitHeaders:v23 appendStorefrontToURL:v24 clientBundleIdentifier:v21];
  }
  else
  {
    v21 = [(ISURLOperation *)self _accountIdentifier];
    v50 = objc_opt_class();
    BOOL v51 = [(ISStoreURLOperation *)self shouldAppendAuthKitHeaders];
    BOOL v52 = [(ISStoreURLOperation *)self shouldAppendStorefrontToURL];
    [0 clientBundleIdentifier];
    v54 = v53 = v6;
    [v50 _addiTunesStoreHeadersToRequest:v5 withURLBag:v7 accountIdentifier:v21 appendAuthKitHeaders:v51 appendStorefrontToURL:v52 clientBundleIdentifier:v54];

    id v6 = v53;
  }

  if ([(ISStoreURLOperation *)self shouldSuppressUserInfo])
  {
    [v5 setValue:0 forHTTPHeaderField:*MEMORY[0x263F7B7C0]];
    [v5 setValue:0 forHTTPHeaderField:*MEMORY[0x263F7B780]];
  }
  id v31 = [(ISURLOperation *)self _requestProperties];
  v32 = [v31 clientIdentifier];

  if (v32)
  {
    id v33 = (void *)[v32 copy];
    [v5 setValue:v33 forHTTPHeaderField:*MEMORY[0x263F7B7B8]];
  }
  if ([(ISStoreURLOperation *)self needsAuthentication]
    || [(ISStoreURLOperation *)self shouldSendXTokenHeader])
  {
    [(ISOperation *)self lock];
    if ([(ISStoreURLOperation *)self needsAuthentication])
    {
      objc_super v34 = [(ISStoreURLOperation *)self authenticatedDSID];
      BOOL v35 = v34 != 0;
    }
    else
    {
      BOOL v35 = 1;
    }
    int v36 = [(ISStoreURLOperation *)self biometricAuthenticationContext];
    int v37 = [v36 didFallbackToPassword];

    LODWORD(v36) = self->_ignorePreexistingSecureToken;
    [(ISOperation *)self unlock];
    if (!v36 || (v37 & v35) != 0)
    {
      __int16 v38 = [v15 secureToken];
      if ((SSIsDaemon() & 1) == 0 && !v38)
      {
        id v39 = [(ISURLOperation *)self _requestProperties];
        uint64_t v40 = [v39 URLBagKey];
        int v41 = [v40 isEqualToString:@"buyProduct"];

        if (v41)
        {
          v42 = [MEMORY[0x263F7B0E8] defaultStore];
          v43 = [v42 accounts];

          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v44 = v43;
          __int16 v38 = (void *)[v44 countByEnumeratingWithState:&v57 objects:v63 count:16];
          if (v38)
          {
            v45 = v7;
            v46 = v6;
            uint64_t v47 = *(void *)v58;
            while (2)
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v58 != v47) {
                  objc_enumerationMutation(v44);
                }
                v49 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                if ([v15 isEqual:v49])
                {
                  __int16 v38 = [v49 secureToken];
                  goto LABEL_52;
                }
              }
              __int16 v38 = (void *)[v44 countByEnumeratingWithState:&v57 objects:v63 count:16];
              if (v38) {
                continue;
              }
              break;
            }
LABEL_52:
            id v6 = v46;
            objc_super v7 = v45;
          }
        }
        else
        {
          __int16 v38 = 0;
        }
      }
      [v5 setValue:v38 forHTTPHeaderField:*MEMORY[0x263F7B850]];
    }
  }

  return v5;
}

- (BOOL)_processResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(ISStoreURLOperation *)self SAPSession];
  if (!v7)
  {
    id v18 = 0;
    goto LABEL_8;
  }
  char v8 = [(ISURLOperation *)self activeURLRequest];
  v9 = [(ISURLOperation *)self _requestProperties];
  uint64_t v10 = [(ISStoreURLOperation *)self _loadURLBagInterpreterWithRequest:v8 requestProperties:v9];

  char v11 = [(ISURLOperation *)self response];
  BOOL v12 = [v11 URL];
  id v13 = [v10 mescalSignaturePolicyForResponseURL:v12];

  if (v13 && [v13 policyType])
  {
    uint64_t v14 = [v11 allHeaderFields];
    int v15 = ISDictionaryValueForCaseInsensitiveString(v14, (void *)*MEMORY[0x263F7B7B0]);

    if (v15)
    {
      int v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
      id v21 = 0;
      int v17 = [v7 verifyData:v6 withSignature:v16 error:&v21];
      id v18 = v21;

LABEL_13:
      goto LABEL_14;
    }
    SSError();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)([v11 statusCode] - 400) > 0x257
      || ![(ISURLOperation *)self _loadsHTTPFailures])
    {
      int v17 = 0;
      goto LABEL_13;
    }

LABEL_8:
    BOOL v19 = 1;
    goto LABEL_17;
  }
  id v18 = 0;
  int v17 = 1;
LABEL_14:

  BOOL v19 = v17 != 0;
  if (a4 && !v17)
  {
    id v18 = v18;
    BOOL v19 = 0;
    *a4 = v18;
  }
LABEL_17:

  return v19;
}

- (void)run
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  [(ISOperation *)self lock];
  if (self->_isURLBagRequest) {
    goto LABEL_8;
  }
  if (!self->_sapSession)
  {
    if (SSIsDaemon()) {
      [MEMORY[0x263F7B388] sharedDefaultSession];
    }
    else {
    id v3 = [MEMORY[0x263F7B388] sharedPrimeSession];
    }
    sapSession = self->_sapSession;
    self->_sapSession = v3;
  }
  if (self->_isURLBagRequest) {
LABEL_8:
  }
    int64_t machineDataStyle = 0;
  else {
    int64_t machineDataStyle = self->_machineDataStyle;
  }
  self->_activeMachineDataStyle = machineDataStyle;
  [(ISOperation *)self unlock];
  if ([(ISStoreURLOperation *)self needsAuthentication]) {
    LODWORD(v132) = ![(ISStoreURLOperation *)self ignorePreexistingSecureToken];
  }
  else {
    LOBYTE(v132) = 0;
  }
  uint64_t v133 = 0;
  uint64_t v134 = 0;
  unint64_t v6 = 0x263F7B000uLL;
  uint64_t v124 = *MEMORY[0x263F7B7A0];
  uint64_t v125 = *MEMORY[0x263F7B798];
  uint64_t v126 = *MEMORY[0x263F7B748];
  while (1)
  {
    objc_super v7 = (void *)MEMORY[0x2166C7A20]();
    if (v134 < 1) {
      goto LABEL_25;
    }
    char v8 = [*(id *)(v6 + 504) sharedAccountsAuthenticationConfig];
    if (!v8)
    {
      char v8 = [*(id *)(v6 + 504) sharedConfig];
    }
    int v9 = objc_msgSend(v8, "shouldLog", v114);
    if ([v8 shouldLogToDisk]) {
      v9 |= 2u;
    }
    uint64_t v10 = [v8 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_23;
    }
    char v11 = objc_opt_class();
    BOOL v12 = v7;
    id v13 = v11;
    uint64_t v14 = [(ISURLOperation *)self requestProperties];
    int v15 = [v14 URL];
    int v146 = 138543618;
    v147 = v11;
    __int16 v148 = 2114;
    v149 = v15;
    LODWORD(v117) = 22;
    v114 = &v146;
    int v16 = (void *)_os_log_send_and_compose_impl();

    objc_super v7 = v12;
    if (v16)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v146, v117);
      free(v16);
      v114 = (int *)v10;
      SSFileLog();
LABEL_23:
    }
LABEL_25:
    id v17 = -[ISStoreURLOperation _copyAuthenticationContextForAttemptNumber:](self, "_copyAuthenticationContextForAttemptNumber:", v133, v114);
    v143 = v17;
    if (v132)
    {
      id v145 = 0;
      BOOL v18 = [(ISStoreURLOperation *)self _authenticateWithContext:v17 error:&v145];
      id v19 = v145;
      if (!v18)
      {
        v97 = v7;
        uint64_t v98 = [*(id *)(v6 + 504) sharediTunesStoreConfig];
        v99 = (void *)v98;
        if (!v98)
        {
          v99 = [*(id *)(v6 + 504) sharedConfig];
        }
        int v100 = [v99 shouldLog];
        if ([v99 shouldLogToDisk]) {
          v100 |= 2u;
        }
        v101 = [v99 OSLogObject];
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
          v100 &= 2u;
        }
        if (v100)
        {
          v102 = objc_opt_class();
          id v103 = v102;
          v104 = [(ISURLOperation *)self _sanitizedDescriptionForObject:v19];
          int v146 = 138412546;
          v147 = v102;
          __int16 v148 = 2112;
          v149 = v104;
          LODWORD(v117) = 22;
          v105 = (void *)_os_log_send_and_compose_impl();

          if (!v105)
          {
LABEL_148:

            [(ISOperation *)self setError:v19];
            BOOL v27 = v19;
            objc_super v7 = v97;
            goto LABEL_160;
          }
          v101 = objc_msgSend(NSString, "stringWithCString:encoding:", v105, 4, &v146, v117);
          free(v105);
          SSFileLog();
        }

        goto LABEL_148;
      }
    }
    else
    {
      id v19 = 0;
    }
    if (![(ISStoreURLOperation *)self needsTermsAndConditionsAcceptance])
    {
      BOOL v27 = v19;
      goto LABEL_50;
    }
    id v20 = objc_alloc(NSClassFromString(&cfstr_Accepttermsand.isa));
    id v21 = [(ISStoreURLOperation *)self _account];
    v22 = (void *)[v20 initWithAccount:v21];

    if (!v22) {
      break;
    }
    v135 = v7;
    id v144 = v19;
    BOOL v23 = [(ISOperation *)self runSubOperation:v22 returningError:&v144];
    id v24 = v144;

    if (v23)
    {
      int v25 = [v22 isUserAccepted];
      if (v25)
      {
        char v26 = v25;
        if (!v24)
        {

          BOOL v27 = 0;
          objc_super v7 = v135;
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v28 = ISError(16, 0, 0);

        if (!v28)
        {
          BOOL v27 = v22;
          objc_super v7 = v135;
          goto LABEL_160;
        }
        char v26 = 0;
        id v24 = (id)v28;
      }
    }
    else
    {
      char v26 = 0;
    }
    v29 = [*(id *)(v6 + 504) sharediTunesStoreConfig];
    if (!v29)
    {
      v29 = [*(id *)(v6 + 504) sharedConfig];
    }
    int v30 = [v29 shouldLog];
    if ([v29 shouldLogToDisk]) {
      v30 |= 2u;
    }
    id v31 = [v29 OSLogObject];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      v30 &= 2u;
    }
    if (v30)
    {
      v32 = objc_opt_class();
      id v33 = v32;
      objc_super v34 = [(ISURLOperation *)self _sanitizedDescriptionForObject:v24];
      int v146 = 138412546;
      v147 = v32;
      __int16 v148 = 2112;
      v149 = v34;
      LODWORD(v117) = 22;
      v115 = &v146;
      BOOL v35 = (void *)_os_log_send_and_compose_impl();

      unint64_t v6 = 0x263F7B000uLL;
      if (!v35) {
        goto LABEL_49;
      }
      id v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, &v146, v117);
      free(v35);
      v115 = (int *)v31;
      SSFileLog();
    }

LABEL_49:
    BOOL v27 = v24;
    [(ISOperation *)self setError:v24];

    objc_super v7 = v135;
    if ((v26 & 1) == 0) {
      goto LABEL_160;
    }
LABEL_50:
    [(ISStoreURLOperation *)self _runURLOperation];
    int v36 = [(ISOperation *)self error];
    int v37 = [(ISURLOperation *)self response];
    if (!v37 || ![(ISStoreURLOperation *)self machineDataStyle])
    {
      int v41 = 0;
      goto LABEL_84;
    }
    __int16 v38 = (void *)[objc_alloc(MEMORY[0x263F7B218]) initWithURLResponse:v37];
    if (v38)
    {
      v140 = v37;
      if (![(ISStoreURLOperation *)self _performMachineDataRequest:v38]) {
        goto LABEL_59;
      }
      id v39 = [v38 actionName];
      char v40 = [v39 isEqualToString:@"RP"];

      if (v40)
      {
        uint64_t v134 = 0;
        goto LABEL_68;
      }
      BOOL v42 = v134++ <= 0;
      if (v42)
      {
LABEL_68:
        v43 = [*(id *)(v6 + 504) sharedAccountsAuthenticationConfig];
        if (!v43)
        {
          v43 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v52 = [v43 shouldLog];
        if ([v43 shouldLogToDisk]) {
          v52 |= 2u;
        }
        v45 = [v43 OSLogObject];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
          int v53 = v52;
        }
        else {
          int v53 = v52 & 2;
        }
        if (v53)
        {
          v118 = v27;
          v137 = v7;
          v54 = objc_opt_class();
          id v128 = v54;
          v121 = [(ISURLOperation *)self requestProperties];
          v55 = [v121 URL];
          v119 = [(ISStoreURLOperation *)self _account];
          v56 = [v119 accountName];
          long long v57 = SSHashIfNeeded();
          int v146 = 138543874;
          v147 = v54;
          __int16 v148 = 2114;
          v149 = v55;
          __int16 v150 = 2114;
          v151 = v57;
          LODWORD(v117) = 32;
          v116 = &v146;
          long long v58 = (void *)_os_log_send_and_compose_impl();

          if (!v58)
          {
            int v41 = 1;
            objc_super v7 = v137;
            BOOL v27 = v118;
            goto LABEL_82;
          }
          v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v58, 4, &v146, v117);
          free(v58);
          v116 = (int *)v45;
          SSFileLog();
          int v41 = 1;
          objc_super v7 = v137;
          BOOL v27 = v118;
        }
        else
        {
          int v41 = 1;
        }
      }
      else
      {
LABEL_59:
        v43 = [*(id *)(v6 + 504) sharedAccountsAuthenticationConfig];
        if (!v43)
        {
          v43 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v44 = [v43 shouldLog];
        if ([v43 shouldLogToDisk]) {
          v44 |= 2u;
        }
        v45 = [v43 OSLogObject];
        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          v44 &= 2u;
        }
        if (v44)
        {
          v127 = v36;
          v46 = v27;
          v136 = v7;
          uint64_t v47 = objc_opt_class();
          id v48 = v47;
          v49 = [(ISURLOperation *)self requestProperties];
          v50 = [v49 URL];
          int v146 = 138543618;
          v147 = v47;
          __int16 v148 = 2114;
          v149 = v50;
          LODWORD(v117) = 22;
          v116 = &v146;
          BOOL v51 = (void *)_os_log_send_and_compose_impl();

          if (v51)
          {
            v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v146, v117);
            free(v51);
            v116 = (int *)v45;
            SSFileLog();
            int v41 = 0;
            objc_super v7 = v136;
            BOOL v27 = v46;
            int v36 = v127;
            goto LABEL_81;
          }
          int v41 = 0;
          objc_super v7 = v136;
          BOOL v27 = v46;
          int v36 = v127;
LABEL_82:

          unint64_t v6 = 0x263F7B000uLL;
          int v37 = v140;
          goto LABEL_83;
        }
        int v41 = 0;
      }
LABEL_81:

      goto LABEL_82;
    }
    int v41 = 0;
LABEL_83:

LABEL_84:
    long long v59 = [(ISStoreURLOperation *)self biometricAuthenticationContext];
    long long v60 = [v59 challenge];

    if (v60)
    {
      BOOL v61 = [(ISStoreURLOperation *)self _shouldRetryForTouchIDChallengeWithError:v36];
      if ((v41 | [(ISStoreURLOperation *)self _shouldRetryForAbsintheWithResponse:v37]))goto LABEL_99; {
      if (v61)
      }
      {
        [(ISStoreURLOperation *)self _continueTouchIDSession];
        if ([(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext didBuyParamsChange])
        {
          objc_super v62 = [(ISStoreURLOperation *)self biometricSessionDelegate];
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v62, "sender:didFallbackToPassword:", self, -[SSBiometricAuthenticationContext didFallbackToPassword](self->_biometricAuthenticationContext, "didFallbackToPassword"));
          }
          if (objc_opt_respondsToSelector()) {
            [v62 sender:self shouldContinueTouchIDSession:1];
          }
          if (objc_opt_respondsToSelector())
          {
            v141 = v37;
            v63 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext challenge];
            v138 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext signature];
            v129 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext paymentTokenData];
            v122 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext fpanID];
            unsigned int v120 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext isExtendedAction];
            char v64 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext isPayment];
            id v65 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v66 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext xAppleAMDHeader];
            if (v66) {
              [v65 setObject:v66 forKeyedSubscript:v125];
            }
            v67 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext xAppleAMDMHeader];
            if (v67) {
              [v65 setObject:v67 forKeyedSubscript:v124];
            }
            LOBYTE(v114) = v64;
            [v62 sender:self willSendChallenge:v63 andSignature:v138 andPaymentTokenData:v129 andFpanID:v122 isExtendedAction:v120 isPayment:v114 additionalHeaders:v65];

            char v68 = 0;
LABEL_108:
            int v37 = v141;
LABEL_114:

            unint64_t v6 = 0x263F7B000;
          }
          else
          {
            char v68 = 0;
          }
          goto LABEL_134;
        }
LABEL_99:
        objc_super v62 = [*(id *)(v6 + 504) sharedAccountsAuthenticationConfig];
        if (!v62)
        {
          objc_super v62 = [*(id *)(v6 + 504) sharedConfig];
        }
        int v69 = [v62 shouldLog];
        if ([v62 shouldLogToDisk]) {
          v69 |= 2u;
        }
        v63 = [v62 OSLogObject];
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
          v69 &= 2u;
        }
        if (!v69)
        {
          char v68 = 1;
          goto LABEL_114;
        }
        v141 = v37;
        v130 = v36;
        v70 = v27;
        v71 = v7;
        v72 = objc_opt_class();
        id v73 = v72;
        v74 = [(ISOperation *)self error];
        v75 = [(ISURLOperation *)self _sanitizedDescriptionForObject:v74];
        int v146 = 138543618;
        v147 = v72;
        __int16 v148 = 2112;
        v149 = v75;
        LODWORD(v117) = 22;
        v114 = &v146;
        v76 = (void *)_os_log_send_and_compose_impl();

        if (v76)
        {
          v63 = objc_msgSend(NSString, "stringWithCString:encoding:", v76, 4, &v146, v117);
          free(v76);
          v114 = (int *)v63;
          SSFileLog();
          char v68 = 1;
          objc_super v7 = v71;
          BOOL v27 = v70;
          int v36 = v130;
          goto LABEL_108;
        }
        char v68 = 1;
        objc_super v7 = v71;
        unint64_t v6 = 0x263F7B000;
        BOOL v27 = v70;
        int v36 = v130;
        int v37 = v141;
LABEL_134:

        goto LABEL_135;
      }
    }
    else if ((v41 | [(ISStoreURLOperation *)self _shouldRetryForAbsintheWithResponse:v37]))
    {
      goto LABEL_99;
    }
    if (![(ISOperation *)self success])
    {
      if ([(ISStoreURLOperation *)self _isErrorTokenError:v36])
      {
        v77 = [(ISURLOperation *)self authenticationContext];
        uint64_t v78 = [v77 promptStyle];

        if (v78 != 1000)
        {
          v142 = v37;
          v79 = [(ISStoreURLOperation *)self _account];
          v80 = [*(id *)(v6 + 504) sharedAccountsAuthenticationConfig];
          if (!v80)
          {
            v80 = [*(id *)(v6 + 504) sharedConfig];
          }
          int v81 = [v80 shouldLog];
          if ([v80 shouldLogToDisk]) {
            v81 |= 2u;
          }
          v82 = [v80 OSLogObject];
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
            v81 &= 2u;
          }
          v132 = v79;
          if (v81)
          {
            v83 = objc_opt_class();
            id v123 = v83;
            [(ISURLOperation *)self requestProperties];
            v84 = v139 = v7;
            [v84 URL];
            v131 = v36;
            v86 = v85 = v27;
            v87 = [v79 accountName];
            v88 = SSHashIfNeeded();
            int v146 = 138543874;
            v147 = v83;
            __int16 v148 = 2114;
            v149 = v86;
            __int16 v150 = 2114;
            v151 = v88;
            LODWORD(v117) = 32;
            v114 = &v146;
            v89 = (void *)_os_log_send_and_compose_impl();

            v79 = v132;
            objc_super v7 = v139;

            BOOL v27 = v85;
            int v36 = v131;

            if (v89)
            {
              v82 = objc_msgSend(NSString, "stringWithCString:encoding:", v89, 4, &v146, v117);
              free(v89);
              v114 = (int *)v82;
              SSFileLog();
              goto LABEL_125;
            }
          }
          else
          {
LABEL_125:
          }
          [v79 setAuthenticated:0];
          [v79 setSecureToken:0];
          v90 = [MEMORY[0x263F7B0E8] defaultStore];
          [v90 saveAccount:v79 verifyCredentials:0 error:0];

          [(ISStoreURLOperation *)self setNeedsAuthentication:1];
          v91 = [v36 userInfo];
          v92 = [v91 objectForKey:v126];

          if (v92)
          {
            if (([v92 BOOLValue] & 1) == 0)
            {
              v93 = [(ISURLOperation *)self authenticationContext];
              uint64_t v94 = [v93 promptStyle];

              if (v94 != 1) {
                [(ISStoreURLOperation *)self setIgnorePreexistingSecureToken:0];
              }
            }
          }
          v95 = [(ISURLOperation *)self HTTPArchive];
          unint64_t v6 = 0x263F7B000uLL;
          v96 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
          [v95 writeToDiskWithLogConfig:v96 compressed:0 error:0];

          char v68 = 0;
          LOBYTE(v132) = 1;
          BOOL v42 = v133++ <= 0;
          int v37 = v142;
          if (!v42) {
            goto LABEL_135;
          }
          goto LABEL_99;
        }
      }
    }
    char v68 = 0;
LABEL_135:

    if ((v68 & 1) == 0) {
      return;
    }
  }
  v106 = v7;
  v107 = [*(id *)(v6 + 504) sharediTunesStoreConfig];
  if (!v107)
  {
    v107 = [*(id *)(v6 + 504) sharedConfig];
  }
  int v108 = [v107 shouldLog];
  if ([v107 shouldLogToDisk]) {
    v108 |= 2u;
  }
  v109 = [v107 OSLogObject];
  if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT)) {
    v108 &= 2u;
  }
  if (v108)
  {
    v110 = objc_opt_class();
    int v146 = 138412290;
    v147 = v110;
    id v111 = v110;
    LODWORD(v117) = 12;
    v112 = (void *)_os_log_send_and_compose_impl();

    if (v112)
    {
      v109 = objc_msgSend(NSString, "stringWithCString:encoding:", v112, 4, &v146, v117);
      free(v112);
      SSFileLog();
      goto LABEL_158;
    }
  }
  else
  {
LABEL_158:
  }
  v113 = ISError(0, 0, 0);
  [(ISOperation *)self setError:v113];

  BOOL v27 = v19;
  objc_super v7 = v106;
LABEL_160:
}

- (BOOL)shouldFollowRedirectWithRequest:(id)a3 returningError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(ISStoreURLOperation *)self urlKnownToBeTrusted])
  {
    char v7 = 1;
  }
  else
  {
    char v8 = [(ISStoreURLOperation *)self URLBagContext];
    int v9 = [(ISOperation *)self loadedURLBagWithContext:v8 returningError:0];
    uint64_t v10 = [v6 URL];
    char v7 = [v9 urlIsTrusted:v10];

    if ((v7 & 1) == 0)
    {
      char v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v11)
      {
        char v11 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      uint64_t v14 = [v11 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        int v15 = v13;
      }
      else {
        int v15 = v13 & 2;
      }
      if (v15)
      {
        id v24 = v9;
        int v16 = v8;
        id v17 = objc_opt_class();
        id v23 = v17;
        BOOL v18 = [v6 URL];
        [(ISURLOperation *)self _sanitizedURLForURL:v18];
        int v25 = 138412546;
        char v26 = v17;
        char v8 = v16;
        int v9 = v24;
        __int16 v27 = 2112;
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = 22;
        id v19 = (void *)_os_log_send_and_compose_impl();

        if (v19)
        {
          id v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v25, v22);
          free(v19);
          SSFileLog();
        }
      }
      else
      {
      }
      if (a4)
      {
        ISError(3, 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v7;
}

- (void)_willSendRequest:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ISURLOperation *)self _requestProperties];
  int64_t activeMachineDataStyle = self->_activeMachineDataStyle;
  if (activeMachineDataStyle == 3)
  {
    SSVAnisetteAddHeadersToURLRequest();
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  if (activeMachineDataStyle != 2)
  {
    if (activeMachineDataStyle == 1)
    {
      char v7 = [(ISStoreURLOperation *)self _account];
      char v8 = v7;
      if (v7)
      {
        int v9 = [v7 uniqueIdentifier];
        [v9 unsignedLongLongValue];
        SSVAnisetteAddHeadersToURLRequest();
      }
    }
    goto LABEL_8;
  }
  uint64_t v10 = [(ISStoreURLOperation *)self _loadURLBagInterpreterWithRequest:v4 requestProperties:v5];
  id v24 = [v4 URL];
  int v25 = [v10 shouldSendAnonymousMachineIdentifierForURL:v24];

  if (v25) {
    SSVAnisetteAddHeadersToURLRequest();
  }
LABEL_9:
  char v11 = [(ISStoreURLOperation *)self _absintheHeaders];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __40__ISStoreURLOperation__willSendRequest___block_invoke;
  v50[3] = &unk_264260E28;
  id v12 = v4;
  id v51 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v50];
  int v13 = [(ISStoreURLOperation *)self SAPSession];
  if (v13)
  {
    if (!v10)
    {
      uint64_t v10 = [(ISStoreURLOperation *)self _loadURLBagInterpreterWithRequest:v12 requestProperties:v5];
    }
    uint64_t v14 = [v12 URL];
    int v15 = [v10 mescalSignaturePolicyForRequestURL:v14];

    if (v15 && [v15 policyType])
    {
      int v16 = [v15 dataToSignWithURLRequest:v12];
      id v17 = [(ISStoreURLOperation *)self SAPSession];
      BOOL v18 = [v17 signatureWithData:v16 error:0];

      if (v18)
      {
        id v19 = [v18 base64EncodedStringWithOptions:0];
        [v12 setValue:v19 forHTTPHeaderField:*MEMORY[0x263F7B7B0]];
      }
    }
  }
  if ([(ISStoreURLOperation *)self shouldSendAKClientInfoHeaders]) {
    objc_msgSend(v12, "ak_addClientInfoHeader");
  }
  if ([(ISStoreURLOperation *)self shouldSendAKPRKRequestHeader]) {
    objc_msgSend(v12, "ak_addPRKRequestHeader");
  }
  if ((SSIsDaemon() & 1) != 0 || ISBiometricsHasEntitlement(@"adi-client"))
  {
    id v20 = [(ISStoreURLOperation *)self biometricAuthenticationContext];
    id v21 = [(ISURLOperation *)self _accountIdentifier];
    if (v21)
    {
      uint64_t v22 = [v20 signature];
      BOOL v23 = v22 != 0;

      ISBiometricsAddHeadersForTouchIDRequestToURLRequest(v12, v21, v23, [v20 isExtendedAction], 0);
      if ([v20 shouldSendFallbackHeader])
      {
        [v12 setValue:@"FB" forHTTPHeaderField:*MEMORY[0x263F7B810]];
      }
      else
      {
        int v30 = [v20 signature];

        if (v30)
        {
          BOOL v42 = v13;
          v46 = v5;
          v45 = [v20 challenge];
          int v44 = [v20 signature];
          id v48 = [v20 paymentTokenData];
          uint64_t v47 = [v20 fpanID];
          unsigned int v41 = [v20 isExtendedAction];
          char v40 = [v20 isPayment];
          v43 = [(ISStoreURLOperation *)self biometricSessionDelegate];
          id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v32 = [v12 allHTTPHeaderFields];
          uint64_t v33 = *MEMORY[0x263F7B798];
          objc_super v34 = [v32 objectForKeyedSubscript:*MEMORY[0x263F7B798]];

          if (v34)
          {
            [v20 setXAppleAMDHeader:v34];
            [v31 setObject:v34 forKeyedSubscript:v33];
          }
          v49 = v31;
          BOOL v35 = [v12 allHTTPHeaderFields];
          uint64_t v36 = *MEMORY[0x263F7B7A0];
          int v37 = [v35 objectForKeyedSubscript:*MEMORY[0x263F7B7A0]];

          if (v37)
          {
            [v20 setXAppleAMDMHeader:v37];
            [v49 setObject:v37 forKeyedSubscript:v36];
          }
          if (objc_opt_respondsToSelector())
          {
            LOBYTE(v38) = v40;
            [v43 sender:self willSendChallenge:v45 andSignature:v44 andPaymentTokenData:v48 andFpanID:v47 isExtendedAction:v41 isPayment:v38 additionalHeaders:v49];
          }
          ISBiometricsAddHeadersForTouchIDSignatureToURLRequest(v12, (uint64_t)v45, v44);
          [v20 setChallenge:0];
          [v20 setSignature:0];

          id v5 = v46;
          int v13 = v42;
        }
      }
    }
    goto LABEL_46;
  }
  id v20 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v20)
  {
    id v20 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v26 = [v20 shouldLog];
  if ([v20 shouldLogToDisk]) {
    v26 |= 2u;
  }
  id v21 = [v20 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    v26 &= 2u;
  }
  if (!v26) {
    goto LABEL_46;
  }
  __int16 v27 = objc_opt_class();
  int v52 = 138412290;
  int v53 = v27;
  id v28 = v27;
  LODWORD(v39) = 12;
  uint64_t v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v52, v39);
    free(v29);
    SSFileLog();
LABEL_46:
  }
}

uint64_t __40__ISStoreURLOperation__willSendRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)sender:(id)a3 didFallbackToPassword:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ISStoreURLOperation *)self biometricSessionDelegate];
  [v6 sender:self didFallbackToPassword:v4];
}

- (id)_ssBag_copyGUIDSchemesFromBag:(id)a3
{
  id v3 = [a3 dictionaryForKey:@"guid-urls" error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 objectForKey:@"schemes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    }
    id v6 = v5;

    if (!v6) {
      goto LABEL_8;
    }
LABEL_5:
    char v7 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v6];
    goto LABEL_9;
  }
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"https", 0);
  if (v6) {
    goto LABEL_5;
  }
LABEL_8:
  char v7 = 0;
LABEL_9:

  return v7;
}

- (id)_ssBag_copyGUIDPatternsFromBag:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v20 = 0;
  id v5 = [v3 dictionaryForKey:@"guid-urls" error:&v20];
  id v6 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v6)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"/WebObjects/MZ(Buy|Finance|FastFinance)[.]woa/" options:1 error:0];
    if (v7) {
      [v4 addObject:v7];
    }
  }
  else
  {
    id v7 = [v5 objectForKey:@"regex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = v7;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            id v13 = objc_alloc(MEMORY[0x263F08AE8]);
            uint64_t v14 = objc_msgSend(v13, "initWithPattern:options:error:", v12, 1, 0, (void)v16);
            if (v14) {
              [v4 addObject:v14];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }
    }
  }

  return v4;
}

- (BOOL)_ssBag_shouldSendGUIDForURL:(id)a3 withBag:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (SSDebugAlwaysSendGUID())
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(ISStoreURLOperation *)self _ssBag_copyGUIDPatternsFromBag:v7];
    uint64_t v10 = [(ISStoreURLOperation *)self _ssBag_copyGUIDSchemesFromBag:v7];
    char v11 = [v6 scheme];
    int v12 = [v10 containsObject:v11];

    if (v12)
    {
      if ([v9 count])
      {
        id v13 = [v6 absoluteString];
        uint64_t v14 = [v13 length];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v15 = v9;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          id v21 = v9;
          uint64_t v18 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              if (objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v13, 0, 0, v14) != 0x7FFFFFFFFFFFFFFFLL)
              {
                BOOL v8 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v17) {
              continue;
            }
            break;
          }
          BOOL v8 = 0;
LABEL_16:
          uint64_t v9 = v21;
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 1;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (id)_ssBag_copyHeaderPatternsFromBag:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [v3 arrayForKey:@"send-content-restrictions-header" error:0];
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x263F08AE8]);
          uint64_t v14 = objc_msgSend(v13, "initWithPattern:options:error:", v12, 1, 0, (void)v16);
          if (v14) {
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      [v4 setObject:v6 forKey:@"X-Apple-Restrictions"];
    }
  }
  if (![v4 count])
  {

    id v4 = 0;
  }

  return v4;
}

+ (id)_ssBag_copyExtraHeadersForURL:(id)a3 bag:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_msgSend(a1, "_ssBag_copyHeaderPatternsFromBag:", a4);
  if (v7)
  {
    id v20 = v6;
    uint64_t v8 = [v6 absoluteString];
    uint64_t v9 = [v8 length];
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v7;
    uint64_t v23 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v10);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v13 = [v10 objectForKey:v12];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, v9) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  [v21 addObject:v12];
                  goto LABEL_17;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v23 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v23);
    }

    id v6 = v20;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (v15)
  {
    uint64_t v17 = [MEMORY[0x263F7B0E8] defaultStore];
    long long v18 = [v17 accountWithUniqueIdentifier:v15];

    id v19 = v23;
    if (v18) {
      goto LABEL_6;
    }
    uint64_t v20 = *MEMORY[0x263F7B7C0];
    id v21 = [v23 valueForHTTPHeaderField:*MEMORY[0x263F7B7C0]];

    if (!v21)
    {
      uint64_t v22 = [v15 stringValue];
      [v23 setValue:v22 forHTTPHeaderField:v20];
    }
  }
  long long v18 = 0;
  id v19 = v23;
LABEL_6:
  [a1 _addiTunesStoreHeadersToRequest:v19 withSSBag:v14 account:v18 appendAuthKitHeaders:v10 appendStorefrontToURL:v9 clientBundleIdentifier:v16];
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withSSBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = [v17 URL];
  objc_msgSend(a1, "_ssBag_copyExtraHeadersForURL:bag:", v18, v16);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  id v19 = [v16 stringForKey:@"storefront-header-suffix" error:0];

  [a1 _addiTunesStoreHeadersToRequest:v17 withAccount:v15 appendAuthKitHeaders:v9 appendStorefrontToURL:v8 clientBundleIdentifier:v14 extraHeaders:v20 storefrontSuffix:v19];
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 accountIdentifier:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if (v15)
  {
    id v17 = [MEMORY[0x263F7B0E8] defaultStore];
    long long v18 = [v17 accountWithUniqueIdentifier:v15];

    id v19 = v23;
    if (v18) {
      goto LABEL_6;
    }
    uint64_t v20 = *MEMORY[0x263F7B7C0];
    id v21 = [v23 valueForHTTPHeaderField:*MEMORY[0x263F7B7C0]];

    if (!v21)
    {
      uint64_t v22 = [v15 stringValue];
      [v23 setValue:v22 forHTTPHeaderField:v20];
    }
  }
  long long v18 = 0;
  id v19 = v23;
LABEL_6:
  [a1 _addiTunesStoreHeadersToRequest:v19 withURLBag:v14 account:v18 appendAuthKitHeaders:v10 appendStorefrontToURL:v9 clientBundleIdentifier:v16];
}

- (void)_setStoreFrontIdentifier:(id)a3 isTransient:(BOOL)a4
{
  id v5 = (void *)MEMORY[0x263F7B148];
  id v6 = a3;
  id v8 = [v5 currentDevice];
  id v7 = [(ISStoreURLOperation *)self _account];
  [v8 setStoreFrontIdentifier:v6 account:v7];
}

- (id)_absintheHeaders
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = [(ISStoreURLOperation *)self logKey];
  id v4 = (id)AMSSetLogKey();

  id v5 = [(ISStoreURLOperation *)self bag];

  if (v5)
  {
    id v6 = [ISAMSBagShim alloc];
    id v7 = [(ISStoreURLOperation *)self bag];
    id v8 = [(ISAMSBagShim *)v6 initWithBag:v7];
  }
  else
  {
    BOOL v9 = [(ISStoreURLOperation *)self URLBagContext];
    id v7 = [(ISStoreURLOperation *)self _urlBagForContext:v9];

    id v8 = [[ISAMSBagShim alloc] initWithURLBag:v7];
  }
  BOOL v10 = v8;

  char v11 = [(ISStoreURLOperation *)self _buyParams];
  if (v11) {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F27B80]) initWithString:v11];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = (void *)MEMORY[0x263F27AD0];
  id v14 = [(ISURLOperation *)self activeURLRequest];
  id v15 = [v13 headersForRequest:v14 buyParams:v12 bag:v10];
  id v27 = 0;
  id v16 = [v15 resultWithError:&v27];
  id v17 = v27;

  if (v17)
  {
    long long v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    if (!v18)
    {
      long long v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      v20 &= 2u;
    }
    if (v20)
    {
      uint64_t v22 = objc_opt_class();
      id v23 = AMSLogKey();
      int v28 = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      long long v31 = v23;
      __int16 v32 = 2114;
      id v33 = v17;
      LODWORD(v26) = 32;
      long long v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v28, v26);
      free(v24);
      SSFileLog();
    }

    goto LABEL_19;
  }
LABEL_20:

  return v16;
}

+ (void)_addAccountDSID:(id)a3 toRequest:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x263F7B7C0];
  id v7 = [v5 valueForHTTPHeaderField:*MEMORY[0x263F7B7C0]];

  if (!v7)
  {
    id v8 = [v11 uniqueIdentifier];
    BOOL v9 = v8;
    if (v8 && [v8 unsignedLongLongValue])
    {
      BOOL v10 = [v9 stringValue];
      [v5 setValue:v10 forHTTPHeaderField:v6];
    }
  }
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withAccount:(id)a4 appendAuthKitHeaders:(BOOL)a5 appendStorefrontToURL:(BOOL)a6 clientBundleIdentifier:(id)a7 extraHeaders:(id)a8 storefrontSuffix:(id)a9
{
  BOOL v11 = a6;
  BOOL v97 = a5;
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v101 = a7;
  id v96 = a8;
  id v102 = a9;
  [a1 _addAccountDSID:v15 toRequest:v14];
  [a1 _addPrimaryiCloudDSIDToRequest:v14];
  id v103 = v15;
  id v16 = +[ISStoreURLOperation _storeFrontIdentifierForAccount:v15];
  unint64_t v17 = 0x263F7B000uLL;
  long long v18 = [MEMORY[0x263F7B1F8] sharedAccountsStorefrontConfig];
  if (!v18)
  {
    long long v18 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  id v21 = [v18 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    int v22 = v20;
  }
  else {
    int v22 = v20 & 2;
  }
  if (v22)
  {
    id v23 = objc_opt_class();
    id v94 = v23;
    [v14 URL];
    long long v24 = v98 = v11;
    SSHashIfNeeded();
    uint64_t v26 = v25 = v16;
    id v27 = [v103 hashedDescription];
    int v119 = 138544130;
    unsigned int v120 = v23;
    __int16 v121 = 2114;
    v122 = v24;
    __int16 v123 = 2114;
    uint64_t v124 = v26;
    __int16 v125 = 2114;
    uint64_t v126 = v27;
    LODWORD(v93) = 42;
    v92 = &v119;
    int v28 = (void *)_os_log_send_and_compose_impl();

    id v16 = v25;
    unint64_t v17 = 0x263F7B000;

    BOOL v11 = v98;
    if (v28)
    {
      objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v119, v93);
      uint64_t v29 = (int *)objc_claimAutoreleasedReturnValue();
      free(v28);
      v92 = v29;
      SSFileLog();
    }
  }
  else
  {
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v30 = *MEMORY[0x263F7B808];
    long long v31 = [v14 valueForHTTPHeaderField:*MEMORY[0x263F7B808]];
    if (!v31)
    {
      if ([v102 length])
      {
        unsigned int v41 = v102;
      }
      else
      {
        id v42 = v101;
        if (!v101)
        {
          v43 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v44 = [v43 bundleIdentifier];

          id v42 = (id)v44;
        }
        id v101 = v42;
        unsigned int v41 = +[ISLoadURLBagOperation storeFrontHeaderSuffixForBundleIdentifier:v92];
      }
      id v102 = v41;
      if (objc_msgSend(v41, "length", v92))
      {
        uint64_t v45 = [v16 stringByAppendingString:v41];

        id v16 = (void *)v45;
      }
      id v40 = v16;
      id v16 = (void *)[v16 copy];
      [v14 setValue:v16 forHTTPHeaderField:v30];
      goto LABEL_35;
    }
    __int16 v32 = [*(id *)(v17 + 504) sharedAccountsStorefrontConfig];
    if (!v32)
    {
      __int16 v32 = [*(id *)(v17 + 504) sharedConfig];
    }
    int v33 = objc_msgSend(v32, "shouldLog", v92);
    if ([v32 shouldLogToDisk]) {
      v33 |= 2u;
    }
    uint64_t v34 = [v32 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      int v35 = v33;
    }
    else {
      int v35 = v33 & 2;
    }
    if (v35)
    {
      uint64_t v36 = objc_opt_class();
      id v99 = v36;
      SSHashIfNeeded();
      uint64_t v38 = v37 = v11;
      int v119 = 138543618;
      unsigned int v120 = v36;
      __int16 v121 = 2114;
      v122 = v38;
      LODWORD(v93) = 22;
      v92 = &v119;
      uint64_t v39 = (void *)_os_log_send_and_compose_impl();

      BOOL v11 = v37;
      if (!v39)
      {
LABEL_26:

        id v40 = v31;
        unint64_t v17 = 0x263F7B000;
LABEL_35:

        id v16 = v40;
        goto LABEL_36;
      }
      uint64_t v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v119, v93);
      free(v39);
      v92 = (int *)v34;
      SSFileLog();
    }

    goto LABEL_26;
  }
LABEL_36:
  if (!v11) {
    goto LABEL_49;
  }
  v46 = [*(id *)(v17 + 504) sharedAccountsStorefrontConfig];
  if (!v46)
  {
    v46 = [*(id *)(v17 + 504) sharedConfig];
  }
  int v47 = objc_msgSend(v46, "shouldLog", v92);
  if ([v46 shouldLogToDisk]) {
    v47 |= 2u;
  }
  id v48 = [v46 OSLogObject];
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    int v49 = v47;
  }
  else {
    int v49 = v47 & 2;
  }
  if (!v49) {
    goto LABEL_47;
  }
  v50 = objc_opt_class();
  int v119 = 138543362;
  unsigned int v120 = v50;
  id v51 = v50;
  LODWORD(v93) = 12;
  v92 = &v119;
  int v52 = (void *)_os_log_send_and_compose_impl();

  if (v52)
  {
    id v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v52, 4, &v119, v93);
    free(v52);
    v92 = (int *)v48;
    SSFileLog();
LABEL_47:
  }
  [a1 _appendStorefront:v16 toRequestURL:v14];
LABEL_49:
  int v53 = +[ISClient currentClient];
  uint64_t v54 = [v53 partnerHeader];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v55 = (void *)[v54 copy];
    [v14 setValue:v55 forHTTPHeaderField:@"X-Apple-Partner"];
  }
  v56 = +[ISNetworkObserver sharedInstance];
  long long v57 = [v56 connectionTypeHeader];

  if ([v57 length])
  {
    long long v58 = (void *)[v57 copy];
    [v14 setValue:v58 forHTTPHeaderField:@"X-Apple-Connection-Type"];
  }
  if (SSIsAppStoreDaemon())
  {
    long long v59 = v57;
  }
  else
  {
    long long v60 = [MEMORY[0x263F7B148] currentDevice];
    long long v59 = [v60 softwareLibraryIdentifier];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v61 = (void *)[v59 copy];
      [v14 setValue:v61 forHTTPHeaderField:*MEMORY[0x263F7B800]];
    }
  }
  objc_super v62 = [v53 appleClientApplication];

  if (v62)
  {
    v63 = (void *)[v62 copy];
    [v14 setValue:v63 forHTTPHeaderField:*MEMORY[0x263F7B7B8]];
  }
  char v64 = [v53 appleClientVersions];

  if ([v64 length])
  {
    id v65 = (void *)[v64 copy];
    [v14 setValue:v65 forHTTPHeaderField:@"X-Apple-Client-Versions"];
  }
  int v100 = v16;
  v95 = v53;
  v66 = [v53 clientProvidedHeaders];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v67 = [v66 allKeys];
    uint64_t v68 = [v67 countByEnumeratingWithState:&v112 objects:v118 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v113 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void *)(*((void *)&v112 + 1) + 8 * i);
          id v73 = [v66 objectForKeyedSubscript:v72];
          v74 = (void *)[v73 copy];
          [v14 setValue:v74 forHTTPHeaderField:v72];
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v112 objects:v118 count:16];
      }
      while (v69);
    }
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v75 = v96;
  uint64_t v76 = [v75 countByEnumeratingWithState:&v108 objects:v117 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v109;
    do
    {
      for (uint64_t j = 0; j != v77; ++j)
      {
        if (*(void *)v109 != v78) {
          objc_enumerationMutation(v75);
        }
        if ([*(id *)(*((void *)&v108 + 1) + 8 * j) isEqualToString:@"X-Apple-Restrictions"])
        {
          v80 = [a1 _restrictionsHeaderValue];
          if ([v80 length])
          {
            int v81 = (void *)[v80 copy];
            [v14 setValue:v81 forHTTPHeaderField:@"X-Apple-Restrictions"];
          }
        }
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v108 objects:v117 count:16];
    }
    while (v77);
  }

  if (v97)
  {
    v82 = +[ISStoreURLOperation _authKitSession];
    v83 = [v82 appleIDHeadersForRequest:v14];

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v84 = v83;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v104 objects:v116 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v105;
      do
      {
        for (uint64_t k = 0; k != v86; ++k)
        {
          if (*(void *)v105 != v87) {
            objc_enumerationMutation(v84);
          }
          uint64_t v89 = *(void *)(*((void *)&v104 + 1) + 8 * k);
          v90 = [v84 objectForKeyedSubscript:v89];
          v91 = (void *)[v90 copy];
          [v14 setValue:v91 forHTTPHeaderField:v89];
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v104 objects:v116 count:16];
      }
      while (v86);
    }
  }
}

+ (void)_addiTunesStoreHeadersToRequest:(id)a3 withURLBag:(id)a4 account:(id)a5 appendAuthKitHeaders:(BOOL)a6 appendStorefrontToURL:(BOOL)a7 clientBundleIdentifier:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  long long v18 = [v17 URL];
  id v20 = (id)[v16 copyExtraHeadersForURL:v18];

  int v19 = [v16 valueForKey:@"storefront-header-suffix"];

  [a1 _addiTunesStoreHeadersToRequest:v17 withAccount:v15 appendAuthKitHeaders:v9 appendStorefrontToURL:v8 clientBundleIdentifier:v14 extraHeaders:v20 storefrontSuffix:v19];
}

+ (void)_addPrimaryiCloudDSIDToRequest:(id)a3
{
  id v7 = a3;
  id v3 = [MEMORY[0x263F7B378] sharedAccountStore];
  id v4 = [v3 primaryAppleAccount];

  id v5 = objc_msgSend(v4, "aa_personID");
  if ([v5 length])
  {
    uint64_t v6 = (void *)[v5 copy];
    [v7 setValue:v6 forHTTPHeaderField:*MEMORY[0x263F7B780]];
  }
}

+ (void)_appendStorefront:(id)a3 toRequestURL:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 URL];
  if (objc_msgSend(v6, "_ss_hasQueryParameter:", @"storefront"))
  {
    uint64_t v7 = objc_msgSend(v6, "_ss_URLByRemovingQueryParameter:", @"storefront");

    uint64_t v6 = (void *)v7;
  }
  if ([v9 length])
  {
    uint64_t v8 = [v6 URLByAppendingQueryParameter:@"storefront" value:v9];

    uint64_t v6 = (void *)v8;
  }
  [v5 setURL:v6];
}

- (void)_applyAnalyticsCookiesToRequest:(id)a3 withBag:(id)a4 oldBag:(id)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v9)
  {
    uint64_t v12 = *MEMORY[0x263F7BBD0];
    id v75 = 0;
    id v13 = [v9 dictionaryForKey:v12 error:&v75];
    id v14 = v75;
    id v74 = v14;
    id v15 = [v9 arrayForKey:@"clientIDDomains" error:&v74];
    id v16 = v74;
  }
  else
  {
    if (v10)
    {
      id v17 = [v10 valueForKey:*MEMORY[0x263F7BBD0]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v13 = v17;
      }
      else {
        id v13 = 0;
      }

      long long v18 = [v11 valueForKey:@"clientIDDomains"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = v18;
      }
      else {
        id v15 = 0;
      }
    }
    else
    {
      id v13 = 0;
      id v15 = 0;
    }
    id v16 = 0;
  }
  int v19 = [v13 objectForKey:@"metricsUrl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  id v69 = v20;
  if (v20)
  {
    uint64_t v63 = [NSURL URLWithString:v20];
    if (v63)
    {
      id v64 = v15;
      if (!v16 && [v15 count])
      {
        id v61 = v13;
        uint64_t v68 = v11;
        id v59 = v9;
        id v40 = [(ISURLOperation *)self _requestProperties];
        [v40 URLBagType];
        uint64_t v41 = SSAccountScopeForURLBagType();

        id v42 = [MEMORY[0x263F7B380] sharedStorage];
        v43 = [(ISURLOperation *)self _accountIdentifier];
        uint64_t v44 = [v42 cookieHeadersForURL:v63 userIdentifier:v43 scope:v41];

        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v21 = v44;
        uint64_t v45 = [v21 countByEnumeratingWithState:&v70 objects:v76 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v46; ++i)
            {
              if (*(void *)v71 != v47) {
                objc_enumerationMutation(v21);
              }
              int v49 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              v50 = [v49 lowercaseString];
              int v51 = [v50 isEqualToString:@"cookie"];

              if (v51)
              {
                int v52 = [v8 valueForHTTPHeaderField:v49];
                int v53 = (void *)[v52 mutableCopy];
                uint64_t v54 = v53;
                if (v53) {
                  id v55 = v53;
                }
                else {
                  id v55 = objc_alloc_init(MEMORY[0x263F089D8]);
                }
                v56 = v55;

                if ([v56 length]) {
                  [v56 appendString:@"; "];
                }
                long long v57 = [v21 objectForKeyedSubscript:v49];
                [v56 appendString:v57];

                [v8 setValue:v56 forHTTPHeaderField:v49];
              }
            }
            uint64_t v46 = [v21 countByEnumeratingWithState:&v70 objects:v76 count:16];
          }
          while (v46);
        }

        id v9 = v59;
        id v13 = v61;
        id v15 = v64;
        BOOL v11 = v68;
        goto LABEL_59;
      }
      id v21 = [MEMORY[0x263F7B1F8] sharedConfig];
      if (!v21)
      {
        id v21 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v22 = [v21 shouldLog];
      if ([v21 shouldLogToDisk]) {
        v22 |= 2u;
      }
      id v23 = [v21 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        int v24 = v22;
      }
      else {
        int v24 = v22 & 2;
      }
      if (v24)
      {
        id v60 = v13;
        v66 = v11;
        long long v25 = objc_opt_class();
        id v26 = v25;
        id v27 = [(ISStoreURLOperation *)self logKey];
        int v77 = 138543874;
        uint64_t v78 = v25;
        __int16 v79 = 2114;
        v80 = v27;
        __int16 v81 = 2114;
        id v82 = v16;
        LODWORD(v58) = 32;
        int v28 = (void *)_os_log_send_and_compose_impl();

        if (!v28)
        {
          id v15 = v64;
          BOOL v11 = v66;
          id v13 = v60;
          goto LABEL_59;
        }
        id v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v77, v58);
        free(v28);
        SSFileLog();
        BOOL v11 = v66;
        id v13 = v60;
      }
      id v15 = v64;

LABEL_59:
      uint64_t v39 = v69;
      uint64_t v38 = (void *)v63;
      goto LABEL_60;
    }
  }
  v67 = v11;
  uint64_t v29 = [MEMORY[0x263F7B1F8] sharedConfig];
  if (!v29)
  {
    uint64_t v29 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v30 = [v29 shouldLog];
  if ([v29 shouldLogToDisk]) {
    v30 |= 2u;
  }
  long long v31 = v29;
  id v21 = [v29 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    int v32 = v30;
  }
  else {
    int v32 = v30 & 2;
  }
  if (!v32)
  {
    uint64_t v38 = v31;
    BOOL v11 = v67;
    uint64_t v39 = v69;
    goto LABEL_60;
  }
  id v62 = v16;
  id v65 = v15;
  id v33 = v13;
  uint64_t v34 = objc_opt_class();
  id v35 = v34;
  uint64_t v36 = [(ISStoreURLOperation *)self logKey];
  int v77 = 138543618;
  uint64_t v78 = v34;
  __int16 v79 = 2114;
  v80 = v36;
  LODWORD(v58) = 22;
  BOOL v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v77, v58);
    free(v37);
    uint64_t v38 = v31;
    SSFileLog();
    id v13 = v33;
    id v15 = v65;
    BOOL v11 = v67;
    id v16 = v62;
    uint64_t v39 = v69;
LABEL_60:

    goto LABEL_61;
  }
  id v13 = v33;
  id v16 = v62;
  uint64_t v39 = v69;
  uint64_t v38 = v31;
  id v15 = v65;
  BOOL v11 = v67;
LABEL_61:
}

+ (id)_restrictionsHeaderValue
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBParentalControlsEnabled", @"com.apple.springboard", 0);
  BOOL v4 = AppBooleanValue != 0;
  id v5 = SSRestrictionsCopyRankForMediaType();
  uint64_t v6 = v5;
  if (v5)
  {
    if (AppBooleanValue)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v7 = [v5 integerValue];
      BOOL v4 = v7 != *MEMORY[0x263F7BC58];
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"apps=%ld", objc_msgSend(v6, "longValue"));
    [v2 addObject:v8];
  }
  id v9 = SSRestrictionsCopyRankForMediaType();

  if (v9)
  {
    if (v4)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v10 = [v9 integerValue];
      BOOL v4 = v10 != *MEMORY[0x263F7BC58];
    }
    BOOL v11 = objc_msgSend(NSString, "stringWithFormat:", @"movies=%ld", objc_msgSend(v9, "longValue"));
    [v2 addObject:v11];
  }
  uint64_t v12 = SSRestrictionsCopyRankForMediaType();

  if (v12)
  {
    if (v4)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v13 = [v12 integerValue];
      BOOL v4 = v13 != *MEMORY[0x263F7BC58];
    }
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"tv=%ld", objc_msgSend(v12, "longValue"));
    [v2 addObject:v14];
  }
  id v15 = [MEMORY[0x263F53C50] sharedConnection];
  int v16 = [v15 effectiveRestrictedBoolValueForSetting:*MEMORY[0x263F538B8]];

  if (v16 == 2) {
    id v17 = @"explicit=off";
  }
  else {
    id v17 = @"explicit=on";
  }
  [v2 addObject:v17];
  long long v18 = [MEMORY[0x263F53C50] sharedConnection];
  int v19 = [v18 effectiveRestrictedBoolValueForSetting:*MEMORY[0x263F53938]];

  if (v19 == 2)
  {
    [v2 addObject:@"in-app=off"];
LABEL_25:
    id v21 = [v2 componentsJoinedByString:@";"];
    goto LABEL_27;
  }
  int v20 = v16 == 2 || v4;
  [v2 addObject:@"in-app=on"];
  if (v20 == 1) {
    goto LABEL_25;
  }
  id v21 = 0;
LABEL_27:

  return v21;
}

- (id)_account
{
  id v3 = [MEMORY[0x263F7B0E8] defaultStore];
  BOOL v4 = [(ISURLOperation *)self _accountIdentifier];
  id v5 = [(ISURLOperation *)self _requestProperties];
  [v5 URLBagType];
  uint64_t v6 = SSAccountScopeForURLBagType();

  if (v6 == 1)
  {
    if (v4
      || ([v3 activeSandboxAccount],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 uniqueIdentifier],
          BOOL v4 = objc_claimAutoreleasedReturnValue(),
          v7,
          v4))
    {
      uint64_t v8 = [v3 accountWithUniqueIdentifier:v4 scope:1];
LABEL_8:
      uint64_t v10 = (void *)v8;
      goto LABEL_9;
    }
  }
  else if (v4 {
         || ([v3 activeAccount],
  }
             id v9 = objc_claimAutoreleasedReturnValue(),
             [v9 uniqueIdentifier],
             BOOL v4 = objc_claimAutoreleasedReturnValue(),
             v9,
             v4))
  {
    uint64_t v8 = [v3 accountWithUniqueIdentifier:v4];
    goto LABEL_8;
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (void)_addStandardQueryParametersForURL:(id)a3
{
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v4 = [(ISURLOperation *)self _requestProperties];
  id v5 = [v4 requestParameters];
  if (SSDebugShouldSendCacheBuster())
  {
    uint64_t v6 = [v5 objectForKey:@"buster"];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x263F08C38] UUID];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = [v7 UUIDString];
        if (v9) {
          [v11 setObject:v9 forKey:@"buster"];
        }
      }
    }
  }
  if ([v11 count])
  {
    id v10 = (id)[v5 mutableCopy];
    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v10 addEntriesFromDictionary:v11];
    [v4 setRequestParameters:v10];
  }
}

+ (id)_authKitSession
{
  if (_authKitSession_sOnce != -1) {
    dispatch_once(&_authKitSession_sOnce, &__block_literal_global_7);
  }
  id v2 = (void *)_authKitSession__authKitSession;

  return v2;
}

uint64_t __38__ISStoreURLOperation__authKitSession__block_invoke()
{
  _authKitSession__authKitSession = (uint64_t)objc_alloc_init(MEMORY[0x263F29120]);

  return MEMORY[0x270F9A758]();
}

- (BOOL)_authenticateWithContext:(id)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v39 = a3;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = __Block_byref_object_copy__3;
  id v60 = __Block_byref_object_dispose__3;
  id v61 = 0;
  uint64_t v52 = 0;
  int v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 1;
  id v40 = [(ISOperation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    int v8 = [v6 shouldLogToDisk];
    id v9 = [v6 OSLogObject];
    id v10 = v9;
    if (v8) {
      v7 |= 2u;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v7;
    }
    else {
      int v11 = v7 & 2;
    }
    if (v11)
    {
      id v12 = (id)objc_opt_class();
      uint64_t v13 = [(ISStoreURLOperation *)self logKey];
      int v66 = 138543618;
      id v67 = v12;
      __int16 v68 = 2114;
      id v69 = v13;
      LODWORD(v37) = 22;
      uint64_t v36 = &v66;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke;
        v47[3] = &unk_264260E50;
        v47[4] = self;
        int v49 = &v62;
        v50 = &v56;
        int v51 = &v52;
        int v16 = v15;
        id v48 = v16;
        [v40 operation:self shouldAuthenticateWithContext:v39 responseHandler:v47];
        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_14;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v66, v37);
      free(v14);
      uint64_t v36 = (int *)v10;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (!*((unsigned char *)v53 + 24))
  {
    id v32 = 0;
    if (!*((unsigned char *)v63 + 24)) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  id v17 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  if (!v17)
  {
    id v17 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v18 = objc_msgSend(v17, "shouldLog", v36);
  int v19 = [v17 shouldLogToDisk];
  int v20 = [v17 OSLogObject];
  id v21 = v20;
  if (v19) {
    v18 |= 2u;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    int v22 = v18;
  }
  else {
    int v22 = v18 & 2;
  }
  if (!v22) {
    goto LABEL_29;
  }
  id v23 = (id)objc_opt_class();
  id v24 = [(ISStoreURLOperation *)self logKey];
  long long v25 = [(ISURLOperation *)self requestProperties];
  id v26 = [v25 URL];
  id v27 = v26;
  if (!v26)
  {
    BOOL v4 = [(ISURLOperation *)self requestProperties];
    id v27 = [v4 URLBagKey];
  }
  int v66 = 138543874;
  id v67 = v23;
  __int16 v68 = 2114;
  id v69 = v24;
  __int16 v70 = 2114;
  long long v71 = v27;
  LODWORD(v37) = 32;
  uint64_t v36 = &v66;
  int v28 = (void *)_os_log_send_and_compose_impl();
  if (!v26)
  {
  }
  if (v28)
  {
    id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v66, v37);
    free(v28);
    uint64_t v36 = (int *)v21;
    SSFileLog();
LABEL_29:
  }
  int v30 = (id *)(v57 + 5);
  uint64_t v29 = (void *)v57[5];
  id v45 = 0;
  obuint64_t j = v29;
  BOOL v31 = [(ISOperation *)self copyAccountID:&obj credentialSource:0 byAuthenticatingWithContext:v39 returningError:&v45];
  objc_storeStrong(v30, obj);
  id v32 = v45;
  *((unsigned char *)v63 + 24) = v31;
  if (!v31) {
    goto LABEL_35;
  }
LABEL_33:
  -[ISStoreURLOperation setAuthenticatedDSID:](self, "setAuthenticatedDSID:", v57[5], v36);
  if (objc_opt_respondsToSelector())
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke_177;
    v41[3] = &unk_264260DB8;
    id v42 = v40;
    v43 = self;
    uint64_t v44 = &v56;
    [(ISOperation *)self delegateDispatch:v41];
  }
LABEL_35:
  int v33 = *((unsigned __int8 *)v63 + 24);
  if (a4 && !*((unsigned char *)v63 + 24))
  {
    *a4 = v32;
    int v33 = *((unsigned __int8 *)v63 + 24);
  }
  BOOL v34 = v33 != 0;

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  return v34;
}

void __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = 0x263F7B000uLL;
  if (v5)
  {
    int v8 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v8)
    {
      int v8 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      v9 |= 2u;
    }
    id v10 = [v8 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      id v46 = v5;
      id v12 = (id)objc_opt_class();
      uint64_t v13 = [*(id *)(a1 + 32) logKey];
      id v14 = [*(id *)(a1 + 32) requestProperties];
      dispatch_semaphore_t v15 = [v14 URL];
      int v16 = v15;
      if (!v15)
      {
        id v45 = [*(id *)(a1 + 32) requestProperties];
        int v16 = [v45 URLBagKey];
      }
      int v49 = 138543874;
      id v50 = v12;
      __int16 v51 = 2114;
      id v52 = v13;
      __int16 v53 = 2114;
      id v54 = v16;
      LODWORD(v44) = 32;
      v43 = &v49;
      id v17 = (void *)_os_log_send_and_compose_impl();
      if (!v15)
      {
      }
      id v5 = v46;
      unint64_t v7 = 0x263F7B000;
      if (v17)
      {
        objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v49, v44);
        int v18 = (int *)objc_claimAutoreleasedReturnValue();
        free(v17);
        v43 = v18;
        SSFileLog();
      }
    }
    else
    {
    }
    id v27 = *(void **)(a1 + 32);
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    id v47 = v6;
    obuint64_t j = v29;
    char v30 = [v27 copyAccountID:&obj credentialSource:0 byHandlingAuthenticateResponse:v5 returningError:&v47];
    objc_storeStrong((id *)(v28 + 40), obj);
    id v26 = v47;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v30;
    LODWORD(v28) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v31 = [*(id *)(v7 + 504) sharediTunesStoreConfig];
    id v32 = (void *)v31;
    if (v28)
    {
      if (!v31)
      {
        id v32 = [*(id *)(v7 + 504) sharedConfig];
      }
      int v33 = objc_msgSend(v32, "shouldLog", v43);
      if ([v32 shouldLogToDisk]) {
        v33 |= 2u;
      }
      BOOL v34 = [v32 OSLogObject];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        v33 &= 2u;
      }
      if (!v33) {
        goto LABEL_47;
      }
      id v35 = objc_opt_class();
      uint64_t v36 = *(void **)(a1 + 32);
      id v37 = v35;
      uint64_t v38 = [v36 logKey];
      int v49 = 138543618;
      id v50 = v35;
      __int16 v51 = 2114;
      id v52 = v38;
      LODWORD(v44) = 22;
    }
    else
    {
      if (!v31)
      {
        id v32 = [*(id *)(v7 + 504) sharedConfig];
      }
      int v39 = objc_msgSend(v32, "shouldLog", v43);
      if ([v32 shouldLogToDisk]) {
        v39 |= 2u;
      }
      BOOL v34 = [v32 OSLogObject];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        v39 &= 2u;
      }
      if (!v39) {
        goto LABEL_47;
      }
      id v40 = objc_opt_class();
      uint64_t v41 = *(void **)(a1 + 32);
      id v37 = v40;
      uint64_t v38 = [v41 logKey];
      int v49 = 138543874;
      id v50 = v40;
      __int16 v51 = 2114;
      id v52 = v38;
      __int16 v53 = 2114;
      id v54 = v26;
      LODWORD(v44) = 32;
    }
    id v42 = (void *)_os_log_send_and_compose_impl();

    if (!v42)
    {
LABEL_48:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_49;
    }
    BOOL v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v49, v44);
    free(v42);
    SSFileLog();
LABEL_47:

    goto LABEL_48;
  }
  int v19 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v19)
  {
    int v19 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    v20 |= 2u;
  }
  id v21 = [v19 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_25;
  }
  int v22 = objc_opt_class();
  id v23 = *(void **)(a1 + 32);
  id v24 = v22;
  [v23 logKey];
  int v49 = 138543874;
  id v50 = v22;
  __int16 v51 = 2114;
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v53 = 2114;
  id v54 = v6;
  LODWORD(v44) = 32;
  long long v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v49, v44);
    free(v25);
    SSFileLog();
LABEL_25:
  }
  id v26 = v6;
LABEL_49:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __54__ISStoreURLOperation__authenticateWithContext_error___block_invoke_177(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) didAuthenticateWithDSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (BOOL)_canSendTokenToURL:(id)a3
{
  id v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"https"];

  return v4;
}

- (id)_buyParams
{
  id v2 = [(ISURLOperation *)self authenticationContext];
  id v3 = [v2 signupRequestParameters];
  char v4 = [v3 objectForKey:@"product"];

  return v4;
}

- (void)_continueTouchIDSession
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(ISURLOperation *)self dataProvider];
  char v4 = [v3 output];
  id v5 = [v4 objectForKey:@"dialog"];

  if (v5)
  {
    id v6 = [[ISDialog alloc] initWithDialogDictionary:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unint64_t v7 = [(ISDialog *)v6 buttons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v14 = self;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionary];
          uint64_t v13 = [v12 objectForKey:@"tidContinue"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 BOOLValue])
          {

            id v6 = [(ISStoreURLOperation *)v14 biometricSessionDelegate];
            if (objc_opt_respondsToSelector()) {
              [(ISDialog *)v6 sender:v14 shouldContinueTouchIDSession:1];
            }
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

LABEL_14:
  }
}

- (id)_copyAuthenticationContextForAttemptNumber:(int64_t)a3
{
  id v5 = [(ISStoreURLOperation *)self _copyAuthenticationContext];
  id v6 = v5;
  if (a3 >= 1) {
    [v5 setPromptStyle:1];
  }
  unint64_t v7 = [(ISURLOperation *)self response];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F7B0E8];
    uint64_t v9 = [(ISURLOperation *)self response];
    objc_msgSend(v6, "setAllowsSilentAuthentication:", objc_msgSend(v8, "URLResponseAllowsSilentAuthentication:", v9));
  }
  return v6;
}

- (BOOL)_isErrorTokenError:(id)a3
{
  id v3 = a3;
  if ((ISErrorIsEqual(v3, @"SSErrorDomain", 18) & 1) != 0
    || (uint64_t v4 = *MEMORY[0x263F7BC78], (ISErrorIsEqual(v3, *MEMORY[0x263F7BC78], 1001) & 1) != 0)
    || (ISErrorIsEqual(v3, v4, 1003) & 1) != 0)
  {
    char IsEqual = 1;
  }
  else
  {
    char IsEqual = ISErrorIsEqual(v3, v4, 1004);
  }

  return IsEqual;
}

- (id)_loadURLBagInterpreterWithRequest:(id)a3 requestProperties:(id)a4
{
  v27[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ISStoreURLOperation *)self SAPSession];
  if ([v8 useSharedBagInterpreter])
  {
    uint64_t v9 = [(ISStoreURLOperation *)self SAPSession];
    uint64_t v10 = [v9 urlBagInterpreter];

    if (v10)
    {
      int v11 = [(ISStoreURLOperation *)self SAPSession];
      id v12 = [v11 urlBagInterpreter];

      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", objc_msgSend(v7, "URLBagType"));
  objc_msgSend(v13, "setAllowsBootstrapCellularData:", objc_msgSend(v7, "allowsBootstrapCellularData"));
  char v14 = 1;
  [v13 setAllowsExpiredBags:1];
  v27[0] = (id)*MEMORY[0x263F7B788];
  id v15 = (id)*MEMORY[0x263F7B808];
  uint64_t v16 = 0;
  v27[1] = v15;
  do
  {
    char v17 = v14;
    uint64_t v18 = v27[v16];
    int v19 = [v6 valueForHTTPHeaderField:v18];
    if (v19) {
      [v13 setValue:v19 forHTTPHeaderField:v18];
    }

    char v14 = 0;
    uint64_t v16 = 1;
  }
  while ((v17 & 1) != 0);
  uint64_t v20 = [(ISURLOperation *)self _accountIdentifier];
  id v21 = [(ISOperation *)self loadedURLBagWithContext:v13 accountDSID:v20 returningError:0];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x263F7B3F8]);
    id v23 = [v21 URLBagDictionary];
    id v24 = (void *)[v22 initWithURLBagDictionary:v23];
  }
  else
  {
    id v24 = 0;
  }
  id v12 = v24;

  for (uint64_t i = 1; i != -1; --i)
LABEL_15:

  return v12;
}

- (BOOL)_performMachineDataRequest:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v5 = [(ISStoreURLOperation *)self _account];
  id v6 = [v5 uniqueIdentifier];
  [v4 setAccountIdentifier:v6];

  objc_msgSend(v4, "setWaitsForPurchaseOperations:", +[ISStoreURLOperation _operationWaitsForPurchases:](ISStoreURLOperation, "_operationWaitsForPurchases:", self));
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = [(ISURLOperation *)self _requestProperties];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __50__ISStoreURLOperation__performMachineDataRequest___block_invoke;
  char v17 = &unk_264260E78;
  int v19 = &v20;
  uint64_t v9 = v7;
  uint64_t v18 = v9;
  +[ISStoreURLOperation _performMachineDataRequest:v4 requestProperties:v8 completion:&v14];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v21 + 24))
  {
    [(ISOperation *)self lock];
    uint64_t v10 = [v4 protocolVersion];
    if (v10)
    {
      if (v10 != 1)
      {
LABEL_8:
        [(ISOperation *)self unlock];
        BOOL v12 = *((unsigned char *)v21 + 24) != 0;
        goto LABEL_9;
      }
      int64_t v11 = 3;
    }
    else
    {
      int64_t v11 = 1;
    }
    self->_int64_t activeMachineDataStyle = v11;
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_9:

  _Block_object_dispose(&v20, 8);
  return v12;
}

intptr_t __50__ISStoreURLOperation__performMachineDataRequest___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_resolvedURLInBagContext:(id)a3 bagTrusted:(BOOL *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = [[ISLoadURLBagOperation alloc] initWithBagContext:v6];
  if (![(ISOperation *)self runSubOperation:v7 returningError:0])
  {
    char v13 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v8 = [(ISURLOperation *)self _requestProperties];
  uint64_t v9 = [(ISLoadURLBagOperation *)v7 URLBag];
  uint64_t v10 = [v8 URL];
  if (!v10)
  {
    uint64_t v11 = [v8 URLBagURLBlock];
    BOOL v12 = (void *)v11;
    if (v11)
    {
      uint64_t v10 = (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
    else
    {
      uint64_t v14 = [v8 URLBagKey];
      if (v14)
      {
        uint64_t v10 = [v9 urlForKey:v14];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  char v13 = [v9 urlIsTrusted:v10];

  if (a4) {
LABEL_13:
  }
    *a4 = v13;
LABEL_14:
  id v15 = v10;

  return v15;
}

- (void)_runURLOperation
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = [(ISStoreURLOperation *)self URLBagContext];
  BOOL v4 = [(ISStoreURLOperation *)self urlKnownToBeTrusted];
  char v86 = 0;
  if (![(ISStoreURLOperation *)self needsURLBag])
  {
    id v24 = [(ISURLOperation *)self _requestProperties];
    char v13 = [v24 URL];

    if (v4) {
      goto LABEL_40;
    }
    long long v25 = [(ISStoreURLOperation *)self bag];

    if (v25)
    {
      uint64_t v11 = [(ISStoreURLOperation *)self bag];
      char v26 = [v11 URLIsTrusted:v13];
    }
    else
    {
      uint64_t v11 = [(ISOperation *)self loadedURLBagWithContext:v3 returningError:0];
      char v26 = [v11 urlIsTrusted:v13];
    }
    char v86 = v26;
    goto LABEL_39;
  }
  uint64_t v5 = [(ISStoreURLOperation *)self bag];
  if (!v5)
  {
LABEL_24:
    char v13 = [(ISStoreURLOperation *)self _resolvedURLInBagContext:v3 bagTrusted:&v86];
    id v27 = [(ISStoreURLOperation *)self bag];

    if (!v27) {
      goto LABEL_40;
    }
    BOOL v82 = v4;
    uint64_t v11 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v11)
    {
      uint64_t v11 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v28 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    char v30 = [v11 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      int v31 = v29;
    }
    else {
      int v31 = v29 & 2;
    }
    if (v31)
    {
      id v32 = objc_opt_class();
      id v33 = v32;
      [(ISURLOperation *)self requestProperties];
      v35 = BOOL v34 = v3;
      uint64_t v36 = [v35 URLBagKey];
      int v88 = 138412802;
      uint64_t v89 = v32;
      __int16 v90 = 2112;
      v91 = v36;
      __int16 v92 = 2112;
      uint64_t v93 = v13;
      LODWORD(v80) = 32;
      __int16 v79 = &v88;
      id v37 = (void *)_os_log_send_and_compose_impl();

      id v3 = v34;
      BOOL v4 = v82;
      if (!v37) {
        goto LABEL_39;
      }
      char v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v88, v80);
      free(v37);
      __int16 v79 = (int *)v30;
      SSFileLog();
    }

    goto LABEL_39;
  }
  id v6 = (void *)v5;
  dispatch_semaphore_t v7 = [(ISStoreURLOperation *)self bag];
  if (([v7 canHandleTrustedDomains] & 1) == 0)
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(ISURLOperation *)self requestProperties];
  uint64_t v9 = [v8 URLBagURLBlock];

  if (v9) {
    goto LABEL_24;
  }
  uint64_t v10 = [(ISURLOperation *)self requestProperties];
  uint64_t v11 = [v10 URLBagKey];

  if (v11)
  {
    BOOL v12 = [(ISStoreURLOperation *)self bag];
    id v85 = 0;
    char v13 = [v12 URLForKey:v11 error:&v85];
    id v14 = v85;

    if (!v14) {
      goto LABEL_88;
    }
    id v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    uint64_t v18 = [v15 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      int v19 = v17;
    }
    else {
      int v19 = v17 & 2;
    }
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      int v88 = 138412546;
      uint64_t v89 = v20;
      __int16 v90 = 2114;
      v91 = v11;
      id v21 = v3;
      id v22 = v20;
      LODWORD(v80) = 22;
      __int16 v79 = &v88;
      char v23 = (void *)_os_log_send_and_compose_impl();

      id v3 = v21;
      if (!v23)
      {
LABEL_19:

        goto LABEL_88;
      }
      uint64_t v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v88, v80);
      free(v23);
      __int16 v79 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_19;
  }
  id v14 = [(ISURLOperation *)self requestProperties];
  char v13 = [v14 URL];
LABEL_88:

  if (v13)
  {
    __int16 v68 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v68)
    {
      __int16 v68 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    uint64_t v83 = v11;
    int v69 = objc_msgSend(v68, "shouldLog", v79);
    if ([v68 shouldLogToDisk]) {
      int v70 = v69 | 2;
    }
    else {
      int v70 = v69;
    }
    long long v71 = [v68 OSLogObject];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
      int v72 = v70;
    }
    else {
      int v72 = v70 & 2;
    }
    if (v72)
    {
      long long v73 = v3;
      id v74 = objc_opt_class();
      id v81 = v74;
      id v75 = [(ISURLOperation *)self _requestProperties];
      uint64_t v76 = [v75 URL];
      int v88 = 138412802;
      uint64_t v89 = v74;
      id v3 = v73;
      __int16 v90 = 2112;
      v91 = v83;
      __int16 v92 = 2112;
      uint64_t v93 = v76;
      LODWORD(v80) = 32;
      __int16 v79 = &v88;
      int v77 = (void *)_os_log_send_and_compose_impl();

      if (!v77)
      {
LABEL_101:

        uint64_t v78 = [(ISStoreURLOperation *)self bag];
        char v86 = [v78 URLIsTrusted:v13];

        uint64_t v11 = v83;
        goto LABEL_39;
      }
      long long v71 = objc_msgSend(NSString, "stringWithCString:encoding:", v77, 4, &v88, v80);
      free(v77);
      __int16 v79 = (int *)v71;
      SSFileLog();
    }

    goto LABEL_101;
  }
LABEL_39:

LABEL_40:
  if (!v13)
  {
    v43 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v43)
    {
      v43 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v44 = objc_msgSend(v43, "shouldLog", v79);
    if ([v43 shouldLogToDisk]) {
      v44 |= 2u;
    }
    id v45 = [v43 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      int v46 = v44;
    }
    else {
      int v46 = v44 & 2;
    }
    if (v46)
    {
      id v47 = objc_opt_class();
      int v88 = 138412290;
      uint64_t v89 = v47;
      id v48 = v47;
      LODWORD(v80) = 12;
      int v49 = (void *)_os_log_send_and_compose_impl();

      if (!v49)
      {
LABEL_61:

        uint64_t v38 = SSError();
        [(ISOperation *)self setError:v38];
        goto LABEL_74;
      }
      id v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v49, 4, &v88, v80);
      free(v49);
      SSFileLog();
    }

    goto LABEL_61;
  }
  uint64_t v38 = [(ISURLOperation *)self _requestProperties];
  int v39 = [v38 URL];

  if (!v39)
  {
    uint64_t v87 = v13;
    id v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    [v38 setURLs:v40];
  }
  if (v86) {
    char v41 = 1;
  }
  else {
    char v41 = v4;
  }
  if ((v41 & 1) == 0)
  {
    id v50 = SSError();
    [(ISOperation *)self setError:v50];

    __int16 v51 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v51)
    {
      __int16 v51 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v52 = objc_msgSend(v51, "shouldLog", v79);
    if ([v51 shouldLogToDisk]) {
      v52 |= 2u;
    }
    __int16 v53 = [v51 OSLogObject];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
      int v54 = v52;
    }
    else {
      int v54 = v52 & 2;
    }
    if (v54)
    {
      uint64_t v55 = objc_opt_class();
      id v56 = v55;
      long long v57 = [(ISURLOperation *)self _sanitizedURLForURL:v13];
      int v88 = 138412546;
      uint64_t v89 = v55;
      __int16 v90 = 2112;
      v91 = v57;
      LODWORD(v80) = 22;
      uint64_t v58 = (void *)_os_log_send_and_compose_impl();

      if (!v58)
      {
LABEL_73:

        goto LABEL_74;
      }
      __int16 v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v58, 4, &v88, v80);
      free(v58);
      SSFileLog();
    }

    goto LABEL_73;
  }
  if ([(ISStoreURLOperation *)self needsAuthentication]
    && ![(ISStoreURLOperation *)self _canSendTokenToURL:v13])
  {
    id v59 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v59)
    {
      id v59 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v60 = objc_msgSend(v59, "shouldLog", v79);
    if ([v59 shouldLogToDisk]) {
      v60 |= 2u;
    }
    id v61 = [v59 OSLogObject];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
      int v62 = v60;
    }
    else {
      int v62 = v60 & 2;
    }
    if (v62)
    {
      uint64_t v63 = objc_opt_class();
      id v64 = v63;
      char v65 = [(ISURLOperation *)self _sanitizedURLForURL:v13];
      int v88 = 138412546;
      uint64_t v89 = v63;
      __int16 v90 = 2112;
      v91 = v65;
      LODWORD(v80) = 22;
      int v66 = (void *)_os_log_send_and_compose_impl();

      if (!v66)
      {
LABEL_86:

        id v67 = SSError();
        [(ISOperation *)self setError:v67];

        goto LABEL_74;
      }
      id v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v66, 4, &v88, v80);
      free(v66);
      SSFileLog();
    }

    goto LABEL_86;
  }
  -[ISStoreURLOperation _addStandardQueryParametersForURL:](self, "_addStandardQueryParametersForURL:", v13, v79);
  id v42 = [(ISURLOperation *)self dataProvider];
  [v42 setBagContext:v3];

  [v38 setITunesStoreRequest:1];
  v84.receiver = self;
  v84.super_class = (Class)ISStoreURLOperation;
  [(ISURLOperation *)&v84 run];
LABEL_74:
}

- (BOOL)_shouldRetryForAbsintheWithResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ISStoreURLOperation *)self logKey];
  id v6 = (id)AMSSetLogKey();

  dispatch_semaphore_t v7 = [(ISStoreURLOperation *)self bag];

  if (v7)
  {
    uint64_t v8 = [ISAMSBagShim alloc];
    uint64_t v9 = [(ISStoreURLOperation *)self bag];
    uint64_t v10 = [(ISAMSBagShim *)v8 initWithBag:v9];
  }
  else
  {
    uint64_t v11 = [(ISStoreURLOperation *)self URLBagContext];
    uint64_t v9 = [(ISStoreURLOperation *)self _urlBagForContext:v11];

    uint64_t v10 = [[ISAMSBagShim alloc] initWithURLBag:v9];
  }
  BOOL v12 = v10;

  char v13 = [MEMORY[0x263F27AD0] handleResponse:v4 bag:v12];

  BOOL v14 = [v13 actionType] == 2;
  return v14;
}

- (BOOL)_shouldRetryForTouchIDChallengeWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x263F7B758]])
  {

    goto LABEL_12;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 22) {
    goto LABEL_12;
  }
  dispatch_semaphore_t v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F7B750]];

  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = [v8 integerValue];

  if (v9 != 2074)
  {
LABEL_12:
    LOBYTE(v8) = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [(ISURLOperation *)self dataProvider];
  uint64_t v11 = [v10 biometricAuthenticationContext];
  LODWORD(v8) = [v11 didAuthenticate];
  if (v8 && [v11 didFallbackToPassword])
  {
    BOOL v12 = [v11 accountIdentifier];
    [(ISStoreURLOperation *)self setAuthenticatedDSID:v12];
    char v13 = [(ISOperation *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __64__ISStoreURLOperation__shouldRetryForTouchIDChallengeWithError___block_invoke;
      v15[3] = &unk_264260B80;
      id v16 = v13;
      int v17 = self;
      id v18 = v12;
      [(ISOperation *)self delegateDispatch:v15];
    }
    [v11 setChallenge:0];
    [v11 setSignature:0];
  }
  [(ISStoreURLOperation *)self setBiometricAuthenticationContext:v11];

LABEL_13:
  return (char)v8;
}

uint64_t __64__ISStoreURLOperation__shouldRetryForTouchIDChallengeWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) operation:*(void *)(a1 + 40) didAuthenticateWithDSID:*(void *)(a1 + 48)];
}

- (id)_urlBagForContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ISURLBagCache sharedCache];
  uint64_t v6 = [v5 URLBagForContext:v4];

  if (!v6)
  {
    if ([(ISStoreURLOperation *)self isURLBagRequest])
    {
      uint64_t v6 = 0;
    }
    else
    {
      dispatch_semaphore_t v7 = [[ISLoadURLBagOperation alloc] initWithBagContext:v4];
      uint64_t v6 = 0;
      if ([(ISOperation *)self runSubOperation:v7 returningError:0])
      {
        uint64_t v6 = [(ISLoadURLBagOperation *)v7 URLBag];
      }
    }
  }

  return v6;
}

+ (void)_handleResponseHeaders:(id)a3 response:(id)a4 request:(id)a5 account:(id)a6 performsMachineDataActions:(BOOL)a7 shouldRetry:(BOOL *)a8
{
  BOOL v9 = a7;
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v119 = a6;
  unsigned int v120 = v14;
  id v16 = [v14 allHeaderFields];
  int v17 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B848]);
  unint64_t v18 = 0x263F08000;
  uint64_t v117 = v13;
  v118 = v16;
  if (v17)
  {
    int v19 = [v13 delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [v19 operation:v13 shouldSetStoreFrontID:v17])
    {
      uint64_t v20 = [MEMORY[0x263F7B1F8] sharedAccountsConfig];
      if (!v20)
      {
        uint64_t v20 = [MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v21 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      char v23 = [v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        int v24 = v22;
      }
      else {
        int v24 = v22 & 2;
      }
      if (v24)
      {
        long long v113 = v19;
        long long v25 = a8;
        char v26 = (__CFString *)objc_opt_class();
        long long v114 = v26;
        [v120 URL];
        id v27 = v116 = v15;
        int v28 = [v119 accountName];
        SSHashIfNeeded();
        int v29 = v115 = v9;
        char v30 = SSHashIfNeeded();
        int v123 = 138544130;
        uint64_t v124 = v26;
        a8 = v25;
        int v19 = v113;
        __int16 v125 = 2114;
        uint64_t v126 = (uint64_t)v27;
        __int16 v127 = 2114;
        id v128 = v29;
        __int16 v129 = 2114;
        v130 = v30;
        LODWORD(v112) = 42;
        long long v110 = &v123;
        int v31 = (void *)_os_log_send_and_compose_impl();

        BOOL v9 = v115;
        id v15 = v116;

        unint64_t v18 = 0x263F08000uLL;
        if (v31)
        {
          objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v123, v112);
          id v32 = (int *)objc_claimAutoreleasedReturnValue();
          free(v31);
          long long v110 = v32;
          SSFileLog();
        }
      }
      else
      {

        unint64_t v18 = 0x263F08000;
      }

      id v33 = [MEMORY[0x263F7B148] currentDevice];
      [v33 setStoreFrontIdentifier:v17 forRequest:v15 response:v120 account:v119];

      id v13 = v117;
      id v16 = v118;
    }
  }
  BOOL v34 = ISDictionaryValueForCaseInsensitiveString(v16, @"X-Apple-Partner");

  if (v34)
  {
    id v35 = +[ISClient currentClient];
    [v35 setPartnerHeader:v34];
  }
  if (v9)
  {
    uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263F7B218]) initWithURLResponse:v120];
    if (!v36)
    {
LABEL_37:

      goto LABEL_38;
    }
    id v37 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v37)
    {
      id v37 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v38 = objc_msgSend(v37, "shouldLog", v110);
    if ([v37 shouldLogToDisk]) {
      v38 |= 2u;
    }
    int v39 = [v37 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
      int v40 = v38;
    }
    else {
      int v40 = v38 & 2;
    }
    if (v40)
    {
      id v41 = v15;
      if (v13) {
        id v42 = (__CFString *)objc_opt_class();
      }
      else {
        id v42 = @"ISStoreURLOperation";
      }
      v43 = [v36 actionName];
      int v123 = 138412546;
      uint64_t v124 = v42;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v43;
      LODWORD(v112) = 22;
      long long v110 = &v123;
      int v44 = (void *)_os_log_send_and_compose_impl();

      id v15 = v41;
      if (!v44) {
        goto LABEL_36;
      }
      int v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, &v123, v112);
      free(v44);
      long long v110 = (int *)v39;
      SSFileLog();
    }

LABEL_36:
    id v45 = [v119 uniqueIdentifier];
    [v36 setAccountIdentifier:v45];

    objc_msgSend(v36, "setWaitsForPurchaseOperations:", +[ISStoreURLOperation _operationWaitsForPurchases:](ISStoreURLOperation, "_operationWaitsForPurchases:", v13));
    int v46 = [v13 _requestProperties];
    +[ISStoreURLOperation _performMachineDataRequest:v36 requestProperties:v46 completion:0];

    id v16 = v118;
    unint64_t v18 = 0x263F08000uLL;
    goto LABEL_37;
  }
LABEL_38:
  id v47 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B810]);

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_84;
  }
  if (![v47 isEqualToString:@"RP"])
  {
    if (![v47 isEqualToString:@"EP"]) {
      goto LABEL_84;
    }
    uint64_t v58 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v58)
    {
      uint64_t v58 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v59 = objc_msgSend(v58, "shouldLog", v110);
    if ([v58 shouldLogToDisk]) {
      v59 |= 2u;
    }
    int v60 = [v58 OSLogObject];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT)) {
      int v61 = v59;
    }
    else {
      int v61 = v59 & 2;
    }
    if (v61)
    {
      int v62 = (__CFString *)objc_opt_class();
      int v123 = 138412290;
      uint64_t v124 = v62;
      uint64_t v63 = v62;
      LODWORD(v112) = 12;
      long long v111 = &v123;
      id v64 = (void *)_os_log_send_and_compose_impl();

      if (!v64)
      {
LABEL_63:

        __int16 v51 = objc_opt_new();
        [v51 setPromptUser:1];
        char v65 = [v13 _buyParams];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v66 = v15;
          id v67 = (void *)[NSURL copyDictionaryForQueryString:v65 unescapedValues:1];
          __int16 v68 = [v67 objectForKey:@"mtTopic"];
          if (v68) {
            [v51 setTopicName:v68];
          }

          id v15 = v66;
        }
        int v69 = objc_msgSend(v13, "authenticationContext", v111);
        int v70 = [v69 HTTPHeaders];
        __int16 v53 = [v70 objectForKey:*MEMORY[0x263F7B788]];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v51 setUserAgent:v53];
        }
        [v13 runSubOperation:v51 returningError:0];
        goto LABEL_82;
      }
      int v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v64, 4, &v123, v112);
      free(v64);
      long long v111 = (int *)v60;
      SSFileLog();
    }

    goto LABEL_63;
  }
  char v49 = [v13 shouldCancelBiometricTokenUpdate];
  uint64_t v50 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  __int16 v51 = (void *)v50;
  if ((v49 & 1) == 0)
  {
    if (!v50)
    {
      __int16 v51 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v71 = objc_msgSend(v51, "shouldLog", v110);
    if ([v51 shouldLogToDisk]) {
      v71 |= 2u;
    }
    int v72 = [v51 OSLogObject];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
      int v73 = v71;
    }
    else {
      int v73 = v71 & 2;
    }
    if (v73)
    {
      id v74 = (__CFString *)objc_opt_class();
      int v123 = 138412290;
      uint64_t v124 = v74;
      id v75 = v74;
      LODWORD(v112) = 12;
      long long v110 = &v123;
      uint64_t v76 = (void *)_os_log_send_and_compose_impl();

      if (!v76)
      {
LABEL_81:

        __int16 v51 = [v13 authenticatedAccountDSID];
        __int16 v53 = [[ISBiometricUpdateTouchIDSettingsOperation alloc] initWithAccountIdentifier:v51];
        int v77 = +[ISOperationQueue mainQueue];
        [v77 addOperation:v53];

        goto LABEL_82;
      }
      int v72 = objc_msgSend(NSString, "stringWithCString:encoding:", v76, 4, &v123, v112);
      free(v76);
      long long v110 = (int *)v72;
      SSFileLog();
    }

    goto LABEL_81;
  }
  if (!v50)
  {
    __int16 v51 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v52 = objc_msgSend(v51, "shouldLog", v110);
  if ([v51 shouldLogToDisk]) {
    v52 |= 2u;
  }
  __int16 v53 = [v51 OSLogObject];
  if (os_log_type_enabled(&v53->super.super.super, OS_LOG_TYPE_DEFAULT)) {
    int v54 = v52;
  }
  else {
    int v54 = v52 & 2;
  }
  if (!v54) {
    goto LABEL_82;
  }
  uint64_t v55 = (__CFString *)objc_opt_class();
  int v123 = 138543362;
  uint64_t v124 = v55;
  id v56 = v55;
  LODWORD(v112) = 12;
  long long v110 = &v123;
  long long v57 = (void *)_os_log_send_and_compose_impl();

  if (v57)
  {
    objc_msgSend(*(id *)(v18 + 2880), "stringWithCString:encoding:", v57, 4, &v123, v112);
    __int16 v53 = (ISBiometricUpdateTouchIDSettingsOperation *)objc_claimAutoreleasedReturnValue();
    free(v57);
    long long v110 = (int *)v53;
    SSFileLog();
LABEL_82:
  }
  id v16 = v118;
LABEL_84:
  uint64_t v78 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B818]);

  objc_opt_class();
  if (isKindOfClass & 1 | ((objc_opt_isKindOfClass() & 1) == 0)) {
    goto LABEL_95;
  }
  __int16 v79 = [v13 _account];
  uint64_t v80 = [v79 accountName];

  id v81 = [v13 biometricAuthenticationContext];
  BOOL v82 = [v13 authenticationContext];
  uint64_t v83 = [v82 requiredUniqueIdentifier];
  [v81 setAccountIdentifier:v83];

  [v81 setAccountName:v80];
  [v81 setChallenge:v78];
  [v81 setSignature:0];
  objc_super v84 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B828]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v85 = v15;
    char v86 = [v84 uppercaseString];
    if ([v86 isEqualToString:@"EXT"]) {
LABEL_87:
    }
      objc_msgSend(v81, "setIsExtendedAction:", 1, v110);
  }
  else
  {
    id v85 = v15;
    uint64_t v87 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B840]);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_92;
    }
    char v86 = [v87 uppercaseString];
    objc_super v84 = v87;
    if ([v86 isEqualToString:@"PK"]) {
      goto LABEL_87;
    }
  }

  uint64_t v87 = v84;
LABEL_92:
  objc_msgSend(v13, "setBiometricAuthenticationContext:", v81, v110);
  int v88 = ISError(22, 0, 0);
  uint64_t v89 = SSErrorBySettingUserInfoValue();

  [v13 setError:v89];
  __int16 v90 = [v13 dataProvider];
  if (objc_opt_respondsToSelector())
  {
    v91 = [v13 biometricAuthenticationContext];
    [v90 setBiometricAuthenticationContext:v91];
  }
  id v15 = v85;
  id v16 = v118;
LABEL_95:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__ISStoreURLOperation__handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry___block_invoke;
  block[3] = &unk_264260B08;
  id v92 = v120;
  id v122 = v92;
  if (_handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry__sEnvironmentOnce != -1) {
    dispatch_once(&_handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry__sEnvironmentOnce, block);
  }
  uint64_t v93 = +[ISStoreURLOperation _authKitSession];
  [v93 handleResponse:v92 forRequest:v15 shouldRetry:a8];

  uint64_t v94 = *MEMORY[0x263F7B7A8];
  v95 = ISDictionaryValueForCaseInsensitiveString(v16, (void *)*MEMORY[0x263F7B7A8]);

  if (a8 && !*a8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v96 = [v95 integerValue];
    BOOL v97 = [MEMORY[0x263F7B1F8] sharedStoreServicesConfig];
    if (!v97)
    {
      BOOL v97 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v98 = [v97 shouldLog];
    if ([v97 shouldLogToDisk]) {
      v98 |= 2u;
    }
    id v99 = [v97 OSLogObject];
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT)) {
      int v100 = v98;
    }
    else {
      int v100 = v98 & 2;
    }
    if (v100)
    {
      id v101 = (__CFString *)objc_opt_class();
      int v123 = 138543618;
      uint64_t v124 = v101;
      __int16 v125 = 2048;
      uint64_t v126 = v96;
      id v102 = v101;
      LODWORD(v112) = 22;
      id v103 = (void *)_os_log_send_and_compose_impl();

      if (!v103) {
        goto LABEL_111;
      }
      id v99 = objc_msgSend(NSString, "stringWithCString:encoding:", v103, 4, &v123, v112);
      free(v103);
      SSFileLog();
    }

LABEL_111:
    BOOL v104 = v96 == 1001;
    id v16 = v118;
    if (v104)
    {
      long long v105 = [v117 _requestProperties];
      [v105 setShouldDisableReversePush:1];
      long long v106 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 1);
      [v105 setValue:v106 forHTTPHeaderField:v94];
      [v117 _activeURLRequest];
      long long v108 = v107 = v15;
      long long v109 = (void *)[v108 mutableCopy];

      id v15 = v107;
      [v109 setValue:v106 forHTTPHeaderField:v94];
      id v16 = v118;
      [v117 _setActiveURLRequest:v109];
      *a8 = 1;
    }
  }
}

void __110__ISStoreURLOperation__handleResponseHeaders_response_request_account_performsMachineDataActions_shouldRetry___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(*(id *)(a1 + 32), "_iTunesStore_valueForHTTPHeader:", @"X-Apple-Application-Site");
  if (v1)
  {
    id v2 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v2)
    {
      id v2 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    uint64_t v5 = [v2 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      int v6 = v4;
    }
    else {
      int v6 = v4 & 2;
    }
    if (v6)
    {
      int v9 = 138412290;
      uint64_t v10 = v1;
      LODWORD(v8) = 12;
      dispatch_semaphore_t v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v9, v8);
      free(v7);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
}

+ (BOOL)_operationWaitsForPurchases:(id)a3
{
  if (!a3) {
    return 1;
  }
  uint64_t v3 = [a3 parentOperation];
  if (!v3) {
    return 1;
  }
  int v4 = (void *)v3;
  do
  {
    uint64_t v5 = [v4 uniqueKey];
    char v6 = [v5 isEqualToString:@"com.apple.itunesstored.PurchaseOperation"];

    if (v6) {
      break;
    }
    uint64_t v7 = [v4 parentOperation];

    int v4 = (void *)v7;
  }
  while (v7);
  char v8 = v6 ^ 1;

  return v8;
}

+ (void)_performMachineDataRequest:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend(v7, "setAllowsBootstrapCellularData:", objc_msgSend(v8, "allowsBootstrapCellularData"));
  if (SSIsDaemon())
  {
    uint64_t v10 = (void *)[objc_alloc(NSClassFromString(&cfstr_Ismachinedataa.isa)) initWithMachineDataRequest:v7];
    uint64_t v11 = [v8 HTTPHeaders];
    BOOL v12 = [v11 objectForKey:*MEMORY[0x263F7B788]];
    [v10 setUserAgent:v12];

    if (v9)
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      id v16 = __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke_2;
      int v17 = &unk_264260EC8;
      id v18 = v9;
      [v10 setResultBlock:&v14];
    }
    id v13 = +[ISOperationQueue mainQueue];
    [v13 addOperation:v10];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke;
    v19[3] = &unk_264260EA0;
    id v20 = v9;
    [v7 startWithCompletionBlock:v19];
    uint64_t v10 = v20;
  }
}

uint64_t __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __79__ISStoreURLOperation__performMachineDataRequest_requestProperties_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_storeFrontIdentifierForAccount:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v50 = SSGenerateLogCorrelationString();
  int v4 = [MEMORY[0x263F7B1F8] sharedAccountsStorefrontConfig];
  if (!v4)
  {
    int v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (v8)
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = [v3 accountName];
    SSHashIfNeeded();
    v13 = id v12 = v3;
    int v51 = 138543874;
    int v52 = v9;
    __int16 v53 = 2114;
    int v54 = v50;
    __int16 v55 = 2114;
    id v56 = v13;
    LODWORD(v49) = 32;
    id v48 = &v51;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    id v3 = v12;
    if (!v14) {
      goto LABEL_13;
    }
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v51, v49);
    free(v14);
    id v48 = (int *)v7;
    SSFileLog();
  }

LABEL_13:
  uint64_t v15 = [v3 storeFrontIdentifier];
  if ([v15 length])
  {
    id v16 = [MEMORY[0x263F7B1F8] sharedAccountsStorefrontConfig];
    if (!v16)
    {
      id v16 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v17 = objc_msgSend(v16, "shouldLog", v48);
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    int v19 = [v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      int v20 = v18;
    }
    else {
      int v20 = v18 & 2;
    }
    if (v20)
    {
      int v21 = objc_opt_class();
      id v22 = v21;
      char v23 = SSHashIfNeeded();
      int v51 = 138543874;
      int v52 = v21;
      __int16 v53 = 2114;
      int v54 = v50;
      __int16 v55 = 2114;
      id v56 = v23;
      LODWORD(v49) = 32;
      int v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_26:

        id v25 = v15;
        goto LABEL_55;
      }
      int v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v51, v49);
      free(v24);
      SSFileLog();
    }

    goto LABEL_26;
  }
  char v26 = [MEMORY[0x263F7B148] currentDevice];
  id v27 = [v26 storeFrontIdentifier];

  uint64_t v28 = [v27 length];
  uint64_t v29 = [MEMORY[0x263F7B1F8] sharedAccountsStorefrontConfig];
  char v30 = (void *)v29;
  if (!v28)
  {
    if (!v29)
    {
      char v30 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v40 = objc_msgSend(v30, "shouldLog", v48);
    if ([v30 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    id v42 = [v30 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      int v43 = v41;
    }
    else {
      int v43 = v41 & 2;
    }
    if (v43)
    {
      int v44 = objc_opt_class();
      int v51 = 138543618;
      int v52 = v44;
      __int16 v53 = 2114;
      int v54 = v50;
      id v45 = v44;
      LODWORD(v49) = 22;
      int v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_53:

        id v25 = 0;
        goto LABEL_54;
      }
      id v42 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v51, v49);
      free(v46);
      SSFileLog();
    }

    goto LABEL_53;
  }
  if (!v29)
  {
    char v30 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v31 = objc_msgSend(v30, "shouldLog", v48);
  if ([v30 shouldLogToDisk]) {
    int v32 = v31 | 2;
  }
  else {
    int v32 = v31;
  }
  id v33 = [v30 OSLogObject];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
    int v34 = v32;
  }
  else {
    int v34 = v32 & 2;
  }
  if (!v34) {
    goto LABEL_39;
  }
  id v35 = objc_opt_class();
  id v36 = v35;
  SSHashIfNeeded();
  int v38 = v37 = v3;
  int v51 = 138543874;
  int v52 = v35;
  __int16 v53 = 2114;
  int v54 = v50;
  __int16 v55 = 2114;
  id v56 = v38;
  LODWORD(v49) = 32;
  int v39 = (void *)_os_log_send_and_compose_impl();

  id v3 = v37;
  if (v39)
  {
    id v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v51, v49);
    free(v39);
    SSFileLog();
LABEL_39:
  }
  id v25 = v27;
LABEL_54:

LABEL_55:

  return v25;
}

- (NSNumber)authenticatedDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setAuthenticatedDSID:(id)a3
{
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 552, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
}

- (BOOL)needsAuthentication
{
  return self->_needsAuthentication;
}

- (void)setNeedsAuthentication:(BOOL)a3
{
  self->_needsAuthentication = a3;
}

- (BOOL)needsTermsAndConditionsAcceptance
{
  return self->_needsTermsAndConditionsAcceptance;
}

- (void)setNeedsTermsAndConditionsAcceptance:(BOOL)a3
{
  self->_needsTermsAndConditionsAcceptance = a3;
}

- (BOOL)needsURLBag
{
  return self->_needsURLBag;
}

- (void)setNeedsURLBag:(BOOL)a3
{
  self->_needsURLBag = a3;
}

- (BOOL)shouldAppendAuthKitHeaders
{
  return self->_shouldAppendAuthKitHeaders;
}

- (void)setShouldAppendAuthKitHeaders:(BOOL)a3
{
  self->_shouldAppendAuthKitHeaders = a3;
}

- (BOOL)shouldAppendStorefrontToURL
{
  return self->_shouldAppendStorefrontToURL;
}

- (void)setShouldAppendStorefrontToURL:(BOOL)a3
{
  self->_shouldAppendStorefrontToURL = a3;
}

- (BOOL)shouldCancelBiometricTokenUpdate
{
  return self->_shouldCancelBiometricTokenUpdate;
}

- (void)setShouldCancelBiometricTokenUpdate:(BOOL)a3
{
  self->_shouldCancelBiometricTokenUpdate = a3;
}

- (BOOL)isURLBagRequest
{
  return self->_isURLBagRequest;
}

- (void)setURLBagRequest:(BOOL)a3
{
  self->_isURLBagRequest = a3;
}

- (BOOL)urlKnownToBeTrusted
{
  return self->_urlKnownToBeTrusted;
}

- (void)setUrlKnownToBeTrusted:(BOOL)a3
{
  self->_urlKnownToBeTrusted = a3;
}

- (BOOL)useUserSpecificURLBag
{
  return self->_useUserSpecificURLBag;
}

- (void)setUseUserSpecificURLBag:(BOOL)a3
{
  self->_useUserSpecificURLBag = a3;
}

- (ISBiometricSessionDelegate)biometricSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricSessionDelegate);

  return (ISBiometricSessionDelegate *)WeakRetained;
}

- (void)setBiometricSessionDelegate:(id)a3
{
}

- (int64_t)machineDataStyle
{
  return self->_machineDataStyle;
}

- (void)setMachineDataStyle:(int64_t)a3
{
  self->_int64_t machineDataStyle = a3;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (BOOL)shouldSendAKClientInfoHeaders
{
  return self->_shouldSendAKClientInfoHeaders;
}

- (void)setShouldSendAKClientInfoHeaders:(BOOL)a3
{
  self->_shouldSendAKClientInfoHeaders = a3;
}

- (BOOL)shouldSendAKPRKRequestHeader
{
  return self->_shouldSendAKPRKRequestHeader;
}

- (void)setShouldSendAKPRKRequestHeader:(BOOL)a3
{
  self->_shouldSendAKPRKRequestHeader = a3;
}

- (BOOL)shouldSendDSIDHeader
{
  return self->_shouldSendDSIDHeader;
}

- (void)setShouldSendDSIDHeader:(BOOL)a3
{
  self->_shouldSendDSIDHeader = a3;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_destroyWeak((id *)&self->_biometricSessionDelegate);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_sapSession, 0);

  objc_storeStrong((id *)&self->_authenticatedDSID, 0);
}

@end