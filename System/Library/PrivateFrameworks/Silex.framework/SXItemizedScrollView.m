@interface SXItemizedScrollView
- (BOOL)contentTooSmall;
- (BOOL)gotActiveViewIndexChange;
- (CGRect)frameForViewAtIndex:(unint64_t)a3;
- (CGSize)framesAreValidForSize;
- (NSArray)frames;
- (NSIndexSet)visibleIndices;
- (NSMutableDictionary)visibleViewsByIndex;
- (SXItemizedScrollView)initWithCoder:(id)a3;
- (SXItemizedScrollView)initWithFrame:(CGRect)a3;
- (SXItemizedScrollViewDataSource)dataSource;
- (UIView)activeView;
- (_NSRange)visibleRange;
- (unint64_t)activeViewIndex;
- (void)commonInit;
- (void)determineNewVisibilityRange;
- (void)forceCorrectFrames;
- (void)layoutSubviews;
- (void)rebuildFramesArray;
- (void)reindexate;
- (void)scrollToNext;
- (void)scrollToPrevious;
- (void)setActiveViewIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setContentTooSmall:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrames:(id)a3;
- (void)setFramesAreValidForSize:(CGSize)a3;
- (void)setGotActiveViewIndexChange:(BOOL)a3;
- (void)setVisibleIndices:(id)a3;
- (void)setVisibleViewsByIndex:(id)a3;
- (void)viewManagementForRange:(_NSRange)a3;
@end

@implementation SXItemizedScrollView

- (void)commonInit
{
  v9.receiver = self;
  v9.super_class = (Class)SXItemizedScrollView;
  [(SXItemizedScrollView *)&v9 setDelegate:self];
  v3 = [MEMORY[0x263EFF8C0] array];
  frames = self->_frames;
  self->_frames = v3;

  v5 = [MEMORY[0x263F088D0] indexSet];
  visibleIndices = self->_visibleIndices;
  self->_visibleIndices = v5;

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  visibleViewsByIndex = self->_visibleViewsByIndex;
  self->_visibleViewsByIndex = v7;

  self->_activeViewIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(SXItemizedScrollView *)self setScrollsToTop:0];
  [(SXItemizedScrollView *)self setPagingEnabled:1];
  [(SXItemizedScrollView *)self setShowsHorizontalScrollIndicator:0];
  [(SXItemizedScrollView *)self setShowsVerticalScrollIndicator:0];
  [(SXItemizedScrollView *)self setDelaysContentTouches:0];
  [(SXItemizedScrollView *)self setCanCancelContentTouches:1];
}

- (SXItemizedScrollView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXItemizedScrollView;
  v3 = [(SXItemizedScrollView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SXItemizedScrollView *)v3 commonInit];
  }
  return v4;
}

