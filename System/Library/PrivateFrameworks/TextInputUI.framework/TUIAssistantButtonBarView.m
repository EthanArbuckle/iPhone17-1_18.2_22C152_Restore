@interface TUIAssistantButtonBarView
- (BOOL)_containsFlexibleGroupViews;
- (BOOL)constrainedHorizontally;
- (BOOL)hasVisibleItem;
- (BOOL)isKeyboardGroup:(id)a3;
- (BOOL)validateButtonGroup:(id)a3;
- (BOOL)validateButtonGroups;
- (CGSize)_totalGroupSizeThatFits:(CGSize)a3;
- (CGSize)collapsedSizeThatFits:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredSizeForButtonBarItem:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)buttonGroups;
- (NSArray)separatorGroups;
- (NSMutableOrderedSet)groupViews;
- (TUIAssistantButtonBarView)initWithFrame:(CGRect)a3;
- (TUIAssistantButtonBarViewDelegate)delegate;
- (TUIAssistantButtonSizeProvider)sizeProvider;
- (UIEdgeInsets)_insetsForHorizontalMargin;
- (UIView)buttonContainer;
- (_UIButtonBarAppearanceDelegate)appearanceDelegate;
- (_UIButtonBarButtonVisualProvider)visualProvider;
- (double)_interItemSpacingThatFits:(CGSize)a3 forGroupSize:(CGSize)a4;
- (double)barButtonWidth;
- (double)effectiveInterItemSpacing;
- (double)horizontalMargins;
- (double)minimumInterItemSpace;
- (id)_allVisibleBarItemViews;
- (id)_groupViewForBarButtonItemGroup:(id)a3;
- (id)_itemViewForSender:(id)a3;
- (id)_uncollapsedGroupViews;
- (id)_visibleGroupViews;
- (id)_visibleGroups;
- (int64_t)buttonAlignment;
- (void)_checkBarButtonItemState:(id)a3;
- (void)_collapseGroupsIfNecessaryForWidth:(double)a3;
- (void)_didTapButtonBarButton:(id)a3 withEvent:(id)a4;
- (void)_uncollapseAllGroupsForNewSizeIfNecessary:(CGSize)a3;
- (void)_updateBarButtonItemHiddenState;
- (void)configureButtonBarItemView:(id)a3 forItem:(id)a4 group:(id)a5;
- (void)layoutSubviews;
- (void)setAppearanceDelegate:(id)a3;
- (void)setBarButtonWidth:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonAlignment:(int64_t)a3;
- (void)setButtonContainer:(id)a3;
- (void)setButtonGroups:(id)a3;
- (void)setButtonGroups:(id)a3 animated:(BOOL)a4;
- (void)setConstrainedHorizontally:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveInterItemSpacing:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGroupViews:(id)a3;
- (void)setHorizontalMargins:(double)a3;
- (void)setMinimumInterItemSpace:(double)a3;
- (void)setSeparatorGroups:(id)a3;
- (void)setSizeProvider:(id)a3;
- (void)setVisualProvider:(id)a3;
- (void)uncollapseAllGroups;
@end

@implementation TUIAssistantButtonBarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeProvider, 0);
  objc_storeStrong((id *)&self->_groupViews, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_separatorGroups, 0);
  objc_storeStrong((id *)&self->_buttonGroups, 0);
}

- (void)setSizeProvider:(id)a3
{
}

- (TUIAssistantButtonSizeProvider)sizeProvider
{
  return self->_sizeProvider;
}

- (void)setGroupViews:(id)a3
{
}

- (NSMutableOrderedSet)groupViews
{
  return self->_groupViews;
}

- (void)setButtonContainer:(id)a3
{
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  return (_UIButtonBarAppearanceDelegate *)WeakRetained;
}

- (void)setHorizontalMargins:(double)a3
{
  self->_horizontalMargins = a3;
}

- (double)horizontalMargins
{
  return self->_horizontalMargins;
}

- (void)setDelegate:(id)a3
{
}

- (TUIAssistantButtonBarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIAssistantButtonBarViewDelegate *)WeakRetained;
}

- (void)setConstrainedHorizontally:(BOOL)a3
{
  self->_constrainedHorizontally = a3;
}

