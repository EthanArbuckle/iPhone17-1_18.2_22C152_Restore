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
- (MFError)error;
- (MFMonitoredInvocation)validationInvocation;
- (id)_ispAccountInfo;
- (id)delegate;
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
  self->_delegate = 0;

  self->_account = 0;
  self->_validationInvocation = 0;

  self->_accountValidationActivity = 0;
  self->_incomingServerValidationError = 0;

  self->_smtpServerValidationError = 0;
  self->_incomingServerAuthSchemes = 0;

  self->_smtpServerAuthSchemes = 0;
  self->_completionBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MFAccountValidator;
  [(MFAccountValidator *)&v3 dealloc];
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MFAccountValidator_validateAccount_useSSL___block_invoke;
  v4[3] = &unk_1E6866490;
  v4[4] = self;
  [(MFAccountValidator *)self validateAccount:a3 useSSL:a4 withCompletion:v4];
}

uint64_t __45__MFAccountValidator_validateAccount_useSSL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) accountValidator:*(void *)(a1 + 32) finishedValidationOfAccount:a2 usedSSL:a3];
}

- (void)validateAccount:(id)a3 useSSL:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  self->_account = (MFAccount *)a3;
  self->_flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v6);
  self->_completionBlock = (id)[a5 copy];
  account = self->_account;
  [(MFAccountValidator *)self _validateAccount:account withFallbacks:1];
}

- (void)validateAccountWithoutFallbacks:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke;
  v3[3] = &unk_1E6866490;
  v3[4] = self;
  [(MFAccountValidator *)self validateAccountWithoutFallbacks:a3 withCompletion:v3];
}

uint64_t __54__MFAccountValidator_validateAccountWithoutFallbacks___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) accountValidator:*(void *)(a1 + 32) finishedValidationOfAccount:a2 usedSSL:a3];
}

- (void)validateAccountWithoutFallbacks:(id)a3 withCompletion:(id)a4
{
  account = self->_account;
  if (account != a3)
  {

    self->_account = (MFAccount *)a3;
  }
  self->_completionBlock = (id)[a4 copy];
  v8 = self->_account;
  [(MFAccountValidator *)self _validateAccount:v8 withFallbacks:0];
}

- (MFAccount)account
{
  return self->_account;
}

- (id)_ispAccountInfo
{
  return 0;
}

- (void)_backgroundValidateAccountFinished:(id)a3 authSchemes:(id)a4
{
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = [(MFActivityMonitor *)self->_accountValidationActivity error];
  uint64_t v9 = [v8 code];
  if (v6 == v7)
  {

    self->_smtpServerValidationError = (MFError *)v8;
    if (v9) {
      v11 = 0;
    }
    else {
      v11 = (NSArray *)a4;
    }
    self->_smtpServerAuthSchemes = v11;
  }
  else
  {

    self->_incomingServerValidationError = (MFError *)v8;
    if (v9) {
      v10 = 0;
    }
    else {
      v10 = (NSArray *)a4;
    }
    self->_incomingServerAuthSchemes = v10;
  }

  self->_accountValidationActivity = 0;
  v12 = (void (*)(void))*((void *)self->_completionBlock + 2);
  v12();
}

