@interface PUPhotoEditLegacyNotchButton
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (MTMaterialView)backgroundView;
- (NSString)notchButtonTitle;
- (NSString)symbolName;
- (PUPhotoEditButtonMaterialView)materialView;
- (PUPhotoEditLegacyNotchButton)initWithFrame:(CGRect)a3;
- (UIColor)backgroundColor;
- (UIEdgeInsets)backgroundInsets;
- (UIImage)defaultContentImage;
- (int64_t)notchButtonType;
- (void)_updateContentImage;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNotchButtonTitle:(id)a3;
- (void)setNotchButtonType:(int64_t)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation PUPhotoEditLegacyNotchButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_notchButtonTitle, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)setNotchButtonType:(int64_t)a3
{
  self->_notchButtonType = a3;
}

- (int64_t)notchButtonType
{
  return self->_notchButtonType;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setNotchButtonTitle:(id)a3
{
}

- (NSString)notchButtonTitle
{
  return self->_notchButtonTitle;
}

- (PUPhotoEditButtonMaterialView)materialView
{
  return self->_materialView;
}

- (void)setBackgroundView:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)_updateContentImage
{
  materialView = self->_materialView;
  id v3 = [(PUPhotoEditLegacyNotchButton *)self defaultContentImage];
  [(PUPhotoEditButtonMaterialView *)materialView setForegroundImage:v3];
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

- (UIImage)defaultContentImage
{
  return 0;
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
    v7.super_class = (Class)PUPhotoEditLegacyNotchButton;
    BOOL v5 = [(PUPhotoEditLegacyNotchButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  id v6 = a3;
  BOOL v5 = [(PUPhotoEditLegacyNotchButton *)self materialView];
  [v5 setBackgroundColor:v6];

  [(PUPhotoEditButtonMaterialView *)self->_materialView setBackgroundEnabled:[(PUPhotoEditLegacyNotchButton *)self isEnabled]];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUPhotoEditLegacyNotchButton *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditLegacyNotchButton;
  [(PUPhotoEditLegacyNotchButton *)&v6 setEnabled:v3];
  if (v5 != v3) {
    [(PUPhotoEditButtonMaterialView *)self->_materialView setBackgroundEnabled:v3];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUPhotoEditLegacyNotchButton *)self isHighlighted];
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoEditLegacyNotchButton;
  [(PUPhotoEditLegacyNotchButton *)&v13 setHighlighted:v3];
  if (v5 != v3)
  {
    objc_super v6 = [(PUPhotoEditLegacyNotchButton *)self layer];
    objc_super v7 = v6;
    if (v3)
    {
      [v6 setValue:&unk_1F078D450 forKeyPath:@"filters.highlightBrightness.inputAmount"];
      v8 = [(PUPhotoEditLegacyNotchButton *)self traitCollection];
      uint64_t v9 = [v8 userInterfaceStyle];

      if (v9 == 2) {
        [v7 setValue:&unk_1F078D460 forKeyPath:@"filters.highlightSaturation.inputAmount"];
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__PUPhotoEditLegacyNotchButton_setHighlighted___block_invoke;
      v11[3] = &unk_1E5F2ED10;
      id v12 = v6;
      [v10 animateWithDuration:2 delay:v11 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __47__PUPhotoEditLegacyNotchButton_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:&unk_1F078D470 forKeyPath:@"filters.highlightBrightness.inputAmount"];
  double v2 = *(void **)(a1 + 32);
  return [v2 setValue:&unk_1F078D480 forKeyPath:@"filters.highlightSaturation.inputAmount"];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)PUPhotoEditLegacyNotchButton;
  [(PUPhotoEditLegacyNotchButton *)&v37 layoutSubviews];
  if (!self->_materialView)
  {
    BOOL v3 = [PUPhotoEditButtonMaterialView alloc];
    backgroundView = self->_backgroundView;
    int v5 = [(PUPhotoEditLegacyNotchButton *)self defaultContentImage];
    objc_super v6 = -[PUPhotoEditButtonMaterialView initWithFrame:backgroundView:foregroundImage:](v3, "initWithFrame:backgroundView:foregroundImage:", backgroundView, v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    materialView = self->_materialView;
    self->_materialView = v6;

    [(PUPhotoEditButtonMaterialView *)self->_materialView setUserInteractionEnabled:0];
    v8 = self->_materialView;
    [(PUPhotoEditLegacyNotchButton *)self backgroundInsets];
    -[PUPhotoEditButtonMaterialView setBackgroundInsets:](v8, "setBackgroundInsets:");
    uint64_t v9 = [(PUPhotoEditLegacyNotchButton *)self backgroundColor];
    [(PUPhotoEditButtonMaterialView *)self->_materialView setBackgroundColor:v9];

    [(PUPhotoEditButtonMaterialView *)self->_materialView setBackgroundEnabled:[(PUPhotoEditLegacyNotchButton *)self isEnabled]];
    [(PUPhotoEditLegacyNotchButton *)self addSubview:self->_materialView];
  }
  v10 = [(PUPhotoEditLegacyNotchButton *)self configuration];
  [v10 contentInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  [(PUPhotoEditLegacyNotchButton *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  uint64_t v27 = [(PUPhotoEditLegacyNotchButton *)self effectiveUserInterfaceLayoutDirection];
  if (v27) {
    double v28 = v18;
  }
  else {
    double v28 = v14;
  }
  if (v27) {
    double v29 = v14;
  }
  else {
    double v29 = v18;
  }
  double v30 = v20 + v28;
  double v31 = v12 + v22;
  double v32 = v24 - (v28 + v29);
  double v33 = v26 - (v12 + v16);
  -[PUPhotoEditButtonMaterialView setFrame:](self->_materialView, "setFrame:", v30, v31, v32, v33);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v30, v31, v32, v33);
  id v34 = objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v34 CGPath];

  v36 = [(PUPhotoEditLegacyNotchButton *)self layer];
  [v36 setShadowPath:v35];
}

- (PUPhotoEditLegacyNotchButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditLegacyNotchButton;
  BOOL v3 = -[PUPhotoEditLegacyNotchButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(PUPhotoEditLegacyNotchButton *)v3 setClipsToBounds:1];
    int v5 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [(PUPhotoEditLegacyNotchButton *)v4 setConfiguration:v5];
  }
  return v4;
}

@end