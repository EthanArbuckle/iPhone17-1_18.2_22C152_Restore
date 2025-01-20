@interface PKPassBannerMinimalView
- (CGSize)_layoutWithBounds:(CGRect)a3 commit:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassBannerMinimalView)init;
- (PKPassBannerMinimalView)initWithCoder:(id)a3;
- (id)_initWithStyle:(int64_t)a3 leadingView:(id)a4 trailingView:(id)a5;
- (void)_setInteritemPadding:(double)a3;
- (void)layoutSubviews;
@end

@implementation PKPassBannerMinimalView

- (PKPassBannerMinimalView)init
{
  return 0;
}

- (PKPassBannerMinimalView)initWithCoder:(id)a3
{
  return 0;
}

- (id)_initWithStyle:(int64_t)a3 leadingView:(id)a4 trailingView:(id)a5
{
  v8 = (void **)a4;
  id result = a5;
  if (v8 && (id v10 = result) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKPassBannerMinimalView;
    v11 = [(PKPassBannerMinimalView *)&v17 init];
    v12 = v11;
    if (v11)
    {
      v11->_style = a3;
      v13 = -[PKPassBannerLeadingView _initWithStyle:pass:]((id *)[PKPassBannerLeadingView alloc], v8[51], v8[52]);
      leadingView = v12->_leadingView;
      v12->_leadingView = (PKPassBannerLeadingView *)v13;

      uint64_t v15 = -[PKPassBannerTrailingView _initWithStyle:configuration:]((uint64_t)[PKPassBannerTrailingView alloc], *((void *)v10 + 51), *((void **)v10 + 52));
      trailingView = v12->_trailingView;
      v12->_trailingView = (PKPassBannerTrailingView *)v15;

      [(PKPassBannerMinimalView *)v12 addSubview:v12->_leadingView];
      [(PKPassBannerMinimalView *)v12 addSubview:v12->_trailingView];
    }

    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPassBannerMinimalView _layoutWithBounds:commit:](self, "_layoutWithBounds:commit:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassBannerMinimalView;
  [(PKPassBannerMinimalView *)&v3 layoutSubviews];
  [(PKPassBannerMinimalView *)self bounds];
  -[PKPassBannerMinimalView _layoutWithBounds:commit:](self, "_layoutWithBounds:commit:", 1);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 commit:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PKPassBannerLeadingView sizeThatFits:](self->_leadingView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v7);
  double v9 = v8;
  double v11 = v10;
  -[PKPassBannerTrailingView sizeThatFits:](self->_trailingView, "sizeThatFits:", v6, v7);
  double v14 = v12;
  double v15 = v13;
  BOOL v16 = v9 <= 0.0;
  if (v11 <= 0.0) {
    BOOL v16 = 1;
  }
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    BOOL v21 = 0;
    double v22 = 1.0;
    double v23 = 1.0;
    goto LABEL_20;
  }
  image = trailingView->_image;
  BOOL v20 = v12 > 0.0 && image != 0;
  BOOL v21 = v13 > 0.0 && v20;
  if (v16 || !v21)
  {
    if (v21) {
      double v22 = v13;
    }
    else {
      double v22 = 1.0;
    }
    if (v21) {
      double v23 = v14;
    }
    else {
      double v23 = 1.0;
    }
LABEL_20:
    if (v16) {
      double v24 = v22;
    }
    else {
      double v24 = v11;
    }
    if (v16) {
      double v25 = v23;
    }
    else {
      double v25 = v9;
    }
    if (v4)
    {
      double v40 = v24;
      double v42 = v25;
      leadingView = self->_leadingView;
      if (!v16) {
        PKSizeAspectFit();
      }
      PKSizeAlignedInRect();
      -[PKPassBannerLeadingView setFrame:](leadingView, "setFrame:");
      v27 = self->_trailingView;
      if (v21) {
        PKSizeAspectFit();
      }
      PKSizeAlignedInRect();
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  double v25 = fmax(v9, v12);
  double interitemPadding = self->_interitemPadding;
  double v24 = v13 + v11 + interitemPadding;
  if (v4)
  {
    double v40 = v15 + v11 + interitemPadding;
    double v42 = v25;
    PKSizeAspectFit();
    PKSizeAspectFit();
    PKSizeAlignedInRect();
    v29 = self->_leadingView;
    PKRectRoundToPixel(v30, v31, v32, v33, v34);
    -[PKPassBannerLeadingView setFrame:](v29, "setFrame:");
    PKSizeAlignedInRect();
    v27 = self->_trailingView;
    PKRectRoundToPixel(v35, v36, v37, v38, v39);
LABEL_34:
    -[PKPassBannerTrailingView setFrame:](v27, "setFrame:", *(void *)&v40, *(void *)&v42);
    double v24 = v41;
    double v25 = v43;
  }
LABEL_37:
  result.height = v24;
  result.width = v25;
  return result;
}

- (void)_setInteritemPadding:(double)a3
{
  if (self->_interitemPadding != a3)
  {
    self->_double interitemPadding = a3;
    [(PKPassBannerMinimalView *)self setNeedsLayout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passBannerMinimalViewDidChangeSize:self];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingView, 0);

  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end