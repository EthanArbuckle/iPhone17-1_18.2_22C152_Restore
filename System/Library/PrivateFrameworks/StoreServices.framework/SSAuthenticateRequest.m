@interface SSAuthenticateRequest
+ (BOOL)_isAuthkitEntitled;
+ (id)_accountToAuthenticateWithAuthenticationContext:(id)a3;
- (BOOL)_shouldRunAuthenticationForAccount:(id)a3;
- (BOOL)start;
- (NSString)logUUID;
- (SSAuthenticateRequest)init;
- (SSAuthenticateRequest)initWithAccount:(id)a3;
- (SSAuthenticateRequest)initWithAuthenticationContext:(id)a3;
- (SSAuthenticateRequest)initWithXPCEncoding:(id)a3;
- (SSAuthenticationContext)authenticationContext;
- (SSLogConfig)logConfig;
- (UIViewController)_parentViewController;
- (id)_verifyCredentialsOptionsFromUpdateAccountResponse:(id)a3 skipAuthKit:(BOOL)a4;
- (id)copyXPCEncoding;
- (id)run;
- (int64_t)_responseTypeForError:(id)a3;
- (void)_handleDialogFromError:(id)a3;
- (void)_performRemoteAuthenticationWithCompletion:(id)a3;
- (void)setLogConfig:(id)a3;
- (void)set_parentViewController:(id)a3;
- (void)startWithAuthenticateResponseBlock:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSAuthenticateRequest

+ (BOOL)_isAuthkitEntitled
{
  int v2 = SSIsDaemon();
  getpid();
  if (!sandbox_check())
  {
    v3 = SecTaskCreateFromSelf(0);
    if (v3)
    {
      v4 = v3;
      CFErrorRef error = 0;
      CFTypeRef v5 = SecTaskCopyValueForEntitlement(v3, @"com.apple.authkit.client.private", &error);
      if (error) {
        CFRelease(error);
      }
      if (v5)
      {
        CFRelease(v5);
        int v2 = 1;
      }
      CFRelease(v4);
    }
    if (v2)
    {
      LODWORD(v6) = 1;
    }
    else
    {
      v7 = SecTaskCreateFromSelf(0);
      if (v7)
      {
        v8 = v7;
        CFErrorRef error = 0;
        CFTypeRef v6 = SecTaskCopyValueForEntitlement(v7, @"com.apple.authkit.client.internal", &error);
        if (error) {
          CFRelease(error);
        }
        if (v6)
        {
          CFRelease(v6);
          LODWORD(v6) = 1;
        }
        CFRelease(v8);
      }
      else
      {
        LODWORD(v6) = 0;
      }
    }
    LOBYTE(v2) = v6 != 0;
  }
  return v2;
}

- (SSAuthenticateRequest)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  CFTypeRef v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v18 = 138543362;
  id v19 = (id)objc_opt_class();
  id v7 = v19;
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    CFTypeRef v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v16);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:
  }
  v17.receiver = self;
  v17.super_class = (Class)SSAuthenticateRequest;
  return [(SSRequest *)&v17 init];
}

- (SSAuthenticateRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [[SSAuthenticationContext alloc] initWithAccount:v4];
    CFTypeRef v6 = [(SSAuthenticateRequest *)self initWithAuthenticationContext:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSAuthenticateRequest;
    CFTypeRef v6 = [(SSRequest *)&v8 init];
  }

  return v6;
}

