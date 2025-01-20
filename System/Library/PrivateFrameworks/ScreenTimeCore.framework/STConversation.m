@interface STConversation
+ (void)requestConversationWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (BOOL)_doesContainAtLeastOneContactInHandles:(id)a3 contactsByHandle:(id)a4;
- (BOOL)_shouldGeneralScreenTimeAllowHandles:(id)a3 context:(id)a4;
- (BOOL)_shouldWhileLimitedAllowHandles:(id)a3 context:(id)a4;
- (BOOL)didFetchInitialApplicationState;
- (BOOL)didFetchInitialEmergencyModeState;
- (BOOL)didFetchInitialScreenTimePolicyState;
- (BOOL)didFetchInitialThirdPartyApplicationState;
- (BOOL)emergencyModeEnabled;
- (BOOL)isThirdPartyBundleIdentifier;
- (CNContactStore)contactStore;
- (CNDowntimeWhitelist)whitelist;
- (DMFApplicationPolicyMonitor)thirdPartyApplicationPolicyMonitor;
- (DMFCommunicationPolicyMonitor)communicationPolicyMonitor;
- (DMFEmergencyModeMonitor)emergencyModeMonitor;
- (NSString)bundleIdentifier;
- (NSString)processName;
- (STConversation)initWithBundleIdentifier:(id)a3;
- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4;
- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5;
- (STConversation)initWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (STConversation)me;
- (STManagementState)managementState;
- (id)_contactsByHandle:(id)a3 error:(id *)a4;
- (id)_filteredArrayForKnownHandlesInArray:(id)a3;
- (id)allowableByContactsHandles:(id)a3;
- (id)conversationCompletionHandler;
- (id)initSynchronouslyWithBundleIdentifier:(id)a3;
- (id)initSynchronouslyWithThirdPartyBundleIdentifier:(id)a3;
- (int)emergencyModeNotifyToken;
- (int)policyNotifyToken;
- (int64_t)currentThirdPartyApplicationState;
- (int64_t)generalScreenTimePolicy;
- (int64_t)whileLimitedPolicy;
- (unint64_t)currentApplicationState;
- (void)_contactStoreDidChange;
- (void)_currentApplicationStateDidChange;
- (void)_currentThirdPartyApplicationStateDidChange;
- (void)_emergencyModeDidChange;
- (void)_populateAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4;
- (void)_populateThirdPartyAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4;
- (void)_screenTimePolicyDidChange;
- (void)_stConversationCommonInitSetupObservationOfStateChanges;
- (void)_stConversationCommonInitWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5;
- (void)_stConversationCommonInitWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_updateAllContextsForNewWhileLimitedPolicyOrWhitelist;
- (void)_updateAllContextsUpdateGeneral:(BOOL)a3 updateLimited:(BOOL)a4 updateCurrentApplicationState:(BOOL)a5 updateAllowedByContactsHandle:(BOOL)a6 refreshContacts:(BOOL)a7 refreshWhitelist:(BOOL)a8 updateEmergencyMode:(BOOL)a9;
- (void)_updateAllThirdPartyContexts;
- (void)_updateContext:(id)a3 forHandles:(id)a4 updateGeneral:(BOOL)a5 updateLimited:(BOOL)a6 updateCurrentApplicationState:(BOOL)a7 updateAllowedByContactsHandle:(BOOL)a8 refreshContacts:(BOOL)a9 refreshWhitelist:(BOOL)a10 updateEmergencyMode:(BOOL)a11;
- (void)_updateThirdPartyContext:(id)a3 forHandles:(id)a4;
- (void)callCompletionHandlerIfNeededWithConversation:(id)a3 error:(id)a4;
- (void)callCompletionHandlerIfNeededWithThirdPartyConversation:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setCommunicationPolicyMonitor:(id)a3;
- (void)setConversationCompletionHandler:(id)a3;
- (void)setCurrentApplicationState:(unint64_t)a3;
- (void)setCurrentThirdPartyApplicationState:(int64_t)a3;
- (void)setDidFetchInitialApplicationState:(BOOL)a3;
- (void)setDidFetchInitialEmergencyModeState:(BOOL)a3;
- (void)setDidFetchInitialScreenTimePolicyState:(BOOL)a3;
- (void)setDidFetchInitialThirdPartyApplicationState:(BOOL)a3;
- (void)setEmergencyModeEnabled:(BOOL)a3;
- (void)setEmergencyModeMonitor:(id)a3;
- (void)setGeneralScreenTimePolicy:(int64_t)a3;
- (void)setManagementState:(id)a3;
- (void)setMe:(id)a3;
- (void)setThirdPartyApplicationPolicyMonitor:(id)a3;
- (void)setWhileLimitedPolicy:(int64_t)a3;
@end

@implementation STConversation

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
    v9 = +[STLog conversation];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v8 > 0.0;
      _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Fetched initial emergency mode status: %d", buf, 8u);
    }

    [*(id *)(a1 + 32) setEmergencyModeEnabled:v8 > 0.0];
    LOBYTE(v12) = 1;
    [*(id *)(a1 + 32) _updateAllContextsUpdateGeneral:1 updateLimited:1 updateCurrentApplicationState:0 updateAllowedByContactsHandle:1 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v12];
    id v10 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    [*(id *)(a1 + 32) setDidFetchInitialEmergencyModeState:1];
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:*(void *)(a1 + 32) error:0];
  }
  else
  {
    v11 = +[STLog conversation];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }

    id v10 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:0 error:v6];
  }
  objc_sync_exit(v10);
}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = +[STLog conversation];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();
    }

    id v10 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:0 error:v7];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = a2;
      __int16 v14 = 2048;
      uint64_t v15 = a3;
      _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Fetched initial communication policies. General policy: %lld. While limited policy: %lld.", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setGeneralScreenTimePolicy:a2];
    [*(id *)(a1 + 32) setWhileLimitedPolicy:a3];
    LOBYTE(v11) = 0;
    [*(id *)(a1 + 32) _updateAllContextsUpdateGeneral:1 updateLimited:1 updateCurrentApplicationState:0 updateAllowedByContactsHandle:1 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v11];
    id v10 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v10);
    [*(id *)(a1 + 32) setDidFetchInitialScreenTimePolicyState:1];
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:*(void *)(a1 + 32) error:0];
  }
  objc_sync_exit(v10);
}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    double v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 unsignedIntegerValue];
      id v10 = +[STLog conversation];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %lu", buf, 0x16u);
      }

      [*(id *)(a1 + 32) setCurrentApplicationState:v9];
      LOBYTE(v16) = 0;
      [*(id *)(a1 + 32) _updateAllContextsUpdateGeneral:0 updateLimited:0 updateCurrentApplicationState:1 updateAllowedByContactsHandle:1 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v16];
    }
    else
    {
      __int16 v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_80_cold_2(a1 + 40, a1);
      }
    }
    id v15 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v15);
    [*(id *)(a1 + 32) setDidFetchInitialApplicationState:1];
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:*(void *)(a1 + 32) error:0];
    objc_sync_exit(v15);

    id v13 = v8;
  }
  else
  {
    uint64_t v12 = +[STLog conversation];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }

    id v13 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v13);
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithConversation:0 error:v6];
    objc_sync_exit(v13);
  }
}