- (BOOL)constrainedHorizontally
{
  return self->_constrainedHorizontally;
}

- (void)setButtonAlignment:(int64_t)a3
{
  self->_buttonAlignment = a3;
}

- (int64_t)buttonAlignment
{
  return self->_buttonAlignment;
}

- (double)effectiveInterItemSpacing
{
  return self->_effectiveInterItemSpacing;
}

- (double)minimumInterItemSpace
{
  return self->_minimumInterItemSpace;
}

- (void)setVisualProvider:(id)a3
{
}

- (void)setSeparatorGroups:(id)a3
{
}

- (NSArray)separatorGroups
{
  return self->_separatorGroups;
}

- (NSArray)buttonGroups
{
  return self->_buttonGroups;
}

- (void)_checkBarButtonItemState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 view];
  v5 = [v3 _viewOwner];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = NSString;
    uint64_t v7 = objc_opt_class();
    v8 = [v6 stringWithFormat:@"Unexpected view(%@) or viewOwner(%@) for UIBarButtonItem represented by TextInputUI", v7, objc_opt_class()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__TUIAssistantButtonBarView__checkBarButtonItemState___block_invoke;
    block[3] = &unk_1E55941A8;
    id v9 = v8;
    id v12 = v9;
    if (_checkBarButtonItemState__onceToken != -1) {
      dispatch_once(&_checkBarButtonItemState__onceToken, block);
    }
    v10 = _checkBarButtonItemState__pencilUCBCheckLog;
    if (os_log_type_enabled((os_log_t)_checkBarButtonItemState__pencilUCBCheckLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_18D47E000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
}

void __54__TUIAssistantButtonBarView__checkBarButtonItemState___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = os_log_create("com.apple.TextInputUI", "PencilUCBCheck");
  id v3 = (void *)_checkBarButtonItemState__pencilUCBCheckLog;
  _checkBarButtonItemState__pencilUCBCheckLog = (uint64_t)v2;

  v4 = _checkBarButtonItemState__pencilUCBCheckLog;
  if (os_log_type_enabled((os_log_t)_checkBarButtonItemState__pencilUCBCheckLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_fault_impl(&dword_18D47E000, v4, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_didTapButtonBarButton:(id)a3 withEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(TUIAssistantButtonBarView *)self _itemViewForSender:v11];
  if ([v7 isCollapsedItem]
    && ([(TUIAssistantButtonBarView *)self delegate],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [(TUIAssistantButtonBarView *)self delegate];
    v10 = [v7 associatedGroup];
    [v9 assistantButtonBarView:self wantsToShowCollapsedItemGroup:v10 fromButton:v11];
  }
  else
  {
    id v9 = [v7 associatedItem];
    [(TUIAssistantButtonBarView *)self _checkBarButtonItemState:v9];
    [v9 _triggerActionForEvent:v6];
  }
}

- (id)_itemViewForSender:(id)a3
{
  return (id)[a3 superview];
}

- (void)setBarButtonWidth:(double)a3
{
  id v4 = [(TUIAssistantButtonBarView *)self sizeProvider];
  [v4 setBarButtonWidth:a3];
}

- (double)barButtonWidth
{
  os_log_t v2 = [(TUIAssistantButtonBarView *)self sizeProvider];
  [v2 barButtonWidth];
  double v4 = v3;

  return v4;
}

- (CGSize)preferredSizeForButtonBarItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUIAssistantButtonBarView *)self sizeProvider];
  [v5 preferredSizeForButtonBarItem:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)configureButtonBarItemView:(id)a3 forItem:(id)a4 group:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 customView];

  if (v10)
  {
    [v29 setBarButtonView:0];
    double v11 = [v8 customView];
    [v29 setCustomView:v11];

    [v29 setAssociatedItem:v8];
    goto LABEL_15;
  }
  [v29 setCustomView:0];
  id v12 = [v29 barButtonView];
  if (v12) {
    goto LABEL_11;
  }
  if ([v8 systemItem] == 5)
  {
    id v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if ([v8 systemItem] != 6)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB2000]);
    id v14 = [(TUIAssistantButtonBarView *)self visualProvider];
    id v12 = (void *)[v13 initWithVisualProvider:v14];

    [v29 setBarButtonView:v12];
    if ([v8 action]) {
      NSStringFromSelector((SEL)[v8 action]);
    }
    else {
    uint64_t v15 = [v8 title];
    }
    [v12 setAccessibilityIdentifier:v15];

    [v12 addTarget:self action:sel__didTapButtonBarButton_withEvent_ forControlEvents:64];
    goto LABEL_11;
  }
