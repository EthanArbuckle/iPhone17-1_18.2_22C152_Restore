@interface WBSOngoingSharingGroupProvider
+ (WBSOngoingSharingGroupProvider)sharedProvider;
- (BOOL)canCurrentUserEditSavedAccountsInGroupWithID:(id)a3;
- (BOOL)hasLoadedGroups;
- (NSArray)cachedGroups;
- (NSArray)cachedInvitations;
- (NSString)currentUserParticipantID;
- (WBSOngoingSharingGroupProvider)init;
- (id)cachedGroupWithID:(id)a3;
- (void)_addNewGroupToCachedGroups:(id)a3;
- (void)_contactsUpdatedNotification:(id)a3;
- (void)_fetchCurrentUserParticipantIDWithCompletion:(id)a3;
- (void)_fetchGroups;
- (void)_fetchGroupsWithCompletion:(id)a3;
- (void)_notifySubscribers;
- (void)_performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 shouldForceUpdate:(BOOL)a4 task:(id)a5;
- (void)_updateCachedPermissionLevelsForCurrentUser;
- (void)accountChanged;
- (void)addSubscriber:(id)a3;
- (void)dealloc;
- (void)groupsUpdated;
- (void)performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 task:(id)a4;
- (void)performTaskOnQueueAfterFetchingGroups:(id)a3 task:(id)a4;
@end

@implementation WBSOngoingSharingGroupProvider

void __46__WBSOngoingSharingGroupProvider_cachedGroups__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_26_cold_1(v7, v6);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_27;
  v11[3] = &unk_1E615A6C8;
  v11[4] = v8;
  id v12 = v5;
  id v10 = v5;
  dispatch_sync(v9, v11);
}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__WBSOngoingSharingGroupProvider_init__block_invoke_cold_1(v3, v2);
    }
  }
}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to provision for password sharing with error: %@", v7, v8, v9, v10, 2u);
}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_26_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to fetch current user participant ID with error: %{public}@", v7, v8, v9, v10, 2u);
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = +[WBSFeatureAvailability isOngoingCredentialSharingEnabled];
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Fetching shared account groups", buf, 2u);
      }
      uint64_t v7 = [MEMORY[0x1E4F3B420] sharedInstance];
      uint64_t v8 = [MEMORY[0x1E4F3B418] all];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_33;
      v16[3] = &unk_1E615BC98;
      id v17 = *(id *)(a1 + 32);
      objc_copyWeak(&v18, v2);
      [v7 getGroupsWithRequest:v8 completion:v16];

      objc_destroyWeak(&v18);
      uint64_t v9 = v17;
LABEL_15:

      goto LABEL_16;
    }
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Not fetching shared account groups because ongoing credential sharing is disabled", buf, 2u);
    }
    uint64_t v10 = +[WBSKeychainSyncingMonitor sharedMonitor];
    uint64_t v11 = [v10 keychainSyncSettingValue];

    if ((unint64_t)(v11 - 1) >= 2)
    {
      if (!v11)
      {
        uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSOngoingSharingGroupProviderErrorDomain" code:1 userInfo:0];
        goto LABEL_13;
      }
    }
    else
    {
      id v12 = (void *)WeakRetained[3];
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
      WeakRetained[3] = MEMORY[0x1E4F1CBF0];

      v14 = (void *)WeakRetained[4];
      WeakRetained[4] = v13;

      [WeakRetained _notifySubscribers];
    }
    uint64_t v9 = 0;
LABEL_13:
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v9);
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_notifySubscribers
{
  id v3 = (void *)[(NSHashTable *)self->_subscribers copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__WBSOngoingSharingGroupProvider__notifySubscribers__block_invoke;
  v5[3] = &unk_1E615A6C8;
  id v6 = v3;
  uint64_t v7 = self;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_4;
  v7[3] = &unk_1E615A870;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

+ (WBSOngoingSharingGroupProvider)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSOngoingSharingGroupProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, block);
  }
  id v2 = (void *)sharedProvider_provider;
  return (WBSOngoingSharingGroupProvider *)v2;
}

