@interface ISServerAuthenticationOperation
- (BOOL)performsButtonAction;
- (ISDialog)dialog;
- (ISDialogButton)performedButton;
- (ISDialogButton)selectedButton;
- (ISServerAuthenticationOperation)init;
- (NSNumber)authenticatedAccountDSID;
- (NSURL)redirectURL;
- (SSAuthenticationContext)authenticationContext;
- (unint64_t)authenticatedAccountCredentialSource;
- (void)dealloc;
- (void)run;
- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3;
- (void)setAuthenticatedAccountDSID:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setDialog:(id)a3;
- (void)setPerformedButton:(id)a3;
- (void)setPerformsButtonAction:(BOOL)a3;
- (void)setRedirectURL:(id)a3;
- (void)setSelectedButton:(id)a3;
@end

@implementation ISServerAuthenticationOperation

- (ISServerAuthenticationOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISServerAuthenticationOperation;
  result = [(ISOperation *)&v3 init];
  if (result) {
    result->_performsButtonAction = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISServerAuthenticationOperation;
  [(ISServerAuthenticationOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_super v3 = NSClassFromString(&cfstr_Serverauthenti.isa);
  if (v3)
  {
    v4 = objc_msgSend([v3 alloc], "initWithDialog:", -[ISServerAuthenticationOperation dialog](self, "dialog"));
    objc_msgSend(v4, "setAuthenticationContext:", -[ISServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
    objc_msgSend(v4, "setPerformsButtonAction:", -[ISServerAuthenticationOperation performsButtonAction](self, "performsButtonAction"));
    BOOL v5 = [(ISOperation *)self runSubOperation:v4 returningError:v28 + 5];
    *((unsigned char *)v24 + 24) = v5;
    -[ISServerAuthenticationOperation setAuthenticatedAccountCredentialSource:](self, "setAuthenticatedAccountCredentialSource:", [v4 authenticatedAccountCredentialSource]);
    -[ISServerAuthenticationOperation setAuthenticatedAccountDSID:](self, "setAuthenticatedAccountDSID:", [v4 authenticatedAccountDSID]);
    -[ISServerAuthenticationOperation setPerformedButton:](self, "setPerformedButton:", [v4 performedButton]);
    -[ISServerAuthenticationOperation setRedirectURL:](self, "setRedirectURL:", [v4 redirectURL]);
    -[ISServerAuthenticationOperation setSelectedButton:](self, "setSelectedButton:", [v4 selectedButton]);
  }
  else
  {
    v6 = [(ISServerAuthenticationOperation *)self dialog];
    id v7 = [(ISDialog *)v6 copyXPCEncoding];
    v8 = (void *)[objc_alloc(MEMORY[0x263F7B3D8]) initWithEncodedDialog:v7];
    objc_msgSend(v8, "setAuthenticationContext:", -[ISServerAuthenticationOperation authenticationContext](self, "authenticationContext"));
    v9 = (void *)[MEMORY[0x263F7B1F8] sharedAccountsAuthenticationConfig];
    if (!v9) {
      v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v10 = [v9 shouldLog];
    int v11 = [v9 shouldLogToDisk];
    v12 = [v9 OSLogObject];
    if (v11) {
      v10 |= 2u;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v13 = objc_opt_class();
      objc_msgSend((id)objc_msgSend(v8, "authenticationContext"), "accountName");
      uint64_t v14 = SSHashIfNeeded();
      int v33 = 138543874;
      uint64_t v34 = v13;
      __int16 v35 = 2112;
      v36 = v8;
      __int16 v37 = 2114;
      uint64_t v38 = v14;
      LODWORD(v21) = 32;
      v20 = &v33;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v33, v21);
        free(v16);
        v20 = (int *)v17;
        SSFileLog();
      }
    }
    v18 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __38__ISServerAuthenticationOperation_run__block_invoke;
    v22[3] = &unk_264261650;
    v22[4] = self;
    v22[5] = v6;
    v22[7] = &v27;
    v22[8] = &v23;
    v22[6] = v18;
    [v8 startWithAuthenticateResponse:v22];
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v18);
    if (*((unsigned char *)v24 + 24) && [(ISServerAuthenticationOperation *)self performsButtonAction]) {
      [(ISDialogButton *)[(ISServerAuthenticationOperation *)self performedButton] performDefaultActionForDialog:v6];
    }
    id v19 = (id)v28[5];

    xpc_release(v7);
  }
  -[ISOperation setError:](self, "setError:", v28[5], v20);
  [(ISOperation *)self setSuccess:*((unsigned __int8 *)v24 + 24)];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

intptr_t __38__ISServerAuthenticationOperation_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a3;
  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAuthenticatedAccountDSID:", objc_msgSend(a2, "authenticatedAccountIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "setRedirectURL:", objc_msgSend(a2, "redirectURL"));
    BOOL v5 = (void *)[*(id *)(a1 + 40) buttons];
    unint64_t v6 = [a2 performedButtonIndex];
    if (v6 < [v5 count]) {
      objc_msgSend(*(id *)(a1 + 32), "setPerformedButton:", objc_msgSend(v5, "objectAtIndex:", v6));
    }
    unint64_t v7 = [a2 selectedButtonIndex];
    if (v7 < [v5 count]) {
      objc_msgSend(*(id *)(a1 + 32), "setSelectedButton:", objc_msgSend(v5, "objectAtIndex:", v7));
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  v8 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v8);
}

- (SSAuthenticationContext)authenticationContext
{
  return (SSAuthenticationContext *)objc_getProperty(self, a2, 352, 1);
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
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAuthenticatedAccountDSID:(id)a3
{
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDialog:(id)a3
{
}

- (ISDialogButton)performedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 376, 1);
}

- (void)setPerformedButton:(id)a3
{
}

- (BOOL)performsButtonAction
{
  return self->_performsButtonAction;
}

- (void)setPerformsButtonAction:(BOOL)a3
{
  self->_performsButtonAction = a3;
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRedirectURL:(id)a3
{
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSelectedButton:(id)a3
{
}

@end