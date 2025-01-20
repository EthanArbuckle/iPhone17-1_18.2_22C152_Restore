@interface SFAppAutoFillPasskeyProvider
- (SFAppAutoFillPasskeyProvider)init;
- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 inAppWithBundleIdentifier:(id)a5;
- (void)didFillExternalCredential:(id)a3 inAppWithBundleIdentifier:(id)a4;
- (void)getAvailablePasskeysForAppWithAuditToken:(id *)a3 withCompletionHandler:(id)a4;
- (void)getAvailablePasskeysForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getAvailablePasskeysForWebPageIdentifier:(id)a3 frameID:(id)a4 completionHandler:(id)a5;
- (void)userSelectedPasskey:(id)a3 authenticatedLAContext:(id)a4;
@end

@implementation SFAppAutoFillPasskeyProvider

- (SFAppAutoFillPasskeyProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFAppAutoFillPasskeyProvider;
  v2 = [(SFAppAutoFillPasskeyProvider *)&v7 init];
  if (v2)
  {
    v3 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x263F66268]);
    proxy = v2->_proxy;
    v2->_proxy = v3;

    v5 = v2;
  }

  return v2;
}

- (void)getAvailablePasskeysForAppWithAuditToken:(id *)a3 withCompletionHandler:(id)a4
{
}

- (void)getAvailablePasskeysForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  proxy = self->_proxy;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForApplicationIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_264390B10;
  id v10 = v6;
  id v8 = v6;
  [(WBSAuthenticationServicesAgentProxy *)proxy getPasskeysForRunningAssertionWithApplicationIdentifier:a3 withCompletionHandler:v9];
}

void __95__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_24);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)getAvailablePasskeysForWebPageIdentifier:(id)a3 frameID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F662B8];
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithPageID:v11 frameID:v10];

  proxy = self->_proxy;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __99__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForWebPageIdentifier_frameID_completionHandler___block_invoke;
  v15[3] = &unk_264390B10;
  id v16 = v8;
  id v14 = v8;
  [(WBSAuthenticationServicesAgentProxy *)proxy getPasskeysForRunningAssertionWithWebFrameIdentifier:v12 completionHandler:v15];
}

void __99__SFAppAutoFillPasskeyProvider_getAvailablePasskeysForWebPageIdentifier_frameID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_24);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)userSelectedPasskey:(id)a3 authenticatedLAContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    id v10 = [v6 identifier];
    id v11 = [v6 corePasskey];
    v12 = [v11 operationUUID];
    int v16 = 138478339;
    v17 = v10;
    __int16 v18 = 2114;
    v19 = v12;
    __int16 v20 = 2113;
    id v21 = v7;
    _os_log_impl(&dword_218FBF000, v9, OS_LOG_TYPE_DEFAULT, "User completed passkey AutoFill with identifier %{private}@ for operation %{public}@, didAuthenticate: %{private}@", (uint8_t *)&v16, 0x20u);
  }
  proxy = self->_proxy;
  id v14 = [v6 corePasskey];
  v15 = [MEMORY[0x263F66398] defaultContext];
  [(WBSAuthenticationServicesAgentProxy *)proxy userSelectedAutoFillPasskey:v14 authenticatedLAContext:v7 savedAccountContext:v15 completionHandler:&__block_literal_global_1];
}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 inAppWithBundleIdentifier:(id)a5
{
}

- (void)didFillExternalCredential:(id)a3 inAppWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v12 = [a3 externalCredential];
  proxy = self->_proxy;
  id v8 = [v12 user];
  v9 = [v12 site];
  id v10 = [v12 owningExtensionState];
  id v11 = [v10 providerBundleID];
  [(WBSAuthenticationServicesAgentProxy *)proxy didFillCredentialForUsername:v8 forHost:v9 fromProviderWithBundleIdentifier:v11 inAppWithBundleIdentifier:v6];
}

- (void).cxx_destruct
{
}

@end