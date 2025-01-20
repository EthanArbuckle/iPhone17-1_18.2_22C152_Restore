@interface WBSAuthenticationServicesAgentProxy
- (WBSAuthenticationServicesAgentDelegate)delegate;
- (WBSAuthenticationServicesAgentProxy)init;
- (id)connection;
- (void)_setUpConnection:(id)a3;
- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8;
- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8;
- (void)dealloc;
- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6;
- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6;
- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6;
- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6;
- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3;
- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4;
- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5;
- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7;
- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4;
- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSAuthenticationServicesAgentProxy

- (void)setDelegate:(id)a3
{
}

- (WBSAuthenticationServicesAgentProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSAuthenticationServicesAgentProxy;
  v2 = [(WBSAuthenticationServicesAgentProxy *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.AuthenticationServices.AutoFill" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    [(WBSAuthenticationServicesAgentProxy *)v2 _setUpConnection:v2->_connection];
    v5 = v2;
  }

  return v2;
}

- (void)_setUpConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = WBSAuthenticationServicesAgentInterface();
  [v4 setRemoteObjectInterface:v5];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __56__WBSAuthenticationServicesAgentProxy__setUpConnection___block_invoke;
  v11 = &unk_1E615A5D8;
  objc_copyWeak(&v12, &location);
  v6 = _Block_copy(&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v6, v8, v9, v10, v11);
  [v4 setInterruptionHandler:v6];
  objc_super v7 = WBSAuthenticationServicesAgentDelegateInterface();
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:self];
  [v4 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.AuthenticationServices.AutoFill" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    [(WBSAuthenticationServicesAgentProxy *)self _setUpConnection:self->_connection];
    connection = self->_connection;
  }
  v6 = connection;
  return v6;
}

- (void)getPasskeysForRunningAssertionWithApplicationIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Asking daemon for passkeys.", buf, 2u);
  }
  v10 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E615A648;
  SEL v17 = a2;
  id v11 = v8;
  id v16 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v15];

  if (v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke_58;
    v13[3] = &unk_1E615A678;
    id v14 = v11;
    [v12 getPasskeysForRunningAssertionWithApplicationIdentifier:v7 withCompletionHandler:v13];
  }
}

void __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithApplicationIdentifier_withCompletionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPasskeysForRunningAssertionWithWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_1B728F000, v9, OS_LOG_TYPE_INFO, "Asking daemon for passkeys for %{public}@.", buf, 0xCu);
  }
  v10 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E615A648;
  SEL v17 = a2;
  id v11 = v8;
  id v16 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v15];

  if (v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke_60;
    v13[3] = &unk_1E615A678;
    id v14 = v11;
    [v12 getPasskeysForRunningAssertionWithWebFrameIdentifier:v7 completionHandler:v13];
  }
}

void __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__WBSAuthenticationServicesAgentProxy_getPasskeysForRunningAssertionWithWebFrameIdentifier_completionHandler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)userSelectedAutoFillPasskey:(id)a3 authenticatedLAContext:(id)a4 savedAccountContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    SEL v17 = [v11 operationUUID];
    *(_DWORD *)buf = 138543362;
    v28 = v17;
    _os_log_impl(&dword_1B728F000, v16, OS_LOG_TYPE_INFO, "Informing daemon that user selected passkey for operation %{public}@.", buf, 0xCu);
  }
  v18 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke;
  v24[3] = &unk_1E615A648;
  SEL v26 = a2;
  id v19 = v14;
  id v25 = v19;
  uint64_t v20 = [v18 remoteObjectProxyWithErrorHandler:v24];

  if (v20)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke_61;
    v21[3] = &unk_1E615A6A0;
    id v22 = v12;
    id v23 = v19;
    [v20 userSelectedAutoFillPasskey:v11 authenticatedLAContext:v22 savedAccountContext:v13 completionHandler:v21];
  }
}

