@interface SUStorePageView
- (UIEdgeInsets)contentViewInsets;
- (UIView)backdropView;
- (UIView)contentView;
- (UIView)headerView;
- (UIView)previewOverlayView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewInsets:(UIEdgeInsets)a3;
- (void)setHeaderView:(id)a3;
- (void)setPreviewOverlayView:(id)a3;
@end

@implementation SUStorePageView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUStorePageView;
  [(SUStorePageView *)&v3 dealloc];
}

- (void)setBackdropView:(id)a3
{
  backdropView = self->_backdropView;
  if (backdropView != a3)
  {
    [(UIView *)backdropView removeFromSuperview];

    v6 = (UIView *)a3;
    self->_backdropView = v6;
    if (v6)
    {
      [(SUStorePageView *)self insertSubview:v6 atIndex:0];
    }
  }
}

- (void)setContentView:(id)a3
{
  contentView = self->_contentView;
  if (contentView != a3)
  {
    [(UIView *)contentView removeFromSuperview];

    v6 = (UIView *)a3;
    self->_contentView = v6;
    if (v6)
    {
      if (self->_headerScrollView || self->_previewOverlayView)
      {
        -[SUStorePageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v6);
      }
      else
      {
        [(SUStorePageView *)self addSubview:v6];
      }
    }
  }
}

- (void)setHeaderView:(id)a3
{
  headerView = self->_headerView;
  if (headerView != a3)
  {
    [(UIView *)headerView removeFromSuperview];

    v6 = (UIView *)a3;
    self->_headerView = v6;
    headerScrollView = self->_headerScrollView;
    if (v6)
    {
      if (!headerScrollView)
      {
        v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
        self->_headerScrollView = v8;
        [(UIScrollView *)v8 setScrollEnabled:0];
        v9 = self->_headerScrollView;
        if (self->_previewOverlayView) {
          -[SUStorePageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
        }
        else {
          [(SUStorePageView *)self addSubview:v9];
        }
      }
      [(UIScrollView *)self->_headerScrollView addSubview:self->_headerView];
    }
    else
    {
      [(UIScrollView *)headerScrollView removeFromSuperview];

      self->_headerScrollView = 0;
    }
    [(SUStorePageView *)self setNeedsLayout];
  }
}

- (void)setPreviewOverlayView:(id)a3
{
  previewOverlayView = self->_previewOverlayView;
  if (previewOverlayView != a3)
  {
    if ((SUStorePageView *)[(UIView *)previewOverlayView superview] == self) {
      [(UIView *)self->_previewOverlayView removeFromSuperview];
    }

    v6 = (UIView *)a3;
    self->_previewOverlayView = v6;
    if (v6)
    {
      [(SUStorePageView *)self addSubview:v6];
    }
  }
}

- (void)setContentViewInsets:(UIEdgeInsets)a3
{
  if (self->_contentViewInsets.left != a3.left
    || self->_contentViewInsets.top != a3.top
    || self->_contentViewInsets.right != a3.right
    || self->_contentViewInsets.bottom != a3.bottom)
  {
    self->_contentViewInsets = a3;
    [(SUStorePageView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUStorePageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  previewOverlayView = self->_previewOverlayView;
  if (previewOverlayView)
  {
    [(UIView *)previewOverlayView frame];
    double v13 = v12;
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    -[UIView setFrame:](self->_previewOverlayView, "setFrame:", v4, v6, CGRectGetWidth(v23), v13);
  }
  if (self->_headerScrollView)
  {
    double top = self->_contentViewInsets.top;
    [(UIView *)self->_headerView frame];
    double v16 = top - v15;
    [(UIView *)self->_headerView frame];
    double v18 = v17;
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    double Width = CGRectGetWidth(v24);
    -[UIScrollView setFrame:](self->_headerScrollView, "setFrame:", v4, v16, Width, v18);
    -[UIScrollView setContentSize:](self->_headerScrollView, "setContentSize:", Width, v18);
    headerView = self->_headerView;
    [(UIScrollView *)self->_headerScrollView bounds];
    -[UIView setFrame:](headerView, "setFrame:");
  }
  contentView = self->_contentView;

  -[UIView setFrame:](contentView, "setFrame:", v4, v6, v8, v10);
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)previewOverlayView
{
  return self->_previewOverlayView;
}

- (UIEdgeInsets)contentViewInsets
{
  double top = self->_contentViewInsets.top;
  double left = self->_contentViewInsets.left;
  double bottom = self->_contentViewInsets.bottom;
  double right = self->_contentViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end