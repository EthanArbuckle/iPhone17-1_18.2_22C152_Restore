@interface TabMenuProvider
+ (id)_bottomMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
+ (id)_closeActionForTab:(id)a3 dataSource:(id)a4;
+ (id)_closeActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5;
+ (id)_closeOtherTabsActionForTab:(id)a3 dataSource:(id)a4;
+ (id)_closeOtherTabsActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5;
+ (id)_copyActionsForTab:(id)a3 options:(unint64_t)a4;
+ (id)_copyMenuForTabGroupTab:(id)a3;
+ (id)_mainMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
+ (id)_moveMenuForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5;
+ (id)_pinTabActionForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5;
+ (id)_readerActionForTabDocument:(id)a3;
+ (id)_shareCommand;
+ (id)_sortMenuForTab:(id)a3 dataSource:(id)a4;
+ (id)_stopReloadActionForTabDocument:(id)a3;
+ (id)_toggleVoiceSearchActionForTabDocument:(id)a3;
+ (id)actionProviderForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
+ (id)actionProviderForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5 options:(unint64_t)a6;
+ (id)bookmarkActionForTabGroup:(id)a3 dataSource:(id)a4;
+ (id)copyLinksActionForTabGroup:(id)a3;
+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4;
+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4 showTitle:(BOOL)a5 dismissHandler:(id)a6;
+ (id)moveMenuForTabGroup:(id)a3 dataSource:(id)a4;
+ (id)pinTabActionForTab:(id)a3 dataSource:(id)a4;
+ (id)sortMenuForTabGroup:(id)a3 dataSource:(id)a4;
@end

@implementation TabMenuProvider

+ (id)actionProviderForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = [a1 _mainMenuForTab:v8 dataSource:v9 options:a5];
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

  if ((a5 & 0x44) == 4)
  {
    v12 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_bookmarkMenu");
    [v10 addObject:v12];
  }
  v13 = [a1 _bottomMenuForTab:v8 dataSource:v9 options:a5];
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v13);

  if ([v10 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__TabMenuProvider_actionProviderForTab_dataSource_options___block_invoke;
    v16[3] = &unk_1E6D7CF48;
    id v17 = v10;
    v14 = (void *)MEMORY[0x1E4E42950](v16);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __59__TabMenuProvider_actionProviderForTab_dataSource_options___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB1970] menuWithChildren:*(void *)(a1 + 32)];
}

+ (id)actionProviderForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5 options:(unint64_t)a6
{
  __int16 v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = (void *)[a1 _copyMenuForTabGroupTab:v10];
  objc_msgSend(v13, "safari_addObjectUnlessNil:", v14);

  if ((v6 & 0x1000) != 0)
  {
    v20 = [a1 _pinTabActionForTabGroupTab:v10 inTabGroup:v11 dataSource:v12];
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v20);

    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v21 = [a1 _moveMenuForTabGroupTab:v10 inTabGroup:v11 dataSource:v12];
  objc_msgSend(v13, "safari_addObjectUnlessNil:", v21);

  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v22 = [a1 sortMenuForTabGroup:v11 dataSource:v12];
  objc_msgSend(v13, "safari_addObjectUnlessNil:", v22);

  if ((v6 & 2) != 0)
  {
LABEL_5:
    v15 = [a1 _closeActionForTab:v10 inBackgroundTabGroup:v11 dataSource:v12];
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v15);

    v16 = [a1 _closeOtherTabsActionForTab:v10 inBackgroundTabGroup:v11 dataSource:v12];
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v16);
  }
LABEL_6:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__TabMenuProvider_actionProviderForTabGroupTab_inTabGroup_dataSource_options___block_invoke;
  v23[3] = &unk_1E6D7CF48;
  id v24 = v13;
  id v17 = v13;
  v18 = (void *)MEMORY[0x1E4E42950](v23);

  return v18;
}

uint64_t __78__TabMenuProvider_actionProviderForTabGroupTab_inTabGroup_dataSource_options___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB1970] menuWithChildren:*(void *)(a1 + 32)];
}

