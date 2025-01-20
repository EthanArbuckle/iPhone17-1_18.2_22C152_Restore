@interface SFUnifiedTabBarItemArrangement
- (BOOL)activeItemIsExpanded;
- (BOOL)allowsScrollingPinnedItems;
- (BOOL)isEqualToArrangement:(id)a3;
- (BOOL)revealsSquishedActiveItem;
- (NSArray)itemTitles;
- (NSArray)items;
- (NSArray)overflowPinnedItems;
- (NSArray)pinnedItems;
- (NSArray)unpinnedItems;
- (NSIndexSet)allItemIndexes;
- (SFUnifiedBarItem)activeItem;
- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItem:(id)a3;
- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemIsExpanded:(BOOL)a3;
- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemSquishState:(int64_t)a3;
- (SFUnifiedTabBarItemArrangement)init;
- (SFUnifiedTabBarItemArrangement)initWithItem:(id)a3 activeItemIsExpanded:(BOOL)a4;
- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4;
- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowsScrollingPinnedItems:(BOOL)a6;
- (id)_initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowPinning:(BOOL)a6 allowsScrollingPinnedItems:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolvedArrangementWithPinnedItemLimit:(unint64_t)a3 overflowItem:(id)a4;
- (int64_t)activeItemSquishState;
- (unint64_t)activeItemIndex;
- (unint64_t)pinnedItemLimit;
- (void)determineActiveItemSquishStateIfNeeded:(BOOL)a3;
- (void)setNeedsUpdateCachedItemTitles;
@end

@implementation SFUnifiedTabBarItemArrangement

- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowsScrollingPinnedItems:(BOOL)a6
{
  return (SFUnifiedTabBarItemArrangement *)[(SFUnifiedTabBarItemArrangement *)self _initWithItems:a3 activeItem:a4 activeItemIsExpanded:a5 allowPinning:1 allowsScrollingPinnedItems:a6];
}

- (id)_initWithItems:(id)a3 activeItem:(id)a4 activeItemIsExpanded:(BOOL)a5 allowPinning:(BOOL)a6 allowsScrollingPinnedItems:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v50.receiver = self;
  v50.super_class = (Class)SFUnifiedTabBarItemArrangement;
  v14 = [(SFUnifiedTabBarItemArrangement *)&v50 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_24;
  }
  v16 = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (v8)
  {
    BOOL v43 = a7;
    BOOL v44 = v9;
    id v45 = v13;
    v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v24 isPinned]) {
            v25 = v17;
          }
          else {
            v25 = v18;
          }
          [v25 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v21);
    }

    uint64_t v26 = [v17 copy];
    pinnedItems = v15->_pinnedItems;
    v15->_pinnedItems = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    unpinnedItems = v15->_unpinnedItems;
    v15->_unpinnedItems = (NSArray *)v28;

    uint64_t v30 = [(NSArray *)v15->_pinnedItems arrayByAddingObjectsFromArray:v15->_unpinnedItems];
    items = v15->_items;
    v15->_items = (NSArray *)v30;

    v15->_allowsScrollingPinnedItems = v43;
    id v13 = v45;
    BOOL v9 = v44;
    v16 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v32 = v14->_pinnedItems;
    v14->_pinnedItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    v33 = (NSArray *)[v12 copy];
    v34 = v15->_unpinnedItems;
    v15->_unpinnedItems = v33;

    v35 = v33;
    v17 = v15->_items;
    v15->_items = v35;
  }

  overflowPinnedItems = v15->_overflowPinnedItems;
  v15->_overflowPinnedItems = v16;

  p_activeItem = (void **)&v15->_activeItem;
  objc_storeStrong((id *)&v15->_activeItem, a4);
  if (!v15->_activeItem)
  {
    v39 = 0;
    v15->_activeItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  uint64_t v38 = -[NSArray indexOfObject:](v15->_items, "indexOfObject:");
  v15->_activeItemIndex = v38;
  if (v38 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = *p_activeItem;
LABEL_19:
    *p_activeItem = 0;
  }
  BOOL v40 = v9 && *p_activeItem != 0;
  v15->_activeItemIsExpanded = v40;
  v15->_activeItemSquishState = -1;
  [(SFUnifiedTabBarItemArrangement *)v15 setNeedsUpdateCachedItemTitles];
  v41 = v15;
LABEL_24:

  return v15;
}

