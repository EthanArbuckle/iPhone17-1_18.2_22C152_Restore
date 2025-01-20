@interface ISDataProvider
+ (id)provider;
- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4;
- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4;
- (BOOL)isStream;
- (BOOL)isStreamComplete;
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (BOOL)runAuthorizationDialog:(id)a3 error:(id *)a4;
- (BOOL)runSubOperation:(id)a3 error:(id *)a4;
- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 error:(id *)a5;
- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 metricsDictionary:(id)a5 error:(id *)a6;
- (ISBiometricSessionDelegate)biometricSessionDelegate;
- (ISDataProvider)init;
- (ISOperation)parentOperation;
- (NSNumber)authenticatedAccountDSID;
- (NSString)contentType;
- (NSURL)redirectURL;
- (NSURLResponse)response;
- (SSAuthenticationContext)authenticationContext;
- (SSBiometricAuthenticationContext)biometricAuthenticationContext;
- (SSURLBagContext)bagContext;
- (id)closeStream;
- (id)copyWithZone:(_NSZone *)a3;
- (id)output;
- (int64_t)contentLength;
- (int64_t)errorHandlerResponseType;
- (int64_t)streamedBytes;
- (unint64_t)authenticatedAccountCredentialSource;
- (void)_performActionsForButton:(id)a3 withDialog:(id)a4;
- (void)configureFromProvider:(id)a3;
- (void)migrateOutputFromSubProvider:(id)a3;
- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3;
- (void)setAuthenticatedAccountDSID:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBagContext:(id)a3;
- (void)setBiometricAuthenticationContext:(id)a3;
- (void)setBiometricSessionDelegate:(id)a3;
- (void)setContentLength:(int64_t)a3;
- (void)setContentType:(id)a3;
- (void)setErrorHandlerResponseType:(int64_t)a3;
- (void)setOutput:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setRedirectURL:(id)a3;
- (void)setResponse:(id)a3;
- (void)setup;
@end

@implementation ISDataProvider

- (ISDataProvider)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDataProvider;
  return [(ISDataProvider *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = [(ISDataProvider *)self contentLength];
  v6 = [(ISDataProvider *)self contentType];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[5];
  v5[5] = v7;

  return v5;
}

+ (id)provider
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)closeStream
{
  return 0;
}

- (void)configureFromProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 authenticationContext];
  [(ISDataProvider *)self setAuthenticationContext:v5];

  v6 = [(ISDataProvider *)self bagContext];
  [(ISDataProvider *)self setBagContext:v6];

  id v7 = [v4 contentType];

  [(ISDataProvider *)self setContentType:v7];
}

- (BOOL)isStream
{
  return 0;
}

- (BOOL)isStreamComplete
{
  return 0;
}

- (void)migrateOutputFromSubProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 authenticatedAccountDSID];
  [(ISDataProvider *)self setAuthenticatedAccountDSID:v5];

  id v6 = [v4 redirectURL];

  [(ISDataProvider *)self setRedirectURL:v6];
}

- (int64_t)streamedBytes
{
  return 0;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (void)setup
{
  [(ISDataProvider *)self setOutput:0];

  [(ISDataProvider *)self setRedirectURL:0];
}

- (BOOL)runAuthorizationDialog:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(ISServerAuthenticationOperation);
  [(ISServerAuthenticationOperation *)v7 setDialog:v6];
  v8 = [v6 authenticationContext];

  id v9 = (id)[v8 mutableCopy];
  if (!v9)
  {
    v10 = [(ISDataProvider *)self authenticationContext];
    id v9 = (id)[v10 mutableCopy];

    if (!v9) {
      id v9 = objc_alloc_init(MEMORY[0x263F7B288]);
    }
  }
  [(ISServerAuthenticationOperation *)v7 setAuthenticationContext:v9];
  v11 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  if (!v11)
  {
    v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    int v15 = v13;
  }
  else {
    int v15 = v13 & 2;
  }
  if (v15)
  {
    v16 = objc_opt_class();
    id v26 = v16;
    v17 = AMSSetLogKeyIfNeeded();
    v18 = [v9 accountName];
    SSHashIfNeeded();
    int v28 = 138544130;
    v29 = v16;
    __int16 v30 = 2114;
    v31 = v17;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2114;
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 42;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (v19)
    {
      v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v28, v25);
      free(v19);
      SSFileLog();
    }
  }
  else
  {
  }
  id v27 = 0;
  BOOL v21 = [(ISDataProvider *)self _runServerAuthenticationOperation:v7 error:&v27];
  id v22 = v27;
  v23 = v22;
  if (a4 && !v21) {
    *a4 = v22;
  }

  return v21;
}

