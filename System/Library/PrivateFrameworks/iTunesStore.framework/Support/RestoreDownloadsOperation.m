@interface RestoreDownloadsOperation
+ (BOOL)shouldSuppressTermsAndConditionsDialogs;
+ (void)resetShouldSuppressTermsAndConditionsDialogs;
+ (void)setShouldSuppressTermsAndConditionsDialogs:(BOOL)a3;
- (BOOL)_isErrorCancelFailure:(id)a3;
- (BOOL)_isErrorSoftFail:(id)a3;
- (BOOL)_preflightAccountWithID:(id)a3 isFamily:(BOOL)a4 error:(id *)a5;
- (BOOL)_shouldAuthenticateForCancelRetry;
- (BOOL)_shouldAutomaticallyRetryAfterSoftFailError:(id)a3;
- (BOOL)_updateDownloadEntity:(id)a3 withTransaction:(id)a4 storeDownload:(id)a5 accountID:(id)a6;
- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6;
- (NSArray)errors;
- (NSOrderedSet)downloadIdentifiers;
- (NSString)restoreReason;
- (RestoreDownloadsOperation)initWithDownloadIdentifiers:(id)a3 restoreReason:(id)a4;
- (id)_accountIDForAccountName:(id)a3 error:(id *)a4;
- (id)_copyDownloadSessionPropertiesForItem:(id)a3 download:(id)a4;
- (id)_newDownloadWithStoreDownload:(id)a3;
- (id)_newRestoreItemsWithDownloadIDs:(id)a3;
- (id)_softFailRestoreItem:(id)a3 download:(id)a4 withRestoreState:(int64_t)a5 error:(id)a6;
- (int64_t)_downloadRestoreStateForError:(id)a3;
- (void)_applyResponses:(id)a3 withTransaction:(id)a4;
- (void)_establishPrimaryAccount;
- (void)_hardFailRestoreItem:(id)a3 download:(id)a4 transaction:(id)a5 error:(id)a6;
- (void)_scheduleAutomaticRetry;
- (void)_scheduleCancelRetry;
- (void)dealloc;
- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)restorePodcastItemsOperation:(id)a3 didReceiveResponse:(id)a4;
- (void)run;
@end

@implementation RestoreDownloadsOperation

- (RestoreDownloadsOperation)initWithDownloadIdentifiers:(id)a3 restoreReason:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RestoreDownloadsOperation;
  v6 = [(RestoreDownloadsOperation *)&v8 init];
  if (v6)
  {
    v6->_downloadIDs = (NSOrderedSet *)[a3 copy];
    v6->_restoreReason = (NSString *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RestoreDownloadsOperation;
  [(RestoreDownloadsOperation *)&v3 dealloc];
}

+ (void)resetShouldSuppressTermsAndConditionsDialogs
{
  CFPreferencesSetAppValue(@"RestoreSuppressTermsAndConditions", 0, kSSUserDefaultsIdentifier);

  CFPreferencesAppSynchronize(@"RestoreSuppressTermsAndConditions");
}

+ (void)setShouldSuppressTermsAndConditionsDialogs:(BOOL)a3
{
  objc_super v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    objc_super v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"RestoreSuppressTermsAndConditions", *v3, kSSUserDefaultsIdentifier);

  CFPreferencesAppSynchronize(@"RestoreSuppressTermsAndConditions");
}

+ (BOOL)shouldSuppressTermsAndConditionsDialogs
{
  return CFPreferencesGetAppBooleanValue(@"RestoreSuppressTermsAndConditions", kSSUserDefaultsIdentifier, 0) != 0;
}

- (NSOrderedSet)downloadIdentifiers
{
  v2 = self->_downloadIDs;

  return v2;
}

- (NSArray)errors
{
  [(RestoreDownloadsOperation *)self lock];
  objc_super v3 = (NSArray *)[(NSMutableArray *)self->_errors copy];
  [(RestoreDownloadsOperation *)self unlock];
  return v3;
}

- (NSString)restoreReason
{
  v2 = self->_restoreReason;

  return v2;
}

- (BOOL)copyAccountID:(id *)a3 credentialSource:(unint64_t *)a4 byAuthenticatingWithContext:(id)a5 returningError:(id *)a6
{
  v6 = a6;
  v7 = a4;
  id v48 = 0;
  uint64_t v49 = 0;
  unint64_t v47 = 0;
  if (self->_cancelRetryAlertState == 1)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v50 = 138543362;
      uint64_t v51 = objc_opt_class();
      LODWORD(v42) = 12;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v50, v42);
        free(v13);
        SSFileLog();
      }
    }
    BOOL v14 = 0;
    uint64_t v49 = SSError();
LABEL_44:
    v32 = a3;
    goto LABEL_45;
  }
  unsigned int v16 = [(NSString *)self->_restoreReason isEqualToString:@"cancel-retry"];
  if (!v16) {
    goto LABEL_27;
  }
LABEL_14:
  if (self->_cancelRetryAlertState) {
    goto LABEL_27;
  }
  id v17 = +[SSLogConfig sharedDaemonConfig];
  if (!v17) {
    id v17 = +[SSLogConfig sharedConfig];
  }
  unsigned int v18 = objc_msgSend(v17, "shouldLog", v40);
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_INFO)) {
    v19 &= 2u;
  }
  if (v19)
  {
    uint64_t v20 = objc_opt_class();
    int v50 = 138543362;
    uint64_t v51 = v20;
    LODWORD(v42) = 12;
    v41 = &v50;
    uint64_t v21 = _os_log_send_and_compose_impl();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v50, v42);
      free(v22);
      v41 = (int *)v23;
      SSFileLog();
    }
  }
  if ([(RestoreDownloadsOperation *)self _shouldAuthenticateForCancelRetry])
  {
    self->_cancelRetryAlertState = 2;
    while (1)
    {
LABEL_27:
      v46.receiver = self;
      v46.super_class = (Class)RestoreDownloadsOperation;
      unsigned int v24 = -[RestoreDownloadsOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:](&v46, "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:", &v48, &v47, a5, &v49, v40);
      if ((v24 | v16 ^ 1))
      {
        BOOL v14 = v24;
        goto LABEL_43;
      }
      if (!ISErrorIsEqual()) {
        break;
      }
      id v25 = +[SSLogConfig sharedDaemonConfig];
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig];
      }
      unsigned int v26 = [v25 shouldLog];
      if ([v25 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v27 &= 2u;
      }
      if (v27)
      {
        uint64_t v28 = objc_opt_class();
        int v50 = 138543362;
        uint64_t v51 = v28;
        LODWORD(v42) = 12;
        v40 = &v50;
        uint64_t v29 = _os_log_send_and_compose_impl();
        if (v29)
        {
          v30 = (void *)v29;
          v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v50, v42);
          free(v30);
          v40 = (int *)v31;
          SSFileLog();
        }
      }
      self->_cancelRetryAlertState = 0;

      id v48 = 0;
      if (v16) {
        goto LABEL_14;
      }
    }
    BOOL v14 = 0;
