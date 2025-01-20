@interface TPButton
+ (double)defaultHeight;
+ (double)defaultHeightForColor:(int)a3;
+ (double)defaultWidthForCenterButton;
+ (double)defaultWidthForSideButton;
+ (double)maxWidthForCenterButton;
+ (id)defaultStandardFont;
- (BOOL)blursBackground;
- (BOOL)roundsCorners;
- (BOOL)usesOverlayBlendingForContents;
- (CGSize)intrinsicContentSize;
- (TPButton)initWithTitle:(id)a3 icon:(id)a4 color:(int)a5 frame:(CGRect)a6;
- (int)buttonColor;
- (void)_animationDidEnd;
- (void)_animationWillBegin;
- (void)layoutSubviews;
- (void)setBlursBackground:(BOOL)a3;
- (void)setButtonColor:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setRoundsCorners:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUsesOverlayBlendingForContents:(BOOL)a3;
@end

@implementation TPButton

+ (id)defaultStandardFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:28.0];
}

+ (double)defaultHeight
{
  return 66.0;
}

+ (double)defaultHeightForColor:(int)a3
{
  return 66.0;
}

+ (double)defaultWidthForSideButton
{
  return 66.0;
}

+ (double)defaultWidthForCenterButton
{
  return 140.0;
}

+ (double)maxWidthForCenterButton
{
  return 176.0;
}

- (void)setHighlighted:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPButton;
  [(TPButton *)&v9 setHighlighted:a3];
  if ([(TPButton *)self isEnabled])
  {
    v4 = [(_UIBackdropView *)self->_backdropView inputSettings];
    objc_msgSend(v4, "setHighlighted:", -[TPButton isHighlighted](self, "isHighlighted"));

    v5 = [(_UIBackdropView *)self->_backdropView outputSettings];
    v6 = [(_UIBackdropView *)self->_backdropView inputSettings];
    [v5 computeOutputSettingsUsingModel:v6];

    backdropView = self->_backdropView;
    v8 = [(_UIBackdropView *)backdropView outputSettings];
    [(_UIBackdropView *)backdropView applySettings:v8];
  }
}

- (void)setEnabled:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TPButton;
  [(TPButton *)&v19 setEnabled:a3];
  v4 = [(_UIBackdropView *)self->_backdropView inputSettings];
  objc_msgSend(v4, "setEnabled:", -[TPButton isEnabled](self, "isEnabled"));

  v5 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v5 setHighlighted:0];

  v6 = [(_UIBackdropView *)self->_backdropView outputSettings];
  v7 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v6 computeOutputSettingsUsingModel:v7];

  backdropView = self->_backdropView;
  objc_super v9 = [(_UIBackdropView *)backdropView outputSettings];
  [(_UIBackdropView *)backdropView applySettings:v9];

  if (!self->_blursBackground) {
    [(_UIBackdropView *)self->_backdropView _setBlursBackground:0];
  }
  if (self->_usesOverlayBlendingForContents)
  {
    v10 = [(TPButton *)self imageView];
    [v10 setAlpha:0.400000006];

    v11 = [(TPButton *)self imageView];
    v12 = [v11 layer];
    uint64_t v13 = *MEMORY[0x1E4F3A2E0];
    v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v12 setCompositingFilter:v14];

    v15 = [(TPButton *)self titleLabel];
    [v15 setAlpha:0.400000006];

    v16 = [(TPButton *)self titleLabel];
    v17 = [v16 layer];
    v18 = [MEMORY[0x1E4F39BC0] filterWithType:v13];
    [v17 setCompositingFilter:v18];
  }
}

- (void)setSelected:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPButton;
  [(TPButton *)&v9 setSelected:a3];
  v4 = [(_UIBackdropView *)self->_backdropView inputSettings];
  objc_msgSend(v4, "setSelected:", -[TPButton isSelected](self, "isSelected"));

  v5 = [(_UIBackdropView *)self->_backdropView outputSettings];
  v6 = [(_UIBackdropView *)self->_backdropView inputSettings];
  [v5 computeOutputSettingsUsingModel:v6];

  backdropView = self->_backdropView;
  v8 = [(_UIBackdropView *)backdropView outputSettings];
  [(_UIBackdropView *)backdropView applySettings:v8];

  if (!self->_blursBackground) {
    [(_UIBackdropView *)self->_backdropView _setBlursBackground:0];
  }
}

