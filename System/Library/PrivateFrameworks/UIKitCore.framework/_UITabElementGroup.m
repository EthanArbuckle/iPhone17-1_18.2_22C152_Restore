@interface _UITabElementGroup
- (BOOL)_allowsReordering;
- (BOOL)_canBeReordered;
- (BOOL)_canReorderChild:(id)a3;
- (BOOL)_isCustomizable;
- (BOOL)_isGroup;
- (BOOL)_setDisplayOrderIdentifiers:(id)a3;
- (NSArray)_children;
- (NSArray)_displayOrder;
- (NSArray)sidebarActions;
- (NSString)_defaultChildIdentifier;
- (_UITabElement)_selectedElement;
- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5;
- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 children:(id)a6;
- (_UITabElementGroupDelegate)_delegate;
- (id)_defaultChildElement;
- (id)_filteredDisplayOrderIdentifiers;
- (id)_orderedChildrenForDisplayOrder:(id)a3;
- (id)_tabForIdentifier:(id)a3;
- (unint64_t)_sidebarAppearance;
- (void)_didChangeTabModel:(id)a3;
- (void)_notifyObserversElementsChanged;
- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5;
- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5;
- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5 performBeforeNotifyingDelegate:(id)a6;
- (void)_setAllowsReordering:(BOOL)a3;
- (void)_setChildren:(id)a3;
- (void)_setDefaultChildIdentifier:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDisplayOrder:(id)a3;
- (void)_setDisplayOrder:(id)a3 notifyingDelegate:(BOOL)a4;
- (void)_setSelectedElement:(id)a3;
- (void)_setSidebarAppearance:(unint64_t)a3;
- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4;
@end

@implementation _UITabElementGroup

- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5
{
}

- (void)_setSelectedElement:(id)a3
{
}

- (void)_didChangeTabModel:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITabElementGroup;
  [(UITab *)&v17 _didChangeTabModel:v4];
  if (v4)
  {
    v5 = [v4 customizationStore];
    v6 = [(UITab *)self identifier];
    v7 = [v5 displayOrderIdentifiersForGroupWithIdentifier:v6];

    if (v7) {
      [(_UITabElementGroup *)self _setDisplayOrderIdentifiers:v7];
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_children;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_didChangeTabModel:", v4, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_setSidebarAppearance:(unint64_t)a3
{
  if (self->__sidebarAppearance != a3)
  {
    self->__sidebarAppearance = a3;
    [(_UITabElementGroup *)self _notifyObserversElementsChanged];
  }
}

- (void)_setAllowsReordering:(BOOL)a3
{
  if (self->__allowsReordering != a3)
  {
    self->__allowsReordering = a3;
    [(UITab *)self _customizabilityDidChange];
  }
}

- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5 children:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_UITabElementGroup;
  uint64_t v11 = [(_UITabElement *)&v15 initWithIdentifier:a3 title:a4 image:a5];
  uint64_t v12 = v11;
  if (v11)
  {
    children = v11->_children;
    v11->_children = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(_UITabElementGroup *)v12 _setChildren:v10];
  }

  return v12;
}

