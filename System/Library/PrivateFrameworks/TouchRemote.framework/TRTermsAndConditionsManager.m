@interface TRTermsAndConditionsManager
- (AAUIProxiedTermsRemoteUI)proxiedTermsRemoteUI;
- (TRTermsAndConditionsManager)initWithAuthResultsBlock:(id)a3 presentingViewController:(id)a4;
- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)handleAccept;
- (void)handleDecline;
- (void)loadProxiedTerms:(id)a3 anisetteDataProvider:(id)a4 appProvidedContext:(id)a5 acceptAction:(id)a6 declineAction:(id)a7;
- (void)presentProxiedTermsRemoteUI;
- (void)setAcceptedTermsInfo:(id)a3;
- (void)setProxiedTermsRemoteUI:(id)a3;
@end

@implementation TRTermsAndConditionsManager

- (TRTermsAndConditionsManager)initWithAuthResultsBlock:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRTermsAndConditionsManager;
  v9 = [(TRTermsAndConditionsManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authResult, a3);
    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)loadProxiedTerms:(id)a3 anisetteDataProvider:(id)a4 appProvidedContext:(id)a5 acceptAction:(id)a6 declineAction:(id)a7
{
  v32[4] = *MEMORY[0x263EF8340];
  objc_super v12 = (AKDevice *)a3;
  v13 = (objc_class *)MEMORY[0x263EFFA08];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [v13 alloc];
  v32[0] = *MEMORY[0x263F25738];
  v32[1] = @"HomePodSLA";
  uint64_t v19 = *MEMORY[0x263F25728];
  v32[2] = *MEMORY[0x263F25730];
  v32[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  v21 = (void *)[v18 initWithArray:v20];

  if (_TRLogEnabled == 1)
  {
    v22 = TRLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2149BE000, v22, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager loadProxiedTerms", v31, 2u);
    }
  }
  v23 = (AAUIProxiedTermsRemoteUI *)[objc_alloc(getAAUIProxiedTermsRemoteUIClass()) initWithAuthResults:self->_authResult proxiedDevice:v12 anisetteDataProvider:v17 appProvidedContext:v16 termsEntries:v21];

  proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
  self->_proxiedTermsRemoteUI = v23;

  [(AAUIProxiedTermsRemoteUI *)self->_proxiedTermsRemoteUI setDelegate:self];
  proxiedDevice = self->_proxiedDevice;
  self->_proxiedDevice = v12;
  v26 = v12;

  v27 = (void *)MEMORY[0x2166AC110](v15);
  id acceptAction = self->_acceptAction;
  self->_id acceptAction = v27;

  v29 = (void *)MEMORY[0x2166AC110](v14);
  id declineAction = self->_declineAction;
  self->_id declineAction = v29;

  [(TRTermsAndConditionsManager *)self presentProxiedTermsRemoteUI];
}

- (void)setAcceptedTermsInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = (NSDictionary *)a3;
  if ([(NSDictionary *)v4 count] && _TRLogEnabled == 1)
  {
    v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Terms Info not empty %@", (uint8_t *)&v7, 0xCu);
    }
  }
  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = v4;

  if (self->_didAccept) {
    [(TRTermsAndConditionsManager *)self handleAccept];
  }
}

- (void)handleAccept
{
  if (_TRLogEnabled == 1)
  {
    v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleAccept", buf, 2u);
    }

    if (self->_didAccept && _TRLogEnabled == 1)
    {
      v4 = TRLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_2149BE000, v4, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleAccept entered multiple times", v8, 2u);
      }
    }
  }
  self->_didAccept = 1;
  id acceptAction = (void (**)(id, NSDictionary *))self->_acceptAction;
  if (acceptAction)
  {
    acceptAction[2](acceptAction, self->_acceptedTermsInfo);
  }
  else if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager acceptedTerms undefined", v7, 2u);
    }
  }
}

- (void)presentProxiedTermsRemoteUI
{
  presentingViewController = self->_presentingViewController;
  if (presentingViewController && (proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI) != 0)
  {
    if (_TRLogEnabled == 1)
    {
      v5 = TRLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Presenting Terms", buf, 2u);
      }

      presentingViewController = self->_presentingViewController;
      proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
    }
    [(AAUIProxiedTermsRemoteUI *)proxiedTermsRemoteUI presentFromViewController:presentingViewController modal:1];
  }
  else if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager Could not present", v12, 2u);
    }

    int v7 = _TRLogEnabled;
    if (!self->_presentingViewController && _TRLogEnabled == 1)
    {
      id v8 = TRLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "Reason: Presenting VC Nil", v11, 2u);
      }

      int v7 = _TRLogEnabled;
    }
    if (!self->_proxiedTermsRemoteUI && v7 == 1)
    {
      uint64_t v9 = TRLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2149BE000, v9, OS_LOG_TYPE_DEFAULT, "Reason: Proxy Terms Nil", v10, 2u);
      }
    }
  }
}

- (void)handleDecline
{
  if (_TRLogEnabled == 1)
  {
    v3 = TRLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager handleDecline", buf, 2u);
    }
  }
  id declineAction = (void (**)(void))self->_declineAction;
  if (declineAction)
  {
    declineAction[2]();
  }
  else if (_TRLogEnabled == 1)
  {
    v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager decline action undefined", v6, 2u);
    }
  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    int v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "no";
      if (v4) {
        id v8 = "yes";
      }
      int v9 = 136315138;
      v10 = v8;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager didFinishWithSuccess %s", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v4) {
    [(TRTermsAndConditionsManager *)self handleAccept];
  }
  else {
    [(TRTermsAndConditionsManager *)self handleDecline];
  }
}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (_TRLogEnabled == 1)
  {
    id v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "TRTermsAndConditionsManager acceptedTermsInfo %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(TRTermsAndConditionsManager *)self setAcceptedTermsInfo:v5];
}

- (AAUIProxiedTermsRemoteUI)proxiedTermsRemoteUI
{
  return self->_proxiedTermsRemoteUI;
}

- (void)setProxiedTermsRemoteUI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxiedTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
  objc_storeStrong(&self->_declineAction, 0);
  objc_storeStrong(&self->_acceptAction, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_authResult, 0);
}

@end