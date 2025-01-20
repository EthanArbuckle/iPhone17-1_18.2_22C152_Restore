@interface SUUIChartColumnsView
- (NSArray)chartViewControllers;
- (SUUIChartColumnsView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (UIVisualEffectView)effectView;
- (id)_headerViewWithViewControllers:(id)a3;
- (int64_t)numberOfVisibleColumns;
- (void)_headerViewAction:(id)a3;
- (void)_reloadColumnViews;
- (void)beginColumnChangeAnimationToNumberOfVisibleColumns:(int64_t)a3;
- (void)dealloc;
- (void)endColumnChangeAnimation;
- (void)layoutSubviews;
- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4;
- (void)setChartViewControllers:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setNumberOfVisibleColumns:(int64_t)a3;
@end

@implementation SUUIChartColumnsView

- (SUUIChartColumnsView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIChartColumnsView;
  v3 = -[SUUIChartColumnsView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 0.0, 44.0);
    headerBackgroundView = v3->_headerBackgroundView;
    v3->_headerBackgroundView = (UIView *)v4;

    [(SUUIChartColumnsView *)v3 addSubview:v3->_headerBackgroundView];
    id v6 = objc_alloc(MEMORY[0x263F82E50]);
    v7 = [MEMORY[0x263F824D8] effectWithStyle:10];
    uint64_t v8 = [v6 initWithEffect:v7];
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v8;

    [(UIView *)v3->_headerBackgroundView addSubview:v3->_effectView];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView0 = v3->_borderView0;
    v3->_borderView0 = v10;

    v12 = v3->_borderView0;
    v13 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(SUUIChartColumnsView *)v3 addSubview:v3->_borderView0];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView1 = v3->_borderView1;
    v3->_borderView1 = v14;

    v16 = v3->_borderView1;
    v17 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(SUUIChartColumnsView *)v3 addSubview:v3->_borderView1];
    v18 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    headerBackgroundBottomBorder = v3->_headerBackgroundBottomBorder;
    v3->_headerBackgroundBottomBorder = v18;

    v20 = v3->_headerBackgroundBottomBorder;
    v21 = [MEMORY[0x263F825C8] separatorColor];
    [(UIView *)v20 setBackgroundColor:v21];

    [(UIView *)v3->_headerBackgroundView addSubview:v3->_headerBackgroundBottomBorder];
  }
  return v3;
}

- (void)dealloc
{
  [(SUUIFlexibleSegmentedControl *)self->_segmentedControl setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIChartColumnsView;
  [(SUUIChartColumnsView *)&v3 dealloc];
}

- (void)beginColumnChangeAnimationToNumberOfVisibleColumns:(int64_t)a3
{
  int64_t columnChangeAnimationCount = self->_columnChangeAnimationCount;
  self->_int64_t columnChangeAnimationCount = columnChangeAnimationCount + 1;
  if (!columnChangeAnimationCount)
  {
    self->_animatingToNumberOfVisibleColumns = a3;
    if (self->_numberOfVisibleColumns >= a3)
    {
      self->_numberOfVisibleColumns = a3;
      [(SUUIChartColumnsView *)self setNeedsLayout];
    }
    else
    {
      [(SUUIChartColumnsView *)self _reloadColumnViews];
      [(SUUIChartColumnsView *)self layoutIfNeeded];
    }
  }
}

- (void)endColumnChangeAnimation
{
  int64_t columnChangeAnimationCount = self->_columnChangeAnimationCount;
  BOOL v3 = columnChangeAnimationCount == 1;
  BOOL v4 = columnChangeAnimationCount < 1;
  int64_t v5 = columnChangeAnimationCount - 1;
  if (!v4)
  {
    self->_int64_t columnChangeAnimationCount = v5;
    if (v3)
    {
      [(SUUIChartColumnsView *)self _reloadColumnViews];
      [(SUUIChartColumnsView *)self setNeedsLayout];
    }
  }
}

- (void)setChartViewControllers:(id)a3
{
  if (self->_allViewControllers != a3)
  {
    BOOL v4 = (NSArray *)[a3 copy];
    allViewControllers = self->_allViewControllers;
    self->_allViewControllers = v4;

    [(SUUIChartColumnsView *)self _reloadColumnViews];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIChartColumnsView *)self setNeedsLayout];
  }
}

