@interface _UIFloatingTabBarParser
- (BOOL)_canDisplayTabInBar:(id)a3;
- (BOOL)containsDescendantOfTab:(BOOL)a1;
- (NSMutableArray)fixedTabs;
- (NSMutableArray)pinnedTabs;
- (NSMutableArray)sourceTabs;
- (NSOrderedSet)favoriteOrder;
- (id)_listItemsForTabs:(id)a3 customizableOnly:(BOOL)a4;
- (id)_listItemsFromFavoriteOrder;
- (id)_listItemsFromOverrideFavoriteOrder;
- (id)sourceTabIdentifiers;
- (id)validateFavoriteOrder:(id *)a1;
- (uint64_t)containsTab:(uint64_t)a1;
- (void)_insertIdentifiersFromItems:(id)a3 intoSet:(id)a4;
- (void)_parseTabs:(id)a3 fixedTabs:(id)a4 sourceTabs:(id)a5 pinnedTabs:(id)a6 sourceIdentifiers:(id)a7;
- (void)currentFavoriteOrder;
- (void)fixedItems;
- (void)invalidateFavorites;
- (void)itemIdentifiers;
- (void)items;
- (void)pinnedItems;
- (void)reloadItems;
- (void)setIgnoredFavoriteOrderItems:(uint64_t)a1;
@end

@implementation _UIFloatingTabBarParser

- (void)fixedItems
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[2];
    if (!v3)
    {
      v4 = [a1 fixedTabs];
      uint64_t v5 = [v2 _listItemsForTabs:v4 customizableOnly:0];
      v6 = (void *)v2[2];
      v2[2] = v5;

      v7 = (void *)v2[5];
      v2[5] = 0;

      v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)pinnedItems
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[3];
    if (!v3)
    {
      v4 = [a1 pinnedTabs];
      uint64_t v5 = [v2 _listItemsForTabs:v4 customizableOnly:0];
      v6 = (void *)v2[3];
      v2[3] = v5;

      v7 = (void *)v2[5];
      v2[5] = 0;

      v3 = (void *)v2[3];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)items
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[4];
    if (v3)
    {
LABEL_9:
      a1 = v3;
      uint64_t v1 = vars8;
      goto LABEL_10;
    }
    if (a1[9])
    {
      uint64_t v4 = [a1 _listItemsFromOverrideFavoriteOrder];
    }
    else
    {
      uint64_t v5 = [a1 favoriteOrder];

      if (!v5)
      {
        v6 = [v2 sourceTabs];
        uint64_t v10 = [v2 _listItemsForTabs:v6 customizableOnly:1];
        v11 = (void *)v2[4];
        v2[4] = v10;

        goto LABEL_8;
      }
      uint64_t v4 = [v2 _listItemsFromFavoriteOrder];
    }
    v6 = (void *)v2[4];
    v2[4] = v4;
LABEL_8:

    v7 = (void *)v2[5];
    v2[5] = 0;

    v8 = (void *)v2[6];
    v2[6] = 0;

    v3 = (void *)v2[4];
    goto LABEL_9;
  }
LABEL_10:
  return a1;
}

- (void)currentFavoriteOrder
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = (void *)a1[6];
    if (!v2)
    {
      v3 = -[_UIFloatingTabBarParser items](a1);
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "tabForSelection", (void)v15);
            v11 = [v10 identifier];

            [v4 addObject:v11];
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }

      uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v4];
      v13 = (void *)v1[6];
      v1[6] = v12;

      v2 = (void *)v1[6];
    }
    a1 = v2;
  }
  return a1;
}