- (BOOL)runSubOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ISDataProvider *)self parentOperation];
  if (!v7) {
    id v7 = objc_alloc_init(ISOperation);
  }
  id v12 = 0;
  BOOL v8 = [(ISOperation *)v7 runSubOperation:v6 returningError:&v12];
  id v9 = v12;
  v10 = v9;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 error:(id *)a5
{
  return [(ISDataProvider *)self runTouchIDAuthorizationDialog:a3 fallbackDialog:a4 metricsDictionary:0 error:a5];
}

- (BOOL)runTouchIDAuthorizationDialog:(id)a3 fallbackDialog:(id)a4 metricsDictionary:(id)a5 error:(id *)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v60 = v10;
  int v13 = [v10 paymentSheet];

  if (v13)
  {
    biometricAuthenticationContext = self->_biometricAuthenticationContext;
    int v15 = [v10 paymentSheet];
    [(SSBiometricAuthenticationContext *)biometricAuthenticationContext setPaymentSheet:v15];
  }
  v16 = [(SSBiometricAuthenticationContext *)self->_biometricAuthenticationContext challenge];

  if (!v16)
  {
    v19 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v19)
    {
      v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v24 = [(ISBiometricAuthorizationDialogOperation *)v19 shouldLog];
    if ([(ISBiometricAuthorizationDialogOperation *)v19 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    id v22 = [(ISBiometricAuthorizationDialogOperation *)v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      int v26 = v25;
    }
    else {
      int v26 = v25 & 2;
    }
    if (v26) {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
  v17 = [(ISDataProvider *)self authenticationContext];
  int v18 = [v17 shouldSuppressDialogs];

  if (v18)
  {
    v19 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v19)
    {
      v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v20 = [(ISBiometricAuthorizationDialogOperation *)v19 shouldLog];
    if ([(ISBiometricAuthorizationDialogOperation *)v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    id v22 = [(ISBiometricAuthorizationDialogOperation *)v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      int v23 = v21;
    }
    else {
      int v23 = v21 & 2;
    }
    if (v23)
    {
LABEL_24:
      int v62 = 138543362;
      id v63 = (id)objc_opt_class();
      id v27 = v63;
      LODWORD(v55) = 12;
      int v28 = (void *)_os_log_send_and_compose_impl();

      if (v28)
      {
        v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v62, v55);
        free(v28);
        SSFileLog();
      }
      goto LABEL_42;
    }
LABEL_41:

LABEL_42:
    id v46 = 0;
    LOBYTE(v47) = 0;
    goto LABEL_47;
  }
  v19 = [[ISBiometricAuthorizationDialogOperation alloc] initWithTouchIDDialog:v10 fallbackDialog:v11];
  [(ISBiometricAuthorizationDialogOperation *)v19 setBiometricAuthenticationContext:self->_biometricAuthenticationContext];
  [(ISBiometricAuthorizationDialogOperation *)v19 setMetricsDictionary:v12];
  __int16 v30 = [(SSAuthenticationContext *)self->_authenticationContext signupRequestParameters];
  v31 = [v30 objectForKey:@"product"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v32 = (void *)[NSURL copyDictionaryForQueryString:v31 unescapedValues:1];
    [(ISBiometricAuthorizationDialogOperation *)v19 setBuyParams:v32];
  }
  id v33 = [(SSAuthenticationContext *)self->_authenticationContext HTTPHeaders];
  __int16 v34 = [v33 objectForKey:*MEMORY[0x263F7B788]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISBiometricAuthorizationDialogOperation *)v19 setUserAgent:v34];
  }
  id v35 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  if (!v35)
  {
    id v35 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v36 = [v35 shouldLog];
  if ([v35 shouldLogToDisk]) {
    int v37 = v36 | 2;
  }
  else {
    int v37 = v36;
  }
  v38 = [v35 OSLogObject];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
    int v39 = v37;
  }
  else {
    int v39 = v37 & 2;
  }
  if (v39)
  {
    id v58 = v12;
    v59 = a6;
    id v40 = v11;
    v41 = objc_opt_class();
    v42 = self->_biometricAuthenticationContext;
    id v56 = v41;
    [(SSBiometricAuthenticationContext *)v42 accountName];
    v43 = v57 = v34;
    SSHashIfNeeded();
    int v62 = 138543874;
    id v63 = v41;
    id v11 = v40;
    __int16 v64 = 2112;
    v65 = v42;
    id v12 = v58;
    a6 = v59;
    __int16 v66 = 2114;
    id v67 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = 32;
    v44 = (void *)_os_log_send_and_compose_impl();

    __int16 v34 = v57;
    if (v44)
    {
      v45 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, &v62, v55);
      free(v44);
      SSFileLog();
    }
  }
  else
  {
  }
  id v61 = 0;
  BOOL v47 = [(ISDataProvider *)self runSubOperation:v19 error:&v61];
  id v46 = v61;
  if (v47)
  {
    v48 = [(ISBiometricAuthorizationDialogOperation *)v19 selectedButton];
    [(ISBiometricAuthorizationDialogOperation *)v19 dialog];
    v50 = v49 = a6;
    [(ISDataProvider *)self _performActionsForButton:v48 withDialog:v50];

    v51 = [(ISBiometricAuthorizationDialogOperation *)v19 biometricAuthenticationContext];
    v52 = [v51 accountIdentifier];
    [(ISDataProvider *)self setAuthenticatedAccountDSID:v52];

    a6 = v49;
    v53 = [(ISBiometricAuthorizationDialogOperation *)v19 redirectURL];
    [(ISDataProvider *)self setRedirectURL:v53];
  }
LABEL_47:

  if (a6 && !v47) {
    *a6 = v46;
  }

  return v47;
}

- (void)_performActionsForButton:(id)a3 withDialog:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if ([v6 actionType] == 4) {
    [v6 performDefaultActionForDialog:v5];
  }
}

