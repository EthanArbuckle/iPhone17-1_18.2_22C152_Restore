@interface _UITabSidebarTransaction
- (BOOL)isCommitted;
- (BOOL)isTabHidden:(id)a3;
- (NSMutableDictionary)tabsByIdentifier;
- (NSMutableDictionary)updatedDisplayOrderForGroup;
- (NSMutableSet)tabsBecomingHidden;
- (NSMutableSet)tabsBecomingVisible;
- (UITabBarControllerSidebar)sidebar;
- (_UITabSidebarTransaction)initWithTabs:(id)a3 sidebar:(id)a4;
- (id)_ancestorIdentifierForDescendant:(id)a3 parent:(id)a4;
- (id)_mutableDisplayOrderForGroupIdentifier:(id)a3;
- (id)currentDisplayOrderForGroupWithIdentifier:(id)a3;
- (void)_commit;
- (void)_resetDisplayOrderForGroup:(id)a3;
- (void)commit;
- (void)replaceTab:(id)a3 forIdentifier:(id)a4;
- (void)resetCustomizationForTabs:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setTabsBecomingHidden:(id)a3;
- (void)setTabsBecomingVisible:(id)a3;
- (void)setUpdatedDisplayOrderForGroup:(id)a3;
- (void)updateTab:(id)a3 toHidden:(BOOL)a4;
- (void)updateTabs:(id)a3;
- (void)updateUsingTransaction:(id)a3;
@end

@implementation _UITabSidebarTransaction

- (_UITabSidebarTransaction)initWithTabs:(id)a3 sidebar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UITabSidebarTransaction;
  v8 = [(_UITabSidebarTransaction *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_committed = 0;
    uint64_t v10 = [v6 mutableCopy];
    tabsByIdentifier = v9->_tabsByIdentifier;
    v9->_tabsByIdentifier = (NSMutableDictionary *)v10;

    objc_storeWeak((id *)&v9->_sidebar, v7);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    tabsBecomingHidden = v9->_tabsBecomingHidden;
    v9->_tabsBecomingHidden = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    tabsBecomingVisible = v9->_tabsBecomingVisible;
    v9->_tabsBecomingVisible = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updatedDisplayOrderForGroup = v9->_updatedDisplayOrderForGroup;
    v9->_updatedDisplayOrderForGroup = v16;
  }
  return v9;
}

- (void)updateTabs:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (NSMutableDictionary *)[v4 mutableCopy];
  tabsByIdentifier = self->_tabsByIdentifier;
  self->_tabsByIdentifier = v5;

  id v7 = (void *)[(NSMutableSet *)self->_tabsBecomingVisible mutableCopy];
  v8 = (void *)[(NSMutableSet *)self->_tabsBecomingHidden mutableCopy];
  tabsBecomingVisible = self->_tabsBecomingVisible;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39___UITabSidebarTransaction_updateTabs___block_invoke;
  v32[3] = &unk_1E52E1708;
  id v10 = v4;
  id v33 = v10;
  id v11 = v7;
  id v34 = v11;
  [(NSMutableSet *)tabsBecomingVisible enumerateObjectsUsingBlock:v32];
  tabsBecomingHidden = self->_tabsBecomingHidden;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39___UITabSidebarTransaction_updateTabs___block_invoke_2;
  v29[3] = &unk_1E52E1708;
  id v13 = v10;
  id v30 = v13;
  id v14 = v8;
  id v31 = v14;
  [(NSMutableSet *)tabsBecomingHidden enumerateObjectsUsingBlock:v29];
  objc_storeStrong((id *)&self->_tabsBecomingVisible, v7);
  objc_storeStrong((id *)&self->_tabsBecomingHidden, v8);
  v15 = [(_UITabSidebarTransaction *)self updatedDisplayOrderForGroup];
  v16 = [v15 allKeys];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v23 = objc_msgSend(v13, "objectForKey:", v22, (void)v25);
        v24 = v23;
        if (!v23 || ([v23 _isGroup] & 1) == 0) {
          [(NSMutableDictionary *)self->_updatedDisplayOrderForGroup removeObjectForKey:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v19);
  }
}

- (void)replaceTab:(id)a3 forIdentifier:(id)a4
{
}

- (BOOL)isTabHidden:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([(NSMutableSet *)self->_tabsBecomingHidden containsObject:v5])
  {
    char v6 = 1;
  }
  else if ([(NSMutableSet *)self->_tabsBecomingVisible containsObject:v5])
  {
    char v6 = 0;
  }
  else
  {
    char v6 = [v4 isHidden];
  }

  return v6;
}