LABEL_43:
    v7 = a4;
    v6 = a6;
    goto LABEL_44;
  }
  id v34 = +[SSLogConfig sharedDaemonConfig];
  if (!v34) {
    id v34 = +[SSLogConfig sharedConfig];
  }
  unsigned int v35 = [v34 shouldLog];
  if ([v34 shouldLogToDisk]) {
    int v36 = v35 | 2;
  }
  else {
    int v36 = v35;
  }
  if (!os_log_type_enabled((os_log_t)[v34 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v36 &= 2u;
  }
  v7 = a4;
  v6 = a6;
  v32 = a3;
  if (v36)
  {
    uint64_t v37 = objc_opt_class();
    int v50 = 138543362;
    uint64_t v51 = v37;
    LODWORD(v42) = 12;
    uint64_t v38 = _os_log_send_and_compose_impl();
    if (v38)
    {
      v39 = (void *)v38;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v50, v42);
      free(v39);
      SSFileLog();
    }
  }
  self->_cancelRetryAlertState = 1;
  BOOL v14 = 0;
  uint64_t v49 = SSError();
LABEL_45:
  if (v32)
  {
    id *v32 = v48;
    if (!v7) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  if (v7) {
LABEL_47:
  }
    unint64_t *v7 = v47;
LABEL_48:
  if (v6) {
    id *v6 = (id)v49;
  }
  return v14;
}

- (void)run
{
  id v172 = objc_alloc_init((Class)NSMutableDictionary);
  id v183 = objc_alloc_init((Class)NSMutableDictionary);
  id v173 = objc_alloc_init((Class)NSMutableArray);
  id v184 = +[SSAccountStore defaultStore];
  self->_hadAutoRetrySoftFailure = 0;
  self->_hadCancelFailure = 0;
  id v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    int v6 = v5;
  }
  else {
    int v6 = v5 & 2;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    NSUInteger v8 = [(NSOrderedSet *)self->_downloadIDs count];
    *(_DWORD *)v220 = 138543618;
    *(void *)&v220[4] = v7;
    *(_WORD *)&v220[12] = 2048;
    *(void *)&v220[14] = v8;
    LODWORD(v162) = 22;
    v154 = (NSString *)v220;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      unsigned int v10 = (void *)v9;
      int v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v220, v162);
      free(v10);
      v154 = v11;
      SSFileLog();
    }
  }
  id v174 = objc_alloc_init((Class)NSMutableArray);
  id v171 = objc_alloc_init((Class)NSMutableArray);
  id v168 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v12 = objc_alloc_init(FamilyCircleOperation);
  if ([(RestoreDownloadsOperation *)self runSubOperation:v12 returningError:0]&& [(FamilyCircleOperation *)v12 familyCircle])
  {
    [(RestoreDownloadsOperation *)self _establishPrimaryAccount];
    id v13 = [v184 activeAccount];
    id v14 = objc_msgSend(objc_msgSend(-[SSFamilyCircle allITunesIdentifiers](-[FamilyCircleOperation familyCircle](v12, "familyCircle"), "allITunesIdentifiers"), "allObjects"), "mutableCopy");
    id v15 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    if (v15) {
      [v14 removeObject:v15];
    }
    char v170 = 1;
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
    char v170 = 0;
  }

  id v16 = [(RestoreDownloadsOperation *)self _newRestoreItemsWithDownloadIDs:self->_downloadIDs];
  long long v211 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v211 objects:v219 count:16];
  v187 = self;
  id v182 = v14;
  if (!v17)
  {
    id v20 = v13;
    goto LABEL_112;
  }
  id v18 = v17;
  id v19 = *(id *)v212;
  uint64_t v188 = SSDownloadPhaseDownloading;
  id v20 = v13;
  id obj = *(id *)v212;
  id v175 = v16;
  do
  {
    uint64_t v21 = 0;
    id v180 = v18;
    do
    {
      if (*(id *)v212 != v19) {
        objc_enumerationMutation(v16);
      }
      v22 = *(void **)(*((void *)&v211 + 1) + 8 * (void)v21);
      objc_msgSend(v22, "downloadKind", v154);
      char IsPodcastKind = SSDownloadKindIsPodcastKind();
      uint64_t v210 = 0;
      if ((IsPodcastKind & 1) == 0 && ![v22 storeAccountID])
      {
        id v24 = [v22 storeAccountAppleID];
        if (v24)
        {
          id v25 = [(RestoreDownloadsOperation *)self _accountIDForAccountName:v24 error:&v210];
          goto LABEL_42;
        }
        if ((v170 & 1) == 0)
        {
          [(RestoreDownloadsOperation *)self _establishPrimaryAccount];
          id v20 = [v184 activeAccount];
        }
        if (v20)
        {
          unsigned int v26 = v20;
          id v27 = +[SSLogConfig sharedDaemonConfig];
          if (!v27) {
            id v27 = +[SSLogConfig sharedConfig];
          }
          unsigned int v28 = [v27 shouldLog];
          if ([v27 shouldLogToDisk]) {
            int v29 = v28 | 2;
          }
          else {
            int v29 = v28;
          }
          if (os_log_type_enabled((os_log_t)[v27 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            int v30 = v29;
          }
          else {
            int v30 = v29 & 2;
          }
          if (v30)
          {
            uint64_t v31 = objc_opt_class();
            id v32 = [v22 downloadIdentifier];
            *(_DWORD *)v220 = 138543618;
            *(void *)&v220[4] = v31;
            self = v187;
            *(_WORD *)&v220[12] = 2048;
            *(void *)&v220[14] = v32;
            LODWORD(v162) = 22;
            v154 = (NSString *)v220;
            uint64_t v33 = _os_log_send_and_compose_impl();
            if (v33)
            {
              id v34 = (void *)v33;
              unsigned int v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, v220, v162);
              free(v34);
              v154 = v35;
              SSFileLog();
            }
          }
          id v20 = v26;
          objc_msgSend(v22, "setStoreAccountAppleID:", objc_msgSend(v26, "accountName", v154));
          id v25 = [v26 uniqueIdentifier];
          char v170 = 1;
          id v18 = v180;
          id v14 = v182;
          id v19 = obj;
LABEL_42:
          [v22 setStoreAccountID:v25];
        }
        else
        {
          char v170 = 1;
        }
        unint64_t v36 = (unint64_t)[v22 storeAccountID];
        if (!(v36 | v210)) {
          uint64_t v210 = SSError();
        }
      }
      id v37 = [v22 storeAccountID];
      if (v37) {
        BOOL v38 = v20 == 0;
      }
      else {
        BOOL v38 = 1;
      }
      if (!v38)
      {
        id v39 = v37;
        if ([v14 containsObject:v37])
        {
          [v22 setStoreOriginalPurchaserAccountID:v39];
          objc_msgSend(v22, "setStoreAccountID:", objc_msgSend(v20, "uniqueIdentifier"));
        }
      }
      uint64_t v209 = 0;
      if (IsPodcastKind)
      {
        if ([v22 isEligibleForRestore:&v209])
        {
          [v173 addObject:v22];
          goto LABEL_106;
        }
LABEL_93:
        v62 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:]([DownloadSessionProperties alloc], "initWithClientIdentifier:handlerIdentifier:", [v22 clientIdentifier], objc_msgSend(v22, "handlerIdentifier"));
        [(DownloadSessionProperties *)v62 setDownloadPhase:v188];
        [v22 setDownloadSessionProperties:v62];
        if (v209) {
          uint64_t v63 = v209;
        }
        else {
          uint64_t v63 = v210;
        }
        [v22 setError:v63];
        if ([(RestoreDownloadsOperation *)self _isErrorCancelFailure:v210])
        {
          [v174 addObject:v22];
          self->_hadCancelFailure = 1;
        }
        else if (v210 && -[RestoreDownloadsOperation _isErrorSoftFail:](self, "_isErrorSoftFail:"))
        {
          [v168 addObject:v22];
          if (self->_hadAutoRetrySoftFailure) {
            BOOL v64 = 1;
          }
          else {
            BOOL v64 = [(RestoreDownloadsOperation *)self _shouldAutomaticallyRetryAfterSoftFailError:v210];
          }
          self->_hadAutoRetrySoftFailure = v64;
        }
        else
        {
          [v171 addObject:v22];
        }

        goto LABEL_106;
      }
      if (![v22 storeAccountID]
        || ([v22 isEligibleForRestore:&v209] & 1) == 0)
      {
        goto LABEL_93;
      }
      id v40 = [v22 storeOriginalPurchaserAccountID];
      if (!v40) {
        id v40 = [v22 storeAccountID];
      }
      id v41 = [v172 objectForKey:v40];
      if (!v41)
      {
        id v41 = [v184 accountWithUniqueIdentifier:v40];
        if (!v41)
        {
          id v41 = objc_alloc_init((Class)SSAccount);
          [v41 setUniqueIdentifier:v40];
        }
        [v172 setObject:v41 forKey:v40];
      }
      if (![v41 accountName]) {
        objc_msgSend(v41, "setAccountName:", objc_msgSend(v22, "storeAccountAppleID"));
      }
      if (![v41 storeFrontIdentifier]) {
        objc_msgSend(v41, "setStoreFrontIdentifier:", objc_msgSend(v22, "storeFrontID"));
      }
      id v42 = v20;
      id v43 = +[SSLogConfig sharedAccountsConfig];
      if (!v43) {
        id v43 = +[SSLogConfig sharedConfig];
      }
      unsigned int v44 = [v43 shouldLog];
      if ([v43 shouldLogToDisk]) {
        int v45 = v44 | 2;
      }
      else {
        int v45 = v44;
      }
      if (os_log_type_enabled((os_log_t)[v43 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        int v46 = v45;
      }
      else {
        int v46 = v45 & 2;
      }
      if (v46)
      {
        uint64_t v47 = objc_opt_class();
        [v41 accountName];
        uint64_t v48 = SSHashIfNeeded();
        *(_DWORD *)v220 = 138543618;
        *(void *)&v220[4] = v47;
        *(_WORD *)&v220[12] = 2114;
        *(void *)&v220[14] = v48;
        LODWORD(v162) = 22;
        v154 = (NSString *)v220;
        uint64_t v49 = _os_log_send_and_compose_impl();
        if (v49)
        {
          int v50 = (void *)v49;
          uint64_t v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, v220, v162);
          free(v50);
          v154 = v51;
          SSFileLog();
        }
      }
      v208 = 0;
      id v20 = v42;
      if ((objc_msgSend(v184, "saveAccount:verifyCredentials:error:", v41, 0, &v208, v154) & 1) == 0
        && v208)
      {
        id v52 = +[SSLogConfig sharedAccountsConfig];
        if (!v52) {
          id v52 = +[SSLogConfig sharedConfig];
        }
        unsigned int v53 = [v52 shouldLog];
        if ([v52 shouldLogToDisk]) {
          int v54 = v53 | 2;
        }
        else {
          int v54 = v53;
        }
        if (os_log_type_enabled((os_log_t)[v52 OSLogObject], OS_LOG_TYPE_ERROR)) {
          int v55 = v54;
        }
        else {
          int v55 = v54 & 2;
        }
        id v20 = v42;
        if (v55)
        {
          uint64_t v56 = objc_opt_class();
          [v41 accountName];
          uint64_t v57 = SSHashIfNeeded();
          *(_DWORD *)v220 = 138543874;
          *(void *)&v220[4] = v56;
          *(_WORD *)&v220[12] = 2114;
          *(void *)&v220[14] = v57;
          *(_WORD *)&v220[22] = 2114;
          v221 = v208;
          LODWORD(v162) = 32;
          v155 = (NSString *)v220;
          uint64_t v58 = _os_log_send_and_compose_impl();
          if (v58)
          {
            v59 = (void *)v58;
            v60 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, v220, v162);
            free(v59);
            v155 = v60;
            SSFileLog();
          }
        }
      }

      id v61 = [v183 objectForKey:v40];
      if (!v61)
      {
        id v61 = +[NSMutableArray array];
        [v183 setObject:v61 forKey:v40];
      }
      objc_msgSend(v61, "addObject:", v22, v155);
      self = v187;
      id v18 = v180;
      id v14 = v182;
      id v16 = v175;
      id v19 = obj;
LABEL_106:
      uint64_t v21 = (char *)v21 + 1;
    }
    while (v18 != v21);
    id v65 = [v16 countByEnumeratingWithState:&v211 objects:v219 count:16];
    id v18 = v65;
  }
  while (v65);
