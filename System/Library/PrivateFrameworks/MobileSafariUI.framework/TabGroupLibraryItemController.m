@interface TabGroupLibraryItemController
- (BOOL)_isPrivateBrowsingAndLocked;
- (BOOL)_sessionContainsLocalTabs:(id)a3;
- (BOOL)_sessionContainsTabGroup:(id)a3;
- (BOOL)allowsMoveOperation;
- (BOOL)hasSubitems;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isSelected;
- (BOOL)isSpringLoaded;
- (BOOL)isTabGroupSynced;
- (BOOL)shouldPersistSelection;
- (TabGroupLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 tabGroup:(id)a5 tab:(id)a6;
- (WBTab)tab;
- (WBTabGroup)tabGroup;
- (id)accessibilityIdentifier;
- (id)accessories;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dragItems;
- (id)pinnedAccessory;
- (id)subitems;
- (id)swipeActionsConfiguration;
- (id)tabGroupProvider;
- (int64_t)dropIntentForSession:(id)a3;
- (unint64_t)dropOperationForSession:(id)a3;
- (unint64_t)hash;
- (void)didSelectItem;
- (void)performDropWithProposal:(id)a3 session:(id)a4;
- (void)updateListContentConfiguration:(id)a3;
- (void)willDisplayCell:(id)a3;
- (void)willToggleExpansionState;
@end

@implementation TabGroupLibraryItemController

- (TabGroupLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 tabGroup:(id)a5 tab:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TabGroupLibraryItemController;
  v13 = [(LibraryItemController *)&v17 initWithConfiguration:a3 sectionController:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tabGroup, a5);
    objc_storeStrong((id *)&v14->_tab, a6);
    v15 = v14;
  }

  return v14;
}

- (id)swipeActionsConfiguration
{
  tab = self->_tab;
  v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  v5 = v4;
  if (tab) {
    [v4 swipeActionsConfigurationForTab:self->_tab inTabGroup:self->_tabGroup];
  }
  else {
  v6 = [v4 swipeActionsConfigurationForTabGroup:self->_tabGroup forPickerSheet:0];
  }

  return v6;
}

- (unint64_t)hash
{
  if (self->_tab) {
    tab = self->_tab;
  }
  else {
    tab = self->_tabGroup;
  }
  v3 = [(WBTab *)tab uuid];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    char v9 = 0;
    goto LABEL_7;
  }
  v5 = [(WBTab *)self->_tab uuid];
  v6 = [v4 tab];
  v7 = [v6 uuid];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    if (!self->_tab)
    {
      v10 = [v4 tab];

      if (!v10)
      {
        id v12 = [(WBTabGroup *)self->_tabGroup uuid];
        v13 = [v4 tabGroup];
        v14 = [v13 uuid];
        char v9 = [v12 isEqualToString:v14];

        goto LABEL_7;
      }
    }
    goto LABEL_6;
  }
  char v9 = 1;
LABEL_7:

  return v9;
}

- (id)tabGroupProvider
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 tabGroupProvider];

  return v3;
}

- (BOOL)isTabGroupSynced
{
  return [(WBTabGroup *)self->_tabGroup isNamed];
}