+ (id)bookmarkActionForTabGroup:(id)a3 dataSource:(id)a4
{
  id v5 = a4;
  __int16 v6 = [a3 unpinnedTabs];
  v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_50);

  uint64_t v8 = [v7 count];
  if (v8)
  {
    uint64_t v9 = v8;
    if (v8 == 1)
    {
      id v10 = _WBSLocalizedString();
    }
    else
    {
      id v12 = NSString;
      v13 = _WBSLocalizedString();
      id v10 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
    }
    v14 = (void *)MEMORY[0x1E4FB13F0];
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"book"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke_2;
    v17[3] = &unk_1E6D7BF00;
    id v18 = v5;
    id v19 = v7;
    id v11 = [v14 actionWithTitle:v10 image:v15 identifier:0 handler:v17];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlank] ^ 1;
}

uint64_t __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addBookmarkFolderForTabs:*(void *)(a1 + 40)];
}

+ (id)copyLinksActionForTabGroup:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 tabCountForPasteboard];
  if (v4)
  {
    uint64_t v5 = v4;
    if (v4 == 1)
    {
      __int16 v6 = _WBSLocalizedString();
    }
    else
    {
      uint64_t v8 = NSString;
      uint64_t v9 = _WBSLocalizedString();
      __int16 v6 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v5);
    }
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"link"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__TabMenuProvider_copyLinksActionForTabGroup___block_invoke;
    v13[3] = &unk_1E6D78F48;
    id v14 = v3;
    v7 = [v10 actionWithTitle:v6 image:v11 identifier:0 handler:v13];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __46__TabMenuProvider_copyLinksActionForTabGroup___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  objc_msgSend(v2, "safari_copyLinksForTabGroup:", *(void *)(a1 + 32));
}

+ (id)moveMenuForTabGroup:(id)a3 dataSource:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 hasMultipleProfiles] && objc_msgSend(v5, "isNamed"))
  {
    v20[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __50__TabMenuProvider_moveMenuForTabGroup_dataSource___block_invoke;
    id v17 = &unk_1E6D7CF70;
    id v18 = v6;
    id v19 = v5;
    uint64_t v8 = [v18 profilesMenuElementsWithOptions:3 movingSelectedTabGroups:v7 actionHandler:&v14];

    uint64_t v9 = (void *)MEMORY[0x1E4FB1970];
    id v10 = _WBSLocalizedString();
    id v11 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"arrow.up.forward.app", v14, v15, v16, v17);
    id v12 = [v9 menuWithTitle:v10 image:v11 identifier:0 options:0 children:v8];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __50__TabMenuProvider_moveMenuForTabGroup_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) moveTabGroup:*(void *)(a1 + 40) toProfile:a2];
}

+ (id)_copyMenuForTabGroupTab:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB1A78];
  id v4 = a3;
  id v5 = [v3 generalPasteboard];
  id v6 = [v4 url];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v8 = _WBSLocalizedString();
    uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __43__TabMenuProvider__copyMenuForTabGroupTab___block_invoke;
    id v18 = &unk_1E6D7BF00;
    id v19 = v5;
    id v20 = v6;
    id v10 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:&v15];

    objc_msgSend(v10, "setAccessibilityIdentifier:", @"CopyButton", v15, v16, v17, v18);
    id v11 = (void *)MEMORY[0x1E4FB1970];
    v21[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v13 = [v11 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __43__TabMenuProvider__copyMenuForTabGroupTab___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setURL:*(void *)(a1 + 40)];
}

+ (id)_moveMenuForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 || ([v7 isPrivateBrowsing] & 1) != 0 || (objc_msgSend(v7, "isPinned") & 1) != 0)
  {
    id v10 = 0;
  }
  else
  {
    id v12 = [v7 url];
    v13 = objc_msgSend(v12, "safari_userVisibleHostWithoutWWWSubdomain");
    if (![v13 length] || (objc_msgSend(v12, "safari_isHTTPFamilyURL") & 1) == 0)
    {
      uint64_t v14 = [v7 title];

      v13 = (void *)v14;
    }
    v24[0] = v7;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __65__TabMenuProvider__moveMenuForTabGroupTab_inTabGroup_dataSource___block_invoke;
    v20[3] = &unk_1E6D7CF98;
    id v21 = v9;
    id v22 = v7;
    id v23 = v8;
    uint64_t v16 = [v21 tabGroupsMenuElementsWithOptions:23 newTabGroupName:0 hostTitle:v13 descendantCount:0 movingSelectedTabs:v15 actionHandler:v20];

    id v17 = (void *)MEMORY[0x1E4FB1970];
    id v18 = _WBSLocalizedString();
    id v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
    id v10 = [v17 menuWithTitle:v18 image:v19 identifier:0 options:0 children:v16];
  }
  return v10;
}

