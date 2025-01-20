@interface PLCropOverlayWallpaperBottomBar
- (BOOL)motionToggleHidden;
- (BOOL)shouldOnlyShowHomeScreenButton;
- (BOOL)shouldOnlyShowLockScreenButton;
- (CGSize)_sizeForString:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PLCropOverlayWallpaperBottomBar)initWithCoder:(id)a3;
- (PLCropOverlayWallpaperBottomBar)initWithFrame:(CGRect)a3;
- (PLWallpaperButton)doCancelButton;
- (PLWallpaperButton)doSetBothScreenButton;
- (PLWallpaperButton)doSetButton;
- (PLWallpaperButton)doSetHomeScreenButton;
- (PLWallpaperButton)doSetLockScreenButton;
- (PLWallpaperButton)motionToggle;
- (UIView)separatorLine;
- (_UIBackdropView)backdropView;
- (_UILegibilityLabel)titleLabel;
- (double)maxToggleWidth;
- (double)widthForToggleText;
- (void)_commonPLCropOverlayWallpaperBottomBarInitialization;
- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPad;
- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPhone;
- (void)_layoutSubviewsPad;
- (void)_layoutSubviewsPhone;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setMaxToggleWidth:(double)a3;
- (void)setMotionToggleHidden:(BOOL)a3;
- (void)setSeparatorLine:(id)a3;
- (void)setShouldOnlyShowHomeScreenButton:(BOOL)a3;
- (void)setShouldOnlyShowLockScreenButton:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateForChangedSettings:(id)a3;
@end

@implementation PLCropOverlayWallpaperBottomBar

- (void)setMaxToggleWidth:(double)a3
{
  self->_maxToggleWidth = a3;
}

- (double)maxToggleWidth
{
  return self->_maxToggleWidth;
}

