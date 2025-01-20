@interface SUUIFlexibleSegmentedControl
- (BOOL)sizesSegmentsToFitWidth;
- (CGRect)frameForSegmentWithIndex:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)itemTitles;
- (NSString)moreListTitle;
- (SUUIFlexibleSegmentedControl)initWithFrame:(CGRect)a3;
- (SUUIFlexibleSegmentedControlDelegate)delegate;
- (double)desiredSegmentWidth;
- (int64_t)maximumNumberOfVisibleItems;
- (int64_t)moreListIndex;
- (int64_t)selectedSegmentIndex;
- (void)_configureSegmentedControl:(id)a3 withTitles:(id)a4 boundingSize:(CGSize)a5;
- (void)_setTitles:(id)a3 forSegmentedControl:(id)a4;
- (void)_valueChangeAction:(id)a3;
- (void)cancelMoreList;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDesiredSegmentWidth:(double)a3;
- (void)setItemTitles:(id)a3;
- (void)setMaximumNumberOfVisibleItems:(int64_t)a3;
- (void)setMoreListTitle:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setSizesSegmentsToFitWidth:(BOOL)a3;
@end

@implementation SUUIFlexibleSegmentedControl

- (SUUIFlexibleSegmentedControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIFlexibleSegmentedControl;
  v3 = -[SUUIFlexibleSegmentedControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_maximumNumberOfVisibleItems = 0x7FFFFFFFFFFFFFFFLL;
    v3->_previousSelectedSegmentIndex = -1;
    v5 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x263F82BB0]);
    segmentedControl = v4->_segmentedControl;
    v4->_segmentedControl = v5;

    [(UISegmentedControl *)v4->_segmentedControl addTarget:v4 action:sel__valueChangeAction_ forControlEvents:4096];
    [(UISegmentedControl *)v4->_segmentedControl setSemanticContentAttribute:storeSemanticContentAttribute()];
    [(SUUIFlexibleSegmentedControl *)v4 addSubview:v4->_segmentedControl];
  }
  return v4;
}

