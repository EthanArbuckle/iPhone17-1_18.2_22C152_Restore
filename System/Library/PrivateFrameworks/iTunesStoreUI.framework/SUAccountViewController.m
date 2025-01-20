@interface SUAccountViewController
+ (id)_latestAccountViewController;
- (ACAccount)account;
- (BOOL)_shouldUseWebViewFastPath;
- (BOOL)shouldSignRequests;
- (BOOL)showAccountGlyph;
- (SUAccountViewController)init;
- (SUAccountViewController)initWithExternalAccountURL:(id)a3;
- (SUMescalSession)_mescalSession;
- (UIBarButtonItem)logoutButton;
- (id)_URLByRemovingBlacklistedParametersWithURL:(id)a3;
- (id)_authenticationQueryParametersForStyle:(int64_t)a3;
- (id)_bagKeyForStyle:(int64_t)a3;
- (id)copyArchivableContext;
- (id)navigationItem:(id)a3 willChangeLeftItem:(id)a4 toNewItem:(id)a5;
- (id)navigationItem:(id)a3 willChangeLeftItems:(id)a4 toNewItems:(id)a5;
- (id)newFetchOperation;
- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5;
- (int64_t)style;
- (void)_closeMescalSession;
- (void)_didEnterBackground:(id)a3;
- (void)_forceOrientationBackToSupportedOrientation;
- (void)_logoutPressed:(id)a3;
- (void)_mescalDidOpenWithSession:(id)a3 error:(id)a4;
- (void)enqueueFetchOperation;
- (void)handleFailureWithError:(id)a3;
- (void)setAccount:(id)a3;
- (void)setLogoutButton:(id)a3;
- (void)setShowAccountGlyph:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUAccountViewController

- (SUAccountViewController)init
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SUAccountViewController;
  v2 = [(SUStorePageViewController *)&v15 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
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
    if (v5)
    {
      v7 = objc_opt_class();
      int v16 = 138543362;
      v17 = v7;
      id v8 = v7;
      LODWORD(v14) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_11:

        v10 = [(SUStorePageViewController *)v2 URLRequestProperties];
        v11 = (void *)[v10 mutableCopy];

        v12 = [(SUAccountViewController *)v2 _bagKeyForStyle:v2->_style];
        [v11 setURLBagKey:v12];

        [(SUStorePageViewController *)v2 setURLRequestProperties:v11];
        return v2;
      }
      v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v16, v14);
      free(v9);
      SSFileLog();
    }

    goto LABEL_11;
  }
  return v2;
}

- (SUAccountViewController)initWithExternalAccountURL:(id)a3
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v103 = a3;
  v108.receiver = self;
  v108.super_class = (Class)SUAccountViewController;
  int v4 = [(SUStorePageViewController *)&v108 init];
  if (v4)
  {
    int v5 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      v6 |= 2u;
    }
    v7 = [v5 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      id v8 = objc_opt_class();
      *(_DWORD *)v115 = 138543618;
      *(void *)&v115[4] = v8;
      *(_WORD *)&v115[12] = 2112;
      *(void *)&v115[14] = v103;
      id v9 = v8;
      LODWORD(v98) = 22;
      v95 = v115;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10) {
        goto LABEL_10;
      }
      v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v115, v98);
      free(v10);
      v95 = v7;
      SSFileLog();
    }

LABEL_10:
    v102 = (void *)[v103 copyQueryStringDictionaryWithUnescapedValues:1];
    v11 = [v102 objectForKey:@"url"];
    if (v11)
    {
      uint64_t v12 = [NSURL URLWithString:v11];
      accountURL = v4->_accountURL;
      v4->_accountURL = (NSURL *)v12;
    }
    else
    {
      uint64_t v14 = [v103 host];
      BOOL v15 = [v14 length] == 0;

      if (v15) {
        goto LABEL_15;
      }
      int v16 = (NSURL *)v103;
      accountURL = v4->_accountURL;
      v4->_accountURL = v16;
    }