- (void)callCompletionHandlerIfNeededWithConversation:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(STConversation *)self conversationCompletionHandler];

  if (v7
    && (!v9
     || [(STConversation *)self didFetchInitialScreenTimePolicyState]
     && [(STConversation *)self didFetchInitialApplicationState]
     && [(STConversation *)self didFetchInitialEmergencyModeState]))
  {
    double v8 = [(STConversation *)self conversationCompletionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    [(STConversation *)self setConversationCompletionHandler:0];
    [(STConversation *)self setMe:0];
  }
}

- (id)conversationCompletionHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setWhileLimitedPolicy:(int64_t)a3
{
  self->_whileLimitedPolicy = a3;
}

- (void)setGeneralScreenTimePolicy:(int64_t)a3
{
  self->_generalScreenTimePolicy = a3;
}

- (void)setEmergencyModeEnabled:(BOOL)a3
{
  self->_emergencyModeEnabled = a3;
}

- (void)setDidFetchInitialScreenTimePolicyState:(BOOL)a3
{
  self->_didFetchInitialScreenTimePolicyState = a3;
}

- (void)setDidFetchInitialEmergencyModeState:(BOOL)a3
{
  self->_didFetchInitialEmergencyModeState = a3;
}

- (void)setDidFetchInitialApplicationState:(BOOL)a3
{
  self->_didFetchInitialApplicationState = a3;
}

- (void)setCurrentApplicationState:(unint64_t)a3
{
  self->_currentApplicationState = a3;
}

- (void)_updateAllContextsUpdateGeneral:(BOOL)a3 updateLimited:(BOOL)a4 updateCurrentApplicationState:(BOOL)a5 updateAllowedByContactsHandle:(BOOL)a6 refreshContacts:(BOOL)a7 refreshWhitelist:(BOOL)a8 updateEmergencyMode:(BOOL)a9
{
  BOOL v22 = a5;
  BOOL v23 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  obj = self->_contextByHandles;
  objc_sync_enter(obj);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = self->_contextByHandles;
  uint64_t v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v17 = [(NSMapTable *)self->_contextByHandles objectForKey:v16];
        if (v17)
        {
          BYTE2(v20) = a9;
          BYTE1(v20) = a8;
          LOBYTE(v20) = a7;
          -[STConversation _updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:](self, "_updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", v17, v16, v10, v9, v22, v23, v20);
        }
      }
      uint64_t v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  uint64_t v18 = [(STConversation *)self processName];
  int v19 = [v18 isEqualToString:@"suggestd"];

  if (v19) {
    notify_post("com.apple.ScreenTime.ConversationDidObserveChangesNotification");
  }
  objc_sync_exit(obj);
}

- (id)allowableByContactsHandles:(id)a3
{
  id v4 = a3;
  id v5 = self->_contextByHandles;
  objc_sync_enter(v5);
  id v6 = [(NSMapTable *)self->_contextByHandles objectForKey:v4];
  if (!v6)
  {
    id v6 = objc_opt_new();
    if ([(STConversation *)self isThirdPartyBundleIdentifier])
    {
      [(STConversation *)self _updateThirdPartyContext:v6 forHandles:v4];
    }
    else
    {
      BYTE2(v8) = 0;
      LOWORD(v8) = 0;
      -[STConversation _updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:](self, "_updateContext:forHandles:updateGeneral:updateLimited:updateCurrentApplicationState:updateAllowedByContactsHandle:refreshContacts:refreshWhitelist:updateEmergencyMode:", v6, v4, 1, 1, 0, 1, v8);
    }
    [(NSMapTable *)self->_contextByHandles setObject:v6 forKey:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isThirdPartyBundleIdentifier
{
  return self->_isThirdPartyBundleIdentifier;
}

- (BOOL)_shouldGeneralScreenTimeAllowHandles:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(STConversation *)self generalScreenTimePolicy];
  if (v8)
  {
    int64_t v9 = v8;
    uint64_t v10 = [v7 contactsByHandle];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
    }
    else
    {
      id v27 = 0;
      uint64_t v11 = [(STConversation *)self _contactsByHandle:v6 error:&v27];
      id v12 = v27;
      if (!v11)
      {
        uint64_t v11 = +[STLog conversation];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[STConversation _shouldGeneralScreenTimeAllowHandles:context:](v6);
        }
        goto LABEL_25;
      }
    }
    [v7 setContactsByHandle:v11];
    if (v9 == 1)
    {
      BOOL v13 = [(STConversation *)self _doesContainAtLeastOneContactInHandles:v6 contactsByHandle:v11];
LABEL_26:

      goto LABEL_27;
    }
    if (v9 == 2)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = v6;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            int v19 = -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
            uint64_t v20 = [v19 count];

            if (!v20)
            {
              BOOL v13 = 0;
              goto LABEL_22;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      BOOL v13 = 1;
LABEL_22:

      goto LABEL_26;
    }
    uint64_t v21 = +[STLog conversation];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[STConversation _shouldGeneralScreenTimeAllowHandles:context:]();
    }

LABEL_25:
    BOOL v13 = 1;
    goto LABEL_26;
  }
  BOOL v13 = 1;
LABEL_27:

  return v13;
}

