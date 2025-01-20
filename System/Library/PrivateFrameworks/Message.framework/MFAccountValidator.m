@interface MFAccountValidator
- (BOOL)_incomingServerValid;
- (BOOL)_outgoingServerValid;
- (BOOL)accountIsValid;
- (BOOL)accountSupportsSSL;
- (BOOL)accountValidationCanceled;
- (BOOL)performsValidationInBackground;
- (MFAccount)account;
- (MFAccountValidator)init;
- (MFAccountValidator)initWithPerformsValidationInBackground:(BOOL)a3;
- (MFAccountValidatorDelegate)delegate;
- (MFError)error;
- (MFMonitoredInvocation)validationInvocation;
- (void)_backgroundValidateAccountFinished:(id)a3 authSchemes:(id)a4;
- (void)_validateAccount:(id)a3;
- (void)_validateAccount:(id)a3 withFallbacks:(BOOL)a4;
- (void)_validateAccountWithoutFallbacks:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)stop;
- (void)validateAccount:(id)a3 useSSL:(BOOL)a4;
- (void)validateAccount:(id)a3 useSSL:(BOOL)a4 withCompletion:(id)a5;
- (void)validateAccountWithoutFallbacks:(id)a3;
- (void)validateAccountWithoutFallbacks:(id)a3 withCompletion:(id)a4;
@end

@implementation MFAccountValidator

- (MFAccountValidator)init
{
  return [(MFAccountValidator *)self initWithPerformsValidationInBackground:1];
}

- (MFAccountValidator)initWithPerformsValidationInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFAccountValidator;
  result = [(MFAccountValidator *)&v6 init];
  if (result)
  {
    if (v3) {
      int v5 = 16;
    }
    else {
      int v5 = 0;
    }
    result->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&result->_flags & 0xFFFFFFEF | v5);
  }
  return result;
}

- (void)dealloc
{
  [(MFAccountValidator *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MFAccountValidator;
  [(MFAccountValidator *)&v3 dealloc];
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MFAccountValidator_validateAccount_useSSL___block_invoke;
  v4[3] = &unk_1E5D3B1B0;
  v4[4] = self;
  [(MFAccountValidator *)self validateAccount:a3 useSSL:a4 withCompletion:v4];
}

void __45__MFAccountValidator_validateAccount_useSSL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = (id *)(*(void *)(a1 + 32) + 80);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained accountValidator:*(void *)(a1 + 32) finishedValidationOfAccount:v6 usedSSL:a3];
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  objc_storeStrong((id *)&self->_account, a3);
  id v12 = a3;
  id v9 = a5;
  self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v6);
  v10 = _Block_copy(v9);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v10;

  [(MFAccountValidator *)self _validateAccount:self->_account withFallbacks:1];
}

- (void)validateAccountWithoutFallbacks:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke;
  v3[3] = &unk_1E5D3B1B0;
  v3[4] = self;
  [(MFAccountValidator *)self validateAccountWithoutFallbacks:a3 withCompletion:v3];
}

void __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = (id *)(*(void *)(a1 + 32) + 80);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained accountValidator:*(void *)(a1 + 32) finishedValidationOfAccount:v6 usedSSL:a3];
}

- (void)validateAccountWithoutFallbacks:(id)a3 withCompletion:(id)a4
{
  objc_storeStrong((id *)&self->_account, a3);
  id v10 = a3;
  id v7 = a4;
  v8 = _Block_copy(v7);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v8;

  [(MFAccountValidator *)self _validateAccount:self->_account withFallbacks:0];
}

- (MFAccount)account
{
  return self->_account;
}

