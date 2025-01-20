@interface BKPagingScrollView
- (BKPagingScrollView)initWithFrame:(CGRect)a3;
- (BOOL)_installViewAtIndex:(int64_t)a3;
- (CGRect)_frameForPageAtIndex:(int64_t)a3;
- (NSArray)allViews;
- (NSArray)surroundingViews;
- (UIView)currentView;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)_indexForView:(id)a3;
- (int64_t)layoutDirection;
- (int64_t)navigationOrientation;
- (int64_t)pageCacheDistance;
- (int64_t)pageCount;
- (int64_t)pageOffset;
- (void)_updateContentOffset;
- (void)dealloc;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)layoutSubviews;
- (void)purgeCachedPages;
- (void)removeSubview:(id)a3 atIndex:(int64_t)a4;
- (void)setContentOffset:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setNavigationOrientation:(int64_t)a3;
- (void)setPageCacheDistance:(int64_t)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)updateCachedPages;
@end

@implementation BKPagingScrollView

- (BKPagingScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKPagingScrollView;
  v3 = -[BKPagingScrollView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(BKPagingScrollView *)v3 setPagingEnabled:1];
    [(BKPagingScrollView *)v4 setShowsVerticalScrollIndicator:0];
    [(BKPagingScrollView *)v4 setShowsHorizontalScrollIndicator:0];
    v4->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
    v4->_pageCount = 0x7FFFFFFFFFFFFFFFLL;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKPagingScrollView;
  [(BKPagingScrollView *)&v4 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v63.receiver = self;
  v63.super_class = (Class)BKPagingScrollView;
  [(BKPagingScrollView *)&v63 frame];
  v70.origin.double x = v8;
  v70.origin.double y = v9;
  v70.size.double width = v10;
  v70.size.double height = v11;
  v65.origin.double x = x;
  v65.origin.double y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  if (!CGRectEqualToRect(v65, v70))
  {
    int64_t v12 = [(BKPagingScrollView *)self navigationOrientation];
    [(BKPagingScrollView *)self contentOffset];
    double v14 = v13;
    double v16 = v15;
    [(BKPagingScrollView *)self bounds];
    if (v12) {
      double v19 = v18;
    }
    else {
      double v19 = v17;
    }
    if (v12) {
      double v20 = v16;
    }
    else {
      double v20 = v14;
    }
    double v21 = 0.0;
    if (v19 <= 0.0)
    {
      double v22 = 0.0;
    }
    else
    {
      double v22 = v20 / v19;
      if (v20 >= 0.0)
      {
        float v23 = v22;
        double v21 = (double)(int)vcvtms_s32_f32(v23);
        double v22 = (v20 - v21 * v19) / v19;
      }
    }
    v62.receiver = self;
    v62.super_class = (Class)BKPagingScrollView;
    -[BKPagingScrollView setFrame:](&v62, "setFrame:", x, y, width, height);
    [(BKPagingScrollView *)self bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    if ([(BKPagingScrollView *)self navigationOrientation])
    {
      v66.origin.double x = v25;
      v66.origin.double y = v27;
      v66.size.double width = v29;
      v66.size.double height = v31;
      double v32 = CGRectGetWidth(v66);
      double v33 = (double)[(BKPagingScrollView *)self pageCount];
      v67.origin.double x = v25;
      v67.origin.double y = v27;
      v67.size.double width = v29;
      v67.size.double height = v31;
      double v34 = CGRectGetHeight(v67) * v33;
    }
    else
    {
      double v35 = (double)[(BKPagingScrollView *)self pageCount];
      v68.origin.double x = v25;
      v68.origin.double y = v27;
      v68.size.double width = v29;
      v68.size.double height = v31;
      double v32 = CGRectGetWidth(v68) * v35;
      v69.origin.double x = v25;
      v69.origin.double y = v27;
      v69.size.double width = v29;
      v69.size.double height = v31;
      double v34 = CGRectGetHeight(v69);
    }
    -[BKPagingScrollView setContentSize:](self, "setContentSize:", v32, v34);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v36 = [(BKPagingScrollView *)self subviews];
    id v37 = [v36 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v59;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v59 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if ([(BKPagingScrollView *)self _indexForView:v41] != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v42 = v41;
              [v42 pointToCenterAfterRotation];
              double v44 = v43;
              double v46 = v45;
              [v42 scaleToRestoreAfterRotation];
              double v48 = v47;
              [(BKPagingScrollView *)self _frameForPageAtIndex:[(BKPagingScrollView *)self _indexForView:v42]];
              [v42 setFrame:];
              [v42 configureForNewBoundsAndRestoreCenterPoint:v44 andScale:v46];
            }
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v38);
    }

    int64_t v49 = [(BKPagingScrollView *)self navigationOrientation];
    [(BKPagingScrollView *)self bounds];
    if (v49) {
      double v52 = CGRectGetHeight(*(CGRect *)&v50);
    }
    double v54 = v22 * v52 + v21 * v52;
    int64_t v55 = [(BKPagingScrollView *)self navigationOrientation];
    double v56 = 0.0;
    if (v55) {
      double v57 = 0.0;
    }
    else {
      double v57 = v54;
    }
    if (v55) {
      double v56 = v54;
    }
    -[BKPagingScrollView setContentOffset:](self, "setContentOffset:", v57, v56);
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)BKPagingScrollView;
  [(BKPagingScrollView *)&v20 layoutSubviews];
  [(BKPagingScrollView *)self contentOffset];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(BKPagingScrollView *)self navigationOrientation];
  [(BKPagingScrollView *)self bounds];
  if (v7) {
    double v12 = v6 / CGRectGetHeight(*(CGRect *)&v8);
  }
  else {
    double v12 = v4 / v10;
  }
  int64_t v13 = [(BKPagingScrollView *)self pageCount];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_pageOffset != 0x7FFFFFFFFFFFFFFFLL) {
      -[BKPagingScrollView _installViewAtIndex:](self, "_installViewAtIndex:");
    }
  }
  else
  {
    int64_t v14 = v13;
    if ((char *)[(BKPagingScrollView *)self layoutDirection] == (char *)&dword_0 + 1) {
      double v12 = (double)[(BKPagingScrollView *)self pageCount] - v12 + -1.0;
    }
    double v15 = floor(v12);
    if (v15 < 0.0) {
      double v15 = 0.0;
    }
    unint64_t v16 = (unint64_t)v15;
    double v17 = (double)(unint64_t)(v14 - 1);
    double v18 = ceil(v12);
    if (v18 < v17) {
      double v17 = v18;
    }
    unint64_t v19 = (unint64_t)v17;
    while (v16 <= v19)
      [(BKPagingScrollView *)self _installViewAtIndex:v16++];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v25.receiver = self;
  v25.super_class = (Class)BKPagingScrollView;
  [(BKPagingScrollView *)&v25 contentOffset];
  if (x != v7 || y != v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)BKPagingScrollView;
    -[BKPagingScrollView setContentOffset:](&v24, "setContentOffset:", x, y);
    if ([(BKPagingScrollView *)self isDecelerating])
    {
      CGFloat v9 = [(BKPagingScrollView *)self valueForKey:@"_pageDecelerationTarget"];
      [v9 CGPointValue];
      double v11 = v10;
      double v13 = v12;

      int64_t v14 = [(BKPagingScrollView *)self navigationOrientation];
      [(BKPagingScrollView *)self bounds];
      if (v14) {
        double v19 = v13 / CGRectGetHeight(*(CGRect *)&v15);
      }
      else {
        double v19 = v11 / CGRectGetWidth(*(CGRect *)&v15);
      }
      if ((char *)[(BKPagingScrollView *)self layoutDirection] == (char *)&dword_0 + 1) {
        double v19 = (double)[(BKPagingScrollView *)self pageCount] - v19 + -1.0;
      }
      if (v19 != (double)self->_pageOffset)
      {
        objc_super v20 = [(BKPagingScrollView *)self delegate];
        double v21 = [(BKPagingScrollView *)self viewAtIndex:self->_pageOffset];
        [v20 pagingScrollView:self viewDidDisappear:v21 atIndex:self->_pageOffset];

        self->_pageOffset = (uint64_t)v19;
        double v22 = [(BKPagingScrollView *)self delegate];
        float v23 = [(BKPagingScrollView *)self viewAtIndex:self->_pageOffset];
        [v22 pagingScrollView:self viewDidAppear:v23 atIndex:self->_pageOffset];
      }
    }
  }
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  int64_t pageOffset = self->_pageOffset;
  if (pageOffset != a3)
  {
    if (pageOffset != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = [(BKPagingScrollView *)self delegate];
      double v7 = [(BKPagingScrollView *)self viewAtIndex:self->_pageOffset];
      [v6 pagingScrollView:self viewDidDisappear:v7 atIndex:self->_pageOffset];
    }
    self->_int64_t pageOffset = a3;
    [(BKPagingScrollView *)self _updateContentOffset];
    uint64_t v8 = [(BKPagingScrollView *)self delegate];
    CGFloat v9 = [(BKPagingScrollView *)self viewAtIndex:self->_pageOffset];
    [v8 pagingScrollView:self viewDidAppear:v9 atIndex:self->_pageOffset];

    [(BKPagingScrollView *)self setNeedsLayout];
  }
}