- (void)dealloc
{
  [(UISegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:64];
  v3.receiver = self;
  v3.super_class = (Class)SUUIFlexibleSegmentedControl;
  [(SUUIFlexibleSegmentedControl *)&v3 dealloc];
}

- (void)cancelMoreList
{
  if (self->_isMoreListSelected)
  {
    self->_isMoreListSelected = 0;
    self->_selectedSegmentIndex = self->_previousSelectedSegmentIndex;
    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (CGRect)frameForSegmentWithIndex:(int64_t)a3
{
  v5 = (double *)MEMORY[0x263F001A8];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  int64_t v7 = [(UISegmentedControl *)self->_segmentedControl numberOfSegments];
  if (v7 <= a3)
  {
    double v18 = *v5;
    double v17 = v5[2];
    CGFloat v16 = v5[3];
  }
  else
  {
    uint64_t v8 = v7;
    [(UISegmentedControl *)self->_segmentedControl frame];
    double v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    *(float *)&double v9 = v13 / (double)v8;
    double v17 = floorf(*(float *)&v9);
    double v18 = v10 + (double)a3 * v17;
    if (storeShouldReverseLayoutDirection())
    {
      v25.origin.x = v10;
      v25.origin.y = v12;
      v25.size.width = v14;
      v25.size.height = v16;
      double MaxX = CGRectGetMaxX(v25);
      v26.origin.x = v18;
      v26.origin.y = v6;
      v26.size.width = v17;
      v26.size.height = v16;
      double v20 = MaxX - CGRectGetWidth(v26);
      v27.origin.x = v18;
      v27.origin.y = v6;
      v27.size.width = v17;
      v27.size.height = v16;
      double v18 = v20 - CGRectGetMinX(v27);
    }
    CGFloat v6 = v12;
  }
  double v21 = v18;
  double v22 = v6;
  double v23 = v17;
  double v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (int64_t)moreListIndex
{
  unint64_t v3 = [(UISegmentedControl *)self->_segmentedControl numberOfSegments];
  if (v3 >= [(NSArray *)self->_itemTitles count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v3 - 1;
  }
}

- (int64_t)selectedSegmentIndex
{
  int64_t previousSelectedSegmentIndex = self->_previousSelectedSegmentIndex;
  if (previousSelectedSegmentIndex == -1) {
    return self->_selectedSegmentIndex;
  }
  return previousSelectedSegmentIndex;
}

- (void)setDesiredSegmentWidth:(double)a3
{
  if (self->_desiredSegmentWidth != a3)
  {
    self->_desiredSegmentWidth = a3;
    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setSizesSegmentsToFitWidth:(BOOL)a3
{
  if (self->_sizesSegmentsToFitWidth != a3)
  {
    self->_sizesSegmentsToFitWidth = a3;
    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setItemTitles:(id)a3
{
  if (self->_itemTitles != a3)
  {
    v4 = (NSArray *)[a3 copy];
    itemTitles = self->_itemTitles;
    self->_itemTitles = v4;

    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setMaximumNumberOfVisibleItems:(int64_t)a3
{
  if (self->_maximumNumberOfVisibleItems != a3)
  {
    self->_maximumNumberOfVisibleItems = a3;
    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setMoreListTitle:(id)a3
{
  if (self->_moreListTitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    moreListTitle = self->_moreListTitle;
    self->_moreListTitle = v4;

    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  int64_t selectedSegmentIndex = self->_selectedSegmentIndex;
  if (selectedSegmentIndex != a3)
  {
    self->_isMoreListSelected = 0;
    self->_int64_t previousSelectedSegmentIndex = selectedSegmentIndex;
    self->_int64_t selectedSegmentIndex = a3;
    [(SUUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIFlexibleSegmentedControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__SUUIFlexibleSegmentedControl_layoutSubviews__block_invoke;
  v18[3] = &unk_265400B40;
  v18[4] = self;
  v18[5] = v7;
  v18[6] = v8;
  *(double *)&v18[7] = v3;
  *(double *)&v18[8] = v5;
  [MEMORY[0x263F82E00] performWithoutAnimation:v18];
  [(UISegmentedControl *)self->_segmentedControl frame];
  float v10 = (v4 - v9) * 0.5;
  float v12 = (v6 - v11) * 0.5;
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", floorf(v10), floorf(v12));
  unint64_t v13 = [(SUUIFlexibleSegmentedControl *)self moreListIndex];
  segmentedControl = self->_segmentedControl;
  if (self->_isMoreListSelected)
  {
    int64_t selectedSegmentIndex = v13;
  }
  else
  {
    unint64_t v16 = [(UISegmentedControl *)segmentedControl numberOfSegments];
    if (v13 >= v16) {
      int64_t v17 = v16;
    }
    else {
      int64_t v17 = v13;
    }
    int64_t selectedSegmentIndex = self->_selectedSegmentIndex;
    segmentedControl = self->_segmentedControl;
    if (selectedSegmentIndex >= v17) {
      int64_t selectedSegmentIndex = -1;
    }
  }
  [(UISegmentedControl *)segmentedControl setSelectedSegmentIndex:selectedSegmentIndex];
}

uint64_t __46__SUUIFlexibleSegmentedControl_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSegmentedControl:withTitles:boundingSize:", *(void *)(*(void *)(a1 + 32) + 464), *(void *)(*(void *)(a1 + 32) + 432), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x263F82BB0]);
  -[SUUIFlexibleSegmentedControl _configureSegmentedControl:withTitles:boundingSize:](self, "_configureSegmentedControl:withTitles:boundingSize:", v6, self->_itemTitles, width, height);
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_valueChangeAction:(id)a3
{
  self->_int64_t previousSelectedSegmentIndex = self->_selectedSegmentIndex;
  self->_int64_t selectedSegmentIndex = [a3 selectedSegmentIndex];
  int64_t v4 = [(SUUIFlexibleSegmentedControl *)self moreListIndex];
  int64_t selectedSegmentIndex = self->_selectedSegmentIndex;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (selectedSegmentIndex == v4)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = -[NSArray subarrayWithRange:](self->_itemTitles, "subarrayWithRange:", v4, [(NSArray *)self->_itemTitles count] - v4);
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 segmentedControl:self showMoreListWithTitles:v8];
    }
    self->_isMoreListSelected = 1;
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 segmentedControl:self didSelectSegmentIndex:self->_selectedSegmentIndex];
    }
  }
}

- (void)_configureSegmentedControl:(id)a3 withTitles:(id)a4 boundingSize:(CGSize)a5
{
  double width = a5.width;
  id v35 = a3;
  id v8 = a4;
  id v9 = (void *)[v8 mutableCopy];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v11 = [v9 count];
  if (self->_moreListTitle
    && (int64_t maximumNumberOfVisibleItems = self->_maximumNumberOfVisibleItems,
        uint64_t v13 = v11 - maximumNumberOfVisibleItems,
        v11 > maximumNumberOfVisibleItems))
  {
    int64_t v14 = maximumNumberOfVisibleItems - 1;
    uint64_t v15 = v13 + 1;
    unint64_t v16 = objc_msgSend(v9, "subarrayWithRange:", maximumNumberOfVisibleItems - 1, v13 + 1);
    [v10 addObjectsFromArray:v16];

    objc_msgSend(v9, "removeObjectsInRange:", v14, v15);
    [v9 addObject:self->_moreListTitle];
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  double v18 = *(double *)(MEMORY[0x263F00190] + 16);
  double v19 = *(double *)(MEMORY[0x263F00190] + 24);
  while (1)
  {
    [(SUUIFlexibleSegmentedControl *)self _setTitles:v9 forSegmentedControl:v35];
    objc_msgSend(v35, "sizeThatFits:", v18, v19);
    double v21 = v20;
    double v23 = v22;
    uint64_t v24 = [v9 count];
    if (v24 == 1 || v21 + (float)((float)v24 * -10.0) <= width || !self->_moreListTitle) {
      break;
    }
    if (v17)
    {
      uint64_t v25 = v24 - 2;
      CGRect v26 = [v9 objectAtIndex:v24 - 2];
      [v10 addObject:v26];

      [v9 removeObjectAtIndex:v25];
      char v17 = 1;
    }
    else
    {
      CGRect v27 = [v9 lastObject];
      [v10 addObject:v27];

      [v9 removeLastObject];
      char v17 = 1;
      if (self->_moreListTitle) {
        objc_msgSend(v9, "addObject:");
      }
    }
  }
  double desiredSegmentWidth = self->_desiredSegmentWidth;
  if (desiredSegmentWidth > 0.00000011920929)
  {
    double v29 = desiredSegmentWidth * (double)v24;
    if (self->_sizesSegmentsToFitWidth) {
      double v29 = width;
    }
    if (v21 < v29) {
      double v21 = v29;
    }
  }
  if (v21 >= width) {
    double v30 = width;
  }
  else {
    double v30 = v21;
  }
  objc_msgSend(v35, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v30, v23);
  v31 = [v9 lastObject];
  v32 = v31;
  if (v31 == self->_moreListTitle)
  {
    uint64_t v33 = [v10 count];

    if (v33 == 1)
    {
      [v9 removeLastObject];
      v34 = [v10 firstObject];
      [v9 addObject:v34];

      [(SUUIFlexibleSegmentedControl *)self _setTitles:v9 forSegmentedControl:v35];
    }
  }
  else
  {
  }
}

- (void)_setTitles:(id)a3 forSegmentedControl:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 removeAllSegments];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SUUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke;
  v8[3] = &unk_265407BD0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __63__SUUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSegmentWithTitle:a2 atIndex:a3 animated:0];
}

- (SUUIFlexibleSegmentedControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIFlexibleSegmentedControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)desiredSegmentWidth
{
  return self->_desiredSegmentWidth;
}

- (NSArray)itemTitles
{
  return self->_itemTitles;
}

- (int64_t)maximumNumberOfVisibleItems
{
  return self->_maximumNumberOfVisibleItems;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (BOOL)sizesSegmentsToFitWidth
{
  return self->_sizesSegmentsToFitWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_moreListTitle, 0);
  objc_storeStrong((id *)&self->_itemTitles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end