LABEL_12:
  v16 = [v8 image];
  v17 = [v16 symbolConfiguration];
  v18 = [v17 locale];
  v19 = [(TUIAssistantButtonBarView *)self delegate];
  [v19 setLocale:v18];

  v20 = [v29 barButtonView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  [v20 configureFromBarItem:v8 withAppearanceDelegate:WeakRetained];

  [v29 setAssociatedItem:v8];
  [v29 setAssociatedGroup:v9];
  id v22 = [v9 representativeItem];
  [v29 setCollapsedItem:v22 == v8];

  v23 = [v29 barButtonView];
  [v8 setView:v23];

  [(TUIAssistantButtonBarView *)self preferredSizeForButtonBarItem:v8];
  if (v24 > 0.0 && v24 < 48.0)
  {
    double v25 = *MEMORY[0x1E4FB2848];
    double v26 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v27 = (48.0 - v24) * -0.5;
    objc_msgSend(v29, "setHitTestInsets:", *MEMORY[0x1E4FB2848], v27, v26, v27);
    v28 = [v29 barButtonView];
    objc_msgSend(v28, "setHitTestInsets:", v25, v27, v26, v27);
  }
LABEL_15:
}

- (BOOL)hasVisibleItem
{
  os_log_t v2 = [(TUIAssistantButtonBarView *)self _visibleGroups];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  visualProvider = self->_visualProvider;
  if (!visualProvider)
  {
    id v4 = [(TUIAssistantButtonBarView *)self _inheritedRenderConfig];
    uint64_t v5 = [v4 buttonBarVisualProvider];
    double v6 = self->_visualProvider;
    self->_visualProvider = v5;

    visualProvider = self->_visualProvider;
  }
  return visualProvider;
}

- (BOOL)validateButtonGroup:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TUIAssistantButtonBarView *)self _groupViewForBarButtonItemGroup:v4];
  double v6 = [v5 visibleButtons];
  double v7 = (void *)[v6 copy];

  [v4 _validateAllItems];
  id v8 = [v4 barButtonItems];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [v7 count];

  if (v9 == v10)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__TUIAssistantButtonBarView_validateButtonGroup___block_invoke;
    v26[3] = &unk_1E5594070;
    v26[4] = self;
    id v27 = v4;
    [v7 enumerateObjectsUsingBlock:v26];
  }
  double v11 = [v5 visibleButtons];
  char v12 = [v11 isEqualToArray:v7];

  if ((v12 & 1) == 0)
  {
    if ([v5 isCollapsed])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = [(TUIAssistantButtonBarView *)self groupViews];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * i) setCollapsed:0];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v15);
      }
    }
    [v5 setNeedsLayout];
  }
  if ([v4 isHidden])
  {
    int v18 = 1;
  }
  else
  {
    v19 = [v4 representativeItem];
    int v18 = [v19 isHidden];
  }
  char v20 = v12 ^ 1;
  if (v18 != [v5 isHidden]) {
    char v20 = 1;
  }

  return v20;
}

void __49__TUIAssistantButtonBarView_validateButtonGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v9 = [v6 barButtonItems];
  id v8 = [v9 objectAtIndexedSubscript:a3];
  [v5 configureButtonBarItemView:v7 forItem:v8 group:*(void *)(a1 + 40)];
}