LABEL_15:
    uint64_t v17 = -[SUAccountViewController _URLByRemovingBlacklistedParametersWithURL:](v4, "_URLByRemovingBlacklistedParametersWithURL:", v4->_accountURL, v95);
    uint64_t v18 = v4->_accountURL;
    v4->_accountURL = (NSURL *)v17;

    v19 = [v102 objectForKey:@"continuation"];

    if (v19) {
      v99 = (void *)[NSURL copyDictionaryForQueryString:v19 unescapedValues:1];
    }
    else {
      v99 = 0;
    }
    v100 = (void *)[(NSURL *)v4->_accountURL copyQueryStringDictionaryWithUnescapedValues:0];
    *(void *)v115 = 0;
    *(void *)&v115[8] = v115;
    *(void *)&v115[16] = 0x3032000000;
    v116 = __Block_byref_object_copy__2;
    v117 = __Block_byref_object_dispose__2;
    id v118 = 0;
    v20 = [v100 objectForKeyedSubscript:@"tidContinueToken"];

    if (!v20)
    {
      v45 = [v102 objectForKeyedSubscript:@"signatureResumption"];
      if ((objc_opt_respondsToSelector() & 1) == 0 || ![v45 BOOLValue])
      {
LABEL_47:
        id v52 = objc_alloc(MEMORY[0x263F7B290]);
        v53 = [(NSURL *)v4->_accountURL schemeSwizzledURL];
        v54 = (void *)[v52 initWithURL:v53];

        [v54 setRequestParameters:v99];
        if (*(void *)(*(void *)&v115[8] + 40))
        {
          v55 = [v54 HTTPHeaders];
          id v56 = (id)[v55 mutableCopy];

          if (!v56) {
            id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          objc_msgSend(v56, "addEntriesFromDictionary:", *(void *)(*(void *)&v115[8] + 40), v96);
          [v54 setHTTPHeaders:v56];
        }
        -[SUStorePageViewController setURLRequestProperties:](v4, "setURLRequestProperties:", v54, v96);
        uint64_t v57 = [*(id *)(*(void *)&v115[8] + 40) copy];
        tidHeaders = v4->_tidHeaders;
        v4->_tidHeaders = (NSDictionary *)v57;

        v59 = [v102 objectForKey:@"dsid"];

        if (v59
          && (SSAccountGetUniqueIdentifierFromValue(),
              v60 = objc_claimAutoreleasedReturnValue(),
              (v101 = v60) != 0))
        {
          if ([v60 unsignedLongLongValue])
          {
            v61 = [(SUStorePageViewController *)v4 authenticationContext];
            v62 = (void *)[v61 mutableCopy];

            if (v62) {
              [v62 setRequiredUniqueIdentifier:v101];
            }
            else {
              v62 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccountIdentifier:v101];
            }
            [(SUStorePageViewController *)v4 setAuthenticationContext:v62];
            int v63 = 0;
            goto LABEL_68;
          }
          int v63 = 0;
        }
        else
        {
          v101 = 0;
          int v63 = 1;
        }
        v62 = [MEMORY[0x263F7B1F8] sharedConfig];
        int v64 = [v62 shouldLog];
        int v65 = [v62 shouldLogToDisk];
        v66 = [v62 OSLogObject];
        v67 = v66;
        if (v65) {
          v64 |= 2u;
        }
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT)) {
          v64 &= 2u;
        }
        if (v64)
        {
          v68 = objc_opt_class();
          int v109 = 138543362;
          id v110 = v68;
          id v69 = v68;
          LODWORD(v98) = 12;
          v97 = &v109;
          v70 = (void *)_os_log_send_and_compose_impl();

          if (!v70) {
            goto LABEL_68;
          }
          v67 = objc_msgSend(NSString, "stringWithCString:encoding:", v70, 4, &v109, v98);
          free(v70);
          v97 = (int *)v67;
          SSFileLog();
        }