- (SXItemizedScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXItemizedScrollView;
  v3 = -[SXItemizedScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SXItemizedScrollView *)v3 commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SXItemizedScrollView;
  [(SXItemizedScrollView *)&v9 layoutSubviews];
  if (([(SXItemizedScrollView *)self isDragging] & 1) != 0
    || [(SXItemizedScrollView *)self isTracking])
  {
    self->_gotActiveViewIndexChange = 1;
  }
  v3 = [(SXItemizedScrollView *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ([(SXItemizedScrollView *)self dataSource],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 itemizedScrollViewWillReindex:self],
        v5,
        v6))
  {
    [(SXItemizedScrollView *)self determineNewVisibilityRange];
    uint64_t v7 = [(SXItemizedScrollView *)self visibleRange];
    -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v7, v8);
  }
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)SXItemizedScrollView;
  -[SXItemizedScrollView setFrame:](&v46, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SXItemizedScrollView *)self framesAreValidForSize];
  double v5 = v4;
  double v7 = v6;
  [(SXItemizedScrollView *)self bounds];
  if (v5 != v9 || v7 != v8)
  {
    v11 = [(SXItemizedScrollView *)self superview];

    if (v11)
    {
      v12 = [(SXItemizedScrollView *)self dataSource];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0
        || ([(SXItemizedScrollView *)self dataSource],
            v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 itemizedScrollViewWillReindex:self],
            v14,
            v15))
      {
        [(SXItemizedScrollView *)self bounds];
        self->_framesAreValidForSize.width = v16;
        self->_framesAreValidForSize.height = v17;
        [(SXItemizedScrollView *)self rebuildFramesArray];
        unint64_t v18 = [(SXItemizedScrollView *)self activeViewIndex];
        self->_activeViewIndex = 0x7FFFFFFFFFFFFFFFLL;
        if ([(SXItemizedScrollView *)self gotActiveViewIndexChange]) {
          [(SXItemizedScrollView *)self setActiveViewIndex:v18 animated:0];
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v19 = [(SXItemizedScrollView *)self visibleViewsByIndex];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v25 = [v24 integerValue];
              v26 = [(SXItemizedScrollView *)self dataSource];
              char v27 = objc_opt_respondsToSelector();

              if (v27)
              {
                v28 = [(SXItemizedScrollView *)self dataSource];
                int v29 = [v28 itemizedScrollView:self isAllowedToAddViewInHierarchy:v25];

                if (!v29) {
                  continue;
                }
              }
              v30 = [(SXItemizedScrollView *)self visibleViewsByIndex];
              v31 = [v30 objectForKeyedSubscript:v24];

              v32 = [(SXItemizedScrollView *)self frames];
              v33 = [v32 objectAtIndexedSubscript:v25];
              [v33 CGRectValue];
              double v35 = v34;
              double v37 = v36;
              double v39 = v38;
              double v41 = v40;

              objc_msgSend(v31, "setFrame:", v35, v37, v39, v41);
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v21);
        }
      }
    }
  }
}

- (void)forceCorrectFrames
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(SXItemizedScrollView *)self visibleViewsByIndex];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 unsignedIntegerValue];
        v10 = [(SXItemizedScrollView *)self visibleViewsByIndex];
        v11 = [v10 objectForKeyedSubscript:v8];

        v12 = [(SXItemizedScrollView *)self frames];
        char v13 = [v12 objectAtIndexedSubscript:v9];
        [v13 CGRectValue];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;

        [v11 frame];
        v29.origin.x = v15;
        v29.origin.y = v17;
        v29.size.width = v19;
        v29.size.height = v21;
        if (!CGRectEqualToRect(v28, v29)) {
          objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
}