- (void)updateTab:(id)a3 toHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(_UITabSidebarTransaction *)self isCommitted])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UITabSidebarTransaction.m" lineNumber:94 description:@"Cannot update a transaction that has already been committed."];
  }
  id v7 = [v11 identifier];
  if (v4)
  {
    if ([(NSMutableSet *)self->_tabsBecomingVisible containsObject:v7])
    {
      tabsBecomingVisible = self->_tabsBecomingVisible;
LABEL_8:
      [(NSMutableSet *)tabsBecomingVisible removeObject:v7];
      goto LABEL_14;
    }
    if (([v11 isHidden] & 1) == 0)
    {
      tabsBecomingHidden = self->_tabsBecomingHidden;
LABEL_13:
      [(NSMutableSet *)tabsBecomingHidden addObject:v7];
    }
  }
  else
  {
    if ([(NSMutableSet *)self->_tabsBecomingHidden containsObject:v7])
    {
      tabsBecomingVisible = self->_tabsBecomingHidden;
      goto LABEL_8;
    }
    if ([v11 isHidden])
    {
      tabsBecomingHidden = self->_tabsBecomingVisible;
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)resetCustomizationForTabs:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54___UITabSidebarTransaction_resetCustomizationForTabs___block_invoke;
  v3[3] = &unk_1E52F1CF8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (void)_resetDisplayOrderForGroup:(id)a3
{
  id v6 = a3;
  if ([v6 allowsReordering])
  {
    BOOL v4 = [v6 identifier];
    v5 = [(_UITabSidebarTransaction *)self _mutableDisplayOrderForGroupIdentifier:v4];

    [v5 removeAllObjects];
  }
}

- (id)currentDisplayOrderForGroupWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_updatedDisplayOrderForGroup objectForKey:a3];
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (id)_mutableDisplayOrderForGroupIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)self->_updatedDisplayOrderForGroup objectForKey:v5];
  id v7 = v6;
  if (!v6 || ![v6 count])
  {
    v8 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
    v9 = [v8 objectForKey:v5];

    if (([v9 _isGroup] & 1) == 0)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"_UITabSidebarTransaction.m", 147, @"Cannot change the display order for a non-group element: %@", v9 object file lineNumber description];
    }
    id v10 = [v9 _filteredDisplayOrderIdentifiers];
    id v11 = v10;
    if (v7)
    {
      [v7 addObjectsFromArray:v10];
    }
    else
    {
      id v7 = (void *)[v10 mutableCopy];
      [(NSMutableDictionary *)self->_updatedDisplayOrderForGroup setObject:v7 forKey:v5];
    }
  }
  return v7;
}

- (id)_ancestorIdentifierForDescendant:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    while (1)
    {
      id v10 = [v9 _parentGroup];
      id v11 = [v10 identifier];
      v12 = [v7 identifier];
      id v13 = v11;
      id v14 = v12;
      if (v13 == v14) {
        break;
      }
      v15 = v14;
      if (v13 && v14)
      {
        char v16 = [v13 isEqual:v14];

        if (v16) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      id v17 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
      uint64_t v18 = [v9 _parentGroup];
      uint64_t v19 = [v18 identifier];
      uint64_t v20 = [v17 objectForKey:v19];

      v9 = (void *)v20;
      if (!v20) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  v21 = [v9 identifier];

  return v21;
}

- (void)updateUsingTransaction:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(_UITabSidebarTransaction *)self isCommitted])
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"_UITabSidebarTransaction.m" lineNumber:171 description:@"Cannot update a transaction that has already been committed."];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v40 = v5;
  id obj = [v5 sectionTransactions];
  uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v6;
        id v7 = *(void **)(*((void *)&v58 + 1) + 8 * v6);
        v8 = [v7 difference];
        v9 = [v7 finalSnapshot];
        id v10 = [v9 items];

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v45 = v8;
        id v48 = [v8 removals];
        uint64_t v11 = [v48 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v55 != v13) {
                objc_enumerationMutation(v48);
              }
              v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              char v16 = [v15 object];
              id v17 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
              uint64_t v18 = [v17 objectForKey:v16];

              uint64_t v19 = [v18 _parentGroup];
              uint64_t v20 = [v19 identifier];

              v21 = [(_UITabSidebarTransaction *)self _mutableDisplayOrderForGroupIdentifier:v20];
              uint64_t v22 = [v15 object];
              [v21 removeObject:v22];
            }
            uint64_t v12 = [v48 countByEnumeratingWithState:&v54 objects:v63 count:16];
          }
          while (v12);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v46 = [v45 insertions];
        id v49 = (id)[v46 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v49)
        {
          uint64_t v47 = *(void *)v51;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v51 != v47) {
                objc_enumerationMutation(v46);
              }
              v24 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
              long long v25 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
              long long v26 = [v24 object];
              long long v27 = [v25 objectForKey:v26];

              long long v28 = [v27 _parentGroup];
              v29 = [v28 identifier];
              id v30 = [(_UITabSidebarTransaction *)self _mutableDisplayOrderForGroupIdentifier:v29];

              unint64_t v31 = [v24 index];
              if (v31 >= [v10 count] - 1)
              {
                v32 = [v10 objectAtIndex:v31 - 1];
                uint64_t v36 = [(_UITabSidebarTransaction *)self _ancestorIdentifierForDescendant:v32 parent:v28];
                if (v36)
                {
                  id v34 = (void *)v36;
                  uint64_t v35 = [v30 indexOfObject:v36] + 1;
LABEL_25:

                  if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_31;
                  }
                  goto LABEL_28;
                }
              }
              else
              {
                v32 = [v10 objectAtIndex:v31 + 1];
                uint64_t v33 = [(_UITabSidebarTransaction *)self _ancestorIdentifierForDescendant:v32 parent:v28];
                if (v33)
                {
                  id v34 = (void *)v33;
                  uint64_t v35 = [v30 indexOfObject:v33];
                  goto LABEL_25;
                }
              }

