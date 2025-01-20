@interface OverflowView
- (OverflowView)initWithContentView:(id)a3;
- (UIView)contentView;
- (id)_initialConstraintsForContentView:(id)a3;
- (id)_initialScrollViewConstraints;
- (void)_addContentView:(id)a3;
- (void)layoutSubviews;
- (void)resetContentOffset;
- (void)setContentView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation OverflowView

- (OverflowView)initWithContentView:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OverflowView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[OverflowView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    v9 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, y, width, height];
    scrollView = v8->_scrollView;
    v8->_scrollView = v9;

    [(UIScrollView *)v8->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v8->_scrollView setContentInsetAdjustmentBehavior:2];
    [(OverflowView *)v8 addSubview:v8->_scrollView];
    v11 = [(OverflowView *)v8 _initialScrollViewConstraints];
    +[NSLayoutConstraint activateConstraints:v11];

    [(OverflowView *)v8 _addContentView:v4];
  }

  return v8;
}

- (id)_initialScrollViewConstraints
{
  v20 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v19 = [(OverflowView *)self leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v17 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v16 = [(OverflowView *)self trailingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v21[1] = v15;
  v3 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  id v4 = [v3 widthAnchor];
  v5 = [(OverflowView *)self widthAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  v21[2] = v6;
  v7 = [(UIScrollView *)self->_scrollView topAnchor];
  v8 = [(OverflowView *)self topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v21[3] = v9;
  v10 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v11 = [(OverflowView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[4] = v12;
  id v14 = +[NSArray arrayWithObjects:v21 count:5];

  return v14;
}

- (id)_initialConstraintsForContentView:(id)a3
{
  scrollView = self->_scrollView;
  id v5 = a3;
  v6 = [(UIScrollView *)scrollView frameLayoutGuide];
  v7 = [v6 heightAnchor];
  v8 = [v5 heightAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];

  LODWORD(v10) = 1132068864;
  [v9 setPriority:v10];
  v28 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v27 = [v28 leadingAnchor];
  v26 = [v5 leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v24 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v23 = [v24 trailingAnchor];
  v22 = [v5 trailingAnchor];
  v11 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v11;
  v12 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  objc_super v13 = [v12 topAnchor];
  id v14 = [v5 topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v29[2] = v15;
  v16 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v17 = [v16 bottomAnchor];
  v18 = [v5 bottomAnchor];

  v19 = [v17 constraintEqualToAnchor:v18];
  v29[3] = v19;
  v29[4] = v9;
  id v21 = +[NSArray arrayWithObjects:v29 count:5];

  return v21;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)OverflowView;
  [(OverflowView *)&v8 layoutSubviews];
  [(OverflowView *)self bounds];
  if (v4 != self->_lastLayoutSize.width || v3 != self->_lastLayoutSize.height)
  {
    [(OverflowView *)self bounds];
    self->_lastLayoutSize.double width = v6;
    self->_lastLayoutSize.double height = v7;
    [(UIScrollView *)self->_scrollView layoutIfNeeded];
    [(UIScrollView *)self->_scrollView flashScrollIndicators];
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3) {
    self->_lastLayoutSize = CGSizeZero;
  }
}

- (void)setContentView:(id)a3
{
  contentView = self->_contentView;
  if (contentView != a3)
  {
    id v5 = a3;
    [(UIView *)contentView removeFromSuperview];
    [(OverflowView *)self _addContentView:v5];
  }
}

- (void)resetContentOffset
{
}

- (void)_addContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
  id v5 = a3;
  [(UIScrollView *)self->_scrollView addSubview:v5];
  id v6 = [(OverflowView *)self _initialConstraintsForContentView:v5];
  +[NSLayoutConstraint activateConstraints:v6];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end