@interface SKUIViewControllerContainerCollectionViewCell
- (BOOL)managesViewControllerContainerViewLayout;
- (NSIndexPath)indexPath;
- (SKUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)viewControllerContainerView;
- (UIViewController)viewController;
- (double)maximumContentWidth;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3;
- (void)setMaximumContentWidth:(double)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKUIViewControllerContainerCollectionViewCell

- (SKUIViewControllerContainerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewControllerContainerCollectionViewCell initWithFrame:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  v8 = -[SKUIViewControllerContainerCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_managesViewControllerContainerViewLayout = 1;
    [(SKUIViewControllerContainerCollectionViewCell *)v8 setPreservesSuperviewLayoutMargins:1];
    v10 = [(SKUIViewControllerContainerCollectionViewCell *)v9 contentView];
    [v10 setPreservesSuperviewLayoutMargins:1];
    v11 = [SKUIViewControllerContainerView alloc];
    [v10 bounds];
    uint64_t v12 = -[SKUIViewControllerContainerView initWithFrame:](v11, "initWithFrame:");
    viewControllerContainerView = v9->_viewControllerContainerView;
    v9->_viewControllerContainerView = (SKUIViewControllerContainerView *)v12;

    [(SKUIViewControllerContainerView *)v9->_viewControllerContainerView setPreservesSuperviewLayoutMargins:1];
    [v10 addSubview:v9->_viewControllerContainerView];
  }
  return v9;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  [(SKUIViewControllerContainerCollectionViewCell *)&v22 layoutSubviews];
  if (self->_managesViewControllerContainerViewLayout)
  {
    v3 = [(SKUIViewControllerContainerCollectionViewCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if (self->_maximumContentWidth > 0.00000011920929)
    {
      uint64_t v12 = [(SKUIViewControllerContainerCollectionViewCell *)self traitCollection];
      [v12 displayScale];
      double v14 = v13;
      if (v13 <= 0.00000011920929)
      {
        objc_super v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v15 scale];
        double v14 = v16;
      }
      v23.origin.double x = v5;
      v23.origin.double y = v7;
      v23.size.double width = v9;
      v23.size.double height = v11;
      CGRectGetWidth(v23);
      double v21 = v14;
      UIRectCenteredXInRectScale();
      double v5 = v17;
      double v7 = v18;
      double v9 = v19;
      double v11 = v20;
    }
    -[SKUIViewControllerContainerView setFrame:](self->_viewControllerContainerView, "setFrame:", v5, v7, v9, v11, *(void *)&v21);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIViewControllerContainerCollectionViewCell;
  id v4 = a3;
  [(SKUIViewControllerContainerCollectionViewCell *)&v7 applyLayoutAttributes:v4];
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
    [(SKUIViewControllerContainerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setManagesViewControllerContainerViewLayout:(BOOL)a3
{
  if (self->_managesViewControllerContainerViewLayout != a3)
  {
    self->_managesViewControllerContainerViewLayout = a3;
    if (a3) {
      [(SKUIViewControllerContainerCollectionViewCell *)self setNeedsLayout];
    }
  }
}

- (UIViewController)viewController
{
  return [(SKUIViewControllerContainerView *)self->_viewControllerContainerView viewController];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewControllerContainerCollectionViewCell initWithFrame:]";
}

@end