- (BOOL)isKeyboardGroup:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = objc_msgSend(a3, "barButtonItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isKeyboardItem])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)validateButtonGroups
{
  os_log_t v2 = self;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  BOOL v3 = self->_buttonGroups;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v68 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [(TUIAssistantButtonBarView *)v2 validateButtonGroup:*(void *)(*((void *)&v67 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  long long v9 = [(TUIAssistantButtonBarView *)v2 separatorGroups];
  uint64_t v10 = [v9 count];

  char v11 = v6;
  if (v10)
  {
    char v12 = [(TUIAssistantButtonBarView *)v2 separatorGroups];
    v53 = [(TUIAssistantButtonBarView *)v2 _visibleGroups];
    uint64_t v13 = [(TUIAssistantButtonBarView *)v2 buttonGroups];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v64 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v63 + 1) + 8 * j);
          if (([v53 containsObject:v19] & 1) != 0
            || [v12 containsObject:v19])
          {
            [v14 addObject:v19];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v16);
    }
    v46 = v2;

    uint64_t v20 = [v14 count];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v21 = v12;
    uint64_t v54 = [v21 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v54)
    {
      uint64_t v51 = v20;
      uint64_t v52 = *(void *)v60;
      unint64_t v48 = v20 - 1;
      char v22 = v6 & 1;
      unint64_t v23 = v20;
      v50 = v14;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v60 != v52) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v59 + 1) + 8 * v24);
          unint64_t v26 = [v14 indexOfObject:v25];
          if (v26) {
            BOOL v27 = v26 == 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            BOOL v27 = 1;
          }
          if (v27 || (unint64_t v39 = v26, v26 >= v48))
          {
            int v28 = 0;
          }
          else
          {
            v40 = [v14 objectAtIndexedSubscript:v26 - 1];
            unint64_t v41 = v39 + 1;
            if (v41 >= v23) {
              goto LABEL_49;
            }
            while (1)
            {
              v42 = [v14 objectAtIndexedSubscript:v41];
              if (![v21 containsObject:v42]) {
                break;
              }

              if (v23 == ++v41) {
                goto LABEL_49;
              }
            }
            if (v42)
            {
              int v47 = [v21 containsObject:v40];
              BOOL v43 = [(TUIAssistantButtonBarView *)v46 isKeyboardGroup:v40];
              unint64_t v23 = v51;
              int v28 = (v43 ^ [(TUIAssistantButtonBarView *)v46 isKeyboardGroup:v42]) & ~v47;
            }
            else
            {
LABEL_49:
              int v28 = 0;
            }
          }
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v29 = [v25 barButtonItems];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            id v32 = v21;
            uint64_t v33 = *(void *)v56;
            int v34 = v22 & 1;
            uint64_t v35 = v28 ^ 1u;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v56 != v33) {
                  objc_enumerationMutation(v29);
                }
                v37 = *(void **)(*((void *)&v55 + 1) + 8 * k);
                v34 |= [v37 _hidden] ^ v35;
                [v37 _setHidden:v35];
                v38 = [v37 buttonGroup];
                [v38 setHidden:v35];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v71 count:16];
            }
            while (v31);
            char v22 = v34 & 1;
            id v21 = v32;
            uint64_t v14 = v50;
            unint64_t v23 = v51;
          }

          ++v24;
        }
        while (v24 != v54);
        uint64_t v44 = [v21 countByEnumeratingWithState:&v59 objects:v72 count:16];
        uint64_t v54 = v44;
      }
      while (v44);
    }
    else
    {
      char v22 = v6 & 1;
    }

    char v11 = v22 & 1;
    os_log_t v2 = v46;
  }
  if (v6) {
    [(TUIAssistantButtonBarView *)v2 setNeedsLayout];
  }
  return v11 & 1;
}