- (BOOL)_isCustomizable
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unsigned __int8 v12 = 0;
  v8.receiver = self;
  v8.super_class = (Class)_UITabElementGroup;
  unsigned __int8 v12 = [(UITab *)&v8 _isCustomizable];
  if (*((unsigned char *)v10 + 24)
    || (BOOL v3 = [(_UITabElementGroup *)self allowsReordering], (*((unsigned char *)v10 + 24) = v3) != 0))
  {
    BOOL v4 = 1;
  }
  else
  {
    v6 = [(_UITabElementGroup *)self children];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37___UITabElementGroup__isCustomizable__block_invoke;
    v7[3] = &unk_1E52EB600;
    v7[4] = &v9;
    [v6 enumerateObjectsUsingBlock:v7];

    BOOL v4 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (NSArray)_children
{
  return self->_children;
}

- (void)_setChildren:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"UITabGroup.m", 754, @"Invalid parameter not satisfying: %@", @"children" object file lineNumber description];
  }
  v6 = [v5 differenceFromArray:self->_children withOptions:0 usingEquivalenceTest:&__block_literal_global_191];
  if ([v6 hasChanges])
  {
    SEL v40 = a2;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v41 = v6;
    objc_super v8 = [v6 removals];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v57 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [*(id *)(*((void *)&v56 + 1) + 8 * i) object];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v10);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v14 = [v41 insertions];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v52 + 1) + 8 * j) object];
          [v7 removeObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v16);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * k), "set_parent:", 0);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v22);
    }

    v25 = (NSArray *)[v5 copy];
    children = self->_children;
    self->_children = v25;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v27 = v5;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v45;
      do
      {
        for (uint64_t m = 0; m != v29; ++m)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v44 + 1) + 8 * m);
          if (([v32 _isUniquelySPI] & 1) == 0)
          {
            v33 = [MEMORY[0x1E4F28B00] currentHandler];
            [v33 handleFailureInMethod:v40 object:self file:@"UITabGroup.m" lineNumber:775 description:@"Cannot add UITab objects to a UITabElementGroup. Please use UITab + UITabGroup directly."];
          }
          objc_msgSend(v32, "set_parent:", self);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }
      while (v29);
    }

    [(_UITabElementGroup *)self _notifyObserversElementsChanged];
    v34 = self->_selectedElement;
    v35 = v34;
    v6 = v41;
    if (v34)
    {
      v36 = [(_UITab *)v34 _parent];

      if (v36 != self)
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __35___UITabElementGroup__setChildren___block_invoke_2;
        v42[3] = &unk_1E52EB698;
        id v37 = v35;
        id v43 = v37;
        uint64_t v38 = [v27 indexOfObjectPassingTest:v42];
        if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
          [(_UITabElementGroup *)self _defaultChildElement];
        }
        else {
        v35 = [v27 objectAtIndex:v38];
        }

        [(_UITabElementGroup *)self _selectElement:v35 notifyingDelegate:1 notifyOnReselection:1];
      }
    }
  }
}

- (void)_notifyObserversElementsChanged
{
  id v3 = [(UITab *)self _tabModel];
  [v3 elementsDidChangeForGroup:self];
}

- (BOOL)_allowsReordering
{
  return self->__allowsReordering;
}

- (BOOL)_isGroup
{
  return 1;
}

- (_UITabElement)_selectedElement
{
  return self->_selectedElement;
}

- (_UITabElementGroup)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  return [(_UITabElementGroup *)self initWithIdentifier:a3 title:a4 image:a5 children:MEMORY[0x1E4F1CBF0]];
}

- (void)_selectElement:(id)a3 notifyingDelegate:(BOOL)a4 notifyOnReselection:(BOOL)a5 performBeforeNotifyingDelegate:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v12 = a3;
  long long v13 = (void (**)(void))a6;
  if (v12 && ([v12 _isElement] & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UITabGroup.m", 903, @"Cannot select a tab (%@) that is not selectable in %@.", v12, self object file lineNumber description];
  }
  uint64_t v19 = (_UITabElement *)v12;
  selectedElement = self->_selectedElement;
  objc_storeStrong((id *)&self->_selectedElement, a3);
  if (v13) {
    v13[2](v13);
  }
  if (selectedElement != v19 || v7)
  {
    if (v8 && (*(unsigned char *)&self->_delegateImplements & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained _tabElementGroup:self didSelectElement:v19];
    }
    uint64_t v17 = [(UITab *)self _tabModel];
    [v17 selectedElementDidChangeForGroup:self];
  }
}

- (void)_setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  if (p_delegate) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFD | v6;
}

- (void)_setDisplayOrder:(id)a3
{
}

- (void)_setDisplayOrder:(id)a3 notifyingDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  displayOrder = self->__displayOrder;
  long long v13 = (NSArray *)v7;
  uint64_t v9 = displayOrder;
  if (v9 == v13)
  {

    id WeakRetained = v13;
LABEL_11:

    goto LABEL_12;
  }
  if (v13 && v9)
  {
    char v10 = [(NSArray *)v13 isEqual:v9];

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->__displayOrder, a3);
  [(_UITabElementGroup *)self _notifyObserversElementsChanged];
  id v12 = [(UITab *)self _tabModel];
  [v12 displayOrderIdentifiersDidChangeForGroup:self];

  if (v4 && (*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _tabElementGroup:self didCustomizeDisplayOrder:v13];
    goto LABEL_11;
  }
