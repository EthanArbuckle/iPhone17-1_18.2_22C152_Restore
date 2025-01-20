@interface SearchUICustomViewControllerCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)hostedView;
- (UIViewController)embeddedViewController;
- (void)layoutSubviews;
- (void)setEmbeddedViewController:(id)a3;
- (void)setHostedView:(id)a3;
@end

@implementation SearchUICustomViewControllerCell

- (void)setEmbeddedViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (self->_embeddedViewController != v5)
  {
    v11 = v5;
    v6 = [(SearchUICustomViewControllerCell *)self hostedView];
    [v6 removeFromSuperview];

    if (v11)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB2068]);
      v8 = [(UIViewController *)v11 view];
      v9 = (void *)[v7 initWithHostedView:v8];

      v10 = [(SearchUICustomViewControllerCell *)self contentView];
      [v10 addSubview:v9];

      [(SearchUICollectionViewCell *)self setUseSystemSizing:1];
      [(SearchUICustomViewControllerCell *)self setHostedView:v9];
    }
    objc_storeStrong((id *)&self->_embeddedViewController, a3);
    v5 = v11;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(SearchUICustomViewControllerCell *)self hostedView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUICustomViewControllerCell;
  [(SearchUICollectionViewCell *)&v13 layoutSubviews];
  v3 = [(SearchUICustomViewControllerCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SearchUICustomViewControllerCell *)self hostedView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (UIViewController)embeddedViewController
{
  return self->_embeddedViewController;
}

- (UIView)hostedView
{
  return (UIView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setHostedView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
}

@end