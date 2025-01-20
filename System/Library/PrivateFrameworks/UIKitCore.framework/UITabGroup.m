@interface UITabGroup
- (BOOL)_canBeReordered;
- (BOOL)_canReorderChild:(id)a3;
- (BOOL)_isCustomizable;
- (BOOL)_isGroup;
- (BOOL)_setDisplayOrderIdentifiers:(id)a3;
- (BOOL)allowsReordering;
- (NSArray)children;
- (NSArray)displayOrder;
- (NSArray)displayOrderIdentifiers;
- (NSArray)sidebarActions;
- (NSString)defaultChildIdentifier;
- (UINavigationController)managingNavigationController;
- (UITab)selectedChild;
- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 children:(id)a6 viewControllerProvider:(id)a7;
- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6;
- (id)_defaultChildForSelection;
- (id)_displayedViewController;
- (id)_existingDisplayedViewController;
- (id)_filteredDisplayOrderIdentifiers;
- (id)_orderedChildrenForDisplayOrder:(id)a3;
- (id)_selectedTabHierarchy;
- (id)managingTabGroup;
- (id)tabForIdentifier:(id)a3;
- (unint64_t)sidebarAppearance;
- (void)_didChangeTabModel:(id)a3;
- (void)_elementsDidChange;
- (void)_invalidateDisplayOrder;
- (void)_performWithoutUpdatingManagingNavigationController:(id)a3;
- (void)_registerManagingNavigationTraitsIfNeeded;
- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5;
- (void)_selectedElementDidChange;
- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4;
- (void)_updateForManagingNavigationStackChange;
- (void)_updateManagingNavigationStackFromTraitUpdate;
- (void)_updateManagingNavigationStackUsingTransition:(unint64_t)a3;
- (void)_updateManagingNavigationStackUsingTransition:(unint64_t)a3 isExplicit:(BOOL)a4;
- (void)_validateSelectedElement;
- (void)setAllowsReordering:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setDefaultChildIdentifier:(id)a3;
- (void)setManagingNavigationController:(id)a3;
- (void)setSelectedChild:(id)a3;
- (void)setSidebarActions:(id)a3;
- (void)setSidebarAppearance:(unint64_t)a3;
@end

@implementation UITabGroup

- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6
{
  return [(UITabGroup *)self initWithTitle:a3 image:a4 identifier:a5 children:MEMORY[0x1E4F1CBF0] viewControllerProvider:a6];
}

- (UITabGroup)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 children:(id)a6 viewControllerProvider:(id)a7
{
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UITabGroup;
  v13 = [(UITab *)&v20 initWithTitle:a3 image:a4 identifier:a5 viewControllerProvider:a7];
  v14 = v13;
  if (v13)
  {
    children = v13->_children;
    v16 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v13->_children = (NSArray *)MEMORY[0x1E4F1CBF0];

    displayOrderIdentifiers = v14->_displayOrderIdentifiers;
    v14->_displayOrderIdentifiers = v16;

    sidebarActions = v14->_sidebarActions;
    v14->_sidebarActions = v16;

    [(UITabGroup *)v14 setChildren:v12];
  }

  return v14;
}

- (void)setSelectedChild:(id)a3
{
  v5 = (UITab *)a3;
  if (self->_selectedChild != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedChild, a3);
    [(UITabGroup *)self _selectedElementDidChange];
    v5 = v6;
  }
}