- (void)setIgnoredFavoriteOrderItems:(uint64_t)a1
{
  id v9 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 88);
    id v4 = v9;
    id v5 = v4;
    if (v3 == v4)
    {
    }
    else
    {
      if (v4 && v3)
      {
        char v6 = [v3 isEqual:v4];

        if (v6) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      uint64_t v7 = [v5 copy];
      uint64_t v8 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v7;

      id v5 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
LABEL_11:
}

- (id)sourceTabIdentifiers
{
  if (a1)
  {
    -[_UIFloatingTabBarParser validateFavoriteOrder:](a1, a1[7]);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)validateFavoriteOrder:(id *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [a1[8] tabForIdentifier:v10];
          if (![v11 _hasCustomizablePlacement]
            || ([a1 _canDisplayTabInBar:v11] & 1) == 0)
          {
            if (!v7) {
              uint64_t v7 = (void *)[v4 mutableCopy];
            }
            [v7 removeObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    if (v7) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = v4;
    }
    a1 = v12;
  }
  return a1;
}

- (void)invalidateFavorites
{
  if (a1)
  {
    id v6 = [*(id *)(a1 + 64) customizationStore];
    v2 = -[_UIFloatingTabBarParser sourceTabIdentifiers]((id *)a1);
    uint64_t v3 = [v6 favoriteOrderForDefaultIdentifiers:v2];
    id v4 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v3;

    uint64_t v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (void)itemIdentifiers
{
  if (a1)
  {
    v2 = a1;
    uint64_t v3 = (void *)a1[5];
    if (!v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v5 = -[_UIFloatingTabBarParser fixedItems](v2);
      uint64_t v6 = [v5 count];
      uint64_t v7 = -[_UIFloatingTabBarParser pinnedItems](v2);
      uint64_t v8 = [v7 count] + v6;
      id v9 = -[_UIFloatingTabBarParser items](v2);
      uint64_t v10 = objc_msgSend(v4, "initWithCapacity:", v8 + objc_msgSend(v9, "count"));

      v11 = -[_UIFloatingTabBarParser fixedItems](v2);
      [v2 _insertIdentifiersFromItems:v11 intoSet:v10];

      uint64_t v12 = -[_UIFloatingTabBarParser items](v2);
      [v2 _insertIdentifiersFromItems:v12 intoSet:v10];

      v13 = -[_UIFloatingTabBarParser pinnedItems](v2);
      [v2 _insertIdentifiersFromItems:v13 intoSet:v10];

      uint64_t v14 = [v10 copy];
      long long v15 = (void *)v2[5];
      v2[5] = v14;

      uint64_t v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)containsTab:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[_UIFloatingTabBarParser fixedItems]((void *)a1);
    char IsRepresentedInListItems = _UITabIsRepresentedInListItems(v3, v4);

    if ((IsRepresentedInListItems & 1) != 0
      || (-[_UIFloatingTabBarParser items]((void *)a1),
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = _UITabIsRepresentedInListItems(v3, v6),
          v6,
          (v7 & 1) != 0))
    {
      a1 = 1;
    }
    else
    {
      uint64_t v8 = -[_UIFloatingTabBarParser pinnedItems]((void *)a1);
      a1 = _UITabIsRepresentedInListItems(v3, v8);
    }
  }

  return a1;
}

- (BOOL)containsDescendantOfTab:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[_UIFloatingTabBarParser fixedItems]((void *)a1);
    BOOL IsAncestorOfTabsInListItems = _UITabIsAncestorOfTabsInListItems(v3, v4);

    if (IsAncestorOfTabsInListItems
      || (-[_UIFloatingTabBarParser items]((void *)a1),
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = _UITabIsAncestorOfTabsInListItems(v3, v6),
          v6,
          v7))
    {
      a1 = 1;
    }
    else
    {
      uint64_t v8 = -[_UIFloatingTabBarParser pinnedItems]((void *)a1);
      a1 = _UITabIsAncestorOfTabsInListItems(v3, v8);
    }
  }

  return a1;
}

- (void)reloadItems
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v5 = [*(id *)(a1 + 64) tabItems];
    uint64_t v6 = (void *)v5;
    BOOL v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      BOOL v7 = (void *)v5;
    }
    id v8 = v7;

    [(id)a1 _parseTabs:v8 fixedTabs:v2 sourceTabs:v3 pinnedTabs:v4 sourceIdentifiers:v20];
    id v9 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v2;
    id v10 = v2;

    v11 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v3;
    id v12 = v3;

    v13 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v4;
    id v14 = v4;

    uint64_t v15 = [v20 copy];
    long long v16 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v15;

    long long v17 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    long long v18 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    uint64_t v19 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    -[_UIFloatingTabBarParser invalidateFavorites](a1);
  }
}