- (void)setPageCount:(int64_t)a3
{
  if (self->_pageCount != a3)
  {
    self->_pageCount = a3;
    [(BKPagingScrollView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    if ([(BKPagingScrollView *)self navigationOrientation])
    {
      v17.origin.double x = v5;
      v17.origin.double y = v7;
      v17.size.double width = v9;
      v17.size.double height = v11;
      double Width = CGRectGetWidth(v17);
      double v13 = (double)[(BKPagingScrollView *)self pageCount];
      v18.origin.double x = v5;
      v18.origin.double y = v7;
      v18.size.double width = v9;
      v18.size.double height = v11;
      double Height = CGRectGetHeight(v18) * v13;
    }
    else
    {
      double v15 = (double)[(BKPagingScrollView *)self pageCount];
      v19.origin.double x = v5;
      v19.origin.double y = v7;
      v19.size.double width = v9;
      v19.size.double height = v11;
      double Width = CGRectGetWidth(v19) * v15;
      v20.origin.double x = v5;
      v20.origin.double y = v7;
      v20.size.double width = v9;
      v20.size.double height = v11;
      double Height = CGRectGetHeight(v20);
    }
    -[BKPagingScrollView setContentSize:](self, "setContentSize:", Width, Height);
    [(BKPagingScrollView *)self _updateContentOffset];
    [(BKPagingScrollView *)self setNeedsLayout];
  }
}

- (void)_updateContentOffset
{
  if ([(BKPagingScrollView *)self pageOffset] != 0x7FFFFFFFFFFFFFFFLL
    && [(BKPagingScrollView *)self pageCount] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKPagingScrollView *)self _frameForPageAtIndex:[(BKPagingScrollView *)self pageOffset]];
    double v4 = v3;
    double v6 = v5;
    int64_t v7 = [(BKPagingScrollView *)self navigationOrientation];
    if (v7) {
      double v8 = v6 + -20.0;
    }
    else {
      double v8 = v6;
    }
    if (v7) {
      double v9 = v4;
    }
    else {
      double v9 = v4 + -20.0;
    }
    -[BKPagingScrollView setContentOffset:](self, "setContentOffset:", v9, v8, v4 + -20.0);
  }
}

