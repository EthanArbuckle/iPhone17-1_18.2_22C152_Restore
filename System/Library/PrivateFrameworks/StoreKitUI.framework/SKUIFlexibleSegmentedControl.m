@interface SKUIFlexibleSegmentedControl
- (BOOL)sizesSegmentsToFitWidth;
- (CGRect)frameForSegmentWithIndex:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)itemTitles;
- (NSString)moreListTitle;
- (SKUIFlexibleSegmentedControl)initWithFrame:(CGRect)a3;
- (SKUIFlexibleSegmentedControlDelegate)delegate;
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

@implementation SKUIFlexibleSegmentedControl

- (SKUIFlexibleSegmentedControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIFlexibleSegmentedControl initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIFlexibleSegmentedControl;
  v8 = -[SKUIFlexibleSegmentedControl initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_maximumNumberOfVisibleItems = 0x7FFFFFFFFFFFFFFFLL;
    v8->_previousSelectedSegmentIndedouble x = -1;
    v10 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segmentedControl = v9->_segmentedControl;
    v9->_segmentedControl = v10;

    [(UISegmentedControl *)v9->_segmentedControl addTarget:v9 action:sel__valueChangeAction_ forControlEvents:4096];
    [(UISegmentedControl *)v9->_segmentedControl setSemanticContentAttribute:storeSemanticContentAttribute()];
    [(SKUIFlexibleSegmentedControl *)v9 addSubview:v9->_segmentedControl];
  }
  return v9;
}

- (void)dealloc
{
  [(UISegmentedControl *)self->_segmentedControl removeTarget:self action:0 forControlEvents:64];
  v3.receiver = self;
  v3.super_class = (Class)SKUIFlexibleSegmentedControl;
  [(SKUIFlexibleSegmentedControl *)&v3 dealloc];
}

- (void)cancelMoreList
{
  if (self->_isMoreListSelected)
  {
    self->_isMoreListSelected = 0;
    self->_selectedSegmentIndedouble x = self->_previousSelectedSegmentIndex;
    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (CGRect)frameForSegmentWithIndex:(int64_t)a3
{
  v5 = (double *)MEMORY[0x1E4F1DB28];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
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
      v25.origin.double x = v10;
      v25.origin.double y = v12;
      v25.size.double width = v14;
      v25.size.double height = v16;
      double MaxX = CGRectGetMaxX(v25);
      v26.origin.double x = v18;
      v26.origin.double y = v6;
      v26.size.double width = v17;
      v26.size.double height = v16;
      double v20 = MaxX - CGRectGetWidth(v26);
      v27.origin.double x = v18;
      v27.origin.double y = v6;
      v27.size.double width = v17;
      v27.size.double height = v16;
      double v18 = v20 - CGRectGetMinX(v27);
    }
    CGFloat v6 = v12;
  }
  double v21 = v18;
  double v22 = v6;
  double v23 = v17;
  double v24 = v16;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
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
  previousSelectedSegmentIndedouble x = self->_previousSelectedSegmentIndex;
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
    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setSizesSegmentsToFitWidth:(BOOL)a3
{
  if (self->_sizesSegmentsToFitWidth != a3)
  {
    self->_sizesSegmentsToFitWidth = a3;
    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setItemTitles:(id)a3
{
  if (self->_itemTitles != a3)
  {
    v4 = (NSArray *)[a3 copy];
    itemTitles = self->_itemTitles;
    self->_itemTitles = v4;

    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setMaximumNumberOfVisibleItems:(int64_t)a3
{
  if (self->_maximumNumberOfVisibleItems != a3)
  {
    self->_maximumNumberOfVisibleItems = a3;
    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setMoreListTitle:(id)a3
{
  if (self->_moreListTitle != a3)
  {
    v4 = (NSString *)[a3 copy];
    moreListTitle = self->_moreListTitle;
    self->_moreListTitle = v4;

    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  selectedSegmentIndedouble x = self->_selectedSegmentIndex;
  if (selectedSegmentIndex != a3)
  {
    self->_isMoreListSelected = 0;
    self->_previousSelectedSegmentIndedouble x = selectedSegmentIndex;
    self->_selectedSegmentIndedouble x = a3;
    [(SKUIFlexibleSegmentedControl *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SKUIFlexibleSegmentedControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__SKUIFlexibleSegmentedControl_layoutSubviews__block_invoke;
  v18[3] = &unk_1E6425038;
  v18[4] = self;
  v18[5] = v7;
  v18[6] = v8;
  *(double *)&v18[7] = v3;
  *(double *)&v18[8] = v5;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v18];
  [(UISegmentedControl *)self->_segmentedControl frame];
  float v10 = (v4 - v9) * 0.5;
  float v12 = (v6 - v11) * 0.5;
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", floorf(v10), floorf(v12));
  unint64_t v13 = [(SKUIFlexibleSegmentedControl *)self moreListIndex];
  segmentedControl = self->_segmentedControl;
  if (self->_isMoreListSelected)
  {
    selectedSegmentIndedouble x = v13;
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
    selectedSegmentIndedouble x = self->_selectedSegmentIndex;
    segmentedControl = self->_segmentedControl;
    if (selectedSegmentIndex >= v17) {
      selectedSegmentIndedouble x = -1;
    }
  }
  [(UISegmentedControl *)segmentedControl setSelectedSegmentIndex:selectedSegmentIndex];
}

uint64_t __46__SKUIFlexibleSegmentedControl_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSegmentedControl:withTitles:boundingSize:", *(void *)(*(void *)(a1 + 32) + 464), *(void *)(*(void *)(a1 + 32) + 432), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1C10]);
  -[SKUIFlexibleSegmentedControl _configureSegmentedControl:withTitles:boundingSize:](self, "_configureSegmentedControl:withTitles:boundingSize:", v6, self->_itemTitles, width, height);
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
  self->_previousSelectedSegmentIndedouble x = self->_selectedSegmentIndex;
  self->_selectedSegmentIndedouble x = [a3 selectedSegmentIndex];
  int64_t v4 = [(SKUIFlexibleSegmentedControl *)self moreListIndex];
  selectedSegmentIndedouble x = self->_selectedSegmentIndex;
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
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
  double v18 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  while (1)
  {
    [(SKUIFlexibleSegmentedControl *)self _setTitles:v9 forSegmentedControl:v35];
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
  objc_msgSend(v35, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v30, v23);
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

      [(SKUIFlexibleSegmentedControl *)self _setTitles:v9 forSegmentedControl:v35];
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
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SKUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke;
  v8[3] = &unk_1E6427AA0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __63__SKUIFlexibleSegmentedControl__setTitles_forSegmentedControl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSegmentWithTitle:a2 atIndex:a3 animated:0];
}

- (SKUIFlexibleSegmentedControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIFlexibleSegmentedControlDelegate *)WeakRetained;
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFlexibleSegmentedControl initWithFrame:]";
}

@end