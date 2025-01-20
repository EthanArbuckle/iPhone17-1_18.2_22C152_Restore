@interface _UITabModel
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isTabHidden:(id)a3;
- (BOOL)shouldSelectTab:(id)a3;
- (NSArray)tabItems;
- (NSString)persistenceIdentifier;
- (UITab)selectedItem;
- (UITab)selectedLeaf;
- (UITabBarController)tabBarController;
- (_UITabCustomizationStore)customizationStore;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (id)tabForIdentifier:(id)a3;
- (uint64_t)_indexOfObserver:(uint64_t)a1;
- (void)_inferCurrentEditability;
- (void)_selectElement:(id)a3 notifyObserversOnReselection:(BOOL)a4;
- (void)_sendToObservers:(id)a3 allowUpdatesDuringBroadcast:(BOOL)a4;
- (void)_setSelectedItem:(id)a3 notifyDelegateOnReselection:(BOOL)a4;
- (void)_updateSelectedLeaf;
- (void)_updateSelectedLeafPerformBeforeNotifyingBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)customizabilityDidChangeForTab:(id)a3;
- (void)customizationStoreDidReset:(id)a3;
- (void)displayOrderIdentifiersDidChangeForGroup:(id)a3;
- (void)elementsDidChangeForGroup:(id)a3;
- (void)favoriteOrderDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)replaceItemAtIndex:(int64_t)a3 withItem:(id)a4;
- (void)setEditable:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setTabItems:(id)a3;
- (void)setTabItems:(id)a3 inferSelection:(BOOL)a4;
- (void)tabContentDidChange:(id)a3;
- (void)visibilityDidChangeForTab:(id)a3 editing:(BOOL)a4;
@end

@implementation _UITabModel

- (void)_selectElement:(id)a3 notifyObserversOnReselection:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = v7;
  if (v7 && ([v7 _isElement] & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITabModel.m", 239, @"Cannot select a tab that is not selectable.", v8);
  }
  *(unsigned char *)&self->_flags |= 2u;
  v9 = [v8 _parentGroup];
  if (v9)
  {
    if (v4)
    {
      if ([v8 _isUniquelySPI])
      {
        BOOL v4 = 1;
      }
      else
      {
        v10 = [(_UITabModel *)self selectedLeaf];
        BOOL v4 = v10 == v8;
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59___UITabModel__selectElement_notifyObserversOnReselection___block_invoke;
    v12[3] = &unk_1E52D9F98;
    v12[4] = self;
    id v13 = v9;
    [v13 _selectElement:v8 notifyOnReselection:v4 performBeforeNotifyingDelegate:v12];
  }
  else
  {
    *(unsigned char *)&self->_flags &= ~2u;
    [(_UITabModel *)self _setSelectedItem:v8 notifyDelegateOnReselection:v4];
  }
}

- (void)_setSelectedItem:(id)a3 notifyDelegateOnReselection:(BOOL)a4
{
  id v7 = a3;
  v8 = v7;
  if (v7 && ([v7 _isElement] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UITabModel.m", 139, @"Cannot select a tab (%@) that is not selectable.", v8 object file lineNumber description];
  }
  v9 = self->_selectedItem;
  v10 = v8;
  v11 = v10;
  if (v9 != v10)
  {
    if (v10 && v9)
    {
      BOOL v12 = [(UITab *)v9 isEqual:v10];

      if (v12) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    if ((*(unsigned char *)&self->_flags & 5) == 1)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"_UITabModel.m" lineNumber:144 description:@"Attempt to modify model while broadcasting a change to the model."];

      if (v8) {
        goto LABEL_13;
      }
    }
    else if (v8)
    {
LABEL_13:
      if (!_tabElementsContainsTab(self->_tabItems, v11) && ![(UITab *)v11 _isMoreTab])
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2, self, @"_UITabModel.m", 145, @"Attempt to select tab %@ that is not in the current tabs %@.", v11, self->_tabItems object file lineNumber description];
      }
    }
    v14 = v11;
    selectedItem = self->_selectedItem;
    self->_selectedItem = v14;
    a4 = 1;
    goto LABEL_17;
  }

  selectedItem = v11;
LABEL_17:

LABEL_18:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60___UITabModel__setSelectedItem_notifyDelegateOnReselection___block_invoke;
  v20[3] = &unk_1E52DC3F8;
  BOOL v23 = a4;
  v20[4] = self;
  v21 = v11;
  v22 = v9;
  v15 = v9;
  v16 = v11;
  [(_UITabModel *)self _updateSelectedLeafPerformBeforeNotifyingBlock:v20];
}