- (void)setChildren:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"UITabGroup.m", 61, @"Invalid parameter not satisfying: %@", @"children" object file lineNumber description];
  }
  v6 = [v5 differenceFromArray:self->_children withOptions:0 usingEquivalenceTest:&__block_literal_global_159];
  if ([v6 hasChanges])
  {
    SEL v60 = a2;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v8 = [v6 removals];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v86 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v85 + 1) + 8 * i) object];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v10);
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v14 = [v6 insertions];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v93 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v82 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v81 + 1) + 8 * j) object];
          [v7 removeObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v81 objects:v93 count:16];
      }
      while (v16);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v92 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v78 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v77 + 1) + 8 * k);
          v26 = [v25 parent];

          if (v26 == self) {
            [v25 _setParent:0];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v77 objects:v92 count:16];
      }
      while (v22);
    }
    v61 = v20;
    v62 = v6;

    v27 = (NSArray *)[v5 copy];
    childreuint64_t n = self->_children;
    self->_childreuint64_t n = v27;

    [MEMORY[0x1E4F1CA60] dictionary];
    v64 = id v63 = v5;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v29 = v5;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v91 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v31; ++m)
        {
          if (*(void *)v74 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v73 + 1) + 8 * m);
          v35 = [v34 parent];
          v36 = v35;
          if (v35) {
            BOOL v37 = v35 == self;
          }
          else {
            BOOL v37 = 1;
          }
          if (!v37)
          {
            v38 = [(UITab *)v35 identifier];
            v39 = [v64 objectForKey:v38];

            if (!v39)
            {
              v39 = [MEMORY[0x1E4F1CA80] set];
              v40 = [(UITab *)v36 identifier];
              [v64 setObject:v39 forKey:v40];
            }
            [v39 addObject:v34];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v73 objects:v91 count:16];
      }
      while (v31);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v41 = [v64 objectEnumerator];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v69 objects:v90 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v70;
      do
      {
        for (uint64_t n = 0; n != v43; ++n)
        {
          if (*(void *)v70 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v69 + 1) + 8 * n);
          v47 = [v46 anyObject];
          v48 = [v47 parent];

          v49 = [v48 children];
          v50 = (void *)[v49 mutableCopy];

          v51 = [v46 allObjects];
          [v50 removeObjectsInArray:v51];

          [v48 setChildren:v50];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v69 objects:v90 count:16];
      }
      while (v43);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v52 = v29;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v65 objects:v89 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v66;
      do
      {
        for (iuint64_t i = 0; ii != v54; ++ii)
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v65 + 1) + 8 * ii);
          if ([v57 _isUniquelySPI])
          {
            v58 = [MEMORY[0x1E4F28B00] currentHandler];
            [v58 handleFailureInMethod:v60 object:self file:@"UITabGroup.m" lineNumber:109 description:@"Cannot add _UITab objects to a UITabGroup. Please use UITab directly."];
          }
          [v57 _setParent:self];
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v65 objects:v89 count:16];
      }
      while (v54);
    }

    [(UITabGroup *)self _invalidateDisplayOrder];
    [(UITabGroup *)self _elementsDidChange];
    [(UITabGroup *)self _validateSelectedElement];

    v6 = v62;
    id v5 = v63;
  }
}

BOOL __26__UITabGroup_setChildren___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

- (NSArray)displayOrder
{
  displayOrder = self->_displayOrder;
  if (!displayOrder)
  {
    v4 = [(UITabGroup *)self _orderedChildrenForDisplayOrder:0];
    id v5 = self->_displayOrder;
    self->_displayOrder = v4;

    displayOrder = self->_displayOrder;
  }
  return displayOrder;
}

- (void)setAllowsReordering:(BOOL)a3
{
  if (self->_allowsReordering != a3)
  {
    self->_allowsReordering = a3;
    [(UITab *)self _customizabilityDidChange];
  }
}

