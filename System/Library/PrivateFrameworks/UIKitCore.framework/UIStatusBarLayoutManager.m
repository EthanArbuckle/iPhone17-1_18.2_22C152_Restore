@interface UIStatusBarLayoutManager
- (BOOL)_processDelta:(double)a3 forView:(id)a4;
- (BOOL)_updateItemView:(id)a3 withData:(id)a4 actions:(int)a5 animated:(BOOL)a6;
- (BOOL)itemIsVisible:(id)a3;
- (BOOL)persistentAnimationsEnabled;
- (BOOL)prepareDoubleHeightItemWithEnabledItems:(BOOL *)a3;
- (BOOL)prepareEnabledItems:(BOOL *)a3 withData:(id)a4 actions:(int)a5;
- (BOOL)updateDoubleHeightItem;
- (BOOL)updateItemsWithData:(id)a3 actions:(int)a4 animated:(BOOL)a5;
- (BOOL)usesVerticalLayout;
- (CGRect)_frameForItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5;
- (CGRect)_repositionedNewFrame:(CGRect)a3 sizeDelta:(double)a4;
- (CGRect)rectForItems:(id)a3;
- (NSNumber)assignedStartPosition;
- (UIStatusBarForegroundView)foregroundView;
- (UIStatusBarLayoutManager)initWithRegion:(int)a3 foregroundView:(id)a4 usesVerticalLayout:(BOOL)a5;
- (double)_dimensionForSize:(CGSize)a3;
- (double)_positionAfterPlacingItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5;
- (double)_sizeNeededForItemView:(id)a3;
- (double)_startPosition;
- (double)distributeOverlap:(double)a3 amongItems:(id)a4;
- (double)removeOverlap:(double)a3 fromItems:(id)a4;
- (double)sizeNeededForItem:(id)a3;
- (double)sizeNeededForItems:(id)a3;
- (id)_createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5;
- (id)_itemViews;
- (id)_itemViewsSortedForLayout;
- (id)_viewForItem:(id)a3;
- (id)itemViewOfType:(int)a3;
- (id)visibleItemViewAtPoint:(CGPoint)a3 inForegroundView:(id)a4;
- (void)_addOriginDelta:(double)a3 toPoint:(CGPoint *)a4;
- (void)_positionNewItemViewsWithEnabledItems:(BOOL *)a3;
- (void)_prepareEnabledItemType:(int)a3 withEnabledItems:(BOOL *)a4 withData:(id)a5 actions:(int)a6 itemAppearing:(BOOL *)a7 itemDisappearing:(BOOL *)a8;
- (void)_setOrigin:(double)a3 forPoint:(CGPoint *)a4;
- (void)clearOverlapFromItems:(id)a3;
- (void)dealloc;
- (void)itemView:(id)a3 sizeChangedBy:(double)a4;
- (void)makeVisibleItemsPerformPendedActions;
- (void)positionInvisibleItems;
- (void)reflowWithVisibleItems:(id)a3 duration:(double)a4;
- (void)removeDisabledItems:(BOOL *)a3;
- (void)setAssignedStartPosition:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setPersistentAnimationsEnabled:(BOOL)a3;
- (void)setVisibilityOfAllItems:(BOOL)a3;
- (void)setVisibilityOfItem:(id)a3 visible:(BOOL)a4;
- (void)setVisibilityOfItemType:(int)a3 visible:(BOOL)a4;
@end

@implementation UIStatusBarLayoutManager

- (UIStatusBarLayoutManager)initWithRegion:(int)a3 foregroundView:(id)a4 usesVerticalLayout:(BOOL)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarLayoutManager;
  v9 = [(UIStatusBarLayoutManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_region = a3;
    objc_storeWeak((id *)&v9->_foregroundView, v8);
    v10->_usesVerticalLayout = a5;
  }

  return v10;
}