- (void)_inferCurrentEditability
{
  v3 = [(_UITabModel *)self tabItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v5 = [(_UITabModel *)self tabItems];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39___UITabModel__inferCurrentEditability__block_invoke;
    v6[3] = &unk_1E52FA158;
    v6[4] = &v11;
    v6[5] = &v7;
    [v5 enumerateObjectsUsingBlock:v6];

    if (!*((unsigned char *)v8 + 24)) {
      [(_UITabModel *)self setEditable:*((unsigned __int8 *)v12 + 24)];
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
  }
}

- (NSArray)tabItems
{
  return self->_tabItems;
}

- (void)setTabBarController:(id)a3
{
}

- (UITab)selectedLeaf
{
  return self->_selectedLeaf;
}

- (_UITabCustomizationStore)customizationStore
{
  customizationStore = self->_customizationStore;
  if (!customizationStore)
  {
    uint64_t v4 = [(_UITabModel *)self persistenceIdentifier];
    v5 = +[_UITabCustomizationStore customizationStoreWithPersistenceIdentifier:v4];
    v6 = self->_customizationStore;
    self->_customizationStore = v5;

    [(_UITabCustomizationStore *)self->_customizationStore addObserver:self];
    customizationStore = self->_customizationStore;
  }
  return customizationStore;
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (BOOL)isTabHidden:(id)a3
{
  id v4 = a3;
  v5 = [(_UITabModel *)self tabBarController];
  uint64_t v6 = [v5 sidebar];
  uint64_t v7 = (void *)v6;
  if (v6) {
    v8 = *(void **)(v6 + 96);
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9) {
    char v10 = [v9 isTabHidden:v4];
  }
  else {
    char v10 = [v4 isHidden];
  }
  BOOL v11 = v10;

  return v11;
}

- (UITabBarController)tabBarController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
  return (UITabBarController *)WeakRetained;
}

- (void)replaceItemAtIndex:(int64_t)a3 withItem:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_UITabModel *)self tabItems];
  id v8 = [v7 objectAtIndex:a3];

  if (v8 != v6)
  {
    [v8 _setTabModel:0];
    [v6 _setTabModel:self];
    id v9 = [(_UITabModel *)self tabItems];
    char v10 = (void *)[v9 mutableCopy];

    [v10 replaceObjectAtIndex:a3 withObject:v6];
    BOOL v11 = (NSArray *)[v10 copy];
    tabItems = self->_tabItems;
    self->_tabItems = v11;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43___UITabModel_replaceItemAtIndex_withItem___block_invoke;
    v13[3] = &unk_1E52FA108;
    v13[4] = self;
    id v14 = v8;
    id v15 = v6;
    [(_UITabModel *)self _sendToObservers:v13 allowUpdatesDuringBroadcast:0];
  }
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_tabBarController);
  id v6 = -[UITabBarController _visualStyle](WeakRetained);
  int v7 = [v6 suppressesEditingUI];

  int v8 = v3 & ~v7;
  if (self->_editable != v8)
  {
    BOOL v9 = [(_UITabModel *)self isEditing];
    if ((v8 & 1) == 0 && v9) {
      [(_UITabModel *)self setEditing:0];
    }
    self->_editable = v8;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27___UITabModel_setEditable___block_invoke;
    v10[3] = &unk_1E52FA180;
    v10[4] = self;
    char v11 = v8;
    [(_UITabModel *)self _sendToObservers:v10 allowUpdatesDuringBroadcast:0];
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)elementsDidChangeForGroup:(id)a3
{
  id v4 = a3;
  int v5 = [(_UITabModel *)self isEditable];
  if (v5 != [v4 _isCustomizable]) {
    [(_UITabModel *)self _inferCurrentEditability];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41___UITabModel_elementsDidChangeForGroup___block_invoke;
  v8[3] = &unk_1E52FA130;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  int v7 = v6;
  if (self)
  {
    [(_UITabModel *)self _sendToObservers:v8 allowUpdatesDuringBroadcast:0];
    int v7 = v9;
  }
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)tabContentDidChange:(id)a3
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_tabBarController);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[136] tabContentDidChange:v4];
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35___UITabModel_tabContentDidChange___block_invoke;
  v9[3] = &unk_1E52FA130;
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  int v8 = v7;
  if (self)
  {
    [(_UITabModel *)self _sendToObservers:v9 allowUpdatesDuringBroadcast:0];
    int v8 = v10;
  }
}