- (void)setSidebarAppearance:(unint64_t)a3
{
  if (self->_sidebarAppearance != a3)
  {
    self->_sidebarAppearance = a3;
    [(UITabGroup *)self _elementsDidChange];
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
  id v5 = [(UITabGroup *)self children];
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
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      uint64_t v11 = [v10 identifier];
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
      v14 = v13;
      if (v13) {
        goto LABEL_14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)managingTabGroup
{
  v3 = [(UITab *)self parent];
  id v4 = [v3 managingTabGroup];

  if (!v4)
  {
    id v4 = [(UITabGroup *)self managingNavigationController];

    if (v4) {
      id v4 = self;
    }
  }
  return v4;
}

- (void)setManagingNavigationController:(id)a3
{
  id v5 = (UINavigationController *)a3;
  p_managingNavigationController = &self->_managingNavigationController;
  if (self->_managingNavigationController != v5)
  {
    int v12 = v5;
    uint64_t v7 = [(UITabGroup *)self _displayedViewController];
    uint64_t v8 = [(UINavigationController *)*p_managingNavigationController _managedTabGroup];

    if (v8 == self) {
      [(UINavigationController *)*p_managingNavigationController _setManagedTabGroup:0];
    }
    objc_storeStrong((id *)&self->_managingNavigationController, a3);
    uint64_t v9 = [(UITabGroup *)self _displayedViewController];

    if (v9 != v7)
    {
      [(UITab *)self _updateLinkedTabBarItem];
      uint64_t v10 = [(UITab *)self tabBarController];
      -[UITabBarController _displayedViewControllerDidChangeForTab:previousViewController:]((uint64_t)v10, self, v7);
    }
    uint64_t v11 = [(UINavigationController *)v12 _managedTabGroup];

    if (v11) {
      [(UINavigationController *)v12 _setManagedTabGroup:0];
    }
    [(UINavigationController *)v12 _setManagedTabGroup:self];
    [(UITabGroup *)self _registerManagingNavigationTraitsIfNeeded];
    [(UITabGroup *)self _updateManagingNavigationStackUsingTransition:0 isExplicit:0];

    id v5 = v12;
  }
}

- (id)_displayedViewController
{
  v3 = [(UITabGroup *)self managingNavigationController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabGroup;
    id v5 = [(UITab *)&v8 _displayedViewController];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_existingDisplayedViewController
{
  v3 = [(UITabGroup *)self managingNavigationController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITabGroup;
    id v5 = [(UITab *)&v8 _existingDisplayedViewController];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)_updateManagingNavigationStackFromTraitUpdate
{
}

- (void)_updateManagingNavigationStackUsingTransition:(unint64_t)a3
{
}

- (void)_updateManagingNavigationStackUsingTransition:(unint64_t)a3 isExplicit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(UITab *)self tabBarController];
  if (v7 && !self->_isUpdatingManagedNavigationController)
  {
    objc_super v8 = [(UITabGroup *)self managingNavigationController];
    if (v8)
    {
      unint64_t v32 = a3;
      v33 = self;
      uint64_t v9 = [(UITabGroup *)self _selectedTabHierarchy];
      v34 = v8;
      v36 = [v8 viewControllers];
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
      uint64_t v11 = [v7 traitCollection];
      uint64_t v35 = [v11 horizontalSizeClass];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      obuint64_t j = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v43;
        char v15 = v35 == 2 || !v4;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(obj);
            }
            long long v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            long long v18 = [v17 _displayedViewControllers];
            long long v19 = v18;
            if ((v15 & 1) == 0 && [v18 count])
            {
              id v20 = [v19 objectAtIndex:0];
              char v21 = [v36 containsObject:v20];

              if ((v21 & 1) == 0) {
                [v17 _resetViewController];
              }
              uint64_t v22 = [v17 _displayedViewControllers];

              long long v19 = (void *)v22;
            }
            uint64_t v23 = -[UITabBarController _displayedViewControllersForTab:proposedViewControllers:]((id *)v7, v17, v19);
            if (v23) {
              [v10 addObjectsFromArray:v23];
            }
            [v17 _setDisplayedViewControllers:v23];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v13);
      }

      if (v32) {
        BOOL v24 = [v10 count] != 0;
      }
      else {
        BOOL v24 = 0;
      }
      objc_super v8 = v34;
      BOOL v29 = v32 == 2 && v35 == 2;
      [v34 _setWantsTabCrossfadeTransition:v29];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __71__UITabGroup__updateManagingNavigationStackUsingTransition_isExplicit___block_invoke;
      v38[3] = &unk_1E52DC3D0;
      id v30 = v34;
      id v39 = v30;
      id v40 = v10;
      BOOL v41 = v24;
      id v31 = v10;
      [(UITabGroup *)v33 _performWithoutUpdatingManagingNavigationController:v38];
      [v30 _setWantsTabCrossfadeTransition:0];
    }
    else
    {
      v25 = [(UITabGroup *)self selectedChild];
      int v26 = [v25 _isGroup];

      if (v26)
      {
        v27 = [(UITabGroup *)self selectedChild];
        [v27 _updateManagingNavigationStackUsingTransition:a3 isExplicit:v4];
      }
    }
  }
}