- (void)reindexate
{
  -[SXItemizedScrollView setFramesAreValidForSize:](self, "setFramesAreValidForSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [(SXItemizedScrollView *)self frame];
  -[SXItemizedScrollView setFrame:](self, "setFrame:");
}

- (void)setActiveViewIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t activeViewIndex = self->_activeViewIndex;
  self->_unint64_t activeViewIndex = a3;
  self->_gotActiveViewIndexChange = 1;
  if (activeViewIndex != a3)
  {
    unint64_t v7 = [(SXItemizedScrollView *)self activeViewIndex];
    double v8 = [(SXItemizedScrollView *)self frames];
    unint64_t v9 = [v8 count];

    if (v7 >= v9) {
      [(SXItemizedScrollView *)self rebuildFramesArray];
    }
    unint64_t v10 = [(SXItemizedScrollView *)self activeViewIndex];
    v11 = [(SXItemizedScrollView *)self frames];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      uint64_t v13 = [(SXItemizedScrollView *)self frames];
      double v14 = [(id)v13 objectAtIndexedSubscript:a3];
      [v14 CGRectValue];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      long long v23 = [(SXItemizedScrollView *)self activeView];
      [v23 frame];
      v47.origin.x = v16;
      v47.origin.y = v18;
      v47.size.width = v20;
      v47.size.height = v22;
      LOBYTE(v13) = CGRectEqualToRect(v43, v47);

      if ((v13 & 1) == 0)
      {
        long long v24 = [(SXItemizedScrollView *)self dataSource];
        char v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) == 0
          || ([(SXItemizedScrollView *)self dataSource],
              v26 = objc_claimAutoreleasedReturnValue(),
              int v27 = objc_msgSend(v26, "itemizedScrollView:isAllowedToAddViewInHierarchy:", self, -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex")), v26, v27))
        {
          CGRect v28 = [(SXItemizedScrollView *)self activeView];
          objc_msgSend(v28, "setFrame:", v16, v18, v20, v22);
        }
      }
      [(SXItemizedScrollView *)self frame];
      CGFloat v30 = v16 + v29;
      [(SXItemizedScrollView *)self frame];
      v44.origin.y = v18 + v31;
      v44.origin.x = v30;
      v44.size.width = v20;
      v44.size.height = v22;
      double MinX = CGRectGetMinX(v44);
      [(SXItemizedScrollView *)self contentInset];
      double v34 = v33;
      double v35 = 0.0;
      if (![(SXItemizedScrollView *)self contentTooSmall])
      {
        double v35 = MinX - v34;
        [(SXItemizedScrollView *)self bounds];
        double v36 = MinX - v34 + CGRectGetWidth(v45);
        [(SXItemizedScrollView *)self contentSize];
        if (v36 > v37)
        {
          [(SXItemizedScrollView *)self contentSize];
          double v39 = v38;
          [(SXItemizedScrollView *)self bounds];
          double v40 = v39 - CGRectGetWidth(v46);
          [(SXItemizedScrollView *)self frame];
          double v35 = v40 - v41;
        }
      }
      -[SXItemizedScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, v35, 0.0);
    }
  }
}

- (UIView)activeView
{
  v3 = [(SXItemizedScrollView *)self visibleViewsByIndex];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    unint64_t v6 = [(SXItemizedScrollView *)self activeViewIndex];
    unint64_t v7 = [(SXItemizedScrollView *)self frames];
    unint64_t v8 = [v7 count];

    if (v6 >= v8)
    {
      uint64_t v5 = 0;
    }
    else
    {
      [(SXItemizedScrollView *)self determineNewVisibilityRange];
      uint64_t v9 = [(SXItemizedScrollView *)self visibleRange];
      -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v9, v10);
      v11 = [(SXItemizedScrollView *)self visibleViewsByIndex];
      unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
      uint64_t v5 = [v11 objectForKeyedSubscript:v12];
    }
  }
  return (UIView *)v5;
}