- (SSAuthenticateRequest)initWithAuthenticationContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSAuthenticateRequest;
  int v5 = [(SSRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (SSAuthenticationContext *)v6;
  }
  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (id)run
{
  v3 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  objc_super v9 = __28__SSAuthenticateRequest_run__block_invoke;
  uint64_t v10 = &unk_1E5BA93F0;
  objc_copyWeak(&v11, &location);
  [(SSPromise *)v3 addErrorBlock:&v7];
  id v4 = [(SSPromise *)v3 completionHandlerAdapter];
  [(SSAuthenticateRequest *)self startWithAuthenticateResponseBlock:v4];

  int v5 = [(SSPromise *)v3 resultWithError:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __28__SSAuthenticateRequest_run__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    id v23 = v10;
    id v11 = [WeakRetained logUUID];
    uint64_t v12 = [WeakRetained authenticationContext];
    uint64_t v13 = [v12 accountName];
    SSHashIfNeeded(v13);
    int v24 = 138544130;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v11;
    __int16 v28 = 2114;
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v30 = 2112;
    id v31 = v3;
    LODWORD(v22) = 42;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (v14)
    {
      v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v24, v22);
      free(v14);
      SSFileLog(v5, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
  else
  {
  }
}

- (void)startWithAuthenticateResponseBlock:(id)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v119 = a3;
  id v3 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    v4 |= 2u;
  }
  int v5 = [v3 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    int v6 = v4;
  }
  else {
    int v6 = v4 & 2;
  }
  if (v6)
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    int v9 = [(SSAuthenticateRequest *)self logUUID];
    uint64_t v10 = [(SSAuthenticateRequest *)self authenticationContext];
    id v11 = [(SSAuthenticateRequest *)self authenticationContext];
    uint64_t v12 = [v11 accountName];
    uint64_t v13 = SSHashIfNeeded(v12);
    *(_DWORD *)id location = 138544130;
    *(void *)&location[4] = v7;
    __int16 v135 = 2114;
    v136 = v9;
    __int16 v137 = 2112;
    id v138 = v10;
    __int16 v139 = 2114;
    v140 = v13;
    LODWORD(v118) = 42;
    v116 = location;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (v14)
    {
      v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v118);
      free(v14);
      SSFileLog(v3, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
  else
  {
  }
  uint64_t v22 = [MEMORY[0x1E4F28B50] mainBundle];
  id v23 = [v22 bundleIdentifier];
  int v24 = [v23 isEqualToString:@"com.apple.appstored"];

  if (![(SSAuthenticationContext *)self->_authenticationContext forceDaemonAuthentication]
    && ([(id)objc_opt_class() _isAuthkitEntitled] ^ 1 | v24) != 1
    || +[SSAccountStore unitTestModeEnabled])
  {
    v25 = objc_opt_class();
    __int16 v26 = [(SSAuthenticateRequest *)self authenticationContext];
    v27 = [v25 _accountToAuthenticateWithAuthenticationContext:v26];

    if (![v27 isDemoAccount]) {
      goto LABEL_28;
    }
    __int16 v28 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v28)
    {
      __int16 v28 = +[SSLogConfig sharedConfig];
    }
    int v29 = objc_msgSend(v28, "shouldLog", v116);
    if ([v28 shouldLogToDisk]) {
      v29 |= 2u;
    }
    __int16 v30 = [v28 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      int v31 = v29;
    }
    else {
      int v31 = v29 & 2;
    }
    if (v31)
    {
      uint64_t v32 = objc_opt_class();
      id v33 = v32;
      v34 = [(SSAuthenticateRequest *)self logUUID];
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v32;
      __int16 v135 = 2114;
      v136 = v34;
      LODWORD(v118) = 22;
      v116 = location;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_27:

LABEL_28:
        if (-[SSAuthenticateRequest _shouldRunAuthenticationForAccount:](self, "_shouldRunAuthenticationForAccount:", v27, v116))
        {
          goto LABEL_83;
        }
        v42 = +[SSLogConfig sharedAccountsAuthenticationConfig];
        if (!v42)
        {
          v42 = +[SSLogConfig sharedConfig];
        }
        int v43 = [v42 shouldLog];
        if ([v42 shouldLogToDisk]) {
          v43 |= 2u;
        }
        v44 = [v42 OSLogObject];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
          v43 &= 2u;
        }
        if (v43)
        {
          v45 = objc_opt_class();
          id v46 = v45;
          v47 = [(SSAuthenticateRequest *)self logUUID];
          v48 = [v27 hashedDescription];
          *(_DWORD *)id location = 138543874;
          *(void *)&location[4] = v45;
          __int16 v135 = 2114;
          v136 = v47;
          __int16 v137 = 2114;
          id v138 = v48;
          LODWORD(v118) = 32;
          v117 = location;
          v49 = (void *)_os_log_send_and_compose_impl();

          if (!v49)
          {
LABEL_39:

            v56 = +[SSAccountStore defaultStore];
            if (!v27) {
              goto LABEL_65;
            }
            if ([v27 isActive]) {
              goto LABEL_65;
            }
            v57 = [v56 activeAccount];
            BOOL v58 = v57 == 0;

            if (!v58) {
              goto LABEL_65;
            }
            v59 = +[SSLogConfig sharedAccountsAuthenticationConfig];
            if (!v59)
            {
              v59 = +[SSLogConfig sharedConfig];
            }
            int v60 = objc_msgSend(v59, "shouldLog", v117);
            if ([v59 shouldLogToDisk]) {
              v60 |= 2u;
            }
            v61 = [v59 OSLogObject];
            if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
              v60 &= 2u;
            }
            if (v60)
            {
              v62 = objc_opt_class();
              id v63 = v62;
              v64 = [(SSAuthenticateRequest *)self logUUID];
              v65 = [v27 hashedDescription];
              *(_DWORD *)id location = 138543874;
              *(void *)&location[4] = v62;
              __int16 v135 = 2114;
              v136 = v64;
              __int16 v137 = 2114;
              id v138 = v65;
              LODWORD(v118) = 32;
              v117 = location;
              v66 = (void *)_os_log_send_and_compose_impl();

              if (!v66) {
                goto LABEL_52;
              }
              v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v66, 4, location, v118);
              free(v66);
              SSFileLog(v59, @"%@", v67, v68, v69, v70, v71, v72, (uint64_t)v61);
            }

LABEL_52:
            [v27 setActive:1];
            id v133 = 0;
            char v73 = [v56 saveAccount:v27 verifyCredentials:0 error:&v133];
            id v74 = v133;
            if (v73)
            {
LABEL_64:

LABEL_65:
              v88 = objc_alloc_init(SSAuthenticateResponse);
              v89 = v88;
              if (v27)
              {
                [(SSAuthenticateResponse *)v88 setAuthenticatedAccount:v27];
                uint64_t v90 = 4;
              }
              else
              {
                v103 = SSError(@"SSErrorDomain", 114, @"Nil Account", @"We can't authenticate a nil account.");
                [(SSAuthenticateResponse *)v89 setError:v103];

                uint64_t v90 = 0;
              }
              -[SSAuthenticateResponse setAuthenticateResponseType:](v89, "setAuthenticateResponseType:", v90, v117);

              if (v89)
              {
                if (v119)
                {
                  v104 = dispatch_get_global_queue(0, 0);
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke;
                  block[3] = &unk_1E5BA7328;
                  id v132 = v119;
                  v131 = v89;
                  dispatch_async(v104, block);
                }
                [(SSRequest *)self _shutdownRequest];
LABEL_86:

                goto LABEL_87;
              }
LABEL_83:
              v105 = [(SSAuthenticateRequest *)self authenticationContext];
              v106 = [v105 accountStoreOptions];
              v89 = (SSAuthenticateResponse *)[v106 mutableCopy];

              v107 = [(SSAuthenticateRequest *)self logUUID];
              [(SSAuthenticateResponse *)v89 setObject:v107 forKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];

              v108 = [(SSAuthenticateRequest *)self _parentViewController];

              if (v108)
              {
                v109 = (void *)MEMORY[0x1E4F29238];
                v110 = [(SSAuthenticateRequest *)self _parentViewController];
                v111 = [v109 valueWithNonretainedObject:v110];
                [(SSAuthenticateResponse *)v89 setObject:v111 forKeyedSubscript:@"SSAccountStoreAuthKitPresentingViewController"];
              }
              v112 = +[SSAccountStore defaultStore];
              v113 = [v112 updateAccountWithAuthKit:v27 store:0 options:v89];

              objc_initWeak((id *)location, self);
              v127[0] = MEMORY[0x1E4F143A8];
              v127[1] = 3221225472;
              v127[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_2;
              v127[3] = &unk_1E5BA9440;
              objc_copyWeak(&v128, (id *)location);
              char v129 = 1;
              v127[4] = self;
              v114 = [v113 thenWithBlock:v127];
              v124[0] = MEMORY[0x1E4F143A8];
              v124[1] = 3221225472;
              v124[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_4;
              v124[3] = &unk_1E5BA9468;
              objc_copyWeak(&v126, (id *)location);
              id v115 = v119;
              id v125 = v115;
              [v114 addErrorBlock:v124];
              v121[0] = MEMORY[0x1E4F143A8];
              v121[1] = 3221225472;
              v121[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_7;
              v121[3] = &unk_1E5BA9490;
              objc_copyWeak(&v123, (id *)location);
              id v122 = v115;
              [v114 addSuccessBlock:v121];

              objc_destroyWeak(&v123);
              objc_destroyWeak(&v126);

              objc_destroyWeak(&v128);
              objc_destroyWeak((id *)location);

              goto LABEL_86;
            }
            v75 = +[SSLogConfig sharedAccountsAuthenticationConfig];
            if (!v75)
            {
              v75 = +[SSLogConfig sharedConfig];
            }
            int v76 = objc_msgSend(v75, "shouldLog", v117);
            if ([v75 shouldLogToDisk]) {
              v76 |= 2u;
            }
            v77 = [v75 OSLogObject];
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              v76 &= 2u;
            }
            if (v76)
            {
              v78 = [(SSAuthenticateRequest *)self logUUID];
              v79 = objc_opt_class();
              *(_DWORD *)id location = 138543874;
              *(void *)&location[4] = v78;
              __int16 v135 = 2114;
              v136 = v79;
              __int16 v137 = 2112;
              id v138 = v74;
              id v80 = v79;
              LODWORD(v118) = 32;
              v117 = location;
              v81 = (void *)_os_log_send_and_compose_impl();

              if (!v81)
              {
LABEL_63:

                goto LABEL_64;
              }
              v77 = objc_msgSend(NSString, "stringWithCString:encoding:", v81, 4, location, v118);
              free(v81);
              SSFileLog(v75, @"%@", v82, v83, v84, v85, v86, v87, (uint64_t)v77);
            }

            goto LABEL_63;
          }
          v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v49, 4, location, v118);
          free(v49);
          SSFileLog(v42, @"%@", v50, v51, v52, v53, v54, v55, (uint64_t)v44);
        }

        goto LABEL_39;
      }
      __int16 v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v35, 4, location, v118);
      free(v35);
      SSFileLog(v28, @"%@", v36, v37, v38, v39, v40, v41, (uint64_t)v30);
    }

    goto LABEL_27;
  }
  v91 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v91)
  {
    v91 = +[SSLogConfig sharedConfig];
  }
  int v92 = [v91 shouldLog];
  if ([v91 shouldLogToDisk]) {
    v92 |= 2u;
  }
  v93 = [v91 OSLogObject];
  if (!os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
    v92 &= 2u;
  }
  if (!v92) {
    goto LABEL_76;
  }
  v94 = objc_opt_class();
  *(_DWORD *)id location = 138543362;
  *(void *)&location[4] = v94;
  id v95 = v94;
  LODWORD(v118) = 12;
  v96 = (void *)_os_log_send_and_compose_impl();

  if (v96)
  {
    v93 = objc_msgSend(NSString, "stringWithCString:encoding:", v96, 4, location, v118);
    free(v96);
    SSFileLog(v91, @"%@", v97, v98, v99, v100, v101, v102, (uint64_t)v93);
LABEL_76:
  }
  [(SSAuthenticateRequest *)self _performRemoteAuthenticationWithCompletion:v119];
