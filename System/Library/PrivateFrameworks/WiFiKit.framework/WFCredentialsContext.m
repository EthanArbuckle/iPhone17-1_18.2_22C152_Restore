@interface WFCredentialsContext
- (BOOL)isEnterprise;
- (BOOL)isPasswordSharingSupported;
- (BOOL)needsDismissal;
- (BOOL)passwordReceivedFromPasswordSharing;
- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4;
- (BOOL)shouldReactivatePasswordSharing;
- (BOOL)validateCredentials;
- (BOOL)validatePassword;
- (NSArray)availableTLSIdentities;
- (NSString)username;
- (SFPasswordSharingService)passwordSharingService;
- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4;
- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4 authTraits:(int64_t)a5;
- (WFHealthIssue)securityIssue;
- (WFNetworkProfile)profile;
- (WFNetworkScanRecord)network;
- (WFNetworkView)provider;
- (id)cancellationHandler;
- (id)completionHandler;
- (id)providerCallback;
- (int64_t)availableAuthTraits;
- (int64_t)requestedFields;
- (int64_t)securityMode;
- (void)activatePasswordSharing;
- (void)appDidBecomeActive:(id)a3;
- (void)appDidEnterBackground:(id)a3;
- (void)appWillEnterForeground:(id)a3;
- (void)appWillResignActive:(id)a3;
- (void)cancel;
- (void)deactivatePasswordSharingWithReactivation:(BOOL)a3;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5;
- (void)gatherCredentials:(id)a3;
- (void)launchSettings;
- (void)service:(id)a3 receivedNetworkInfo:(id)a4;
- (void)setAvailableAuthTraits:(int64_t)a3;
- (void)setAvailableTLSIdentities:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEnterprise:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setPasswordReceivedFromPasswordSharing:(BOOL)a3;
- (void)setPasswordSharingService:(id)a3;
- (void)setPasswordSharingSupported:(BOOL)a3;
- (void)setProfile:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderCallback:(id)a3;
- (void)setRequestedFields:(int64_t)a3;
- (void)setSecurityIssue:(id)a3;
- (void)setShouldReactivatePasswordSharing:(BOOL)a3;
@end

@implementation WFCredentialsContext

- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4 authTraits:(int64_t)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)WFCredentialsContext;
  v11 = [(WFCredentialsContext *)&v44 init];
  v12 = v11;
  if (!v11)
  {
    v38 = 0;
    goto LABEL_41;
  }
  if (!v9)
  {
    v40 = WFLogForCategory(0);
    os_log_type_t v41 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v40 || !os_log_type_enabled(v40, v41)) {
      goto LABEL_52;
    }
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
    v42 = "%s: nil network";
    goto LABEL_51;
  }
  if (!v10)
  {
    v40 = WFLogForCategory(0);
    os_log_type_t v41 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v40 || !os_log_type_enabled(v40, v41)) {
      goto LABEL_52;
    }
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
    v42 = "%s: nil profile";
LABEL_51:
    _os_log_impl(&dword_226071000, v40, v41, v42, buf, 0xCu);
