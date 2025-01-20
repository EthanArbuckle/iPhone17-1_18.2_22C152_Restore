@interface SBSUIWallpaperButton
- (SBSUIWallpaperButton)init;
- (SBSUIWallpaperButton)initWithFrame:(CGRect)a3;
- (void)_commonInit;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBSUIWallpaperButton

- (SBSUIWallpaperButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperButton;
  v2 = [(SBSUIWallpaperButton *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SBSUIWallpaperButton *)v2 _commonInit];
  }
  return v3;
}

- (SBSUIWallpaperButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperButton;
  v3 = -[SBSUIWallpaperButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBSUIWallpaperButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v2 = self;
  [(SBSUIWallpaperButton *)v2 setClipsToBounds:1];
  id v20 = [MEMORY[0x1E4F427D8] effectWithStyle:4];
  v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v20];
  [(UIVisualEffectView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)v3 setUserInteractionEnabled:0];
  effectView = v2->_effectView;
  v2->_effectView = v3;
  objc_super v5 = v3;

  objc_super v6 = [(SBSUIWallpaperButton *)v2 imageView];
  [(SBSUIWallpaperButton *)v2 insertSubview:v5 belowSubview:v6];

  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [(UIVisualEffectView *)v5 leadingAnchor];
  v9 = [(SBSUIWallpaperButton *)v2 leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v7 addObject:v10];

  v11 = [(UIVisualEffectView *)v5 trailingAnchor];
  v12 = [(SBSUIWallpaperButton *)v2 trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v7 addObject:v13];

  v14 = [(UIVisualEffectView *)v5 topAnchor];
  v15 = [(SBSUIWallpaperButton *)v2 topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v7 addObject:v16];

  v17 = [(UIVisualEffectView *)v5 bottomAnchor];
  v18 = [(SBSUIWallpaperButton *)v2 bottomAnchor];

  v19 = [v17 constraintEqualToAnchor:v18];
  [v7 addObject:v19];

  [MEMORY[0x1E4F28DC8] activateConstraints:v7];
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3) {
    double v5 = 0.1585;
  }
  else {
    double v5 = 0.317;
  }
  objc_super v6 = [(SBSUIWallpaperButton *)self traitCollection];
  BOOL v7 = [v6 userInterfaceStyle] == 2;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SBSUIWallpaperButton_setHighlighted___block_invoke;
  v8[3] = &unk_1E5CCCC80;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v10 = v7;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:v5];
}

void __39__SBSUIWallpaperButton_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 744);
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 5;
    }
  }
  else
  {
    uint64_t v3 = 4;
  }
  v4 = [MEMORY[0x1E4F427D8] effectWithStyle:v3];
  [v2 setEffect:v4];

  double v5 = [*(id *)(*(void *)(a1 + 32) + 744) contentView];
  id v8 = v5;
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    objc_super v6 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
    BOOL v7 = [v6 colorWithAlphaComponent:0.4];
    [v8 setBackgroundColor:v7];
  }
  else
  {
    [v5 setBackgroundColor:0];
  }
}

- (void).cxx_destruct
{
}

@end