- (void)dealloc
{
  for (uint64_t i = 16; i != 432; i += 8)
  {
    [*(id *)((char *)&self->super.isa + i) setLayoutManager:0];
    [*(id *)((char *)&self->super.isa + i) removeFromSuperview];
    v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarLayoutManager;
  [(UIStatusBarLayoutManager *)&v5 dealloc];
}

- (double)_dimensionForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UIStatusBarLayoutManager *)self usesVerticalLayout]) {
    return height;
  }
  else {
    return width;
  }
}

- (void)_setOrigin:(double)a3 forPoint:(CGPoint *)a4
{
  BOOL v6 = [(UIStatusBarLayoutManager *)self usesVerticalLayout];
  uint64_t v7 = 8;
  if (!v6) {
    uint64_t v7 = 0;
  }
  *(double *)((char *)&a4->x + v7) = a3;
}

- (void)_addOriginDelta:(double)a3 toPoint:(CGPoint *)a4
{
  BOOL v6 = [(UIStatusBarLayoutManager *)self usesVerticalLayout];
  uint64_t v7 = 8;
  if (!v6) {
    uint64_t v7 = 0;
  }
  *(double *)((char *)&a4->x + v7) = *(double *)((char *)&a4->x + v7) + a3;
}

- (BOOL)prepareEnabledItems:(BOOL *)a3 withData:(id)a4 actions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = 0;
  BOOL v10 = 0;
  BOOL v11 = 0;
  do
  {
    __int16 v14 = 0;
    [(UIStatusBarLayoutManager *)self _prepareEnabledItemType:v9 withEnabledItems:a3 withData:a4 actions:v5 itemAppearing:(char *)&v14 + 1 itemDisappearing:&v14];
    char v12 = HIBYTE(v14) | v11;
    BOOL v11 = v12 != 0;
    BOOL v10 = (v14 | v10) != 0;
    uint64_t v9 = (v9 + 1);
  }
  while (v9 != 52);
  if (v12)
  {
    [(UIStatusBarLayoutManager *)self _positionNewItemViewsWithEnabledItems:a3];
    return 1;
  }
  return v10;
}

- (void)setVisibilityOfAllItems:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(UIStatusBarLayoutManager *)self _itemViews];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setVisible:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setVisibilityOfItem:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 type];
  [(UIStatusBarLayoutManager *)self setVisibilityOfItemType:v6 visible:v4];
}

- (void)setVisibilityOfItemType:(int)a3 visible:(BOOL)a4
{
  BOOL v4 = self->_itemViews[a3];
  if (v4) {
    [(UIStatusBarItemView *)v4 setVisible:a4];
  }
}

- (BOOL)updateItemsWithData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = [(UIStatusBarLayoutManager *)self _itemViews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 |= [(UIStatusBarLayoutManager *)self _updateItemView:*(void *)(*((void *)&v16 + 1) + 8 * i) withData:v8 actions:v6 animated:v5];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12 & 1;
}

- (void)_prepareEnabledItemType:(int)a3 withEnabledItems:(BOOL *)a4 withData:(id)a5 actions:(int)a6 itemAppearing:(BOOL *)a7 itemDisappearing:(BOOL *)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a3;
  id v20 = a5;
  uint64_t v14 = self->_itemViews[v12];
  v15 = v14;
  if (a4[v12])
  {
    if (v14)
    {
      [(UIStatusBarItemView *)v14 setAllowsUpdates:1];
    }
    else
    {
      long long v17 = [(UIStatusBarLayoutManager *)self foregroundView];
      long long v18 = +[UIStatusBarItem itemWithType:idiom:](UIStatusBarItem, "itemWithType:idiom:", v12, [v17 idiom]);

      if ([v18 appearsInRegion:self->_region])
      {
        id v19 = [(UIStatusBarLayoutManager *)self _createViewForItem:v18 withData:v20 actions:v10];
        if (a7) {
          *a7 = 1;
        }
      }
    }
  }
  else if (v14)
  {
    [(UIStatusBarItemView *)v14 setAllowsUpdates:0];
    BOOL v16 = [(UIStatusBarItemView *)v15 isVisible];
    if (a8)
    {
      if (v16) {
        *a8 = 1;
      }
    }
  }
}

