@interface SKUIModernChartsView
- (SKUIModernChartsView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (_UIBackdropView)backdropView;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_layoutHeadersWithColumnSize:(CGSize)a3;
- (void)_layoutViewControllersWithColumnSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4;
- (void)_updateHeader;
- (void)dealloc;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setColumnViewControllers:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIModernChartsView

- (SKUIModernChartsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIModernChartsView initWithFrame:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIModernChartsView;
  v8 = -[SKUIModernChartsView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v8->_scrollView;
    v8->_scrollView = v9;

    [(UIScrollView *)v8->_scrollView setAutoresizingMask:18];
    [(UIScrollView *)v8->_scrollView setAlwaysBounceHorizontal:1];
    [(UIScrollView *)v8->_scrollView setBouncesHorizontally:1];
    [(UIScrollView *)v8->_scrollView setBouncesVertically:0];
    [(UIScrollView *)v8->_scrollView setCanCancelContentTouches:0];
    [(UIScrollView *)v8->_scrollView setDelaysContentTouches:0];
    [(UIScrollView *)v8->_scrollView setDelegate:v8];
    [(SKUIModernChartsView *)v8 addSubview:v8->_scrollView];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2010];
    backdropView = v8->_backdropView;
    v8->_backdropView = (_UIBackdropView *)v11;

    [(_UIBackdropView *)v8->_backdropView setAutoresizingMask:2];
    [(SKUIModernChartsView *)v8 addSubview:v8->_backdropView];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    headerView = v8->_headerView;
    v8->_headerView = v13;

    [(UIView *)v8->_headerView setAutoresizingMask:2];
    v15 = v8->_headerView;
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(SKUIModernChartsView *)v8 addSubview:v8->_headerView];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v8 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIModernChartsView;
  [(SKUIModernChartsView *)&v4 dealloc];
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setColumnViewControllers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  viewControllers = self->_viewControllers;
  if (viewControllers)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = viewControllers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) view];
          [v12 removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }
  }
  objc_storeStrong((id *)&self->_viewControllers, a3);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = self->_viewControllers;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        scrollView = self->_scrollView;
        objc_super v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "view", (void)v20);
        [(UIScrollView *)scrollView addSubview:v19];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SKUIModernChartsView *)self _updateHeader];
  [(SKUIModernChartsView *)self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  [(SKUIModernChartsView *)self setNeedsLayout];
}

- (void)scrollViewDidScroll:(id)a3
{
  [(UIView *)self->_headerView bounds];
  [(UIScrollView *)self->_scrollView bounds];
  headerView = self->_headerView;

  -[UIView setBounds:](headerView, "setBounds:");
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SKUIModernChartsView;
  [(SKUIModernChartsView *)&v19 layoutSubviews];
  [(SKUIModernChartsView *)self bounds];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v7 = CGRectGetWidth(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v21);
  double top = self->_contentInset.top;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", 0.0, top, v7, 44.0);
  -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, top, v7, 44.0);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v7, v8);
  viewControllers = self->_viewControllers;
  if (viewControllers)
  {
    double v11 = (double)[(NSArray *)viewControllers count];
    double v12 = (double)([(NSArray *)self->_viewControllers count] - 1);
    double v13 = fmax((v7 + -20.0 - v12 * 28.0 + -20.0) / v11, 285.0);
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v12 * 28.0 + 20.0 + v11 * v13 + 20.0, v8);
    double v15 = self->_contentInset.top;
    double left = self->_contentInset.left;
    double bottom = self->_contentInset.bottom;
    double right = self->_contentInset.right;
    backdropView = self->_backdropView;
    if (self->_hideHeader)
    {
      [(_UIBackdropView *)backdropView setHidden:1];
      [(UIView *)self->_headerView setHidden:1];
    }
    else
    {
      [(_UIBackdropView *)backdropView setHidden:0];
      [(UIView *)self->_headerView setHidden:0];
      double v15 = v15 + 44.0;
      -[SKUIModernChartsView _layoutHeadersWithColumnSize:](self, "_layoutHeadersWithColumnSize:", v13, v8);
    }
    -[SKUIModernChartsView _layoutViewControllersWithColumnSize:contentInset:](self, "_layoutViewControllersWithColumnSize:contentInset:", v13, v8, v15, left, bottom, right);
  }
  else
  {
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  [(SKUIModernChartsView *)self _updateHeader];

  [(SKUIModernChartsView *)self setNeedsLayout];
}

- (void)_layoutHeadersWithColumnSize:(CGSize)a3
{
  double width = a3.width;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = self->_headerViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    double v8 = 20.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "frame", (void)v11);
        objc_msgSend(v10, "setFrame:", v8, floor((44.0 - CGRectGetHeight(v17)) * 0.5), width);
        double v8 = width + 28.0 + v8;
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_layoutViewControllersWithColumnSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4
{
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_viewControllers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    double v11 = 20.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "view", (void)v17);
        objc_msgSend(v14, "setFrame:", v11, 0.0, width, height);
        double v15 = [v13 contentScrollView];
        uint64_t v16 = v15;
        if (v15)
        {
          [v15 contentInset];
          [v16 setContentInset:top];
          [v16 scrollIndicatorInsets];
          [v16 setScrollIndicatorInsets:top];
        }
        double v11 = width + 28.0 + v11;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_updateHeader
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  headerViews = self->_headerViews;
  if (!headerViews)
  {
    objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_headerViews;
    self->_headerViews = v4;

    headerViews = self->_headerViews;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = headerViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v10++) removeFromSuperview];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_headerViews removeAllObjects];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v11 = self->_viewControllers;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        long long v17 = objc_alloc_init(SKUIModernChartHeaderView);
        long long v18 = objc_msgSend(v16, "title", (void)v19);
        [(SKUIModernChartHeaderView *)v17 setTitle:v18];

        [(NSMutableArray *)self->_headerViews addObject:v17];
        [(UIView *)self->_headerView addSubview:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  self->_hideHeader = [(NSMutableArray *)self->_headerViews count] == 0;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIModernChartsView initWithFrame:]";
}

@end