LABEL_87:
}

uint64_t __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

SSPromise *__60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = objc_alloc_init(SSPromise);
  int v6 = [v3 updatedAccount];
  int v7 = [v6 backingAccount];

  id v8 = [WeakRetained _verifyCredentialsOptionsFromUpdateAccountResponse:v3 skipAuthKit:*(unsigned __int8 *)(a1 + 48)];
  int v9 = +[SSAccountStore defaultStore];
  uint64_t v10 = [v9 backingAccountStore];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_3;
  v17[3] = &unk_1E5BA9418;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 32);
  id v18 = v11;
  uint64_t v19 = v12;
  uint64_t v13 = v5;
  uint64_t v20 = v13;
  [v10 verifyCredentialsForAccount:v7 options:v8 completion:v17];
  uint64_t v14 = v20;
  v15 = v13;

  objc_destroyWeak(&v21);
  return v15;
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  int v7 = objc_alloc_init(SSAuthenticateResponse);
  -[SSAuthenticateResponse setCredentialSource:](v7, "setCredentialSource:", [a1[4] credentialSource]);
  if (v11)
  {
    id v8 = [[SSAccount alloc] initWithBackingAccount:v11];
    [(SSAuthenticateResponse *)v7 setAuthenticatedAccount:v8];

    [(SSAuthenticateResponse *)v7 setAuthenticateResponseType:4];
    int v9 = +[SSAccountStore defaultStore];
    [v9 clearCachedAccounts];

    +[SSAccountStore resetExpirationForTokenType:](SSAccountStore, "resetExpirationForTokenType:", [*((id *)a1[5] + 12) tokenType]);
  }
  else
  {
    [a1[5] _handleDialogFromError:v5];
    -[SSAuthenticateResponse setAuthenticateResponseType:](v7, "setAuthenticateResponseType:", [WeakRetained _responseTypeForError:v5]);
    [(SSAuthenticateResponse *)v7 setError:v5];
    uint64_t v10 = [v5 userInfo];
    [(SSAuthenticateResponse *)v7 setResponseDictionary:v10];
  }
  [a1[6] finishWithResult:v7];
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32))
  {
    id v5 = [v3 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F4ED70]];

    if (v6)
    {
      int v7 = objc_alloc_init(SSAuthenticateResponse);
      -[SSAuthenticateResponse setAuthenticateResponseType:](v7, "setAuthenticateResponseType:", [WeakRetained _responseTypeForError:v3]);
      [(SSAuthenticateResponse *)v7 setError:v3];
      id v8 = [v3 userInfo];
      [(SSAuthenticateResponse *)v7 setResponseDictionary:v8];

      int v9 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_5;
      block[3] = &unk_1E5BA7328;
      id v10 = *(id *)(a1 + 32);
      uint64_t v20 = v7;
      id v21 = v10;
      id v11 = v7;
      dispatch_async(v9, block);
    }
    else
    {
      uint64_t v12 = dispatch_get_global_queue(0, 0);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_6;
      uint64_t v16 = &unk_1E5BA7328;
      id v18 = (SSAuthenticateResponse *)*(id *)(a1 + 32);
      id v17 = v3;
      dispatch_async(v12, &v13);

      id v11 = v18;
    }
  }
  objc_msgSend(WeakRetained, "_shutdownRequest", v13, v14, v15, v16);
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_5(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [v2 error];
  (*(void (**)(uint64_t, void *, id))(v1 + 16))(v1, v2, v3);
}

