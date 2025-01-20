@interface TabBarManager
- (BOOL)_canAnimateInlineTabBarForTransitionToItemArrangement:(id)a3;
- (BOOL)_canAnimateStandaloneTabBarForTransitionToItemArrangement:(id)a3;
- (BOOL)showingLockdownStatusBar;
- (BOOL)suppressesStandaloneTabBar;
- (BookmarksBarView)bookmarksBar;
- (NSSet)hiddenItems;
- (SFLockdownStatusBar)lockdownStatusBar;
- (SFUnifiedTabBarItemArrangement)itemArrangement;
- (TabBarManager)init;
- (UnifiedBar)unifiedBar;
- (UnifiedTabBar)effectiveTabBar;
- (UnifiedTabBar)inlineTabBar;
- (UnifiedTabBar)standaloneTabBar;
- (_SFFluidProgressView)minimizedProgressView;
- (id)_inlineItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4;
- (id)createStandaloneTabBar;
- (id)standaloneItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4;
- (int64_t)displayMode;
- (void)_configureStandaloneTabBar;
- (void)_notifyDidCreateTabBar:(id)a3;
- (void)_notifyDidUpdateDisplayMode;
- (void)_setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6;
- (void)_setUsesInlineTabBar:(BOOL)a3;
- (void)_setUsesStandaloneTabBar:(BOOL)a3;
- (void)_updateUnifiedBarContentArrangement;
- (void)_updateUsesStandaloneTabBar;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scrollToActiveItemAnimated:(BOOL)a3;
- (void)setActiveItem:(id)a3 animated:(BOOL)a4;
- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setBookmarksBar:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setHiddenItems:(id)a3;
- (void)setItemArrangement:(id)a3;
- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5;
- (void)setShowingLockdownStatusBar:(BOOL)a3;
- (void)setSuppressesStandaloneTabBar:(BOOL)a3;
- (void)setUnifiedBar:(id)a3;
@end

@implementation TabBarManager

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5
{
}

- (void)_setItemArrangement:(id)a3 animated:(BOOL)a4 keepingItemVisible:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  objc_storeStrong((id *)&self->_itemArrangement, a3);
  if (self->_inlineTabBar)
  {
    v14 = dispatch_group_create();
    v15 = v14;
    if (self->_inlineTabBar)
    {
      dispatch_group_enter(v14);
      v16 = [(TabBarManager *)self _inlineItemArrangementForItemArrangement:v11 displayMode:self->_displayMode];
      BOOL v17 = v8
         && [(TabBarManager *)self _canAnimateInlineTabBarForTransitionToItemArrangement:v11];
      inlineTabBar = self->_inlineTabBar;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke;
      v26[3] = &unk_1E6D77E20;
      v27 = v15;
      [(SFUnifiedTabBar *)inlineTabBar setItemArrangement:v16 animated:v17 keepingItemVisible:v12 completionHandler:v26];
    }
    if (self->_standaloneTabBar)
    {
      dispatch_group_enter(v15);
      v19 = [(TabBarManager *)self standaloneItemArrangementForItemArrangement:v11 displayMode:self->_displayMode];
      if (v8)
      {
        if (v12) {
          BOOL v8 = 1;
        }
        else {
          BOOL v8 = [(TabBarManager *)self _canAnimateStandaloneTabBarForTransitionToItemArrangement:v19];
        }
      }
      standaloneTabBar = self->_standaloneTabBar;
      v21 = [v12 secondaryItem];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2;
      v24[3] = &unk_1E6D77E20;
      v25 = v15;
      [(SFUnifiedTabBar *)standaloneTabBar setItemArrangement:v19 animated:v8 keepingItemVisible:v21 completionHandler:v24];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3;
    block[3] = &unk_1E6D77E70;
    v23 = v13;
    dispatch_group_notify(v15, MEMORY[0x1E4F14428], block);
  }
  else if (v13)
  {
    v13[2](v13);
  }
}

- (void)setHiddenItems:(id)a3
{
}