LABEL_52:

    v38 = v12;
    v12 = 0;
    goto LABEL_41;
  }
  objc_storeStrong((id *)&v11->_network, a3);
  BOOL v13 = [(WFNetworkScanRecord *)v12->_network isEnterprise];
  v12->_enterprise = v13;
  v12->_availableAuthTraits = a5;
  if (v13)
  {
    v12->_requestedFields |= 2uLL;
    if ([v10 isManaged])
    {
      v14 = WFLogForCategory(0);
      os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v10;
        _os_log_impl(&dword_226071000, v14, v15, "%s: network (profile %@) is managed", buf, 0x16u);
      }
    }
    OSStatus v43 = 0;
    v16 = WFAllIdentities(&v43);
    v17 = v16;
    if (v43 || ![v16 count])
    {
      p_super = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v19))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        __int16 v47 = 1024;
        LODWORD(v48) = v43;
        _os_log_impl(&dword_226071000, p_super, v19, "%s: error retrieving identities %d", buf, 0x12u);
      }
    }
    else
    {
      v20 = WFLogForCategory(0);
      os_log_type_t v21 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v20)
      {
        v22 = v20;
        if (os_log_type_enabled(v22, v21))
        {
          uint64_t v23 = [v17 count];
          *(_DWORD *)buf = 136315394;
          v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
          __int16 v47 = 2048;
          uint64_t v48 = v23;
          _os_log_impl(&dword_226071000, v22, v21, "%s: available TLS identities %lu", buf, 0x16u);
        }
      }
      v24 = v17;
      p_super = &v12->_availableTLSIdentities->super;
      v12->_availableTLSIdentities = v24;
    }

    if ([v10 requiresTLSIdentityOnly])
    {
      v25 = WFLogForCategory(0);
      os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v25 && os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v10;
        _os_log_impl(&dword_226071000, v25, v26, "%s: network (profile %@) is TLS identity only", buf, 0x16u);
      }

      uint64_t v27 = v12->_requestedFields | 4;
    }
    else
    {
      if (v12->_availableTLSIdentities)
      {
        v28 = WFLogForCategory(0);
        os_log_type_t v29 = OSLogForWFLogLevel(4uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 4 && v28)
        {
          v30 = v28;
          if (os_log_type_enabled(v30, v29))
          {
            uint64_t v31 = [(NSArray *)v12->_availableTLSIdentities count];
            *(_DWORD *)buf = 136315394;
            v46 = "-[WFCredentialsContext initWithNetwork:profile:authTraits:]";
            __int16 v47 = 2048;
            uint64_t v48 = v31;
            _os_log_impl(&dword_226071000, v30, v29, "%s: available TLS identities %lu", buf, 0x16u);
          }
        }
        uint64_t requestedFields = v12->_requestedFields | 0xC;
      }
      else
      {
        uint64_t requestedFields = v12->_requestedFields;
      }
      uint64_t v27 = requestedFields | 1;
    }
    v12->_uint64_t requestedFields = v27;
  }
  else
  {
    v12->_uint64_t requestedFields = 1;
  }
  uint64_t v33 = [v9 securityIssue];
  securityIssue = v12->_securityIssue;
  v12->_securityIssue = (WFHealthIssue *)v33;

  objc_storeStrong((id *)&v12->_profile, a4);
  v35 = [MEMORY[0x263F08A00] defaultCenter];
  [v35 addObserver:v12 selector:sel_appWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];

  v36 = [MEMORY[0x263F08A00] defaultCenter];
  [v36 addObserver:v12 selector:sel_appDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  v37 = [MEMORY[0x263F08A00] defaultCenter];
  [v37 addObserver:v12 selector:sel_appWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];

  v38 = [MEMORY[0x263F08A00] defaultCenter];
  [v38 addObserver:v12 selector:sel_appDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
LABEL_41:

  return v12;
}

- (WFCredentialsContext)initWithNetwork:(id)a3 profile:(id)a4
{
  return [(WFCredentialsContext *)self initWithNetwork:a3 profile:a4 authTraits:0];
}

- (void)setProvider:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315394;
    v8 = "-[WFCredentialsContext setProvider:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_226071000, v5, v6, "%s: provider %@", (uint8_t *)&v7, 0x16u);
  }

  objc_storeWeak((id *)&self->_provider, v4);
}