- (void)_updateContext:(id)a3 forHandles:(id)a4 updateGeneral:(BOOL)a5 updateLimited:(BOOL)a6 updateCurrentApplicationState:(BOOL)a7 updateAllowedByContactsHandle:(BOOL)a8 refreshContacts:(BOOL)a9 refreshWhitelist:(BOOL)a10 updateEmergencyMode:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v13 = a6;
  BOOL v14 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v44 = a4;
  int v18 = [v17 allowedByScreenTime];
  int v41 = [v17 applicationCurrentlyLimited];
  int v40 = [v17 shouldBeAllowedByScreenTimeWhenLimited];
  int v39 = [v17 emergencyModeEnabled];
  int v19 = [v17 allowedByContactsHandle];
  v43 = (void *)[v19 copy];

  if (a9) {
    [v17 setContactsByHandle:0];
  }
  if (a10) {
    [v17 setWhitelistedHandles:0];
  }
  uint64_t v20 = [v17 shouldBeAllowedDuringGeneralScreenTime];
  uint64_t v21 = [v17 shouldBeAllowedByScreenTimeWhenLimited];
  BOOL v22 = v44;
  if ([(STConversation *)self emergencyModeEnabled])
  {
    uint64_t v20 = 1;
    uint64_t v21 = 1;
    goto LABEL_18;
  }
  int v23 = !v13;
  if (v14 && (v23 & 1) == 0)
  {
    uint64_t v20 = [(STConversation *)self _shouldGeneralScreenTimeAllowHandles:v44 context:v17];
LABEL_12:
    int64_t v24 = [(STConversation *)self generalScreenTimePolicy];
    if (v24 == [(STConversation *)self whileLimitedPolicy]) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = [(STConversation *)self _shouldWhileLimitedAllowHandles:v44 context:v17];
    }
    goto LABEL_18;
  }
  if (!v14 || v13)
  {
    if ((v23 | v14)) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  int64_t v25 = [(STConversation *)self generalScreenTimePolicy];
  if (v25 == [(STConversation *)self whileLimitedPolicy]) {
    uint64_t v20 = v21;
  }
  else {
    uint64_t v20 = [(STConversation *)self _shouldGeneralScreenTimeAllowHandles:v44 context:v17];
  }
LABEL_18:
  if (a7 || a11 || v13 || v14) {
    objc_msgSend(v17, "updateShouldBeAllowedDuringGeneralScreenTime:shouldBeAllowedByScreenTimeWhenLimited:currentApplicationState:emergencyModeEnabled:", v20, v21, -[STConversation currentApplicationState](self, "currentApplicationState"), -[STConversation emergencyModeEnabled](self, "emergencyModeEnabled"));
  }
  if (v11) {
    [(STConversation *)self _populateAllowedContactsByHandlesForContactHandles:v44 context:v17];
  }
  int v26 = [v17 allowedByScreenTime];
  int v27 = [v17 applicationCurrentlyLimited];
  int v28 = [v17 shouldBeAllowedByScreenTimeWhenLimited];
  int v29 = [v17 emergencyModeEnabled];
  v30 = [v17 allowedByContactsHandle];
  if (v18 != v26
    || ((v41 ^ v27) & 1) != 0
    || ((v40 ^ v28) & 1) != 0
    || ((v39 ^ v29) & 1) != 0
    || ([v43 isEqualToDictionary:v30] & 1) == 0)
  {
    uint64_t v31 = +[STLog conversation];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(STConversation *)self bundleIdentifier];
      int64_t v42 = [(STConversation *)self generalScreenTimePolicy];
      int64_t v33 = [(STConversation *)self whileLimitedPolicy];
      int v34 = [v17 allowedByScreenTime];
      int v35 = [v17 applicationCurrentlyLimited];
      int v36 = [v17 shouldBeAllowedByScreenTimeWhenLimited];
      int v37 = [v17 emergencyModeEnabled];
      v38 = [v17 allowedByContactsHandle];
      *(_DWORD *)buf = 138545411;
      v46 = v32;
      __int16 v47 = 2113;
      id v48 = v44;
      __int16 v49 = 2048;
      int64_t v50 = v42;
      __int16 v51 = 2048;
      int64_t v52 = v33;
      __int16 v53 = 1024;
      int v54 = v34;
      __int16 v55 = 1024;
      int v56 = v35;
      __int16 v57 = 1024;
      int v58 = v36;
      __int16 v59 = 1024;
      int v60 = v37;
      __int16 v61 = 2113;
      v62 = v38;
      _os_log_impl(&dword_1DA519000, v31, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ context for handles:%{private}@. General policy: %lld. While limited policy: %lld. allowedByScreenTime:%d applicationCurrentlyLimited:%d shouldBeAllowedByScreenTimeWhenLimited:%d emergencyModeEnabled:%d allowedByContactsHandle:%{private}@", buf, 0x4Cu);
    }
    BOOL v22 = v44;
  }
}

- (int64_t)generalScreenTimePolicy
{
  return self->_generalScreenTimePolicy;
}

- (int64_t)whileLimitedPolicy
{
  return self->_whileLimitedPolicy;
}

- (BOOL)emergencyModeEnabled
{
  return self->_emergencyModeEnabled;
}

- (void)_populateAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(STConversation *)self whileLimitedPolicy];
  int v9 = [v7 allowedByScreenTime];
  int v35 = [v7 contactsByHandle];
  int64_t v33 = v7;
  uint64_t v10 = [v7 whitelistedHandles];
  unint64_t v11 = [(STConversation *)self currentApplicationState];
  unint64_t v12 = v11;
  BOOL v14 = v11 == 1 && v8 == 3;
  BOOL v37 = v14;
  BOOL v15 = !v11 && [(STConversation *)self generalScreenTimePolicy] == 1 || v12 == 1 && v8 == 1;
  BOOL v36 = v15;
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v6;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    uint64_t v22 = MEMORY[0x1E4F1CC38];
    unint64_t v34 = v12;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
        if (v9)
        {
          int64_t v25 = v17;
          uint64_t v26 = v22;
LABEL_25:
          [v25 setObject:v26 forKeyedSubscript:*(void *)(*((void *)&v38 + 1) + 8 * v23)];
          goto LABEL_26;
        }
        if (v12 == 2) {
          goto LABEL_24;
        }
        if (v37)
        {
          int v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "containsObject:", *(void *)(*((void *)&v38 + 1) + 8 * v23)));
          [v17 setObject:v27 forKeyedSubscript:v24];

          uint64_t v22 = MEMORY[0x1E4F1CC38];
        }
        else
        {
          if (v36)
          {
LABEL_24:
            int64_t v25 = v17;
            uint64_t v26 = MEMORY[0x1E4F1CC28];
            goto LABEL_25;
          }
          int v28 = NSNumber;
          [v35 objectForKeyedSubscript:v24];
          v30 = int v29 = v10;
          uint64_t v31 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "count") != 0);
          [v17 setObject:v31 forKeyedSubscript:v24];

          uint64_t v22 = MEMORY[0x1E4F1CC38];
          uint64_t v10 = v29;
          unint64_t v12 = v34;
        }
LABEL_26:
        ++v23;
      }
      while (v20 != v23);
      uint64_t v32 = [v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
      uint64_t v20 = v32;
    }
    while (v32);
  }

  [v33 setAllowedByContactsHandle:v17];
}

- (unint64_t)currentApplicationState
{
  return self->_currentApplicationState;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (STConversation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5F3A8] communicationBundleIdentifiers];
  if ([v5 containsObject:v4])
  {
    id v6 = objc_opt_new();
    id v7 = [(STConversation *)self initWithBundleIdentifier:v4 contactStore:v6];
  }
  else
  {
    id v7 = [(STConversation *)self initWithThirdPartyBundleIdentifier:v4 completionHandler:0];
  }

  return v7;
}

- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F5F3A8];
  id v8 = a3;
  int v9 = [v7 communicationBundleIdentifiers];
  if ([v9 containsObject:v8]) {
    uint64_t v10 = [(STConversation *)self initWithBundleIdentifier:v8 contactStore:v6 completionHandler:0];
  }
  else {
    uint64_t v10 = [(STConversation *)self initWithThirdPartyBundleIdentifier:v8 completionHandler:0];
  }
  unint64_t v11 = v10;

  unint64_t v12 = v11;
  return v12;
}

