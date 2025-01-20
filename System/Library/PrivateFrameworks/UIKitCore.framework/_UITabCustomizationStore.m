@interface _UITabCustomizationStore
+ (_UITabCustomizationStore)customizationStoreWithPersistenceIdentifier:(id)a3;
+ (id)_dataForKey:(id)a3 persistenceIdentifier:(id)a4;
+ (void)_saveData:(id)a3 forKey:(id)a4 persistenceIdentifier:(id)a5;
- (BOOL)favoriteOrderContainsTab:(id)a3;
- (BOOL)hasFavoriteOrderCustomization;
- (BOOL)hasModelCustomizations;
- (BOOL)isHiddenForTabIdentifier:(id)a3 isCustomized:(BOOL *)a4;
- (NSMutableDictionary)displayOrdersByIdentifier;
- (NSMutableOrderedSet)includedItems;
- (NSMutableSet)collapsedSectionIdentifiers;
- (NSMutableSet)excludedItems;
- (NSMutableSet)hiddenItems;
- (NSMutableSet)visibleItems;
- (NSPointerArray)observers;
- (NSString)persistenceIdentifier;
- (double)preferredSidebarWidth;
- (id)_initWithPersistenceIdentifier:(id)a3;
- (id)displayOrderIdentifiersForGroupWithIdentifier:(id)a3;
- (id)favoriteOrderForDefaultIdentifiers:(id)a3;
- (unint64_t)_indexOfObserver:(id)a3;
- (void)_notifyForContentReset;
- (void)_notifyForFavoriteOrderChange;
- (void)_saveCustomization;
- (void)_saveCustomizationForTab:(id)a3 recursive:(BOOL)a4;
- (void)_saveSidebarState;
- (void)addCollapsedSectionIdentifier:(id)a3 availableIdentifiers:(id)a4;
- (void)addObserver:(id)a3;
- (void)performWithoutSavingCustomization:(id)a3;
- (void)removeCollapsedSectionIdentifier:(id)a3 availableIdentifiers:(id)a4;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)saveCustomizationForTabs:(id)a3;
- (void)saveFavoriteOrderCustomization:(id)a3 defaultIdentifiers:(id)a4 excludedIdentifiers:(id)a5;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setExcludedItems:(id)a3;
- (void)setPreferredSidebarWidth:(double)a3;
- (void)updateCustomizationForTab:(id)a3;
@end

@implementation _UITabCustomizationStore

- (BOOL)isHiddenForTabIdentifier:(id)a3 isCustomized:(BOOL *)a4
{
  id v6 = a3;
  char v7 = [(NSMutableSet *)self->_hiddenItems containsObject:v6];
  if (v7) {
    char v8 = 1;
  }
  else {
    char v8 = [(NSMutableSet *)self->_visibleItems containsObject:v6];
  }
  *a4 = v8;

  return v7;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
    id v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSPointerArray *)observers compact];
  if ([(_UITabCustomizationStore *)self _indexOfObserver:v7] == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSPointerArray *)self->_observers addPointer:v7];
  }
}

