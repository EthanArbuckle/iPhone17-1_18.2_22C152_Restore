@interface SUUIIPadChartsColumnView
- (NSArray)contentViewControllers;
- (UIEdgeInsets)contentInset;
- (UIViewController)selectedViewController;
- (void)_addSelectedViewController;
- (void)layoutSubviews;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentViewControllers:(id)a3;
- (void)setSelectedViewControllerIndex:(int64_t)a3;
@end

@implementation SUUIIPadChartsColumnView

- (UIViewController)selectedViewController
{
  unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (selectedViewControllerIndex >= [(NSArray *)self->_contentViewControllers count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_contentViewControllers objectAtIndex:self->_selectedViewControllerIndex];
  }
  return (UIViewController *)v4;
}

- (void)setContentViewControllers:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_contentViewControllers != v5)
  {
    v8 = v5;
    v6 = [(SUUIIPadChartsColumnView *)self selectedViewController];
    if ([v6 isViewLoaded])
    {
      v7 = [v6 view];
      [v7 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentViewControllers, a3);
    self->_unint64_t selectedViewControllerIndex = 0;
    [(SUUIIPadChartsColumnView *)self _addSelectedViewController];

    v5 = v8;
  }
}

- (void)setSelectedViewControllerIndex:(int64_t)a3
{
  if (self->_selectedViewControllerIndex != a3)
  {
    id v6 = [(SUUIIPadChartsColumnView *)self selectedViewController];
    if ([v6 isViewLoaded])
    {
      v5 = [v6 view];
      [v5 removeFromSuperview];
    }
    self->_unint64_t selectedViewControllerIndex = a3;
    [(SUUIIPadChartsColumnView *)self _addSelectedViewController];
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIIPadChartsColumnView;
  [(SUUIIPadChartsColumnView *)&v5 layoutSubviews];
  v3 = [(SUUIIPadChartsColumnView *)self selectedViewController];
  v4 = [v3 view];
  [(SUUIIPadChartsColumnView *)self bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)_addSelectedViewController
{
  v3 = [(SUUIIPadChartsColumnView *)self selectedViewController];
  if (v3)
  {
    id v21 = v3;
    v4 = [v3 view];
    [(SUUIIPadChartsColumnView *)self addSubview:v4];

    objc_super v5 = [v21 contentScrollView];
    id v6 = v5;
    if (v5)
    {
      p_contentInset = &self->_contentInset;
      double top = p_contentInset->top;
      double left = p_contentInset->left;
      double bottom = p_contentInset->bottom;
      double right = p_contentInset->right;
      [v5 contentOffset];
      double v13 = v12;
      double v15 = v14;
      [v6 scrollIndicatorInsets];
      double v17 = v16;
      double v19 = v18;
      double v20 = top + 44.0;
      if (v15 == 0.0) {
        double v15 = v15 - (p_contentInset->top + 44.0);
      }
      objc_msgSend(v6, "setContentInset:", v20, left, bottom, right);
      objc_msgSend(v6, "setContentOffset:", v13, v15);
      objc_msgSend(v6, "setScrollIndicatorInsets:", v20, v17, bottom, v19);
    }

    v3 = v21;
  }
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

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSArray)contentViewControllers
{
  return self->_contentViewControllers;
}

- (void).cxx_destruct
{
}

@end