- (void)setPasswordSharingSupported:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  self->_passwordSharingSupported = a3;
  self->_shouldReactivatePasswordSharing = a3;
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    int v7 = "-[WFCredentialsContext setPasswordSharingSupported:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: supported %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)finishWithError:(id)a3 forNetwork:(id)a4 profile:(id)a5
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFCredentialsContext_finishWithError_forNetwork_profile___block_invoke;
  v8[3] = &unk_26478E7D8;
  id v9 = v6;
  uint64_t v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __59__WFCredentialsContext_finishWithError_forNetwork_profile___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = WFLogForCategory(0);
  os_log_type_t v3 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v2 && os_log_type_enabled(v2, v3))
  {
    id v4 = *(void **)(a1 + 32);
    int v19 = 136315394;
    v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_226071000, v2, v3, "%s: error %@", (uint8_t *)&v19, 0x16u);
  }

  os_log_type_t v5 = [*(id *)(a1 + 40) providerCallback];

  if (v5)
  {
    id v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v6 && os_log_type_enabled(v6, v7))
    {
      int v19 = 136315138;
      v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
      _os_log_impl(&dword_226071000, v6, v7, "%s: calling provider callback", (uint8_t *)&v19, 0xCu);
    }

    __int16 v8 = [*(id *)(a1 + 40) providerCallback];
    ((void (**)(void, BOOL))v8)[2](v8, *(void *)(a1 + 32) == 0);

    [*(id *)(a1 + 40) setProviderCallback:0];
  }
  id v9 = [*(id *)(a1 + 40) provider];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v11)
    {
      BOOL v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        v14 = [*(id *)(a1 + 40) provider];
        int v19 = 136315394;
        v20 = "-[WFCredentialsContext finishWithError:forNetwork:profile:]_block_invoke";
        __int16 v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_226071000, v13, v12, "%s: calling resetFirstResponder on provider %@", (uint8_t *)&v19, 0x16u);
      }
    }

    os_log_type_t v15 = [*(id *)(a1 + 40) provider];
    [v15 resetFirstResponder];
  }
  v16 = [*(id *)(a1 + 40) provider];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [*(id *)(a1 + 40) provider];
    [v18 setActivityString:0];
  }
}

- (void)finishWithError:(id)a3
{
}

- (void)dealloc
{
  os_log_type_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(WFCredentialsContext *)self deactivatePasswordSharingWithReactivation:0];
  v4.receiver = self;
  v4.super_class = (Class)WFCredentialsContext;
  [(WFCredentialsContext *)&v4 dealloc];
}

- (BOOL)validateCredentials
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  os_log_type_t v3 = [(WFCredentialsContext *)self provider];
  uint64_t v4 = [v3 TLSIdentity];

  os_log_type_t v5 = [(WFCredentialsContext *)self provider];
  id v6 = [v5 username];
  uint64_t v7 = [v6 length];

  BOOL v8 = [(WFCredentialsContext *)self validatePassword];
  id v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v9)
  {
    uint64_t v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      os_log_type_t v12 = [(WFCredentialsContext *)self network];
      int v18 = 136316162;
      int v19 = "-[WFCredentialsContext validateCredentials]";
      __int16 v20 = 1024;
      BOOL v21 = v4 != 0;
      __int16 v22 = 1024;
      BOOL v23 = v7 != 0;
      __int16 v24 = 1024;
      BOOL v25 = v8;
      __int16 v26 = 2048;
      uint64_t v27 = [v12 securityMode];
      _os_log_impl(&dword_226071000, v11, v10, "%s: identityValid %d usernameValid %d passwordValid %d (securityMode %ld)", (uint8_t *)&v18, 0x28u);
    }
  }

  if (![(WFCredentialsContext *)self isEnterprise])
  {
    os_log_type_t v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v16))
    {
      int v18 = 136315394;
      int v19 = "-[WFCredentialsContext validateCredentials]";
      __int16 v20 = 1024;
      BOOL v21 = v8;
      _os_log_impl(&dword_226071000, v15, v16, "%s: passwordValid: %d", (uint8_t *)&v18, 0x12u);
    }
    goto LABEL_22;
  }
  if (v7) {
    BOOL v13 = v8;
  }
  else {
    BOOL v13 = 0;
  }
  BOOL result = 1;
  if (!v4 && !v13)
  {
    os_log_type_t v15 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v15 && os_log_type_enabled(v15, v17))
    {
      int v18 = 136315906;
      int v19 = "-[WFCredentialsContext validateCredentials]";
      __int16 v20 = 1024;
      BOOL v21 = v8;
      __int16 v22 = 1024;
      BOOL v23 = v7 != 0;
      __int16 v24 = 1024;
      BOOL v25 = v8;
      _os_log_impl(&dword_226071000, v15, v17, "%s: enterprise network - identityValid: %d userNameValid: %d passwordValid %d", (uint8_t *)&v18, 0x1Eu);
    }
    LOBYTE(v8) = 0;