- (STConversation)initWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)STConversation;
  id v9 = a5;
  id v10 = a4;
  unint64_t v11 = [(STConversation *)&v33 init];
  unint64_t v12 = +[STLog conversation];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v8;
    _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_DEFAULT, "Initializing STConversation asynchronously for bundle identifier: %{public}@", buf, 0xCu);
  }

  [(STConversation *)v11 _stConversationCommonInitWithBundleIdentifier:v8 contactStore:v10 completionHandler:v9];
  managementState = v11->_managementState;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke;
  v31[3] = &unk_1E6BC7600;
  BOOL v14 = v11;
  uint64_t v32 = v14;
  [(STManagementState *)managementState communicationPoliciesWithCompletionHandler:v31];
  communicationPolicyMonitor = v14->_communicationPolicyMonitor;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_80;
  v28[3] = &unk_1E6BC7628;
  uint64_t v16 = v14;
  int v29 = v16;
  id v30 = v8;
  id v17 = v8;
  [(DMFCommunicationPolicyMonitor *)communicationPolicyMonitor requestPoliciesByBundleIdentifierWithCompletionHandler:v28];
  emergencyModeMonitor = v16->_emergencyModeMonitor;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  int64_t v25 = __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_82;
  uint64_t v26 = &unk_1E6BC7650;
  uint64_t v19 = v16;
  int v27 = v19;
  [(DMFEmergencyModeMonitor *)emergencyModeMonitor emergencyModeStatusWithCompletionHandler:&v23];
  [(STConversation *)v19 _stConversationCommonInitSetupObservationOfStateChanges];
  uint64_t v20 = v27;
  uint64_t v21 = v19;

  return v21;
}

- (void)_stConversationCommonInitWithBundleIdentifier:(id)a3 contactStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_contactStore, a4);
  unint64_t v11 = (CNDowntimeWhitelist *)[objc_alloc(MEMORY[0x1E4F1B9C8]) initWithContactStore:self->_contactStore];
  whitelist = self->_whitelist;
  self->_whitelist = v11;

  BOOL v13 = (NSString *)[v8 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v13;

  BOOL v15 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v16 = [v15 processName];
  processName = self->_processName;
  self->_processName = v16;

  id v18 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  contextByHandles = self->_contextByHandles;
  self->_contextByHandles = v18;

  uint64_t v20 = objc_opt_new();
  didFetchInitialStateLock = self->_didFetchInitialStateLock;
  self->_didFetchInitialStateLock = v20;

  uint64_t v22 = (STManagementState *)objc_opt_new();
  managementState = self->_managementState;
  self->_managementState = v22;

  objc_initWeak(&location, self);
  id v24 = objc_alloc(MEMORY[0x1E4F5F3A8]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __95__STConversation__stConversationCommonInitWithBundleIdentifier_contactStore_completionHandler___block_invoke;
  v31[3] = &unk_1E6BC7678;
  objc_copyWeak(&v32, &location);
  int64_t v25 = (DMFCommunicationPolicyMonitor *)[v24 initWithPolicyChangeHandler:v31];
  communicationPolicyMonitor = self->_communicationPolicyMonitor;
  self->_communicationPolicyMonitor = v25;

  int v27 = (DMFEmergencyModeMonitor *)objc_opt_new();
  emergencyModeMonitor = self->_emergencyModeMonitor;
  self->_emergencyModeMonitor = v27;

  int v29 = _Block_copy(v10);
  id conversationCompletionHandler = self->_conversationCompletionHandler;
  self->_id conversationCompletionHandler = v29;

  self->_generalScreenTimePolicy = 0;
  self->_whileLimitedPolicy = 0;
  self->_currentApplicationState = 0;
  self->_emergencyModeEnabled = 1;
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)_stConversationCommonInitSetupObservationOfStateChanges
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

  id v5 = [NSString stringWithFormat:@"com.apple.ScreenTimeAgent.%@.conversation", self->_bundleIdentifier];
  id v6 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], v4);
  stateChangeQueue = self->_stateChangeQueue;
  self->_stateChangeQueue = v6;

  objc_initWeak(&location, self);
  id v8 = self->_stateChangeQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke;
  handler[3] = &unk_1E6BC76A0;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.ScreenTimeAgent.SettingsDidChangeNotification", &self->_policyNotifyToken, v8, handler);
  id v9 = (const char *)[(id)*MEMORY[0x1E4F5F398] UTF8String];
  id v10 = self->_stateChangeQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke_2;
  v12[3] = &unk_1E6BC76A0;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v9, &self->_emergencyModeNotifyToken, v10, v12);
  unint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__updateAllContextsForNewWhileLimitedPolicyOrWhitelist name:*MEMORY[0x1E4F1AFD0] object:0];
  [v11 addObserver:self selector:sel__contactStoreDidChange name:*MEMORY[0x1E4F1AF80] object:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)initSynchronouslyWithBundleIdentifier:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.ScreenTimeAgent"];
    if (![v5 BOOLForKey:@"ScreenTimeEnabled"])
    {
      id v18 = +[STLog conversation];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v43 = (uint64_t)v4;
        _os_log_impl(&dword_1DA519000, v18, OS_LOG_TYPE_DEFAULT, "Returning STConversation early since Screen Time is OFF. Initializing STConversation asynchronously for bundle identifier: %{public}@", buf, 0xCu);
      }

      id v17 = [(STConversation *)self initWithBundleIdentifier:v4];
      goto LABEL_15;
    }
  }
  id v5 = [MEMORY[0x1E4F5F3A8] communicationBundleIdentifiers];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    id v17 = [(STConversation *)self initSynchronouslyWithThirdPartyBundleIdentifier:v4];
LABEL_15:
    uint64_t v19 = v17;
    goto LABEL_37;
  }
  v41.receiver = self;
  v41.super_class = (Class)STConversation;
  id v6 = [(STConversation *)&v41 init];
  id v7 = +[STLog conversation];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = (uint64_t)v4;
    _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Initializing STConversation synchronously for bundle identifier: %{public}@", buf, 0xCu);
  }

  id v8 = objc_opt_new();
  [(STConversation *)v6 _stConversationCommonInitWithBundleIdentifier:v4 contactStore:v8 completionHandler:0];

  managementState = v6->_managementState;
  id v40 = 0;
  id v10 = [(STManagementState *)managementState communicationPoliciesWithError:&v40];
  id v11 = v40;
  if (v10)
  {
    unint64_t v12 = [v10 objectForKeyedSubscript:0x1F348F2C0];
    uint64_t v13 = [v12 longLongValue];

    BOOL v14 = [v10 objectForKeyedSubscript:0x1F348F2E0];
    uint64_t v15 = [v14 longLongValue];

    uint64_t v16 = +[STLog conversation];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v13;
      __int16 v44 = 2048;
      uint64_t v45 = v15;
      _os_log_impl(&dword_1DA519000, v16, OS_LOG_TYPE_DEFAULT, "Fetched initial communication policies. General policy: %lld. While limited policy: %lld.", buf, 0x16u);
    }

    v6->_generalScreenTimePolicy = v13;
    v6->_whileLimitedPolicy = v15;
  }
  else
  {
    uint64_t v20 = +[STLog conversation];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();
    }
  }
  communicationPolicyMonitor = v6->_communicationPolicyMonitor;
  id v39 = v11;
  uint64_t v22 = [(DMFCommunicationPolicyMonitor *)communicationPolicyMonitor requestPoliciesByBundleIdentifierWithError:&v39];
  id v23 = v39;

  if (v22)
  {
    id v24 = [v22 objectForKeyedSubscript:v4];
    int64_t v25 = v24;
    if (v24)
    {
      uint64_t v26 = [v24 unsignedIntegerValue];
      int v27 = +[STLog conversation];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = (uint64_t)v4;
        __int16 v44 = 2048;
        uint64_t v45 = v26;
        _os_log_impl(&dword_1DA519000, v27, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %lu", buf, 0x16u);
      }

      v6->_currentApplicationState = v26;
    }
    else
    {
      int v28 = +[STLog conversation];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[STConversation initSynchronouslyWithBundleIdentifier:]();
      }
    }
  }
  else
  {
    int64_t v25 = +[STLog conversation];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }
  }

  emergencyModeMonitor = v6->_emergencyModeMonitor;
  id v38 = v23;
  id v30 = [(DMFEmergencyModeMonitor *)emergencyModeMonitor emergencyModeStatusWithError:&v38];
  id v31 = v38;

  if (v30)
  {
    [v30 doubleValue];
    double v33 = v32;
    BOOL v34 = v32 > 0.0;
    id v35 = +[STLog conversation];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v33 > 0.0;
      _os_log_impl(&dword_1DA519000, v35, OS_LOG_TYPE_DEFAULT, "Fetched initial emergency mode status: %d", buf, 8u);
    }

    v6->_emergencyModeEnabled = v34;
  }
  else
  {
    uint64_t v36 = +[STLog conversation];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }
  }
  [(STConversation *)v6 _stConversationCommonInitSetupObservationOfStateChanges];
  uint64_t v19 = v6;