void __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillPasskey_authenticatedLAContext_savedAccountContext_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)userSelectedAutoFillNearbyDevice:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    id v11 = [v7 operationUUID];
    *(_DWORD *)buf = 138543362;
    id v22 = v11;
    _os_log_impl(&dword_1B728F000, v10, OS_LOG_TYPE_INFO, "Informing daemon that user selected nearby device for operation %{public}@.", buf, 0xCu);
  }
  id v12 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  SEL v17 = __90__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillNearbyDevice_completionHandler___block_invoke;
  v18 = &unk_1E615A648;
  SEL v20 = a2;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  if (v14) {
    objc_msgSend(v14, "userSelectedAutoFillNearbyDevice:completionHandler:", v7, v13, v15, v16, v17, v18);
  }
}

void __90__WBSAuthenticationServicesAgentProxy_userSelectedAutoFillNearbyDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)test_createPasskeyWithUserName:(id)a3 displayName:(id)a4 relyingPartyIdentifier:(id)a5 userHandle:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B728F000, v18, OS_LOG_TYPE_INFO, "Test runner asking daemon to create passkey.", buf, 2u);
  }
  id v19 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __134__WBSAuthenticationServicesAgentProxy_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke;
  id v25 = &unk_1E615A648;
  SEL v27 = a2;
  id v20 = v17;
  id v26 = v20;
  v21 = [v19 remoteObjectProxyWithErrorHandler:&v22];

  if (v21) {
    objc_msgSend(v21, "test_createPasskeyWithUserName:displayName:relyingPartyIdentifier:userHandle:completionHandler:", v13, v14, v15, v16, v20, v22, v23, v24, v25);
  }
}

void __134__WBSAuthenticationServicesAgentProxy_test_createPasskeyWithUserName_displayName_relyingPartyIdentifier_userHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getExternalPasskeyRequestForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __140__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
  v21 = &unk_1E615A648;
  SEL v23 = a2;
  id v16 = v14;
  id v22 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:&v18];

  if (v17) {
    objc_msgSend(v17, "getExternalPasskeyRequestForWebFrameIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v11, v12, v13, v16, v18, v19, v20, v21);
  }
}

void __140__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForWebFrameIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getExternalPasskeyRequestForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 credentialID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __143__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke;
  v21 = &unk_1E615A648;
  SEL v23 = a2;
  id v16 = v14;
  id v22 = v16;
  id v17 = [v15 remoteObjectProxyWithErrorHandler:&v18];

  if (v17) {
    objc_msgSend(v17, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v11, v12, v13, v16, v18, v19, v20, v21);
  }
}

void __143__WBSAuthenticationServicesAgentProxy_getExternalPasskeyRequestForApplicationIdentifier_relyingPartyIdentifier_credentialID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)completeAssertionWithExternalPasskeyForWebFrameIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __172__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForWebFrameIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a2;
  id v22 = [v21 remoteObjectProxyWithErrorHandler:v23];

  if (v22) {
    [v22 completeAssertionWithExternalPasskeyForWebFrameIdentifier:v15 relyingPartyIdentifier:v16 authenticatorData:v17 signature:v18 userHandle:v19 credentialID:v20];
  }
}

void __172__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForWebFrameIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)completeAssertionWithExternalPasskeyForApplicationIdentifier:(id)a3 relyingPartyIdentifier:(id)a4 authenticatorData:(id)a5 signature:(id)a6 userHandle:(id)a7 credentialID:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __175__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForApplicationIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a2;
  id v22 = [v21 remoteObjectProxyWithErrorHandler:v23];

  if (v22) {
    [v22 completeAssertionWithExternalPasskeyForApplicationIdentifier:v15 relyingPartyIdentifier:v16 authenticatorData:v17 signature:v18 userHandle:v19 credentialID:v20];
  }
}

void __175__WBSAuthenticationServicesAgentProxy_completeAssertionWithExternalPasskeyForApplicationIdentifier_relyingPartyIdentifier_authenticatorData_signature_userHandle_credentialID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)getPasskeyAssertionRequestParametersForWebFrameIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __115__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForWebFrameIdentifier_completionHandler___block_invoke;
  id v15 = &unk_1E615A648;
  SEL v17 = a2;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:&v12];

  if (v11) {
    objc_msgSend(v11, "getPasskeyAssertionRequestParametersForWebFrameIdentifier:completionHandler:", v7, v10, v12, v13, v14, v15);
  }
}