- (void)layoutSubviews
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v91.receiver = self;
  v91.super_class = (Class)TUIAssistantButtonBarView;
  [(TUIAssistantButtonBarView *)&v91 layoutSubviews];
  BOOL v3 = [(TUIAssistantButtonBarView *)self delegate];
  uint64_t v4 = [v3 inputAssistantItem];
  [v4 _marginOverride];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    [(TUIAssistantButtonBarView *)self setHorizontalMargins:self->_defaultHorizontalMargins];
  }
  else
  {
    uint64_t v7 = [(TUIAssistantButtonBarView *)self delegate];
    long long v8 = [v7 inputAssistantItem];
    [v8 _marginOverride];
    -[TUIAssistantButtonBarView setHorizontalMargins:](self, "setHorizontalMargins:");
  }
  [(TUIAssistantButtonBarView *)self _insetsForHorizontalMargin];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(TUIAssistantButtonBarView *)self bounds];
  double v18 = v12 + v17;
  double v20 = v10 + v19;
  double v22 = v21 - (v12 + v16);
  double v24 = v23 - (v10 + v14);
  long long v25 = [(TUIAssistantButtonBarView *)self buttonContainer];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  unint64_t v26 = [(TUIAssistantButtonBarView *)self buttonContainer];
  [v26 bounds];
  double v28 = v27;
  double v30 = v29;

  [(TUIAssistantButtonBarView *)self minimumInterItemSpace];
  -[TUIAssistantButtonBarView setEffectiveInterItemSpacing:](self, "setEffectiveInterItemSpacing:");
  [(TUIAssistantButtonBarView *)self _collapseGroupsIfNecessaryForWidth:v28];
  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", v28, v30);
  double v32 = v31;
  if ([(TUIAssistantButtonBarView *)self _containsFlexibleGroupViews]) {
    double v33 = v28;
  }
  else {
    double v33 = v32;
  }
  if (v33 <= v28) {
    double v34 = 1.0;
  }
  else {
    double v34 = v28 / v33;
  }
  if ([(TUIAssistantButtonBarView *)self buttonAlignment] == 1)
  {
    uint64_t v35 = [(TUIAssistantButtonBarView *)self _allVisibleBarItemViews];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v87 objects:v94 count:16];
    double v37 = 0.0;
    double v38 = 0.0;
    if (v36)
    {
      uint64_t v39 = v36;
      uint64_t v40 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v88 != v40) {
            objc_enumerationMutation(v35);
          }
          v42 = [*(id *)(*((void *)&v87 + 1) + 8 * i) associatedItem];
          [(TUIAssistantButtonBarView *)self preferredSizeForButtonBarItem:v42];
          double v44 = v43;

          double v38 = v38 + v44;
        }
        uint64_t v39 = [v35 countByEnumeratingWithState:&v87 objects:v94 count:16];
      }
      while (v39);
    }
    if ((unint64_t)[v35 count] >= 2)
    {
      double v37 = (v28 - v38) / (double)(unint64_t)([v35 count] - 1);
      [(TUIAssistantButtonBarView *)self setEffectiveInterItemSpacing:v37];
    }
  }
  else
  {
    -[TUIAssistantButtonBarView _totalGroupSizeThatFits:](self, "_totalGroupSizeThatFits:", v28, v30);
    -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", v28, v30, v45, v46);
    double v37 = v47;
  }
  double v48 = 0.0;
  if ([(TUIAssistantButtonBarView *)self _containsFlexibleGroupViews])
  {
    double v49 = v33 - v37;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v50 = [(TUIAssistantButtonBarView *)self _visibleGroupViews];
    uint64_t v51 = [v50 countByEnumeratingWithState:&v83 objects:v93 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      unint64_t v53 = 0;
      uint64_t v54 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v84 != v54) {
            objc_enumerationMutation(v50);
          }
          long long v56 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          objc_msgSend(v56, "sizeThatFits:", v28, v30);
          double v49 = v49 - v57;
          v53 += [v56 containsFlexibleItems];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v83 objects:v93 count:16];
      }
      while (v52);
      double v58 = (double)v53;
    }
    else
    {
      double v58 = 0.0;
    }

    double v48 = v49 / v58;
  }
  int64_t v59 = [(TUIAssistantButtonBarView *)self buttonAlignment];
  uint64_t v60 = [(TUIAssistantButtonBarView *)self effectiveUserInterfaceLayoutDirection];
  long long v61 = [(TUIAssistantButtonBarView *)self groupViews];
  long long v62 = v61;
  if (v59 == 2)
  {
    if (v60 == 1) {
      [v61 objectEnumerator];
    }
    else {
    long long v63 = [v61 reverseObjectEnumerator];
    }
    double v64 = v28;
  }
  else
  {
    if (v60 == 1) {
      [v61 reverseObjectEnumerator];
    }
    else {
    long long v63 = [v61 objectEnumerator];
    }
    double v64 = 0.0;
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v65 = v63;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v67; ++k)
      {
        if (*(void *)v80 != v68) {
          objc_enumerationMutation(v65);
        }
        long long v70 = *(void **)(*((void *)&v79 + 1) + 8 * k);
        v71 = objc_msgSend(v70, "barButtonItemGroup", (void)v79);
        if ([v71 isHidden])
        {
          [v70 setHidden:1];
        }
        else
        {
          v72 = [v70 visibleButtons];
          objc_msgSend(v70, "setHidden:", objc_msgSend(v72, "count") == 0);
        }
        if (([v70 isHidden] & 1) == 0)
        {
          objc_msgSend(v70, "sizeThatFits:", v28, v30);
          double v74 = v34 * v73;
          int v75 = [v70 containsFlexibleItems];
          if (v48 >= v74) {
            double v76 = v48;
          }
          else {
            double v76 = v74;
          }
          if (v75) {
            double v74 = v76;
          }
          UIRoundToViewScale();
          double v78 = v77;
          if ([(TUIAssistantButtonBarView *)self buttonAlignment] == 2)
          {
            objc_msgSend(v70, "setFrame:", v64 - v78, 0.0, v78, v30);
            double v64 = v64 - (v37 + v74);
          }
          else
          {
            objc_msgSend(v70, "setFrame:", v64, 0.0, v78, v30);
            double v64 = v64 + v37 + v74;
          }
        }
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v79 objects:v92 count:16];
    }
    while (v67);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TUIAssistantButtonBarView _uncollapseAllGroupsForNewSizeIfNecessary:](self, "_uncollapseAllGroupsForNewSizeIfNecessary:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)TUIAssistantButtonBarView;
  -[TUIAssistantButtonBarView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TUIAssistantButtonBarView _uncollapseAllGroupsForNewSizeIfNecessary:](self, "_uncollapseAllGroupsForNewSizeIfNecessary:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)TUIAssistantButtonBarView;
  -[TUIAssistantButtonBarView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (BOOL)_containsFlexibleGroupViews
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  os_log_t v2 = [(TUIAssistantButtonBarView *)self _visibleGroupViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) containsFlexibleItems])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)uncollapseAllGroups
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  os_log_t v2 = [(TUIAssistantButtonBarView *)self groupViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setCollapsed:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_uncollapseAllGroupsForNewSizeIfNecessary:(CGSize)a3
{
  double width = a3.width;
  [(TUIAssistantButtonBarView *)self bounds];
  if (width > v5)
  {
    [(TUIAssistantButtonBarView *)self uncollapseAllGroups];
  }
}

- (void)_collapseGroupsIfNecessaryForWidth:(double)a3
{
  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
  double v6 = v5;
  BOOL v7 = [(TUIAssistantButtonBarView *)self constrainedHorizontally];
  if (v7) {
    BOOL v7 = [(TUIAssistantButtonBarView *)self _containsFlexibleGroupViews];
  }
  if (v6 > a3 || v7)
  {
    do
    {
      long long v9 = [(TUIAssistantButtonBarView *)self _uncollapsedGroupViews];
      uint64_t v10 = [v9 count];

      if (!v10) {
        break;
      }
      double v11 = [(TUIAssistantButtonBarView *)self _uncollapsedGroupViews];
      uint64_t v12 = [v11 firstObject];

      [v12 setCollapsed:1];
      -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
      double v14 = v13;
    }
    while (v14 >= a3);
  }
}

- (id)_allVisibleBarItemViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(TUIAssistantButtonBarView *)self groupViews];
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
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) visibleButtons];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_uncollapsedGroupViews
{
  os_log_t v2 = [(TUIAssistantButtonBarView *)self groupViews];
  if (_collapsedButtonBarGroupViewsPredicate_onceToken != -1) {
    dispatch_once(&_collapsedButtonBarGroupViewsPredicate_onceToken, &__block_literal_global_7591);
  }
  uint64_t v3 = [v2 filteredOrderedSetUsingPredicate:_collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate];

  return v3;
}