- (NSArray)cachedGroups
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__WBSOngoingSharingGroupProvider_cachedGroups__block_invoke;
  v5[3] = &unk_1E615A970;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)performTaskOnQueueAfterFetchingGroups:(id)a3 task:(id)a4
{
}

- (void)_performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 shouldForceUpdate:(BOOL)a4 task:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke;
  v13[3] = &unk_1E615BB90;
  BOOL v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __48__WBSOngoingSharingGroupProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v1;
}

void __52__WBSOngoingSharingGroupProvider__notifySubscribers__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "groupProviderReceivedUpdates:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__WBSOngoingSharingGroupProvider_addSubscriber___block_invoke;
  v7[3] = &unk_1E615A6C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_fetchCurrentUserParticipantIDWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(WBSScopeExitHandler);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke;
  v15[3] = &unk_1E615A620;
  id v6 = v4;
  id v16 = v6;
  [(WBSScopeExitHandler *)v5 setHandler:v15];
  long long v7 = [MEMORY[0x1E4F3B420] sharedInstance];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v9 = [MEMORY[0x1E4F3B420] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_26;
    v11[3] = &unk_1E615BC08;
    uint64_t v12 = v5;
    uint64_t v13 = self;
    [v9 fetchCurrentUserIdentifierWithReply:v11];
  }
  else
  {
    long long v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v10, OS_LOG_TYPE_DEFAULT, "Not fetching current user participant ID because -[KCSharingGroupManager fetchCurrentUserIdentifierWithReply:] is not available.", buf, 2u);
    }
  }
}

- (WBSOngoingSharingGroupProvider)init
{
  v25.receiver = self;
  v25.super_class = (Class)WBSOngoingSharingGroupProvider;
  id v2 = [(WBSOngoingSharingGroupProvider *)&v25 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v3;

    uint64_t v5 = NSString;
    id v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    id v8 = [v5 stringWithFormat:@"com.apple.SafariCore.%@.%p", v7, v2];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    groupIDToPermissionLevelForCurrentUser = v2->_groupIDToPermissionLevelForCurrentUser;
    v2->_groupIDToPermissionLevelForCurrentUser = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F3B420] sharedInstance];
    [v13 addSubscriber:v2];

    [(WBSOngoingSharingGroupProvider *)v2 _fetchCurrentUserParticipantIDWithCompletion:0];
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel__fetchGroups name:WBSKeychainSyncStatusMayHaveChangedNotification object:0];

    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__contactsUpdatedNotification_ name:*MEMORY[0x1E4F1AF80] object:0];

    [(WBSOngoingSharingGroupProvider *)v2 _fetchGroups];
    id v16 = [MEMORY[0x1E4F3B420] sharedInstance];
    [v16 provisionWithReply:&__block_literal_global_33];

    objc_initWeak(&location, v2);
    id v17 = +[WBSKeyBagLockStatusManager sharedManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __38__WBSOngoingSharingGroupProvider_init__block_invoke_19;
    v22[3] = &unk_1E615A5D8;
    objc_copyWeak(&v23, &location);
    uint64_t v18 = [v17 addKeyBagLockStatusChangedObserverWithHandler:v22];
    id keybagLockStatusObserverToken = v2->_keybagLockStatusObserverToken;
    v2->_id keybagLockStatusObserverToken = (id)v18;

    v20 = v2;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[3] && v2[4] && !*(unsigned char *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_2;
    block[3] = &unk_1E615A620;
    uint64_t v3 = &v9;
    id v4 = *(NSObject **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_3;
    v5[3] = &unk_1E615BB68;
    uint64_t v3 = &v6;
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v2 _fetchGroupsWithCompletion:v5];
  }
}

- (void)_fetchGroupsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = +[WBSKeychainSyncingMonitor sharedMonitor];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke;
  v8[3] = &unk_1E615BCC0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 performTaskOnceKeychainSyncValueHasBeenFetchedOnQueue:queue task:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_fetchGroups
{
}

uint64_t __48__WBSOngoingSharingGroupProvider_addSubscriber___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void __79__WBSOngoingSharingGroupProvider__fetchCurrentUserParticipantIDWithCompletion___block_invoke_27(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

void __38__WBSOngoingSharingGroupProvider_init__block_invoke_19(uint64_t a1)
{
  uint64_t v2 = +[WBSKeyBagLockStatusManager sharedManager];
  uint64_t v3 = [v2 keyBagLockStatus];

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _fetchGroups];
  }
}