- (void)updateListContentConfiguration:(id)a3
{
  id v20 = a3;
  id v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  v5 = v4;
  if (self->_tab)
  {
    v6 = [v20 imageProperties];
    objc_msgSend(v6, "setMaximumSize:", 16.0, 16.0);

    v7 = [v20 imageProperties];
    objc_msgSend(v7, "setReservedLayoutSize:", 16.0, 16.0);

    char v8 = -[WBTab displayTitle](self->_tab);
    [v20 setText:v8];
LABEL_3:

    goto LABEL_7;
  }
  char v9 = [v4 imageForTabGroup:self->_tabGroup];
  [v20 setImage:v9];

  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v12 = [v20 imageProperties];
  objc_msgSend(v12, "setMaximumSize:", v10, v11);

  v13 = [v20 imageProperties];
  objc_msgSend(v13, "setReservedLayoutSize:", v10, v11);

  v14 = [(WBTabGroup *)self->_tabGroup displayTitle];
  [v20 setText:v14];

  if ([v5 hasMultipleProfiles]
    && ([(WBTabGroup *)self->_tabGroup isNamed] & 1) == 0
    && ([(WBTabGroup *)self->_tabGroup isPrivateBrowsing] & 1) == 0)
  {
    char v8 = [v5 activeProfile];
    tabGroup = self->_tabGroup;
    v16 = [v20 secondaryTextProperties];
    objc_super v17 = [v16 resolvedColor];
    v18 = +[ToolbarItemConfiguration attributedTitleForTabGroup:tabGroup inProfile:v8 primaryColor:0 secondaryColor:v17];
    [v20 setAttributedText:v18];

    v19 = [v8 symbolImage];
    [v20 setImage:v19];

    goto LABEL_3;
  }
LABEL_7:
}

- (id)pinnedAccessory
{
  pinnedAccessory = self->_pinnedAccessory;
  if (!pinnedAccessory)
  {
    id v4 = [ActionCellAccessory alloc];
    v5 = (void *)MEMORY[0x1E4FB13F0];
    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pin"];
    v7 = [v5 actionWithTitle:&stru_1F3C268E8 image:v6 identifier:0 handler:&__block_literal_global_44];
    char v8 = [(ActionCellAccessory *)v4 initWithAction:v7];

    char v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
    [(ActionCellAccessory *)v8 setPreferredSymbolConfiguration:v9];

    double v10 = [(ActionCellAccessory *)v8 customView];
    [v10 setUserInteractionEnabled:0];

    double v11 = self->_pinnedAccessory;
    self->_pinnedAccessory = v8;

    pinnedAccessory = self->_pinnedAccessory;
  }
  return pinnedAccessory;
}

- (id)accessories
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(WBTab *)self->_tab isPinned])
  {
    v3 = [(TabGroupLibraryItemController *)self pinnedAccessory];
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (void)didSelectItem
{
  id v14 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  if (self->_tab)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    id v4 = [(WBTab *)self->_tab uuid];
    v5 = (void *)[v3 initWithUUIDString:v4];
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v7 = [(WBTabGroup *)self->_tabGroup uuid];
    char v8 = (void *)[v6 initWithUUIDString:v7];
    [v14 switchToTabWithUUID:v5 inTabGroupWithUUID:v8];
  }
  else
  {
    if ([(WBTabGroup *)self->_tabGroup isLocal])
    {
      char v9 = [MEMORY[0x1E4F97E48] sharedLogger];
      double v10 = v9;
      uint64_t v11 = 0;
    }
    else
    {
      int v12 = [(WBTabGroup *)self->_tabGroup isPrivateBrowsing];
      char v9 = [MEMORY[0x1E4F97E48] sharedLogger];
      double v10 = v9;
      if (v12) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    [v9 didUseSidebarAction:v11];

    v13 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v13 didSwitchToTabGroupFromLocation:0];

    if ([v14 scrollTabSwitcherToTabGroupIfShowing:self->_tabGroup]) {
      goto LABEL_11;
    }
    id v4 = [(WBTabGroup *)self->_tabGroup uuid];
    [v14 setActiveTabGroupUUID:v4];
  }

LABEL_11:
}

- (BOOL)isSelected
{
  if (self->_tab)
  {
    id v3 = [(TabGroupLibraryItemController *)self tabGroupProvider];
    id v4 = [v3 defaultTabToSelectInTabGroup:self->_tabGroup];
    char v5 = WBSIsEqual();

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 1;
  }
  v7 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  char v8 = [v7 activeTabGroupOrTabGroupVisibleInSwitcher];
  int v9 = WBSIsEqual();

  double v10 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  uint64_t v11 = [(WBTabGroup *)self->_tabGroup uuid];
  int v12 = [v10 isTabGroupUUIDExpanded:v11];

  int v13 = v9 ^ 1;
  if ((v6 & 1) == 0 && (v13 & 1) == 0 && v12) {
    return 1;
  }
  if (self->_tab) {
    int v15 = 1;
  }
  else {
    int v15 = v12;
  }
  if ((v15 | v13)) {
    return 0;
  }
  v16 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  objc_super v17 = [v16 activeLibraryType];
  BOOL v14 = v17 == 0;

  return v14;
}