LABEL_22:

    return v8;
  }
  return result;
}

- (NSString)username
{
  os_log_type_t v3 = [(WFCredentialsContext *)self profile];
  uint64_t v4 = [v3 username];

  if (v4)
  {
    os_log_type_t v5 = [(WFCredentialsContext *)self profile];
    id v6 = [v5 username];
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)validatePassword
{
  int64_t v3 = [(WFCredentialsContext *)self securityMode];
  uint64_t v4 = [(WFCredentialsContext *)self provider];
  os_log_type_t v5 = [v4 password];
  LOBYTE(v3) = WFValidPasswordForSecurityMode(v3, v5);

  return v3;
}

- (void)gatherCredentials:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    uint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      BOOL v8 = [(WFCredentialsContext *)self provider];
      int v13 = 136315650;
      v14 = "-[WFCredentialsContext gatherCredentials:]";
      __int16 v15 = 2112;
      os_log_type_t v16 = v8;
      __int16 v17 = 1024;
      BOOL v18 = v4 == 0;
      _os_log_impl(&dword_226071000, v7, v6, "%s: gathering credentials for %@ shouldDismiss %d", (uint8_t *)&v13, 0x1Cu);
    }
  }

  id v9 = [(WFCredentialsContext *)self providerCallback];

  if (v4 && v9)
  {
    uint64_t v10 = WFLogForCategory(0);
    os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v10 && os_log_type_enabled((os_log_t)v10, v11))
    {
      int v13 = 136315138;
      v14 = "-[WFCredentialsContext gatherCredentials:]";
      _os_log_impl(&dword_226071000, (os_log_t)v10, v11, "%s: Called gatherCredentials while credentials are already being gathered", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    [(WFCredentialsContext *)self setProviderCallback:v4];
    uint64_t v10 = [(WFCredentialsContext *)self completionHandler];
    os_log_type_t v12 = [(WFCredentialsContext *)self provider];
    (*(void (**)(uint64_t, void *, BOOL))(v10 + 16))(v10, v12, v4 == 0);
  }
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    int v11 = 136315394;
    os_log_type_t v12 = "-[WFCredentialsContext cancel]";
    __int16 v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_226071000, v3, v4, "%s: %@ credentials provider is nil", (uint8_t *)&v11, 0x16u);
  }

  os_log_type_t v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5)
  {
    uint64_t v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      BOOL v8 = [(WFCredentialsContext *)self provider];
      int v11 = 136315394;
      os_log_type_t v12 = "-[WFCredentialsContext cancel]";
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_226071000, v7, v6, "%s: cancelled credential request for %@", (uint8_t *)&v11, 0x16u);
    }
  }

  id v9 = [(WFCredentialsContext *)self cancellationHandler];

  if (v9)
  {
    uint64_t v10 = [(WFCredentialsContext *)self cancellationHandler];
    v10[2]();
  }
  [(WFCredentialsContext *)self deactivatePasswordSharingWithReactivation:0];
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)appWillEnterForeground:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[WFCredentialsContext appWillEnterForeground:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFCredentialsContext *)self activatePasswordSharing];
}

- (void)appDidEnterBackground:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[WFCredentialsContext appDidEnterBackground:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFCredentialsContext *)self deactivatePasswordSharingWithReactivation:1];
}

- (void)appWillResignActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[WFCredentialsContext appWillResignActive:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFCredentialsContext *)self deactivatePasswordSharingWithReactivation:1];
}

- (void)appDidBecomeActive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[WFCredentialsContext appDidBecomeActive:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_226071000, v4, v5, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(WFCredentialsContext *)self activatePasswordSharing];
}

