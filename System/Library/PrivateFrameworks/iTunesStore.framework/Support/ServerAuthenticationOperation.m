@interface ServerAuthenticationOperation
- (BOOL)_copyAccountIdentifier:(id *)a3 returningError:(id *)a4;
- (BOOL)_copySelectedButton:(id *)a3 returningError:(id *)a4;
- (BOOL)_isLocalizationAlreadyConfiguredForAuthContext:(id)a3;
- (BOOL)_shouldAuthenticateForButton:(id)a3;
- (BOOL)_shouldSkipInitialDialog:(id)a3;
- (BOOL)performsButtonAction;
- (ISDialog)dialog;
- (ISDialogButton)performedButton;
- (ISDialogButton)selectedButton;
- (NSNumber)authenticatedAccountDSID;
- (NSURL)redirectURL;
- (SSAuthenticationContext)authenticationContext;
- (ServerAuthenticationOperation)init;
- (ServerAuthenticationOperation)initWithDialog:(id)a3;
- (id)_copyAuthenticationContext;
- (id)_copyButtonToSkipDialog:(id)a3;
- (unint64_t)authenticatedAccountCredentialSource;
- (void)_handleSelectedButton:(id)a3;
- (void)run;
- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setPerformsButtonAction:(BOOL)a3;
@end

@implementation ServerAuthenticationOperation

- (ServerAuthenticationOperation)init
{
  if (!+[SSDevice deviceIsInternalBuild]) {
    goto LABEL_14;
  }
  v3 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_12;
  }
  v7 = objc_opt_class();
  id v8 = v7;
  v9 = +[SSStackShot generateSymbolicatedStackShot];
  int v15 = 138543618;
  v16 = v7;
  __int16 v17 = 2114;
  v18 = v9;
  LODWORD(v13) = 22;
  v12 = &v15;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v15, v13);
    free(v10);
    v12 = (int *)v6;
    SSFileLog();
LABEL_12:
  }
LABEL_14:
  v14.receiver = self;
  v14.super_class = (Class)ServerAuthenticationOperation;
  result = [(ServerAuthenticationOperation *)&v14 init];
  if (result) {
    result->_performsButtonAction = 1;
  }
  return result;
}

- (ServerAuthenticationOperation)initWithDialog:(id)a3
{
  id v5 = a3;
  v6 = [(ServerAuthenticationOperation *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dialog, a3);
  }

  return v7;
}

- (NSNumber)authenticatedAccountDSID
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_authenticatedAccountDSID;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_authenticationContext;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (ISDialog)dialog
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_dialog;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (ISDialogButton)performedButton
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_performedButton;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (BOOL)performsButtonAction
{
  [(ServerAuthenticationOperation *)self lock];
  BOOL performsButtonAction = self->_performsButtonAction;
  [(ServerAuthenticationOperation *)self unlock];
  return performsButtonAction;
}

- (NSURL)redirectURL
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_redirectURL;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (ISDialogButton)selectedButton
{
  [(ServerAuthenticationOperation *)self lock];
  v3 = self->_selectedButton;
  [(ServerAuthenticationOperation *)self unlock];

  return v3;
}

- (void)setAuthenticationContext:(id)a3
{
  v6 = (SSAuthenticationContext *)a3;
  [(ServerAuthenticationOperation *)self lock];
  if (self->_authenticationContext != v6)
  {
    unsigned int v4 = (SSAuthenticationContext *)[(SSAuthenticationContext *)v6 copy];
    authenticationContext = self->_authenticationContext;
    self->_authenticationContext = v4;
  }
  [(ServerAuthenticationOperation *)self unlock];
}

- (void)setPerformsButtonAction:(BOOL)a3
{
  [(ServerAuthenticationOperation *)self lock];
  self->_BOOL performsButtonAction = a3;

  [(ServerAuthenticationOperation *)self unlock];
}