void __65__TabMenuProvider__moveMenuForTabGroupTab_inTabGroup_dataSource___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    id v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    id v4 = (void *)a1[6];
    id v5 = a2;
    id v7 = [v4 uuid];
    id v6 = [v5 uuid];

    [v2 moveTab:v3 fromTabGroupWithUUID:v7 toTabGroupWithUUID:v6 afterTab:0];
  }
}

+ (id)sortMenuForTabGroup:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 unpinnedTabs];
  if ((unint64_t)[v7 count] >= 2)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    id v11 = _WBSLocalizedString();
    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke;
    v30[3] = &unk_1E6D7BF00;
    id v13 = v6;
    id v31 = v13;
    id v14 = v5;
    id v32 = v14;
    uint64_t v15 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v30];
    [v9 addObject:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4FB13F0];
    id v17 = _WBSLocalizedString();
    id v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"globe"];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke_2;
    v27 = &unk_1E6D7BF00;
    id v28 = v13;
    id v29 = v14;
    id v19 = [v16 actionWithTitle:v17 image:v18 identifier:0 handler:&v24];
    objc_msgSend(v9, "addObject:", v19, v24, v25, v26, v27);

    id v20 = (void *)MEMORY[0x1E4FB1970];
    id v21 = _WBSLocalizedString();
    id v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
    id v8 = [v20 menuWithTitle:v21 image:v22 identifier:0 options:0 children:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) uuid];
  [v1 sortTabsInTabGroupWithUUIDString:v2 withSortMode:0];
}

void __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) uuid];
  [v1 sortTabsInTabGroupWithUUIDString:v2 withSortMode:1];
}

+ (id)_closeActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4FB13F0];
  id v11 = _WBSLocalizedString();
  id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__TabMenuProvider__closeActionForTab_inBackgroundTabGroup_dataSource___block_invoke;
  v18[3] = &unk_1E6D7CFC0;
  id v19 = v9;
  id v20 = v7;
  id v21 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  uint64_t v16 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v18];

  [v16 setAttributes:2];
  return v16;
}

void __70__TabMenuProvider__closeActionForTab_inBackgroundTabGroup_dataSource___block_invoke(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v2 didCloseTabWithTrigger:2 tabClosingAction:1 numberOfTabsClosed:1 tabCollectionViewType:1];

  uint64_t v3 = (void *)a1[4];
  v5[0] = a1[5];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 closeTabs:v4 inInactiveTabGroup:a1[6]];
}

+ (id)_closeOtherTabsActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isPinned])
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [v8 unpinnedTabs];
    if ((unint64_t)[v11 count] >= 2)
    {
      id v12 = (void *)MEMORY[0x1E4FB13F0];
      id v13 = _WBSLocalizedString();
      id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke;
      id v19 = &unk_1E6D7CFE8;
      id v20 = v11;
      id v21 = v7;
      id v22 = v9;
      id v23 = v8;
      id v10 = [v12 actionWithTitle:v13 image:v14 identifier:0 handler:&v16];

      objc_msgSend(v10, "setAttributes:", 2, v16, v17, v18, v19);
      [v10 setAccessibilityIdentifier:@"CloseOtherTabsButton"];
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

void __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke_2;
  v4[3] = &unk_1E6D7C398;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v4);
  [*(id *)(a1 + 48) closeTabs:v3 inInactiveTabGroup:*(void *)(a1 + 56)];
}

uint64_t __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