- (BOOL)_runServerAuthenticationOperation:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = 0;
  BOOL v7 = [(ISDataProvider *)self runSubOperation:v6 error:&v20];
  id v8 = v20;
  if (v7)
  {
    -[ISDataProvider setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", [v6 authenticatedAccountCredentialSource]);
    id v9 = [v6 authenticatedAccountDSID];
    [(ISDataProvider *)self setAuthenticatedAccountDSID:v9];

    id v10 = [v6 redirectURL];
    [(ISDataProvider *)self setRedirectURL:v10];

    goto LABEL_16;
  }
  id v11 = [MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
  if (!v11)
  {
    id v11 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v12 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  v14 = [v11 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    v13 &= 2u;
  }
  if (v13)
  {
    int v15 = objc_opt_class();
    int v21 = 138543618;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v8;
    id v16 = v15;
    LODWORD(v19) = 22;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_14;
    }
    v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v21, v19);
    free(v17);
    SSFileLog();
  }

LABEL_14:
  if (a4) {
    *a4 = v8;
  }
LABEL_16:

  return v7;
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAuthenticationContext:(id)a3
{
}

- (unint64_t)authenticatedAccountCredentialSource
{
  return self->_authenticatedAccountCredentialSource;
}

- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3
{
  self->_authenticatedAccountCredentialSource = a3;
}

- (NSNumber)authenticatedAccountDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
}

- (SSURLBagContext)bagContext
{
  return (SSURLBagContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBagContext:(id)a3
{
}

- (int64_t)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(int64_t)a3
{
  self->_contentLength = a3;
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContentType:(id)a3
{
}

- (int64_t)errorHandlerResponseType
{
  return self->_errorHandlerResponseType;
}

- (void)setErrorHandlerResponseType:(int64_t)a3
{
  self->_errorHandlerResponseType = a3;
}

- (id)output
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setOutput:(id)a3
{
}

- (ISOperation)parentOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentOperation);

  return (ISOperation *)WeakRetained;
}

- (void)setParentOperation:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRedirectURL:(id)a3
{
}

- (SSBiometricAuthenticationContext)biometricAuthenticationContext
{
  return (SSBiometricAuthenticationContext *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBiometricAuthenticationContext:(id)a3
{
}

- (ISBiometricSessionDelegate)biometricSessionDelegate
{
  return self->_biometricSessionDelegate;
}

- (void)setBiometricSessionDelegate:(id)a3
{
  self->_biometricSessionDelegate = (ISBiometricSessionDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong(&self->_output, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_bagContext, 0);
  objc_storeStrong((id *)&self->_authenticatedAccountDSID, 0);

  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end