- (BOOL)shouldPersistSelection
{
  if (self->_tab) {
    return 1;
  }
  id v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  char v5 = [(WBTabGroup *)self->_tabGroup uuid];
  char v6 = [v4 isTabGroupUUIDExpanded:v5];

  return v6 ^ 1;
}

- (id)accessibilityIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (self->_tab)
  {
    v2 = @"TabLibraryItem";
  }
  else
  {
    v8[0] = @"isSyncable";
    if ([(WBTabGroup *)self->_tabGroup isSyncable]) {
      id v4 = @"true";
    }
    else {
      id v4 = @"false";
    }
    v8[1] = @"isPrivate";
    v9[0] = v4;
    if ([(WBTabGroup *)self->_tabGroup isPrivateBrowsing]) {
      char v5 = @"true";
    }
    else {
      char v5 = @"false";
    }
    v9[1] = v5;
    char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    WBSMakeAccessibilityIdentifier();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)hasSubitems
{
  if (self->_tab) {
    return 0;
  }
  else {
    return ![(TabGroupLibraryItemController *)self _isPrivateBrowsingAndLocked];
  }
}

- (BOOL)_isPrivateBrowsingAndLocked
{
  int v2 = [(WBTabGroup *)self->_tabGroup isPrivateBrowsing];
  if (v2)
  {
    id v3 = +[Application sharedApplication];
    char v4 = [v3 isPrivateBrowsingLocked];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)subitems
{
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  char v4 = [(LibraryItemController *)self configuration];
  char v5 = [(WBTabGroup *)self->_tabGroup tabs];
  char v6 = [v4 pinnedTabsManager];
  if ([(WBTabGroup *)self->_tabGroup isLocal])
  {
    uint64_t v7 = [v6 pinnedTabs];
LABEL_5:
    char v8 = (void *)v7;
    [v3 addObjectsFromArray:v7];
LABEL_6:

    goto LABEL_7;
  }
  if ([(WBTabGroup *)self->_tabGroup isPrivateBrowsing])
  {
    uint64_t v7 = [v6 privatePinnedTabs];
    goto LABEL_5;
  }
  if ([(WBTabGroup *)self->_tabGroup isUnnamed])
  {
    char v8 = [(WBTabGroup *)self->_tabGroup profileIdentifier];
    BOOL v14 = +[PinnedTabsContainer containerWithActiveProfileIdentifier:v8];
    int v15 = [v6 pinnedTabsInContainer:v14];
    [v3 addObjectsFromArray:v15];

    goto LABEL_6;
  }
LABEL_7:
  int v9 = objc_msgSend(v5, "safari_partionedArrayUsingCondition:", &__block_literal_global_37_0);

  [v3 addObjectsFromArray:v9];
  double v10 = [v3 array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__TabGroupLibraryItemController_subitems__block_invoke_2;
  v16[3] = &unk_1E6D7BFC8;
  id v17 = v4;
  v18 = self;
  id v11 = v4;
  int v12 = objc_msgSend(v10, "safari_mapObjectsUsingBlock:", v16);

  return v12;
}

uint64_t __41__TabGroupLibraryItemController_subitems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

TabGroupLibraryItemController *__41__TabGroupLibraryItemController_subitems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [TabGroupLibraryItemController alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = [*(id *)(a1 + 40) sectionController];
  uint64_t v7 = [(TabGroupLibraryItemController *)v4 initWithConfiguration:v5 sectionController:v6 tabGroup:*(void *)(*(void *)(a1 + 40) + 56) tab:v3];

  return v7;
}

- (BOOL)isExpanded
{
  if (self->_tab || [(TabGroupLibraryItemController *)self _isPrivateBrowsingAndLocked]) {
    return 0;
  }
  char v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  uint64_t v5 = [(WBTabGroup *)self->_tabGroup uuid];
  char v6 = [v4 isTabGroupUUIDExpanded:v5];

  return v6;
}

- (void)willToggleExpansionState
{
  id v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
  id v3 = [(WBTabGroup *)self->_tabGroup uuid];
  [v4 toggleTabGroupUUIDExpanded:v3];
}

- (void)willDisplayCell:(id)a3
{
  id v4 = a3;
  if (self->_tab)
  {
    v18 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v18;
    if (isKindOfClass)
    {
      id v6 = v18;
      uint64_t v7 = [(WBTab *)self->_tab uuid];
      char v8 = [v6 tabIconRegistration];
      int v9 = [v8 identifier];
      double v10 = [v9 UUIDString];
      char v11 = WBSIsEqual();

      if ((v11 & 1) == 0)
      {
        int v12 = [(LibraryItemController *)self configuration];
        int v13 = [v12 tabIconPool];
        id v14 = objc_alloc(MEMORY[0x1E4F29128]);
        int v15 = [(WBTab *)self->_tab uuid];
        v16 = (void *)[v14 initWithUUIDString:v15];
        id v17 = [v13 makeRegistrationForIdentifier:v16];
        [v6 setTabIconRegistration:v17];
      }
      id v4 = v18;
    }
  }
}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (BOOL)allowsMoveOperation
{
  return self->_tab || [(TabGroupLibraryItemController *)self isTabGroupSynced];
}

- (id)dragItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(TabGroupLibraryItemController *)self _isPrivateBrowsingAndLocked])
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (self->_tab)
    {
      id v4 = [(TabGroupLibraryItemController *)self tabGroupProvider];
      uint64_t v5 = [v4 dragItemForTab:self->_tab tabItem:0];
      v8[0] = v5;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      id v4 = objc_msgSend(MEMORY[0x1E4FB1710], "_sf_itemWithTabGroup:", self->_tabGroup);
      uint64_t v7 = v4;
      id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    }
  }
  return v3;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TabGroupLibraryItemController *)self _isPrivateBrowsingAndLocked])
  {
    unint64_t v5 = 1;
  }
  else
  {
    [v4 items];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v5 = 0;
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([(TabGroupLibraryItemController *)self isTabGroupSynced])
          {
            int v12 = objc_msgSend(v11, "_sf_localTabGroup");

            if (v12)
            {
              unint64_t v5 = 3;
              goto LABEL_25;
            }
          }
          int v13 = objc_msgSend(v11, "_sf_localBookmark");

          if (v13)
          {
            unint64_t v5 = 2;
          }
          else
          {
            id v14 = objc_msgSend(v11, "safari_localWBTab");
            int v15 = v14;
            if (v14)
            {
              if (([v14 isPinned] & 1) != 0
                || (int v16 = [v15 isPrivateBrowsing],
                    v16 != [(WBTabGroup *)self->_tabGroup isPrivateBrowsing]))
              {

                goto LABEL_24;
              }
              unint64_t v5 = 3;
            }
            else
            {
              id v17 = [v11 itemProvider];
              int v18 = [v17 canLoadObjectOfClass:objc_opt_class()];

              if (v18) {
                unint64_t v5 = 2;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_24:
      unint64_t v5 = 0;
    }
LABEL_25:
  }
  return v5;
}

- (int64_t)dropIntentForSession:(id)a3
{
  id v4 = a3;
  if ([(TabGroupLibraryItemController *)self _sessionContainsTabGroup:v4]
    || self->_tab && [(TabGroupLibraryItemController *)self _sessionContainsLocalTabs:v4])
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  objc_msgSend(a4, "items", a3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    unint64_t v8 = 0x1E4F1C000uLL;
    uint64_t v9 = &OBJC_IVAR___TabBarItemLayoutInfo__hidesTitleText;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "_sf_localTabGroup");
        if (v12)
        {
          v27 = (void *)v12;
          v28 = [(TabGroupLibraryItemController *)self tabGroupProvider];
          [v28 moveTabGroup:v27 beforeOrAfterTabGroup:*(Class *)((char *)&self->super.super.isa + v9[334])];

          v29 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v29 didUseSidebarAction:16];

          goto LABEL_20;
        }
        uint64_t v13 = objc_msgSend(v11, "_sf_localBookmark");
        if (v13)
        {
          id v14 = (void *)v13;
          int v15 = [(TabGroupLibraryItemController *)self tabGroupProvider];
          [v15 openBookmark:v14 inTabGroup:*(Class *)((char *)&self->super.super.isa + v9[334])];

          int v16 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v16 didUseSidebarAction:18];
LABEL_11:

          goto LABEL_12;
        }
        id v14 = objc_msgSend(v11, "safari_localWBTab");
        if (v14)
        {
          int v16 = [(TabGroupLibraryItemController *)self tabGroupProvider];
          id v17 = [v14 tabGroupUUID];
          [*(id *)((char *)&self->super.super.isa + v9[334]) uuid];
          v19 = unint64_t v18 = v8;
          [v16 moveTab:v14 fromTabGroupWithUUID:v17 toTabGroupWithUUID:v19 afterTab:self->_tab];

          unint64_t v8 = v18;
          uint64_t v9 = &OBJC_IVAR___TabBarItemLayoutInfo__hidesTitleText;

          goto LABEL_11;
        }
        long long v20 = [v11 itemProvider];
        unint64_t v21 = v8;
        int v22 = [v20 canLoadObjectOfClass:objc_opt_class()];

        if (v22)
        {
          long long v23 = *(void **)(v21 + 2832);
          v36 = v11;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __65__TabGroupLibraryItemController_performDropWithProposal_session___block_invoke;
          v31[3] = &unk_1E6D78008;
          v31[4] = self;
          objc_msgSend(v23, "_sf_urlsFromDragItems:completionHandler:", v24, v31);

          uint64_t v25 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v25 didUseSidebarAction:18];
        }
        unint64_t v8 = v21;
        uint64_t v9 = &OBJC_IVAR___TabBarItemLayoutInfo__hidesTitleText;
