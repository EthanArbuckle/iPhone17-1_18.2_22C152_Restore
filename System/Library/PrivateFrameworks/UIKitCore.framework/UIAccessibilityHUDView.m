@interface UIAccessibilityHUDView
+ (CGSize)preferredHUDSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIAccessibilityHUDItem)item;
- (UIAccessibilityHUDView)initWithHUDItem:(id)a3;
- (UIEdgeInsets)imageInsetsForLayout;
- (id)_contentEffectsForItem:(id)a3;
- (id)containerViewForLayout;
- (id)customView;
- (id)imageView;
- (id)itemContainerViewForLayout;
- (id)layoutManager;
- (id)titleLabel;
- (void)_show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateLabelForItem;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setItem:(id)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation UIAccessibilityHUDView

- (UIAccessibilityHUDView)initWithHUDItem:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)UIAccessibilityHUDView;
  v6 = -[UIView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    [(UIView *)v6 setUserInteractionEnabled:0];
    objc_storeStrong((id *)&v7->_item, a3);
    -[UIView setOverrideUserInterfaceStyle:](v7, "setOverrideUserInterfaceStyle:", [v5 customUserInterfaceStyle]);
    uint64_t v8 = objc_opt_new();
    transformContainer = v7->_transformContainer;
    v7->_transformContainer = (UIView *)v8;

    [(UIView *)v7 addSubview:v7->_transformContainer];
    uint64_t v10 = +[UIBlurEffect effectWithStyle:1200];
    blurEffect = v7->_blurEffect;
    v7->_blurEffect = (UIBlurEffect *)v10;

    v12 = [[UIVisualEffectView alloc] initWithEffect:v7->_blurEffect];
    effectView = v7->_effectView;
    v7->_effectView = v12;

    [(UIView *)v7->_effectView setClipsToBounds:1];
    v14 = [(UIView *)v7->_effectView layer];
    [v14 setCornerRadius:17.0];

    uint64_t v15 = *MEMORY[0x1E4F39EA8];
    v16 = [(UIView *)v7->_effectView layer];
    [v16 setCornerCurve:v15];

    [(UIView *)v7->_transformContainer addSubview:v7->_effectView];
    uint64_t v17 = objc_opt_new();
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v17;

    v19 = [UIVisualEffectView alloc];
    v20 = [(UIAccessibilityHUDView *)v7 _contentEffectsForItem:v5];
    uint64_t v21 = [(UIVisualEffectView *)v19 initWithEffect:v20];
    itemEffectView = v7->_itemEffectView;
    v7->_itemEffectView = (UIVisualEffectView *)v21;

    v23 = [(UIVisualEffectView *)v7->_effectView contentView];
    [v23 addSubview:v7->_itemEffectView];

    [(UIImageView *)v7->_imageView setContentMode:1];
    v24 = [v5 image];
    [(UIImageView *)v7->_imageView setImage:v24];

    v25 = [(UIImageView *)v7->_imageView image];

    if (v25)
    {
      v26 = [(UIVisualEffectView *)v7->_itemEffectView contentView];
      [v26 addSubview:v7->_imageView];
    }
    v27 = [v5 customView];

    if (v27)
    {
      uint64_t v28 = [v5 customView];
      customView = v7->_customView;
      v7->_customView = (UIView *)v28;

      v30 = [(UIVisualEffectView *)v7->_itemEffectView contentView];
      [v30 addSubview:v7->_customView];
    }
    uint64_t v31 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v31;

    [(UILabel *)v7->_titleLabel setNumberOfLines:0];
    [(UILabel *)v7->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v7->_titleLabel setMinimumScaleFactor:0.001];
    [(UILabel *)v7->_titleLabel setBaselineAdjustment:0];
    [(UILabel *)v7->_titleLabel setTextAlignment:1];
    v33 = [(UIVisualEffectView *)v7->_itemEffectView contentView];
    [v33 addSubview:v7->_titleLabel];

    [(UIAccessibilityHUDView *)v7 _updateLabelForItem];
    [(UIView *)v7 setAlpha:0.0];
    v34 = v7->_transformContainer;
    v36[0] = UIAccessibilityHUDSmallTransform;
    v36[1] = unk_186B926A0;
    v36[2] = xmmword_186B926B0;
    [(UIView *)v34 setTransform:v36];
  }

  return v7;
}

- (void)setItem:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(UIAccessibilityHUDItem *)self->_item isEqual:v14];
  id v5 = v14;
  if (!v4)
  {
    int v6 = [v14 flattenImage];
    if (v6 == [(UIAccessibilityHUDItem *)self->_item flattenImage])
    {
      int v8 = [v14 disabledAppearance];
      int v7 = v8 ^ [(UIAccessibilityHUDItem *)self->_item disabledAppearance];
    }
    else
    {
      int v7 = 1;
    }
    v9 = (UIAccessibilityHUDItem *)[v14 copy];
    item = self->_item;
    self->_item = v9;

    v11 = [v14 image];
    [(UIImageView *)self->_imageView setImage:v11];

    -[UIView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v14 customUserInterfaceStyle]);
    [(UIAccessibilityHUDView *)self _updateLabelForItem];
    if (v7)
    {
      itemEffectView = self->_itemEffectView;
      v13 = [(UIAccessibilityHUDView *)self _contentEffectsForItem:v14];
      [(UIVisualEffectView *)itemEffectView setEffect:v13];
    }
    [(UIView *)self setNeedsLayout];
    id v5 = v14;
  }
}