- (void)_positionNewItemViewsWithEnabledItems:(BOOL *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(UIStatusBarLayoutManager *)self _startPosition];
  double v6 = v5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [(UIStatusBarLayoutManager *)self _itemViewsSortedForLayout];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 superview];

        if (!v14)
        {
          [v13 setVisible:0];
          [(UIStatusBarLayoutManager *)self _frameForItemView:v13 startPosition:v11 & 1 firstView:v6];
          objc_msgSend(v13, "setFrame:");
          id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
          [WeakRetained addSubview:v13];
        }
        BOOL v16 = [v13 item];
        int v17 = [v16 type];

        if (a3[v17])
        {
          [(UIStatusBarLayoutManager *)self _positionAfterPlacingItemView:v13 startPosition:v11 & 1 firstView:v6];
          double v6 = v18;
          char v11 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (BOOL)_processDelta:(double)a3 forView:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 0;
  if (a3 != 0.0)
  {
    [v6 frame];
    -[UIStatusBarLayoutManager _repositionedNewFrame:sizeDelta:](self, "_repositionedNewFrame:sizeDelta:");
    objc_msgSend(v7, "setFrame:");
    if ([v7 isVisible]) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_updateItemView:(id)a3 withData:(id)a4 actions:(int)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = +[UIView areAnimationsEnabled];
  if (v6 && ([v10 animatesDataChange] & 1) == 0) {
    +[UIView setAnimationsEnabled:0];
  }
  [v10 setStatusBarData:v11 actions:v7];
  BOOL v13 = -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v10);
  +[UIView setAnimationsEnabled:v12];

  return v13;
}

- (BOOL)prepareDoubleHeightItemWithEnabledItems:(BOOL *)a3
{
  __int16 v7 = 0;
  [(UIStatusBarLayoutManager *)self _prepareEnabledItemType:23 withEnabledItems:a3 withData:0 actions:0 itemAppearing:(char *)&v7 + 1 itemDisappearing:&v7];
  char v5 = HIBYTE(v7);
  if (HIBYTE(v7))
  {
    [(UIStatusBarLayoutManager *)self _positionNewItemViewsWithEnabledItems:a3];
    char v5 = HIBYTE(v7) != 0;
  }
  if ((_BYTE)v7) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)updateDoubleHeightItem
{
  return [(UIStatusBarLayoutManager *)self _updateItemView:self->_itemViews[23] withData:0 actions:0 animated:0];
}

- (void)reflowWithVisibleItems:(id)a3 duration:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(UIStatusBarLayoutManager *)self _startPosition];
  double v7 = v6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v8 = [(UIStatusBarLayoutManager *)self _itemViewsSortedForLayout];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = [v14 item];
        uint64_t v16 = [v5 containsObject:v15];

        if (v16) {
          [(UIStatusBarLayoutManager *)self _frameForItemView:v14 startPosition:v12 & 1 firstView:v7];
        }
        else {
          [v14 frame];
        }
        objc_msgSend(v14, "setVisible:frame:duration:", v16);
        if (v16)
        {
          [(UIStatusBarLayoutManager *)self _positionAfterPlacingItemView:v14 startPosition:v12 & 1 firstView:v7];
          double v7 = v17;
          char v12 = 0;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)removeDisabledItems:(BOOL *)a3
{
  uint64_t v4 = 0;
  itemViews = self->_itemViews;
  do
  {
    double v6 = itemViews[v4];
    double v7 = v6;
    BOOL v8 = a3[v4] || v6 == 0;
    if (!v8 && ![(UIStatusBarItemView *)v6 isVisible])
    {
      [(UIView *)v7 removeFromSuperview];
      uint64_t v9 = itemViews[v4];
      itemViews[v4] = 0;
    }
    ++v4;
  }
  while (v4 != 52);
}