LABEL_37:
  return v19;
}

- (id)initSynchronouslyWithThirdPartyBundleIdentifier:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STConversation;
  id v5 = [(STConversation *)&v19 init];
  id v6 = +[STLog conversation];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "Initializing STConversation synchronously for third party bundle identifier: %{public}@", buf, 0xCu);
  }

  [(STConversation *)v5 _stConversationCommonInitWithThirdPartyBundleIdentifier:v4 completionHandler:0];
  thirdPartyApplicationPolicyMonitor = v5->_thirdPartyApplicationPolicyMonitor;
  v24[0] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v18 = 0;
  id v9 = [(DMFApplicationPolicyMonitor *)thirdPartyApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:v8 withError:&v18];
  id v10 = v18;

  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:v4];
    unint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 integerValue];
      BOOL v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = v4;
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %ld", buf, 0x16u);
      }

      v5->_currentThirdPartyApplicationState = v13;
    }
    else
    {
      uint64_t v15 = +[STLog conversation];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:]();
      }
    }
  }
  else
  {
    unint64_t v12 = +[STLog conversation];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:]();
    }
  }

  uint64_t v16 = v5;
  return v16;
}

- (STConversation)initWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STConversation;
  id v7 = a4;
  id v8 = [(STConversation *)&v20 init];
  id v9 = +[STLog conversation];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Initializing STConversation asynchronously for third party bundle identifier: %{public}@", buf, 0xCu);
  }

  [(STConversation *)v8 _stConversationCommonInitWithThirdPartyBundleIdentifier:v6 completionHandler:v7];
  thirdPartyApplicationPolicyMonitor = v8->_thirdPartyApplicationPolicyMonitor;
  id v21 = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E6BC7628;
  unint64_t v12 = v8;
  id v18 = v12;
  id v19 = v6;
  id v13 = v6;
  [(DMFApplicationPolicyMonitor *)thirdPartyApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:v11 completionHandler:v17];

  BOOL v14 = v19;
  uint64_t v15 = v12;

  return v15;
}

void __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 integerValue];
      id v10 = +[STLog conversation];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v16 = 138543618;
        uint64_t v17 = v11;
        __int16 v18 = 2048;
        uint64_t v19 = v9;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Fetched initial %{public}@ application state: %ld", (uint8_t *)&v16, 0x16u);
      }

      [*(id *)(a1 + 32) setCurrentThirdPartyApplicationState:v9];
      [*(id *)(a1 + 32) _updateAllThirdPartyContexts];
    }
    else
    {
      BOOL v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke_cold_2(a1 + 40, a1);
      }
    }
    id v15 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v15);
    [*(id *)(a1 + 32) setDidFetchInitialThirdPartyApplicationState:1];
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithThirdPartyConversation:*(void *)(a1 + 32) error:0];
    objc_sync_exit(v15);

    id v13 = v8;
  }
  else
  {
    unint64_t v12 = +[STLog conversation];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:]();
    }

    id v13 = *(id *)(*(void *)(a1 + 32) + 24);
    objc_sync_enter(v13);
    [*(id *)(a1 + 32) callCompletionHandlerIfNeededWithThirdPartyConversation:0 error:v6];
    objc_sync_exit(v13);
  }
}

void __95__STConversation__stConversationCommonInitWithBundleIdentifier_contactStore_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _currentApplicationStateDidChange];
}

void __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _screenTimePolicyDidChange];
}

void __73__STConversation__stConversationCommonInitSetupObservationOfStateChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _emergencyModeDidChange];
}

- (void)_stConversationCommonInitWithThirdPartyBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSString *)[v6 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v8;

  id v10 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v11 = [v10 processName];
  processName = self->_processName;
  self->_processName = v11;

  self->_isThirdPartyBundleIdentifier = 1;
  id v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  contextByHandles = self->_contextByHandles;
  self->_contextByHandles = v13;

  id v15 = objc_opt_new();
  didFetchInitialStateLock = self->_didFetchInitialStateLock;
  self->_didFetchInitialStateLock = v15;

  objc_initWeak(&location, self);
  id v17 = objc_alloc(MEMORY[0x1E4F5F3A0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__STConversation__stConversationCommonInitWithThirdPartyBundleIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_1E6BC7678;
  objc_copyWeak(&v23, &location);
  __int16 v18 = (DMFApplicationPolicyMonitor *)[v17 initWithPolicyChangeHandler:v22];
  thirdPartyApplicationPolicyMonitor = self->_thirdPartyApplicationPolicyMonitor;
  self->_thirdPartyApplicationPolicyMonitor = v18;

  uint64_t v20 = _Block_copy(v7);
  id conversationCompletionHandler = self->_conversationCompletionHandler;
  self->_id conversationCompletionHandler = v20;

  self->_currentThirdPartyApplicationState = 0;
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __92__STConversation__stConversationCommonInitWithThirdPartyBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _currentThirdPartyApplicationStateDidChange];
}

+ (void)requestConversationWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F5F3A8];
  id v7 = a4;
  id v8 = [v6 communicationBundleIdentifiers];
  LOBYTE(v6) = [v8 containsObject:v13];
  id v9 = objc_alloc((Class)a1);
  id v10 = v9;
  if (v6)
  {
    uint64_t v11 = objc_opt_new();
    unint64_t v12 = (void *)[v10 initWithBundleIdentifier:v13 contactStore:v11 completionHandler:v7];

    id v7 = (id)v11;
  }
  else
  {
    unint64_t v12 = (void *)[v9 initWithThirdPartyBundleIdentifier:v13 completionHandler:v7];
  }

  [v12 setMe:v12];
}

- (void)callCompletionHandlerIfNeededWithThirdPartyConversation:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(STConversation *)self conversationCompletionHandler];

  if (v7
    && (!v9
     || [(STConversation *)self didFetchInitialThirdPartyApplicationState]))
  {
    id v8 = [(STConversation *)self conversationCompletionHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    [(STConversation *)self setConversationCompletionHandler:0];
    [(STConversation *)self setMe:0];
  }
}