- (void)dealloc
{
  uint64_t v3 = +[WBSKeyBagLockStatusManager sharedManager];
  [v3 removeKeyBagLockStatusChangedObserver:self->_keybagLockStatusObserverToken];

  v4.receiver = self;
  v4.super_class = (Class)WBSOngoingSharingGroupProvider;
  [(WBSOngoingSharingGroupProvider *)&v4 dealloc];
}

- (NSArray)cachedInvitations
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WBSOngoingSharingGroupProvider_cachedInvitations__block_invoke;
  v5[3] = &unk_1E615A970;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __51__WBSOngoingSharingGroupProvider_cachedInvitations__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)cachedGroupWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9;
  id v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke;
  block[3] = &unk_1E615A6F0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke_2;
  v6[3] = &unk_1E615BB40;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "safari_firstObjectPassingTest:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __52__WBSOngoingSharingGroupProvider_cachedGroupWithID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 groupID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)performTaskEnsuringGroupsAreLoadedOnQueue:(id)a3 task:(id)a4
{
}

uint64_t __100__WBSOngoingSharingGroupProvider__performTaskEnsuringGroupsAreLoadedOnQueue_shouldForceUpdate_task___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canCurrentUserEditSavedAccountsInGroupWithID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke;
    block[3] = &unk_1E615BBB8;
    void block[4] = self;
    id v9 = v4;
    id v10 = &v11;
    dispatch_sync(queue, block);
    BOOL v6 = v12[3] != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 integerValue];
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke_cold_1(v5);
    }
    uint64_t v4 = 0;
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
}

- (NSString)currentUserParticipantID
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__9;
  uint64_t v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke;
  block[3] = &unk_1E615AE78;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(queue, block);
  uint64_t v4 = (void *)v15[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    BOOL v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_2;
    v10[3] = &unk_1E615BBE0;
    v10[4] = self;
    uint64_t v12 = &v14;
    id v7 = v6;
    uint64_t v11 = v7;
    [(WBSOngoingSharingGroupProvider *)self _fetchCurrentUserParticipantIDWithCompletion:v10];
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v7, v8);
    id v5 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return (NSString *)v5;
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    uint64_t v3 = [v2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_3;
  v5[3] = &unk_1E615A970;
  uint64_t v4 = *(void *)(a1 + 48);
  void v5[4] = v2;
  v5[5] = v4;
  dispatch_sync(v3, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __58__WBSOngoingSharingGroupProvider_currentUserParticipantID__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasLoadedGroups
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__WBSOngoingSharingGroupProvider_hasLoadedGroups__block_invoke;
  v5[3] = &unk_1E615A970;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__WBSOngoingSharingGroupProvider_hasLoadedGroups__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 24)) {
    BOOL v2 = *(void *)(v1 + 32) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(WBSScopeExitHandler);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2;
  v17[3] = &unk_1E615A870;
  id v19 = *(id *)(a1 + 32);
  id v8 = v6;
  id v18 = v8;
  [(WBSScopeExitHandler *)v7 setHandler:v17];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained[1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3;
    v12[3] = &unk_1E615BC70;
    uint64_t v13 = v7;
    id v14 = v8;
    id v15 = v5;
    uint64_t v16 = v10;
    dispatch_async(v11, v12);
  }
}

uint64_t __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3(void **a1)
{
  uint64_t v1 = a1 + 5;
  if (a1[5])
  {
    BOOL v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_cold_1(v1, v2);
    }
  }
  else
  {
    id v12 = [a1[6] sortedArrayUsingComparator:&__block_literal_global_37_0];
    uint64_t v4 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", &__block_literal_global_40_1);
    id v5 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", &__block_literal_global_43_0);
    if (!WBSIsEqual(v4, *((void **)a1[7] + 3)) || (WBSIsEqual(v5, *((void **)a1[7] + 4)) & 1) == 0)
    {
      uint64_t v6 = [v4 copy];
      id v7 = a1[7];
      id v8 = (void *)v7[3];
      v7[3] = v6;

      uint64_t v9 = [v5 copy];
      id v10 = a1[7];
      uint64_t v11 = (void *)v10[4];
      v10[4] = v9;

      [a1[7] _updateCachedPermissionLevelsForCurrentUser];
      [a1[7] _notifySubscribers];
    }
  }
}