- (id)_contentEffectsForItem:(id)a3
{
  id v4 = a3;
  if ([v4 flattenImage])
  {
    blurEffect = self->_blurEffect;
    if ([v4 disabledAppearance]) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 4;
    }
    int v7 = +[UIVibrancyEffect effectForBlurEffect:blurEffect style:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)_updateLabelForItem
{
  v3 = [(UIAccessibilityHUDItem *)self->_item title];
  [(UILabel *)self->_titleLabel setText:v3];

  id v5 = [(UIAccessibilityHUDView *)self layoutManager];
  id v4 = [v5 labelFontForHUD:self];
  [(UILabel *)self->_titleLabel setFont:v4];
}

- (id)layoutManager
{
  if (_MergedGlobals_5 != -1) {
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_4);
  }
  v3 = [(UIAccessibilityHUDItem *)self->_item customView];

  if (v3)
  {
    id v4 = &qword_1EB25C7F0;
    goto LABEL_13;
  }
  uint64_t v5 = [(UIAccessibilityHUDItem *)self->_item image];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(UIAccessibilityHUDItem *)self->_item title],
        int v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
    id v4 = &qword_1EB25C7E8;
  }
  else
  {
    v9 = [(UIAccessibilityHUDItem *)self->_item title];
    if ([v9 length])
    {
      uint64_t v10 = [(UIAccessibilityHUDItem *)self->_item image];

      if (!v10)
      {
        id v4 = &qword_1EB25C7E0;
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v4 = &qword_1EB25C7D8;
  }
LABEL_13:
  v11 = (void *)*v4;
  return v11;
}

void __39__UIAccessibilityHUDView_layoutManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB25C7D8;
  qword_1EB25C7D8 = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_1EB25C7E0;
  qword_1EB25C7E0 = v2;

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)qword_1EB25C7E8;
  qword_1EB25C7E8 = v4;

  uint64_t v6 = objc_opt_new();
  int v7 = (void *)qword_1EB25C7F0;
  qword_1EB25C7F0 = v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(UIAccessibilityHUDView *)self layoutManager];
  objc_msgSend(v6, "unscaledSizeForHUD:containingSize:", self, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityHUDView;
  [(UIView *)&v9 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setBounds:](self->_transformContainer, "setBounds:");
  [(UIView *)self bounds];
  -[UIView setCenter:](self->_transformContainer, "setCenter:", v4 + v3 * 0.5, v6 + v5 * 0.5);
  [(UIView *)self->_transformContainer bounds];
  -[UIView setFrame:](self->_effectView, "setFrame:");
  double v7 = [(UIVisualEffectView *)self->_effectView contentView];
  [v7 bounds];
  -[UIView setFrame:](self->_itemEffectView, "setFrame:");

  double v8 = [(UIAccessibilityHUDView *)self layoutManager];
  [v8 layoutSubviewsOfHUD:self];
}

- (void)_show:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double v8 = (void (**)(void))a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__UIAccessibilityHUDView__show_animated_completion___block_invoke;
  aBlock[3] = &unk_1E52D9FC0;
  aBlock[4] = self;
  BOOL v14 = a3;
  objc_super v9 = _Block_copy(aBlock);
  double v10 = v9;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__UIAccessibilityHUDView__show_animated_completion___block_invoke_2;
    v11[3] = &unk_1E52D9FE8;
    double v12 = v8;
    +[UIView animateWithDuration:v10 animations:v11 completion:0.1];
  }
  else
  {
    (*((void (**)(void *))v9 + 2))(v9);
    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __52__UIAccessibilityHUDView__show_animated_completion___block_invoke(uint64_t a1)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = (long long *)MEMORY[0x1E4F1DAB8];
  }
  else {
    double v3 = &UIAccessibilityHUDSmallTransform;
  }
  long long v4 = v3[1];
  long long v8 = *v3;
  long long v9 = v4;
  long long v10 = v3[2];
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 416);
  v7[0] = v8;
  v7[1] = v4;
  v7[2] = v10;
  return [v5 setTransform:v7];
}

uint64_t __52__UIAccessibilityHUDView__show_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
}

+ (CGSize)preferredHUDSize
{
  double v2 = 220.0;
  double v3 = 220.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)containerViewForLayout
{
  return [(UIVisualEffectView *)self->_effectView contentView];
}

- (id)itemContainerViewForLayout
{
  return [(UIVisualEffectView *)self->_itemEffectView contentView];
}

- (UIEdgeInsets)imageInsetsForLayout
{
  [(UIAccessibilityHUDItem *)self->_item imageInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)titleLabel
{
  return self->_titleLabel;
}

- (id)imageView
{
  return self->_imageView;
}

- (id)customView
{
  return self->_customView;
}

- (UIAccessibilityHUDItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_itemEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_transformContainer, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end