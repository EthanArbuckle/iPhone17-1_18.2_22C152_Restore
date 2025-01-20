@interface UIMenu(RecentlyClosedTabs)
+ (id)safari_recentlyClosedTabsMenuForProfile:()RecentlyClosedTabs showProfileTitle:openHandler:;
+ (id)safari_recentlyClosedTabsMenuItemsForProfile:()RecentlyClosedTabs openHandler:;
@end

@implementation UIMenu(RecentlyClosedTabs)

+ (id)safari_recentlyClosedTabsMenuForProfile:()RecentlyClosedTabs showProfileTitle:openHandler:
{
  id v7 = a3;
  id v8 = a5;
  v9 = _WBSLocalizedString();
  if (a4)
  {
    v10 = NSString;
    v11 = _WBSLocalizedString();
    v12 = [v7 title];
    uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

    v9 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x1E4FB1970];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuForProfile_showProfileTitle_openHandler___block_invoke;
  v19[3] = &unk_1E6D78F70;
  id v20 = v7;
  id v21 = v8;
  id v15 = v8;
  id v16 = v7;
  v17 = objc_msgSend(v14, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", v9, 0, 0, 9, v19);

  return v17;
}

+ (id)safari_recentlyClosedTabsMenuItemsForProfile:()RecentlyClosedTabs openHandler:
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F78550];
  id v7 = a3;
  id v8 = [v6 sharedBrowserSavedState];
  v9 = [v7 identifier];

  v10 = [v8 recentlyClosedTabsForProfileWithIdentifier:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__UIMenu_RecentlyClosedTabs__safari_recentlyClosedTabsMenuItemsForProfile_openHandler___block_invoke;
  v14[3] = &unk_1E6D78F98;
  id v15 = v5;
  id v11 = v5;
  v12 = objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v14);

  return v12;
}

@end