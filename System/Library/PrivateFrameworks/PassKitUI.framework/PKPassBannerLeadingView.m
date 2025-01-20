@interface PKPassBannerLeadingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassBannerLeadingView)init;
- (PKPassBannerLeadingView)initWithCoder:(id)a3;
- (PKPassBannerLeadingView)initWithFrame:(CGRect)a3;
- (id)_initWithStyle:(void *)a3 pass:;
- (void)layoutSubviews;
@end

@implementation PKPassBannerLeadingView

- (PKPassBannerLeadingView)init
{
  return 0;
}

- (PKPassBannerLeadingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPassBannerLeadingView)initWithCoder:(id)a3
{
  return 0;
}

- (id)_initWithStyle:(void *)a3 pass:
{
  result = a3;
  v7 = result;
  if (!a1)
  {
LABEL_7:

    return a1;
  }
  if (result)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKPassBannerLeadingView;
    v8 = (id *)objc_msgSendSuper2(&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = v8;
    if (v8)
    {
      v8[51] = a2;
      objc_storeStrong(v8 + 52, a3);
      v9 = [PKPassThumbnailView alloc];
      if (v9) {
        v9 = (PKPassThumbnailView *)-[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:](v9, a1[52], 375, 0, 0);
      }
      id v10 = a1[53];
      a1[53] = v9;

      -[PKPassThumbnailView setShadowVisibility:]((uint64_t)a1[53], 0.0);
      [a1 addSubview:a1[53]];
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t style = self->_style;
  passView = self->_passView;
  double v5 = 15.0;
  if (style != 1) {
    double v5 = 63.0;
  }
  -[PKPassThumbnailView sizeThatFits:](passView, "sizeThatFits:", 1.79769313e308, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassBannerLeadingView;
  [(PKPassBannerLeadingView *)&v6 layoutSubviews];
  [(PKPassBannerLeadingView *)self bounds];
  passView = self->_passView;
  -[PKPassThumbnailView sizeThatFits:](passView, "sizeThatFits:", v4, v5);
  PKSizeAlignedInRect();
  -[PKPassThumbnailView setFrame:](passView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end