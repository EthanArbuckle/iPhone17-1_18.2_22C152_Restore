@interface _UIFloatingTabBarPinnedItemsView
- (BOOL)isEditing;
- (CGRect)itemFrameForItemAtIndex:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)items;
- (NSMutableDictionary)itemViews;
- (_UIFloatingTabBarPinnedItemsView)initWithFrame:(CGRect)a3;
- (id)_itemViewForItem:(id)a3;
- (id)_itemViewForItemAtIndex:(int64_t)a3;
- (id)tabForSelectionAtItemIndex:(int64_t)a3;
- (int64_t)highlightedIndex;
- (int64_t)itemIndexForItemAtLocation:(CGPoint)a3;
- (int64_t)itemIndexForTab:(id)a3;
- (int64_t)selectionViewIndex;
- (void)_reloadItemViewsWithDifference:(id)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)reloadItemViewForTab:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlightedIndex:(int64_t)a3;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setSelectionViewIndex:(int64_t)a3;
@end

@implementation _UIFloatingTabBarPinnedItemsView

- (_UIFloatingTabBarPinnedItemsView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingTabBarPinnedItemsView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selectionViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3->_highlightedIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v5 = [MEMORY[0x1E4F1C978] array];
    items = v4->_items;
    v4->_items = (NSArray *)v5;
  }
  return v4;
}

- (void)setEditing:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    self->_editing = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(_UIFloatingTabBarPinnedItemsView *)self itemViews];
    uint64_t v5 = [v4 objectEnumerator];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setEditing:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = self->_items;
  v9 = (NSArray *)v7;
  long long v12 = v9;
  if (v8 == v9)
  {

    long long v11 = v12;
LABEL_9:

    goto LABEL_10;
  }
  if (!v9 || !v8)
  {

    goto LABEL_8;
  }
  char v10 = [(NSArray *)v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_items, a3);
    long long v11 = [(NSArray *)v12 differenceFromArray:v8 withOptions:0 usingEquivalenceTest:&__block_literal_global_69];
    [(_UIFloatingTabBarPinnedItemsView *)self _reloadItemViewsWithDifference:v11 animated:v4];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setSelectionViewIndex:(int64_t)a3
{
  int64_t selectionViewIndex = self->_selectionViewIndex;
  if (selectionViewIndex != a3)
  {
    if (selectionViewIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:");
      [v6 setHasSelectionHighlight:0];
    }
    self->_int64_t selectionViewIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(_UIFloatingTabBarPinnedItemsView *)self _itemViewForItemAtIndex:a3];
      [v7 setHasSelectionHighlight:1];
    }
  }
}

- (void)setHighlightedIndex:(int64_t)a3
{
  int64_t highlightedIndex = self->_highlightedIndex;
  if (highlightedIndex != a3)
  {
    if (highlightedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = -[_UIFloatingTabBarPinnedItemsView _itemViewForItemAtIndex:](self, "_itemViewForItemAtIndex:");
      [v6 setHighlighted:0];
    }
    self->_int64_t highlightedIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [(_UIFloatingTabBarPinnedItemsView *)self _itemViewForItemAtIndex:a3];
      [v7 setHighlighted:1];
    }
  }
}

- (CGRect)itemFrameForItemAtIndex:(int64_t)a3
{
  BOOL v3 = [(_UIFloatingTabBarPinnedItemsView *)self itemViewForItemAtIndex:a3];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)itemIndexForItemAtLocation:(CGPoint)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke;
  aBlock[3] = &__block_descriptor_48_e16_B16__0__UIView_8l;
  CGPoint v12 = a3;
  BOOL v4 = _Block_copy(aBlock);
  double v5 = [(_UIFloatingTabBarPinnedItemsView *)self items];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63___UIFloatingTabBarPinnedItemsView_itemIndexForItemAtLocation___block_invoke_2;
  v9[3] = &unk_1E52DF028;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