LABEL_68:
        [(SUStorePageViewController *)v4 setExternalRequest:1];
        if (v4->_accountURL) {
          int v71 = 0;
        }
        else {
          int v71 = v63;
        }
        if (v71 == 1)
        {
          v72 = [MEMORY[0x263F7B0E8] defaultStore];
          v73 = [v72 activeAccount];
          BOOL v74 = v73 == 0;

          if (v74) {
            uint64_t v75 = 1;
          }
          else {
            uint64_t v75 = 2;
          }
        }
        else
        {
          uint64_t v75 = 2 * (v4->_accountURL == 0);
        }
        -[SUAccountViewController setStyle:](v4, "setStyle:", v75, v97);
        if (v4->_accountURL)
        {
          v76 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v77 = [v76 shouldLog];
          int v78 = [v76 shouldLogToDisk];
          v79 = v59;
          v80 = [v76 OSLogObject];
          v81 = v80;
          if (v78) {
            v77 |= 2u;
          }
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
            int v82 = v77;
          }
          else {
            int v82 = v77 & 2;
          }
          if (!v82) {
            goto LABEL_92;
          }
          id v83 = (id)objc_opt_class();
          v84 = v4->_accountURL;
          v85 = [(SUStorePageViewController *)v4 authenticationContext];
          v86 = [v85 requiredUniqueIdentifier];
          int v109 = 138543874;
          id v110 = v83;
          __int16 v111 = 2112;
          v112 = v84;
          __int16 v113 = 2112;
          v114 = v86;
          LODWORD(v98) = 32;
          v87 = (void *)_os_log_send_and_compose_impl();

          v59 = v79;
          if (v87)
          {
            v81 = objc_msgSend(NSString, "stringWithCString:encoding:", v87, 4, &v109, v98);
            free(v87);
            SSFileLog();
LABEL_92:
          }
        }
        else
        {
          v76 = [MEMORY[0x263F7B1F8] sharedConfig];
          int v88 = [v76 shouldLog];
          int v89 = [v76 shouldLogToDisk];
          v90 = [v76 OSLogObject];
          v81 = v90;
          if (v89) {
            v88 |= 2u;
          }
          if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
            v88 &= 2u;
          }
          if (!v88) {
            goto LABEL_92;
          }
          v91 = objc_opt_class();
          int v109 = 138543362;
          id v110 = v91;
          id v92 = v91;
          LODWORD(v98) = 12;
          v93 = (void *)_os_log_send_and_compose_impl();

          if (v93)
          {
            v81 = objc_msgSend(NSString, "stringWithCString:encoding:", v93, 4, &v109, v98);
            free(v93);
            SSFileLog();
            goto LABEL_92;
          }
        }

        _Block_object_dispose(v115, 8);
        goto LABEL_94;
      }
      uint64_t v46 = [MEMORY[0x263F27C90] resumptionHeaders];
      v21 = *(NSURL **)(*(void *)&v115[8] + 40);
      *(void *)(*(void *)&v115[8] + 40) = v46;
LABEL_46:

      goto LABEL_47;
    }
    v21 = v20;
    v22 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v23 = [v22 shouldLog];
    int v24 = [v22 shouldLogToDisk];
    v25 = [v22 OSLogObject];
    v26 = v25;
    if (v24) {
      v23 |= 2u;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      v27 = objc_opt_class();
      int v109 = 138543618;
      id v110 = v27;
      __int16 v111 = 2114;
      v112 = v21;
      id v28 = v27;
      LODWORD(v98) = 22;
      v96 = &v109;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (!v29) {
        goto LABEL_27;
      }
      v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v109, v98);
      free(v29);
      v96 = (int *)v26;
      SSFileLog();
    }

