@interface SBAppSwitcherSystemService
- (SBAppSwitcherSystemService)initWithRecentAppLayoutsController:(id)a3 commandTabController:(id)a4;
- (void)requestAppearanceForHiddenAppWithBundleIdentifier:(id)a3 assertionPort:(id)a4 forClient:(id)a5 withCompletion:(id)a6;
- (void)systemServiceServer:(id)a3 requestAppearanceForHiddenAppWithBundleIdentifier:(id)a4 assertionPort:(id)a5 forClient:(id)a6 withCompletion:(id)a7;
@end

@implementation SBAppSwitcherSystemService

- (SBAppSwitcherSystemService)initWithRecentAppLayoutsController:(id)a3 commandTabController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBAppSwitcherSystemService;
  v9 = [(SBAppSwitcherSystemService *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentAppLayouts, a3);
    objc_storeStrong((id *)&v10->_commandTabController, a4);
    v11 = +[SBSystemServiceServer sharedInstance];
    [v11 setAppSwitcherDelegate:v10];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.requestAppSwitcherAppearanceForHiddenApp"];
    requestAppearanceForHiddenAppAuthenticator = v10->_requestAppearanceForHiddenAppAuthenticator;
    v10->_requestAppearanceForHiddenAppAuthenticator = (FBServiceClientAuthenticator *)v12;
  }
  return v10;
}

- (void)requestAppearanceForHiddenAppWithBundleIdentifier:(id)a3 assertionPort:(id)a4 forClient:(id)a5 withCompletion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, BOOL))a6;
  BSDispatchQueueAssertMain();
  if (!v13)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBAppSwitcherSystemService.m", 43, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  requestAppearanceForHiddenAppAuthenticator = self->_requestAppearanceForHiddenAppAuthenticator;
  v16 = [v13 processHandle];
  v17 = [v16 auditToken];
  id v31 = 0;
  char v18 = [(FBServiceClientAuthenticator *)requestAppearanceForHiddenAppAuthenticator authenticateAuditToken:v17 error:&v31];
  id v19 = v31;

  if (v18)
  {
    v20 = +[SBApplicationController sharedInstance];
    v21 = [v20 applicationWithBundleIdentifier:v11];

    if (v21)
    {
      v22 = [(SBRecentAppLayouts *)self->_recentAppLayouts _acquireAllowHiddenAppAssertionForBundleIdentifier:v11 reason:@"SBAppSwitcherSystemService"];
      [(SBCommandTabController *)self->_commandTabController _allowAppToAppearWhileHidden:v11];
      v23 = (void *)MEMORY[0x1E4F4F7E0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke;
      v27[3] = &unk_1E6AF4E00;
      id v28 = v22;
      v29 = self;
      id v30 = v11;
      id v24 = v22;
      [v23 monitorSendRight:v12 withHandler:v27];
    }
    v14[2](v14, v21 != 0);
  }
  else
  {
    v25 = SBLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBAppSwitcherSystemService requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:](v19, v25);
    }

    v14[2](v14, 0);
  }
}

void __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  BSDispatchMain();
}

uint64_t __119__SBAppSwitcherSystemService_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 40) + 24);
  return [v3 _disallowAppFromAppearingWhileHidden:v2];
}

- (void)systemServiceServer:(id)a3 requestAppearanceForHiddenAppWithBundleIdentifier:(id)a4 assertionPort:(id)a5 forClient:(id)a6 withCompletion:(id)a7
{
  id v10 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  id v14 = v10;
  BSDispatchMain();
}

uint64_t __139__SBAppSwitcherSystemService_systemServiceServer_requestAppearanceForHiddenAppWithBundleIdentifier_assertionPort_forClient_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestAppearanceForHiddenAppWithBundleIdentifier:*(void *)(a1 + 40) assertionPort:*(void *)(a1 + 48) forClient:*(void *)(a1 + 56) withCompletion:*(void *)(a1 + 64)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandTabController, 0);
  objc_storeStrong((id *)&self->_recentAppLayouts, 0);
  objc_storeStrong((id *)&self->_requestAppearanceForHiddenAppAuthenticator, 0);
}

- (void)requestAppearanceForHiddenAppWithBundleIdentifier:(void *)a1 assertionPort:(NSObject *)a2 forClient:withCompletion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 136315394;
  v5 = "-[SBAppSwitcherSystemService requestAppearanceForHiddenAppWithBundleIdentifier:assertionPort:forClient:withCompletion:]";
  __int16 v6 = 2114;
  id v7 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);
}

@end