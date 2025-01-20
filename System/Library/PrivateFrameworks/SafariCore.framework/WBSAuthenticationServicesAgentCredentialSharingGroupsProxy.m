@interface WBSAuthenticationServicesAgentCredentialSharingGroupsProxy
- (WBSAuthenticationServicesAgentCredentialSharingGroupsProxy)init;
- (id)connection;
- (void)_setUpConnection:(id)a3;
- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4;
- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3;
- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3;
- (void)groupsUpdatedWithInfos:(id)a3;
- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5;
- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4;
- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3;
- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3;
@end

@implementation WBSAuthenticationServicesAgentCredentialSharingGroupsProxy

- (WBSAuthenticationServicesAgentCredentialSharingGroupsProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBSAuthenticationServicesAgentCredentialSharingGroupsProxy;
  v2 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v2->_internalLock);
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.AuthenticationServices.CredentialSharingGroups" options:0];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)v3 _setUpConnection:v3->_connection];
    os_unfair_lock_unlock(&v3->_internalLock);
    v6 = v3;
  }

  return v3;
}

- (void)_setUpConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
  [v4 setRemoteObjectInterface:v5];

  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke;
  v11 = &unk_1E615A5D8;
  objc_copyWeak(&v12, &location);
  v6 = _Block_copy(&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v6, v8, v9, v10, v11);
  [v4 setInterruptionHandler:v6];
  v7 = WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:self];
  [v4 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(v2);
    }
    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&WeakRetained[2]._os_unfair_lock_opaque;
    *(void *)&WeakRetained[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 4);
  }
}

- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3
{
  id v5 = a3;
  v6 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  v7 = [v6 remoteObjectProxyWithErrorHandler:v9];

  if (v7)
  {
    [v7 notifyUserAboutSharedSavedAccountsInRecentlyDeleted:v5];
  }
  else
  {
    uint64_t v8 = (void (**)(id, void))v5;
    v8[2](v8, 0);
  }
}

void __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

uint64_t __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __125__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  v6 = [v5 remoteObjectProxyWithErrorHandler:v7];

  if (v6) {
    [v6 setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:v3];
  }
}

void __125__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke;
  v16 = &unk_1E615A648;
  SEL v18 = a2;
  id v10 = v8;
  id v17 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:&v13];

  if (v11)
  {
    objc_msgSend(v11, "leaveGroupWithID:completionHandler:", v7, v10, v13, v14, v15, v16);
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent", v13, v14, v15, v16);
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __98__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_deleteGroupWithID_completionHandler___block_invoke;
  v16 = &unk_1E615A648;
  SEL v18 = a2;
  id v10 = v8;
  id v17 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:&v13];

  if (v11)
  {
    objc_msgSend(v11, "deleteGroupWithID:completionHandler:", v7, v10, v13, v14, v15, v16);
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent", v13, v14, v15, v16);
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __98__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_deleteGroupWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(void))a5;
  v11 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __135__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler___block_invoke;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v13[4] = a2;
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v13];

  if (v12) {
    [v12 groupsUpdatedWithInfos:v9 shouldForceShowingNotifications:v6 completionHandler:v10];
  }
  else {
    v10[2](v10);
  }
}

void __135__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)groupsUpdatedWithInfos:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a2;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v8];

  if (v7) {
    [v7 groupsUpdatedWithInfos:v5 shouldForceShowingNotifications:0 completionHandler:&__block_literal_global_88];
  }
}

void __85__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);
  }
}

- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __105__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  uint64_t v13 = &unk_1E615A648;
  SEL v15 = a2;
  id v7 = v5;
  id v14 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:&v10];

  if (v8)
  {
    objc_msgSend(v8, "fetchSharingGroupsThatIncludeFamilyMembers:", v7, v10, v11, v12, v13);
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent", v10, v11, v12, v13);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

void __105__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent");
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
}

- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *)self connection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __121__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  uint64_t v13 = &unk_1E615A648;
  SEL v15 = a2;
  id v7 = v5;
  id v14 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:&v10];

  if (v8)
  {
    objc_msgSend(v8, "fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:", v7, v10, v11, v12, v13);
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent", v10, v11, v12, v13);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

void __121__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F281F8], 4099, @"Couldn't connect to AuthenticationServicesAgent");
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
}

- (id)connection
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  id v4 = self->_connection;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void).cxx_destruct
{
}

void __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Connection to AuthenticationServicesAgent closed", v1, 2u);
}

void __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_0(a1, a2);
  id v4 = (const char *)OUTLINED_FUNCTION_3();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

void __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5(a1, a2);
  id v4 = (const char *)OUTLINED_FUNCTION_3();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B728F000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

@end