- (void)positionInvisibleItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(UIStatusBarLayoutManager *)self _startPosition];
  double v4 = v3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(UIStatusBarLayoutManager *)self _itemViewsSortedForLayout];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v11 isVisible] & 1) == 0)
        {
          [(UIStatusBarLayoutManager *)self _frameForItemView:v11 startPosition:v9 & 1 firstView:v4];
          objc_msgSend(v11, "setFrame:");
        }
        [(UIStatusBarLayoutManager *)self _positionAfterPlacingItemView:v11 startPosition:v9 & 1 firstView:v4];
        double v4 = v12;
        char v9 = 0;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      char v9 = 0;
    }
    while (v7);
  }
}

- (void)makeVisibleItemsPerformPendedActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UIStatusBarLayoutManager *)self _itemViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isVisible]) {
          [v7 performPendedActions];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (double)sizeNeededForItem:(id)a3
{
  uint64_t v4 = [(UIStatusBarLayoutManager *)self _viewForItem:a3];
  [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v4];
  double v6 = v5;

  return v6;
}

- (double)sizeNeededForItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [(UIStatusBarLayoutManager *)self sizeNeededForItem:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        double v8 = v8 + v10;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)clearOverlapFromItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [(UIStatusBarLayoutManager *)self _viewForItem:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 setCurrentOverlap:0.0];
        [v9 resetContentOverlap];
        -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v9);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (double)distributeOverlap:(double)a3 amongItems:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = 0.0;
  do
  {
    if (v7 >= a3) {
      break;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (!v8) {
      break;
    }
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = [(UIStatusBarLayoutManager *)self _viewForItem:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v13 currentOverlap];
        double v15 = v14;
        [v13 maximumOverlap];
        if (v16 > v15 && v7 < a3)
        {
          [v13 setCurrentOverlap:v15 + 1.0];
          double v7 = v7 + 1.0;
          char v10 = 1;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }
  while ((v10 & 1) != 0);
  if (v7 < a3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(void *)(*((void *)&v27 + 1) + 8 * j), (void)v27);
          [v23 addContentOverlap:a3 - v7];
          double v25 = v24;
          -[UIStatusBarLayoutManager _processDelta:forView:](self, "_processDelta:forView:", v23);
          double v7 = v7 - v25;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v20);
    }
  }
  return v7;
}

- (double)removeOverlap:(double)a3 fromItems:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = 0.0;
  do
  {
    if (v7 >= a3) {
      break;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v8) {
      break;
    }
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = [(UIStatusBarLayoutManager *)self _viewForItem:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v13 currentOverlap];
        if (v14 > 0.0 && v7 < a3)
        {
          [v13 setCurrentOverlap:v14 + -1.0];
          double v7 = v7 + 1.0;
          char v10 = 1;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  while ((v10 & 1) != 0);

  return v7;
}

- (CGRect)rectForItems:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __41__UIStatusBarLayoutManager_rectForItems___block_invoke;
  v34[3] = &unk_1E5307F68;
  v34[4] = self;
  [v4 sortUsingComparator:v34];
  [(UIStatusBarLayoutManager *)self _startPosition];
  double v6 = v5;
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v33.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v33.size = v7;
  [(UIStatusBarLayoutManager *)self _setOrigin:&v33 forPoint:v5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    char v12 = 1;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = -[UIStatusBarLayoutManager _viewForItem:](self, "_viewForItem:", *(void *)(*((void *)&v29 + 1) + 8 * v13), (void)v29);
        uint64_t v15 = v12 & 1;
        [(UIStatusBarLayoutManager *)self _frameForItemView:v14 startPosition:v15 firstView:v6];
        v39.origin.CGFloat x = v16;
        v39.origin.CGFloat y = v17;
        v39.size.CGFloat width = v18;
        v39.size.CGFloat height = v19;
        CGRect v33 = CGRectUnion(v33, v39);
        [(UIStatusBarLayoutManager *)self _positionAfterPlacingItemView:v14 startPosition:v15 firstView:v6];
        double v6 = v20;

        char v12 = 0;
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v35 count:16];
      char v12 = 0;
    }
    while (v10);
  }

  CGRect v37 = CGRectStandardize(v33);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