LABEL_112:
  v169 = v20;

  id v66 = objc_alloc_init((Class)NSMutableArray);
  if ([v171 count])
  {
    id v67 = +[SSLogConfig sharedDaemonConfig];
    if (!v67) {
      id v67 = +[SSLogConfig sharedConfig];
    }
    unsigned int v68 = objc_msgSend(v67, "shouldLog", v154);
    if ([v67 shouldLogToDisk]) {
      int v69 = v68 | 2;
    }
    else {
      int v69 = v68;
    }
    if (os_log_type_enabled((os_log_t)[v67 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v70 = v69;
    }
    else {
      int v70 = v69 & 2;
    }
    if (v70)
    {
      uint64_t v71 = objc_opt_class();
      id v72 = [v171 componentsJoinedByString:@", "];
      *(_DWORD *)v220 = 138543618;
      *(void *)&v220[4] = v71;
      *(_WORD *)&v220[12] = 2114;
      *(void *)&v220[14] = v72;
      LODWORD(v162) = 22;
      uint64_t v73 = _os_log_send_and_compose_impl();
      if (v73)
      {
        v74 = (void *)v73;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4, v220, v162);
        free(v74);
        SSFileLog();
      }
    }
    uint64_t v156 = objc_opt_class();
    id v163 = [v171 componentsJoinedByString:@", "];
    SSDebugLog();
    v75 = objc_alloc_init(RestoreDownloadItemsResponse);
    -[RestoreDownloadItemsResponse setRequestItems:](v75, "setRequestItems:", v171, v156, v163);
    [v66 addObject:v75];
  }
  if (objc_msgSend(v168, "count", v154))
  {
    id v76 = +[SSLogConfig sharedDaemonConfig];
    if (!v76) {
      id v76 = +[SSLogConfig sharedConfig];
    }
    unsigned int v77 = [v76 shouldLog];
    if ([v76 shouldLogToDisk]) {
      int v78 = v77 | 2;
    }
    else {
      int v78 = v77;
    }
    if (os_log_type_enabled((os_log_t)[v76 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v79 = v78;
    }
    else {
      int v79 = v78 & 2;
    }
    if (v79)
    {
      uint64_t v80 = objc_opt_class();
      id v81 = [v168 componentsJoinedByString:@", "];
      *(_DWORD *)v220 = 138543618;
      *(void *)&v220[4] = v80;
      *(_WORD *)&v220[12] = 2114;
      *(void *)&v220[14] = v81;
      LODWORD(v162) = 22;
      uint64_t v82 = _os_log_send_and_compose_impl();
      if (v82)
      {
        v83 = (void *)v82;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v82, 4, v220, v162);
        free(v83);
        SSFileLog();
      }
    }
    uint64_t v158 = objc_opt_class();
    id v164 = [v168 componentsJoinedByString:@", "];
    SSDebugLog();
    v84 = objc_alloc_init(RestoreDownloadItemsResponse);
    -[RestoreDownloadItemsResponse setRequestItems:](v84, "setRequestItems:", v168, v158, v164);
    [(RestoreDownloadItemsResponse *)v84 setServerResponseWithError:SSError()];
    [v66 addObject:v84];
  }
  if ([v174 count])
  {
    id v85 = +[SSLogConfig sharedDaemonConfig];
    if (!v85) {
      id v85 = +[SSLogConfig sharedConfig];
    }
    unsigned int v86 = [v85 shouldLog];
    if ([v85 shouldLogToDisk]) {
      int v87 = v86 | 2;
    }
    else {
      int v87 = v86;
    }
    if (os_log_type_enabled((os_log_t)[v85 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v88 = v87;
    }
    else {
      int v88 = v87 & 2;
    }
    if (v88)
    {
      uint64_t v89 = objc_opt_class();
      id v90 = [v174 componentsJoinedByString:@", "];
      *(_DWORD *)v220 = 138543618;
      *(void *)&v220[4] = v89;
      *(_WORD *)&v220[12] = 2114;
      *(void *)&v220[14] = v90;
      LODWORD(v162) = 22;
      uint64_t v91 = _os_log_send_and_compose_impl();
      if (v91)
      {
        v92 = (void *)v91;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v91, 4, v220, v162);
        free(v92);
        SSFileLog();
      }
    }
    uint64_t v159 = objc_opt_class();
    id v165 = [v174 componentsJoinedByString:@", "];
    SSDebugLog();
    v93 = objc_alloc_init(RestoreDownloadItemsResponse);
    -[RestoreDownloadItemsResponse setRequestItems:](v93, "setRequestItems:", v174, v159, v165);
    [(RestoreDownloadItemsResponse *)v93 setServerResponseWithError:SSError()];
    [v66 addObject:v93];
  }
  if ([v66 count])
  {
    v207[0] = _NSConcreteStackBlock;
    v207[1] = 3221225472;
    v207[2] = sub_1000CC850;
    v207[3] = &unk_1003A3F68;
    v207[4] = self;
    v207[5] = v66;
    objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v207);
  }

  if ([v183 count])
  {
    if ((v170 & 1) == 0
      && ![(NSString *)self->_restoreReason isEqualToString:@"cancel-retry"])
    {
      [(RestoreDownloadsOperation *)self _establishPrimaryAccount];
    }
    id v94 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    id v95 = [v183 allKeys];
    *(void *)v220 = _NSConcreteStackBlock;
    *(void *)&v220[8] = 3221225472;
    *(void *)&v220[16] = sub_1000D0554;
    v221 = &unk_1003A5FD0;
    id v222 = v94;
    id v223 = v183;
    id v96 = [v95 sortedArrayUsingComparator:v220];
    id v181 = objc_alloc_init((Class)NSMutableArray);
    id v97 = objc_alloc_init((Class)NSCountedSet);
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    id obja = v96;
    id v98 = [v96 countByEnumeratingWithState:&v203 objects:v218 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v185 = *(void *)v204;
      char v189 = 1;
      do
      {
        for (i = 0; i != v99; i = (char *)i + 1)
        {
          if (*(void *)v204 != v185) {
            objc_enumerationMutation(obja);
          }
          uint64_t v101 = *(void *)(*((void *)&v203 + 1) + 8 * i);
          id v102 = [v14 containsObject:v101];
          uint64_t v210 = 0;
          unsigned int v103 = [(RestoreDownloadsOperation *)self _preflightAccountWithID:v101 isFamily:v102 error:&v210];
          id v104 = +[SSAccountStore defaultStore];
          if (v102) {
            id v105 = [v104 activeAccount];
          }
          else {
            id v105 = [v104 accountWithUniqueIdentifier:v101];
          }
          id v106 = v105;
          id v107 = [v183 objectForKey:v101];
          v108 = [[RestoreDownloadItemsOperation alloc] initWithDownloadItems:v107 account:v106];
          if (v103)
          {
            long long v201 = 0u;
            long long v202 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            id v109 = [v107 countByEnumeratingWithState:&v199 objects:v217 count:16];
            id v14 = v182;
            if (v109)
            {
              id v110 = v109;
              uint64_t v111 = *(void *)v200;
              do
              {
                for (j = 0; j != v110; j = (char *)j + 1)
                {
                  if (*(void *)v200 != v111) {
                    objc_enumerationMutation(v107);
                  }
                  objc_msgSend(v97, "addObject:", objc_msgSend(*(id *)(*((void *)&v199 + 1) + 8 * (void)j), "downloadKind"));
                }
                id v110 = [v107 countByEnumeratingWithState:&v199 objects:v217 count:16];
              }
              while (v110);
            }
            [v181 addObject:v108];
          }
          else
          {
            id v113 = +[SSLogConfig sharedDaemonConfig];
            if (!v113) {
              id v113 = +[SSLogConfig sharedConfig];
            }
            unsigned int v114 = [v113 shouldLog];
            if ([v113 shouldLogToDisk]) {
              int v115 = v114 | 2;
            }
            else {
              int v115 = v114;
            }
            if (os_log_type_enabled((os_log_t)[v113 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
              int v116 = v115;
            }
            else {
              int v116 = v115 & 2;
            }
            if (v116)
            {
              uint64_t v117 = objc_opt_class();
              id v118 = [v107 componentsJoinedByString:@", "];
              *(_DWORD *)v220 = 138543874;
              *(void *)&v220[4] = v117;
              *(_WORD *)&v220[12] = 2114;
              *(void *)&v220[14] = v118;
              *(_WORD *)&v220[22] = 2114;
              v221 = (void *)v210;
              LODWORD(v162) = 32;
              uint64_t v119 = _os_log_send_and_compose_impl();
              if (v119)
              {
                v120 = (void *)v119;
                +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v119, 4, v220, v162);
                free(v120);
                SSFileLog();
              }
            }
            self = v187;
            uint64_t v121 = objc_opt_class();
            id v122 = [v107 componentsJoinedByString:@", "];
            uint64_t v167 = v210;
            uint64_t v160 = v121;
            id v166 = v122;
            SSDebugLog();
            v123 = objc_alloc_init(RestoreDownloadItemsResponse);
            -[RestoreDownloadItemsResponse setRequestItems:](v123, "setRequestItems:", v107, v160, v166, v101, v167);
            [(RestoreDownloadItemsResponse *)v123 setServerResponseWithError:v210];
            [(RestoreDownloadsOperation *)v187 restoreDownloadItemsOperation:v108 didReceiveResponse:v123];

            char v189 = 0;
            id v14 = v182;
          }
        }
        id v99 = [obja countByEnumeratingWithState:&v203 objects:v218 count:16];
      }
      while (v99);
    }
    else
    {
      char v189 = 1;
    }
    id v125 = +[SSLogConfig sharedDaemonConfig];
    if (!v125) {
      id v125 = +[SSLogConfig sharedConfig];
    }
    unsigned int v126 = [v125 shouldLog];
    if ([v125 shouldLogToDisk]) {
      int v127 = v126 | 2;
    }
    else {
      int v127 = v126;
    }
    if (os_log_type_enabled((os_log_t)[v125 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v128 = v127;
    }
    else {
      int v128 = v127 & 2;
    }
    if (v128)
    {
      uint64_t v129 = objc_opt_class();
      id v130 = [v181 count];
      *(_DWORD *)v220 = 138543618;
      *(void *)&v220[4] = v129;
      *(_WORD *)&v220[12] = 2048;
      *(void *)&v220[14] = v130;
      LODWORD(v162) = 22;
      v157 = (NSString *)v220;
      uint64_t v131 = _os_log_send_and_compose_impl();
      if (v131)
      {
        v132 = (void *)v131;
        v133 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v131, 4, v220, v162);
        free(v132);
        v157 = v133;
        SSFileLog();
      }
    }
    unsigned int v134 = [(id)objc_opt_class() shouldSuppressTermsAndConditionsDialogs] ^ 1;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    id objb = [v181 countByEnumeratingWithState:&v195 objects:v216 count:16];
    if (objb)
    {
      uint64_t v176 = *(void *)v196;
      int v135 = v189 & 1;
      do
      {
        for (k = 0; k != objb; k = (char *)k + 1)
        {
          if (*(void *)v196 != v176) {
            objc_enumerationMutation(v181);
          }
          int v190 = v135;
          v137 = *(void **)(*((void *)&v195 + 1) + 8 * (void)k);
          id v186 = objc_alloc_init((Class)NSAutoreleasePool);
          [v137 setDelegate:self];
          [v137 setShouldShowTermsAndConditionsDialog:v134 & 1];
          unsigned int v138 = [(RestoreDownloadsOperation *)self runSubOperation:v137 returningError:0];
          id v139 = [v137 responses];
          long long v191 = 0u;
          long long v192 = 0u;
          long long v193 = 0u;
          long long v194 = 0u;
          id v140 = [v139 countByEnumeratingWithState:&v191 objects:v215 count:16];
          if (v140)
          {
            id v141 = v140;
            uint64_t v142 = *(void *)v192;
            do
            {
              for (m = 0; m != v141; m = (char *)m + 1)
              {
                if (*(void *)v192 != v142) {
                  objc_enumerationMutation(v139);
                }
                objc_msgSend(objc_msgSend(*(id *)(*((void *)&v191 + 1) + 8 * (void)m), "serverResponse", v157), "error");
                v134 &= ISErrorIsEqual() ^ 1;
              }
              id v141 = [v139 countByEnumeratingWithState:&v191 objects:v215 count:16];
            }
            while (v141);
          }
          int v135 = v190 & v138;
          objc_msgSend(v137, "setDelegate:", 0, v157);
          [v186 drain];
          self = v187;
        }
        id objb = [v181 countByEnumeratingWithState:&v195 objects:v216 count:16];
      }
      while (objb);
      id v14 = v182;
    }
    else
    {
      LOBYTE(v135) = v189;
    }
    [(id)objc_opt_class() setShouldSuppressTermsAndConditionsDialogs:(v134 & 1) == 0];

    uint64_t v124 = v135 & 1;
  }
  else
  {
    uint64_t v124 = 1;
  }
  if (objc_msgSend(v173, "count", v157))
  {
    id v144 = +[SSLogConfig sharedDaemonConfig];
    if (!v144) {
      id v144 = +[SSLogConfig sharedConfig];
    }
    unsigned int v145 = [v144 shouldLog];
    if ([v144 shouldLogToDisk]) {
      int v146 = v145 | 2;
    }
    else {
      int v146 = v145;
    }
    if (os_log_type_enabled((os_log_t)[v144 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      int v147 = v146;
    }
    else {
      int v147 = v146 & 2;
    }
    if (v147)
    {
      uint64_t v148 = objc_opt_class();
      id v149 = [v173 componentsJoinedByString:@", "];
      *(_DWORD *)v220 = 138543618;
      *(void *)&v220[4] = v148;
      *(_WORD *)&v220[12] = 2114;
      *(void *)&v220[14] = v149;
      LODWORD(v162) = 22;
      v161 = (NSString *)v220;
      uint64_t v150 = _os_log_send_and_compose_impl();
      if (v150)
      {
        v151 = (void *)v150;
        v152 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v150, 4, v220, v162);
        free(v151);
        v161 = v152;
        SSFileLog();
      }
    }
    v153 = [[RestorePodcastItemsOperation alloc] initWithDownloadItems:v173];
    [(RestorePodcastItemsOperation *)v153 setDelegate:self];
    uint64_t v124 = v124 & [(RestoreDownloadsOperation *)self runSubOperation:v153 returningError:0];
    [(RestorePodcastItemsOperation *)v153 setDelegate:0];
  }
  if (self->_hadAutoRetrySoftFailure) {
    [(RestoreDownloadsOperation *)self _scheduleAutomaticRetry];
  }
  if (self->_hadCancelFailure
    && ![(NSString *)self->_restoreReason isEqualToString:@"cancel-retry"])
  {
    [(RestoreDownloadsOperation *)self _scheduleCancelRetry];
  }
  -[RestoreDownloadsOperation setSuccess:](self, "setSuccess:", v124, v161);
}

- (void)restoreDownloadItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a4, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CC920;
  v6[3] = &unk_1003A3F68;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase"), "modifyUsingTransactionBlock:", v6);
}

- (void)restorePodcastItemsOperation:(id)a3 didReceiveResponse:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CC9D0;
  v4[3] = &unk_1003A3F68;
  v4[4] = a4;
  v4[5] = self;
  objc_msgSend(+[DownloadsDatabase downloadsDatabase](DownloadsDatabase, "downloadsDatabase", a3), "modifyUsingTransactionBlock:", v4);
}

- (id)_accountIDForAccountName:(id)a3 error:(id *)a4
{
  id v52 = 0;
  id v53 = 0;
  [(RestoreDownloadsOperation *)self lock];
  if (!self->_accountIDsByAppleID)
  {
    id v7 = objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "accounts");
    self->_accountIDsByAppleID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v48 objects:v62 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v49;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v13 = [v12 uniqueIdentifier];
          id v14 = [v12 accountName];
          if (v13) {
            BOOL v15 = v14 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15) {
            [(NSMutableDictionary *)self->_accountIDsByAppleID setObject:v13 forKey:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v48 objects:v62 count:16];
      }
      while (v9);
    }
  }
  id v16 = [(NSMutableDictionary *)self->_accountIDsByAppleID objectForKey:a3];
  [(RestoreDownloadsOperation *)self unlock];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = v16;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v16;
    }
    else if (!v16)
    {
      id v17 = objc_alloc_init((Class)SSMutableAuthenticationContext);
      [v17 setAccountName:a3];
      [v17 setAccountNameEditable:1];
      [v17 setCanCreateNewAccount:0];
      [v17 setPersistsAcrossDeviceLock:1];
      [v17 setPromptStyle:1001];
      id v18 = +[SSLogConfig sharedDaemonConfig];
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v20 &= 2u;
      }
      if (v20)
      {
        uint64_t v21 = objc_opt_class();
        int v54 = 138543618;
        uint64_t v55 = v21;
        __int16 v56 = 2112;
        id v57 = a3;
        LODWORD(v47) = 22;
        int v45 = &v54;
        uint64_t v22 = _os_log_send_and_compose_impl();
        if (v22)
        {
          v23 = (void *)v22;
          id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v54, v47);
          free(v23);
          int v45 = (int *)v24;
          SSFileLog();
        }
      }
      if (-[RestoreDownloadsOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:](self, "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:", &v53, 0, v17, &v52, v45)&& (id v25 = +[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), v26 = objc_msgSend(objc_msgSend(v25, "accountWithUniqueIdentifier:", v53), "accountName"), objc_msgSend(v26, "length")))
      {
        id v27 = +[SSLogConfig sharedDaemonConfig];
        if (!v27) {
          id v27 = +[SSLogConfig sharedConfig];
        }
        unsigned int v28 = [v27 shouldLog];
        if ([v27 shouldLogToDisk]) {
          int v29 = v28 | 2;
        }
        else {
          int v29 = v28;
        }
        if (!os_log_type_enabled((os_log_t)[v27 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v29 &= 2u;
        }
        if (v29)
        {
          uint64_t v30 = objc_opt_class();
          int v54 = 138544130;
          uint64_t v55 = v30;
          __int16 v56 = 2114;
          id v57 = a3;
          __int16 v58 = 2114;
          id v59 = v26;
          __int16 v60 = 2114;
          id v61 = v53;
          LODWORD(v47) = 42;
          int v46 = &v54;
          uint64_t v31 = _os_log_send_and_compose_impl();
          if (v31)
          {
            id v32 = (void *)v31;
            uint64_t v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v54, v47);
            free(v32);
            int v46 = (int *)v33;
            SSFileLog();
          }
        }
        -[NSMutableDictionary setObject:forKey:](self->_accountIDsByAppleID, "setObject:forKey:", v53, a3, v46);
        accountIDsByAppleID = self->_accountIDsByAppleID;
        uint64_t v35 = (uint64_t)v53;
        id v36 = v26;
      }
      else
      {
        id v37 = +[SSLogConfig sharedDaemonConfig];
        if (!v37) {
          id v37 = +[SSLogConfig sharedConfig];
        }
        unsigned int v38 = [v37 shouldLog];
        if ([v37 shouldLogToDisk]) {
          int v39 = v38 | 2;
        }
        else {
          int v39 = v38;
        }
        if (!os_log_type_enabled((os_log_t)[v37 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v39 &= 2u;
        }
        if (v39)
        {
          uint64_t v40 = objc_opt_class();
          int v54 = 138543874;
          uint64_t v55 = v40;
          __int16 v56 = 2114;
          id v57 = a3;
          __int16 v58 = 2114;
          id v59 = v52;
          LODWORD(v47) = 32;
          int v46 = &v54;
          uint64_t v41 = _os_log_send_and_compose_impl();
          if (v41)
          {
            id v42 = (void *)v41;
            id v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v54, v47);
            free(v42);
            int v46 = (int *)v43;
            SSFileLog();
          }
        }
        uint64_t v35 = (uint64_t)v52;
        if (!v52)
        {
          uint64_t v35 = SSError();
          id v52 = (id)v35;
        }
        accountIDsByAppleID = self->_accountIDsByAppleID;
        id v36 = a3;
      }
      -[NSMutableDictionary setObject:forKey:](accountIDsByAppleID, "setObject:forKey:", v35, v36, v46);
    }
  }

  if (a4) {
    *a4 = v52;
  }
  return v53;
}