uint64_t __71__UITabGroup__updateManagingNavigationStackUsingTransition_isExplicit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewControllers:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_updateForManagingNavigationStackChange
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!self->_isUpdatingManagedNavigationController)
  {
    v2 = [(UITabGroup *)self managingNavigationController];
    BOOL v41 = [v2 viewControllers];

    v3 = [(UITabGroup *)self _selectedTabHierarchy];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v55 = 0;
    v56 = (id *)&v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__67;
    v59 = __Block_byref_object_dispose__67;
    id v60 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_22;
    v50[3] = &unk_1E52EB5D8;
    id v39 = v3;
    id v51 = v39;
    id v52 = &__block_literal_global_21_1;
    uint64_t v53 = &v55;
    uint64_t v54 = &v61;
    [v41 enumerateObjectsWithOptions:2 usingBlock:v50];
    if ([v56[5] _isGroup])
    {
      id v4 = v56[5];
      id v5 = [v4 selectedChild];
      uint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = v5;
        while (1)
        {
          objc_super v8 = [v7 _displayedViewControllers];
          uint64_t v9 = [v8 count];

          if (![v7 _isGroup]) {
            break;
          }
          uint64_t v10 = [v7 selectedChild];

          if (v10) {
            BOOL v11 = v9 != 0;
          }
          else {
            BOOL v11 = 1;
          }
          uint64_t v7 = v10;
          if (v11)
          {
            if (!v9) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
        }

        uint64_t v10 = 0;
        if (!v9) {
          goto LABEL_15;
        }
LABEL_14:

        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v10 = 0;
      }
LABEL_15:
      unint64_t v12 = v62[3] + 1;
      v62[3] = v12;
      while (v12 < [v41 count])
      {
        uint64_t v13 = [v41 objectAtIndex:v62[3]];
        uint64_t v14 = [v13 tab];
        id v15 = [v14 _parentGroup];
        BOOL v16 = v15 == v4;

        if (!v16)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v17 = [v4 children];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v65 count:16];
          uint64_t v19 = v18;
          if (v18)
          {
            uint64_t v20 = *(void *)v47;
LABEL_20:
            uint64_t v21 = 0;
            while (1)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8 * v21);
              uint64_t v18 = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke(v18, v22, v13);
              if (v18) {
                break;
              }
              if (v19 == ++v21)
              {
                uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v65 count:16];
                uint64_t v19 = v18;
                if (v18) {
                  goto LABEL_20;
                }
                goto LABEL_34;
              }
            }
            id v23 = v22;

            if (v23) {
              goto LABEL_30;
            }
          }
          else
          {
LABEL_34:
          }
          goto LABEL_35;
        }
        id v23 = v14;
LABEL_30:

        if (![v23 _isGroup]
          || ([v23 children],
              BOOL v24 = objc_claimAutoreleasedReturnValue(),
              BOOL v25 = [v24 count] == 0,
              v24,
              v25))
        {
          uint64_t v6 = v23;
LABEL_35:

          break;
        }
        id v26 = v23;

        uint64_t v6 = [v26 selectedChild];

        unint64_t v12 = v62[3] + 1;
        v62[3] = v12;
        id v4 = v26;
      }
      if (!v6)
      {
        uint64_t v35 = [v4 selectedChild];
        BOOL v36 = v35 == 0;

        if (!v36)
        {
          BOOL v37 = [v4 selectedChild];
          if (v37)
          {
            while (1)
            {
              [v37 _resetViewController];
              if (![v37 _isGroup]) {
                break;
              }
              uint64_t v38 = [v37 selectedChild];

              BOOL v37 = (void *)v38;
              if (!v38) {
                goto LABEL_37;
              }
            }
          }
        }
      }
LABEL_37:
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_3;
      v42[3] = &unk_1E52DCB30;
      id v27 = v4;
      id v43 = v27;
      id v28 = v6;
      id v44 = v28;
      long long v45 = self;
      [(UITabGroup *)self _performWithoutUpdatingManagingNavigationController:v42];
      if (v6) {
        BOOL v29 = v28;
      }
      else {
        BOOL v29 = v27;
      }
      objc_storeStrong(v56 + 5, v29);
    }
    uint64_t v30 = v62[3];
    if ((unint64_t)(v30 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
    {
      while (1)
      {
        id v31 = [v41 objectAtIndex:v30 - 1];
        if ((__53__UITabGroup__updateForManagingNavigationStackChange__block_invoke((uint64_t)v31, v56[5], v31) & 1) == 0) {
          break;
        }
        --v62[3];

        uint64_t v30 = v62[3];
        if ((unint64_t)(v30 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002) {
          goto LABEL_46;
        }
      }

      uint64_t v30 = v62[3];
    }
LABEL_46:
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v32 = (UITabGroup *)v56[5];
      if (!v32) {
        unint64_t v32 = self;
      }
      v33 = v32;
      [(UITab *)v33 _setDisplayedViewControllers:v41];
    }
    else
    {
      uint64_t v34 = [v41 count];
      objc_msgSend(v41, "subarrayWithRange:", v30, v34 - v62[3]);
      v33 = (UITabGroup *)objc_claimAutoreleasedReturnValue();
      [v56[5] _setDisplayedViewControllers:v33];
    }

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);
  }
}