- (void)_backgroundValidateAccountFinished:(id)a3 authSchemes:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v9 = [(MFActivityMonitor *)self->_accountValidationActivity error];
  if ([v9 code]) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  uint64_t v11 = 48;
  if (v7 == v8)
  {
    uint64_t v11 = 56;
    uint64_t v12 = 72;
  }
  else
  {
    uint64_t v12 = 64;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v11), v9);
  objc_storeStrong((id *)((char *)&self->super.isa + v12), v10);
  accountValidationActivity = self->_accountValidationActivity;
  self->_accountValidationActivity = 0;

  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)_validateAccount:(id)a3
{
  v66[16] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  v58 = +[MFActivityMonitor currentMonitor];
  v53 = [v3 defaultConnectionSettings];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (([(id)objc_opt_class() isSSLEditable] & 1) == 0)
  {
    id v6 = [(id)objc_opt_class() predefinedValueForKey:@"SSLEnabled"];
    self->_$0E8FE02B67A2F718BF097A78E2A975F7 flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | [v6 BOOLValue]);
  }
  char v7 = [v58 shouldCancel];
  $0E8FE02B67A2F718BF097A78E2A975F7 flags = self->_flags;
  if (*(unsigned char *)&flags) {
    char v9 = v7;
  }
  else {
    char v9 = 1;
  }
  if (v9)
  {
    id v56 = 0;
    goto LABEL_24;
  }
  id v60 = 0;
  uint64_t v10 = _openConnectionForAccount(v3, 1, (uint64_t)&v60);
  id v56 = v60;
  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = [v58 error];
    if ([v12 code] == 1034)
    {
      BOOL v11 = 0;
    }
    else
    {
      v13 = [v58 error];
      BOOL v11 = [v13 code] != 1045;
    }
  }
  if (v4 == v5) {
    int v14 = 4;
  }
  else {
    int v14 = 2;
  }
  if (v4 == v5) {
    int v15 = -5;
  }
  else {
    int v15 = -3;
  }
  if (!v11) {
    int v14 = 0;
  }
  $0E8FE02B67A2F718BF097A78E2A975F7 flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & v15 | v14);
  self->_$0E8FE02B67A2F718BF097A78E2A975F7 flags = flags;
  if (!v10)
  {
LABEL_24:
    if (*(unsigned char *)&flags) {
      goto LABEL_30;
    }
    if ([v58 shouldCancel]) {
      goto LABEL_30;
    }
    [v3 applySettingsAsDefault:v53];
    id v59 = v56;
    uint64_t v17 = _openConnectionForAccount(v3, 0, (uint64_t)&v59);
    id v18 = v59;

    id v56 = v18;
    v16 = (void *)v17;
    if (!v17)
    {
LABEL_30:
      v20 = [v58 error];
      v21 = [v20 userInfo];
      v22 = [v21 objectForKey:@"MFSSLErrorCertificateKey"];
      BOOL v23 = v22 == 0;

      if (!v23)
      {
        v19 = 0;
        goto LABEL_100;
      }
      if (v4 == v5) {
        MFLookupLocalizedString(@"SMTP_CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field.", @"Assistant");
      }
      else {
      v16 = MFLookupLocalizedString(@"CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field.", @"Assistant");
      }
      v47 = NSString;
      v48 = _accountTypeString(v3);
      v49 = [v3 hostname];
      v50 = objc_msgSend(v47, "stringWithFormat:", v16, v48, v49);

      v51 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v50];
      [v58 setError:v51];

      v19 = 0;
LABEL_99:

      goto LABEL_100;
    }
    goto LABEL_27;
  }
  v16 = (void *)v10;
LABEL_27:
  [v3 applySettingsAsDefault:v56];
  v19 = [MEMORY[0x1E4F607C8] authenticationSchemesForAccount:v3 connection:v16];
  if (([v3 requiresAuthentication] & 1) == 0
    && (v4 != v5 || ![v3 shouldUseAuthentication]))
  {
LABEL_96:
    _closeConnection(v16);
    goto LABEL_99;
  }
  v54 = [MEMORY[0x1E4F607C8] schemeWithName:*MEMORY[0x1E4F607A8]];
  if ([v19 count]) {
    v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v19];
  }
  else {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v54, 0);
  }
  unsigned int v24 = 0;
  LOBYTE(v25) = 0;
  while (1)
  {
    v26 = v19;
    if (v24) {
      break;
    }
    if ([v3 usesSSL])
    {
      if ([v57 indexOfObject:v54] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v27 = v54;
        if (v54) {
          goto LABEL_61;
        }
      }
    }
LABEL_47:
    id v28 = v57;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v62;
LABEL_49:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v61 + 1) + 8 * v32);
        if ([v33 hasEncryption]) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v29 countByEnumeratingWithState:&v61 objects:v66 count:16];
          v19 = v26;
          if (v30) {
            goto LABEL_49;
          }
          goto LABEL_55;
        }
      }
      id v34 = v33;

      v19 = v26;
      if (v34) {
        goto LABEL_58;
      }
    }
    else
    {
LABEL_55:
    }
    id v34 = [v29 firstObject];