- (void)_parseTabs:(id)a3 fixedTabs:(id)a4 sourceTabs:(id)a5 pinnedTabs:(id)a6 sourceIdentifiers:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v16 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v11);
        }
        id v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        switch([v20 _tabPlacement])
        {
          case 1:
          case 3:
            [v13 addObject:v20];
            v21 = [v20 identifier];
            [v15 addObject:v21];

            break;
          case 4:
            v22 = v14;
            goto LABEL_10;
          case 5:
            v22 = v12;
LABEL_10:
            [v22 addObject:v20];
            break;
          default:
            break;
        }
        if ([v20 _isGroup])
        {
          v23 = [v20 children];
          [(_UIFloatingTabBarParser *)self _parseTabs:v23 fixedTabs:v12 sourceTabs:v13 pinnedTabs:v14 sourceIdentifiers:v15];
        }
      }
      uint64_t v17 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)_insertIdentifiersFromItems:(id)a3 intoSet:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    id v23 = v5;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        id v12 = [v11 tabForSelection];

        if (v12)
        {
          id v13 = [v11 tabForSelection];
          id v14 = [v13 identifier];
          [v6 addObject:v14];

LABEL_8:
          goto LABEL_9;
        }
        id v15 = [v11 children];

        if (v15)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = [v11 children];
          uint64_t v16 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v13);
                }
                id v20 = [*(id *)(*((void *)&v24 + 1) + 8 * i) tabForSelection];
                v21 = [v20 identifier];
                [v6 addObject:v21];
              }
              uint64_t v17 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v17);
            id v5 = v23;
          }
          goto LABEL_8;
        }
LABEL_9:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v22 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }
}