uint64_t __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 tab];
  if (v6 == v4)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [v4 _displayedViewControllers];
    uint64_t v8 = [v7 containsObject:v5];
  }
  return v8;
}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_22(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_2;
  v11[3] = &unk_1E52EB5B0;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v12 = v7;
  id v13 = v9;
  long long v14 = *(_OWORD *)(a1 + 48);
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  id v10 = v7;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];
}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(a1 + 64);
    **(unsigned char **)(a1 + 72) = 1;
    *a4 = 1;
  }
}

void __53__UITabGroup__updateForManagingNavigationStackChange__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedChild:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) _tabModel];
  [v2 selectElement:*(void *)(a1 + 32) notifyOnReselection:0];
}

- (void)_performWithoutUpdatingManagingNavigationController:(id)a3
{
  BOOL isUpdatingManagedNavigationController = self->_isUpdatingManagedNavigationController;
  self->_BOOL isUpdatingManagedNavigationController = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL isUpdatingManagedNavigationController = isUpdatingManagedNavigationController;
}

- (id)_selectedTabHierarchy
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = self;
  if (v4)
  {
    id v5 = v4;
    do
    {
      [v3 addObject:v5];
      if (![v5 _isGroup]) {
        break;
      }
      id v6 = v5;
      id v5 = [v6 selectedChild];
    }
    while (v5);
  }
  return v3;
}

- (void)_registerManagingNavigationTraitsIfNeeded
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_sizeClassTraitRegistration)
  {
    id v3 = [(UITab *)self tabBarController];
    id v4 = self;
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    id v6 = [v3 registerForTraitChanges:v5 withTarget:self action:sel__updateManagingNavigationStackFromTraitUpdate];
    sizeClassTraitRegistratiouint64_t n = self->_sizeClassTraitRegistration;
    self->_sizeClassTraitRegistratiouint64_t n = v6;
  }
}

- (void)_elementsDidChange
{
  id v3 = [(UITab *)self _tabModel];
  [v3 elementsDidChangeForGroup:self];
}

- (void)_selectedElementDidChange
{
  id v3 = [(UITab *)self _tabModel];
  [v3 selectedElementDidChangeForGroup:self];
}

- (void)_validateSelectedElement
{
  id v3 = [(UITabGroup *)self selectedChild];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 parent];

    if (v5 != self)
    {
      childreuint64_t n = self->_children;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__UITabGroup__validateSelectedElement__block_invoke;
      v9[3] = &unk_1E52E7F28;
      id v7 = v4;
      id v10 = v7;
      uint64_t v8 = [(NSArray *)children indexOfObjectPassingTest:v9];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        [(UITabGroup *)self _defaultChildForSelection];
      }
      else {
      id v4 = [(NSArray *)self->_children objectAtIndex:v8];
      }

      [(UITabGroup *)self setSelectedChild:v4];
    }
  }
}

uint64_t __38__UITabGroup__validateSelectedElement__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqual:v6];
    }
  }

  return v8;
}

- (void)_invalidateDisplayOrder
{
  displayOrder = self->_displayOrder;
  self->_displayOrder = 0;
}

- (BOOL)_isGroup
{
  return 1;
}

