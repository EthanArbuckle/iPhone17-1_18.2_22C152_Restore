@interface WBProfileWindow
- (BOOL)_isProfileActive:(id)a3;
- (BOOL)canSwitchProfiles;
- (BOOL)isInDefaultProfile;
- (NSString)activeProfileIdentifier;
- (NSString)activeTabGroupUUID;
- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4;
- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4 preferredProfileIdentifier:(id)a5;
- (WBProfileWindowDelegate)delegate;
- (WBTabGroup)unnamedTabGroupForActiveProfile;
- (id)_displayTitleProviderForTabGroupWithUUID:(id)a3;
- (id)_findOrCreateUnnamedTabGroupForProfile:(id)a3;
- (id)_lastActiveTabGroupForProfile:(id)a3;
- (id)existingUnnamedTabGroupForProfileWithIdentifier:(id)a3;
- (id)unnamedTabGroupDisplayTitleProvider;
- (void)_attachLocalGroupToDefaultProfileIfNeeded;
- (void)_attachUnnamedTabGroupToProfileWithIdentifier:(id)a3;
- (void)_selectPreferredProfileIfNeeded:(id)a3;
- (void)dealloc;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setActiveTabGroupUUID:(id)a3;
- (void)setCanSwitchProfiles:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setUnnamedTabGroupDisplayTitleProvider:(id)a3;
- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
- (void)willClose;
@end

@implementation WBProfileWindow

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (WBTabGroup)unnamedTabGroupForActiveProfile
{
  if ([(WBProfileWindow *)self isInDefaultProfile]) {
    [(WBWindowState *)self->_windowState localTabGroup];
  }
  else {
  v3 = [(WBProfileWindow *)self existingUnnamedTabGroupForProfileWithIdentifier:self->_activeProfileIdentifier];
  }
  return (WBTabGroup *)v3;
}

- (BOOL)isInDefaultProfile
{
  activeProfileIdentifier = self->_activeProfileIdentifier;
  v3 = [(WBTabGroupManager *)self->_tabGroupManager defaultProfile];
  v4 = [v3 identifier];
  LOBYTE(activeProfileIdentifier) = [(NSString *)activeProfileIdentifier isEqual:v4];

  return (char)activeProfileIdentifier;
}

- (void)setCanSwitchProfiles:(BOOL)a3
{
  self->_canSwitchProfiles = a3;
}

- (void)setDelegate:(id)a3
{
}

- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4 preferredProfileIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)WBProfileWindow;
  v12 = [(WBProfileWindow *)&v27 init];
  if (v12)
  {
    v13 = [v9 activeProfileIdentifier];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      activeProfileIdentifier = v12->_activeProfileIdentifier;
      v12->_activeProfileIdentifier = v15;
    }
    else
    {
      activeProfileIdentifier = [v10 defaultProfile];
      uint64_t v17 = [activeProfileIdentifier identifier];
      v18 = v12->_activeProfileIdentifier;
      v12->_activeProfileIdentifier = (NSString *)v17;
    }
    objc_storeStrong((id *)&v12->_tabGroupManager, a4);
    objc_storeStrong((id *)&v12->_windowState, a3);
    [(WBProfileWindow *)v12 _attachLocalGroupToDefaultProfileIfNeeded];
    [(WBProfileWindow *)v12 _attachUnnamedTabGroupToProfileWithIdentifier:v11];
    [(WBTabGroupManager *)v12->_tabGroupManager addTabGroupObserver:v12];
    [(WBProfileWindow *)v12 _selectPreferredProfileIfNeeded:v11];
    v19 = [v9 activeTabGroupUUID];
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      activeTabGroupUUID = v12->_activeTabGroupUUID;
      v12->_activeTabGroupUUID = v21;
    }
    else
    {
      activeTabGroupUUID = [(WBProfileWindow *)v12 existingUnnamedTabGroupForProfileWithIdentifier:v11];
      uint64_t v23 = [activeTabGroupUUID uuid];
      v24 = v12->_activeTabGroupUUID;
      v12->_activeTabGroupUUID = (NSString *)v23;
    }
    v25 = v12;
  }

  return v12;
}

