@interface SUPreviewOverlayView
- (SUPreviewOverlayView)initWithFrame:(CGRect)a3;
- (UIView)storePageView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setStorePageView:(id)a3;
@end

@implementation SUPreviewOverlayView

- (SUPreviewOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUPreviewOverlayView;
  v3 = -[SUPreviewOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[SUPreviewOverlayView setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    [(SUPreviewOverlayView *)v3 setOpaque:0];
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom"))
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      v3->_borderView = v4;
      -[UIView setBackgroundColor:](v4, "setBackgroundColor:", [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3]);
      [(SUPreviewOverlayView *)v3 addSubview:v3->_borderView];
    }
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPreviewOverlayView;
  [(SUPreviewOverlayView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(SUPreviewOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  borderView = self->_borderView;
  if (borderView)
  {
    [(UIView *)borderView frame];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    double v13 = 1.0 / v12;
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    -[UIView setFrame:](self->_borderView, "setFrame:", v4, CGRectGetMaxY(v16) - v13, v8, v13);
  }
  storePageView = self->_storePageView;
  if (storePageView)
  {
    -[UIView setFrame:](storePageView, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)setStorePageView:(id)a3
{
  storePageView = self->_storePageView;
  if (storePageView != a3)
  {
    [(UIView *)storePageView removeFromSuperview];

    double v6 = (UIView *)a3;
    self->_storePageView = v6;
    [(SUPreviewOverlayView *)self insertSubview:v6 atIndex:0];
    [(SUPreviewOverlayView *)self setNeedsLayout];
  }
}

- (UIView)storePageView
{
  return self->_storePageView;
}

@end