- (void)_applyResponses:(id)a3 withTransaction:(id)a4
{
  id v4 = a4;
  id v85 = [a4 database];
  id v81 = +[DownloadHandlerManager handlerManager];
  unsigned int v72 = [(NSString *)self->_restoreReason isEqualToString:@"cancel-retry"];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = a3;
  id v74 = [a3 countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v98;
    uint64_t v76 = SSDownloadPhaseCanceled;
    id v82 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v98 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v7;
        id v8 = *(void **)(*((void *)&v97 + 1) + 8 * v7);
        id v88 = objc_alloc_init((Class)NSMutableDictionary);
        id v9 = [v8 serverResponse];
        id v80 = [v9 userIdentifier];
        id v79 = [v9 error];
        int64_t v84 = -[RestoreDownloadsOperation _downloadRestoreStateForError:](self, "_downloadRestoreStateForError:");
        unsigned int v77 = v9;
        id v10 = [v9 downloads];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v93 objects:v109 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v94;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v94 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              id v16 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithItemIdentifier:", objc_msgSend(v15, "itemIdentifier"));
              [v88 setObject:v15 forKey:v16];
            }
            id v12 = [v10 countByEnumeratingWithState:&v93 objects:v109 count:16];
          }
          while (v12);
        }
        id v17 = objc_msgSend(v8, "requestItems", v67, v70);
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v83 = v17;
        id v87 = [v17 countByEnumeratingWithState:&v89 objects:v108 count:16];
        if (v87)
        {
          uint64_t v86 = *(void *)v90;
          unsigned int v18 = v72;
          if (v84 != 3) {
            unsigned int v18 = 0;
          }
          unsigned int v78 = v18;
          do
          {
            for (j = 0; j != v87; j = (char *)j + 1)
            {
              if (*(void *)v90 != v86) {
                objc_enumerationMutation(v83);
              }
              int v20 = *(void **)(*((void *)&v89 + 1) + 8 * (void)j);
              uint64_t v21 = -[DownloadEntity initWithPersistentID:inDatabase:]([DownloadEntity alloc], "initWithPersistentID:inDatabase:", [v20 downloadIdentifier], v85);
              id v22 = [v20 storeItemID];
              id v23 = [v88 objectForKey:v22];
              if (v23)
              {
                id v24 = v23;
                [v23 kind];
                if (SSDownloadKindIsSoftwareKind()
                  && (id v25 = [v24 requiredDeviceCapabilities]) != 0)
                {
                  unsigned int v26 = [+[ISDevice sharedInstance] checkCapabilities:v25 withMismatches:0];
                }
                else
                {
                  unsigned int v26 = 1;
                }
                objc_msgSend(v24, "kind", v67);
                if (SSDownloadKindIsBookToShimKind())
                {
                  id v27 = +[SSLogConfig sharedDaemonConfig];
                  if (!v27) {
                    id v27 = +[SSLogConfig sharedConfig];
                  }
                  unsigned int v28 = [v27 shouldLog];
                  if ([v27 shouldLogToDisk]) {
                    int v29 = v28 | 2;
                  }
                  else {
                    int v29 = v28;
                  }
                  if (os_log_type_enabled((os_log_t)[v27 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                    int v30 = v29;
                  }
                  else {
                    int v30 = v29 & 2;
                  }
                  if (v30)
                  {
                    uint64_t v31 = objc_opt_class();
                    id v32 = [(DownloadEntity *)v21 persistentID];
                    int v102 = 138543874;
                    uint64_t v103 = v31;
                    __int16 v104 = 2048;
                    id v105 = v32;
                    __int16 v106 = 2114;
                    id v107 = v22;
                    LODWORD(v70) = 32;
                    id v67 = &v102;
                    uint64_t v33 = _os_log_send_and_compose_impl();
                    if (v33)
                    {
                      id v34 = (void *)v33;
                      uint64_t v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, &v102, v70);
                      free(v34);
                      id v67 = (int *)v35;
                      SSFileLog();
                    }
                  }
                  objc_msgSend(v24, "setRequestPersistentID:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v20, "downloadIdentifier", v67)));
                  uint64_t v101 = v24;
                  +[BookAssetDaemonUtility sendRestoreDownloads:withReason:](BookAssetDaemonUtility, "sendRestoreDownloads:withReason:", +[NSArray arrayWithObjects:&v101 count:1], @"restoring books");
                  id v4 = v82;
                }
                else if (v26)
                {
                  [(RestoreDownloadsOperation *)self _updateDownloadEntity:v21 withTransaction:v4 storeDownload:v24 accountID:v80];
                  goto LABEL_99;
                }
                id v43 = +[SSLogConfig sharedDaemonConfig];
                if (!v43) {
                  id v43 = +[SSLogConfig sharedConfig];
                }
                unsigned int v44 = [v43 shouldLog];
                if ([v43 shouldLogToDisk]) {
                  int v45 = v44 | 2;
                }
                else {
                  int v45 = v44;
                }
                if (os_log_type_enabled((os_log_t)[v43 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                  int v46 = v45;
                }
                else {
                  int v46 = v45 & 2;
                }
                if (v46)
                {
                  uint64_t v47 = objc_opt_class();
                  id v48 = [(DownloadEntity *)v21 persistentID];
                  int v102 = 138543874;
                  uint64_t v103 = v47;
                  __int16 v104 = 2048;
                  id v105 = v48;
                  __int16 v106 = 2112;
                  id v107 = v22;
                  LODWORD(v70) = 32;
                  id v67 = &v102;
                  uint64_t v49 = _os_log_send_and_compose_impl();
                  if (v49)
                  {
                    long long v50 = (void *)v49;
                    long long v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v102, v70);
                    free(v50);
                    id v67 = (int *)v51;
                    SSFileLog();
                  }
                }
                objc_msgSend(v4, "unionChangeset:", -[DownloadEntity failWithError:](v21, "failWithError:", SSError()));
              }
              else if (v84)
              {
                id v36 = [(RestoreDownloadsOperation *)self _copyDownloadSessionPropertiesForItem:v20 download:v21];
                if ([v81 canOpenSessionWithProperties:v36])
                {
                  id v37 = +[SSLogConfig sharedDaemonConfig];
                  if (!v37) {
                    id v37 = +[SSLogConfig sharedConfig];
                  }
                  unsigned int v38 = objc_msgSend(v37, "shouldLog", v67);
                  if ([v37 shouldLogToDisk]) {
                    v38 |= 2u;
                  }
                  if (os_log_type_enabled((os_log_t)[v37 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                    int v39 = v38;
                  }
                  else {
                    int v39 = v38 & 2;
                  }
                  if (v39)
                  {
                    uint64_t v40 = objc_opt_class();
                    int v102 = 138543618;
                    uint64_t v103 = v40;
                    __int16 v104 = 2114;
                    id v105 = v20;
                    LODWORD(v70) = 22;
                    uint64_t v41 = _os_log_send_and_compose_impl();
                    if (v41)
                    {
                      id v42 = (void *)v41;
                      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v102, v70);
                      free(v42);
                      SSFileLog();
                    }
                  }
                  uint64_t v68 = objc_opt_class();
                  SSDebugLog();
                  [(DownloadEntity *)v21 setValue:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v84, v68, v20) forProperty:@"download_state.restore_state"];
                }
                else if (v84 == 1)
                {
                  id v59 = [v20 error];
                  if (v22 && !v59) {
                    id v59 = [v77 errorForItemIdentifier:v22];
                  }
                  if (v59) {
                    id v60 = v59;
                  }
                  else {
                    id v60 = v79;
                  }
                  -[RestoreDownloadsOperation _hardFailRestoreItem:download:transaction:error:](self, "_hardFailRestoreItem:download:transaction:error:", v20, v21, v4, v60, v67);
                }
                else if (v78)
                {
                  id v61 = +[SSLogConfig sharedDaemonConfig];
                  if (!v61) {
                    id v61 = +[SSLogConfig sharedConfig];
                  }
                  unsigned int v62 = objc_msgSend(v61, "shouldLog", v67);
                  if ([v61 shouldLogToDisk]) {
                    v62 |= 2u;
                  }
                  if (os_log_type_enabled((os_log_t)[v61 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                    int v63 = v62;
                  }
                  else {
                    int v63 = v62 & 2;
                  }
                  if (v63)
                  {
                    uint64_t v64 = objc_opt_class();
                    int v102 = 138543618;
                    uint64_t v103 = v64;
                    __int16 v104 = 2114;
                    id v105 = v20;
                    LODWORD(v70) = 22;
                    uint64_t v65 = _os_log_send_and_compose_impl();
                    if (v65)
                    {
                      id v66 = (void *)v65;
                      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v65, 4, &v102, v70);
                      free(v66);
                      SSFileLog();
                    }
                  }
                  uint64_t v69 = objc_opt_class();
                  SSDebugLog();
                  objc_msgSend(v4, "finishDownloadWithID:finalPhase:", -[DownloadEntity persistentID](v21, "persistentID", v69, v20), v76);
                }
                else
                {
                  objc_msgSend(v4, "unionChangeset:", -[RestoreDownloadsOperation _softFailRestoreItem:download:withRestoreState:error:](self, "_softFailRestoreItem:download:withRestoreState:error:", v20, v21, v84, v79));
                }
              }
              else
              {
                id v52 = +[SSLogConfig sharedDaemonConfig];
                if (!v52) {
                  id v52 = +[SSLogConfig sharedConfig];
                }
                unsigned int v53 = objc_msgSend(v52, "shouldLog", v67);
                if ([v52 shouldLogToDisk]) {
                  int v54 = v53 | 2;
                }
                else {
                  int v54 = v53;
                }
                if (os_log_type_enabled((os_log_t)[v52 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
                  int v55 = v54;
                }
                else {
                  int v55 = v54 & 2;
                }
                if (v55)
                {
                  uint64_t v56 = objc_opt_class();
                  int v102 = 138543618;
                  uint64_t v103 = v56;
                  __int16 v104 = 2114;
                  id v105 = v20;
                  LODWORD(v70) = 22;
                  uint64_t v57 = _os_log_send_and_compose_impl();
                  if (v57)
                  {
                    __int16 v58 = (void *)v57;
                    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4, &v102, v70);
                    free(v58);
                    SSFileLog();
                  }
                }
                id v67 = (int *)objc_opt_class();
                int v70 = v20;
                SSDebugLog();
              }
LABEL_99:
            }
            id v87 = [v83 countByEnumeratingWithState:&v89 objects:v108 count:16];
          }
          while (v87);
        }

        uint64_t v7 = v75 + 1;
      }
      while ((id)(v75 + 1) != v74);
      id v74 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v74);
  }
}

- (id)_copyDownloadSessionPropertiesForItem:(id)a3 download:(id)a4
{
  id v5 = (DownloadSessionProperties *)[a3 downloadSessionProperties];
  if (!v5)
  {
    v12[0] = @"client_id";
    v12[1] = @"handler_id";
    [a4 getValues:&v10 forProperties:v12 count:2];
    int v6 = [DownloadSessionProperties alloc];
    uint64_t v7 = v10;
    if (v11) {
      id v8 = [v11 longLongValue];
    }
    else {
      id v8 = 0;
    }
    id v5 = [(DownloadSessionProperties *)v6 initWithClientIdentifier:v7 handlerIdentifier:v8];
    [(DownloadSessionProperties *)v5 setDownloadPhase:SSDownloadPhaseDownloading];
  }
  return v5;
}

- (int64_t)_downloadRestoreStateForError:(id)a3
{
  if (-[RestoreDownloadsOperation _isErrorCancelFailure:](self, "_isErrorCancelFailure:")) {
    return 3;
  }
  if ([(RestoreDownloadsOperation *)self _isErrorSoftFail:a3]) {
    return 2;
  }
  return !a3 || (SSErrorIsNetworkError() & 1) == 0;
}

- (void)_establishPrimaryAccount
{
  if (!objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"))
  {
    id v3 = +[SSLogConfig sharedDaemonConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v10 = 138543362;
      uint64_t v11 = objc_opt_class();
      LODWORD(v9) = 12;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v10, v9);
        free(v7);
        SSFileLog();
      }
    }
    id v8 = objc_alloc_init((Class)SSMutableAuthenticationContext);
    [v8 setAccountNameEditable:1];
    [v8 setCanCreateNewAccount:0];
    [v8 setPersistsAcrossDeviceLock:1];
    [v8 setPromptStyle:1001];
    [(RestoreDownloadsOperation *)self copyAccountID:0 credentialSource:0 byAuthenticatingWithContext:v8 returningError:0];
  }
}