LABEL_58:

    if (!v34)
    {
      if ([v3 requiresAuthentication])
      {
        id v27 = v54;
LABEL_61:
        id v34 = v27;
        goto LABEL_63;
      }
      id v34 = 0;
    }
LABEL_63:
    [v58 setError:0];
    [v3 setPreferredAuthScheme:v34];
    if (v16) {
      goto LABEL_64;
    }
    v16 = objc_msgSend(objc_allocWithZone((Class)objc_msgSend(v3, "connectionClass")), "init");
    if ([v16 connectUsingAccount:v3])
    {
      if (v16)
      {
LABEL_64:
        char v35 = 0;
        if (([v16 authenticateUsingAccount:v3] & 1) == 0) {
          goto LABEL_74;
        }
        goto LABEL_65;
      }
    }
    else
    {

      v16 = 0;
    }
    char v35 = 1;
    if ((v25 & 1) == 0)
    {
LABEL_74:
      LOBYTE(v25) = 0;
      goto LABEL_78;
    }
    if ([v19 indexOfObject:v34] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_77;
    }
LABEL_65:
    if (v19 && [v19 count])
    {
      v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count") + 1);

      [v36 addObjectsFromArray:v36];
      [v36 addObject:v34];
      LOBYTE(v25) = 1;
      v19 = v36;
      goto LABEL_78;
    }
    if (v34)
    {
      id v65 = v34;
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];

      LOBYTE(v25) = 1;
      v19 = (void *)v37;
    }
    else
    {
LABEL_77:
      LOBYTE(v25) = 1;
    }
LABEL_78:
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      v43 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:0];
      [v58 setError:v43];
LABEL_89:

      goto LABEL_90;
    }
    if ((v25 & 1) == 0)
    {
      v38 = [v58 error];
      BOOL v39 = v38 == 0;

      if (!v39)
      {
        v40 = [v58 error];
        LODWORD(v25) = [v3 shouldEnableAfterError:v40];

        if (v25)
        {
          char v41 = [v3 enableAccount];
          LOBYTE(v25) = 0;
          char v42 = v24 < 3 ? v41 : 0;
          if (v42) {
            goto LABEL_91;
          }
        }
        goto LABEL_90;
      }
      v44 = NSString;
      uint64_t v25 = MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed");
      v45 = [v3 username];
      v43 = objc_msgSend(v44, "stringWithFormat:", v25, v45);

      v46 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v43];
      [v58 setError:v46];

      LOBYTE(v25) = 0;
      goto LABEL_89;
    }
    LOBYTE(v25) = 1;
LABEL_90:
    [v57 removeObject:v34];
LABEL_91:
    if ((v35 & 1) == 0)
    {
      _closeConnection(v16);
    }
    v16 = 0;
    ++v24;
  }
  if ((v25 & 1) == 0 && [v57 count] && (objc_msgSend(v58, "shouldCancel") & 1) == 0) {
    goto LABEL_47;
  }

  if (v16) {
    goto LABEL_96;
  }
LABEL_100:
  v66[0] = 0;
  v52 = [(MFAccountValidator *)self pep_getInvocation:v66];
  [v52 _backgroundValidateAccountFinished:v3 authSchemes:v19];

  [v66[0] retainArguments];
  [v66[0] performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:1];
}

- (void)_validateAccountWithoutFallbacks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MFActivityMonitor currentMonitor];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  if ([v5 shouldCancel])
  {
    id v8 = 0;
    char v9 = 0;
    goto LABEL_5;
  }
  id v28 = 0;
  char v9 = _openConnectionForAccount(v4, [v4 usesSSL], (uint64_t)&v28);
  id v8 = v28;
  if (v9 && ([v5 shouldCancel] & 1) == 0)
  {
    if (([v4 requiresAuthentication] & 1) == 0
      && (v6 != v7 || ![v4 shouldUseAuthentication]))
    {
      goto LABEL_22;
    }
    char v13 = [v9 authenticateUsingAccount:v4];
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      id v18 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:0];
      [v5 setError:v18];
    }
    else
    {
      if (v13) {
        goto LABEL_20;
      }
      int v14 = [v5 error];

      if (v14) {
        goto LABEL_20;
      }
      int v15 = NSString;
      v16 = MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed");
      uint64_t v17 = [v4 username];
      id v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

      v19 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1032 localizedDescription:v18];
      [v5 setError:v19];
    }
