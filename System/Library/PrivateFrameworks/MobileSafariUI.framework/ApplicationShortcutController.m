@interface ApplicationShortcutController
+ (id)_shortcutItemWithType:(id)a3 systemImageName:(id)a4;
+ (id)_shortcutItemsIncludingPrivateBrowsing:(BOOL)a3;
+ (void)updateShortcutItemsIfNeeded;
- (BOOL)_handleActionWithType:(id)a3;
- (BOOL)handleActionWithType:(id)a3;
- (BrowserController)browserController;
- (void)_openNewEmptyTabWithURLFieldFocused:(BOOL)a3 privateBrowsingState:(int64_t)a4;
- (void)_showBookmarksPanelWithSelectedCollection:(id)a3;
- (void)setBrowserController:(id)a3;
@end

@implementation ApplicationShortcutController

void __72__ApplicationShortcutController__shortcutItemsIncludingPrivateBrowsing___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _shortcutItemWithType:*MEMORY[0x1E4F3B1C8] systemImageName:@"eyeglasses"];
  v3 = (void *)_shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem = v2;

  uint64_t v4 = [*(id *)(a1 + 32) _shortcutItemWithType:*MEMORY[0x1E4F3B1B0] systemImageName:@"book"];
  v5 = (void *)_shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem = v4;

  uint64_t v6 = [*(id *)(a1 + 32) _shortcutItemWithType:*MEMORY[0x1E4F3B1B8] systemImageName:@"plus.square.fill.on.square.fill"];
  v7 = (void *)_shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem = v6;

  uint64_t v8 = [*(id *)(a1 + 32) _shortcutItemWithType:*MEMORY[0x1E4F3B1C0] systemImageName:@"plus.square.on.square"];
  v9 = (void *)_shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
  _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem = v8;
}

+ (id)_shortcutItemWithType:(id)a3 systemImageName:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4FB1468];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = _SFLocalizedTitleStringForShortcutItemType();
  v10 = [MEMORY[0x1E4FB1460] iconWithSystemImageName:v6];

  v11 = (void *)[v8 initWithType:v7 localizedTitle:v9 localizedSubtitle:0 icon:v10 userInfo:0];
  return v11;
}

- (void)setBrowserController:(id)a3
{
}

+ (void)updateShortcutItemsIfNeeded
{
  v3 = +[FeatureManager sharedFeatureManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v12__0B8l;
  v4[4] = a1;
  [v3 determineIfPrivateBrowsingIsAvailableWithCompletionHandler:v4];
}

void __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _shortcutItemsIncludingPrivateBrowsing:*(unsigned __int8 *)(a1 + 40)];
  v1 = (id *)MEMORY[0x1E4FB2608];
  uint64_t v2 = [(id)*MEMORY[0x1E4FB2608] shortcutItems];
  char v3 = [v4 isEqualToArray:v2];

  if ((v3 & 1) == 0) {
    [*v1 setShortcutItems:v4];
  }
}

+ (id)_shortcutItemsIncludingPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ApplicationShortcutController__shortcutItemsIncludingPrivateBrowsing___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_shortcutItemsIncludingPrivateBrowsing__onceToken != -1) {
    dispatch_once(&_shortcutItemsIncludingPrivateBrowsing__onceToken, block);
  }
  if (v3)
  {
    v11[0] = _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
    v11[1] = _shortcutItemsIncludingPrivateBrowsing__newPrivateTabShortcutItem;
    v11[2] = _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
    v11[3] = _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = v11;
    uint64_t v6 = 4;
  }
  else
  {
    v10[0] = _shortcutItemsIncludingPrivateBrowsing__newTabShortcutItem;
    v10[1] = _shortcutItemsIncludingPrivateBrowsing__showBookmarksShortcutItem;
    v10[2] = _shortcutItemsIncludingPrivateBrowsing__showReadingListShortcutItem;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = v10;
    uint64_t v6 = 3;
  }
  id v7 = [v4 arrayWithObjects:v5 count:v6];
  return v7;
}

void __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__ApplicationShortcutController_updateShortcutItemsIfNeeded__block_invoke_2;
  v2[3] = &__block_descriptor_41_e5_v8__0l;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

- (BOOL)handleActionWithType:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__ApplicationShortcutController_handleActionWithType___block_invoke;
  v8[3] = &unk_1E6D7CE68;
  v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [v5 performWithoutAnimation:v8];
  LOBYTE(v5) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

uint64_t __54__ApplicationShortcutController_handleActionWithType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _handleActionWithType:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_handleActionWithType:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([v4 isEqualToString:*MEMORY[0x1E4F3B1C0]])
  {
    BOOL v5 = 1;
    [(ApplicationShortcutController *)self _openNewEmptyTabWithURLFieldFocused:1 privateBrowsingState:0];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F3B1B8]])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      if ([WeakRetained isPrivateBrowsingAvailable])
      {
        [(ApplicationShortcutController *)self _openNewEmptyTabWithURLFieldFocused:1 privateBrowsingState:1];
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __55__ApplicationShortcutController__handleActionWithType___block_invoke;
        v9[3] = &unk_1E6D7CE90;
        objc_copyWeak(&v10, &location);
        [WeakRetained updatePrivateBrowsingAvailabilityWithCompletionHandler:v9];
        objc_destroyWeak(&v10);
      }
    }
    else
    {
      if ([v4 isEqualToString:*MEMORY[0x1E4F3B1B0]])
      {
        id v7 = kCollectionTypeBookmarks;
      }
      else
      {
        if (![v4 isEqualToString:*MEMORY[0x1E4F3B1C8]])
        {
          BOOL v5 = 0;
          goto LABEL_14;
        }
        id v7 = kCollectionTypeReadingList;
      }
      [(ApplicationShortcutController *)self _showBookmarksPanelWithSelectedCollection:*v7];
    }
    BOOL v5 = 1;
  }
