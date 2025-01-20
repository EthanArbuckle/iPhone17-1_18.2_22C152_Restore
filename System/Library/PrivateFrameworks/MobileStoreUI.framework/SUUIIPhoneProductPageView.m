@interface SUUIIPhoneProductPageView
- (SUUIIPhoneProductPageView)initWithFrame:(CGRect)a3;
- (UIView)bannerView;
- (UIView)view;
- (double)bannerOffset;
- (void)animateYPosition:(double)a3;
- (void)layoutSubviews;
- (void)setBannerOffset:(double)a3;
- (void)setBannerView:(id)a3;
- (void)setView:(id)a3;
@end

@implementation SUUIIPhoneProductPageView

- (SUUIIPhoneProductPageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageView;
  v3 = -[SUUIIPhoneProductPageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.97254902 alpha:1.0];
    [(SUUIIPhoneProductPageView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
    [(SUUIIPhoneProductPageView *)v3 addSubview:v5];
  }
  return v3;
}

- (void)setView:(id)a3
{
  id v5 = (UIView *)a3;
  view = self->_view;
  if (view != v5)
  {
    objc_super v7 = v5;
    [(UIView *)view removeFromSuperview];
    objc_storeStrong((id *)&self->_view, a3);
    [(SUUIIPhoneProductPageView *)self addSubview:self->_view];
    view = (UIView *)[(SUUIIPhoneProductPageView *)self setNeedsLayout];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](view, v5);
}

- (void)setBannerView:(id)a3
{
  id v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    objc_super v7 = v5;
    [(UIView *)bannerView removeFromSuperview];
    objc_storeStrong((id *)&self->_bannerView, a3);
    [(SUUIIPhoneProductPageView *)self addSubview:self->_bannerView];
    bannerView = (UIView *)[(SUUIIPhoneProductPageView *)self setNeedsLayout];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](bannerView, v5);
}

- (void)animateYPosition:(double)a3
{
  if (a3 != 0.0 && self->_view != 0)
  {
    [(SUUIIPhoneProductPageView *)self bounds];
    double v7 = v6;
    double v9 = v8 - a3;
    [(SUUIIPhoneProductPageView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    id v19 = objc_alloc_init(MEMORY[0x263F15760]);
    [v19 setKeyPath:@"position"];
    [v19 setRemovedOnCompletion:0];
    v14 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
    [v19 setTimingFunction:v14];

    v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v7, v9);
    [v19 setFromValue:v15];

    v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v11, v13);
    [v19 setToValue:v16];

    [v19 setDuration:0.200000003];
    v17 = [(UIView *)self->_view layer];
    objc_msgSend(v17, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

    v18 = [(UIView *)self->_view layer];
    [v18 addAnimation:v19 forKey:@"ANIMATION_KEY"];
  }
}

- (void)layoutSubviews
{
  [(SUUIIPhoneProductPageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  view = self->_view;
  if (view) {
    [(UIView *)view setFrame:v3];
  }
  bannerView = self->_bannerView;
  if (bannerView)
  {
    [(UIView *)bannerView frame];
    double bannerOffset = self->_bannerOffset;
    -[UIView sizeThatFits:](self->_bannerView, "sizeThatFits:", v6, v8);
    -[UIView setFrame:](self->_bannerView, "setFrame:", v4, bannerOffset, v12, v13);
    v14 = self->_bannerView;
    [(SUUIIPhoneProductPageView *)self bringSubviewToFront:v14];
  }
}

- (UIView)view
{
  return self->_view;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (double)bannerOffset
{
  return self->_bannerOffset;
}

- (void)setBannerOffset:(double)a3
{
  self->_double bannerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end