+ (id)_mainMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = (void *)[a1 _copyActionsForTab:v7 options:a5];
  [v8 addObjectsFromArray:v9];

  id v10 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v11 = v10;
  if (a5)
  {
    id v12 = objc_msgSend(v10, "safari_pasteAndNavigateCommand");
    objc_msgSend(v8, "safari_addObjectUnlessNil:", v12);
  }
  if ((~a5 & 0x44) == 0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_bookmarkMenu", 0);
    id v14 = [v13 children];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          [v8 addObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
  if ((a5 & 0x800) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = [a1 _toggleVoiceSearchActionForTabDocument:v7];
      objc_msgSend(v8, "safari_addObjectUnlessNil:", v19);
    }
  }
  if ([v8 count])
  {
    id v20 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v8];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)_copyActionsForTab:(id)a3 options:(unint64_t)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 urlForSharing];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    id v7 = _WBSLocalizedString();
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__TabMenuProvider__copyActionsForTab_options___block_invoke;
    v14[3] = &unk_1E6D7CFC0;
    id v15 = v4;
    id v16 = v5;
    id v17 = v6;
    id v10 = v6;
    id v11 = [v8 actionWithTitle:v7 image:v9 identifier:0 handler:v14];

    [v11 setAccessibilityIdentifier:@"CopyButton"];
    v18[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

void __46__TabMenuProvider__copyActionsForTab_options___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v3 = [*(id *)(a1 + 32) linkMetadataForSharing];
  if (v3) {
    objc_msgSend(v2, "safari_registerLinkMetadata:", v3);
  }
  [v2 registerObject:*(void *)(a1 + 40) visibility:0];
  v5[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [*(id *)(a1 + 48) setItemProviders:v4];
}

+ (id)_bottomMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  __int16 v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if ((v5 & 0x1000) != 0)
  {
    id v17 = [a1 pinTabActionForTab:v8 dataSource:v9];
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v17);

    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
LABEL_18:
      id v19 = [a1 _sortMenuForTab:v8 dataSource:v9];
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v19);

      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  id v18 = [a1 moveMenuForTab:v8 dataSource:v9];
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v18);

  if ((v5 & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    id v11 = [a1 _closeActionForTab:v8 dataSource:v9];
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

    id v12 = [a1 _closeOtherTabsActionForTab:v8 dataSource:v9];
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v12);
  }
LABEL_6:
  if ((v5 & 0x80) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [a1 _stopReloadActionForTabDocument:v8];
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v13);
    }
  }
  if ((v5 & 8) != 0)
  {
    id v14 = [a1 _shareCommand];
    [v10 addObject:v14];
  }
  if ((v5 & 0x100) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = [a1 _readerActionForTabDocument:v8];
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v15);
    }
  }
  if ([v10 count])
  {
    id v16 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v10];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)_toggleVoiceSearchActionForTabDocument:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F78500] sharedManager];
  uint64_t v5 = [v4 availability];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    id v7 = _WBSLocalizedString();
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"mic"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__TabMenuProvider__toggleVoiceSearchActionForTabDocument___block_invoke;
    v11[3] = &unk_1E6D78F48;
    id v12 = v3;
    id v9 = [v6 actionWithTitle:v7 image:v8 identifier:0 handler:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __58__TabMenuProvider__toggleVoiceSearchActionForTabDocument___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) browserController];
  [v1 toggleVoiceSearch];
}

+ (id)_stopReloadActionForTabDocument:(id)a3
{
  id v3 = a3;
  if ([v3 isBlank])
  {
    id v4 = 0;
  }
  else
  {
    char v5 = [v3 canStopLoading];
    if (v5) {
      id v6 = @"xmark";
    }
    else {
      id v6 = @"arrow.clockwise";
    }
    id v7 = _WBSLocalizedString();
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
    id v9 = (void *)MEMORY[0x1E4FB13F0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__TabMenuProvider__stopReloadActionForTabDocument___block_invoke;
    v11[3] = &unk_1E6D7C670;
    char v13 = v5;
    id v12 = v3;
    id v4 = [v9 actionWithTitle:v7 image:v8 identifier:0 handler:v11];
  }
  return v4;
}

uint64_t __51__TabMenuProvider__stopReloadActionForTabDocument___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 stopLoading];
  }
  else {
    return [v2 reload];
  }
}

+ (id)_shareCommand
{
  id v2 = (void *)MEMORY[0x1E4FB1638];
  id v3 = _WBSLocalizedString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  char v5 = [v2 commandWithTitle:v3 image:v4 action:sel_shareCurrentTabURL_ propertyList:0];

  return v5;
}