- (void)activatePasswordSharing
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(WFCredentialsContext *)self isPasswordSharingSupported])
  {
    int64_t v3 = [(WFCredentialsContext *)self passwordSharingService];

    if (!v3)
    {
      BOOL v4 = [(WFCredentialsContext *)self shouldReactivatePasswordSharing];
      os_log_type_t v5 = WFLogForCategory(0);
      if (v4)
      {
        os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
        {
          int v14 = 136315394;
          uint64_t v15 = "-[WFCredentialsContext activatePasswordSharing]";
          __int16 v16 = 2112;
          __int16 v17 = self;
          _os_log_impl(&dword_226071000, v5, v6, "%s: %@", (uint8_t *)&v14, 0x16u);
        }

        id v7 = objc_alloc_init(MEMORY[0x263F6C280]);
        [(WFCredentialsContext *)self setPasswordSharingService:v7];

        __int16 v8 = [(WFCredentialsContext *)self network];
        id v9 = [v8 ssid];
        uint64_t v10 = [(WFCredentialsContext *)self passwordSharingService];
        [v10 setNetworkName:v9];

        int v11 = [(WFCredentialsContext *)self passwordSharingService];
        [v11 setDelegate:self];

        os_log_type_t v12 = [(WFCredentialsContext *)self passwordSharingService];
        [v12 activate];

        [(WFCredentialsContext *)self setShouldReactivatePasswordSharing:0];
      }
      else
      {
        os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v13))
        {
          int v14 = 136315138;
          uint64_t v15 = "-[WFCredentialsContext activatePasswordSharing]";
          _os_log_impl(&dword_226071000, v5, v13, "%s: not reactivating password sharing", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
}

- (void)deactivatePasswordSharingWithReactivation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(WFCredentialsContext *)self isPasswordSharingSupported])
  {
    os_log_type_t v5 = [(WFCredentialsContext *)self passwordSharingService];

    if (v5)
    {
      os_log_type_t v6 = WFLogForCategory(0);
      os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
      {
        int v10 = 136315394;
        int v11 = "-[WFCredentialsContext deactivatePasswordSharingWithReactivation:]";
        __int16 v12 = 2112;
        os_log_type_t v13 = self;
        _os_log_impl(&dword_226071000, v6, v7, "%s: %@", (uint8_t *)&v10, 0x16u);
      }

      __int16 v8 = [(WFCredentialsContext *)self passwordSharingService];
      [v8 setDelegate:0];

      id v9 = [(WFCredentialsContext *)self passwordSharingService];
      [v9 invalidate];

      [(WFCredentialsContext *)self setPasswordSharingService:0];
      if (v3) {
        [(WFCredentialsContext *)self setShouldReactivatePasswordSharing:1];
      }
    }
  }
}

- (int64_t)securityMode
{
  v2 = [(WFCredentialsContext *)self network];
  int64_t v3 = [v2 securityMode];

  return v3;
}

- (void)launchSettings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    os_log_type_t v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      os_log_type_t v6 = [(WFCredentialsContext *)self network];
      int v8 = 136315650;
      id v9 = "-[WFCredentialsContext launchSettings]";
      __int16 v10 = 2112;
      int v11 = v6;
      __int16 v12 = 2112;
      os_log_type_t v13 = self;
      _os_log_impl(&dword_226071000, v5, v4, "%s: opening settings for %@ (context: %@)", (uint8_t *)&v8, 0x20u);
    }
  }

  os_log_type_t v7 = [(WFCredentialsContext *)self network];
  WFScanRecordArchiveToEnterprisePath(v7);

  WFOpenSettingsURLWithType(2uLL);
  [(WFCredentialsContext *)self cancel];
}

- (void)service:(id)a3 receivedNetworkInfo:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_log_type_t v6 = WFLogForCategory(0);
  os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v6)
  {
    int v8 = v6;
    if (os_log_type_enabled(v8, v7))
    {
      id v9 = [v5 networkName];
      int v24 = 136315394;
      BOOL v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      _os_log_impl(&dword_226071000, v8, v7, "%s: received network info for network='%@'", (uint8_t *)&v24, 0x16u);
    }
  }

  __int16 v10 = [(WFCredentialsContext *)self network];
  int v11 = [(WFCredentialsContext *)self provider];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
    __int16 v16 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v16) {
      goto LABEL_12;
    }
    __int16 v16 = v16;
    if (os_log_type_enabled(v16, v18))
    {
      uint64_t v19 = [(WFCredentialsContext *)self provider];
      int v24 = 136315394;
      BOOL v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      _os_log_impl(&dword_226071000, v16, v18, "%s: provider (%@) doesn't support password sharing callback", (uint8_t *)&v24, 0x16u);
    }