LABEL_27:
    v30 = [MEMORY[0x263F7B0E8] defaultStore];
    v31 = [v30 activeAccount];
    v32 = [v31 uniqueIdentifier];

    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    id v34 = objc_alloc_init(MEMORY[0x263F7B138]);
    v104[0] = MEMORY[0x263EF8330];
    v104[1] = 3221225472;
    v104[2] = __54__SUAccountViewController_initWithExternalAccountURL___block_invoke;
    v104[3] = &unk_264812C48;
    v105 = v4;
    v107 = v115;
    v35 = v33;
    v106 = v35;
    [v34 getAllCachedBiometricHTTPHeadersWithToken:v21 accountID:v32 evict:1 completionBlock:v104];
    dispatch_time_t v36 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v35, v36))
    {
      v47 = [*(id *)(*(void *)&v115[8] + 40) objectForKeyedSubscript:*MEMORY[0x263F7B820]];
      BOOL v48 = v47 == 0;

      if (!v48)
      {
        v49 = [*(id *)(*(void *)&v115[8] + 40) objectForKeyedSubscript:*MEMORY[0x263F7B830]];
        BOOL v50 = v49 == 0;

        if (v50) {
          v51 = @"FB";
        }
        else {
          v51 = @"PK";
        }
        objc_msgSend(*(id *)(*(void *)&v115[8] + 40), "setObject:forKey:", v51, *MEMORY[0x263F7B810], v96);
      }
      goto LABEL_45;
    }
    v37 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v38 = [v37 shouldLog];
    int v39 = [v37 shouldLogToDisk];
    v40 = [v37 OSLogObject];
    v41 = v40;
    if (v39) {
      v38 |= 2u;
    }
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      v38 &= 2u;
    }
    if (v38)
    {
      v42 = objc_opt_class();
      int v109 = 138543618;
      id v110 = v42;
      __int16 v111 = 2114;
      v112 = v21;
      id v43 = v42;
      LODWORD(v98) = 22;
      v96 = &v109;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_36:

LABEL_45:
        v45 = v21;
        goto LABEL_46;
      }
      v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, &v109, v98);
      free(v44);
      v96 = (int *)v41;
      SSFileLog();
    }

    goto LABEL_36;
  }
LABEL_94:

  return v4;
}

void __54__SUAccountViewController_initWithExternalAccountURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_13;
  }
  v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_10;
  }
  *(_DWORD *)uint64_t v17 = 138543618;
  *(void *)&v17[4] = objc_opt_class();
  *(_WORD *)&v17[12] = 2114;
  *(void *)&v17[14] = v6;
  id v11 = *(id *)&v17[4];
  LODWORD(v16) = 22;
  uint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v17, v16, *(_OWORD *)v17, *(void *)&v17[16], v18);
    free(v12);
    SSFileLog();
LABEL_10:
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  int v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (v7)
  {
    *(_DWORD *)BOOL v15 = 138543618;
    *(void *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2048;
    *(void *)&v15[14] = a3;
    id v9 = *(id *)&v15[4];
    LODWORD(v14) = 22;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_10;
    }
    int v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
    free(v10);
    SSFileLog();
  }

LABEL_10:
  if (self->_style != a3)
  {
    self->_style = a3;
    id v11 = [(SUStorePageViewController *)self URLRequestProperties];
    uint64_t v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [(SUAccountViewController *)self _bagKeyForStyle:self->_style];
    [v12 setURLBagKey:v13];

    [(SUStorePageViewController *)self setURLRequestProperties:v12];
    [(SUStorePageViewController *)self _setUseWebViewFastPath:[(SUAccountViewController *)self _shouldUseWebViewFastPath]];
  }
}

- (id)copyArchivableContext
{
  return 0;
}

- (void)enqueueFetchOperation
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  int64_t mescalState = self->_mescalState;
  if (mescalState)
  {
    if (mescalState == 2)
    {
      v21.receiver = self;
      v21.super_class = (Class)SUAccountViewController;
      [(SUStorePageViewController *)&v21 enqueueFetchOperation];
    }
  }
  else
  {
    int v4 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    int v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v8 = *(id *)((char *)location + 4);
      LODWORD(v16) = 12;
      id v9 = (void *)_os_log_send_and_compose_impl();

      if (v9)
      {
        v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, location, v16);
        free(v9);
        SSFileLog();
      }
    }
    else
    {
    }
    id v11 = [(SUAccountViewController *)self newFetchOperation];
    uint64_t v12 = [SUSetupMescalSessionOperation alloc];
    uint64_t v13 = [v11 requestProperties];
    uint64_t v14 = [(SUSetupMescalSessionOperation *)v12 initWithURLRequestProperties:v13];

    objc_initWeak(location, v14);
    objc_initWeak(&from, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__SUAccountViewController_enqueueFetchOperation__block_invoke;
    v17[3] = &unk_264812C70;
    objc_copyWeak(&v18, location);
    objc_copyWeak(&v19, &from);
    [(SUSetupMescalSessionOperation *)v14 setCompletionBlock:v17];
    self->_int64_t mescalState = 1;
    BOOL v15 = [MEMORY[0x263F894E0] mainQueue];
    [v15 addOperation:v14];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __48__SUAccountViewController_enqueueFetchOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  int v6 = __48__SUAccountViewController_enqueueFetchOperation__block_invoke_2;
  int v7 = &unk_264812730;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v3 = WeakRetained;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], &v4);
  objc_msgSend(v3, "setCompletionBlock:", 0, v4, v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __48__SUAccountViewController_enqueueFetchOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) mescalSession];
  id v3 = [*(id *)(a1 + 32) error];
  [WeakRetained _mescalDidOpenWithSession:v2 error:v3];
}