+ (id)_readerActionForTabDocument:(id)a3
{
  id v3 = a3;
  if ([v3 isReaderAvailable])
  {
    [v3 isShowingReader];
    char v5 = _WBSLocalizedString();
    id v6 = (void *)MEMORY[0x1E4FB1818];
    if ([v3 isShowingReader]) {
      id v8 = @"doc.plaintext.fill";
    }
    else {
      id v8 = @"doc.plaintext";
    }
    id v9 = [v6 systemImageNamed:v8];
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__TabMenuProvider__readerActionForTabDocument___block_invoke;
    v12[3] = &unk_1E6D78F48;
    id v13 = v3;
    id v4 = [v10 actionWithTitle:v5 image:v9 identifier:0 handler:v12];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __47__TabMenuProvider__readerActionForTabDocument___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) browserController];
  objc_msgSend(v2, "setShowingReader:animated:forTabDocument:", objc_msgSend(*(id *)(a1 + 32), "isShowingReader") ^ 1, 1, *(void *)(a1 + 32));
}

+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4
{
  return (id)[a1 moveMenuForTab:a3 dataSource:a4 showTitle:1 dismissHandler:&__block_literal_global_118_0];
}

+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4 showTitle:(BOOL)a5 dismissHandler:(id)a6
{
  BOOL v7 = a5;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 isPrivateBrowsingEnabled] & 1) != 0 || (objc_msgSend(v9, "isPinned"))
  {
    id v12 = 0;
  }
  else
  {
    id v13 = [v9 url];
    id v14 = objc_msgSend(v13, "safari_userVisibleHostWithoutWWWSubdomain");
    if (![v14 length] || (objc_msgSend(v13, "safari_isHTTPFamilyURL") & 1) == 0)
    {
      uint64_t v15 = [v9 title];

      id v14 = (void *)v15;
    }
    uint64_t v16 = [v9 wbTab];
    id v17 = (void *)v16;
    if (v16)
    {
      v28[0] = v16;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    }
    else
    {
      id v18 = 0;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__TabMenuProvider_moveMenuForTab_dataSource_showTitle_dismissHandler___block_invoke;
    v25[3] = &unk_1E6D7AAA0;
    id v26 = v10;
    id v27 = v9;
    id v19 = [v26 tabGroupsMenuElementsWithOptions:23 newTabGroupName:0 hostTitle:v14 descendantCount:0 movingSelectedTabs:v18 actionHandler:v25 dismissHandler:v11];
    long long v24 = v13;
    if (v7)
    {
      _WBSLocalizedString();
      id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = &stru_1F3C268E8;
    }
    id v21 = (void *)MEMORY[0x1E4FB1970];
    long long v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
    id v12 = [v21 menuWithTitle:v20 image:v22 identifier:0 options:0 children:v19];
  }
  return v12;
}

void __70__TabMenuProvider_moveMenuForTab_dataSource_showTitle_dismissHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [a2 uuid];
    [v2 moveTab:v3 toTabGroupWithUUID:v4];
  }
}

+ (id)pinTabActionForTab:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 canSetPinned]
    && ((int v7 = [v5 isPinned],
         [v5 wbTab],
         id v8 = objc_claimAutoreleasedReturnValue(),
         char v9 = [v6 isTabPinnable:v8],
         v8,
         (v9 & 1) != 0)
     || v7))
  {
    if (v7) {
      id v11 = @"pin.slash";
    }
    else {
      id v11 = @"pin";
    }
    id v12 = _WBSLocalizedString();
    id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v11];
    id v14 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __49__TabMenuProvider_pinTabActionForTab_dataSource___block_invoke;
    id v21 = &unk_1E6D7BF00;
    id v22 = v6;
    id v15 = v5;
    id v23 = v15;
    id v10 = [v14 actionWithTitle:v12 image:v13 identifier:0 handler:&v18];
    if (objc_msgSend(v15, "isPinnedTab", v18, v19, v20, v21)) {
      uint64_t v16 = @"UnpinTabButton";
    }
    else {
      uint64_t v16 = @"PinTabButton";
    }
    [v10 setAccessibilityIdentifier:v16];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __49__TabMenuProvider_pinTabActionForTab_dataSource___block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 isPinned] ^ 1;
  return [v1 setTab:v2 isPinned:v3];
}