uint64_t __41__UIStatusBarLayoutManager_rectForItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
  if (v7 == 2)
  {
    uint64_t v8 = [v5 compareCenterOrder:v6];
  }
  else if (v7 == 1)
  {
    uint64_t v8 = [v5 compareRightOrder:v6];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [v5 compareLeftOrder:v6];
  }
  uint64_t v9 = v8;
LABEL_9:

  return v9;
}

- (BOOL)itemIsVisible:(id)a3
{
  uint64_t v3 = [(UIStatusBarLayoutManager *)self _viewForItem:a3];
  char v4 = [v3 isVisible];

  return v4;
}

- (void)itemView:(id)a3 sizeChangedBy:(double)a4
{
  id v5 = a3;
  [v5 frame];
  -[UIStatusBarLayoutManager _repositionedNewFrame:sizeDelta:](self, "_repositionedNewFrame:sizeDelta:");
  objc_msgSend(v5, "setFrame:");
  int v6 = [v5 isVisible];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
    [WeakRetained reflowItemViews:1];
  }
}

- (double)_sizeNeededForItemView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 frame];
    -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v5, v6);
    double v8 = v7;
    [v4 standardPadding];
    double v10 = v8 + v9;
    [v4 extraLeftPadding];
    double v12 = v10 + v11;
    [v4 extraRightPadding];
    double v14 = v12 + v13;
    [v4 currentOverlap];
    double v16 = v14 - v15;
    [v4 shadowPadding];
    double v18 = v17;

    double v19 = v16 - (v18 + v18);
  }
  else
  {
    double v19 = 0.0;
  }
  return ceil(v19);
}

- (id)_viewForItem:(id)a3
{
  uint64_t v3 = self->_itemViews[[a3 type]];
  return v3;
}

- (id)_createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = [v9 type];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  double v12 = [WeakRetained foregroundStyle];
  id v13 = +[UIStatusBarItemView createViewForItem:v9 withData:v8 actions:v5 foregroundStyle:v12];

  [v13 setLayoutManager:self];
  [v13 setPersistentAnimationsEnabled:self->_persistentAnimationsEnabled];
  objc_storeStrong((id *)&self->_itemViews[v10], v13);
  if (self->_region == 1)
  {
    BOOL v14 = ![(UIStatusBarLayoutManager *)self usesVerticalLayout];
    uint64_t v15 = 8;
    uint64_t v16 = 6;
  }
  else
  {
    BOOL v14 = ![(UIStatusBarLayoutManager *)self usesVerticalLayout];
    uint64_t v15 = 7;
    uint64_t v16 = 5;
  }
  if (v14) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v16;
  }
  [v13 setContentMode:v17];
  return v13;
}

- (id)_itemViews
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 16; i != 432; i += 8)
  {
    if (*(Class *)((char *)&self->super.isa + i)) {
      objc_msgSend(v3, "addObject:");
    }
  }
  return v3;
}

- (id)_itemViewsSortedForLayout
{
  uint64_t v3 = [(UIStatusBarLayoutManager *)self _itemViews];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__UIStatusBarLayoutManager__itemViewsSortedForLayout__block_invoke;
  v5[3] = &unk_1E5307F90;
  v5[4] = self;
  [v3 sortUsingComparator:v5];
  return v3;
}

uint64_t __53__UIStatusBarLayoutManager__itemViewsSortedForLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  double v6 = [a2 item];
  double v7 = [v5 item];

  int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
  if (v8 == 2)
  {
    uint64_t v9 = [v6 compareCenterOrder:v7];
  }
  else if (v8 == 1)
  {
    uint64_t v9 = [v6 compareRightOrder:v7];
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = [v6 compareLeftOrder:v7];
  }
  uint64_t v10 = v9;
LABEL_9:

  return v10;
}