- (CGRect)frameForViewAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SXItemizedScrollView *)self frames];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    double v10 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    unint64_t v7 = [(SXItemizedScrollView *)self frames];
    unint64_t v8 = [v7 objectAtIndexedSubscript:a3];
    [v8 CGRectValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)determineNewVisibilityRange
{
  v3 = [(SXItemizedScrollView *)self frames];
  uint64_t v4 = [v3 count];

  unint64_t v5 = 0;
  if (v4)
  {
    unint64_t v6 = 0;
    unint64_t v7 = -1;
    do
    {
      unint64_t v8 = [(SXItemizedScrollView *)self frames];
      double v9 = [v8 objectAtIndexedSubscript:v6];
      [v9 CGRectValue];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      [(SXItemizedScrollView *)self bounds];
      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      CGRect v36 = CGRectIntersection(v35, v38);
      double Width = CGRectGetWidth(v36);
      v37.origin.x = v11;
      v37.origin.y = v13;
      v37.size.width = v15;
      v37.size.height = v17;
      double v19 = Width / CGRectGetWidth(v37);
      if (v7 >= v6) {
        unint64_t v20 = v6;
      }
      else {
        unint64_t v20 = v7;
      }
      if (v5 <= v6) {
        unint64_t v21 = v6;
      }
      else {
        unint64_t v21 = v5;
      }
      if (v19 > 0.0)
      {
        unint64_t v5 = v21;
        unint64_t v7 = v20;
      }
      ++v6;
      double v22 = [(SXItemizedScrollView *)self frames];
      unint64_t v23 = [v22 count];
    }
    while (v6 < v23);
  }
  else
  {
    unint64_t v7 = -1;
  }
  if (([(SXItemizedScrollView *)self isPagingEnabled] & 1) == 0
    || [(SXItemizedScrollView *)self isDecelerating]
    && ([(SXItemizedScrollView *)self _pageDecelerationTarget],
        double v25 = v24,
        double v27 = v26,
        [(SXItemizedScrollView *)self contentOffset],
        v25 == v29)
    && v27 == v28)
  {
    int v30 = 0;
  }
  else if (([(SXItemizedScrollView *)self isDecelerating] & 1) != 0 {
         || ([(SXItemizedScrollView *)self isTracking] & 1) != 0)
  }
  {
    int v30 = 1;
  }
  else
  {
    int v30 = [(SXItemizedScrollView *)self _isAnimatingScrollTest];
  }
  if (v7 != [(SXItemizedScrollView *)self activeViewIndex]
    && ((![(SXItemizedScrollView *)self gotActiveViewIndexChange] | v30) & 1) == 0)
  {
    self->_unint64_t activeViewIndex = v7;
    double v31 = [(SXItemizedScrollView *)self delegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      double v33 = [(SXItemizedScrollView *)self delegate];
      objc_msgSend(v33, "itemizedScrollView:didChangeToActiveViewIndex:", self, -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
    }
  }
  p_visibleRange = &self->_visibleRange;
  if (v7 != -1 || v5)
  {
    p_visibleRange->location = v7;
    self->_visibleRange.length = v5 - v7 + 1;
  }
  else
  {
    p_visibleRange->location = 0;
    self->_visibleRange.length = 0;
  }
}

- (void)rebuildFramesArray
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v3 = [(SXItemizedScrollView *)self dataSource];
  uint64_t v4 = [v3 numberOfViewsInItemizedScrollView:self];

  double v5 = 0.0;
  if (([(SXItemizedScrollView *)self isPagingEnabled] & 1) == 0)
  {
    unint64_t v6 = [(SXItemizedScrollView *)self dataSource];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      unint64_t v8 = [(SXItemizedScrollView *)self dataSource];
      [v8 gutterBetweenItemsInNotPagingItemizedScrollView:self];
      double v5 = v9;
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v4)
  {
    uint64_t v11 = 0;
    double v12 = 0.0;
    do
    {
      CGFloat v13 = [(SXItemizedScrollView *)self dataSource];
      [v13 itemizedScrollView:self frameForViewAtIndex:v11];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      double v22 = v12 + v15;
      unint64_t v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v22, v17, v19, v21);
      [v10 addObject:v23];
      if ([(SXItemizedScrollView *)self isPagingEnabled])
      {
        [(SXItemizedScrollView *)self bounds];
        double v12 = v12 + CGRectGetWidth(v81);
      }
      else
      {
        v82.origin.x = v22;
        v82.origin.y = v17;
        v82.size.width = v19;
        v82.size.height = v21;
        double v24 = v12 + CGRectGetWidth(v82);
        double v25 = -0.0;
        if (v4 - 1 != v11) {
          double v25 = v5;
        }
        double v12 = v25 + v24;
      }

      ++v11;
    }
    while (v4 != v11);
  }
  double v26 = (void *)[v10 copy];
  [(SXItemizedScrollView *)self setFrames:v26];

  double v27 = [(SXItemizedScrollView *)self frames];
  double v28 = [v27 lastObject];
  [v28 CGRectValue];
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;

  v83.origin.x = v30;
  v83.origin.y = v32;
  v83.size.width = v34;
  v83.size.height = v36;
  double MaxX = CGRectGetMaxX(v83);
  [(SXItemizedScrollView *)self frame];
  double v39 = MaxX - v38;
  [(SXItemizedScrollView *)self bounds];
  double Height = CGRectGetHeight(v84);
  [(SXItemizedScrollView *)self bounds];
  if (v39 <= v41 + -20.0)
  {
    [(SXItemizedScrollView *)self bounds];
    double v43 = v42;
    id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    CGRect v45 = [(SXItemizedScrollView *)self frames];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v75 objects:v79 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      double v48 = v43 * 0.5 - v39 * 0.5;
      uint64_t v49 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v76 != v49) {
            objc_enumerationMutation(v45);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * i) CGRectValue];
          v52 = [MEMORY[0x263F08D40] valueWithCGRect:v48 + v51];
          [v44 addObject:v52];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v75 objects:v79 count:16];
      }
      while (v47);
    }

    [(SXItemizedScrollView *)self setContentTooSmall:1];
    v53 = (void *)[v44 copy];
    [(SXItemizedScrollView *)self setFrames:v53];

    [(SXItemizedScrollView *)self bounds];
    double v39 = v54;
  }
  else
  {
    [(SXItemizedScrollView *)self setContentTooSmall:0];
  }
  -[SXItemizedScrollView setContentSize:](self, "setContentSize:", v39, Height);
  unint64_t v55 = [(SXItemizedScrollView *)self activeViewIndex];
  v56 = [(SXItemizedScrollView *)self frames];
  unint64_t v57 = [v56 count];

  if (v55 < v57)
  {
    v58 = [(SXItemizedScrollView *)self frames];
    v59 = objc_msgSend(v58, "objectAtIndexedSubscript:", -[SXItemizedScrollView activeViewIndex](self, "activeViewIndex"));
    [v59 CGRectValue];
    double v61 = v60;
    double v63 = v62;
    CGFloat v65 = v64;
    CGFloat v67 = v66;

    [(SXItemizedScrollView *)self frame];
    double v69 = v68;
    [(SXItemizedScrollView *)self contentInset];
    CGFloat v71 = v61 + v69 - v70;
    [(SXItemizedScrollView *)self frame];
    v85.origin.y = v63 + v72;
    v85.origin.x = v71;
    v85.size.width = v65;
    v85.size.height = v67;
    -[SXItemizedScrollView setContentOffset:animated:](self, "setContentOffset:animated:", 0, CGRectGetMinX(v85), 0.0);
  }
  [(SXItemizedScrollView *)self determineNewVisibilityRange];
  uint64_t v73 = [(SXItemizedScrollView *)self visibleRange];
  -[SXItemizedScrollView viewManagementForRange:](self, "viewManagementForRange:", v73, v74);
}