uint64_t __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    int v6 = dispatch_get_global_queue(0, 0);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    int v9 = __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_8;
    id v10 = &unk_1E5BA7328;
    id v12 = v5;
    id v11 = v3;
    dispatch_async(v6, &v7);
  }
  objc_msgSend(WeakRetained, "_shutdownRequest", v7, v8, v9, v10);
}

void __60__SSAuthenticateRequest_startWithAuthenticateResponseBlock___block_invoke_8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [v2 error];
  (*(void (**)(uint64_t, void *, id))(v1 + 16))(v1, v2, v3);
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__SSAuthenticateRequest_start__block_invoke;
  v3[3] = &unk_1E5BA94B8;
  v3[4] = self;
  [(SSAuthenticateRequest *)self startWithAuthenticateResponseBlock:v3];
  return 1;
}

void __30__SSAuthenticateRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SSAuthenticateRequest_start__block_invoke_2;
  block[3] = &unk_1E5BA7068;
  void block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __30__SSAuthenticateRequest_start__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      [v2 authenticateRequest:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40)];
    }
    if (objc_opt_respondsToSelector()) {
      [v2 requestDidFinish:*(void *)(a1 + 32)];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v2 request:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 48)];
  }
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SSAuthenticateRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BA94E0;
  id v7 = v4;
  id v5 = v4;
  [(SSAuthenticateRequest *)self startWithAuthenticateResponseBlock:v6];
}

uint64_t __50__SSAuthenticateRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SSAuthenticateRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

void __40__SSAuthenticateRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
}