- (id)_itemViewForItemAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(_UIFloatingTabBarPinnedItemsView *)self items],
        double v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    double v9 = 0;
  }
  else
  {
    int64_t v7 = [(_UIFloatingTabBarPinnedItemsView *)self items];
    double v8 = [v7 objectAtIndex:a3];

    double v9 = [(_UIFloatingTabBarPinnedItemsView *)self _itemViewForItem:v8];
  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v7 = [(_UIFloatingTabBarPinnedItemsView *)self itemViews];
  double v8 = [v7 allValues];

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
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "sizeThatFits:", width, height);
        double v6 = v6 + v13;
        double v5 = fmax(v5, v14);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  double v15 = v6;
  double v16 = v5;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)_UIFloatingTabBarPinnedItemsView;
  [(UIView *)&v29 layoutSubviews];
  BOOL v3 = [(UIView *)self _shouldReverseLayoutDirection];
  BOOL v4 = [(UIView *)self traitCollection];
  double v5 = _UIFloatingTabBarGetPlatformMetrics([v4 userInterfaceIdiom]);
  [v5 backgroundInsets];
  double v7 = v6;
  double v9 = v8;

  [(UIView *)self bounds];
  remainder.origin.x = v10 + 0.0;
  remainder.origin.y = v7 + v11;
  remainder.size.double width = v12;
  remainder.size.double height = v13 - (v7 + v9);
  CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v14;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v15 = [(_UIFloatingTabBarPinnedItemsView *)self items];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    if (v3) {
      CGRectEdge v19 = CGRectMaxXEdge;
    }
    else {
      CGRectEdge v19 = CGRectMinXEdge;
    }
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = [(_UIFloatingTabBarPinnedItemsView *)self _itemViewForItem:*(void *)(*((void *)&v23 + 1) + 8 * v20)];
        objc_msgSend(v21, "sizeThatFits:", remainder.size.width, remainder.size.height);
        CGRectDivide(remainder, &slice, &remainder, v22, v19);
        objc_msgSend(v21, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v17);
  }
}

- (void)reloadItemViewForTab:(id)a3
{
  id v3 = [(_UIFloatingTabBarPinnedItemsView *)self _itemViewForItemAtIndex:[(_UIFloatingTabBarPinnedItemsView *)self itemIndexForTab:a3]];
  [v3 reloadItemView];
}

- (void)_reloadItemViewsWithDifference:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v8 = [v6 removals];
  double v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v11 = [v6 insertions];
  CGFloat v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
  CGSize v14 = [(_UIFloatingTabBarPinnedItemsView *)self items];
  double v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke;
  v33[3] = &unk_1E52DF078;
  id v16 = v6;
  id v34 = v16;
  v35 = self;
  id v17 = v9;
  id v36 = v17;
  id v18 = v12;
  id v37 = v18;
  id v19 = v15;
  id v38 = v19;
  +[UIView performWithoutAnimation:v33];
  objc_storeStrong((id *)&self->_itemViews, v15);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_3;
  aBlock[3] = &unk_1E52D9F98;
  id v20 = v17;
  id v31 = v20;
  id v21 = v18;
  id v32 = v21;
  CGFloat v22 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __76___UIFloatingTabBarPinnedItemsView__reloadItemViewsWithDifference_animated___block_invoke_4;
  v28 = &unk_1E52DC3A0;
  id v23 = v20;
  id v29 = v23;
  long long v24 = (void (**)(void *, uint64_t))_Block_copy(&v25);
  if (v4)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v24, 0.2, v25, v26, v27, v28);
  }
  else
  {
    v22[2](v22);
    v24[2](v24, 1);
  }
}

- (int64_t)itemIndexForTab:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIFloatingTabBarPinnedItemsView *)self items];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52___UIFloatingTabBarPinnedItemsView_itemIndexForTab___block_invoke;
  v9[3] = &unk_1E52DF0A0;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

- (id)tabForSelectionAtItemIndex:(int64_t)a3
{
  double v5 = [(_UIFloatingTabBarPinnedItemsView *)self items];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v9 = 0;
  }
  else
  {
    int64_t v7 = [(_UIFloatingTabBarPinnedItemsView *)self items];
    double v8 = [v7 objectAtIndex:a3];
    double v9 = [v8 tabForSelection];
  }
  return v9;
}

- (id)_itemViewForItem:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIFloatingTabBarPinnedItemsView *)self itemViews];
  unint64_t v6 = [v4 contentTab];

  int64_t v7 = [v6 identifier];
  double v8 = [v5 objectForKey:v7];

  return v8;
}

- (int64_t)selectionViewIndex
{
  return self->_selectionViewIndex;
}

- (int64_t)highlightedIndex
{
  return self->_highlightedIndex;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSMutableDictionary)itemViews
{
  return self->_itemViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end