- (void)setNumberOfVisibleColumns:(int64_t)a3
{
  if (self->_numberOfVisibleColumns != a3)
  {
    self->_numberOfVisibleColumns = a3;
    if (!self->_columnChangeAnimationCount) {
      [(SUUIChartColumnsView *)self _reloadColumnViews];
    }
    [(SUUIChartColumnsView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)SUUIChartColumnsView;
  [(SUUIChartColumnsView *)&v39 layoutSubviews];
  [(SUUIChartColumnsView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  double v13 = v12;

  uint64_t v14 = [(NSArray *)self->_columnViews count];
  int64_t v15 = [(SUUIChartColumnsView *)self numberOfVisibleColumns];
  if (v14 >= v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v14;
  }
  [(UIView *)self->_headerBackgroundView frame];
  double v18 = v17;
  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:");
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:", 0.0, 0.0, v8, v18);
  [(UIView *)self->_headerBackgroundBottomBorder setHidden:v16 > 1];
  [(SUUIFlexibleSegmentedControl *)self->_segmentedControl setHidden:v16 > 1];
  double v19 = 1.0 / v13;
  if (v16 > 1) {
    goto LABEL_13;
  }
  headerBackgroundBottomBorder = self->_headerBackgroundBottomBorder;
  if (headerBackgroundBottomBorder) {
    -[UIView setFrame:](headerBackgroundBottomBorder, "setFrame:", 0.0, v18 - v19, v8, v19);
  }
  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    [(SUUIFlexibleSegmentedControl *)segmentedControl frame];
    -[SUUIFlexibleSegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    if (v22 >= v8 + -30.0) {
      double v24 = v8 + -30.0;
    }
    else {
      double v24 = v22;
    }
    float v25 = (v8 - v24) * 0.5;
    float v26 = (v18 - v23) * 0.5;
    -[SUUIFlexibleSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", floorf(v25), floorf(v26));
  }
  if (v16)
  {
LABEL_13:
    float v27 = v8 / (double)v16;
    double v28 = floorf(v27);
    if (v14 >= 1)
    {
      uint64_t v29 = 0;
      int64_t columnChangeAnimationCount = self->_columnChangeAnimationCount;
      double v31 = 0.0;
      do
      {
        if (v16 > 1)
        {
          v32 = [(NSArray *)self->_headerViews objectAtIndex:v29];
          [v32 frame];
          objc_msgSend(v32, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, 0.0, v28, v18, v4, v6, v8, v10));
        }
        v33 = [(NSArray *)self->_columnViews objectAtIndex:v29];
        [v33 frame];
        objc_msgSend(v33, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, 0.0, v28, v10, v4, v6, v8, v10));
        BOOL v35 = columnChangeAnimationCount < 1 && v29 >= v16;
        [v33 setHidden:v35];
        double v31 = v31 + v28;

        ++v29;
      }
      while (v14 != v29);
    }
    CGFloat v36 = v10 + -15.0;
    -[UIView setFrame:](self->_borderView0, "setFrame:", v28, self->_contentInset.top + 15.0, v19, v36);
    [(UIView *)self->_borderView0 setHidden:v16 < 2];
    -[UIView setFrame:](self->_borderView1, "setFrame:", v28 + v28, self->_contentInset.top + 15.0, v19, v36);
    borderView1 = self->_borderView1;
    BOOL v38 = v16 < 3;
  }
  else
  {
    [(UIView *)self->_borderView0 setHidden:1];
    borderView1 = self->_borderView1;
    BOOL v38 = 1;
  }
  [(UIView *)borderView1 setHidden:v38];
}

- (void)_headerViewAction:(id)a3
{
  id v6 = a3;
  NSUInteger v4 = -[NSArray indexOfObjectIdenticalTo:](self->_headerViews, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = [(NSArray *)self->_columnViews objectAtIndex:v4];
    objc_msgSend(v5, "setSelectedViewControllerIndex:", objc_msgSend(v6, "selectedTitleIndex"));
  }
}

- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4
{
  id v5 = [(NSArray *)self->_columnViews firstObject];
  [v5 setSelectedViewControllerIndex:a4];
}

- (id)_headerViewWithViewControllers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(SUUIChartColumnHeaderView);
  [(SUUIChartColumnHeaderView *)v5 addTarget:self action:sel__headerViewAction_ forControlEvents:4096];
  id v6 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIChartColumnHeaderView *)v5 setBackgroundColor:v6];

  [(SUUIChartColumnHeaderView *)v5 sizeToFit];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "title", (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(SUUIChartColumnHeaderView *)v5 setTitles:v7];
  return v5;
}