- (unint64_t)_indexOfObserver:(id)a3
{
  id v4 = a3;
  if ([(NSPointerArray *)self->_observers count])
  {
    unint64_t v5 = 0;
    while ([(NSPointerArray *)self->_observers pointerAtIndex:v5] != v4)
    {
      if (++v5 >= [(NSPointerArray *)self->_observers count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (_UITabCustomizationStore)customizationStoreWithPersistenceIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_1EB261938 != -1) {
    dispatch_once(&qword_1EB261938, &__block_literal_global_329);
  }
  uint64_t v4 = [v3 copy];
  unint64_t v5 = (void *)v4;
  id v6 = @"com.apple.UIKit.UITabCustomization.DefaultIdentifier";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = [(id)_MergedGlobals_1123 objectForKey:v7];
  if (!v8)
  {
    id v8 = [[_UITabCustomizationStore alloc] _initWithPersistenceIdentifier:v7];
    [(id)_MergedGlobals_1123 setObject:v8 forKey:v7];
  }

  return (_UITabCustomizationStore *)v8;
}

- (id)_initWithPersistenceIdentifier:(id)a3
{
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_UITabCustomizationStore;
  id v6 = [(_UITabCustomizationStore *)&v65 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceIdentifier, a3);
    id v8 = [(id)objc_opt_class() _dataForKey:@"com.apple.UIKit.UITabCustomization" persistenceIdentifier:v5];
    id v9 = [v8 objectForKey:@"version"];
    v10 = v9;
    if (v9 == &unk_1ED3F49F8 || v9 && (int v11 = [v9 isEqual:&unk_1ED3F49F8], v10, v11))
    {
      uint64_t v12 = [v8 objectForKey:@"includedItems"];
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x1E4F1CBF0];
      if (v12) {
        v15 = (void *)v12;
      }
      else {
        v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v16 = v15;

      uint64_t v17 = [v8 objectForKey:@"excludedItems"];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = v14;
      }
      id v64 = v19;

      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v16];
      includedItems = v7->_includedItems;
      v7->_includedItems = (NSMutableOrderedSet *)v20;

      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v64];
      excludedItems = v7->_excludedItems;
      v7->_excludedItems = (NSMutableSet *)v22;

      uint64_t v24 = [v8 objectForKey:@"visibleItems"];
      v25 = (void *)v24;
      if (v24) {
        v26 = (void *)v24;
      }
      else {
        v26 = v14;
      }
      id v27 = v26;

      uint64_t v28 = [v8 objectForKey:@"hiddenItems"];
      v29 = (void *)v28;
      if (v28) {
        v30 = (void *)v28;
      }
      else {
        v30 = v14;
      }
      id v31 = v30;

      uint64_t v32 = [v8 objectForKey:@"displayOrder"];
      v33 = (void *)v32;
      v34 = (void *)MEMORY[0x1E4F1CC08];
      if (v32) {
        v34 = (void *)v32;
      }
      id v35 = v34;

      uint64_t v36 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v27];
      visibleItems = v7->_visibleItems;
      v7->_visibleItems = (NSMutableSet *)v36;

      uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v31];
      hiddenItems = v7->_hiddenItems;
      v7->_hiddenItems = (NSMutableSet *)v38;

      uint64_t v40 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v35];

      displayOrdersByIdentifier = v7->_displayOrdersByIdentifier;
      v7->_displayOrdersByIdentifier = (NSMutableDictionary *)v40;
    }
    else
    {
      uint64_t v42 = [MEMORY[0x1E4F1CA70] orderedSet];
      v43 = v7->_includedItems;
      v7->_includedItems = (NSMutableOrderedSet *)v42;

      uint64_t v44 = [MEMORY[0x1E4F1CA80] set];
      v45 = v7->_excludedItems;
      v7->_excludedItems = (NSMutableSet *)v44;

      uint64_t v46 = [MEMORY[0x1E4F1CA80] set];
      v47 = v7->_hiddenItems;
      v7->_hiddenItems = (NSMutableSet *)v46;

      uint64_t v48 = [MEMORY[0x1E4F1CA80] set];
      v49 = v7->_visibleItems;
      v7->_visibleItems = (NSMutableSet *)v48;

      uint64_t v50 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = v7->_displayOrdersByIdentifier;
      v7->_displayOrdersByIdentifier = (NSMutableDictionary *)v50;
    }

    v51 = [(id)objc_opt_class() _dataForKey:@"com.apple.UIKit.UITabSidebar" persistenceIdentifier:v5];

    v52 = [v51 objectForKey:@"version"];

    id v53 = v52;
    v54 = v53;
    if (v53 == &unk_1ED3F49F8 || v53 && (int v55 = [v53 isEqual:&unk_1ED3F49F8], v54, v55))
    {
      v56 = [v51 objectForKey:@"collapsedSections"];
      uint64_t v57 = [MEMORY[0x1E4F1CA80] setWithArray:v56];
      collapsedSectionIdentifiers = v7->_collapsedSectionIdentifiers;
      v7->_collapsedSectionIdentifiers = (NSMutableSet *)v57;

      v59 = [v51 objectForKey:@"preferredWidth"];
      [v59 doubleValue];
      v7->_preferredSidebarWidth = v60;
    }
    else
    {
      uint64_t v61 = [MEMORY[0x1E4F1CA80] set];
      v62 = v7->_collapsedSectionIdentifiers;
      v7->_collapsedSectionIdentifiers = (NSMutableSet *)v61;

      v7->_preferredSidebarWidth = 0.0;
    }
  }
  return v7;
}