- (id)_visibleGroups
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(TUIAssistantButtonBarView *)self _visibleGroupViews];
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
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) barButtonItemGroup];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleGroupViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(TUIAssistantButtonBarView *)self groupViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 barButtonItemGroup];
        if ([v10 isHidden])
        {
        }
        else
        {
          long long v11 = [v9 visibleButtons];
          uint64_t v12 = [v11 count];

          if (v12) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (CGSize)collapsedSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TUIAssistantButtonBarView _collapseGroupsIfNecessaryForWidth:](self, "_collapseGroupsIfNecessaryForWidth:");
  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", width, height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[TUIAssistantButtonBarView _totalGroupSizeThatFits:](self, "_totalGroupSizeThatFits:");
  double v7 = v6;
  -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", width, height, v6, v8);
  double v10 = v9;
  long long v11 = [(TUIAssistantButtonBarView *)self _visibleGroups];
  uint64_t v12 = [v11 count] - 1;

  double v13 = v7 + v10 * (double)v12;
  double v14 = *MEMORY[0x1E4FB30D8];
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUIAssistantButtonBarView *)self _visibleGroups];
  if ([v3 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          double v10 = -[TUIAssistantButtonBarView _groupViewForBarButtonItemGroup:](self, "_groupViewForBarButtonItemGroup:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          [v10 intrinsicContentSize];
          double v8 = v8 + v11;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", 1.79769313e308, 1.79769313e308, v8, 1.79769313e308);
    double v12 = v8 + v13 * (double)(unint64_t)([v4 count] - 1);
  }
  else
  {
    double v12 = 0.0;
  }
  [(TUIAssistantButtonBarView *)self _insetsForHorizontalMargin];
  double v15 = v14;
  double v17 = v16;

  double v18 = v12 + v15 + v17;
  double v19 = *MEMORY[0x1E4FB30D8];
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (UIEdgeInsets)_insetsForHorizontalMargin
{
  uint64_t v3 = MEMORY[0x1E4FB2848];
  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  if ([(TUIAssistantButtonBarView *)self buttonAlignment] == 1)
  {
    [(TUIAssistantButtonBarView *)self horizontalMargins];
    double v7 = v6;
LABEL_5:
    [(TUIAssistantButtonBarView *)self horizontalMargins];
    double v8 = v9;
    goto LABEL_7;
  }
  double v8 = *(double *)(v3 + 24);
  if (![(TUIAssistantButtonBarView *)self buttonAlignment])
  {
    [(TUIAssistantButtonBarView *)self horizontalMargins];
    double v7 = v10;
    goto LABEL_7;
  }
  double v7 = *(double *)(v3 + 8);
  if ([(TUIAssistantButtonBarView *)self buttonAlignment] == 2) {
    goto LABEL_5;
  }
LABEL_7:
  double v11 = v4;
  double v12 = v7;
  double v13 = v5;
  double v14 = v8;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)_interItemSpacingThatFits:(CGSize)a3 forGroupSize:(CGSize)a4
{
  double width = a4.width;
  double v5 = a3.width;
  double v7 = [(TUIAssistantButtonBarView *)self _visibleGroups];
  uint64_t v8 = [v7 count] - 1;

  if (v8 < 1) {
    return 0.0;
  }
  [(TUIAssistantButtonBarView *)self effectiveInterItemSpacing];
  if (width + v9 * (double)v8 > v5) {
    return fmax((v5 - width) / (double)v8, 0.0);
  }
  [(TUIAssistantButtonBarView *)self effectiveInterItemSpacing];
  return result;
}

- (CGSize)_totalGroupSizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = [(TUIAssistantButtonBarView *)self _visibleGroups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = [(TUIAssistantButtonBarView *)self _groupViewForBarButtonItemGroup:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        objc_msgSend(v11, "sizeThatFits:", width - v9, 0.0);
        double v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  double v13 = *MEMORY[0x1E4FB30D8];
  double v14 = v9;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)_updateBarButtonItemHiddenState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(TUIAssistantButtonBarView *)self buttonGroups];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v9 = [(TUIAssistantButtonBarView *)self _groupViewForBarButtonItemGroup:v8];
        objc_msgSend(v9, "setHidden:", objc_msgSend(v8, "isHidden"));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_groupViewForBarButtonItemGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUIAssistantButtonBarView *)self groupViews];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__TUIAssistantButtonBarView__groupViewForBarButtonItemGroup___block_invoke;
  v11[3] = &unk_1E5594048;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    double v9 = [(TUIAssistantButtonBarView *)self groupViews];
    uint64_t v8 = [v9 objectAtIndex:v7];
  }
  return v8;
}