LABEL_21:

    goto LABEL_12;
  }
  os_log_type_t v13 = [v5 networkName];
  uint64_t v14 = [v10 ssid];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    __int16 v16 = WFLogForCategory(0);
    os_log_type_t v20 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() < 3 || !v16) {
      goto LABEL_12;
    }
    __int16 v16 = v16;
    if (os_log_type_enabled(v16, v20))
    {
      BOOL v21 = [v10 ssid];
      __int16 v22 = [v5 networkName];
      int v24 = 136315650;
      BOOL v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      __int16 v26 = 2112;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      os_log_type_t v29 = v22;
      _os_log_impl(&dword_226071000, v16, v20, "%s: ssid mismatch, expected %@ received %@", (uint8_t *)&v24, 0x20u);
    }
    goto LABEL_21;
  }
  if ([v10 securityMode] == 4
    || [v10 securityMode] == 8
    || [v10 securityMode] == 512)
  {
    [(WFCredentialsContext *)self setPasswordReceivedFromPasswordSharing:1];
    __int16 v16 = [(WFCredentialsContext *)self provider];
    __int16 v17 = [v5 psk];
    [v16 receiveSharedPassword:v17];
  }
  else
  {
    __int16 v16 = WFLogForCategory(0);
    os_log_type_t v23 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v23))
    {
      int v24 = 136315394;
      BOOL v25 = "-[WFCredentialsContext service:receivedNetworkInfo:]";
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_226071000, v16, v23, "%s: Invalid security type for network %@", (uint8_t *)&v24, 0x16u);
    }
  }
LABEL_12:
}

- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4
{
  return 0;
}

- (WFNetworkView)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (WFNetworkView *)WeakRetained;
}

- (BOOL)isEnterprise
{
  return self->_enterprise;
}

- (void)setEnterprise:(BOOL)a3
{
  self->_enterprise = a3;
}

- (int64_t)availableAuthTraits
{
  return self->_availableAuthTraits;
}

- (void)setAvailableAuthTraits:(int64_t)a3
{
  self->_availableAuthTraits = a3;
}

- (BOOL)isPasswordSharingSupported
{
  return self->_passwordSharingSupported;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_uint64_t requestedFields = a3;
}

- (id)providerCallback
{
  return self->_providerCallback;
}

- (void)setProviderCallback:(id)a3
{
}

- (NSArray)availableTLSIdentities
{
  return self->_availableTLSIdentities;
}

- (void)setAvailableTLSIdentities:(id)a3
{
}

- (SFPasswordSharingService)passwordSharingService
{
  return self->_passwordSharingService;
}

- (void)setPasswordSharingService:(id)a3
{
}

- (BOOL)shouldReactivatePasswordSharing
{
  return self->_shouldReactivatePasswordSharing;
}

- (void)setShouldReactivatePasswordSharing:(BOOL)a3
{
  self->_shouldReactivatePasswordSharing = a3;
}

- (WFHealthIssue)securityIssue
{
  return self->_securityIssue;
}

- (void)setSecurityIssue:(id)a3
{
}

- (BOOL)passwordReceivedFromPasswordSharing
{
  return self->_passwordReceivedFromPasswordSharing;
}

- (void)setPasswordReceivedFromPasswordSharing:(BOOL)a3
{
  self->_passwordReceivedFromPasswordSharing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityIssue, 0);
  objc_storeStrong((id *)&self->_passwordSharingService, 0);
  objc_storeStrong((id *)&self->_availableTLSIdentities, 0);
  objc_storeStrong(&self->_providerCallback, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end