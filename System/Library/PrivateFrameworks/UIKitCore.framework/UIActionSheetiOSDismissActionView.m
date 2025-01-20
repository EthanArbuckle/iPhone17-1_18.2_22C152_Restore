@interface UIActionSheetiOSDismissActionView
- (BOOL)usesShortCompactVerticalLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (UIActionSheetiOSDismissActionView)initWithContinuousCornerRadius:(double)a3;
- (UIButton)dismissButton;
- (double)_heightForTraitCollection:(id)a3;
- (void)_setupDismissButton;
- (void)setDismissButton:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsesShortCompactVerticalLayout:(BOOL)a3;
@end

@implementation UIActionSheetiOSDismissActionView

- (UIActionSheetiOSDismissActionView)initWithContinuousCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIActionSheetiOSDismissActionView;
  v4 = [(UIView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(UIActionSheetiOSDismissActionView *)v4 _setupDismissButton];
    [(_UIAlertControlleriOSActionSheetCancelBackgroundView *)v5 _setContinuousCornerRadius:a3];
  }
  return v5;
}

- (void)_setupDismissButton
{
  v3 = +[UIButton buttonWithType:1];
  [(UIActionSheetiOSDismissActionView *)self setDismissButton:v3];

  v4 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  [(UIView *)self addSubview:v4];

  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  id v14 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  [v14 setAutoresizingMask:18];
}

- (NSString)title
{
  v2 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  v3 = [v2 attributedTitleForState:0];

  v4 = [v3 string];

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v10 = (id)[[v4 alloc] initWithString:v5];
  uint64_t v6 = *(void *)off_1E52D2040;
  double v7 = [off_1E52D39B8 boldSystemFontOfSize:20.0];
  uint64_t v8 = [v5 length];

  objc_msgSend(v10, "addAttribute:value:range:", v6, v7, 0, v8);
  double v9 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  [v9 setAttributedTitle:v10 forState:0];
}

- (void)setUsesShortCompactVerticalLayout:(BOOL)a3
{
  if (self->_usesShortCompactVerticalLayout != a3)
  {
    self->_usesShortCompactVerticalLayout = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (double)_heightForTraitCollection:(id)a3
{
  if (!self->_usesShortCompactVerticalLayout) {
    return 57.0;
  }
  uint64_t v3 = [a3 verticalSizeClass];
  double result = 57.0;
  if (v3 == 1) {
    return 44.0;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(UIActionSheetiOSDismissActionView *)self dismissButton];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;

  double v9 = [(UIView *)self traitCollection];
  [(UIActionSheetiOSDismissActionView *)self _heightForTraitCollection:v9];
  double v11 = v10;

  double v12 = v8;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (BOOL)usesShortCompactVerticalLayout
{
  return self->_usesShortCompactVerticalLayout;
}

- (void).cxx_destruct
{
}

@end