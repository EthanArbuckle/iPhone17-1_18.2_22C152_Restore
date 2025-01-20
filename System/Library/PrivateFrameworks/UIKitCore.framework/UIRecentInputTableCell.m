@interface UIRecentInputTableCell
+ (id)backgroundColorForBlurEffectStyle:(int64_t)a3;
+ (id)focusedTextColorForBlurEffectStyle:(int64_t)a3;
+ (id)unfocusedTextColorForBlurEffectStyle:(int64_t)a3;
- (BOOL)_tvIsDarkMode;
- (UILabel)floatingLabel;
- (UITextInputTraits)textInputTraits;
- (int64_t)blurEffectStyle;
- (void)_updateAppearance;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setFloatingLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setInputText:(id)a3 withBlurStyle:(int64_t)a4;
- (void)setTextInputTraits:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIRecentInputTableCell

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIRecentInputTableCell;
  [(UITableViewCell *)&v5 layoutSubviews];
  v3 = [(UIRecentInputTableCell *)self floatingLabel];
  v4 = [(UIRecentInputTableCell *)self floatingContentView];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)setInputText:(id)a3 withBlurStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(UIRecentInputTableCell *)self floatingLabel];

  if (!v7)
  {
    v8 = [_UIFloatingContentView alloc];
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v13 = -[_UIFloatingContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v13, "setContentMotionRotation:translation:", 0.0, 0.0698131701, 0.0, 4.0);
    [(UITableViewCell *)self setBackgroundView:v13];
    [(UIRecentInputTableCell *)self setBlurEffectStyle:a4];
    v14 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v9, v10, v11, v12);
    [(UIRecentInputTableCell *)self setFloatingLabel:v14];

    v15 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    v16 = [(UIRecentInputTableCell *)self floatingLabel];
    [v16 setFont:v15];

    v17 = [(UIRecentInputTableCell *)self floatingLabel];
    [v17 setTextAlignment:1];

    v18 = [(_UIFloatingContentView *)v13 contentView];
    v19 = [(UIRecentInputTableCell *)self floatingLabel];
    [v18 addSubview:v19];
  }
  v20 = [(UIRecentInputTableCell *)self floatingLabel];
  [v20 setText:v6];

  [(UIRecentInputTableCell *)self _updateAppearance];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)UIRecentInputTableCell;
  id v6 = a4;
  id v7 = a3;
  [(UITableViewCell *)&v18 didUpdateFocusInContext:v7 withAnimationCoordinator:v6];
  BOOL v8 = [(UIRecentInputTableCell *)self _tvIsDarkMode];
  double v9 = [v7 nextFocusedView];

  LODWORD(v7) = [v9 isDescendantOfView:self];
  double v10 = [(UIRecentInputTableCell *)self floatingContentView];
  double v11 = v10;
  if (v7)
  {
    [v10 setControlState:8 animated:1];

    double v12 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v13 = __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  }
  else
  {
    [v10 setControlState:0 animated:1];

    double v12 = &v15;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v13 = __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2;
  }
  v12[2] = (uint64_t)v13;
  v12[3] = (uint64_t)&unk_1E52D9CD0;
  if (v8) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  v12[4] = (uint64_t)self;
  v12[5] = v14;
  [v6 addCoordinatedAnimations:v15 completion:v16];
}

void __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() focusedTextColorForBlurEffectStyle:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) floatingLabel];
  [v2 setTextColor:v3];
}

void __75__UIRecentInputTableCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() unfocusedTextColorForBlurEffectStyle:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) floatingLabel];
  [v2 setTextColor:v3];
}

- (void)_updateAppearance
{
  int64_t v3 = [(UIRecentInputTableCell *)self blurEffectStyle];
  v4 = [(UITableViewCell *)self backgroundView];

  if (v4)
  {
    objc_super v5 = [(id)objc_opt_class() backgroundColorForBlurEffectStyle:v3];
    id v6 = [(UITableViewCell *)self backgroundView];
    [v6 setBackgroundColor:v5 forState:0];
  }
  id v7 = [(UIRecentInputTableCell *)self floatingLabel];

  if (v7)
  {
    BOOL v8 = [(UIView *)self isFocused];
    double v9 = objc_opt_class();
    if (v8) {
      [v9 focusedTextColorForBlurEffectStyle:v3];
    }
    else {
    id v11 = [v9 unfocusedTextColorForBlurEffectStyle:v3];
    }
    double v10 = [(UIRecentInputTableCell *)self floatingLabel];
    [v10 setTextColor:v11];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIRecentInputTableCell;
  [(UITableViewCell *)&v8 setHighlighted:a3 animated:a4];
  if (v4) {
    uint64_t v6 = 9;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(UIRecentInputTableCell *)self floatingContentView];
  [v7 setControlState:v6 animated:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIRecentInputTableCell;
  id v4 = a3;
  [(UITableViewCell *)&v6 traitCollectionDidChange:v4];
  objc_super v5 = [(UIView *)self traitCollection];
}

+ (id)unfocusedTextColorForBlurEffectStyle:(int64_t)a3
{
  if ((unint64_t)a3 < 2 || a3 == 4002)
  {
    int64_t v3 = +[UIColor colorWithWhite:0.0 alpha:0.6];
  }
  else
  {
    int64_t v3 = +[UIColor whiteColor];
  }
  return v3;
}

+ (id)focusedTextColorForBlurEffectStyle:(int64_t)a3
{
  if ((unint64_t)a3 < 2 || a3 == 4002)
  {
    int64_t v3 = +[UIColor colorWithWhite:0.0 alpha:0.6];
  }
  else
  {
    int64_t v3 = +[UIColor blackColor];
  }
  return v3;
}

+ (id)backgroundColorForBlurEffectStyle:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 1.0;
  if (a3 == 4002) {
    double v4 = 0.0;
  }
  if ((unint64_t)a3 >= 2) {
    double v3 = v4;
  }
  objc_super v5 = +[UIColor colorWithWhite:v3 alpha:0.1];
  return v5;
}

- (BOOL)_tvIsDarkMode
{
  double v3 = [(UIRecentInputTableCell *)self textInputTraits];
  uint64_t v4 = [v3 keyboardAppearance];

  objc_super v5 = [(UIView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  return v4 == 1 || v6 == 2 || v6 == 1000;
}

- (UILabel)floatingLabel
{
  return self->_floatingLabel;
}

- (void)setFloatingLabel:(id)a3
{
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (UITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_floatingLabel, 0);
}

@end