void __115__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForWebFrameIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPasskeyAssertionRequestParametersForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __118__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForApplicationIdentifier_completionHandler___block_invoke;
  id v15 = &unk_1E615A648;
  SEL v17 = a2;
  id v10 = v8;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:&v12];

  if (v11) {
    objc_msgSend(v11, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v7, v10, v12, v13, v14, v15);
  }
}

void __118__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v6 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __105__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler___block_invoke;
  uint64_t v12 = &unk_1E615A648;
  SEL v14 = a2;
  id v7 = v5;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:&v9];

  if (v8) {
    objc_msgSend(v8, "getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:", v7, v9, v10, v11, v12);
  }
}

void __105__WBSAuthenticationServicesAgentProxy_getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:(id)a3 orApplicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  SEL v17 = __138__WBSAuthenticationServicesAgentProxy_getIsPasskeyAssertionRequestRunningForWebFrameIdentifier_orApplicationIdentifier_completionHandler___block_invoke;
  id v18 = &unk_1E615A648;
  SEL v20 = a2;
  id v13 = v11;
  id v19 = v13;
  SEL v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  if (v14) {
    objc_msgSend(v14, "getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:orApplicationIdentifier:completionHandler:", v9, v10, v13, v15, v16, v17, v18);
  }
}

void __138__WBSAuthenticationServicesAgentProxy_getIsPasskeyAssertionRequestRunningForWebFrameIdentifier_orApplicationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didFillCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __135__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forHost_fromProviderWithBundleIdentifier_inAppWithBundleIdentifier___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a2;
  uint64_t v16 = [v15 remoteObjectProxyWithErrorHandler:v17];

  if (v16) {
    [v16 didFillCredentialForUsername:v11 forHost:v12 fromProviderWithBundleIdentifier:v13 inAppWithBundleIdentifier:v14];
  }
}

void __135__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forHost_fromProviderWithBundleIdentifier_inAppWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)didFillCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __138__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forURL_fromProviderWithBundleIdentifier_inBrowserWithBundleIdentifier___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a2;
  uint64_t v16 = [v15 remoteObjectProxyWithErrorHandler:v17];

  if (v16) {
    [v16 didFillCredentialForUsername:v11 forURL:v12 fromProviderWithBundleIdentifier:v13 inBrowserWithBundleIdentifier:v14];
  }
}

void __138__WBSAuthenticationServicesAgentProxy_didFillCredentialForUsername_forURL_fromProviderWithBundleIdentifier_inBrowserWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)isOrigin:(id)a3 relatedToRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(WBSAuthenticationServicesAgentProxy *)self connection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  SEL v17 = __98__WBSAuthenticationServicesAgentProxy_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke;
  id v18 = &unk_1E615A648;
  SEL v20 = a2;
  id v13 = v11;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:&v15];

  if (v14) {
    objc_msgSend(v14, "isOrigin:relatedToRelyingPartyIdentifier:completionHandler:", v9, v10, v13, v15, v16, v17, v18);
  }
}

void __98__WBSAuthenticationServicesAgentProxy_isOrigin_relatedToRelyingPartyIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newPasskeysAvailableForApplicationIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 141558530;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1B728F000, v6, OS_LOG_TYPE_INFO, "Notifying %{mask.hash}@ of new passkeys for %{public}@", (uint8_t *)&v7, 0x20u);
  }
  [WeakRetained newPasskeysAvailableForApplicationIdentifier:v4];
}

void __56__WBSAuthenticationServicesAgentProxy__setUpConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(v2);
    }
    [WeakRetained[1] invalidate];
    id v3 = WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSAuthenticationServicesAgentProxy;
  [(WBSAuthenticationServicesAgentProxy *)&v3 dealloc];
}

- (WBSAuthenticationServicesAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSAuthenticationServicesAgentDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end