- (void)_hardFailRestoreItem:(id)a3 download:(id)a4 transaction:(id)a5 error:(id)a6
{
  id v10 = [a4 persistentID];
  [a4 downloadKind];
  if (SSDownloadKindIsPodcastKind()
    && (id v11 = [a6 domain], objc_msgSend(v11, "isEqualToString:", SSServerErrorDomain))
    && [a6 code] == (id)3701)
  {
    id v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v25 = 138543618;
      uint64_t v26 = objc_opt_class();
      __int16 v27 = 2114;
      id v28 = a3;
      LODWORD(v23) = 22;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        id v16 = (void *)v15;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v25, v23);
        free(v16);
        SSFileLog();
      }
    }
    uint64_t v22 = objc_opt_class();
    id v24 = a3;
  }
  else
  {
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      int v25 = 138543874;
      uint64_t v26 = objc_opt_class();
      __int16 v27 = 2114;
      id v28 = a3;
      __int16 v29 = 2114;
      id v30 = a6;
      LODWORD(v23) = 32;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v25, v23);
        free(v21);
        SSFileLog();
      }
    }
    id v24 = a3;
    uint64_t v22 = objc_opt_class();
  }
  SSDebugLog();
  objc_msgSend(a5, "finishDownloadWithID:finalPhase:", v10, SSDownloadPhaseCanceled, v22, v24);
}