LABEL_12:

        ++v10;
      }
      while (v6 != v10);
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      uint64_t v6 = v26;
    }
    while (v26);
  }
LABEL_20:
}

void __65__TabGroupLibraryItemController_performDropWithProposal_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) tabGroupProvider];
        [v9 openURL:v8 inTabGroup:*(void *)(*(void *)(a1 + 32) + 56)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)_sessionContainsLocalTabs:(id)a3
{
  id v3 = [a3 items];
  char v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_45_1);

  return v4;
}

BOOL __59__TabGroupLibraryItemController__sessionContainsLocalTabs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "safari_localWBTab");
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v2, "safari_localTab");
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)_sessionContainsTabGroup:(id)a3
{
  id v3 = [a3 items];
  char v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_47_1);

  return v4;
}

BOOL __58__TabGroupLibraryItemController__sessionContainsTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "_sf_localTabGroup");
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; tabGroup = %@, tab = %@>",
    v5,
    self,
    self->_tabGroup,
  uint64_t v6 = self->_tab);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = [TabGroupLibraryItemController alloc];
  uint64_t v5 = [(LibraryItemController *)self configuration];
  uint64_t v6 = [(LibraryItemController *)self sectionController];
  uint64_t v7 = [(TabGroupLibraryItemController *)v4 initWithConfiguration:v5 sectionController:v6 tabGroup:self->_tabGroup tab:self->_tab];

  return v7;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTab)tab
{
  return self->_tab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_pinnedAccessory, 0);
}

@end