- (void)run
{
  v3 = [(ServerAuthenticationOperation *)self dialog];
  if ([(ServerAuthenticationOperation *)self _shouldSkipInitialDialog:v3])
  {
    id v4 = [(ServerAuthenticationOperation *)self _copyButtonToSkipDialog:v3];
    id v5 = 0;
  }
  else
  {
    id v26 = 0;
    id v27 = 0;
    unsigned int v6 = [(ServerAuthenticationOperation *)self _copySelectedButton:&v27 returningError:&v26];
    id v4 = v27;
    id v5 = v26;
    if (!v6)
    {
      v12 = 0;
      uint64_t v11 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  if (v4)
  {
    if ([(ServerAuthenticationOperation *)self _shouldAuthenticateForButton:v4])
    {
      id v24 = v5;
      id v25 = 0;
      unsigned int v7 = [(ServerAuthenticationOperation *)self _copyAccountIdentifier:&v25 returningError:&v24];
      id v8 = v25;
      id v9 = v25;
      id v10 = v24;

      if (v7)
      {
        [(ServerAuthenticationOperation *)self lock];
        objc_storeStrong((id *)&self->_authenticatedAccountDSID, v8);
        [(ServerAuthenticationOperation *)self unlock];
        [(ServerAuthenticationOperation *)self _handleSelectedButton:v4];
        uint64_t v11 = 1;
LABEL_29:
        v12 = v4;
        [(ServerAuthenticationOperation *)self lock];
        objc_storeStrong((id *)&self->_selectedButton, v4);
        [(ServerAuthenticationOperation *)self unlock];
        id v4 = v9;
        id v5 = v10;
        goto LABEL_30;
      }

      if (ISErrorIsEqual())
      {
        v21 = [v3 buttons];
        id v4 = [v21 firstObject];

        if ([(ServerAuthenticationOperation *)self performsButtonAction]) {
          [v4 performDefaultActionForDialog:v3];
        }
      }
      else
      {
        id v4 = 0;
      }
LABEL_28:
      uint64_t v11 = 0;
      goto LABEL_29;
    }
    uint64_t v13 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v13)
    {
      uint64_t v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      __int16 v17 = objc_opt_class();
      int v28 = 138543362;
      v29 = v17;
      id v18 = v17;
      LODWORD(v23) = 12;
      v22 = &v28;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_21:

        ISError();
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if ([(ServerAuthenticationOperation *)self performsButtonAction])
        {
          v20 = [(ServerAuthenticationOperation *)self dialog];
          [v4 performDefaultActionForDialog:v20];
        }
        else
        {
          [(ServerAuthenticationOperation *)self lock];
          objc_storeStrong((id *)&self->_performedButton, v4);
          [(ServerAuthenticationOperation *)self unlock];
        }
        id v9 = 0;
        goto LABEL_28;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v28, v23);
      free(v19);
      v22 = (int *)v16;
      SSFileLog();
    }

    goto LABEL_21;
  }
  v12 = 0;
  uint64_t v11 = 0;
LABEL_31:
  [(ServerAuthenticationOperation *)self setError:v5];
  [(ServerAuthenticationOperation *)self setSuccess:v11];
}

- (BOOL)_copyAccountIdentifier:(id *)a3 returningError:(id *)a4
{
  id v6 = [(ServerAuthenticationOperation *)self _copyAuthenticationContext];
  unsigned int v7 = &syslog_ptr;
  id v8 = +[SSLogConfig sharedAccountsAuthenticationConfig];
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
  uint64_t v11 = [v8 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    int v12 = v10;
  }
  else {
    int v12 = v10 & 2;
  }
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v13;
    int v15 = AMSLogKey();
    v16 = [(ServerAuthenticationOperation *)self redirectURL];
    int v35 = 138543874;
    v36 = v13;
    __int16 v37 = 2114;
    id v38 = v15;
    __int16 v39 = 2114;
    v40 = v16;
    LODWORD(v31) = 32;
    v30 = &v35;
    __int16 v17 = (void *)_os_log_send_and_compose_impl();

    unsigned int v7 = &syslog_ptr;
    if (v17)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v35, v31);
      id v18 = (int *)objc_claimAutoreleasedReturnValue();
      free(v17);
      v30 = v18;
      SSFileLog();
    }
  }
  else
  {
  }
  id v33 = 0;
  id v34 = 0;
  unsigned __int8 v19 = [(ServerAuthenticationOperation *)self copyAccountID:&v34 credentialSource:0 byAuthenticatingWithContext:v6 returningError:&v33];
  id v20 = v34;
  id v21 = v33;
  if ((v19 & 1) == 0)
  {
    v22 = [v7[405] sharedAccountsAuthenticationConfig];
    if (!v22)
    {
      v22 = [v7[405] sharedConfig];
    }
    unsigned int v23 = objc_msgSend(v22, "shouldLog", v30);
    if ([v22 shouldLogToDisk]) {
      v23 |= 2u;
    }
    id v24 = [v22 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      id v26 = objc_opt_class();
      int v35 = 138543618;
      v36 = v26;
      __int16 v37 = 2112;
      id v38 = v21;
      id v27 = v26;
      LODWORD(v31) = 22;
      int v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_25:

        goto LABEL_26;
      }
      id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v35, v31);
      free(v28);
      SSFileLog();
    }

    goto LABEL_25;
  }