- (double)_startPosition
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  [WeakRetained bounds];
  -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v4, v5);
  double v7 = v6;
  int region = self->_region;
  if (region == 2)
  {
    double v9 = v6 * 0.5;
    if ([(UIStatusBarLayoutManager *)self usesVerticalLayout])
    {
      double v11 = [(UIStatusBarLayoutManager *)self assignedStartPosition];

      if (v11)
      {
        double v12 = [(UIStatusBarLayoutManager *)self assignedStartPosition];
        [v12 floatValue];
      }
      id v13 = [(UIStatusBarLayoutManager *)self _itemViewsSortedForLayout];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        double v17 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            double v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v19 isVisible])
            {
              [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v19];
              double v17 = v17 + v20;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v15);
      }
      uint64_t v22 = [v13 lastObject];
      [v22 standardPadding];
      uint64_t v23 = [v13 lastObject];
      [v23 extraRightPadding];

      double v24 = +[UIScreen _carScreen];
      UIRoundToScreenScale(v24);
      double v9 = v25;
    }
  }
  else if (region == 1)
  {
    [WeakRetained rightEdgePadding];
    double v9 = v7 - v21;
  }
  else
  {
    double v9 = 0.0;
    if (!region)
    {
      [WeakRetained leftEdgePadding];
      double v9 = v10;
    }
  }

  return floor(v9);
}

- (CGRect)_frameForItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = v8;
  if (v8)
  {
    [v8 frame];
    double v11 = v10;
    double v13 = v12;
    v42.CGFloat x = v14;
    v42.CGFloat y = v15;
    *(double *)&long long v43 = v10;
    *((double *)&v43 + 1) = v12;
  }
  else
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v42 = (CGPoint)*MEMORY[0x1E4F1DB28];
    long long v43 = v16;
    double v13 = *((double *)&v16 + 1);
    double v11 = *(double *)&v16;
  }
  -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v11, v13, v42);
  double v18 = v17;
  int64_t v19 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
  if (v19 && ![(UIStatusBarLayoutManager *)self usesVerticalLayout])
  {
    [v9 extraRightPadding];
    double v21 = v23;
    [v9 extraLeftPadding];
  }
  else
  {
    [v9 extraLeftPadding];
    double v21 = v20;
    [v9 extraRightPadding];
  }
  double v24 = v22;
  int region = self->_region;
  switch(region)
  {
    case 2:
      if ([(UIStatusBarLayoutManager *)self usesVerticalLayout])
      {
        [v9 extraLeftPadding];
        double v27 = v28 + a4;
        goto LABEL_18;
      }
      if (v5)
      {
        double v29 = a4 - floor(v18 * 0.5) + 2.0;
LABEL_20:
        [(UIStatusBarLayoutManager *)self _setOrigin:&v42 forPoint:v29];
        double v13 = *((double *)&v43 + 1);
        double v11 = *(double *)&v43;
        break;
      }
      if (v19)
      {
        double v27 = v24 + a4;
        goto LABEL_18;
      }
LABEL_19:
      [v9 currentRightOverlap];
      double v32 = a4 - (v18 + v24) + v31;
      [v9 shadowPadding];
      double v29 = v32 + v33;
      goto LABEL_20;
    case 1:
      goto LABEL_19;
    case 0:
      [v9 currentLeftOverlap];
      double v27 = v21 + a4 - v26;
LABEL_18:
      [v9 shadowPadding];
      double v29 = v27 - v30;
      goto LABEL_20;
  }
  v44.origin = v42;
  v44.size.CGFloat width = v11;
  v44.size.CGFloat height = v13;
  CGRect v45 = CGRectIntegral(v44);
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;

  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (double)_positionAfterPlacingItemView:(id)a3 startPosition:(double)a4 firstView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = v8;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v8)
  {
    [v8 frame];
    -[UIStatusBarLayoutManager _dimensionForSize:](self, "_dimensionForSize:", v12, v13);
    double v11 = v14 * 0.5;
  }
  int64_t v15 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
  int region = self->_region;
  if (region != 2)
  {
    if (region != 1)
    {
      if (region) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v9];
LABEL_11:
    double v10 = a4 - v18;
    goto LABEL_12;
  }
  int64_t v17 = v15;
  if ([(UIStatusBarLayoutManager *)self usesVerticalLayout])
  {
LABEL_8:
    [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v9];
LABEL_9:
    double v10 = v18 + a4;
    goto LABEL_12;
  }
  if (!v5)
  {
    [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v9];
    if (v17) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
  double v20 = floor(v11);
  [(UIStatusBarLayoutManager *)self _sizeNeededForItemView:v9];
  if (v17) {
    double v10 = a4 - v20 + v21;
  }
  else {
    double v10 = v20 + a4 - v21;
  }
LABEL_12:

  return floor(v10);
}