- (void)_selectPreferredProfileIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v18 = v4;
    v6 = [(WBTabGroupManager *)self->_tabGroupManager profileWithIdentifier:v4];
    if (v6)
    {
      v7 = [(WBProfileWindow *)self _findOrCreateUnnamedTabGroupForProfile:v6];
      if (v7)
      {
        v8 = (NSString *)[v18 copy];
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v8;

        id v10 = (void *)[v18 copy];
        [(WBWindowState *)self->_windowState setActiveProfileIdentifier:v10];

        id v11 = [(WBWindowState *)self->_windowState activeTabGroupUUID];
        if (v11)
        {
          tabGroupManager = self->_tabGroupManager;
          v13 = [(WBWindowState *)self->_windowState activeTabGroupUUID];
          v14 = [(WBTabGroupManager *)tabGroupManager tabGroupWithUUID:v13];
        }
        else
        {
          v14 = 0;
        }

        v15 = [v14 profileIdentifier];
        char v16 = [v15 isEqualToString:v18];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [v7 uuid];
          [(WBWindowState *)self->_windowState setActiveTabGroupUUID:v17];
        }
      }
    }
    id v5 = v18;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_attachUnnamedTabGroupToProfileWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:");
    id v5 = v4;
    if (v4 && [v4 kind])
    {
      v6 = [(WBProfileWindow *)self _findOrCreateUnnamedTabGroupForProfile:v5];
      if (!v6)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXProfiles();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[WBProfileWindow _attachUnnamedTabGroupToProfileWithIdentifier:](v7, v8, v9, v10, v11, v12, v13, v14);
        }
      }
    }
  }
}

- (void)_attachLocalGroupToDefaultProfileIfNeeded
{
  v3 = (void *)*MEMORY[0x263F66420];
  id v4 = [(WBWindowState *)self->_windowState localTabGroup];
  id v5 = [v4 profileIdentifier];
  LOBYTE(v3) = [v3 isEqualToString:v5];

  if ((v3 & 1) == 0)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    char v11 = 0;
    tabGroupManager = self->_tabGroupManager;
    v7 = [(WBWindowState *)self->_windowState localTabGroup];
    uint64_t v8 = [v7 uuid];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__WBProfileWindow__attachLocalGroupToDefaultProfileIfNeeded__block_invoke;
    v9[3] = &unk_2643D9AC0;
    v9[4] = v10;
    [(WBTabGroupManager *)tabGroupManager updateTabGroupWithUUID:v8 persist:1 usingBlock:v9];

    _Block_object_dispose(v10, 8);
  }
}

- (void)setUnnamedTabGroupDisplayTitleProvider:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 copy];
  id unnamedTabGroupDisplayTitleProvider = self->_unnamedTabGroupDisplayTitleProvider;
  self->_id unnamedTabGroupDisplayTitleProvider = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(WBWindowState *)self->_windowState unnamedTabGroupUUIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](self->_tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", MEMORY[0x263EF8330], 3221225472, __58__WBProfileWindow_setUnnamedTabGroupDisplayTitleProvider___block_invoke, &unk_2643D9A50, self, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 activeProfileIdentifier];
  uint64_t v9 = [(WBProfileWindow *)self initWithWindowState:v7 tabGroupManager:v6 preferredProfileIdentifier:v8];

  return v9;
}

- (void)dealloc
{
  [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)WBProfileWindow;
  [(WBProfileWindow *)&v3 dealloc];
}