- (void)viewManagementForRange:(_NSRange)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", a3.location, a3.length);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke;
  v13[3] = &unk_2646536D0;
  v13[4] = self;
  double v5 = [v4 indexesWithOptions:0 passingTest:v13];
  unint64_t v6 = [(SXItemizedScrollView *)self visibleIndices];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_2;
  v11[3] = &unk_2646536D0;
  id v12 = v4;
  id v7 = v4;
  unint64_t v8 = [v6 indexesWithOptions:0 passingTest:v11];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_3;
  v10[3] = &unk_2646532A0;
  v10[4] = self;
  [v8 enumerateIndexesUsingBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SXItemizedScrollView_viewManagementForRange___block_invoke_4;
  v9[3] = &unk_2646532A0;
  v9[4] = self;
  [v5 enumerateIndexesUsingBlock:v9];
  [(SXItemizedScrollView *)self setVisibleIndices:v7];
}

uint64_t __47__SXItemizedScrollView_viewManagementForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) visibleIndices];
  uint64_t v4 = [v3 containsIndex:a2] ^ 1;

  return v4;
}

uint64_t __47__SXItemizedScrollView_viewManagementForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2] ^ 1;
}

void __47__SXItemizedScrollView_viewManagementForRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v10 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v4 = [*(id *)(a1 + 32) visibleViewsByIndex];
  double v5 = [v4 objectForKeyedSubscript:v10];

  [v5 removeFromSuperview];
  unint64_t v6 = [*(id *)(a1 + 32) visibleViewsByIndex];
  [v6 removeObjectForKey:v10];

  id v7 = [*(id *)(a1 + 32) delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [*(id *)(a1 + 32) delegate];
    [v9 itemizedScrollView:*(void *)(a1 + 32) didHideViewWithIndex:a2];
  }
}