BOOL __61__TUIAssistantButtonBarView__groupViewForBarButtonItemGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 barButtonItemGroup];
  BOOL v7 = v6 == *(void **)(a1 + 32);
  *a4 = v7;

  return v7;
}

- (void)setButtonGroups:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![(NSArray *)self->_buttonGroups isEqualToArray:v7])
  {
    objc_storeStrong((id *)&self->_buttonGroups, a3);
    uint64_t v8 = [(TUIAssistantButtonBarView *)self groupViews];
    double v9 = (void *)[v8 copy];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke;
    aBlock[3] = &unk_1E55941A8;
    id v27 = v9;
    id v40 = v27;
    unint64_t v26 = (void (**)(void))_Block_copy(aBlock);
    long long v10 = [(TUIAssistantButtonBarView *)self groupViews];
    [v10 removeAllObjects];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          long long v17 = [TUIAssistantButtonBarGroupView alloc];
          long long v18 = [(TUIAssistantButtonBarView *)self visualProvider];
          double v19 = [(TUIAssistantButtonBarGroupView *)v17 initWithBarButtonItemGroup:v16 visualProvider:v18 buttonProvider:self];

          [(TUIAssistantButtonBarView *)self minimumInterItemSpace];
          -[TUIAssistantButtonBarGroupView setItemSpacing:](v19, "setItemSpacing:");
          uint64_t v20 = [(TUIAssistantButtonBarView *)self groupViews];
          [v20 addObject:v19];

          long long v21 = [(TUIAssistantButtonBarView *)self buttonContainer];
          [v21 addSubview:v19];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v13);
    }

    [(TUIAssistantButtonBarView *)self setNeedsLayout];
    if (v4)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_2;
      v34[3] = &unk_1E55941A8;
      v34[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
      objc_initWeak(&location, self);
      long long v22 = (void *)MEMORY[0x1E4FB1EB0];
      double v23 = *MEMORY[0x1E4FB2C08];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_3;
      v30[3] = &unk_1E5593FF8;
      double v24 = v27;
      id v31 = v27;
      objc_copyWeak(&v32, &location);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_4;
      v28[3] = &unk_1E5594020;
      uint64_t v25 = v26;
      double v29 = v26;
      [v22 animateWithDuration:0 delay:v30 options:v28 animations:v23 completion:0.0];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v25 = v26;
      v26[2](v26);
      double v24 = v27;
    }
  }
}