+ (id)_dataForKey:(id)a3 persistenceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CB18];
  id v7 = a3;
  id v8 = [v6 standardUserDefaults];
  id v9 = [v8 objectForKey:v7];

  if (v9)
  {
    v10 = [v9 objectForKey:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)displayOrderIdentifiersForGroupWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_displayOrdersByIdentifier objectForKey:a3];
}

- (id)favoriteOrderForDefaultIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UITabCustomizationStore *)self hasFavoriteOrderCustomization])
  {
    id v5 = (void *)[(NSMutableOrderedSet *)self->_includedItems mutableCopy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ((-[NSMutableOrderedSet containsObject:](self->_includedItems, "containsObject:", v11, (void)v13) & 1) == 0
            && ([(NSMutableSet *)self->_excludedItems containsObject:v11] & 1) == 0)
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)performWithoutSavingCustomization:(id)a3
{
  self->_ignoringUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringUpdates = 0;
}

- (void)updateCustomizationForTab:(id)a3
{
  if (!self->_ignoringUpdates)
  {
    [(_UITabCustomizationStore *)self _saveCustomizationForTab:a3 recursive:0];
    [(_UITabCustomizationStore *)self _saveCustomization];
  }
}

- (void)saveCustomizationForTabs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_visibleItems removeAllObjects];
  [(NSMutableSet *)self->_hiddenItems removeAllObjects];
  [(NSMutableDictionary *)self->_displayOrdersByIdentifier removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_UITabCustomizationStore _saveCustomizationForTab:recursive:](self, "_saveCustomizationForTab:recursive:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), 1, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(_UITabCustomizationStore *)self _saveCustomization];
}

- (BOOL)favoriteOrderContainsTab:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _tabPlacement];
  if (v5 == 3)
  {
    LOBYTE(includedItems) = 1;
  }
  else
  {
    if (v5 == 2)
    {
      includedItems = self->_includedItems;
      uint64_t v6 = [v4 identifier];
      LOBYTE(includedItems) = [includedItems containsObject:v6];
    }
    else
    {
      if (v5 != 1)
      {
        LOBYTE(includedItems) = 0;
        goto LABEL_9;
      }
      includedItems = self->_excludedItems;
      uint64_t v6 = [v4 identifier];
      LODWORD(includedItems) = [includedItems containsObject:v6] ^ 1;
    }
  }
LABEL_9:

  return (char)includedItems;
}

- (void)saveFavoriteOrderCustomization:(id)a3 defaultIdentifiers:(id)a4 excludedIdentifiers:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NSMutableOrderedSet *)self->_includedItems removeAllObjects];
  [(NSMutableSet *)self->_excludedItems removeAllObjects];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ([v9 containsObject:v16]) {
          [(NSMutableSet *)self->_excludedItems addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  if (![v9 isEqual:v8] || -[NSMutableSet count](self->_excludedItems, "count"))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v23 + 1) + 8 * j);
          -[NSMutableOrderedSet addObject:](self->_includedItems, "addObject:", v22, (void)v23);
          [(NSMutableSet *)self->_excludedItems removeObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
  }
  [(_UITabCustomizationStore *)self _notifyForFavoriteOrderChange];
  [(_UITabCustomizationStore *)self _saveCustomization];
}

- (void)addCollapsedSectionIdentifier:(id)a3 availableIdentifiers:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (([(NSMutableSet *)self->_collapsedSectionIdentifiers containsObject:v9] & 1) == 0)
  {
    [(NSMutableSet *)self->_collapsedSectionIdentifiers addObject:v9];
    collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [(NSMutableSet *)collapsedSectionIdentifiers intersectSet:v8];

    [(_UITabCustomizationStore *)self _saveSidebarState];
  }
}