+ (id)_pinTabActionForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 canSetPinned])
  {
    if ([v7 isPinned])
    {
      id v10 = @"pin.slash";
      id v11 = @"UnpinTabButton";
LABEL_6:
      id v12 = _WBSLocalizedString();
      id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:v10];
      id v14 = (void *)MEMORY[0x1E4FB13F0];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__TabMenuProvider__pinTabActionForTabGroupTab_inTabGroup_dataSource___block_invoke;
      v17[3] = &unk_1E6D7CFC0;
      id v18 = v9;
      id v19 = v7;
      id v20 = v8;
      id v15 = [v14 actionWithTitle:v12 image:v13 identifier:0 handler:v17];
      [v15 setAccessibilityIdentifier:v11];

      goto LABEL_8;
    }
    if ([v8 isTabPinnable:v7])
    {
      id v10 = @"pin";
      id v11 = @"PinTabButton";
      goto LABEL_6;
    }
  }
  id v15 = 0;
LABEL_8:

  return v15;
}

uint64_t __69__TabMenuProvider__pinTabActionForTabGroupTab_inTabGroup_dataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePinningTab:*(void *)(a1 + 40) inInactiveTabGroup:*(void *)(a1 + 48)];
}

+ (id)_sortMenuForTab:(id)a3 dataSource:(id)a4
{
  id v4 = a4;
  id v5 = [v4 currentTabs];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = _WBSLocalizedString();
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke;
    v27[3] = &unk_1E6D78F48;
    id v12 = v4;
    id v28 = v12;
    id v13 = [v9 actionWithTitle:v10 image:v11 identifier:0 handler:v27];
    [v8 addObject:v13];

    id v14 = (void *)MEMORY[0x1E4FB13F0];
    id v15 = _WBSLocalizedString();
    uint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"globe"];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke_2;
    long long v25 = &unk_1E6D78F48;
    id v26 = v12;
    id v17 = [v14 actionWithTitle:v15 image:v16 identifier:0 handler:&v22];
    objc_msgSend(v8, "addObject:", v17, v22, v23, v24, v25);

    id v18 = (void *)MEMORY[0x1E4FB1970];
    id v19 = _WBSLocalizedString();
    id v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.arrow.down"];
    id v7 = [v18 menuWithTitle:v19 image:v20 identifier:0 options:0 children:v8];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sortTabsWithMode:0];
}

uint64_t __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sortTabsWithMode:1];
}

+ (id)_closeActionForTab:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isPinned] & 1) != 0
    || ([v6 unpinnedTabs],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 >= 2))
  {
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    id v11 = _WBSLocalizedString();
    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __49__TabMenuProvider__closeActionForTab_dataSource___block_invoke;
    id v17 = &unk_1E6D7BF00;
    id v18 = v6;
    id v19 = v5;
    id v9 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:&v14];

    objc_msgSend(v9, "setAttributes:", 2, v14, v15, v16, v17);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __49__TabMenuProvider__closeActionForTab_dataSource___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v2 didCloseTabWithTrigger:2 tabClosingAction:1 numberOfTabsClosed:1 tabCollectionViewType:1];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 closeTab:v4 animated:1];
}

+ (id)_closeOtherTabsActionForTab:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isPinned])
  {
    id v7 = 0;
  }
  else
  {
    unint64_t v8 = [v6 unpinnedTabs];
    if ((unint64_t)[v8 count] >= 2)
    {
      id v9 = (void *)MEMORY[0x1E4FB13F0];
      id v10 = _WBSLocalizedString();
      id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke;
      v13[3] = &unk_1E6D7CFC0;
      id v14 = v8;
      id v15 = v5;
      id v16 = v6;
      id v7 = [v9 actionWithTitle:v10 image:v11 identifier:0 handler:v13];

      [v7 setAttributes:2];
      [v7 setAccessibilityIdentifier:@"CloseOtherTabsButton"];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

void __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_2;
  v11[3] = &unk_1E6D78C60;
  id v2 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v11);
  uint64_t v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v4, "didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:", 2, 2, objc_msgSend(v3, "count"), 1);

  id v5 = *(void **)(a1 + 48);
  id v6 = _WBSLocalizedString();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_3;
  v8[3] = &unk_1E6D77D90;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v7 = v3;
  [v5 registerUndoWithName:v6 actions:v8];
}

uint64_t __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

uint64_t __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeTabs:*(void *)(a1 + 40)];
}

@end