@interface UICellHighlightingSupport
- (UICellHighlightingSupport)initWithCell:(id)a3;
- (void)applyState:(unint64_t)a3 toView:(id)a4;
- (void)cacheState:(unint64_t)a3 forView:(id)a4;
- (void)dealloc;
- (void)highlightView:(id)a3;
@end

@implementation UICellHighlightingSupport

- (void)highlightView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16 = self;
  p_cell = &self->_cell;
  id WeakRetained = objc_loadWeakRetained(&self->_cell);
  if ([WeakRetained _shouldSaveOpaqueStateForView:v4]
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      [v4 setHighlighted:1];
    }
  }
  else
  {
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [v4 subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v14 = objc_loadWeakRetained(p_cell);
          id v15 = [v14 selectedBackgroundView];

          if (v15 != v4) {
            [(UICellHighlightingSupport *)v16 highlightView:v13];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)cacheState:(unint64_t)a3 forView:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_cell);
    int v8 = [WeakRetained _shouldSaveOpaqueStateForView:v6];

    if (v8)
    {
      unhighlightedStates = self->_unhighlightedStates;
      if (!unhighlightedStates)
      {
        self->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
        id v10 = objc_loadWeakRetained(&self->_cell);
        [v10 _setMonitorsSubtree:1];

        unhighlightedStates = self->_unhighlightedStates;
      }
      CFDictionaryGetValue(unhighlightedStates, v6);
      uint64_t v11 = (UITableViewCellUnhighlightedState *)objc_claimAutoreleasedReturnValue();
      if (!v11) {
        uint64_t v11 = objc_alloc_init(UITableViewCellUnhighlightedState);
      }
      if (a3 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v12 = objc_loadWeakRetained(&self->_cell);
          char v13 = [v12 _isUsingOldStyleMultiselection];

          if ((v13 & 1) == 0) {
            -[UITableViewCellUnhighlightedState setHighlighted:](v11, "setHighlighted:", [v6 isHighlighted]);
          }
        }
      }
      if ((a3 & 2) != 0) {
        -[UITableViewCellUnhighlightedState setOpaque:](v11, "setOpaque:", [v6 isOpaque]);
      }
      if ((a3 & 4) != 0)
      {
        id v14 = [v6 backgroundColor];
        [(UITableViewCellUnhighlightedState *)v11 setBackgroundColor:v14];
      }
      CFDictionaryAddValue(self->_unhighlightedStates, v6, v11);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = objc_loadWeakRetained(&self->_cell);
      id v16 = [v15 selectedBackgroundView];

      if (v16 != v6)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v17 = objc_msgSend(v6, "subviews", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v23;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v23 != v20) {
                objc_enumerationMutation(v17);
              }
              [(UICellHighlightingSupport *)self cacheState:a3 forView:*(void *)(*((void *)&v22 + 1) + 8 * v21++)];
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v19);
        }
      }
    }
  }
}

- (UICellHighlightingSupport)initWithCell:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"attempt to initialize a UICellHighlightingSupport instance for a view (%@) that isn't a cell", v4 format];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)UICellHighlightingSupport;
  v5 = [(UICellHighlightingSupport *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_cell, v4);
    v6->_unhighlightedStates = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }

  return v6;
}

- (void)dealloc
{
  unhighlightedStates = self->_unhighlightedStates;
  if (unhighlightedStates) {
    CFRelease(unhighlightedStates);
  }
  v4.receiver = self;
  v4.super_class = (Class)UICellHighlightingSupport;
  [(UICellHighlightingSupport *)&v4 dealloc];
}

- (void)applyState:(unint64_t)a3 toView:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    v7 = CFDictionaryGetValue(self->_unhighlightedStates, v6);
    if (v7)
    {
      if (a3 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v6 _isUsingOldStyleMultiselection] & 1) == 0) {
            objc_msgSend(v6, "setHighlighted:", objc_msgSend(v7, "highlighted"));
          }
        }
      }
      if ((a3 & 2) != 0) {
        objc_msgSend(v6, "setOpaque:", objc_msgSend(v7, "opaque"));
      }
      if ((a3 & 4) != 0)
      {
        objc_super v8 = [v7 backgroundColor];
        [v6 setBackgroundColor:v8];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained(&self->_cell);
      id v10 = [WeakRetained selectedBackgroundView];

      if (v10 != v6)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v11 = objc_msgSend(v6, "subviews", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v17;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v11);
              }
              [(UICellHighlightingSupport *)self applyState:a3 toView:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v13);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end