- (SSAuthenticateRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSAuthenticateRequest;
    id v6 = [(SSRequest *)&v12 init];
    if (v6)
    {
      id v8 = [SSAuthenticationContext alloc];
      id v9 = xpc_dictionary_get_value(v5, "50");
      uint64_t v10 = [(SSAuthenticationContext *)v8 initWithXPCEncoding:v9];
      authenticationContext = v6->_authenticationContext;
      v6->_authenticationContext = (SSAuthenticationContext *)v10;
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (NSString)logUUID
{
  id v2 = [(SSAuthenticateRequest *)self authenticationContext];
  xpc_object_t v3 = [v2 logUUID];

  return (NSString *)v3;
}

+ (id)_accountToAuthenticateWithAuthenticationContext:(id)a3
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v163 = a3;
  xpc_object_t v3 = [v163 altDSID];
  uint64_t v4 = [v163 requiredUniqueIdentifier];
  id v5 = [v163 accountName];
  uint64_t v164 = [v163 accountScope];
  v166 = [v163 logUUID];
  id v6 = &off_1E5BA6000;
  v165 = (void *)v4;
  if (!v3 && !v4 && !v5)
  {
    id v7 = +[SSAccountStore defaultStore];
    id v8 = [v7 demoAccount];
    id v5 = [v8 accountName];

    if (v5)
    {
      id v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v9)
      {
        id v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      objc_super v12 = [v9 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        int v13 = v11;
      }
      else {
        int v13 = v11 & 2;
      }
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        v15 = AMSHashIfNeeded();
        int v168 = 138543874;
        uint64_t v169 = v14;
        __int16 v170 = 2114;
        v171 = v166;
        __int16 v172 = 2114;
        v173 = v15;
        LODWORD(v162) = 32;
        v156 = &v168;
        uint64_t v16 = (void *)_os_log_send_and_compose_impl();

        if (v16)
        {
          id v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v168, v162);
          free(v16);
          SSFileLog(v9, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
        }
      }
      else
      {
      }
      id v6 = &off_1E5BA6000;
    }
  }
  int v24 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v24)
  {
    int v24 = +[SSLogConfig sharedConfig];
  }
  int v25 = [v24 shouldLog];
  if ([v24 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  v27 = [v24 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
    int v28 = v26;
  }
  else {
    int v28 = v26 & 2;
  }
  v167 = v5;
  if (v28)
  {
    int v29 = objc_opt_class();
    id v30 = v29;
    int v31 = SSHashIfNeeded(v3);
    [v165 description];
    v33 = uint64_t v32 = v3;
    v34 = SSHashIfNeeded(v33);
    v35 = SSHashIfNeeded(v5);
    int v168 = 138544642;
    uint64_t v169 = (uint64_t)v29;
    __int16 v170 = 2114;
    v171 = v166;
    __int16 v172 = 2114;
    v173 = v31;
    __int16 v174 = 2114;
    v175 = v34;
    __int16 v176 = 2114;
    v177 = v35;
    __int16 v178 = 2048;
    uint64_t v36 = v164;
    uint64_t v179 = v164;
    LODWORD(v162) = 62;
    v157 = &v168;
    uint64_t v37 = (void *)_os_log_send_and_compose_impl();

    xpc_object_t v3 = v32;
    id v5 = v167;

    id v6 = &off_1E5BA6000;
    if (!v37) {
      goto LABEL_31;
    }
    v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v168, v162);
    free(v37);
    SSFileLog(v24, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v27);
  }
  else
  {
    uint64_t v36 = v164;
  }

LABEL_31:
  v44 = (void *)MEMORY[0x1E4F4D9F0];
  if (!v36) {
    v44 = (void *)MEMORY[0x1E4F4D9E8];
  }
  v45 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *v44, v157);
  id v46 = v165;
  v47 = objc_msgSend(v45, "ams_iTunesAccountWithAltDSID:DSID:username:", v3, v165, v5);
  if (v47)
  {
    v48 = [[SSAccount alloc] initWithBackingAccount:v47];
    if (v48)
    {
      v49 = v48;
      uint64_t v50 = [v6[244] sharedAccountsAuthenticationConfig];
      if (!v50)
      {
        uint64_t v50 = [v6[244] sharedConfig];
      }
      int v51 = [v50 shouldLog];
      if ([v50 shouldLogToDisk]) {
        v51 |= 2u;
      }
      uint64_t v52 = [v50 OSLogObject];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        int v53 = v51;
      }
      else {
        int v53 = v51 & 2;
      }
      if (v53)
      {
        uint64_t v54 = objc_opt_class();
        id v55 = v54;
        [(SSAccount *)v49 hashedDescription];
        v57 = v56 = v3;
        int v168 = 138543874;
        uint64_t v169 = (uint64_t)v54;
        __int16 v170 = 2114;
        v171 = v166;
        __int16 v172 = 2114;
        v173 = v57;
        LODWORD(v162) = 32;
        v158 = &v168;
        BOOL v58 = (void *)_os_log_send_and_compose_impl();

        xpc_object_t v3 = v56;
        id v46 = v165;

        v59 = v163;
        if (!v58)
        {
LABEL_58:

          goto LABEL_62;
        }
        uint64_t v52 = objc_msgSend(NSString, "stringWithCString:encoding:", v58, 4, &v168, v162);
        free(v58);
        SSFileLog(v50, @"%@", v60, v61, v62, v63, v64, v65, (uint64_t)v52);
      }
      else
      {
        v59 = v163;
      }

      goto LABEL_58;
    }
  }
  v59 = v163;
  if (![v167 length])
  {
LABEL_120:
    v142 = objc_msgSend(v6[244], "sharedAccountsAuthenticationConfig", v158);
    if (!v142)
    {
      v142 = [v6[244] sharedConfig];
    }
    int v143 = [v142 shouldLog];
    if ([v142 shouldLogToDisk]) {
      v143 |= 2u;
    }
    v144 = [v142 OSLogObject];
    if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT)) {
      int v145 = v143;
    }
    else {
      int v145 = v143 & 2;
    }
    if (v145)
    {
      v146 = objc_opt_class();
      int v168 = 138543618;
      uint64_t v169 = (uint64_t)v146;
      __int16 v170 = 2114;
      v171 = v166;
      id v147 = v146;
      LODWORD(v162) = 22;
      v148 = (void *)_os_log_send_and_compose_impl();

      if (!v148)
      {
LABEL_131:
        v49 = 0;
        goto LABEL_132;
      }
      v144 = objc_msgSend(NSString, "stringWithCString:encoding:", v148, 4, &v168, v162);
      free(v148);
      SSFileLog(v142, @"%@", v149, v150, v151, v152, v153, v154, (uint64_t)v144);
    }

    goto LABEL_131;
  }
  v66 = [v6[244] sharedAccountsAuthenticationConfig];
  if (!v66)
  {
    v66 = [v6[244] sharedConfig];
  }
  int v67 = [v66 shouldLog];
  if ([v66 shouldLogToDisk]) {
    v67 |= 2u;
  }
  uint64_t v68 = [v66 OSLogObject];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT)) {
    int v69 = v67;
  }
  else {
    int v69 = v67 & 2;
  }
  if (v69)
  {
    uint64_t v70 = objc_opt_class();
    id v71 = v70;
    SSHashIfNeeded(v167);
    v73 = uint64_t v72 = v3;
    int v168 = 138543874;
    uint64_t v169 = (uint64_t)v70;
    __int16 v170 = 2114;
    v171 = v166;
    __int16 v172 = 2114;
    v173 = v73;
    LODWORD(v162) = 32;
    v158 = &v168;
    id v74 = (void *)_os_log_send_and_compose_impl();

    xpc_object_t v3 = v72;
    id v46 = v165;
    v59 = v163;

    uint64_t v75 = v164;
    if (!v74) {
      goto LABEL_61;
    }
    uint64_t v68 = objc_msgSend(NSString, "stringWithCString:encoding:", v74, 4, &v168, v162);
    free(v74);
    SSFileLog(v66, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v68);
  }
  else
  {
    uint64_t v75 = v164;
  }

LABEL_61:
  v49 = objc_alloc_init(SSAccount);
  [(SSAccount *)v49 setAccountName:v167];
  [(SSAccount *)v49 setAccountScope:v75];
  id v6 = &off_1E5BA6000;
  if (!v49) {
    goto LABEL_120;
  }
LABEL_62:
  uint64_t v82 = [(SSAccount *)v49 altDSID];
  if (![v82 length])
  {
    uint64_t v83 = [v59 altDSID];

    uint64_t v84 = v167;
    if (!v83) {
      goto LABEL_77;
    }
    uint64_t v85 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v85)
    {
      uint64_t v85 = +[SSLogConfig sharedConfig];
    }
    int v86 = [v85 shouldLog];
    if ([v85 shouldLogToDisk]) {
      v86 |= 2u;
    }
    uint64_t v87 = [v85 OSLogObject];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO)) {
      int v88 = v86;
    }
    else {
      int v88 = v86 & 2;
    }
    if (v88)
    {
      v89 = objc_opt_class();
      int v168 = 138543618;
      uint64_t v169 = (uint64_t)v89;
      __int16 v170 = 2114;
      v171 = v166;
      id v90 = v89;
      LODWORD(v162) = 22;
      v159 = &v168;
      v91 = (void *)_os_log_send_and_compose_impl();

      if (!v91)
      {
LABEL_75:

        uint64_t v82 = [v59 altDSID];
        [(SSAccount *)v49 setAltDSID:v82];
        goto LABEL_76;
      }
      uint64_t v87 = objc_msgSend(NSString, "stringWithCString:encoding:", v91, 4, &v168, v162);
      free(v91);
      SSFileLog(v85, @"%@", v92, v93, v94, v95, v96, v97, (uint64_t)v87);
    }

    goto LABEL_75;
  }