- (void)setNeedsUpdateCachedItemTitles
{
  self->_needsUpdateCachedItemTitles = 1;
}

- (SFUnifiedBarItem)activeItem
{
  return self->_activeItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overflowPinnedItems, 0);
  objc_storeStrong((id *)&self->_unpinnedItems, 0);
  objc_storeStrong((id *)&self->_pinnedItems, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_itemTitles, 0);
}

- (SFUnifiedTabBarItemArrangement)initWithItems:(id)a3 activeItem:(id)a4
{
  return [(SFUnifiedTabBarItemArrangement *)self initWithItems:a3 activeItem:a4 activeItemIsExpanded:0 allowsScrollingPinnedItems:0];
}

- (SFUnifiedTabBarItemArrangement)init
{
  return [(SFUnifiedTabBarItemArrangement *)self initWithItems:MEMORY[0x1E4F1CBF0] activeItem:0];
}

- (SFUnifiedTabBarItemArrangement)initWithItem:(id)a3 activeItemIsExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11[0] = v6;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v9 = [(SFUnifiedTabBarItemArrangement *)self _initWithItems:v8 activeItem:v7 activeItemIsExpanded:v4 allowPinning:0 allowsScrollingPinnedItems:0];

  return v9;
}

- (BOOL)isEqualToArrangement:(id)a3
{
  id v4 = a3;
  pinnedItems = self->_pinnedItems;
  id v6 = [v4 pinnedItems];
  if ([(NSArray *)pinnedItems isEqualToArray:v6])
  {
    unpinnedItems = self->_unpinnedItems;
    BOOL v8 = [v4 unpinnedItems];
    if ([(NSArray *)unpinnedItems isEqualToArray:v8]
      && (int allowsScrollingPinnedItems = self->_allowsScrollingPinnedItems,
          allowsScrollingPinnedItems == [v4 allowsScrollingPinnedItems]))
    {
      activeItem = self->_activeItem;
      v11 = [v4 activeItem];
      if (activeItem == v11
        && (int activeItemIsExpanded = self->_activeItemIsExpanded,
            activeItemIsExpanded == [v4 activeItemIsExpanded]))
      {
        int64_t activeItemSquishState = self->_activeItemSquishState;
        BOOL v14 = activeItemSquishState == [v4 activeItemSquishState]
           || self->_activeItemSquishState == -1
           || [v4 activeItemSquishState] == -1;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFUnifiedTabBarItemArrangement *)self copy];
  uint64_t v6 = v5;
  if (v4) {
    uint64_t v7 = [*(id *)(v5 + 24) indexOfObject:v4];
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)(v6 + 40) = v7;
  if (self->_activeItemIndex == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v4;
  }
  objc_storeStrong((id *)(v6 + 32), v8);

  return (SFUnifiedTabBarItemArrangement *)(id)v6;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemIsExpanded:(BOOL)a3
{
  id v4 = (unsigned char *)[(SFUnifiedTabBarItemArrangement *)self copy];
  v4[9] = a3;

  return (SFUnifiedTabBarItemArrangement *)v4;
}

- (SFUnifiedTabBarItemArrangement)arrangementWithActiveItemSquishState:(int64_t)a3
{
  id v4 = (void *)[(SFUnifiedTabBarItemArrangement *)self copy];
  v4[6] = a3;

  return (SFUnifiedTabBarItemArrangement *)v4;
}

- (NSArray)itemTitles
{
  if (self->_needsUpdateCachedItemTitles)
  {
    v3 = [(NSArray *)self->_items safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_539];
    itemTitles = self->_itemTitles;
    self->_itemTitles = v3;

    self->_needsUpdateCachedItemTitles = 0;
  }
  uint64_t v5 = self->_itemTitles;

  return v5;
}

id __44__SFUnifiedTabBarItemArrangement_itemTitles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 title];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)resolvedArrangementWithPinnedItemLimit:(unint64_t)a3 overflowItem:(id)a4
{
  id v6 = a4;
  if (self->_allowsScrollingPinnedItems)
  {
    uint64_t v7 = self;
  }
  else if ([(NSArray *)self->_pinnedItems count] <= a3 + 1)
  {
    uint64_t v7 = (SFUnifiedTabBarItemArrangement *)[(SFUnifiedTabBarItemArrangement *)self copy];
    v7->_pinnedItemLimit = a3;
  }
  else
  {
    pinnedItems = self->_pinnedItems;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke;
    v25[3] = &unk_1E54EBA78;
    v25[4] = self;
    BOOL v9 = [(NSArray *)pinnedItems safari_filterObjectsUsingBlock:v25];
    NSUInteger v10 = [(NSArray *)self->_pinnedItems count] - a3;
    v11 = objc_msgSend(v9, "subarrayWithRange:", objc_msgSend(v9, "count") - v10, v10);
    id v12 = self->_pinnedItems;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke_2;
    v23 = &unk_1E54EBA78;
    id v13 = v11;
    v24 = v13;
    BOOL v14 = [(NSArray *)v12 safari_filterObjectsUsingBlock:&v20];
    v15 = objc_msgSend(v14, "arrayByAddingObject:", v6, v20, v21, v22, v23);
    v16 = [v15 arrayByAddingObjectsFromArray:self->_unpinnedItems];

    uint64_t v7 = [[SFUnifiedTabBarItemArrangement alloc] initWithItems:v16 activeItem:self->_activeItem activeItemIsExpanded:self->_activeItemIsExpanded allowsScrollingPinnedItems:0];
    v7->_int64_t activeItemSquishState = self->_activeItemSquishState;
    overflowPinnedItems = v7->_overflowPinnedItems;
    v7->_pinnedItemLimit = a3;
    v7->_overflowPinnedItems = v13;
    v18 = v13;
  }

  return v7;
}

