@interface SFTabGroupActivityItemConfiguration
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (NSItemProvider)itemProvider;
- (SFTabGroupActivityItemConfiguration)initWithTabGroup:(id)a3 inTabGroupManager:(id)a4 existingShare:(id)a5 icon:(id)a6;
- (WBTabGroup)tabGroup;
- (WBTabGroupManager)tabGroupManager;
- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4;
- (id)activityItemsConfigurationMetadataForKey:(id)a3;
- (void)_beginSharingTabGroupWithCompletionHandler:(id)a3;
- (void)_presentSharedTabGroupsManateePrompt;
- (void)dealloc;
- (void)updateMetadataIcon:(id)a3;
@end

@implementation SFTabGroupActivityItemConfiguration

- (SFTabGroupActivityItemConfiguration)initWithTabGroup:(id)a3 inTabGroupManager:(id)a4 existingShare:(id)a5 icon:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (UIImage *)a6;
  v41.receiver = self;
  v41.super_class = (Class)SFTabGroupActivityItemConfiguration;
  v15 = [(SFTabGroupActivityItemConfiguration *)&v41 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tabGroup, a3);
    objc_storeStrong((id *)&v16->_tabGroupManager, a4);
    uint64_t v17 = [v13 copy];
    existingShare = v16->_existingShare;
    v16->_existingShare = (CKShare *)v17;

    v19 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E4F28D78]);
    itemProvider = v16->_itemProvider;
    v16->_itemProvider = v19;

    v21 = [(WBTabGroup *)v16->_tabGroup title];
    [(NSItemProvider *)v16->_itemProvider setSuggestedName:v21];

    v22 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
    linkMetadata = v16->_linkMetadata;
    v16->_linkMetadata = v22;

    v24 = [(WBTabGroup *)v16->_tabGroup title];
    [(LPLinkMetadata *)v16->_linkMetadata setTitle:v24];

    id v25 = objc_alloc_init(MEMORY[0x1E4F30A58]);
    [v25 setType:5];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v14 properties:v25];
    [(LPLinkMetadata *)v16->_linkMetadata setImage:v26];

    v27 = UIImagePNGRepresentation(v14);
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F19E40]) initWithAllowedParticipantPermissionOptions:2 allowedParticipantAccessOptions:2];
    [v28 setSupportAllowingAddedParticipantsToInviteOthers:1];
    if (v13)
    {
      [v13 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F19DC0]];
      v29 = v16->_itemProvider;
      v30 = objc_msgSend(MEMORY[0x1E4F19EC8], "safari_cloudTabsContainer");
      [(NSItemProvider *)v29 registerCKShare:v13 container:v30 allowedSharingOptions:v28];
    }
    else
    {
      id v35 = v12;
      objc_initWeak(&location, v16);
      v31 = v16->_itemProvider;
      v32 = objc_msgSend(MEMORY[0x1E4F19EC8], "safari_cloudTabsContainer");
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke;
      v36[3] = &unk_1E54EA548;
      objc_copyWeak(&v39, &location);
      id v37 = v11;
      id v38 = v27;
      [(NSItemProvider *)v31 registerCKShareWithContainer:v32 allowedSharingOptions:v28 preparationHandler:v36];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
      id v12 = v35;
    }
    v33 = v16;
  }
  return v16;
}

void __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke_2;
    v5[3] = &unk_1E54EA520;
    id v6 = a1[4];
    objc_copyWeak(&v9, a1 + 6);
    id v7 = a1[5];
    id v8 = v3;
    [WeakRetained _beginSharingTabGroupWithCompletionHandler:v5];

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