- (id)_listItemsForTabs:(id)a3 customizableOnly:(BOOL)a4
{
  BOOL v26 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = (_UIFloatingTabBarListItem *)v5;
  uint64_t v7 = [(_UIFloatingTabBarListItem *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v30;
    BOOL v12 = v26;
    uint64_t v28 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v6);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([(_UIFloatingTabBarParser *)self _canDisplayTabInBar:v14]
          && (!v12 || [v14 _hasCustomizablePlacement]))
        {
          id v15 = [[_UIFloatingTabBarListItem alloc] initWithTab:v14];
          if (self && self->_supportsGroupClusters)
          {
            uint64_t v16 = [v14 _clusterIdentifier];
            if (!v10) {
              goto LABEL_12;
            }
LABEL_16:
            uint64_t v18 = v6;
            id v9 = v9;
            id v19 = v16;
            if (v9 == v19)
            {
            }
            else
            {
              id v20 = v19;
              if (!v9 || !v19)
              {

                goto LABEL_24;
              }
              int v21 = [v9 isEqual:v19];

              if (!v21)
              {
LABEL_24:
                uint64_t v22 = [[_UIFloatingTabBarListItem alloc] initWithChildren:v10];
                [v27 addObject:v22];

                id v9 = 0;
                uint64_t v10 = 0;
LABEL_25:
                id v6 = v18;
                BOOL v12 = v26;
                uint64_t v11 = v28;
                if (!v16)
                {
LABEL_26:
                  [v27 addObject:v15];
LABEL_27:

                  continue;
                }
LABEL_13:
                if (!v10)
                {
                  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, 0);
                  id v17 = v16;

                  id v9 = v17;
                  uint64_t v11 = v28;
                }
                goto LABEL_27;
              }
            }
            [v10 addObject:v15];
            goto LABEL_25;
          }
          uint64_t v16 = 0;
          if (v10) {
            goto LABEL_16;
          }
LABEL_12:
          if (!v16) {
            goto LABEL_26;
          }
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(_UIFloatingTabBarListItem *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v8)
      {

        if (v10)
        {
          id v23 = [[_UIFloatingTabBarListItem alloc] initWithChildren:v10];
          [v27 addObject:v23];
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
  }
  uint64_t v10 = 0;
  id v9 = 0;
  id v23 = v6;
LABEL_33:

LABEL_34:
  long long v24 = (void *)[v27 copy];

  return v24;
}

- (id)_listItemsFromOverrideFavoriteOrder
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (self) {
    overrideFavoriteOrder = self->_overrideFavoriteOrder;
  }
  else {
    overrideFavoriteOrder = 0;
  }
  id v5 = objc_msgSend(v3, "initWithCapacity:", -[NSOrderedSet count](overrideFavoriteOrder, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    id v6 = self->_overrideFavoriteOrder;
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (self) {
          ignoredFavoriteOrderItems = self->_ignoredFavoriteOrderItems;
        }
        else {
          ignoredFavoriteOrderItems = 0;
        }
        if (!-[NSSet containsObject:](ignoredFavoriteOrderItems, "containsObject:", *(void *)(*((void *)&v24 + 1) + 8 * v11), (void)v24))
        {
          id v14 = v12;
          if (v14 != @"com.apple.UIKit.TabBar.Placeholder")
          {
            id v15 = v14;
            if (v14)
            {
              int v16 = [(__CFString *)v14 isEqual:0x1ED0ECD20];

              if (!v16) {
                goto LABEL_22;
              }
LABEL_18:
              if (self) {
                placeholderTab = self->_placeholderTab;
              }
              else {
                placeholderTab = 0;
              }
              uint64_t v18 = +[_UIFloatingTabBarListItem placeholderItemForTab:placeholderTab];
              [v5 addObject:v18];
            }
            else
            {

LABEL_22:
              if (self) {
                tabModel = self->_tabModel;
              }
              else {
                tabModel = 0;
              }
              uint64_t v18 = [(_UITabModel *)tabModel tabForIdentifier:v15];
              if ([v18 _hasCustomizablePlacement]
                && [(_UIFloatingTabBarParser *)self _canDisplayTabInBar:v18])
              {
                id v20 = [[_UIFloatingTabBarListItem alloc] initWithTab:v18];
                [v5 addObject:v20];
              }
            }

            goto LABEL_28;
          }

          goto LABEL_18;
        }
LABEL_28:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v21 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }

  uint64_t v22 = (void *)[v5 copy];
  return v22;
}

- (id)_listItemsFromFavoriteOrder
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(_UIFloatingTabBarParser *)self favoriteOrder];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(_UIFloatingTabBarParser *)self favoriteOrder];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        if (self)
        {
          if ([(NSSet *)self->_ignoredFavoriteOrderItems containsObject:*(void *)(*((void *)&v18 + 1) + 8 * v10)])
          {
            goto LABEL_13;
          }
          tabModel = self->_tabModel;
        }
        else
        {
          char v14 = [0 containsObject:*(void *)(*((void *)&v18 + 1) + 8 * v10)];
          tabModel = 0;
          if (v14) {
            goto LABEL_13;
          }
        }
        id v13 = [(_UITabModel *)tabModel tabForIdentifier:v11];
        if ([v13 _hasCustomizablePlacement]
          && [(_UIFloatingTabBarParser *)self _canDisplayTabInBar:v13])
        {
          [v5 addObject:v13];
        }

LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  int v16 = [(_UIFloatingTabBarParser *)self _listItemsForTabs:v5 customizableOnly:1];

  return v16;
}

- (BOOL)_canDisplayTabInBar:(id)a3
{
  id v4 = a3;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  BOOL v6 = !-[_UITabModel isTabHidden:](tabModel, "isTabHidden:", v4) && [v4 _tabPlacement] != 6;

  return v6;
}

- (NSMutableArray)fixedTabs
{
  return self->_fixedTabs;
}

- (NSMutableArray)sourceTabs
{
  return self->_sourceTabs;
}

- (NSMutableArray)pinnedTabs
{
  return self->_pinnedTabs;
}

- (NSOrderedSet)favoriteOrder
{
  return self->_favoriteOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteOrder, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
  objc_storeStrong((id *)&self->_sourceTabs, 0);
  objc_storeStrong((id *)&self->_fixedTabs, 0);
  objc_storeStrong((id *)&self->_ignoredFavoriteOrderItems, 0);
  objc_storeStrong((id *)&self->_placeholderTab, 0);
  objc_storeStrong((id *)&self->_overrideFavoriteOrder, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_sourceTabIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentFavoriteOrder, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_pinnedItems, 0);
  objc_storeStrong((id *)&self->_fixedItems, 0);
}

@end