- (void)_validateAccount:(id)a3
{
  v42[16] = *(id *)MEMORY[0x1E4F143B8];
  id v35 = +[MFActivityMonitor currentMonitor];
  uint64_t v36 = 0;
  uint64_t v5 = [a3 defaultConnectionSettings];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  if (([(id)objc_opt_class() isSSLEditable] & 1) == 0) {
    self->_$0E8FE02B67A2F718BF097A78E2A975F7 flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "predefinedValueForKey:", @"SSLEnabled"), "BOOLValue"));
  }
  char v8 = [v35 shouldCancel];
  v34 = self;
  $0E8FE02B67A2F718BF097A78E2A975F7 flags = self->_flags;
  if ((v8 & 1) != 0
    || (*(unsigned char *)&flags & 1) == 0
    || ((v10 = _openConnectionForAccount(a3, 1, (uint64_t)&v36)) == 0
      ? (objc_msgSend((id)objc_msgSend(v35, "error"), "code") != 1034
       ? (BOOL v11 = objc_msgSend((id)objc_msgSend(v35, "error"), "code") != 1045)
       : (BOOL v11 = 0))
      : (BOOL v11 = 1),
        v6 != v7 ? (int v12 = 2) : (int v12 = 4),
        v6 != v7 ? (int v13 = -3) : (int v13 = -5),
        !v11 ? (int v14 = 0) : (int v14 = v12),
        $0E8FE02B67A2F718BF097A78E2A975F7 flags = ($0E8FE02B67A2F718BF097A78E2A975F7)(*(_DWORD *)&self->_flags & v13 | v14),
        self->_$0E8FE02B67A2F718BF097A78E2A975F7 flags = flags,
        !v10))
  {
    if ((*(unsigned char *)&flags & 1) != 0
      || ([v35 shouldCancel] & 1) != 0
      || ([a3 applySettingsAsDefault:v5], (v10 = _openConnectionForAccount(a3, 0, (uint64_t)&v36)) == 0))
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "error"), "userInfo"), "objectForKey:", @"MFSSLErrorCertificateKey"))
      {
        if (v6 == v7) {
          uint64_t v19 = MFLookupLocalizedString(@"SMTP_CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field.", @"Assistant");
        }
        else {
          uint64_t v19 = MFLookupLocalizedString(@"CONNECTION_FAILED_MESSAGE_FORMAT", @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field.", @"Assistant");
        }
        [v35 setError:+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1030, objc_msgSend(NSString, "stringWithFormat:", v19, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname")))];
      }
      id v15 = 0;
      goto LABEL_97;
    }
  }
  [a3 applySettingsAsDefault:v36];
  id v15 = +[MFAuthScheme authSchemesForAccount:a3 connection:v10];
  if (([a3 requiresAuthentication] & 1) == 0
    && (v6 != v7 || ![a3 shouldUseAuthentication]))
  {
LABEL_93:
    _closeConnection(v10);

    goto LABEL_97;
  }
  v33 = +[MFAuthScheme schemeWithName:&stru_1F265CF90];
  BOOL v16 = [v15 count] == 0;
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v16) {
    uint64_t v18 = objc_msgSend(v17, "initWithObjects:", v33, 0);
  }
  else {
    uint64_t v18 = [v17 initWithArray:v15];
  }
  v20 = (void *)v18;
  unsigned int v21 = 0;
  char v22 = 0;
  while (1)
  {
    if (!v21)
    {
      if ([a3 usesSSL])
      {
        BOOL v23 = objc_msgSend(v20, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL || v33 == 0;
        v24 = v33;
        if (!v23) {
          goto LABEL_61;
        }
      }
      goto LABEL_44;
    }
    if (v22 & 1) != 0 || ![v20 count] || (objc_msgSend(v35, "shouldCancel")) {
      break;
    }
LABEL_44:
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v25 = [v20 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v38;
LABEL_46:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v20);
        }
        v28 = *(void **)(*((void *)&v37 + 1) + 8 * v27);
        if ([v28 hasEncryption]) {
          break;
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v20 countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v25) {
            goto LABEL_46;
          }
          goto LABEL_54;
        }
      }
      if (v28) {
        goto LABEL_57;
      }
    }
LABEL_54:
    if ([v20 count]) {
      v28 = (void *)[v20 objectAtIndex:0];
    }
    else {
      v28 = 0;
    }
LABEL_57:
    v24 = v28;
    if (!v24)
    {
      if ([a3 requiresAuthentication]) {
        v24 = v33;
      }
      else {
        v24 = 0;
      }
    }
LABEL_61:
    [v35 setError:0];
    [a3 setPreferredAuthScheme:v24];
    if (v10) {
      goto LABEL_62;
    }
    v10 = objc_msgSend(objc_allocWithZone((Class)objc_msgSend(a3, "connectionClass")), "init");
    if ([v10 connectUsingAccount:a3])
    {
      if (v10)
      {
LABEL_62:
        char v29 = 0;
        if (([v10 authenticateUsingAccount:a3] & 1) == 0) {
          goto LABEL_72;
        }
        goto LABEL_63;
      }
    }
    else
    {

      v10 = 0;
    }
    char v29 = 1;
    if ((v22 & 1) == 0)
    {
LABEL_72:
      char v22 = 0;
      goto LABEL_75;
    }
LABEL_63:
    if ([v15 indexOfObject:v24] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 && [v15 count])
      {
        id v15 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count") + 1);
        [v15 addObjectsFromArray:v15];
        [v15 addObject:v24];
      }
      else
      {
        v41 = v24;
        id v15 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      }
    }
    char v22 = 1;
LABEL_75:
    if ((*(unsigned char *)&v34->_flags & 8) != 0)
    {
      v30 = v10;
      objc_msgSend(v35, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1028, 0));
      [v20 removeObject:v24];
    }
    else
    {
      if (v22)
      {
        char v22 = 1;
        v30 = v10;
      }
      else
      {
        v30 = v10;
        if (![v35 error])
        {
          [v35 setError:+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1032, objc_msgSend(NSString, "stringWithFormat:", MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed", objc_msgSend(a3, "username")))];
          [v20 removeObject:v24];
LABEL_91:
          v10 = 0;
          char v22 = 0;
          goto LABEL_88;
        }
        if (objc_msgSend(a3, "shouldEnableAfterError:", objc_msgSend(v35, "error")))
        {
          char v31 = [a3 enableAccount];
          char v32 = v21 < 3 ? v31 : 0;
          if (v32) {
            goto LABEL_91;
          }
        }
        char v22 = 0;
      }
      [v20 removeObject:v24];
    }
    v10 = 0;
LABEL_88:
    ++v21;
    if ((v29 & 1) == 0)
    {
      _closeConnection(v30);

      v10 = 0;
    }
  }

  if (v10) {
    goto LABEL_93;
  }
LABEL_97:
  v42[0] = 0;
  objc_msgSend((id)-[MFAccountValidator pep_getInvocation:](v34, "pep_getInvocation:", v42), "_backgroundValidateAccountFinished:authSchemes:", a3, v15);
  [v42[0] performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:1];
}