- (CGRect)_repositionedNewFrame:(CGRect)a3 sizeDelta:(double)a4
{
  CGRect v5 = a3;
  int region = self->_region;
  if (region == 1) {
    goto LABEL_4;
  }
  if (region == 2)
  {
    a4 = floor(a4 * 0.5);
LABEL_4:
    [(UIStatusBarLayoutManager *)self _addOriginDelta:&v5 toPoint:-a4];
    a3 = v5;
  }
  return CGRectIntegral(a3);
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_persistentAnimationsEnabled != a3)
  {
    BOOL v3 = a3;
    self->_persistentAnimationsEnabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v4 = [(UIStatusBarLayoutManager *)self _itemViews];
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
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPersistentAnimationsEnabled:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)itemViewOfType:(int)a3
{
  return self->_itemViews[a3];
}

- (id)visibleItemViewAtPoint:(CGPoint)a3 inForegroundView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = [(UIStatusBarLayoutManager *)self foregroundView];

  if (v9 != v8)
  {
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"UIStatusBarLayoutManager.m", 620, @"%s passed bogus foreground view %@", sel_getName(a2), v8 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  long long v11 = [WeakRetained foregroundStyle];
  [v11 standardPadding];
  double v13 = v12;

  id v14 = 0;
  double v15 = 1.79769313e308;
  for (uint64_t i = 16; i != 432; i += 8)
  {
    id v17 = *(id *)((char *)&self->super.isa + i);
    id v18 = [v17 superview];
    if (v18 != v8) {
      goto LABEL_12;
    }
    if (![v17 isVisible])
    {
      id v18 = v8;
LABEL_12:
      double v27 = v15;
LABEL_13:

      double v15 = v27;
      goto LABEL_14;
    }
    [v17 frame];
    IsEmptdouble y = CGRectIsEmpty(v33);

    if (!IsEmpty)
    {
      objc_msgSend(v8, "convertPoint:toView:", v17, x, y);
      double v21 = v20;
      if (objc_msgSend(v17, "pointInside:withEvent:", 0)) {
        goto LABEL_24;
      }
      [v17 bounds];
      double MinX = CGRectGetMinX(v34);
      [v17 bounds];
      if (v21 <= MinX)
      {
        double v27 = CGRectGetMinX(*(CGRect *)&v23) - v21;
      }
      else if (v21 >= CGRectGetMaxX(*(CGRect *)&v23))
      {
        [v17 bounds];
        double v27 = v21 - CGRectGetMaxX(v35);
      }
      else
      {
        double v27 = 1.79769313e308;
      }
      if (v27 < v13 && v27 < v15)
      {
        id v29 = v17;
        id v18 = v14;
        id v14 = v29;
        goto LABEL_13;
      }
    }
LABEL_14:
  }
  id v14 = v14;
  id v17 = v14;
LABEL_24:

  return v17;
}

- (UIStatusBarForegroundView)foregroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_foregroundView);
  return (UIStatusBarForegroundView *)WeakRetained;
}

- (void)setForegroundView:(id)a3
{
}

- (BOOL)persistentAnimationsEnabled
{
  return self->_persistentAnimationsEnabled;
}

- (BOOL)usesVerticalLayout
{
  return self->_usesVerticalLayout;
}

- (NSNumber)assignedStartPosition
{
  return self->_assignedStartPosition;
}

- (void)setAssignedStartPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignedStartPosition, 0);
  objc_destroyWeak((id *)&self->_foregroundView);
  for (uint64_t i = 424; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end