void __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "groupViews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v6++) setAlpha:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = objc_msgSend(WeakRetained, "groupViews", 0);

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setAlpha:1.0];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

uint64_t __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setButtonGroups:(id)a3
{
}

- (void)setEffectiveInterItemSpacing:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_effectiveInterItemSpacing = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(TUIAssistantButtonBarView *)self groupViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setItemSpacing:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setMinimumInterItemSpace:(double)a3
{
  self->_minimumInterItemSpace = a3;
  -[TUIAssistantButtonBarView setEffectiveInterItemSpacing:](self, "setEffectiveInterItemSpacing:");
}

- (TUIAssistantButtonBarView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUIAssistantButtonBarView;
  uint64_t v3 = -[TUIAssistantButtonBarView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIAssistantButtonBarView *)v3 setButtonContainer:v5];

    uint64_t v6 = [(TUIAssistantButtonBarView *)v3 buttonContainer];
    [(TUIAssistantButtonBarView *)v3 addSubview:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(TUIAssistantButtonBarView *)v3 setGroupViews:v7];

    [(TUIAssistantButtonBarView *)v3 setButtonAlignment:1];
    [(TUIAssistantButtonBarView *)v3 setMinimumInterItemSpace:5.0];
    v3->_defaultHorizontalMargins = 15.0;
    [(TUIAssistantButtonBarView *)v3 setHorizontalMargins:15.0];
    uint64_t v8 = objc_alloc_init(TUIAssistantButtonSizeProvider);
    [(TUIAssistantButtonBarView *)v3 setSizeProvider:v8];

    [(TUIAssistantButtonBarView *)v3 setBarButtonWidth:40.0];
  }
  return v3;
}

@end