void __47__SXItemizedScrollView_viewManagementForRange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unint64_t v6 = [*(id *)(a1 + 32) delegate];
    [v6 itemizedScrollView:*(void *)(a1 + 32) willShowViewWithIndex:a2];
  }
  id v7 = [*(id *)(a1 + 32) dataSource];
  id v26 = [v7 itemizedScrollView:*(void *)(a1 + 32) viewAtIndex:a2];

  char v8 = [NSNumber numberWithUnsignedInteger:a2];
  double v9 = [*(id *)(a1 + 32) visibleViewsByIndex];
  [v9 setObject:v26 forKeyedSubscript:v8];

  id v10 = [*(id *)(a1 + 32) frames];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a2];
  [(id)v11 CGRectValue];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [*(id *)(a1 + 32) dataSource];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || ([*(id *)(a1 + 32) dataSource],
        double v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 itemizedScrollView:*(void *)(a1 + 32) isAllowedToAddViewInHierarchy:a2],
        v21,
        v22))
  {
    objc_msgSend(v26, "setFrame:", v13, v15, v17, v19);
    [*(id *)(a1 + 32) addSubview:v26];
  }
  unint64_t v23 = [*(id *)(a1 + 32) delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    double v25 = [*(id *)(a1 + 32) delegate];
    [v25 itemizedScrollView:*(void *)(a1 + 32) didShowViewWithIndex:a2];
  }
}

- (void)scrollToNext
{
  v3 = [(SXItemizedScrollView *)self frames];
  unint64_t v4 = [v3 count];
  unint64_t v5 = [(SXItemizedScrollView *)self activeViewIndex];

  if (v4 > v5)
  {
    unint64_t v6 = [(SXItemizedScrollView *)self activeViewIndex] + 1;
    [(SXItemizedScrollView *)self setActiveViewIndex:v6 animated:0];
  }
}

- (void)scrollToPrevious
{
  if ([(SXItemizedScrollView *)self activeViewIndex])
  {
    unint64_t v3 = [(SXItemizedScrollView *)self activeViewIndex] - 1;
    [(SXItemizedScrollView *)self setActiveViewIndex:v3 animated:0];
  }
}

- (SXItemizedScrollViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SXItemizedScrollViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (_NSRange)visibleRange
{
  p_visibleRange = &self->_visibleRange;
  NSUInteger location = self->_visibleRange.location;
  NSUInteger length = p_visibleRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)activeViewIndex
{
  return self->_activeViewIndex;
}

- (CGSize)framesAreValidForSize
{
  double width = self->_framesAreValidForSize.width;
  double height = self->_framesAreValidForSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFramesAreValidForSize:(CGSize)a3
{
  self->_framesAreValidForSize = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (NSIndexSet)visibleIndices
{
  return self->_visibleIndices;
}

- (void)setVisibleIndices:(id)a3
{
}

- (BOOL)contentTooSmall
{
  return self->_contentTooSmall;
}

- (void)setContentTooSmall:(BOOL)a3
{
  self->_contentTooSmall = a3;
}

- (BOOL)gotActiveViewIndexChange
{
  return self->_gotActiveViewIndexChange;
}

- (void)setGotActiveViewIndexChange:(BOOL)a3
{
  self->_gotActiveViewIndexChange = a3;
}

- (NSMutableDictionary)visibleViewsByIndex
{
  return self->_visibleViewsByIndex;
}

- (void)setVisibleViewsByIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleViewsByIndex, 0);
  objc_storeStrong((id *)&self->_visibleIndices, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end