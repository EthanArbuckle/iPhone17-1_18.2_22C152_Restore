@interface SBFolderTitleTextField
+ (id)_clearButtonImage;
+ (void)warmupIfNecessary;
- (BOOL)allowsEditing;
- (BOOL)canBecomeFocused;
- (BOOL)showingEditUI;
- (CGRect)_textRectForBounds:(CGRect)a3;
- (CGRect)borderRectForBounds:(CGRect)a3;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBFolderTitleTextField)initWithFrame:(CGRect)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)fontSize;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_updateLegibility;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setFontSize:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setShowsEditUI:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SBFolderTitleTextField

- (CGRect)borderRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 0.0, 4.0);
}

- (CGRect)_textRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v35.receiver = self;
  v35.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField textRectForBounds:](&v35, sel_textRectForBounds_);
  double MaxX = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(SBFolderTitleTextField *)self allowsEditing])
  {
    CGFloat v33 = v15;
    CGFloat v34 = v11;
    -[SBFolderTitleTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", x, y, width, height);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v32 = v20;
    CGFloat v22 = v21;
    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
    {
      v36.origin.double x = v17;
      v36.origin.double y = v19;
      v36.size.double width = v32;
      v36.size.double height = v22;
      CGFloat rect = v22;
      double MaxX = CGRectGetMaxX(v36);
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      double v23 = CGRectGetWidth(v37);
      v38.origin.double x = v17;
      v38.origin.double y = v19;
      v38.size.double width = v32;
      v38.size.double height = rect;
      double v13 = v23 + CGRectGetMaxX(v38) * -2.0;
      double v15 = v33;
      double v11 = v34;
    }
    else
    {
      v39.origin.double x = x;
      v39.origin.double y = y;
      v39.size.double width = width;
      v39.size.double height = height;
      double v24 = CGRectGetWidth(v39);
      v40.origin.double x = v17;
      v40.origin.double y = v19;
      v40.size.double width = v32;
      v40.size.double height = v22;
      CGFloat MinX = CGRectGetMinX(v40);
      v41.size.double height = v22;
      double MaxX = v24 - MinX;
      v41.origin.double x = v17;
      v41.origin.double y = v19;
      v41.size.double width = v32;
      double v26 = CGRectGetMinX(v41);
      v42.origin.double x = MaxX;
      double v11 = v34;
      v42.origin.double y = v34;
      v42.size.double width = v13;
      v42.size.double height = v33;
      double v13 = v26 - CGRectGetMinX(v42);
      double v15 = v33;
    }
  }
  double v27 = MaxX;
  double v28 = v11;
  double v29 = v13;
  double v30 = v15;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField clearButtonRectForBounds:](&v11, sel_clearButtonRectForBounds_);
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] != 1)
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGRectGetMaxX(v12);
  }
  UIRectCenteredYInRectScale();
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBFolderTitleTextField;
  -[SBFolderTitleTextField sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3;
  double v6 = v5;
  if (__sb__runningInSpringBoard())
  {
    BOOL v7 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v7 = [v8 userInterfaceIdiom] == 1;
  }
  double v9 = 13.0;
  if (v7) {
    double v9 = 15.0;
  }
  double v10 = v6 + v9;
  double v11 = v4;
  result.CGFloat height = v10;
  result.CGFloat width = v11;
  return result;
}

- (void)setShowsEditUI:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingEditUI != a3)
  {
    if (a4) {
      double v6 = 0.25;
    }
    else {
      double v6 = 0.0;
    }
    if (a3)
    {
      [(SBFolderTitleTextField *)self setClearButtonMode:3];
      BOOL v7 = [(SBFolderTitleTextField *)self _clearButton];
      [v7 setAlpha:0.0];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke;
      v10[3] = &unk_1E6AAC810;
      v10[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v6];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_2;
      v9[3] = &unk_1E6AAC810;
      v9[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_3;
      v8[3] = &unk_1E6AACAB8;
      v8[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v8 completion:v6];
    }
    self->_showingEditUI = a3;
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBFolderTitleTextField *)self _updateLegibility];
  }
}

- (void)_updateLegibility
{
  double v3 = self->_legibilitySettings;
  double v4 = [(_UILegibilitySettings *)v3 primaryColor];
  [(SBFolderTitleTextField *)self setTextColor:v4];

  id v5 = [(SBFolderTitleTextField *)self _clearButton];
  double v6 = [(_UILegibilitySettings *)v3 primaryColor];
  BOOL v7 = [v6 colorWithAlphaComponent:0.6];
  [v5 setTintColor:v7];

  uint64_t v8 = [(_UILegibilitySettings *)v3 style];
  double v9 = [(SBFolderTitleTextField *)self _backgroundView];
  id v11 = v9;
  if (v8 == 2) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  [v9 setOverrideUserInterfaceStyle:v10];
}

- (void)setFontSize:(double)a3
{
  id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a3 weight:*MEMORY[0x1E4FB09D8]];
  [(SBFolderTitleTextField *)self setFont:v4];
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (SBFolderTitleTextField)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFolderTitleTextField;
  double v3 = -[SBFolderTitleTextField initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SBFolderTitleTextField *)v3 setTextColor:v4];

    [(SBFolderTitleTextField *)v3 setClearButtonMode:0];
    [(SBFolderTitleTextField *)v3 setTextAlignment:1];
    [(SBFolderTitleTextField *)v3 setReturnKeyType:9];
    [(SBFolderTitleTextField *)v3 setAdjustsFontSizeToFitWidth:1];
    [(SBFolderTitleTextField *)v3 setMinimumFontSize:20.0];
    [(SBFolderTitleTextField *)v3 setKeyboardAppearance:1];
    [(SBFolderTitleTextField *)v3 setBorderStyle:3];
    [(SBFolderTitleTextField *)v3 _setRoundedRectBackgroundCornerRadius:14.0];
    id v5 = [(SBFolderTitleTextField *)v3 _clearButton];
    double v6 = [(id)objc_opt_class() _clearButtonImage];
    [v5 setImage:v6 forState:0];

    [(SBFolderTitleTextField *)v3 _updateLegibility];
    [(SBFolderTitleTextField *)v3 layoutIfNeeded];
    BOOL v7 = [(SBFolderTitleTextField *)v3 _backgroundView];
    [v7 setAlpha:0.0];
  }
  return v3;
}

+ (id)_clearButtonImage
{
  v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:19.0];
  double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v2];

  return v3;
}

+ (void)warmupIfNecessary
{
  id v2 = (id)[a1 _clearButtonImage];
}

void __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backgroundView];
  [v2 setAlpha:0.4];

  id v3 = [*(id *)(a1 + 32) _clearButton];
  [v3 setAlpha:1.0];
}

void __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backgroundView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) _clearButton];
  [v3 setAlpha:0.0];
}

uint64_t __50__SBFolderTitleTextField_setShowsEditUI_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClearButtonMode:0];
}

- (double)fontSize
{
  id v2 = [(SBFolderTitleTextField *)self font];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  BOOL v7 = [(SBFolderTitleTextField *)self showingEditUI];
  uint64_t v8 = v6;
  if (!v7)
  {

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v4 = (void *)MEMORY[0x1E4FB1AE0];
  id v5 = [(SBFolderTitleTextField *)self font];
  [v5 lineHeight];
  id v6 = objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);

  BOOL v7 = [MEMORY[0x1E4FB1AE8] styleWithShape:v6 constrainedAxes:2];

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)showingEditUI
{
  return self->_showingEditUI;
}

- (void).cxx_destruct
{
}

@end