- (UnifiedTabBar)effectiveTabBar
{
  int64_t displayMode = self->_displayMode;
  if (displayMode == 1)
  {
    uint64_t v3 = 64;
    goto LABEL_5;
  }
  if (displayMode == 2)
  {
    uint64_t v3 = 72;
LABEL_5:
    id v4 = *(id *)((char *)&self->super.isa + v3);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:
  return (UnifiedTabBar *)v4;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (UnifiedTabBar)standaloneTabBar
{
  return self->_standaloneTabBar;
}

- (UnifiedTabBar)inlineTabBar
{
  return self->_inlineTabBar;
}

- (void)addObserver:(id)a3
{
}

- (void)setUnifiedBar:(id)a3
{
  v6 = (UnifiedBar *)a3;
  if (self->_unifiedBar != v6)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F784D0]);
    [(SFUnifiedBar *)self->_unifiedBar setContentArrangement:v5];

    objc_storeStrong((id *)&self->_unifiedBar, a3);
    [(SFUnifiedTabBar *)self->_inlineTabBar setNavigationDelegate:v6];
    [(SFUnifiedTabBar *)self->_standaloneTabBar setNavigationDelegate:v6];
    [(TabBarManager *)self _updateUnifiedBarContentArrangement];
  }
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
  {
    self->_int64_t displayMode = a3;
    cachedInlineTabBar = self->_cachedInlineTabBar;
    [(TabBarManager *)self _setUsesInlineTabBar:(unint64_t)(a3 - 1) < 2];
    [(TabBarManager *)self _updateUsesStandaloneTabBar];
    [(TabBarManager *)self _updateUnifiedBarContentArrangement];
    if (self->_inlineTabBar)
    {
      if (cachedInlineTabBar)
      {
        v6 = 0;
      }
      else
      {
        v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
      }
      v7 = [(UnifiedTabBar *)self->_inlineTabBar window];

      if (v7) {
        [(UnifiedTabBar *)self->_inlineTabBar layoutIfNeeded];
      }
      inlineTabBar = self->_inlineTabBar;
      v9 = [(TabBarManager *)self _inlineItemArrangementForItemArrangement:self->_itemArrangement displayMode:a3];
      [(SFUnifiedTabBar *)inlineTabBar setItemArrangement:v9 animated:0 keepingItemVisible:v6 completionHandler:0];

      [(SFUnifiedTabBar *)self->_inlineTabBar setRole:a3 == 2];
      [(SFUnifiedTabBar *)self->_inlineTabBar setNavigationDelegate:self->_unifiedBar];
      v10 = [(SFUnifiedTabBar *)self->_inlineTabBar tabHoverPreviewController];
      [v10 setEnabled:(a3 & 0xFFFFFFFFFFFFFFFDLL) != 0];

      [(SFUnifiedTabBar *)self->_inlineTabBar setSearchFieldShowsFormatMenuButtonAccessories:_SFDeviceIsPad() ^ 1];
      [(SFUnifiedTabBar *)self->_inlineTabBar setMinimizedProgressView:self->_minimizedProgressView];
    }
    [(TabBarManager *)self _configureStandaloneTabBar];
    [(SFUnifiedBar *)self->_unifiedBar setShowsSeparator:a3 == 2];
    [(TabBarManager *)self _notifyDidUpdateDisplayMode];
  }
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

- (void)scrollToActiveItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  itemArrangement = self->_itemArrangement;
  id v6 = [(SFUnifiedTabBarItemArrangement *)itemArrangement activeItem];
  [(TabBarManager *)self setItemArrangement:itemArrangement animated:v3 keepingItemVisible:v6];
}

- (_SFFluidProgressView)minimizedProgressView
{
  return self->_minimizedProgressView;
}

- (void)setSuppressesStandaloneTabBar:(BOOL)a3
{
  if (self->_suppressesStandaloneTabBar != a3)
  {
    self->_suppressesStandaloneTabBar = a3;
    [(TabBarManager *)self _updateUsesStandaloneTabBar];
    [(TabBarManager *)self _updateUnifiedBarContentArrangement];
    [(TabBarManager *)self _configureStandaloneTabBar];
  }
}

- (TabBarManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)TabBarManager;
  v2 = [(TabBarManager *)&v11 init];
  if (v2)
  {
    BOOL v3 = (SFUnifiedTabBarItemArrangement *)objc_alloc_init(MEMORY[0x1E4F784F0]);
    itemArrangement = v2->_itemArrangement;
    v2->_itemArrangement = v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v7 = (_SFFluidProgressView *)objc_alloc_init(MEMORY[0x1E4F78588]);
    minimizedProgressView = v2->_minimizedProgressView;
    v2->_minimizedProgressView = v7;

    v9 = v2;
  }

  return v2;
}

- (void)_updateUsesStandaloneTabBar
{
  BOOL v2 = self->_displayMode == 2 && !self->_suppressesStandaloneTabBar;
  [(TabBarManager *)self _setUsesStandaloneTabBar:v2];
}