LABEL_76:
  uint64_t v84 = v167;

LABEL_77:
  uint64_t v98 = [(SSAccount *)v49 uniqueIdentifier];
  if (!v98)
  {
    uint64_t v99 = [v59 requiredUniqueIdentifier];

    if (!v99) {
      goto LABEL_92;
    }
    uint64_t v100 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v100)
    {
      uint64_t v100 = +[SSLogConfig sharedConfig];
    }
    int v101 = [v100 shouldLog];
    if ([v100 shouldLogToDisk]) {
      v101 |= 2u;
    }
    uint64_t v102 = [v100 OSLogObject];
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO)) {
      int v103 = v101;
    }
    else {
      int v103 = v101 & 2;
    }
    if (v103)
    {
      v104 = objc_opt_class();
      int v168 = 138543618;
      uint64_t v169 = (uint64_t)v104;
      __int16 v170 = 2114;
      v171 = v166;
      id v105 = v104;
      LODWORD(v162) = 22;
      v160 = &v168;
      v106 = (void *)_os_log_send_and_compose_impl();

      if (!v106)
      {
LABEL_90:

        uint64_t v98 = [v59 requiredUniqueIdentifier];
        [(SSAccount *)v49 setUniqueIdentifier:v98];
        uint64_t v84 = v167;
        goto LABEL_91;
      }
      uint64_t v102 = objc_msgSend(NSString, "stringWithCString:encoding:", v106, 4, &v168, v162);
      free(v106);
      SSFileLog(v100, @"%@", v107, v108, v109, v110, v111, v112, (uint64_t)v102);
    }

    goto LABEL_90;
  }
LABEL_91:

LABEL_92:
  if (objc_msgSend(v84, "length", v160)) {
    [(SSAccount *)v49 setAccountName:v84];
  }
  v113 = [v59 password];

  if (v113)
  {
    v114 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v114)
    {
      v114 = +[SSLogConfig sharedConfig];
    }
    int v115 = [v114 shouldLog];
    if ([v114 shouldLogToDisk]) {
      v115 |= 2u;
    }
    v116 = [v114 OSLogObject];
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO)) {
      int v117 = v115;
    }
    else {
      int v117 = v115 & 2;
    }
    if (v117)
    {
      uint64_t v118 = objc_opt_class();
      int v168 = 138543618;
      uint64_t v169 = (uint64_t)v118;
      __int16 v170 = 2114;
      v171 = v166;
      id v119 = v118;
      LODWORD(v162) = 22;
      v161 = &v168;
      v120 = (void *)_os_log_send_and_compose_impl();

      if (!v120)
      {
LABEL_106:

        v127 = [v59 password];
        [(SSAccount *)v49 setRawPassword:v127];

        uint64_t v84 = v167;
        goto LABEL_107;
      }
      v116 = objc_msgSend(NSString, "stringWithCString:encoding:", v120, 4, &v168, v162);
      free(v120);
      SSFileLog(v114, @"%@", v121, v122, v123, v124, v125, v126, (uint64_t)v116);
    }

    goto LABEL_106;
  }
LABEL_107:
  id v128 = objc_msgSend(v59, "passwordEquivalentToken", v161);

  if (!v128) {
    goto LABEL_133;
  }
  char v129 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v129)
  {
    char v129 = +[SSLogConfig sharedConfig];
  }
  int v130 = [v129 shouldLog];
  if ([v129 shouldLogToDisk]) {
    v130 |= 2u;
  }
  v131 = [v129 OSLogObject];
  if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO)) {
    int v132 = v130;
  }
  else {
    int v132 = v130 & 2;
  }
  if (!v132) {
    goto LABEL_118;
  }
  id v133 = objc_opt_class();
  int v168 = 138543618;
  uint64_t v169 = (uint64_t)v133;
  __int16 v170 = 2114;
  v171 = v166;
  id v134 = v133;
  LODWORD(v162) = 22;
  __int16 v135 = (void *)_os_log_send_and_compose_impl();

  if (v135)
  {
    v131 = objc_msgSend(NSString, "stringWithCString:encoding:", v135, 4, &v168, v162);
    free(v135);
    SSFileLog(v129, @"%@", v136, v137, v138, v139, v140, v141, (uint64_t)v131);
LABEL_118:
  }
  v142 = [v59 passwordEquivalentToken];
  [(SSAccount *)v49 setPasswordEquivalentToken:v142];
LABEL_132:

  uint64_t v84 = v167;
LABEL_133:

  return v49;
}