- (id)tabForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v5 = [(_UITabModel *)self tabItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      char v11 = [v10 identifier];
      int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        id v13 = v10;
      }
      else
      {
        if (![v10 _isGroup]) {
          continue;
        }
        id v13 = [v10 tabForIdentifier:v4];
      }
      id v14 = v13;
      if (v13) {
        goto LABEL_14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
LABEL_13:
  id v14 = 0;
LABEL_14:

  return v14;
}

- (void)_updateSelectedLeafPerformBeforeNotifyingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = v4;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    uint64_t v6 = [(_UITabModel *)self selectedItem];
    if ([(UITab *)v6 _isGroup])
    {
      while (1)
      {
        uint64_t v7 = [(UITab *)v6 selectedChild];
        if (!v7) {
          break;
        }
        uint64_t v8 = (UITab *)v7;

        uint64_t v6 = v8;
        if (![(UITab *)v8 _isGroup]) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v8 = v6;
LABEL_9:
    id v9 = self->_selectedLeaf;
    objc_storeStrong((id *)&self->_selectedLeaf, v8);
    if (v5) {
      v5[2](v5);
    }
    if (v8 != v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62___UITabModel__updateSelectedLeafPerformBeforeNotifyingBlock___block_invoke;
      v13[3] = &unk_1E52FA108;
      v13[4] = self;
      id v10 = v8;
      id v14 = v10;
      char v11 = v9;
      id v15 = v11;
      [(_UITabModel *)self _sendToObservers:v13 allowUpdatesDuringBroadcast:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
      -[UITabBarController _selectedLeafDidChange:previousLeaf:]((uint64_t)WeakRetained, v10, v11);
    }
  }
}

- (UITab)selectedItem
{
  return self->_selectedItem;
}

- (void)setTabItems:(id)a3 inferSelection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (NSArray *)a3;
  tabItems = self->_tabItems;
  if (tabItems != v7)
  {
    [(NSArray *)tabItems enumerateObjectsUsingBlock:&__block_literal_global_327];
    if ((*(unsigned char *)&self->_flags & 5) == 1)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"_UITabModel.m" lineNumber:62 description:@"Attempt to modify model while broadcasting a change to the model."];
    }
    if (self->_selectedItem) {
      unint64_t v9 = -[NSArray indexOfObject:](self->_tabItems, "indexOfObject:");
    }
    else {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v10 = (NSArray *)[(NSArray *)v7 copy];
    char v11 = self->_tabItems;
    self->_tabItems = v10;

    int v12 = self->_tabItems;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_2;
    v32[3] = &unk_1E52F1CF8;
    v32[4] = self;
    [(NSArray *)v12 enumerateObjectsUsingBlock:v32];
    id v13 = self->_selectedItem;
    id v14 = self->_selectedItem;
    if (!_tabElementsContainsTab(v7, v13))
    {

      id v13 = 0;
    }
    char v15 = 0;
    if (!v13 && v4)
    {
      if ([(UITab *)self->_selectedItem _isMoreTab])
      {
        char v15 = 0;
      }
      else
      {
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__124;
        v30 = __Block_byref_object_dispose__124;
        id v31 = 0;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_5;
        v25[3] = &unk_1E52FA0B8;
        v25[4] = self;
        v25[5] = &v26;
        [(NSArray *)v7 enumerateObjectsUsingBlock:v25];
        if (v9 >= [(NSArray *)v7 count])
        {
          long long v17 = (void *)v27[5];
          if (v17)
          {
            long long v16 = v17;
          }
          else
          {
            long long v16 = [(NSArray *)v7 firstObject];
          }
        }
        else
        {
          long long v16 = [(NSArray *)v7 objectAtIndex:v9];
        }
        selectedItem = self->_selectedItem;
        self->_selectedItem = v16;

        _Block_object_dispose(&v26, 8);
        char v15 = 1;
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_2_6;
    v24[3] = &unk_1E52FA0E0;
    v24[4] = self;
    [(_UITabModel *)self _sendToObservers:v24 allowUpdatesDuringBroadcast:0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_3;
    v21[3] = &unk_1E52DC3D0;
    char v23 = v15;
    v21[4] = self;
    v22 = v14;
    long long v19 = v14;
    [(_UITabModel *)self _updateSelectedLeafPerformBeforeNotifyingBlock:v21];
    [(_UITabModel *)self _inferCurrentEditability];
  }
}

- (void)_sendToObservers:(id)a3 allowUpdatesDuringBroadcast:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a3;
  if (v4) {
    char v7 = 5;
  }
  else {
    char v7 = 1;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v7;
  uint64_t v8 = (void *)[(NSPointerArray *)self->_observers copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        if (*(void *)(*((void *)&v14 + 1) + 8 * i)) {
          v6[2](v6);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [(NSPointerArray *)self->_observers compact];
  *(unsigned char *)&self->_flags &= 0xFAu;
}

- (void)setTabItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedLeaf, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_tabItems, 0);
  objc_destroyWeak((id *)&self->_tabBarController);
  objc_storeStrong((id *)&self->_customizationStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setSelectedItem:(id)a3
{
}

- (BOOL)shouldSelectTab:(id)a3
{
  id v4 = a3;
  if ([v4 isDisabled])
  {
    char v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
    char v5 = -[UITabBarController _shouldSelectTab:]((uint64_t)WeakRetained, v4);
  }
  return v5;
}

- (void)visibilityDidChangeForTab:(id)a3 editing:(BOOL)a4
{
  id v6 = a3;
  if (!a4) {
    [(_UITabCustomizationStore *)self->_customizationStore updateCustomizationForTab:v6];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49___UITabModel_visibilityDidChangeForTab_editing___block_invoke;
  v9[3] = &unk_1E52FA130;
  v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  uint64_t v8 = v7;
  if (self)
  {
    [(_UITabModel *)self _sendToObservers:v9 allowUpdatesDuringBroadcast:0];
    uint64_t v8 = v10;
  }
}

- (void)customizabilityDidChangeForTab:(id)a3
{
  id v4 = a3;
  int v5 = [(_UITabModel *)self isEditable];
  int v6 = [v4 _isCustomizable];

  if (v5 != v6)
  {
    [(_UITabModel *)self _inferCurrentEditability];
  }
}

- (void)displayOrderIdentifiersDidChangeForGroup:(id)a3
{
}

- (void)_updateSelectedLeaf
{
}

- (void)setPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_persistenceIdentifier isEqualToString:v4])
  {
    int v5 = (NSString *)[v4 copy];
    persistenceIdentifier = self->_persistenceIdentifier;
    self->_persistenceIdentifier = v5;

    customizationStore = self->_customizationStore;
    if (customizationStore)
    {
      [(_UITabCustomizationStore *)customizationStore removeObserver:self];
      uint64_t v8 = self->_customizationStore;
      self->_customizationStore = 0;

      id v9 = [(_UITabModel *)self customizationStore];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40___UITabModel_setPersistenceIdentifier___block_invoke;
      v11[3] = &unk_1E52FA130;
      v11[4] = self;
      id v12 = v9;
      id v10 = v9;
      [(_UITabModel *)self _sendToObservers:v11 allowUpdatesDuringBroadcast:0];
    }
  }
}

- (void)favoriteOrderDidChange:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___UITabModel_favoriteOrderDidChange___block_invoke;
  v7[3] = &unk_1E52FA130;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  int v6 = v5;
  if (self)
  {
    [(_UITabModel *)self _sendToObservers:v7 allowUpdatesDuringBroadcast:0];
    int v6 = v8;
  }
}

- (void)customizationStoreDidReset:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42___UITabModel_customizationStoreDidReset___block_invoke;
  v7[3] = &unk_1E52FA130;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  int v6 = v5;
  if (self)
  {
    [(_UITabModel *)self _sendToObservers:v7 allowUpdatesDuringBroadcast:0];
    int v6 = v8;
  }
}