- (void)dealloc
{
  notify_cancel(self->_policyNotifyToken);
  notify_cancel(self->_emergencyModeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STConversation;
  [(STConversation *)&v3 dealloc];
}

- (void)_updateThirdPartyContext:(id)a3 forHandles:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 allowedByScreenTime];
  objc_msgSend(v6, "updateForThirdPartyApplicationState:", -[STConversation currentThirdPartyApplicationState](self, "currentThirdPartyApplicationState"));
  [(STConversation *)self _populateThirdPartyAllowedContactsByHandlesForContactHandles:v7 context:v6];
  if (v8 != [v6 allowedByScreenTime])
  {
    id v9 = +[STLog conversation];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(STConversation *)self bundleIdentifier];
      int v11 = [v6 allowedByScreenTime];
      unint64_t v12 = [v6 allowedByContactsHandle];
      int v13 = 138544131;
      BOOL v14 = v10;
      __int16 v15 = 2113;
      id v16 = v7;
      __int16 v17 = 1024;
      int v18 = v11;
      __int16 v19 = 2113;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Updated %{public}@ third party context for handles:%{private}@. allowedByScreenTime:%d allowedByContactsHandle:%{private}@", (uint8_t *)&v13, 0x26u);
    }
  }
}

- (void)_updateAllThirdPartyContexts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = self->_contextByHandles;
  objc_sync_enter(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_contextByHandles;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = -[NSMapTable objectForKey:](self->_contextByHandles, "objectForKey:", v8, (void)v12);
        if (v9) {
          [(STConversation *)self _updateThirdPartyContext:v9 forHandles:v8];
        }
      }
      uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v10 = [(STConversation *)self processName];
  int v11 = [v10 isEqualToString:@"suggestd"];

  if (v11) {
    notify_post("com.apple.ScreenTime.ConversationDidObserveChangesNotification");
  }
  objc_sync_exit(v3);
}

- (void)_screenTimePolicyDidChange
{
  objc_super v3 = [(STConversation *)self managementState];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__STConversation__screenTimePolicyDidChange__block_invoke;
  v4[3] = &unk_1E6BC7600;
  v4[4] = self;
  [v3 communicationPoliciesWithCompletionHandler:v4];
}

void __44__STConversation__screenTimePolicyDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[STLog conversation];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:].cold.4();
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) generalScreenTimePolicy];
    uint64_t v10 = [*(id *)(a1 + 32) whileLimitedPolicy];
    uint64_t v11 = v10;
    if (v9 == a2)
    {
      if (v10 != a3)
      {
        long long v12 = +[STLog conversation];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*(id *)(a1 + 32) whileLimitedPolicy];
          *(_DWORD *)buf = 134218240;
          uint64_t v23 = v13;
          __int16 v24 = 2048;
          uint64_t v25 = a3;
          _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_DEFAULT, "While limited policy changed from %lld to %lld.", buf, 0x16u);
        }

        [*(id *)(a1 + 32) setWhileLimitedPolicy:a3];
        [*(id *)(a1 + 32) _updateAllContextsForNewWhileLimitedPolicyOrWhitelist];
      }
    }
    else
    {
      long long v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 32) generalScreenTimePolicy];
        *(_DWORD *)buf = 134218240;
        uint64_t v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = a2;
        _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_DEFAULT, "General policy changed from %lld to %lld.", buf, 0x16u);
      }

      [*(id *)(a1 + 32) setGeneralScreenTimePolicy:a2];
      if (v11 == a3)
      {
        BOOL v16 = [*(id *)(a1 + 32) currentApplicationState] == 0;
        uint64_t v17 = *(void **)(a1 + 32);
        LOBYTE(v21) = 0;
        uint64_t v18 = 0;
      }
      else
      {
        __int16 v19 = +[STLog conversation];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [*(id *)(a1 + 32) whileLimitedPolicy];
          *(_DWORD *)buf = 134218240;
          uint64_t v23 = v20;
          __int16 v24 = 2048;
          uint64_t v25 = a3;
          _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_DEFAULT, "While limited policy changed from %lld to %lld.", buf, 0x16u);
        }

        [*(id *)(a1 + 32) setWhileLimitedPolicy:a3];
        BOOL v16 = [*(id *)(a1 + 32) currentApplicationState] != 2;
        uint64_t v17 = *(void **)(a1 + 32);
        LOBYTE(v21) = 0;
        uint64_t v18 = 1;
      }
      [v17 _updateAllContextsUpdateGeneral:1 updateLimited:v18 updateCurrentApplicationState:0 updateAllowedByContactsHandle:v16 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v21];
    }
  }
}

- (void)_updateAllContextsForNewWhileLimitedPolicyOrWhitelist
{
  objc_initWeak(&location, self);
  stateChangeQueue = self->_stateChangeQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__STConversation__updateAllContextsForNewWhileLimitedPolicyOrWhitelist__block_invoke;
  v4[3] = &unk_1E6BC7678;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateChangeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__STConversation__updateAllContextsForNewWhileLimitedPolicyOrWhitelist__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained currentApplicationState] == 1;

  id v5 = objc_loadWeakRetained(v1);
  LOBYTE(v4) = 0;
  [v5 _updateAllContextsUpdateGeneral:0 updateLimited:1 updateCurrentApplicationState:0 updateAllowedByContactsHandle:v3 refreshContacts:0 refreshWhitelist:1 updateEmergencyMode:v4];
}

- (void)_contactStoreDidChange
{
  objc_initWeak(&location, self);
  stateChangeQueue = self->_stateChangeQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__STConversation__contactStoreDidChange__block_invoke;
  v4[3] = &unk_1E6BC7678;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateChangeQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__STConversation__contactStoreDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LOBYTE(v1) = 0;
  [WeakRetained _updateAllContextsUpdateGeneral:1 updateLimited:1 updateCurrentApplicationState:0 updateAllowedByContactsHandle:1 refreshContacts:1 refreshWhitelist:1 updateEmergencyMode:v1];
}

- (void)_currentApplicationStateDidChange
{
  BOOL v3 = [(STConversation *)self communicationPolicyMonitor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__STConversation__currentApplicationStateDidChange__block_invoke;
  v4[3] = &unk_1E6BC76C8;
  void v4[4] = self;
  [v3 requestPoliciesByBundleIdentifierWithCompletionHandler:v4];
}

void __51__STConversation__currentApplicationStateDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v7 = (id *)(a1 + 32);
    uint64_t v9 = [v8 bundleIdentifier];
    uint64_t v10 = [v5 objectForKeyedSubscript:v9];

    if (v10)
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      if ([*v7 currentApplicationState] != v11)
      {
        long long v12 = +[STLog conversation];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*v7 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v17 = v13;
          __int16 v18 = 2048;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ application state changed to %lu", buf, 0x16u);
        }
        [*v7 setCurrentApplicationState:v11];
        LOBYTE(v15) = 0;
        [*v7 _updateAllContextsUpdateGeneral:0 updateLimited:0 updateCurrentApplicationState:1 updateAllowedByContactsHandle:1 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v15];
      }
    }
    else
    {
      long long v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __51__STConversation__currentApplicationStateDidChange__block_invoke_cold_2(v7);
      }
    }
  }
  else
  {
    uint64_t v10 = +[STLog conversation];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }
  }
}