- (void)removeCollapsedSectionIdentifier:(id)a3 availableIdentifiers:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(NSMutableSet *)self->_collapsedSectionIdentifiers containsObject:v9])
  {
    [(NSMutableSet *)self->_collapsedSectionIdentifiers removeObject:v9];
    collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [(NSMutableSet *)collapsedSectionIdentifiers intersectSet:v8];

    [(_UITabCustomizationStore *)self _saveSidebarState];
  }
}

- (void)setPreferredSidebarWidth:(double)a3
{
  if (self->_preferredSidebarWidth != a3)
  {
    self->_preferredSidebarWidth = a3;
    [(_UITabCustomizationStore *)self _saveSidebarState];
  }
}

- (void)reset
{
  id v3 = objc_opt_class();
  id v4 = [(_UITabCustomizationStore *)self persistenceIdentifier];
  [v3 _saveData:0 forKey:@"com.apple.UIKit.UITabCustomization" persistenceIdentifier:v4];

  [(NSMutableOrderedSet *)self->_includedItems removeAllObjects];
  [(NSMutableSet *)self->_excludedItems removeAllObjects];
  [(NSMutableSet *)self->_visibleItems removeAllObjects];
  [(NSMutableSet *)self->_hiddenItems removeAllObjects];
  [(NSMutableDictionary *)self->_displayOrdersByIdentifier removeAllObjects];
  [(_UITabCustomizationStore *)self _notifyForContentReset];
}

- (void)_saveCustomizationForTab:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  int v8 = [v6 isHidden];
  if (v8 == [v6 isHiddenByDefault])
  {
    [(NSMutableSet *)self->_hiddenItems removeObject:v7];
    [(NSMutableSet *)self->_visibleItems removeObject:v7];
  }
  else
  {
    if ([v6 isHidden]) {
      hiddenItems = self->_hiddenItems;
    }
    else {
      hiddenItems = self->_visibleItems;
    }
    [(NSMutableSet *)hiddenItems addObject:v7];
  }
  if ([v6 _isGroup])
  {
    id v10 = v6;
    id v11 = [v10 _filteredDisplayOrderIdentifiers];
    uint64_t v12 = [v10 children];
    uint64_t v13 = objc_msgSend(v12, "bs_map:", &__block_literal_global_39_2);

    id v14 = v11;
    id v15 = v13;
    uint64_t v16 = v15;
    if (v14 == v15)
    {
    }
    else
    {
      if (!v14 || !v15)
      {

        goto LABEL_17;
      }
      char v17 = [v14 isEqual:v15];

      if ((v17 & 1) == 0)
      {
LABEL_17:
        [(NSMutableDictionary *)self->_displayOrdersByIdentifier setValue:v14 forKey:v7];
        if (v4) {
          goto LABEL_18;
        }
        goto LABEL_26;
      }
    }
    [(NSMutableDictionary *)self->_displayOrdersByIdentifier removeObjectForKey:v7];
    if (v4)
    {
LABEL_18:
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v18 = objc_msgSend(v10, "children", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            [(_UITabCustomizationStore *)self _saveCustomizationForTab:*(void *)(*((void *)&v23 + 1) + 8 * i) recursive:1];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v20);
      }
    }
LABEL_26:
  }
}

- (void)removeObserver:(id)a3
{
  if (self->_observers)
  {
    unint64_t v4 = [(_UITabCustomizationStore *)self _indexOfObserver:a3];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSPointerArray *)self->_observers removePointerAtIndex:v4];
    }
    observers = self->_observers;
    [(NSPointerArray *)observers compact];
  }
}

+ (void)_saveData:(id)a3 forKey:(id)a4 persistenceIdentifier:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v10 = [v9 objectForKey:v7];
  id v11 = (void *)[v10 mutableCopy];

  id v12 = v15;
  if (v15 && !v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = v15;
    id v11 = (void *)v13;
LABEL_5:
    [v11 setObject:v12 forKey:v8];
    goto LABEL_7;
  }
  if (v15) {
    goto LABEL_5;
  }
  [v11 removeObjectForKey:v8];
LABEL_7:
  id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v14 setObject:v11 forKey:v7];
}