LABEL_28:
              unint64_t v37 = [v24 index];
              if (v37 >= [v24 associatedIndex]) {
                uint64_t v35 = [v30 count];
              }
              else {
                uint64_t v35 = 0;
              }
LABEL_31:
              v38 = [v24 object];
              [v30 insertObject:v38 atIndex:v35];
            }
            id v49 = (id)[v46 countByEnumeratingWithState:&v50 objects:v62 count:16];
          }
          while (v49);
        }

        uint64_t v6 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v43);
  }
}

- (void)commit
{
  if ([(_UITabSidebarTransaction *)self isCommitted])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UITabSidebarTransaction.m" lineNumber:231 description:@"Cannot commit a transaction that has already been committed."];
  }
  [(_UITabSidebarTransaction *)self setCommitted:1];
  uint64_t v4 = [(_UITabSidebarTransaction *)self sidebar];
  id v5 = (void *)v4;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_8;
  }
  id v6 = *(id *)(v4 + 40);
  id v7 = v6;
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = (void *)*((void *)v6 + 145);
LABEL_6:
  id v9 = v8;

  id v10 = [v9 customizationStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34___UITabSidebarTransaction_commit__block_invoke;
  v13[3] = &unk_1E52D9F70;
  v13[4] = self;
  [v10 performWithoutSavingCustomization:v13];
  uint64_t v11 = [v9 tabItems];
  [v10 saveCustomizationForTabs:v11];
}

- (void)_commit
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v5 = [(_UITabSidebarTransaction *)self tabsBecomingHidden];
  uint64_t v6 = [v5 count];
  id v7 = [(_UITabSidebarTransaction *)self tabsBecomingVisible];
  v8 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v7, "count") + v6);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  id v9 = [(_UITabSidebarTransaction *)self tabsBecomingVisible];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v15 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
        char v16 = [v15 objectForKey:v14];

        [v16 setHidden:0];
        [v8 addObject:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = [(_UITabSidebarTransaction *)self tabsBecomingHidden];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        v23 = [(_UITabSidebarTransaction *)self tabsByIdentifier];
        v24 = [v23 objectForKey:v22];

        [v24 setHidden:1];
        [v8 addObject:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [(_UITabSidebarTransaction *)self sidebar];
  long long v26 = (void *)v25;
  if (v25) {
    long long v27 = *(void **)(v25 + 40);
  }
  else {
    long long v27 = 0;
  }
  long long v28 = v27;

  if ([v8 count])
  {
    v29 = (void *)[v8 copy];
    -[UITabBarController _notifyVisibilityChangesForTabs:](v28, v29);
  }
  id v30 = [(_UITabSidebarTransaction *)self updatedDisplayOrderForGroup];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __35___UITabSidebarTransaction__commit__block_invoke;
  v32[3] = &unk_1E52F1D20;
  uint64_t v33 = v28;
  SEL v34 = a2;
  void v32[4] = self;
  unint64_t v31 = v28;
  [v30 enumerateKeysAndObjectsUsingBlock:v32];
}

- (UITabBarControllerSidebar)sidebar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidebar);
  return (UITabBarControllerSidebar *)WeakRetained;
}

- (NSMutableDictionary)tabsByIdentifier
{
  return self->_tabsByIdentifier;
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (NSMutableSet)tabsBecomingVisible
{
  return self->_tabsBecomingVisible;
}

- (void)setTabsBecomingVisible:(id)a3
{
}

- (NSMutableSet)tabsBecomingHidden
{
  return self->_tabsBecomingHidden;
}

- (void)setTabsBecomingHidden:(id)a3
{
}

- (NSMutableDictionary)updatedDisplayOrderForGroup
{
  return self->_updatedDisplayOrderForGroup;
}

- (void)setUpdatedDisplayOrderForGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDisplayOrderForGroup, 0);
  objc_storeStrong((id *)&self->_tabsBecomingHidden, 0);
  objc_storeStrong((id *)&self->_tabsBecomingVisible, 0);
  objc_storeStrong((id *)&self->_tabsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_sidebar);
}

@end