LABEL_26:
  if (a4) {
    *a4 = v21;
  }
  if (a3) {
    *a3 = v20;
  }

  return v19;
}

- (id)_copyAuthenticationContext
{
  v3 = [(ServerAuthenticationOperation *)self authenticationContext];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v5 = objc_alloc((Class)SSMutableAuthenticationContext);
    id v6 = +[SSAccountStore defaultStore];
    unsigned int v7 = [v6 activeAccount];
    id v4 = [v5 initWithAccount:v7];
  }
  id v8 = [(ServerAuthenticationOperation *)self dialog];
  unsigned int v9 = [v8 authorizationIsForced];

  if (v9) {
    [v4 setPromptStyle:1];
  }
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", @"serverDialog", @"why", @"true", @"createSession", 0);
  uint64_t v11 = [v4 requestParameters];
  if (v11) {
    [v10 addEntriesFromDictionary:v11];
  }
  [v4 setRequestParameters:v10];
  uint64_t v12 = [(ServerAuthenticationOperation *)self dialog];
  if (!v12) {
    goto LABEL_62;
  }
  uint64_t v13 = (void *)v12;
  unsigned __int8 v14 = [(ServerAuthenticationOperation *)self _isLocalizationAlreadyConfiguredForAuthContext:v4];

  if (v14) {
    goto LABEL_62;
  }
  int v15 = [(ServerAuthenticationOperation *)self dialog];
  v16 = [v15 title];
  id v17 = [v16 length];

  if (v17)
  {
    id v18 = [v15 title];
    [v4 setPromptTitle:v18];
    unsigned __int8 v19 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v19)
    {
      unsigned __int8 v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    v22 = [v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      int v23 = v21;
    }
    else {
      int v23 = v21 & 2;
    }
    if (v23)
    {
      v66 = v11;
      id v24 = v10;
      int v25 = v15;
      id v26 = objc_opt_class();
      id v63 = v26;
      id v27 = SSHashIfNeeded();
      int v74 = 138543618;
      v75 = v26;
      int v15 = v25;
      id v10 = v24;
      uint64_t v11 = v66;
      __int16 v76 = 2114;
      v77 = v27;
      LODWORD(v62) = 22;
      v60 = &v74;
      int v28 = (void *)_os_log_send_and_compose_impl();

      if (v28)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v74, v62);
        v29 = (int *)objc_claimAutoreleasedReturnValue();
        free(v28);
        v60 = v29;
        SSFileLog();
      }
    }
    else
    {
    }
  }
  v30 = objc_msgSend(v15, "message", v60);
  id v31 = [v30 length];

  if (!v31) {
    goto LABEL_36;
  }
  v32 = [v15 message];
  id v33 = [v4 accountName];
  id v34 = +[SSPaymentSheet stringWithFormattedUsernameForString:v32 username:v33];

  [v4 setReasonDescription:v34];
  int v35 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v35)
  {
    int v35 = +[SSLogConfig sharedConfig];
  }
  unsigned int v36 = [v35 shouldLog];
  if ([v35 shouldLogToDisk]) {
    v36 |= 2u;
  }
  __int16 v37 = [v35 OSLogObject];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
    int v38 = v36;
  }
  else {
    int v38 = v36 & 2;
  }
  if (!v38) {
    goto LABEL_34;
  }
  __int16 v39 = objc_opt_class();
  id v64 = v39;
  SSHashIfNeeded();
  v67 = v34;
  v41 = v40 = v15;
  int v74 = 138543618;
  v75 = v39;
  __int16 v76 = 2114;
  v77 = v41;
  LODWORD(v62) = 22;
  v61 = &v74;
  v42 = (void *)_os_log_send_and_compose_impl();

  int v15 = v40;
  id v34 = v67;

  if (v42)
  {
    __int16 v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v74, v62);
    free(v42);
    v61 = (int *)v37;
    SSFileLog();
LABEL_34:
  }