- (CGRect)_frameForPageAtIndex:(int64_t)a3
{
  [(BKPagingScrollView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if ([(BKPagingScrollView *)self navigationOrientation])
  {
    v21.origin.double x = v6;
    v21.origin.double y = v8;
    v21.size.double width = v10;
    v21.size.double height = v12;
    double v13 = (double)a3 * CGRectGetHeight(v21) + 20.0;
    v22.origin.double x = v6;
    v22.origin.double y = v8;
    v22.size.double width = v10;
    v22.size.double height = v12;
    double Width = CGRectGetWidth(v22);
    v23.origin.double x = v6;
    v23.origin.double y = v8;
    v23.size.double width = v10;
    v23.size.double height = v12;
    double Height = CGRectGetHeight(v23) + -40.0;
    double v16 = 0.0;
  }
  else
  {
    int64_t v17 = [(BKPagingScrollView *)self layoutDirection];
    if ([(BKPagingScrollView *)self pageCount] != 0x7FFFFFFFFFFFFFFFLL && v17 == 1) {
      a3 = [(BKPagingScrollView *)self pageCount] + ~a3;
    }
    v24.origin.double x = v6;
    v24.origin.double y = v8;
    v24.size.double width = v10;
    v24.size.double height = v12;
    double v16 = (double)a3 * CGRectGetWidth(v24) + 20.0;
    v25.origin.double x = v6;
    v25.origin.double y = v8;
    v25.size.double width = v10;
    v25.size.double height = v12;
    double Width = CGRectGetWidth(v25) + -40.0;
    v26.origin.double x = v6;
    v26.origin.double y = v8;
    v26.size.double width = v10;
    v26.size.double height = v12;
    double Height = CGRectGetHeight(v26);
    double v13 = 0.0;
  }
  double v18 = v16;
  double v19 = v13;
  double v20 = Width;
  result.size.double height = Height;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (int64_t)_indexForView:(id)a3
{
  id v3 = [a3 tag];
  if ((uint64_t)v3 <= 999999) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return (int64_t)v3 - 1000000;
  }
}

- (id)viewAtIndex:(int64_t)a3
{
  return [(BKPagingScrollView *)self viewWithTag:a3 + 1000000];
}

- (UIView)currentView
{
  int64_t v3 = [(BKPagingScrollView *)self pageOffset];

  return (UIView *)[(BKPagingScrollView *)self viewAtIndex:v3];
}

- (NSArray)surroundingViews
{
  int64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(BKPagingScrollView *)self subviews];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        CGFloat v10 = [(BKPagingScrollView *)self _indexForView:v9];
        if (v10 != (void *)0x7FFFFFFFFFFFFFFFLL && v10 != (void *)[(BKPagingScrollView *)self pageOffset]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)allViews
{
  int64_t v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(BKPagingScrollView *)self subviews];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(BKPagingScrollView *)self _indexForView:v9] != 0x7FFFFFFFFFFFFFFFLL) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)_installViewAtIndex:(int64_t)a3
{
  id v5 = -[BKPagingScrollView viewAtIndex:](self, "viewAtIndex:");
  if (v5)
  {
    [(BKPagingScrollView *)self _frameForPageAtIndex:a3];
    [v5 setFrame:];
  }
  else
  {
    id v6 = [(BKPagingScrollView *)self delegate];
    uint64_t v7 = [v6 pagingScrollView:self viewAtIndex:a3];

    [v7 setTag:a3 + 1000000];
    [(BKPagingScrollView *)self _frameForPageAtIndex:a3];
    [v7 setFrame:];
    [(BKPagingScrollView *)self addSubview:v7];
    CGFloat v8 = [(BKPagingScrollView *)self delegate];
    [v8 pagingScrollView:self didAddView:v7 atIndex:a3];
  }
  return v5 == 0;
}