- (BOOL)_isErrorCancelFailure:(id)a3
{
  if (ISErrorIsEqual()) {
    return 1;
  }

  return ISErrorIsEqual();
}

- (BOOL)_isErrorSoftFail:(id)a3
{
  id v4 = [a3 domain];
  if (([v4 isEqualToString:SSServerErrorDomain] & 1) != 0
    || ([v4 isEqualToString:NSURLErrorDomain] & 1) != 0
    || ([v4 isEqualToString:kCFErrorDomainCFNetwork] & 1) != 0)
  {
LABEL_4:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ([v4 isEqualToString:SSErrorDomain])
  {
    uint64_t v6 = (char *)[a3 code];
    if ((unint64_t)(v6 - 109) <= 0x17 && ((1 << (v6 - 109)) & 0x800003) != 0
      || v6 == (char *)16
      || v6 == (char *)2)
    {
      goto LABEL_4;
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v5 = [v4 isEqualToString:NSCocoaErrorDomain];
    if (v5) {
      LOBYTE(v5) = ((unint64_t)[a3 code] & 0xFFFFFFFFFFFFFF00) == 3840;
    }
  }
  return v5;
}

- (id)_newDownloadWithStoreDownload:(id)a3
{
  id v3 = [[Download alloc] initWithStoreDownload:a3];
  [(Download *)v3 setValue:+[NSNumber numberWithBool:1] forProperty:@"is_from_store"];
  [(Download *)v3 setValue:&off_1003C9180 forProperty:@"priority"];
  [(Download *)v3 setValue:+[NSNumber numberWithBool:1] forProperty:@"suppress_error_dialogs"];
  id v4 = objc_alloc_init((Class)SSNetworkConstraints);
  [v4 disableCellularNetworkTypes];
  [(Download *)v3 unionNetworkConstraints:v4];

  return v3;
}

- (id)_newRestoreItemsWithDownloadIDs:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[DownloadsDatabase downloadsDatabase];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000CEC30;
  v29[3] = &unk_1003A3F18;
  v29[4] = a3;
  v29[5] = v4;
  [v6 readUsingTransactionBlock:v29];
  id v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
    v9 &= 2u;
  }
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v11 = [v5 count];
    *(_DWORD *)uint64_t v31 = 138543618;
    *(void *)&v31[4] = v10;
    __int16 v32 = 2048;
    id v33 = v11;
    LODWORD(v23) = 22;
    uint64_t v22 = (NSString *)v31;
    uint64_t v12 = _os_log_send_and_compose_impl();
    if (v12)
    {
      unsigned int v13 = (void *)v12;
      int v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v31, v23);
      free(v13);
      uint64_t v22 = v14;
      SSFileLog();
    }
  }
  if (objc_msgSend(v5, "count", v22))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v5);
          }
          int v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v20 = [v19 bundleID];
          if (v20)
          {
            *(void *)uint64_t v31 = 0;
            objc_msgSend(v19, "setHasRestoreData:", +[RestoreBackupOperation restoreDataExistsForApplicationWithBundleID:size:](RestoreBackupOperation, "restoreDataExistsForApplicationWithBundleID:size:", v20, v31));
            [v19 setRestoreDataSize:*(void *)v31];
          }
        }
        id v16 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v16);
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000CF228;
    v24[3] = &unk_1003A5F80;
    v24[4] = v5;
    [v6 modifyUsingTransactionBlock:v24];
  }

  return v4;
}

