@interface SBHomeScreenButton
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (SBHomeScreenButton)initWithFrame:(CGRect)a3;
- (SBHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4;
- (SBHomeScreenMaterialView)materialView;
- (UIEdgeInsets)backgroundInsets;
- (UIImage)defaultContentImage;
- (UIView)backgroundView;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBHomeScreenButton

- (SBHomeScreenButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21[3] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeScreenButton;
  v11 = -[SBHomeScreenButton initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_backgroundView, a4);
    v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A000]];
    [v13 setName:@"highlightBrightness"];
    [v13 setValue:&unk_1F300F080 forKey:@"inputAmount"];
    v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v14 setName:@"highlightSaturation"];
    [v14 setValue:&unk_1F300F090 forKey:@"inputAmount"];
    v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    [v15 setName:@"enabledMultiplyColor"];
    id v16 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v16, "CGColor"), @"inputColor");

    v17 = [(SBHomeScreenButton *)v12 layer];
    v21[0] = v13;
    v21[1] = v14;
    v21[2] = v15;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    [v17 setFilters:v18];
  }
  return v12;
}

- (SBHomeScreenButton)initWithFrame:(CGRect)a3
{
  return -[SBHomeScreenButton initWithFrame:backgroundView:](self, "initWithFrame:backgroundView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SBHomeScreenButton;
  [(SBHomeScreenButton *)&v22 layoutSubviews];
  if (!self->_materialView)
  {
    v3 = [SBHomeScreenMaterialView alloc];
    backgroundView = self->_backgroundView;
    v5 = [(SBHomeScreenButton *)self defaultContentImage];
    v6 = -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](v3, "initWithFrame:backgroundView:foregroundImage:", backgroundView, v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    materialView = self->_materialView;
    self->_materialView = v6;

    [(SBHomeScreenMaterialView *)self->_materialView setUserInteractionEnabled:0];
    v8 = self->_materialView;
    [(SBHomeScreenButton *)self backgroundInsets];
    -[SBHomeScreenMaterialView setBackgroundInsets:](v8, "setBackgroundInsets:");
    [(SBHomeScreenButton *)self addSubview:self->_materialView];
  }
  v9 = [(SBHomeScreenButton *)self configuration];
  [v9 contentInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(SBHomeScreenButton *)self bounds];
  [(SBHomeScreenMaterialView *)self->_materialView setFrame:SBHDirectionalEdgeInsetsInsetRect([(SBHomeScreenButton *)self effectiveUserInterfaceLayoutDirection], v18, v19, v20, v21, v11, v13, v15, v17)];
}

- (UIView)backgroundView
{
  return [(SBHomeScreenMaterialView *)self->_materialView backgroundView];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBHomeScreenButton *)self isHighlighted];
  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenButton;
  [(SBHomeScreenButton *)&v13 setHighlighted:v3];
  if (v5 != v3)
  {
    v6 = [(SBHomeScreenButton *)self layer];
    v7 = v6;
    if (v3)
    {
      [v6 setValue:&unk_1F300F0A0 forKeyPath:@"filters.highlightBrightness.inputAmount"];
      v8 = [(SBHomeScreenButton *)self traitCollection];
      uint64_t v9 = [v8 userInterfaceStyle];

      if (v9 == 2) {
        [v7 setValue:&unk_1F300F0B0 forKeyPath:@"filters.highlightSaturation.inputAmount"];
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __37__SBHomeScreenButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E6AAC810;
      id v12 = v6;
      [v10 animateWithDuration:2 delay:v11 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __37__SBHomeScreenButton_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:&unk_1F300F080 forKeyPath:@"filters.highlightBrightness.inputAmount"];
  v2 = *(void **)(a1 + 32);
  return [v2 setValue:&unk_1F300F090 forKeyPath:@"filters.highlightSaturation.inputAmount"];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBHomeScreenButton *)self isEnabled];
  v15.receiver = self;
  v15.super_class = (Class)SBHomeScreenButton;
  [(SBHomeScreenButton *)&v15 setEnabled:v3];
  if (v5 != v3)
  {
    v6 = [(SBHomeScreenButton *)self layer];
    double v7 = 0.5;
    if (v3) {
      double v7 = 1.0;
    }
    v8 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", v7);
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __33__SBHomeScreenButton_setEnabled___block_invoke;
    v12[3] = &unk_1E6AACA90;
    id v13 = v6;
    id v14 = v8;
    id v10 = v8;
    id v11 = v6;
    [v9 animateWithDuration:2 delay:v12 options:0 animations:0.3 completion:0.0];
  }
}

uint64_t __33__SBHomeScreenButton_setEnabled___block_invoke(uint64_t a1)
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
    v7.super_class = (Class)SBHomeScreenButton;
    BOOL v5 = [(SBHomeScreenButton *)&v7 _shouldAnimatePropertyWithKey:v4];
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

- (void)setBackgroundView:(id)a3
{
}

- (SBHomeScreenMaterialView)materialView
{
  return self->_materialView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end