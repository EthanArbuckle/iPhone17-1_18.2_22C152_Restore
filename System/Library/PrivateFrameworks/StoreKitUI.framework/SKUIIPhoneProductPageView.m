@interface SKUIIPhoneProductPageView
- (SKUIIPhoneProductPageView)initWithFrame:(CGRect)a3;
- (UIView)bannerView;
- (UIView)view;
- (double)bannerOffset;
- (void)animateYPosition:(double)a3;
- (void)layoutSubviews;
- (void)setBannerOffset:(double)a3;
- (void)setBannerView:(id)a3;
- (void)setView:(id)a3;
@end

@implementation SKUIIPhoneProductPageView

- (SKUIIPhoneProductPageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPhoneProductPageView initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIIPhoneProductPageView;
  v8 = -[SKUIIPhoneProductPageView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.97254902 alpha:1.0];
    [(SKUIIPhoneProductPageView *)v8 setBackgroundColor:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(SKUIIPhoneProductPageView *)v8 addSubview:v10];
  }
  return v8;
}

- (void)setView:(id)a3
{
  v5 = (UIView *)a3;
  view = self->_view;
  if (view != v5)
  {
    v7 = v5;
    [(UIView *)view removeFromSuperview];
    objc_storeStrong((id *)&self->_view, a3);
    [(SKUIIPhoneProductPageView *)self addSubview:self->_view];
    view = (UIView *)[(SKUIIPhoneProductPageView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](view, v5);
}

- (void)setBannerView:(id)a3
{
  v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    v7 = v5;
    [(UIView *)bannerView removeFromSuperview];
    objc_storeStrong((id *)&self->_bannerView, a3);
    [(SKUIIPhoneProductPageView *)self addSubview:self->_bannerView];
    bannerView = (UIView *)[(SKUIIPhoneProductPageView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](bannerView, v5);
}

- (void)animateYPosition:(double)a3
{
  if (a3 != 0.0 && self->_view != 0)
  {
    [(SKUIIPhoneProductPageView *)self bounds];
    double v7 = v6;
    double v9 = v8 - a3;
    [(SKUIIPhoneProductPageView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    id v19 = objc_alloc_init(MEMORY[0x1E4F39B48]);
    [v19 setKeyPath:@"position"];
    [v19 setRemovedOnCompletion:0];
    v14 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [v19 setTimingFunction:v14];

    v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v7, v9);
    [v19 setFromValue:v15];

    v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v13);
    [v19 setToValue:v16];

    [v19 setDuration:0.200000003];
    v17 = [(UIView *)self->_view layer];
    objc_msgSend(v17, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    v18 = [(UIView *)self->_view layer];
    [v18 addAnimation:v19 forKey:@"ANIMATION_KEY"];
  }
}

- (void)layoutSubviews
{
  [(SKUIIPhoneProductPageView *)self bounds];
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
    [(SKUIIPhoneProductPageView *)self bringSubviewToFront:v14];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPhoneProductPageView initWithFrame:]";
}

@end