- (void)handleFailureWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ISWeakLinkedStringConstantForString();
  int v6 = [v4 domain];
  char v7 = [v6 isEqualToString:v5];

  if ((v7 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SUAccountViewController;
    [(SUStorePageViewController *)&v8 handleFailureWithError:v4];
  }
}

- (id)newFetchOperation
{
  v14.receiver = self;
  v14.super_class = (Class)SUAccountViewController;
  id v3 = [(SUStorePageViewController *)&v14 newFetchOperation];
  id v4 = [(SUStorePageViewController *)self authenticationContext];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F7B288]);
    char v7 = [MEMORY[0x263F7B0E8] defaultStore];
    objc_super v8 = [v7 activeAccount];
    uint64_t v5 = (void *)[v6 initWithAccount:v8];
  }
  [v5 setPromptStyle:1];
  id v9 = [(SUAccountViewController *)self _authenticationQueryParametersForStyle:self->_style];
  [v5 setRequestParameters:v9];

  [v5 setShouldFollowAccountButtons:1];
  [v3 setAuthenticationContext:v5];
  v10 = [v3 requestProperties];
  id v11 = (void *)[v10 mutableCopy];

  if (self->_style == 2)
  {
    [v5 accountScope];
    [v11 setURLBagType:SSURLBagTypeForAccountScope()];
  }
  primingSignature = self->_primingSignature;
  if (primingSignature) {
    [v11 setValue:primingSignature forHTTPHeaderField:@"X-Apple-ActionSignature"];
  }
  [v3 setRequestProperties:v11];

  return v3;
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4 returningError:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!a4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || ![v8 didShowDialog]) {
      goto LABEL_19;
    }
    uint64_t v13 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    uint64_t v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v29 = 138543362;
      id v30 = (id)objc_opt_class();
      id v17 = v30;
      LODWORD(v26) = 12;
      id v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_18:

        id v10 = 0;
LABEL_29:
        id v9 = 0;
        goto LABEL_30;
      }
      uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v29, v26);
      free(v18);
      SSFileLog();
    }

    goto LABEL_18;
  }
  if (a4 != 1)
  {
LABEL_19:
    id v19 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v20 = [v19 shouldLog];
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      v21 &= 2u;
    }
    if (v21)
    {
      int v29 = 138543362;
      id v30 = (id)objc_opt_class();
      id v23 = v30;
      LODWORD(v26) = 12;
      int v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_28:

        ISError();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v29, v26);
      free(v24);
      SSFileLog();
    }

    goto LABEL_28;
  }
  v27.receiver = self;
  v27.super_class = (Class)SUAccountViewController;
  id v28 = 0;
  id v9 = [(SUStorePageViewController *)&v27 newViewControllerForPage:v8 ofType:1 returningError:&v28];
  id v10 = v28;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(SUAccountViewController *)self account];
    [v9 setAccount:v11];

    uint64_t v12 = [(SUStorePageViewController *)self authenticationContext];
    [v9 setAuthenticationContext:v12];

    [v9 _setMescalSession:self->_mescalSession];
    [v9 setStyle:1];
    if ([(SUAccountViewController *)self shouldSignRequests]) {
      [v9 setShouldSignRequests:1];
    }
    [v9 setTidHeaders:self->_tidHeaders];
  }
LABEL_30:
  if (a5) {
    *a5 = v10;
  }

  return v9;
}

