@interface SKUIViewControllerContainerView
- (SKUIViewControllerContainerView)initWithFrame:(CGRect)a3;
- (UIViewController)viewController;
- (void)_updateLayoutOfViewControllerView;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKUIViewControllerContainerView

- (SKUIViewControllerContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIViewControllerContainerView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIViewControllerContainerView;
  v8 = -[SKUIViewControllerContainerView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8) {
    [(SKUIViewControllerContainerView *)v8 setPreservesSuperviewLayoutMargins:1];
  }
  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIViewControllerContainerView;
  [(SKUIViewControllerContainerView *)&v3 layoutSubviews];
  [(SKUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIViewControllerContainerView;
  -[SKUIViewControllerContainerView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SKUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIViewControllerContainerView;
  -[SKUIViewControllerContainerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SKUIViewControllerContainerView *)self _updateLayoutOfViewControllerView];
}

- (void)setViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  viewController = self->_viewController;
  v7 = v5;
  objc_super v11 = v5;
  if (viewController != v5)
  {
    if (viewController)
    {
      v8 = [(UIViewController *)viewController view];
      if ([v8 isDescendantOfView:self]) {
        [v8 removeFromSuperview];
      }
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    v7 = self->_viewController;
  }
  if (v7)
  {
    v9 = [(UIViewController *)v7 view];
    v10 = v9;
    if (v9 && ([v9 isDescendantOfView:self] & 1) == 0)
    {
      [v10 removeFromSuperview];
      [(SKUIViewControllerContainerView *)self addSubview:v10];
      [(SKUIViewControllerContainerView *)self setNeedsLayout];
    }
  }
}

- (void)_updateLayoutOfViewControllerView
{
  id v3 = [(UIViewController *)self->_viewController view];
  [(SKUIViewControllerContainerView *)self bounds];
  objc_msgSend(v3, "setFrame:");
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewControllerContainerView initWithFrame:]";
}

@end