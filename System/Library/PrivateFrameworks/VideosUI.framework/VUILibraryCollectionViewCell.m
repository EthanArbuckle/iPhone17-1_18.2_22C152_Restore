@interface VUILibraryCollectionViewCell
- (UIViewController)viewController;
- (VUISeparatorView)topSeparatorView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setTopSeparatorView:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation VUILibraryCollectionViewCell

- (void)setViewController:(id)a3
{
  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_viewController, a3);
    v6 = [(VUILibraryCollectionViewCell *)self contentView];
    v7 = [(UIViewController *)self->_viewController view];
    [v6 addSubview:v7];

    [(VUILibraryCollectionViewCell *)self setNeedsLayout];
    v5 = v8;
  }
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryCollectionViewCell;
  [(VUILibraryCollectionViewCell *)&v6 prepareForReuse];
  viewController = self->_viewController;
  self->_viewController = 0;

  v4 = [(VUILibraryCollectionViewCell *)self contentView];
  v5 = [v4 subviews];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];
}

- (void)setTopSeparatorView:(id)a3
{
  v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v9 = v5;
    [(VUISeparatorView *)topSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      v8 = [(VUILibraryCollectionViewCell *)self contentView];
      [v8 addSubview:*p_topSeparatorView];
    }
    [(VUILibraryCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)VUILibraryCollectionViewCell;
  [(VUILibraryCollectionViewCell *)&v20 layoutSubviews];
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v4 = v3;
  double v6 = v5;
  v7 = [(VUILibraryCollectionViewCell *)self contentView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView)
  {
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v21) - v4 - v6, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v4, 0.0, v17, v18);
  }
  v19 = [(UIViewController *)self->_viewController view];
  objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end