- (void)_updateUnifiedBarContentArrangement
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_lockdownStatusBar);
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_bookmarksBar);
  objc_msgSend(v5, "safari_addObjectUnlessNil:", self->_standaloneTabBar);
  if (self->_standaloneTabBar) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = self->_suppressesStandaloneTabBar && self->_displayMode == 2;
  }
  [(SFUnifiedBar *)self->_unifiedBar setMarginLevel:v3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F784D0]) initWithInlineContentView:self->_inlineTabBar standaloneContentViews:v5];
  [(SFUnifiedBar *)self->_unifiedBar setContentArrangement:v4];
}

- (void)_setUsesStandaloneTabBar:(BOOL)a3
{
  standaloneTabBar = self->_standaloneTabBar;
  if ((((standaloneTabBar == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      id v5 = [(TabBarManager *)self createStandaloneTabBar];
      id v6 = self->_standaloneTabBar;
      self->_standaloneTabBar = v5;

      v7 = self->_standaloneTabBar;
      [(TabBarManager *)self _notifyDidCreateTabBar:v7];
    }
    else
    {
      self->_standaloneTabBar = 0;
    }
  }
}

- (void)_configureStandaloneTabBar
{
  standaloneTabBar = self->_standaloneTabBar;
  if (standaloneTabBar)
  {
    id v4 = [(TabBarManager *)self standaloneItemArrangementForItemArrangement:self->_itemArrangement displayMode:self->_displayMode];
    id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
    [(SFUnifiedTabBar *)standaloneTabBar setItemArrangement:v4 animated:0 keepingItemVisible:v5 completionHandler:0];

    unifiedBar = self->_unifiedBar;
    v7 = self->_standaloneTabBar;
    [(SFUnifiedTabBar *)v7 setNavigationDelegate:unifiedBar];
  }
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (void)setBookmarksBar:(id)a3
{
  id v5 = (BookmarksBarView *)a3;
  if (self->_bookmarksBar != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_bookmarksBar, a3);
    [(TabBarManager *)self _updateUnifiedBarContentArrangement];
    id v5 = v6;
  }
}

- (void)setShowingLockdownStatusBar:(BOOL)a3
{
  if (self->_showingLockdownStatusBar != a3)
  {
    self->_showingLockdownStatusBar = a3;
    if (a3)
    {
      id v4 = (SFLockdownStatusBar *)objc_alloc_init(MEMORY[0x1E4F782D0]);
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = v4;
    }
    else
    {
      lockdownStatusBar = self->_lockdownStatusBar;
      self->_lockdownStatusBar = 0;
    }

    [(TabBarManager *)self _updateUnifiedBarContentArrangement];
  }
}

- (void)_setUsesInlineTabBar:(BOOL)a3
{
  p_inlineTabBar = &self->_inlineTabBar;
  inlineTabBar = self->_inlineTabBar;
  if (((inlineTabBar == 0) ^ a3)) {
    return;
  }
  p_cachedInlineTabBar = &self->_cachedInlineTabBar;
  if (a3)
  {
    if (*p_cachedInlineTabBar) {
      v7 = *p_cachedInlineTabBar;
    }
    else {
      v7 = objc_alloc_init(UnifiedTabBar);
    }
    BOOL v8 = self->_inlineTabBar;
    self->_inlineTabBar = v7;

    [(SFUnifiedTabBar *)self->_inlineTabBar setShowsSquishedTitleContainer:1];
    [(SFUnifiedTabBar *)self->_inlineTabBar setRole:self->_displayMode == 2];
    cachedInlineTabBar = self->_cachedInlineTabBar;
    if (cachedInlineTabBar) {
      goto LABEL_10;
    }
    [(TabBarManager *)self _notifyDidCreateTabBar:self->_inlineTabBar];
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedInlineTabBar, inlineTabBar);
    p_cachedInlineTabBar = p_inlineTabBar;
  }
  cachedInlineTabBar = *p_cachedInlineTabBar;
LABEL_10:
  *p_cachedInlineTabBar = 0;
}

- (id)createStandaloneTabBar
{
  BOOL v2 = objc_alloc_init(UnifiedTabBar);
  [(SFUnifiedTabBar *)v2 setRole:2];
  [(UnifiedTabBar *)v2 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  return v2;
}

- (void)setItemArrangement:(id)a3
{
}

- (void)setActiveItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement arrangementWithActiveItem:a3];
  [(TabBarManager *)self _setItemArrangement:v6 animated:v4 keepingItemVisible:0 completionHandler:0];
}

- (void)setActiveItemIsExpanded:(BOOL)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  itemArrangement = self->_itemArrangement;
  id v9 = a5;
  id v10 = [(SFUnifiedTabBarItemArrangement *)itemArrangement arrangementWithActiveItemIsExpanded:v6];
  [(TabBarManager *)self _setItemArrangement:v10 animated:v5 keepingItemVisible:0 completionHandler:v9];
}