- (BOOL)shouldSignRequests
{
  if ([(SUAccountViewController *)self style] == 1) {
    return 1;
  }
  if ([(SUAccountViewController *)self style]) {
    return 0;
  }
  id v4 = [MEMORY[0x263F89540] sharedCache];
  uint64_t v5 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v6 = [v4 URLBagForContext:v5];

  char v7 = [(SUAccountViewController *)self _bagKeyForStyle:1];
  id v8 = [v6 valueForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSURL URLWithString:v8];
    id v10 = [v9 path];

    id v11 = [(NSURL *)self->_accountURL schemeSwizzledURL];
    uint64_t v12 = [v11 path];

    if ([v12 length]) {
      char v3 = [v12 isEqualToString:v10];
    }
    else {
      char v3 = 0;
    }
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"SUAccountViewControllerDidDisappearNotification" object:self];

  v6.receiver = self;
  v6.super_class = (Class)SUAccountViewController;
  [(SUStorePageViewController *)&v6 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__didEnterBackground_ name:*MEMORY[0x263F1D050] object:0];

  [(SUAccountViewController *)self _forceOrientationBackToSupportedOrientation];
  if ([(SUAccountViewController *)self showAccountGlyph])
  {
    objc_super v6 = [(SUAccountViewController *)self logoutButton];

    if (!v6)
    {
      char v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"person.crop.circle"];
      id v8 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithImage:v7 style:2 target:self action:sel__logoutPressed_];
      [(SUAccountViewController *)self setLogoutButton:v8];

      id v9 = [(SUAccountViewController *)self logoutButton];
      [v9 setTag:424242];
    }
    id v10 = [(SUViewController *)self navigationItem];
    [v10 setDelegate:self];

    id v11 = [(SUViewController *)self navigationItem];
    uint64_t v12 = [(SUAccountViewController *)self logoutButton];
    [v11 setLeftBarButtonItem:v12];
  }
  v13.receiver = self;
  v13.super_class = (Class)SUAccountViewController;
  [(SUStorePageViewController *)&v13 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D050] object:0];

  v6.receiver = self;
  v6.super_class = (Class)SUAccountViewController;
  [(SUStorePageViewController *)&v6 viewWillDisappear:v3];
}

- (id)navigationItem:(id)a3 willChangeLeftItem:(id)a4 toNewItem:(id)a5
{
  id v7 = a4;
  if ([(SUAccountViewController *)self showAccountGlyph])
  {
    id v8 = [(SUAccountViewController *)self logoutButton];

    id v9 = 0;
    if (!a5 && v8 != v7)
    {
      id v9 = [(SUAccountViewController *)self logoutButton];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)navigationItem:(id)a3 willChangeLeftItems:(id)a4 toNewItems:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (![(SUAccountViewController *)self showAccountGlyph]) {
    goto LABEL_5;
  }
  id v9 = [(SUAccountViewController *)self logoutButton];
  if (([v7 containsObject:v9] & 1) == 0)
  {
    uint64_t v11 = [v8 count];

    if (!v11)
    {
      uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
      id v9 = [(SUAccountViewController *)self logoutButton];
      id v10 = [v12 arrayWithObject:v9];
      goto LABEL_7;
    }
LABEL_5:
    id v10 = 0;
    goto LABEL_8;
  }
  id v10 = 0;
LABEL_7:

LABEL_8:

  return v10;
}

+ (id)_latestAccountViewController
{
  return (id)[(id)__LatestAccountViewController object];
}

- (void)_closeMescalSession
{
  self->_mescalSession = 0;
  MEMORY[0x270F9A758]();
}

- (void)_logoutPressed:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  BOOL v5 = [v4 userInterfaceIdiom] == 1;

  objc_super v6 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:v5];
  id v7 = (void *)MEMORY[0x263F1C3F0];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_26DB8C5F8 table:0];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __42__SUAccountViewController__logoutPressed___block_invoke;
  v26[3] = &unk_264812C98;
  v26[4] = self;
  id v10 = v6;
  id v27 = v10;
  uint64_t v11 = [v7 actionWithTitle:v9 style:1 handler:v26];
  [v10 addAction:v11];

  uint64_t v12 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  objc_super v13 = objc_msgSend(v12, "ams_activeiTunesAccount");

  if (([(objc_class *)getAMSBiometricsClass() isAvailableForAccount:v13] & 1) == 0)
  {
    int v14 = (void *)MEMORY[0x263F1C3F0];
    int v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"PASSWORD_SETTINGS" value:&stru_26DB8C5F8 table:0];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__SUAccountViewController__logoutPressed___block_invoke_89;
    v23[3] = &unk_264812C98;
    id v24 = v13;
    v25 = self;
    id v17 = [v14 actionWithTitle:v16 style:0 handler:v23];
    [v10 addAction:v17];
  }
  id v18 = (void *)MEMORY[0x263F1C3F0];
  id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v20 = [v19 localizedStringForKey:@"SIGN_OUT_OF_STORE" value:&stru_26DB8C5F8 table:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __42__SUAccountViewController__logoutPressed___block_invoke_2;
  v22[3] = &unk_264812D10;
  v22[4] = self;
  int v21 = [v18 actionWithTitle:v20 style:2 handler:v22];
  [v10 addAction:v21];

  [(SUAccountViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __42__SUAccountViewController__logoutPressed___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  BOOL v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_9;
  }
  LODWORD(v10) = 138543362;
  *(void *)((char *)&v10 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v10 + 4);
  LODWORD(v9) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    BOOL v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v10, v9, v10);
    free(v7);
    SSFileLog();
LABEL_9:
  }
  return [*(id *)(a1 + 40) dismissAnimated:1];
}