- (BOOL)_isCustomizable
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unsigned __int8 v12 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UITabGroup;
  unsigned __int8 v12 = [(UITab *)&v8 _isCustomizable];
  if (*((unsigned char *)v10 + 24)
    || (BOOL v3 = [(UITabGroup *)self allowsReordering], (*((unsigned char *)v10 + 24) = v3) != 0))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v6 = [(UITabGroup *)self children];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__UITabGroup__isCustomizable__block_invoke;
    v7[3] = &unk_1E52EB600;
    v7[4] = &v9;
    [v6 enumerateObjectsUsingBlock:v7];

    BOOL v4 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __29__UITabGroup__isCustomizable__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 _isCustomizable];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_didChangeTabModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sizeClassTraitRegistration)
  {
    id v5 = [(UITab *)self tabBarController];
    [v5 unregisterForTraitChanges:self->_sizeClassTraitRegistration];

    sizeClassTraitRegistratiouint64_t n = self->_sizeClassTraitRegistration;
    self->_sizeClassTraitRegistratiouint64_t n = 0;
  }
  v19.receiver = self;
  v19.super_class = (Class)UITabGroup;
  [(UITab *)&v19 _didChangeTabModel:v4];
  if (v4)
  {
    id v7 = [v4 customizationStore];
    objc_super v8 = [(UITab *)self identifier];
    uint64_t v9 = [v7 displayOrderIdentifiersForGroupWithIdentifier:v8];

    if (v9) {
      [(UITabGroup *)self _setDisplayOrderIdentifiers:v9];
    }
    [(UITabGroup *)self _registerManagingNavigationTraitsIfNeeded];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_children;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "_didChangeTabModel:", v4, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (id)_defaultChildForSelection
{
  BOOL v3 = [(UITab *)self _tabModel];
  id v4 = [(UITabGroup *)self defaultChildIdentifier];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__67;
  id v31 = __Block_byref_object_dispose__67;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__67;
  BOOL v25 = __Block_byref_object_dispose__67;
  id v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UITabGroup__defaultChildForSelection__block_invoke;
  aBlock[3] = &unk_1E52EB628;
  id v5 = v3;
  id v20 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(UITabGroup *)self children];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__UITabGroup__defaultChildForSelection__block_invoke_2;
  v13[3] = &unk_1E52EB650;
  id v8 = v4;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  long long v16 = &v27;
  long long v17 = v33;
  long long v18 = &v21;
  [v7 enumerateObjectsUsingBlock:v13];

  id v10 = (void *)v28[5];
  if (!v10) {
    id v10 = (void *)v22[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  return v11;
}

uint64_t __39__UITabGroup__defaultChildForSelection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    return [v2 isTabHidden:a2];
  }
  else {
    return [a2 isHidden];
  }
}

void __39__UITabGroup__defaultChildForSelection__block_invoke_2(void *a1, void *a2, uint64_t a3, char *a4)
{
  id v10 = a2;
  id v7 = [v10 identifier];
  int v8 = [v7 isEqualToString:a1[4]];

  if (v8)
  {
    if ([v10 _isElement] && ((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  if (!*(void *)(*(void *)(a1[8] + 8) + 40)
    && [v10 _isElement]
    && ((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
  }
  char v9 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24);
  if (v9)
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      char v9 = 1;
    }
    else {
      char v9 = *(void *)(*(void *)(a1[8] + 8) + 40) != 0;
    }
  }
  *a4 = v9;
}

- (BOOL)_canBeReordered
{
  if ([(UITabGroup *)self sidebarAppearance] == 2) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UITabGroup;
  return [(UITab *)&v4 _canBeReordered];
}

- (BOOL)_canReorderChild:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabGroup *)self children];
  int v6 = [v5 containsObject:v4];

  BOOL v8 = v6
    && ([(UITabGroup *)self sidebarAppearance] != 1
     || ([(UITab *)self parent], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    && ([v4 _isAction] & 1) == 0
    && [(UITabGroup *)self allowsReordering];

  return v8;
}

- (id)_filteredDisplayOrderIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(UITabGroup *)self displayOrder];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_orderedChildrenForDisplayOrder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UITabGroup *)self displayOrderIdentifiers];
  }
  if (!self->_displayOrder) {
    goto LABEL_12;
  }
  displayOrderIdentifiers = self->_displayOrderIdentifiers;
  uint64_t v6 = (NSArray *)v4;
  uint64_t v7 = displayOrderIdentifiers;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  BOOL v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_12;
  }
  int v9 = [(NSArray *)v6 isEqual:v7];

  if (v9)
  {
LABEL_10:
    uint64_t v22 = self->_displayOrder;
    goto LABEL_24;
  }