- (void)removeSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  [v6 removeFromSuperview];
  id v7 = [(BKPagingScrollView *)self delegate];
  [v7 pagingScrollView:self didRemoveView:v6 atIndex:a4];
}

- (void)updateCachedPages
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int64_t v3 = [(BKPagingScrollView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        int64_t v9 = [(BKPagingScrollView *)self _indexForView:v8];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v10 = v9;
          int64_t v11 = [(BKPagingScrollView *)self pageOffset];
          if (v10 < (uint64_t)(v11
                             + ~(unint64_t)[(BKPagingScrollView *)self pageCacheDistance])
            || (int64_t v12 = [(BKPagingScrollView *)self pageOffset],
                v10 > [(BKPagingScrollView *)self pageCacheDistance] + v12 + 1))
          {
            [(BKPagingScrollView *)self removeSubview:v8 atIndex:v10];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  int64_t v13 = [(BKPagingScrollView *)self pageOffset];
  if (v13 + 1 >= [(BKPagingScrollView *)self pageCount])
  {
    unsigned __int8 v14 = 0;
  }
  else
  {
    unsigned __int8 v14 = 0;
    do
    {
      int64_t v15 = [(BKPagingScrollView *)self pageOffset];
      if (v13 >= [(BKPagingScrollView *)self pageCacheDistance] + v15) {
        break;
      }
      double v16 = [(BKPagingScrollView *)self viewAtIndex:v13 + 1];
      if (!((v16 != 0) | v14 & 1)) {
        unsigned __int8 v14 = [(BKPagingScrollView *)self _installViewAtIndex:v13 + 1];
      }

      int64_t v17 = [(BKPagingScrollView *)self pageCount];
      int64_t v18 = v13 + 2;
      ++v13;
    }
    while (v18 < v17);
  }
  uint64_t v19 = [(BKPagingScrollView *)self pageOffset];
  if (v19 >= 1)
  {
    uint64_t v20 = v19;
    do
    {
      int64_t v21 = [(BKPagingScrollView *)self pageOffset];
      if (v20 <= v21 - [(BKPagingScrollView *)self pageCacheDistance]) {
        break;
      }
      CGRect v22 = [(BKPagingScrollView *)self viewAtIndex:--v20];
      if (!((v22 != 0) | v14 & 1)) {
        unsigned __int8 v14 = [(BKPagingScrollView *)self _installViewAtIndex:v20];
      }
    }
    while ((unint64_t)(v20 + 1) > 1);
  }
}

- (void)purgeCachedPages
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int64_t v3 = [(BKPagingScrollView *)self subviews];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int64_t v9 = [(BKPagingScrollView *)self _indexForView:v8];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v10 = v9;
          [v8 frame];
          CGFloat v12 = v11;
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          [(BKPagingScrollView *)self bounds];
          v29.origin.double x = v19;
          v29.origin.double y = v20;
          v29.size.double width = v21;
          v29.size.double height = v22;
          v28.origin.double x = v12;
          v28.origin.double y = v14;
          v28.size.double width = v16;
          v28.size.double height = v18;
          if (!CGRectIntersectsRect(v28, v29)) {
            [(BKPagingScrollView *)self removeSubview:v8 atIndex:v10];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
}

- (int64_t)navigationOrientation
{
  return self->_navigationOrientation;
}

- (void)setNavigationOrientation:(int64_t)a3
{
  self->_navigationOrientation = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (int64_t)pageCacheDistance
{
  return self->_pageCacheDistance;
}

- (void)setPageCacheDistance:(int64_t)a3
{
  self->_pageCacheDistance = a3;
}

@end