- (BOOL)hasModelCustomizations
{
  uint64_t v3 = [(NSMutableSet *)self->_visibleItems count];
  uint64_t v4 = [(NSMutableSet *)self->_hiddenItems count] + v3;
  return v4 + [(NSMutableDictionary *)self->_displayOrdersByIdentifier count] != 0;
}

- (BOOL)hasFavoriteOrderCustomization
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_includedItems count];
  return v3 + [(NSMutableSet *)self->_excludedItems count] != 0;
}

- (void)_saveCustomization
{
  v13[6] = *MEMORY[0x1E4F143B8];
  if ([(_UITabCustomizationStore *)self hasFavoriteOrderCustomization]
    || [(_UITabCustomizationStore *)self hasModelCustomizations])
  {
    v13[0] = &unk_1ED3F49F8;
    v12[0] = @"version";
    v12[1] = @"includedItems";
    uint64_t v3 = [(NSMutableOrderedSet *)self->_includedItems array];
    uint64_t v4 = (void *)[v3 copy];
    v13[1] = v4;
    v12[2] = @"excludedItems";
    uint64_t v5 = [(NSMutableSet *)self->_excludedItems allObjects];
    v13[2] = v5;
    v12[3] = @"visibleItems";
    id v6 = [(NSMutableSet *)self->_visibleItems allObjects];
    v13[3] = v6;
    v12[4] = @"hiddenItems";
    id v7 = [(NSMutableSet *)self->_hiddenItems allObjects];
    v13[4] = v7;
    v12[5] = @"displayOrder";
    id v8 = (void *)[(NSMutableDictionary *)self->_displayOrdersByIdentifier copy];
    v13[5] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_opt_class();
  id v11 = [(_UITabCustomizationStore *)self persistenceIdentifier];
  [v10 _saveData:v9 forKey:@"com.apple.UIKit.UITabCustomization" persistenceIdentifier:v11];
}

- (void)_saveSidebarState
{
  v10[3] = *MEMORY[0x1E4F143B8];
  double preferredSidebarWidth = self->_preferredSidebarWidth;
  if (preferredSidebarWidth == 0.0)
  {
    if (![(NSMutableSet *)self->_collapsedSectionIdentifiers count])
    {
      id v6 = 0;
      goto LABEL_5;
    }
    double preferredSidebarWidth = self->_preferredSidebarWidth;
  }
  v10[0] = &unk_1ED3F49F8;
  v9[0] = @"version";
  v9[1] = @"preferredWidth";
  uint64_t v4 = [NSNumber numberWithDouble:preferredSidebarWidth];
  v10[1] = v4;
  v9[2] = @"collapsedSections";
  uint64_t v5 = [(NSMutableSet *)self->_collapsedSectionIdentifiers allObjects];
  v10[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

LABEL_5:
  id v7 = objc_opt_class();
  id v8 = [(_UITabCustomizationStore *)self persistenceIdentifier];
  [v7 _saveData:v6 forKey:@"com.apple.UIKit.UITabSidebar" persistenceIdentifier:v8];
}

- (void)_notifyForFavoriteOrderChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(NSPointerArray *)self->_observers copy];
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (v8) {
          [v8 favoriteOrderDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSPointerArray *)self->_observers compact];
}

- (void)_notifyForContentReset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(NSPointerArray *)self->_observers copy];
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (v8) {
          [v8 customizationStoreDidReset:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSPointerArray *)self->_observers compact];
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (NSMutableSet)excludedItems
{
  return self->_excludedItems;
}

- (void)setExcludedItems:(id)a3
{
}

- (NSMutableSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
}

- (double)preferredSidebarWidth
{
  return self->_preferredSidebarWidth;
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (NSMutableOrderedSet)includedItems
{
  return self->_includedItems;
}

- (NSMutableSet)hiddenItems
{
  return self->_hiddenItems;
}

- (NSMutableSet)visibleItems
{
  return self->_visibleItems;
}

- (NSMutableDictionary)displayOrdersByIdentifier
{
  return self->_displayOrdersByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayOrdersByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_includedItems, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end