LABEL_12:
}

- (id)_orderedChildrenForDisplayOrder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(_UITabElementGroup *)self _displayOrder];
  }
  id v5 = [(_UITabElementGroup *)self _children];
  if ([v4 count])
  {
    char v6 = (void *)[v5 mutableCopy];
    id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __54___UITabElementGroup__orderedChildrenForDisplayOrder___block_invoke;
          v18[3] = &unk_1E52EB698;
          v18[4] = v11;
          uint64_t v12 = [v6 indexOfObjectPassingTest:v18];
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v13 = v12;
            long long v14 = [v6 objectAtIndex:v12];
            [v16 addObject:v14];
            [v6 removeObjectAtIndex:v13];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    [v16 addObjectsFromArray:v6];
  }
  else
  {
    id v16 = v5;
  }

  return v16;
}

- (id)_defaultChildElement
{
  id v3 = [(_UITabElementGroup *)self _defaultChildIdentifier];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__67;
  uint64_t v24 = __Block_byref_object_dispose__67;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__67;
  v18 = __Block_byref_object_dispose__67;
  id v19 = 0;
  id v4 = [(_UITabElementGroup *)self _children];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___UITabElementGroup__defaultChildElement__block_invoke;
  v9[3] = &unk_1E52EB6C0;
  id v5 = v3;
  id v10 = v5;
  uint64_t v11 = &v20;
  uint64_t v12 = v26;
  uint64_t v13 = &v14;
  [v4 enumerateObjectsUsingBlock:v9];

  char v6 = (void *)v21[5];
  if (!v6) {
    char v6 = (void *)v15[5];
  }
  id v7 = v6;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v7;
}

- (void)_selectElement:(id)a3 notifyOnReselection:(BOOL)a4 performBeforeNotifyingDelegate:(id)a5
{
}

- (id)_tabForIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(_UITabElementGroup *)self _children];
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
      uint64_t v11 = [v10 _identifier];
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
      uint64_t v14 = v13;
      if (v13) {
        goto LABEL_14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
LABEL_13:
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (NSArray)sidebarActions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)_canBeReordered
{
  if ([(_UITabElementGroup *)self _sidebarAppearance] == 2) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UITabElementGroup;
  return [(UITab *)&v4 _canBeReordered];
}

- (BOOL)_canReorderChild:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITabElementGroup *)self _children];
  int v6 = [v5 containsObject:v4];

  BOOL v8 = v6
    && ([(_UITabElementGroup *)self _sidebarAppearance] != 1
     || ([(_UITab *)self _parent], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    && ([v4 _isAction] & 1) == 0
    && [(_UITabElementGroup *)self _allowsReordering];

  return v8;
}

- (id)_filteredDisplayOrderIdentifiers
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(_UITabElementGroup *)self _children];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v6 = [(_UITabElementGroup *)self _displayOrder];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = [(_UITabElementGroup *)self _displayOrder];
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __54___UITabElementGroup__filteredDisplayOrderIdentifiers__block_invoke;
          v28[3] = &unk_1E52EB698;
          v28[4] = v12;
          uint64_t v13 = [v4 indexOfObjectPassingTest:v28];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = v13;
            uint64_t v15 = [v4 objectAtIndex:v13];
            [v5 addObject:v12];
            [v4 removeObjectAtIndex:v14];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * j) _identifier];
        [v5 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)_setDisplayOrderIdentifiers:(id)a3
{
  return 0;
}

- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITabElementGroup;
  [(UITab *)&v8 _updateDescriptionWithBuilder:v6 recursive:v4];
  if (!v4 && [(NSArray *)self->_children count]) {
    id v7 = (id)[v6 appendName:@"children" object:self->_children usingLightweightDescription:1];
  }
}

- (_UITabElementGroupDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITabElementGroupDelegate *)WeakRetained;
}

- (NSString)_defaultChildIdentifier
{
  return self->__defaultChildIdentifier;
}

- (void)_setDefaultChildIdentifier:(id)a3
{
}

- (NSArray)_displayOrder
{
  return self->__displayOrder;
}

- (unint64_t)_sidebarAppearance
{
  return self->__sidebarAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__displayOrder, 0);
  objc_storeStrong((id *)&self->__defaultChildIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_selectedElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end