LABEL_36:
  v43 = objc_msgSend(v15, "buttons", v61);
  id v44 = [v43 count];

  if ((unint64_t)v44 > 2) {
    goto LABEL_61;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v45 = [v15 buttons];
  id v46 = [v45 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (!v46) {
    goto LABEL_60;
  }
  id v47 = v46;
  uint64_t v48 = *(void *)v70;
  while (2)
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(void *)v70 != v48) {
        objc_enumerationMutation(v45);
      }
      v50 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      if ([v50 actionType] && objc_msgSend(v50, "actionType") != 5)
      {
        v68 = v15;
        v51 = [v50 title];
        [v4 setOkButtonLabel:v51];
        v52 = +[SSLogConfig sharedAccountsAuthenticationConfig];
        if (!v52)
        {
          v52 = +[SSLogConfig sharedConfig];
        }
        unsigned int v53 = [v52 shouldLog];
        if ([v52 shouldLogToDisk]) {
          v53 |= 2u;
        }
        v54 = [v52 OSLogObject];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO)) {
          int v55 = v53;
        }
        else {
          int v55 = v53 & 2;
        }
        if (v55)
        {
          v56 = objc_opt_class();
          id v65 = v56;
          v57 = SSHashIfNeeded();
          int v74 = 138543618;
          v75 = v56;
          __int16 v76 = 2114;
          v77 = v57;
          LODWORD(v62) = 22;
          v58 = (void *)_os_log_send_and_compose_impl();

          int v15 = v68;
          if (!v58)
          {
LABEL_59:

            goto LABEL_60;
          }
          v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v74, v62);
          free(v58);
          SSFileLog();
        }
        else
        {
          int v15 = v68;
        }

        goto LABEL_59;
      }
    }
    id v47 = [v45 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v47) {
      continue;
    }
    break;
  }
LABEL_60:

LABEL_61:
LABEL_62:

  return v4;
}

- (id)_copyButtonToSkipDialog:(id)a3
{
  id v3 = a3;
  id v4 = [v3 buttons];
  uint64_t v5 = (uint64_t)[v4 count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5;
    unsigned int v7 = 0;
    while (1)
    {
      id v8 = [v4 objectAtIndex:v6 - 1];
      if ([v8 actionType])
      {
        id v9 = v8;

        unsigned int v7 = v9;
      }
      if ([v8 actionType] == 1)
      {
        id v10 = [v8 subtarget];
        uint64_t v11 = [v10 lowercaseString];
        unsigned int v12 = [v11 containsString:@"signup"];

        if (!v12 || v6 <= 1) {
          goto LABEL_12;
        }
      }
      else
      {

        if (v6 < 2) {
          goto LABEL_12;
        }
      }
      --v6;
    }
  }
  unsigned int v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)_copySelectedButton:(id *)a3 returningError:(id *)a4
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = sub_1000BBF24;
  id v24 = sub_1000BBF34;
  id v25 = 0;
  unsigned int v7 = [(ServerAuthenticationOperation *)self dialog];
  id v8 = [[DaemonDialogOperation alloc] initWithDialog:v7];
  id v9 = [(ServerAuthenticationOperation *)self authenticationContext];
  -[DaemonDialogOperation setDisplaysOnLockscreen:](v8, "setDisplaysOnLockscreen:", [v9 displaysOnLockScreen]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000BBF3C;
  v16[3] = &unk_1003A5B98;
  id v18 = &v20;
  id v10 = v7;
  id v17 = v10;
  unsigned __int8 v19 = &v26;
  [(DaemonDialogOperation *)v8 setOutputBlock:v16];
  id v15 = 0;
  [(ServerAuthenticationOperation *)self runSubOperation:v8 returningError:&v15];
  id v11 = v15;
  unsigned int v12 = v11;
  if (a4) {
    *a4 = v11;
  }
  if (a3) {
    *a3 = (id) v21[5];
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v13;
}

- (void)_handleSelectedButton:(id)a3
{
  id v5 = a3;
  id v6 = [(ServerAuthenticationOperation *)self _copyAuthenticationContext];
  if ([v5 actionType] == 1
    && (([v6 shouldFollowAccountButtons] & 1) != 0 || objc_msgSend(v5, "urlType") != (id)1))
  {
    [(ServerAuthenticationOperation *)self lock];
    unsigned __int8 v14 = [v5 parameter];
    redirectURL = self->_redirectURL;
    self->_redirectURL = v14;

LABEL_19:
    [(ServerAuthenticationOperation *)self unlock];
    goto LABEL_20;
  }
  if (![(ServerAuthenticationOperation *)self performsButtonAction])
  {
    [(ServerAuthenticationOperation *)self lock];
    objc_storeStrong((id *)&self->_performedButton, a3);
    goto LABEL_19;
  }
  unsigned int v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v7)
  {
    unsigned int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_15;
  }
  LODWORD(v17) = 138543362;
  *(void *)((char *)&v17 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v17 + 4);
  LODWORD(v16) = 12;
  unsigned int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v17, v16, v17);
    free(v12);
    SSFileLog();