- (void)_currentThirdPartyApplicationStateDidChange
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(STConversation *)self thirdPartyApplicationPolicyMonitor];
  uint64_t v4 = [(STConversation *)self bundleIdentifier];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke;
  v6[3] = &unk_1E6BC76C8;
  v6[4] = self;
  [v3 requestPoliciesForBundleIdentifiers:v5 completionHandler:v6];
}

void __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v7 = (id *)(a1 + 32);
    uint64_t v9 = [v8 bundleIdentifier];
    uint64_t v10 = [v5 objectForKeyedSubscript:v9];

    if (v10)
    {
      uint64_t v11 = [v10 integerValue];
      if ([*v7 currentThirdPartyApplicationState] != v11)
      {
        long long v12 = +[STLog conversation];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*v7 bundleIdentifier];
          int v15 = 138543618;
          BOOL v16 = v13;
          __int16 v17 = 2048;
          uint64_t v18 = v11;
          _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ application state changed to %ld", (uint8_t *)&v15, 0x16u);
        }
        [*v7 setCurrentThirdPartyApplicationState:v11];
        [*v7 _updateAllThirdPartyContexts];
      }
    }
    else
    {
      long long v14 = +[STLog conversation];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke_cold_2(v7);
      }
    }
  }
  else
  {
    uint64_t v10 = +[STLog conversation];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithThirdPartyBundleIdentifier:]();
    }
  }
}

- (void)_emergencyModeDidChange
{
  BOOL v3 = [(STConversation *)self emergencyModeMonitor];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__STConversation__emergencyModeDidChange__block_invoke;
  v4[3] = &unk_1E6BC7650;
  void v4[4] = self;
  [v3 emergencyModeStatusWithCompletionHandler:v4];
}

void __41__STConversation__emergencyModeDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
    int v9 = v7 > 0.0;
    if (v9 != [*(id *)(a1 + 32) emergencyModeEnabled])
    {
      uint64_t v10 = +[STLog conversation];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v14 = v9;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Emergency mode changed to %d", buf, 8u);
      }

      [*(id *)(a1 + 32) setEmergencyModeEnabled:v8 > 0.0];
      LOBYTE(v12) = 1;
      [*(id *)(a1 + 32) _updateAllContextsUpdateGeneral:1 updateLimited:1 updateCurrentApplicationState:0 updateAllowedByContactsHandle:1 refreshContacts:0 refreshWhitelist:0 updateEmergencyMode:v12];
    }
  }
  else
  {
    uint64_t v11 = +[STLog conversation];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STConversation initSynchronouslyWithBundleIdentifier:]();
    }
  }
}

- (BOOL)_shouldWhileLimitedAllowHandles:(id)a3 context:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(STConversation *)self whileLimitedPolicy];
  if (v8)
  {
    unint64_t v9 = v8;
    if (v8 <= 2)
    {
      uint64_t v10 = [v7 contactsByHandle];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = 0;
      }
      else
      {
        id v36 = 0;
        uint64_t v11 = [(STConversation *)self _contactsByHandle:v6 error:&v36];
        id v12 = v36;
        if (!v11)
        {
          uint64_t v11 = +[STLog conversation];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[STConversation _shouldGeneralScreenTimeAllowHandles:context:](v6);
          }
          BOOL v26 = 1;
LABEL_33:

          BOOL v18 = v26;
          goto LABEL_38;
        }
      }
      [v7 setContactsByHandle:v11];
      if (v9 == 2)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = v6;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v33 != v22) {
                objc_enumerationMutation(v19);
              }
              __int16 v24 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
              uint64_t v25 = [v24 count];

              if (!v25)
              {
                BOOL v26 = 0;
                goto LABEL_25;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
        BOOL v26 = 1;
LABEL_25:
      }
      else
      {
        BOOL v26 = [(STConversation *)self _doesContainAtLeastOneContactInHandles:v6 contactsByHandle:v11];
      }
      goto LABEL_33;
    }
    if (v8 == 3)
    {
      uint64_t v13 = [(STConversation *)self _filteredArrayForKnownHandlesInArray:v6];
      uint64_t v14 = [v7 whitelistedHandles];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        id v16 = 0;
      }
      else
      {
        int v27 = [(STConversation *)self whitelist];
        id v31 = 0;
        uint64_t v15 = [v27 whitelistedHandleStringsFromHandleStrings:v13 error:&v31];
        id v16 = v31;

        if (!v15)
        {
          int v29 = +[STLog conversation];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[STConversation _shouldWhileLimitedAllowHandles:context:](v6);
          }

          uint64_t v15 = 0;
          BOOL v18 = 1;
          goto LABEL_37;
        }
      }
      [v7 setWhitelistedHandles:v15];
      if ([v6 containsObject:&stru_1F3487700])
      {
        BOOL v18 = 0;
      }
      else
      {
        uint64_t v28 = [v15 count];
        BOOL v18 = v28 == [v6 count];
      }
LABEL_37:

      goto LABEL_38;
    }
    __int16 v17 = +[STLog conversation];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[STConversation _shouldWhileLimitedAllowHandles:context:]();
    }
  }
  BOOL v18 = 1;
LABEL_38:

  return v18;
}

- (BOOL)_doesContainAtLeastOneContactInHandles:(id)a3 contactsByHandle:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  unint64_t v8 = [(STConversation *)self contactStore];
  v35[0] = *MEMORY[0x1E4F1AE08];
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  id v30 = 0;
  uint64_t v10 = [v8 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v30];
  id v11 = v30;

  if (!v10)
  {
    id v12 = +[STLog conversation];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[STConversation _doesContainAtLeastOneContactInHandles:contactsByHandle:]();
    }
  }
  uint64_t v13 = [v10 identifier];
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke;
  uint64_t v22 = &unk_1E6BC7718;
  id v14 = v13;
  id v23 = v14;
  __int16 v24 = &v26;
  uint64_t v25 = &v31;
  [v7 enumerateKeysAndObjectsUsingBlock:&v19];
  if (v27[3])
  {
    uint64_t v15 = objc_msgSend(v6, "count", v19, v20, v21, v22);
    id v16 = v32;
    if (v15 == v27[3]) {
      *((unsigned char *)v32 + 24) = 1;
    }
  }
  else
  {
    id v16 = v32;
  }
  BOOL v17 = *((unsigned char *)v16 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v8 count])
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    unint64_t v9 = (void *)a1[4];
    if (!v9) {
      goto LABEL_4;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke_2;
    v10[3] = &unk_1E6BC76F0;
    id v11 = v9;
    id v12 = &v14;
    uint64_t v13 = a1[5];
    [v8 enumerateObjectsUsingBlock:v10];

    if (!*((unsigned char *)v15 + 24))
    {
LABEL_4:
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
    _Block_object_dispose(&v14, 8);
  }
}

void __74__STConversation__doesContainAtLeastOneContactInHandles_contactsByHandle___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  int v7 = [v6 isEqualToString:a1[4]];

  if (v7)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    *a4 = 1;
  }
}

