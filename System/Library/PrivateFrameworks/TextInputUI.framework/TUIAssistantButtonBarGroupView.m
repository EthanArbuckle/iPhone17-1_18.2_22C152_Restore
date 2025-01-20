@interface TUIAssistantButtonBarGroupView
- (BOOL)_canBeCollapsed;
- (BOOL)containsFlexibleItems;
- (BOOL)isCollapsed;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)_preferredSizeForItems:(id)a3 fittingWidth:(double)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)visibleButtons;
- (TUIAssistantButtonBarGroupView)initWithBarButtonItemGroup:(id)a3 visualProvider:(id)a4 buttonProvider:(id)a5;
- (TUIButtonBarViewProvider)buttonProvider;
- (UIBarButtonItemGroup)barButtonItemGroup;
- (_UIButtonBarButtonVisualProvider)visualProvider;
- (double)itemSpacing;
- (id)_buttonBarItemViewForBarButtonItem:(id)a3;
- (id)_visibleItems;
- (id)_visibleItemsAllowingCollapse:(BOOL)a3;
- (void)_ensureVisibleButtonsForVisibleItems;
- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4;
- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4;
- (void)_groupDidUpdateVisibility:(id)a3;
- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4;
- (void)_itemDidChangeHiddenState:(id)a3;
- (void)_itemDidChangeWidth:(id)a3;
- (void)_itemStandardViewNeedsUpdate:(id)a3;
- (void)_updateViewForBarButtonItem:(id)a3;
- (void)layoutSubviews;
- (void)setBarButtonItemGroup:(id)a3;
- (void)setButtonProvider:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setItemSpacing:(double)a3;
- (void)setVisualProvider:(id)a3;
@end

@implementation TUIAssistantButtonBarGroupView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_destroyWeak((id *)&self->_buttonProvider);
  objc_storeStrong((id *)&self->_barButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_visibleButtons, 0);
}

- (void)setVisualProvider:(id)a3
{
}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)setButtonProvider:(id)a3
{
}

- (TUIButtonBarViewProvider)buttonProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonProvider);
  return (TUIButtonBarViewProvider *)WeakRetained;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (UIBarButtonItemGroup)barButtonItemGroup
{
  return self->_barButtonItemGroup;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TUIAssistantButtonBarGroupView *)self visibleButtons];
  uint64_t v9 = [v8 count];

  if (v9 != 1) {
    goto LABEL_4;
  }
  v10 = [(TUIAssistantButtonBarGroupView *)self visibleButtons];
  v11 = [v10 firstObject];
  v12 = [v11 barButtonView];

  if (v12)
  {
    v13 = [(TUIAssistantButtonBarGroupView *)self visibleButtons];
    v14 = [v13 firstObject];
    v15 = [v14 barButtonView];
    [v15 _buttonBarHitRect];
    v19.double x = x;
    v19.double y = y;
    unsigned __int8 v16 = CGRectContainsPoint(v20, v19);
  }
  else
  {
LABEL_4:
    v18.receiver = self;
    v18.super_class = (Class)TUIAssistantButtonBarGroupView;
    unsigned __int8 v16 = -[TUIAssistantButtonBarGroupView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y);
  }

  return v16;
}

- (void)_itemDidChangeHiddenState:(id)a3
{
  id v4 = a3;
  [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
  id v5 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v5 preferredSizeDidChangeForButtonBarItem:v4];
}

- (void)_itemDidChangeWidth:(id)a3
{
  id v4 = a3;
  [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
  id v5 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v5 preferredSizeDidChangeForButtonBarItem:v4];
}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  id v4 = a3;
  [(TUIAssistantButtonBarGroupView *)self _updateViewForBarButtonItem:v4];
  [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
  id v5 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v5 preferredSizeDidChangeForButtonBarItem:v4];
}

- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4
{
  id v5 = a3;
  id v8 = [(TUIAssistantButtonBarGroupView *)self _buttonBarItemViewForBarButtonItem:v5];
  v6 = [v5 customView];
  [v8 setCustomView:v6];

  id v7 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v7 preferredSizeDidChangeForButtonBarItem:v5];
}

- (void)_updateViewForBarButtonItem:(id)a3
{
  id v7 = a3;
  id v4 = -[TUIAssistantButtonBarGroupView _buttonBarItemViewForBarButtonItem:](self, "_buttonBarItemViewForBarButtonItem:");
  if (v4)
  {
    id v5 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
    v6 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
    [v5 configureButtonBarItemView:v4 forItem:v7 group:v6];
  }
}

- (void)_groupDidUpdateVisibility:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v5 preferredSizeDidChangeForGroup:v4];
}

- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4
{
  id v5 = a3;
  id v6 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v6 preferredSizeDidChangeForGroup:v5];
}

- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4
{
  id v5 = a3;
  id v6 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
  [v6 preferredSizeDidChangeForGroup:v5];
}

- (void)layoutSubviews
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)TUIAssistantButtonBarGroupView;
  [(TUIAssistantButtonBarGroupView *)&v36 layoutSubviews];
  [(TUIAssistantButtonBarGroupView *)self _ensureVisibleButtonsForVisibleItems];
  [(TUIAssistantButtonBarGroupView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TUIAssistantButtonBarGroupView *)self _visibleItems];
  -[TUIAssistantButtonBarGroupView sizeThatFits:](self, "sizeThatFits:", v8, v10);
  if (v12 <= v8) {
    double v13 = 1.0;
  }
  else {
    double v13 = v8 / v12;
  }
  double v14 = 0.0;
  if ([(TUIAssistantButtonBarGroupView *)self containsFlexibleItems])
  {
    [(TUIAssistantButtonBarGroupView *)self itemSpacing];
    double v16 = v8 - v15 * (double)(unint64_t)([v11 count] - 1);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v17 = [(TUIAssistantButtonBarGroupView *)self _visibleItems];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      unint64_t v20 = 0;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v24 = [(TUIAssistantButtonBarGroupView *)self buttonProvider];
          [v24 preferredSizeForButtonBarItem:v23];
          double v26 = v25;

          double v27 = v16 - v26 * v13;
          if (v26 > 0.0) {
            double v16 = v16 - v26 * v13;
          }
          else {
            ++v20;
          }
        }
        uint64_t v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16, v27);
      }
      while (v19);
      double v28 = (double)v20;
    }
    else
    {
      double v28 = 0.0;
    }

    double v14 = fmax(v16 / v28, 15.0);
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  uint64_t v29 = [(TUIAssistantButtonBarGroupView *)self effectiveUserInterfaceLayoutDirection];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__TUIAssistantButtonBarGroupView_layoutSubviews__block_invoke;
  v30[3] = &unk_1E5593960;
  *(double *)&v30[6] = v13;
  *(double *)&v30[7] = v14;
  v30[4] = self;
  v30[5] = v31;
  v30[8] = v4;
  v30[9] = v6;
  *(double *)&v30[10] = v8;
  *(double *)&v30[11] = v10;
  [v11 enumerateObjectsWithOptions:2 * (v29 == 1) usingBlock:v30];
  _Block_object_dispose(v31, 8);
}

void __48__TUIAssistantButtonBarGroupView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) visibleButtons];
  uint64_t v6 = [v5 objectAtIndex:a3];

  double v7 = [*(id *)(a1 + 32) buttonProvider];
  double v8 = [*(id *)(a1 + 32) barButtonItemGroup];
  [v7 configureButtonBarItemView:v6 forItem:v15 group:v8];

  double v9 = [v15 customView];
  if (v9)
  {
  }
  else if (objc_opt_respondsToSelector())
  {
    [v15 _setViewOwner:*(void *)(a1 + 32)];
  }
  double v10 = [*(id *)(a1 + 32) buttonProvider];
  [v10 preferredSizeForButtonBarItem:v15];

  double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  UIRoundToViewScale();
  objc_msgSend(v6, "setFrame:", v11, 0.0, v12, *(double *)(a1 + 88));
  [v6 frame];
  double Width = CGRectGetWidth(v17);
  [*(id *)(a1 + 32) itemSpacing];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = Width
                                                              + v14
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (id)_buttonBarItemViewForBarButtonItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_visibleButtons;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "associatedItem", (void)v12);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)visibleButtons
{
  [(TUIAssistantButtonBarGroupView *)self _ensureVisibleButtonsForVisibleItems];
  visibleButtons = self->_visibleButtons;
  return (NSArray *)visibleButtons;
}