LABEL_15:
  }
  char v13 = [(ServerAuthenticationOperation *)self dialog];
  [v5 performDefaultActionForDialog:v13];

LABEL_20:
}

- (BOOL)_isLocalizationAlreadyConfiguredForAuthContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 okButtonLabel];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 promptTitle];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      unsigned int v7 = [v3 reasonDescription];
      BOOL v5 = v7 != 0;
    }
  }

  return v5;
}

- (BOOL)_shouldAuthenticateForButton:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ServerAuthenticationOperation *)self dialog];
  id v6 = [v5 buttons];

  if ([v4 actionType]) {
    BOOL v7 = [v6 count] != (id)2 || objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4) != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSkipInitialDialog:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)CFPreferencesCopyAppValue(@"Password", kSSUserDefaultsIdentifier);
  if ([v5 length])
  {
    id v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
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
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  unsigned __int8 v14 = [v4 title];
  if ([v14 length])
  {
  }
  else
  {
    id v15 = [v4 message];
    id v16 = [v15 length];

    if (!v16)
    {
      id v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v6)
      {
        id v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v22 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v23 = v22 | 2;
      }
      else {
        int v23 = v22;
      }
      int v9 = [v6 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        v23 &= 2u;
      }
      if (!v23) {
        goto LABEL_13;
      }
LABEL_10:
      *(_DWORD *)v32 = 138543362;
      *(void *)&v32[4] = objc_opt_class();
      id v10 = *(id *)&v32[4];
      LODWORD(v31) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();
      goto LABEL_11;
    }
  }
  if ([v4 kind] != (id)1)
  {
    if ([v4 authorizationIsForced])
    {
      BOOL v12 = 0;
      goto LABEL_16;
    }
    id v6 = [(ServerAuthenticationOperation *)self _copyAuthenticationContext];
    if (+[SSAccountStore isExpiredForTokenType:](SSAccountStore, "isExpiredForTokenType:", [v6 tokenType]))goto LABEL_57; {
    uint64_t v20 = +[SSAccountStore defaultStore];
    }
    int v21 = [v6 requiredUniqueIdentifier];
    if (v21) {
      [v20 accountWithUniqueIdentifier:v21];
    }
    else {
    id v24 = [v20 activeAccount];
    }
    unsigned int v25 = [v24 isAuthenticated];

    if (!v25)
    {
LABEL_57:
      BOOL v12 = 0;
      goto LABEL_15;
    }
    int v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v9)
    {
      int v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    uint64_t v28 = [v9 OSLogObject];
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      v27 &= 2u;
    }
    if (v27)
    {
      *(_DWORD *)v32 = 138543362;
      *(void *)&v32[4] = objc_opt_class();
      id v29 = *(id *)&v32[4];
      LODWORD(v31) = 12;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30) {
        goto LABEL_13;
      }
      uint64_t v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, v32, v31, *(_OWORD *)v32);
      free(v30);
      SSFileLog();
    }

    goto LABEL_13;
  }
  id v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  int v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v18 &= 2u;
  }
  if (!v18) {
    goto LABEL_13;
  }
  unsigned __int8 v19 = objc_opt_class();
  id v10 = v19;
  AMSLogKey();
  *(_DWORD *)v32 = 138543618;
  *(void *)&v32[4] = v19;
  *(void *)&v32[14] = *(_WORD *)&v32[12] = 2114;
  LODWORD(v31) = 22;
  id v11 = (void *)_os_log_send_and_compose_impl();

LABEL_11:
  if (v11)
  {
    int v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v32, v31);
    free(v11);
    SSFileLog();
LABEL_13:
  }
  BOOL v12 = 1;
LABEL_15:

LABEL_16:
  return v12;
}

- (unint64_t)authenticatedAccountCredentialSource
{
  return self->_authenticatedAccountCredentialSource;
}

- (void)setAuthenticatedAccountCredentialSource:(unint64_t)a3
{
  self->_authenticatedAccountCredentialSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_performedButton, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_authenticatedAccountDSID, 0);
}

@end