- (void)setButtonColor:(int)a3
{
  if (self->_color != a3)
  {
    backdropView = self->_backdropView;
    if (backdropView) {
      [(_UIBackdropView *)backdropView removeFromSuperview];
    }
    uint64_t v6 = 10092;
    switch(a3)
    {
      case 0:
        uint64_t v6 = 10091;
        goto LABEL_10;
      case 1:
      case 7:
        goto LABEL_10;
      case 3:
      case 5:
      case 8:
      case 11:
        uint64_t v6 = 2030;
        goto LABEL_10;
      case 4:
        break;
      case 6:
        v7 = [MEMORY[0x1E4FB1618] whiteColor];
        goto LABEL_15;
      case 10:
        uint64_t v6 = 2020;
        goto LABEL_10;
      case 12:
        v7 = [MEMORY[0x1E4FB1618] systemGreenColor];
        goto LABEL_15;
      case 13:
        v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
        goto LABEL_15;
      case 14:
        v7 = [MEMORY[0x1E4FB1618] systemRedColor];
        goto LABEL_15;
      case 15:
        v7 = [MEMORY[0x1E4FB1618] blackColor];
LABEL_15:
        v10 = v7;
        v11 = [v7 tpImageFromColor];
        [(TPButton *)self setBackgroundImage:v11 forState:0];

        break;
      default:
        uint64_t v6 = 2010;
LABEL_10:
        v8 = (_UIBackdropView *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:v6];
        objc_super v9 = self->_backdropView;
        self->_backdropView = v8;

        [(_UIBackdropView *)self->_backdropView setAppliesOutputSettingsAnimationDuration:0.150000006];
        [(_UIBackdropView *)self->_backdropView setConfiguration:1];
        [(TPButton *)self insertSubview:self->_backdropView atIndex:0];
        break;
    }
    v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [(TPButton *)self setTitleColor:v12 forState:0];

    uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.300000012];
    [(TPButton *)self setTitleColor:v13 forState:2];
  }
  self->_color = a3;
}

- (TPButton)initWithTitle:(id)a3 icon:(id)a4 color:(int)a5 frame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v10 = *(void *)&a5;
  id v13 = a3;
  id v14 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TPButton;
  v15 = [(TPButton *)&v27 init];
  v16 = v15;
  if (v15)
  {
    v15->_color = -1;
    v15->_usesOverlayBlendingForContents = 0;
    v15->_blursBackground = 1;
    [(TPButton *)v15 setOpaque:0];
    -[TPButton setFrame:](v16, "setFrame:", x, y, width, height);
    [(TPButton *)v16 setTitle:v13 forState:0];
    if (v14)
    {
      [(TPButton *)v16 setImage:v14 forState:0];
      v17 = [MEMORY[0x1E4FB1618] whiteColor];
      v18 = [v14 _flatImageWithColor:v17];

      [(TPButton *)v16 setImage:v18 forState:1];
      [(TPButton *)v16 setImage:v18 forState:4];
    }
    objc_super v19 = [(TPButton *)v16 titleLabel];
    v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:28.0];
    [v19 setFont:v20];

    -[TPButton setTitleEdgeInsets:](v16, "setTitleEdgeInsets:", 0.0, 0.0, 1.0, 0.0);
    v21 = [(TPButton *)v16 titleLabel];
    [v21 setAdjustsFontSizeToFitWidth:1];

    v22 = [(TPButton *)v16 titleLabel];
    [v22 setMinimumScaleFactor:0.5];

    [(TPButton *)v16 setButtonColor:v10];
    v23 = [(TPButton *)v16 layer];
    [v23 setAllowsGroupOpacity:0];

    v24 = [(TPButton *)v16 layer];
    [v24 setAllowsGroupBlending:0];

    v16->_roundsCorners = 1;
    [(TPButton *)v16 setClipsToBounds:1];
    v25 = [(TPButton *)v16 layer];
    [v25 setCornerRadius:5.0];
  }
  return v16;
}

- (CGSize)intrinsicContentSize
{
  +[TPButton defaultHeight];
  double v3 = v2;
  double v4 = 123.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (int)buttonColor
{
  return self->_color;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TPButton;
  [(TPButton *)&v12 layoutSubviews];
  [(TPButton *)self sendSubviewToBack:self->_backdropView];
  if (self->_usesOverlayBlendingForContents)
  {
    double v3 = [(TPButton *)self imageView];
    [v3 setAlpha:0.400000006];

    double v4 = [(TPButton *)self imageView];
    v5 = [v4 layer];
    uint64_t v6 = *MEMORY[0x1E4F3A2E0];
    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v5 setCompositingFilter:v7];

    v8 = [(TPButton *)self titleLabel];
    [v8 setAlpha:0.400000006];

    objc_super v9 = [(TPButton *)self titleLabel];
    uint64_t v10 = [v9 layer];
    v11 = [MEMORY[0x1E4F39BC0] filterWithType:v6];
    [v10 setCompositingFilter:v11];
  }
}

