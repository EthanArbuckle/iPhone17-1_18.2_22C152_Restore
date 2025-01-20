@interface PREditingButton
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (MTMaterialView)backgroundView;
- (PREditingButton)initWithStyle:(int64_t)a3 frame:(CGRect)a4 primaryAction:(id)a5;
- (PREditingButtonMaterialView)materialView;
- (UIEdgeInsets)backgroundInsets;
- (UIImage)defaultContentImage;
- (UIImageView)contentImageView;
- (UIView)backgroundColorView;
- (int64_t)style;
- (void)_didInvalidateContentImageMetrics;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PREditingButton

- (PREditingButton)initWithStyle:(int64_t)a3 frame:(CGRect)a4 primaryAction:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PREditingButton;
  v6 = -[PREditingButton initWithFrame:primaryAction:](&v19, sel_initWithFrame_primaryAction_, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    [(PREditingButton *)v6 setClipsToBounds:1];
    v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v9 = [v8 background];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    [(PREditingButton *)v7 setConfiguration:v8];
    v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A000]];
    [v11 setName:@"highlightBrightness"];
    [v11 setValue:&unk_1ED9EF0C0 forKey:@"inputAmount"];
    v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v12 setName:@"highlightSaturation"];
    [v12 setValue:&unk_1ED9EF0D0 forKey:@"inputAmount"];
    v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    [v13 setName:@"enabledMultiplyColor"];
    id v14 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v13, "setValue:forKeyPath:", objc_msgSend(v14, "CGColor"), @"inputColor");

    v15 = [(PREditingButton *)v7 layer];
    v20[0] = v11;
    v20[1] = v12;
    v20[2] = v13;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    [v15 setFilters:v16];

    v17 = [(PREditingButton *)v7 layer];
    [v17 setAllowsGroupOpacity:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  v65[3] = *MEMORY[0x1E4F143B8];
  v63.receiver = self;
  v63.super_class = (Class)PREditingButton;
  [(PREditingButton *)&v63 layoutSubviews];
  v3 = [(PREditingButton *)self configuration];
  [v3 contentInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(PREditingButton *)self bounds];
  double v16 = PRDirectionalEdgeInsetsInsetRect([(PREditingButton *)self effectiveUserInterfaceLayoutDirection], v12, v13, v14, v15, v5, v7, v9, v11);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  int64_t v23 = [(PREditingButton *)self style];
  if ((unint64_t)(v23 - 1) >= 2)
  {
    if (!v23)
    {
      materialView = self->_materialView;
      if (!materialView)
      {
        v27 = [(PREditingButton *)self traitCollection];
        if (!v27)
        {
          v27 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
        }
        v28 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
        v64[0] = v28;
        v65[0] = @"editingButtonLight";
        v29 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
        v64[1] = v29;
        v65[1] = @"editingButtonLight";
        v30 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
        v64[2] = v30;
        v65[2] = @"editingButtonDark";
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];

        v32 = (void *)MEMORY[0x1E4F743C8];
        v33 = PRBundle();
        v34 = [v32 materialViewWithRecipeNamesByTraitCollection:v31 inBundle:v33 options:0 initialWeighting:0 scaleAdjustment:v27 compatibleWithTraitCollection:1.0];
        backgroundView = self->_backgroundView;
        self->_backgroundView = v34;

        v36 = self->_backgroundView;
        self;
        v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v38 = NSStringFromClass(v37);
        [(MTMaterialView *)v36 setGroupNameBase:v38];

        v39 = [(MTMaterialView *)self->_backgroundView layer];
        [v39 setCornerCurve:*MEMORY[0x1E4F39EA8]];

        v40 = [PREditingButtonMaterialView alloc];
        v41 = self->_backgroundView;
        v42 = [(PREditingButton *)self defaultContentImage];
        v43 = -[PREditingButtonMaterialView initWithFrame:backgroundView:foregroundImage:](v40, "initWithFrame:backgroundView:foregroundImage:", v41, v42, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v44 = self->_materialView;
        self->_materialView = v43;

        [(PREditingButtonMaterialView *)self->_materialView setUserInteractionEnabled:0];
        v45 = self->_materialView;
        [(PREditingButton *)self backgroundInsets];
        -[PREditingButtonMaterialView setBackgroundInsets:](v45, "setBackgroundInsets:");
        [(PREditingButton *)self addSubview:self->_materialView];

        materialView = self->_materialView;
      }
      -[PREditingButtonMaterialView setFrame:](materialView, "setFrame:", v16, v18, v20, v22);
    }
  }
  else
  {
    backgroundColorView = self->_backgroundColorView;
    if (!backgroundColorView)
    {
      if (v23 == 1)
      {
        v25 = [MEMORY[0x1E4FB1618] colorWithRed:0.596078431 green:0.596078431 blue:0.615686275 alpha:0.9];
        [MEMORY[0x1E4FB1618] blackColor];
      }
      else
      {
        v25 = [MEMORY[0x1E4FB1618] systemBlueColor];
        [MEMORY[0x1E4FB1618] whiteColor];
      v46 = };
      id v47 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      v48 = (UIView *)objc_msgSend(v47, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v49 = self->_backgroundColorView;
      self->_backgroundColorView = v48;

      [(UIView *)self->_backgroundColorView setUserInteractionEnabled:0];
      [(UIView *)self->_backgroundColorView setBackgroundColor:v25];
      v50 = [(UIView *)self->_backgroundColorView layer];
      [v50 setCornerCurve:*MEMORY[0x1E4F39EA8]];

      [(PREditingButton *)self addSubview:self->_backgroundColorView];
      v51 = [(PREditingButton *)self defaultContentImage];
      v52 = [v51 imageWithRenderingMode:2];

      v53 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v52];
      contentImageView = self->_contentImageView;
      self->_contentImageView = v53;

      [(UIImageView *)self->_contentImageView setTintColor:v46];
      [(UIView *)self->_backgroundColorView addSubview:self->_contentImageView];

      backgroundColorView = self->_backgroundColorView;
    }
    -[UIView setFrame:](backgroundColorView, "setFrame:", v16, v18, v20, v22);
    v55 = [(UIView *)self->_backgroundColorView layer];
    [(UIView *)self->_backgroundColorView bounds];
    [v55 setCornerRadius:CGRectGetHeight(v66) * 0.5];

    v56 = self->_contentImageView;
    v57 = self->_backgroundColorView;
    [(UIView *)v57 center];
    double v59 = v58;
    double v61 = v60;
    v62 = [(UIView *)self->_backgroundColorView superview];
    -[UIView convertPoint:fromView:](v57, "convertPoint:fromView:", v62, v59, v61);
    -[UIImageView setCenter:](v56, "setCenter:");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PREditingButton *)self isHighlighted];
  v13.receiver = self;
  v13.super_class = (Class)PREditingButton;
  [(PREditingButton *)&v13 setHighlighted:v3];
  if (v5 != v3)
  {
    double v6 = [(PREditingButton *)self layer];
    double v7 = v6;
    if (v3)
    {
      [v6 setValue:&unk_1ED9EF0E0 forKeyPath:@"filters.highlightBrightness.inputAmount"];
      double v8 = [(PREditingButton *)self traitCollection];
      uint64_t v9 = [v8 userInterfaceStyle];

      if (v9 == 2) {
        [v7 setValue:&unk_1ED9EF0F0 forKeyPath:@"filters.highlightSaturation.inputAmount"];
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __34__PREditingButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E54DAFB8;
      id v12 = v6;
      [v10 animateWithDuration:2 delay:v11 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __34__PREditingButton_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:&unk_1ED9EF0C0 forKeyPath:@"filters.highlightBrightness.inputAmount"];
  v2 = *(void **)(a1 + 32);
  return [v2 setValue:&unk_1ED9EF0D0 forKeyPath:@"filters.highlightSaturation.inputAmount"];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PREditingButton *)self isEnabled];
  v15.receiver = self;
  v15.super_class = (Class)PREditingButton;
  [(PREditingButton *)&v15 setEnabled:v3];
  if (v5 != v3)
  {
    double v6 = [(PREditingButton *)self layer];
    double v7 = 0.5;
    if (v3) {
      double v7 = 1.0;
    }
    double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", v7);
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__PREditingButton_setEnabled___block_invoke;
    v12[3] = &unk_1E54DAA08;
    id v13 = v6;
    id v14 = v8;
    id v10 = v8;
    id v11 = v6;
    [v9 animateWithDuration:2 delay:v12 options:0 animations:0.3 completion:0.0];
  }
}

uint64_t __30__PREditingButton_setEnabled___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) CGColor];
  return [v1 setValue:v2 forKeyPath:@"filters.enabledMultiplyColor.inputColor"];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"filters.highlightBrightness.inputAmount"] & 1) != 0
    || ([v4 isEqualToString:@"filters.highlightSaturation.inputAmount"] & 1) != 0
    || ([v4 isEqualToString:@"filters.enabledMultiplyColor.inputColor"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PREditingButton;
    BOOL v5 = [(PREditingButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (UIImage)defaultContentImage
{
  return 0;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_didInvalidateContentImageMetrics
{
  materialView = self->_materialView;
  double v4 = [(PREditingButton *)self defaultContentImage];
  [(PREditingButtonMaterialView *)materialView setForegroundImage:v4];

  [(PREditingButton *)self setNeedsLayout];
  [(PREditingButton *)self layoutIfNeeded];
}

- (int64_t)style
{
  return self->_style;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (PREditingButtonMaterialView)materialView
{
  return self->_materialView;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end