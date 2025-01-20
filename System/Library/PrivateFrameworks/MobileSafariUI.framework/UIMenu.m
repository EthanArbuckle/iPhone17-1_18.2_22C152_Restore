@interface UIMenu
@end

@implementation UIMenu

id __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4FB1970], "safari_recentlyClosedTabsMenuItemsForProfile:openHandler:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v2 = objc_msgSend(v1, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_7);

  return v2;
}

id __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x1E4FB13F0];
  v4 = [v2 title];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_3;
  v9[3] = &unk_1E6D78F48;
  id v10 = v2;
  id v5 = v2;
  v6 = [v3 actionWithTitle:v4 image:0 identifier:0 handler:v9];

  v7 = [v5 subtitle];
  [v6 setDiscoverabilityTitle:v7];

  return v6;
}

void __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) action];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) action];
    v3[2]();
  }
}

MenuItemModel *__87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 title];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [v3 url];
  v7 = objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
  v8 = objc_msgSend(v7, "safari_stringForListDisplay");

  if ([v4 length] || objc_msgSend(v8, "length"))
  {
    v9 = [MenuItemModel alloc];
    if ([v4 length]) {
      id v10 = v4;
    }
    else {
      id v10 = v8;
    }
    if ([v4 length]) {
      v11 = v8;
    }
    else {
      v11 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke_2;
    v14[3] = &unk_1E6D78748;
    id v15 = v3;
    id v16 = *(id *)(a1 + 32);
    v12 = [(MenuItemModel *)v9 initWithTitle:v10 subtitle:v11 payload:v15 action:v14];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
  [v2 loadSessionStateDataAndRemoveRecentlyClosedTab:*(void *)(a1 + 32)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

@end