- (void)_reloadColumnViews
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v49 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v56 = self;
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  p_columnViews = &self->_columnViews;
  id v5 = self->_columnViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v75 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v74 + 1) + 8 * i) selectedViewController];
        if (v10) {
          [v57 addObject:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v74 objects:v82 count:16];
    }
    while (v7);
  }
  id v50 = v3;

  if (v56->_columnChangeAnimationCount <= 0) {
    uint64_t v11 = &OBJC_IVAR___SUUIChartColumnsView__numberOfVisibleColumns;
  }
  else {
    uint64_t v11 = &OBJC_IVAR___SUUIChartColumnsView__animatingToNumberOfVisibleColumns;
  }
  uint64_t v55 = *(uint64_t *)((char *)&v56->super.super.super.isa + *v11);
  uint64_t v12 = [(NSArray *)v56->_allViewControllers count];
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
    {
      long long v15 = [(NSArray *)v56->_allViewControllers objectAtIndex:j];
      if ([v4 count] <= (unint64_t)(j % v55))
      {
        long long v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v15, 0);
        long long v16 = v4;
        long long v18 = v17;
      }
      else
      {
        long long v16 = [v4 objectAtIndex:j % v55];
        long long v17 = v16;
        long long v18 = v15;
      }
      [v16 addObject:v18];
    }
  }
  if (v55 == 1 && !v56->_segmentedControl)
  {
    double v19 = objc_alloc_init(SUUIFlexibleSegmentedControl);
    uint64_t v20 = v56;
    segmentedControl = v56->_segmentedControl;
    v56->_segmentedControl = v19;

    [(SUUIFlexibleSegmentedControl *)v20->_segmentedControl setDelegate:v20];
    [(UIView *)v20->_headerBackgroundView addSubview:v20->_segmentedControl];
  }
  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v4;
  uint64_t v54 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v71;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    double v23 = v50;
    double v24 = v56;
    do
    {
      for (uint64_t k = 0; k != v54; ++k)
      {
        if (*(void *)v71 != v53) {
          objc_enumerationMutation(obj);
        }
        float v26 = *(void **)(*((void *)&v70 + 1) + 8 * k);
        float v27 = objc_alloc_init(SUUIIPadChartsColumnView);
        -[SUUIIPadChartsColumnView setContentInset:](v27, "setContentInset:", v24->_contentInset.top, v24->_contentInset.left, v24->_contentInset.bottom, v24->_contentInset.right);
        [(SUUIIPadChartsColumnView *)v27 setContentViewControllers:v26];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v28 = v57;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v67;
          while (2)
          {
            for (uint64_t m = 0; m != v30; ++m)
            {
              if (*(void *)v67 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = [v26 indexOfObjectIdenticalTo:*(void *)(*((void *)&v66 + 1) + 8 * m)];
              if (v33 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v22 = v33;
                [(SUUIIPadChartsColumnView *)v27 setSelectedViewControllerIndex:v33];
                goto LABEL_37;
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v66 objects:v80 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_37:
          double v24 = v56;
        }

        if (v55 < 2)
        {
          id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v35 = v26;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v79 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v63;
            do
            {
              for (uint64_t n = 0; n != v37; ++n)
              {
                if (*(void *)v63 != v38) {
                  objc_enumerationMutation(v35);
                }
                v40 = [*(id *)(*((void *)&v62 + 1) + 8 * n) title];
                [v34 addObject:v40];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v79 count:16];
            }
            while (v37);
          }

          [v51 addObjectsFromArray:v34];
          double v23 = v50;
          double v24 = v56;
        }
        else
        {
          id v34 = [(SUUIChartColumnsView *)v24 _headerViewWithViewControllers:v26];
          [(UIView *)v24->_headerBackgroundView addSubview:v34];
          [(NSArray *)v49 addObject:v34];
        }

        [v23 addObject:v27];
        [(SUUIChartColumnsView *)v24 insertSubview:v27 belowSubview:v24->_headerBackgroundView];
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    }
    while (v54);
  }
  else
  {
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    double v23 = v50;
    double v24 = v56;
  }

  [(SUUIFlexibleSegmentedControl *)v24->_segmentedControl setItemTitles:v51];
  if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SUUIFlexibleSegmentedControl *)v24->_segmentedControl setSelectedSegmentIndex:v22];
  }
  [(NSArray *)*p_columnViews makeObjectsPerformSelector:sel_removeFromSuperview];
  objc_storeStrong((id *)p_columnViews, v23);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v41 = v24->_headerViews;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v58 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v43; ++ii)
      {
        if (*(void *)v59 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v58 + 1) + 8 * ii);
        [v46 removeTarget:v24 action:0 forControlEvents:64];
        [v46 removeFromSuperview];
      }
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v58 objects:v78 count:16];
    }
    while (v43);
  }

  headerViews = v24->_headerViews;
  v24->_headerViews = v49;
}

- (NSArray)chartViewControllers
{
  return self->_allViewControllers;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  bottouint64_t m = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)numberOfVisibleColumns
{
  return self->_numberOfVisibleColumns;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_headerViews, 0);
  objc_storeStrong((id *)&self->_headerBackgroundBottomBorder, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_borderView1, 0);
  objc_storeStrong((id *)&self->_borderView0, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_allViewControllers, 0);
}

@end