uint64_t __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 displayName];
  id v7 = [v5 displayName];
  uint64_t v8 = objc_msgSend(v6, "safari_localizedCompareSortingEmptyStringAndNumericPrefixToEnd:", v7);

  if (!v8)
  {
    uint64_t v9 = [v4 groupID];
    id v10 = [v5 groupID];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

BOOL __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_2_38(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 currentUserParticipant];
  BOOL v3 = [v2 inviteStatus] == 2;

  return v3;
}

BOOL __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_41(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 currentUserParticipant];
  BOOL v3 = [v2 inviteStatus] == 1;

  return v3;
}

- (void)_contactsUpdatedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSOngoingSharingGroupProvider__contactsUpdatedNotification___block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__WBSOngoingSharingGroupProvider__contactsUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySubscribers];
}

- (void)_updateCachedPermissionLevelsForCurrentUser
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_cachedGroups;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = [v7 participants];
        uint64_t v9 = objc_msgSend(v8, "safari_firstObjectPassingTest:", &__block_literal_global_47);

        id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "permissionLevel"));
        groupIDToPermissionLevelForCurrentUser = self->_groupIDToPermissionLevelForCurrentUser;
        id v12 = [v7 groupID];
        [(NSMutableDictionary *)groupIDToPermissionLevelForCurrentUser setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __77__WBSOngoingSharingGroupProvider__updateCachedPermissionLevelsForCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser];
}

- (void)_addNewGroupToCachedGroups:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke;
  v7[3] = &unk_1E615A6C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] array];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    BOOL v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke_2;
  v9[3] = &unk_1E615BB40;
  id v10 = *(id *)(a1 + 40);
  if ((objc_msgSend(v2, "safari_containsObjectPassingTest:", v9) & 1) == 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) arrayByAddingObject:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;
  }
  [*(id *)(a1 + 32) _updateCachedPermissionLevelsForCurrentUser];
  [*(id *)(a1 + 32) _notifySubscribers];
}

uint64_t __61__WBSOngoingSharingGroupProvider__addNewGroupToCachedGroups___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 groupID];
  uint64_t v4 = [*(id *)(a1 + 32) groupID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)groupsUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__WBSOngoingSharingGroupProvider_groupsUpdated__block_invoke;
  v2[3] = &unk_1E615A768;
  v2[4] = self;
  [(WBSOngoingSharingGroupProvider *)self _fetchCurrentUserParticipantIDWithCompletion:v2];
}

uint64_t __47__WBSOngoingSharingGroupProvider_groupsUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchGroupsWithCompletion:0];
}

- (void)accountChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__WBSOngoingSharingGroupProvider_accountChanged__block_invoke;
  v2[3] = &unk_1E615A768;
  v2[4] = self;
  [(WBSOngoingSharingGroupProvider *)self _fetchCurrentUserParticipantIDWithCompletion:v2];
}

uint64_t __48__WBSOngoingSharingGroupProvider_accountChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchGroupsWithCompletion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagLockStatusObserverToken, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUserParticipantID, 0);
  objc_storeStrong((id *)&self->_groupIDToPermissionLevelForCurrentUser, 0);
  objc_storeStrong((id *)&self->_cachedInvitations, 0);
  objc_storeStrong((id *)&self->_cachedGroups, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__WBSOngoingSharingGroupProvider_canCurrentUserEditSavedAccountsInGroupWithID___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B728F000, log, OS_LOG_TYPE_FAULT, "Could not find permission level for current user in shared group.", v1, 2u);
}

void __61__WBSOngoingSharingGroupProvider__fetchGroupsWithCompletion___block_invoke_3_cold_1(void **a1, void *a2)
{
  BOOL v2 = *a1;
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Failed to fetch shared credential groups with error: %{public}@", v7, v8, v9, v10, 2u);
}

@end