LABEL_20:
    _closeConnection(v9);
    v20 = v9;
    char v9 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_5:
  uint64_t v10 = [v5 error];
  BOOL v11 = [v10 userInfo];
  uint64_t v12 = [v11 objectForKey:@"MFSSLErrorCertificateKey"];

  if (!v12)
  {
    if (v6 == v7) {
      MFLookupLocalizedString(@"SMTP_CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field.", @"Assistant");
    }
    else {
    v20 = MFLookupLocalizedString(@"CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field.", @"Assistant");
    }
    v21 = NSString;
    v22 = _accountTypeString(v4);
    BOOL v23 = [v4 hostname];
    unsigned int v24 = objc_msgSend(v21, "stringWithFormat:", v20, v22, v23);

    uint64_t v25 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v24];
    [v5 setError:v25];

    goto LABEL_21;
  }
LABEL_22:
  id v27 = 0;
  v26 = [(MFAccountValidator *)self pep_getInvocation:&v27];
  [v26 _backgroundValidateAccountFinished:v4 authSchemes:0];

  [v27 retainArguments];
  [v27 performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:1];
}

- (BOOL)_incomingServerValid
{
  incomingServerValidationError = self->_incomingServerValidationError;
  return !incomingServerValidationError || [(MFError *)incomingServerValidationError code] == 0;
}

- (BOOL)_outgoingServerValid
{
  smtpServerValidationError = self->_smtpServerValidationError;
  return !smtpServerValidationError || [(MFError *)smtpServerValidationError code] == 0;
}

- (void)stop
{
  *(_DWORD *)&self->_flags |= 8u;
  [(MFActivityMonitor *)self->_accountValidationActivity cancel];
}

- (BOOL)accountValidationCanceled
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_validateAccount:(id)a3 withFallbacks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_accountValidationActivity)
  {
    id v14 = v6;
    uint64_t v7 = MFLookupLocalizedString(@"CHECKING_CONNECTION", @"Checking connection", @"Assistant");
    if (v4) {
      id v8 = sel__validateAccount_;
    }
    else {
      id v8 = sel__validateAccountWithoutFallbacks_;
    }
    char v9 = +[MFMonitoredInvocation invocationWithSelector:v8 target:self object:v14 taskName:v7 priority:-1 canBeCancelled:1];

    uint64_t v10 = [(MFMonitoredInvocation *)v9 monitor];
    accountValidationActivity = self->_accountValidationActivity;
    self->_accountValidationActivity = v10;

    [(MFActivityMonitor *)self->_accountValidationActivity setCanBeCancelled:1];
    if ([(MFAccountValidator *)self performsValidationInBackground])
    {
      validationInvocation = +[MFInvocationQueue sharedInvocationQueue];
      [validationInvocation addInvocation:v9];
    }
    else
    {
      if (v9 == self->_validationInvocation)
      {
LABEL_10:

        id v6 = v14;
        goto LABEL_11;
      }
      char v13 = v9;
      validationInvocation = self->_validationInvocation;
      self->_validationInvocation = v13;
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)performsValidationInBackground
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (MFMonitoredInvocation)validationInvocation
{
  if ([(MFAccountValidator *)self performsValidationInBackground]) {
    id v3 = 0;
  }
  else {
    id v3 = self->_validationInvocation;
  }
  return v3;
}

- (BOOL)accountIsValid
{
  id v3 = [(MFAccountValidator *)self account];
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    BOOL v5 = [(MFAccountValidator *)self _outgoingServerValid];
  }
  else {
    BOOL v5 = [(MFAccountValidator *)self _incomingServerValid];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)accountSupportsSSL
{
  id v3 = [(MFAccountValidator *)self account];
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    int v5 = 4;
  }
  else {
    int v5 = 2;
  }
  BOOL v6 = (*(_DWORD *)&self->_flags & v5) != 0;

  return v6;
}

- (MFError)error
{
  id v3 = [(MFAccountValidator *)self account];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = 48;
  if (v4 == v5) {
    uint64_t v6 = 56;
  }
  uint64_t v7 = (MFError *)*(id *)((char *)&self->super.isa + v6);

  return v7;
}

- (MFAccountValidatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFAccountValidatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_smtpServerAuthSchemes, 0);
  objc_storeStrong((id *)&self->_incomingServerAuthSchemes, 0);
  objc_storeStrong((id *)&self->_smtpServerValidationError, 0);
  objc_storeStrong((id *)&self->_incomingServerValidationError, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_validationInvocation, 0);
  objc_storeStrong((id *)&self->_accountValidationActivity, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end