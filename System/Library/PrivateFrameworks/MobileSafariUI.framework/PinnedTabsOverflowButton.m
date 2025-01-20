@interface PinnedTabsOverflowButton
- (BOOL)showsTrailingSeparator;
- (PinnedTabsOverflowButton)initWithFrame:(CGRect)a3;
- (int64_t)tintStyle;
- (void)_hover:(id)a3;
- (void)_setHovering:(BOOL)a3;
- (void)setShowsTrailingSeparator:(BOOL)a3;
- (void)setTintStyle:(int64_t)a3;
@end

@implementation PinnedTabsOverflowButton

- (void)setShowsTrailingSeparator:(BOOL)a3
{
}

- (void)setTintStyle:(int64_t)a3
{
  if (self->_tintStyle != a3)
  {
    self->_tintStyle = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 6, a3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      [(UIVisualEffectView *)self->_trailingSeparator setEffect:v4];
    }
  }
}

- (PinnedTabsOverflowButton)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)PinnedTabsOverflowButton;
  v3 = -[PinnedTabsOverflowButton initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward.2"];
    v29 = v4;
    [v4 setImage:v5];

    v6 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    [v4 setPreferredSymbolConfigurationForImage:v6];

    [(PinnedTabsOverflowButton *)v3 setConfiguration:v4];
    v7 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    trailingSeparator = v3->_trailingSeparator;
    v3->_trailingSeparator = v7;

    v9 = [MEMORY[0x1E4FB1618] blackColor];
    v10 = [(UIVisualEffectView *)v3->_trailingSeparator contentView];
    [v10 setBackgroundColor:v9];

    [(UIVisualEffectView *)v3->_trailingSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PinnedTabsOverflowButton *)v3 addSubview:v3->_trailingSeparator];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UIVisualEffectView *)v3->_trailingSeparator trailingAnchor];
    v27 = [(PinnedTabsOverflowButton *)v3 trailingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v11 = [(UIVisualEffectView *)v3->_trailingSeparator topAnchor];
    v12 = [(PinnedTabsOverflowButton *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v31[1] = v13;
    v14 = [(UIVisualEffectView *)v3->_trailingSeparator widthAnchor];
    _SFOnePixel();
    v15 = objc_msgSend(v14, "constraintEqualToConstant:");
    v31[2] = v15;
    v16 = [(UIVisualEffectView *)v3->_trailingSeparator heightAnchor];
    v17 = [(PinnedTabsOverflowButton *)v3 heightAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v31[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v25 activateConstraints:v19];

    uint64_t v20 = *MEMORY[0x1E4FB27D0];
    [(PinnedTabsOverflowButton *)v3 setMinimumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [(PinnedTabsOverflowButton *)v3 setMaximumContentSizeCategory:v20];
    v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(PinnedTabsOverflowButton *)v3 setTintColor:v21];

    [(PinnedTabsOverflowButton *)v3 setShowsMenuAsPrimaryAction:1];
    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v3 action:sel__hover_];
    [(PinnedTabsOverflowButton *)v3 addGestureRecognizer:v22];

    v23 = v3;
  }

  return v3;
}

- (BOOL)showsTrailingSeparator
{
  return [(UIVisualEffectView *)self->_trailingSeparator isHidden] ^ 1;
}

- (void)_hover:(id)a3
{
  BOOL v4 = (unint64_t)([a3 state] - 1) < 2;
  [(PinnedTabsOverflowButton *)self _setHovering:v4];
}

- (void)_setHovering:(BOOL)a3
{
  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__PinnedTabsOverflowButton__setHovering___block_invoke;
    v3[3] = &unk_1E6D781E8;
    v3[4] = self;
    BOOL v4 = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v3 options:0 animations:0.2 completion:0.0];
  }
}

void __41__PinnedTabsOverflowButton__setHovering___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_separateTabBarHighlightColor");
  }
  else {
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void).cxx_destruct
{
}

@end