- (void)_handleDialogFromError:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F4DA00];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4DA00]];
  if (v6)
  {
    id v7 = (void *)v6;
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    id v9 = [v8 userInfo];

    id v7 = [v9 objectForKeyedSubscript:v5];
    uint64_t v4 = v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v63 = 0;
    int v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v63];
    id v11 = v63;

    if (!v11)
    {
LABEL_18:

      id v7 = v10;
      goto LABEL_19;
    }
    objc_super v12 = +[SSLogConfig sharedAccountsConfig];
    if (!v12)
    {
      objc_super v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    uint64_t v60 = self;
    if (v14)
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v16;
      uint64_t v18 = [(SSAuthenticateRequest *)self logUUID];
      int v64 = 138543874;
      uint64_t v65 = v16;
      __int16 v66 = 2114;
      int v67 = v18;
      __int16 v68 = 2114;
      id v69 = v11;
      LODWORD(v59) = 32;
      BOOL v58 = &v64;
      uint64_t v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_17:

        int v10 = 0;
        self = v60;
        goto LABEL_18;
      }
      v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v64, v59);
      free(v19);
      SSFileLog(v12, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
    }

    goto LABEL_17;
  }
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v41 = +[SSLogConfig sharedAccountsConfig];
    if (!v41)
    {
      uint64_t v41 = +[SSLogConfig sharedConfig];
    }
    int v44 = objc_msgSend(v41, "shouldLog", v58);
    if ([v41 shouldLogToDisk]) {
      int v45 = v44 | 2;
    }
    else {
      int v45 = v44;
    }
    id v46 = [v41 OSLogObject];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      int v47 = v45;
    }
    else {
      int v47 = v45 & 2;
    }
    if (v47)
    {
      v48 = objc_opt_class();
      id v49 = v48;
      uint64_t v50 = [(SSAuthenticateRequest *)self logUUID];
      int v64 = 138543874;
      uint64_t v65 = v48;
      __int16 v66 = 2114;
      int v67 = v50;
      __int16 v68 = 2112;
      id v69 = v7;
      LODWORD(v59) = 32;
      int v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51) {
        goto LABEL_46;
      }
      id v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v64, v59);
      free(v51);
      SSFileLog(v41, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v46);
    }

    goto LABEL_46;
  }
  if (v7)
  {
    int v26 = +[SSLogConfig sharedAccountsConfig];
    if (!v26)
    {
      int v26 = +[SSLogConfig sharedConfig];
    }
    int v27 = objc_msgSend(v26, "shouldLog", v58);
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    int v29 = [v26 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      int v30 = v28;
    }
    else {
      int v30 = v28 & 2;
    }
    if (v30)
    {
      int v31 = objc_opt_class();
      id v32 = v31;
      id v33 = [(SSAuthenticateRequest *)self logUUID];
      int v64 = 138543874;
      uint64_t v65 = v31;
      __int16 v66 = 2114;
      int v67 = v33;
      __int16 v68 = 2112;
      id v69 = v7;
      LODWORD(v59) = 32;
      v34 = (void *)_os_log_send_and_compose_impl();

      if (!v34)
      {
LABEL_33:

        uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F4DE30]) initWithRequest:v7];
        uint64_t v42 = [v41 present];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __48__SSAuthenticateRequest__handleDialogFromError___block_invoke;
        v61[3] = &unk_1E5BA9508;
        v61[4] = self;
        id v62 = v7;
        id v43 = v7;
        [v42 addFinishBlock:v61];

LABEL_46:
        goto LABEL_47;
      }
      int v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v64, v59);
      free(v34);
      SSFileLog(v26, @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v29);
    }

    goto LABEL_33;
  }
LABEL_47:
}

void __48__SSAuthenticateRequest__handleDialogFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    int v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      objc_super v12 = *(void **)(a1 + 32);
      id v13 = v11;
      int v14 = [v12 logUUID];
      uint64_t v15 = *(void *)(a1 + 40);
      int v26 = 138544130;
      int v27 = v11;
      __int16 v28 = 2114;
      int v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v15;
      __int16 v32 = 2114;
      id v33 = v6;
      LODWORD(v25) = 42;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v26, v25);
      free(v16);
      SSFileLog(v7, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F4DCD8]) initWithRequest:*(void *)(a1 + 40) result:v5 error:v6 bag:0];
  id v24 = (id)[v23 perform];
}

- (void)_performRemoteAuthenticationWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    int v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      uint64_t v22 = "-[SSAuthenticateRequest _performRemoteAuthenticationWithCompletion:]";
      LODWORD(v18) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke;
  v19[3] = &unk_1E5BA9530;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:133 messageBlock:v19];
}

void __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    int v10 = SSError(@"SSErrorDomain", 121, 0, 0);
    uint64_t v12 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v12)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v24 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    int v26 = [v12 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v25 &= 2u;
    }
    if (v25)
    {
      int v65 = 138543362;
      id v66 = (id)objc_opt_class();
      id v27 = v66;
      LODWORD(v56) = 12;
      uint64_t v55 = &v65;
      __int16 v28 = (void *)_os_log_send_and_compose_impl();

      if (!v28)
      {
LABEL_25:
        int v7 = 0;
        goto LABEL_39;
      }
      int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v65, v56);
      free(v28);
      SSFileLog(v12, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v26);
    }

    goto LABEL_25;
  }
  id v4 = +[SSAccountStore defaultStore];
  [v4 clearCachedAccounts];

  id v5 = [SSAuthenticateResponse alloc];
  int v6 = xpc_dictionary_get_value(v3, "1");
  int v7 = [(SSAuthenticateResponse *)v5 initWithXPCEncoding:v6];

  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v9 = xpc_dictionary_get_value(v3, "2");
  int v10 = (void *)[v8 initWithXPCEncoding:v9];

  uint64_t v11 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    uint64_t v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      v14 &= 2u;
    }
    if (v14)
    {
      int v65 = 138543618;
      id v66 = (id)objc_opt_class();
      __int16 v67 = 2112;
      __int16 v68 = v10;
      id v16 = v66;
      LODWORD(v56) = 22;
      uint64_t v55 = &v65;
      id v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17) {
        goto LABEL_39;
      }
      uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v65, v56);
      free(v17);
      SSFileLog(v12, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
    }
  }
  else
  {
    if (!v11)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v35 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v36 = v35 | 2;
    }
    else {
      int v36 = v35;
    }
    uint64_t v37 = [v12 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
      int v38 = v36;
    }
    else {
      int v38 = v36 & 2;
    }
    if (v38)
    {
      uint64_t v39 = objc_opt_class();
      uint64_t v59 = a1;
      uint64_t v40 = *(void **)(a1 + 32);
      id v60 = v39;
      uint64_t v41 = [v40 logUUID];
      BOOL v58 = [(SSAuthenticateResponse *)v7 authenticatedAccount];
      uint64_t v57 = [v58 accountName];
      uint64_t v42 = SSHashIfNeeded(v57);
      uint64_t v43 = [(SSAuthenticateResponse *)v7 authenticateResponseType];
      int v44 = [(SSAuthenticateResponse *)v7 error];
      int v65 = 138544386;
      id v66 = v39;
      __int16 v67 = 2114;
      __int16 v68 = v41;
      __int16 v69 = 2114;
      uint64_t v70 = v42;
      __int16 v71 = 2048;
      uint64_t v72 = v43;
      __int16 v73 = 2112;
      id v74 = v44;
      LODWORD(v56) = 52;
      uint64_t v55 = &v65;
      int v45 = (void *)_os_log_send_and_compose_impl();

      if (v45)
      {
        id v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v65, v56);
        free(v45);
        SSFileLog(v12, @"%@", v47, v48, v49, v50, v51, v52, (uint64_t)v46);
      }
      int v10 = 0;
      a1 = v59;
    }
    else
    {

      int v10 = 0;
    }
  }