- (void)_populateThirdPartyAllowedContactsByHandlesForContactHandles:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 allowedByScreenTime];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    if (v7) {
      uint64_t v13 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v13 = MEMORY[0x1E4F1CC28];
    }
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [v6 setAllowedByContactsHandle:v8];
}

- (id)_contactsByHandle:(id)a3 error:(id *)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(STConversation *)self managementState];
  id v8 = [v7 primaryiCloudCardDAVAccountIdentifierWithError:a4];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1B9B0] predicateForContainersInAccountWithExternalIdentifier:v8];
    uint64_t v10 = [(STConversation *)self contactStore];
    uint64_t v11 = [v10 containersMatchingPredicate:v9 error:a4];
    uint64_t v12 = [v11 firstObject];
    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
      uint64_t v14 = *MEMORY[0x1E4F1ADC8];
      v28[0] = *MEMORY[0x1E4F1AE08];
      v28[1] = v14;
      v28[2] = *MEMORY[0x1E4F1AEE0];
      uint64_t v25 = v11;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
      long long v16 = [v13 initWithKeysToFetch:v15];

      long long v17 = [(STConversation *)self _filteredArrayForKnownHandlesInArray:v6];
      long long v18 = (void *)MEMORY[0x1E4F1B8F8];
      [v12 identifier];
      v27 = id v26 = v6;
      uint64_t v19 = (void *)v27;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      uint64_t v21 = [v18 predicateForContactsMatchingHandleStrings:v17 inContainersWithIdentifiers:v20];
      [v16 setPredicate:v21];

      uint64_t v11 = v25;
      uint64_t v22 = [v10 executeFetchRequest:v16 error:a4];
      id v23 = [v22 value];

      id v6 = v26;
    }
    else
    {
      long long v16 = +[STLog conversation];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[STConversation _contactsByHandle:error:]();
      }
      id v23 = 0;
    }
  }
  else
  {
    id v9 = +[STLog conversation];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STConversation _contactsByHandle:error:](v9);
    }
    id v23 = 0;
  }

  return v23;
}

- (id)_filteredArrayForKnownHandlesInArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_9];
  id v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

uint64_t __55__STConversation__filteredArrayForKnownHandlesInArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:&stru_1F3487700] ^ 1;
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 48, 1);
}

- (CNDowntimeWhitelist)whitelist
{
  return (CNDowntimeWhitelist *)objc_getProperty(self, a2, 56, 1);
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 64, 1);
}

- (void)setManagementState:(id)a3
{
}

- (DMFCommunicationPolicyMonitor)communicationPolicyMonitor
{
  return (DMFCommunicationPolicyMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCommunicationPolicyMonitor:(id)a3
{
}

- (DMFApplicationPolicyMonitor)thirdPartyApplicationPolicyMonitor
{
  return (DMFApplicationPolicyMonitor *)objc_getProperty(self, a2, 80, 1);
}

- (void)setThirdPartyApplicationPolicyMonitor:(id)a3
{
}

- (int64_t)currentThirdPartyApplicationState
{
  return self->_currentThirdPartyApplicationState;
}

- (void)setCurrentThirdPartyApplicationState:(int64_t)a3
{
  self->_currentThirdPartyApplicationState = a3;
}

- (DMFEmergencyModeMonitor)emergencyModeMonitor
{
  return (DMFEmergencyModeMonitor *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEmergencyModeMonitor:(id)a3
{
}

- (BOOL)didFetchInitialScreenTimePolicyState
{
  return self->_didFetchInitialScreenTimePolicyState;
}

- (BOOL)didFetchInitialApplicationState
{
  return self->_didFetchInitialApplicationState;
}

- (BOOL)didFetchInitialEmergencyModeState
{
  return self->_didFetchInitialEmergencyModeState;
}

- (BOOL)didFetchInitialThirdPartyApplicationState
{
  return self->_didFetchInitialThirdPartyApplicationState;
}

- (void)setDidFetchInitialThirdPartyApplicationState:(BOOL)a3
{
  self->_didFetchInitialThirdPartyApplicationState = a3;
}

- (int)policyNotifyToken
{
  return self->_policyNotifyToken;
}

- (int)emergencyModeNotifyToken
{
  return self->_emergencyModeNotifyToken;
}

- (STConversation)me
{
  return (STConversation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMe:(id)a3
{
}

- (void)setConversationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conversationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_emergencyModeMonitor, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_thirdPartyApplicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_communicationPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_didFetchInitialStateLock, 0);
  objc_storeStrong((id *)&self->_stateChangeQueue, 0);
  objc_storeStrong((id *)&self->_contextByHandles, 0);
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not fetch emergency mode status: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not fetch application state: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "%{public}@ application state does not exist, preferring to keep state as %lu");
}

- (void)initSynchronouslyWithBundleIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not fetch communication policies: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initSynchronouslyWithThirdPartyBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not fetch third party application state: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initSynchronouslyWithThirdPartyBundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "%{public}@ application state does not exist, preferring to keep state as %ld");
}

void __74__STConversation_initWithBundleIdentifier_contactStore_completionHandler___block_invoke_80_cold_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 32) currentApplicationState];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "%{public}@ application state does not exist, preferring to keep state as %lu", v4, v5, v6, v7, 2u);
}

void __71__STConversation_initWithThirdPartyBundleIdentifier_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a2 + 32) currentThirdPartyApplicationState];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "%{public}@ application state does not exist, preferring to keep state as %ld", v4, v5, v6, v7, 2u);
}

void __51__STConversation__currentApplicationStateDidChange__block_invoke_cold_2(id *a1)
{
  uint64_t v2 = [*a1 bundleIdentifier];
  [*a1 currentApplicationState];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v3, v4, "%{public}@ application state does not exist, preferring to keep state as %lu", v5, v6, v7, v8, 2u);
}

void __61__STConversation__currentThirdPartyApplicationStateDidChange__block_invoke_cold_2(id *a1)
{
  uint64_t v2 = [*a1 bundleIdentifier];
  [*a1 currentThirdPartyApplicationState];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v3, v4, "%{public}@ application state does not exist, preferring to keep state as %ld", v5, v6, v7, v8, 2u);
}

- (void)_shouldGeneralScreenTimeAllowHandles:(void *)a1 context:.cold.1(void *a1)
{
  os_log_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Error fetching contacts (%{private}@), preferring to allow all handles: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_shouldGeneralScreenTimeAllowHandles:context:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Unknown communication policy: %lld, preferring to allow all handles", v2, v3, v4, v5, v6);
}

- (void)_shouldWhileLimitedAllowHandles:(void *)a1 context:.cold.2(void *a1)
{
  uint64_t v1 = [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Error fetching whitelisted contacts (%{private}@), preferring to allow all handles: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_shouldWhileLimitedAllowHandles:context:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Unknown communication while limited policy: %lld, preferring to allow all handles", v2, v3, v4, v5, v6);
}

- (void)_doesContainAtLeastOneContactInHandles:contactsByHandle:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Error fetching Me Contact, preferring to allow Me Contact in groups: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_contactsByHandle:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "No CardDAV identifier found for user", v1, 2u);
}

- (void)_contactsByHandle:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1DA519000, v0, v1, "Failed to fetch contacts container with identifier %{public}@: %{public}@");
}

@end