- (void)_ensureVisibleButtonsForVisibleItems
{
  id v12 = [(TUIAssistantButtonBarGroupView *)self _visibleItems];
  while (1)
  {
    unint64_t v3 = [(NSMutableArray *)self->_visibleButtons count];
    if (v3 <= [v12 count]) {
      break;
    }
    id v4 = [(NSMutableArray *)self->_visibleButtons lastObject];
    [v4 removeFromSuperview];
    [(NSMutableArray *)self->_visibleButtons removeObject:v4];
  }
  unint64_t v5 = [(NSMutableArray *)self->_visibleButtons count];
  if (v5 < [v12 count])
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      id v10 = -[TUIButtonBarItemView initWithFrame:]([TUIButtonBarItemView alloc], "initWithFrame:", v6, v7, v8, v9);
      [(NSMutableArray *)self->_visibleButtons addObject:v10];
      [(TUIAssistantButtonBarGroupView *)self addSubview:v10];

      unint64_t v11 = [(NSMutableArray *)self->_visibleButtons count];
    }
    while (v11 < [v12 count]);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  unint64_t v5 = [(TUIAssistantButtonBarGroupView *)self _visibleItems];
  [(TUIAssistantButtonBarGroupView *)self _preferredSizeForItems:v5 fittingWidth:width];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
  uint64_t v4 = [v3 _shouldAlwaysCollapse];

  unint64_t v5 = [(TUIAssistantButtonBarGroupView *)self _visibleItemsAllowingCollapse:v4];
  [(TUIAssistantButtonBarGroupView *)self _preferredSizeForItems:v5 fittingWidth:3.40282347e38];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_preferredSizeForItems:(id)a3 fittingWidth:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  double v8 = *MEMORY[0x1E4FB30D8];
  double v9 = *MEMORY[0x1E4FB30D8];
  if (v7)
  {
    uint64_t v10 = v7;
    [(TUIAssistantButtonBarGroupView *)self itemSpacing];
    double v12 = v11;
    unint64_t v13 = v10 - 1;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      double v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonProvider);
          objc_msgSend(WeakRetained, "preferredSizeForButtonBarItem:", v20, (void)v29);
          double v23 = v22;

          if (v23 <= 0.0) {
            double v24 = 15.0;
          }
          else {
            double v24 = v23;
          }
          double v18 = v18 + v24;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }

    double v25 = (double)v13;
    double v9 = v18 + v12 * (double)v13;
    if (v9 > a4)
    {
      double v26 = fmax((a4 - v18) / v25, 0.0);
      [(TUIAssistantButtonBarGroupView *)self setItemSpacing:v26];
      double v9 = v18 + v26 * v25;
    }
  }

  double v27 = v9;
  double v28 = v8;
  result.height = v28;
  result.double width = v27;
  return result;
}

- (BOOL)containsFlexibleItems
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = [(TUIAssistantButtonBarGroupView *)self _visibleItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonProvider);
        [WeakRetained preferredSizeForButtonBarItem:v8];
        double v11 = v10;

        if (v11 <= 0.0)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)_visibleItems
{
  return [(TUIAssistantButtonBarGroupView *)self _visibleItemsAllowingCollapse:1];
}

- (id)_visibleItemsAllowingCollapse:(BOOL)a3
{
  BOOL v3 = a3;
  v23[1] = *MEMORY[0x1E4F143B8];
  if ([(TUIAssistantButtonBarGroupView *)self isCollapsed]
    && [(TUIAssistantButtonBarGroupView *)self _canBeCollapsed]
    && v3)
  {
    uint64_t v5 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
    uint64_t v6 = [v5 representativeItem];
    char v7 = [v6 _hidden];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_18;
    }
    double v10 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
    long long v16 = [v10 representativeItem];
    v23[0] = v16;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v9 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
    double v10 = [v9 barButtonItems];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v15 _hidden] & 1) == 0) {
            [v8 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }

LABEL_18:
  return v8;
}

- (void)setItemSpacing:(double)a3
{
  if (self->_itemSpacing != a3)
  {
    self->_itemSpacing = a3;
    [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
  }
}

- (BOOL)isCollapsed
{
  if (self->_collapsed) {
    return 1;
  }
  BOOL v3 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
  char v4 = [v3 _shouldAlwaysCollapse];

  return v4;
}

- (void)setBarButtonItemGroup:(id)a3
{
  uint64_t v5 = (UIBarButtonItemGroup *)a3;
  if (self->_barButtonItemGroup != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_barButtonItemGroup, a3);
    if (objc_opt_respondsToSelector()) {
      [(UIBarButtonItemGroup *)v6 _setOwner:self];
    }
    [(TUIAssistantButtonBarGroupView *)self setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (BOOL)_canBeCollapsed
{
  BOOL v3 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
  char v4 = [v3 representativeItem];
  if (v4)
  {
    uint64_t v5 = [(TUIAssistantButtonBarGroupView *)self barButtonItemGroup];
    uint64_t v6 = [v5 barButtonItems];
    BOOL v7 = (unint64_t)[v6 count] > 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (TUIAssistantButtonBarGroupView)initWithBarButtonItemGroup:(id)a3 visualProvider:(id)a4 buttonProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIAssistantButtonBarGroupView;
  uint64_t v12 = -[TUIAssistantButtonBarGroupView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v12)
  {
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visibleButtons = v12->_visibleButtons;
    v12->_visibleButtons = v13;

    objc_storeStrong((id *)&v12->_barButtonItemGroup, a3);
    if (objc_opt_respondsToSelector()) {
      [(UIBarButtonItemGroup *)v12->_barButtonItemGroup _setOwner:v12];
    }
    objc_storeWeak((id *)&v12->_buttonProvider, v11);
    objc_storeStrong((id *)&v12->_visualProvider, a4);
  }

  return v12;
}

@end