uint64_t __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(*(void *)(a1 + 32) + 32) == a2) {
    return 0;
  }
  else {
    return [a2 isPlaceholder] ^ 1;
  }
}

uint64_t __86__SFUnifiedTabBarItemArrangement_resolvedArrangementWithPinnedItemLimit_overflowItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (BOOL)revealsSquishedActiveItem
{
  return self->_activeItemSquishState == 1;
}

- (NSIndexSet)allItemIndexes
{
  id v2 = (void *)MEMORY[0x1E4F28D60];
  NSUInteger v3 = [(NSArray *)self->_items count];

  return (NSIndexSet *)objc_msgSend(v2, "indexSetWithIndexesInRange:", 0, v3);
}

- (void)determineActiveItemSquishStateIfNeeded:(BOOL)a3
{
  if (self->_activeItemSquishState == -1) {
    self->_int64_t activeItemSquishState = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SFUnifiedTabBarItemArrangement);
  objc_storeStrong((id *)&v4->_activeItem, self->_activeItem);
  v4->_activeItemIndex = self->_activeItemIndex;
  v4->_int activeItemIsExpanded = self->_activeItemIsExpanded;
  v4->_int64_t activeItemSquishState = self->_activeItemSquishState;
  v4->_int allowsScrollingPinnedItems = self->_allowsScrollingPinnedItems;
  objc_storeStrong((id *)&v4->_items, self->_items);
  objc_storeStrong((id *)&v4->_overflowPinnedItems, self->_overflowPinnedItems);
  v4->_pinnedItemLimit = self->_pinnedItemLimit;
  objc_storeStrong((id *)&v4->_pinnedItems, self->_pinnedItems);
  objc_storeStrong((id *)&v4->_unpinnedItems, self->_unpinnedItems);
  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)activeItemIndex
{
  return self->_activeItemIndex;
}

- (BOOL)activeItemIsExpanded
{
  return self->_activeItemIsExpanded;
}

- (BOOL)allowsScrollingPinnedItems
{
  return self->_allowsScrollingPinnedItems;
}

- (int64_t)activeItemSquishState
{
  return self->_activeItemSquishState;
}

- (NSArray)pinnedItems
{
  return self->_pinnedItems;
}

- (NSArray)unpinnedItems
{
  return self->_unpinnedItems;
}

- (unint64_t)pinnedItemLimit
{
  return self->_pinnedItemLimit;
}

- (NSArray)overflowPinnedItems
{
  return self->_overflowPinnedItems;
}

@end