- (void)setEditing:(BOOL)a3
{
  int v4 = [(_UITabModel *)self isEditable] && a3;
  if (self->_editing != v4)
  {
    self->_editing = v4;
    id v5 = [(_UITabModel *)self tabBarController];
    -[UITabBarController _notifyEditingStateChange:](v5, v4);
  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  p_tabBarController = &self->_tabBarController;
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)p_tabBarController);
  int v6 = -[UITabBarController _resolvedPopoverPresentationControllerSourceItemForTab:](WeakRetained, (uint64_t)v4);

  return v6;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  observers = self->_observers;
  if (!observers)
  {
    id v5 = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    int v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSPointerArray *)observers compact];
  if (-[_UITabModel _indexOfObserver:]((uint64_t)self, v7) == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSPointerArray *)self->_observers addPointer:v7];
  }
}

- (uint64_t)_indexOfObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 8) count])
    {
      uint64_t v4 = 0;
      while ((id)[*(id *)(a1 + 8) pointerAtIndex:v4] != v3)
      {
        if (++v4 >= (unint64_t)[*(id *)(a1 + 8) count]) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)removeObserver:(id)a3
{
  if (self->_observers)
  {
    uint64_t v4 = -[_UITabModel _indexOfObserver:]((uint64_t)self, a3);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSPointerArray *)self->_observers removePointerAtIndex:v4];
    }
    observers = self->_observers;
    [(NSPointerArray *)observers compact];
  }
}

@end