LABEL_12:
  id v10 = [(UITabGroup *)self children];
  if ([v4 count])
  {
    long long v11 = (void *)[(NSArray *)v10 mutableCopy];
    id v21 = v4;
    uint64_t v22 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v10, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v4;
    uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __46__UITabGroup__orderedChildrenForDisplayOrder___block_invoke;
          v24[3] = &unk_1E52E7F28;
          v24[4] = v16;
          uint64_t v17 = [v11 indexOfObjectPassingTest:v24];
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v18 = v17;
            objc_super v19 = [v11 objectAtIndex:v17];
            [(NSArray *)v22 addObject:v19];
            [v11 removeObjectAtIndex:v18];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    [(NSArray *)v22 addObjectsFromArray:v11];
    id v4 = v21;
  }
  else
  {
    uint64_t v22 = v10;
  }
LABEL_24:

  return v22;
}

uint64_t __46__UITabGroup__orderedChildrenForDisplayOrder___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5
{
  BOOL v6 = a4;
  id v10 = (UITab *)a3;
  long long v11 = (void (**)(void))a5;
  if (v10 && ![(UITab *)v10 _isElement])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UITabGroup.m", 662, @"Cannot select a tab (%@) that is not seletable.", v10 object file lineNumber description];
  }
  selectedChild = self->_selectedChild;
  objc_storeStrong((id *)&self->_selectedChild, a3);
  if (v11) {
    v11[2](v11);
  }
  if (selectedChild != v10 || !v6)
  {
    uint64_t v18 = v10;
  }
  else
  {
    if (v10)
    {
      uint64_t v14 = v10;
      while (1)
      {
        uint64_t v18 = v14;
        [(UITab *)v14 _setDisplayedViewControllers:0];
        if (![(UITab *)v18 _isGroup]) {
          break;
        }
        uint64_t v15 = [(UITab *)v18 selectedChild];

        uint64_t v14 = (UITab *)v15;
        if (!v15) {
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      uint64_t v18 = 0;
    }
    uint64_t v16 = [(UITabGroup *)self managingTabGroup];
    [v16 _updateManagingNavigationStackUsingTransition:1 isExplicit:1];
  }
  if (selectedChild != v10) {
    [(UITabGroup *)self _selectedElementDidChange];
  }
}

- (BOOL)_setDisplayOrderIdentifiers:(id)a3
{
  id v5 = a3;
  BOOL v6 = self->_displayOrderIdentifiers;
  uint64_t v7 = (NSArray *)v5;
  BOOL v8 = v7;
  BOOL v9 = v6 != v7;
  if (v6 == v7)
  {

    long long v11 = v8;
LABEL_9:

    goto LABEL_10;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v10 = [(NSArray *)v6 isEqual:v7];

  if ((v10 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_displayOrderIdentifiers, a3);
    [(UITabGroup *)self _invalidateDisplayOrder];
    long long v11 = [(UITab *)self _tabModel];
    [v11 displayOrderIdentifiersDidChangeForGroup:self];
    goto LABEL_9;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITabGroup;
  [(UITab *)&v8 _updateDescriptionWithBuilder:v6 recursive:v4];
  if (!v4 && [(NSArray *)self->_children count]) {
    id v7 = (id)[v6 appendName:@"children" object:self->_children usingLightweightDescription:1];
  }
}

- (UITab)selectedChild
{
  return self->_selectedChild;
}

- (NSString)defaultChildIdentifier
{
  return self->_defaultChildIdentifier;
}

- (void)setDefaultChildIdentifier:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)displayOrderIdentifiers
{
  return self->_displayOrderIdentifiers;
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (UINavigationController)managingNavigationController
{
  return self->_managingNavigationController;
}

- (NSArray)sidebarActions
{
  return self->_sidebarActions;
}

- (void)setSidebarActions:(id)a3
{
}

- (unint64_t)sidebarAppearance
{
  return self->_sidebarAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarActions, 0);
  objc_storeStrong((id *)&self->_managingNavigationController, 0);
  objc_storeStrong((id *)&self->_displayOrderIdentifiers, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_defaultChildIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedChild, 0);
  objc_storeStrong((id *)&self->_displayOrder, 0);
  objc_storeStrong((id *)&self->_sizeClassTraitRegistration, 0);
}

@end