- (BOOL)_preflightAccountWithID:(id)a3 isFamily:(BOOL)a4 error:(id *)a5
{
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3052000000;
  int v39 = sub_1000CF8D8;
  uint64_t v40 = sub_1000CF8E8;
  uint64_t v41 = 0;
  id v8 = +[SSAccountStore defaultStore];
  int v9 = v8;
  if (a4) {
    id v10 = [v8 activeAccount];
  }
  else {
    id v10 = [v8 accountWithUniqueIdentifier:a3];
  }
  id v11 = v10;
  if (objc_msgSend(objc_msgSend(v10, "accountName"), "length"))
  {
    if (([v9 isExpired] & 1) != 0
      || ([v11 isAuthenticated] & 1) == 0)
    {
      id v12 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v11];
      [v12 setAccountNameEditable:1];
      [v12 setAllowsSilentAuthentication:1];
      [v12 setCanCreateNewAccount:0];
      [v12 setPersistsAcrossDeviceLock:1];
      [v12 setPromptStyle:1001];
      id v13 = [objc_alloc((Class)SSAuthenticateRequest) initWithAuthenticationContext:v12];
      id v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = [v14 shouldLog];
      unsigned int v16 = [v14 shouldLogToDisk];
      uint64_t v17 = [v14 OSLogObject];
      if (v16) {
        v15 |= 2u;
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        v15 &= 2u;
      }
      if (v15)
      {
        uint64_t v18 = objc_opt_class();
        int v46 = 138543618;
        uint64_t v47 = v18;
        __int16 v48 = 2114;
        id v49 = v11;
        LODWORD(v34) = 22;
        uint64_t v19 = _os_log_send_and_compose_impl();
        if (v19)
        {
          id v20 = (void *)v19;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v46, v34);
          free(v20);
          SSFileLog();
        }
      }
      uint64_t v21 = dispatch_semaphore_create(0);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000CF8F4;
      v35[3] = &unk_1003A5FA8;
      v35[6] = &v36;
      v35[4] = v21;
      v35[5] = &v42;
      [v13 startWithAuthenticateResponseBlock:v35];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v21);
    }
  }
  else
  {
    id v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig];
    }
    unsigned int v23 = [v22 shouldLog];
    unsigned int v24 = [v22 shouldLogToDisk];
    long long v25 = [v22 OSLogObject];
    if (v24) {
      v23 |= 2u;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      v23 &= 2u;
    }
    if (v23)
    {
      uint64_t v26 = objc_opt_class();
      int v46 = 138543618;
      uint64_t v47 = v26;
      __int16 v48 = 2114;
      id v49 = a3;
      LODWORD(v34) = 22;
      uint64_t v27 = _os_log_send_and_compose_impl();
      if (v27)
      {
        long long v28 = (void *)v27;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v46, v34);
        free(v28);
        SSFileLog();
      }
    }
    id v29 = (id)SSError();
    v37[5] = (uint64_t)v29;
    *((unsigned char *)v43 + 24) = 0;
  }
  id v30 = v37;
  if (a5) {
    *a5 = (id)v37[5];
  }
  id v31 = (id)v30[5];
  char v32 = *((unsigned char *)v43 + 24);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  return v32;
}