void __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke(uint64_t a1)
{
}

void __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __83__TabBarManager__setItemArrangement_animated_keepingItemVisible_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_inlineItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 2:
      id v8 = objc_alloc(MEMORY[0x1E4F784F0]);
      id v9 = [v7 activeItem];
      self = (TabBarManager *)objc_msgSend(v8, "initWithItem:activeItemIsExpanded:", v9, objc_msgSend(v7, "activeItemIsExpanded"));

      break;
    case 1:
      id v10 = [v6 items];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__TabBarManager__inlineItemArrangementForItemArrangement_displayMode___block_invoke;
      v14[3] = &unk_1E6D7E0C8;
      v14[4] = self;
      objc_super v11 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v14);

      id v12 = [v7 activeItem];
      if ([(NSSet *)self->_hiddenItems containsObject:v12])
      {

        id v12 = 0;
      }
      self = (TabBarManager *)objc_msgSend(objc_alloc(MEMORY[0x1E4F784F0]), "initWithItems:activeItem:activeItemIsExpanded:allowsScrollingPinnedItems:", v11, v12, objc_msgSend(v7, "activeItemIsExpanded"), objc_msgSend(v7, "allowsScrollingPinnedItems"));

      break;
    case 0:
      self = (TabBarManager *)objc_alloc_init(MEMORY[0x1E4F784F0]);
      break;
  }

  return self;
}

uint64_t __70__TabBarManager__inlineItemArrangementForItemArrangement_displayMode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) containsObject:a2] ^ 1;
}

- (id)standaloneItemArrangementForItemArrangement:(id)a3 displayMode:(int64_t)a4
{
  id v7 = a3;
  id v8 = v7;
  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
    {
      id v9 = [v7 items];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __73__TabBarManager_standaloneItemArrangementForItemArrangement_displayMode___block_invoke;
      v16[3] = &unk_1E6D7E0F0;
      v16[4] = self;
      id v10 = objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v16);

      objc_super v11 = [v8 activeItem];
      if ([(NSSet *)self->_hiddenItems containsObject:v11])
      {

        objc_super v11 = 0;
      }
      uint64_t v12 = [v8 allowsScrollingPinnedItems];
      id v13 = objc_alloc(MEMORY[0x1E4F784F0]);
      v14 = [v11 secondaryItem];
      id v4 = (id)[v13 initWithItems:v10 activeItem:v14 activeItemIsExpanded:0 allowsScrollingPinnedItems:v12];
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F784F0]);
  }

  return v4;
}

id __73__TabBarManager_standaloneItemArrangementForItemArrangement_displayMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 secondaryItem];
  }

  return v4;
}

- (BOOL)_canAnimateInlineTabBarForTransitionToItemArrangement:(id)a3
{
  if (self->_displayMode != 2) {
    return 1;
  }
  id v4 = [a3 activeItem];
  BOOL v5 = [(SFUnifiedTabBar *)self->_inlineTabBar itemArrangement];
  id v6 = [v5 activeItem];
  BOOL v7 = v4 == v6;

  return v7;
}

- (BOOL)_canAnimateStandaloneTabBarForTransitionToItemArrangement:(id)a3
{
  standaloneTabBar = self->_standaloneTabBar;
  id v4 = a3;
  BOOL v5 = [(SFUnifiedTabBar *)standaloneTabBar itemArrangement];
  id v6 = [v5 items];
  BOOL v7 = [v4 items];

  LOBYTE(v4) = [v6 isEqualToArray:v7] ^ 1;
  return (char)v4;
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyDidCreateTabBar:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "tabBarManager:didCreateTabBar:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidUpdateDisplayMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "tabBarManagerDidUpdateDisplayMode:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSSet)hiddenItems
{
  return self->_hiddenItems;
}

- (UnifiedBar)unifiedBar
{
  return self->_unifiedBar;
}

- (BOOL)suppressesStandaloneTabBar
{
  return self->_suppressesStandaloneTabBar;
}

- (BookmarksBarView)bookmarksBar
{
  return self->_bookmarksBar;
}

- (BOOL)showingLockdownStatusBar
{
  return self->_showingLockdownStatusBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedProgressView, 0);
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_bookmarksBar, 0);
  objc_storeStrong((id *)&self->_standaloneTabBar, 0);
  objc_storeStrong((id *)&self->_inlineTabBar, 0);
  objc_storeStrong((id *)&self->_unifiedBar, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_cachedInlineTabBar, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end