LABEL_14:
  objc_destroyWeak(&location);

  return v5;
}

void __55__ApplicationShortcutController__handleActionWithType___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      [WeakRetained _openNewEmptyTabWithURLFieldFocused:1 privateBrowsingState:1];
      id WeakRetained = v3;
    }
  }
}

- (void)_openNewEmptyTabWithURLFieldFocused:(BOOL)a3 privateBrowsingState:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v7 = [WeakRetained tabController];
  id v8 = [WeakRetained tabCollectionViewProvider];
  uint64_t v9 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  [WeakRetained dismissTransientUIAnimated:v9 options:2];
  int v10 = [WeakRetained isShowingPrivateTabs];
  if (a4 != 1 || (v10 & 1) != 0)
  {
    if (a4) {
      int v11 = 0;
    }
    else {
      int v11 = v10;
    }
    if (v11 == 1) {
      [v7 selectLocalTabGroup];
    }
  }
  else
  {
    [v7 selectPrivateTabGroup];
  }
  if ([v7 isPrivateBrowsingEnabled])
  {
    v12 = +[Application sharedApplication];
    int v13 = [v12 isPrivateBrowsingLocked];

    a3 &= ~(_BYTE)v13;
  }
  else
  {
    int v13 = 0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke;
  v25[3] = &unk_1E6D7CEB8;
  id v14 = WeakRetained;
  id v26 = v14;
  char v27 = v9;
  BOOL v28 = a3;
  v15 = (void (**)(void))MEMORY[0x1E4E42950](v25);
  v16 = [v7 blankTabToReuse];
  if (v16)
  {
    v17 = [v7 activeTabDocument];

    if (v16 != v17) {
      [v7 setActiveTab:v16 animated:v9];
    }
    if (v13)
    {
      v18 = [v8 tabSwitcherViewController];
      [v18 setDismissesOnUnlock:1];
    }
    [v8 updateTabViewsAnimatingTabBar:v9];
    v19 = [v8 tabOverview];
    v20 = v19;
    if (v9 && v19)
    {
      [v19 dismissWithAddTabAnimation];
    }
    else
    {
      v21 = [v8 tabThumbnailCollectionView];
      [v21 dismissAnimated:v9];
    }
    v15[2](v15);
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke_2;
    v22[3] = &unk_1E6D7CEE0;
    v24 = v15;
    id v23 = v8;
    [v7 openNewTabWithOptions:0 completionHandler:v22];

    v20 = v24;
  }
}

uint64_t __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFavoritesAreEmbedded:1 animated:*(unsigned __int8 *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) updateFirstResponderOrFocus];
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t result = [*(id *)(a1 + 32) canAutoFocusURLField];
    if (result)
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
      return [v3 setFavoritesFieldFocused:1 animated:v4];
    }
  }
  return result;
}

void __90__ApplicationShortcutController__openNewEmptyTabWithURLFieldFocused_privateBrowsingState___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v3, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", 3, objc_msgSend(*(id *)(a1 + 32), "visibleTabCollectionViewType"));
  }
}

- (void)_showBookmarksPanelWithSelectedCollection:(id)a3
{
  p_browserController = &self->_browserController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  id v6 = [WeakRetained tabController];
  id v7 = [v6 activeTabDocument];
  if ([v7 isBlank])
  {
    if ([WeakRetained isPresentingModalBookmarksController])
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v9 = [WeakRetained sidebarUIProxy];
      char v8 = [v9 isShowingSidebar];
    }
  }
  else
  {
    char v8 = 0;
  }

  if ([WeakRetained isSuspendedOrSuspending] && (v8 & 1) == 0) {
    [(ApplicationShortcutController *)self _openNewEmptyTabWithURLFieldFocused:0 privateBrowsingState:2];
  }
  uint64_t v10 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  int v11 = [WeakRetained tabCollectionViewProvider];
  v12 = [v11 tabThumbnailCollectionView];
  [v12 dismissAnimated:v10];

  if (!v10) {
    goto LABEL_13;
  }
  int v13 = [WeakRetained sidebarUIProxy];
  if ([v13 isShowingSidebar])
  {

LABEL_13:
    [WeakRetained showBookmarksPanelWithNonAnimatedTransition];
    goto LABEL_14;
  }
  char v14 = [WeakRetained isPresentingModalBookmarksController];

  if (v14) {
    goto LABEL_13;
  }
  [WeakRetained toggleBookmarksPresentation];
LABEL_14:
  [WeakRetained setCurrentBookmarksCollection:v5];
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end