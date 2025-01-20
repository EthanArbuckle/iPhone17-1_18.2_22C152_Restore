@interface SUUIViewControllerContainerCollectionViewCell
- (BOOL)managesViewControllerContainerViewLayout;
- (NSIndexPath)indexPath;
- (SUUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)viewControllerContainerView;
- (UIViewController)viewController;
- (double)maximumContentWidth;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3;
- (void)setMaximumContentWidth:(double)a3;
- (void)setViewController:(id)a3;
@end

@implementation SUUIViewControllerContainerCollectionViewCell

- (SUUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  v3 = -[SUUIViewControllerContainerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_managesViewControllerContainerViewLayout = 1;
    [(SUUIViewControllerContainerCollectionViewCell *)v3 setPreservesSuperviewLayoutMargins:1];
    v5 = [(SUUIViewControllerContainerCollectionViewCell *)v4 contentView];
    [v5 setPreservesSuperviewLayoutMargins:1];
    v6 = [SUUIViewControllerContainerView alloc];
    [v5 bounds];
    uint64_t v7 = -[SUUIViewControllerContainerView initWithFrame:](v6, "initWithFrame:");
    viewControllerContainerView = v4->_viewControllerContainerView;
    v4->_viewControllerContainerView = (SUUIViewControllerContainerView *)v7;

    [(SUUIViewControllerContainerView *)v4->_viewControllerContainerView setPreservesSuperviewLayoutMargins:1];
    [v5 addSubview:v4->_viewControllerContainerView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  [(SUUIViewControllerContainerCollectionViewCell *)&v22 layoutSubviews];
  if (self->_managesViewControllerContainerViewLayout)
  {
    v3 = [(SUUIViewControllerContainerCollectionViewCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if (self->_maximumContentWidth > 0.00000011920929)
    {
      v12 = [(SUUIViewControllerContainerCollectionViewCell *)self traitCollection];
      [v12 displayScale];
      double v14 = v13;
      if (v13 <= 0.00000011920929)
      {
        v15 = [MEMORY[0x263F82B60] mainScreen];
        [v15 scale];
        double v14 = v16;
      }
      v23.origin.x = v5;
      v23.origin.y = v7;
      v23.size.width = v9;
      v23.size.height = v11;
      CGRectGetWidth(v23);
      double v21 = v14;
      UIRectCenteredXInRectScale();
      double v5 = v17;
      double v7 = v18;
      double v9 = v19;
      double v11 = v20;
    }
    -[SUUIViewControllerContainerView setFrame:](self->_viewControllerContainerView, "setFrame:", v5, v7, v9, v11, *(void *)&v21);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIViewControllerContainerCollectionViewCell;
  id v4 = a3;
  [(SUUIViewControllerContainerCollectionViewCell *)&v7 applyLayoutAttributes:v4];
  objc_msgSend(v4, "indexPath", v7.receiver, v7.super_class);
  double v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  indexPath = self->_indexPath;
  self->_indexPath = v5;
}

- (void)setViewController:(id)a3
{
}

- (void)setMaximumContentWidth:(double)a3
{
  if (vabdd_f64(self->_maximumContentWidth, a3) > 0.00000011920929)
  {
    self->_maximumContentWidth = a3;
    [(SUUIViewControllerContainerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3
{
  if (self->_managesViewControllerContainerViewLayout != a3)
  {
    self->_managesViewControllerContainerViewLayout = a3;
    if (a3) {
      [(SUUIViewControllerContainerCollectionViewCell *)self setNeedsLayout];
    }
  }
}

- (UIViewController)viewController
{
  return [(SUUIViewControllerContainerView *)self->_viewControllerContainerView viewController];
}

- (UIView)viewControllerContainerView
{
  return (UIView *)self->_viewControllerContainerView;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (BOOL)managesViewControllerContainerViewLayout
{
  return self->_managesViewControllerContainerViewLayout;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_viewControllerContainerView, 0);
}

@end