void __42__SUAccountViewController__logoutPressed___block_invoke_89(uint64_t a1)
{
  id v5 = (id)[objc_alloc(getAMSUIPasswordSettingsViewControllerClass()) initWithAccount:*(void *)(a1 + 32)];
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v5];
  int v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    [v2 setModalPresentationStyle:3];
  }
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

void __42__SUAccountViewController__logoutPressed___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  int v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  [v3 setActive:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SUAccountViewController__logoutPressed___block_invoke_3;
  v5[3] = &unk_264812CE8;
  v5[4] = *(void *)(a1 + 32);
  [v4 saveAccount:v3 withCompletionHandler:v5];
}

void __42__SUAccountViewController__logoutPressed___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUAccountViewController__logoutPressed___block_invoke_4;
  block[3] = &unk_264812CC0;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__SUAccountViewController__logoutPressed___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 48))
  {
    int v3 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      v5 &= 2u;
    }
    if (v5)
    {
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v12 = 138543618;
      *(void *)&v12[4] = v7;
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v8;
      id v9 = v7;
      LODWORD(v11) = 22;
      long long v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        return;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v12, v11, *(_OWORD *)v12, *(void *)&v12[16]);
      free(v10);
      SSFileLog();
    }

    goto LABEL_14;
  }
  v2 = *(void **)(a1 + 32);

  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)_authenticationQueryParametersForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    int v5 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"true", @"createSession", @"viewAccount", @"why", 0, v3);
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (id)_bagKeyForStyle:(int64_t)a3
{
  uint64_t v3 = @"signup";
  if (a3 != 1) {
    uint64_t v3 = 0;
  }
  if (a3 == 2) {
    return @"modifyAccount";
  }
  else {
    return v3;
  }
}

- (void)_didEnterBackground:(id)a3
{
  if (![(SUStorePageViewController *)self didPageViewLoad])
  {
    [(UIViewController *)self dismissAnimated:0];
  }
}

- (void)_forceOrientationBackToSupportedOrientation
{
  id v7 = [MEMORY[0x263F1C408] sharedApplication];
  if ((unint64_t)([v7 statusBarOrientation] - 3) <= 1
    && ([(SUViewController *)self supportedInterfaceOrientations] & 0x18) == 0)
  {
    if (![(SUAccountViewController *)self isViewLoaded]
      || ([(SUAccountViewController *)self view],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 window],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      int v5 = [(SUAccountViewController *)self presentedViewController];
      id v6 = [v5 view];
      uint64_t v4 = [v6 window];

      if (!v4)
      {
        uint64_t v4 = [MEMORY[0x263F1CBC8] keyWindow];
      }
    }
    [v4 _setRotatableViewOrientation:1 duration:1 force:0.0];
  }
}