- (void)setBackdropView:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setSeparatorLine:(id)a3
{
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setTitleLabel:(id)a3
{
}

- (_UILegibilityLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setShouldOnlyShowHomeScreenButton:(BOOL)a3
{
  self->_shouldOnlyShowHomeScreenButton = a3;
}

- (BOOL)shouldOnlyShowHomeScreenButton
{
  return self->_shouldOnlyShowHomeScreenButton;
}

- (void)setShouldOnlyShowLockScreenButton:(BOOL)a3
{
  self->_shouldOnlyShowLockScreenButton = a3;
}

- (BOOL)shouldOnlyShowLockScreenButton
{
  return self->_shouldOnlyShowLockScreenButton;
}

- (void)setMotionToggleHidden:(BOOL)a3
{
  self->_motionToggleHidden = a3;
}

- (BOOL)motionToggleHidden
{
  return self->_motionToggleHidden;
}

- (PLWallpaperButton)motionToggle
{
  return self->_motionToggle;
}

- (PLWallpaperButton)doSetBothScreenButton
{
  return self->_doSetBothScreenButton;
}

- (PLWallpaperButton)doSetLockScreenButton
{
  return self->_doSetLockScreenButton;
}

- (PLWallpaperButton)doSetHomeScreenButton
{
  return self->_doSetHomeScreenButton;
}

- (PLWallpaperButton)doSetButton
{
  return self->_doSetButton;
}

- (PLWallpaperButton)doCancelButton
{
  return self->_doCancelButton;
}

- (void)updateForChangedSettings:(id)a3
{
  v4 = [(PLCropOverlayWallpaperBottomBar *)self titleLabel];
  [(_UILegibilityLabel *)v4 updateForChangedSettings:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = [(_UILegibilityLabel *)[(PLCropOverlayWallpaperBottomBar *)self titleLabel] string];
  [(PLCropOverlayWallpaperBottomBar *)self _sizeForString:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)_sizeForString:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(_UILegibilityLabel *)[(PLCropOverlayWallpaperBottomBar *)self titleLabel] font];
  uint64_t v7 = *MEMORY[0x1E4F42508];
  v8[0] = v4;
  objc_msgSend(a3, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setText:(id)a3
{
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[PLCropOverlayWallpaperBottomBar _sizeForString:](self, "_sizeForString:");
  -[_UILegibilityLabel setFrame:]([(PLCropOverlayWallpaperBottomBar *)self titleLabel], "setFrame:", v5, v6, v7, v8);
  [(_UILegibilityLabel *)[(PLCropOverlayWallpaperBottomBar *)self titleLabel] setString:a3];
  [(PLCropOverlayWallpaperBottomBar *)self setNeedsLayout];
}

- (double)widthForToggleText
{
  v2 = [PLWallpaperButton alloc];
  v3 = -[PLWallpaperButton initWithFrame:style:](v2, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PLWallpaperButton *)v3 setTitle:PLLocalizedFrameworkString() forState:0];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PLWallpaperButton sizeThatFits:](v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
  double v7 = v6;
  [(PLWallpaperButton *)v3 setTitle:PLLocalizedFrameworkString() forState:0];
  -[PLWallpaperButton sizeThatFits:](v3, "sizeThatFits:", v4, v5);
  double v9 = v8;

  if (v9 >= v7) {
    return v9;
  }
  else {
    return v7;
  }
}

- (void)_layoutSubviewsPad
{
  [(PLCropOverlayWallpaperBottomBar *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(_UILegibilityLabel *)[(PLCropOverlayWallpaperBottomBar *)self titleLabel] frame];
  double v12 = v11;
  double v14 = v13;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  if (v16 == v8) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  double v18 = ceil(v12);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double v19 = floor(CGRectGetMidX(v23) + v18 * -0.5);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[_UILegibilityLabel setFrame:]([(PLCropOverlayWallpaperBottomBar *)self titleLabel], "setFrame:", v19, CGRectGetMaxY(v24) - v17 + 10.0, v18, ceil(v14));
  v20 = [(PLCropOverlayWallpaperBottomBar *)self backdropView];
  [(PLCropOverlayWallpaperBottomBar *)self bounds];
  -[_UIBackdropView setFrame:](v20, "setFrame:");
  v21 = [(PLCropOverlayWallpaperBottomBar *)self backdropView];
  [(PLCropOverlayWallpaperBottomBar *)self sendSubviewToBack:v21];
}

- (void)_layoutSubviewsPhone
{
  double v3 = (void *)[(PLCropOverlayWallpaperBottomBar *)self window];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  -[PLCropOverlayWallpaperBottomBar convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v3, v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
  double MinY = CGRectGetMinY(v32);
  [(PLCropOverlayWallpaperBottomBar *)self bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [(_UILegibilityLabel *)[(PLCropOverlayWallpaperBottomBar *)self titleLabel] frame];
  double v26 = ceil(v25);
  double v28 = ceil(v27);
  v33.origin.x = v18;
  v33.origin.y = v20;
  v33.size.width = v22;
  v33.size.height = v24;
  double v29 = floor(CGRectGetMidX(v33) + v26 * -0.5);
  v30 = [(PLCropOverlayWallpaperBottomBar *)self titleLabel];
  -[_UILegibilityLabel setFrame:](v30, "setFrame:", v29, MinY + 6.0, v26, v28);
}

- (void)layoutSubviews
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(PLCropOverlayWallpaperBottomBar *)self _layoutSubviewsPad];
  }
  else
  {
    [(PLCropOverlayWallpaperBottomBar *)self _layoutSubviewsPhone];
  }
}

- (void)dealloc
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(_UIBackdropView *)self->_backdropView removeObserver:self->_doCancelButton];
    [(_UIBackdropView *)self->_backdropView removeObserver:self->_doSetHomeScreenButton];
    [(_UIBackdropView *)self->_backdropView removeObserver:self->_doSetLockScreenButton];
    [(_UIBackdropView *)self->_backdropView removeObserver:self->_doSetBothScreenButton];
    [(_UIBackdropView *)self->_backdropView removeObserver:self->_motionToggle];
  }

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  [(PLCropOverlayWallpaperBottomBar *)&v3 dealloc];
}

- (PLCropOverlayWallpaperBottomBar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  objc_super v3 = [(PLCropOverlayWallpaperBottomBar *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayWallpaperBottomBar *)v3 _commonPLCropOverlayWallpaperBottomBarInitialization];
  }
  return v4;
}

- (PLCropOverlayWallpaperBottomBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayWallpaperBottomBar;
  objc_super v3 = -[PLCropOverlayWallpaperBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PLCropOverlayWallpaperBottomBar *)v3 _commonPLCropOverlayWallpaperBottomBarInitialization];
  }
  return v4;
}

- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPad
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:1];
  self->_doCancelButton = v3;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v3];
  double v4 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:1];
  self->_doSetLockScreenButton = v4;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v4];
  double v5 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:1];
  self->_doSetHomeScreenButton = v5;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v5];
  objc_super v6 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:1];
  self->_doSetBothScreenButton = v6;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v6];
  double v7 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButtonWithStyle:1];
  self->_motionToggle = v7;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v7];
  [(PLCropOverlayWallpaperBottomBar *)self widthForToggleText];
  -[PLCropOverlayWallpaperBottomBar setMaxToggleWidth:](self, "setMaxToggleWidth:");
  double v8 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2010];
  self->_backdropView = v8;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  doSetLockScreenButton = self->_doSetLockScreenButton;
  v31[0] = self->_doCancelButton;
  v31[1] = doSetLockScreenButton;
  doSetBothScreenButton = self->_doSetBothScreenButton;
  v31[2] = self->_doSetHomeScreenButton;
  v31[3] = doSetBothScreenButton;
  v31[4] = self->_motionToggle;
  double v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [(_UIBackdropView *)self->_backdropView addObserver:v16];
        [v16 backdropViewDidChange:self->_backdropView];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v13);
  }
  id v17 = objc_alloc(MEMORY[0x1E4F43228]);
  id v18 = (id)objc_msgSend(v17, "initWithContentColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", 0.86, 0.86, 0.86, 0.6));
  uint64_t v19 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0];
  id v20 = objc_alloc(MEMORY[0x1E4F43220]);
  self->_titleLabel = (_UILegibilityLabel *)[v20 initWithSettings:v18 strength:0 string:v19 font:*MEMORY[0x1E4F440D8]];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v21 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    CGFloat v22 = v21;
    if (!self->_shouldOnlyShowHomeScreenButton) {
      [v21 addObject:@"[doSetLockScreenButton]"];
    }
    if (!self->_shouldOnlyShowLockScreenButton) {
      [v22 addObject:@"[doSetHomeScreenButton]"];
    }
    if (!self->_shouldOnlyShowHomeScreenButton && !self->_shouldOnlyShowLockScreenButton) {
      [v22 addObject:@"[doSetBothScreenButton]"];
    }
    if (!self->_motionToggleHidden) {
      [v22 addObject:@"[motionToggle]"];
    }
    uint64_t v23 = [v22 componentsJoinedByString:@"-(spacing)-"];
    v29[0] = @"doCancelButton";
    v30[0] = [(PLCropOverlayWallpaperBottomBar *)self doCancelButton];
    v29[1] = @"motionToggle";
    v30[1] = [(PLCropOverlayWallpaperBottomBar *)self motionToggle];
    v29[2] = @"doSetBothScreenButton";
    v30[2] = [(PLCropOverlayWallpaperBottomBar *)self doSetBothScreenButton];
    v29[3] = @"doSetHomeScreenButton";
    v30[3] = [(PLCropOverlayWallpaperBottomBar *)self doSetHomeScreenButton];
    v29[4] = @"doSetLockScreenButton";
    v30[4] = [(PLCropOverlayWallpaperBottomBar *)self doSetLockScreenButton];
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
    [MEMORY[0x1E4F28DC8] activateConstraints:objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsWithVisualFormat:options:metrics:views:", objc_msgSend(NSString, "stringWithFormat:", @"H:|-(margin)-[doCancelButton]-(>=spacing)-%@-(margin)-|", v23), 2048, &unk_1F1A1C6A0, v24)];
    objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:", objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsWithVisualFormat:options:metrics:views:", @"V:|[doCancelButton]-|", 0, 0, v24));
  }
}

- (void)_commonPLCropOverlayWallpaperBottomBarInitializationPhone
{
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButton];
  self->_doCancelButton = v3;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v3];
  double v4 = (PLWallpaperButton *)+[PLWallpaperButton autoLayoutCommonWallpaperButton];
  self->_doSetButton = v4;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
  objc_super v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  self->_separatorLine = v6;
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:self->_separatorLine];
  -[UIView setBackgroundColor:](self->_separatorLine, "setBackgroundColor:", [MEMORY[0x1E4F428B8] colorWithRed:0.47 green:0.53 blue:0.53 alpha:1.0]);
  id v7 = objc_alloc(MEMORY[0x1E4F43228]);
  id v8 = (id)objc_msgSend(v7, "initWithContentColor:", objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", 0.86, 0.86, 0.86, 0.6));
  uint64_t v9 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  id v10 = objc_alloc(MEMORY[0x1E4F43220]);
  self->_titleLabel = (_UILegibilityLabel *)[v10 initWithSettings:v8 strength:0 string:v9 font:*MEMORY[0x1E4F440D8]];
  double v11 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v12 = @"separatorWidth";
  v13[0] = [NSNumber numberWithDouble:1.0];
  objc_msgSend(v11, "activateConstraints:", objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[_doCancelButton][_separatorLine(==separatorWidth@999)][_doSetButton]|", 24, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), _NSDictionaryOfVariableBindings(&cfstr_Docancelbutton.isa, self->_doCancelButton, self->_separatorLine, self->_doSetButton, 0)));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_doSetButton, 7, 0, self->_doCancelButton, 7, 1.0, 0.0), "setActive:", 1);
  objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:", objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsWithVisualFormat:options:metrics:views:", @"V:|[_doCancelButton]|", 0, 0, _NSDictionaryOfVariableBindings(&cfstr_Docancelbutton_0.isa, self->_doCancelButton, 0)));
}

- (void)_commonPLCropOverlayWallpaperBottomBarInitialization
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(PLCropOverlayWallpaperBottomBar *)self _commonPLCropOverlayWallpaperBottomBarInitializationPad];
  }
  else {
    [(PLCropOverlayWallpaperBottomBar *)self _commonPLCropOverlayWallpaperBottomBarInitializationPhone];
  }
  titleLabel = self->_titleLabel;
  [(PLCropOverlayWallpaperBottomBar *)self addSubview:titleLabel];
}

@end