- (void)setBlursBackground:(BOOL)a3
{
  if (self->_blursBackground != a3)
  {
    backdropView = self->_backdropView;
    if (a3)
    {
      uint64_t v6 = [(_UIBackdropView *)backdropView outputSettings];
      v7 = [(_UIBackdropView *)self->_backdropView inputSettings];
      [v6 computeOutputSettingsUsingModel:v7];

      v8 = self->_backdropView;
      objc_super v9 = [(_UIBackdropView *)v8 outputSettings];
      [(_UIBackdropView *)v8 applySettings:v9];
    }
    else
    {
      [(_UIBackdropView *)backdropView _setBlursBackground:0];
    }
    [(TPButton *)self sendSubviewToBack:self->_backdropView];
  }
  self->_blursBackground = a3;
}

- (void)setRoundsCorners:(BOOL)a3
{
  if (self->_roundsCorners != a3)
  {
    backdropView = self->_backdropView;
    if (a3)
    {
      [(_UIBackdropView *)backdropView setClipsToBounds:1];
      uint64_t v6 = [(_UIBackdropView *)self->_backdropView layer];
      [v6 setCornerRadius:5.0];

      [(TPButton *)self setClipsToBounds:1];
      v7 = [(TPButton *)self layer];
      v8 = v7;
      double v9 = 5.0;
    }
    else
    {
      [(_UIBackdropView *)backdropView setClipsToBounds:0];
      uint64_t v10 = [(_UIBackdropView *)self->_backdropView layer];
      [v10 setCornerRadius:0.0];

      [(TPButton *)self setClipsToBounds:0];
      v7 = [(TPButton *)self layer];
      v8 = v7;
      double v9 = 0.0;
    }
    [v7 setCornerRadius:v9];

    self->_roundsCorners = a3;
  }
}

- (void)setUsesOverlayBlendingForContents:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesOverlayBlendingForContents != a3)
  {
    v5 = [(TPButton *)self imageView];
    uint64_t v6 = v5;
    if (v3)
    {
      [v5 setAlpha:0.400000006];

      v7 = [(TPButton *)self imageView];
      v8 = [v7 layer];
      uint64_t v9 = *MEMORY[0x1E4F3A2E0];
      uint64_t v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
      [v8 setCompositingFilter:v10];

      v11 = [(TPButton *)self titleLabel];
      objc_super v12 = v11;
      double v13 = 0.400000006;
    }
    else
    {
      [v5 setAlpha:1.0];

      id v14 = [(TPButton *)self imageView];
      v15 = [v14 layer];
      uint64_t v9 = *MEMORY[0x1E4F3A2B8];
      v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2B8]];
      [v15 setCompositingFilter:v16];

      v11 = [(TPButton *)self titleLabel];
      objc_super v12 = v11;
      double v13 = 1.0;
    }
    [v11 setAlpha:v13];

    v17 = [(TPButton *)self titleLabel];
    v18 = [v17 layer];
    objc_super v19 = [MEMORY[0x1E4F39BC0] filterWithType:v9];
    [v18 setCompositingFilter:v19];
  }
  self->_usesOverlayBlendingForContents = v3;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TPButton;
  [(TPButton *)&v5 setImage:a3 forState:a4];
  if (self->_backdropView) {
    -[TPButton sendSubviewToBack:](self, "sendSubviewToBack:");
  }
}

- (void)_animationWillBegin
{
  [(_UIBackdropView *)self->_backdropView setComputesColorSettings:0];
  backdropView = self->_backdropView;
  [(_UIBackdropView *)backdropView _setBlursBackground:0];
}

- (void)_animationDidEnd
{
  [(_UIBackdropView *)self->_backdropView setComputesColorSettings:1];
  BOOL v3 = [(TPButton *)self blursBackground];
  backdropView = self->_backdropView;
  [(_UIBackdropView *)backdropView _setBlursBackground:v3];
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (BOOL)roundsCorners
{
  return self->_roundsCorners;
}

- (BOOL)usesOverlayBlendingForContents
{
  return self->_usesOverlayBlendingForContents;
}

- (void).cxx_destruct
{
}

@end