- (void)_mescalDidOpenWithSession:(id)a3 error:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  primingSignature = self->_primingSignature;
  self->_primingSignature = 0;

  mescalSession = self->_mescalSession;
  self->_mescalSession = 0;

  uint64_t v11 = (void *)__LatestAccountViewController;
  __LatestAccountViewController = 0;

  if (!v8)
  {
    id v12 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v19 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    int v21 = [v12 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (!v7)
    {
      if (v20)
      {
        int v35 = 138543362;
        id v36 = (id)objc_opt_class();
        id v30 = v36;
        LODWORD(v33) = 12;
        uint64_t v31 = (void *)_os_log_send_and_compose_impl();

        if (v31)
        {
          v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v35, v33);
          free(v31);
          SSFileLog();
        }
      }
      else
      {
      }
      goto LABEL_28;
    }
    if (v20)
    {
      int v35 = 138543362;
      id v36 = (id)objc_opt_class();
      id v34 = v7;
      id v22 = v36;
      LODWORD(v33) = 12;
      id v23 = (void *)_os_log_send_and_compose_impl();

      id v7 = v34;
      if (!v23) {
        goto LABEL_22;
      }
      int v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v35, v33);
      free(v23);
      SSFileLog();
    }

LABEL_22:
    objc_storeStrong((id *)&self->_mescalSession, a3);
    uint64_t v24 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    v25 = (void *)__LatestAccountViewController;
    __LatestAccountViewController = v24;

    uint64_t v26 = self->_mescalSession;
    id v27 = [MEMORY[0x263EFF8F8] data];
    id v12 = [(SUMescalSession *)v26 primeForAccountCreationWithData:v27 error:0];

    if ([v12 length])
    {
      id v12 = v12;
      [v12 bytes];
      [v12 length];
      id v28 = (NSString *)ISCopyEncodedBase64();
      int v29 = self->_primingSignature;
      self->_primingSignature = v28;
    }
    goto LABEL_28;
  }
  id v12 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  int v15 = [v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    int v16 = v14;
  }
  else {
    int v16 = v14 & 2;
  }
  if (!v16) {
    goto LABEL_11;
  }
  int v35 = 138543618;
  id v36 = (id)objc_opt_class();
  __int16 v37 = 2112;
  id v38 = v8;
  id v17 = v36;
  LODWORD(v33) = 22;
  id v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    int v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v35, v33);
    free(v18);
    SSFileLog();
LABEL_11:
  }
LABEL_28:

  self->_int64_t mescalState = 2;
  [(SUAccountViewController *)self enqueueFetchOperation];
}

- (BOOL)_shouldUseWebViewFastPath
{
  return self->_style != 2;
}

- (id)_URLByRemovingBlacklistedParametersWithURL:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFFA08];
    id v4 = a3;
    int v5 = [v3 setWithArray:&unk_26DBD7CB0];
    id v6 = (void *)[v4 copyQueryStringDictionaryWithUnescapedValues:0];
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    int v21 = __70__SUAccountViewController__URLByRemovingBlacklistedParametersWithURL___block_invoke;
    id v22 = &unk_264812D38;
    id v8 = v5;
    id v23 = v8;
    id v9 = v7;
    id v24 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:&v19];
    id v10 = objc_alloc(MEMORY[0x263F089D8]);
    uint64_t v11 = objc_msgSend(v4, "absoluteString", v19, v20, v21, v22);
    id v12 = (void *)[v10 initWithString:v11];

    int v13 = [v4 query];

    if (v13)
    {
      uint64_t v14 = [v12 rangeOfString:v13 options:4];
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v12, "deleteCharactersInRange:", v14, v15);
      }
    }
    if (([v12 hasSuffix:@"?"] & 1) == 0) {
      [v12 appendString:@"?"];
    }
    int v16 = [NSURL queryStringForDictionary:v9 escapedValues:0];
    if (v16) {
      [v12 appendString:v16];
    }
    id v17 = [NSURL URLWithString:v12];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __70__SUAccountViewController__URLByRemovingBlacklistedParametersWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (SUMescalSession)_mescalSession
{
  return self->_mescalSession;
}

- (int64_t)style
{
  return self->_style;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (UIBarButtonItem)logoutButton
{
  return self->_logoutButton;
}

- (void)setLogoutButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoutButton, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong((id *)&self->_primingSignature, 0);
  objc_storeStrong((id *)&self->_mescalSession, 0);

  objc_storeStrong((id *)&self->_accountURL, 0);
}

@end