- (void)_scheduleAutomaticRetry
{
  CFStringRef v2 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RestoreSoftFailRetryCount", kSSUserDefaultsIdentifier, 0);
  if (AppIntegerValue <= 4)
  {
    CFIndex v4 = AppIntegerValue;
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      CFIndex v8 = v4 + 1;
      int v14 = 138543874;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      CFIndex v17 = v4 + 1;
      __int16 v18 = 2048;
      uint64_t v19 = 0x40AC200000000000;
      LODWORD(v13) = 32;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        id v10 = (void *)v9;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v14, v13);
        free(v10);
        SSFileLog();
      }
    }
    else
    {
      CFIndex v8 = v4 + 1;
    }
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v11, XPC_ACTIVITY_DELAY, 3600);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    id v12 = [[BackgroundTaskRequest alloc] initWithBackgroundTaskAgentJob:v11];
    [(BackgroundTaskRequest *)v12 setRequestIdentifier:@"com.apple.itunesstored.RetrySoftFailedRestoreDownloads"];
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addBackgroundTaskWithRequest:", v12);

    CFPreferencesSetAppValue(@"RestoreSoftFailRetryCount", +[NSNumber numberWithInteger:v8], v2);
    CFPreferencesAppSynchronize(v2);
    xpc_release(v11);
  }
}

- (void)_scheduleCancelRetry
{
  id v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2) {
    id v2 = +[SSLogConfig sharedConfig];
  }
  unsigned int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  if (!os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v10 = 138543618;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 2048;
    uint64_t v13 = 0x40F5180000000000;
    LODWORD(v9) = 22;
    uint64_t v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      unsigned int v6 = (void *)v5;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v5, 4, &v10, v9);
      free(v6);
      SSFileLog();
    }
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, 3600);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  CFIndex v8 = [[BackgroundTaskRequest alloc] initWithBackgroundTaskAgentJob:v7];
  [(BackgroundTaskRequest *)v8 setRequestIdentifier:@"com.apple.itunesstored.RetryCanceledRestoreDownloads"];
  objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "addBackgroundTaskWithRequest:", v8);

  xpc_release(v7);
}

- (BOOL)_shouldAuthenticateForCancelRetry
{
  id v3 = objc_alloc((Class)ISDialog);
  int v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"RESTORE_CANCEL_RETRY_TITLE" value:&stru_1003B9B00 table:0];
  id v5 = objc_msgSend(v3, "initWithTitle:message:", v4, -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"RESTORE_CANCEL_RETRY_BODY", &stru_1003B9B00, 0));
  unsigned int v6 = +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"RESTORE_CANCEL_RETRY_DELETE_BUTTON" value:&stru_1003B9B00 table:0]);
  xpc_object_t v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, +[ISDialogButton buttonWithTitle:](ISDialogButton, "buttonWithTitle:", [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"RESTORE_CANCEL_RETRY_DOWNLOAD_BUTTON" value:&stru_1003B9B00 table:0]), 0);
  [v5 setButtons:v7];
  BOOL v8 = 1;
  [v5 setDefaultButtonIndex:1];
  [v5 setDismissOnLock:0];
  [v5 setShouldDismissAfterUnlock:0];
  uint64_t v9 = +[ISDialogOperation operationWithDialog:v5];
  [(RestoreDownloadsOperation *)self runSubOperation:v9 returningError:0];

  id v10 = [(ISDialogOperation *)v9 selectedButton];
  if (v10) {
    return v10 == [(NSArray *)v7 objectAtIndex:1];
  }
  return v8;
}

- (BOOL)_shouldAutomaticallyRetryAfterSoftFailError:(id)a3
{
  id v4 = [a3 domain];
  if ([v4 isEqualToString:NSURLErrorDomain])
  {
    LOBYTE(v5) = 1;
  }
  else if ([v4 isEqualToString:SSServerErrorDomain])
  {
    LOBYTE(v5) = [a3 code] != (id)3038;
  }
  else
  {
    LODWORD(v5) = [v4 isEqualToString:SSErrorDomain];
    if (v5)
    {
      id v5 = (char *)[a3 code];
      if ((unint64_t)(v5 - 109) <= 0x17) {
        LOBYTE(v5) = (0x800003u >> ((_BYTE)v5 - 109)) & 1;
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
  }
  return (char)v5;
}

- (id)_softFailRestoreItem:(id)a3 download:(id)a4 withRestoreState:(int64_t)a5 error:(id)a6
{
  objc_msgSend(a4, "setValue:forProperty:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5), @"download_state.restore_state");
  id v11 = [a4 failWithError:a6];
  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v14 &= 2u;
  }
  if (v14)
  {
    int v24 = 138543874;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2114;
    id v27 = a3;
    __int16 v28 = 2114;
    id v29 = a6;
    LODWORD(v22) = 32;
    uint64_t v15 = _os_log_send_and_compose_impl();
    if (v15)
    {
      __int16 v16 = (void *)v15;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v24, v22);
      free(v16);
      SSFileLog();
    }
  }
  id v23 = a3;
  uint64_t v21 = objc_opt_class();
  BOOL v17 = 1;
  SSDebugLog();
  if (!self->_hadAutoRetrySoftFailure) {
    BOOL v17 = -[RestoreDownloadsOperation _shouldAutomaticallyRetryAfterSoftFailError:](self, "_shouldAutomaticallyRetryAfterSoftFailError:", a6, v21, v23, a6);
  }
  self->_hadAutoRetrySoftFailure = v17;
  BOOL v19 = a5 == 3 || self->_hadCancelFailure;
  self->_hadCancelFailure = v19;
  return v11;
}

- (BOOL)_updateDownloadEntity:(id)a3 withTransaction:(id)a4 storeDownload:(id)a5 accountID:(id)a6
{
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    int v13 = v12;
  }
  else {
    int v13 = v12 & 2;
  }
  if (v13)
  {
    int v24 = 138544386;
    uint64_t v25 = objc_opt_class();
    __int16 v26 = 2048;
    id v27 = [a3 persistentID];
    __int16 v28 = 2048;
    id v29 = [a5 itemIdentifier];
    __int16 v30 = 2114;
    id v31 = [a5 artistName];
    __int16 v32 = 2114;
    id v33 = [a5 title];
    LODWORD(v22) = 52;
    uint64_t v21 = &v24;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      __int16 v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v24, v22);
      free(v15);
      uint64_t v21 = (int *)v16;
      SSFileLog();
    }
  }
  id v17 = -[RestoreDownloadsOperation _newDownloadWithStoreDownload:](self, "_newDownloadWithStoreDownload:", a5, v21);
  __int16 v18 = v17;
  if (a6) {
    [v17 setValue:a6 forProperty:@"store_account_id"];
  }
  unsigned int v19 = objc_msgSend(a4, "updateDownloadEntityWithIdentifier:withDownload:", objc_msgSend(a3, "persistentID"), v18);
  if (v19) {
    objc_msgSend(a5, "writeToFile:options:error:", objc_msgSend(+[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:](ScratchManager, "directoryPathForDownloadID:kind:createIfNeeded:", objc_msgSend(a3, "persistentID"), objc_msgSend(a5, "kind"), 1), "stringByAppendingPathComponent:", @"iTunesMetadata.plist"), 0, 0);
  }

  return v19;
}

@end