void __93__SFTabGroupActivityItemConfiguration_initWithTabGroup_inTabGroupManager_existingShare_icon___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = [*(id *)(a1 + 32) uuid];
    [v6 postNotificationName:@"SFTabGroupDidBeginSharingNotification" object:v7];
  }
  if (objc_msgSend(v5, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F980A8], 2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _presentSharedTabGroupsManateePrompt];
  }
  [v9 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F19DC0]];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_itemProvider;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  if ([a3 isEqual:*MEMORY[0x1E4FB25F0]])
  {
    v4 = [(WBTabGroup *)self->_tabGroup title];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4FB25E0]]) {
    id v5 = self->_linkMetadata;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)updateMetadataIcon:(id)a3
{
  if (!self->_existingShare)
  {
    v4 = (objc_class *)MEMORY[0x1E4F30A58];
    id v5 = a3;
    id v7 = objc_alloc_init(v4);
    [v7 setType:5];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v5 properties:v7];

    [(LPLinkMetadata *)self->_linkMetadata setImage:v6];
  }
}

- (void)_beginSharingTabGroupWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  existingShare = self->_existingShare;
  if (existingShare)
  {
    (*((void (**)(id, CKShare *, void))v4 + 2))(v4, existingShare, 0);
  }
  else
  {
    pendingShareCompletionHandlers = self->_pendingShareCompletionHandlers;
    if (pendingShareCompletionHandlers)
    {
      id v8 = _Block_copy(v4);
      [(NSMutableArray *)pendingShareCompletionHandlers addObject:v8];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CA48];
      v10 = _Block_copy(v4);
      id v11 = [v9 arrayWithObject:v10];
      id v12 = self->_pendingShareCompletionHandlers;
      self->_pendingShareCompletionHandlers = v11;

      id v13 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        tabGroup = self->_tabGroup;
        v15 = v13;
        v16 = [(WBTabGroup *)tabGroup uuid];
        *(_DWORD *)buf = 138543362;
        v22 = v16;
        _os_log_impl(&dword_18C354000, v15, OS_LOG_TYPE_INFO, "Requesting share for tab group with UUID %{public}@", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      tabGroupManager = self->_tabGroupManager;
      v18 = [(WBTabGroup *)self->_tabGroup uuid];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke;
      v19[3] = &unk_1E54EA570;
      objc_copyWeak(&v20, (id *)buf);
      [(WBTabGroupManager *)tabGroupManager beginSharingTabGroupWithUUID:v18 completionHandler:v19];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E54EA3B0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __82__SFTabGroupActivityItemConfiguration__beginSharingTabGroupWithCompletionHandler___block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained) {
    goto LABEL_16;
  }
  id v3 = a1[4];
  id v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = (void *)*((void *)WeakRetained + 5);
      id v7 = v4;
      id v8 = [v6 uuid];
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_18C354000, v7, OS_LOG_TYPE_INFO, "Received share for tab group with UUID %{public}@", buf, 0xCu);

LABEL_7:
    }
  }
  else if (v5)
  {
    id v9 = (void *)*((void *)WeakRetained + 5);
    id v10 = v4;
    id v8 = [v9 uuid];
    id v11 = objc_msgSend(a1[5], "safari_privacyPreservingDescription");
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_18C354000, v10, OS_LOG_TYPE_INFO, "Failed to get share for tab group with UUID %{public}@, %{public}@", buf, 0x16u);

    goto LABEL_7;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)WeakRetained + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  objc_storeStrong((id *)WeakRetained + 1, a1[4]);
  uint64_t v17 = (void *)*((void *)WeakRetained + 3);
  *((void *)WeakRetained + 3) = 0;

LABEL_16:
}

- (void)_presentSharedTabGroupsManateePrompt
{
  id v2 = +[SFSystemAlert sharedTabGroupsManateeAlert];
  [v2 scheduleWithCompletionBlock:&__block_literal_global_5];
}

void __75__SFTabGroupActivityItemConfiguration__presentSharedTabGroupsManateePrompt__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
  {
    [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/"];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v3 openSensitiveURL:v4 withOptions:0];
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pendingShareCompletionHandlers = self->_pendingShareCompletionHandlers;
  if (pendingShareCompletionHandlers)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = pendingShareCompletionHandlers;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    id v9 = self->_pendingShareCompletionHandlers;
    self->_pendingShareCompletionHandlers = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)SFTabGroupActivityItemConfiguration;
  [(SFTabGroupActivityItemConfiguration *)&v10 dealloc];
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_pendingShareCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);

  objc_storeStrong((id *)&self->_existingShare, 0);
}

@end