LABEL_39:

  uint64_t v53 = *(void **)(a1 + 40);
  if (v53)
  {
    uint64_t v54 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke_72;
    block[3] = &unk_1E5BA6EB8;
    id v64 = v53;
    id v62 = v7;
    id v63 = v10;
    dispatch_async(v54, block);
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v55);
}

uint64_t __68__SSAuthenticateRequest__performRemoteAuthenticationWithCompletion___block_invoke_72(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)_responseTypeForError:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  if (v5 == 5001)
  {
    int v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v6)
    {
      int v6 = +[SSLogConfig sharedConfig];
    }
    int v20 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    uint64_t v22 = [v6 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v23 = objc_opt_class();
      id v24 = v23;
      [(SSAuthenticateRequest *)self logUUID];
      int v57 = 138543618;
      BOOL v58 = v23;
      __int16 v59 = 2114;
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 22;
      int v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_27:
        int64_t v19 = 3;
        goto LABEL_51;
      }
      uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v57, v56);
      free(v25);
      SSFileLog(v6, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v22);
    }

    goto LABEL_27;
  }
  if (v5 == -5000)
  {
    int v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v6)
    {
      int v6 = +[SSLogConfig sharedConfig];
    }
    int v32 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    uint64_t v34 = [v6 OSLogObject];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      v33 &= 2u;
    }
    if (v33)
    {
      int v35 = objc_opt_class();
      id v36 = v35;
      [(SSAuthenticateRequest *)self logUUID];
      int v57 = 138543618;
      BOOL v58 = v35;
      __int16 v59 = 2114;
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v56) = 22;
      uint64_t v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_39:
        int64_t v19 = 1;
        goto LABEL_51;
      }
      uint64_t v34 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v57, v56);
      free(v37);
      SSFileLog(v6, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v34);
    }

    goto LABEL_39;
  }
  if (v5 != -7003)
  {
    int v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v6)
    {
      int v6 = +[SSLogConfig sharedConfig];
    }
    int v44 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v45 = v44 | 2;
    }
    else {
      int v45 = v44;
    }
    id v46 = [v6 OSLogObject];
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      v45 &= 2u;
    }
    if (v45)
    {
      uint64_t v47 = objc_opt_class();
      id v48 = v47;
      [(SSAuthenticateRequest *)self logUUID];
      int v57 = 138543874;
      BOOL v58 = v47;
      __int16 v59 = 2114;
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v61 = 2112;
      id v62 = v4;
      LODWORD(v56) = 32;
      int64_t v19 = _os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_51;
      }
      id v46 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v57, v56);
      free((void *)v19);
      SSFileLog(v6, @"%@", v49, v50, v51, v52, v53, v54, (uint64_t)v46);
    }

    int64_t v19 = 0;
    goto LABEL_51;
  }
  int v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v6)
  {
    int v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
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
    goto LABEL_14;
  }
  int v10 = objc_opt_class();
  id v11 = v10;
  [(SSAuthenticateRequest *)self logUUID];
  int v57 = 138543618;
  BOOL v58 = v10;
  __int16 v59 = 2114;
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = 22;
  uint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v57, v56);
    free(v12);
    SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
LABEL_14:
  }
  int64_t v19 = 2;
LABEL_51:

  return v19;
}

- (BOOL)_shouldRunAuthenticationForAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  int64_t v5 = [(SSAuthenticationContext *)self->_authenticationContext promptStyle];
  if (v5 == 1) {
    goto LABEL_7;
  }
  if (v5 == 1001)
  {
LABEL_8:
    int v6 = [v4 isAuthenticated] ^ 1;
    goto LABEL_9;
  }
  if (v5 != 1000)
  {
    if (+[SSAccountStore isExpiredForTokenType:[(SSAuthenticationContext *)self->_authenticationContext tokenType]])
    {
LABEL_7:
      LOBYTE(v6) = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  LOBYTE(v6) = 0;
LABEL_9:

  return v6;
}

- (id)_verifyCredentialsOptionsFromUpdateAccountResponse:(id)a3 skipAuthKit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(SSAuthenticateRequest *)self authenticationContext];
  int v8 = [v7 accountStoreOptions];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F17A48]];
  int v10 = NSNumber;
  uint64_t v11 = [v6 credentialSource];

  uint64_t v12 = [v10 numberWithUnsignedInteger:v11];
  [v9 setObject:v12 forKeyedSubscript:@"SSAccountStoreAuthKitCredentialSource"];

  uint64_t v13 = [NSNumber numberWithBool:v4];
  [v9 setObject:v13 forKeyedSubscript:@"SSAccountStoreAuthKitSkipAuthKitKey"];

  uint64_t v14 = [(SSAuthenticateRequest *)self logUUID];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = [(SSAuthenticateRequest *)self logUUID];
    [v9 setObject:v16 forKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  }
  return v9;
}

- (SSLogConfig)logConfig
{
  return self->_logConfig;
}

- (void)setLogConfig:(id)a3
{
}

- (UIViewController)_parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)set_parentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentViewController);
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end