- (void)setActiveProfileIdentifier:(id)a3
{
  id v14 = a3;
  if (([(NSString *)self->_activeProfileIdentifier isEqual:v14] & 1) == 0)
  {
    id v4 = [(WBTabGroupManager *)self->_tabGroupManager profileWithIdentifier:v14];
    if (v4)
    {
      id v5 = [(WBProfileWindow *)self _findOrCreateUnnamedTabGroupForProfile:v4];
      if (v5)
      {
        id v6 = (NSString *)[v14 copy];
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v6;

        uint64_t v8 = [(WBProfileWindow *)self _lastActiveTabGroupForProfile:v4];
        uint64_t v9 = v8;
        if (v8 && ([v8 isPrivateBrowsing] & 1) == 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          long long v11 = WeakRetained;
          long long v12 = self;
          long long v13 = v9;
        }
        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          long long v11 = WeakRetained;
          long long v12 = self;
          long long v13 = v5;
        }
        [WeakRetained profileWindow:v12 selectTabGroup:v13];
      }
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)setActiveTabGroupUUID:(id)a3
{
  id v9 = a3;
  if ((-[NSString isEqual:](self->_activeTabGroupUUID, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v9 copy];
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v4;

    id v6 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v9];
    if (([v6 isPrivateBrowsing] & 1) == 0)
    {
      id v7 = [v6 profileIdentifier];
      [(WBWindowState *)self->_windowState setActiveProfileIdentifier:v7];
    }
    [(WBWindowState *)self->_windowState setActiveTabGroupUUID:v9 forProfileWithIdentifier:self->_activeProfileIdentifier];
    uint64_t v8 = [(WBTabGroupManager *)self->_tabGroupManager tabCollection];
    [v8 saveWindowState:self->_windowState completionHandler:0];
  }
}

- (void)willClose
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v3 = [(WBWindowState *)self->_windowState unnamedTabGroupUUIDs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if (v8) {
          [(WBTabGroupManager *)self->_tabGroupManager removeTabGroup:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __58__WBProfileWindow_setUnnamedTabGroupDisplayTitleProvider___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 _displayTitleProviderForTabGroupWithUUID:v3];
  [v4 setDisplayTitleProvider:v5];
}

- (id)existingUnnamedTabGroupForProfileWithIdentifier:(id)a3
{
  id v4 = [(WBTabGroupManager *)self->_tabGroupManager unnamedTabGroupsForProfileWithIdentifier:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__WBProfileWindow_existingUnnamedTabGroupForProfileWithIdentifier___block_invoke;
  v7[3] = &unk_2643D9A78;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v7);

  return v5;
}

uint64_t __67__WBProfileWindow_existingUnnamedTabGroupForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id v4 = [v2 unnamedTabGroupUUIDs];
  id v5 = [v3 uuid];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  id v20 = a4;
  uint64_t v6 = objc_msgSend(a3, "removedTabGroupWithUUID:");
  uint64_t v7 = [v6 profileIdentifier];
  if ([v7 length])
  {
    uint64_t v8 = [(WBTabGroupManager *)self->_tabGroupManager profileWithIdentifier:v7];
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    long long v10 = [(WBWindowState *)self->_windowState unnamedTabGroupUUIDs];
    int v11 = [v10 containsObject:v20];

    if (v11)
    {
      [(WBWindowState *)self->_windowState removeUnnamedTabGroupUUID:v20];
      [(WBWindowState *)self->_windowState removeActiveTabGroupUUIDForProfileWithIdentifier:v7];
      if ([(WBProfileWindow *)self canSwitchProfiles])
      {
        if ([(WBProfileWindow *)self _isProfileActive:v7])
        {
          long long v12 = [(WBTabGroupManager *)self->_tabGroupManager tabCollection];
          [v12 saveWindowState:self->_windowState completionHandler:&__block_literal_global];

          long long v13 = [(WBTabGroupManager *)self->_tabGroupManager defaultProfile];
          [WeakRetained profileWindow:self selectProfile:v13];
LABEL_13:
        }
      }
      else
      {
        [WeakRetained closeProfileWindow:self];
      }
    }
    else
    {
      uint64_t v14 = [v6 uuid];
      int v15 = [v14 isEqual:self->_activeTabGroupUUID];

      if (v15)
      {
        long long v13 = [(WBTabGroupManager *)self->_tabGroupManager profileWithIdentifier:self->_activeProfileIdentifier];
        uint64_t v16 = [(WBTabGroupManager *)self->_tabGroupManager defaultProfile];
        int v17 = [v13 isEqual:v16];

        if (v17)
        {
          v18 = [(WBWindowState *)self->_windowState localTabGroup];
          [WeakRetained profileWindow:self selectTabGroup:v18];
        }
        else
        {
          v18 = [v8 identifier];
          v19 = [(WBProfileWindow *)self existingUnnamedTabGroupForProfileWithIdentifier:v18];
          [WeakRetained profileWindow:self selectTabGroup:v19];
        }
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

void __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
{
  id v8 = a4;
  uint64_t v5 = -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](self, "existingUnnamedTabGroupForProfileWithIdentifier:");
  if (v5)
  {
    [(WBTabGroupManager *)self->_tabGroupManager removeTabGroup:v5];
    if ([(WBProfileWindow *)self _isProfileActive:v8])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ([(WBProfileWindow *)self canSwitchProfiles])
      {
        uint64_t v7 = [(WBTabGroupManager *)self->_tabGroupManager defaultProfile];
        [WeakRetained profileWindow:self selectProfile:v7];
      }
      else
      {
        [WeakRetained closeProfileWindow:self];
      }
    }
  }
}

uint64_t __60__WBProfileWindow__attachLocalGroupToDefaultProfileIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 setProfileIdentifier:*MEMORY[0x263F66420]];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (id)_displayTitleProviderForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WBProfileWindow__displayTitleProviderForTabGroupWithUUID___block_invoke;
  v8[3] = &unk_2643D9AE8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x21D4A1230](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

__CFString *__60__WBProfileWindow__displayTitleProviderForTabGroupWithUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && (id v4 = (void (**)(id, void *))WeakRetained[7]) != 0)
  {
    id v5 = [WeakRetained[1] tabGroupWithUUID:*(void *)(a1 + 32)];
    v4[2](v4, v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = &stru_26CC2ED50;
  }

  return v6;
}

- (id)_findOrCreateUnnamedTabGroupForProfile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqual:*MEMORY[0x263F66420]];

  if (v6)
  {
    id v7 = [(WBWindowState *)self->_windowState localTabGroup];
  }
  else
  {
    id v8 = [v4 identifier];
    id v9 = [(WBProfileWindow *)self existingUnnamedTabGroupForProfileWithIdentifier:v8];

    if (v9)
    {
      id v10 = [v9 displayTitleProvider];

      if (!v10)
      {
        tabGroupManager = self->_tabGroupManager;
        long long v12 = [v9 uuid];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __58__WBProfileWindow__findOrCreateUnnamedTabGroupForProfile___block_invoke;
        v32[3] = &unk_2643D9B10;
        v32[4] = self;
        [(WBTabGroupManager *)tabGroupManager updateTabGroupWithUUID:v12 persist:0 usingBlock:v32];
      }
      id v7 = v9;
    }
    else
    {
      windowState = self->_windowState;
      uint64_t v14 = [v4 identifier];
      int v15 = [v4 deviceIdentifier];
      uint64_t v16 = [(WBWindowState *)windowState localOrUnnamedTabGroupForRestoration:0 inProfileWithIdentifier:v14 deviceIdentifier:v15];

      int v17 = [v16 uuid];
      v18 = [(WBProfileWindow *)self _displayTitleProviderForTabGroupWithUUID:v17];
      [v16 setDisplayTitleProvider:v18];

      v19 = [v4 identifier];
      [v16 setProfileIdentifier:v19];

      id v20 = [(WBTabGroupManager *)self->_tabGroupManager insertUnnamedTabGroup:v16];
      v21 = [(WBTabGroupManager *)self->_tabGroupManager tabCollection];
      char v22 = [v21 saveWindowState:self->_windowState];

      if (v22)
      {
        id v7 = v20;
      }
      else
      {
        uint64_t v23 = WBS_LOG_CHANNEL_PREFIXProfiles();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[WBProfileWindow _findOrCreateUnnamedTabGroupForProfile:](v23, v24, v25, v26, v27, v28, v29, v30);
        }
        id v7 = 0;
      }
    }
  }

  return v7;
}

void __58__WBProfileWindow__findOrCreateUnnamedTabGroupForProfile___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 uuid];
  id v4 = [v2 _displayTitleProviderForTabGroupWithUUID:v5];
  [v3 setDisplayTitleProvider:v4];
}

- (BOOL)_isProfileActive:(id)a3
{
  return [a3 isEqual:self->_activeProfileIdentifier];
}

- (id)_lastActiveTabGroupForProfile:(id)a3
{
  windowState = self->_windowState;
  id v5 = [a3 identifier];
  int v6 = [(WBWindowState *)windowState activeTabGroupUUIDForProfileWithIdentifier:v5];

  if (v6)
  {
    id v7 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (BOOL)canSwitchProfiles
{
  return self->_canSwitchProfiles;
}

- (WBProfileWindowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBProfileWindowDelegate *)WeakRetained;
}

- (id)unnamedTabGroupDisplayTitleProvider
{
  return self->_unnamedTabGroupDisplayTitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unnamedTabGroupDisplayTitleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_windowState, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
}

void __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_attachUnnamedTabGroupToProfileWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_findOrCreateUnnamedTabGroupForProfile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end