- (void)_validateAccountWithoutFallbacks:(id)a3
{
  id v5 = +[MFActivityMonitor currentMonitor];
  uint64_t v17 = 0;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  if (([v5 shouldCancel] & 1) == 0)
  {
    char v8 = _openConnectionForAccount(a3, [a3 usesSSL], (uint64_t)&v17);
    if (v8)
    {
      uint64_t v9 = v8;
      if (([v5 shouldCancel] & 1) == 0)
      {
        if (([a3 requiresAuthentication] & 1) == 0
          && (v6 != v7 || ![a3 shouldUseAuthentication]))
        {
          goto LABEL_20;
        }
        char v12 = [v9 authenticateUsingAccount:a3];
        if ((*(unsigned char *)&self->_flags & 8) != 0)
        {
          uint64_t v14 = 1028;
          uint64_t v13 = 0;
        }
        else
        {
          if ((v12 & 1) != 0 || [v5 error]) {
            goto LABEL_19;
          }
          uint64_t v13 = [NSString stringWithFormat:MFLookupLocalizedString(@"FAILED_LOGIN", @"The user name or password for “%@” is incorrect.", @"Delayed", objc_msgSend(a3, "username")];
          uint64_t v14 = 1032;
        }
        objc_msgSend(v5, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", v14, v13));
LABEL_19:
        _closeConnection(v9);

        goto LABEL_20;
      }
    }
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "error"), "userInfo"), "objectForKey:", @"MFSSLErrorCertificateKey"))
  {
    if (v6 == v7)
    {
      v10 = @"SMTP_CONNECTION_FAILED_MESSAGE_FORMAT";
      BOOL v11 = @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Outgoing Mail Server” field.";
    }
    else
    {
      v10 = @"CONNECTION_FAILED_MESSAGE_FORMAT";
      BOOL v11 = @"The %@ server “%@” is not responding. Check your network connection and that you entered the correct information in the “Incoming Mail Server” field.";
    }
    uint64_t v15 = MFLookupLocalizedString((uint64_t)v10, (uint64_t)v11, @"Assistant");
    [v5 setError:+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1030, objc_msgSend(NSString, "stringWithFormat:", v15, objc_msgSend((id)objc_opt_class(), "accountTypeString"), objc_msgSend(a3, "hostname")))];
  }
LABEL_20:
  id v16 = 0;
  objc_msgSend((id)-[MFAccountValidator pep_getInvocation:](self, "pep_getInvocation:", &v16), "_backgroundValidateAccountFinished:authSchemes:", a3, 0);
  [v16 performSelectorOnMainThread:sel_invoke withObject:0 waitUntilDone:1];
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
  if (!self->_accountValidationActivity)
  {
    id v5 = &selRef__validateAccount_;
    if (!a4) {
      id v5 = &selRef__validateAccountWithoutFallbacks_;
    }
    uint64_t v6 = +[MFMonitoredInvocation invocationWithSelector:*v5 target:self object:a3 taskName:MFLookupLocalizedString(@"CHECKING_CONNECTION", @"Checking connection", @"Assistant") priority:-1 canBeCancelled:1];

    uint64_t v7 = [(MFMonitoredInvocation *)v6 monitor];
    self->_accountValidationActivity = v7;
    [(MFActivityMonitor *)v7 setCanBeCancelled:1];
    if ([(MFAccountValidator *)self performsValidationInBackground])
    {
      id v8 = +[MFInvocationQueue sharedInvocationQueue];
      [v8 addInvocation:v6];
    }
    else
    {
      validationInvocation = self->_validationInvocation;
      if (v6 != validationInvocation)
      {

        self->_validationInvocation = v6;
      }
    }
  }
}

- (BOOL)performsValidationInBackground
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (MFMonitoredInvocation)validationInvocation
{
  if ([(MFAccountValidator *)self performsValidationInBackground]) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = self->_validationInvocation;
  }
  return v3;
}

- (BOOL)accountIsValid
{
  [(MFAccountValidator *)self account];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    return [(MFAccountValidator *)self _outgoingServerValid];
  }
  else
  {
    return [(MFAccountValidator *)self _incomingServerValid];
  }
}

- (BOOL)accountSupportsSSL
{
  [(MFAccountValidator *)self account];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  return (*(_DWORD *)&self->_flags & v4) != 0;
}

- (MFError)error
{
  [(MFAccountValidator *)self account];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = 48;
  if (v3 == v4) {
    uint64_t v5 = 56;
  }
  return *(MFError **)((char *)&self->super.isa + v5);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

@end